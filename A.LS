     1                                  
     2                                  ; F.COM CComp V0.6, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
     3                                  org  256 ; NASM ON
     4 00000000 E99E2F                  jmp main
     5                                  
     6                                  ;-1 //  @@ret redefined 2011.04.25
     7                                  
     8                                  
     9                                  ;-2 char Version1[]="F.COM CComp V0.6";
    10                                  
    11 00000003 462E434F4D2043436F-     Version1 db "F.COM CComp V0.6",0
    12 0000000C 6D702056302E3600   
    13                                  
    14                                  ;-3 #define BSS
    15                                  
    16                                  
    17                                  ;-4 #define ARCHIVE "AR.C"
    18                                  
    19                                  ;Use archive file: AR.C
    20                                  
    21                                  ;-5 char BSS=1;  char NASM=1;  char LIST=1;
    22                                  
    23 00000014 01                      BSS db 1
    24 00000015 01                      NASM db 1
    25 00000016 01                      LIST db 1
    26                                  
    27                                  ;-6 #define LSTART        200
    28                                  
    29                                  
    30                                  ;-7 #define VARMAX        300
    31                                  
    32                                  
    33                                  ;-8 #define GNAMEMAX     4800 // 16*VARMAX
    34                                  
    35                                  
    36                                  ;-9 #define FUNCMAX       300
    37                                  
    38                                  
    39                                  ;-10 #define FNAMEMAX     4800 // 16*FUNCMAX
    40                                  
    41                                  
    42                                  ;-11 #define CALLMAX      2000
    43                                  
    44                                  
    45                                  ;-12 #define IDLENMAX       15
    46                                  
    47                                  
    48                                  ;-13 #define _                 // Konstantvergleich
    49                                  
    50                                  
    51                                  ;-14 #define T_NAME        256
    52                                  
    53                                  
    54                                  ;-15 #define T_CONST       257 
    55                                  
    56                                  
    57                                  ;-16 #define T_STRING      258     
    58                                  
    59                                  
    60                                  ;-17 #define T_INCLUDE     510     
    61                                  
    62                                  
    63                                  ;-18 #define T_DEFINE      511  
    64                                  
    65                                  
    66                                  ;-19 #define T_RETURN      512
    67                                  
    68                                  
    69                                  ;-20 #define T_IF          513      
    70                                  
    71                                  
    72                                  ;-21 #define T_ELSE        514  
    73                                  
    74                                  
    75                                  ;-22 #define T_WHILE       515      
    76                                  
    77                                  
    78                                  ;-23 #define T_DO          516
    79                                  
    80                                  
    81                                  ;-24 #define T_INT         517     
    82                                  
    83                                  
    84                                  ;-25 #define T_ASM         518   
    85                                  
    86                                  
    87                                  ;-26 #define T_ASMBLOCK    519   
    88                                  
    89                                  
    90                                  ;-27 #define T_EMIT        520
    91                                  
    92                                  
    93                                  ;-28 #define T_GOTO        521    
    94                                  
    95                                  
    96                                  ;-29 #define T_VOID        529  
    97                                  
    98                                  
    99                                  ;-30 #define T_CHAR        530       
   100                                  
   101                                  
   102                                  ;-31 #define T_SIGNED      531
   103                                  
   104                                  
   105                                  ;-32 #define T_UNSIGNED    532
   106                                  
   107                                  
   108                                  ;-33 #define T_LONG        533
   109                                  
   110                                  
   111                                  ;-34 #define T_SHORT       534
   112                                  
   113                                  
   114                                  ;-35 //T_INT8 540   T_UINT8 541   T_INT16 542   T_UINT16 543   T_INT32 544
   115                                  
   116                                  
   117                                  ;-36 #define T_UINT32      545
   118                                  
   119                                  
   120                                  ;-37 //T_INT64 546   T_UINT64 547
   121                                  
   122                                  
   123                                  ;-38 #define T_INTH        600
   124                                  
   125                                  
   126                                  ;-39 #define T_IFCARRY     601
   127                                  
   128                                  
   129                                  ;-40 #define T_IFZERO      602
   130                                  
   131                                  
   132                                  ;-41 #define T_EQ          806
   133                                  
   134                                  
   135                                  ;-42 #define T_NE          807
   136                                  
   137                                  
   138                                  ;-43 #define T_GE          811
   139                                  
   140                                  
   141                                  ;-44 #define T_LE          824
   142                                  
   143                                  
   144                                  ;-45 #define T_PLUSPLUS   1219
   145                                  
   146                                  
   147                                  ;-46 #define T_MINUSMINUS 1225
   148                                  
   149                                  
   150                                  ;-47 #define T_PLUSASS    1230
   151                                  
   152                                  
   153                                  ;-48 #define T_MINUSASS   1231
   154                                  
   155                                  
   156                                  ;-49 #define T_MULASS     1232
   157                                  
   158                                  
   159                                  ;-50 #define T_DIVASS     1233
   160                                  
   161                                  
   162                                  ;-51 #define T_ANDASS     1234
   163                                  
   164                                  
   165                                  ;-52 #define T_ORASS      1235
   166                                  
   167                                  
   168                                  ;-53 #define T_LESSLESS   1240
   169                                  
   170                                  
   171                                  ;-54 #define T_GREATGREAT 1241
   172                                  
   173                                  
   174                                  ;-55 #define COMAX        3000
   175                                  
   176                                  
   177                                  ;-56 #define CMDLENMAX      67
   178                                  
   179                                  
   180                                  ;-57 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;
   181                                  
   182 00000017 3075                    ORGDATAORIG dw 30000
   183 00000019 3075                    orgData dw 30000
   184                                  
   185                                  ;-58 char co[COMAX];    int maxco=0;      int maxco1=0;
   186                                  
   187                                  section .bss
   188                                  absolute 30000
   189 00007530 <res 00000BB8>          co resb 3000
   190                                  section .text
   191 0000001B 0000                    maxco dw 0
   192 0000001D 0000                    maxco1 dw 0
   193                                  
   194                                  ;-59 char coname[CMDLENMAX];              char *cloc=0;
   195                                  
   196                                  section .bss
   197                                  absolute 33000
   198 000080E8 <res 00000043>          coname resb 67
   199                                  section .text
   200 0000001F 0000                    cloc dw 0
   201                                  
   202                                  ;-60 int fdin=0;        int fdout=0;      char symbol[128];
   203                                  
   204 00000021 0000                    fdin dw 0
   205 00000023 0000                    fdout dw 0
   206                                  section .bss
   207                                  absolute 33067
   208 0000812B <res 00000080>          symbol resb 128
   209                                  section .text
   210                                  
   211                                  ;-61 char fname[CMDLENMAX];               char namein[CMDLENMAX];
   212                                  
   213                                  section .bss
   214                                  absolute 33195
   215 000081AB <res 00000043>          fname resb 67
   216                                  section .text
   217                                  section .bss
   218                                  absolute 33262
   219 000081EE <res 00000043>          namein resb 67
   220                                  section .text
   221                                  
   222                                  ;-62 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];
   223                                  
   224                                  section .bss
   225                                  absolute 33329
   226 00008231 <res 00000043>          namelst resb 67
   227                                  section .text
   228                                  section .bss
   229                                  absolute 33396
   230 00008274 <res 00000043>          archivename resb 67
   231                                  section .text
   232                                  
   233                                  ;-63 int token=0;       char globC=0;     int spalte=0;
   234                                  
   235 00000025 0000                    token dw 0
   236 00000027 00                      globC db 0
   237 00000028 0000                    spalte dw 0
   238                                  
   239                                  ;-64 char thechar=0;    int iscmp=0;      int nconst=0;
   240                                  
   241 0000002A 00                      thechar db 0
   242 0000002B 0000                    iscmp dw 0
   243 0000002D 0000                    nconst dw 0
   244                                  
   245                                  ;-65 int nreturn=0;     int nlabel=0;     int callrecursive=0;
   246                                  
   247 0000002F 0000                    nreturn dw 0
   248 00000031 0000                    nlabel dw 0
   249 00000033 0000                    callrecursive dw 0
   250                                  
   251                                  ;-66 int GTop=1;        int LTop=150;
   252                                  
   253 00000035 0100                    GTop dw 1
   254 00000037 9600                    LTop dw 150
   255                                  
   256                                  ;-67 unsigned int lexval=0;
   257                                  
   258 00000039 0000                    lexval dw 0
   259                                  
   260                                  ;-68 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   261                                  
   262 0000003B 0000                    typei dw 0
   263 0000003D 00                      istype db 0
   264                                  section .bss
   265                                  absolute 33463
   266 000082B7 <res 0000012C>          GType resb 300
   267                                  section .text
   268                                  
   269                                  ;-69 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
   270                                  
   271 0000003E 0000                    signi dw 0
   272 00000040 00                      issign db 0
   273                                  section .bss
   274                                  absolute 33763
   275 000083E3 <res 0000012C>          GSign resb 300
   276                                  section .text
   277                                  
   278                                  ;-70 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
   279                                  
   280 00000041 0000                    widthi dw 0
   281 00000043 00                      iswidth db 0
   282                                  section .bss
   283                                  absolute 34063
   284 0000850F <res 0000012C>          GWidth resb 300
   285                                  section .text
   286                                  
   287                                  ;-71              int GAdr[VARMAX]; int  GUsed [VARMAX];
   288                                  
   289                                  section .bss
   290                                  absolute 34363
   291 0000863B <res 00000258>          GAdr resw 300
   292                                  section .text
   293                                  section .bss
   294                                  absolute 34963
   295 00008893 <res 00000258>          GUsed resw 300
   296                                  section .text
   297                                  
   298                                  ;-72 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
   299                                  
   300 00000044 0000                    wi dw 0
   301                                  section .bss
   302                                  absolute 35563
   303 00008AEB <res 00000258>          GData resw 300
   304                                  section .text
   305                                  section .bss
   306                                  absolute 36163
   307 00008D43 <res 000012C0>          GNameField resb 4800
   308                                  section .text
   309                                  
   310                                  ;-73 int  FTop=0;                 int  CTop=0;
   311                                  
   312 00000046 0000                    FTop dw 0
   313 00000048 0000                    CTop dw 0
   314                                  
   315                                  ;-74 char FType [FUNCMAX];        char CType[CALLMAX];
   316                                  
   317                                  section .bss
   318                                  absolute 40963
   319 0000A003 <res 0000012C>          FType resb 300
   320                                  section .text
   321                                  section .bss
   322                                  absolute 41263
   323 0000A12F <res 000007D0>          CType resb 2000
   324                                  section .text
   325                                  
   326                                  ;-75 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
   327                                  
   328                                  section .bss
   329                                  absolute 43263
   330 0000A8FF <res 00000258>          FAdr resw 300
   331                                  section .text
   332                                  section .bss
   333                                  absolute 43863
   334 0000AB57 <res 00000FA0>          CAdr resw 2000
   335                                  section .text
   336                                  
   337                                  ;-76 int  FCalls[FUNCMAX];
   338                                  
   339                                  section .bss
   340                                  absolute 47863
   341 0000BAF7 <res 00000258>          FCalls resw 300
   342                                  section .text
   343                                  
   344                                  ;-77 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   345                                  
   346                                  section .bss
   347                                  absolute 48463
   348 0000BD4F <res 000012C0>          FNameField resb 4800
   349                                  section .text
   350                                  
   351                                  ;-78 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   352                                  
   353 0000004A 313233343536373839-     NameA db "12345678901234567890123456789012",0
   354 00000053 303132333435363738-
   355 0000005C 393031323334353637-
   356 00000065 383930313200       
   357                                  
   358                                  ;-79 char fgetsdest[128];         unsigned char *CNameTop=0;
   359                                  
   360                                  section .bss
   361                                  absolute 53263
   362 0000D00F <res 00000080>          fgetsdest resb 128
   363                                  section .text
   364 0000006B 0000                    CNameTop dw 0
   365                                  
   366                                  ;-80 unsigned char *fgetsp=0;     unsigned int segE;
   367                                  
   368 0000006D 0000                    fgetsp dw 0
   369 0000006F 0000                    segE dw 0
   370                                  
   371                                  ;-81 unsigned int lineno=1;       unsigned int linenoinclude=1;
   372                                  
   373 00000071 0100                    lineno dw 1
   374 00000073 0100                    linenoinclude dw 1
   375                                  
   376                                  ;-82 unsigned char *pt=0;         unsigned char *p1=0;
   377                                  
   378 00000075 0000                    pt dw 0
   379 00000077 0000                    p1 dw 0
   380                                  
   381                                  ;-83 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;
   382                                  
   383 00000079 0000                    DOS_ERR dw 0
   384 0000007B 0000                    DOS_NoBytes dw 0
   385 0000007D 00                      DOS_ByteRead db 0
   386                                  
   387                                  ;-84 
   388                                  
   389                                  
   390                                  ;-85 int tt1=7; int tt2; long ex;
   391                                  
   392 0000007E 0700                    tt1 dw 7
   393 00000080 0000                    tt2 dw 0
   394 00000082 00000000                ex dd 0
   395                                  
   396                                  ;-86 void ttt(long par1) {
   397                                  
   398                                  
   399                                  ttt:  ; *** PROC ***
   400                                  
   401                                  ;-87   int i1; long in; int i9;
   402                                  
   403                                  
   404                                  ;-88   ttt(in, ex );
   405                                  
   406                                  ;Function : ttt, Number of local variables: 4
   407                                  ;   # type sign width addr used name   list of local variables
   408                                  ;  200 var sign dwrd    86 NULL par1 = bp+4
   409                                  ;  201 var sign word    87 NULL i1 = bp-2
   410                                  ;  202 var sign dwrd    87 NULL in = bp-6
   411                                  ;  203 var sign word    87 NULL i9 = bp-8;
   412 00000086 C8080000                 ENTER  8,0
   413 0000008A A0[8200]                 mov al, byte [ex]
   414 0000008D B400                     mov ah, 0
   415 0000008F 50                       push ax
   416 00000090 8A46FA                   mov al, byte [bp-6]
   417 00000093 B400                     mov ah, 0
   418 00000095 50                       push ax
   419 00000096 E8EDFF                   call ttt
   420 00000099 83C404                   add  sp, 4
   421                                  
   422                                  ;-89  si = &FTop;  si=FTop;
   423                                  
   424 0000009C BE[4600]                 mov  si, FTop
   425 0000009F 8B36[4600]               mov  si, [FTop]
   426                                  
   427                                  ;-90  si= &FAdr;     si=FAdr;
   428                                  
   429 000000A3 BEFFA8                   mov  si, FAdr
   430 000000A6 8B36FFA8                 mov  si, [FAdr]
   431                                  
   432                                  ;-91  &FTop;         FTop;
   433                                  
   434 000000AA B8[4600]                 mov ax, FTop
   435 000000AD A1[4600]                 mov ax, [FTop]
   436                                  
   437                                  ;-92   }
   438                                  
   439                                  
   440                                  ;-93 int a(unsigned int i) { if(NASM == 0) prs("offset "); printName(i);}//address
   441 000000B0 C9                       LEAVE
   442 000000B1 C3                       ret
   443                                  ; ENDP
   444                                  
   445                                  a:  ; *** PROC ***
   446                                  ;Function : a, Number of local variables: 1
   447                                  ;   # type sign width addr used name   list of local variables
   448                                  ;  200 var unsg word    93 NULL i = bp+4;
   449 000000B2 C8000000                 ENTER  0,0
   450 000000B6 A0[1500]                 mov al, [NASM]
   451 000000B9 3C00                     cmp al, 0
   452 000000BB 0F850900                 jne @@a1
   453 000000BF 68[D300]                 push a_0
   454 000000C2 E8AC49                   call prs
   455 000000C5 83C402                   add  sp, 2
   456                                  @@a1:
   457 000000C8 FF7604                   push word [bp+4]
   458 000000CB E87106                   call printName
   459 000000CE 83C402                   add  sp, 2
   460                                  
   461                                  ;-94 int v(unsigned int i) { if(NASM) { if (i < LSTART) prc('['); }
   462 000000D1 C9                       LEAVE
   463 000000D2 C3                       ret
   464                                  ; ENDP
   465 000000D3 6F66667365742000        a_0 db "offset ",0
   466                                  
   467                                  v:  ; *** PROC ***
   468                                  ;Function : v, Number of local variables: 1
   469                                  ;   # type sign width addr used name   list of local variables
   470                                  ;  200 var unsg word    94 NULL i = bp+4;
   471 000000DB C8000000                 ENTER  0,0
   472 000000DF A0[1500]                 mov al, [NASM]
   473 000000E2 08C0                     or  al, al
   474 000000E4 0F841200                 je @@v2
   475 000000E8 8B4604                   mov ax, [bp+4]
   476 000000EB 3DC800                   cmp ax, 200
   477 000000EE 0F8D0800                 jge @@v3
   478 000000F2 6A5B                     push 91
   479 000000F4 E80A49                   call prc
   480 000000F7 83C402                   add  sp, 2
   481                                  @@v3:
   482                                  
   483                                  ;-95   printName(i); if(NASM) { if (i < LSTART) prc(']'); }   }//value
   484                                  
   485                                  @@v2:
   486 000000FA FF7604                   push word [bp+4]
   487 000000FD E83F06                   call printName
   488 00000100 83C402                   add  sp, 2
   489 00000103 A0[1500]                 mov al, [NASM]
   490 00000106 08C0                     or  al, al
   491 00000108 0F841200                 je @@v4
   492 0000010C 8B4604                   mov ax, [bp+4]
   493 0000010F 3DC800                   cmp ax, 200
   494 00000112 0F8D0800                 jge @@v5
   495 00000116 6A5D                     push 93
   496 00000118 E8E648                   call prc
   497 0000011B 83C402                   add  sp, 2
   498                                  @@v5:
   499                                  @@v4:
   500                                  
   501                                  ;-96 int checknamelen() { int i;    i=strlen(symbol);
   502 0000011E C9                       LEAVE
   503 0000011F C3                       ret
   504                                  ; ENDP
   505                                  
   506                                  checknamelen:  ; *** PROC ***
   507                                  ;Function : checknamelen, Number of local variables: 1
   508                                  ;   # type sign width addr used name   list of local variables
   509                                  ;  200 var sign word    96 NULL i = bp-2;
   510 00000120 C8020000                 ENTER  2,0
   511 00000124 8D062B81                 lea  ax, [symbol]
   512 00000128 50                       push ax
   513 00000129 E8E758                   call strlen
   514 0000012C 83C402                   add  sp, 2
   515 0000012F 8946FE                   mov [bp-2], ax
   516                                  
   517                                  ;-97   if (i > IDLENMAX) error1("Item name is too long in characters)");
   518                                  
   519 00000132 8B46FE                   mov ax, [bp-2]
   520 00000135 83F80F                   cmp ax, 15
   521 00000138 0F8E0900                 jle @@checknamelen6
   522 0000013C 68[4701]                 push checknamelen_0
   523 0000013F E8184C                   call error1
   524 00000142 83C402                   add  sp, 2
   525                                  
   526                                  ;-98 }
   527                                  
   528                                  @@checknamelen6:
   529                                  
   530                                  ;-99 char doglobName[IDLENMAX];
   531 00000145 C9                       LEAVE
   532 00000146 C3                       ret
   533                                  ; ENDP
   534 00000147 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
   535 00000150 20697320746F6F206C-
   536 00000159 6F6E6720696E206368-
   537 00000162 617261637465727329-
   538 0000016B 00                 
   539                                  section .bss
   540                                  absolute 53391
   541 0000D08F <res 0000000F>          doglobName resb 15
   542                                  section .text
   543                                  
   544                                  ;-100 int doglob() { int i; int j; int isstrarr; isstrarr=0;
   545                                  
   546                                  
   547                                  doglob:  ; *** PROC ***
   548                                  ;Function : doglob, Number of local variables: 3
   549                                  ;   # type sign width addr used name   list of local variables
   550                                  ;  200 var sign word   100 NULL i = bp-2
   551                                  ;  201 var sign word   100 NULL j = bp-4
   552                                  ;  202 var sign word   100 NULL isstrarr = bp-6;
   553 0000016C C8060000                 ENTER  6,0
   554 00000170 B80000                   mov ax, 0
   555 00000173 8946FA                   mov [bp-6], ax
   556                                  
   557                                  ;-101   if (GTop >= LSTART) error1("Global table full");
   558                                  
   559 00000176 A1[3500]                 mov ax, [GTop]
   560 00000179 3DC800                   cmp ax, 200 ;unsigned : 1
   561 0000017C 0F8C0900                 jl  @@doglob7
   562 00000180 68[5505]                 push doglob_0
   563 00000183 E8D44B                   call error1
   564 00000186 83C402                   add  sp, 2
   565                                  
   566                                  ;-102   if (iswidth == 0) error1("no VOID as var type");
   567                                  
   568                                  @@doglob7:
   569 00000189 A0[4300]                 mov al, [iswidth]
   570 0000018C 3C00                     cmp al, 0
   571 0000018E 0F850900                 jne @@doglob8
   572 00000192 68[6705]                 push doglob_1
   573 00000195 E8C24B                   call error1
   574 00000198 83C402                   add  sp, 2
   575                                  
   576                                  ;-103   checknamelen();
   577                                  
   578                                  @@doglob8:
   579 0000019B E882FF                   call checknamelen
   580                                  
   581                                  ;-104   if (checkName() != 0) error1("Variable already defined");
   582                                  
   583 0000019E E84D06                   call checkName
   584 000001A1 3C00                     cmp al, 0
   585 000001A3 0F840900                 je  @@doglob9
   586 000001A7 68[7B05]                 push doglob_2
   587 000001AA E8AD4B                   call error1
   588 000001AD 83C402                   add  sp, 2
   589                                  
   590                                  ;-105   if (istoken('[')) { istype='&';
   591                                  
   592                                  @@doglob9:
   593 000001B0 6A5B                     push 91
   594 000001B2 E87E47                   call istoken
   595 000001B5 83C402                   add  sp, 2
   596 000001B8 08C0                     or  al, al
   597 000001BA 0F847602                 je @@doglob10
   598 000001BE B82600                   mov ax, 38
   599 000001C1 A2[3D00]                 mov byte [istype], al
   600                                  
   601                                  ;-106     if (istoken(T_CONST)) {
   602                                  
   603 000001C4 680101                   push 257
   604 000001C7 E86947                   call istoken
   605 000001CA 83C402                   add  sp, 2
   606 000001CD 08C0                     or  al, al
   607 000001CF 0F845601                 je @@doglob11
   608                                  
   609                                  ;-107       if (BSS) { if (NASM) {prs("\nsection .bss\nabsolute ");
   610                                  
   611 000001D3 A0[1400]                 mov al, [BSS]
   612 000001D6 08C0                     or  al, al
   613 000001D8 0F843200                 je @@doglob12
   614 000001DC A0[1500]                 mov al, [NASM]
   615 000001DF 08C0                     or  al, al
   616 000001E1 0F841600                 je @@doglob13
   617 000001E5 68[9405]                 push doglob_3
   618 000001E8 E88648                   call prs
   619 000001EB 83C402                   add  sp, 2
   620                                  
   621                                  ;-108         prunsign1(orgData); }
   622                                  
   623 000001EE FF36[1900]               push word [orgData]
   624 000001F2 E8D649                   call prunsign1
   625 000001F5 83C402                   add  sp, 2
   626                                  
   627                                  ;-109         else {prs("\nAData = $\norg "); prunsign1(orgData);} }
   628                                  
   629 000001F8 E91300                   jmp @@doglob14
   630                                  @@doglob13:
   631 000001FB 68[AE05]                 push doglob_4
   632 000001FE E87048                   call prs
   633 00000201 83C402                   add  sp, 2
   634 00000204 FF36[1900]               push word [orgData]
   635 00000208 E8C049                   call prunsign1
   636 0000020B 83C402                   add  sp, 2
   637                                  @@doglob14:
   638                                  
   639                                  ;-110       prs("\n"); prs(symbol); 
   640                                  
   641                                  @@doglob12:
   642 0000020E 68[C005]                 push doglob_5
   643 00000211 E85D48                   call prs
   644 00000214 83C402                   add  sp, 2
   645 00000217 8D062B81                 lea  ax, [symbol]
   646 0000021B 50                       push ax
   647 0000021C E85248                   call prs
   648 0000021F 83C402                   add  sp, 2
   649                                  
   650                                  ;-111       if      (iswidth==1) {if (NASM) prs(" resb "); else prs(" db ");}
   651                                  
   652 00000222 A0[4300]                 mov al, [iswidth]
   653 00000225 3C01                     cmp al, 1
   654 00000227 0F852100                 jne @@doglob15
   655 0000022B A0[1500]                 mov al, [NASM]
   656 0000022E 08C0                     or  al, al
   657 00000230 0F840C00                 je @@doglob16
   658 00000234 68[C305]                 push doglob_6
   659 00000237 E83748                   call prs
   660 0000023A 83C402                   add  sp, 2
   661 0000023D E90900                   jmp @@doglob17
   662                                  @@doglob16:
   663 00000240 68[CA05]                 push doglob_7
   664 00000243 E82B48                   call prs
   665 00000246 83C402                   add  sp, 2
   666                                  @@doglob17:
   667                                  
   668                                  ;-112       else if (iswidth==2) {if (NASM) prs(" resw "); else prs(" dw ");}
   669                                  
   670 00000249 E94800                   jmp @@doglob18
   671                                  @@doglob15:
   672 0000024C A0[4300]                 mov al, [iswidth]
   673 0000024F 3C02                     cmp al, 2
   674 00000251 0F852100                 jne @@doglob19
   675 00000255 A0[1500]                 mov al, [NASM]
   676 00000258 08C0                     or  al, al
   677 0000025A 0F840C00                 je @@doglob20
   678 0000025E 68[CF05]                 push doglob_8
   679 00000261 E80D48                   call prs
   680 00000264 83C402                   add  sp, 2
   681 00000267 E90900                   jmp @@doglob21
   682                                  @@doglob20:
   683 0000026A 68[D605]                 push doglob_9
   684 0000026D E80148                   call prs
   685 00000270 83C402                   add  sp, 2
   686                                  @@doglob21:
   687                                  
   688                                  ;-113       else                 {if (NASM) prs(" resd "); else prs(" dd ");}
   689                                  
   690 00000273 E91E00                   jmp @@doglob22
   691                                  @@doglob19:
   692 00000276 A0[1500]                 mov al, [NASM]
   693 00000279 08C0                     or  al, al
   694 0000027B 0F840C00                 je @@doglob23
   695 0000027F 68[DB05]                 push doglob_10
   696 00000282 E8EC47                   call prs
   697 00000285 83C402                   add  sp, 2
   698 00000288 E90900                   jmp @@doglob24
   699                                  @@doglob23:
   700 0000028B 68[E205]                 push doglob_11
   701 0000028E E8E047                   call prs
   702 00000291 83C402                   add  sp, 2
   703                                  @@doglob24:
   704                                  
   705                                  ;-114       prunsign1(lexval); if (NASM==0)prs(" dup (?)");
   706                                  
   707                                  @@doglob22:
   708                                  @@doglob18:
   709 00000294 FF36[3900]               push word [lexval]
   710 00000298 E83049                   call prunsign1
   711 0000029B 83C402                   add  sp, 2
   712 0000029E A0[1500]                 mov al, [NASM]
   713 000002A1 3C00                     cmp al, 0
   714 000002A3 0F850900                 jne @@doglob25
   715 000002A7 68[E705]                 push doglob_12
   716 000002AA E8C447                   call prs
   717 000002AD 83C402                   add  sp, 2
   718                                  
   719                                  ;-115       if (BSS) {if(NASM) prs("\nsection .text");
   720                                  
   721                                  @@doglob25:
   722 000002B0 A0[1400]                 mov al, [BSS]
   723 000002B3 08C0                     or  al, al
   724 000002B5 0F841E00                 je @@doglob26
   725 000002B9 A0[1500]                 mov al, [NASM]
   726 000002BC 08C0                     or  al, al
   727 000002BE 0F840C00                 je @@doglob27
   728 000002C2 68[F005]                 push doglob_13
   729 000002C5 E8A947                   call prs
   730 000002C8 83C402                   add  sp, 2
   731                                  
   732                                  ;-116         else prs("\norg AData"); }
   733                                  
   734 000002CB E90900                   jmp @@doglob28
   735                                  @@doglob27:
   736 000002CE 68[0006]                 push doglob_14
   737 000002D1 E89D47                   call prs
   738 000002D4 83C402                   add  sp, 2
   739                                  @@doglob28:
   740                                  
   741                                  ;-117       orgData=orgData+lexval;
   742                                  
   743                                  @@doglob26:
   744 000002D7 A1[1900]                 mov ax, [orgData]
   745 000002DA 0306[3900]               add ax, [lexval]
   746 000002DE A3[1900]                 mov word [orgData], ax
   747                                  
   748                                  ;-118       if (iswidth==2) orgData=orgData+lexval;
   749                                  
   750 000002E1 A0[4300]                 mov al, [iswidth]
   751 000002E4 3C02                     cmp al, 2
   752 000002E6 0F850A00                 jne @@doglob29
   753 000002EA A1[1900]                 mov ax, [orgData]
   754 000002ED 0306[3900]               add ax, [lexval]
   755 000002F1 A3[1900]                 mov word [orgData], ax
   756                                  
   757                                  ;-119       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
   758                                  
   759                                  @@doglob29:
   760 000002F4 A0[4300]                 mov al, [iswidth]
   761 000002F7 3C04                     cmp al, 4
   762 000002F9 0F851400                 jne @@doglob30
   763 000002FD A1[3900]                 mov ax, [lexval]
   764 00000300 BB0300                   mov bx, 3
   765 00000303 F7E3                     mul bx
   766 00000305 8946FE                   mov [bp-2], ax
   767 00000308 A1[1900]                 mov ax, [orgData]
   768 0000030B 0346FE                   add ax, [bp-2]
   769 0000030E A3[1900]                 mov word [orgData], ax
   770                                  
   771                                  ;-120       GData[GTop]=lexval; expect(']');
   772                                  
   773                                  @@doglob30:
   774 00000311 A1[3900]                 mov ax, [lexval]
   775 00000314 8B1E[3500]               mov bx, [GTop]
   776 00000318 D1E3                     shl bx, 1
   777 0000031A 8987EB8A                 mov [GData+bx], ax
   778 0000031E 6A5D                     push 93
   779 00000320 E83246                   call expect
   780 00000323 83C402                   add  sp, 2
   781                                  
   782                                  ;-121     }else { expect(']');
   783                                  
   784 00000326 E90801                   jmp @@doglob31
   785                                  @@doglob11:
   786 00000329 6A5D                     push 93
   787 0000032B E82746                   call expect
   788 0000032E 83C402                   add  sp, 2
   789                                  
   790                                  ;-122       if (iswidth != 1) error1("Only ByteArray allowed");
   791                                  
   792 00000331 A0[4300]                 mov al, [iswidth]
   793 00000334 3C01                     cmp al, 1
   794 00000336 0F840900                 je  @@doglob32
   795 0000033A 68[0C06]                 push doglob_15
   796 0000033D E81A4A                   call error1
   797 00000340 83C402                   add  sp, 2
   798                                  
   799                                  ;-123       prs("\n"); prs(symbol); prs(" db "); 
   800                                  
   801                                  @@doglob32:
   802 00000343 68[2306]                 push doglob_16
   803 00000346 E82847                   call prs
   804 00000349 83C402                   add  sp, 2
   805 0000034C 8D062B81                 lea  ax, [symbol]
   806 00000350 50                       push ax
   807 00000351 E81D47                   call prs
   808 00000354 83C402                   add  sp, 2
   809 00000357 68[2606]                 push doglob_17
   810 0000035A E81447                   call prs
   811 0000035D 83C402                   add  sp, 2
   812                                  
   813                                  ;-124       isstrarr=1; strcpy(doglobName, symbol);
   814                                  
   815 00000360 B80100                   mov ax, 1
   816 00000363 8946FA                   mov [bp-6], ax
   817 00000366 8D062B81                 lea  ax, [symbol]
   818 0000036A 50                       push ax
   819 0000036B 8D068FD0                 lea  ax, [doglobName]
   820 0000036F 50                       push ax
   821 00000370 E8C856                   call strcpy
   822 00000373 83C404                   add  sp, 4
   823                                  
   824                                  ;-125       expect('='); 
   825                                  
   826 00000376 6A3D                     push 61
   827 00000378 E8DA45                   call expect
   828 0000037B 83C402                   add  sp, 2
   829                                  
   830                                  ;-126       if (istoken(T_STRING)) { 
   831                                  
   832 0000037E 680201                   push 258
   833 00000381 E8AF45                   call istoken
   834 00000384 83C402                   add  sp, 2
   835 00000387 08C0                     or  al, al
   836 00000389 0F844200                 je @@doglob33
   837                                  
   838                                  ;-127         prc(34); prscomment(symbol); prc(34); prs(",0"); 
   839                                  
   840 0000038D 6A22                     push 34
   841 0000038F E86F46                   call prc
   842 00000392 83C402                   add  sp, 2
   843 00000395 8D062B81                 lea  ax, [symbol]
   844 00000399 50                       push ax
   845 0000039A E89846                   call prscomment
   846 0000039D 83C402                   add  sp, 2
   847 000003A0 6A22                     push 34
   848 000003A2 E85C46                   call prc
   849 000003A5 83C402                   add  sp, 2
   850 000003A8 68[2B06]                 push doglob_18
   851 000003AB E8C346                   call prs
   852 000003AE 83C402                   add  sp, 2
   853                                  
   854                                  ;-128         i=strlen(symbol); GData[GTop]=i; }
   855                                  
   856 000003B1 8D062B81                 lea  ax, [symbol]
   857 000003B5 50                       push ax
   858 000003B6 E85A56                   call strlen
   859 000003B9 83C402                   add  sp, 2
   860 000003BC 8946FE                   mov [bp-2], ax
   861 000003BF 8B46FE                   mov ax, [bp-2]
   862 000003C2 8B1E[3500]               mov bx, [GTop]
   863 000003C6 D1E3                     shl bx, 1
   864 000003C8 8987EB8A                 mov [GData+bx], ax
   865                                  
   866                                  ;-129       else if (istoken('{' )) { i=0;
   867                                  
   868 000003CC E96200                   jmp @@doglob34
   869                                  @@doglob33:
   870 000003CF 6A7B                     push 123
   871 000003D1 E85F45                   call istoken
   872 000003D4 83C402                   add  sp, 2
   873 000003D7 08C0                     or  al, al
   874 000003D9 0F844B00                 je @@doglob35
   875 000003DD B80000                   mov ax, 0
   876 000003E0 8946FE                   mov [bp-2], ax
   877                                  
   878                                  ;-130         do { if(i) prc(','); 
   879                                  
   880                                  @@doglob36:
   881 000003E3 8B46FE                   mov ax, [bp-2]
   882 000003E6 08C0                     or  al, al
   883 000003E8 0F840800                 je @@doglob37
   884 000003EC 6A2C                     push 44
   885 000003EE E81046                   call prc
   886 000003F1 83C402                   add  sp, 2
   887                                  
   888                                  ;-131           expect(T_CONST); prunsign1(lexval); i=1; }
   889                                  
   890                                  @@doglob37:
   891 000003F4 680101                   push 257
   892 000003F7 E85B45                   call expect
   893 000003FA 83C402                   add  sp, 2
   894 000003FD FF36[3900]               push word [lexval]
   895 00000401 E8C747                   call prunsign1
   896 00000404 83C402                   add  sp, 2
   897 00000407 B80100                   mov ax, 1
   898 0000040A 8946FE                   mov [bp-2], ax
   899                                  
   900                                  ;-132         while (istoken(',')); expect('}'); }  
   901                                  
   902 0000040D 6A2C                     push 44
   903 0000040F E82145                   call istoken
   904 00000412 83C402                   add  sp, 2
   905 00000415 08C0                     or  al, al
   906 00000417 0F840200                 je @@doglob38
   907 0000041B EBC6                     jmp @@doglob36
   908                                  @@doglob38:
   909 0000041D 6A7D                     push 125
   910 0000041F E83345                   call expect
   911 00000422 83C402                   add  sp, 2
   912                                  
   913                                  ;-133       else error1("String or number array expected");
   914                                  
   915 00000425 E90900                   jmp @@doglob39
   916                                  @@doglob35:
   917 00000428 68[2E06]                 push doglob_19
   918 0000042B E82C49                   call error1
   919 0000042E 83C402                   add  sp, 2
   920                                  
   921                                  ;-134       }; 
   922                                  
   923                                  @@doglob39:
   924                                  @@doglob34:
   925                                  @@doglob31:
   926                                  
   927                                  ;-135   }else { //expect('=');
   928                                  
   929 00000431 E99E00                   jmp @@doglob40
   930                                  @@doglob10:
   931                                  
   932                                  ;-136     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
   933                                  
   934 00000434 68[4E06]                 push doglob_20
   935 00000437 E83746                   call prs
   936 0000043A 83C402                   add  sp, 2
   937 0000043D 8D062B81                 lea  ax, [symbol]
   938 00000441 50                       push ax
   939 00000442 E82C46                   call prs
   940 00000445 83C402                   add  sp, 2
   941 00000448 A0[3D00]                 mov al, [istype]
   942 0000044B 3C2A                     cmp al, 42
   943 0000044D 0F850C00                 jne @@doglob41
   944 00000451 68[5106]                 push doglob_21
   945 00000454 E81A46                   call prs
   946 00000457 83C402                   add  sp, 2
   947                                  
   948                                  ;-137     else {
   949                                  
   950 0000045A E93300                   jmp @@doglob42
   951                                  @@doglob41:
   952                                  
   953                                  ;-138       if      (iswidth==1) prs(" db ");
   954                                  
   955 0000045D A0[4300]                 mov al, [iswidth]
   956 00000460 3C01                     cmp al, 1
   957 00000462 0F850C00                 jne @@doglob43
   958 00000466 68[5606]                 push doglob_22
   959 00000469 E80546                   call prs
   960 0000046C 83C402                   add  sp, 2
   961                                  
   962                                  ;-139       else if (iswidth==2) prs(" dw ");
   963                                  
   964 0000046F E91E00                   jmp @@doglob44
   965                                  @@doglob43:
   966 00000472 A0[4300]                 mov al, [iswidth]
   967 00000475 3C02                     cmp al, 2
   968 00000477 0F850C00                 jne @@doglob45
   969 0000047B 68[5B06]                 push doglob_23
   970 0000047E E8F045                   call prs
   971 00000481 83C402                   add  sp, 2
   972                                  
   973                                  ;-140       else                 prs(" dd ");
   974                                  
   975 00000484 E90900                   jmp @@doglob46
   976                                  @@doglob45:
   977 00000487 68[6006]                 push doglob_24
   978 0000048A E8E445                   call prs
   979 0000048D 83C402                   add  sp, 2
   980                                  
   981                                  ;-141     }
   982                                  
   983                                  @@doglob46:
   984                                  @@doglob44:
   985                                  
   986                                  ;-142     if(istoken('-')) prc('-');
   987                                  
   988                                  @@doglob42:
   989 00000490 6A2D                     push 45
   990 00000492 E89E44                   call istoken
   991 00000495 83C402                   add  sp, 2
   992 00000498 08C0                     or  al, al
   993 0000049A 0F840800                 je @@doglob47
   994 0000049E 6A2D                     push 45
   995 000004A0 E85E45                   call prc
   996 000004A3 83C402                   add  sp, 2
   997                                  
   998                                  ;-143     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
   999                                  
  1000                                  @@doglob47:
  1001 000004A6 6A3D                     push 61
  1002 000004A8 E88844                   call istoken
  1003 000004AB 83C402                   add  sp, 2
  1004 000004AE 08C0                     or  al, al
  1005 000004B0 0F841600                 je @@doglob48
  1006 000004B4 680101                   push 257
  1007 000004B7 E89B44                   call expect
  1008 000004BA 83C402                   add  sp, 2
  1009 000004BD FF36[3900]               push word [lexval]
  1010 000004C1 E80747                   call prunsign1
  1011 000004C4 83C402                   add  sp, 2
  1012                                  
  1013                                  ;-144     else prunsign1(0); }
  1014                                  
  1015 000004C7 E90800                   jmp @@doglob49
  1016                                  @@doglob48:
  1017 000004CA 6A00                     push 0
  1018 000004CC E8FC46                   call prunsign1
  1019 000004CF 83C402                   add  sp, 2
  1020                                  @@doglob49:
  1021                                  
  1022                                  ;-145   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1023                                  
  1024                                  @@doglob40:
  1025 000004D2 A0[4000]                 mov al, [issign]
  1026 000004D5 8B1E[3500]               mov bx, [GTop]
  1027 000004D9 8887E383                 mov [GSign+bx], al
  1028 000004DD A0[4300]                 mov al, [iswidth]
  1029 000004E0 8B1E[3500]               mov bx, [GTop]
  1030 000004E4 88870F85                 mov [GWidth+bx], al
  1031 000004E8 A0[3D00]                 mov al, [istype]
  1032 000004EB 8B1E[3500]               mov bx, [GTop]
  1033 000004EF 8887B782                 mov [GType+bx], al
  1034                                  
  1035                                  ;-146   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1036                                  
  1037 000004F3 A1[7100]                 mov ax, [lineno]
  1038 000004F6 83E801                   sub ax, 1
  1039 000004F9 8B1E[3500]               mov bx, [GTop]
  1040 000004FD D1E3                     shl bx, 1
  1041 000004FF 89873B86                 mov [GAdr+bx], ax
  1042 00000503 B80000                   mov ax, 0
  1043 00000506 8B1E[3500]               mov bx, [GTop]
  1044 0000050A D1E3                     shl bx, 1
  1045 0000050C 89879388                 mov [GUsed+bx], ax
  1046                                  
  1047                                  ;-147   pt=adrofname(GTop);
  1048                                  
  1049 00000510 FF36[3500]               push word [GTop]
  1050 00000514 E80502                   call adrofname
  1051 00000517 83C402                   add  sp, 2
  1052 0000051A A3[7500]                 mov word [pt], ax
  1053                                  
  1054                                  ;-148   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1055                                  
  1056 0000051D 8B46FA                   mov ax, [bp-6]
  1057 00000520 08C0                     or  al, al
  1058 00000522 0F841200                 je @@doglob50
  1059 00000526 8D068FD0                 lea  ax, [doglobName]
  1060 0000052A 50                       push ax
  1061 0000052B FF36[7500]               push word [pt]
  1062 0000052F E80955                   call strcpy
  1063 00000532 83C404                   add  sp, 4
  1064 00000535 E90F00                   jmp @@doglob51
  1065                                  @@doglob50:
  1066 00000538 8D062B81                 lea  ax, [symbol]
  1067 0000053C 50                       push ax
  1068 0000053D FF36[7500]               push word [pt]
  1069 00000541 E8F754                   call strcpy
  1070 00000544 83C404                   add  sp, 4
  1071                                  
  1072                                  ;-149   GTop++; expect(';'); }
  1073                                  
  1074                                  @@doglob51:
  1075 00000547 FF06[3500]               inc  word[GTop]
  1076 0000054B 6A3B                     push 59
  1077 0000054D E80544                   call expect
  1078 00000550 83C402                   add  sp, 2
  1079                                  
  1080                                  ;-150 
  1081                                  
  1082                                  
  1083                                  ;-151 int gettypes(int i) {int j; char c;
  1084 00000553 C9                       LEAVE
  1085 00000554 C3                       ret
  1086                                  ; ENDP
  1087 00000555 476C6F62616C207461-     doglob_0 db "Global table full",0
  1088 0000055E 626C652066756C6C00 
  1089 00000567 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1090 00000570 732076617220747970-
  1091 00000579 6500               
  1092 0000057B 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1093 00000584 616C72656164792064-
  1094 0000058D 6566696E656400     
  1095 00000594 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1096 0000059D 202E6273735C6E6162-
  1097 000005A6 736F6C7574652000   
  1098 000005AE 5C6E4144617461203D-     doglob_4 db "\nAData = $\norg ",0
  1099 000005B7 20245C6E6F72672000 
  1100 000005C0 5C6E00                  doglob_5 db "\n",0
  1101 000005C3 20726573622000          doglob_6 db " resb ",0
  1102 000005CA 2064622000              doglob_7 db " db ",0
  1103 000005CF 20726573772000          doglob_8 db " resw ",0
  1104 000005D6 2064772000              doglob_9 db " dw ",0
  1105 000005DB 20726573642000          doglob_10 db " resd ",0
  1106 000005E2 2064642000              doglob_11 db " dd ",0
  1107 000005E7 2064757020283F2900      doglob_12 db " dup (?)",0
  1108 000005F0 5C6E73656374696F6E-     doglob_13 db "\nsection .text",0
  1109 000005F9 202E7465787400     
  1110 00000600 5C6E6F726720414461-     doglob_14 db "\norg AData",0
  1111 00000609 746100             
  1112 0000060C 4F6E6C792042797465-     doglob_15 db "Only ByteArray allowed",0
  1113 00000615 417272617920616C6C-
  1114 0000061E 6F77656400         
  1115 00000623 5C6E00                  doglob_16 db "\n",0
  1116 00000626 2064622000              doglob_17 db " db ",0
  1117 0000062B 2C3000                  doglob_18 db ",0",0
  1118 0000062E 537472696E67206F72-     doglob_19 db "String or number array expected",0
  1119 00000637 206E756D6265722061-
  1120 00000640 727261792065787065-
  1121 00000649 6374656400         
  1122 0000064E 5C6E00                  doglob_20 db "\n",0
  1123 00000651 2064772000              doglob_21 db " dw ",0
  1124 00000656 2064622000              doglob_22 db " db ",0
  1125 0000065B 2064772000              doglob_23 db " dw ",0
  1126 00000660 2064642000              doglob_24 db " dd ",0
  1127                                  
  1128                                  gettypes:  ; *** PROC ***
  1129                                  
  1130                                  ;-152   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1131                                  
  1132                                  ;Function : gettypes, Number of local variables: 3
  1133                                  ;   # type sign width addr used name   list of local variables
  1134                                  ;  200 var sign word   151 NULL i = bp+4
  1135                                  ;  201 var sign word   151 NULL j = bp-2
  1136                                  ;  202 var sign byte   151 NULL c = bp-4;
  1137 00000665 C8040000                 ENTER  4,0
  1138 00000669 8B5E04                   mov bx, [bp+4]
  1139 0000066C 8A87E383                 mov al, [GSign + bx]
  1140 00000670 8846FC                   mov [bp-4], al
  1141 00000673 8A46FC                   mov al, [bp-4]
  1142 00000676 3C53                     cmp al, 83
  1143 00000678 0F850900                 jne @@gettypes52
  1144 0000067C B80100                   mov ax, 1
  1145 0000067F A3[3E00]                 mov word [signi], ax
  1146 00000682 E90600                   jmp @@gettypes53
  1147                                  @@gettypes52:
  1148 00000685 B80000                   mov ax, 0
  1149 00000688 A3[3E00]                 mov word [signi], ax
  1150                                  
  1151                                  ;-153   c=GWidth[i]; widthi=0;wi=0;
  1152                                  
  1153                                  @@gettypes53:
  1154 0000068B 8B5E04                   mov bx, [bp+4]
  1155 0000068E 8A870F85                 mov al, [GWidth + bx]
  1156 00000692 8846FC                   mov [bp-4], al
  1157 00000695 B80000                   mov ax, 0
  1158 00000698 A3[4100]                 mov word [widthi], ax
  1159 0000069B B80000                   mov ax, 0
  1160 0000069E A3[4400]                 mov word [wi], ax
  1161                                  
  1162                                  ;-154   if (c==1) {widthi=1;wi=1;}
  1163                                  
  1164 000006A1 8A46FC                   mov al, [bp-4]
  1165 000006A4 3C01                     cmp al, 1
  1166 000006A6 0F850C00                 jne @@gettypes54
  1167 000006AA B80100                   mov ax, 1
  1168 000006AD A3[4100]                 mov word [widthi], ax
  1169 000006B0 B80100                   mov ax, 1
  1170 000006B3 A3[4400]                 mov word [wi], ax
  1171                                  
  1172                                  ;-155   if (c==2) {widthi=2;wi=2;}
  1173                                  
  1174                                  @@gettypes54:
  1175 000006B6 8A46FC                   mov al, [bp-4]
  1176 000006B9 3C02                     cmp al, 2
  1177 000006BB 0F850C00                 jne @@gettypes55
  1178 000006BF B80200                   mov ax, 2
  1179 000006C2 A3[4100]                 mov word [widthi], ax
  1180 000006C5 B80200                   mov ax, 2
  1181 000006C8 A3[4400]                 mov word [wi], ax
  1182                                  
  1183                                  ;-156   if (c==4) {widthi=4;wi=4;}
  1184                                  
  1185                                  @@gettypes55:
  1186 000006CB 8A46FC                   mov al, [bp-4]
  1187 000006CE 3C04                     cmp al, 4
  1188 000006D0 0F850C00                 jne @@gettypes56
  1189 000006D4 B80400                   mov ax, 4
  1190 000006D7 A3[4100]                 mov word [widthi], ax
  1191 000006DA B80400                   mov ax, 4
  1192 000006DD A3[4400]                 mov word [wi], ax
  1193                                  
  1194                                  ;-157   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1195                                  
  1196                                  @@gettypes56:
  1197 000006E0 8B5E04                   mov bx, [bp+4]
  1198 000006E3 8A87B782                 mov al, [GType + bx]
  1199 000006E7 8846FC                   mov [bp-4], al
  1200 000006EA B80000                   mov ax, 0
  1201 000006ED A3[3B00]                 mov word [typei], ax
  1202 000006F0 8A46FC                   mov al, [bp-4]
  1203 000006F3 3C2A                     cmp al, 42
  1204 000006F5 0F850C00                 jne @@gettypes57
  1205 000006F9 B80100                   mov ax, 1
  1206 000006FC A3[3B00]                 mov word [typei], ax
  1207 000006FF B80200                   mov ax, 2
  1208 00000702 A3[4400]                 mov word [wi], ax
  1209                                  
  1210                                  ;-158   if (c=='&')  typei=2;  
  1211                                  
  1212                                  @@gettypes57:
  1213 00000705 8A46FC                   mov al, [bp-4]
  1214 00000708 3C26                     cmp al, 38
  1215 0000070A 0F850600                 jne @@gettypes58
  1216 0000070E B80200                   mov ax, 2
  1217 00000711 A3[3B00]                 mov word [typei], ax
  1218                                  
  1219                                  ;-159   return i; }  
  1220                                  
  1221                                  @@gettypes58:
  1222 00000714 8B4604                   mov ax, [bp+4]
  1223 00000717 E90000                   jmp @@retn
  1224                                  
  1225                                  ;-160 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1226                                  
  1227 0000071A C9                      @@retn: LEAVE
  1228 0000071B C3                       ret
  1229                                  ; ENDP
  1230                                  
  1231                                  adrofname:  ; *** PROC ***
  1232                                  ;Function : adrofname, Number of local variables: 1
  1233                                  ;   # type sign width addr used name   list of local variables
  1234                                  ;  200 var unsg word   160 NULL i = bp+4;
  1235 0000071C C8000000                 ENTER  0,0
  1236 00000720 FF7604                   push word [bp+4]
  1237 00000723 8D06438D                 lea  ax, [GNameField]
  1238 00000727 50                       push ax
  1239 00000728 E80500                   call adrF
  1240 0000072B 83C404                   add  sp, 4
  1241                                  
  1242                                  ;-161 int adrF(char *s, unsigned int i) { i << 4;
  1243 0000072E C9                       LEAVE
  1244 0000072F C3                       ret
  1245                                  ; ENDP
  1246                                  
  1247                                  adrF:  ; *** PROC ***
  1248                                  ;Function : adrF, Number of local variables: 2
  1249                                  ;   # type sign width addr used name   list of local variables
  1250                                  ;  200 ptr sign byte   161 NULL s = bp+4
  1251                                  ;  201 var unsg word   161 NULL i = bp+6;
  1252 00000730 C8000000                 ENTER  0,0
  1253 00000734 8B4606                   mov ax, [bp+6]
  1254 00000737 C1E004                   shl ax, 4
  1255                                  
  1256                                  ;-162   __asm{ add ax, [bp+4]  ; offset s } }
  1257                                  
  1258 0000073A 034604                   add ax, [bp+4]  ; offset s 
  1259                                  
  1260                                  ;-163 int printName(unsigned int i) {int j;
  1261 0000073D C9                       LEAVE
  1262 0000073E C3                       ret
  1263                                  ; ENDP
  1264                                  
  1265                                  printName:  ; *** PROC ***
  1266                                  
  1267                                  ;-164   if (i < LSTART) { i=adrofname(i); prs(i); }
  1268                                  
  1269                                  ;Function : printName, Number of local variables: 2
  1270                                  ;   # type sign width addr used name   list of local variables
  1271                                  ;  200 var unsg word   163 NULL i = bp+4
  1272                                  ;  201 var sign word   163 NULL j = bp-2;
  1273 0000073F C8020000                 ENTER  2,0
  1274 00000743 8B4604                   mov ax, [bp+4]
  1275 00000746 3DC800                   cmp ax, 200
  1276 00000749 0F8D1800                 jge @@printName59
  1277 0000074D FF7604                   push word [bp+4]
  1278 00000750 E8C9FF                   call adrofname
  1279 00000753 83C402                   add  sp, 2
  1280 00000756 894604                   mov [bp+4], ax
  1281 00000759 FF7604                   push word [bp+4]
  1282 0000075C E81243                   call prs
  1283 0000075F 83C402                   add  sp, 2
  1284                                  
  1285                                  ;-165   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1286                                  
  1287 00000762 E93800                   jmp @@printName60
  1288                                  @@printName59:
  1289 00000765 68[9F07]                 push printName_0
  1290 00000768 E80643                   call prs
  1291 0000076B 83C402                   add  sp, 2
  1292 0000076E 8B5E04                   mov bx, [bp+4]
  1293 00000771 D1E3                     shl bx, 1
  1294 00000773 8B87EB8A                 mov ax, [GData + bx]
  1295 00000777 8946FE                   mov [bp-2], ax
  1296 0000077A 8B46FE                   mov ax, [bp-2]
  1297 0000077D 83F800                   cmp ax, 0
  1298 00000780 0F8E0800                 jle @@printName61
  1299 00000784 6A2B                     push 43
  1300 00000786 E87842                   call prc
  1301 00000789 83C402                   add  sp, 2
  1302                                  @@printName61:
  1303 0000078C FF76FE                   push word [bp-2]
  1304 0000078F E8D643                   call pint1
  1305 00000792 83C402                   add  sp, 2
  1306 00000795 6A5D                     push 93
  1307 00000797 E86742                   call prc
  1308 0000079A 83C402                   add  sp, 2
  1309                                  
  1310                                  ;-166 }
  1311                                  
  1312                                  @@printName60:
  1313                                  
  1314                                  ;-167 int searchname() { unsigned int i;
  1315 0000079D C9                       LEAVE
  1316 0000079E C3                       ret
  1317                                  ; ENDP
  1318 0000079F 5B627000                printName_0 db "[bp",0
  1319                                  
  1320                                  searchname:  ; *** PROC ***
  1321                                  
  1322                                  ;-168   i=checkName(); if (i == 0) error1("Variable unknown");
  1323                                  
  1324                                  ;Function : searchname, Number of local variables: 1
  1325                                  ;   # type sign width addr used name   list of local variables
  1326                                  ;  200 var unsg word   167 NULL i = bp-2;
  1327 000007A3 C8020000                 ENTER  2,0
  1328 000007A7 E84400                   call checkName
  1329 000007AA 8946FE                   mov [bp-2], ax
  1330 000007AD 8B46FE                   mov ax, [bp-2]
  1331 000007B0 83F800                   cmp ax, 0
  1332 000007B3 0F850900                 jne @@searchname62
  1333 000007B7 68[DD07]                 push searchname_0
  1334 000007BA E89D45                   call error1
  1335 000007BD 83C402                   add  sp, 2
  1336                                  
  1337                                  ;-169   GUsed[i]=GUsed[i] + 1; return i;
  1338                                  
  1339                                  @@searchname62:
  1340 000007C0 8B5EFE                   mov bx, [bp-2]
  1341 000007C3 D1E3                     shl bx, 1
  1342 000007C5 8B879388                 mov ax, [GUsed + bx]
  1343 000007C9 83C001                   add ax, 1
  1344 000007CC 8B5EFE                   mov bx, [bp-2]
  1345 000007CF D1E3                     shl bx, 1
  1346 000007D1 89879388                 mov [GUsed+bx], ax
  1347 000007D5 8B46FE                   mov ax, [bp-2]
  1348 000007D8 E90000                   jmp @@retn
  1349                                  
  1350                                  ;-170 }
  1351                                  
  1352                                  
  1353                                  ;-171 int checkName() { unsigned int i; unsigned int j;
  1354                                  
  1355 000007DB C9                      @@retn: LEAVE
  1356 000007DC C3                       ret
  1357                                  ; ENDP
  1358 000007DD 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1359 000007E6 756E6B6E6F776E00   
  1360                                  
  1361                                  checkName:  ; *** PROC ***
  1362                                  
  1363                                  ;-172   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1364                                  
  1365                                  ;Function : checkName, Number of local variables: 2
  1366                                  ;   # type sign width addr used name   list of local variables
  1367                                  ;  200 var unsg word   171 NULL i = bp-2
  1368                                  ;  201 var unsg word   171 NULL j = bp-4;
  1369 000007EE C8040000                 ENTER  4,0
  1370 000007F2 B8C800                   mov ax, 200
  1371 000007F5 8946FE                   mov [bp-2], ax
  1372                                  @@checkName63:
  1373 000007F8 8B46FE                   mov ax, [bp-2]
  1374 000007FB 3B06[3700]               cmp ax, [LTop]
  1375 000007FF 0F8D2B00                 jge @@checkName64
  1376 00000803 FF76FE                   push word [bp-2]
  1377 00000806 E813FF                   call adrofname
  1378 00000809 83C402                   add  sp, 2
  1379 0000080C 8946FC                   mov [bp-4], ax
  1380 0000080F FF76FC                   push word [bp-4]
  1381 00000812 8D062B81                 lea  ax, [symbol]
  1382 00000816 50                       push ax
  1383 00000817 E84853                   call eqstr
  1384 0000081A 83C404                   add  sp, 4
  1385 0000081D 08C0                     or  al, al
  1386 0000081F 0F840600                 je @@checkName65
  1387 00000823 8B46FE                   mov ax, [bp-2]
  1388 00000826 E94700                   jmp @@retn
  1389                                  @@checkName65:
  1390 00000829 FF46FE                   inc  word[bp-2]
  1391                                  
  1392                                  ;-173   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1393                                  
  1394 0000082C EBCA                     jmp @@checkName63
  1395                                  @@checkName64:
  1396 0000082E B80100                   mov ax, 1
  1397 00000831 8946FE                   mov [bp-2], ax
  1398                                  @@checkName66:
  1399 00000834 8B46FE                   mov ax, [bp-2]
  1400 00000837 3B06[3500]               cmp ax, [GTop]
  1401 0000083B 0F8D2B00                 jge @@checkName67
  1402 0000083F FF76FE                   push word [bp-2]
  1403 00000842 E8D7FE                   call adrofname
  1404 00000845 83C402                   add  sp, 2
  1405 00000848 8946FC                   mov [bp-4], ax
  1406 0000084B FF76FC                   push word [bp-4]
  1407 0000084E 8D062B81                 lea  ax, [symbol]
  1408 00000852 50                       push ax
  1409 00000853 E80C53                   call eqstr
  1410 00000856 83C404                   add  sp, 4
  1411 00000859 08C0                     or  al, al
  1412 0000085B 0F840600                 je @@checkName68
  1413 0000085F 8B46FE                   mov ax, [bp-2]
  1414 00000862 E90B00                   jmp @@retn
  1415                                  @@checkName68:
  1416 00000865 FF46FE                   inc  word[bp-2]
  1417                                  
  1418                                  ;-174   return 0;
  1419                                  
  1420 00000868 EBCA                     jmp @@checkName66
  1421                                  @@checkName67:
  1422 0000086A B80000                   mov ax, 0
  1423 0000086D E90000                   jmp @@retn
  1424                                  
  1425                                  ;-175 }    
  1426                                  
  1427                                  
  1428                                  ;-176 int typeName() { int m; //0=V,1=*,2=&
  1429                                  
  1430 00000870 C9                      @@retn: LEAVE
  1431 00000871 C3                       ret
  1432                                  ; ENDP
  1433                                  
  1434                                  typeName:  ; *** PROC ***
  1435                                  
  1436                                  ;-177   issign='S';
  1437                                  
  1438                                  ;Function : typeName, Number of local variables: 1
  1439                                  ;   # type sign width addr used name   list of local variables
  1440                                  ;  200 var sign word   176 NULL m = bp-2;
  1441 00000872 C8020000                 ENTER  2,0
  1442 00000876 B85300                   mov ax, 83
  1443 00000879 A2[4000]                 mov byte [issign], al
  1444                                  
  1445                                  ;-178   if(istoken(T_SIGNED))   issign='S';  if(istoken(T_UNSIGNED)) issign='U';
  1446                                  
  1447 0000087C 681302                   push 531
  1448 0000087F E8B140                   call istoken
  1449 00000882 83C402                   add  sp, 2
  1450 00000885 08C0                     or  al, al
  1451 00000887 0F840600                 je @@typeName69
  1452 0000088B B85300                   mov ax, 83
  1453 0000088E A2[4000]                 mov byte [issign], al
  1454                                  @@typeName69:
  1455 00000891 681402                   push 532
  1456 00000894 E89C40                   call istoken
  1457 00000897 83C402                   add  sp, 2
  1458 0000089A 08C0                     or  al, al
  1459 0000089C 0F840600                 je @@typeName70
  1460 000008A0 B85500                   mov ax, 85
  1461 000008A3 A2[4000]                 mov byte [issign], al
  1462                                  
  1463                                  ;-179   iswidth=2;                           if(istoken(T_VOID))     iswidth=0;
  1464                                  
  1465                                  @@typeName70:
  1466 000008A6 B80200                   mov ax, 2
  1467 000008A9 A2[4300]                 mov byte [iswidth], al
  1468 000008AC 681102                   push 529
  1469 000008AF E88140                   call istoken
  1470 000008B2 83C402                   add  sp, 2
  1471 000008B5 08C0                     or  al, al
  1472 000008B7 0F840600                 je @@typeName71
  1473 000008BB B80000                   mov ax, 0
  1474 000008BE A2[4300]                 mov byte [iswidth], al
  1475                                  
  1476                                  ;-180   if(istoken(T_CHAR))     iswidth=1;   if(istoken(T_INT))      iswidth=2;
  1477                                  
  1478                                  @@typeName71:
  1479 000008C1 681202                   push 530
  1480 000008C4 E86C40                   call istoken
  1481 000008C7 83C402                   add  sp, 2
  1482 000008CA 08C0                     or  al, al
  1483 000008CC 0F840600                 je @@typeName72
  1484 000008D0 B80100                   mov ax, 1
  1485 000008D3 A2[4300]                 mov byte [iswidth], al
  1486                                  @@typeName72:
  1487 000008D6 680502                   push 517
  1488 000008D9 E85740                   call istoken
  1489 000008DC 83C402                   add  sp, 2
  1490 000008DF 08C0                     or  al, al
  1491 000008E1 0F840600                 je @@typeName73
  1492 000008E5 B80200                   mov ax, 2
  1493 000008E8 A2[4300]                 mov byte [iswidth], al
  1494                                  
  1495                                  ;-181   if(istoken(T_SHORT))    iswidth=2;   if(istoken(T_LONG))     iswidth=4;
  1496                                  
  1497                                  @@typeName73:
  1498 000008EB 681602                   push 534
  1499 000008EE E84240                   call istoken
  1500 000008F1 83C402                   add  sp, 2
  1501 000008F4 08C0                     or  al, al
  1502 000008F6 0F840600                 je @@typeName74
  1503 000008FA B80200                   mov ax, 2
  1504 000008FD A2[4300]                 mov byte [iswidth], al
  1505                                  @@typeName74:
  1506 00000900 681502                   push 533
  1507 00000903 E82D40                   call istoken
  1508 00000906 83C402                   add  sp, 2
  1509 00000909 08C0                     or  al, al
  1510 0000090B 0F840600                 je @@typeName75
  1511 0000090F B80400                   mov ax, 4
  1512 00000912 A2[4300]                 mov byte [iswidth], al
  1513                                  
  1514                                  ;-182   if(istoken(T_UINT32)) { iswidth=4; issign='U'; }
  1515                                  
  1516                                  @@typeName75:
  1517 00000915 682102                   push 545
  1518 00000918 E81840                   call istoken
  1519 0000091B 83C402                   add  sp, 2
  1520 0000091E 08C0                     or  al, al
  1521 00000920 0F840C00                 je @@typeName76
  1522 00000924 B80400                   mov ax, 4
  1523 00000927 A2[4300]                 mov byte [iswidth], al
  1524 0000092A B85500                   mov ax, 85
  1525 0000092D A2[4000]                 mov byte [issign], al
  1526                                  
  1527                                  ;-183   istype='V'; m=0;
  1528                                  
  1529                                  @@typeName76:
  1530 00000930 B85600                   mov ax, 86
  1531 00000933 A2[3D00]                 mov byte [istype], al
  1532 00000936 B80000                   mov ax, 0
  1533 00000939 8946FE                   mov [bp-2], ax
  1534                                  
  1535                                  ;-184   if(istoken('*'))  { istype='*'; m=1; } if(istoken('&'))  {istype='&'; m=2;}
  1536                                  
  1537 0000093C 6A2A                     push 42
  1538 0000093E E8F23F                   call istoken
  1539 00000941 83C402                   add  sp, 2
  1540 00000944 08C0                     or  al, al
  1541 00000946 0F840C00                 je @@typeName77
  1542 0000094A B82A00                   mov ax, 42
  1543 0000094D A2[3D00]                 mov byte [istype], al
  1544 00000950 B80100                   mov ax, 1
  1545 00000953 8946FE                   mov [bp-2], ax
  1546                                  @@typeName77:
  1547 00000956 6A26                     push 38
  1548 00000958 E8D83F                   call istoken
  1549 0000095B 83C402                   add  sp, 2
  1550 0000095E 08C0                     or  al, al
  1551 00000960 0F840C00                 je @@typeName78
  1552 00000964 B82600                   mov ax, 38
  1553 00000967 A2[3D00]                 mov byte [istype], al
  1554 0000096A B80200                   mov ax, 2
  1555 0000096D 8946FE                   mov [bp-2], ax
  1556                                  
  1557                                  ;-185   name1(); return m; }
  1558                                  
  1559                                  @@typeName78:
  1560 00000970 E80800                   call name1
  1561 00000973 8B46FE                   mov ax, [bp-2]
  1562 00000976 E90000                   jmp @@retn
  1563                                  
  1564                                  ;-186 int name1() {if (token!=T_NAME) error1("Name expected"); token=getlex(); }
  1565                                  
  1566 00000979 C9                      @@retn: LEAVE
  1567 0000097A C3                       ret
  1568                                  ; ENDP
  1569                                  
  1570                                  name1:  ; *** PROC ***
  1571 0000097B A1[2500]                 mov ax, [token]
  1572 0000097E 3D0001                   cmp ax, 256
  1573 00000981 0F840900                 je  @@name179
  1574 00000985 68[9509]                 push name1_0
  1575 00000988 E8CF43                   call error1
  1576 0000098B 83C402                   add  sp, 2
  1577                                  @@name179:
  1578 0000098E E8DB37                   call getlex
  1579 00000991 A3[2500]                 mov word [token], ax
  1580                                  
  1581                                  ;-187 
  1582                                  
  1583                                  
  1584                                  ;-188 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  1585                                  
  1586 00000994 C3                       ret
  1587                                  ; ENDP
  1588 00000995 4E616D652065787065-     name1_0 db "Name expected",0
  1589 0000099E 6374656400         
  1590                                  
  1591                                  storecall:  ; *** PROC ***
  1592                                  ;Function : storecall, Number of local variables: 1
  1593                                  ;   # type sign width addr used name   list of local variables
  1594                                  ;  200 var sign word   188 NULL i = bp-2;
  1595 000009A3 C8020000                 ENTER  2,0
  1596 000009A7 A1[4800]                 mov ax, [CTop]
  1597 000009AA 3DD007                   cmp ax, 2000 ;unsigned : 1
  1598 000009AD 0F8C0900                 jl  @@storecall80
  1599 000009B1 68[150A]                 push storecall_0
  1600 000009B4 E8A343                   call error1
  1601 000009B7 83C402                   add  sp, 2
  1602                                  
  1603                                  ;-189   if (CNameTop >= 65468) error1("Call name table fuill");
  1604                                  
  1605                                  @@storecall80:
  1606 000009BA A1[6B00]                 mov ax, [CNameTop]
  1607 000009BD 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  1608 000009C0 0F820900                 jb  @@storecall81
  1609 000009C4 68[250A]                 push storecall_1
  1610 000009C7 E89043                   call error1
  1611 000009CA 83C402                   add  sp, 2
  1612                                  
  1613                                  ;-190     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  1614                                  
  1615                                  @@storecall81:
  1616 000009CD B80000                   mov ax, 0
  1617 000009D0 8B1E[4800]               mov bx, [CTop]
  1618 000009D4 88872FA1                 mov [CType+bx], al
  1619 000009D8 A1[6B00]                 mov ax, [CNameTop]
  1620 000009DB 8B1E[4800]               mov bx, [CTop]
  1621 000009DF D1E3                     shl bx, 1
  1622 000009E1 898757AB                 mov [CAdr+bx], ax
  1623 000009E5 8D062B81                 lea  ax, [symbol]
  1624 000009E9 50                       push ax
  1625 000009EA E82650                   call strlen
  1626 000009ED 83C402                   add  sp, 2
  1627 000009F0 8946FE                   mov [bp-2], ax
  1628                                  
  1629                                  ;-191     to_far(CNameTop, symbol);
  1630                                  
  1631 000009F3 8D062B81                 lea  ax, [symbol]
  1632 000009F7 50                       push ax
  1633 000009F8 FF36[6B00]               push word [CNameTop]
  1634 000009FC E8D84E                   call to_far
  1635 000009FF 83C404                   add  sp, 4
  1636                                  
  1637                                  ;-192     CNameTop=CNameTop+i; CNameTop++; CTop++;
  1638                                  
  1639 00000A02 A1[6B00]                 mov ax, [CNameTop]
  1640 00000A05 0346FE                   add ax, [bp-2]
  1641 00000A08 A3[6B00]                 mov word [CNameTop], ax
  1642 00000A0B FF06[6B00]               inc  word[CNameTop]
  1643 00000A0F FF06[4800]               inc  word[CTop]
  1644                                  
  1645                                  ;-193 }
  1646                                  
  1647                                  
  1648                                  ;-194 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  1649 00000A13 C9                       LEAVE
  1650 00000A14 C3                       ret
  1651                                  ; ENDP
  1652 00000A15 43616C6C207461626C-     storecall_0 db "Call table full",0
  1653 00000A1E 652066756C6C00     
  1654 00000A25 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  1655 00000A2E 207461626C65206675-
  1656 00000A37 696C6C00           
  1657                                  
  1658                                  storefunc:  ; *** PROC ***
  1659 00000A3B A1[4600]                 mov ax, [FTop]
  1660 00000A3E 3D2C01                   cmp ax, 300 ;unsigned : 1
  1661 00000A41 0F8C0900                 jl  @@storefunc82
  1662 00000A45 68[9C0A]                 push storefunc_0
  1663 00000A48 E80F43                   call error1
  1664 00000A4B 83C402                   add  sp, 2
  1665                                  
  1666                                  ;-195     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  1667                                  
  1668                                  @@storefunc82:
  1669 00000A4E A1[7100]                 mov ax, [lineno]
  1670 00000A51 83E801                   sub ax, 1
  1671 00000A54 8B1E[4600]               mov bx, [FTop]
  1672 00000A58 D1E3                     shl bx, 1
  1673 00000A5A 8987FFA8                 mov [FAdr+bx], ax
  1674 00000A5E B80000                   mov ax, 0
  1675 00000A61 8B1E[4600]               mov bx, [FTop]
  1676 00000A65 D1E3                     shl bx, 1
  1677 00000A67 8987F7BA                 mov [FCalls+bx], ax
  1678 00000A6B A0[4300]                 mov al, [iswidth]
  1679 00000A6E 8B1E[4600]               mov bx, [FTop]
  1680 00000A72 888703A0                 mov [FType+bx], al
  1681                                  
  1682                                  ;-196     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  1683                                  
  1684 00000A76 FF36[4600]               push word [FTop]
  1685 00000A7A 8D064FBD                 lea  ax, [FNameField]
  1686 00000A7E 50                       push ax
  1687 00000A7F E8AEFC                   call adrF
  1688 00000A82 83C404                   add  sp, 4
  1689 00000A85 A3[7500]                 mov word [pt], ax
  1690 00000A88 8D062B81                 lea  ax, [symbol]
  1691 00000A8C 50                       push ax
  1692 00000A8D FF36[7500]               push word [pt]
  1693 00000A91 E8A74F                   call strcpy
  1694 00000A94 83C404                   add  sp, 4
  1695 00000A97 FF06[4600]               inc  word[FTop]
  1696                                  
  1697                                  ;-197 }
  1698                                  
  1699                                  
  1700                                  ;-198 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  1701                                  
  1702 00000A9B C3                       ret
  1703                                  ; ENDP
  1704 00000A9C 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  1705 00000AA5 7461626C652066756C-
  1706 00000AAE 6C00               
  1707                                  
  1708                                  addlocal:  ; *** PROC ***
  1709 00000AB0 A1[3700]                 mov ax, [LTop]
  1710 00000AB3 3D2C01                   cmp ax, 300 ;unsigned : 1
  1711 00000AB6 0F8C0900                 jl  @@addlocal83
  1712 00000ABA 68[360B]                 push addlocal_0
  1713 00000ABD E89A42                   call error1
  1714 00000AC0 83C402                   add  sp, 2
  1715                                  
  1716                                  ;-199   if (checkName() != 0) error1("Variable already defined");
  1717                                  
  1718                                  @@addlocal83:
  1719 00000AC3 E828FD                   call checkName
  1720 00000AC6 83F800                   cmp ax, 0
  1721 00000AC9 0F840900                 je  @@addlocal84
  1722 00000ACD 68[500B]                 push addlocal_1
  1723 00000AD0 E88742                   call error1
  1724 00000AD3 83C402                   add  sp, 2
  1725                                  
  1726                                  ;-200   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  1727                                  
  1728                                  @@addlocal84:
  1729 00000AD6 A0[4000]                 mov al, [issign]
  1730 00000AD9 8B1E[3700]               mov bx, [LTop]
  1731 00000ADD 8887E383                 mov [GSign+bx], al
  1732 00000AE1 A0[4300]                 mov al, [iswidth]
  1733 00000AE4 8B1E[3700]               mov bx, [LTop]
  1734 00000AE8 88870F85                 mov [GWidth+bx], al
  1735 00000AEC A0[3D00]                 mov al, [istype]
  1736 00000AEF 8B1E[3700]               mov bx, [LTop]
  1737 00000AF3 8887B782                 mov [GType+bx], al
  1738                                  
  1739                                  ;-201   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  1740                                  
  1741 00000AF7 A1[7100]                 mov ax, [lineno]
  1742 00000AFA 83E801                   sub ax, 1
  1743 00000AFD 8B1E[3700]               mov bx, [LTop]
  1744 00000B01 D1E3                     shl bx, 1
  1745 00000B03 89873B86                 mov [GAdr+bx], ax
  1746 00000B07 B80000                   mov ax, 0
  1747 00000B0A 8B1E[3700]               mov bx, [LTop]
  1748 00000B0E D1E3                     shl bx, 1
  1749 00000B10 89879388                 mov [GUsed+bx], ax
  1750                                  
  1751                                  ;-202   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  1752                                  
  1753 00000B14 FF36[3700]               push word [LTop]
  1754 00000B18 8D06438D                 lea  ax, [GNameField]
  1755 00000B1C 50                       push ax
  1756 00000B1D E810FC                   call adrF
  1757 00000B20 83C404                   add  sp, 4
  1758 00000B23 A3[7500]                 mov word [pt], ax
  1759 00000B26 8D062B81                 lea  ax, [symbol]
  1760 00000B2A 50                       push ax
  1761 00000B2B FF36[7500]               push word [pt]
  1762 00000B2F E8094F                   call strcpy
  1763 00000B32 83C404                   add  sp, 4
  1764                                  
  1765                                  ;-203 }
  1766                                  
  1767                                  
  1768                                  ;-204 int checkFunction() { unsigned int i; unsigned int j; i=0;
  1769                                  
  1770 00000B35 C3                       ret
  1771                                  ; ENDP
  1772 00000B36 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  1773 00000B3F 6961626C6520746162-
  1774 00000B48 6C652066756C6C00   
  1775 00000B50 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  1776 00000B59 616C72656164792064-
  1777 00000B62 6566696E656400     
  1778                                  
  1779                                  checkFunction:  ; *** PROC ***
  1780                                  ;Function : checkFunction, Number of local variables: 2
  1781                                  ;   # type sign width addr used name   list of local variables
  1782                                  ;  200 var unsg word   204 NULL i = bp-2
  1783                                  ;  201 var unsg word   204 NULL j = bp-4;
  1784 00000B69 C8040000                 ENTER  4,0
  1785 00000B6D B80000                   mov ax, 0
  1786 00000B70 8946FE                   mov [bp-2], ax
  1787                                  
  1788                                  ;-205   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  1789                                  
  1790                                  @@checkFunction85:
  1791 00000B73 8B46FE                   mov ax, [bp-2]
  1792 00000B76 3B06[4600]               cmp ax, [FTop]
  1793 00000B7A 0F8D3000                 jge @@checkFunction86
  1794 00000B7E FF76FE                   push word [bp-2]
  1795 00000B81 8D064FBD                 lea  ax, [FNameField]
  1796 00000B85 50                       push ax
  1797 00000B86 E8A7FB                   call adrF
  1798 00000B89 83C404                   add  sp, 4
  1799 00000B8C 8946FC                   mov [bp-4], ax
  1800 00000B8F FF76FC                   push word [bp-4]
  1801 00000B92 8D062B81                 lea  ax, [symbol]
  1802 00000B96 50                       push ax
  1803 00000B97 E8C84F                   call eqstr
  1804 00000B9A 83C404                   add  sp, 4
  1805 00000B9D 08C0                     or  al, al
  1806 00000B9F 0F840600                 je @@checkFunction87
  1807 00000BA3 8B46FE                   mov ax, [bp-2]
  1808 00000BA6 E90B00                   jmp @@retn
  1809                                  @@checkFunction87:
  1810 00000BA9 FF46FE                   inc  word[bp-2]
  1811                                  
  1812                                  ;-206   return 0; }
  1813                                  
  1814 00000BAC EBC5                     jmp @@checkFunction85
  1815                                  @@checkFunction86:
  1816 00000BAE B80000                   mov ax, 0
  1817 00000BB1 E90000                   jmp @@retn
  1818                                  
  1819                                  ;-207 int dofunc() { int nloc; int i; int narg;  
  1820                                  
  1821 00000BB4 C9                      @@retn: LEAVE
  1822 00000BB5 C3                       ret
  1823                                  ; ENDP
  1824                                  
  1825                                  dofunc:  ; *** PROC ***
  1826                                  
  1827                                  ;-208   cloc=&co; 
  1828                                  
  1829                                  ;Function : dofunc, Number of local variables: 3
  1830                                  ;   # type sign width addr used name   list of local variables
  1831                                  ;  200 var sign word   207 NULL nloc = bp-2
  1832                                  ;  201 var sign word   207 NULL i = bp-4
  1833                                  ;  202 var sign word   207 NULL narg = bp-6;
  1834 00000BB6 C8060000                 ENTER  6,0
  1835 00000BBA B83075                   mov ax, co
  1836 00000BBD A3[1F00]                 mov word [cloc], ax
  1837                                  
  1838                                  ;-209   checknamelen();
  1839                                  
  1840 00000BC0 E85DF5                   call checknamelen
  1841                                  
  1842                                  ;-210   strcpy(fname, symbol);
  1843                                  
  1844 00000BC3 8D062B81                 lea  ax, [symbol]
  1845 00000BC7 50                       push ax
  1846 00000BC8 8D06AB81                 lea  ax, [fname]
  1847 00000BCC 50                       push ax
  1848 00000BCD E86B4E                   call strcpy
  1849 00000BD0 83C404                   add  sp, 4
  1850                                  
  1851                                  ;-211   if (checkFunction() ) error1("Function already defined");
  1852                                  
  1853 00000BD3 E893FF                   call checkFunction
  1854 00000BD6 08C0                     or  al, al
  1855 00000BD8 0F840900                 je @@dofunc88
  1856 00000BDC 68[ED0D]                 push dofunc_0
  1857 00000BDF E87841                   call error1
  1858 00000BE2 83C402                   add  sp, 2
  1859                                  
  1860                                  ;-212   storefunc();
  1861                                  
  1862                                  @@dofunc88:
  1863 00000BE5 E853FE                   call storefunc
  1864                                  
  1865                                  ;-213   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  1866                                  
  1867 00000BE8 68[060E]                 push dofunc_1
  1868 00000BEB E8833E                   call prs
  1869 00000BEE 83C402                   add  sp, 2
  1870 00000BF1 8D062B81                 lea  ax, [symbol]
  1871 00000BF5 50                       push ax
  1872 00000BF6 E8783E                   call prs
  1873 00000BF9 83C402                   add  sp, 2
  1874 00000BFC 68[0B0E]                 push dofunc_2
  1875 00000BFF E86F3E                   call prs
  1876 00000C02 83C402                   add  sp, 2
  1877                                  
  1878                                  ;-214   expect('('); LTop=LSTART;  i=0;
  1879                                  
  1880 00000C05 6A28                     push 40
  1881 00000C07 E84B3D                   call expect
  1882 00000C0A 83C402                   add  sp, 2
  1883 00000C0D B8C800                   mov ax, 200
  1884 00000C10 A3[3700]                 mov word [LTop], ax
  1885 00000C13 B80000                   mov ax, 0
  1886 00000C16 8946FC                   mov [bp-4], ax
  1887                                  
  1888                                  ;-215   if (istoken(')')==0) { narg=2; 
  1889                                  
  1890 00000C19 6A29                     push 41
  1891 00000C1B E8153D                   call istoken
  1892 00000C1E 83C402                   add  sp, 2
  1893 00000C21 83F800                   cmp ax, 0
  1894 00000C24 0F854600                 jne @@dofunc89
  1895 00000C28 B80200                   mov ax, 2
  1896 00000C2B 8946FA                   mov [bp-6], ax
  1897                                  
  1898                                  ;-216     do { typeName();  addlocal(); narg+=2;
  1899                                  
  1900                                  @@dofunc90:
  1901 00000C2E E841FC                   call typeName
  1902 00000C31 E87CFE                   call addlocal
  1903 00000C34 8346FA02                 add  word[bp-6], 2
  1904                                  
  1905                                  ;-217          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  1906                                  
  1907 00000C38 8B46FA                   mov ax, [bp-6]
  1908 00000C3B 8B1E[3700]               mov bx, [LTop]
  1909 00000C3F D1E3                     shl bx, 1
  1910 00000C41 8987EB8A                 mov [GData+bx], ax
  1911 00000C45 A0[4300]                 mov al, [iswidth]
  1912 00000C48 3C04                     cmp al, 4
  1913 00000C4A 0F850400                 jne @@dofunc91
  1914 00000C4E 8346FA02                 add  word[bp-6], 2
  1915                                  @@dofunc91:
  1916 00000C52 FF06[3700]               inc  word[LTop]
  1917                                  
  1918                                  ;-218     while (istoken(','));  expect(')'); }
  1919                                  
  1920 00000C56 6A2C                     push 44
  1921 00000C58 E8D83C                   call istoken
  1922 00000C5B 83C402                   add  sp, 2
  1923 00000C5E 08C0                     or  al, al
  1924 00000C60 0F840200                 je @@dofunc92
  1925 00000C64 EBC8                     jmp @@dofunc90
  1926                                  @@dofunc92:
  1927 00000C66 6A29                     push 41
  1928 00000C68 E8EA3C                   call expect
  1929 00000C6B 83C402                   add  sp, 2
  1930                                  
  1931                                  ;-219     
  1932                                  
  1933                                  
  1934                                  ;-220   expect('{'); /*body*/
  1935                                  
  1936                                  @@dofunc89:
  1937 00000C6E 6A7B                     push 123
  1938 00000C70 E8E23C                   call expect
  1939 00000C73 83C402                   add  sp, 2
  1940                                  
  1941                                  ;-221   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  1942                                  
  1943 00000C76 B80000                   mov ax, 0
  1944 00000C79 8946FE                   mov [bp-2], ax
  1945 00000C7C B80000                   mov ax, 0
  1946 00000C7F A3[2F00]                 mov word [nreturn], ax
  1947 00000C82 B80000                   mov ax, 0
  1948 00000C85 A3[2D00]                 mov word [nconst], ax
  1949 00000C88 B80000                   mov ax, 0
  1950 00000C8B 8946FC                   mov [bp-4], ax
  1951                                  
  1952                                  ;-222   while(isvariable()) {
  1953                                  
  1954                                  @@dofunc93:
  1955 00000C8E E8BC01                   call isvariable
  1956 00000C91 08C0                     or  al, al
  1957 00000C93 0F849200                 je @@dofunc94
  1958                                  
  1959                                  ;-223     do {typeName();
  1960                                  
  1961                                  @@dofunc95:
  1962 00000C97 E8D8FB                   call typeName
  1963                                  
  1964                                  ;-224         checknamelen();
  1965                                  
  1966 00000C9A E883F4                   call checknamelen
  1967                                  
  1968                                  ;-225         addlocal(); nloc-=2;
  1969                                  
  1970 00000C9D E810FE                   call addlocal
  1971 00000CA0 836EFE02                 sub  word[bp-2], 2
  1972                                  
  1973                                  ;-226         if (iswidth == 4) nloc-=2;
  1974                                  
  1975 00000CA4 A0[4300]                 mov al, [iswidth]
  1976 00000CA7 3C04                     cmp al, 4
  1977 00000CA9 0F850400                 jne @@dofunc96
  1978 00000CAD 836EFE02                 sub  word[bp-2], 2
  1979                                  
  1980                                  ;-227         GData[LTop]=nloc;
  1981                                  
  1982                                  @@dofunc96:
  1983 00000CB1 8B46FE                   mov ax, [bp-2]
  1984 00000CB4 8B1E[3700]               mov bx, [LTop]
  1985 00000CB8 D1E3                     shl bx, 1
  1986 00000CBA 8987EB8A                 mov [GData+bx], ax
  1987                                  
  1988                                  ;-228         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  1989                                  
  1990 00000CBE 6A5B                     push 91
  1991 00000CC0 E8703C                   call istoken
  1992 00000CC3 83C402                   add  sp, 2
  1993 00000CC6 08C0                     or  al, al
  1994 00000CC8 0F843D00                 je @@dofunc97
  1995 00000CCC B82600                   mov ax, 38
  1996 00000CCF A2[3D00]                 mov byte [istype], al
  1997 00000CD2 B82600                   mov ax, 38
  1998 00000CD5 8B1E[3700]               mov bx, [LTop]
  1999 00000CD9 8887B782                 mov [GType+bx], al
  2000 00000CDD 680101                   push 257
  2001 00000CE0 E8723C                   call expect
  2002 00000CE3 83C402                   add  sp, 2
  2003 00000CE6 6A5D                     push 93
  2004 00000CE8 E86A3C                   call expect
  2005 00000CEB 83C402                   add  sp, 2
  2006                                  
  2007                                  ;-229             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  2008                                  
  2009 00000CEE 8B46FE                   mov ax, [bp-2]
  2010 00000CF1 2B06[3900]               sub ax, [lexval]
  2011 00000CF5 8946FE                   mov [bp-2], ax
  2012 00000CF8 8346FE02                 add  word[bp-2], 2
  2013 00000CFC 8B46FE                   mov ax, [bp-2]
  2014 00000CFF 8B1E[3700]               mov bx, [LTop]
  2015 00000D03 D1E3                     shl bx, 1
  2016 00000D05 8987EB8A                 mov [GData+bx], ax
  2017                                  
  2018                                  ;-230         LTop++;
  2019                                  
  2020                                  @@dofunc97:
  2021 00000D09 FF06[3700]               inc  word[LTop]
  2022                                  
  2023                                  ;-231       } while (istoken(',')); expect(';'); }
  2024                                  
  2025 00000D0D 6A2C                     push 44
  2026 00000D0F E8213C                   call istoken
  2027 00000D12 83C402                   add  sp, 2
  2028 00000D15 08C0                     or  al, al
  2029 00000D17 0F840300                 je @@dofunc98
  2030 00000D1B E979FF                   jmp @@dofunc95
  2031                                  @@dofunc98:
  2032 00000D1E 6A3B                     push 59
  2033 00000D20 E8323C                   call expect
  2034 00000D23 83C402                   add  sp, 2
  2035                                  
  2036                                  ;-232   listproc(); 
  2037                                  
  2038 00000D26 E965FF                   jmp @@dofunc93
  2039                                  @@dofunc94:
  2040 00000D29 E83641                   call listproc
  2041                                  
  2042                                  ;-233   if (LTop>LSTART){prs(";\n ENTER  "); 
  2043                                  
  2044 00000D2C A1[3700]                 mov ax, [LTop]
  2045 00000D2F 3DC800                   cmp ax, 200
  2046 00000D32 0F8E2700                 jle @@dofunc99
  2047 00000D36 68[1D0E]                 push dofunc_3
  2048 00000D39 E8353D                   call prs
  2049 00000D3C 83C402                   add  sp, 2
  2050                                  
  2051                                  ;-234     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2052                                  
  2053 00000D3F FF76FE                   push word [bp-2]
  2054 00000D42 E81D4C                   call mkneg
  2055 00000D45 83C402                   add  sp, 2
  2056 00000D48 8946FE                   mov [bp-2], ax
  2057 00000D4B FF76FE                   push word [bp-2]
  2058 00000D4E E8173E                   call pint1
  2059 00000D51 83C402                   add  sp, 2
  2060 00000D54 68[290E]                 push dofunc_4
  2061 00000D57 E8173D                   call prs
  2062 00000D5A 83C402                   add  sp, 2
  2063                                  
  2064                                  ;-235   while(istoken('}')==0)   stmt();
  2065                                  
  2066                                  @@dofunc99:
  2067                                  @@dofunc100:
  2068 00000D5D 6A7D                     push 125
  2069 00000D5F E8D13B                   call istoken
  2070 00000D62 83C402                   add  sp, 2
  2071 00000D65 83F800                   cmp ax, 0
  2072 00000D68 0F850500                 jne @@dofunc101
  2073 00000D6C E8942D                   call stmt
  2074                                  
  2075                                  ;-236   if (nreturn) { prs("\n@@retn:");}
  2076                                  
  2077 00000D6F EBEC                     jmp @@dofunc100
  2078                                  @@dofunc101:
  2079 00000D71 A1[2F00]                 mov ax, [nreturn]
  2080 00000D74 08C0                     or  al, al
  2081 00000D76 0F840900                 je @@dofunc102
  2082 00000D7A 68[2C0E]                 push dofunc_5
  2083 00000D7D E8F13C                   call prs
  2084 00000D80 83C402                   add  sp, 2
  2085                                  
  2086                                  ;-237   if (LTop > LSTART) prs(" LEAVE");
  2087                                  
  2088                                  @@dofunc102:
  2089 00000D83 A1[3700]                 mov ax, [LTop]
  2090 00000D86 3DC800                   cmp ax, 200
  2091 00000D89 0F8E0900                 jle @@dofunc103
  2092 00000D8D 68[360E]                 push dofunc_6
  2093 00000D90 E8DE3C                   call prs
  2094 00000D93 83C402                   add  sp, 2
  2095                                  
  2096                                  ;-238   prs("\n ret"); prs("\n; ENDP"); 
  2097                                  
  2098                                  @@dofunc103:
  2099 00000D96 68[3D0E]                 push dofunc_7
  2100 00000D99 E8D53C                   call prs
  2101 00000D9C 83C402                   add  sp, 2
  2102 00000D9F 68[440E]                 push dofunc_8
  2103 00000DA2 E8CC3C                   call prs
  2104 00000DA5 83C402                   add  sp, 2
  2105                                  
  2106                                  ;-239   *cloc=0; prs(co); maxco1=strlen(co);
  2107                                  
  2108 00000DA8 B80000                   mov ax, 0
  2109 00000DAB 8B1E[1F00]               mov  bx, [cloc]
  2110 00000DAF 8807                     mov  [bx], al
  2111 00000DB1 8D063075                 lea  ax, [co]
  2112 00000DB5 50                       push ax
  2113 00000DB6 E8B83C                   call prs
  2114 00000DB9 83C402                   add  sp, 2
  2115 00000DBC 8D063075                 lea  ax, [co]
  2116 00000DC0 50                       push ax
  2117 00000DC1 E84F4C                   call strlen
  2118 00000DC4 83C402                   add  sp, 2
  2119 00000DC7 A3[1D00]                 mov word [maxco1], ax
  2120                                  
  2121                                  ;-240   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2122                                  
  2123 00000DCA A1[1D00]                 mov ax, [maxco1]
  2124 00000DCD 3B06[1B00]               cmp ax, [maxco]
  2125 00000DD1 0F8E1600                 jle @@dofunc104
  2126 00000DD5 A1[1D00]                 mov ax, [maxco1]
  2127 00000DD8 A3[1B00]                 mov word [maxco], ax
  2128 00000DDB 8D06AB81                 lea  ax, [fname]
  2129 00000DDF 50                       push ax
  2130 00000DE0 8D06E880                 lea  ax, [coname]
  2131 00000DE4 50                       push ax
  2132 00000DE5 E8534C                   call strcpy
  2133 00000DE8 83C404                   add  sp, 4
  2134                                  
  2135                                  ;-241 }
  2136                                  
  2137                                  @@dofunc104:
  2138                                  
  2139                                  ;-242 int isvariable() {
  2140 00000DEB C9                       LEAVE
  2141 00000DEC C3                       ret
  2142                                  ; ENDP
  2143 00000DED 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2144 00000DF6 616C72656164792064-
  2145 00000DFF 6566696E656400     
  2146 00000E06 5C6E5C6E00              dofunc_1 db "\n\n",0
  2147 00000E0B 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2148 00000E14 50524F43202A2A2A00 
  2149 00000E1D 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2150 00000E26 202000             
  2151 00000E29 2C3000                  dofunc_4 db ",0",0
  2152 00000E2C 5C6E40407265746E3A-     dofunc_5 db "\n@@retn:",0
  2153 00000E35 00                 
  2154 00000E36 204C4541564500          dofunc_6 db " LEAVE",0
  2155 00000E3D 5C6E2072657400          dofunc_7 db "\n ret",0
  2156 00000E44 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2157                                  
  2158                                  isvariable:  ; *** PROC ***
  2159                                  
  2160                                  ;-243   if(token==T_SIGNED) goto v1;   if(token==T_UNSIGNED) goto v1;
  2161                                  
  2162 00000E4D A1[2500]                 mov ax, [token]
  2163 00000E50 3D1302                   cmp ax, 531
  2164 00000E53 0F850300                 jne @@isvariable105
  2165 00000E57 E95400                   jmp @@v1
  2166                                  @@isvariable105:
  2167 00000E5A A1[2500]                 mov ax, [token]
  2168 00000E5D 3D1402                   cmp ax, 532
  2169 00000E60 0F850300                 jne @@isvariable106
  2170 00000E64 E94700                   jmp @@v1
  2171                                  
  2172                                  ;-244   if(token==T_CHAR)   goto v1;   if(token==T_INT)      goto v1;
  2173                                  
  2174                                  @@isvariable106:
  2175 00000E67 A1[2500]                 mov ax, [token]
  2176 00000E6A 3D1202                   cmp ax, 530
  2177 00000E6D 0F850300                 jne @@isvariable107
  2178 00000E71 E93A00                   jmp @@v1
  2179                                  @@isvariable107:
  2180 00000E74 A1[2500]                 mov ax, [token]
  2181 00000E77 3D0502                   cmp ax, 517
  2182 00000E7A 0F850300                 jne @@isvariable108
  2183 00000E7E E92D00                   jmp @@v1
  2184                                  
  2185                                  ;-245   if(token==T_SHORT)  goto v1;   if(token==T_LONG)     goto v1;
  2186                                  
  2187                                  @@isvariable108:
  2188 00000E81 A1[2500]                 mov ax, [token]
  2189 00000E84 3D1602                   cmp ax, 534
  2190 00000E87 0F850300                 jne @@isvariable109
  2191 00000E8B E92000                   jmp @@v1
  2192                                  @@isvariable109:
  2193 00000E8E A1[2500]                 mov ax, [token]
  2194 00000E91 3D1502                   cmp ax, 533
  2195 00000E94 0F850300                 jne @@isvariable110
  2196 00000E98 E91300                   jmp @@v1
  2197                                  
  2198                                  ;-246   if(token==T_UINT32) goto v1;   return 0;  v1: return 1;
  2199                                  
  2200                                  @@isvariable110:
  2201 00000E9B A1[2500]                 mov ax, [token]
  2202 00000E9E 3D2102                   cmp ax, 545
  2203 00000EA1 0F850300                 jne @@isvariable111
  2204 00000EA5 E90600                   jmp @@v1
  2205                                  @@isvariable111:
  2206 00000EA8 B80000                   mov ax, 0
  2207 00000EAB E90600                   jmp @@retn
  2208                                  @@v1:
  2209 00000EAE B80100                   mov ax, 1
  2210 00000EB1 E90000                   jmp @@retn
  2211                                  
  2212                                  ;-247 }
  2213                                  
  2214                                  
  2215                                  ;-248                   
  2216                                  
  2217                                  
  2218                                  ;-249 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2219                                  
  2220                                  @@retn:
  2221 00000EB4 C3                       ret
  2222                                  ; ENDP
  2223 00000EB5 0000                    mod1 dw 0
  2224 00000EB7 0000                    ireg1 dw 0
  2225 00000EB9 0000                    idx1 dw 0
  2226 00000EBB 0000                    ids1 dw 0
  2227 00000EBD 0000                    idw1 dw 0
  2228 00000EBF 0000                    idt1 dw 0
  2229 00000EC1 0000                    val1 dw 0
  2230                                  
  2231                                  ;-250 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2232                                  
  2233 00000EC3 0000                    mod2 dw 0
  2234 00000EC5 0000                    ireg2 dw 0
  2235 00000EC7 0000                    idx2 dw 0
  2236 00000EC9 0000                    ids2 dw 0
  2237 00000ECB 0000                    idw2 dw 0
  2238 00000ECD 0000                    idt2 dw 0
  2239 00000ECF 0000                    val2 dw 0
  2240                                  
  2241                                  ;-251 
  2242                                  
  2243                                  
  2244                                  ;-252 int pexpr() {expect('('); iscmp=0; 
  2245                                  
  2246                                  
  2247                                  pexpr:  ; *** PROC ***
  2248 00000ED1 6A28                     push 40
  2249 00000ED3 E87F3A                   call expect
  2250 00000ED6 83C402                   add  sp, 2
  2251 00000ED9 B80000                   mov ax, 0
  2252 00000EDC A3[2B00]                 mov word [iscmp], ax
  2253                                  
  2254                                  ;-253   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2255                                  
  2256 00000EDF A1[2500]                 mov ax, [token]
  2257 00000EE2 3D0001                   cmp ax, 256
  2258 00000EE5 0F853400                 jne @@pexpr112
  2259 00000EE9 68[470F]                 push pexpr_0
  2260 00000EEC 8D062B81                 lea  ax, [symbol]
  2261 00000EF0 50                       push ax
  2262 00000EF1 E86E4C                   call eqstr
  2263 00000EF4 83C404                   add  sp, 4
  2264 00000EF7 08C0                     or  al, al
  2265 00000EF9 0F840600                 je @@pexpr113
  2266 00000EFD E85F00                   call constantexpr
  2267 00000F00 E94300                   jmp @@retn
  2268                                  
  2269                                  ;-254     ireg1=checkreg();
  2270                                  
  2271                                  @@pexpr113:
  2272 00000F03 E8E107                   call checkreg
  2273 00000F06 A3[B70E]                 mov word [ireg1], ax
  2274                                  
  2275                                  ;-255     if (ireg1) { doreg1(1); return; }  }
  2276                                  
  2277 00000F09 A1[B70E]                 mov ax, [ireg1]
  2278 00000F0C 08C0                     or  al, al
  2279 00000F0E 0F840B00                 je @@pexpr114
  2280 00000F12 6A01                     push 1
  2281 00000F14 E8E405                   call doreg1
  2282 00000F17 83C402                   add  sp, 2
  2283 00000F1A E92900                   jmp @@retn
  2284                                  @@pexpr114:
  2285                                  
  2286                                  ;-256   exprstart(); if (iscmp==0) prs("\n or  al, al\n je @@");  prs(fname);
  2287                                  
  2288                                  @@pexpr112:
  2289 00000F1D E85601                   call exprstart
  2290 00000F20 A1[2B00]                 mov ax, [iscmp]
  2291 00000F23 83F800                   cmp ax, 0
  2292 00000F26 0F850900                 jne @@pexpr115
  2293 00000F2A 68[490F]                 push pexpr_1
  2294 00000F2D E8413B                   call prs
  2295 00000F30 83C402                   add  sp, 2
  2296                                  @@pexpr115:
  2297 00000F33 8D06AB81                 lea  ax, [fname]
  2298 00000F37 50                       push ax
  2299 00000F38 E8363B                   call prs
  2300 00000F3B 83C402                   add  sp, 2
  2301                                  
  2302                                  ;-257   expect(')'); }           /*error1("Vergleich fehlt");*/
  2303                                  
  2304 00000F3E 6A29                     push 41
  2305 00000F40 E8123A                   call expect
  2306 00000F43 83C402                   add  sp, 2
  2307                                  
  2308                                  ;-258 
  2309                                  
  2310                                  
  2311                                  ;-259 int constantexpr() { int mode; int id1;int ids;
  2312                                  
  2313                                  @@retn:
  2314 00000F46 C3                       ret
  2315                                  ; ENDP
  2316 00000F47 5F00                    pexpr_0 db "_",0
  2317 00000F49 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je @@",0
  2318 00000F52 2C20616C5C6E206A65-
  2319 00000F5B 20404000           
  2320                                  
  2321                                  constantexpr:  ; *** PROC ***
  2322                                  
  2323                                  ;-260   token=getlex();   mode=typeName();  
  2324                                  
  2325                                  ;Function : constantexpr, Number of local variables: 3
  2326                                  ;   # type sign width addr used name   list of local variables
  2327                                  ;  200 var sign word   259 NULL mode = bp-2
  2328                                  ;  201 var sign word   259 NULL id1 = bp-4
  2329                                  ;  202 var sign word   259 NULL ids = bp-6;
  2330 00000F5F C8060000                 ENTER  6,0
  2331 00000F63 E80632                   call getlex
  2332 00000F66 A3[2500]                 mov word [token], ax
  2333 00000F69 E806F9                   call typeName
  2334 00000F6C 8946FE                   mov [bp-2], ax
  2335                                  
  2336                                  ;-261   id1=searchname(); gettypes(id1); ids=signi;
  2337                                  
  2338 00000F6F E831F8                   call searchname
  2339 00000F72 8946FC                   mov [bp-4], ax
  2340 00000F75 FF76FC                   push word [bp-4]
  2341 00000F78 E8EAF6                   call gettypes
  2342 00000F7B 83C402                   add  sp, 2
  2343 00000F7E A1[3E00]                 mov ax, [signi]
  2344 00000F81 8946FA                   mov [bp-6], ax
  2345                                  
  2346                                  ;-262   if (isrelational() ==0) error1("Relational expression expected");
  2347                                  
  2348 00000F84 E87E31                   call isrelational
  2349 00000F87 83F800                   cmp ax, 0
  2350 00000F8A 0F850900                 jne @@constantexpr116
  2351 00000F8E 68[2610]                 push constantexpr_0
  2352 00000F91 E8C63D                   call error1
  2353 00000F94 83C402                   add  sp, 2
  2354                                  
  2355                                  ;-263   expect(T_CONST);  prs(" ; constant expression");
  2356                                  
  2357                                  @@constantexpr116:
  2358 00000F97 680101                   push 257
  2359 00000F9A E8B839                   call expect
  2360 00000F9D 83C402                   add  sp, 2
  2361 00000FA0 68[4510]                 push constantexpr_1
  2362 00000FA3 E8CB3A                   call prs
  2363 00000FA6 83C402                   add  sp, 2
  2364                                  
  2365                                  ;-264   prs("\ncmp "); 
  2366                                  
  2367 00000FA9 68[5C10]                 push constantexpr_2
  2368 00000FAC E8C23A                   call prs
  2369 00000FAF 83C402                   add  sp, 2
  2370                                  
  2371                                  ;-265   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2372                                  
  2373 00000FB2 FF76FC                   push word [bp-4]
  2374 00000FB5 E8ADF6                   call gettypes
  2375 00000FB8 83C402                   add  sp, 2
  2376 00000FBB A1[4400]                 mov ax, [wi]
  2377 00000FBE 83F802                   cmp ax, 2
  2378 00000FC1 0F850C00                 jne @@constantexpr117
  2379 00000FC5 68[6310]                 push constantexpr_3
  2380 00000FC8 E8A63A                   call prs
  2381 00000FCB 83C402                   add  sp, 2
  2382 00000FCE E90900                   jmp @@constantexpr118
  2383                                  @@constantexpr117:
  2384 00000FD1 68[6810]                 push constantexpr_4
  2385 00000FD4 E89A3A                   call prs
  2386 00000FD7 83C402                   add  sp, 2
  2387                                  
  2388                                  ;-266   if (NASM==0) prs(" ptr ");
  2389                                  
  2390                                  @@constantexpr118:
  2391 00000FDA A0[1500]                 mov al, [NASM]
  2392 00000FDD 3C00                     cmp al, 0
  2393 00000FDF 0F850900                 jne @@constantexpr119
  2394 00000FE3 68[6D10]                 push constantexpr_5
  2395 00000FE6 E8883A                   call prs
  2396 00000FE9 83C402                   add  sp, 2
  2397                                  
  2398                                  ;-267   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2399                                  
  2400                                  @@constantexpr119:
  2401 00000FEC FF76FC                   push word [bp-4]
  2402 00000FEF E8E9F0                   call v
  2403 00000FF2 83C402                   add  sp, 2
  2404 00000FF5 68[7310]                 push constantexpr_6
  2405 00000FF8 E8763A                   call prs
  2406 00000FFB 83C402                   add  sp, 2
  2407 00000FFE FF36[3900]               push word [lexval]
  2408 00001002 E8C63B                   call prunsign1
  2409 00001005 83C402                   add  sp, 2
  2410 00001008 FF76FA                   push word [bp-6]
  2411 0000100B E8A82D                   call cmpneg
  2412 0000100E 83C402                   add  sp, 2
  2413 00001011 8D06AB81                 lea  ax, [fname]
  2414 00001015 50                       push ax
  2415 00001016 E8583A                   call prs
  2416 00001019 83C402                   add  sp, 2
  2417                                  
  2418                                  ;-268   expect(')');
  2419                                  
  2420 0000101C 6A29                     push 41
  2421 0000101E E83439                   call expect
  2422 00001021 83C402                   add  sp, 2
  2423                                  
  2424                                  ;-269 }  
  2425                                  
  2426                                  
  2427                                  ;-270 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2428 00001024 C9                       LEAVE
  2429 00001025 C3                       ret
  2430                                  ; ENDP
  2431 00001026 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2432 0000102F 6C2065787072657373-
  2433 00001038 696F6E206578706563-
  2434 00001041 74656400           
  2435 00001045 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2436 0000104E 6E7420657870726573-
  2437 00001057 73696F6E00         
  2438 0000105C 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2439 00001063 776F726400              constantexpr_3 db "word",0
  2440 00001068 6279746500              constantexpr_4 db "byte",0
  2441 0000106D 207074722000            constantexpr_5 db " ptr ",0
  2442 00001073 2C2000                  constantexpr_6 db ", ",0
  2443                                  
  2444                                  exprstart:  ; *** PROC ***
  2445 00001076 68[9E10]                 push exprstart_0
  2446 00001079 8D062B81                 lea  ax, [symbol]
  2447 0000107D 50                       push ax
  2448 0000107E E8E14A                   call eqstr
  2449 00001081 83C404                   add  sp, 4
  2450 00001084 08C0                     or  al, al
  2451 00001086 0F840B00                 je @@exprstart120
  2452 0000108A 6A00                     push 0
  2453 0000108C E81100                   call expr2
  2454 0000108F 83C402                   add  sp, 2
  2455 00001092 E90800                   jmp @@exprstart121
  2456                                  @@exprstart120:
  2457 00001095 6A00                     push 0
  2458 00001097 E8CC0A                   call expr
  2459 0000109A 83C402                   add  sp, 2
  2460                                  @@exprstart121:
  2461                                  
  2462                                  ;-271 
  2463                                  
  2464                                  
  2465                                  ;-272 int expr2(int kind) {  int i;
  2466                                  
  2467 0000109D C3                       ret
  2468                                  ; ENDP
  2469 0000109E 5F00                    exprstart_0 db "_",0
  2470                                  
  2471                                  expr2:  ; *** PROC ***
  2472                                  
  2473                                  ;-273   if(kind != 1) token=getlex();
  2474                                  
  2475                                  ;Function : expr2, Number of local variables: 2
  2476                                  ;   # type sign width addr used name   list of local variables
  2477                                  ;  200 var sign word   272 NULL kind = bp+4
  2478                                  ;  201 var sign word   272 NULL i = bp-2;
  2479 000010A0 C8020000                 ENTER  2,0
  2480 000010A4 8B4604                   mov ax, [bp+4]
  2481 000010A7 83F801                   cmp ax, 1
  2482 000010AA 0F840600                 je  @@expr2122
  2483 000010AE E8BB30                   call getlex
  2484 000010B1 A3[2500]                 mov word [token], ax
  2485                                  
  2486                                  ;-274   mod1=typeName();
  2487                                  
  2488                                  @@expr2122:
  2489 000010B4 E8BBF7                   call typeName
  2490 000010B7 A3[B50E]                 mov word [mod1], ax
  2491                                  
  2492                                  ;-275   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2493                                  
  2494 000010BA A1[B50E]                 mov ax, [mod1]
  2495 000010BD 08C0                     or  al, al
  2496 000010BF 0F840900                 je @@expr2123
  2497 000010C3 68[7C13]                 push expr2_0
  2498 000010C6 E8913C                   call error1
  2499 000010C9 83C402                   add  sp, 2
  2500                                  
  2501                                  ;-276   ireg1=checkreg();
  2502                                  
  2503                                  @@expr2123:
  2504 000010CC E81806                   call checkreg
  2505 000010CF A3[B70E]                 mov word [ireg1], ax
  2506                                  
  2507                                  ;-277   if (ireg1) { doreg1(0); return; }
  2508                                  
  2509 000010D2 A1[B70E]                 mov ax, [ireg1]
  2510 000010D5 08C0                     or  al, al
  2511 000010D7 0F840B00                 je @@expr2124
  2512 000010DB 6A00                     push 0
  2513 000010DD E81B04                   call doreg1
  2514 000010E0 83C402                   add  sp, 2
  2515 000010E3 E99402                   jmp @@retn
  2516                                  
  2517                                  ;-278   if (ireg1 == 0) { idx1=searchname();
  2518                                  
  2519                                  @@expr2124:
  2520 000010E6 A1[B70E]                 mov ax, [ireg1]
  2521 000010E9 83F800                   cmp ax, 0
  2522 000010EC 0F853400                 jne @@expr2125
  2523 000010F0 E8B0F6                   call searchname
  2524 000010F3 A3[B90E]                 mov word [idx1], ax
  2525                                  
  2526                                  ;-279     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  2527                                  
  2528 000010F6 FF36[B90E]               push word [idx1]
  2529 000010FA E868F5                   call gettypes
  2530 000010FD 83C402                   add  sp, 2
  2531 00001100 A1[3E00]                 mov ax, [signi]
  2532 00001103 A3[BB0E]                 mov word [ids1], ax
  2533 00001106 A1[4400]                 mov ax, [wi]
  2534 00001109 A3[BD0E]                 mov word [idw1], ax
  2535 0000110C A1[3B00]                 mov ax, [typei]
  2536 0000110F A3[BF0E]                 mov word [idt1], ax
  2537                                  
  2538                                  ;-280     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  2539                                  
  2540 00001112 A1[BF0E]                 mov ax, [idt1]
  2541 00001115 08C0                     or  al, al
  2542 00001117 0F840900                 je @@expr2126
  2543 0000111B 68[AB13]                 push expr2_1
  2544 0000111E E8393C                   call error1
  2545 00001121 83C402                   add  sp, 2
  2546                                  @@expr2126:
  2547                                  
  2548                                  ;-281   
  2549                                  
  2550                                  
  2551                                  ;-282   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  2552                                  
  2553                                  @@expr2125:
  2554 00001124 E8DE2F                   call isrelational
  2555 00001127 08C0                     or  al, al
  2556 00001129 0F840900                 je @@expr2127
  2557 0000112D 68[D613]                 push expr2_2
  2558 00001130 E8273C                   call error1
  2559 00001133 83C402                   add  sp, 2
  2560                                  
  2561                                  ;-283   }
  2562                                  
  2563                                  
  2564                                  ;-284   if (istoken('=') == 0) error1("Assign expected");
  2565                                  
  2566                                  @@expr2127:
  2567 00001136 6A3D                     push 61
  2568 00001138 E8F837                   call istoken
  2569 0000113B 83C402                   add  sp, 2
  2570 0000113E 83F800                   cmp ax, 0
  2571 00001141 0F850900                 jne @@expr2128
  2572 00001145 68[F913]                 push expr2_3
  2573 00001148 E80F3C                   call error1
  2574 0000114B 83C402                   add  sp, 2
  2575                                  
  2576                                  ;-285   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  2577                                  
  2578                                  @@expr2128:
  2579 0000114E 680101                   push 257
  2580 00001151 E8DF37                   call istoken
  2581 00001154 83C402                   add  sp, 2
  2582 00001157 08C0                     or  al, al
  2583 00001159 0F84AC00                 je @@expr2129
  2584 0000115D A1[3900]                 mov ax, [lexval]
  2585 00001160 A3[CF0E]                 mov word [val2], ax
  2586 00001163 68[0914]                 push expr2_4
  2587 00001166 E80839                   call prs
  2588 00001169 83C402                   add  sp, 2
  2589                                  
  2590                                  ;-286     prs("\nmov ");
  2591                                  
  2592 0000116C 68[2014]                 push expr2_5
  2593 0000116F E8FF38                   call prs
  2594 00001172 83C402                   add  sp, 2
  2595                                  
  2596                                  ;-287     if (idw1 == 1) prs("byte ");
  2597                                  
  2598 00001175 A1[BD0E]                 mov ax, [idw1]
  2599 00001178 83F801                   cmp ax, 1
  2600 0000117B 0F850900                 jne @@expr2130
  2601 0000117F 68[2714]                 push expr2_6
  2602 00001182 E8EC38                   call prs
  2603 00001185 83C402                   add  sp, 2
  2604                                  
  2605                                  ;-288     if (idw1 == 2) prs("word ");
  2606                                  
  2607                                  @@expr2130:
  2608 00001188 A1[BD0E]                 mov ax, [idw1]
  2609 0000118B 83F802                   cmp ax, 2
  2610 0000118E 0F850900                 jne @@expr2131
  2611 00001192 68[2D14]                 push expr2_7
  2612 00001195 E8D938                   call prs
  2613 00001198 83C402                   add  sp, 2
  2614                                  
  2615                                  ;-289     if (idw1 == 4) prs("dword ");
  2616                                  
  2617                                  @@expr2131:
  2618 0000119B A1[BD0E]                 mov ax, [idw1]
  2619 0000119E 83F804                   cmp ax, 4
  2620 000011A1 0F850900                 jne @@expr2132
  2621 000011A5 68[3314]                 push expr2_8
  2622 000011A8 E8C638                   call prs
  2623 000011AB 83C402                   add  sp, 2
  2624                                  
  2625                                  ;-290     if (NASM == 0) prs("ptr ");
  2626                                  
  2627                                  @@expr2132:
  2628 000011AE A0[1500]                 mov al, [NASM]
  2629 000011B1 3C00                     cmp al, 0
  2630 000011B3 0F850900                 jne @@expr2133
  2631 000011B7 68[3A14]                 push expr2_9
  2632 000011BA E8B438                   call prs
  2633 000011BD 83C402                   add  sp, 2
  2634                                  
  2635                                  ;-291     v(idx1);
  2636                                  
  2637                                  @@expr2133:
  2638 000011C0 FF36[B90E]               push word [idx1]
  2639 000011C4 E814EF                   call v
  2640 000011C7 83C402                   add  sp, 2
  2641                                  
  2642                                  ;-292     prs(", "); prunsign1(val2);
  2643                                  
  2644 000011CA 68[3F14]                 push expr2_10
  2645 000011CD E8A138                   call prs
  2646 000011D0 83C402                   add  sp, 2
  2647 000011D3 FF36[CF0E]               push word [val2]
  2648 000011D7 E8F139                   call prunsign1
  2649 000011DA 83C402                   add  sp, 2
  2650                                  
  2651                                  ;-293     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  2652                                  
  2653 000011DD A1[B90E]                 mov ax, [idx1]
  2654 000011E0 3DC800                   cmp ax, 200 ;unsigned : 1
  2655 000011E3 0F8C1F00                 jl  @@expr2134
  2656 000011E7 FF36[B90E]               push word [idx1]
  2657 000011EB E82EF5                   call adrofname
  2658 000011EE 83C402                   add  sp, 2
  2659 000011F1 8946FE                   mov [bp-2], ax
  2660 000011F4 68[4214]                 push expr2_11
  2661 000011F7 E87738                   call prs
  2662 000011FA 83C402                   add  sp, 2
  2663 000011FD FF76FE                   push word [bp-2]
  2664 00001200 E86E38                   call prs
  2665 00001203 83C402                   add  sp, 2
  2666                                  @@expr2134:
  2667 00001206 E97101                   jmp @@retn
  2668                                  
  2669                                  ;-294   
  2670                                  
  2671                                  
  2672                                  ;-295   mod1=typeName(); ireg2=checkreg();
  2673                                  
  2674                                  @@expr2129:
  2675 00001209 E866F6                   call typeName
  2676 0000120C A3[B50E]                 mov word [mod1], ax
  2677 0000120F E8D504                   call checkreg
  2678 00001212 A3[C50E]                 mov word [ireg2], ax
  2679                                  
  2680                                  ;-296   if (ireg2) { prs("\nmov ");
  2681                                  
  2682 00001215 A1[C50E]                 mov ax, [ireg2]
  2683 00001218 08C0                     or  al, al
  2684 0000121A 0F844200                 je @@expr2135
  2685 0000121E 68[4514]                 push expr2_12
  2686 00001221 E84D38                   call prs
  2687 00001224 83C402                   add  sp, 2
  2688                                  
  2689                                  ;-297     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  2690                                  
  2691 00001227 A1[B70E]                 mov ax, [ireg1]
  2692 0000122A 08C0                     or  al, al
  2693 0000122C 0F840D00                 je @@expr2136
  2694 00001230 FF36[B70E]               push word [ireg1]
  2695 00001234 E8BE08                   call printreg
  2696 00001237 83C402                   add  sp, 2
  2697 0000123A E90A00                   jmp @@expr2137
  2698                                  @@expr2136:
  2699 0000123D FF36[B90E]               push word [idx1]
  2700 00001241 E897EE                   call v
  2701 00001244 83C402                   add  sp, 2
  2702                                  @@expr2137:
  2703 00001247 68[4C14]                 push expr2_13
  2704 0000124A E82438                   call prs
  2705 0000124D 83C402                   add  sp, 2
  2706 00001250 FF36[C50E]               push word [ireg2]
  2707 00001254 E89E08                   call printreg
  2708 00001257 83C402                   add  sp, 2
  2709 0000125A E91D01                   jmp @@retn
  2710                                  
  2711                                  ;-298   else {
  2712                                  
  2713 0000125D E91101                   jmp @@expr2138
  2714                                  @@expr2135:
  2715                                  
  2716                                  ;-299     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  2717                                  
  2718 00001260 A1[B50E]                 mov ax, [mod1]
  2719 00001263 83F801                   cmp ax, 1
  2720 00001266 0F850900                 jne @@expr2139
  2721 0000126A 68[4F14]                 push expr2_14
  2722 0000126D E8EA3A                   call error1
  2723 00001270 83C402                   add  sp, 2
  2724                                  
  2725                                  ;-300     
  2726                                  
  2727                                  
  2728                                  ;-301     idx2=searchname();
  2729                                  
  2730                                  @@expr2139:
  2731 00001273 E82DF5                   call searchname
  2732 00001276 A3[C70E]                 mov word [idx2], ax
  2733                                  
  2734                                  ;-302     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  2735                                  
  2736 00001279 FF36[C70E]               push word [idx2]
  2737 0000127D E8E5F3                   call gettypes
  2738 00001280 83C402                   add  sp, 2
  2739 00001283 A1[3E00]                 mov ax, [signi]
  2740 00001286 A3[C90E]                 mov word [ids2], ax
  2741 00001289 A1[4400]                 mov ax, [wi]
  2742 0000128C A3[CB0E]                 mov word [idw2], ax
  2743 0000128F A1[3B00]                 mov ax, [typei]
  2744 00001292 A3[CD0E]                 mov word [idt2], ax
  2745                                  
  2746                                  ;-303     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  2747                                  
  2748 00001295 A1[CD0E]                 mov ax, [idt2]
  2749 00001298 83F801                   cmp ax, 1
  2750 0000129B 0F850900                 jne @@expr2140
  2751 0000129F 68[6B14]                 push expr2_15
  2752 000012A2 E8B53A                   call error1
  2753 000012A5 83C402                   add  sp, 2
  2754                                  
  2755                                  ;-304     prs("\nmov ");
  2756                                  
  2757                                  @@expr2140:
  2758 000012A8 68[8A14]                 push expr2_16
  2759 000012AB E8C337                   call prs
  2760 000012AE 83C402                   add  sp, 2
  2761                                  
  2762                                  ;-305     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  2763                                  
  2764 000012B1 A1[B70E]                 mov ax, [ireg1]
  2765 000012B4 08C0                     or  al, al
  2766 000012B6 0F840D00                 je @@expr2141
  2767 000012BA FF36[B70E]               push word [ireg1]
  2768 000012BE E83408                   call printreg
  2769 000012C1 83C402                   add  sp, 2
  2770 000012C4 E90900                   jmp @@expr2142
  2771                                  @@expr2141:
  2772 000012C7 68[9114]                 push expr2_17
  2773 000012CA E88D3A                   call error1
  2774 000012CD 83C402                   add  sp, 2
  2775                                  
  2776                                  ;-306     prs(", ");
  2777                                  
  2778                                  @@expr2142:
  2779 000012D0 68[B314]                 push expr2_18
  2780 000012D3 E89B37                   call prs
  2781 000012D6 83C402                   add  sp, 2
  2782                                  
  2783                                  ;-307     if (mod1 == 2) a(idx2);
  2784                                  
  2785 000012D9 A1[B50E]                 mov ax, [mod1]
  2786 000012DC 83F802                   cmp ax, 2
  2787 000012DF 0F850D00                 jne @@expr2143
  2788 000012E3 FF36[C70E]               push word [idx2]
  2789 000012E7 E8C8ED                   call a
  2790 000012EA 83C402                   add  sp, 2
  2791                                  
  2792                                  ;-308     else {
  2793                                  
  2794 000012ED E97E00                   jmp @@expr2144
  2795                                  @@expr2143:
  2796                                  
  2797                                  ;-309       if (idw2 == 1) prs("byte ");
  2798                                  
  2799 000012F0 A1[CB0E]                 mov ax, [idw2]
  2800 000012F3 83F801                   cmp ax, 1
  2801 000012F6 0F850900                 jne @@expr2145
  2802 000012FA 68[B614]                 push expr2_19
  2803 000012FD E87137                   call prs
  2804 00001300 83C402                   add  sp, 2
  2805                                  
  2806                                  ;-310       if (idw2 == 2) prs("word ");
  2807                                  
  2808                                  @@expr2145:
  2809 00001303 A1[CB0E]                 mov ax, [idw2]
  2810 00001306 83F802                   cmp ax, 2
  2811 00001309 0F850900                 jne @@expr2146
  2812 0000130D 68[BC14]                 push expr2_20
  2813 00001310 E85E37                   call prs
  2814 00001313 83C402                   add  sp, 2
  2815                                  
  2816                                  ;-311       if (idw2 == 4) prs("dword ");
  2817                                  
  2818                                  @@expr2146:
  2819 00001316 A1[CB0E]                 mov ax, [idw2]
  2820 00001319 83F804                   cmp ax, 4
  2821 0000131C 0F850900                 jne @@expr2147
  2822 00001320 68[C214]                 push expr2_21
  2823 00001323 E84B37                   call prs
  2824 00001326 83C402                   add  sp, 2
  2825                                  
  2826                                  ;-312       if (NASM == 0) prs("ptr ");
  2827                                  
  2828                                  @@expr2147:
  2829 00001329 A0[1500]                 mov al, [NASM]
  2830 0000132C 3C00                     cmp al, 0
  2831 0000132E 0F850900                 jne @@expr2148
  2832 00001332 68[C914]                 push expr2_22
  2833 00001335 E83937                   call prs
  2834 00001338 83C402                   add  sp, 2
  2835                                  
  2836                                  ;-313       v(idx2);
  2837                                  
  2838                                  @@expr2148:
  2839 0000133B FF36[C70E]               push word [idx2]
  2840 0000133F E899ED                   call v
  2841 00001342 83C402                   add  sp, 2
  2842                                  
  2843                                  ;-314       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  2844                                  
  2845 00001345 A1[C70E]                 mov ax, [idx2]
  2846 00001348 3DC800                   cmp ax, 200 ;unsigned : 1
  2847 0000134B 0F8C1F00                 jl  @@expr2149
  2848 0000134F FF36[C70E]               push word [idx2]
  2849 00001353 E8C6F3                   call adrofname
  2850 00001356 83C402                   add  sp, 2
  2851 00001359 8946FE                   mov [bp-2], ax
  2852 0000135C 68[CE14]                 push expr2_23
  2853 0000135F E80F37                   call prs
  2854 00001362 83C402                   add  sp, 2
  2855 00001365 FF76FE                   push word [bp-2]
  2856 00001368 E80637                   call prs
  2857 0000136B 83C402                   add  sp, 2
  2858                                  @@expr2149:
  2859                                  
  2860                                  ;-315     return;
  2861                                  
  2862                                  @@expr2144:
  2863 0000136E E90900                   jmp @@retn
  2864                                  
  2865                                  ;-316   } error1("Internal error: only const or reg allowed");
  2866                                  
  2867                                  @@expr2138:
  2868 00001371 68[D114]                 push expr2_24
  2869 00001374 E8E339                   call error1
  2870 00001377 83C402                   add  sp, 2
  2871                                  
  2872                                  ;-317 }
  2873                                  
  2874                                  
  2875                                  ;-318 char ops[5];
  2876                                  
  2877 0000137A C9                      @@retn: LEAVE
  2878 0000137B C3                       ret
  2879                                  ; ENDP
  2880 0000137C 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  2881 00001385 202620756E64202A20-
  2882 0000138E 696D20546578742028-
  2883 00001397 4C696E6B652048616E-
  2884 000013A0 64292065726C617562-
  2885 000013A9 7400               
  2886 000013AB 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  2887 000013B4 204172726179206F64-
  2888 000013BD 657220506F696E7465-
  2889 000013C6 72206C696E6B732065-
  2890 000013CF 726C6175627400     
  2891 000013D6 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  2892 000013DF 206E6F6368206E6963-
  2893 000013E8 687420696D706C656D-
  2894 000013F1 656E746965727400   
  2895 000013F9 41737369676E206578-     expr2_3 db "Assign expected",0
  2896 00001402 70656374656400     
  2897 00001409 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  2898 00001412 6E7420657870726573-
  2899 0000141B 73696F6E00         
  2900 00001420 5C6E6D6F762000          expr2_5 db "\nmov ",0
  2901 00001427 627974652000            expr2_6 db "byte ",0
  2902 0000142D 776F72642000            expr2_7 db "word ",0
  2903 00001433 64776F72642000          expr2_8 db "dword ",0
  2904 0000143A 7074722000              expr2_9 db "ptr ",0
  2905 0000143F 2C2000                  expr2_10 db ", ",0
  2906 00001442 3B2000                  expr2_11 db "; ",0
  2907 00001445 5C6E6D6F762000          expr2_12 db "\nmov ",0
  2908 0000144C 2C2000                  expr2_13 db ", ",0
  2909 0000144F 4E6F6368206B65696E-     expr2_14 db "Noch kein * im Text erlaubt",0
  2910 00001458 202A20696D20546578-
  2911 00001461 742065726C61756274-
  2912 0000146A 00                 
  2913 0000146B 4E6F6368206B65696E-     expr2_15 db "Noch kein Array rechts erlaubt",0
  2914 00001474 204172726179207265-
  2915 0000147D 636874732065726C61-
  2916 00001486 75627400           
  2917 0000148A 5C6E6D6F762000          expr2_16 db "\nmov ",0
  2918 00001491 4D656D20746F204D65-     expr2_17 db "Mem to Mem not allowed by x86-CPU",0
  2919 0000149A 6D206E6F7420616C6C-
  2920 000014A3 6F7765642062792078-
  2921 000014AC 38362D43505500     
  2922 000014B3 2C2000                  expr2_18 db ", ",0
  2923 000014B6 627974652000            expr2_19 db "byte ",0
  2924 000014BC 776F72642000            expr2_20 db "word ",0
  2925 000014C2 64776F72642000          expr2_21 db "dword ",0
  2926 000014C9 7074722000              expr2_22 db "ptr ",0
  2927 000014CE 3B2000                  expr2_23 db "; ",0
  2928 000014D1 496E7465726E616C20-     expr2_24 db "Internal error: only const or reg allowed",0
  2929 000014DA 6572726F723A206F6E-
  2930 000014E3 6C7920636F6E737420-
  2931 000014EC 6F722072656720616C-
  2932 000014F5 6C6F77656400       
  2933                                  section .bss
  2934                                  absolute 53406
  2935 0000D09E <res 00000005>          ops resb 5
  2936                                  section .text
  2937                                  
  2938                                  ;-319 int doreg1(int iscmp1) { int i;
  2939                                  
  2940                                  
  2941                                  doreg1:  ; *** PROC ***
  2942                                  
  2943                                  ;-320   if (istoken('='))          strcpy(ops, "mov");
  2944                                  
  2945                                  ;Function : doreg1, Number of local variables: 2
  2946                                  ;   # type sign width addr used name   list of local variables
  2947                                  ;  200 var sign word   319 NULL iscmp1 = bp+4
  2948                                  ;  201 var sign word   319 NULL i = bp-2;
  2949 000014FB C8020000                 ENTER  2,0
  2950 000014FF 6A3D                     push 61
  2951 00001501 E82F34                   call istoken
  2952 00001504 83C402                   add  sp, 2
  2953 00001507 08C0                     or  al, al
  2954 00001509 0F840E00                 je @@doreg1150
  2955 0000150D 68[AE16]                 push doreg1_0
  2956 00001510 8D069ED0                 lea  ax, [ops]
  2957 00001514 50                       push ax
  2958 00001515 E82345                   call strcpy
  2959 00001518 83C404                   add  sp, 4
  2960                                  
  2961                                  ;-321   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  2962                                  
  2963                                  @@doreg1150:
  2964 0000151B 68CE04                   push 1230
  2965 0000151E E81234                   call istoken
  2966 00001521 83C402                   add  sp, 2
  2967 00001524 08C0                     or  al, al
  2968 00001526 0F840E00                 je @@doreg1151
  2969 0000152A 68[B216]                 push doreg1_1
  2970 0000152D 8D069ED0                 lea  ax, [ops]
  2971 00001531 50                       push ax
  2972 00001532 E80645                   call strcpy
  2973 00001535 83C404                   add  sp, 4
  2974                                  
  2975                                  ;-322   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  2976                                  
  2977                                  @@doreg1151:
  2978 00001538 68CF04                   push 1231
  2979 0000153B E8F533                   call istoken
  2980 0000153E 83C402                   add  sp, 2
  2981 00001541 08C0                     or  al, al
  2982 00001543 0F840E00                 je @@doreg1152
  2983 00001547 68[B616]                 push doreg1_2
  2984 0000154A 8D069ED0                 lea  ax, [ops]
  2985 0000154E 50                       push ax
  2986 0000154F E8E944                   call strcpy
  2987 00001552 83C404                   add  sp, 4
  2988                                  
  2989                                  ;-323   if (istoken(T_ANDASS))     strcpy(ops, "and");
  2990                                  
  2991                                  @@doreg1152:
  2992 00001555 68D204                   push 1234
  2993 00001558 E8D833                   call istoken
  2994 0000155B 83C402                   add  sp, 2
  2995 0000155E 08C0                     or  al, al
  2996 00001560 0F840E00                 je @@doreg1153
  2997 00001564 68[BA16]                 push doreg1_3
  2998 00001567 8D069ED0                 lea  ax, [ops]
  2999 0000156B 50                       push ax
  3000 0000156C E8CC44                   call strcpy
  3001 0000156F 83C404                   add  sp, 4
  3002                                  
  3003                                  ;-324   if (istoken(T_ORASS))      strcpy(ops, "or" );
  3004                                  
  3005                                  @@doreg1153:
  3006 00001572 68D304                   push 1235
  3007 00001575 E8BB33                   call istoken
  3008 00001578 83C402                   add  sp, 2
  3009 0000157B 08C0                     or  al, al
  3010 0000157D 0F840E00                 je @@doreg1154
  3011 00001581 68[BE16]                 push doreg1_4
  3012 00001584 8D069ED0                 lea  ax, [ops]
  3013 00001588 50                       push ax
  3014 00001589 E8AF44                   call strcpy
  3015 0000158C 83C404                   add  sp, 4
  3016                                  
  3017                                  ;-325   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3018                                  
  3019                                  @@doreg1154:
  3020 0000158F 68D804                   push 1240
  3021 00001592 E89E33                   call istoken
  3022 00001595 83C402                   add  sp, 2
  3023 00001598 08C0                     or  al, al
  3024 0000159A 0F840E00                 je @@doreg1155
  3025 0000159E 68[C116]                 push doreg1_5
  3026 000015A1 8D069ED0                 lea  ax, [ops]
  3027 000015A5 50                       push ax
  3028 000015A6 E89244                   call strcpy
  3029 000015A9 83C404                   add  sp, 4
  3030                                  
  3031                                  ;-326   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3032                                  
  3033                                  @@doreg1155:
  3034 000015AC 68D904                   push 1241
  3035 000015AF E88133                   call istoken
  3036 000015B2 83C402                   add  sp, 2
  3037 000015B5 08C0                     or  al, al
  3038 000015B7 0F840E00                 je @@doreg1156
  3039 000015BB 68[C516]                 push doreg1_6
  3040 000015BE 8D069ED0                 lea  ax, [ops]
  3041 000015C2 50                       push ax
  3042 000015C3 E87544                   call strcpy
  3043 000015C6 83C404                   add  sp, 4
  3044                                  
  3045                                  ;-327   if (iscmp1 == 1) { token=getlex();
  3046                                  
  3047                                  @@doreg1156:
  3048 000015C9 8B4604                   mov ax, [bp+4]
  3049 000015CC 83F801                   cmp ax, 1
  3050 000015CF 0F852700                 jne @@doreg1157
  3051 000015D3 E8962B                   call getlex
  3052 000015D6 A3[2500]                 mov word [token], ax
  3053                                  
  3054                                  ;-328       if (isrelational() ==0) error1("Relational expected");
  3055                                  
  3056 000015D9 E8292B                   call isrelational
  3057 000015DC 83F800                   cmp ax, 0
  3058 000015DF 0F850900                 jne @@doreg1158
  3059 000015E3 68[C916]                 push doreg1_7
  3060 000015E6 E87137                   call error1
  3061 000015E9 83C402                   add  sp, 2
  3062                                  
  3063                                  ;-329       strcpy(ops, "cmp"); }
  3064                                  
  3065                                  @@doreg1158:
  3066 000015EC 68[DD16]                 push doreg1_8
  3067 000015EF 8D069ED0                 lea  ax, [ops]
  3068 000015F3 50                       push ax
  3069 000015F4 E84444                   call strcpy
  3070 000015F7 83C404                   add  sp, 4
  3071                                  
  3072                                  ;-330   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3073                                  
  3074                                  @@doreg1157:
  3075 000015FA E86634                   call prnl
  3076 000015FD 8D069ED0                 lea  ax, [ops]
  3077 00001601 50                       push ax
  3078 00001602 E86C34                   call prs
  3079 00001605 83C402                   add  sp, 2
  3080 00001608 68[E116]                 push doreg1_9
  3081 0000160B E86334                   call prs
  3082 0000160E 83C402                   add  sp, 2
  3083 00001611 FF36[B70E]               push word [ireg1]
  3084 00001615 E8DD04                   call printreg
  3085 00001618 83C402                   add  sp, 2
  3086 0000161B 68[E416]                 push doreg1_10
  3087 0000161E E85034                   call prs
  3088 00001621 83C402                   add  sp, 2
  3089                                  
  3090                                  ;-331 
  3091                                  
  3092                                  
  3093                                  ;-332   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3094                                  
  3095 00001624 680101                   push 257
  3096 00001627 E80933                   call istoken
  3097 0000162A 83C402                   add  sp, 2
  3098 0000162D 08C0                     or  al, al
  3099 0000162F 0F840D00                 je @@doreg1159
  3100 00001633 FF36[3900]               push word [lexval]
  3101 00001637 E89135                   call prunsign1
  3102 0000163A 83C402                   add  sp, 2
  3103 0000163D E94700                   jmp @@reg1
  3104                                  
  3105                                  ;-333   mod2=typeName(); ireg2=checkreg();
  3106                                  
  3107                                  @@doreg1159:
  3108 00001640 E82FF2                   call typeName
  3109 00001643 A3[C30E]                 mov word [mod2], ax
  3110 00001646 E89E00                   call checkreg
  3111 00001649 A3[C50E]                 mov word [ireg2], ax
  3112                                  
  3113                                  ;-334   if (ireg2) {printreg(ireg2); goto reg1;}
  3114                                  
  3115 0000164C A1[C50E]                 mov ax, [ireg2]
  3116 0000164F 08C0                     or  al, al
  3117 00001651 0F840D00                 je @@doreg1160
  3118 00001655 FF36[C50E]               push word [ireg2]
  3119 00001659 E89904                   call printreg
  3120 0000165C 83C402                   add  sp, 2
  3121 0000165F E92500                   jmp @@reg1
  3122                                  
  3123                                  ;-335   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3124                                  
  3125                                  @@doreg1160:
  3126 00001662 E83EF1                   call searchname
  3127 00001665 8946FE                   mov [bp-2], ax
  3128 00001668 A1[C30E]                 mov ax, [mod2]
  3129 0000166B 83F802                   cmp ax, 2
  3130 0000166E 0F850C00                 jne @@doreg1161
  3131 00001672 FF76FE                   push word [bp-2]
  3132 00001675 E83AEA                   call a
  3133 00001678 83C402                   add  sp, 2
  3134 0000167B E90900                   jmp @@doreg1162
  3135                                  @@doreg1161:
  3136 0000167E FF76FE                   push word [bp-2]
  3137 00001681 E857EA                   call v
  3138 00001684 83C402                   add  sp, 2
  3139                                  
  3140                                  ;-336   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3141                                  
  3142                                  @@doreg1162:
  3143                                  @@reg1:
  3144 00001687 8B4604                   mov ax, [bp+4]
  3145 0000168A 83F801                   cmp ax, 1
  3146 0000168D 0F851B00                 jne @@doreg1163
  3147 00001691 6A00                     push 0
  3148 00001693 E82027                   call cmpneg
  3149 00001696 83C402                   add  sp, 2
  3150 00001699 8D06AB81                 lea  ax, [fname]
  3151 0000169D 50                       push ax
  3152 0000169E E8D033                   call prs
  3153 000016A1 83C402                   add  sp, 2
  3154 000016A4 6A29                     push 41
  3155 000016A6 E8AC32                   call expect
  3156 000016A9 83C402                   add  sp, 2
  3157                                  
  3158                                  ;-337 }
  3159                                  
  3160                                  @@doreg1163:
  3161                                  
  3162                                  ;-338 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3163 000016AC C9                       LEAVE
  3164 000016AD C3                       ret
  3165                                  ; ENDP
  3166 000016AE 6D6F7600                doreg1_0 db "mov",0
  3167 000016B2 61646400                doreg1_1 db "add",0
  3168 000016B6 73756200                doreg1_2 db "sub",0
  3169 000016BA 616E6400                doreg1_3 db "and",0
  3170 000016BE 6F7200                  doreg1_4 db "or",0
  3171 000016C1 73686C00                doreg1_5 db "shl",0
  3172 000016C5 73687200                doreg1_6 db "shr",0
  3173 000016C9 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3174 000016D2 6C2065787065637465-
  3175 000016DB 6400               
  3176 000016DD 636D7000                doreg1_8 db "cmp",0
  3177 000016E1 202000                  doreg1_9 db "  ",0
  3178 000016E4 2C2000                  doreg1_10 db ", ",0
  3179                                  
  3180                                  checkreg:  ; *** PROC ***
  3181                                  
  3182                                  ;-339   if (strlen(symbol) <  2) return 0;
  3183                                  
  3184 000016E7 8D062B81                 lea  ax, [symbol]
  3185 000016EB 50                       push ax
  3186 000016EC E82443                   call strlen
  3187 000016EF 83C402                   add  sp, 2
  3188 000016F2 83F802                   cmp ax, 2
  3189 000016F5 0F8D0600                 jge @@checkreg164
  3190 000016F9 B80000                   mov ax, 0
  3191 000016FC E94403                   jmp @@retn
  3192                                  
  3193                                  ;-340   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3194                                  
  3195                                  @@checkreg164:
  3196 000016FF 68[441A]                 push checkreg_0
  3197 00001702 8D062B81                 lea  ax, [symbol]
  3198 00001706 50                       push ax
  3199 00001707 E85844                   call eqstr
  3200 0000170A 83C404                   add  sp, 4
  3201 0000170D 08C0                     or  al, al
  3202 0000170F 0F840600                 je @@checkreg165
  3203 00001713 B80100                   mov ax, 1
  3204 00001716 E92A03                   jmp @@retn
  3205                                  @@checkreg165:
  3206 00001719 68[471A]                 push checkreg_1
  3207 0000171C 8D062B81                 lea  ax, [symbol]
  3208 00001720 50                       push ax
  3209 00001721 E83E44                   call eqstr
  3210 00001724 83C404                   add  sp, 4
  3211 00001727 08C0                     or  al, al
  3212 00001729 0F840600                 je @@checkreg166
  3213 0000172D B80300                   mov ax, 3
  3214 00001730 E91003                   jmp @@retn
  3215                                  
  3216                                  ;-341   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3217                                  
  3218                                  @@checkreg166:
  3219 00001733 68[4A1A]                 push checkreg_2
  3220 00001736 8D062B81                 lea  ax, [symbol]
  3221 0000173A 50                       push ax
  3222 0000173B E82444                   call eqstr
  3223 0000173E 83C404                   add  sp, 4
  3224 00001741 08C0                     or  al, al
  3225 00001743 0F840600                 je @@checkreg167
  3226 00001747 B80500                   mov ax, 5
  3227 0000174A E9F602                   jmp @@retn
  3228                                  @@checkreg167:
  3229 0000174D 68[4D1A]                 push checkreg_3
  3230 00001750 8D062B81                 lea  ax, [symbol]
  3231 00001754 50                       push ax
  3232 00001755 E80A44                   call eqstr
  3233 00001758 83C404                   add  sp, 4
  3234 0000175B 08C0                     or  al, al
  3235 0000175D 0F840600                 je @@checkreg168
  3236 00001761 B80700                   mov ax, 7
  3237 00001764 E9DC02                   jmp @@retn
  3238                                  
  3239                                  ;-342   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3240                                  
  3241                                  @@checkreg168:
  3242 00001767 68[501A]                 push checkreg_4
  3243 0000176A 8D062B81                 lea  ax, [symbol]
  3244 0000176E 50                       push ax
  3245 0000176F E8F043                   call eqstr
  3246 00001772 83C404                   add  sp, 4
  3247 00001775 08C0                     or  al, al
  3248 00001777 0F840600                 je @@checkreg169
  3249 0000177B B80900                   mov ax, 9
  3250 0000177E E9C202                   jmp @@retn
  3251                                  @@checkreg169:
  3252 00001781 68[531A]                 push checkreg_5
  3253 00001784 8D062B81                 lea  ax, [symbol]
  3254 00001788 50                       push ax
  3255 00001789 E8D643                   call eqstr
  3256 0000178C 83C404                   add  sp, 4
  3257 0000178F 08C0                     or  al, al
  3258 00001791 0F840600                 je @@checkreg170
  3259 00001795 B80B00                   mov ax, 11
  3260 00001798 E9A802                   jmp @@retn
  3261                                  
  3262                                  ;-343   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3263                                  
  3264                                  @@checkreg170:
  3265 0000179B 68[561A]                 push checkreg_6
  3266 0000179E 8D062B81                 lea  ax, [symbol]
  3267 000017A2 50                       push ax
  3268 000017A3 E8BC43                   call eqstr
  3269 000017A6 83C404                   add  sp, 4
  3270 000017A9 08C0                     or  al, al
  3271 000017AB 0F840600                 je @@checkreg171
  3272 000017AF B80D00                   mov ax, 13
  3273 000017B2 E98E02                   jmp @@retn
  3274                                  @@checkreg171:
  3275 000017B5 68[591A]                 push checkreg_7
  3276 000017B8 8D062B81                 lea  ax, [symbol]
  3277 000017BC 50                       push ax
  3278 000017BD E8A243                   call eqstr
  3279 000017C0 83C404                   add  sp, 4
  3280 000017C3 08C0                     or  al, al
  3281 000017C5 0F840600                 je @@checkreg172
  3282 000017C9 B80F00                   mov ax, 15
  3283 000017CC E97402                   jmp @@retn
  3284                                  
  3285                                  ;-344   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3286                                  
  3287                                  @@checkreg172:
  3288 000017CF 68[5C1A]                 push checkreg_8
  3289 000017D2 8D062B81                 lea  ax, [symbol]
  3290 000017D6 50                       push ax
  3291 000017D7 E88843                   call eqstr
  3292 000017DA 83C404                   add  sp, 4
  3293 000017DD 08C0                     or  al, al
  3294 000017DF 0F840600                 je @@checkreg173
  3295 000017E3 B81100                   mov ax, 17
  3296 000017E6 E95A02                   jmp @@retn
  3297                                  @@checkreg173:
  3298 000017E9 68[5F1A]                 push checkreg_9
  3299 000017EC 8D062B81                 lea  ax, [symbol]
  3300 000017F0 50                       push ax
  3301 000017F1 E86E43                   call eqstr
  3302 000017F4 83C404                   add  sp, 4
  3303 000017F7 08C0                     or  al, al
  3304 000017F9 0F840600                 je @@checkreg174
  3305 000017FD B81300                   mov ax, 19
  3306 00001800 E94002                   jmp @@retn
  3307                                  
  3308                                  ;-345   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3309                                  
  3310                                  @@checkreg174:
  3311 00001803 68[621A]                 push checkreg_10
  3312 00001806 8D062B81                 lea  ax, [symbol]
  3313 0000180A 50                       push ax
  3314 0000180B E85443                   call eqstr
  3315 0000180E 83C404                   add  sp, 4
  3316 00001811 08C0                     or  al, al
  3317 00001813 0F840600                 je @@checkreg175
  3318 00001817 B81500                   mov ax, 21
  3319 0000181A E92602                   jmp @@retn
  3320                                  @@checkreg175:
  3321 0000181D 68[651A]                 push checkreg_11
  3322 00001820 8D062B81                 lea  ax, [symbol]
  3323 00001824 50                       push ax
  3324 00001825 E83A43                   call eqstr
  3325 00001828 83C404                   add  sp, 4
  3326 0000182B 08C0                     or  al, al
  3327 0000182D 0F840600                 je @@checkreg176
  3328 00001831 B81700                   mov ax, 23
  3329 00001834 E90C02                   jmp @@retn
  3330                                  
  3331                                  ;-346   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3332                                  
  3333                                  @@checkreg176:
  3334 00001837 68[681A]                 push checkreg_12
  3335 0000183A 8D062B81                 lea  ax, [symbol]
  3336 0000183E 50                       push ax
  3337 0000183F E82043                   call eqstr
  3338 00001842 83C404                   add  sp, 4
  3339 00001845 08C0                     or  al, al
  3340 00001847 0F840600                 je @@checkreg177
  3341 0000184B B81900                   mov ax, 25
  3342 0000184E E9F201                   jmp @@retn
  3343                                  @@checkreg177:
  3344 00001851 68[6B1A]                 push checkreg_13
  3345 00001854 8D062B81                 lea  ax, [symbol]
  3346 00001858 50                       push ax
  3347 00001859 E80643                   call eqstr
  3348 0000185C 83C404                   add  sp, 4
  3349 0000185F 08C0                     or  al, al
  3350 00001861 0F840600                 je @@checkreg178
  3351 00001865 B81B00                   mov ax, 27
  3352 00001868 E9D801                   jmp @@retn
  3353                                  
  3354                                  ;-347   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3355                                  
  3356                                  @@checkreg178:
  3357 0000186B 68[6E1A]                 push checkreg_14
  3358 0000186E 8D062B81                 lea  ax, [symbol]
  3359 00001872 50                       push ax
  3360 00001873 E8EC42                   call eqstr
  3361 00001876 83C404                   add  sp, 4
  3362 00001879 08C0                     or  al, al
  3363 0000187B 0F840600                 je @@checkreg179
  3364 0000187F B81D00                   mov ax, 29
  3365 00001882 E9BE01                   jmp @@retn
  3366                                  @@checkreg179:
  3367 00001885 68[711A]                 push checkreg_15
  3368 00001888 8D062B81                 lea  ax, [symbol]
  3369 0000188C 50                       push ax
  3370 0000188D E8D242                   call eqstr
  3371 00001890 83C404                   add  sp, 4
  3372 00001893 08C0                     or  al, al
  3373 00001895 0F840600                 je @@checkreg180
  3374 00001899 B81F00                   mov ax, 31
  3375 0000189C E9A401                   jmp @@retn
  3376                                  
  3377                                  ;-348   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3378                                  
  3379                                  @@checkreg180:
  3380 0000189F 68[741A]                 push checkreg_16
  3381 000018A2 8D062B81                 lea  ax, [symbol]
  3382 000018A6 50                       push ax
  3383 000018A7 E8B842                   call eqstr
  3384 000018AA 83C404                   add  sp, 4
  3385 000018AD 08C0                     or  al, al
  3386 000018AF 0F840600                 je @@checkreg181
  3387 000018B3 B82100                   mov ax, 33
  3388 000018B6 E98A01                   jmp @@retn
  3389                                  @@checkreg181:
  3390 000018B9 68[771A]                 push checkreg_17
  3391 000018BC 8D062B81                 lea  ax, [symbol]
  3392 000018C0 50                       push ax
  3393 000018C1 E89E42                   call eqstr
  3394 000018C4 83C404                   add  sp, 4
  3395 000018C7 08C0                     or  al, al
  3396 000018C9 0F840600                 je @@checkreg182
  3397 000018CD B82300                   mov ax, 35
  3398 000018D0 E97001                   jmp @@retn
  3399                                  
  3400                                  ;-349   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3401                                  
  3402                                  @@checkreg182:
  3403 000018D3 68[7A1A]                 push checkreg_18
  3404 000018D6 8D062B81                 lea  ax, [symbol]
  3405 000018DA 50                       push ax
  3406 000018DB E88442                   call eqstr
  3407 000018DE 83C404                   add  sp, 4
  3408 000018E1 08C0                     or  al, al
  3409 000018E3 0F840600                 je @@checkreg183
  3410 000018E7 B82500                   mov ax, 37
  3411 000018EA E95601                   jmp @@retn
  3412                                  @@checkreg183:
  3413 000018ED 68[7D1A]                 push checkreg_19
  3414 000018F0 8D062B81                 lea  ax, [symbol]
  3415 000018F4 50                       push ax
  3416 000018F5 E86A42                   call eqstr
  3417 000018F8 83C404                   add  sp, 4
  3418 000018FB 08C0                     or  al, al
  3419 000018FD 0F840600                 je @@checkreg184
  3420 00001901 B82700                   mov ax, 39
  3421 00001904 E93C01                   jmp @@retn
  3422                                  
  3423                                  ;-350   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3424                                  
  3425                                  @@checkreg184:
  3426 00001907 68[801A]                 push checkreg_20
  3427 0000190A 8D062B81                 lea  ax, [symbol]
  3428 0000190E 50                       push ax
  3429 0000190F E85042                   call eqstr
  3430 00001912 83C404                   add  sp, 4
  3431 00001915 08C0                     or  al, al
  3432 00001917 0F840600                 je @@checkreg185
  3433 0000191B B82900                   mov ax, 41
  3434 0000191E E92201                   jmp @@retn
  3435                                  @@checkreg185:
  3436 00001921 68[831A]                 push checkreg_21
  3437 00001924 8D062B81                 lea  ax, [symbol]
  3438 00001928 50                       push ax
  3439 00001929 E83642                   call eqstr
  3440 0000192C 83C404                   add  sp, 4
  3441 0000192F 08C0                     or  al, al
  3442 00001931 0F840600                 je @@checkreg186
  3443 00001935 B82B00                   mov ax, 43
  3444 00001938 E90801                   jmp @@retn
  3445                                  
  3446                                  ;-351   // (eqstr(symbol,"ip")) return 45;
  3447                                  
  3448                                  
  3449                                  ;-352   if (strlen(symbol) >   3) return 0;
  3450                                  
  3451                                  @@checkreg186:
  3452 0000193B 8D062B81                 lea  ax, [symbol]
  3453 0000193F 50                       push ax
  3454 00001940 E8D040                   call strlen
  3455 00001943 83C402                   add  sp, 2
  3456 00001946 83F803                   cmp ax, 3
  3457 00001949 0F8E0600                 jle @@checkreg187
  3458 0000194D B80000                   mov ax, 0
  3459 00001950 E9F000                   jmp @@retn
  3460                                  
  3461                                  ;-353   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3462                                  
  3463                                  @@checkreg187:
  3464 00001953 68[861A]                 push checkreg_22
  3465 00001956 8D062B81                 lea  ax, [symbol]
  3466 0000195A 50                       push ax
  3467 0000195B E80442                   call eqstr
  3468 0000195E 83C404                   add  sp, 4
  3469 00001961 08C0                     or  al, al
  3470 00001963 0F840600                 je @@checkreg188
  3471 00001967 B82F00                   mov ax, 47
  3472 0000196A E9D600                   jmp @@retn
  3473                                  @@checkreg188:
  3474 0000196D 68[8A1A]                 push checkreg_23
  3475 00001970 8D062B81                 lea  ax, [symbol]
  3476 00001974 50                       push ax
  3477 00001975 E8EA41                   call eqstr
  3478 00001978 83C404                   add  sp, 4
  3479 0000197B 08C0                     or  al, al
  3480 0000197D 0F840600                 je @@checkreg189
  3481 00001981 B83200                   mov ax, 50
  3482 00001984 E9BC00                   jmp @@retn
  3483                                  
  3484                                  ;-354   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3485                                  
  3486                                  @@checkreg189:
  3487 00001987 68[8E1A]                 push checkreg_24
  3488 0000198A 8D062B81                 lea  ax, [symbol]
  3489 0000198E 50                       push ax
  3490 0000198F E8D041                   call eqstr
  3491 00001992 83C404                   add  sp, 4
  3492 00001995 08C0                     or  al, al
  3493 00001997 0F840600                 je @@checkreg190
  3494 0000199B B83500                   mov ax, 53
  3495 0000199E E9A200                   jmp @@retn
  3496                                  @@checkreg190:
  3497 000019A1 68[921A]                 push checkreg_25
  3498 000019A4 8D062B81                 lea  ax, [symbol]
  3499 000019A8 50                       push ax
  3500 000019A9 E8B641                   call eqstr
  3501 000019AC 83C404                   add  sp, 4
  3502 000019AF 08C0                     or  al, al
  3503 000019B1 0F840600                 je @@checkreg191
  3504 000019B5 B83800                   mov ax, 56
  3505 000019B8 E98800                   jmp @@retn
  3506                                  
  3507                                  ;-355   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3508                                  
  3509                                  @@checkreg191:
  3510 000019BB 68[961A]                 push checkreg_26
  3511 000019BE 8D062B81                 lea  ax, [symbol]
  3512 000019C2 50                       push ax
  3513 000019C3 E89C41                   call eqstr
  3514 000019C6 83C404                   add  sp, 4
  3515 000019C9 08C0                     or  al, al
  3516 000019CB 0F840600                 je @@checkreg192
  3517 000019CF B83B00                   mov ax, 59
  3518 000019D2 E96E00                   jmp @@retn
  3519                                  @@checkreg192:
  3520 000019D5 68[9A1A]                 push checkreg_27
  3521 000019D8 8D062B81                 lea  ax, [symbol]
  3522 000019DC 50                       push ax
  3523 000019DD E88241                   call eqstr
  3524 000019E0 83C404                   add  sp, 4
  3525 000019E3 08C0                     or  al, al
  3526 000019E5 0F840600                 je @@checkreg193
  3527 000019E9 B83E00                   mov ax, 62
  3528 000019EC E95400                   jmp @@retn
  3529                                  
  3530                                  ;-356   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3531                                  
  3532                                  @@checkreg193:
  3533 000019EF 68[9E1A]                 push checkreg_28
  3534 000019F2 8D062B81                 lea  ax, [symbol]
  3535 000019F6 50                       push ax
  3536 000019F7 E86841                   call eqstr
  3537 000019FA 83C404                   add  sp, 4
  3538 000019FD 08C0                     or  al, al
  3539 000019FF 0F840600                 je @@checkreg194
  3540 00001A03 B84100                   mov ax, 65
  3541 00001A06 E93A00                   jmp @@retn
  3542                                  @@checkreg194:
  3543 00001A09 68[A21A]                 push checkreg_29
  3544 00001A0C 8D062B81                 lea  ax, [symbol]
  3545 00001A10 50                       push ax
  3546 00001A11 E84E41                   call eqstr
  3547 00001A14 83C404                   add  sp, 4
  3548 00001A17 08C0                     or  al, al
  3549 00001A19 0F840600                 je @@checkreg195
  3550 00001A1D B84400                   mov ax, 68
  3551 00001A20 E92000                   jmp @@retn
  3552                                  
  3553                                  ;-357   if (eqstr(symbol,"cr0")) return 71;
  3554                                  
  3555                                  @@checkreg195:
  3556 00001A23 68[A61A]                 push checkreg_30
  3557 00001A26 8D062B81                 lea  ax, [symbol]
  3558 00001A2A 50                       push ax
  3559 00001A2B E83441                   call eqstr
  3560 00001A2E 83C404                   add  sp, 4
  3561 00001A31 08C0                     or  al, al
  3562 00001A33 0F840600                 je @@checkreg196
  3563 00001A37 B84700                   mov ax, 71
  3564 00001A3A E90600                   jmp @@retn
  3565                                  
  3566                                  ;-358   return 0;   }
  3567                                  
  3568                                  @@checkreg196:
  3569 00001A3D B80000                   mov ax, 0
  3570 00001A40 E90000                   jmp @@retn
  3571                                  
  3572                                  ;-359 char printregstr[]
  3573                                  
  3574                                  @@retn:
  3575 00001A43 C3                       ret
  3576                                  ; ENDP
  3577 00001A44 616C00                  checkreg_0 db "al",0
  3578 00001A47 636C00                  checkreg_1 db "cl",0
  3579 00001A4A 646C00                  checkreg_2 db "dl",0
  3580 00001A4D 626C00                  checkreg_3 db "bl",0
  3581 00001A50 616800                  checkreg_4 db "ah",0
  3582 00001A53 636800                  checkreg_5 db "ch",0
  3583 00001A56 646800                  checkreg_6 db "dh",0
  3584 00001A59 626800                  checkreg_7 db "bh",0
  3585 00001A5C 617800                  checkreg_8 db "ax",0
  3586 00001A5F 637800                  checkreg_9 db "cx",0
  3587 00001A62 647800                  checkreg_10 db "dx",0
  3588 00001A65 627800                  checkreg_11 db "bx",0
  3589 00001A68 737000                  checkreg_12 db "sp",0
  3590 00001A6B 627000                  checkreg_13 db "bp",0
  3591 00001A6E 736900                  checkreg_14 db "si",0
  3592 00001A71 646900                  checkreg_15 db "di",0
  3593 00001A74 657300                  checkreg_16 db "es",0
  3594 00001A77 637300                  checkreg_17 db "cs",0
  3595 00001A7A 737300                  checkreg_18 db "ss",0
  3596 00001A7D 647300                  checkreg_19 db "ds",0
  3597 00001A80 667300                  checkreg_20 db "fs",0
  3598 00001A83 677300                  checkreg_21 db "gs",0
  3599 00001A86 65617800                checkreg_22 db "eax",0
  3600 00001A8A 65637800                checkreg_23 db "ecx",0
  3601 00001A8E 65647800                checkreg_24 db "edx",0
  3602 00001A92 65627800                checkreg_25 db "ebx",0
  3603 00001A96 65737000                checkreg_26 db "esp",0
  3604 00001A9A 65627000                checkreg_27 db "ebp",0
  3605 00001A9E 65736900                checkreg_28 db "esi",0
  3606 00001AA2 65646900                checkreg_29 db "edi",0
  3607 00001AA6 63723000                checkreg_30 db "cr0",0
  3608                                  
  3609                                  ;-360 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  3610                                  
  3611 00001AAA 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  3612 00001AB3 616863686468626861-
  3613 00001ABC 786378647862787370-
  3614 00001AC5 627073696469657363-
  3615 00001ACE 737373647366736773-
  3616 00001AD7 697065617865637865-
  3617 00001AE0 647865627865737065-
  3618 00001AE9 627065736965646963-
  3619 00001AF2 723000             
  3620                                  
  3621                                  ;-361 //          1         2         3         4         5         6         7
  3622                                  
  3623                                  
  3624                                  ;-362 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  3625                                  
  3626                                  
  3627                                  ;-363 int printreg(int i) {  unsigned int k; unsigned char c;
  3628                                  
  3629                                  
  3630                                  printreg:  ; *** PROC ***
  3631                                  
  3632                                  ;-364   k = &printregstr + i; c=*k; prc(c); i++;
  3633                                  
  3634                                  ;Function : printreg, Number of local variables: 3
  3635                                  ;   # type sign width addr used name   list of local variables
  3636                                  ;  200 var sign word   363 NULL i = bp+4
  3637                                  ;  201 var unsg word   363 NULL k = bp-2
  3638                                  ;  202 var unsg byte   363 NULL c = bp-4;
  3639 00001AF5 C8040000                 ENTER  4,0
  3640 00001AF9 B8[AA1A]                 mov ax, printregstr
  3641 00001AFC 034604                   add ax, [bp+4]
  3642 00001AFF 8946FE                   mov [bp-2], ax
  3643 00001B02 8B5EFE                   mov bx, [bp-2]
  3644 00001B05 8B07                     mov ax, [bx]
  3645 00001B07 8846FC                   mov [bp-4], al
  3646 00001B0A 8A46FC                   mov al, byte [bp-4]
  3647 00001B0D B400                     mov ah, 0
  3648 00001B0F 50                       push ax
  3649 00001B10 E8EE2E                   call prc
  3650 00001B13 83C402                   add  sp, 2
  3651 00001B16 FF4604                   inc  word[bp+4]
  3652                                  
  3653                                  ;-365   k = &printregstr + i; c=*k; prc(c);
  3654                                  
  3655 00001B19 B8[AA1A]                 mov ax, printregstr
  3656 00001B1C 034604                   add ax, [bp+4]
  3657 00001B1F 8946FE                   mov [bp-2], ax
  3658 00001B22 8B5EFE                   mov bx, [bp-2]
  3659 00001B25 8B07                     mov ax, [bx]
  3660 00001B27 8846FC                   mov [bp-4], al
  3661 00001B2A 8A46FC                   mov al, byte [bp-4]
  3662 00001B2D B400                     mov ah, 0
  3663 00001B2F 50                       push ax
  3664 00001B30 E8CE2E                   call prc
  3665 00001B33 83C402                   add  sp, 2
  3666                                  
  3667                                  ;-366   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  3668                                  
  3669 00001B36 8B4604                   mov ax, [bp+4]
  3670 00001B39 83F82F                   cmp ax, 47
  3671 00001B3C 0F8E2000                 jle @@printreg197
  3672 00001B40 FF4604                   inc  word[bp+4]
  3673 00001B43 B8[AA1A]                 mov ax, printregstr
  3674 00001B46 034604                   add ax, [bp+4]
  3675 00001B49 8946FE                   mov [bp-2], ax
  3676 00001B4C 8B5EFE                   mov bx, [bp-2]
  3677 00001B4F 8B07                     mov ax, [bx]
  3678 00001B51 8846FC                   mov [bp-4], al
  3679 00001B54 8A46FC                   mov al, byte [bp-4]
  3680 00001B57 B400                     mov ah, 0
  3681 00001B59 50                       push ax
  3682 00001B5A E8A42E                   call prc
  3683 00001B5D 83C402                   add  sp, 2
  3684                                  
  3685                                  ;-367 }
  3686                                  
  3687                                  @@printreg197:
  3688                                  
  3689                                  ;-368 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  3690 00001B60 C9                       LEAVE
  3691 00001B61 C3                       ret
  3692                                  ; ENDP
  3693 00001B62 0000                    evalue dw 0
  3694 00001B64 0A00                    exprtype dw 10
  3695                                  
  3696                                  ;-369 int expr(int isRight)
  3697                                  
  3698                                  
  3699                                  expr:  ; *** PROC ***
  3700                                  
  3701                                  ;-370 { int mode; int id1;     int ixarr; int ixconst;
  3702                                  
  3703                                  
  3704                                  ;-371   int ids;  int isCONST; int i;     unsigned char *p;
  3705                                  
  3706                                  
  3707                                  ;-372   if (istoken(T_CONST)) { evalue=lexval;
  3708                                  
  3709                                  ;Function : expr, Number of local variables: 9
  3710                                  ;   # type sign width addr used name   list of local variables
  3711                                  ;  200 var sign word   369 NULL isRight = bp+4
  3712                                  ;  201 var sign word   370 NULL mode = bp-2
  3713                                  ;  202 var sign word   370 NULL id1 = bp-4
  3714                                  ;  203 var sign word   370 NULL ixarr = bp-6
  3715                                  ;  204 var sign word   370 NULL ixconst = bp-8
  3716                                  ;  205 var sign word   371 NULL ids = bp-10
  3717                                  ;  206 var sign word   371 NULL isCONST = bp-12
  3718                                  ;  207 var sign word   371 NULL i = bp-14
  3719                                  ;  208 ptr unsg byte   371 NULL p = bp-16;
  3720 00001B66 C8100000                 ENTER  16,0
  3721 00001B6A 680101                   push 257
  3722 00001B6D E8C32D                   call istoken
  3723 00001B70 83C402                   add  sp, 2
  3724 00001B73 08C0                     or  al, al
  3725 00001B75 0F841F00                 je @@expr198
  3726 00001B79 A1[3900]                 mov ax, [lexval]
  3727 00001B7C A3[621B]                 mov word [evalue], ax
  3728                                  
  3729                                  ;-373     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  3730                                  
  3731 00001B7F 68[2A1F]                 push expr_0
  3732 00001B82 E8EC2E                   call prs
  3733 00001B85 83C402                   add  sp, 2
  3734 00001B88 FF36[3900]               push word [lexval]
  3735 00001B8C E83C30                   call prunsign1
  3736 00001B8F 83C402                   add  sp, 2
  3737 00001B92 B80400                   mov ax, 4
  3738 00001B95 E99003                   jmp @@retn
  3739                                  
  3740                                  ;-374   mode=typeName(); /*0=V,1=*,2=&*/
  3741                                  
  3742                                  @@expr198:
  3743 00001B98 E8D7EC                   call typeName
  3744 00001B9B 8946FE                   mov [bp-2], ax
  3745                                  
  3746                                  ;-375   ireg1=checkreg();
  3747                                  
  3748 00001B9E E846FB                   call checkreg
  3749 00001BA1 A3[B70E]                 mov word [ireg1], ax
  3750                                  
  3751                                  ;-376   if (ireg1) { doreg1(0); return; }
  3752                                  
  3753 00001BA4 A1[B70E]                 mov ax, [ireg1]
  3754 00001BA7 08C0                     or  al, al
  3755 00001BA9 0F840B00                 je @@expr199
  3756 00001BAD 6A00                     push 0
  3757 00001BAF E849F9                   call doreg1
  3758 00001BB2 83C402                   add  sp, 2
  3759 00001BB5 E97003                   jmp @@retn
  3760                                  
  3761                                  ;-377   if (token=='(')  {docall1(); goto e1; }
  3762                                  
  3763                                  @@expr199:
  3764 00001BB8 A1[2500]                 mov ax, [token]
  3765 00001BBB 83F828                   cmp ax, 40
  3766 00001BBE 0F850600                 jne @@expr200
  3767 00001BC2 E8BB0F                   call docall1
  3768 00001BC5 E95602                   jmp @@e1
  3769                                  
  3770                                  ;-378   if (isreg()) goto e1;
  3771                                  
  3772                                  @@expr200:
  3773 00001BC8 E8CB07                   call isreg
  3774 00001BCB 08C0                     or  al, al
  3775 00001BCD 0F840300                 je @@expr201
  3776 00001BD1 E94A02                   jmp @@e1
  3777                                  
  3778                                  ;-379 
  3779                                  
  3780                                  
  3781                                  ;-380   id1=searchname(); gettypes(id1); ids=signi;
  3782                                  
  3783                                  @@expr201:
  3784 00001BD4 E8CCEB                   call searchname
  3785 00001BD7 8946FC                   mov [bp-4], ax
  3786 00001BDA FF76FC                   push word [bp-4]
  3787 00001BDD E885EA                   call gettypes
  3788 00001BE0 83C402                   add  sp, 2
  3789 00001BE3 A1[3E00]                 mov ax, [signi]
  3790 00001BE6 8946F6                   mov [bp-10], ax
  3791                                  
  3792                                  ;-381   ixarr=0;  ixconst=0;
  3793                                  
  3794 00001BE9 B80000                   mov ax, 0
  3795 00001BEC 8946FA                   mov [bp-6], ax
  3796 00001BEF B80000                   mov ax, 0
  3797 00001BF2 8946F8                   mov [bp-8], ax
  3798                                  
  3799                                  ;-382     if (istoken('[')) { if (istoken(T_CONST)) {
  3800                                  
  3801 00001BF5 6A5B                     push 91
  3802 00001BF7 E8392D                   call istoken
  3803 00001BFA 83C402                   add  sp, 2
  3804 00001BFD 08C0                     or  al, al
  3805 00001BFF 0F845900                 je @@expr202
  3806 00001C03 680101                   push 257
  3807 00001C06 E82A2D                   call istoken
  3808 00001C09 83C402                   add  sp, 2
  3809 00001C0C 08C0                     or  al, al
  3810 00001C0E 0F841700                 je @@expr203
  3811                                  
  3812                                  ;-383       ixconst=1; ixarr=lexval; expect(']');  }
  3813                                  
  3814 00001C12 B80100                   mov ax, 1
  3815 00001C15 8946F8                   mov [bp-8], ax
  3816 00001C18 A1[3900]                 mov ax, [lexval]
  3817 00001C1B 8946FA                   mov [bp-6], ax
  3818 00001C1E 6A5D                     push 93
  3819 00001C20 E8322D                   call expect
  3820 00001C23 83C402                   add  sp, 2
  3821                                  
  3822                                  ;-384     else {ixarr=searchname(); expect(T_NAME); expect(']');
  3823                                  
  3824 00001C26 E93300                   jmp @@expr204
  3825                                  @@expr203:
  3826 00001C29 E877EB                   call searchname
  3827 00001C2C 8946FA                   mov [bp-6], ax
  3828 00001C2F 680001                   push 256
  3829 00001C32 E8202D                   call expect
  3830 00001C35 83C402                   add  sp, 2
  3831 00001C38 6A5D                     push 93
  3832 00001C3A E8182D                   call expect
  3833 00001C3D 83C402                   add  sp, 2
  3834                                  
  3835                                  ;-385     gettypes(ixarr);
  3836                                  
  3837 00001C40 FF76FA                   push word [bp-6]
  3838 00001C43 E81FEA                   call gettypes
  3839 00001C46 83C402                   add  sp, 2
  3840                                  
  3841                                  ;-386     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  3842                                  
  3843 00001C49 A1[4100]                 mov ax, [widthi]
  3844 00001C4C 83F802                   cmp ax, 2
  3845 00001C4F 0F840900                 je  @@expr205
  3846 00001C53 68[361F]                 push expr_1
  3847 00001C56 E80131                   call error1
  3848 00001C59 83C402                   add  sp, 2
  3849                                  @@expr205:
  3850                                  @@expr204:
  3851                                  
  3852                                  ;-387   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  3853                                  
  3854                                  @@expr202:
  3855 00001C5C 68C304                   push 1219
  3856 00001C5F E8D12C                   call istoken
  3857 00001C62 83C402                   add  sp, 2
  3858 00001C65 08C0                     or  al, al
  3859 00001C67 0F845800                 je @@expr206
  3860 00001C6B 8B46FE                   mov ax, [bp-2]
  3861 00001C6E 08C0                     or  al, al
  3862 00001C70 0F840900                 je @@expr207
  3863 00001C74 68[591F]                 push expr_2
  3864 00001C77 E8E030                   call error1
  3865 00001C7A 83C402                   add  sp, 2
  3866                                  
  3867                                  ;-388      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  3868                                  
  3869                                  @@expr207:
  3870 00001C7D 68[691F]                 push expr_3
  3871 00001C80 E8EE2D                   call prs
  3872 00001C83 83C402                   add  sp, 2
  3873 00001C86 A1[4400]                 mov ax, [wi]
  3874 00001C89 83F802                   cmp ax, 2
  3875 00001C8C 0F850C00                 jne @@expr208
  3876 00001C90 68[721F]                 push expr_4
  3877 00001C93 E8DB2D                   call prs
  3878 00001C96 83C402                   add  sp, 2
  3879 00001C99 E90900                   jmp @@expr209
  3880                                  @@expr208:
  3881 00001C9C 68[771F]                 push expr_5
  3882 00001C9F E8CF2D                   call prs
  3883 00001CA2 83C402                   add  sp, 2
  3884                                  
  3885                                  ;-389        if(NASM==0)prs(" ptr "); v(id1); goto e1;}
  3886                                  
  3887                                  @@expr209:
  3888 00001CA5 A0[1500]                 mov al, [NASM]
  3889 00001CA8 3C00                     cmp al, 0
  3890 00001CAA 0F850900                 jne @@expr210
  3891 00001CAE 68[7C1F]                 push expr_6
  3892 00001CB1 E8BD2D                   call prs
  3893 00001CB4 83C402                   add  sp, 2
  3894                                  @@expr210:
  3895 00001CB7 FF76FC                   push word [bp-4]
  3896 00001CBA E81EE4                   call v
  3897 00001CBD 83C402                   add  sp, 2
  3898 00001CC0 E95B01                   jmp @@e1
  3899                                  
  3900                                  ;-390   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  3901                                  
  3902                                  @@expr206:
  3903 00001CC3 68C904                   push 1225
  3904 00001CC6 E86A2C                   call istoken
  3905 00001CC9 83C402                   add  sp, 2
  3906 00001CCC 08C0                     or  al, al
  3907 00001CCE 0F845800                 je @@expr211
  3908 00001CD2 8B46FE                   mov ax, [bp-2]
  3909 00001CD5 08C0                     or  al, al
  3910 00001CD7 0F840900                 je @@expr212
  3911 00001CDB 68[821F]                 push expr_7
  3912 00001CDE E87930                   call error1
  3913 00001CE1 83C402                   add  sp, 2
  3914                                  
  3915                                  ;-391      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  3916                                  
  3917                                  @@expr212:
  3918 00001CE4 68[921F]                 push expr_8
  3919 00001CE7 E8872D                   call prs
  3920 00001CEA 83C402                   add  sp, 2
  3921 00001CED A1[4400]                 mov ax, [wi]
  3922 00001CF0 83F802                   cmp ax, 2
  3923 00001CF3 0F850C00                 jne @@expr213
  3924 00001CF7 68[9B1F]                 push expr_9
  3925 00001CFA E8742D                   call prs
  3926 00001CFD 83C402                   add  sp, 2
  3927 00001D00 E90900                   jmp @@expr214
  3928                                  @@expr213:
  3929 00001D03 68[A01F]                 push expr_10
  3930 00001D06 E8682D                   call prs
  3931 00001D09 83C402                   add  sp, 2
  3932                                  
  3933                                  ;-392        if(NASM==0)prs(" ptr "); v(id1); goto e1;}
  3934                                  
  3935                                  @@expr214:
  3936 00001D0C A0[1500]                 mov al, [NASM]
  3937 00001D0F 3C00                     cmp al, 0
  3938 00001D11 0F850900                 jne @@expr215
  3939 00001D15 68[A51F]                 push expr_11
  3940 00001D18 E8562D                   call prs
  3941 00001D1B 83C402                   add  sp, 2
  3942                                  @@expr215:
  3943 00001D1E FF76FC                   push word [bp-4]
  3944 00001D21 E8B7E3                   call v
  3945 00001D24 83C402                   add  sp, 2
  3946 00001D27 E9F400                   jmp @@e1
  3947                                  
  3948                                  ;-393        
  3949                                  
  3950                                  
  3951                                  ;-394   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  3952                                  
  3953                                  @@expr211:
  3954 00001D2A 68CE04                   push 1230
  3955 00001D2D E8032C                   call istoken
  3956 00001D30 83C402                   add  sp, 2
  3957 00001D33 08C0                     or  al, al
  3958 00001D35 0F841200                 je @@expr216
  3959 00001D39 FF76FC                   push word [bp-4]
  3960 00001D3C FF76FE                   push word [bp-2]
  3961 00001D3F 68[AB1F]                 push expr_12
  3962 00001D42 E8B402                   call compoundass
  3963 00001D45 83C406                   add  sp, 6
  3964 00001D48 E9D300                   jmp @@e1
  3965                                  
  3966                                  ;-395   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  3967                                  
  3968                                  @@expr216:
  3969 00001D4B 68CF04                   push 1231
  3970 00001D4E E8E22B                   call istoken
  3971 00001D51 83C402                   add  sp, 2
  3972 00001D54 08C0                     or  al, al
  3973 00001D56 0F841200                 je @@expr217
  3974 00001D5A FF76FC                   push word [bp-4]
  3975 00001D5D FF76FE                   push word [bp-2]
  3976 00001D60 68[AF1F]                 push expr_13
  3977 00001D63 E89302                   call compoundass
  3978 00001D66 83C406                   add  sp, 6
  3979 00001D69 E9B200                   jmp @@e1
  3980                                  
  3981                                  ;-396   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  3982                                  
  3983                                  @@expr217:
  3984 00001D6C 68D204                   push 1234
  3985 00001D6F E8C12B                   call istoken
  3986 00001D72 83C402                   add  sp, 2
  3987 00001D75 08C0                     or  al, al
  3988 00001D77 0F841200                 je @@expr218
  3989 00001D7B FF76FC                   push word [bp-4]
  3990 00001D7E FF76FE                   push word [bp-2]
  3991 00001D81 68[B31F]                 push expr_14
  3992 00001D84 E87202                   call compoundass
  3993 00001D87 83C406                   add  sp, 6
  3994 00001D8A E99100                   jmp @@e1
  3995                                  
  3996                                  ;-397   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  3997                                  
  3998                                  @@expr218:
  3999 00001D8D 68D304                   push 1235
  4000 00001D90 E8A02B                   call istoken
  4001 00001D93 83C402                   add  sp, 2
  4002 00001D96 08C0                     or  al, al
  4003 00001D98 0F841200                 je @@expr219
  4004 00001D9C FF76FC                   push word [bp-4]
  4005 00001D9F FF76FE                   push word [bp-2]
  4006 00001DA2 68[B71F]                 push expr_15
  4007 00001DA5 E85102                   call compoundass
  4008 00001DA8 83C406                   add  sp, 6
  4009 00001DAB E97000                   jmp @@e1
  4010                                  
  4011                                  ;-398   if (istoken(T_MULASS    )) {error1("not implemented");}
  4012                                  
  4013                                  @@expr219:
  4014 00001DAE 68D004                   push 1232
  4015 00001DB1 E87F2B                   call istoken
  4016 00001DB4 83C402                   add  sp, 2
  4017 00001DB7 08C0                     or  al, al
  4018 00001DB9 0F840900                 je @@expr220
  4019 00001DBD 68[BA1F]                 push expr_16
  4020 00001DC0 E8972F                   call error1
  4021 00001DC3 83C402                   add  sp, 2
  4022                                  
  4023                                  ;-399   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4024                                  
  4025                                  @@expr220:
  4026 00001DC6 68D104                   push 1233
  4027 00001DC9 E8672B                   call istoken
  4028 00001DCC 83C402                   add  sp, 2
  4029 00001DCF 08C0                     or  al, al
  4030 00001DD1 0F840900                 je @@expr221
  4031 00001DD5 68[CA1F]                 push expr_17
  4032 00001DD8 E87F2F                   call error1
  4033 00001DDB 83C402                   add  sp, 2
  4034                                  
  4035                                  ;-400 
  4036                                  
  4037                                  
  4038                                  ;-401   if (istoken('=')) { exprtype= expr(1); 
  4039                                  
  4040                                  @@expr221:
  4041 00001DDE 6A3D                     push 61
  4042 00001DE0 E8502B                   call istoken
  4043 00001DE3 83C402                   add  sp, 2
  4044 00001DE6 08C0                     or  al, al
  4045 00001DE8 0F842000                 je @@expr222
  4046 00001DEC 6A01                     push 1
  4047 00001DEE E875FD                   call expr
  4048 00001DF1 83C402                   add  sp, 2
  4049 00001DF4 A3[641B]                 mov word [exprtype], ax
  4050                                  
  4051                                  ;-402   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4052                                  
  4053 00001DF7 FF76F8                   push word [bp-8]
  4054 00001DFA FF76FA                   push word [bp-6]
  4055 00001DFD FF76FC                   push word [bp-4]
  4056 00001E00 FF76FE                   push word [bp-2]
  4057 00001E03 E88208                   call doassign
  4058 00001E06 83C408                   add  sp, 8
  4059 00001E09 E91200                   jmp @@e1
  4060                                  
  4061                                  ;-403   dovar1(mode, "mov", ixarr, id1);
  4062                                  
  4063                                  @@expr222:
  4064 00001E0C FF76FC                   push word [bp-4]
  4065 00001E0F FF76FA                   push word [bp-6]
  4066 00001E12 68[DA1F]                 push expr_18
  4067 00001E15 FF76FE                   push word [bp-2]
  4068 00001E18 E89802                   call dovar1
  4069 00001E1B 83C408                   add  sp, 8
  4070                                  
  4071                                  ;-404   
  4072                                  
  4073                                  
  4074                                  ;-405 e1:    if (istoken('+')) rterm("add");
  4075                                  
  4076                                  @@e1:
  4077 00001E1E 6A2B                     push 43
  4078 00001E20 E8102B                   call istoken
  4079 00001E23 83C402                   add  sp, 2
  4080 00001E26 08C0                     or  al, al
  4081 00001E28 0F840C00                 je @@expr223
  4082 00001E2C 68[DE1F]                 push expr_19
  4083 00001E2F E84B04                   call rterm
  4084 00001E32 83C402                   add  sp, 2
  4085                                  
  4086                                  ;-406   else if (istoken('-')) rterm("sub" );
  4087                                  
  4088 00001E35 E9CF00                   jmp @@expr224
  4089                                  @@expr223:
  4090 00001E38 6A2D                     push 45
  4091 00001E3A E8F62A                   call istoken
  4092 00001E3D 83C402                   add  sp, 2
  4093 00001E40 08C0                     or  al, al
  4094 00001E42 0F840C00                 je @@expr225
  4095 00001E46 68[E21F]                 push expr_20
  4096 00001E49 E83104                   call rterm
  4097 00001E4C 83C402                   add  sp, 2
  4098                                  
  4099                                  ;-407   else if (istoken('&')) rterm("and" );
  4100                                  
  4101 00001E4F E9B500                   jmp @@expr226
  4102                                  @@expr225:
  4103 00001E52 6A26                     push 38
  4104 00001E54 E8DC2A                   call istoken
  4105 00001E57 83C402                   add  sp, 2
  4106 00001E5A 08C0                     or  al, al
  4107 00001E5C 0F840C00                 je @@expr227
  4108 00001E60 68[E61F]                 push expr_21
  4109 00001E63 E81704                   call rterm
  4110 00001E66 83C402                   add  sp, 2
  4111                                  
  4112                                  ;-408   else if (istoken('|')) rterm("or" );  
  4113                                  
  4114 00001E69 E99B00                   jmp @@expr228
  4115                                  @@expr227:
  4116 00001E6C 6A7C                     push 124
  4117 00001E6E E8C22A                   call istoken
  4118 00001E71 83C402                   add  sp, 2
  4119 00001E74 08C0                     or  al, al
  4120 00001E76 0F840C00                 je @@expr229
  4121 00001E7A 68[EA1F]                 push expr_22
  4122 00001E7D E8FD03                   call rterm
  4123 00001E80 83C402                   add  sp, 2
  4124                                  
  4125                                  ;-409   else if (istoken(T_LESSLESS)) rterm("shl");
  4126                                  
  4127 00001E83 E98100                   jmp @@expr230
  4128                                  @@expr229:
  4129 00001E86 68D804                   push 1240
  4130 00001E89 E8A72A                   call istoken
  4131 00001E8C 83C402                   add  sp, 2
  4132 00001E8F 08C0                     or  al, al
  4133 00001E91 0F840C00                 je @@expr231
  4134 00001E95 68[ED1F]                 push expr_23
  4135 00001E98 E8E203                   call rterm
  4136 00001E9B 83C402                   add  sp, 2
  4137                                  
  4138                                  ;-410   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4139                                  
  4140 00001E9E E96600                   jmp @@expr232
  4141                                  @@expr231:
  4142 00001EA1 68D904                   push 1241
  4143 00001EA4 E88C2A                   call istoken
  4144 00001EA7 83C402                   add  sp, 2
  4145 00001EAA 08C0                     or  al, al
  4146 00001EAC 0F840C00                 je @@expr233
  4147 00001EB0 68[F11F]                 push expr_24
  4148 00001EB3 E8C703                   call rterm
  4149 00001EB6 83C402                   add  sp, 2
  4150                                  
  4151                                  ;-411   else if (istoken('*')) domul (ids);
  4152                                  
  4153 00001EB9 E94B00                   jmp @@expr234
  4154                                  @@expr233:
  4155 00001EBC 6A2A                     push 42
  4156 00001EBE E8722A                   call istoken
  4157 00001EC1 83C402                   add  sp, 2
  4158 00001EC4 08C0                     or  al, al
  4159 00001EC6 0F840C00                 je @@expr235
  4160 00001ECA FF76F6                   push word [bp-10]
  4161 00001ECD E8460A                   call domul
  4162 00001ED0 83C402                   add  sp, 2
  4163                                  
  4164                                  ;-412   else if (istoken('/')) doidiv(ids);
  4165                                  
  4166 00001ED3 E93100                   jmp @@expr236
  4167                                  @@expr235:
  4168 00001ED6 6A2F                     push 47
  4169 00001ED8 E8582A                   call istoken
  4170 00001EDB 83C402                   add  sp, 2
  4171 00001EDE 08C0                     or  al, al
  4172 00001EE0 0F840C00                 je @@expr237
  4173 00001EE4 FF76F6                   push word [bp-10]
  4174 00001EE7 E8CD0A                   call doidiv
  4175 00001EEA 83C402                   add  sp, 2
  4176                                  
  4177                                  ;-413   else if (istoken('%')) domod (ids);
  4178                                  
  4179 00001EED E91700                   jmp @@expr238
  4180                                  @@expr237:
  4181 00001EF0 6A25                     push 37
  4182 00001EF2 E83E2A                   call istoken
  4183 00001EF5 83C402                   add  sp, 2
  4184 00001EF8 08C0                     or  al, al
  4185 00001EFA 0F840900                 je @@expr239
  4186 00001EFE FF76F6                   push word [bp-10]
  4187 00001F01 E8560C                   call domod
  4188 00001F04 83C402                   add  sp, 2
  4189                                  
  4190                                  ;-414   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4191                                  
  4192                                  @@expr239:
  4193                                  @@expr238:
  4194                                  @@expr236:
  4195                                  @@expr234:
  4196                                  @@expr232:
  4197                                  @@expr230:
  4198                                  @@expr228:
  4199                                  @@expr226:
  4200                                  @@expr224:
  4201 00001F07 E8FB21                   call isrelational
  4202 00001F0A 08C0                     or  al, al
  4203 00001F0C 0F841200                 je @@expr240
  4204 00001F10 68[F51F]                 push expr_25
  4205 00001F13 E86703                   call rterm
  4206 00001F16 83C402                   add  sp, 2
  4207 00001F19 FF76F6                   push word [bp-10]
  4208 00001F1C E8971E                   call cmpneg
  4209 00001F1F 83C402                   add  sp, 2
  4210                                  
  4211                                  ;-415   return 0;
  4212                                  
  4213                                  @@expr240:
  4214 00001F22 B80000                   mov ax, 0
  4215 00001F25 E90000                   jmp @@retn
  4216                                  
  4217                                  ;-416 }
  4218                                  
  4219                                  
  4220                                  ;-417 
  4221                                  
  4222                                  
  4223                                  ;-418 int compoundass(char *op, int mode, int id1) {
  4224                                  
  4225 00001F28 C9                      @@retn: LEAVE
  4226 00001F29 C3                       ret
  4227                                  ; ENDP
  4228 00001F2A 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4229 00001F33 2C2000             
  4230 00001F36 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4231 00001F3F 78206D757373205A61-
  4232 00001F48 686C206F6465722069-
  4233 00001F51 6E74207365696E00   
  4234 00001F59 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4235 00001F62 726C6175627400     
  4236 00001F69 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4237 00001F72 776F726400              expr_4 db "word",0
  4238 00001F77 6279746500              expr_5 db "byte",0
  4239 00001F7C 207074722000            expr_6 db " ptr ",0
  4240 00001F82 4E7572207661722065-     expr_7 db "Nur var erlaubt",0
  4241 00001F8B 726C6175627400     
  4242 00001F92 5C6E20646563202000      expr_8 db "\n dec  ",0
  4243 00001F9B 776F726400              expr_9 db "word",0
  4244 00001FA0 6279746500              expr_10 db "byte",0
  4245 00001FA5 207074722000            expr_11 db " ptr ",0
  4246 00001FAB 61646400                expr_12 db "add",0
  4247 00001FAF 73756200                expr_13 db "sub",0
  4248 00001FB3 616E6400                expr_14 db "and",0
  4249 00001FB7 6F7200                  expr_15 db "or",0
  4250 00001FBA 6E6F7420696D706C65-     expr_16 db "not implemented",0
  4251 00001FC3 6D656E74656400     
  4252 00001FCA 6E6F7420696D706C65-     expr_17 db "not implemented",0
  4253 00001FD3 6D656E74656400     
  4254 00001FDA 6D6F7600                expr_18 db "mov",0
  4255 00001FDE 61646400                expr_19 db "add",0
  4256 00001FE2 73756200                expr_20 db "sub",0
  4257 00001FE6 616E6400                expr_21 db "and",0
  4258 00001FEA 6F7200                  expr_22 db "or",0
  4259 00001FED 73686C00                expr_23 db "shl",0
  4260 00001FF1 73687200                expr_24 db "shr",0
  4261 00001FF5 636D7000                expr_25 db "cmp",0
  4262                                  
  4263                                  compoundass:  ; *** PROC ***
  4264                                  
  4265                                  ;-419   if(mode) error1("only scalar Var allowed");
  4266                                  
  4267                                  ;Function : compoundass, Number of local variables: 3
  4268                                  ;   # type sign width addr used name   list of local variables
  4269                                  ;  200 ptr sign byte   418 NULL op = bp+4
  4270                                  ;  201 var sign word   418 NULL mode = bp+6
  4271                                  ;  202 var sign word   418 NULL id1 = bp+8;
  4272 00001FF9 C8000000                 ENTER  0,0
  4273 00001FFD 8B4606                   mov ax, [bp+6]
  4274 00002000 08C0                     or  al, al
  4275 00002002 0F840900                 je @@compoundass241
  4276 00002006 68[8520]                 push compoundass_0
  4277 00002009 E84E2D                   call error1
  4278 0000200C 83C402                   add  sp, 2
  4279                                  
  4280                                  ;-420   prnl(); prs(op); prs("  "); 
  4281                                  
  4282                                  @@compoundass241:
  4283 0000200F E8512A                   call prnl
  4284 00002012 FF7604                   push word [bp+4]
  4285 00002015 E8592A                   call prs
  4286 00002018 83C402                   add  sp, 2
  4287 0000201B 68[9D20]                 push compoundass_1
  4288 0000201E E8502A                   call prs
  4289 00002021 83C402                   add  sp, 2
  4290                                  
  4291                                  ;-421   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4292                                  
  4293 00002024 FF7608                   push word [bp+8]
  4294 00002027 E83BE6                   call gettypes
  4295 0000202A 83C402                   add  sp, 2
  4296 0000202D A1[4400]                 mov ax, [wi]
  4297 00002030 83F802                   cmp ax, 2
  4298 00002033 0F850C00                 jne @@compoundass242
  4299 00002037 68[A020]                 push compoundass_2
  4300 0000203A E8342A                   call prs
  4301 0000203D 83C402                   add  sp, 2
  4302 00002040 E90900                   jmp @@compoundass243
  4303                                  @@compoundass242:
  4304 00002043 68[A520]                 push compoundass_3
  4305 00002046 E8282A                   call prs
  4306 00002049 83C402                   add  sp, 2
  4307                                  
  4308                                  ;-422     if (NASM==0) prs(" ptr "); v(id1); prs(", ");
  4309                                  
  4310                                  @@compoundass243:
  4311 0000204C A0[1500]                 mov al, [NASM]
  4312 0000204F 3C00                     cmp al, 0
  4313 00002051 0F850900                 jne @@compoundass244
  4314 00002055 68[AA20]                 push compoundass_4
  4315 00002058 E8162A                   call prs
  4316 0000205B 83C402                   add  sp, 2
  4317                                  @@compoundass244:
  4318 0000205E FF7608                   push word [bp+8]
  4319 00002061 E877E0                   call v
  4320 00002064 83C402                   add  sp, 2
  4321 00002067 68[B020]                 push compoundass_5
  4322 0000206A E8042A                   call prs
  4323 0000206D 83C402                   add  sp, 2
  4324                                  
  4325                                  ;-423   expect(T_CONST); prunsign1(lexval);
  4326                                  
  4327 00002070 680101                   push 257
  4328 00002073 E8DF28                   call expect
  4329 00002076 83C402                   add  sp, 2
  4330 00002079 FF36[3900]               push word [lexval]
  4331 0000207D E84B2B                   call prunsign1
  4332 00002080 83C402                   add  sp, 2
  4333                                  
  4334                                  ;-424 }
  4335                                  
  4336                                  
  4337                                  ;-425 int dovar1(int mode, int op, int ixarr, int id1) { 
  4338 00002083 C9                       LEAVE
  4339 00002084 C3                       ret
  4340                                  ; ENDP
  4341 00002085 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4342 0000208E 61722056617220616C-
  4343 00002097 6C6F77656400       
  4344 0000209D 202000                  compoundass_1 db "  ",0
  4345 000020A0 776F726400              compoundass_2 db "word",0
  4346 000020A5 6279746500              compoundass_3 db "byte",0
  4347 000020AA 207074722000            compoundass_4 db " ptr ",0
  4348 000020B0 2C2000                  compoundass_5 db ", ",0
  4349                                  
  4350                                  dovar1:  ; *** PROC ***
  4351                                  
  4352                                  ;-426   gettypes(id1);
  4353                                  
  4354                                  ;Function : dovar1, Number of local variables: 4
  4355                                  ;   # type sign width addr used name   list of local variables
  4356                                  ;  200 var sign word   425 NULL mode = bp+4
  4357                                  ;  201 var sign word   425 NULL op = bp+6
  4358                                  ;  202 var sign word   425 NULL ixarr = bp+8
  4359                                  ;  203 var sign word   425 NULL id1 = bp+10;
  4360 000020B3 C8000000                 ENTER  0,0
  4361 000020B7 FF760A                   push word [bp+10]
  4362 000020BA E8A8E5                   call gettypes
  4363 000020BD 83C402                   add  sp, 2
  4364                                  
  4365                                  ;-427   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4366                                  
  4367 000020C0 8B4604                   mov ax, [bp+4]
  4368 000020C3 83F801                   cmp ax, 1
  4369 000020C6 0F854700                 jne @@dovar1245
  4370 000020CA 68[0822]                 push dovar1_0
  4371 000020CD E8A129                   call prs
  4372 000020D0 83C402                   add  sp, 2
  4373 000020D3 FF760A                   push word [bp+10]
  4374 000020D6 E802E0                   call v
  4375 000020D9 83C402                   add  sp, 2
  4376 000020DC E88429                   call prnl
  4377 000020DF FF7606                   push word [bp+6]
  4378 000020E2 E88C29                   call prs
  4379 000020E5 83C402                   add  sp, 2
  4380                                  
  4381                                  ;-428     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4382                                  
  4383 000020E8 A1[4100]                 mov ax, [widthi]
  4384 000020EB 83F801                   cmp ax, 1
  4385 000020EE 0F850900                 jne @@dovar1246
  4386 000020F2 68[1422]                 push dovar1_1
  4387 000020F5 E87929                   call prs
  4388 000020F8 83C402                   add  sp, 2
  4389                                  
  4390                                  ;-429     if(widthi == 2) prs(" ax, [bx]");
  4391                                  
  4392                                  @@dovar1246:
  4393 000020FB A1[4100]                 mov ax, [widthi]
  4394 000020FE 83F802                   cmp ax, 2
  4395 00002101 0F850900                 jne @@dovar1247
  4396 00002105 68[2A22]                 push dovar1_2
  4397 00002108 E86629                   call prs
  4398 0000210B 83C402                   add  sp, 2
  4399                                  
  4400                                  ;-430     return; }
  4401                                  
  4402                                  @@dovar1247:
  4403 0000210E E9F500                   jmp @@retn
  4404                                  
  4405                                  ;-431   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4406                                  
  4407                                  @@dovar1245:
  4408 00002111 8B4604                   mov ax, [bp+4]
  4409 00002114 83F802                   cmp ax, 2
  4410 00002117 0F852100                 jne @@dovar1248
  4411 0000211B E84529                   call prnl
  4412 0000211E FF7606                   push word [bp+6]
  4413 00002121 E84D29                   call prs
  4414 00002124 83C402                   add  sp, 2
  4415 00002127 68[3422]                 push dovar1_3
  4416 0000212A E84429                   call prs
  4417 0000212D 83C402                   add  sp, 2
  4418 00002130 FF760A                   push word [bp+10]
  4419 00002133 E87CDF                   call a
  4420 00002136 83C402                   add  sp, 2
  4421 00002139 E9CA00                   jmp @@retn
  4422                                  
  4423                                  ;-432   if (ixarr) {
  4424                                  
  4425                                  @@dovar1248:
  4426 0000213C 8B4608                   mov ax, [bp+8]
  4427 0000213F 08C0                     or  al, al
  4428 00002141 0F847300                 je @@dovar1249
  4429                                  
  4430                                  ;-433     prs("\n mov bx, "); v(ixarr);
  4431                                  
  4432 00002145 68[3A22]                 push dovar1_4
  4433 00002148 E82629                   call prs
  4434 0000214B 83C402                   add  sp, 2
  4435 0000214E FF7608                   push word [bp+8]
  4436 00002151 E887DF                   call v
  4437 00002154 83C402                   add  sp, 2
  4438                                  
  4439                                  ;-434     if (wi==2) prs("\n shl bx, 1");
  4440                                  
  4441 00002157 A1[4400]                 mov ax, [wi]
  4442 0000215A 83F802                   cmp ax, 2
  4443 0000215D 0F850900                 jne @@dovar1250
  4444 00002161 68[4622]                 push dovar1_5
  4445 00002164 E80A29                   call prs
  4446 00002167 83C402                   add  sp, 2
  4447                                  
  4448                                  ;-435     prs("\n "); prs(op);
  4449                                  
  4450                                  @@dovar1250:
  4451 0000216A 68[5322]                 push dovar1_6
  4452 0000216D E80129                   call prs
  4453 00002170 83C402                   add  sp, 2
  4454 00002173 FF7606                   push word [bp+6]
  4455 00002176 E8F828                   call prs
  4456 00002179 83C402                   add  sp, 2
  4457                                  
  4458                                  ;-436     if (wi==2) prs(" ax, "); else prs(" al, ");
  4459                                  
  4460 0000217C A1[4400]                 mov ax, [wi]
  4461 0000217F 83F802                   cmp ax, 2
  4462 00002182 0F850C00                 jne @@dovar1251
  4463 00002186 68[5722]                 push dovar1_7
  4464 00002189 E8E528                   call prs
  4465 0000218C 83C402                   add  sp, 2
  4466 0000218F E90900                   jmp @@dovar1252
  4467                                  @@dovar1251:
  4468 00002192 68[5D22]                 push dovar1_8
  4469 00002195 E8D928                   call prs
  4470 00002198 83C402                   add  sp, 2
  4471                                  
  4472                                  ;-437 // v(id1); prs(" [bx]");
  4473                                  
  4474                                  
  4475                                  ;-438     prc('['); printName(id1); prs(" + bx]"); 
  4476                                  
  4477                                  @@dovar1252:
  4478 0000219B 6A5B                     push 91
  4479 0000219D E86128                   call prc
  4480 000021A0 83C402                   add  sp, 2
  4481 000021A3 FF760A                   push word [bp+10]
  4482 000021A6 E896E5                   call printName
  4483 000021A9 83C402                   add  sp, 2
  4484 000021AC 68[6322]                 push dovar1_9
  4485 000021AF E8BF28                   call prs
  4486 000021B2 83C402                   add  sp, 2
  4487                                  
  4488                                  ;-439     return; }
  4489                                  
  4490 000021B5 E94E00                   jmp @@retn
  4491                                  
  4492                                  ;-440   prnl();prs(op);
  4493                                  
  4494                                  @@dovar1249:
  4495 000021B8 E8A828                   call prnl
  4496 000021BB FF7606                   push word [bp+6]
  4497 000021BE E8B028                   call prs
  4498 000021C1 83C402                   add  sp, 2
  4499                                  
  4500                                  ;-441   if(wi==1) prs(" al, ");
  4501                                  
  4502 000021C4 A1[4400]                 mov ax, [wi]
  4503 000021C7 83F801                   cmp ax, 1
  4504 000021CA 0F850900                 jne @@dovar1253
  4505 000021CE 68[6A22]                 push dovar1_10
  4506 000021D1 E89D28                   call prs
  4507 000021D4 83C402                   add  sp, 2
  4508                                  
  4509                                  ;-442   if(wi==2) prs(" ax, ");
  4510                                  
  4511                                  @@dovar1253:
  4512 000021D7 A1[4400]                 mov ax, [wi]
  4513 000021DA 83F802                   cmp ax, 2
  4514 000021DD 0F850900                 jne @@dovar1254
  4515 000021E1 68[7022]                 push dovar1_11
  4516 000021E4 E88A28                   call prs
  4517 000021E7 83C402                   add  sp, 2
  4518                                  
  4519                                  ;-443   if(wi==4) prs(" eax, ");
  4520                                  
  4521                                  @@dovar1254:
  4522 000021EA A1[4400]                 mov ax, [wi]
  4523 000021ED 83F804                   cmp ax, 4
  4524 000021F0 0F850900                 jne @@dovar1255
  4525 000021F4 68[7622]                 push dovar1_12
  4526 000021F7 E87728                   call prs
  4527 000021FA 83C402                   add  sp, 2
  4528                                  
  4529                                  ;-444   v(id1);
  4530                                  
  4531                                  @@dovar1255:
  4532 000021FD FF760A                   push word [bp+10]
  4533 00002200 E8D8DE                   call v
  4534 00002203 83C402                   add  sp, 2
  4535                                  
  4536                                  ;-445 }
  4537                                  
  4538                                  
  4539                                  ;-446 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4540                                  
  4541 00002206 C9                      @@retn: LEAVE
  4542 00002207 C3                       ret
  4543                                  ; ENDP
  4544 00002208 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4545 00002211 2C2000             
  4546 00002214 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4547 0000221D 5C6E206D6F76206168-
  4548 00002226 2C203000           
  4549 0000222A 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4550 00002233 00                 
  4551 00002234 2061782C2000            dovar1_3 db " ax, ",0
  4552 0000223A 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4553 00002243 2C2000             
  4554 00002246 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4555 0000224F 2C203100           
  4556 00002253 5C6E2000                dovar1_6 db "\n ",0
  4557 00002257 2061782C2000            dovar1_7 db " ax, ",0
  4558 0000225D 20616C2C2000            dovar1_8 db " al, ",0
  4559 00002263 202B2062785D00          dovar1_9 db " + bx]",0
  4560 0000226A 20616C2C2000            dovar1_10 db " al, ",0
  4561 00002270 2061782C2000            dovar1_11 db " ax, ",0
  4562 00002276 206561782C2000          dovar1_12 db " eax, ",0
  4563                                  
  4564                                  rterm:  ; *** PROC ***
  4565                                  
  4566                                  ;-447   if (istoken(T_CONST)) { prnl(); prs(op); 
  4567                                  
  4568                                  ;Function : rterm, Number of local variables: 5
  4569                                  ;   # type sign width addr used name   list of local variables
  4570                                  ;  200 ptr sign byte   446 NULL op = bp+4
  4571                                  ;  201 var sign word   446 NULL mode = bp-2
  4572                                  ;  202 var sign word   446 NULL opint = bp-4
  4573                                  ;  203 var sign word   446 NULL ixarr = bp-6
  4574                                  ;  204 var sign word   446 NULL id1 = bp-8;
  4575 0000227D C8080000                 ENTER  8,0
  4576 00002281 680101                   push 257
  4577 00002284 E8AC26                   call istoken
  4578 00002287 83C402                   add  sp, 2
  4579 0000228A 08C0                     or  al, al
  4580 0000228C 0F845200                 je @@rterm256
  4581 00002290 E8D027                   call prnl
  4582 00002293 FF7604                   push word [bp+4]
  4583 00002296 E8D827                   call prs
  4584 00002299 83C402                   add  sp, 2
  4585                                  
  4586                                  ;-448     if (wi==1) prs(" al, ");
  4587                                  
  4588 0000229C A1[4400]                 mov ax, [wi]
  4589 0000229F 83F801                   cmp ax, 1
  4590 000022A2 0F850900                 jne @@rterm257
  4591 000022A6 68[6623]                 push rterm_0
  4592 000022A9 E8C527                   call prs
  4593 000022AC 83C402                   add  sp, 2
  4594                                  
  4595                                  ;-449     if (wi==2) prs(" ax, ");
  4596                                  
  4597                                  @@rterm257:
  4598 000022AF A1[4400]                 mov ax, [wi]
  4599 000022B2 83F802                   cmp ax, 2
  4600 000022B5 0F850900                 jne @@rterm258
  4601 000022B9 68[6C23]                 push rterm_1
  4602 000022BC E8B227                   call prs
  4603 000022BF 83C402                   add  sp, 2
  4604                                  
  4605                                  ;-450     if (wi==4) prs(" eax, ");
  4606                                  
  4607                                  @@rterm258:
  4608 000022C2 A1[4400]                 mov ax, [wi]
  4609 000022C5 83F804                   cmp ax, 4
  4610 000022C8 0F850900                 jne @@rterm259
  4611 000022CC 68[7223]                 push rterm_2
  4612 000022CF E89F27                   call prs
  4613 000022D2 83C402                   add  sp, 2
  4614                                  
  4615                                  ;-451     prunsign1(lexval); return;}
  4616                                  
  4617                                  @@rterm259:
  4618 000022D5 FF36[3900]               push word [lexval]
  4619 000022D9 E8EF28                   call prunsign1
  4620 000022DC 83C402                   add  sp, 2
  4621 000022DF E98200                   jmp @@retn
  4622                                  
  4623                                  ;-452   mode=typeName(); id1=searchname(); ixarr=0;
  4624                                  
  4625                                  @@rterm256:
  4626 000022E2 E88DE5                   call typeName
  4627 000022E5 8946FE                   mov [bp-2], ax
  4628 000022E8 E8B8E4                   call searchname
  4629 000022EB 8946F8                   mov [bp-8], ax
  4630 000022EE B80000                   mov ax, 0
  4631 000022F1 8946FA                   mov [bp-6], ax
  4632                                  
  4633                                  ;-453   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  4634                                  
  4635 000022F4 6A5B                     push 91
  4636 000022F6 E83A26                   call istoken
  4637 000022F9 83C402                   add  sp, 2
  4638 000022FC 08C0                     or  al, al
  4639 000022FE 0F843300                 je @@rterm260
  4640 00002302 E89EE4                   call searchname
  4641 00002305 8946FA                   mov [bp-6], ax
  4642 00002308 680001                   push 256
  4643 0000230B E84726                   call expect
  4644 0000230E 83C402                   add  sp, 2
  4645 00002311 6A5D                     push 93
  4646 00002313 E83F26                   call expect
  4647 00002316 83C402                   add  sp, 2
  4648                                  
  4649                                  ;-454     gettypes(ixarr);
  4650                                  
  4651 00002319 FF76FA                   push word [bp-6]
  4652 0000231C E846E3                   call gettypes
  4653 0000231F 83C402                   add  sp, 2
  4654                                  
  4655                                  ;-455     if (widthi != 2) error1("Arrayindex muss int sein"); }
  4656                                  
  4657 00002322 A1[4100]                 mov ax, [widthi]
  4658 00002325 83F802                   cmp ax, 2
  4659 00002328 0F840900                 je  @@rterm261
  4660 0000232C 68[7923]                 push rterm_3
  4661 0000232F E8282A                   call error1
  4662 00002332 83C402                   add  sp, 2
  4663                                  @@rterm261:
  4664                                  
  4665                                  ;-456   if (eqstr(symbol,"_AX")) return;
  4666                                  
  4667                                  @@rterm260:
  4668 00002335 68[9223]                 push rterm_4
  4669 00002338 8D062B81                 lea  ax, [symbol]
  4670 0000233C 50                       push ax
  4671 0000233D E82238                   call eqstr
  4672 00002340 83C404                   add  sp, 4
  4673 00002343 08C0                     or  al, al
  4674 00002345 0F840300                 je @@rterm262
  4675 00002349 E91800                   jmp @@retn
  4676                                  
  4677                                  ;-457   opint=op; dovar1(mode, opint, ixarr, id1);
  4678                                  
  4679                                  @@rterm262:
  4680 0000234C 8B4604                   mov ax, [bp+4]
  4681 0000234F 8946FC                   mov [bp-4], ax
  4682 00002352 FF76F8                   push word [bp-8]
  4683 00002355 FF76FA                   push word [bp-6]
  4684 00002358 FF76FC                   push word [bp-4]
  4685 0000235B FF76FE                   push word [bp-2]
  4686 0000235E E852FD                   call dovar1
  4687 00002361 83C408                   add  sp, 8
  4688                                  
  4689                                  ;-458 }
  4690                                  
  4691                                  
  4692                                  ;-459 int isreg() {
  4693                                  
  4694 00002364 C9                      @@retn: LEAVE
  4695 00002365 C3                       ret
  4696                                  ; ENDP
  4697 00002366 20616C2C2000            rterm_0 db " al, ",0
  4698 0000236C 2061782C2000            rterm_1 db " ax, ",0
  4699 00002372 206561782C2000          rterm_2 db " eax, ",0
  4700 00002379 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  4701 00002382 78206D75737320696E-
  4702 0000238B 74207365696E00     
  4703 00002392 5F415800                rterm_4 db "_AX",0
  4704                                  
  4705                                  isreg:  ; *** PROC ***
  4706                                  
  4707                                  ;-460   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  4708                                  
  4709 00002396 68[8325]                 push isreg_0
  4710 00002399 8D062B81                 lea  ax, [symbol]
  4711 0000239D 50                       push ax
  4712 0000239E E8C137                   call eqstr
  4713 000023A1 83C404                   add  sp, 4
  4714 000023A4 08C0                     or  al, al
  4715 000023A6 0F840C00                 je @@isreg263
  4716 000023AA 68[8725]                 push isreg_1
  4717 000023AD E84202                   call doreg
  4718 000023B0 83C402                   add  sp, 2
  4719 000023B3 E9C601                   jmp @@r1
  4720                                  
  4721                                  ;-461   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  4722                                  
  4723                                  @@isreg263:
  4724 000023B6 68[8A25]                 push isreg_2
  4725 000023B9 8D062B81                 lea  ax, [symbol]
  4726 000023BD 50                       push ax
  4727 000023BE E8A137                   call eqstr
  4728 000023C1 83C404                   add  sp, 4
  4729 000023C4 08C0                     or  al, al
  4730 000023C6 0F840C00                 je @@isreg264
  4731 000023CA 68[8E25]                 push isreg_3
  4732 000023CD E82202                   call doreg
  4733 000023D0 83C402                   add  sp, 2
  4734 000023D3 E9A601                   jmp @@r1
  4735                                  
  4736                                  ;-462   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  4737                                  
  4738                                  @@isreg264:
  4739 000023D6 68[9125]                 push isreg_4
  4740 000023D9 8D062B81                 lea  ax, [symbol]
  4741 000023DD 50                       push ax
  4742 000023DE E88137                   call eqstr
  4743 000023E1 83C404                   add  sp, 4
  4744 000023E4 08C0                     or  al, al
  4745 000023E6 0F840C00                 je @@isreg265
  4746 000023EA 68[9525]                 push isreg_5
  4747 000023ED E80202                   call doreg
  4748 000023F0 83C402                   add  sp, 2
  4749 000023F3 E98601                   jmp @@r1
  4750                                  
  4751                                  ;-463   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  4752                                  
  4753                                  @@isreg265:
  4754 000023F6 68[9825]                 push isreg_6
  4755 000023F9 8D062B81                 lea  ax, [symbol]
  4756 000023FD 50                       push ax
  4757 000023FE E86137                   call eqstr
  4758 00002401 83C404                   add  sp, 4
  4759 00002404 08C0                     or  al, al
  4760 00002406 0F840C00                 je @@isreg266
  4761 0000240A 68[9C25]                 push isreg_7
  4762 0000240D E8E201                   call doreg
  4763 00002410 83C402                   add  sp, 2
  4764 00002413 E96601                   jmp @@r1
  4765                                  
  4766                                  ;-464   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  4767                                  
  4768                                  @@isreg266:
  4769 00002416 68[9F25]                 push isreg_8
  4770 00002419 8D062B81                 lea  ax, [symbol]
  4771 0000241D 50                       push ax
  4772 0000241E E84137                   call eqstr
  4773 00002421 83C404                   add  sp, 4
  4774 00002424 08C0                     or  al, al
  4775 00002426 0F840C00                 je @@isreg267
  4776 0000242A 68[A325]                 push isreg_9
  4777 0000242D E8C201                   call doreg
  4778 00002430 83C402                   add  sp, 2
  4779 00002433 E94601                   jmp @@r1
  4780                                  
  4781                                  ;-465   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  4782                                  
  4783                                  @@isreg267:
  4784 00002436 68[A625]                 push isreg_10
  4785 00002439 8D062B81                 lea  ax, [symbol]
  4786 0000243D 50                       push ax
  4787 0000243E E82137                   call eqstr
  4788 00002441 83C404                   add  sp, 4
  4789 00002444 08C0                     or  al, al
  4790 00002446 0F840C00                 je @@isreg268
  4791 0000244A 68[AA25]                 push isreg_11
  4792 0000244D E8A201                   call doreg
  4793 00002450 83C402                   add  sp, 2
  4794 00002453 E92601                   jmp @@r1
  4795                                  
  4796                                  ;-466   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  4797                                  
  4798                                  @@isreg268:
  4799 00002456 68[AD25]                 push isreg_12
  4800 00002459 8D062B81                 lea  ax, [symbol]
  4801 0000245D 50                       push ax
  4802 0000245E E80137                   call eqstr
  4803 00002461 83C404                   add  sp, 4
  4804 00002464 08C0                     or  al, al
  4805 00002466 0F840C00                 je @@isreg269
  4806 0000246A 68[B125]                 push isreg_13
  4807 0000246D E88201                   call doreg
  4808 00002470 83C402                   add  sp, 2
  4809 00002473 E90601                   jmp @@r1
  4810                                  
  4811                                  ;-467   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  4812                                  
  4813                                  @@isreg269:
  4814 00002476 68[B425]                 push isreg_14
  4815 00002479 8D062B81                 lea  ax, [symbol]
  4816 0000247D 50                       push ax
  4817 0000247E E8E136                   call eqstr
  4818 00002481 83C404                   add  sp, 4
  4819 00002484 08C0                     or  al, al
  4820 00002486 0F840C00                 je @@isreg270
  4821 0000248A 68[B825]                 push isreg_15
  4822 0000248D E86201                   call doreg
  4823 00002490 83C402                   add  sp, 2
  4824 00002493 E9E600                   jmp @@r1
  4825                                  
  4826                                  ;-468   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  4827                                  
  4828                                  @@isreg270:
  4829 00002496 68[BB25]                 push isreg_16
  4830 00002499 8D062B81                 lea  ax, [symbol]
  4831 0000249D 50                       push ax
  4832 0000249E E8C136                   call eqstr
  4833 000024A1 83C404                   add  sp, 4
  4834 000024A4 08C0                     or  al, al
  4835 000024A6 0F840C00                 je @@isreg271
  4836 000024AA 68[BF25]                 push isreg_17
  4837 000024AD E84201                   call doreg
  4838 000024B0 83C402                   add  sp, 2
  4839 000024B3 E9C600                   jmp @@r1
  4840                                  
  4841                                  ;-469   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  4842                                  
  4843                                  @@isreg271:
  4844 000024B6 68[C225]                 push isreg_18
  4845 000024B9 8D062B81                 lea  ax, [symbol]
  4846 000024BD 50                       push ax
  4847 000024BE E8A136                   call eqstr
  4848 000024C1 83C404                   add  sp, 4
  4849 000024C4 08C0                     or  al, al
  4850 000024C6 0F840C00                 je @@isreg272
  4851 000024CA 68[C625]                 push isreg_19
  4852 000024CD E82201                   call doreg
  4853 000024D0 83C402                   add  sp, 2
  4854 000024D3 E9A600                   jmp @@r1
  4855                                  
  4856                                  ;-470   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  4857                                  
  4858                                  @@isreg272:
  4859 000024D6 68[C925]                 push isreg_20
  4860 000024D9 8D062B81                 lea  ax, [symbol]
  4861 000024DD 50                       push ax
  4862 000024DE E88136                   call eqstr
  4863 000024E1 83C404                   add  sp, 4
  4864 000024E4 08C0                     or  al, al
  4865 000024E6 0F840C00                 je @@isreg273
  4866 000024EA 68[CD25]                 push isreg_21
  4867 000024ED E80201                   call doreg
  4868 000024F0 83C402                   add  sp, 2
  4869 000024F3 E98600                   jmp @@r1
  4870                                  
  4871                                  ;-471   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  4872                                  
  4873                                  @@isreg273:
  4874 000024F6 68[D025]                 push isreg_22
  4875 000024F9 8D062B81                 lea  ax, [symbol]
  4876 000024FD 50                       push ax
  4877 000024FE E86136                   call eqstr
  4878 00002501 83C404                   add  sp, 4
  4879 00002504 08C0                     or  al, al
  4880 00002506 0F840C00                 je @@isreg274
  4881 0000250A 68[D425]                 push isreg_23
  4882 0000250D E8E200                   call doreg
  4883 00002510 83C402                   add  sp, 2
  4884 00002513 E96600                   jmp @@r1
  4885                                  
  4886                                  ;-472   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  4887                                  
  4888                                  @@isreg274:
  4889 00002516 68[D725]                 push isreg_24
  4890 00002519 8D062B81                 lea  ax, [symbol]
  4891 0000251D 50                       push ax
  4892 0000251E E84136                   call eqstr
  4893 00002521 83C404                   add  sp, 4
  4894 00002524 08C0                     or  al, al
  4895 00002526 0F840C00                 je @@isreg275
  4896 0000252A 68[DB25]                 push isreg_25
  4897 0000252D E8C200                   call doreg
  4898 00002530 83C402                   add  sp, 2
  4899 00002533 E94600                   jmp @@r1
  4900                                  
  4901                                  ;-473   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  4902                                  
  4903                                  @@isreg275:
  4904 00002536 68[DE25]                 push isreg_26
  4905 00002539 8D062B81                 lea  ax, [symbol]
  4906 0000253D 50                       push ax
  4907 0000253E E82136                   call eqstr
  4908 00002541 83C404                   add  sp, 4
  4909 00002544 08C0                     or  al, al
  4910 00002546 0F840C00                 je @@isreg276
  4911 0000254A 68[E225]                 push isreg_27
  4912 0000254D E8A200                   call doreg
  4913 00002550 83C402                   add  sp, 2
  4914 00002553 E92600                   jmp @@r1
  4915                                  
  4916                                  ;-474   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  4917                                  
  4918                                  @@isreg276:
  4919 00002556 68[E525]                 push isreg_28
  4920 00002559 8D062B81                 lea  ax, [symbol]
  4921 0000255D 50                       push ax
  4922 0000255E E80136                   call eqstr
  4923 00002561 83C404                   add  sp, 4
  4924 00002564 08C0                     or  al, al
  4925 00002566 0F840C00                 je @@isreg277
  4926 0000256A 68[EC25]                 push isreg_29
  4927 0000256D E88200                   call doreg
  4928 00002570 83C402                   add  sp, 2
  4929 00002573 E90600                   jmp @@r1
  4930                                  
  4931                                  ;-475   return 0;   r1: return 1; 
  4932                                  
  4933                                  @@isreg277:
  4934 00002576 B80000                   mov ax, 0
  4935 00002579 E90600                   jmp @@retn
  4936                                  @@r1:
  4937 0000257C B80100                   mov ax, 1
  4938 0000257F E90000                   jmp @@retn
  4939                                  
  4940                                  ;-476 }
  4941                                  
  4942                                  
  4943                                  ;-477 int doreg(char *dr) { int i; expect('=');
  4944                                  
  4945                                  @@retn:
  4946 00002582 C3                       ret
  4947                                  ; ENDP
  4948 00002583 5F414800                isreg_0 db "_AH",0
  4949 00002587 616800                  isreg_1 db "ah",0
  4950 0000258A 5F414C00                isreg_2 db "_AL",0
  4951 0000258E 616C00                  isreg_3 db "al",0
  4952 00002591 5F415800                isreg_4 db "_AX",0
  4953 00002595 617800                  isreg_5 db "ax",0
  4954 00002598 5F424800                isreg_6 db "_BH",0
  4955 0000259C 626800                  isreg_7 db "bh",0
  4956 0000259F 5F424C00                isreg_8 db "_BL",0
  4957 000025A3 626C00                  isreg_9 db "bl",0
  4958 000025A6 5F425800                isreg_10 db "_BX",0
  4959 000025AA 627800                  isreg_11 db "bx",0
  4960 000025AD 5F434800                isreg_12 db "_CH",0
  4961 000025B1 636800                  isreg_13 db "ch",0
  4962 000025B4 5F434C00                isreg_14 db "_CL",0
  4963 000025B8 636C00                  isreg_15 db "cl",0
  4964 000025BB 5F435800                isreg_16 db "_CX",0
  4965 000025BF 637800                  isreg_17 db "cx",0
  4966 000025C2 5F444800                isreg_18 db "_DH",0
  4967 000025C6 646800                  isreg_19 db "dh",0
  4968 000025C9 5F444C00                isreg_20 db "_DL",0
  4969 000025CD 646C00                  isreg_21 db "dl",0
  4970 000025D0 5F445800                isreg_22 db "_DX",0
  4971 000025D4 647800                  isreg_23 db "dx",0
  4972 000025D7 5F534900                isreg_24 db "_SI",0
  4973 000025DB 736900                  isreg_25 db "si",0
  4974 000025DE 5F444900                isreg_26 db "_DI",0
  4975 000025E2 646900                  isreg_27 db "di",0
  4976 000025E5 5F464C41475300          isreg_28 db "_FLAGS",0
  4977 000025EC 666C61677300            isreg_29 db "flags",0
  4978                                  
  4979                                  doreg:  ; *** PROC ***
  4980                                  ;Function : doreg, Number of local variables: 2
  4981                                  ;   # type sign width addr used name   list of local variables
  4982                                  ;  200 ptr sign byte   477 NULL dr = bp+4
  4983                                  ;  201 var sign word   477 NULL i = bp-2;
  4984 000025F2 C8020000                 ENTER  2,0
  4985 000025F6 6A3D                     push 61
  4986 000025F8 E85A23                   call expect
  4987 000025FB 83C402                   add  sp, 2
  4988                                  
  4989                                  ;-478   prs("\n mov  "); prs(dr); prs(", ");
  4990                                  
  4991 000025FE 68[6126]                 push doreg_0
  4992 00002601 E86D24                   call prs
  4993 00002604 83C402                   add  sp, 2
  4994 00002607 FF7604                   push word [bp+4]
  4995 0000260A E86424                   call prs
  4996 0000260D 83C402                   add  sp, 2
  4997 00002610 68[6A26]                 push doreg_1
  4998 00002613 E85B24                   call prs
  4999 00002616 83C402                   add  sp, 2
  5000                                  
  5001                                  ;-479        if (istoken(T_CONST)) prunsign1(lexval);
  5002                                  
  5003 00002619 680101                   push 257
  5004 0000261C E81423                   call istoken
  5005 0000261F 83C402                   add  sp, 2
  5006 00002622 08C0                     or  al, al
  5007 00002624 0F840D00                 je @@doreg278
  5008 00002628 FF36[3900]               push word [lexval]
  5009 0000262C E89C25                   call prunsign1
  5010 0000262F 83C402                   add  sp, 2
  5011                                  
  5012                                  ;-480   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5013                                  
  5014 00002632 E92A00                   jmp @@doreg279
  5015                                  @@doreg278:
  5016 00002635 680001                   push 256
  5017 00002638 E8F822                   call istoken
  5018 0000263B 83C402                   add  sp, 2
  5019 0000263E 08C0                     or  al, al
  5020 00002640 0F841200                 je @@doreg280
  5021 00002644 E85CE1                   call searchname
  5022 00002647 8946FE                   mov [bp-2], ax
  5023 0000264A FF76FE                   push word [bp-2]
  5024 0000264D E88BDA                   call v
  5025 00002650 83C402                   add  sp, 2
  5026                                  
  5027                                  ;-481   else error1("only number or var allowed"); }
  5028                                  
  5029 00002653 E90900                   jmp @@doreg281
  5030                                  @@doreg280:
  5031 00002656 68[6D26]                 push doreg_2
  5032 00002659 E8FE26                   call error1
  5033 0000265C 83C402                   add  sp, 2
  5034                                  @@doreg281:
  5035                                  @@doreg279:
  5036                                  
  5037                                  ;-482 
  5038                                  
  5039                                  
  5040                                  ;-483 int doassign(int mode, int i, int ixarr, int ixconst) {
  5041 0000265F C9                       LEAVE
  5042 00002660 C3                       ret
  5043                                  ; ENDP
  5044 00002661 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5045 0000266A 2C2000                  doreg_1 db ", ",0
  5046 0000266D 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5047 00002676 6572206F7220766172-
  5048 0000267F 20616C6C6F77656400 
  5049                                  
  5050                                  doassign:  ; *** PROC ***
  5051                                  
  5052                                  ;-484   gettypes(i);
  5053                                  
  5054                                  ;Function : doassign, Number of local variables: 4
  5055                                  ;   # type sign width addr used name   list of local variables
  5056                                  ;  200 var sign word   483 NULL mode = bp+4
  5057                                  ;  201 var sign word   483 NULL i = bp+6
  5058                                  ;  202 var sign word   483 NULL ixarr = bp+8
  5059                                  ;  203 var sign word   483 NULL ixconst = bp+10;
  5060 00002688 C8000000                 ENTER  0,0
  5061 0000268C FF7606                   push word [bp+6]
  5062 0000268F E8D3DF                   call gettypes
  5063 00002692 83C402                   add  sp, 2
  5064                                  
  5065                                  ;-485   if (mode==1) {prs("\n mov  bx, ");v(i);                       /*NASM??*/
  5066                                  
  5067 00002695 8B4604                   mov ax, [bp+4]
  5068 00002698 83F801                   cmp ax, 1
  5069 0000269B 0F853400                 jne @@doassign282
  5070 0000269F 68[5B28]                 push doassign_0
  5071 000026A2 E8CC23                   call prs
  5072 000026A5 83C402                   add  sp, 2
  5073 000026A8 FF7606                   push word [bp+6]
  5074 000026AB E82DDA                   call v
  5075 000026AE 83C402                   add  sp, 2
  5076                                  
  5077                                  ;-486     if (widthi == 2) prs("\n mov  [bx], ax");
  5078                                  
  5079 000026B1 A1[4100]                 mov ax, [widthi]
  5080 000026B4 83F802                   cmp ax, 2
  5081 000026B7 0F850C00                 jne @@doassign283
  5082 000026BB 68[6828]                 push doassign_1
  5083 000026BE E8B023                   call prs
  5084 000026C1 83C402                   add  sp, 2
  5085                                  
  5086                                  ;-487     else  prs("\n mov  [bx], al"); return;}
  5087                                  
  5088 000026C4 E90900                   jmp @@doassign284
  5089                                  @@doassign283:
  5090 000026C7 68[7928]                 push doassign_2
  5091 000026CA E8A423                   call prs
  5092 000026CD 83C402                   add  sp, 2
  5093                                  @@doassign284:
  5094 000026D0 E98601                   jmp @@retn
  5095                                  
  5096                                  ;-488   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5097                                  
  5098                                  @@doassign282:
  5099 000026D3 8B4604                   mov ax, [bp+4]
  5100 000026D6 83F802                   cmp ax, 2
  5101 000026D9 0F851E00                 jne @@doassign285
  5102 000026DD 68[8A28]                 push doassign_3
  5103 000026E0 E88E23                   call prs
  5104 000026E3 83C402                   add  sp, 2
  5105 000026E6 FF7606                   push word [bp+6]
  5106 000026E9 E8C6D9                   call a
  5107 000026EC 83C402                   add  sp, 2
  5108 000026EF 68[9328]                 push doassign_4
  5109 000026F2 E87C23                   call prs
  5110 000026F5 83C402                   add  sp, 2
  5111 000026F8 E95E01                   jmp @@retn
  5112                                  
  5113                                  ;-489   if (ixarr) {  prs("\n mov bx, ");
  5114                                  
  5115                                  @@doassign285:
  5116 000026FB 8B4608                   mov ax, [bp+8]
  5117 000026FE 08C0                     or  al, al
  5118 00002700 0F846E00                 je @@doassign286
  5119 00002704 68[9828]                 push doassign_5
  5120 00002707 E86723                   call prs
  5121 0000270A 83C402                   add  sp, 2
  5122                                  
  5123                                  ;-490     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5124                                  
  5125 0000270D 8B460A                   mov ax, [bp+10]
  5126 00002710 08C0                     or  al, al
  5127 00002712 0F840C00                 je @@doassign287
  5128 00002716 FF7608                   push word [bp+8]
  5129 00002719 E8AF24                   call prunsign1
  5130 0000271C 83C402                   add  sp, 2
  5131 0000271F E90900                   jmp @@doassign288
  5132                                  @@doassign287:
  5133 00002722 FF7608                   push word [bp+8]
  5134 00002725 E8B3D9                   call v
  5135 00002728 83C402                   add  sp, 2
  5136                                  
  5137                                  ;-491     if (wi==2) prs("\n shl bx, 1");
  5138                                  
  5139                                  @@doassign288:
  5140 0000272B A1[4400]                 mov ax, [wi]
  5141 0000272E 83F802                   cmp ax, 2
  5142 00002731 0F850900                 jne @@doassign289
  5143 00002735 68[A428]                 push doassign_6
  5144 00002738 E83623                   call prs
  5145 0000273B 83C402                   add  sp, 2
  5146                                  
  5147                                  ;-492     prs("\n mov ["); printName(i);
  5148                                  
  5149                                  @@doassign289:
  5150 0000273E 68[B128]                 push doassign_7
  5151 00002741 E82D23                   call prs
  5152 00002744 83C402                   add  sp, 2
  5153 00002747 FF7606                   push word [bp+6]
  5154 0000274A E8F2DF                   call printName
  5155 0000274D 83C402                   add  sp, 2
  5156                                  
  5157                                  ;-493     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5158                                  
  5159 00002750 A1[4400]                 mov ax, [wi]
  5160 00002753 83F802                   cmp ax, 2
  5161 00002756 0F850C00                 jne @@doassign290
  5162 0000275A 68[BA28]                 push doassign_8
  5163 0000275D E81123                   call prs
  5164 00002760 83C402                   add  sp, 2
  5165 00002763 E90900                   jmp @@doassign291
  5166                                  @@doassign290:
  5167 00002766 68[C328]                 push doassign_9
  5168 00002769 E80523                   call prs
  5169 0000276C 83C402                   add  sp, 2
  5170                                  @@doassign291:
  5171 0000276F E9E700                   jmp @@retn
  5172                                  
  5173                                  ;-494   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5174                                  
  5175                                  @@doassign286:
  5176 00002772 A1[4400]                 mov ax, [wi]
  5177 00002775 83F801                   cmp ax, 1
  5178 00002778 0F854300                 jne @@doassign292
  5179 0000277C 68[CC28]                 push doassign_10
  5180 0000277F E8EF22                   call prs
  5181 00002782 83C402                   add  sp, 2
  5182 00002785 8B4606                   mov ax, [bp+6]
  5183 00002788 3DC800                   cmp ax, 200
  5184 0000278B 0F8D1B00                 jge @@doassign293
  5185 0000278F 68[D428]                 push doassign_11
  5186 00002792 E8DC22                   call prs
  5187 00002795 83C402                   add  sp, 2
  5188                                  
  5189                                  ;-495     if(NASM==0)prs("ptr ");} v(i); prs(", al"); return; }
  5190                                  
  5191 00002798 A0[1500]                 mov al, [NASM]
  5192 0000279B 3C00                     cmp al, 0
  5193 0000279D 0F850900                 jne @@doassign294
  5194 000027A1 68[DA28]                 push doassign_12
  5195 000027A4 E8CA22                   call prs
  5196 000027A7 83C402                   add  sp, 2
  5197                                  @@doassign294:
  5198                                  @@doassign293:
  5199 000027AA FF7606                   push word [bp+6]
  5200 000027AD E82BD9                   call v
  5201 000027B0 83C402                   add  sp, 2
  5202 000027B3 68[DF28]                 push doassign_13
  5203 000027B6 E8B822                   call prs
  5204 000027B9 83C402                   add  sp, 2
  5205 000027BC E99A00                   jmp @@retn
  5206                                  
  5207                                  ;-496   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5208                                  
  5209                                  @@doassign292:
  5210 000027BF A1[4400]                 mov ax, [wi]
  5211 000027C2 83F802                   cmp ax, 2
  5212 000027C5 0F854300                 jne @@doassign295
  5213 000027C9 68[E428]                 push doassign_14
  5214 000027CC E8A222                   call prs
  5215 000027CF 83C402                   add  sp, 2
  5216 000027D2 8B4606                   mov ax, [bp+6]
  5217 000027D5 3DC800                   cmp ax, 200
  5218 000027D8 0F8D1B00                 jge @@doassign296
  5219 000027DC 68[EC28]                 push doassign_15
  5220 000027DF E88F22                   call prs
  5221 000027E2 83C402                   add  sp, 2
  5222                                  
  5223                                  ;-497     if(NASM==0)prs("ptr ");} v(i); prs(", ax"); return; }
  5224                                  
  5225 000027E5 A0[1500]                 mov al, [NASM]
  5226 000027E8 3C00                     cmp al, 0
  5227 000027EA 0F850900                 jne @@doassign297
  5228 000027EE 68[F228]                 push doassign_16
  5229 000027F1 E87D22                   call prs
  5230 000027F4 83C402                   add  sp, 2
  5231                                  @@doassign297:
  5232                                  @@doassign296:
  5233 000027F7 FF7606                   push word [bp+6]
  5234 000027FA E8DED8                   call v
  5235 000027FD 83C402                   add  sp, 2
  5236 00002800 68[F728]                 push doassign_17
  5237 00002803 E86B22                   call prs
  5238 00002806 83C402                   add  sp, 2
  5239 00002809 E94D00                   jmp @@retn
  5240                                  
  5241                                  ;-498   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5242                                  
  5243                                  @@doassign295:
  5244 0000280C A1[4400]                 mov ax, [wi]
  5245 0000280F 83F804                   cmp ax, 4
  5246 00002812 0F854300                 jne @@doassign298
  5247 00002816 68[FC28]                 push doassign_18
  5248 00002819 E85522                   call prs
  5249 0000281C 83C402                   add  sp, 2
  5250 0000281F 8B4606                   mov ax, [bp+6]
  5251 00002822 3DC800                   cmp ax, 200
  5252 00002825 0F8D1B00                 jge @@doassign299
  5253 00002829 68[0429]                 push doassign_19
  5254 0000282C E84222                   call prs
  5255 0000282F 83C402                   add  sp, 2
  5256                                  
  5257                                  ;-499     if(NASM==0)prs("ptr ");} v(i); prs(", eax"); return; }
  5258                                  
  5259 00002832 A0[1500]                 mov al, [NASM]
  5260 00002835 3C00                     cmp al, 0
  5261 00002837 0F850900                 jne @@doassign300
  5262 0000283B 68[0B29]                 push doassign_20
  5263 0000283E E83022                   call prs
  5264 00002841 83C402                   add  sp, 2
  5265                                  @@doassign300:
  5266                                  @@doassign299:
  5267 00002844 FF7606                   push word [bp+6]
  5268 00002847 E891D8                   call v
  5269 0000284A 83C402                   add  sp, 2
  5270 0000284D 68[1029]                 push doassign_21
  5271 00002850 E81E22                   call prs
  5272 00002853 83C402                   add  sp, 2
  5273 00002856 E90000                   jmp @@retn
  5274                                  
  5275                                  ;-500 }
  5276                                  
  5277                                  @@doassign298:
  5278                                  
  5279                                  ;-501 int domul(int ids) {
  5280                                  
  5281 00002859 C9                      @@retn: LEAVE
  5282 0000285A C3                       ret
  5283                                  ; ENDP
  5284 0000285B 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5285 00002864 782C2000           
  5286 00002868 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5287 00002871 62785D2C20617800   
  5288 00002879 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5289 00002882 62785D2C20616C00   
  5290 0000288A 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5291 00002893 2C20617800              doassign_4 db ", ax",0
  5292 00002898 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5293 000028A1 2C2000             
  5294 000028A4 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5295 000028AD 2C203100           
  5296 000028B1 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5297 000028BA 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5298 000028C3 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5299 000028CC 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5300 000028D4 627974652000            doassign_11 db "byte ",0
  5301 000028DA 7074722000              doassign_12 db "ptr ",0
  5302 000028DF 2C20616C00              doassign_13 db ", al",0
  5303 000028E4 5C6E206D6F762000        doassign_14 db "\n mov ",0
  5304 000028EC 776F72642000            doassign_15 db "word ",0
  5305 000028F2 7074722000              doassign_16 db "ptr ",0
  5306 000028F7 2C20617800              doassign_17 db ", ax",0
  5307 000028FC 5C6E206D6F762000        doassign_18 db "\n mov ",0
  5308 00002904 64776F72642000          doassign_19 db "dword ",0
  5309 0000290B 7074722000              doassign_20 db "ptr ",0
  5310 00002910 2C2065617800            doassign_21 db ", eax",0
  5311                                  
  5312                                  domul:  ; *** PROC ***
  5313                                  
  5314                                  ;-502   if (ids) rterm("imul"); else {
  5315                                  
  5316                                  ;Function : domul, Number of local variables: 1
  5317                                  ;   # type sign width addr used name   list of local variables
  5318                                  ;  200 var sign word   501 NULL ids = bp+4;
  5319 00002916 C8000000                 ENTER  0,0
  5320 0000291A 8B4604                   mov ax, [bp+4]
  5321 0000291D 08C0                     or  al, al
  5322 0000291F 0F840C00                 je @@domul301
  5323 00002923 68[6829]                 push domul_0
  5324 00002926 E854F9                   call rterm
  5325 00002929 83C402                   add  sp, 2
  5326 0000292C E93700                   jmp @@domul302
  5327                                  @@domul301:
  5328                                  
  5329                                  ;-503   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5330                                  
  5331 0000292F 680101                   push 257
  5332 00002932 E8FE1F                   call istoken
  5333 00002935 83C402                   add  sp, 2
  5334 00002938 08C0                     or  al, al
  5335 0000293A 0F841F00                 je @@domul303
  5336 0000293E 68[6D29]                 push domul_1
  5337 00002941 E82D21                   call prs
  5338 00002944 83C402                   add  sp, 2
  5339 00002947 FF36[3900]               push word [lexval]
  5340 0000294B E87D22                   call prunsign1
  5341 0000294E 83C402                   add  sp, 2
  5342 00002951 68[7929]                 push domul_2
  5343 00002954 E81A21                   call prs
  5344 00002957 83C402                   add  sp, 2
  5345                                  
  5346                                  ;-504   else error1("with MUL only const number as multiplicator allowed"); } }
  5347                                  
  5348 0000295A E90900                   jmp @@domul304
  5349                                  @@domul303:
  5350 0000295D 68[8329]                 push domul_3
  5351 00002960 E8F723                   call error1
  5352 00002963 83C402                   add  sp, 2
  5353                                  @@domul304:
  5354                                  @@domul302:
  5355                                  
  5356                                  ;-505 int doidiv(int ids) { int mode; int id1;
  5357 00002966 C9                       LEAVE
  5358 00002967 C3                       ret
  5359                                  ; ENDP
  5360 00002968 696D756C00              domul_0 db "imul",0
  5361 0000296D 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5362 00002976 2C2000             
  5363 00002979 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5364 00002982 00                 
  5365 00002983 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5366 0000298C 6F6E6C7920636F6E73-
  5367 00002995 74206E756D62657220-
  5368 0000299E 6173206D756C746970-
  5369 000029A7 6C696361746F722061-
  5370 000029B0 6C6C6F77656400     
  5371                                  
  5372                                  doidiv:  ; *** PROC ***
  5373                                  
  5374                                  ;-506   if (istoken(T_CONST)) {
  5375                                  
  5376                                  ;Function : doidiv, Number of local variables: 3
  5377                                  ;   # type sign width addr used name   list of local variables
  5378                                  ;  200 var sign word   505 NULL ids = bp+4
  5379                                  ;  201 var sign word   505 NULL mode = bp-2
  5380                                  ;  202 var sign word   505 NULL id1 = bp-4;
  5381 000029B7 C8040000                 ENTER  4,0
  5382 000029BB 680101                   push 257
  5383 000029BE E8721F                   call istoken
  5384 000029C1 83C402                   add  sp, 2
  5385 000029C4 08C0                     or  al, al
  5386 000029C6 0F843400                 je @@doidiv305
  5387                                  
  5388                                  ;-507     prs("\n mov bx, "); prunsign1(lexval);
  5389                                  
  5390 000029CA 68[7C2A]                 push doidiv_0
  5391 000029CD E8A120                   call prs
  5392 000029D0 83C402                   add  sp, 2
  5393 000029D3 FF36[3900]               push word [lexval]
  5394 000029D7 E8F121                   call prunsign1
  5395 000029DA 83C402                   add  sp, 2
  5396                                  
  5397                                  ;-508     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5398                                  
  5399 000029DD 8B4604                   mov ax, [bp+4]
  5400 000029E0 08C0                     or  al, al
  5401 000029E2 0F840C00                 je @@doidiv306
  5402 000029E6 68[882A]                 push doidiv_1
  5403 000029E9 E88520                   call prs
  5404 000029EC 83C402                   add  sp, 2
  5405 000029EF E90900                   jmp @@doidiv307
  5406                                  @@doidiv306:
  5407 000029F2 68[992A]                 push doidiv_2
  5408 000029F5 E87920                   call prs
  5409 000029F8 83C402                   add  sp, 2
  5410                                  @@doidiv307:
  5411                                  
  5412                                  ;-509   else {
  5413                                  
  5414 000029FB E97C00                   jmp @@doidiv308
  5415                                  @@doidiv305:
  5416                                  
  5417                                  ;-510     mode=typeName(); id1=searchname();
  5418                                  
  5419 000029FE E871DE                   call typeName
  5420 00002A01 8946FE                   mov [bp-2], ax
  5421 00002A04 E89CDD                   call searchname
  5422 00002A07 8946FC                   mov [bp-4], ax
  5423                                  
  5424                                  ;-511     if (mode) error1("only const number or int as divisor allowed");
  5425                                  
  5426 00002A0A 8B46FE                   mov ax, [bp-2]
  5427 00002A0D 08C0                     or  al, al
  5428 00002A0F 0F840900                 je @@doidiv309
  5429 00002A13 68[AF2A]                 push doidiv_3
  5430 00002A16 E84123                   call error1
  5431 00002A19 83C402                   add  sp, 2
  5432                                  
  5433                                  ;-512     gettypes(id1);
  5434                                  
  5435                                  @@doidiv309:
  5436 00002A1C FF76FC                   push word [bp-4]
  5437 00002A1F E843DC                   call gettypes
  5438 00002A22 83C402                   add  sp, 2
  5439                                  
  5440                                  ;-513     if (typei) error1("only int as simple var divisor allowed");
  5441                                  
  5442 00002A25 A1[3B00]                 mov ax, [typei]
  5443 00002A28 08C0                     or  al, al
  5444 00002A2A 0F840900                 je @@doidiv310
  5445 00002A2E 68[DB2A]                 push doidiv_4
  5446 00002A31 E82623                   call error1
  5447 00002A34 83C402                   add  sp, 2
  5448                                  
  5449                                  ;-514     if (wi!=2) error1("only int, no byte as divisor allowed");
  5450                                  
  5451                                  @@doidiv310:
  5452 00002A37 A1[4400]                 mov ax, [wi]
  5453 00002A3A 83F802                   cmp ax, 2
  5454 00002A3D 0F840900                 je  @@doidiv311
  5455 00002A41 68[022B]                 push doidiv_5
  5456 00002A44 E81323                   call error1
  5457 00002A47 83C402                   add  sp, 2
  5458                                  
  5459                                  ;-515     prs("\n mov bx, "); v(id1);
  5460                                  
  5461                                  @@doidiv311:
  5462 00002A4A 68[272B]                 push doidiv_6
  5463 00002A4D E82120                   call prs
  5464 00002A50 83C402                   add  sp, 2
  5465 00002A53 FF76FC                   push word [bp-4]
  5466 00002A56 E882D6                   call v
  5467 00002A59 83C402                   add  sp, 2
  5468                                  
  5469                                  ;-516     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5470                                  
  5471 00002A5C 8B4604                   mov ax, [bp+4]
  5472 00002A5F 08C0                     or  al, al
  5473 00002A61 0F840C00                 je @@doidiv312
  5474 00002A65 68[332B]                 push doidiv_7
  5475 00002A68 E80620                   call prs
  5476 00002A6B 83C402                   add  sp, 2
  5477 00002A6E E90900                   jmp @@doidiv313
  5478                                  @@doidiv312:
  5479 00002A71 68[442B]                 push doidiv_8
  5480 00002A74 E8FA1F                   call prs
  5481 00002A77 83C402                   add  sp, 2
  5482                                  @@doidiv313:
  5483                                  
  5484                                  ;-517 }
  5485                                  
  5486                                  @@doidiv308:
  5487                                  
  5488                                  ;-518 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5489 00002A7A C9                       LEAVE
  5490 00002A7B C3                       ret
  5491                                  ; ENDP
  5492 00002A7C 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5493 00002A85 2C2000             
  5494 00002A88 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5495 00002A91 6964697620627800   
  5496 00002A99 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5497 00002AA2 2C20305C6E20646976-
  5498 00002AAB 20627800           
  5499 00002AAF 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5500 00002AB8 74206E756D62657220-
  5501 00002AC1 6F7220696E74206173-
  5502 00002ACA 2064697669736F7220-
  5503 00002AD3 616C6C6F77656400   
  5504 00002ADB 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5505 00002AE4 61732073696D706C65-
  5506 00002AED 207661722064697669-
  5507 00002AF6 736F7220616C6C6F77-
  5508 00002AFF 656400             
  5509 00002B02 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5510 00002B0B 206E6F206279746520-
  5511 00002B14 61732064697669736F-
  5512 00002B1D 7220616C6C6F776564-
  5513 00002B26 00                 
  5514 00002B27 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5515 00002B30 2C2000             
  5516 00002B33 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5517 00002B3C 6964697620627800   
  5518 00002B44 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5519 00002B4D 2C20305C6E20646976-
  5520 00002B56 20627800           
  5521                                  
  5522                                  domod:  ; *** PROC ***
  5523                                  ;Function : domod, Number of local variables: 1
  5524                                  ;   # type sign width addr used name   list of local variables
  5525                                  ;  200 var sign word   518 NULL ids = bp+4;
  5526 00002B5A C8000000                 ENTER  0,0
  5527 00002B5E FF7604                   push word [bp+4]
  5528 00002B61 E853FE                   call doidiv
  5529 00002B64 83C402                   add  sp, 2
  5530 00002B67 68[722B]                 push domod_0
  5531 00002B6A E8041F                   call prs
  5532 00002B6D 83C402                   add  sp, 2
  5533                                  
  5534                                  ;-519 
  5535                                  
  5536                                  
  5537                                  ;-520 int docalltype[10]; int docallvalue[10];
  5538 00002B70 C9                       LEAVE
  5539 00002B71 C3                       ret
  5540                                  ; ENDP
  5541 00002B72 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5542 00002B7B 2C20647800         
  5543                                  section .bss
  5544                                  absolute 53411
  5545 0000D0A3 <res 00000014>          docalltype resw 10
  5546                                  section .text
  5547                                  section .bss
  5548                                  absolute 53431
  5549 0000D0B7 <res 00000014>          docallvalue resw 10
  5550                                  section .text
  5551                                  
  5552                                  ;-521 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5553                                  
  5554                                  section .bss
  5555                                  absolute 53451
  5556 0000D0CB <res 00000011>          procname resb 17
  5557                                  section .text
  5558                                  
  5559                                  ;-522 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5560                                  
  5561                                  
  5562                                  docall1:  ; *** PROC ***
  5563                                  
  5564                                  ;-523   narg=0;  sz32=0;
  5565                                  
  5566                                  ;Function : docall1, Number of local variables: 5
  5567                                  ;   # type sign width addr used name   list of local variables
  5568                                  ;  200 var sign word   522 NULL i = bp-2
  5569                                  ;  201 var sign word   522 NULL narg = bp-4
  5570                                  ;  202 var sign word   522 NULL t0 = bp-6
  5571                                  ;  203 var sign word   522 NULL n0 = bp-8
  5572                                  ;  204 var sign word   522 NULL sz32 = bp-10;
  5573 00002B80 C80A0000                 ENTER  10,0
  5574 00002B84 B80000                   mov ax, 0
  5575 00002B87 8946FC                   mov [bp-4], ax
  5576 00002B8A B80000                   mov ax, 0
  5577 00002B8D 8946F6                   mov [bp-10], ax
  5578                                  
  5579                                  ;-524   checknamelen();
  5580                                  
  5581 00002B90 E88DD5                   call checknamelen
  5582                                  
  5583                                  ;-525   strcpy(&procname, symbol);
  5584                                  
  5585 00002B93 8D062B81                 lea  ax, [symbol]
  5586 00002B97 50                       push ax
  5587 00002B98 8D06CBD0                 lea  ax, [procname]
  5588 00002B9C 50                       push ax
  5589 00002B9D E89B2E                   call strcpy
  5590 00002BA0 83C404                   add  sp, 4
  5591                                  
  5592                                  ;-526   storecall();
  5593                                  
  5594 00002BA3 E8FDDD                   call storecall
  5595                                  
  5596                                  ;-527   expect('(');
  5597                                  
  5598 00002BA6 6A28                     push 40
  5599 00002BA8 E8AA1D                   call expect
  5600 00002BAB 83C402                   add  sp, 2
  5601                                  
  5602                                  ;-528 	if (istoken(')') ==0 ) {
  5603                                  
  5604 00002BAE 6A29                     push 41
  5605 00002BB0 E8801D                   call istoken
  5606 00002BB3 83C402                   add  sp, 2
  5607 00002BB6 83F800                   cmp ax, 0
  5608 00002BB9 0F85C002                 jne @@docall1314
  5609                                  
  5610                                  ;-529 	  do { narg++;
  5611                                  
  5612                                  @@docall1315:
  5613 00002BBD FF46FC                   inc  word[bp-4]
  5614                                  
  5615                                  ;-530 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  5616                                  
  5617 00002BC0 8B46FC                   mov ax, [bp-4]
  5618 00002BC3 83F809                   cmp ax, 9
  5619 00002BC6 0F8E0900                 jle @@docall1316
  5620 00002BCA 68[C12E]                 push docall1_0
  5621 00002BCD E88A21                   call error1
  5622 00002BD0 83C402                   add  sp, 2
  5623                                  @@docall1316:
  5624 00002BD3 B80000                   mov ax, 0
  5625 00002BD6 8946FA                   mov [bp-6], ax
  5626                                  
  5627                                  ;-531       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  5628                                  
  5629 00002BD9 680101                   push 257
  5630 00002BDC E8541D                   call istoken
  5631 00002BDF 83C402                   add  sp, 2
  5632 00002BE2 08C0                     or  al, al
  5633 00002BE4 0F840C00                 je @@docall1317
  5634 00002BE8 B80100                   mov ax, 1
  5635 00002BEB 8946FA                   mov [bp-6], ax
  5636 00002BEE A1[3900]                 mov ax, [lexval]
  5637 00002BF1 8946F8                   mov [bp-8], ax
  5638                                  
  5639                                  ;-532       if(istoken(T_STRING)){t0=2; n0=nconst;
  5640                                  
  5641                                  @@docall1317:
  5642 00002BF4 680201                   push 258
  5643 00002BF7 E8391D                   call istoken
  5644 00002BFA 83C402                   add  sp, 2
  5645 00002BFD 08C0                     or  al, al
  5646 00002BFF 0F846300                 je @@docall1318
  5647 00002C03 B80200                   mov ax, 2
  5648 00002C06 8946FA                   mov [bp-6], ax
  5649 00002C09 A1[2D00]                 mov ax, [nconst]
  5650 00002C0C 8946F8                   mov [bp-8], ax
  5651                                  
  5652                                  ;-533         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  5653                                  
  5654 00002C0F 68[D32E]                 push docall1_1
  5655 00002C12 E8BE1D                   call eprs
  5656 00002C15 83C402                   add  sp, 2
  5657 00002C18 8D06AB81                 lea  ax, [fname]
  5658 00002C1C 50                       push ax
  5659 00002C1D E8B31D                   call eprs
  5660 00002C20 83C402                   add  sp, 2
  5661 00002C23 6A5F                     push 95
  5662 00002C25 E8981D                   call eprc
  5663 00002C28 83C402                   add  sp, 2
  5664 00002C2B FF36[2D00]               push word [nconst]
  5665 00002C2F E8D31E                   call eprnum
  5666 00002C32 83C402                   add  sp, 2
  5667 00002C35 68[D62E]                 push docall1_2
  5668 00002C38 E8981D                   call eprs
  5669 00002C3B 83C402                   add  sp, 2
  5670                                  
  5671                                  ;-534         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  5672                                  
  5673 00002C3E 6A22                     push 34
  5674 00002C40 E87D1D                   call eprc
  5675 00002C43 83C402                   add  sp, 2
  5676 00002C46 8D062B81                 lea  ax, [symbol]
  5677 00002C4A 50                       push ax
  5678 00002C4B E8851D                   call eprs
  5679 00002C4E 83C402                   add  sp, 2
  5680 00002C51 6A22                     push 34
  5681 00002C53 E86A1D                   call eprc
  5682 00002C56 83C402                   add  sp, 2
  5683 00002C59 68[DB2E]                 push docall1_3
  5684 00002C5C E8741D                   call eprs
  5685 00002C5F 83C402                   add  sp, 2
  5686 00002C62 FF06[2D00]               inc  word[nconst]
  5687                                  
  5688                                  ;-535       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  5689                                  
  5690                                  @@docall1318:
  5691 00002C66 6A26                     push 38
  5692 00002C68 E8C81C                   call istoken
  5693 00002C6B 83C402                   add  sp, 2
  5694 00002C6E 08C0                     or  al, al
  5695 00002C70 0F840F00                 je @@docall1319
  5696 00002C74 B80300                   mov ax, 3
  5697 00002C77 8946FA                   mov [bp-6], ax
  5698 00002C7A E8FEDC                   call name1
  5699 00002C7D E823DB                   call searchname
  5700 00002C80 8946F8                   mov [bp-8], ax
  5701                                  
  5702                                  ;-536       if(istoken(T_NAME))  { n0=checkreg();
  5703                                  
  5704                                  @@docall1319:
  5705 00002C83 680001                   push 256
  5706 00002C86 E8AA1C                   call istoken
  5707 00002C89 83C402                   add  sp, 2
  5708 00002C8C 08C0                     or  al, al
  5709 00002C8E 0F844800                 je @@docall1320
  5710 00002C92 E852EA                   call checkreg
  5711 00002C95 8946F8                   mov [bp-8], ax
  5712                                  
  5713                                  ;-537         if (n0) t0=5;
  5714                                  
  5715 00002C98 8B46F8                   mov ax, [bp-8]
  5716 00002C9B 08C0                     or  al, al
  5717 00002C9D 0F840900                 je @@docall1321
  5718 00002CA1 B80500                   mov ax, 5
  5719 00002CA4 8946FA                   mov [bp-6], ax
  5720                                  
  5721                                  ;-538         else {t0=4; n0=searchname();
  5722                                  
  5723 00002CA7 E93000                   jmp @@docall1322
  5724                                  @@docall1321:
  5725 00002CAA B80400                   mov ax, 4
  5726 00002CAD 8946FA                   mov [bp-6], ax
  5727 00002CB0 E8F0DA                   call searchname
  5728 00002CB3 8946F8                   mov [bp-8], ax
  5729                                  
  5730                                  ;-539           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  5731                                  
  5732 00002CB6 B8B782                   mov ax, GType
  5733 00002CB9 A3[7700]                 mov word [p1], ax
  5734 00002CBC A1[7700]                 mov ax, [p1]
  5735 00002CBF 0346F8                   add ax, [bp-8]
  5736 00002CC2 A3[7700]                 mov word [p1], ax
  5737 00002CC5 8B1E[7700]               mov bx, [p1]
  5738 00002CC9 8A07                     mov al, [bx]
  5739 00002CCB B400                     mov ah, 0
  5740 00002CCD 83F826                   cmp ax, 38
  5741 00002CD0 0F850600                 jne @@docall1323
  5742 00002CD4 B80300                   mov ax, 3
  5743 00002CD7 8946FA                   mov [bp-6], ax
  5744                                  @@docall1323:
  5745                                  @@docall1322:
  5746                                  
  5747                                  ;-540       if (t0==0) error1("parameter not recognized (no * allowed)");
  5748                                  
  5749                                  @@docall1320:
  5750 00002CDA 8B46FA                   mov ax, [bp-6]
  5751 00002CDD 83F800                   cmp ax, 0
  5752 00002CE0 0F850900                 jne @@docall1324
  5753 00002CE4 68[DE2E]                 push docall1_4
  5754 00002CE7 E87020                   call error1
  5755 00002CEA 83C402                   add  sp, 2
  5756                                  
  5757                                  ;-541       docalltype [narg] = t0;
  5758                                  
  5759                                  @@docall1324:
  5760 00002CED 8B46FA                   mov ax, [bp-6]
  5761 00002CF0 8B5EFC                   mov bx, [bp-4]
  5762 00002CF3 D1E3                     shl bx, 1
  5763 00002CF5 8987A3D0                 mov [docalltype+bx], ax
  5764                                  
  5765                                  ;-542       docallvalue[narg] = n0;
  5766                                  
  5767 00002CF9 8B46F8                   mov ax, [bp-8]
  5768 00002CFC 8B5EFC                   mov bx, [bp-4]
  5769 00002CFF D1E3                     shl bx, 1
  5770 00002D01 8987B7D0                 mov [docallvalue+bx], ax
  5771                                  
  5772                                  ;-543     } while (istoken(','));
  5773                                  
  5774 00002D05 6A2C                     push 44
  5775 00002D07 E8291C                   call istoken
  5776 00002D0A 83C402                   add  sp, 2
  5777 00002D0D 08C0                     or  al, al
  5778 00002D0F 0F840300                 je @@docall1325
  5779 00002D13 E9A7FE                   jmp @@docall1315
  5780                                  @@docall1325:
  5781                                  
  5782                                  ;-544     
  5783                                  
  5784                                  
  5785                                  ;-545   	expect(')');  i=narg;
  5786                                  
  5787 00002D16 6A29                     push 41
  5788 00002D18 E83A1C                   call expect
  5789 00002D1B 83C402                   add  sp, 2
  5790 00002D1E 8B46FC                   mov ax, [bp-4]
  5791 00002D21 8946FE                   mov [bp-2], ax
  5792                                  
  5793                                  ;-546     do {
  5794                                  
  5795                                  @@docall1326:
  5796                                  
  5797                                  ;-547       t0 = docalltype [i];
  5798                                  
  5799 00002D24 8B5EFE                   mov bx, [bp-2]
  5800 00002D27 D1E3                     shl bx, 1
  5801 00002D29 8B87A3D0                 mov ax, [docalltype + bx]
  5802 00002D2D 8946FA                   mov [bp-6], ax
  5803                                  
  5804                                  ;-548       n0 = docallvalue[i];     
  5805                                  
  5806 00002D30 8B5EFE                   mov bx, [bp-2]
  5807 00002D33 D1E3                     shl bx, 1
  5808 00002D35 8B87B7D0                 mov ax, [docallvalue + bx]
  5809 00002D39 8946F8                   mov [bp-8], ax
  5810                                  
  5811                                  ;-549       if(t0==1){ prs("\n push "); pint1(n0);}
  5812                                  
  5813 00002D3C 8B46FA                   mov ax, [bp-6]
  5814 00002D3F 83F801                   cmp ax, 1
  5815 00002D42 0F851200                 jne @@docall1327
  5816 00002D46 68[062F]                 push docall1_5
  5817 00002D49 E8251D                   call prs
  5818 00002D4C 83C402                   add  sp, 2
  5819 00002D4F FF76F8                   push word [bp-8]
  5820 00002D52 E8131E                   call pint1
  5821 00002D55 83C402                   add  sp, 2
  5822                                  
  5823                                  ;-550       if(t0==2){ prs("\n push "); if(NASM==0) prs("offset ");
  5824                                  
  5825                                  @@docall1327:
  5826 00002D58 8B46FA                   mov ax, [bp-6]
  5827 00002D5B 83F802                   cmp ax, 2
  5828 00002D5E 0F853700                 jne @@docall1328
  5829 00002D62 68[0F2F]                 push docall1_6
  5830 00002D65 E8091D                   call prs
  5831 00002D68 83C402                   add  sp, 2
  5832 00002D6B A0[1500]                 mov al, [NASM]
  5833 00002D6E 3C00                     cmp al, 0
  5834 00002D70 0F850900                 jne @@docall1329
  5835 00002D74 68[182F]                 push docall1_7
  5836 00002D77 E8F71C                   call prs
  5837 00002D7A 83C402                   add  sp, 2
  5838                                  
  5839                                  ;-551         prs(fname);prc(95);pint1(n0);}
  5840                                  
  5841                                  @@docall1329:
  5842 00002D7D 8D06AB81                 lea  ax, [fname]
  5843 00002D81 50                       push ax
  5844 00002D82 E8EC1C                   call prs
  5845 00002D85 83C402                   add  sp, 2
  5846 00002D88 6A5F                     push 95
  5847 00002D8A E8741C                   call prc
  5848 00002D8D 83C402                   add  sp, 2
  5849 00002D90 FF76F8                   push word [bp-8]
  5850 00002D93 E8D21D                   call pint1
  5851 00002D96 83C402                   add  sp, 2
  5852                                  
  5853                                  ;-552       if(t0==3){ prs("\n lea  ax, "); if(NASM==0)prs("word ptr ");  v(n0);
  5854                                  
  5855                                  @@docall1328:
  5856 00002D99 8B46FA                   mov ax, [bp-6]
  5857 00002D9C 83F803                   cmp ax, 3
  5858 00002D9F 0F852D00                 jne @@docall1330
  5859 00002DA3 68[202F]                 push docall1_8
  5860 00002DA6 E8C81C                   call prs
  5861 00002DA9 83C402                   add  sp, 2
  5862 00002DAC A0[1500]                 mov al, [NASM]
  5863 00002DAF 3C00                     cmp al, 0
  5864 00002DB1 0F850900                 jne @@docall1331
  5865 00002DB5 68[2D2F]                 push docall1_9
  5866 00002DB8 E8B61C                   call prs
  5867 00002DBB 83C402                   add  sp, 2
  5868                                  @@docall1331:
  5869 00002DBE FF76F8                   push word [bp-8]
  5870 00002DC1 E817D3                   call v
  5871 00002DC4 83C402                   add  sp, 2
  5872                                  
  5873                                  ;-553         prs("\n push ax");}
  5874                                  
  5875 00002DC7 68[372F]                 push docall1_10
  5876 00002DCA E8A41C                   call prs
  5877 00002DCD 83C402                   add  sp, 2
  5878                                  
  5879                                  ;-554       if(t0==4){ gettypes(n0); 
  5880                                  
  5881                                  @@docall1330:
  5882 00002DD0 8B46FA                   mov ax, [bp-6]
  5883 00002DD3 83F804                   cmp ax, 4
  5884 00002DD6 0F856700                 jne @@docall1332
  5885 00002DDA FF76F8                   push word [bp-8]
  5886 00002DDD E885D8                   call gettypes
  5887 00002DE0 83C402                   add  sp, 2
  5888                                  
  5889                                  ;-555         if(wi==2) { prs("\n push word ");if(NASM==0)prs("ptr "); v(n0);}
  5890                                  
  5891 00002DE3 A1[4400]                 mov ax, [wi]
  5892 00002DE6 83F802                   cmp ax, 2
  5893 00002DE9 0F852700                 jne @@docall1333
  5894 00002DED 68[422F]                 push docall1_11
  5895 00002DF0 E87E1C                   call prs
  5896 00002DF3 83C402                   add  sp, 2
  5897 00002DF6 A0[1500]                 mov al, [NASM]
  5898 00002DF9 3C00                     cmp al, 0
  5899 00002DFB 0F850900                 jne @@docall1334
  5900 00002DFF 68[502F]                 push docall1_12
  5901 00002E02 E86C1C                   call prs
  5902 00002E05 83C402                   add  sp, 2
  5903                                  @@docall1334:
  5904 00002E08 FF76F8                   push word [bp-8]
  5905 00002E0B E8CDD2                   call v
  5906 00002E0E 83C402                   add  sp, 2
  5907                                  
  5908                                  ;-556         else { prs("\n mov al, byte ");  if(NASM==0)prs("ptr "); v(n0);
  5909                                  
  5910 00002E11 E92D00                   jmp @@docall1335
  5911                                  @@docall1333:
  5912 00002E14 68[552F]                 push docall1_13
  5913 00002E17 E8571C                   call prs
  5914 00002E1A 83C402                   add  sp, 2
  5915 00002E1D A0[1500]                 mov al, [NASM]
  5916 00002E20 3C00                     cmp al, 0
  5917 00002E22 0F850900                 jne @@docall1336
  5918 00002E26 68[662F]                 push docall1_14
  5919 00002E29 E8451C                   call prs
  5920 00002E2C 83C402                   add  sp, 2
  5921                                  @@docall1336:
  5922 00002E2F FF76F8                   push word [bp-8]
  5923 00002E32 E8A6D2                   call v
  5924 00002E35 83C402                   add  sp, 2
  5925                                  
  5926                                  ;-557         prs("\n mov ah, 0\n push ax"); } }
  5927                                  
  5928 00002E38 68[6B2F]                 push docall1_15
  5929 00002E3B E8331C                   call prs
  5930 00002E3E 83C402                   add  sp, 2
  5931                                  @@docall1335:
  5932                                  
  5933                                  ;-558       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  5934                                  
  5935                                  @@docall1332:
  5936 00002E41 8B46FA                   mov ax, [bp-6]
  5937 00002E44 83F805                   cmp ax, 5
  5938 00002E47 0F852200                 jne @@docall1337
  5939 00002E4B 68[822F]                 push docall1_16
  5940 00002E4E E8201C                   call prs
  5941 00002E51 83C402                   add  sp, 2
  5942 00002E54 FF76F8                   push word [bp-8]
  5943 00002E57 E89BEC                   call printreg
  5944 00002E5A 83C402                   add  sp, 2
  5945 00002E5D 8B46F8                   mov ax, [bp-8]
  5946 00002E60 83F82F                   cmp ax, 47 ;unsigned : 1
  5947 00002E63 0F8C0600                 jl  @@docall1338
  5948 00002E67 8B46F6                   mov ax, [bp-10]
  5949 00002E6A 83C002                   add ax, 2
  5950                                  @@docall1338:
  5951                                  
  5952                                  ;-559    i--; } while (i > 0);  }
  5953                                  
  5954                                  @@docall1337:
  5955 00002E6D FF4EFE                   dec  word[bp-2]
  5956 00002E70 8B46FE                   mov ax, [bp-2]
  5957 00002E73 83F800                   cmp ax, 0
  5958 00002E76 0F8E0300                 jle @@docall1339
  5959 00002E7A E9A7FE                   jmp @@docall1326
  5960                                  @@docall1339:
  5961                                  
  5962                                  ;-560 	 prs("\n call "); prs(&procname);
  5963                                  
  5964                                  @@docall1314:
  5965 00002E7D 68[8B2F]                 push docall1_17
  5966 00002E80 E8EE1B                   call prs
  5967 00002E83 83C402                   add  sp, 2
  5968 00002E86 8D06CBD0                 lea  ax, [procname]
  5969 00002E8A 50                       push ax
  5970 00002E8B E8E31B                   call prs
  5971 00002E8E 83C402                   add  sp, 2
  5972                                  
  5973                                  ;-561 	 if (narg>0) {prs("\n add  sp, ");
  5974                                  
  5975 00002E91 8B46FC                   mov ax, [bp-4]
  5976 00002E94 83F800                   cmp ax, 0
  5977 00002E97 0F8E2400                 jle @@docall1340
  5978 00002E9B 68[942F]                 push docall1_18
  5979 00002E9E E8D01B                   call prs
  5980 00002EA1 83C402                   add  sp, 2
  5981                                  
  5982                                  ;-562      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  5983                                  
  5984 00002EA4 8B46FC                   mov ax, [bp-4]
  5985 00002EA7 0346FC                   add ax, [bp-4]
  5986 00002EAA 8946FC                   mov [bp-4], ax
  5987 00002EAD 8B46FC                   mov ax, [bp-4]
  5988 00002EB0 0346F6                   add ax, [bp-10]
  5989 00002EB3 8946FC                   mov [bp-4], ax
  5990 00002EB6 FF76FC                   push word [bp-4]
  5991 00002EB9 E8AC1C                   call pint1
  5992 00002EBC 83C402                   add  sp, 2
  5993                                  @@docall1340:
  5994                                  
  5995                                  ;-563 /****************************************************************************/
  5996                                  
  5997                                  
  5998                                  ;-564 int main() {
  5999 00002EBF C9                       LEAVE
  6000 00002EC0 C3                       ret
  6001                                  ; ENDP
  6002 00002EC1 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  6003 00002ECA 72616D657465727300 
  6004 00002ED3 5C6E00                  docall1_1 db "\n",0
  6005 00002ED6 2064622000              docall1_2 db " db ",0
  6006 00002EDB 2C3000                  docall1_3 db ",0",0
  6007 00002EDE 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  6008 00002EE7 206E6F74207265636F-
  6009 00002EF0 676E697A656420286E-
  6010 00002EF9 6F202A20616C6C6F77-
  6011 00002F02 65642900           
  6012 00002F06 5C6E20707573682000      docall1_5 db "\n push ",0
  6013 00002F0F 5C6E20707573682000      docall1_6 db "\n push ",0
  6014 00002F18 6F66667365742000        docall1_7 db "offset ",0
  6015 00002F20 5C6E206C6561202061-     docall1_8 db "\n lea  ax, ",0
  6016 00002F29 782C2000           
  6017 00002F2D 776F72642070747220-     docall1_9 db "word ptr ",0
  6018 00002F36 00                 
  6019 00002F37 5C6E20707573682061-     docall1_10 db "\n push ax",0
  6020 00002F40 7800               
  6021 00002F42 5C6E20707573682077-     docall1_11 db "\n push word ",0
  6022 00002F4B 6F72642000         
  6023 00002F50 7074722000              docall1_12 db "ptr ",0
  6024 00002F55 5C6E206D6F7620616C-     docall1_13 db "\n mov al, byte ",0
  6025 00002F5E 2C20627974652000   
  6026 00002F66 7074722000              docall1_14 db "ptr ",0
  6027 00002F6B 5C6E206D6F76206168-     docall1_15 db "\n mov ah, 0\n push ax",0
  6028 00002F74 2C20305C6E20707573-
  6029 00002F7D 6820617800         
  6030 00002F82 5C6E20707573682000      docall1_16 db "\n push ",0
  6031 00002F8B 5C6E2063616C6C2000      docall1_17 db "\n call ",0
  6032 00002F94 5C6E20616464202073-     docall1_18 db "\n add  sp, ",0
  6033 00002F9D 702C2000           
  6034                                  
  6035                                  main:  ; *** PROC ***
  6036                                  
  6037                                  ;-565   getarg();
  6038                                  
  6039 00002FA1 E88D00                   call getarg
  6040                                  
  6041                                  ;-566   setblock(4096);
  6042                                  
  6043 00002FA4 680010                   push 4096
  6044 00002FA7 E8C928                   call setblock
  6045 00002FAA 83C402                   add  sp, 2
  6046                                  
  6047                                  ;-567   if (DOS_ERR) error1("SetBlock , AX=");
  6048                                  
  6049 00002FAD A1[7900]                 mov ax, [DOS_ERR]
  6050 00002FB0 08C0                     or  al, al
  6051 00002FB2 0F840900                 je @@main341
  6052 00002FB6 68[F62F]                 push main_0
  6053 00002FB9 E89E1D                   call error1
  6054 00002FBC 83C402                   add  sp, 2
  6055                                  
  6056                                  ;-568   segE=allocmem(4096);
  6057                                  
  6058                                  @@main341:
  6059 00002FBF 680010                   push 4096
  6060 00002FC2 E8C728                   call allocmem
  6061 00002FC5 83C402                   add  sp, 2
  6062 00002FC8 A3[6F00]                 mov word [segE], ax
  6063                                  
  6064                                  ;-569   if (DOS_ERR)  error1("alloc memory, AX=");
  6065                                  
  6066 00002FCB A1[7900]                 mov ax, [DOS_ERR]
  6067 00002FCE 08C0                     or  al, al
  6068 00002FD0 0F840900                 je @@main342
  6069 00002FD4 68[0530]                 push main_1
  6070 00002FD7 E8801D                   call error1
  6071 00002FDA 83C402                   add  sp, 2
  6072                                  
  6073                                  ;-570   CNameTop=0;
  6074                                  
  6075                                  @@main342:
  6076 00002FDD B80000                   mov ax, 0
  6077 00002FE0 A3[6B00]                 mov word [CNameTop], ax
  6078                                  
  6079                                  ;-571   getfirstchar();
  6080                                  
  6081 00002FE3 E83100                   call getfirstchar
  6082                                  
  6083                                  ;-572   parse();
  6084                                  
  6085 00002FE6 E86E03                   call parse
  6086                                  
  6087                                  ;-573   callrecursive=0; checkcalls(); epilog();
  6088                                  
  6089 00002FE9 B80000                   mov ax, 0
  6090 00002FEC A3[3300]                 mov word [callrecursive], ax
  6091 00002FEF E8FC03                   call checkcalls
  6092 00002FF2 E84624                   call epilog
  6093                                  
  6094                                  ;-574 }
  6095                                  
  6096                                  
  6097                                  ;-575 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6098                                  
  6099 00002FF5 C3                       ret
  6100                                  ; ENDP
  6101 00002FF6 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6102 00002FFF 2C2041583D00       
  6103 00003005 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6104 0000300E 6F72792C2041583D00 
  6105                                  
  6106                                  getfirstchar:  ; *** PROC ***
  6107 00003017 B80FD0                   mov ax, fgetsdest
  6108 0000301A A3[6D00]                 mov word [fgetsp], ax
  6109 0000301D B80000                   mov ax, 0
  6110 00003020 8B1E[6D00]               mov  bx, [fgetsp]
  6111 00003024 8807                     mov  [bx], al
  6112 00003026 E83B1C                   call fgets1
  6113 00003029 A2[2A00]                 mov byte [thechar], al
  6114                                  
  6115                                  ;-576 char *arglen=0x80; char *argv=0x82;
  6116                                  
  6117 0000302C C3                       ret
  6118                                  ; ENDP
  6119 0000302D 8000                    arglen dw 128
  6120 0000302F 8200                    argv dw 130
  6121                                  
  6122                                  ;-577 int getarg() { int arglen1; int i; char *c;
  6123                                  
  6124                                  
  6125                                  getarg:  ; *** PROC ***
  6126                                  
  6127                                  ;-578   arglen1=*arglen;
  6128                                  
  6129                                  ;Function : getarg, Number of local variables: 3
  6130                                  ;   # type sign width addr used name   list of local variables
  6131                                  ;  200 var sign word   577 NULL arglen1 = bp-2
  6132                                  ;  201 var sign word   577 NULL i = bp-4
  6133                                  ;  202 ptr sign byte   577 NULL c = bp-6;
  6134 00003031 C8060000                 ENTER  6,0
  6135 00003035 8B1E[2D30]               mov bx, [arglen]
  6136 00003039 8A07                     mov al, [bx]
  6137 0000303B B400                     mov ah, 0
  6138 0000303D 8946FE                   mov [bp-2], ax
  6139                                  
  6140                                  ;-579   if (arglen1) { i=arglen1+129; *i=0; }
  6141                                  
  6142 00003040 8B46FE                   mov ax, [bp-2]
  6143 00003043 08C0                     or  al, al
  6144 00003045 0F841400                 je @@getarg343
  6145 00003049 8B46FE                   mov ax, [bp-2]
  6146 0000304C 058100                   add ax, 129
  6147 0000304F 8946FC                   mov [bp-4], ax
  6148 00003052 B80000                   mov ax, 0
  6149 00003055 8B5EFC                   mov  bx, [bp-4]
  6150 00003058 8907                     mov  [bx], ax
  6151                                  
  6152                                  ;-580   else { cputs(Version1); cputs(" Usage: F.COM [/N] in_file[.C] (/N=NASM): ");
  6153                                  
  6154 0000305A E93900                   jmp @@getarg344
  6155                                  @@getarg343:
  6156 0000305D 8D06[0300]               lea  ax, [Version1]
  6157 00003061 50                       push ax
  6158 00003062 E8CF28                   call cputs
  6159 00003065 83C402                   add  sp, 2
  6160 00003068 68[4B32]                 push getarg_0
  6161 0000306B E8C628                   call cputs
  6162 0000306E 83C402                   add  sp, 2
  6163                                  
  6164                                  ;-581     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6165                                  
  6166 00003071 6A43                     push 67
  6167 00003073 6A00                     push 0
  6168 00003075 FF36[2F30]               push word [argv]
  6169 00003079 E8962B                   call readRL
  6170 0000307C 83C406                   add  sp, 6
  6171 0000307F A3[7B00]                 mov word [DOS_NoBytes], ax
  6172 00003082 A1[7B00]                 mov ax, [DOS_NoBytes]
  6173 00003085 058000                   add ax, 128
  6174 00003088 8946FA                   mov [bp-6], ax
  6175 0000308B B80000                   mov ax, 0
  6176 0000308E 8B5EFA                   mov  bx, [bp-6]
  6177 00003091 8807                     mov  [bx], al
  6178 00003093 E8CD19                   call prnl
  6179                                  
  6180                                  ;-582   strcpy(namein, argv);
  6181                                  
  6182                                  @@getarg344:
  6183 00003096 FF36[2F30]               push word [argv]
  6184 0000309A 8D06EE81                 lea  ax, [namein]
  6185 0000309E 50                       push ax
  6186 0000309F E89929                   call strcpy
  6187 000030A2 83C404                   add  sp, 4
  6188                                  
  6189                                  ;-583   if (instr2(namein, '.') == 0) strcat1(namein, ".C");
  6190                                  
  6191 000030A5 6A2E                     push 46
  6192 000030A7 8D06EE81                 lea  ax, [namein]
  6193 000030AB 50                       push ax
  6194 000030AC E8EE29                   call instr2
  6195 000030AF 83C404                   add  sp, 4
  6196 000030B2 83F800                   cmp ax, 0
  6197 000030B5 0F850E00                 jne @@getarg345
  6198 000030B9 68[7632]                 push getarg_1
  6199 000030BC 8D06EE81                 lea  ax, [namein]
  6200 000030C0 50                       push ax
  6201 000030C1 E8EA2A                   call strcat1
  6202 000030C4 83C404                   add  sp, 4
  6203                                  
  6204                                  ;-584   toupper(namein);
  6205                                  
  6206                                  @@getarg345:
  6207 000030C7 8D06EE81                 lea  ax, [namein]
  6208 000030CB 50                       push ax
  6209 000030CC E80129                   call toupper
  6210 000030CF 83C402                   add  sp, 2
  6211                                  
  6212                                  ;-585   c=instr2(namein, '/');
  6213                                  
  6214 000030D2 6A2F                     push 47
  6215 000030D4 8D06EE81                 lea  ax, [namein]
  6216 000030D8 50                       push ax
  6217 000030D9 E8C129                   call instr2
  6218 000030DC 83C404                   add  sp, 4
  6219 000030DF 8946FA                   mov [bp-6], ax
  6220                                  
  6221                                  ;-586   if (c != 0)  { c++; if (*c == 'N') {NASM=1; c+=2; strcpy(namein, c);  }
  6222                                  
  6223 000030E2 8B46FA                   mov ax, [bp-6]
  6224 000030E5 83F800                   cmp ax, 0
  6225 000030E8 0F843D00                 je  @@getarg346
  6226 000030EC FF46FA                   inc  word[bp-6]
  6227 000030EF 8B5EFA                   mov bx, [bp-6]
  6228 000030F2 8A07                     mov al, [bx]
  6229 000030F4 B400                     mov ah, 0
  6230 000030F6 83F84E                   cmp ax, 78
  6231 000030F9 0F851B00                 jne @@getarg347
  6232 000030FD B80100                   mov ax, 1
  6233 00003100 A2[1500]                 mov byte [NASM], al
  6234 00003103 8346FA02                 add  word[bp-6], 2
  6235 00003107 FF76FA                   push word [bp-6]
  6236 0000310A 8D06EE81                 lea  ax, [namein]
  6237 0000310E 50                       push ax
  6238 0000310F E82929                   call strcpy
  6239 00003112 83C404                   add  sp, 4
  6240                                  
  6241                                  ;-587     else {cputs("Parameter unknown "); exitR(3);  }  }
  6242                                  
  6243 00003115 E91100                   jmp @@getarg348
  6244                                  @@getarg347:
  6245 00003118 68[7932]                 push getarg_2
  6246 0000311B E81628                   call cputs
  6247 0000311E 83C402                   add  sp, 2
  6248 00003121 6A03                     push 3
  6249 00003123 E8242B                   call exitR
  6250 00003126 83C402                   add  sp, 2
  6251                                  @@getarg348:
  6252                                  
  6253                                  ;-588   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6254                                  
  6255                                  @@getarg346:
  6256 00003129 8D06EE81                 lea  ax, [namein]
  6257 0000312D 50                       push ax
  6258 0000312E 8D063182                 lea  ax, [namelst]
  6259 00003132 50                       push ax
  6260 00003133 E80529                   call strcpy
  6261 00003136 83C404                   add  sp, 4
  6262 00003139 8D063182                 lea  ax, [namelst]
  6263 0000313D 50                       push ax
  6264 0000313E E8D228                   call strlen
  6265 00003141 83C402                   add  sp, 2
  6266 00003144 8946FC                   mov [bp-4], ax
  6267 00003147 FF4EFC                   dec  word[bp-4]
  6268 0000314A B83182                   mov ax, namelst
  6269 0000314D 0346FC                   add ax, [bp-4]
  6270 00003150 8946FA                   mov [bp-6], ax
  6271 00003153 B85300                   mov ax, 83
  6272 00003156 8B5EFA                   mov  bx, [bp-6]
  6273 00003159 8807                     mov  [bx], al
  6274                                  
  6275                                  ;-589  
  6276                                  
  6277                                  
  6278                                  ;-590   fdin=openR (namein);
  6279                                  
  6280 0000315B 8D06EE81                 lea  ax, [namein]
  6281 0000315F 50                       push ax
  6282 00003160 E8792A                   call openR
  6283 00003163 83C402                   add  sp, 2
  6284 00003166 A3[2100]                 mov word [fdin], ax
  6285                                  
  6286                                  ;-591   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6287                                  
  6288 00003169 A1[7900]                 mov ax, [DOS_ERR]
  6289 0000316C 08C0                     or  al, al
  6290 0000316E 0F841C00                 je @@getarg349
  6291 00003172 68[8C32]                 push getarg_3
  6292 00003175 E8BC27                   call cputs
  6293 00003178 83C402                   add  sp, 2
  6294 0000317B 8D06EE81                 lea  ax, [namein]
  6295 0000317F 50                       push ax
  6296 00003180 E8B127                   call cputs
  6297 00003183 83C402                   add  sp, 2
  6298 00003186 6A01                     push 1
  6299 00003188 E8BF2A                   call exitR
  6300 0000318B 83C402                   add  sp, 2
  6301                                  
  6302                                  ;-592   fdout=creatR(namelst);
  6303                                  
  6304                                  @@getarg349:
  6305 0000318E 8D063182                 lea  ax, [namelst]
  6306 00003192 50                       push ax
  6307 00003193 E8552A                   call creatR
  6308 00003196 83C402                   add  sp, 2
  6309 00003199 A3[2300]                 mov word [fdout], ax
  6310                                  
  6311                                  ;-593   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6312                                  
  6313 0000319C A1[7900]                 mov ax, [DOS_ERR]
  6314 0000319F 08C0                     or  al, al
  6315 000031A1 0F841C00                 je @@getarg350
  6316 000031A5 68[A732]                 push getarg_4
  6317 000031A8 E88927                   call cputs
  6318 000031AB 83C402                   add  sp, 2
  6319 000031AE 8D063182                 lea  ax, [namelst]
  6320 000031B2 50                       push ax
  6321 000031B3 E87E27                   call cputs
  6322 000031B6 83C402                   add  sp, 2
  6323 000031B9 6A02                     push 2
  6324 000031BB E88C2A                   call exitR
  6325 000031BE 83C402                   add  sp, 2
  6326                                  
  6327                                  ;-594   prs("\n; ");prs(Version1);
  6328                                  
  6329                                  @@getarg350:
  6330 000031C1 68[C132]                 push getarg_5
  6331 000031C4 E8AA18                   call prs
  6332 000031C7 83C402                   add  sp, 2
  6333 000031CA 8D06[0300]               lea  ax, [Version1]
  6334 000031CE 50                       push ax
  6335 000031CF E89F18                   call prs
  6336 000031D2 83C402                   add  sp, 2
  6337                                  
  6338                                  ;-595   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}
  6339                                  
  6340 000031D5 68[C632]                 push getarg_6
  6341 000031D8 E89618                   call prs
  6342 000031DB 83C402                   add  sp, 2
  6343 000031DE FF76FE                   push word [bp-2]
  6344 000031E1 E88419                   call pint1
  6345 000031E4 83C402                   add  sp, 2
  6346 000031E7 8B46FE                   mov ax, [bp-2]
  6347 000031EA 08C0                     or  al, al
  6348 000031EC 0F841300                 je @@getarg351
  6349 000031F0 68[D132]                 push getarg_7
  6350 000031F3 E87B18                   call prs
  6351 000031F6 83C402                   add  sp, 2
  6352 000031F9 FF36[2F30]               push word [argv]
  6353 000031FD E87118                   call prs
  6354 00003200 83C402                   add  sp, 2
  6355                                  
  6356                                  ;-596   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6357                                  
  6358                                  @@getarg351:
  6359 00003203 68[DA32]                 push getarg_8
  6360 00003206 E86818                   call prs
  6361 00003209 83C402                   add  sp, 2
  6362 0000320C 8D06EE81                 lea  ax, [namein]
  6363 00003210 50                       push ax
  6364 00003211 E85D18                   call prs
  6365 00003214 83C402                   add  sp, 2
  6366 00003217 68[E532]                 push getarg_9
  6367 0000321A E85418                   call prs
  6368 0000321D 83C402                   add  sp, 2
  6369 00003220 8D063182                 lea  ax, [namelst]
  6370 00003224 50                       push ax
  6371 00003225 E84918                   call prs
  6372 00003228 83C402                   add  sp, 2
  6373                                  
  6374                                  ;-597   if (NASM) prs("\norg  256 ; NASM ON\njmp main"); else
  6375                                  
  6376 0000322B A0[1500]                 mov al, [NASM]
  6377 0000322E 08C0                     or  al, al
  6378 00003230 0F840C00                 je @@getarg352
  6379 00003234 68[F432]                 push getarg_10
  6380 00003237 E83718                   call prs
  6381 0000323A 83C402                   add  sp, 2
  6382                                  
  6383                                  ;-598   prs("\n.MODEL TINY,C\n.386P\n.CODE\nJUMPS\nLOCALS\nSTARTUPCODE\njmp main");
  6384                                  
  6385 0000323D E90900                   jmp @@getarg353
  6386                                  @@getarg352:
  6387 00003240 68[1333]                 push getarg_11
  6388 00003243 E82B18                   call prs
  6389 00003246 83C402                   add  sp, 2
  6390                                  
  6391                                  ;-599 }
  6392                                  
  6393                                  @@getarg353:
  6394                                  
  6395                                  ;-600 int parse() { token=getlex(); do {
  6396 00003249 C9                       LEAVE
  6397 0000324A C3                       ret
  6398                                  ; ENDP
  6399 0000324B 2055736167653A2046-     getarg_0 db " Usage: F.COM [/N] in_file[.C] (/N=NASM): ",0
  6400 00003254 2E434F4D205B2F4E5D-
  6401 0000325D 20696E5F66696C655B-
  6402 00003266 2E435D20282F4E3D4E-
  6403 0000326F 41534D293A2000     
  6404 00003276 2E4300                  getarg_1 db ".C",0
  6405 00003279 506172616D65746572-     getarg_2 db "Parameter unknown ",0
  6406 00003282 20756E6B6E6F776E20-
  6407 0000328B 00                 
  6408 0000328C 536F75726365206669-     getarg_3 db "Source file missing (.C): ",0
  6409 00003295 6C65206D697373696E-
  6410 0000329E 6720282E43293A2000 
  6411 000032A7 6C6973742066696C65-     getarg_4 db "list file not creatable: ",0
  6412 000032B0 206E6F742063726561-
  6413 000032B9 7461626C653A2000   
  6414 000032C1 5C6E3B2000              getarg_5 db "\n; ",0
  6415 000032C6 2C204172676C656E3A-     getarg_6 db ", Arglen: ",0
  6416 000032CF 2000               
  6417 000032D1 2C20417267763A2000      getarg_7 db ", Argv: ",0
  6418 000032DA 2C20536F757263653A-     getarg_8 db ", Source: ",0
  6419 000032E3 2000               
  6420 000032E5 2C204F757470757420-     getarg_9 db ", Output asm: ",0
  6421 000032EE 61736D3A2000       
  6422 000032F4 5C6E6F726720203235-     getarg_10 db "\norg  256 ; NASM ON\njmp main",0
  6423 000032FD 36203B204E41534D20-
  6424 00003306 4F4E5C6E6A6D70206D-
  6425 0000330F 61696E00           
  6426 00003313 5C6E2E4D4F44454C20-     getarg_11 db "\n.MODEL TINY,C\n.386P\n.CODE\nJUMPS\nLOCALS\nSTARTUPCODE\njmp main",0
  6427 0000331C 54494E592C435C6E2E-
  6428 00003325 333836505C6E2E434F-
  6429 0000332E 44455C6E4A554D5053-
  6430 00003337 5C6E4C4F43414C535C-
  6431 00003340 6E5354415254555043-
  6432 00003349 4F44455C6E6A6D7020-
  6433 00003352 6D61696E00         
  6434                                  
  6435                                  parse:  ; *** PROC ***
  6436 00003357 E8120E                   call getlex
  6437 0000335A A3[2500]                 mov word [token], ax
  6438                                  @@parse354:
  6439                                  
  6440                                  ;-601     if (token <= 0) return 1;
  6441                                  
  6442 0000335D A1[2500]                 mov ax, [token]
  6443 00003360 83F800                   cmp ax, 0
  6444 00003363 0F8F0600                 jg  @@parse355
  6445 00003367 B80100                   mov ax, 1
  6446 0000336A E96500                   jmp @@retn
  6447                                  
  6448                                  ;-602     if (istoken('#')) {
  6449                                  
  6450                                  @@parse355:
  6451 0000336D 6A23                     push 35
  6452 0000336F E8C115                   call istoken
  6453 00003372 83C402                   add  sp, 2
  6454 00003375 08C0                     or  al, al
  6455 00003377 0F843600                 je @@parse356
  6456                                  
  6457                                  ;-603       if (istoken(T_DEFINE)) dodefine();
  6458                                  
  6459 0000337B 68FF01                   push 511
  6460 0000337E E8B215                   call istoken
  6461 00003381 83C402                   add  sp, 2
  6462 00003384 08C0                     or  al, al
  6463 00003386 0F840600                 je @@parse357
  6464 0000338A E83D05                   call dodefine
  6465                                  
  6466                                  ;-604       else if (istoken(T_INCLUDE)) doinclude();
  6467                                  
  6468 0000338D E91E00                   jmp @@parse358
  6469                                  @@parse357:
  6470 00003390 68FE01                   push 510
  6471 00003393 E89D15                   call istoken
  6472 00003396 83C402                   add  sp, 2
  6473 00003399 08C0                     or  al, al
  6474 0000339B 0F840600                 je @@parse359
  6475 0000339F E84204                   call doinclude
  6476                                  
  6477                                  ;-605       else error1("define or include expected");  }
  6478                                  
  6479 000033A2 E90900                   jmp @@parse360
  6480                                  @@parse359:
  6481 000033A5 68[D333]                 push parse_0
  6482 000033A8 E8AF19                   call error1
  6483 000033AB 83C402                   add  sp, 2
  6484                                  @@parse360:
  6485                                  @@parse358:
  6486                                  
  6487                                  ;-606     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6488                                  
  6489 000033AE E91600                   jmp @@parse361
  6490                                  @@parse356:
  6491 000033B1 E8BED4                   call typeName
  6492 000033B4 A1[2500]                 mov ax, [token]
  6493 000033B7 83F828                   cmp ax, 40
  6494 000033BA 0F850600                 jne @@parse362
  6495 000033BE E8F5D7                   call dofunc
  6496 000033C1 E90300                   jmp @@parse363
  6497                                  @@parse362:
  6498 000033C4 E8A5CD                   call doglob
  6499                                  @@parse363:
  6500                                  
  6501                                  ;-607   } while(1);
  6502                                  
  6503                                  @@parse361:
  6504 000033C7 B80100                   mov ax, 1
  6505 000033CA 08C0                     or  al, al
  6506 000033CC 0F840200                 je @@parse364
  6507 000033D0 EB8B                     jmp @@parse354
  6508                                  @@parse364:
  6509                                  
  6510                                  ;-608 }
  6511                                  
  6512                                  
  6513                                  ;-609 int checkcalls() { int i; int j; int k;
  6514                                  
  6515                                  @@retn:
  6516 000033D2 C3                       ret
  6517                                  ; ENDP
  6518 000033D3 646566696E65206F72-     parse_0 db "define or include expected",0
  6519 000033DC 20696E636C75646520-
  6520 000033E5 657870656374656400 
  6521                                  
  6522                                  checkcalls:  ; *** PROC ***
  6523                                  
  6524                                  ;-610   prs("\n \n; missing functions: ");
  6525                                  
  6526                                  ;Function : checkcalls, Number of local variables: 3
  6527                                  ;   # type sign width addr used name   list of local variables
  6528                                  ;  200 var sign word   609 NULL i = bp-2
  6529                                  ;  201 var sign word   609 NULL j = bp-4
  6530                                  ;  202 var sign word   609 NULL k = bp-6;
  6531 000033EE C8060000                 ENTER  6,0
  6532 000033F2 68[CB34]                 push checkcalls_0
  6533 000033F5 E87916                   call prs
  6534 000033F8 83C402                   add  sp, 2
  6535                                  
  6536                                  ;-611   i=0;  k=0;
  6537                                  
  6538 000033FB B80000                   mov ax, 0
  6539 000033FE 8946FE                   mov [bp-2], ax
  6540 00003401 B80000                   mov ax, 0
  6541 00003404 8946FA                   mov [bp-6], ax
  6542                                  
  6543                                  ;-612   while (i < CTop) {
  6544                                  
  6545                                  @@checkcalls365:
  6546 00003407 8B46FE                   mov ax, [bp-2]
  6547 0000340A 3B06[4800]               cmp ax, [CTop]
  6548 0000340E 0F8D8F00                 jge @@checkcalls366
  6549                                  
  6550                                  ;-613     pt=CAdr[i];
  6551                                  
  6552 00003412 8B5EFE                   mov bx, [bp-2]
  6553 00003415 D1E3                     shl bx, 1
  6554 00003417 8B8757AB                 mov ax, [CAdr + bx]
  6555 0000341B A3[7500]                 mov word [pt], ax
  6556                                  
  6557                                  ;-614     from_far(NameA, pt);
  6558                                  
  6559 0000341E FF36[7500]               push word [pt]
  6560 00003422 8D06[4A00]               lea  ax, [NameA]
  6561 00003426 50                       push ax
  6562 00003427 E8C924                   call from_far
  6563 0000342A 83C404                   add  sp, 4
  6564                                  
  6565                                  ;-615     j=0;
  6566                                  
  6567 0000342D B80000                   mov ax, 0
  6568 00003430 8946FC                   mov [bp-4], ax
  6569                                  
  6570                                  ;-616     do { p1=adrF(FNameField, j);
  6571                                  
  6572                                  @@checkcalls367:
  6573 00003433 FF76FC                   push word [bp-4]
  6574 00003436 8D064FBD                 lea  ax, [FNameField]
  6575 0000343A 50                       push ax
  6576 0000343B E8F2D2                   call adrF
  6577 0000343E 83C404                   add  sp, 4
  6578 00003441 A3[7700]                 mov word [p1], ax
  6579                                  
  6580                                  ;-617       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6581                                  
  6582 00003444 FF36[7700]               push word [p1]
  6583 00003448 8D06[4A00]               lea  ax, [NameA]
  6584 0000344C 50                       push ax
  6585 0000344D E81227                   call eqstr
  6586 00003450 83C404                   add  sp, 4
  6587 00003453 08C0                     or  al, al
  6588 00003455 0F841000                 je @@checkcalls368
  6589 00003459 B80100                   mov ax, 1
  6590 0000345C 8B5EFE                   mov bx, [bp-2]
  6591 0000345F 88872FA1                 mov [CType+bx], al
  6592 00003463 A1[4600]                 mov ax, [FTop]
  6593 00003466 8946FC                   mov [bp-4], ax
  6594                                  
  6595                                  ;-618       j++; } while (j < FTop);
  6596                                  
  6597                                  @@checkcalls368:
  6598 00003469 FF46FC                   inc  word[bp-4]
  6599 0000346C 8B46FC                   mov ax, [bp-4]
  6600 0000346F 3B06[4600]               cmp ax, [FTop]
  6601 00003473 0F8D0200                 jge @@checkcalls369
  6602 00003477 EBBA                     jmp @@checkcalls367
  6603                                  @@checkcalls369:
  6604                                  
  6605                                  ;-619     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6606                                  
  6607 00003479 8B46FC                   mov ax, [bp-4]
  6608 0000347C 3B06[4600]               cmp ax, [FTop]
  6609 00003480 0F851700                 jne @@checkcalls370
  6610 00003484 FF46FA                   inc  word[bp-6]
  6611 00003487 68[E634]                 push checkcalls_1
  6612 0000348A E8E415                   call prs
  6613 0000348D 83C402                   add  sp, 2
  6614 00003490 8D06[4A00]               lea  ax, [NameA]
  6615 00003494 50                       push ax
  6616 00003495 E8D915                   call prs
  6617 00003498 83C402                   add  sp, 2
  6618                                  
  6619                                  ;-620     i++; }
  6620                                  
  6621                                  @@checkcalls370:
  6622 0000349B FF46FE                   inc  word[bp-2]
  6623                                  
  6624                                  ;-621   if (k!=0) doar(k); else {prs(" All FUNCTIONs in place");
  6625                                  
  6626 0000349E E966FF                   jmp @@checkcalls365
  6627                                  @@checkcalls366:
  6628 000034A1 8B46FA                   mov ax, [bp-6]
  6629 000034A4 83F800                   cmp ax, 0
  6630 000034A7 0F840C00                 je  @@checkcalls371
  6631 000034AB FF76FA                   push word [bp-6]
  6632 000034AE E86400                   call doar
  6633 000034B1 83C402                   add  sp, 2
  6634 000034B4 E91200                   jmp @@checkcalls372
  6635                                  @@checkcalls371:
  6636 000034B7 68[EB34]                 push checkcalls_2
  6637 000034BA E8B415                   call prs
  6638 000034BD 83C402                   add  sp, 2
  6639                                  
  6640                                  ;-622     cputs("  All CALLs OK! "); }
  6641                                  
  6642 000034C0 68[0335]                 push checkcalls_3
  6643 000034C3 E86E24                   call cputs
  6644 000034C6 83C402                   add  sp, 2
  6645                                  
  6646                                  ;-623 }
  6647                                  
  6648                                  @@checkcalls372:
  6649                                  
  6650                                  ;-624 char wasfunction;
  6651 000034C9 C9                       LEAVE
  6652 000034CA C3                       ret
  6653                                  ; ENDP
  6654 000034CB 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6655 000034D4 7373696E672066756E-
  6656 000034DD 6374696F6E733A2000 
  6657 000034E6 5C6E3B2000              checkcalls_1 db "\n; ",0
  6658 000034EB 20416C6C2046554E43-     checkcalls_2 db " All FUNCTIONs in place",0
  6659 000034F4 54494F4E7320696E20-
  6660 000034FD 706C61636500       
  6661 00003503 2020416C6C2043414C-     checkcalls_3 db "  All CALLs OK! ",0
  6662 0000350C 4C73204F4B212000   
  6663 00003514 00                      wasfunction db 0
  6664                                  
  6665                                  ;-625 int doar(int k) { int i; int fdtemp; int fdout1; int used; int found;
  6666                                  
  6667                                  
  6668                                  doar:  ; *** PROC ***
  6669                                  
  6670                                  ;-626   cputs("  Open CALLs :"); pint(k);
  6671                                  
  6672                                  ;Function : doar, Number of local variables: 6
  6673                                  ;   # type sign width addr used name   list of local variables
  6674                                  ;  200 var sign word   625 NULL k = bp+4
  6675                                  ;  201 var sign word   625 NULL i = bp-2
  6676                                  ;  202 var sign word   625 NULL fdtemp = bp-4
  6677                                  ;  203 var sign word   625 NULL fdout1 = bp-6
  6678                                  ;  204 var sign word   625 NULL used = bp-8
  6679                                  ;  205 var sign word   625 NULL found = bp-10;
  6680 00003515 C80A0000                 ENTER  10,0
  6681 00003519 68[9F36]                 push doar_0
  6682 0000351C E81524                   call cputs
  6683 0000351F 83C402                   add  sp, 2
  6684 00003522 FF7604                   push word [bp+4]
  6685 00003525 E84524                   call pint
  6686 00003528 83C402                   add  sp, 2
  6687                                  
  6688                                  ;-627   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6689                                  
  6690 0000352B 68[AE36]                 push doar_1
  6691 0000352E E84015                   call prs
  6692 00003531 83C402                   add  sp, 2
  6693 00003534 FF7604                   push word [bp+4]
  6694 00003537 E8D316                   call printint51
  6695 0000353A 83C402                   add  sp, 2
  6696                                  
  6697                                  ;-628   fdin=openR (archivename);
  6698                                  
  6699 0000353D 8D067482                 lea  ax, [archivename]
  6700 00003541 50                       push ax
  6701 00003542 E89726                   call openR
  6702 00003545 83C402                   add  sp, 2
  6703 00003548 A3[2100]                 mov word [fdin], ax
  6704                                  
  6705                                  ;-629   if(DOS_ERR){cputs("Archive file missing: "); cputs(archivename); exitR(3); }
  6706                                  
  6707 0000354B A1[7900]                 mov ax, [DOS_ERR]
  6708 0000354E 08C0                     or  al, al
  6709 00003550 0F841C00                 je @@doar373
  6710 00003554 68[CF36]                 push doar_2
  6711 00003557 E8DA23                   call cputs
  6712 0000355A 83C402                   add  sp, 2
  6713 0000355D 8D067482                 lea  ax, [archivename]
  6714 00003561 50                       push ax
  6715 00003562 E8CF23                   call cputs
  6716 00003565 83C402                   add  sp, 2
  6717 00003568 6A03                     push 3
  6718 0000356A E8DD26                   call exitR
  6719 0000356D 83C402                   add  sp, 2
  6720                                  
  6721                                  ;-630   prs("\n;use archive file: "); prs(archivename);
  6722                                  
  6723                                  @@doar373:
  6724 00003570 68[E636]                 push doar_3
  6725 00003573 E8FB14                   call prs
  6726 00003576 83C402                   add  sp, 2
  6727 00003579 8D067482                 lea  ax, [archivename]
  6728 0000357D 50                       push ax
  6729 0000357E E8F014                   call prs
  6730 00003581 83C402                   add  sp, 2
  6731                                  
  6732                                  ;-631   fdtemp=fdout;
  6733                                  
  6734 00003584 A1[2300]                 mov ax, [fdout]
  6735 00003587 8946FC                   mov [bp-4], ax
  6736                                  
  6737                                  ;-632   wasfunction=0;
  6738                                  
  6739 0000358A B80000                   mov ax, 0
  6740 0000358D A2[1435]                 mov byte [wasfunction], al
  6741                                  
  6742                                  ;-633   getfirstchar();
  6743                                  
  6744 00003590 E884FA                   call getfirstchar
  6745                                  
  6746                                  ;-634   do { fdout=0;do {found=getfunctionhead();}while (found==0); fdout=fdtemp;
  6747                                  
  6748                                  @@doar374:
  6749 00003593 B80000                   mov ax, 0
  6750 00003596 A3[2300]                 mov word [fdout], ax
  6751                                  @@doar375:
  6752 00003599 E8E401                   call getfunctionhead
  6753 0000359C 8946F6                   mov [bp-10], ax
  6754 0000359F 8B46F6                   mov ax, [bp-10]
  6755 000035A2 83F800                   cmp ax, 0
  6756 000035A5 0F850200                 jne @@doar376
  6757 000035A9 EBEE                     jmp @@doar375
  6758                                  @@doar376:
  6759 000035AB 8B46FC                   mov ax, [bp-4]
  6760 000035AE A3[2300]                 mov word [fdout], ax
  6761                                  
  6762                                  ;-635        if (found > 0) {
  6763                                  
  6764 000035B1 8B46F6                   mov ax, [bp-10]
  6765 000035B4 83F800                   cmp ax, 0
  6766 000035B7 0F8E9F00                 jle @@doar377
  6767                                  
  6768                                  ;-636          used=0; i=0;
  6769                                  
  6770 000035BB B80000                   mov ax, 0
  6771 000035BE 8946F8                   mov [bp-8], ax
  6772 000035C1 B80000                   mov ax, 0
  6773 000035C4 8946FE                   mov [bp-2], ax
  6774                                  
  6775                                  ;-637          while (i < CTop) {
  6776                                  
  6777                                  @@doar378:
  6778 000035C7 8B46FE                   mov ax, [bp-2]
  6779 000035CA 3B06[4800]               cmp ax, [CTop]
  6780 000035CE 0F8D5000                 jge @@doar379
  6781                                  
  6782                                  ;-638            pt=CAdr[i];
  6783                                  
  6784 000035D2 8B5EFE                   mov bx, [bp-2]
  6785 000035D5 D1E3                     shl bx, 1
  6786 000035D7 8B8757AB                 mov ax, [CAdr + bx]
  6787 000035DB A3[7500]                 mov word [pt], ax
  6788                                  
  6789                                  ;-639            from_far(NameA, pt);
  6790                                  
  6791 000035DE FF36[7500]               push word [pt]
  6792 000035E2 8D06[4A00]               lea  ax, [NameA]
  6793 000035E6 50                       push ax
  6794 000035E7 E80923                   call from_far
  6795 000035EA 83C404                   add  sp, 4
  6796                                  
  6797                                  ;-640            if (eqstr(symbol, NameA)) {
  6798                                  
  6799 000035ED 8D06[4A00]               lea  ax, [NameA]
  6800 000035F1 50                       push ax
  6801 000035F2 8D062B81                 lea  ax, [symbol]
  6802 000035F6 50                       push ax
  6803 000035F7 E86825                   call eqstr
  6804 000035FA 83C404                   add  sp, 4
  6805 000035FD 08C0                     or  al, al
  6806 000035FF 0F841A00                 je @@doar380
  6807                                  
  6808                                  ;-641              if (CType[i] == 0) {CType[i]=1; used++; } }  i++; }
  6809                                  
  6810 00003603 8B5EFE                   mov bx, [bp-2]
  6811 00003606 8A872FA1                 mov al, [CType + bx]
  6812 0000360A 3C00                     cmp al, 0
  6813 0000360C 0F850D00                 jne @@doar381
  6814 00003610 B80100                   mov ax, 1
  6815 00003613 8B5EFE                   mov bx, [bp-2]
  6816 00003616 88872FA1                 mov [CType+bx], al
  6817 0000361A FF46F8                   inc  word[bp-8]
  6818                                  @@doar381:
  6819                                  @@doar380:
  6820 0000361D FF46FE                   inc  word[bp-2]
  6821                                  
  6822                                  ;-642            if (used) {
  6823                                  
  6824 00003620 EBA5                     jmp @@doar378
  6825                                  @@doar379:
  6826 00003622 8B46F8                   mov ax, [bp-8]
  6827 00003625 08C0                     or  al, al
  6828 00003627 0F842F00                 je @@doar382
  6829                                  
  6830                                  ;-643               prs("\n;Number of CALLs:"); printint51(used);
  6831                                  
  6832 0000362B 68[FC36]                 push doar_4
  6833 0000362E E84014                   call prs
  6834 00003631 83C402                   add  sp, 2
  6835 00003634 FF76F8                   push word [bp-8]
  6836 00003637 E8D315                   call printint51
  6837 0000363A 83C402                   add  sp, 2
  6838                                  
  6839                                  ;-644               prs(" : "); prs(symbol); dofunc(); wasfunction=1; }
  6840                                  
  6841 0000363D 68[1037]                 push doar_5
  6842 00003640 E82E14                   call prs
  6843 00003643 83C402                   add  sp, 2
  6844 00003646 8D062B81                 lea  ax, [symbol]
  6845 0000364A 50                       push ax
  6846 0000364B E82314                   call prs
  6847 0000364E 83C402                   add  sp, 2
  6848 00003651 E862D5                   call dofunc
  6849 00003654 B80100                   mov ax, 1
  6850 00003657 A2[1435]                 mov byte [wasfunction], al
  6851                                  
  6852                                  ;-645         }
  6853                                  
  6854                                  @@doar382:
  6855                                  
  6856                                  ;-646      } while (token);
  6857                                  
  6858                                  @@doar377:
  6859 0000365A A1[2500]                 mov ax, [token]
  6860 0000365D 08C0                     or  al, al
  6861 0000365F 0F840300                 je @@doar383
  6862 00003663 E92DFF                   jmp @@doar374
  6863                                  @@doar383:
  6864                                  
  6865                                  ;-647   prs("\n;End of archive file. ");
  6866                                  
  6867 00003666 68[1437]                 push doar_6
  6868 00003669 E80514                   call prs
  6869 0000366C 83C402                   add  sp, 2
  6870                                  
  6871                                  ;-648   callrecursive++; if (callrecursive < 5) checkcalls();
  6872                                  
  6873 0000366F FF06[3300]               inc  word[callrecursive]
  6874 00003673 A1[3300]                 mov ax, [callrecursive]
  6875 00003676 83F805                   cmp ax, 5
  6876 00003679 0F8D0600                 jge @@doar384
  6877 0000367D E86EFD                   call checkcalls
  6878                                  
  6879                                  ;-649     else {putch(10); cputs("***ERROR*** function(s) missing! ");
  6880                                  
  6881 00003680 E91A00                   jmp @@doar385
  6882                                  @@doar384:
  6883 00003683 6A0A                     push 10
  6884 00003685 E89322                   call putch
  6885 00003688 83C402                   add  sp, 2
  6886 0000368B 68[2D37]                 push doar_7
  6887 0000368E E8A322                   call cputs
  6888 00003691 83C402                   add  sp, 2
  6889                                  
  6890                                  ;-650     error1("At least 1 function is missing in archive file! "); }
  6891                                  
  6892 00003694 68[4F37]                 push doar_8
  6893 00003697 E8C016                   call error1
  6894 0000369A 83C402                   add  sp, 2
  6895                                  
  6896                                  ;-651 }
  6897                                  
  6898                                  @@doar385:
  6899                                  
  6900                                  ;-652 int getfunctionhead() {
  6901 0000369D C9                       LEAVE
  6902 0000369E C3                       ret
  6903                                  ; ENDP
  6904 0000369F 20204F70656E204341-     doar_0 db "  Open CALLs :",0
  6905 000036A8 4C4C73203A00       
  6906 000036AE 5C6E3B204E756D6265-     doar_1 db "\n; Number of unresolved CALLs :",0
  6907 000036B7 72206F6620756E7265-
  6908 000036C0 736F6C766564204341-
  6909 000036C9 4C4C73203A00       
  6910 000036CF 417263686976652066-     doar_2 db "Archive file missing: ",0
  6911 000036D8 696C65206D69737369-
  6912 000036E1 6E673A2000         
  6913 000036E6 5C6E3B757365206172-     doar_3 db "\n;use archive file: ",0
  6914 000036EF 63686976652066696C-
  6915 000036F8 653A2000           
  6916 000036FC 5C6E3B4E756D626572-     doar_4 db "\n;Number of CALLs:",0
  6917 00003705 206F662043414C4C73-
  6918 0000370E 3A00               
  6919 00003710 203A2000                doar_5 db " : ",0
  6920 00003714 5C6E3B456E64206F66-     doar_6 db "\n;End of archive file. ",0
  6921 0000371D 206172636869766520-
  6922 00003726 66696C652E2000     
  6923 0000372D 2A2A2A4552524F522A-     doar_7 db "***ERROR*** function(s) missing! ",0
  6924 00003736 2A2A2066756E637469-
  6925 0000373F 6F6E287329206D6973-
  6926 00003748 73696E67212000     
  6927 0000374F 4174206C6561737420-     doar_8 db "At least 1 function is missing in archive file! ",0
  6928 00003758 312066756E6374696F-
  6929 00003761 6E206973206D697373-
  6930 0000376A 696E6720696E206172-
  6931 00003773 63686976652066696C-
  6932 0000377C 65212000           
  6933                                  
  6934                                  getfunctionhead:  ; *** PROC ***
  6935                                  
  6936                                  ;-653   if (wasfunction) wasfunction=0; else token=getlex();
  6937                                  
  6938 00003780 A0[1435]                 mov al, [wasfunction]
  6939 00003783 08C0                     or  al, al
  6940 00003785 0F840900                 je @@getfunctionhead386
  6941 00003789 B80000                   mov ax, 0
  6942 0000378C A2[1435]                 mov byte [wasfunction], al
  6943 0000378F E90600                   jmp @@getfunctionhead387
  6944                                  @@getfunctionhead386:
  6945 00003792 E8D709                   call getlex
  6946 00003795 A3[2500]                 mov word [token], ax
  6947                                  
  6948                                  ;-654   if (token == 0) return 0xFFFF;
  6949                                  
  6950                                  @@getfunctionhead387:
  6951 00003798 A1[2500]                 mov ax, [token]
  6952 0000379B 83F800                   cmp ax, 0
  6953 0000379E 0F850600                 jne @@getfunctionhead388
  6954 000037A2 B8FFFF                   mov ax, 65535
  6955 000037A5 E93B00                   jmp @@retn
  6956                                  
  6957                                  ;-655   if(istoken(T_INT))  { if (token != T_NAME) return 0;
  6958                                  
  6959                                  @@getfunctionhead388:
  6960 000037A8 680502                   push 517
  6961 000037AB E88511                   call istoken
  6962 000037AE 83C402                   add  sp, 2
  6963 000037B1 08C0                     or  al, al
  6964 000037B3 0F842600                 je @@getfunctionhead389
  6965 000037B7 A1[2500]                 mov ax, [token]
  6966 000037BA 3D0001                   cmp ax, 256
  6967 000037BD 0F840600                 je  @@getfunctionhead390
  6968 000037C1 B80000                   mov ax, 0
  6969 000037C4 E91C00                   jmp @@retn
  6970                                  
  6971                                  ;-656   token=getlex(); if (token == '(') return 1; }
  6972                                  
  6973                                  @@getfunctionhead390:
  6974 000037C7 E8A209                   call getlex
  6975 000037CA A3[2500]                 mov word [token], ax
  6976 000037CD A1[2500]                 mov ax, [token]
  6977 000037D0 83F828                   cmp ax, 40
  6978 000037D3 0F850600                 jne @@getfunctionhead391
  6979 000037D7 B80100                   mov ax, 1
  6980 000037DA E90600                   jmp @@retn
  6981                                  @@getfunctionhead391:
  6982                                  
  6983                                  ;-657   return 0;
  6984                                  
  6985                                  @@getfunctionhead389:
  6986 000037DD B80000                   mov ax, 0
  6987 000037E0 E90000                   jmp @@retn
  6988                                  
  6989                                  ;-658 }
  6990                                  
  6991                                  
  6992                                  ;-659 int doinclude() { int fdtemp;
  6993                                  
  6994                                  @@retn:
  6995 000037E3 C3                       ret
  6996                                  ; ENDP
  6997                                  
  6998                                  doinclude:  ; *** PROC ***
  6999                                  
  7000                                  ;-660   if (token==T_STRING) {  fdtemp=fdin;
  7001                                  
  7002                                  ;Function : doinclude, Number of local variables: 1
  7003                                  ;   # type sign width addr used name   list of local variables
  7004                                  ;  200 var sign word   659 NULL fdtemp = bp-2;
  7005 000037E4 C8020000                 ENTER  2,0
  7006 000037E8 A1[2500]                 mov ax, [token]
  7007 000037EB 3D0201                   cmp ax, 258
  7008 000037EE 0F858700                 jne @@doinclude392
  7009 000037F2 A1[2100]                 mov ax, [fdin]
  7010 000037F5 8946FE                   mov [bp-2], ax
  7011                                  
  7012                                  ;-661   prs("\n;Use include file: "); prs(symbol);
  7013                                  
  7014 000037F8 68[7B38]                 push doinclude_0
  7015 000037FB E87312                   call prs
  7016 000037FE 83C402                   add  sp, 2
  7017 00003801 8D062B81                 lea  ax, [symbol]
  7018 00003805 50                       push ax
  7019 00003806 E86812                   call prs
  7020 00003809 83C402                   add  sp, 2
  7021                                  
  7022                                  ;-662   fdin=openR(symbol);
  7023                                  
  7024 0000380C 8D062B81                 lea  ax, [symbol]
  7025 00003810 50                       push ax
  7026 00003811 E8C823                   call openR
  7027 00003814 83C402                   add  sp, 2
  7028 00003817 A3[2100]                 mov word [fdin], ax
  7029                                  
  7030                                  ;-663   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  7031                                  
  7032 0000381A A1[7900]                 mov ax, [DOS_ERR]
  7033 0000381D 83F800                   cmp ax, 0
  7034 00003820 0F841D00                 je  @@doinclude393
  7035 00003824 68[9138]                 push doinclude_1
  7036 00003827 E84712                   call prs
  7037 0000382A 83C402                   add  sp, 2
  7038 0000382D 8D062B81                 lea  ax, [symbol]
  7039 00003831 50                       push ax
  7040 00003832 E83C12                   call prs
  7041 00003835 83C402                   add  sp, 2
  7042                                  
  7043                                  ;-664     error1(" Stop!!"); }
  7044                                  
  7045 00003838 68[A838]                 push doinclude_2
  7046 0000383B E81C15                   call error1
  7047 0000383E 83C402                   add  sp, 2
  7048                                  
  7049                                  ;-665   linenoinclude=lineno; lineno=1;
  7050                                  
  7051                                  @@doinclude393:
  7052 00003841 A1[7100]                 mov ax, [lineno]
  7053 00003844 A3[7300]                 mov word [linenoinclude], ax
  7054 00003847 B80100                   mov ax, 1
  7055 0000384A A3[7100]                 mov word [lineno], ax
  7056                                  
  7057                                  ;-666   parse(); lineno=linenoinclude;
  7058                                  
  7059 0000384D E807FB                   call parse
  7060 00003850 A1[7300]                 mov ax, [linenoinclude]
  7061 00003853 A3[7100]                 mov word [lineno], ax
  7062                                  
  7063                                  ;-667   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  7064                                  
  7065 00003856 8B46FE                   mov ax, [bp-2]
  7066 00003859 A3[2100]                 mov word [fdin], ax
  7067 0000385C 68[B038]                 push doinclude_3
  7068 0000385F E80F12                   call prs
  7069 00003862 83C402                   add  sp, 2
  7070 00003865 8D06EE81                 lea  ax, [namein]
  7071 00003869 50                       push ax
  7072 0000386A E80412                   call prs
  7073 0000386D 83C402                   add  sp, 2
  7074                                  
  7075                                  ;-668   getfirstchar(); token=getlex(); }
  7076                                  
  7077 00003870 E8A4F7                   call getfirstchar
  7078 00003873 E8F608                   call getlex
  7079 00003876 A3[2500]                 mov word [token], ax
  7080                                  
  7081                                  ;-669 }
  7082                                  
  7083                                  @@doinclude392:
  7084                                  
  7085                                  ;-670 int dodefine() { int i; int j; int fdtemp;
  7086 00003879 C9                       LEAVE
  7087 0000387A C3                       ret
  7088                                  ; ENDP
  7089 0000387B 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7090 00003884 636C7564652066696C-
  7091 0000388D 653A2000           
  7092 00003891 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7093 0000389A 696C65206D69737369-
  7094 000038A3 6E673A2000         
  7095 000038A8 2053746F70212100        doinclude_2 db " Stop!!",0
  7096 000038B0 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7097 000038B9 6F206D61696E207072-
  7098 000038C2 6F6772616D3A2000   
  7099                                  
  7100                                  dodefine:  ; *** PROC ***
  7101                                  
  7102                                  ;-671   if (eqstr(symbol, "BSS"   )) {BSS =1; token=getlex(); return; }
  7103                                  
  7104                                  ;Function : dodefine, Number of local variables: 3
  7105                                  ;   # type sign width addr used name   list of local variables
  7106                                  ;  200 var sign word   670 NULL i = bp-2
  7107                                  ;  201 var sign word   670 NULL j = bp-4
  7108                                  ;  202 var sign word   670 NULL fdtemp = bp-6;
  7109 000038CA C8060000                 ENTER  6,0
  7110 000038CE 68[7A3A]                 push dodefine_0
  7111 000038D1 8D062B81                 lea  ax, [symbol]
  7112 000038D5 50                       push ax
  7113 000038D6 E88922                   call eqstr
  7114 000038D9 83C404                   add  sp, 4
  7115 000038DC 08C0                     or  al, al
  7116 000038DE 0F840F00                 je @@dodefine394
  7117 000038E2 B80100                   mov ax, 1
  7118 000038E5 A2[1400]                 mov byte [BSS], al
  7119 000038E8 E88108                   call getlex
  7120 000038EB A3[2500]                 mov word [token], ax
  7121 000038EE E98701                   jmp @@retn
  7122                                  
  7123                                  ;-672   if (eqstr(symbol, "LIST"  )) {LIST=1; token=getlex(); return; }
  7124                                  
  7125                                  @@dodefine394:
  7126 000038F1 68[7E3A]                 push dodefine_1
  7127 000038F4 8D062B81                 lea  ax, [symbol]
  7128 000038F8 50                       push ax
  7129 000038F9 E86622                   call eqstr
  7130 000038FC 83C404                   add  sp, 4
  7131 000038FF 08C0                     or  al, al
  7132 00003901 0F840F00                 je @@dodefine395
  7133 00003905 B80100                   mov ax, 1
  7134 00003908 A2[1600]                 mov byte [LIST], al
  7135 0000390B E85E08                   call getlex
  7136 0000390E A3[2500]                 mov word [token], ax
  7137 00003911 E96401                   jmp @@retn
  7138                                  
  7139                                  ;-673   if (eqstr(symbol, "NOLIST")) {LIST=0; token=getlex(); return; }
  7140                                  
  7141                                  @@dodefine395:
  7142 00003914 68[833A]                 push dodefine_2
  7143 00003917 8D062B81                 lea  ax, [symbol]
  7144 0000391B 50                       push ax
  7145 0000391C E84322                   call eqstr
  7146 0000391F 83C404                   add  sp, 4
  7147 00003922 08C0                     or  al, al
  7148 00003924 0F840F00                 je @@dodefine396
  7149 00003928 B80000                   mov ax, 0
  7150 0000392B A2[1600]                 mov byte [LIST], al
  7151 0000392E E83B08                   call getlex
  7152 00003931 A3[2500]                 mov word [token], ax
  7153 00003934 E94101                   jmp @@retn
  7154                                  
  7155                                  ;-674   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7156                                  
  7157                                  @@dodefine396:
  7158 00003937 68[8A3A]                 push dodefine_3
  7159 0000393A 8D062B81                 lea  ax, [symbol]
  7160 0000393E 50                       push ax
  7161 0000393F E82022                   call eqstr
  7162 00003942 83C404                   add  sp, 4
  7163 00003945 08C0                     or  al, al
  7164 00003947 0F841500                 je @@dodefine397
  7165 0000394B E81E08                   call getlex
  7166 0000394E A3[2500]                 mov word [token], ax
  7167                                  
  7168                                  ;-675     ORGDATAORIG=lexval; orgData=lexval; return; }
  7169                                  
  7170 00003951 A1[3900]                 mov ax, [lexval]
  7171 00003954 A3[1700]                 mov word [ORGDATAORIG], ax
  7172 00003957 A1[3900]                 mov ax, [lexval]
  7173 0000395A A3[1900]                 mov word [orgData], ax
  7174 0000395D E91801                   jmp @@retn
  7175                                  
  7176                                  ;-676   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7177                                  
  7178                                  @@dodefine397:
  7179 00003960 68[923A]                 push dodefine_4
  7180 00003963 8D062B81                 lea  ax, [symbol]
  7181 00003967 50                       push ax
  7182 00003968 E8F721                   call eqstr
  7183 0000396B 83C404                   add  sp, 4
  7184 0000396E 08C0                     or  al, al
  7185 00003970 0F844900                 je @@dodefine398
  7186 00003974 E8F507                   call getlex
  7187 00003977 A3[2500]                 mov word [token], ax
  7188 0000397A A1[2500]                 mov ax, [token]
  7189 0000397D 3D0201                   cmp ax, 258
  7190 00003980 0F852700                 jne @@dodefine399
  7191                                  
  7192                                  ;-677     prs("\n;Use archive file: ");
  7193                                  
  7194 00003984 68[9A3A]                 push dodefine_5
  7195 00003987 E8E710                   call prs
  7196 0000398A 83C402                   add  sp, 2
  7197                                  
  7198                                  ;-678     strcpy(archivename, symbol); prs(archivename);
  7199                                  
  7200 0000398D 8D062B81                 lea  ax, [symbol]
  7201 00003991 50                       push ax
  7202 00003992 8D067482                 lea  ax, [archivename]
  7203 00003996 50                       push ax
  7204 00003997 E8A120                   call strcpy
  7205 0000399A 83C404                   add  sp, 4
  7206 0000399D 8D067482                 lea  ax, [archivename]
  7207 000039A1 50                       push ax
  7208 000039A2 E8CC10                   call prs
  7209 000039A5 83C402                   add  sp, 2
  7210                                  
  7211                                  ;-679     } else error1("Name of archive file missing"); token=getlex(); return;}
  7212                                  
  7213 000039A8 E90900                   jmp @@dodefine400
  7214                                  @@dodefine399:
  7215 000039AB 68[B03A]                 push dodefine_6
  7216 000039AE E8A913                   call error1
  7217 000039B1 83C402                   add  sp, 2
  7218                                  @@dodefine400:
  7219 000039B4 E8B507                   call getlex
  7220 000039B7 A3[2500]                 mov word [token], ax
  7221 000039BA E9BB00                   jmp @@retn
  7222                                  
  7223                                  ;-680    expect(T_NAME);
  7224                                  
  7225                                  @@dodefine398:
  7226 000039BD 680001                   push 256
  7227 000039C0 E8920F                   call expect
  7228 000039C3 83C402                   add  sp, 2
  7229                                  
  7230                                  ;-681   if (token==T_CONST) { 
  7231                                  
  7232 000039C6 A1[2500]                 mov ax, [token]
  7233 000039C9 3D0101                   cmp ax, 257
  7234 000039CC 0F85A800                 jne @@dodefine401
  7235                                  
  7236                                  ;-682     if (GTop >= LSTART) error1("global table (define) full");
  7237                                  
  7238 000039D0 A1[3500]                 mov ax, [GTop]
  7239 000039D3 3DC800                   cmp ax, 200 ;unsigned : 1
  7240 000039D6 0F8C0900                 jl  @@dodefine402
  7241 000039DA 68[CD3A]                 push dodefine_7
  7242 000039DD E87A13                   call error1
  7243 000039E0 83C402                   add  sp, 2
  7244                                  
  7245                                  ;-683     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7246                                  
  7247                                  @@dodefine402:
  7248 000039E3 8D062B81                 lea  ax, [symbol]
  7249 000039E7 50                       push ax
  7250 000039E8 E82820                   call strlen
  7251 000039EB 83C402                   add  sp, 2
  7252 000039EE 8946FE                   mov [bp-2], ax
  7253 000039F1 8B46FE                   mov ax, [bp-2]
  7254 000039F4 83F80F                   cmp ax, 15
  7255 000039F7 0F8E0900                 jle @@dodefine403
  7256 000039FB 68[E83A]                 push dodefine_8
  7257 000039FE E85913                   call error1
  7258 00003A01 83C402                   add  sp, 2
  7259                                  
  7260                                  ;-684     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7261                                  
  7262                                  @@dodefine403:
  7263 00003A04 B85500                   mov ax, 85
  7264 00003A07 8B1E[3500]               mov bx, [GTop]
  7265 00003A0B 8887E383                 mov [GSign+bx], al
  7266 00003A0F B80100                   mov ax, 1
  7267 00003A12 8B1E[3500]               mov bx, [GTop]
  7268 00003A16 88870F85                 mov [GWidth+bx], al
  7269 00003A1A B82300                   mov ax, 35
  7270 00003A1D 8B1E[3500]               mov bx, [GTop]
  7271 00003A21 8887B782                 mov [GType+bx], al
  7272                                  
  7273                                  ;-685     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7274                                  
  7275 00003A25 A1[7100]                 mov ax, [lineno]
  7276 00003A28 83E801                   sub ax, 1
  7277 00003A2B 8B1E[3500]               mov bx, [GTop]
  7278 00003A2F D1E3                     shl bx, 1
  7279 00003A31 89873B86                 mov [GAdr+bx], ax
  7280 00003A35 B80000                   mov ax, 0
  7281 00003A38 8B1E[3500]               mov bx, [GTop]
  7282 00003A3C D1E3                     shl bx, 1
  7283 00003A3E 89879388                 mov [GUsed+bx], ax
  7284                                  
  7285                                  ;-686     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7286                                  
  7287 00003A42 FF36[3500]               push word [GTop]
  7288 00003A46 E8D3CC                   call adrofname
  7289 00003A49 83C402                   add  sp, 2
  7290 00003A4C A3[7500]                 mov word [pt], ax
  7291 00003A4F 8D062B81                 lea  ax, [symbol]
  7292 00003A53 50                       push ax
  7293 00003A54 FF36[7500]               push word [pt]
  7294 00003A58 E8E01F                   call strcpy
  7295 00003A5B 83C404                   add  sp, 4
  7296 00003A5E A1[3900]                 mov ax, [lexval]
  7297 00003A61 8B1E[3500]               mov bx, [GTop]
  7298 00003A65 D1E3                     shl bx, 1
  7299 00003A67 8987EB8A                 mov [GData+bx], ax
  7300                                  
  7301                                  ;-687     expect(T_CONST); GTop++;  } 
  7302                                  
  7303 00003A6B 680101                   push 257
  7304 00003A6E E8E40E                   call expect
  7305 00003A71 83C402                   add  sp, 2
  7306 00003A74 FF06[3500]               inc  word[GTop]
  7307                                  
  7308                                  ;-688 }
  7309                                  
  7310                                  @@dodefine401:
  7311                                  
  7312                                  ;-689 int stmt() { int c; char cha;
  7313                                  
  7314 00003A78 C9                      @@retn: LEAVE
  7315 00003A79 C3                       ret
  7316                                  ; ENDP
  7317 00003A7A 42535300                dodefine_0 db "BSS",0
  7318 00003A7E 4C49535400              dodefine_1 db "LIST",0
  7319 00003A83 4E4F4C49535400          dodefine_2 db "NOLIST",0
  7320 00003A8A 4F52474441544100        dodefine_3 db "ORGDATA",0
  7321 00003A92 4152434849564500        dodefine_4 db "ARCHIVE",0
  7322 00003A9A 5C6E3B557365206172-     dodefine_5 db "\n;Use archive file: ",0
  7323 00003AA3 63686976652066696C-
  7324 00003AAC 653A2000           
  7325 00003AB0 4E616D65206F662061-     dodefine_6 db "Name of archive file missing",0
  7326 00003AB9 726368697665206669-
  7327 00003AC2 6C65206D697373696E-
  7328 00003ACB 6700               
  7329 00003ACD 676C6F62616C207461-     dodefine_7 db "global table (define) full",0
  7330 00003AD6 626C65202864656669-
  7331 00003ADF 6E65292066756C6C00 
  7332 00003AE8 446566696E65206E61-     dodefine_8 db "Define name longer 15 char",0
  7333 00003AF1 6D65206C6F6E676572-
  7334 00003AFA 203135206368617200 
  7335                                  
  7336                                  stmt:  ; *** PROC ***
  7337                                  
  7338                                  ;-690        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7339                                  
  7340                                  ;Function : stmt, Number of local variables: 2
  7341                                  ;   # type sign width addr used name   list of local variables
  7342                                  ;  200 var sign word   689 NULL c = bp-2
  7343                                  ;  201 var sign byte   689 NULL cha = bp-4;
  7344 00003B03 C8040000                 ENTER  4,0
  7345 00003B07 6A7B                     push 123
  7346 00003B09 E8270E                   call istoken
  7347 00003B0C 83C402                   add  sp, 2
  7348 00003B0F 08C0                     or  al, al
  7349 00003B11 0F841700                 je @@stmt404
  7350                                  @@stmt405:
  7351 00003B15 6A7D                     push 125
  7352 00003B17 E8190E                   call istoken
  7353 00003B1A 83C402                   add  sp, 2
  7354 00003B1D 83F800                   cmp ax, 0
  7355 00003B20 0F850500                 jne @@stmt406
  7356 00003B24 E8DCFF                   call stmt
  7357 00003B27 EBEC                     jmp @@stmt405
  7358                                  @@stmt406:
  7359                                  
  7360                                  ;-691   else if(istoken(T_IF))    doif();
  7361                                  
  7362 00003B29 E90502                   jmp @@stmt407
  7363                                  @@stmt404:
  7364 00003B2C 680102                   push 513
  7365 00003B2F E8010E                   call istoken
  7366 00003B32 83C402                   add  sp, 2
  7367 00003B35 08C0                     or  al, al
  7368 00003B37 0F840600                 je @@stmt408
  7369 00003B3B E84204                   call doif
  7370                                  
  7371                                  ;-692   else if(istoken(T_DO))    dodo();
  7372                                  
  7373 00003B3E E9F001                   jmp @@stmt409
  7374                                  @@stmt408:
  7375 00003B41 680402                   push 516
  7376 00003B44 E8EC0D                   call istoken
  7377 00003B47 83C402                   add  sp, 2
  7378 00003B4A 08C0                     or  al, al
  7379 00003B4C 0F840600                 je @@stmt410
  7380 00003B50 E82105                   call dodo
  7381                                  
  7382                                  ;-693   else if(istoken(T_WHILE)) dowhile();
  7383                                  
  7384 00003B53 E9DB01                   jmp @@stmt411
  7385                                  @@stmt410:
  7386 00003B56 680302                   push 515
  7387 00003B59 E8D70D                   call istoken
  7388 00003B5C 83C402                   add  sp, 2
  7389 00003B5F 08C0                     or  al, al
  7390 00003B61 0F840600                 je @@stmt412
  7391 00003B65 E85905                   call dowhile
  7392                                  
  7393                                  ;-694   else if(istoken(T_GOTO))  {prs("\n jmp @@");name1();prs(symbol);expect(';');}
  7394                                  
  7395 00003B68 E9C601                   jmp @@stmt413
  7396                                  @@stmt412:
  7397 00003B6B 680902                   push 521
  7398 00003B6E E8C20D                   call istoken
  7399 00003B71 83C402                   add  sp, 2
  7400 00003B74 08C0                     or  al, al
  7401 00003B76 0F842200                 je @@stmt414
  7402 00003B7A 68[333D]                 push stmt_0
  7403 00003B7D E8F10E                   call prs
  7404 00003B80 83C402                   add  sp, 2
  7405 00003B83 E8F5CD                   call name1
  7406 00003B86 8D062B81                 lea  ax, [symbol]
  7407 00003B8A 50                       push ax
  7408 00003B8B E8E30E                   call prs
  7409 00003B8E 83C402                   add  sp, 2
  7410 00003B91 6A3B                     push 59
  7411 00003B93 E8BF0D                   call expect
  7412 00003B96 83C402                   add  sp, 2
  7413                                  
  7414                                  ;-695   else if(token==T_ASM)     {prs("\n"); c=next();
  7415                                  
  7416 00003B99 E99501                   jmp @@stmt415
  7417                                  @@stmt414:
  7418 00003B9C A1[2500]                 mov ax, [token]
  7419 00003B9F 3D0602                   cmp ax, 518
  7420 00003BA2 0F853300                 jne @@stmt416
  7421 00003BA6 68[3D3D]                 push stmt_1
  7422 00003BA9 E8C50E                   call prs
  7423 00003BAC 83C402                   add  sp, 2
  7424 00003BAF E8630D                   call next
  7425 00003BB2 8946FE                   mov [bp-2], ax
  7426                                  
  7427                                  ;-696     while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7428                                  
  7429                                  @@stmt417:
  7430 00003BB5 8B46FE                   mov ax, [bp-2]
  7431 00003BB8 83F80A                   cmp ax, 10
  7432 00003BBB 0F841100                 je  @@stmt418
  7433 00003BBF FF76FE                   push word [bp-2]
  7434 00003BC2 E83C0E                   call prc
  7435 00003BC5 83C402                   add  sp, 2
  7436 00003BC8 E84A0D                   call next
  7437 00003BCB 8946FE                   mov [bp-2], ax
  7438 00003BCE EBE5                     jmp @@stmt417
  7439                                  @@stmt418:
  7440 00003BD0 E89905                   call getlex
  7441 00003BD3 A3[2500]                 mov word [token], ax
  7442                                  
  7443                                  ;-697   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7444                                  
  7445 00003BD6 E95801                   jmp @@stmt419
  7446                                  @@stmt416:
  7447 00003BD9 680702                   push 519
  7448 00003BDC E8540D                   call istoken
  7449 00003BDF 83C402                   add  sp, 2
  7450 00003BE2 08C0                     or  al, al
  7451 00003BE4 0F844B00                 je @@stmt420
  7452 00003BE8 A1[2500]                 mov ax, [token]
  7453 00003BEB 83F87B                   cmp ax, 123
  7454 00003BEE 0F853500                 jne @@stmt421
  7455 00003BF2 68[403D]                 push stmt_2
  7456 00003BF5 E8790E                   call prs
  7457 00003BF8 83C402                   add  sp, 2
  7458 00003BFB E8170D                   call next
  7459 00003BFE 8846FC                   mov [bp-4], al
  7460                                  
  7461                                  ;-698     while(cha!= '}') { prc(cha); cha=next(); }
  7462                                  
  7463                                  @@stmt422:
  7464 00003C01 8A46FC                   mov al, [bp-4]
  7465 00003C04 3C7D                     cmp al, 125
  7466 00003C06 0F841400                 je  @@stmt423
  7467 00003C0A 8A46FC                   mov al, byte [bp-4]
  7468 00003C0D B400                     mov ah, 0
  7469 00003C0F 50                       push ax
  7470 00003C10 E8EE0D                   call prc
  7471 00003C13 83C402                   add  sp, 2
  7472 00003C16 E8FC0C                   call next
  7473 00003C19 8846FC                   mov [bp-4], al
  7474                                  
  7475                                  ;-699     token=getlex(); }
  7476                                  
  7477 00003C1C EBE3                     jmp @@stmt422
  7478                                  @@stmt423:
  7479 00003C1E E84B05                   call getlex
  7480 00003C21 A3[2500]                 mov word [token], ax
  7481                                  
  7482                                  ;-700     else error1("Curly open expected"); }
  7483                                  
  7484 00003C24 E90900                   jmp @@stmt424
  7485                                  @@stmt421:
  7486 00003C27 68[433D]                 push stmt_3
  7487 00003C2A E82D11                   call error1
  7488 00003C2D 83C402                   add  sp, 2
  7489                                  @@stmt424:
  7490                                  
  7491                                  ;-701   else if(istoken(T_INTH))  {prs("\n int  "); expect(T_CONST);
  7492                                  
  7493 00003C30 E9FE00                   jmp @@stmt425
  7494                                  @@stmt420:
  7495 00003C33 685802                   push 600
  7496 00003C36 E8FA0C                   call istoken
  7497 00003C39 83C402                   add  sp, 2
  7498 00003C3C 08C0                     or  al, al
  7499 00003C3E 0F842700                 je @@stmt426
  7500 00003C42 68[573D]                 push stmt_4
  7501 00003C45 E8290E                   call prs
  7502 00003C48 83C402                   add  sp, 2
  7503 00003C4B 680101                   push 257
  7504 00003C4E E8040D                   call expect
  7505 00003C51 83C402                   add  sp, 2
  7506                                  
  7507                                  ;-702     prunsign1(lexval); expect(';');    }
  7508                                  
  7509 00003C54 FF36[3900]               push word [lexval]
  7510 00003C58 E8700F                   call prunsign1
  7511 00003C5B 83C402                   add  sp, 2
  7512 00003C5E 6A3B                     push 59
  7513 00003C60 E8F20C                   call expect
  7514 00003C63 83C402                   add  sp, 2
  7515                                  
  7516                                  ;-703   else if(istoken(T_IFCARRY))doifcarry();
  7517                                  
  7518 00003C66 E9C800                   jmp @@stmt427
  7519                                  @@stmt426:
  7520 00003C69 685902                   push 601
  7521 00003C6C E8C40C                   call istoken
  7522 00003C6F 83C402                   add  sp, 2
  7523 00003C72 08C0                     or  al, al
  7524 00003C74 0F840600                 je @@stmt428
  7525 00003C78 E86703                   call doifcarry
  7526                                  
  7527                                  ;-704   else if(istoken(T_IFZERO))doifzero();
  7528                                  
  7529 00003C7B E9B300                   jmp @@stmt429
  7530                                  @@stmt428:
  7531 00003C7E 685A02                   push 602
  7532 00003C81 E8AF0C                   call istoken
  7533 00003C84 83C402                   add  sp, 2
  7534 00003C87 08C0                     or  al, al
  7535 00003C89 0F840600                 je @@stmt430
  7536 00003C8D E89B03                   call doifzero
  7537                                  
  7538                                  ;-705   else if(istoken(T_EMIT))   doemit();
  7539                                  
  7540 00003C90 E99E00                   jmp @@stmt431
  7541                                  @@stmt430:
  7542 00003C93 680802                   push 520
  7543 00003C96 E89A0C                   call istoken
  7544 00003C99 83C402                   add  sp, 2
  7545 00003C9C 08C0                     or  al, al
  7546 00003C9E 0F840600                 je @@stmt432
  7547 00003CA2 E8CE00                   call doemit
  7548                                  
  7549                                  ;-706   else if(istoken(';'))      { }
  7550                                  
  7551 00003CA5 E98900                   jmp @@stmt433
  7552                                  @@stmt432:
  7553 00003CA8 6A3B                     push 59
  7554 00003CAA E8860C                   call istoken
  7555 00003CAD 83C402                   add  sp, 2
  7556 00003CB0 08C0                     or  al, al
  7557 00003CB2 0F840300                 je @@stmt434
  7558                                  
  7559                                  ;-707   else if(istoken(T_RETURN)) {if (token!=';') exprstart();
  7560                                  
  7561 00003CB6 E97800                   jmp @@stmt435
  7562                                  @@stmt434:
  7563 00003CB9 680002                   push 512
  7564 00003CBC E8740C                   call istoken
  7565 00003CBF 83C402                   add  sp, 2
  7566 00003CC2 08C0                     or  al, al
  7567 00003CC4 0F842500                 je @@stmt436
  7568 00003CC8 A1[2500]                 mov ax, [token]
  7569 00003CCB 83F83B                   cmp ax, 59
  7570 00003CCE 0F840300                 je  @@stmt437
  7571 00003CD2 E8A1D3                   call exprstart
  7572                                  
  7573                                  ;-708     prs("\n jmp @@retn"); nreturn++; expect(';');}
  7574                                  
  7575                                  @@stmt437:
  7576 00003CD5 68[603D]                 push stmt_5
  7577 00003CD8 E8960D                   call prs
  7578 00003CDB 83C402                   add  sp, 2
  7579 00003CDE FF06[2F00]               inc  word[nreturn]
  7580 00003CE2 6A3B                     push 59
  7581 00003CE4 E86E0C                   call expect
  7582 00003CE7 83C402                   add  sp, 2
  7583                                  
  7584                                  ;-709   else if(thechar==':')      {prs("\n@@"); // Label
  7585                                  
  7586 00003CEA E94400                   jmp @@stmt438
  7587                                  @@stmt436:
  7588 00003CED A0[2A00]                 mov al, [thechar]
  7589 00003CF0 3C3A                     cmp al, 58
  7590 00003CF2 0F853000                 jne @@stmt439
  7591 00003CF6 68[6E3D]                 push stmt_6
  7592 00003CF9 E8750D                   call prs
  7593 00003CFC 83C402                   add  sp, 2
  7594                                  
  7595                                  ;-710      prs(symbol); prc(':');  expect(T_NAME); expect(':'); }
  7596                                  
  7597 00003CFF 8D062B81                 lea  ax, [symbol]
  7598 00003D03 50                       push ax
  7599 00003D04 E86A0D                   call prs
  7600 00003D07 83C402                   add  sp, 2
  7601 00003D0A 6A3A                     push 58
  7602 00003D0C E8F20C                   call prc
  7603 00003D0F 83C402                   add  sp, 2
  7604 00003D12 680001                   push 256
  7605 00003D15 E83D0C                   call expect
  7606 00003D18 83C402                   add  sp, 2
  7607 00003D1B 6A3A                     push 58
  7608 00003D1D E8350C                   call expect
  7609 00003D20 83C402                   add  sp, 2
  7610                                  
  7611                                  ;-711   else                       {exprstart(); expect(';'); } }
  7612                                  
  7613 00003D23 E90B00                   jmp @@stmt440
  7614                                  @@stmt439:
  7615 00003D26 E84DD3                   call exprstart
  7616 00003D29 6A3B                     push 59
  7617 00003D2B E8270C                   call expect
  7618 00003D2E 83C402                   add  sp, 2
  7619                                  @@stmt440:
  7620                                  @@stmt438:
  7621                                  @@stmt435:
  7622                                  @@stmt433:
  7623                                  @@stmt431:
  7624                                  @@stmt429:
  7625                                  @@stmt427:
  7626                                  @@stmt425:
  7627                                  @@stmt419:
  7628                                  @@stmt415:
  7629                                  @@stmt413:
  7630                                  @@stmt411:
  7631                                  @@stmt409:
  7632                                  @@stmt407:
  7633                                  
  7634                                  ;-712 
  7635                                  
  7636                                  
  7637                                  ;-713 int doemit() {prs("\n db ");
  7638 00003D31 C9                       LEAVE
  7639 00003D32 C3                       ret
  7640                                  ; ENDP
  7641 00003D33 5C6E206A6D70204040-     stmt_0 db "\n jmp @@",0
  7642 00003D3C 00                 
  7643 00003D3D 5C6E00                  stmt_1 db "\n",0
  7644 00003D40 5C6E00                  stmt_2 db "\n",0
  7645 00003D43 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7646 00003D4C 6E2065787065637465-
  7647 00003D55 6400               
  7648 00003D57 5C6E20696E74202000      stmt_4 db "\n int  ",0
  7649 00003D60 5C6E206A6D70204040-     stmt_5 db "\n jmp @@retn",0
  7650 00003D69 7265746E00         
  7651 00003D6E 5C6E404000              stmt_6 db "\n@@",0
  7652                                  
  7653                                  doemit:  ; *** PROC ***
  7654 00003D73 68[AF3D]                 push doemit_0
  7655 00003D76 E8F80C                   call prs
  7656 00003D79 83C402                   add  sp, 2
  7657                                  
  7658                                  ;-714   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7659                                  
  7660                                  @@L1:
  7661 00003D7C E8ED03                   call getlex
  7662 00003D7F A3[2500]                 mov word [token], ax
  7663 00003D82 FF36[3900]               push word [lexval]
  7664 00003D86 E8420E                   call prunsign1
  7665 00003D89 83C402                   add  sp, 2
  7666 00003D8C E8DD03                   call getlex
  7667 00003D8F A3[2500]                 mov word [token], ax
  7668                                  
  7669                                  ;-715     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7670                                  
  7671 00003D92 A1[2500]                 mov ax, [token]
  7672 00003D95 83F82C                   cmp ax, 44
  7673 00003D98 0F850A00                 jne @@doemit441
  7674 00003D9C 6A2C                     push 44
  7675 00003D9E E8600C                   call prc
  7676 00003DA1 83C402                   add  sp, 2
  7677 00003DA4 EBD6                     jmp @@L1
  7678                                  @@doemit441:
  7679 00003DA6 6A29                     push 41
  7680 00003DA8 E8AA0B                   call expect
  7681 00003DAB 83C402                   add  sp, 2
  7682                                  
  7683                                  ;-716 
  7684                                  
  7685                                  
  7686                                  ;-717 int cmpneg(int ids) {
  7687                                  
  7688 00003DAE C3                       ret
  7689                                  ; ENDP
  7690 00003DAF 5C6E2064622000          doemit_0 db "\n db ",0
  7691                                  
  7692                                  cmpneg:  ; *** PROC ***
  7693                                  
  7694                                  ;-718        if(iscmp==T_EQ) prs("\n jne @@");         //ZF=0
  7695                                  
  7696                                  ;Function : cmpneg, Number of local variables: 1
  7697                                  ;   # type sign width addr used name   list of local variables
  7698                                  ;  200 var sign word   717 NULL ids = bp+4;
  7699 00003DB6 C8000000                 ENTER  0,0
  7700 00003DBA A1[2B00]                 mov ax, [iscmp]
  7701 00003DBD 3D2603                   cmp ax, 806
  7702 00003DC0 0F850C00                 jne @@cmpneg442
  7703 00003DC4 68[973E]                 push cmpneg_0
  7704 00003DC7 E8A70C                   call prs
  7705 00003DCA 83C402                   add  sp, 2
  7706                                  
  7707                                  ;-719   else if(iscmp==T_NE) prs("\n je  @@");         //ZF=1
  7708                                  
  7709 00003DCD E9C500                   jmp @@cmpneg443
  7710                                  @@cmpneg442:
  7711 00003DD0 A1[2B00]                 mov ax, [iscmp]
  7712 00003DD3 3D2703                   cmp ax, 807
  7713 00003DD6 0F850C00                 jne @@cmpneg444
  7714 00003DDA 68[A13E]                 push cmpneg_1
  7715 00003DDD E8910C                   call prs
  7716 00003DE0 83C402                   add  sp, 2
  7717                                  
  7718                                  ;-720   else if(iscmp==T_LE) if (ids) prs("\n jg  @@");//ZF=0      SF =OF
  7719                                  
  7720 00003DE3 E9AF00                   jmp @@cmpneg445
  7721                                  @@cmpneg444:
  7722 00003DE6 A1[2B00]                 mov ax, [iscmp]
  7723 00003DE9 3D3803                   cmp ax, 824
  7724 00003DEC 0F852100                 jne @@cmpneg446
  7725 00003DF0 8B4604                   mov ax, [bp+4]
  7726 00003DF3 08C0                     or  al, al
  7727 00003DF5 0F840C00                 je @@cmpneg447
  7728 00003DF9 68[AB3E]                 push cmpneg_2
  7729 00003DFC E8720C                   call prs
  7730 00003DFF 83C402                   add  sp, 2
  7731                                  
  7732                                  ;-721                            else prs("\n ja  @@");//ZF=0 CF=0
  7733                                  
  7734 00003E02 E90900                   jmp @@cmpneg448
  7735                                  @@cmpneg447:
  7736 00003E05 68[B53E]                 push cmpneg_3
  7737 00003E08 E8660C                   call prs
  7738 00003E0B 83C402                   add  sp, 2
  7739                                  
  7740                                  ;-722   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7741                                  
  7742                                  @@cmpneg448:
  7743 00003E0E E98400                   jmp @@cmpneg449
  7744                                  @@cmpneg446:
  7745 00003E11 A1[2B00]                 mov ax, [iscmp]
  7746 00003E14 3D2B03                   cmp ax, 811
  7747 00003E17 0F854500                 jne @@cmpneg450
  7748 00003E1B 8B4604                   mov ax, [bp+4]
  7749 00003E1E 08C0                     or  al, al
  7750 00003E20 0F841E00                 je @@cmpneg451
  7751 00003E24 68[BF3E]                 push cmpneg_4
  7752 00003E27 E8470C                   call prs
  7753 00003E2A 83C402                   add  sp, 2
  7754 00003E2D FF7604                   push word [bp+4]
  7755 00003E30 E8980D                   call prunsign1
  7756 00003E33 83C402                   add  sp, 2
  7757                                  
  7758                                  ;-723                                prs("\n jl  @@");}//          SF!=OF
  7759                                  
  7760 00003E36 68[CD3E]                 push cmpneg_5
  7761 00003E39 E8350C                   call prs
  7762 00003E3C 83C402                   add  sp, 2
  7763                                  
  7764                                  ;-724                            else{prs(" ;unsigned : "); prunsign1(ids);
  7765                                  
  7766 00003E3F E91B00                   jmp @@cmpneg452
  7767                                  @@cmpneg451:
  7768 00003E42 68[D73E]                 push cmpneg_6
  7769 00003E45 E8290C                   call prs
  7770 00003E48 83C402                   add  sp, 2
  7771 00003E4B FF7604                   push word [bp+4]
  7772 00003E4E E87A0D                   call prunsign1
  7773 00003E51 83C402                   add  sp, 2
  7774                                  
  7775                                  ;-725                                prs("\n jb  @@");}//jb=jc=CF=1
  7776                                  
  7777 00003E54 68[E53E]                 push cmpneg_7
  7778 00003E57 E8170C                   call prs
  7779 00003E5A 83C402                   add  sp, 2
  7780                                  
  7781                                  ;-726   else if(iscmp=='<' ) prs("\n jge @@");         //          SF =OF
  7782                                  
  7783                                  @@cmpneg452:
  7784 00003E5D E93500                   jmp @@cmpneg453
  7785                                  @@cmpneg450:
  7786 00003E60 A1[2B00]                 mov ax, [iscmp]
  7787 00003E63 83F83C                   cmp ax, 60
  7788 00003E66 0F850C00                 jne @@cmpneg454
  7789 00003E6A 68[EF3E]                 push cmpneg_8
  7790 00003E6D E8010C                   call prs
  7791 00003E70 83C402                   add  sp, 2
  7792                                  
  7793                                  ;-727   else if(iscmp=='>' ) prs("\n jle @@");         //ZF=1 oder SF!=OF
  7794                                  
  7795 00003E73 E91F00                   jmp @@cmpneg455
  7796                                  @@cmpneg454:
  7797 00003E76 A1[2B00]                 mov ax, [iscmp]
  7798 00003E79 83F83E                   cmp ax, 62
  7799 00003E7C 0F850C00                 jne @@cmpneg456
  7800 00003E80 68[F93E]                 push cmpneg_9
  7801 00003E83 E8EB0B                   call prs
  7802 00003E86 83C402                   add  sp, 2
  7803                                  
  7804                                  ;-728   else error1("Vergleich unbekannt in CMPNEG()");  }
  7805                                  
  7806 00003E89 E90900                   jmp @@cmpneg457
  7807                                  @@cmpneg456:
  7808 00003E8C 68[033F]                 push cmpneg_10
  7809 00003E8F E8C80E                   call error1
  7810 00003E92 83C402                   add  sp, 2
  7811                                  @@cmpneg457:
  7812                                  @@cmpneg455:
  7813                                  @@cmpneg453:
  7814                                  @@cmpneg449:
  7815                                  @@cmpneg445:
  7816                                  @@cmpneg443:
  7817                                  
  7818                                  ;-729 
  7819                                  
  7820                                  
  7821                                  ;-730 int prlabel(int n) {prs("\n@@"); prs(fname); pint1(n); prc(':'); }
  7822 00003E95 C9                       LEAVE
  7823 00003E96 C3                       ret
  7824                                  ; ENDP
  7825 00003E97 5C6E206A6E65204040-     cmpneg_0 db "\n jne @@",0
  7826 00003EA0 00                 
  7827 00003EA1 5C6E206A6520204040-     cmpneg_1 db "\n je  @@",0
  7828 00003EAA 00                 
  7829 00003EAB 5C6E206A6720204040-     cmpneg_2 db "\n jg  @@",0
  7830 00003EB4 00                 
  7831 00003EB5 5C6E206A6120204040-     cmpneg_3 db "\n ja  @@",0
  7832 00003EBE 00                 
  7833 00003EBF 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7834 00003EC8 64203A2000         
  7835 00003ECD 5C6E206A6C20204040-     cmpneg_5 db "\n jl  @@",0
  7836 00003ED6 00                 
  7837 00003ED7 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7838 00003EE0 64203A2000         
  7839 00003EE5 5C6E206A6220204040-     cmpneg_7 db "\n jb  @@",0
  7840 00003EEE 00                 
  7841 00003EEF 5C6E206A6765204040-     cmpneg_8 db "\n jge @@",0
  7842 00003EF8 00                 
  7843 00003EF9 5C6E206A6C65204040-     cmpneg_9 db "\n jle @@",0
  7844 00003F02 00                 
  7845 00003F03 566572676C65696368-     cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0
  7846 00003F0C 20756E62656B616E6E-
  7847 00003F15 7420696E20434D504E-
  7848 00003F1E 4547282900         
  7849                                  
  7850                                  prlabel:  ; *** PROC ***
  7851                                  ;Function : prlabel, Number of local variables: 1
  7852                                  ;   # type sign width addr used name   list of local variables
  7853                                  ;  200 var sign word   730 NULL n = bp+4;
  7854 00003F23 C8000000                 ENTER  0,0
  7855 00003F27 68[4E3F]                 push prlabel_0
  7856 00003F2A E8440B                   call prs
  7857 00003F2D 83C402                   add  sp, 2
  7858 00003F30 8D06AB81                 lea  ax, [fname]
  7859 00003F34 50                       push ax
  7860 00003F35 E8390B                   call prs
  7861 00003F38 83C402                   add  sp, 2
  7862 00003F3B FF7604                   push word [bp+4]
  7863 00003F3E E8270C                   call pint1
  7864 00003F41 83C402                   add  sp, 2
  7865 00003F44 6A3A                     push 58
  7866 00003F46 E8B80A                   call prc
  7867 00003F49 83C402                   add  sp, 2
  7868                                  
  7869                                  ;-731 int prjump (int n) {prs("\n jmp @@"); prs(fname); pint1(n); }
  7870 00003F4C C9                       LEAVE
  7871 00003F4D C3                       ret
  7872                                  ; ENDP
  7873 00003F4E 5C6E404000              prlabel_0 db "\n@@",0
  7874                                  
  7875                                  prjump:  ; *** PROC ***
  7876                                  ;Function : prjump, Number of local variables: 1
  7877                                  ;   # type sign width addr used name   list of local variables
  7878                                  ;  200 var sign word   731 NULL n = bp+4;
  7879 00003F53 C8000000                 ENTER  0,0
  7880 00003F57 68[763F]                 push prjump_0
  7881 00003F5A E8140B                   call prs
  7882 00003F5D 83C402                   add  sp, 2
  7883 00003F60 8D06AB81                 lea  ax, [fname]
  7884 00003F64 50                       push ax
  7885 00003F65 E8090B                   call prs
  7886 00003F68 83C402                   add  sp, 2
  7887 00003F6B FF7604                   push word [bp+4]
  7888 00003F6E E8F70B                   call pint1
  7889 00003F71 83C402                   add  sp, 2
  7890                                  
  7891                                  ;-732 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7892 00003F74 C9                       LEAVE
  7893 00003F75 C3                       ret
  7894                                  ; ENDP
  7895 00003F76 5C6E206A6D70204040-     prjump_0 db "\n jmp @@",0
  7896 00003F7F 00                 
  7897                                  
  7898                                  doif:  ; *** PROC ***
  7899                                  ;Function : doif, Number of local variables: 2
  7900                                  ;   # type sign width addr used name   list of local variables
  7901                                  ;  200 var sign word   732 NULL jdest = bp-2
  7902                                  ;  201 var sign word   732 NULL tst = bp-4;
  7903 00003F80 C8040000                 ENTER  4,0
  7904 00003F84 E84ACF                   call pexpr
  7905 00003F87 FF06[3100]               inc  word[nlabel]
  7906 00003F8B A1[3100]                 mov ax, [nlabel]
  7907 00003F8E 8946FE                   mov [bp-2], ax
  7908                                  
  7909                                  ;-733   pint1(jdest); stmt();
  7910                                  
  7911 00003F91 FF76FE                   push word [bp-2]
  7912 00003F94 E8D10B                   call pint1
  7913 00003F97 83C402                   add  sp, 2
  7914 00003F9A E866FB                   call stmt
  7915                                  
  7916                                  ;-734   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7917                                  
  7918 00003F9D 680202                   push 514
  7919 00003FA0 E89009                   call istoken
  7920 00003FA3 83C402                   add  sp, 2
  7921 00003FA6 08C0                     or  al, al
  7922 00003FA8 0F842B00                 je @@doif458
  7923 00003FAC FF06[3100]               inc  word[nlabel]
  7924 00003FB0 A1[3100]                 mov ax, [nlabel]
  7925 00003FB3 8946FC                   mov [bp-4], ax
  7926                                  
  7927                                  ;-735     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7928                                  
  7929 00003FB6 FF76FC                   push word [bp-4]
  7930 00003FB9 E897FF                   call prjump
  7931 00003FBC 83C402                   add  sp, 2
  7932 00003FBF FF76FE                   push word [bp-2]
  7933 00003FC2 E85EFF                   call prlabel
  7934 00003FC5 83C402                   add  sp, 2
  7935 00003FC8 E838FB                   call stmt
  7936 00003FCB FF76FC                   push word [bp-4]
  7937 00003FCE E852FF                   call prlabel
  7938 00003FD1 83C402                   add  sp, 2
  7939                                  
  7940                                  ;-736   else prlabel(jdest); }
  7941                                  
  7942 00003FD4 E90900                   jmp @@doif459
  7943                                  @@doif458:
  7944 00003FD7 FF76FE                   push word [bp-2]
  7945 00003FDA E846FF                   call prlabel
  7946 00003FDD 83C402                   add  sp, 2
  7947                                  @@doif459:
  7948                                  
  7949                                  ;-737 int doifcarry() {int jdest;  nlabel++; jdest=nlabel;
  7950 00003FE0 C9                       LEAVE
  7951 00003FE1 C3                       ret
  7952                                  ; ENDP
  7953                                  
  7954                                  doifcarry:  ; *** PROC ***
  7955                                  ;Function : doifcarry, Number of local variables: 1
  7956                                  ;   # type sign width addr used name   list of local variables
  7957                                  ;  200 var sign word   737 NULL jdest = bp-2;
  7958 00003FE2 C8020000                 ENTER  2,0
  7959 00003FE6 FF06[3100]               inc  word[nlabel]
  7960 00003FEA A1[3100]                 mov ax, [nlabel]
  7961 00003FED 8946FE                   mov [bp-2], ax
  7962                                  
  7963                                  ;-738   prs("\n jae short @@");/*jnc*/ prs(fname);  pint1(jdest);
  7964                                  
  7965 00003FF0 68[1B40]                 push doifcarry_0
  7966 00003FF3 E87B0A                   call prs
  7967 00003FF6 83C402                   add  sp, 2
  7968 00003FF9 8D06AB81                 lea  ax, [fname]
  7969 00003FFD 50                       push ax
  7970 00003FFE E8700A                   call prs
  7971 00004001 83C402                   add  sp, 2
  7972 00004004 FF76FE                   push word [bp-2]
  7973 00004007 E85E0B                   call pint1
  7974 0000400A 83C402                   add  sp, 2
  7975                                  
  7976                                  ;-739   stmt(); prlabel(jdest); }
  7977                                  
  7978 0000400D E8F3FA                   call stmt
  7979 00004010 FF76FE                   push word [bp-2]
  7980 00004013 E80DFF                   call prlabel
  7981 00004016 83C402                   add  sp, 2
  7982                                  
  7983                                  ;-740 int doifzero() {int jdest;  nlabel++; jdest=nlabel;
  7984 00004019 C9                       LEAVE
  7985 0000401A C3                       ret
  7986                                  ; ENDP
  7987 0000401B 5C6E206A6165207368-     doifcarry_0 db "\n jae short @@",0
  7988 00004024 6F727420404000     
  7989                                  
  7990                                  doifzero:  ; *** PROC ***
  7991                                  ;Function : doifzero, Number of local variables: 1
  7992                                  ;   # type sign width addr used name   list of local variables
  7993                                  ;  200 var sign word   740 NULL jdest = bp-2;
  7994 0000402B C8020000                 ENTER  2,0
  7995 0000402F FF06[3100]               inc  word[nlabel]
  7996 00004033 A1[3100]                 mov ax, [nlabel]
  7997 00004036 8946FE                   mov [bp-2], ax
  7998                                  
  7999                                  ;-741   prs("\n jne short @@");        prs(fname);  pint1(jdest);
  8000                                  
  8001 00004039 68[6440]                 push doifzero_0
  8002 0000403C E8320A                   call prs
  8003 0000403F 83C402                   add  sp, 2
  8004 00004042 8D06AB81                 lea  ax, [fname]
  8005 00004046 50                       push ax
  8006 00004047 E8270A                   call prs
  8007 0000404A 83C402                   add  sp, 2
  8008 0000404D FF76FE                   push word [bp-2]
  8009 00004050 E8150B                   call pint1
  8010 00004053 83C402                   add  sp, 2
  8011                                  
  8012                                  ;-742   stmt(); prlabel(jdest); }
  8013                                  
  8014 00004056 E8AAFA                   call stmt
  8015 00004059 FF76FE                   push word [bp-2]
  8016 0000405C E8C4FE                   call prlabel
  8017 0000405F 83C402                   add  sp, 2
  8018                                  
  8019                                  ;-743 int dodo() {int jdest; int jtemp;
  8020 00004062 C9                       LEAVE
  8021 00004063 C3                       ret
  8022                                  ; ENDP
  8023 00004064 5C6E206A6E65207368-     doifzero_0 db "\n jne short @@",0
  8024 0000406D 6F727420404000     
  8025                                  
  8026                                  dodo:  ; *** PROC ***
  8027                                  
  8028                                  ;-744   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  8029                                  
  8030                                  ;Function : dodo, Number of local variables: 2
  8031                                  ;   # type sign width addr used name   list of local variables
  8032                                  ;  200 var sign word   743 NULL jdest = bp-2
  8033                                  ;  201 var sign word   743 NULL jtemp = bp-4;
  8034 00004074 C8040000                 ENTER  4,0
  8035 00004078 FF06[3100]               inc  word[nlabel]
  8036 0000407C A1[3100]                 mov ax, [nlabel]
  8037 0000407F 8946FE                   mov [bp-2], ax
  8038 00004082 FF76FE                   push word [bp-2]
  8039 00004085 E89BFE                   call prlabel
  8040 00004088 83C402                   add  sp, 2
  8041 0000408B E875FA                   call stmt
  8042                                  
  8043                                  ;-745   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  8044                                  
  8045 0000408E 680302                   push 515
  8046 00004091 E8C108                   call expect
  8047 00004094 83C402                   add  sp, 2
  8048 00004097 E837CE                   call pexpr
  8049 0000409A FF06[3100]               inc  word[nlabel]
  8050 0000409E A1[3100]                 mov ax, [nlabel]
  8051 000040A1 8946FC                   mov [bp-4], ax
  8052 000040A4 FF76FC                   push word [bp-4]
  8053 000040A7 E8BE0A                   call pint1
  8054 000040AA 83C402                   add  sp, 2
  8055                                  
  8056                                  ;-746   prjump(jdest); prlabel(jtemp); }
  8057                                  
  8058 000040AD FF76FE                   push word [bp-2]
  8059 000040B0 E8A0FE                   call prjump
  8060 000040B3 83C402                   add  sp, 2
  8061 000040B6 FF76FC                   push word [bp-4]
  8062 000040B9 E867FE                   call prlabel
  8063 000040BC 83C402                   add  sp, 2
  8064                                  
  8065                                  ;-747 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  8066 000040BF C9                       LEAVE
  8067 000040C0 C3                       ret
  8068                                  ; ENDP
  8069                                  
  8070                                  dowhile:  ; *** PROC ***
  8071                                  ;Function : dowhile, Number of local variables: 2
  8072                                  ;   # type sign width addr used name   list of local variables
  8073                                  ;  200 var sign word   747 NULL jdest = bp-2
  8074                                  ;  201 var sign word   747 NULL tst = bp-4;
  8075 000040C1 C8040000                 ENTER  4,0
  8076 000040C5 FF06[3100]               inc  word[nlabel]
  8077 000040C9 A1[3100]                 mov ax, [nlabel]
  8078 000040CC 8946FE                   mov [bp-2], ax
  8079                                  
  8080                                  ;-748   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  8081                                  
  8082 000040CF FF76FE                   push word [bp-2]
  8083 000040D2 E84EFE                   call prlabel
  8084 000040D5 83C402                   add  sp, 2
  8085 000040D8 E8F6CD                   call pexpr
  8086 000040DB FF06[3100]               inc  word[nlabel]
  8087 000040DF A1[3100]                 mov ax, [nlabel]
  8088 000040E2 8946FC                   mov [bp-4], ax
  8089 000040E5 FF76FC                   push word [bp-4]
  8090 000040E8 E87D0A                   call pint1
  8091 000040EB 83C402                   add  sp, 2
  8092                                  
  8093                                  ;-749   stmt(); prjump(jdest); prlabel(tst); }
  8094                                  
  8095 000040EE E812FA                   call stmt
  8096 000040F1 FF76FE                   push word [bp-2]
  8097 000040F4 E85CFE                   call prjump
  8098 000040F7 83C402                   add  sp, 2
  8099 000040FA FF76FC                   push word [bp-4]
  8100 000040FD E823FE                   call prlabel
  8101 00004100 83C402                   add  sp, 2
  8102                                  
  8103                                  ;-750 int isrelational() {
  8104 00004103 C9                       LEAVE
  8105 00004104 C3                       ret
  8106                                  ; ENDP
  8107                                  
  8108                                  isrelational:  ; *** PROC ***
  8109                                  
  8110                                  ;-751   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  8111                                  
  8112 00004105 A1[2500]                 mov ax, [token]
  8113 00004108 3D2603                   cmp ax, 806
  8114 0000410B 0F850300                 jne @@isrelational460
  8115 0000410F E94700                   jmp @@w
  8116                                  @@isrelational460:
  8117 00004112 A1[2500]                 mov ax, [token]
  8118 00004115 3D2703                   cmp ax, 807
  8119 00004118 0F850300                 jne @@isrelational461
  8120 0000411C E93A00                   jmp @@w
  8121                                  
  8122                                  ;-752   if (token==T_LE) goto w; if (token==T_GE) goto w;
  8123                                  
  8124                                  @@isrelational461:
  8125 0000411F A1[2500]                 mov ax, [token]
  8126 00004122 3D3803                   cmp ax, 824
  8127 00004125 0F850300                 jne @@isrelational462
  8128 00004129 E92D00                   jmp @@w
  8129                                  @@isrelational462:
  8130 0000412C A1[2500]                 mov ax, [token]
  8131 0000412F 3D2B03                   cmp ax, 811
  8132 00004132 0F850300                 jne @@isrelational463
  8133 00004136 E92000                   jmp @@w
  8134                                  
  8135                                  ;-753   if (token=='<' ) goto w; if (token=='>' ) goto w;
  8136                                  
  8137                                  @@isrelational463:
  8138 00004139 A1[2500]                 mov ax, [token]
  8139 0000413C 83F83C                   cmp ax, 60
  8140 0000413F 0F850300                 jne @@isrelational464
  8141 00004143 E91300                   jmp @@w
  8142                                  @@isrelational464:
  8143 00004146 A1[2500]                 mov ax, [token]
  8144 00004149 83F83E                   cmp ax, 62
  8145 0000414C 0F850300                 jne @@isrelational465
  8146 00004150 E90600                   jmp @@w
  8147                                  
  8148                                  ;-754   return 0;  w: iscmp=token; token=getlex(); return 1;}
  8149                                  
  8150                                  @@isrelational465:
  8151 00004153 B80000                   mov ax, 0
  8152 00004156 E91200                   jmp @@retn
  8153                                  @@w:
  8154 00004159 A1[2500]                 mov ax, [token]
  8155 0000415C A3[2B00]                 mov word [iscmp], ax
  8156 0000415F E80A00                   call getlex
  8157 00004162 A3[2500]                 mov word [token], ax
  8158 00004165 B80100                   mov ax, 1
  8159 00004168 E90000                   jmp @@retn
  8160                                  
  8161                                  ;-755  
  8162                                  
  8163                                  
  8164                                  ;-756 char symboltemp[80];    
  8165                                  
  8166                                  @@retn:
  8167 0000416B C3                       ret
  8168                                  ; ENDP
  8169                                  section .bss
  8170                                  absolute 53468
  8171 0000D0DC <res 00000050>          symboltemp resb 80
  8172                                  section .text
  8173                                  
  8174                                  ;-757 int getlex() { char c; char *p; 
  8175                                  
  8176                                  
  8177                                  getlex:  ; *** PROC ***
  8178                                  
  8179                                  ;-758 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  8180                                  
  8181                                  ;Function : getlex, Number of local variables: 2
  8182                                  ;   # type sign width addr used name   list of local variables
  8183                                  ;  200 var sign byte   757 NULL c = bp-2
  8184                                  ;  201 ptr sign byte   757 NULL p = bp-4;
  8185 0000416C C8040000                 ENTER  4,0
  8186                                  @@g1:
  8187 00004170 E8A207                   call next
  8188 00004173 8846FE                   mov [bp-2], al
  8189 00004176 8A46FE                   mov al, [bp-2]
  8190 00004179 3C00                     cmp al, 0
  8191 0000417B 0F850600                 jne @@getlex466
  8192 0000417F B80000                   mov ax, 0
  8193 00004182 E96D05                   jmp @@retn
  8194                                  @@getlex466:
  8195 00004185 8A46FE                   mov al, [bp-2]
  8196 00004188 3C20                     cmp al, 32
  8197 0000418A 0F8F0200                 jg  @@getlex467
  8198 0000418E EBE0                     jmp @@g1
  8199                                  
  8200                                  ;-759   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  8201                                  
  8202                                  @@getlex467:
  8203 00004190 8A46FE                   mov al, [bp-2]
  8204 00004193 3C3D                     cmp al, 61
  8205 00004195 0F851200                 jne @@getlex468
  8206 00004199 A0[2A00]                 mov al, [thechar]
  8207 0000419C 3C3D                     cmp al, 61
  8208 0000419E 0F850900                 jne @@getlex469
  8209 000041A2 E87007                   call next
  8210 000041A5 B82603                   mov ax, 806
  8211 000041A8 E94705                   jmp @@retn
  8212                                  @@getlex469:
  8213                                  
  8214                                  ;-760   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  8215                                  
  8216                                  @@getlex468:
  8217 000041AB 8A46FE                   mov al, [bp-2]
  8218 000041AE 3C21                     cmp al, 33
  8219 000041B0 0F851200                 jne @@getlex470
  8220 000041B4 A0[2A00]                 mov al, [thechar]
  8221 000041B7 3C3D                     cmp al, 61
  8222 000041B9 0F850900                 jne @@getlex471
  8223 000041BD E85507                   call next
  8224 000041C0 B82703                   mov ax, 807
  8225 000041C3 E92C05                   jmp @@retn
  8226                                  @@getlex471:
  8227                                  
  8228                                  ;-761   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8229                                  
  8230                                  @@getlex470:
  8231 000041C6 8A46FE                   mov al, [bp-2]
  8232 000041C9 3C3C                     cmp al, 60
  8233 000041CB 0F851200                 jne @@getlex472
  8234 000041CF A0[2A00]                 mov al, [thechar]
  8235 000041D2 3C3D                     cmp al, 61
  8236 000041D4 0F850900                 jne @@getlex473
  8237 000041D8 E83A07                   call next
  8238 000041DB B83803                   mov ax, 824
  8239 000041DE E91105                   jmp @@retn
  8240                                  @@getlex473:
  8241                                  
  8242                                  ;-762   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8243                                  
  8244                                  @@getlex472:
  8245 000041E1 8A46FE                   mov al, [bp-2]
  8246 000041E4 3C3E                     cmp al, 62
  8247 000041E6 0F851200                 jne @@getlex474
  8248 000041EA A0[2A00]                 mov al, [thechar]
  8249 000041ED 3C3D                     cmp al, 61
  8250 000041EF 0F850900                 jne @@getlex475
  8251 000041F3 E81F07                   call next
  8252 000041F6 B82B03                   mov ax, 811
  8253 000041F9 E9F604                   jmp @@retn
  8254                                  @@getlex475:
  8255                                  
  8256                                  ;-763   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8257                                  
  8258                                  @@getlex474:
  8259 000041FC 8A46FE                   mov al, [bp-2]
  8260 000041FF 3C3C                     cmp al, 60
  8261 00004201 0F851200                 jne @@getlex476
  8262 00004205 A0[2A00]                 mov al, [thechar]
  8263 00004208 3C3C                     cmp al, 60
  8264 0000420A 0F850900                 jne @@getlex477
  8265 0000420E E80407                   call next
  8266 00004211 B8D804                   mov ax, 1240
  8267 00004214 E9DB04                   jmp @@retn
  8268                                  @@getlex477:
  8269                                  
  8270                                  ;-764   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8271                                  
  8272                                  @@getlex476:
  8273 00004217 8A46FE                   mov al, [bp-2]
  8274 0000421A 3C3E                     cmp al, 62
  8275 0000421C 0F851200                 jne @@getlex478
  8276 00004220 A0[2A00]                 mov al, [thechar]
  8277 00004223 3C3E                     cmp al, 62
  8278 00004225 0F850900                 jne @@getlex479
  8279 00004229 E8E906                   call next
  8280 0000422C B8D904                   mov ax, 1241
  8281 0000422F E9C004                   jmp @@retn
  8282                                  @@getlex479:
  8283                                  
  8284                                  ;-765   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8285                                  
  8286                                  @@getlex478:
  8287 00004232 8A46FE                   mov al, [bp-2]
  8288 00004235 3C2B                     cmp al, 43
  8289 00004237 0F851200                 jne @@getlex480
  8290 0000423B A0[2A00]                 mov al, [thechar]
  8291 0000423E 3C2B                     cmp al, 43
  8292 00004240 0F850900                 jne @@getlex481
  8293 00004244 E8CE06                   call next
  8294 00004247 B8C304                   mov ax, 1219
  8295 0000424A E9A504                   jmp @@retn
  8296                                  @@getlex481:
  8297                                  
  8298                                  ;-766   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8299                                  
  8300                                  @@getlex480:
  8301 0000424D 8A46FE                   mov al, [bp-2]
  8302 00004250 3C2D                     cmp al, 45
  8303 00004252 0F851200                 jne @@getlex482
  8304 00004256 A0[2A00]                 mov al, [thechar]
  8305 00004259 3C2D                     cmp al, 45
  8306 0000425B 0F850900                 jne @@getlex483
  8307 0000425F E8B306                   call next
  8308 00004262 B8C904                   mov ax, 1225
  8309 00004265 E98A04                   jmp @@retn
  8310                                  @@getlex483:
  8311                                  
  8312                                  ;-767   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8313                                  
  8314                                  @@getlex482:
  8315 00004268 8A46FE                   mov al, [bp-2]
  8316 0000426B 3C2B                     cmp al, 43
  8317 0000426D 0F851200                 jne @@getlex484
  8318 00004271 A0[2A00]                 mov al, [thechar]
  8319 00004274 3C3D                     cmp al, 61
  8320 00004276 0F850900                 jne @@getlex485
  8321 0000427A E89806                   call next
  8322 0000427D B8CE04                   mov ax, 1230
  8323 00004280 E96F04                   jmp @@retn
  8324                                  @@getlex485:
  8325                                  
  8326                                  ;-768   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8327                                  
  8328                                  @@getlex484:
  8329 00004283 8A46FE                   mov al, [bp-2]
  8330 00004286 3C2D                     cmp al, 45
  8331 00004288 0F851200                 jne @@getlex486
  8332 0000428C A0[2A00]                 mov al, [thechar]
  8333 0000428F 3C3D                     cmp al, 61
  8334 00004291 0F850900                 jne @@getlex487
  8335 00004295 E87D06                   call next
  8336 00004298 B8CF04                   mov ax, 1231
  8337 0000429B E95404                   jmp @@retn
  8338                                  @@getlex487:
  8339                                  
  8340                                  ;-769   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8341                                  
  8342                                  @@getlex486:
  8343 0000429E 8A46FE                   mov al, [bp-2]
  8344 000042A1 3C26                     cmp al, 38
  8345 000042A3 0F851200                 jne @@getlex488
  8346 000042A7 A0[2A00]                 mov al, [thechar]
  8347 000042AA 3C3D                     cmp al, 61
  8348 000042AC 0F850900                 jne @@getlex489
  8349 000042B0 E86206                   call next
  8350 000042B3 B8D204                   mov ax, 1234
  8351 000042B6 E93904                   jmp @@retn
  8352                                  @@getlex489:
  8353                                  
  8354                                  ;-770   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8355                                  
  8356                                  @@getlex488:
  8357 000042B9 8A46FE                   mov al, [bp-2]
  8358 000042BC 3C7C                     cmp al, 124
  8359 000042BE 0F851200                 jne @@getlex490
  8360 000042C2 A0[2A00]                 mov al, [thechar]
  8361 000042C5 3C3D                     cmp al, 61
  8362 000042C7 0F850900                 jne @@getlex491
  8363 000042CB E84706                   call next
  8364 000042CE B8D304                   mov ax, 1235
  8365 000042D1 E91E04                   jmp @@retn
  8366                                  @@getlex491:
  8367                                  
  8368                                  ;-771   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8369                                  
  8370                                  @@getlex490:
  8371 000042D4 8A46FE                   mov al, [bp-2]
  8372 000042D7 3C2A                     cmp al, 42
  8373 000042D9 0F851200                 jne @@getlex492
  8374 000042DD A0[2A00]                 mov al, [thechar]
  8375 000042E0 3C3D                     cmp al, 61
  8376 000042E2 0F850900                 jne @@getlex493
  8377 000042E6 E82C06                   call next
  8378 000042E9 B8D004                   mov ax, 1232
  8379 000042EC E90304                   jmp @@retn
  8380                                  @@getlex493:
  8381                                  
  8382                                  ;-772   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8383                                  
  8384                                  @@getlex492:
  8385 000042EF 8A46FE                   mov al, [bp-2]
  8386 000042F2 3C2F                     cmp al, 47
  8387 000042F4 0F851200                 jne @@getlex494
  8388 000042F8 A0[2A00]                 mov al, [thechar]
  8389 000042FB 3C3D                     cmp al, 61
  8390 000042FD 0F850900                 jne @@getlex495
  8391 00004301 E81106                   call next
  8392 00004304 B8D104                   mov ax, 1233
  8393 00004307 E9E803                   jmp @@retn
  8394                                  @@getlex495:
  8395                                  
  8396                                  ;-773   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8397                                  
  8398                                  @@getlex494:
  8399 0000430A 8A46FE                   mov al, byte [bp-2]
  8400 0000430D B400                     mov ah, 0
  8401 0000430F 50                       push ax
  8402 00004310 68[F446]                 push getlex_0
  8403 00004313 E85517                   call instr1
  8404 00004316 83C404                   add  sp, 4
  8405 00004319 08C0                     or  al, al
  8406 0000431B 0F840600                 je @@getlex496
  8407 0000431F 8A46FE                   mov al, [bp-2]
  8408 00004322 E9CD03                   jmp @@retn
  8409                                  
  8410                                  ;-774   if (c == '/') { if (thechar == '/') {
  8411                                  
  8412                                  @@getlex496:
  8413 00004325 8A46FE                   mov al, [bp-2]
  8414 00004328 3C2F                     cmp al, 47
  8415 0000432A 0F852000                 jne @@getlex497
  8416 0000432E A0[2A00]                 mov al, [thechar]
  8417 00004331 3C2F                     cmp al, 47
  8418 00004333 0F851700                 jne @@getlex498
  8419                                  
  8420                                  ;-775       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8421                                  
  8422                                  @@getlex499:
  8423 00004337 E8DB05                   call next
  8424 0000433A 8846FE                   mov [bp-2], al
  8425 0000433D 8A46FE                   mov al, [bp-2]
  8426 00004340 3C0D                     cmp al, 13
  8427 00004342 0F840200                 je  @@getlex500
  8428 00004346 EBEF                     jmp @@getlex499
  8429                                  @@getlex500:
  8430 00004348 E821FE                   call getlex
  8431 0000434B E9A403                   jmp @@retn
  8432                                  @@getlex498:
  8433                                  
  8434                                  ;-776   if (c == '/') { if (thechar == '*') {
  8435                                  
  8436                                  @@getlex497:
  8437 0000434E 8A46FE                   mov al, [bp-2]
  8438 00004351 3C2F                     cmp al, 47
  8439 00004353 0F853A00                 jne @@getlex501
  8440 00004357 A0[2A00]                 mov al, [thechar]
  8441 0000435A 3C2A                     cmp al, 42
  8442 0000435C 0F852B00                 jne @@getlex502
  8443                                  
  8444                                  ;-777       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8445                                  
  8446                                  @@g2:
  8447 00004360 E8B205                   call next
  8448 00004363 8846FE                   mov [bp-2], al
  8449 00004366 8A46FE                   mov al, [bp-2]
  8450 00004369 3C2A                     cmp al, 42
  8451 0000436B 0F840200                 je  @@getlex503
  8452 0000436F EBEF                     jmp @@g2
  8453                                  @@getlex503:
  8454 00004371 A0[2A00]                 mov al, [thechar]
  8455 00004374 3C2F                     cmp al, 47
  8456 00004376 0F840200                 je  @@getlex504
  8457 0000437A EBE4                     jmp @@g2
  8458                                  
  8459                                  ;-778       c=next(); return getlex(); } else  return '/'; }
  8460                                  
  8461                                  @@getlex504:
  8462 0000437C E89605                   call next
  8463 0000437F 8846FE                   mov [bp-2], al
  8464 00004382 E8E7FD                   call getlex
  8465 00004385 E96A03                   jmp @@retn
  8466 00004388 E90600                   jmp @@getlex505
  8467                                  @@getlex502:
  8468 0000438B B82F00                   mov ax, 47
  8469 0000438E E96103                   jmp @@retn
  8470                                  @@getlex505:
  8471                                  
  8472                                  ;-779   if (c == '"') {getstring(c); return T_STRING;}
  8473                                  
  8474                                  @@getlex501:
  8475 00004391 8A46FE                   mov al, [bp-2]
  8476 00004394 3C22                     cmp al, 34
  8477 00004396 0F851200                 jne @@getlex506
  8478 0000439A 8A46FE                   mov al, byte [bp-2]
  8479 0000439D B400                     mov ah, 0
  8480 0000439F 50                       push ax
  8481 000043A0 E83B05                   call getstring
  8482 000043A3 83C402                   add  sp, 2
  8483 000043A6 B80201                   mov ax, 258
  8484 000043A9 E94603                   jmp @@retn
  8485                                  
  8486                                  ;-780   if (digit(c)) { getdigit(c); return T_CONST; }
  8487                                  
  8488                                  @@getlex506:
  8489 000043AC 8A46FE                   mov al, byte [bp-2]
  8490 000043AF B400                     mov ah, 0
  8491 000043B1 50                       push ax
  8492 000043B2 E81A17                   call digit
  8493 000043B5 83C402                   add  sp, 2
  8494 000043B8 08C0                     or  al, al
  8495 000043BA 0F841200                 je @@getlex507
  8496 000043BE 8A46FE                   mov al, byte [bp-2]
  8497 000043C1 B400                     mov ah, 0
  8498 000043C3 50                       push ax
  8499 000043C4 E84104                   call getdigit
  8500 000043C7 83C402                   add  sp, 2
  8501 000043CA B80101                   mov ax, 257
  8502 000043CD E92203                   jmp @@retn
  8503                                  
  8504                                  ;-781   if (c==39) { lexval=next();
  8505                                  
  8506                                  @@getlex507:
  8507 000043D0 8A46FE                   mov al, [bp-2]
  8508 000043D3 3C27                     cmp al, 39
  8509 000043D5 0F854F00                 jne @@getlex508
  8510 000043D9 E83905                   call next
  8511 000043DC A3[3900]                 mov word [lexval], ax
  8512                                  
  8513                                  ;-782     if (lexval==92) {lexval=next();
  8514                                  
  8515 000043DF A1[3900]                 mov ax, [lexval]
  8516 000043E2 83F85C                   cmp ax, 92
  8517 000043E5 0F853600                 jne @@getlex509
  8518 000043E9 E82905                   call next
  8519 000043EC A3[3900]                 mov word [lexval], ax
  8520                                  
  8521                                  ;-783       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8522                                  
  8523 000043EF A1[3900]                 mov ax, [lexval]
  8524 000043F2 83F86E                   cmp ax, 110
  8525 000043F5 0F850600                 jne @@getlex510
  8526 000043F9 B80A00                   mov ax, 10
  8527 000043FC A3[3900]                 mov word [lexval], ax
  8528                                  @@getlex510:
  8529 000043FF A1[3900]                 mov ax, [lexval]
  8530 00004402 83F874                   cmp ax, 116
  8531 00004405 0F850600                 jne @@getlex511
  8532 00004409 B80900                   mov ax, 9
  8533 0000440C A3[3900]                 mov word [lexval], ax
  8534                                  
  8535                                  ;-784       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8536                                  
  8537                                  @@getlex511:
  8538 0000440F A1[3900]                 mov ax, [lexval]
  8539 00004412 83F830                   cmp ax, 48
  8540 00004415 0F850600                 jne @@getlex512
  8541 00004419 B80000                   mov ax, 0
  8542 0000441C A3[3900]                 mov word [lexval], ax
  8543                                  @@getlex512:
  8544                                  @@getlex509:
  8545 0000441F E8F304                   call next
  8546 00004422 B80101                   mov ax, 257
  8547 00004425 E9CA02                   jmp @@retn
  8548                                  
  8549                                  ;-785   if (letter(c)) { 
  8550                                  
  8551                                  @@getlex508:
  8552 00004428 8A46FE                   mov al, byte [bp-2]
  8553 0000442B B400                     mov ah, 0
  8554 0000442D 50                       push ax
  8555 0000442E E8C816                   call letter
  8556 00004431 83C402                   add  sp, 2
  8557 00004434 08C0                     or  al, al
  8558 00004436 0F84AF02                 je @@getlex513
  8559                                  
  8560                                  ;-786     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8561                                  
  8562 0000443A 8D062B81                 lea  ax, [symbol]
  8563 0000443E 50                       push ax
  8564 0000443F 8D06DCD0                 lea  ax, [symboltemp]
  8565 00004443 50                       push ax
  8566 00004444 E8F415                   call strcpy
  8567 00004447 83C404                   add  sp, 4
  8568 0000444A B82B81                   mov ax, symbol
  8569 0000444D 8946FC                   mov [bp-4], ax
  8570 00004450 8A46FE                   mov al, [bp-2]
  8571 00004453 8B5EFC                   mov  bx, [bp-4]
  8572 00004456 8807                     mov  [bx], al
  8573 00004458 FF46FC                   inc  word[bp-4]
  8574                                  
  8575                                  ;-787     while(letter(thechar)) {c=next(); *p=c;  p++; } 
  8576                                  
  8577                                  @@getlex514:
  8578 0000445B A0[2A00]                 mov al, byte [thechar]
  8579 0000445E B400                     mov ah, 0
  8580 00004460 50                       push ax
  8581 00004461 E89516                   call letter
  8582 00004464 83C402                   add  sp, 2
  8583 00004467 08C0                     or  al, al
  8584 00004469 0F841300                 je @@getlex515
  8585 0000446D E8A504                   call next
  8586 00004470 8846FE                   mov [bp-2], al
  8587 00004473 8A46FE                   mov al, [bp-2]
  8588 00004476 8B5EFC                   mov  bx, [bp-4]
  8589 00004479 8807                     mov  [bx], al
  8590 0000447B FF46FC                   inc  word[bp-4]
  8591                                  
  8592                                  ;-788       *p=0;
  8593                                  
  8594 0000447E EBDB                     jmp @@getlex514
  8595                                  @@getlex515:
  8596 00004480 B80000                   mov ax, 0
  8597 00004483 8B5EFC                   mov  bx, [bp-4]
  8598 00004486 8807                     mov  [bx], al
  8599                                  
  8600                                  ;-789     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8601                                  
  8602 00004488 68[0A47]                 push getlex_1
  8603 0000448B 8D062B81                 lea  ax, [symbol]
  8604 0000448F 50                       push ax
  8605 00004490 E8CF16                   call eqstr
  8606 00004493 83C404                   add  sp, 4
  8607 00004496 08C0                     or  al, al
  8608 00004498 0F840600                 je @@getlex516
  8609 0000449C B81302                   mov ax, 531
  8610 0000449F E95002                   jmp @@retn
  8611                                  
  8612                                  ;-790     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8613                                  
  8614                                  @@getlex516:
  8615 000044A2 68[1147]                 push getlex_2
  8616 000044A5 8D062B81                 lea  ax, [symbol]
  8617 000044A9 50                       push ax
  8618 000044AA E8B516                   call eqstr
  8619 000044AD 83C404                   add  sp, 4
  8620 000044B0 08C0                     or  al, al
  8621 000044B2 0F840600                 je @@getlex517
  8622 000044B6 B81402                   mov ax, 532
  8623 000044B9 E93602                   jmp @@retn
  8624                                  
  8625                                  ;-791     if (eqstr(symbol,"void"    )) return T_VOID;
  8626                                  
  8627                                  @@getlex517:
  8628 000044BC 68[1A47]                 push getlex_3
  8629 000044BF 8D062B81                 lea  ax, [symbol]
  8630 000044C3 50                       push ax
  8631 000044C4 E89B16                   call eqstr
  8632 000044C7 83C404                   add  sp, 4
  8633 000044CA 08C0                     or  al, al
  8634 000044CC 0F840600                 je @@getlex518
  8635 000044D0 B81102                   mov ax, 529
  8636 000044D3 E91C02                   jmp @@retn
  8637                                  
  8638                                  ;-792     if (eqstr(symbol,"int"     )) return T_INT;
  8639                                  
  8640                                  @@getlex518:
  8641 000044D6 68[1F47]                 push getlex_4
  8642 000044D9 8D062B81                 lea  ax, [symbol]
  8643 000044DD 50                       push ax
  8644 000044DE E88116                   call eqstr
  8645 000044E1 83C404                   add  sp, 4
  8646 000044E4 08C0                     or  al, al
  8647 000044E6 0F840600                 je @@getlex519
  8648 000044EA B80502                   mov ax, 517
  8649 000044ED E90202                   jmp @@retn
  8650                                  
  8651                                  ;-793     if (eqstr(symbol,"short"   )) return T_SHORT;
  8652                                  
  8653                                  @@getlex519:
  8654 000044F0 68[2347]                 push getlex_5
  8655 000044F3 8D062B81                 lea  ax, [symbol]
  8656 000044F7 50                       push ax
  8657 000044F8 E86716                   call eqstr
  8658 000044FB 83C404                   add  sp, 4
  8659 000044FE 08C0                     or  al, al
  8660 00004500 0F840600                 je @@getlex520
  8661 00004504 B81602                   mov ax, 534
  8662 00004507 E9E801                   jmp @@retn
  8663                                  
  8664                                  ;-794     if (eqstr(symbol,"long"    )) return T_LONG;
  8665                                  
  8666                                  @@getlex520:
  8667 0000450A 68[2947]                 push getlex_6
  8668 0000450D 8D062B81                 lea  ax, [symbol]
  8669 00004511 50                       push ax
  8670 00004512 E84D16                   call eqstr
  8671 00004515 83C404                   add  sp, 4
  8672 00004518 08C0                     or  al, al
  8673 0000451A 0F840600                 je @@getlex521
  8674 0000451E B81502                   mov ax, 533
  8675 00004521 E9CE01                   jmp @@retn
  8676                                  
  8677                                  ;-795     if (eqstr(symbol,"uint32"  )) return T_UINT32;
  8678                                  
  8679                                  @@getlex521:
  8680 00004524 68[2E47]                 push getlex_7
  8681 00004527 8D062B81                 lea  ax, [symbol]
  8682 0000452B 50                       push ax
  8683 0000452C E83316                   call eqstr
  8684 0000452F 83C404                   add  sp, 4
  8685 00004532 08C0                     or  al, al
  8686 00004534 0F840600                 je @@getlex522
  8687 00004538 B82102                   mov ax, 545
  8688 0000453B E9B401                   jmp @@retn
  8689                                  
  8690                                  ;-796     if (eqstr(symbol,"inth"    )) return T_INTH;
  8691                                  
  8692                                  @@getlex522:
  8693 0000453E 68[3547]                 push getlex_8
  8694 00004541 8D062B81                 lea  ax, [symbol]
  8695 00004545 50                       push ax
  8696 00004546 E81916                   call eqstr
  8697 00004549 83C404                   add  sp, 4
  8698 0000454C 08C0                     or  al, al
  8699 0000454E 0F840600                 je @@getlex523
  8700 00004552 B85802                   mov ax, 600
  8701 00004555 E99A01                   jmp @@retn
  8702                                  
  8703                                  ;-797     if (eqstr(symbol,"char"    )) return T_CHAR;
  8704                                  
  8705                                  @@getlex523:
  8706 00004558 68[3A47]                 push getlex_9
  8707 0000455B 8D062B81                 lea  ax, [symbol]
  8708 0000455F 50                       push ax
  8709 00004560 E8FF15                   call eqstr
  8710 00004563 83C404                   add  sp, 4
  8711 00004566 08C0                     or  al, al
  8712 00004568 0F840600                 je @@getlex524
  8713 0000456C B81202                   mov ax, 530
  8714 0000456F E98001                   jmp @@retn
  8715                                  
  8716                                  ;-798     if (eqstr(symbol,"asm"     )) return T_ASM;
  8717                                  
  8718                                  @@getlex524:
  8719 00004572 68[3F47]                 push getlex_10
  8720 00004575 8D062B81                 lea  ax, [symbol]
  8721 00004579 50                       push ax
  8722 0000457A E8E515                   call eqstr
  8723 0000457D 83C404                   add  sp, 4
  8724 00004580 08C0                     or  al, al
  8725 00004582 0F840600                 je @@getlex525
  8726 00004586 B80602                   mov ax, 518
  8727 00004589 E96601                   jmp @@retn
  8728                                  
  8729                                  ;-799     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8730                                  
  8731                                  @@getlex525:
  8732 0000458C 68[4347]                 push getlex_11
  8733 0000458F 8D062B81                 lea  ax, [symbol]
  8734 00004593 50                       push ax
  8735 00004594 E8CB15                   call eqstr
  8736 00004597 83C404                   add  sp, 4
  8737 0000459A 08C0                     or  al, al
  8738 0000459C 0F840600                 je @@getlex526
  8739 000045A0 B80702                   mov ax, 519
  8740 000045A3 E94C01                   jmp @@retn
  8741                                  
  8742                                  ;-800     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8743                                  
  8744                                  @@getlex526:
  8745 000045A6 68[4947]                 push getlex_12
  8746 000045A9 8D062B81                 lea  ax, [symbol]
  8747 000045AD 50                       push ax
  8748 000045AE E8B115                   call eqstr
  8749 000045B1 83C404                   add  sp, 4
  8750 000045B4 08C0                     or  al, al
  8751 000045B6 0F840600                 je @@getlex527
  8752 000045BA B80802                   mov ax, 520
  8753 000045BD E93201                   jmp @@retn
  8754                                  
  8755                                  ;-801     if (eqstr(symbol,"return"  )) return T_RETURN;
  8756                                  
  8757                                  @@getlex527:
  8758 000045C0 68[5247]                 push getlex_13
  8759 000045C3 8D062B81                 lea  ax, [symbol]
  8760 000045C7 50                       push ax
  8761 000045C8 E89715                   call eqstr
  8762 000045CB 83C404                   add  sp, 4
  8763 000045CE 08C0                     or  al, al
  8764 000045D0 0F840600                 je @@getlex528
  8765 000045D4 B80002                   mov ax, 512
  8766 000045D7 E91801                   jmp @@retn
  8767                                  
  8768                                  ;-802     if (eqstr(symbol,"if"      )) return T_IF;
  8769                                  
  8770                                  @@getlex528:
  8771 000045DA 68[5947]                 push getlex_14
  8772 000045DD 8D062B81                 lea  ax, [symbol]
  8773 000045E1 50                       push ax
  8774 000045E2 E87D15                   call eqstr
  8775 000045E5 83C404                   add  sp, 4
  8776 000045E8 08C0                     or  al, al
  8777 000045EA 0F840600                 je @@getlex529
  8778 000045EE B80102                   mov ax, 513
  8779 000045F1 E9FE00                   jmp @@retn
  8780                                  
  8781                                  ;-803     if (eqstr(symbol,"ifcarry" )) return T_IFCARRY;
  8782                                  
  8783                                  @@getlex529:
  8784 000045F4 68[5C47]                 push getlex_15
  8785 000045F7 8D062B81                 lea  ax, [symbol]
  8786 000045FB 50                       push ax
  8787 000045FC E86315                   call eqstr
  8788 000045FF 83C404                   add  sp, 4
  8789 00004602 08C0                     or  al, al
  8790 00004604 0F840600                 je @@getlex530
  8791 00004608 B85902                   mov ax, 601
  8792 0000460B E9E400                   jmp @@retn
  8793                                  
  8794                                  ;-804     if (eqstr(symbol,"ifzero"  )) return T_IFZERO;
  8795                                  
  8796                                  @@getlex530:
  8797 0000460E 68[6447]                 push getlex_16
  8798 00004611 8D062B81                 lea  ax, [symbol]
  8799 00004615 50                       push ax
  8800 00004616 E84915                   call eqstr
  8801 00004619 83C404                   add  sp, 4
  8802 0000461C 08C0                     or  al, al
  8803 0000461E 0F840600                 je @@getlex531
  8804 00004622 B85A02                   mov ax, 602
  8805 00004625 E9CA00                   jmp @@retn
  8806                                  
  8807                                  ;-805     if (eqstr(symbol,"else"    )) return T_ELSE;
  8808                                  
  8809                                  @@getlex531:
  8810 00004628 68[6B47]                 push getlex_17
  8811 0000462B 8D062B81                 lea  ax, [symbol]
  8812 0000462F 50                       push ax
  8813 00004630 E82F15                   call eqstr
  8814 00004633 83C404                   add  sp, 4
  8815 00004636 08C0                     or  al, al
  8816 00004638 0F840600                 je @@getlex532
  8817 0000463C B80202                   mov ax, 514
  8818 0000463F E9B000                   jmp @@retn
  8819                                  
  8820                                  ;-806     if (eqstr(symbol,"while"   )) return T_WHILE;
  8821                                  
  8822                                  @@getlex532:
  8823 00004642 68[7047]                 push getlex_18
  8824 00004645 8D062B81                 lea  ax, [symbol]
  8825 00004649 50                       push ax
  8826 0000464A E81515                   call eqstr
  8827 0000464D 83C404                   add  sp, 4
  8828 00004650 08C0                     or  al, al
  8829 00004652 0F840600                 je @@getlex533
  8830 00004656 B80302                   mov ax, 515
  8831 00004659 E99600                   jmp @@retn
  8832                                  
  8833                                  ;-807     if (eqstr(symbol,"do"      )) return T_DO;
  8834                                  
  8835                                  @@getlex533:
  8836 0000465C 68[7647]                 push getlex_19
  8837 0000465F 8D062B81                 lea  ax, [symbol]
  8838 00004663 50                       push ax
  8839 00004664 E8FB14                   call eqstr
  8840 00004667 83C404                   add  sp, 4
  8841 0000466A 08C0                     or  al, al
  8842 0000466C 0F840600                 je @@getlex534
  8843 00004670 B80402                   mov ax, 516
  8844 00004673 E97C00                   jmp @@retn
  8845                                  
  8846                                  ;-808     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8847                                  
  8848                                  @@getlex534:
  8849 00004676 68[7947]                 push getlex_20
  8850 00004679 8D062B81                 lea  ax, [symbol]
  8851 0000467D 50                       push ax
  8852 0000467E E8E114                   call eqstr
  8853 00004681 83C404                   add  sp, 4
  8854 00004684 08C0                     or  al, al
  8855 00004686 0F840600                 je @@getlex535
  8856 0000468A B80902                   mov ax, 521
  8857 0000468D E96200                   jmp @@retn
  8858                                  
  8859                                  ;-809     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8860                                  
  8861                                  @@getlex535:
  8862 00004690 68[7E47]                 push getlex_21
  8863 00004693 8D062B81                 lea  ax, [symbol]
  8864 00004697 50                       push ax
  8865 00004698 E8C714                   call eqstr
  8866 0000469B 83C404                   add  sp, 4
  8867 0000469E 08C0                     or  al, al
  8868 000046A0 0F840600                 je @@getlex536
  8869 000046A4 B8FF01                   mov ax, 511
  8870 000046A7 E94800                   jmp @@retn
  8871                                  
  8872                                  ;-810     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8873                                  
  8874                                  @@getlex536:
  8875 000046AA 68[8547]                 push getlex_22
  8876 000046AD 8D062B81                 lea  ax, [symbol]
  8877 000046B1 50                       push ax
  8878 000046B2 E8AD14                   call eqstr
  8879 000046B5 83C404                   add  sp, 4
  8880 000046B8 08C0                     or  al, al
  8881 000046BA 0F840600                 je @@getlex537
  8882 000046BE B8FE01                   mov ax, 510
  8883 000046C1 E92E00                   jmp @@retn
  8884                                  
  8885                                  ;-811     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8886                                  
  8887                                  @@getlex537:
  8888 000046C4 E8E000                   call convertdefine
  8889 000046C7 08C0                     or  al, al
  8890 000046C9 0F841600                 je @@getlex538
  8891 000046CD 8D06DCD0                 lea  ax, [symboltemp]
  8892 000046D1 50                       push ax
  8893 000046D2 8D062B81                 lea  ax, [symbol]
  8894 000046D6 50                       push ax
  8895 000046D7 E86113                   call strcpy
  8896 000046DA 83C404                   add  sp, 4
  8897 000046DD B80101                   mov ax, 257
  8898 000046E0 E90F00                   jmp @@retn
  8899                                  
  8900                                  ;-812     return T_NAME; } error1("Input item not recognized"); }
  8901                                  
  8902                                  @@getlex538:
  8903 000046E3 B80001                   mov ax, 256
  8904 000046E6 E90900                   jmp @@retn
  8905                                  @@getlex513:
  8906 000046E9 68[8D47]                 push getlex_23
  8907 000046EC E86B06                   call error1
  8908 000046EF 83C402                   add  sp, 2
  8909                                  
  8910                                  ;-813 
  8911                                  
  8912                                  
  8913                                  ;-814 int convertdefine() { int i; int j;   i=0;
  8914                                  
  8915 000046F2 C9                      @@retn: LEAVE
  8916 000046F3 C3                       ret
  8917                                  ; ENDP
  8918 000046F4 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8919 000046FD 3A252D3E3C3D2B2126-
  8920 00004706 7C233F00           
  8921 0000470A 7369676E656400          getlex_1 db "signed",0
  8922 00004711 756E7369676E656400      getlex_2 db "unsigned",0
  8923 0000471A 766F696400              getlex_3 db "void",0
  8924 0000471F 696E7400                getlex_4 db "int",0
  8925 00004723 73686F727400            getlex_5 db "short",0
  8926 00004729 6C6F6E6700              getlex_6 db "long",0
  8927 0000472E 75696E74333200          getlex_7 db "uint32",0
  8928 00004735 696E746800              getlex_8 db "inth",0
  8929 0000473A 6368617200              getlex_9 db "char",0
  8930 0000473F 61736D00                getlex_10 db "asm",0
  8931 00004743 5F5F61736D00            getlex_11 db "__asm",0
  8932 00004749 5F5F656D69745F5F00      getlex_12 db "__emit__",0
  8933 00004752 72657475726E00          getlex_13 db "return",0
  8934 00004759 696600                  getlex_14 db "if",0
  8935 0000475C 6966636172727900        getlex_15 db "ifcarry",0
  8936 00004764 69667A65726F00          getlex_16 db "ifzero",0
  8937 0000476B 656C736500              getlex_17 db "else",0
  8938 00004770 7768696C6500            getlex_18 db "while",0
  8939 00004776 646F00                  getlex_19 db "do",0
  8940 00004779 676F746F00              getlex_20 db "goto",0
  8941 0000477E 646566696E6500          getlex_21 db "define",0
  8942 00004785 696E636C75646500        getlex_22 db "include",0
  8943 0000478D 496E70757420697465-     getlex_23 db "Input item not recognized",0
  8944 00004796 6D206E6F7420726563-
  8945 0000479F 6F676E697A656400   
  8946                                  
  8947                                  convertdefine:  ; *** PROC ***
  8948                                  ;Function : convertdefine, Number of local variables: 2
  8949                                  ;   # type sign width addr used name   list of local variables
  8950                                  ;  200 var sign word   814 NULL i = bp-2
  8951                                  ;  201 var sign word   814 NULL j = bp-4;
  8952 000047A7 C8040000                 ENTER  4,0
  8953 000047AB B80000                   mov ax, 0
  8954 000047AE 8946FE                   mov [bp-2], ax
  8955                                  
  8956                                  ;-815   while (i < GTop) {
  8957                                  
  8958                                  @@convertdefine539:
  8959 000047B1 8B46FE                   mov ax, [bp-2]
  8960 000047B4 3B06[3500]               cmp ax, [GTop]
  8961 000047B8 0F8D4400                 jge @@convertdefine540
  8962                                  
  8963                                  ;-816    j=adrofname(i); 
  8964                                  
  8965 000047BC FF76FE                   push word [bp-2]
  8966 000047BF E85ABF                   call adrofname
  8967 000047C2 83C402                   add  sp, 2
  8968 000047C5 8946FC                   mov [bp-4], ax
  8969                                  
  8970                                  ;-817    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8971                                  
  8972 000047C8 FF76FC                   push word [bp-4]
  8973 000047CB 8D062B81                 lea  ax, [symbol]
  8974 000047CF 50                       push ax
  8975 000047D0 E88F13                   call eqstr
  8976 000047D3 83C404                   add  sp, 4
  8977 000047D6 08C0                     or  al, al
  8978 000047D8 0F841F00                 je @@convertdefine541
  8979 000047DC 8B5EFE                   mov bx, [bp-2]
  8980 000047DF 8A87B782                 mov al, [GType + bx]
  8981 000047E3 3C23                     cmp al, 35
  8982 000047E5 0F851200                 jne @@convertdefine542
  8983 000047E9 8B5EFE                   mov bx, [bp-2]
  8984 000047EC D1E3                     shl bx, 1
  8985 000047EE 8B87EB8A                 mov ax, [GData + bx]
  8986 000047F2 A3[3900]                 mov word [lexval], ax
  8987                                  
  8988                                  ;-818    return T_CONST; } }
  8989                                  
  8990 000047F5 B80101                   mov ax, 257
  8991 000047F8 E90B00                   jmp @@retn
  8992                                  @@convertdefine542:
  8993                                  
  8994                                  ;-819    i++; } 
  8995                                  
  8996                                  @@convertdefine541:
  8997 000047FB FF46FE                   inc  word[bp-2]
  8998                                  
  8999                                  ;-820    return 0; }
  9000                                  
  9001 000047FE EBB1                     jmp @@convertdefine539
  9002                                  @@convertdefine540:
  9003 00004800 B80000                   mov ax, 0
  9004 00004803 E90000                   jmp @@retn
  9005                                  
  9006                                  ;-821 int getdigit(char c) { int i;
  9007                                  
  9008 00004806 C9                      @@retn: LEAVE
  9009 00004807 C3                       ret
  9010                                  ; ENDP
  9011                                  
  9012                                  getdigit:  ; *** PROC ***
  9013                                  
  9014                                  ;-822     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  9015                                  
  9016                                  ;Function : getdigit, Number of local variables: 2
  9017                                  ;   # type sign width addr used name   list of local variables
  9018                                  ;  200 var sign byte   821 NULL c = bp+4
  9019                                  ;  201 var sign word   821 NULL i = bp-2;
  9020 00004808 C8020000                 ENTER  2,0
  9021 0000480C B80000                   mov ax, 0
  9022 0000480F A3[3900]                 mov word [lexval], ax
  9023 00004812 8A4604                   mov al, [bp+4]
  9024 00004815 2C30                     sub al, 48
  9025 00004817 A3[3900]                 mov word [lexval], ax
  9026                                  
  9027                                  ;-823     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  9028                                  
  9029 0000481A A0[2A00]                 mov al, [thechar]
  9030 0000481D 3C78                     cmp al, 120
  9031 0000481F 0F850600                 jne @@getdigit543
  9032 00004823 B85800                   mov ax, 88
  9033 00004826 A2[2A00]                 mov byte [thechar], al
  9034                                  @@getdigit543:
  9035 00004829 A0[2A00]                 mov al, [thechar]
  9036 0000482C 3C58                     cmp al, 88
  9037 0000482E 0F856800                 jne @@getdigit544
  9038 00004832 E8E000                   call next
  9039                                  
  9040                                  ;-824       while(letter(thechar)) { c=next(); if(c>96) c=c-39;
  9041                                  
  9042                                  @@getdigit545:
  9043 00004835 A0[2A00]                 mov al, byte [thechar]
  9044 00004838 B400                     mov ah, 0
  9045 0000483A 50                       push ax
  9046 0000483B E8BB12                   call letter
  9047 0000483E 83C402                   add  sp, 2
  9048 00004841 08C0                     or  al, al
  9049 00004843 0F845000                 je @@getdigit546
  9050 00004847 E8CB00                   call next
  9051 0000484A 884604                   mov [bp+4], al
  9052 0000484D 8A4604                   mov al, [bp+4]
  9053 00004850 3C60                     cmp al, 96
  9054 00004852 0F8E0800                 jle @@getdigit547
  9055 00004856 8A4604                   mov al, [bp+4]
  9056 00004859 2C27                     sub al, 39
  9057 0000485B 884604                   mov [bp+4], al
  9058                                  
  9059                                  ;-825 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  9060                                  
  9061                                  @@getdigit547:
  9062 0000485E 8A4604                   mov al, [bp+4]
  9063 00004861 3C40                     cmp al, 64
  9064 00004863 0F8E0800                 jle @@getdigit548
  9065 00004867 8A4604                   mov al, [bp+4]
  9066 0000486A 2C07                     sub al, 7
  9067 0000486C 884604                   mov [bp+4], al
  9068                                  @@getdigit548:
  9069 0000486F 8A4604                   mov al, [bp+4]
  9070 00004872 2C30                     sub al, 48
  9071 00004874 884604                   mov [bp+4], al
  9072 00004877 A1[3900]                 mov ax, [lexval]
  9073 0000487A C1E004                   shl ax, 4
  9074 0000487D A3[3900]                 mov word [lexval], ax
  9075                                  
  9076                                  ;-826      i=0; i=c; lexval=lexval+i;}
  9077                                  
  9078 00004880 B80000                   mov ax, 0
  9079 00004883 8946FE                   mov [bp-2], ax
  9080 00004886 8A4604                   mov al, [bp+4]
  9081 00004889 8946FE                   mov [bp-2], ax
  9082 0000488C A1[3900]                 mov ax, [lexval]
  9083 0000488F 0346FE                   add ax, [bp-2]
  9084 00004892 A3[3900]                 mov word [lexval], ax
  9085                                  
  9086                                  ;-827     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  9087                                  
  9088 00004895 EB9E                     jmp @@getdigit545
  9089                                  @@getdigit546:
  9090 00004897 E94200                   jmp @@getdigit549
  9091                                  @@getdigit544:
  9092                                  @@getdigit550:
  9093 0000489A A0[2A00]                 mov al, byte [thechar]
  9094 0000489D B400                     mov ah, 0
  9095 0000489F 50                       push ax
  9096 000048A0 E82C12                   call digit
  9097 000048A3 83C402                   add  sp, 2
  9098 000048A6 08C0                     or  al, al
  9099 000048A8 0F843000                 je @@getdigit551
  9100 000048AC E86600                   call next
  9101 000048AF 884604                   mov [bp+4], al
  9102 000048B2 8A4604                   mov al, [bp+4]
  9103 000048B5 2C30                     sub al, 48
  9104 000048B7 884604                   mov [bp+4], al
  9105 000048BA A1[3900]                 mov ax, [lexval]
  9106 000048BD BB0A00                   mov bx, 10
  9107 000048C0 F7E3                     mul bx
  9108 000048C2 A3[3900]                 mov word [lexval], ax
  9109                                  
  9110                                  ;-828      i=0; i=c; lexval=lexval+i; } } 
  9111                                  
  9112 000048C5 B80000                   mov ax, 0
  9113 000048C8 8946FE                   mov [bp-2], ax
  9114 000048CB 8A4604                   mov al, [bp+4]
  9115 000048CE 8946FE                   mov [bp-2], ax
  9116 000048D1 A1[3900]                 mov ax, [lexval]
  9117 000048D4 0346FE                   add ax, [bp-2]
  9118 000048D7 A3[3900]                 mov word [lexval], ax
  9119 000048DA EBBE                     jmp @@getdigit550
  9120                                  @@getdigit551:
  9121                                  
  9122                                  ;-829 }
  9123                                  
  9124                                  @@getdigit549:
  9125                                  
  9126                                  ;-830 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  9127 000048DC C9                       LEAVE
  9128 000048DD C3                       ret
  9129                                  ; ENDP
  9130                                  
  9131                                  getstring:  ; *** PROC ***
  9132                                  ;Function : getstring, Number of local variables: 3
  9133                                  ;   # type sign width addr used name   list of local variables
  9134                                  ;  200 var sign word   830 NULL delim = bp+4
  9135                                  ;  201 var sign word   830 NULL c = bp-2
  9136                                  ;  202 ptr sign byte   830 NULL p = bp-4;
  9137 000048DE C8040000                 ENTER  4,0
  9138 000048E2 B82B81                   mov ax, symbol
  9139 000048E5 8946FC                   mov [bp-4], ax
  9140 000048E8 E82A00                   call next
  9141 000048EB 8946FE                   mov [bp-2], ax
  9142                                  
  9143                                  ;-831   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  9144                                  
  9145                                  @@getstring552:
  9146 000048EE 8B46FE                   mov ax, [bp-2]
  9147 000048F1 3B4604                   cmp ax, [bp+4]
  9148 000048F4 0F841300                 je  @@getstring553
  9149 000048F8 8B46FE                   mov ax, [bp-2]
  9150 000048FB 8B5EFC                   mov  bx, [bp-4]
  9151 000048FE 8807                     mov  [bx], al
  9152 00004900 FF46FC                   inc  word[bp-4]
  9153 00004903 E80F00                   call next
  9154 00004906 8946FE                   mov [bp-2], ax
  9155 00004909 EBE3                     jmp @@getstring552
  9156                                  @@getstring553:
  9157 0000490B B80000                   mov ax, 0
  9158 0000490E 8B5EFC                   mov  bx, [bp-4]
  9159 00004911 8807                     mov  [bx], al
  9160                                  
  9161                                  ;-832 
  9162                                  
  9163                                  
  9164                                  ;-833 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  9165 00004913 C9                       LEAVE
  9166 00004914 C3                       ret
  9167                                  ; ENDP
  9168                                  
  9169                                  next:  ; *** PROC ***
  9170                                  ;Function : next, Number of local variables: 1
  9171                                  ;   # type sign width addr used name   list of local variables
  9172                                  ;  200 var sign byte   833 NULL r = bp-2;
  9173 00004915 C8020000                 ENTER  2,0
  9174 00004919 A0[2A00]                 mov al, [thechar]
  9175 0000491C 8846FE                   mov [bp-2], al
  9176 0000491F 8A46FE                   mov al, [bp-2]
  9177 00004922 A2[2700]                 mov byte [globC], al
  9178 00004925 E83C03                   call fgets1
  9179 00004928 A2[2A00]                 mov byte [thechar], al
  9180 0000492B 8A46FE                   mov al, [bp-2]
  9181 0000492E E90000                   jmp @@retn
  9182                                  
  9183                                  ;-834 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  9184                                  
  9185 00004931 C9                      @@retn: LEAVE
  9186 00004932 C3                       ret
  9187                                  ; ENDP
  9188                                  
  9189                                  istoken:  ; *** PROC ***
  9190                                  ;Function : istoken, Number of local variables: 1
  9191                                  ;   # type sign width addr used name   list of local variables
  9192                                  ;  200 var sign word   834 NULL t = bp+4;
  9193 00004933 C8000000                 ENTER  0,0
  9194 00004937 A1[2500]                 mov ax, [token]
  9195 0000493A 3B4604                   cmp ax, [bp+4]
  9196 0000493D 0F850C00                 jne @@istoken554
  9197 00004941 E828F8                   call getlex
  9198 00004944 A3[2500]                 mov word [token], ax
  9199 00004947 B80100                   mov ax, 1
  9200 0000494A E90600                   jmp @@retn
  9201                                  @@istoken554:
  9202 0000494D B80000                   mov ax, 0
  9203 00004950 E90000                   jmp @@retn
  9204                                  
  9205                                  ;-835 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  9206                                  
  9207 00004953 C9                      @@retn: LEAVE
  9208 00004954 C3                       ret
  9209                                  ; ENDP
  9210                                  
  9211                                  expect:  ; *** PROC ***
  9212                                  ;Function : expect, Number of local variables: 1
  9213                                  ;   # type sign width addr used name   list of local variables
  9214                                  ;  200 var sign word   835 NULL t = bp+4;
  9215 00004955 C8000000                 ENTER  0,0
  9216 00004959 FF7604                   push word [bp+4]
  9217 0000495C E8D4FF                   call istoken
  9218 0000495F 83C402                   add  sp, 2
  9219 00004962 83F800                   cmp ax, 0
  9220 00004965 0F853200                 jne @@expect555
  9221 00004969 B80000                   mov ax, 0
  9222 0000496C 8B1E[1F00]               mov  bx, [cloc]
  9223 00004970 8807                     mov  [bx], al
  9224 00004972 8D063075                 lea  ax, [co]
  9225 00004976 50                       push ax
  9226 00004977 E8F700                   call prs
  9227 0000497A 83C402                   add  sp, 2
  9228 0000497D E8E204                   call listproc
  9229                                  
  9230                                  ;-836   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  9231                                  
  9232 00004980 68[9D49]                 push expect_0
  9233 00004983 E8EB00                   call prs
  9234 00004986 83C402                   add  sp, 2
  9235 00004989 FF7604                   push word [bp+4]
  9236 0000498C E8D901                   call pint1
  9237 0000498F 83C402                   add  sp, 2
  9238 00004992 68[B549]                 push expect_1
  9239 00004995 E8C203                   call error1
  9240 00004998 83C402                   add  sp, 2
  9241                                  @@expect555:
  9242                                  
  9243                                  ;-837 
  9244                                  
  9245                                  
  9246                                  ;-838 int eprc(char c)  {*cloc=c; cloc++; }
  9247 0000499B C9                       LEAVE
  9248 0000499C C3                       ret
  9249                                  ; ENDP
  9250 0000499D 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  9251 000049A6 642041534349492864-
  9252 000049AF 657A293A2000       
  9253 000049B5 206E6F7420666F756E-     expect_1 db " not found",0
  9254 000049BE 6400               
  9255                                  
  9256                                  eprc:  ; *** PROC ***
  9257                                  ;Function : eprc, Number of local variables: 1
  9258                                  ;   # type sign width addr used name   list of local variables
  9259                                  ;  200 var sign byte   838 NULL c = bp+4;
  9260 000049C0 C8000000                 ENTER  0,0
  9261 000049C4 8A4604                   mov al, [bp+4]
  9262 000049C7 8B1E[1F00]               mov  bx, [cloc]
  9263 000049CB 8807                     mov  [bx], al
  9264 000049CD FF06[1F00]               inc  word[cloc]
  9265                                  
  9266                                  ;-839 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  9267 000049D1 C9                       LEAVE
  9268 000049D2 C3                       ret
  9269                                  ; ENDP
  9270                                  
  9271                                  eprs:  ; *** PROC ***
  9272                                  ;Function : eprs, Number of local variables: 2
  9273                                  ;   # type sign width addr used name   list of local variables
  9274                                  ;  200 ptr sign byte   839 NULL s = bp+4
  9275                                  ;  201 var sign byte   839 NULL c = bp-2;
  9276 000049D3 C8020000                 ENTER  2,0
  9277                                  @@eprs556:
  9278 000049D7 8B5E04                   mov bx, [bp+4]
  9279 000049DA 8A07                     mov al, [bx]
  9280 000049DC B400                     mov ah, 0
  9281 000049DE 08C0                     or  al, al
  9282 000049E0 0F841B00                 je @@eprs557
  9283 000049E4 8B5E04                   mov bx, [bp+4]
  9284 000049E7 8A07                     mov al, [bx]
  9285 000049E9 B400                     mov ah, 0
  9286 000049EB 8846FE                   mov [bp-2], al
  9287 000049EE 8A46FE                   mov al, byte [bp-2]
  9288 000049F1 B400                     mov ah, 0
  9289 000049F3 50                       push ax
  9290 000049F4 E8C9FF                   call eprc
  9291 000049F7 83C402                   add  sp, 2
  9292 000049FA FF4604                   inc  word[bp+4]
  9293 000049FD EBD8                     jmp @@eprs556
  9294                                  @@eprs557:
  9295                                  
  9296                                  ;-840 int prc(unsigned char c) { if (LIST) { if (c==10) {_AX=13; writetty(); }
  9297 000049FF C9                       LEAVE
  9298 00004A00 C3                       ret
  9299                                  ; ENDP
  9300                                  
  9301                                  prc:  ; *** PROC ***
  9302                                  ;Function : prc, Number of local variables: 1
  9303                                  ;   # type sign width addr used name   list of local variables
  9304                                  ;  200 var unsg byte   840 NULL c = bp+4;
  9305 00004A01 C8000000                 ENTER  0,0
  9306 00004A05 A0[1600]                 mov al, [LIST]
  9307 00004A08 08C0                     or  al, al
  9308 00004A0A 0F841500                 je @@prc558
  9309 00004A0E 8A4604                   mov al, [bp+4]
  9310 00004A11 3C0A                     cmp al, 10
  9311 00004A13 0F850600                 jne @@prc559
  9312 00004A17 B80D00                   mov  ax, 13
  9313 00004A1A E8F60E                   call writetty
  9314                                  
  9315                                  ;-841   _AL=c; writetty(); } fputcR(c, fdout); }
  9316                                  
  9317                                  @@prc559:
  9318 00004A1D 8A4604                   mov  al, [bp+4]
  9319 00004A20 E8F00E                   call writetty
  9320                                  @@prc558:
  9321 00004A23 FF36[2300]               push word [fdout]
  9322 00004A27 8A4604                   mov al, byte [bp+4]
  9323 00004A2A B400                     mov ah, 0
  9324 00004A2C 50                       push ax
  9325 00004A2D E8F711                   call fputcR
  9326 00004A30 83C404                   add  sp, 4
  9327                                  
  9328                                  ;-842 int prscomment(unsigned char *s) {unsigned char c;
  9329 00004A33 C9                       LEAVE
  9330 00004A34 C3                       ret
  9331                                  ; ENDP
  9332                                  
  9333                                  prscomment:  ; *** PROC ***
  9334                                  
  9335                                  ;-843   while(*s){c=*s;prc(c);s++;} }
  9336                                  
  9337                                  ;Function : prscomment, Number of local variables: 2
  9338                                  ;   # type sign width addr used name   list of local variables
  9339                                  ;  200 ptr unsg byte   842 NULL s = bp+4
  9340                                  ;  201 var unsg byte   842 NULL c = bp-2;
  9341 00004A35 C8020000                 ENTER  2,0
  9342                                  @@prscomment560:
  9343 00004A39 8B5E04                   mov bx, [bp+4]
  9344 00004A3C 8A07                     mov al, [bx]
  9345 00004A3E B400                     mov ah, 0
  9346 00004A40 08C0                     or  al, al
  9347 00004A42 0F841B00                 je @@prscomment561
  9348 00004A46 8B5E04                   mov bx, [bp+4]
  9349 00004A49 8A07                     mov al, [bx]
  9350 00004A4B B400                     mov ah, 0
  9351 00004A4D 8846FE                   mov [bp-2], al
  9352 00004A50 8A46FE                   mov al, byte [bp-2]
  9353 00004A53 B400                     mov ah, 0
  9354 00004A55 50                       push ax
  9355 00004A56 E8A8FF                   call prc
  9356 00004A59 83C402                   add  sp, 2
  9357 00004A5C FF4604                   inc  word[bp+4]
  9358 00004A5F EBD8                     jmp @@prscomment560
  9359                                  @@prscomment561:
  9360                                  
  9361                                  ;-844 int prnl() { prs("\n ");}
  9362 00004A61 C9                       LEAVE
  9363 00004A62 C3                       ret
  9364                                  ; ENDP
  9365                                  
  9366                                  prnl:  ; *** PROC ***
  9367 00004A63 68[6D4A]                 push prnl_0
  9368 00004A66 E80800                   call prs
  9369 00004A69 83C402                   add  sp, 2
  9370                                  
  9371                                  ;-845 
  9372                                  
  9373                                  
  9374                                  ;-846 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9375                                  
  9376 00004A6C C3                       ret
  9377                                  ; ENDP
  9378 00004A6D 5C6E2000                prnl_0 db "\n ",0
  9379                                  
  9380                                  prs:  ; *** PROC ***
  9381                                  ;Function : prs, Number of local variables: 3
  9382                                  ;   # type sign width addr used name   list of local variables
  9383                                  ;  200 ptr unsg byte   846 NULL s = bp+4
  9384                                  ;  201 var unsg byte   846 NULL c = bp-2
  9385                                  ;  202 var sign word   846 NULL com = bp-4;
  9386 00004A71 C8040000                 ENTER  4,0
  9387 00004A75 B80000                   mov ax, 0
  9388 00004A78 8946FC                   mov [bp-4], ax
  9389                                  
  9390                                  ;-847   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9391                                  
  9392                                  @@prs562:
  9393 00004A7B 8B5E04                   mov bx, [bp+4]
  9394 00004A7E 8A07                     mov al, [bx]
  9395 00004A80 B400                     mov ah, 0
  9396 00004A82 08C0                     or  al, al
  9397 00004A84 0F847B00                 je @@prs563
  9398 00004A88 8B5E04                   mov bx, [bp+4]
  9399 00004A8B 8A07                     mov al, [bx]
  9400 00004A8D B400                     mov ah, 0
  9401 00004A8F 8846FE                   mov [bp-2], al
  9402 00004A92 8A46FE                   mov al, [bp-2]
  9403 00004A95 3C22                     cmp al, 34
  9404 00004A97 0F851800                 jne @@prs564
  9405 00004A9B 8B46FC                   mov ax, [bp-4]
  9406 00004A9E 08C0                     or  al, al
  9407 00004AA0 0F840900                 je @@prs565
  9408 00004AA4 B80000                   mov ax, 0
  9409 00004AA7 8946FC                   mov [bp-4], ax
  9410 00004AAA E90600                   jmp @@prs566
  9411                                  @@prs565:
  9412 00004AAD B80100                   mov ax, 1
  9413 00004AB0 8946FC                   mov [bp-4], ax
  9414                                  
  9415                                  ;-848     if (c==92) { if (com==0) { s++; c=*s;
  9416                                  
  9417                                  @@prs566:
  9418                                  @@prs564:
  9419 00004AB3 8A46FE                   mov al, [bp-2]
  9420 00004AB6 3C5C                     cmp al, 92
  9421 00004AB8 0F853500                 jne @@prs567
  9422 00004ABC 8B46FC                   mov ax, [bp-4]
  9423 00004ABF 83F800                   cmp ax, 0
  9424 00004AC2 0F852B00                 jne @@prs568
  9425 00004AC6 FF4604                   inc  word[bp+4]
  9426 00004AC9 8B5E04                   mov bx, [bp+4]
  9427 00004ACC 8A07                     mov al, [bx]
  9428 00004ACE B400                     mov ah, 0
  9429 00004AD0 8846FE                   mov [bp-2], al
  9430                                  
  9431                                  ;-849           if (c=='n') c=10; if (c=='t') c= 9;
  9432                                  
  9433 00004AD3 8A46FE                   mov al, [bp-2]
  9434 00004AD6 3C6E                     cmp al, 110
  9435 00004AD8 0F850600                 jne @@prs569
  9436 00004ADC B80A00                   mov ax, 10
  9437 00004ADF 8846FE                   mov [bp-2], al
  9438                                  @@prs569:
  9439 00004AE2 8A46FE                   mov al, [bp-2]
  9440 00004AE5 3C74                     cmp al, 116
  9441 00004AE7 0F850600                 jne @@prs570
  9442 00004AEB B80900                   mov ax, 9
  9443 00004AEE 8846FE                   mov [bp-2], al
  9444                                  
  9445                                  ;-850     } } prc(c); s++;  } }
  9446                                  
  9447                                  @@prs570:
  9448                                  @@prs568:
  9449                                  @@prs567:
  9450 00004AF1 8A46FE                   mov al, byte [bp-2]
  9451 00004AF4 B400                     mov ah, 0
  9452 00004AF6 50                       push ax
  9453 00004AF7 E807FF                   call prc
  9454 00004AFA 83C402                   add  sp, 2
  9455 00004AFD FF4604                   inc  word[bp+4]
  9456 00004B00 E978FF                   jmp @@prs562
  9457                                  @@prs563:
  9458                                  
  9459                                  ;-851 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9460 00004B03 C9                       LEAVE
  9461 00004B04 C3                       ret
  9462                                  ; ENDP
  9463                                  
  9464                                  eprnum:  ; *** PROC ***
  9465                                  ;Function : eprnum, Number of local variables: 2
  9466                                  ;   # type sign width addr used name   list of local variables
  9467                                  ;  200 var sign word   851 NULL n = bp+4
  9468                                  ;  201 var sign word   851 NULL e = bp-2;
  9469 00004B05 C8020000                 ENTER  2,0
  9470 00004B09 8B4604                   mov ax, [bp+4]
  9471 00004B0C 83F800                   cmp ax, 0
  9472 00004B0F 0F8D1400                 jge @@eprnum571
  9473 00004B13 6A2D                     push 45
  9474 00004B15 E8A8FE                   call eprc
  9475 00004B18 83C402                   add  sp, 2
  9476 00004B1B FF7604                   push word [bp+4]
  9477 00004B1E E8410E                   call mkneg
  9478 00004B21 83C402                   add  sp, 2
  9479 00004B24 894604                   mov [bp+4], ax
  9480                                  
  9481                                  ;-852   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9482                                  
  9483                                  @@eprnum571:
  9484 00004B27 8B4604                   mov ax, [bp+4]
  9485 00004B2A 83F80A                   cmp ax, 10 ;unsigned : 1
  9486 00004B2D 0F8C1500                 jl  @@eprnum572
  9487 00004B31 8B4604                   mov ax, [bp+4]
  9488 00004B34 BB0A00                   mov bx, 10
  9489 00004B37 99                       cwd
  9490 00004B38 F7FB                     idiv bx
  9491 00004B3A 8946FE                   mov [bp-2], ax
  9492 00004B3D FF76FE                   push word [bp-2]
  9493 00004B40 E8C2FF                   call eprnum
  9494 00004B43 83C402                   add  sp, 2
  9495                                  @@eprnum572:
  9496 00004B46 8B4604                   mov ax, [bp+4]
  9497 00004B49 BB0A00                   mov bx, 10
  9498 00004B4C 99                       cwd
  9499 00004B4D F7FB                     idiv bx
  9500 00004B4F 89D0                     mov ax, dx
  9501 00004B51 894604                   mov [bp+4], ax
  9502 00004B54 8B4604                   mov ax, [bp+4]
  9503 00004B57 83C030                   add ax, 48
  9504 00004B5A 894604                   mov [bp+4], ax
  9505 00004B5D FF7604                   push word [bp+4]
  9506 00004B60 E85DFE                   call eprc
  9507 00004B63 83C402                   add  sp, 2
  9508                                  
  9509                                  ;-853 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9510 00004B66 C9                       LEAVE
  9511 00004B67 C3                       ret
  9512                                  ; ENDP
  9513                                  
  9514                                  pint1:  ; *** PROC ***
  9515                                  ;Function : pint1, Number of local variables: 2
  9516                                  ;   # type sign width addr used name   list of local variables
  9517                                  ;  200 var sign word   853 NULL n = bp+4
  9518                                  ;  201 var sign word   853 NULL e = bp-2;
  9519 00004B68 C8020000                 ENTER  2,0
  9520 00004B6C 8B4604                   mov ax, [bp+4]
  9521 00004B6F 83F800                   cmp ax, 0
  9522 00004B72 0F8D1400                 jge @@pint1573
  9523 00004B76 6A2D                     push 45
  9524 00004B78 E886FE                   call prc
  9525 00004B7B 83C402                   add  sp, 2
  9526 00004B7E FF7604                   push word [bp+4]
  9527 00004B81 E8DE0D                   call mkneg
  9528 00004B84 83C402                   add  sp, 2
  9529 00004B87 894604                   mov [bp+4], ax
  9530                                  
  9531                                  ;-854   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9532                                  
  9533                                  @@pint1573:
  9534 00004B8A 8B4604                   mov ax, [bp+4]
  9535 00004B8D 83F80A                   cmp ax, 10 ;unsigned : 1
  9536 00004B90 0F8C1500                 jl  @@pint1574
  9537 00004B94 8B4604                   mov ax, [bp+4]
  9538 00004B97 BB0A00                   mov bx, 10
  9539 00004B9A 99                       cwd
  9540 00004B9B F7FB                     idiv bx
  9541 00004B9D 8946FE                   mov [bp-2], ax
  9542 00004BA0 FF76FE                   push word [bp-2]
  9543 00004BA3 E8C2FF                   call pint1
  9544 00004BA6 83C402                   add  sp, 2
  9545                                  @@pint1574:
  9546 00004BA9 8B4604                   mov ax, [bp+4]
  9547 00004BAC BB0A00                   mov bx, 10
  9548 00004BAF 99                       cwd
  9549 00004BB0 F7FB                     idiv bx
  9550 00004BB2 89D0                     mov ax, dx
  9551 00004BB4 894604                   mov [bp+4], ax
  9552 00004BB7 8B4604                   mov ax, [bp+4]
  9553 00004BBA 83C030                   add ax, 48
  9554 00004BBD 894604                   mov [bp+4], ax
  9555 00004BC0 FF7604                   push word [bp+4]
  9556 00004BC3 E83BFE                   call prc
  9557 00004BC6 83C402                   add  sp, 2
  9558                                  
  9559                                  ;-855 int prunsign1(unsigned int n) { unsigned int e;
  9560 00004BC9 C9                       LEAVE
  9561 00004BCA C3                       ret
  9562                                  ; ENDP
  9563                                  
  9564                                  prunsign1:  ; *** PROC ***
  9565                                  
  9566                                  ;-856   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9567                                  
  9568                                  ;Function : prunsign1, Number of local variables: 2
  9569                                  ;   # type sign width addr used name   list of local variables
  9570                                  ;  200 var unsg word   855 NULL n = bp+4
  9571                                  ;  201 var unsg word   855 NULL e = bp-2;
  9572 00004BCB C8020000                 ENTER  2,0 ; constant expression
  9573 00004BCF 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9574 00004BD3 0F821700                 jb  @@prunsign1575
  9575 00004BD7 8B4604                   mov ax, [bp+4]
  9576 00004BDA BB0A00                   mov bx, 10
  9577 00004BDD BA0000                   mov dx, 0
  9578 00004BE0 F7F3                     div bx
  9579 00004BE2 8946FE                   mov [bp-2], ax
  9580 00004BE5 FF76FE                   push word [bp-2]
  9581 00004BE8 E8E0FF                   call prunsign1
  9582 00004BEB 83C402                   add  sp, 2
  9583                                  
  9584                                  ;-857     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9585                                  
  9586                                  @@prunsign1575:
  9587 00004BEE 8B4604                   mov ax, [bp+4]
  9588 00004BF1 BB0A00                   mov bx, 10
  9589 00004BF4 BA0000                   mov dx, 0
  9590 00004BF7 F7F3                     div bx
  9591 00004BF9 89D0                     mov ax, dx
  9592 00004BFB 894604                   mov [bp+4], ax
  9593 00004BFE 83460430                 add  word[bp+4], 48
  9594 00004C02 FF7604                   push word [bp+4]
  9595 00004C05 E8F9FD                   call prc
  9596 00004C08 83C402                   add  sp, 2
  9597                                  
  9598                                  ;-858 int printint51(unsigned int j)  {
  9599 00004C0B C9                       LEAVE
  9600 00004C0C C3                       ret
  9601                                  ; ENDP
  9602                                  
  9603                                  printint51:  ; *** PROC ***
  9604                                  
  9605                                  ;-859   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9606                                  
  9607                                  ;Function : printint51, Number of local variables: 1
  9608                                  ;   # type sign width addr used name   list of local variables
  9609                                  ;  200 var unsg word   858 NULL j = bp+4;
  9610 00004C0D C8000000                 ENTER  0,0
  9611 00004C11 8B4604                   mov ax, [bp+4]
  9612 00004C14 3D1027                   cmp ax, 10000
  9613 00004C17 0F8D0800                 jge @@printint51576
  9614 00004C1B 6A20                     push 32
  9615 00004C1D E8E1FD                   call prc
  9616 00004C20 83C402                   add  sp, 2
  9617                                  @@printint51576:
  9618 00004C23 8B4604                   mov ax, [bp+4]
  9619 00004C26 3DE803                   cmp ax, 1000
  9620 00004C29 0F8D0800                 jge @@printint51577
  9621 00004C2D 6A20                     push 32
  9622 00004C2F E8CFFD                   call prc
  9623 00004C32 83C402                   add  sp, 2
  9624                                  @@printint51577:
  9625 00004C35 8B4604                   mov ax, [bp+4]
  9626 00004C38 83F864                   cmp ax, 100
  9627 00004C3B 0F8D0800                 jge @@printint51578
  9628 00004C3F 6A20                     push 32
  9629 00004C41 E8BDFD                   call prc
  9630 00004C44 83C402                   add  sp, 2
  9631                                  
  9632                                  ;-860    if (j<10) prc(32);  prunsign1(j); }
  9633                                  
  9634                                  @@printint51578:
  9635 00004C47 8B4604                   mov ax, [bp+4]
  9636 00004C4A 83F80A                   cmp ax, 10
  9637 00004C4D 0F8D0800                 jge @@printint51579
  9638 00004C51 6A20                     push 32
  9639 00004C53 E8ABFD                   call prc
  9640 00004C56 83C402                   add  sp, 2
  9641                                  @@printint51579:
  9642 00004C59 FF7604                   push word [bp+4]
  9643 00004C5C E86CFF                   call prunsign1
  9644 00004C5F 83C402                   add  sp, 2
  9645                                  
  9646                                  ;-861 
  9647                                  
  9648                                  
  9649                                  ;-862 int fgets1() { char c; c=*fgetsp;
  9650 00004C62 C9                       LEAVE
  9651 00004C63 C3                       ret
  9652                                  ; ENDP
  9653                                  
  9654                                  fgets1:  ; *** PROC ***
  9655                                  ;Function : fgets1, Number of local variables: 1
  9656                                  ;   # type sign width addr used name   list of local variables
  9657                                  ;  200 var sign byte   862 NULL c = bp-2;
  9658 00004C64 C8020000                 ENTER  2,0
  9659 00004C68 8B1E[6D00]               mov bx, [fgetsp]
  9660 00004C6C 8A07                     mov al, [bx]
  9661 00004C6E B400                     mov ah, 0
  9662 00004C70 8846FE                   mov [bp-2], al
  9663                                  
  9664                                  ;-863   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9665                                  
  9666 00004C73 8A46FE                   mov al, [bp-2]
  9667 00004C76 3C00                     cmp al, 0
  9668 00004C78 0F852A00                 jne @@fgets1580
  9669 00004C7C E83700                   call printinputline
  9670 00004C7F A1[7B00]                 mov ax, [DOS_NoBytes]
  9671 00004C82 83F800                   cmp ax, 0
  9672 00004C85 0F850600                 jne @@fgets1581
  9673 00004C89 B80000                   mov ax, 0
  9674 00004C8C E92500                   jmp @@retn
  9675                                  
  9676                                  ;-864     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9677                                  
  9678                                  @@fgets1581:
  9679 00004C8F B80FD0                   mov ax, fgetsdest
  9680 00004C92 A3[6D00]                 mov word [fgetsp], ax
  9681 00004C95 8B1E[6D00]               mov bx, [fgetsp]
  9682 00004C99 8A07                     mov al, [bx]
  9683 00004C9B B400                     mov ah, 0
  9684 00004C9D 8846FE                   mov [bp-2], al
  9685 00004CA0 B80000                   mov ax, 0
  9686 00004CA3 A3[2800]                 mov word [spalte], ax
  9687                                  
  9688                                  ;-865   fgetsp++; spalte++;  return c; }
  9689                                  
  9690                                  @@fgets1580:
  9691 00004CA6 FF06[6D00]               inc  word[fgetsp]
  9692 00004CAA FF06[2800]               inc  word[spalte]
  9693 00004CAE 8A46FE                   mov al, [bp-2]
  9694 00004CB1 E90000                   jmp @@retn
  9695                                  
  9696                                  ;-866 int printinputline() { fgetsp=&fgetsdest;
  9697                                  
  9698 00004CB4 C9                      @@retn: LEAVE
  9699 00004CB5 C3                       ret
  9700                                  ; ENDP
  9701                                  
  9702                                  printinputline:  ; *** PROC ***
  9703 00004CB6 B80FD0                   mov ax, fgetsdest
  9704 00004CB9 A3[6D00]                 mov word [fgetsp], ax
  9705                                  
  9706                                  ;-867   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);
  9707                                  
  9708                                  @@printinputline582:
  9709 00004CBC FF36[2100]               push word [fdin]
  9710 00004CC0 8D06[7D00]               lea  ax, [DOS_ByteRead]
  9711 00004CC4 50                       push ax
  9712 00004CC5 E8350F                   call readR
  9713 00004CC8 83C404                   add  sp, 4
  9714 00004CCB A3[7B00]                 mov word [DOS_NoBytes], ax
  9715                                  
  9716                                  ;-868   if (DOS_NoBytes == 0) return; 
  9717                                  
  9718 00004CCE A1[7B00]                 mov ax, [DOS_NoBytes]
  9719 00004CD1 83F800                   cmp ax, 0
  9720 00004CD4 0F850300                 jne @@printinputline583
  9721 00004CD8 E95400                   jmp @@retn
  9722                                  
  9723                                  ;-869     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9724                                  
  9725                                  @@printinputline583:
  9726 00004CDB A0[7D00]                 mov al, [DOS_ByteRead]
  9727 00004CDE 8B1E[6D00]               mov  bx, [fgetsp]
  9728 00004CE2 8807                     mov  [bx], al
  9729 00004CE4 FF06[6D00]               inc  word[fgetsp]
  9730                                  
  9731                                  ;-870   while (DOS_ByteRead != 10); *fgetsp=0;
  9732                                  
  9733 00004CE8 A0[7D00]                 mov al, [DOS_ByteRead]
  9734 00004CEB 3C0A                     cmp al, 10
  9735 00004CED 0F840200                 je  @@printinputline584
  9736 00004CF1 EBC9                     jmp @@printinputline582
  9737                                  @@printinputline584:
  9738 00004CF3 B80000                   mov ax, 0
  9739 00004CF6 8B1E[6D00]               mov  bx, [fgetsp]
  9740 00004CFA 8807                     mov  [bx], al
  9741                                  
  9742                                  ;-871     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9743                                  
  9744 00004CFC A1[2300]                 mov ax, [fdout]
  9745 00004CFF 08C0                     or  al, al
  9746 00004D01 0F842A00                 je @@printinputline585
  9747 00004D05 68[304D]                 push printinputline_0
  9748 00004D08 E866FD                   call prs
  9749 00004D0B 83C402                   add  sp, 2
  9750 00004D0E FF36[7100]               push word [lineno]
  9751 00004D12 E8B6FE                   call prunsign1
  9752 00004D15 83C402                   add  sp, 2
  9753 00004D18 6A20                     push 32
  9754 00004D1A E8E4FC                   call prc
  9755 00004D1D 83C402                   add  sp, 2
  9756 00004D20 FF06[7100]               inc  word[lineno]
  9757                                  
  9758                                  ;-872       prscomment(&fgetsdest);}
  9759                                  
  9760 00004D24 8D060FD0                 lea  ax, [fgetsdest]
  9761 00004D28 50                       push ax
  9762 00004D29 E809FD                   call prscomment
  9763 00004D2C 83C402                   add  sp, 2
  9764                                  
  9765                                  ;-873 }
  9766                                  
  9767                                  @@printinputline585:
  9768                                  
  9769                                  ;-874 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9770                                  
  9771                                  @@retn:
  9772 00004D2F C3                       ret
  9773                                  ; ENDP
  9774 00004D30 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9775                                  
  9776                                  end1:  ; *** PROC ***
  9777                                  ;Function : end1, Number of local variables: 1
  9778                                  ;   # type sign width addr used name   list of local variables
  9779                                  ;  200 var sign word   874 NULL n = bp+4;
  9780 00004D37 C8000000                 ENTER  0,0
  9781 00004D3B FF36[2100]               push word [fdin]
  9782 00004D3F E8FA0E                   call fcloseR
  9783 00004D42 83C402                   add  sp, 2
  9784 00004D45 FF36[2300]               push word [fdout]
  9785 00004D49 E8F00E                   call fcloseR
  9786 00004D4C 83C402                   add  sp, 2
  9787 00004D4F FF7604                   push word [bp+4]
  9788 00004D52 E8F50E                   call exitR
  9789 00004D55 83C402                   add  sp, 2
  9790                                  
  9791                                  ;-875 int error1(char *s) { LIST=1; //  *cloc=0; prs(co); listproc();
  9792 00004D58 C9                       LEAVE
  9793 00004D59 C3                       ret
  9794                                  ; ENDP
  9795                                  
  9796                                  error1:  ; *** PROC ***
  9797                                  ;Function : error1, Number of local variables: 1
  9798                                  ;   # type sign width addr used name   list of local variables
  9799                                  ;  200 ptr sign byte   875 NULL s = bp+4;
  9800 00004D5A C8000000                 ENTER  0,0
  9801 00004D5E B80100                   mov ax, 1
  9802 00004D61 A2[1600]                 mov byte [LIST], al
  9803                                  
  9804                                  ;-876   lineno--;
  9805                                  
  9806 00004D64 FF0E[7100]               dec  word[lineno]
  9807                                  
  9808                                  ;-877   prnl(); prscomment(&fgetsdest);
  9809                                  
  9810 00004D68 E8F8FC                   call prnl
  9811 00004D6B 8D060FD0                 lea  ax, [fgetsdest]
  9812 00004D6F 50                       push ax
  9813 00004D70 E8C2FC                   call prscomment
  9814 00004D73 83C402                   add  sp, 2
  9815                                  
  9816                                  ;-878   prs(";Line: "); prunsign1(lineno);
  9817                                  
  9818 00004D76 68[094E]                 push error1_0
  9819 00004D79 E8F5FC                   call prs
  9820 00004D7C 83C402                   add  sp, 2
  9821 00004D7F FF36[7100]               push word [lineno]
  9822 00004D83 E845FE                   call prunsign1
  9823 00004D86 83C402                   add  sp, 2
  9824                                  
  9825                                  ;-879   prs(" ************** ERROR: "); prs(s);
  9826                                  
  9827 00004D89 68[114E]                 push error1_1
  9828 00004D8C E8E2FC                   call prs
  9829 00004D8F 83C402                   add  sp, 2
  9830 00004D92 FF7604                   push word [bp+4]
  9831 00004D95 E8D9FC                   call prs
  9832 00004D98 83C402                   add  sp, 2
  9833                                  
  9834                                  ;-880   prs("  in column: "); pint1(spalte);
  9835                                  
  9836 00004D9B 68[294E]                 push error1_2
  9837 00004D9E E8D0FC                   call prs
  9838 00004DA1 83C402                   add  sp, 2
  9839 00004DA4 FF36[2800]               push word [spalte]
  9840 00004DA8 E8BDFD                   call pint1
  9841 00004DAB 83C402                   add  sp, 2
  9842                                  
  9843                                  ;-881   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9844                                  
  9845 00004DAE 68[374E]                 push error1_3
  9846 00004DB1 E8BDFC                   call prs
  9847 00004DB4 83C402                   add  sp, 2
  9848 00004DB7 FF36[2500]               push word [token]
  9849 00004DBB E80DFE                   call prunsign1
  9850 00004DBE 83C402                   add  sp, 2
  9851 00004DC1 68[414E]                 push error1_4
  9852 00004DC4 E8AAFC                   call prs
  9853 00004DC7 83C402                   add  sp, 2
  9854 00004DCA A0[2700]                 mov al, byte [globC]
  9855 00004DCD B400                     mov ah, 0
  9856 00004DCF 50                       push ax
  9857 00004DD0 E82EFC                   call prc
  9858 00004DD3 83C402                   add  sp, 2
  9859                                  
  9860                                  ;-882   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9861                                  
  9862 00004DD6 68[4B4E]                 push error1_5
  9863 00004DD9 E895FC                   call prs
  9864 00004DDC 83C402                   add  sp, 2
  9865 00004DDF A0[2A00]                 mov al, byte [thechar]
  9866 00004DE2 B400                     mov ah, 0
  9867 00004DE4 50                       push ax
  9868 00004DE5 E880FD                   call pint1
  9869 00004DE8 83C402                   add  sp, 2
  9870 00004DEB 68[574E]                 push error1_6
  9871 00004DEE E880FC                   call prs
  9872 00004DF1 83C402                   add  sp, 2
  9873 00004DF4 8D062B81                 lea  ax, [symbol]
  9874 00004DF8 50                       push ax
  9875 00004DF9 E875FC                   call prs
  9876 00004DFC 83C402                   add  sp, 2
  9877                                  
  9878                                  ;-883   end1(1); }
  9879                                  
  9880 00004DFF 6A01                     push 1
  9881 00004E01 E833FF                   call end1
  9882 00004E04 83C402                   add  sp, 2
  9883                                  
  9884                                  ;-884 int listproc() {int i; 
  9885 00004E07 C9                       LEAVE
  9886 00004E08 C3                       ret
  9887                                  ; ENDP
  9888 00004E09 3B4C696E653A2000        error1_0 db ";Line: ",0
  9889 00004E11 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9890 00004E1A 2A2A2A2A2A2A204552-
  9891 00004E23 524F523A2000       
  9892 00004E29 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9893 00004E32 6D6E3A2000         
  9894 00004E37 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9895 00004E40 00                 
  9896 00004E41 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9897 00004E4A 00                 
  9898 00004E4B 2C2074686563686172-     error1_5 db ", thechar: ",0
  9899 00004E54 3A2000             
  9900 00004E57 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9901 00004E60 2000               
  9902                                  
  9903                                  listproc:  ; *** PROC ***
  9904                                  
  9905                                  ;-885   if (LTop > LSTART) {
  9906                                  
  9907                                  ;Function : listproc, Number of local variables: 1
  9908                                  ;   # type sign width addr used name   list of local variables
  9909                                  ;  200 var sign word   884 NULL i = bp-2;
  9910 00004E62 C8020000                 ENTER  2,0
  9911 00004E66 A1[3700]                 mov ax, [LTop]
  9912 00004E69 3DC800                   cmp ax, 200
  9913 00004E6C 0F8E5700                 jle @@listproc586
  9914                                  
  9915                                  ;-886   prs("\n;Function : "); prs(fname);
  9916                                  
  9917 00004E70 68[C94E]                 push listproc_0
  9918 00004E73 E8FBFB                   call prs
  9919 00004E76 83C402                   add  sp, 2
  9920 00004E79 8D06AB81                 lea  ax, [fname]
  9921 00004E7D 50                       push ax
  9922 00004E7E E8F0FB                   call prs
  9923 00004E81 83C402                   add  sp, 2
  9924                                  
  9925                                  ;-887   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9926                                  
  9927 00004E84 68[D84E]                 push listproc_1
  9928 00004E87 E8E7FB                   call prs
  9929 00004E8A 83C402                   add  sp, 2
  9930 00004E8D A1[3700]                 mov ax, [LTop]
  9931 00004E90 2DC800                   sub ax, 200
  9932 00004E93 8946FE                   mov [bp-2], ax
  9933 00004E96 FF76FE                   push word [bp-2]
  9934 00004E99 E82FFD                   call prunsign1
  9935 00004E9C 83C402                   add  sp, 2
  9936                                  
  9937                                  ;-888   prs("\n;   # type sign width addr used name   list of local variables");
  9938                                  
  9939 00004E9F 68[F64E]                 push listproc_2
  9940 00004EA2 E8CCFB                   call prs
  9941 00004EA5 83C402                   add  sp, 2
  9942                                  
  9943                                  ;-889     i=LSTART; 
  9944                                  
  9945 00004EA8 B8C800                   mov ax, 200
  9946 00004EAB 8946FE                   mov [bp-2], ax
  9947                                  
  9948                                  ;-890     while (i < LTop) { listvar(i); i++; } } 
  9949                                  
  9950                                  @@listproc587:
  9951 00004EAE 8B46FE                   mov ax, [bp-2]
  9952 00004EB1 3B06[3700]               cmp ax, [LTop]
  9953 00004EB5 0F8D0E00                 jge @@listproc588
  9954 00004EB9 FF76FE                   push word [bp-2]
  9955 00004EBC E87800                   call listvar
  9956 00004EBF 83C402                   add  sp, 2
  9957 00004EC2 FF46FE                   inc  word[bp-2]
  9958 00004EC5 EBE7                     jmp @@listproc587
  9959                                  @@listproc588:
  9960                                  
  9961                                  ;-891 }
  9962                                  
  9963                                  @@listproc586:
  9964                                  
  9965                                  ;-892 int listvar(unsigned int i) {unsigned int j; char c;
  9966 00004EC7 C9                       LEAVE
  9967 00004EC8 C3                       ret
  9968                                  ; ENDP
  9969 00004EC9 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9970 00004ED2 6F6E203A2000       
  9971 00004ED8 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9972 00004EE1 6F66206C6F63616C20-
  9973 00004EEA 7661726961626C6573-
  9974 00004EF3 3A2000             
  9975 00004EF6 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9976 00004EFF 797065207369676E20-
  9977 00004F08 776964746820616464-
  9978 00004F11 722075736564206E61-
  9979 00004F1A 6D652020206C697374-
  9980 00004F23 206F66206C6F63616C-
  9981 00004F2C 207661726961626C65-
  9982 00004F35 7300               
  9983                                  
  9984                                  listvar:  ; *** PROC ***
  9985                                  
  9986                                  ;-893   prs("\n;"); printint51(i); prc(32);
  9987                                  
  9988                                  ;Function : listvar, Number of local variables: 3
  9989                                  ;   # type sign width addr used name   list of local variables
  9990                                  ;  200 var unsg word   892 NULL i = bp+4
  9991                                  ;  201 var unsg word   892 NULL j = bp-2
  9992                                  ;  202 var sign byte   892 NULL c = bp-4;
  9993 00004F37 C8040000                 ENTER  4,0
  9994 00004F3B 68[2351]                 push listvar_0
  9995 00004F3E E830FB                   call prs
  9996 00004F41 83C402                   add  sp, 2
  9997 00004F44 FF7604                   push word [bp+4]
  9998 00004F47 E8C3FC                   call printint51
  9999 00004F4A 83C402                   add  sp, 2
 10000 00004F4D 6A20                     push 32
 10001 00004F4F E8AFFA                   call prc
 10002 00004F52 83C402                   add  sp, 2
 10003                                  
 10004                                  ;-894   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
 10005                                  
 10006 00004F55 8B5E04                   mov bx, [bp+4]
 10007 00004F58 8A87B782                 mov al, [GType + bx]
 10008 00004F5C 8846FC                   mov [bp-4], al
 10009 00004F5F 8A46FC                   mov al, [bp-4]
 10010 00004F62 3C56                     cmp al, 86
 10011 00004F64 0F850900                 jne @@listvar589
 10012 00004F68 68[2751]                 push listvar_1
 10013 00004F6B E803FB                   call prs
 10014 00004F6E 83C402                   add  sp, 2
 10015                                  @@listvar589:
 10016 00004F71 8A46FC                   mov al, [bp-4]
 10017 00004F74 3C2A                     cmp al, 42
 10018 00004F76 0F850900                 jne @@listvar590
 10019 00004F7A 68[2C51]                 push listvar_2
 10020 00004F7D E8F1FA                   call prs
 10021 00004F80 83C402                   add  sp, 2
 10022                                  
 10023                                  ;-895                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
 10024                                  
 10025                                  @@listvar590:
 10026 00004F83 8A46FC                   mov al, [bp-4]
 10027 00004F86 3C26                     cmp al, 38
 10028 00004F88 0F850900                 jne @@listvar591
 10029 00004F8C 68[3151]                 push listvar_3
 10030 00004F8F E8DFFA                   call prs
 10031 00004F92 83C402                   add  sp, 2
 10032                                  @@listvar591:
 10033 00004F95 8A46FC                   mov al, [bp-4]
 10034 00004F98 3C23                     cmp al, 35
 10035 00004F9A 0F850900                 jne @@listvar592
 10036 00004F9E 68[3651]                 push listvar_4
 10037 00004FA1 E8CDFA                   call prs
 10038 00004FA4 83C402                   add  sp, 2
 10039                                  
 10040                                  ;-896   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
 10041                                  
 10042                                  @@listvar592:
 10043 00004FA7 8B5E04                   mov bx, [bp+4]
 10044 00004FAA 8A87E383                 mov al, [GSign + bx]
 10045 00004FAE 8846FC                   mov [bp-4], al
 10046 00004FB1 8A46FC                   mov al, [bp-4]
 10047 00004FB4 3C53                     cmp al, 83
 10048 00004FB6 0F850900                 jne @@listvar593
 10049 00004FBA 68[3B51]                 push listvar_5
 10050 00004FBD E8B1FA                   call prs
 10051 00004FC0 83C402                   add  sp, 2
 10052                                  @@listvar593:
 10053 00004FC3 8A46FC                   mov al, [bp-4]
 10054 00004FC6 3C55                     cmp al, 85
 10055 00004FC8 0F850900                 jne @@listvar594
 10056 00004FCC 68[4151]                 push listvar_6
 10057 00004FCF E89FFA                   call prs
 10058 00004FD2 83C402                   add  sp, 2
 10059                                  
 10060                                  ;-897   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
 10061                                  
 10062                                  @@listvar594:
 10063 00004FD5 8B5E04                   mov bx, [bp+4]
 10064 00004FD8 8A870F85                 mov al, [GWidth + bx]
 10065 00004FDC 8846FC                   mov [bp-4], al
 10066 00004FDF 8A46FC                   mov al, [bp-4]
 10067 00004FE2 3C01                     cmp al, 1
 10068 00004FE4 0F850900                 jne @@listvar595
 10069 00004FE8 68[4751]                 push listvar_7
 10070 00004FEB E883FA                   call prs
 10071 00004FEE 83C402                   add  sp, 2
 10072                                  @@listvar595:
 10073 00004FF1 8A46FC                   mov al, [bp-4]
 10074 00004FF4 3C02                     cmp al, 2
 10075 00004FF6 0F850900                 jne @@listvar596
 10076 00004FFA 68[4D51]                 push listvar_8
 10077 00004FFD E871FA                   call prs
 10078 00005000 83C402                   add  sp, 2
 10079                                  
 10080                                  ;-898                if(c==  4)prs("dwrd " );
 10081                                  
 10082                                  @@listvar596:
 10083 00005003 8A46FC                   mov al, [bp-4]
 10084 00005006 3C04                     cmp al, 4
 10085 00005008 0F850900                 jne @@listvar597
 10086 0000500C 68[5351]                 push listvar_9
 10087 0000500F E85FFA                   call prs
 10088 00005012 83C402                   add  sp, 2
 10089                                  
 10090                                  ;-899   j=GAdr[i]; printint51(j);
 10091                                  
 10092                                  @@listvar597:
 10093 00005015 8B5E04                   mov bx, [bp+4]
 10094 00005018 D1E3                     shl bx, 1
 10095 0000501A 8B873B86                 mov ax, [GAdr + bx]
 10096 0000501E 8946FE                   mov [bp-2], ax
 10097 00005021 FF76FE                   push word [bp-2]
 10098 00005024 E8E6FB                   call printint51
 10099 00005027 83C402                   add  sp, 2
 10100                                  
 10101                                  ;-900   j=GUsed[i]; if (j) printint51(j);
 10102                                  
 10103 0000502A 8B5E04                   mov bx, [bp+4]
 10104 0000502D D1E3                     shl bx, 1
 10105 0000502F 8B879388                 mov ax, [GUsed + bx]
 10106 00005033 8946FE                   mov [bp-2], ax
 10107 00005036 8B46FE                   mov ax, [bp-2]
 10108 00005039 08C0                     or  al, al
 10109 0000503B 0F840C00                 je @@listvar598
 10110 0000503F FF76FE                   push word [bp-2]
 10111 00005042 E8C8FB                   call printint51
 10112 00005045 83C402                   add  sp, 2
 10113                                  
 10114                                  ;-901   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
 10115                                  
 10116 00005048 E92200                   jmp @@listvar599
 10117                                  @@listvar598:
 10118 0000504B 8B5E04                   mov bx, [bp+4]
 10119 0000504E 8A87B782                 mov al, [GType + bx]
 10120 00005052 3C23                     cmp al, 35
 10121 00005054 0F850C00                 jne @@listvar600
 10122 00005058 68[5951]                 push listvar_10
 10123 0000505B E813FA                   call prs
 10124 0000505E 83C402                   add  sp, 2
 10125 00005061 E90900                   jmp @@listvar601
 10126                                  @@listvar600:
 10127 00005064 68[5F51]                 push listvar_11
 10128 00005067 E807FA                   call prs
 10129 0000506A 83C402                   add  sp, 2
 10130                                  @@listvar601:
 10131                                  
 10132                                  ;-902   prc(32);  pt=adrofname(i); prs(pt);
 10133                                  
 10134                                  @@listvar599:
 10135 0000506D 6A20                     push 32
 10136 0000506F E88FF9                   call prc
 10137 00005072 83C402                   add  sp, 2
 10138 00005075 FF7604                   push word [bp+4]
 10139 00005078 E8A1B6                   call adrofname
 10140 0000507B 83C402                   add  sp, 2
 10141 0000507E A3[7500]                 mov word [pt], ax
 10142 00005081 FF36[7500]               push word [pt]
 10143 00005085 E8E9F9                   call prs
 10144 00005088 83C402                   add  sp, 2
 10145                                  
 10146                                  ;-903   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
 10147                                  
 10148 0000508B 8B5E04                   mov bx, [bp+4]
 10149 0000508E 8A87B782                 mov al, [GType + bx]
 10150 00005092 3C23                     cmp al, 35
 10151 00005094 0F851D00                 jne @@listvar602
 10152 00005098 6A3D                     push 61
 10153 0000509A E864F9                   call prc
 10154 0000509D 83C402                   add  sp, 2
 10155 000050A0 8B5E04                   mov bx, [bp+4]
 10156 000050A3 D1E3                     shl bx, 1
 10157 000050A5 8B87EB8A                 mov ax, [GData + bx]
 10158 000050A9 8946FE                   mov [bp-2], ax
 10159 000050AC FF76FE                   push word [bp-2]
 10160 000050AF E819FB                   call prunsign1
 10161 000050B2 83C402                   add  sp, 2
 10162                                  
 10163                                  ;-904   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
 10164                                  
 10165                                  @@listvar602:
 10166 000050B5 8B5E04                   mov bx, [bp+4]
 10167 000050B8 8A87B782                 mov al, [GType + bx]
 10168 000050BC 3C26                     cmp al, 38
 10169 000050BE 0F852500                 jne @@listvar603
 10170 000050C2 6A5B                     push 91
 10171 000050C4 E83AF9                   call prc
 10172 000050C7 83C402                   add  sp, 2
 10173 000050CA 8B5E04                   mov bx, [bp+4]
 10174 000050CD D1E3                     shl bx, 1
 10175 000050CF 8B87EB8A                 mov ax, [GData + bx]
 10176 000050D3 8946FE                   mov [bp-2], ax
 10177 000050D6 FF76FE                   push word [bp-2]
 10178 000050D9 E8EFFA                   call prunsign1
 10179 000050DC 83C402                   add  sp, 2
 10180 000050DF 6A5D                     push 93
 10181 000050E1 E81DF9                   call prc
 10182 000050E4 83C402                   add  sp, 2
 10183                                  
 10184                                  ;-905   if (i >= LSTART) { prs(" = bp"); j=GData[i];
 10185                                  
 10186                                  @@listvar603:
 10187 000050E7 8B4604                   mov ax, [bp+4]
 10188 000050EA 3DC800                   cmp ax, 200 ;unsigned : 0
 10189 000050ED 0F823000                 jb  @@listvar604
 10190 000050F1 68[6551]                 push listvar_12
 10191 000050F4 E87AF9                   call prs
 10192 000050F7 83C402                   add  sp, 2
 10193 000050FA 8B5E04                   mov bx, [bp+4]
 10194 000050FD D1E3                     shl bx, 1
 10195 000050FF 8B87EB8A                 mov ax, [GData + bx]
 10196 00005103 8946FE                   mov [bp-2], ax
 10197                                  
 10198                                  ;-906     if (j > 0) prc('+'); pint1(j);  }
 10199                                  
 10200 00005106 8B46FE                   mov ax, [bp-2]
 10201 00005109 83F800                   cmp ax, 0
 10202 0000510C 0F8E0800                 jle @@listvar605
 10203 00005110 6A2B                     push 43
 10204 00005112 E8ECF8                   call prc
 10205 00005115 83C402                   add  sp, 2
 10206                                  @@listvar605:
 10207 00005118 FF76FE                   push word [bp-2]
 10208 0000511B E84AFA                   call pint1
 10209 0000511E 83C402                   add  sp, 2
 10210                                  
 10211                                  ;-907 }
 10212                                  
 10213                                  @@listvar604:
 10214                                  
 10215                                  ;-908 int listcall() { int i;
 10216 00005121 C9                       LEAVE
 10217 00005122 C3                       ret
 10218                                  ; ENDP
 10219 00005123 5C6E3B00                listvar_0 db "\n;",0
 10220 00005127 7661722000              listvar_1 db "var ",0
 10221 0000512C 7074722000              listvar_2 db "ptr ",0
 10222 00005131 6172722000              listvar_3 db "arr ",0
 10223 00005136 6465662000              listvar_4 db "def ",0
 10224 0000513B 7369676E2000            listvar_5 db "sign ",0
 10225 00005141 756E73672000            listvar_6 db "unsg ",0
 10226 00005147 627974652000            listvar_7 db "byte ",0
 10227 0000514D 776F72642000            listvar_8 db "word ",0
 10228 00005153 647772642000            listvar_9 db "dwrd ",0
 10229 00005159 202020202D00            listvar_10 db "    -",0
 10230 0000515F 204E554C4C00            listvar_11 db " NULL",0
 10231 00005165 203D20627000            listvar_12 db " = bp",0
 10232                                  
 10233                                  listcall:  ; *** PROC ***
 10234                                  
 10235                                  ;-909   prs("\n\n;    #  addr name   list of CALLs\n");
 10236                                  
 10237                                  ;Function : listcall, Number of local variables: 1
 10238                                  ;   # type sign width addr used name   list of local variables
 10239                                  ;  200 var sign word   908 NULL i = bp-2;
 10240 0000516B C8020000                 ENTER  2,0
 10241 0000516F 68[9951]                 push listcall_0
 10242 00005172 E8FCF8                   call prs
 10243 00005175 83C402                   add  sp, 2
 10244                                  
 10245                                  ;-910   i=0;  while (i< CTop) { calllisting(i); i++; } }
 10246                                  
 10247 00005178 B80000                   mov ax, 0
 10248 0000517B 8946FE                   mov [bp-2], ax
 10249                                  @@listcall606:
 10250 0000517E 8B46FE                   mov ax, [bp-2]
 10251 00005181 3B06[4800]               cmp ax, [CTop]
 10252 00005185 0F8D0E00                 jge @@listcall607
 10253 00005189 FF76FE                   push word [bp-2]
 10254 0000518C E83200                   call calllisting
 10255 0000518F 83C402                   add  sp, 2
 10256 00005192 FF46FE                   inc  word[bp-2]
 10257 00005195 EBE7                     jmp @@listcall606
 10258                                  @@listcall607:
 10259                                  
 10260                                  ;-911 int calllisting(int i) {char c; int j;
 10261 00005197 C9                       LEAVE
 10262 00005198 C3                       ret
 10263                                  ; ENDP
 10264 00005199 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10265 000051A2 23202061646472206E-
 10266 000051AB 616D652020206C6973-
 10267 000051B4 74206F662043414C4C-
 10268 000051BD 735C6E00           
 10269                                  
 10270                                  calllisting:  ; *** PROC ***
 10271                                  
 10272                                  ;-912   prs("\n;"); printint51(i); prc(32);
 10273                                  
 10274                                  ;Function : calllisting, Number of local variables: 3
 10275                                  ;   # type sign width addr used name   list of local variables
 10276                                  ;  200 var sign word   911 NULL i = bp+4
 10277                                  ;  201 var sign byte   911 NULL c = bp-2
 10278                                  ;  202 var sign word   911 NULL j = bp-4;
 10279 000051C1 C8040000                 ENTER  4,0
 10280 000051C5 68[3352]                 push calllisting_0
 10281 000051C8 E8A6F8                   call prs
 10282 000051CB 83C402                   add  sp, 2
 10283 000051CE FF7604                   push word [bp+4]
 10284 000051D1 E839FA                   call printint51
 10285 000051D4 83C402                   add  sp, 2
 10286 000051D7 6A20                     push 32
 10287 000051D9 E825F8                   call prc
 10288 000051DC 83C402                   add  sp, 2
 10289                                  
 10290                                  ;-913   c=CType [i]; if(c==0)prs("unresolved ");
 10291                                  
 10292 000051DF 8B5E04                   mov bx, [bp+4]
 10293 000051E2 8A872FA1                 mov al, [CType + bx]
 10294 000051E6 8846FE                   mov [bp-2], al
 10295 000051E9 8A46FE                   mov al, [bp-2]
 10296 000051EC 3C00                     cmp al, 0
 10297 000051EE 0F850900                 jne @@calllisting608
 10298 000051F2 68[3752]                 push calllisting_1
 10299 000051F5 E879F8                   call prs
 10300 000051F8 83C402                   add  sp, 2
 10301                                  
 10302                                  ;-914   j=CAdr[i];            printint51(j); prc(32);
 10303                                  
 10304                                  @@calllisting608:
 10305 000051FB 8B5E04                   mov bx, [bp+4]
 10306 000051FE D1E3                     shl bx, 1
 10307 00005200 8B8757AB                 mov ax, [CAdr + bx]
 10308 00005204 8946FC                   mov [bp-4], ax
 10309 00005207 FF76FC                   push word [bp-4]
 10310 0000520A E800FA                   call printint51
 10311 0000520D 83C402                   add  sp, 2
 10312 00005210 6A20                     push 32
 10313 00005212 E8ECF7                   call prc
 10314 00005215 83C402                   add  sp, 2
 10315                                  
 10316                                  ;-915   from_far(NameA, j);   prs(NameA);
 10317                                  
 10318 00005218 FF76FC                   push word [bp-4]
 10319 0000521B 8D06[4A00]               lea  ax, [NameA]
 10320 0000521F 50                       push ax
 10321 00005220 E8D006                   call from_far
 10322 00005223 83C404                   add  sp, 4
 10323 00005226 8D06[4A00]               lea  ax, [NameA]
 10324 0000522A 50                       push ax
 10325 0000522B E843F8                   call prs
 10326 0000522E 83C402                   add  sp, 2
 10327                                  
 10328                                  ;-916 }
 10329                                  
 10330                                  
 10331                                  ;-917 int countcalls(int f) { unsigned int i;
 10332 00005231 C9                       LEAVE
 10333 00005232 C3                       ret
 10334                                  ; ENDP
 10335 00005233 5C6E3B00                calllisting_0 db "\n;",0
 10336 00005237 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10337 00005240 642000             
 10338                                  
 10339                                  countcalls:  ; *** PROC ***
 10340                                  
 10341                                  ;-918   pt=adrF(FNameField, f);
 10342                                  
 10343                                  ;Function : countcalls, Number of local variables: 2
 10344                                  ;   # type sign width addr used name   list of local variables
 10345                                  ;  200 var sign word   917 NULL f = bp+4
 10346                                  ;  201 var unsg word   917 NULL i = bp-2;
 10347 00005243 C8020000                 ENTER  2,0
 10348 00005247 FF7604                   push word [bp+4]
 10349 0000524A 8D064FBD                 lea  ax, [FNameField]
 10350 0000524E 50                       push ax
 10351 0000524F E8DEB4                   call adrF
 10352 00005252 83C404                   add  sp, 4
 10353 00005255 A3[7500]                 mov word [pt], ax
 10354                                  
 10355                                  ;-919   i=0;  while (i < CTop) {
 10356                                  
 10357 00005258 B80000                   mov ax, 0
 10358 0000525B 8946FE                   mov [bp-2], ax
 10359                                  @@countcalls609:
 10360 0000525E 8B46FE                   mov ax, [bp-2]
 10361 00005261 3B06[4800]               cmp ax, [CTop]
 10362 00005265 0F8D4A00                 jge @@countcalls610
 10363                                  
 10364                                  ;-920     p1=CAdr[i];
 10365                                  
 10366 00005269 8B5EFE                   mov bx, [bp-2]
 10367 0000526C D1E3                     shl bx, 1
 10368 0000526E 8B8757AB                 mov ax, [CAdr + bx]
 10369 00005272 A3[7700]                 mov word [p1], ax
 10370                                  
 10371                                  ;-921     from_far(NameA, p1);
 10372                                  
 10373 00005275 FF36[7700]               push word [p1]
 10374 00005279 8D06[4A00]               lea  ax, [NameA]
 10375 0000527D 50                       push ax
 10376 0000527E E87206                   call from_far
 10377 00005281 83C404                   add  sp, 4
 10378                                  
 10379                                  ;-922     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10380                                  
 10381 00005284 8D06[4A00]               lea  ax, [NameA]
 10382 00005288 50                       push ax
 10383 00005289 FF36[7500]               push word [pt]
 10384 0000528D E8D208                   call eqstr
 10385 00005290 83C404                   add  sp, 4
 10386 00005293 08C0                     or  al, al
 10387 00005295 0F841500                 je @@countcalls611
 10388 00005299 8B5E04                   mov bx, [bp+4]
 10389 0000529C D1E3                     shl bx, 1
 10390 0000529E 8B87F7BA                 mov ax, [FCalls + bx]
 10391 000052A2 83C001                   add ax, 1
 10392 000052A5 8B5E04                   mov bx, [bp+4]
 10393 000052A8 D1E3                     shl bx, 1
 10394 000052AA 8987F7BA                 mov [FCalls+bx], ax
 10395                                  
 10396                                  ;-923     i++; }
 10397                                  
 10398                                  @@countcalls611:
 10399 000052AE FF46FE                   inc  word[bp-2]
 10400                                  
 10401                                  ;-924 }
 10402                                  
 10403 000052B1 EBAB                     jmp @@countcalls609
 10404                                  @@countcalls610:
 10405                                  
 10406                                  ;-925 int listfunc() { int i;
 10407 000052B3 C9                       LEAVE
 10408 000052B4 C3                       ret
 10409                                  ; ENDP
 10410                                  
 10411                                  listfunc:  ; *** PROC ***
 10412                                  
 10413                                  ;-926   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10414                                  
 10415                                  ;Function : listfunc, Number of local variables: 1
 10416                                  ;   # type sign width addr used name   list of local variables
 10417                                  ;  200 var sign word   925 NULL i = bp-2;
 10418 000052B5 C8020000                 ENTER  2,0
 10419 000052B9 68[0253]                 push listfunc_0
 10420 000052BC E8B2F7                   call prs
 10421 000052BF 83C402                   add  sp, 2
 10422                                  
 10423                                  ;-927   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10424                                  
 10425 000052C2 B80000                   mov ax, 0
 10426 000052C5 8946FE                   mov [bp-2], ax
 10427                                  @@listfunc612:
 10428 000052C8 8B46FE                   mov ax, [bp-2]
 10429 000052CB 3B06[4600]               cmp ax, [FTop]
 10430 000052CF 0F8D0E00                 jge @@listfunc613
 10431 000052D3 FF76FE                   push word [bp-2]
 10432 000052D6 E86AFF                   call countcalls
 10433 000052D9 83C402                   add  sp, 2
 10434 000052DC FF46FE                   inc  word[bp-2]
 10435                                  
 10436                                  ;-928   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10437                                  
 10438 000052DF EBE7                     jmp @@listfunc612
 10439                                  @@listfunc613:
 10440 000052E1 B80000                   mov ax, 0
 10441 000052E4 8946FE                   mov [bp-2], ax
 10442                                  @@listfunc614:
 10443 000052E7 8B46FE                   mov ax, [bp-2]
 10444 000052EA 3B06[4600]               cmp ax, [FTop]
 10445 000052EE 0F8D0E00                 jge @@listfunc615
 10446 000052F2 FF76FE                   push word [bp-2]
 10447 000052F5 E84300                   call funclisting
 10448 000052F8 83C402                   add  sp, 2
 10449 000052FB FF46FE                   inc  word[bp-2]
 10450 000052FE EBE7                     jmp @@listfunc614
 10451                                  @@listfunc615:
 10452                                  
 10453                                  ;-929 int funclisting(int i) {int j;  char c;
 10454 00005300 C9                       LEAVE
 10455 00005301 C3                       ret
 10456                                  ; ENDP
 10457 00005302 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10458 0000530B 20232043616C6C7320-
 10459 00005314 4C696E652057696474-
 10460 0000531D 6820204E616D652020-
 10461 00005326 206C697374206F6620-
 10462 0000532F 66756E6374696F6E73-
 10463 00005338 5C6E00             
 10464                                  
 10465                                  funclisting:  ; *** PROC ***
 10466                                  
 10467                                  ;-930   prs("\n;");    printint51(i);
 10468                                  
 10469                                  ;Function : funclisting, Number of local variables: 3
 10470                                  ;   # type sign width addr used name   list of local variables
 10471                                  ;  200 var sign word   929 NULL i = bp+4
 10472                                  ;  201 var sign word   929 NULL j = bp-2
 10473                                  ;  202 var sign byte   929 NULL c = bp-4;
 10474 0000533B C8040000                 ENTER  4,0
 10475 0000533F 68[1754]                 push funclisting_0
 10476 00005342 E82CF7                   call prs
 10477 00005345 83C402                   add  sp, 2
 10478 00005348 FF7604                   push word [bp+4]
 10479 0000534B E8BFF8                   call printint51
 10480 0000534E 83C402                   add  sp, 2
 10481                                  
 10482                                  ;-931   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10483                                  
 10484 00005351 8B5E04                   mov bx, [bp+4]
 10485 00005354 D1E3                     shl bx, 1
 10486 00005356 8B87F7BA                 mov ax, [FCalls + bx]
 10487 0000535A 8946FE                   mov [bp-2], ax
 10488 0000535D 8B46FE                   mov ax, [bp-2]
 10489 00005360 08C0                     or  al, al
 10490 00005362 0F840C00                 je @@funclisting616
 10491 00005366 FF76FE                   push word [bp-2]
 10492 00005369 E8A1F8                   call printint51
 10493 0000536C 83C402                   add  sp, 2
 10494 0000536F E90900                   jmp @@funclisting617
 10495                                  @@funclisting616:
 10496 00005372 68[1B54]                 push funclisting_1
 10497 00005375 E8F9F6                   call prs
 10498 00005378 83C402                   add  sp, 2
 10499                                  
 10500                                  ;-932   j = FAdr[i];   printint51(j); prc(32);
 10501                                  
 10502                                  @@funclisting617:
 10503 0000537B 8B5E04                   mov bx, [bp+4]
 10504 0000537E D1E3                     shl bx, 1
 10505 00005380 8B87FFA8                 mov ax, [FAdr + bx]
 10506 00005384 8946FE                   mov [bp-2], ax
 10507 00005387 FF76FE                   push word [bp-2]
 10508 0000538A E880F8                   call printint51
 10509 0000538D 83C402                   add  sp, 2
 10510 00005390 6A20                     push 32
 10511 00005392 E86CF6                   call prc
 10512 00005395 83C402                   add  sp, 2
 10513                                  
 10514                                  ;-933   c=FType[i];
 10515                                  
 10516 00005398 8B5E04                   mov bx, [bp+4]
 10517 0000539B 8A8703A0                 mov al, [FType + bx]
 10518 0000539F 8846FC                   mov [bp-4], al
 10519                                  
 10520                                  ;-934   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10521                                  
 10522 000053A2 8A46FC                   mov al, [bp-4]
 10523 000053A5 3C56                     cmp al, 86
 10524 000053A7 0F850900                 jne @@funclisting618
 10525 000053AB 68[2154]                 push funclisting_2
 10526 000053AE E8C0F6                   call prs
 10527 000053B1 83C402                   add  sp, 2
 10528                                  @@funclisting618:
 10529 000053B4 8A46FC                   mov al, [bp-4]
 10530 000053B7 3C42                     cmp al, 66
 10531 000053B9 0F850900                 jne @@funclisting619
 10532 000053BD 68[2754]                 push funclisting_3
 10533 000053C0 E8AEF6                   call prs
 10534 000053C3 83C402                   add  sp, 2
 10535                                  
 10536                                  ;-935   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10537                                  
 10538                                  @@funclisting619:
 10539 000053C6 8A46FC                   mov al, [bp-4]
 10540 000053C9 3C57                     cmp al, 87
 10541 000053CB 0F850900                 jne @@funclisting620
 10542 000053CF 68[2D54]                 push funclisting_4
 10543 000053D2 E89CF6                   call prs
 10544 000053D5 83C402                   add  sp, 2
 10545                                  @@funclisting620:
 10546 000053D8 8A46FC                   mov al, [bp-4]
 10547 000053DB 3C44                     cmp al, 68
 10548 000053DD 0F850900                 jne @@funclisting621
 10549 000053E1 68[3354]                 push funclisting_5
 10550 000053E4 E88AF6                   call prs
 10551 000053E7 83C402                   add  sp, 2
 10552                                  
 10553                                  ;-936   prc(32); prc(32);
 10554                                  
 10555                                  @@funclisting621:
 10556 000053EA 6A20                     push 32
 10557 000053EC E812F6                   call prc
 10558 000053EF 83C402                   add  sp, 2
 10559 000053F2 6A20                     push 32
 10560 000053F4 E80AF6                   call prc
 10561 000053F7 83C402                   add  sp, 2
 10562                                  
 10563                                  ;-937   pt=adrF(FNameField, i); prs(pt);
 10564                                  
 10565 000053FA FF7604                   push word [bp+4]
 10566 000053FD 8D064FBD                 lea  ax, [FNameField]
 10567 00005401 50                       push ax
 10568 00005402 E82BB3                   call adrF
 10569 00005405 83C404                   add  sp, 4
 10570 00005408 A3[7500]                 mov word [pt], ax
 10571 0000540B FF36[7500]               push word [pt]
 10572 0000540F E85FF6                   call prs
 10573 00005412 83C402                   add  sp, 2
 10574                                  
 10575                                  ;-938 }
 10576                                  
 10577                                  
 10578                                  ;-939 unsigned int MAXUI=65535;
 10579 00005415 C9                       LEAVE
 10580 00005416 C3                       ret
 10581                                  ; ENDP
 10582 00005417 5C6E3B00                funclisting_0 db "\n;",0
 10583 0000541B 204E554C4C00            funclisting_1 db " NULL",0
 10584 00005421 766F69642000            funclisting_2 db "void ",0
 10585 00005427 627974652000            funclisting_3 db "byte ",0
 10586 0000542D 776F72642000            funclisting_4 db "word ",0
 10587 00005433 647772642000            funclisting_5 db "dwrd ",0
 10588 00005439 FFFF                    MAXUI dw 65535
 10589                                  
 10590                                  ;-940 int epilog() {unsigned int i; 
 10591                                  
 10592                                  
 10593                                  epilog:  ; *** PROC ***
 10594                                  
 10595                                  ;-941   strcpy(symbol, "LastFunctionByt");  storefunc();
 10596                                  
 10597                                  ;Function : epilog, Number of local variables: 1
 10598                                  ;   # type sign width addr used name   list of local variables
 10599                                  ;  200 var unsg word   940 NULL i = bp-2;
 10600 0000543B C8020000                 ENTER  2,0
 10601 0000543F 68[8456]                 push epilog_0
 10602 00005442 8D062B81                 lea  ax, [symbol]
 10603 00005446 50                       push ax
 10604 00005447 E8F105                   call strcpy
 10605 0000544A 83C404                   add  sp, 4
 10606 0000544D E8EBB5                   call storefunc
 10607                                  
 10608                                  ;-942   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10609                                  
 10610 00005450 68[9456]                 push epilog_1
 10611 00005453 E81BF6                   call prs
 10612 00005456 83C402                   add  sp, 2
 10613                                  
 10614                                  ;-943   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10615                                  
 10616 00005459 68[C156]                 push epilog_2
 10617 0000545C E812F6                   call prs
 10618 0000545F 83C402                   add  sp, 2
 10619                                  
 10620                                  ;-944   i=1;
 10621                                  
 10622 00005462 B80100                   mov ax, 1
 10623 00005465 8946FE                   mov [bp-2], ax
 10624                                  
 10625                                  ;-945   while (i< GTop) { listvar(i); i++; }
 10626                                  
 10627                                  @@epilog622:
 10628 00005468 8B46FE                   mov ax, [bp-2]
 10629 0000546B 3B06[3500]               cmp ax, [GTop]
 10630 0000546F 0F8D0E00                 jge @@epilog623
 10631 00005473 FF76FE                   push word [bp-2]
 10632 00005476 E8BEFA                   call listvar
 10633 00005479 83C402                   add  sp, 2
 10634 0000547C FF46FE                   inc  word[bp-2]
 10635                                  
 10636                                  ;-946   listfunc();   listcall();
 10637                                  
 10638 0000547F EBE7                     jmp @@epilog622
 10639                                  @@epilog623:
 10640 00005481 E831FE                   call listfunc
 10641 00005484 E8E4FC                   call listcall
 10642                                  
 10643                                  ;-947   LIST=1;
 10644                                  
 10645 00005487 B80100                   mov ax, 1
 10646 0000548A A2[1600]                 mov byte [LIST], al
 10647                                  
 10648                                  ;-948   prs("\n;Input: "); prs(&namein);
 10649                                  
 10650 0000548D 68[0857]                 push epilog_3
 10651 00005490 E8DEF5                   call prs
 10652 00005493 83C402                   add  sp, 2
 10653 00005496 8D06EE81                 lea  ax, [namein]
 10654 0000549A 50                       push ax
 10655 0000549B E8D3F5                   call prs
 10656 0000549E 83C402                   add  sp, 2
 10657                                  
 10658                                  ;-949   prs(", List: ");   prs(&namelst);
 10659                                  
 10660 000054A1 68[1357]                 push epilog_4
 10661 000054A4 E8CAF5                   call prs
 10662 000054A7 83C402                   add  sp, 2
 10663 000054AA 8D063182                 lea  ax, [namelst]
 10664 000054AE 50                       push ax
 10665 000054AF E8BFF5                   call prs
 10666 000054B2 83C402                   add  sp, 2
 10667                                  
 10668                                  ;-950   prs(",  Lines:"); printint51(lineno);
 10669                                  
 10670 000054B5 68[1C57]                 push epilog_5
 10671 000054B8 E8B6F5                   call prs
 10672 000054BB 83C402                   add  sp, 2
 10673 000054BE FF36[7100]               push word [lineno]
 10674 000054C2 E848F7                   call printint51
 10675 000054C5 83C402                   add  sp, 2
 10676                                  
 10677                                  ;-951   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10678                                  
 10679 000054C8 68[2657]                 push epilog_6
 10680 000054CB E8A3F5                   call prs
 10681 000054CE 83C402                   add  sp, 2
 10682 000054D1 FF0E[3500]               dec  word[GTop]
 10683 000054D5 FF36[3500]               push word [GTop]
 10684 000054D9 E831F7                   call printint51
 10685 000054DC 83C402                   add  sp, 2
 10686                                  
 10687                                  ;-952   prs(" max.:"); printint51(LSTART);
 10688                                  
 10689 000054DF 68[3A57]                 push epilog_7
 10690 000054E2 E88CF5                   call prs
 10691 000054E5 83C402                   add  sp, 2
 10692 000054E8 68C800                   push 200
 10693 000054EB E81FF7                   call printint51
 10694 000054EE 83C402                   add  sp, 2
 10695                                  
 10696                                  ;-953   prs("\n;Functions      :"); printint51(FTop);
 10697                                  
 10698 000054F1 68[4157]                 push epilog_8
 10699 000054F4 E87AF5                   call prs
 10700 000054F7 83C402                   add  sp, 2
 10701 000054FA FF36[4600]               push word [FTop]
 10702 000054FE E80CF7                   call printint51
 10703 00005501 83C402                   add  sp, 2
 10704                                  
 10705                                  ;-954   prs(" max.:"); printint51(FUNCMAX);
 10706                                  
 10707 00005504 68[5557]                 push epilog_9
 10708 00005507 E867F5                   call prs
 10709 0000550A 83C402                   add  sp, 2
 10710 0000550D 682C01                   push 300
 10711 00005510 E8FAF6                   call printint51
 10712 00005513 83C402                   add  sp, 2
 10713                                  
 10714                                  ;-955   prs("\n;Calls          :"); printint51(CTop);
 10715                                  
 10716 00005516 68[5C57]                 push epilog_10
 10717 00005519 E855F5                   call prs
 10718 0000551C 83C402                   add  sp, 2
 10719 0000551F FF36[4800]               push word [CTop]
 10720 00005523 E8E7F6                   call printint51
 10721 00005526 83C402                   add  sp, 2
 10722                                  
 10723                                  ;-956   prs(" max.:"); printint51(CALLMAX);
 10724                                  
 10725 00005529 68[7057]                 push epilog_11
 10726 0000552C E842F5                   call prs
 10727 0000552F 83C402                   add  sp, 2
 10728 00005532 68D007                   push 2000
 10729 00005535 E8D5F6                   call printint51
 10730 00005538 83C402                   add  sp, 2
 10731                                  
 10732                                  ;-957   prs(", NameField:"); printint51(CNameTop);
 10733                                  
 10734 0000553B 68[7757]                 push epilog_12
 10735 0000553E E830F5                   call prs
 10736 00005541 83C402                   add  sp, 2
 10737 00005544 FF36[6B00]               push word [CNameTop]
 10738 00005548 E8C2F6                   call printint51
 10739 0000554B 83C402                   add  sp, 2
 10740                                  
 10741                                  ;-958   prs(" max.:"); printint51(65535);
 10742                                  
 10743 0000554E 68[8457]                 push epilog_13
 10744 00005551 E81DF5                   call prs
 10745 00005554 83C402                   add  sp, 2
 10746 00005557 6AFF                     push -1
 10747 00005559 E8B1F6                   call printint51
 10748 0000555C 83C402                   add  sp, 2
 10749                                  
 10750                                  ;-959 //  prs(", segE:"); printint51(segE);
 10751                                  
 10752                                  
 10753                                  ;-960   __asm{call LastFunctionByt}  _ i=ax;
 10754                                  
 10755 0000555F E8F506                  call LastFunctionByt
 10756 00005562 8946FE                  mov [bp-2], ax
 10757                                  
 10758                                  ;-961   prs("\n;Code until     :"); printint51(i);
 10759                                  
 10760 00005565 68[8B57]                 push epilog_14
 10761 00005568 E806F5                   call prs
 10762 0000556B 83C402                   add  sp, 2
 10763 0000556E FF76FE                   push word [bp-2]
 10764 00005571 E899F6                   call printint51
 10765 00005574 83C402                   add  sp, 2
 10766                                  
 10767                                  ;-962   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10768                                  
 10769 00005577 68[9F57]                 push epilog_15
 10770 0000557A E8F4F4                   call prs
 10771 0000557D 83C402                   add  sp, 2
 10772 00005580 FF36[1700]               push word [ORGDATAORIG]
 10773 00005584 E886F6                   call printint51
 10774 00005587 83C402                   add  sp, 2
 10775 0000558A A1[1700]                 mov ax, [ORGDATAORIG]
 10776 0000558D 2B46FE                   sub ax, [bp-2]
 10777 00005590 8946FE                   mov [bp-2], ax
 10778 00005593 68[A757]                 push epilog_16
 10779 00005596 E8D8F4                   call prs
 10780 00005599 83C402                   add  sp, 2
 10781                                  
 10782                                  ;-963   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10783                                  
 10784 0000559C FF76FE                   push word [bp-2]
 10785 0000559F E86BF6                   call printint51
 10786 000055A2 83C402                   add  sp, 2
 10787 000055A5 8B46FE                   mov ax, [bp-2]
 10788 000055A8 3DE803                   cmp ax, 1000
 10789 000055AB 0F870900                 ja  @@epilog624
 10790 000055AF 68[AF57]                 push epilog_17
 10791 000055B2 E8BCF4                   call prs
 10792 000055B5 83C402                   add  sp, 2
 10793                                  
 10794                                  ;-964   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10795                                  
 10796                                  @@epilog624:
 10797 000055B8 68[D457]                 push epilog_18
 10798 000055BB E8B3F4                   call prs
 10799 000055BE 83C402                   add  sp, 2
 10800 000055C1 FF36[1900]               push word [orgData]
 10801 000055C5 E803F6                   call prunsign1
 10802 000055C8 83C402                   add  sp, 2
 10803 000055CB A1[3954]                 mov ax, [MAXUI]
 10804 000055CE 2B06[1900]               sub ax, [orgData]
 10805 000055D2 8946FE                   mov [bp-2], ax
 10806                                  
 10807                                  ;-965   prs(", resting stacksize: ");printint51(i);
 10808                                  
 10809 000055D5 68[E857]                 push epilog_19
 10810 000055D8 E896F4                   call prs
 10811 000055DB 83C402                   add  sp, 2
 10812 000055DE FF76FE                   push word [bp-2]
 10813 000055E1 E829F6                   call printint51
 10814 000055E4 83C402                   add  sp, 2
 10815                                  
 10816                                  ;-966   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10817                                  
 10818 000055E7 8B46FE                   mov ax, [bp-2]
 10819 000055EA 3D8813                   cmp ax, 5000
 10820 000055ED 0F870900                 ja  @@epilog625
 10821 000055F1 68[FE57]                 push epilog_20
 10822 000055F4 E87AF4                   call prs
 10823 000055F7 83C402                   add  sp, 2
 10824                                  
 10825                                  ;-967   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10826                                  
 10827                                  @@epilog625:
 10828 000055FA 68[1F58]                 push epilog_21
 10829 000055FD E871F4                   call prs
 10830 00005600 83C402                   add  sp, 2
 10831 00005603 8D06E880                 lea  ax, [coname]
 10832 00005607 50                       push ax
 10833 00005608 E866F4                   call prs
 10834 0000560B 83C402                   add  sp, 2
 10835 0000560E 68[3258]                 push epilog_22
 10836 00005611 E85DF4                   call prs
 10837 00005614 83C402                   add  sp, 2
 10838 00005617 FF36[1B00]               push word [maxco]
 10839 0000561B E8EFF5                   call printint51
 10840 0000561E 83C402                   add  sp, 2
 10841                                  
 10842                                  ;-968   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10843                                  
 10844 00005621 68[3658]                 push epilog_23
 10845 00005624 E84AF4                   call prs
 10846 00005627 83C402                   add  sp, 2
 10847 0000562A 68B80B                   push 3000
 10848 0000562D E8DDF5                   call printint51
 10849 00005630 83C402                   add  sp, 2
 10850 00005633 B8B80B                   mov ax, 3000
 10851 00005636 8946FE                   mov [bp-2], ax
 10852 00005639 8B46FE                   mov ax, [bp-2]
 10853 0000563C 2B06[1B00]               sub ax, [maxco]
 10854 00005640 8946FE                   mov [bp-2], ax
 10855 00005643 68[3C58]                 push epilog_24
 10856 00005646 E828F4                   call prs
 10857 00005649 83C402                   add  sp, 2
 10858                                  
 10859                                  ;-969   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10860                                  
 10861 0000564C FF76FE                   push word [bp-2]
 10862 0000564F E8BBF5                   call printint51
 10863 00005652 83C402                   add  sp, 2
 10864 00005655 8B46FE                   mov ax, [bp-2]
 10865 00005658 3DE803                   cmp ax, 1000
 10866 0000565B 0F870900                 ja  @@epilog626
 10867 0000565F 68[4458]                 push epilog_25
 10868 00005662 E80CF4                   call prs
 10869 00005665 83C402                   add  sp, 2
 10870                                  
 10871                                  ;-970   if(NASM==0)prs("\nEND");end1(0);}
 10872                                  
 10873                                  @@epilog626:
 10874 00005668 A0[1500]                 mov al, [NASM]
 10875 0000566B 3C00                     cmp al, 0
 10876 0000566D 0F850900                 jne @@epilog627
 10877 00005671 68[6D58]                 push epilog_26
 10878 00005674 E8FAF3                   call prs
 10879 00005677 83C402                   add  sp, 2
 10880                                  @@epilog627:
 10881 0000567A 6A00                     push 0
 10882 0000567C E8B8F6                   call end1
 10883 0000567F 83C402                   add  sp, 2
 10884                                  
 10885                                  ;-971 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10886                                  
 10887                                  
 10888                                  ;-972 int setblock(unsigned int i) {
 10889 00005682 C9                       LEAVE
 10890 00005683 C3                       ret
 10891                                  ; ENDP
 10892 00005684 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10893 0000568D 696F6E42797400     
 10894 00005694 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10895 0000569D 6374696F6E4279743A-
 10896 000056A6 646220304538682C20-
 10897 000056AF 302C20305C6E706F70-
 10898 000056B8 2061785C6E72657400 
 10899 000056C1 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10900 000056CA 232074797065207369-
 10901 000056D3 676E20776964746820-
 10902 000056DC 206164722075736564-
 10903 000056E5 206E616D652020206C-
 10904 000056EE 697374206F6620676C-
 10905 000056F7 6F62616C2076617269-
 10906 00005700 61626C65735C6E00   
 10907 00005708 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10908 00005711 2000               
 10909 00005713 2C204C6973743A2000      epilog_4 db ", List: ",0
 10910 0000571C 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10911 00005725 00                 
 10912 00005726 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10913 0000572F 7661726961626C6573-
 10914 00005738 3A00               
 10915 0000573A 206D61782E3A00          epilog_7 db " max.:",0
 10916 00005741 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10917 0000574A 6F6E73202020202020-
 10918 00005753 3A00               
 10919 00005755 206D61782E3A00          epilog_9 db " max.:",0
 10920 0000575C 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10921 00005765 202020202020202020-
 10922 0000576E 3A00               
 10923 00005770 206D61782E3A00          epilog_11 db " max.:",0
 10924 00005777 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10925 00005780 6C643A00           
 10926 00005784 206D61782E3A00          epilog_13 db " max.:",0
 10927 0000578B 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10928 00005794 6E74696C2020202020-
 10929 0000579D 3A00               
 10930 0000579F 206D61782E3A2000        epilog_15 db " max.: ",0
 10931 000057A7 2C20667265653A00        epilog_16 db ", free:",0
 10932 000057AF 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10933 000057B8 696E67202A2A2A2043-
 10934 000057C1 6F6465206172656120-
 10935 000057CA 746F6F20736D616C6C-
 10936 000057D3 00                 
 10937 000057D4 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10938 000057DD 48656170456E642920-
 10939 000057E6 3A00               
 10940 000057E8 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10941 000057F1 20737461636B73697A-
 10942 000057FA 653A2000           
 10943 000057FE 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10944 00005807 696E67202A2A2A2053-
 10945 00005810 7461636B20746F6F20-
 10946 00005819 736D616C6C00       
 10947 0000581F 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10948 00005828 6F6E737420696E2027-
 10949 00005831 00                 
 10950 00005832 27203A00                epilog_22 db "' :",0
 10951 00005836 206D61782E00            epilog_23 db " max.",0
 10952 0000583C 2C20667265653A00        epilog_24 db ", free:",0
 10953 00005844 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10954 0000584D 696E67202A2A2A2063-
 10955 00005856 6F6E7374616E742061-
 10956 0000585F 72656120746F6F2073-
 10957 00005868 6D616C6C00         
 10958 0000586D 5C6E454E4400            epilog_26 db "\nEND",0
 10959                                  
 10960                                  setblock:  ; *** PROC ***
 10961                                  
 10962                                  ;-973   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10963                                  
 10964                                  ;Function : setblock, Number of local variables: 1
 10965                                  ;   # type sign width addr used name   list of local variables
 10966                                  ;  200 var unsg word   972 NULL i = bp+4;
 10967 00005873 C8000000                 ENTER  0,0
 10968 00005877 B80000                   mov ax, 0
 10969 0000587A A3[7900]                 mov word [DOS_ERR], ax
 10970 0000587D 8B5E04                   mov  bx, [bp+4]
 10971 00005880 8CC8                     mov  ax, cs
 10972 00005882 8EC0                     mov  es, ax
 10973 00005884 B8004A                   mov  ax, 18944
 10974 00005887 E84903                   call DosInt
 10975                                  
 10976                                  ;-974 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10977 0000588A C9                       LEAVE
 10978 0000588B C3                       ret
 10979                                  ; ENDP
 10980                                  
 10981                                  allocmem:  ; *** PROC ***
 10982                                  
 10983                                  ;-975   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10984                                  
 10985                                  ;Function : allocmem, Number of local variables: 3
 10986                                  ;   # type sign width addr used name   list of local variables
 10987                                  ;  200 var unsg word   974 NULL i = bp+4
 10988                                  ;  201 var unsg word   974 NULL vAX = bp-2
 10989                                  ;  202 var unsg word   974 NULL vBX = bp-4;
 10990 0000588C C8040000                 ENTER  4,0
 10991 00005890 B80000                   mov ax, 0
 10992 00005893 A3[7900]                 mov word [DOS_ERR], ax
 10993 00005896 8B5E04                   mov  bx, [bp+4]
 10994 00005899 B80048                   mov  ax, 18432
 10995 0000589C E83403                   call DosInt
 10996 0000589F 8946FE                  mov [bp-2], ax
 10997 000058A2 895EFC                  mov [bp-4], bx
 10998                                  
 10999                                  ;-976   if(DOS_ERR) return vBX;   return vAX;
 11000                                  
 11001 000058A5 A1[7900]                 mov ax, [DOS_ERR]
 11002 000058A8 08C0                     or  al, al
 11003 000058AA 0F840600                 je @@allocmem628
 11004 000058AE 8B46FC                   mov ax, [bp-4]
 11005 000058B1 E90600                   jmp @@retn
 11006                                  @@allocmem628:
 11007 000058B4 8B46FE                   mov ax, [bp-2]
 11008 000058B7 E90000                   jmp @@retn
 11009                                  
 11010                                  ;-977 }
 11011                                  
 11012                                  
 11013                                  ;-978 int copyF(char *dest, char *src, unsigned int sz) {
 11014                                  
 11015 000058BA C9                      @@retn: LEAVE
 11016 000058BB C3                       ret
 11017                                  ; ENDP
 11018                                  
 11019                                  copyF:  ; *** PROC ***
 11020                                  
 11021                                  ;-979   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 11022                                  
 11023                                  ;Function : copyF, Number of local variables: 3
 11024                                  ;   # type sign width addr used name   list of local variables
 11025                                  ;  200 ptr sign byte   978 NULL dest = bp+4
 11026                                  ;  201 ptr sign byte   978 NULL src = bp+6
 11027                                  ;  202 var unsg word   978 NULL sz = bp+8;
 11028 000058BC C8000000                 ENTER  0,0
 11029 000058C0 A1[6F00]                 mov ax, [segE]
 11030 000058C3 8EC0                     mov  es, ax
 11031 000058C5 8B7606                   mov  si, [bp+6]
 11032 000058C8 8B7E04                   mov  di, [bp+4]
 11033 000058CB 8B4E08                   mov  cx, [bp+8]
 11034                                  
 11035                                  ;-980   asm cld
 11036                                  
 11037 000058CE FC                       cld
 11038                                  
 11039                                  ;-981   asm rep movsb
 11040                                  
 11041 000058CF F3A4                     rep movsb
 11042                                  
 11043                                  ;-982   asm mov byte [es:di], 0
 11044                                  
 11045 000058D1 26C60500                 mov byte [es:di], 0
 11046                                  
 11047                                  ;-983 }
 11048                                  
 11049                                  
 11050                                  ;-984 int to_far(char *dest, char *src) {
 11051 000058D5 C9                       LEAVE
 11052 000058D6 C3                       ret
 11053                                  ; ENDP
 11054                                  
 11055                                  to_far:  ; *** PROC ***
 11056                                  
 11057                                  ;-985   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 11058                                  
 11059                                  ;Function : to_far, Number of local variables: 2
 11060                                  ;   # type sign width addr used name   list of local variables
 11061                                  ;  200 ptr sign byte   984 NULL dest = bp+4
 11062                                  ;  201 ptr sign byte   984 NULL src = bp+6;
 11063 000058D7 C8000000                 ENTER  0,0
 11064 000058DB A1[6F00]                 mov ax, [segE]
 11065 000058DE 8EC0                     mov  es, ax
 11066 000058E0 8B7606                   mov  si, [bp+6]
 11067 000058E3 8B7E04                   mov  di, [bp+4]
 11068                                  
 11069                                  ;-986   asm cld
 11070                                  
 11071 000058E6 FC                       cld
 11072                                  
 11073                                  ;-987   do{
 11074                                  
 11075                                  @@to_far629:
 11076                                  
 11077                                  ;-988   asm lodsb  ; inc si
 11078                                  
 11079 000058E7 AC                       lodsb  ; inc si
 11080                                  
 11081                                  ;-989   asm stosb  ; inc di
 11082                                  
 11083 000058E8 AA                       stosb  ; inc di
 11084                                  
 11085                                  ;-990   } while (al != 0);
 11086                                  
 11087 000058E9 3C00                     cmp  al, 0
 11088 000058EB 0F840200                 je  @@to_far630
 11089 000058EF EBF6                     jmp @@to_far629
 11090                                  @@to_far630:
 11091                                  
 11092                                  ;-991 }
 11093                                  
 11094                                  
 11095                                  ;-992 int from_far(char *dest, char *src) {
 11096 000058F1 C9                       LEAVE
 11097 000058F2 C3                       ret
 11098                                  ; ENDP
 11099                                  
 11100                                  from_far:  ; *** PROC ***
 11101                                  
 11102                                  ;-993   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 11103                                  
 11104                                  ;Function : from_far, Number of local variables: 2
 11105                                  ;   # type sign width addr used name   list of local variables
 11106                                  ;  200 ptr sign byte   992 NULL dest = bp+4
 11107                                  ;  201 ptr sign byte   992 NULL src = bp+6;
 11108 000058F3 C8000000                 ENTER  0,0
 11109 000058F7 A1[6F00]                 mov ax, [segE]
 11110 000058FA 8EC0                     mov  es, ax
 11111 000058FC 8B7606                   mov  si, [bp+6]
 11112 000058FF 8B7E04                   mov  di, [bp+4]
 11113                                  
 11114                                  ;-994   do{
 11115                                  
 11116                                  @@from_far631:
 11117                                  
 11118                                  ;-995   asm mov al, [es:si]
 11119                                  
 11120 00005902 268A04                   mov al, [es:si]
 11121                                  
 11122                                  ;-996   asm inc si
 11123                                  
 11124 00005905 46                       inc si
 11125                                  
 11126                                  ;-997   asm mov [di], al
 11127                                  
 11128 00005906 8805                     mov [di], al
 11129                                  
 11130                                  ;-998   asm inc di
 11131                                  
 11132 00005908 47                       inc di
 11133                                  
 11134                                  ;-999   } while (al != 0);
 11135                                  
 11136 00005909 3C00                     cmp  al, 0
 11137 0000590B 0F840200                 je  @@from_far632
 11138 0000590F EBF1                     jmp @@from_far631
 11139                                  @@from_far632:
 11140                                  
 11141                                  ;-1000 }
 11142 00005911 C9                       LEAVE
 11143 00005912 C3                       ret
 11144                                  ; ENDP
 11145                                   
 11146                                  ; missing functions: 
 11147                                  ; strlen
 11148                                  ; strcpy
 11149                                  ; strlen
 11150                                  ; strcpy
 11151                                  ; strcpy
 11152                                  ; eqstr
 11153                                  ; eqstr
 11154                                  ; strlen
 11155                                  ; strcpy
 11156                                  ; strcpy
 11157                                  ; eqstr
 11158                                  ; strcpy
 11159                                  ; mkneg
 11160                                  ; strlen
 11161                                  ; strcpy
 11162                                  ; eqstr
 11163                                  ; eqstr
 11164                                  ; strcpy
 11165                                  ; strcpy
 11166                                  ; strcpy
 11167                                  ; strcpy
 11168                                  ; strcpy
 11169                                  ; strcpy
 11170                                  ; strcpy
 11171                                  ; strcpy
 11172                                  ; strlen
 11173                                  ; eqstr
 11174                                  ; eqstr
 11175                                  ; eqstr
 11176                                  ; eqstr
 11177                                  ; eqstr
 11178                                  ; eqstr
 11179                                  ; eqstr
 11180                                  ; eqstr
 11181                                  ; eqstr
 11182                                  ; eqstr
 11183                                  ; eqstr
 11184                                  ; eqstr
 11185                                  ; eqstr
 11186                                  ; eqstr
 11187                                  ; eqstr
 11188                                  ; eqstr
 11189                                  ; eqstr
 11190                                  ; eqstr
 11191                                  ; eqstr
 11192                                  ; eqstr
 11193                                  ; eqstr
 11194                                  ; eqstr
 11195                                  ; strlen
 11196                                  ; eqstr
 11197                                  ; eqstr
 11198                                  ; eqstr
 11199                                  ; eqstr
 11200                                  ; eqstr
 11201                                  ; eqstr
 11202                                  ; eqstr
 11203                                  ; eqstr
 11204                                  ; eqstr
 11205                                  ; eqstr
 11206                                  ; eqstr
 11207                                  ; eqstr
 11208                                  ; eqstr
 11209                                  ; eqstr
 11210                                  ; eqstr
 11211                                  ; eqstr
 11212                                  ; eqstr
 11213                                  ; eqstr
 11214                                  ; eqstr
 11215                                  ; eqstr
 11216                                  ; eqstr
 11217                                  ; eqstr
 11218                                  ; eqstr
 11219                                  ; eqstr
 11220                                  ; eqstr
 11221                                  ; strcpy
 11222                                  ; cputs
 11223                                  ; cputs
 11224                                  ; readRL
 11225                                  ; strcpy
 11226                                  ; instr2
 11227                                  ; strcat1
 11228                                  ; toupper
 11229                                  ; instr2
 11230                                  ; strcpy
 11231                                  ; cputs
 11232                                  ; exitR
 11233                                  ; strcpy
 11234                                  ; strlen
 11235                                  ; openR
 11236                                  ; cputs
 11237                                  ; cputs
 11238                                  ; exitR
 11239                                  ; creatR
 11240                                  ; cputs
 11241                                  ; cputs
 11242                                  ; exitR
 11243                                  ; eqstr
 11244                                  ; cputs
 11245                                  ; cputs
 11246                                  ; pint
 11247                                  ; openR
 11248                                  ; cputs
 11249                                  ; cputs
 11250                                  ; exitR
 11251                                  ; eqstr
 11252                                  ; putch
 11253                                  ; cputs
 11254                                  ; openR
 11255                                  ; eqstr
 11256                                  ; eqstr
 11257                                  ; eqstr
 11258                                  ; eqstr
 11259                                  ; eqstr
 11260                                  ; strcpy
 11261                                  ; strlen
 11262                                  ; strcpy
 11263                                  ; instr1
 11264                                  ; digit
 11265                                  ; letter
 11266                                  ; strcpy
 11267                                  ; letter
 11268                                  ; eqstr
 11269                                  ; eqstr
 11270                                  ; eqstr
 11271                                  ; eqstr
 11272                                  ; eqstr
 11273                                  ; eqstr
 11274                                  ; eqstr
 11275                                  ; eqstr
 11276                                  ; eqstr
 11277                                  ; eqstr
 11278                                  ; eqstr
 11279                                  ; eqstr
 11280                                  ; eqstr
 11281                                  ; eqstr
 11282                                  ; eqstr
 11283                                  ; eqstr
 11284                                  ; eqstr
 11285                                  ; eqstr
 11286                                  ; eqstr
 11287                                  ; eqstr
 11288                                  ; eqstr
 11289                                  ; eqstr
 11290                                  ; strcpy
 11291                                  ; eqstr
 11292                                  ; letter
 11293                                  ; digit
 11294                                  ; writetty
 11295                                  ; writetty
 11296                                  ; fputcR
 11297                                  ; mkneg
 11298                                  ; mkneg
 11299                                  ; readR
 11300                                  ; fcloseR
 11301                                  ; fcloseR
 11302                                  ; exitR
 11303                                  ; eqstr
 11304                                  ; strcpy
 11305                                  ; DosInt
 11306                                  ; DosInt
 11307                                  ; Number of unresolved CALLs :  160
 11308                                  ;use archive file: AR.C
 11309                                  
 11310                                  ;-1001 // AR.C Archive
 11311                                  
 11312                                  ;Number of CALLs:    2 : writetty
 11313                                  
 11314                                  writetty:  ; *** PROC ***
 11315 00005913 B40E                     mov  ah, 14
 11316 00005915 BB0000                   mov  bx, 0
 11317 00005918 CD10                     int  16
 11318                                  
 11319                                  ;-1002 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
 11320                                  
 11321 0000591A C3                       ret
 11322                                  ; ENDP
 11323                                  ;Number of CALLs:    1 : putch
 11324                                  
 11325                                  putch:  ; *** PROC ***
 11326                                  ;Function : putch, Number of local variables: 1
 11327                                  ;   # type sign width addr used name   list of local variables
 11328                                  ;  200 var sign byte  1002 NULL c = bp+4;
 11329 0000591B C8000000                 ENTER  0,0 ; constant expression
 11330 0000591F 807E040A                cmp byte[bp+4], 10
 11331 00005923 0F850500                 jne @@putch633
 11332 00005927 B00D                     mov  al, 13
 11333 00005929 E8E7FF                   call writetty
 11334                                  @@putch633:
 11335 0000592C 8A4604                   mov  al, [bp+4]
 11336 0000592F E8E1FF                   call writetty
 11337                                  
 11338                                  ;-1003 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 11339 00005932 C9                       LEAVE
 11340 00005933 C3                       ret
 11341                                  ; ENDP
 11342                                  ;Number of CALLs:   12 : cputs
 11343                                  
 11344                                  cputs:  ; *** PROC ***
 11345                                  ;Function : cputs, Number of local variables: 2
 11346                                  ;   # type sign width addr used name   list of local variables
 11347                                  ;  200 ptr sign byte  1003 NULL s = bp+4
 11348                                  ;  201 var sign byte  1003 NULL c = bp-2;
 11349 00005934 C8020000                 ENTER  2,0
 11350                                  @@cputs634:
 11351 00005938 8B5E04                   mov bx, [bp+4]
 11352 0000593B 8A07                     mov al, [bx]
 11353 0000593D B400                     mov ah, 0
 11354 0000593F 08C0                     or  al, al
 11355 00005941 0F841B00                 je @@cputs635
 11356 00005945 8B5E04                   mov bx, [bp+4]
 11357 00005948 8A07                     mov al, [bx]
 11358 0000594A B400                     mov ah, 0
 11359 0000594C 8846FE                   mov [bp-2], al
 11360 0000594F 8A46FE                   mov al, byte [bp-2]
 11361 00005952 B400                     mov ah, 0
 11362 00005954 50                       push ax
 11363 00005955 E8C3FF                   call putch
 11364 00005958 83C402                   add  sp, 2
 11365 0000595B FF4604                   inc  word[bp+4]
 11366 0000595E EBD8                     jmp @@cputs634
 11367                                  @@cputs635:
 11368                                  
 11369                                  ;-1004 int mkneg(int n) { n; __asm {neg ax} }
 11370 00005960 C9                       LEAVE
 11371 00005961 C3                       ret
 11372                                  ; ENDP
 11373                                  ;Number of CALLs:    3 : mkneg
 11374                                  
 11375                                  mkneg:  ; *** PROC ***
 11376                                  ;Function : mkneg, Number of local variables: 1
 11377                                  ;   # type sign width addr used name   list of local variables
 11378                                  ;  200 var sign word  1004 NULL n = bp+4;
 11379 00005962 C8000000                 ENTER  0,0
 11380 00005966 8B4604                   mov ax, [bp+4]
 11381 00005969 F7D8                    neg ax
 11382                                  
 11383                                  ;-1005 int prunsign(unsigned int n) { unsigned int e;
 11384 0000596B C9                       LEAVE
 11385 0000596C C3                       ret
 11386                                  ; ENDP
 11387                                  ;Number of CALLs:    1 : pint
 11388                                  
 11389                                  pint:  ; *** PROC ***
 11390                                  ;Function : pint, Number of local variables: 2
 11391                                  ;   # type sign width addr used name   list of local variables
 11392                                  ;  200 var sign word  1005 NULL n = bp+4
 11393                                  ;  201 var sign word  1005 NULL e = bp-2;
 11394 0000596D C8020000                 ENTER  2,0
 11395 00005971 8B4604                   mov ax, [bp+4]
 11396 00005974 83F800                   cmp ax, 0
 11397 00005977 0F8D1400                 jge @@pint636
 11398 0000597B 6A2D                     push 45
 11399 0000597D E881F0                   call prc
 11400 00005980 83C402                   add  sp, 2
 11401 00005983 FF7604                   push word [bp+4]
 11402 00005986 E8D9FF                   call mkneg
 11403 00005989 83C402                   add  sp, 2
 11404 0000598C 894604                   mov [bp+4], ax
 11405                                  
 11406                                  ;-1006   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }
 11407                                  
 11408                                  @@pint636:
 11409 0000598F 8B4604                   mov ax, [bp+4]
 11410 00005992 83F80A                   cmp ax, 10 ;unsigned : 1
 11411 00005995 0F8C1500                 jl  @@pint637
 11412 00005999 8B4604                   mov ax, [bp+4]
 11413 0000599C BB0A00                   mov bx, 10
 11414 0000599F 99                       cwd
 11415 000059A0 F7FB                     idiv bx
 11416 000059A2 8946FE                   mov [bp-2], ax
 11417 000059A5 FF76FE                   push word [bp-2]
 11418 000059A8 E8C2FF                   call pint
 11419 000059AB 83C402                   add  sp, 2
 11420                                  @@pint637:
 11421 000059AE 8B4604                   mov ax, [bp+4]
 11422 000059B1 BB0A00                   mov bx, 10
 11423 000059B4 99                       cwd
 11424 000059B5 F7FB                     idiv bx
 11425 000059B7 89D0                     mov ax, dx
 11426 000059B9 894604                   mov [bp+4], ax
 11427 000059BC 8B4604                   mov ax, [bp+4]
 11428 000059BF 83C030                   add ax, 48
 11429 000059C2 894604                   mov [bp+4], ax
 11430 000059C5 FF7604                   push word [bp+4]
 11431 000059C8 E850FF                   call putch
 11432 000059CB 83C402                   add  sp, 2
 11433                                  
 11434                                  ;-1007 int printint5(unsigned int j)  {
 11435 000059CE C9                       LEAVE
 11436 000059CF C3                       ret
 11437                                  ; ENDP
 11438                                  ;Number of CALLs:    1 : toupper
 11439                                  
 11440                                  toupper:  ; *** PROC ***
 11441                                  ;Function : toupper, Number of local variables: 1
 11442                                  ;   # type sign width addr used name   list of local variables
 11443                                  ;  200 ptr sign byte  1007 NULL s = bp+4;
 11444 000059D0 C8000000                 ENTER  0,0
 11445                                  @@toupper638:
 11446 000059D4 8B5E04                   mov bx, [bp+4]
 11447 000059D7 8A07                     mov al, [bx]
 11448 000059D9 B400                     mov ah, 0
 11449 000059DB 08C0                     or  al, al
 11450 000059DD 0F843000                 je @@toupper639
 11451 000059E1 8B5E04                   mov bx, [bp+4]
 11452 000059E4 8A07                     mov al, [bx]
 11453 000059E6 B400                     mov ah, 0
 11454 000059E8 83F861                   cmp ax, 97 ;unsigned : 1
 11455 000059EB 0F8C1D00                 jl  @@toupper640
 11456 000059EF 8B5E04                   mov bx, [bp+4]
 11457 000059F2 8A07                     mov al, [bx]
 11458 000059F4 B400                     mov ah, 0
 11459 000059F6 83F87A                   cmp ax, 122
 11460 000059F9 0F8F0F00                 jg  @@toupper641
 11461 000059FD 8B5E04                   mov bx, [bp+4]
 11462 00005A00 8A07                     mov al, [bx]
 11463 00005A02 B400                     mov ah, 0
 11464 00005A04 83E820                   sub ax, 32
 11465 00005A07 8B5E04                   mov  bx, [bp+4]
 11466 00005A0A 8807                     mov  [bx], al
 11467                                  @@toupper641:
 11468                                  @@toupper640:
 11469 00005A0C FF4604                   inc  word[bp+4]
 11470 00005A0F EBC3                     jmp @@toupper638
 11471                                  @@toupper639:
 11472                                  
 11473                                  ;-1008 int head1  (char *s) {while(letter(*s)) s++;     *s=0; }
 11474 00005A11 C9                       LEAVE
 11475 00005A12 C3                       ret
 11476                                  ; ENDP
 11477                                  ;Number of CALLs:    8 : strlen
 11478                                  
 11479                                  strlen:  ; *** PROC ***
 11480                                  ;Function : strlen, Number of local variables: 2
 11481                                  ;   # type sign width addr used name   list of local variables
 11482                                  ;  200 ptr sign byte  1008 NULL s = bp+4
 11483                                  ;  201 var sign word  1008 NULL c = bp-2;
 11484 00005A13 C8020000                 ENTER  2,0
 11485 00005A17 B80000                   mov ax, 0
 11486 00005A1A 8946FE                   mov [bp-2], ax
 11487                                  @@strlen642:
 11488 00005A1D 8B5E04                   mov bx, [bp+4]
 11489 00005A20 8A07                     mov al, [bx]
 11490 00005A22 B400                     mov ah, 0
 11491 00005A24 83F800                   cmp ax, 0
 11492 00005A27 0F840800                 je  @@strlen643
 11493 00005A2B FF4604                   inc  word[bp+4]
 11494 00005A2E FF46FE                   inc  word[bp-2]
 11495 00005A31 EBEA                     jmp @@strlen642
 11496                                  @@strlen643:
 11497 00005A33 8B46FE                   mov ax, [bp-2]
 11498 00005A36 E90000                   jmp @@retn
 11499                                  
 11500                                  ;-1009 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
 11501                                  
 11502 00005A39 C9                      @@retn: LEAVE
 11503 00005A3A C3                       ret
 11504                                  ; ENDP
 11505                                  ;Number of CALLs:   24 : strcpy
 11506                                  
 11507                                  strcpy:  ; *** PROC ***
 11508                                  ;Function : strcpy, Number of local variables: 2
 11509                                  ;   # type sign width addr used name   list of local variables
 11510                                  ;  200 ptr sign byte  1009 NULL s = bp+4
 11511                                  ;  201 ptr sign byte  1009 NULL t = bp+6;
 11512 00005A3B C8000000                 ENTER  0,0
 11513                                  @@strcpy644:
 11514 00005A3F 8B5E06                   mov bx, [bp+6]
 11515 00005A42 8A07                     mov al, [bx]
 11516 00005A44 B400                     mov ah, 0
 11517 00005A46 8B5E04                   mov  bx, [bp+4]
 11518 00005A49 8807                     mov  [bx], al
 11519 00005A4B FF4604                   inc  word[bp+4]
 11520 00005A4E FF4606                   inc  word[bp+6]
 11521 00005A51 8B5E06                   mov bx, [bp+6]
 11522 00005A54 8A07                     mov al, [bx]
 11523 00005A56 B400                     mov ah, 0
 11524 00005A58 83F800                   cmp ax, 0
 11525 00005A5B 0F840200                 je  @@strcpy645
 11526 00005A5F EBDE                     jmp @@strcpy644
 11527                                  @@strcpy645:
 11528 00005A61 B80000                   mov ax, 0
 11529 00005A64 8B5E04                   mov  bx, [bp+4]
 11530 00005A67 8807                     mov  [bx], al
 11531                                  
 11532                                  ;-1010 int strncpy(char *s, char *t, int n) { if (_ n==0) return;
 11533 00005A69 C9                       LEAVE
 11534 00005A6A C3                       ret
 11535                                  ; ENDP
 11536                                  ;Number of CALLs:    1 : instr1
 11537                                  
 11538                                  instr1:  ; *** PROC ***
 11539                                  ;Function : instr1, Number of local variables: 2
 11540                                  ;   # type sign width addr used name   list of local variables
 11541                                  ;  200 ptr sign byte  1010 NULL s = bp+4
 11542                                  ;  201 var sign byte  1010 NULL c = bp+6;
 11543 00005A6B C8000000                 ENTER  0,0
 11544                                  @@instr1646:
 11545 00005A6F 8B5E04                   mov bx, [bp+4]
 11546 00005A72 8A07                     mov al, [bx]
 11547 00005A74 B400                     mov ah, 0
 11548 00005A76 08C0                     or  al, al
 11549 00005A78 0F841900                 je @@instr1647
 11550 00005A7C 8B5E04                   mov bx, [bp+4]
 11551 00005A7F 8A07                     mov al, [bx]
 11552 00005A81 B400                     mov ah, 0
 11553 00005A83 3A4606                   cmp al, [bp+6]
 11554 00005A86 0F850600                 jne @@instr1648
 11555 00005A8A B80100                   mov ax, 1
 11556 00005A8D E90B00                   jmp @@retn
 11557                                  @@instr1648:
 11558 00005A90 FF4604                   inc  word[bp+4]
 11559 00005A93 EBDA                     jmp @@instr1646
 11560                                  @@instr1647:
 11561 00005A95 B80000                   mov ax, 0
 11562 00005A98 E90000                   jmp @@retn
 11563                                  
 11564                                  ;-1011 int instr2(char *s, char c) { while(*s) { if (*s==c) return &s; s++;} return 0;}
 11565                                  
 11566 00005A9B C9                      @@retn: LEAVE
 11567 00005A9C C3                       ret
 11568                                  ; ENDP
 11569                                  ;Number of CALLs:    2 : instr2
 11570                                  
 11571                                  instr2:  ; *** PROC ***
 11572                                  ;Function : instr2, Number of local variables: 2
 11573                                  ;   # type sign width addr used name   list of local variables
 11574                                  ;  200 ptr sign byte  1011 NULL s = bp+4
 11575                                  ;  201 var sign byte  1011 NULL c = bp+6;
 11576 00005A9D C8000000                 ENTER  0,0
 11577                                  @@instr2649:
 11578 00005AA1 8B5E04                   mov bx, [bp+4]
 11579 00005AA4 8A07                     mov al, [bx]
 11580 00005AA6 B400                     mov ah, 0
 11581 00005AA8 08C0                     or  al, al
 11582 00005AAA 0F841900                 je @@instr2650
 11583 00005AAE 8B5E04                   mov bx, [bp+4]
 11584 00005AB1 8A07                     mov al, [bx]
 11585 00005AB3 B400                     mov ah, 0
 11586 00005AB5 3A4606                   cmp al, [bp+6]
 11587 00005AB8 0F850600                 jne @@instr2651
 11588 00005ABC 8B4604                   mov ax, [bp+4]
 11589 00005ABF E90B00                   jmp @@retn
 11590                                  @@instr2651:
 11591 00005AC2 FF4604                   inc  word[bp+4]
 11592 00005AC5 EBDA                     jmp @@instr2649
 11593                                  @@instr2650:
 11594 00005AC7 B80000                   mov ax, 0
 11595 00005ACA E90000                   jmp @@retn
 11596                                  
 11597                                  ;-1012 int digit(char c){ if(c<'0') return 0; if(c>'9') return 0; return 1; }
 11598                                  
 11599 00005ACD C9                      @@retn: LEAVE
 11600 00005ACE C3                       ret
 11601                                  ; ENDP
 11602                                  ;Number of CALLs:    2 : digit
 11603                                  
 11604                                  digit:  ; *** PROC ***
 11605                                  ;Function : digit, Number of local variables: 1
 11606                                  ;   # type sign width addr used name   list of local variables
 11607                                  ;  200 var sign byte  1012 NULL c = bp+4;
 11608 00005ACF C8000000                 ENTER  0,0
 11609 00005AD3 8A4604                   mov al, [bp+4]
 11610 00005AD6 3C30                     cmp al, 48
 11611 00005AD8 0F8D0600                 jge @@digit652
 11612 00005ADC B80000                   mov ax, 0
 11613 00005ADF E91500                   jmp @@retn
 11614                                  @@digit652:
 11615 00005AE2 8A4604                   mov al, [bp+4]
 11616 00005AE5 3C39                     cmp al, 57
 11617 00005AE7 0F8E0600                 jle @@digit653
 11618 00005AEB B80000                   mov ax, 0
 11619 00005AEE E90600                   jmp @@retn
 11620                                  @@digit653:
 11621 00005AF1 B80100                   mov ax, 1
 11622 00005AF4 E90000                   jmp @@retn
 11623                                  
 11624                                  ;-1013 int letter(char c) { if (digit(c)) return 1; if (c=='_') return 1;
 11625                                  
 11626 00005AF7 C9                      @@retn: LEAVE
 11627 00005AF8 C3                       ret
 11628                                  ; ENDP
 11629                                  ;Number of CALLs:    3 : letter
 11630                                  
 11631                                  letter:  ; *** PROC ***
 11632                                  ;Function : letter, Number of local variables: 1
 11633                                  ;   # type sign width addr used name   list of local variables
 11634                                  ;  200 var sign byte  1013 NULL c = bp+4;
 11635 00005AF9 C8000000                 ENTER  0,0
 11636 00005AFD 8A4604                   mov al, byte [bp+4]
 11637 00005B00 B400                     mov ah, 0
 11638 00005B02 50                       push ax
 11639 00005B03 E8C9FF                   call digit
 11640 00005B06 83C402                   add  sp, 2
 11641 00005B09 08C0                     or  al, al
 11642 00005B0B 0F840600                 je @@letter654
 11643 00005B0F B80100                   mov ax, 1
 11644 00005B12 E94B00                   jmp @@retn
 11645                                  @@letter654:
 11646 00005B15 8A4604                   mov al, [bp+4]
 11647 00005B18 3C5F                     cmp al, 95
 11648 00005B1A 0F850600                 jne @@letter655
 11649 00005B1E B80100                   mov ax, 1
 11650 00005B21 E93C00                   jmp @@retn
 11651                                  
 11652                                  ;-1014   if (c> 'z') return 0; if (c< '@') return 0;
 11653                                  
 11654                                  @@letter655:
 11655 00005B24 8A4604                   mov al, [bp+4]
 11656 00005B27 3C7A                     cmp al, 122
 11657 00005B29 0F8E0600                 jle @@letter656
 11658 00005B2D B80000                   mov ax, 0
 11659 00005B30 E92D00                   jmp @@retn
 11660                                  @@letter656:
 11661 00005B33 8A4604                   mov al, [bp+4]
 11662 00005B36 3C40                     cmp al, 64
 11663 00005B38 0F8D0600                 jge @@letter657
 11664 00005B3C B80000                   mov ax, 0
 11665 00005B3F E91E00                   jmp @@retn
 11666                                  
 11667                                  ;-1015   if (c> 'Z') { if (c< 'a') return 0; }  return 1; }
 11668                                  
 11669                                  @@letter657:
 11670 00005B42 8A4604                   mov al, [bp+4]
 11671 00005B45 3C5A                     cmp al, 90
 11672 00005B47 0F8E0F00                 jle @@letter658
 11673 00005B4B 8A4604                   mov al, [bp+4]
 11674 00005B4E 3C61                     cmp al, 97
 11675 00005B50 0F8D0600                 jge @@letter659
 11676 00005B54 B80000                   mov ax, 0
 11677 00005B57 E90600                   jmp @@retn
 11678                                  @@letter659:
 11679                                  @@letter658:
 11680 00005B5A B80100                   mov ax, 1
 11681 00005B5D E90000                   jmp @@retn
 11682                                  
 11683                                  ;-1016 int eqstr(char *p, char *q) { while(*p) {
 11684                                  
 11685 00005B60 C9                      @@retn: LEAVE
 11686 00005B61 C3                       ret
 11687                                  ; ENDP
 11688                                  ;Number of CALLs:   83 : eqstr
 11689                                  
 11690                                  eqstr:  ; *** PROC ***
 11691                                  ;Function : eqstr, Number of local variables: 2
 11692                                  ;   # type sign width addr used name   list of local variables
 11693                                  ;  200 ptr sign byte  1016 NULL p = bp+4
 11694                                  ;  201 ptr sign byte  1016 NULL q = bp+6;
 11695 00005B62 C8000000                 ENTER  0,0
 11696                                  @@eqstr660:
 11697 00005B66 8B5E04                   mov bx, [bp+4]
 11698 00005B69 8A07                     mov al, [bx]
 11699 00005B6B B400                     mov ah, 0
 11700 00005B6D 08C0                     or  al, al
 11701 00005B6F 0F842000                 je @@eqstr661
 11702                                  
 11703                                  ;-1017     if (*p != *q) return 0; p++; q++; }
 11704                                  
 11705 00005B73 8B5E04                   mov bx, [bp+4]
 11706 00005B76 8A07                     mov al, [bx]
 11707 00005B78 B400                     mov ah, 0
 11708 00005B7A 8B5E06                   mov bx, [bp+6]
 11709 00005B7D 3A07                     cmp al, [bx]
 11710 00005B7F B400                     mov ah, 0
 11711 00005B81 0F840600                 je  @@eqstr662
 11712 00005B85 B80000                   mov ax, 0
 11713 00005B88 E92100                   jmp @@retn
 11714                                  @@eqstr662:
 11715 00005B8B FF4604                   inc  word[bp+4]
 11716 00005B8E FF4606                   inc  word[bp+6]
 11717                                  
 11718                                  ;-1018     if(*q) return 0; return 1; }
 11719                                  
 11720 00005B91 EBD3                     jmp @@eqstr660
 11721                                  @@eqstr661:
 11722 00005B93 8B5E06                   mov bx, [bp+6]
 11723 00005B96 8A07                     mov al, [bx]
 11724 00005B98 B400                     mov ah, 0
 11725 00005B9A 08C0                     or  al, al
 11726 00005B9C 0F840600                 je @@eqstr663
 11727 00005BA0 B80000                   mov ax, 0
 11728 00005BA3 E90600                   jmp @@retn
 11729                                  @@eqstr663:
 11730 00005BA6 B80100                   mov ax, 1
 11731 00005BA9 E90000                   jmp @@retn
 11732                                  
 11733                                  ;-1019 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
 11734                                  
 11735 00005BAC C9                      @@retn: LEAVE
 11736 00005BAD C3                       ret
 11737                                  ; ENDP
 11738                                  ;Number of CALLs:    1 : strcat1
 11739                                  
 11740                                  strcat1:  ; *** PROC ***
 11741                                  ;Function : strcat1, Number of local variables: 2
 11742                                  ;   # type sign width addr used name   list of local variables
 11743                                  ;  200 ptr sign byte  1019 NULL s = bp+4
 11744                                  ;  201 ptr sign byte  1019 NULL t = bp+6;
 11745 00005BAE C8000000                 ENTER  0,0
 11746                                  @@strcat1664:
 11747 00005BB2 8B5E04                   mov bx, [bp+4]
 11748 00005BB5 8A07                     mov al, [bx]
 11749 00005BB7 B400                     mov ah, 0
 11750 00005BB9 83F800                   cmp ax, 0
 11751 00005BBC 0F840500                 je  @@strcat1665
 11752 00005BC0 FF4604                   inc  word[bp+4]
 11753 00005BC3 EBED                     jmp @@strcat1664
 11754                                  @@strcat1665:
 11755 00005BC5 FF7606                   push word [bp+6]
 11756 00005BC8 FF7604                   push word [bp+4]
 11757 00005BCB E86DFE                   call strcpy
 11758 00005BCE 83C404                   add  sp, 4
 11759                                  
 11760                                  ;-1020 int basename(char *s) { char *p; p=0;
 11761 00005BD1 C9                       LEAVE
 11762 00005BD2 C3                       ret
 11763                                  ; ENDP
 11764                                  ;Number of CALLs:    2 : DosInt
 11765                                  
 11766                                  DosInt:  ; *** PROC ***
 11767 00005BD3 CD21                     int  33
 11768 00005BD5 7304                     jae short @@DosInt666
 11769 00005BD7 FF06[7900]               inc  word[DOS_ERR]
 11770                                  @@DosInt666:
 11771                                  
 11772                                  ;-1021 int openR (char *s) { dx=s; ax=0x3D02;  DosInt(); }
 11773                                  
 11774 00005BDB C3                       ret
 11775                                  ; ENDP
 11776                                  ;Number of CALLs:    3 : openR
 11777                                  
 11778                                  openR:  ; *** PROC ***
 11779                                  ;Function : openR, Number of local variables: 1
 11780                                  ;   # type sign width addr used name   list of local variables
 11781                                  ;  200 ptr sign byte  1021 NULL s = bp+4;
 11782 00005BDC C8000000                 ENTER  0,0
 11783 00005BE0 8B5604                   mov  dx, [bp+4]
 11784 00005BE3 B8023D                   mov  ax, 15618
 11785 00005BE6 E8EAFF                   call DosInt
 11786                                  
 11787                                  ;-1022 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 11788 00005BE9 C9                       LEAVE
 11789 00005BEA C3                       ret
 11790                                  ; ENDP
 11791                                  ;Number of CALLs:    1 : creatR
 11792                                  
 11793                                  creatR:  ; *** PROC ***
 11794                                  ;Function : creatR, Number of local variables: 1
 11795                                  ;   # type sign width addr used name   list of local variables
 11796                                  ;  200 ptr sign byte  1022 NULL s = bp+4;
 11797 00005BEB C8000000                 ENTER  0,0
 11798 00005BEF 8B5604                   mov  dx, [bp+4]
 11799 00005BF2 B90000                   mov  cx, 0
 11800 00005BF5 B8003C                   mov  ax, 15360
 11801 00005BF8 E8D8FF                   call DosInt
 11802                                  
 11803                                  ;-1023 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
 11804 00005BFB C9                       LEAVE
 11805 00005BFC C3                       ret
 11806                                  ; ENDP
 11807                                  ;Number of CALLs:    1 : readR
 11808                                  
 11809                                  readR:  ; *** PROC ***
 11810                                  ;Function : readR, Number of local variables: 2
 11811                                  ;   # type sign width addr used name   list of local variables
 11812                                  ;  200 ptr sign byte  1023 NULL s = bp+4
 11813                                  ;  201 var sign word  1023 NULL fd = bp+6;
 11814 00005BFD C8000000                 ENTER  0,0
 11815 00005C01 8B5604                   mov  dx, [bp+4]
 11816 00005C04 B90100                   mov  cx, 1
 11817 00005C07 8B5E06                   mov  bx, [bp+6]
 11818 00005C0A B8003F                   mov  ax, 16128
 11819 00005C0D E8C3FF                   call DosInt
 11820                                  
 11821                                  ;-1024 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
 11822 00005C10 C9                       LEAVE
 11823 00005C11 C3                       ret
 11824                                  ; ENDP
 11825                                  ;Number of CALLs:    1 : readRL
 11826                                  
 11827                                  readRL:  ; *** PROC ***
 11828                                  ;Function : readRL, Number of local variables: 3
 11829                                  ;   # type sign width addr used name   list of local variables
 11830                                  ;  200 ptr sign byte  1024 NULL s = bp+4
 11831                                  ;  201 var sign word  1024 NULL fd = bp+6
 11832                                  ;  202 var sign word  1024 NULL len = bp+8;
 11833 00005C12 C8000000                 ENTER  0,0
 11834 00005C16 8B5604                   mov  dx, [bp+4]
 11835 00005C19 8B4E08                   mov  cx, [bp+8]
 11836 00005C1C 8B5E06                   mov  bx, [bp+6]
 11837 00005C1F B8003F                   mov  ax, 16128
 11838 00005C22 E8AEFF                   call DosInt
 11839                                  
 11840                                  ;-1025 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 11841 00005C25 C9                       LEAVE
 11842 00005C26 C3                       ret
 11843                                  ; ENDP
 11844                                  ;Number of CALLs:    1 : fputcR
 11845                                  
 11846                                  fputcR:  ; *** PROC ***
 11847                                  ;Function : fputcR, Number of local variables: 2
 11848                                  ;   # type sign width addr used name   list of local variables
 11849                                  ;  200 ptr sign byte  1025 NULL n = bp+4
 11850                                  ;  201 var sign word  1025 NULL fd = bp+6;
 11851 00005C27 C8000000                 ENTER  0,0
 11852 00005C2B 8D5604                  lea dx, [bp+4]
 11853                                  
 11854                                  ;-1026   cx=1; bx=fd; ax=0x4000; DosInt(); }
 11855                                  
 11856 00005C2E B90100                   mov  cx, 1
 11857 00005C31 8B5E06                   mov  bx, [bp+6]
 11858 00005C34 B80040                   mov  ax, 16384
 11859 00005C37 E899FF                   call DosInt
 11860                                  
 11861                                  ;-1027 int writeRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x4000; DosInt();}
 11862 00005C3A C9                       LEAVE
 11863 00005C3B C3                       ret
 11864                                  ; ENDP
 11865                                  ;Number of CALLs:    2 : fcloseR
 11866                                  
 11867                                  fcloseR:  ; *** PROC ***
 11868                                  ;Function : fcloseR, Number of local variables: 1
 11869                                  ;   # type sign width addr used name   list of local variables
 11870                                  ;  200 var sign word  1027 NULL fd = bp+4;
 11871 00005C3C C8000000                 ENTER  0,0
 11872 00005C40 8B5E04                   mov  bx, [bp+4]
 11873 00005C43 B8003E                   mov  ax, 15872
 11874 00005C46 CD21                     int  33
 11875                                  
 11876                                  ;-1028 int exitR(char c) {ah=0x4C; al=c; inth 0x21; }
 11877 00005C48 C9                       LEAVE
 11878 00005C49 C3                       ret
 11879                                  ; ENDP
 11880                                  ;Number of CALLs:    5 : exitR
 11881                                  
 11882                                  exitR:  ; *** PROC ***
 11883                                  ;Function : exitR, Number of local variables: 1
 11884                                  ;   # type sign width addr used name   list of local variables
 11885                                  ;  200 var sign byte  1028 NULL c = bp+4;
 11886 00005C4A C8000000                 ENTER  0,0
 11887 00005C4E B44C                     mov  ah, 76
 11888 00005C50 8A4604                   mov  al, [bp+4]
 11889 00005C53 CD21                     int  33
 11890                                  
 11891                                  ;-1029 int setdta(char *s) {dx=s; ah=0x1A; inth 0x21; }
 11892 00005C55 C9                       LEAVE
 11893 00005C56 C3                       ret
 11894                                  ; ENDP
 11895                                  ;End of archive file. 
 11896                                   
 11897                                  ; missing functions:  All FUNCTIONs in place
 11898 00005C57 E80000                  LastFunctionByt:db 0E8h, 0, 0
 11899 00005C5A 58                      pop ax
 11900 00005C5B C3                      ret
 11901                                   
 11902                                  ;   # type sign width  adr used name   list of global variables
 11903                                  
 11904                                  ;    1 arr sign byte     2    2 Version1[16]
 11905                                  ;    2 var sign byte     5    3 BSS
 11906                                  ;    3 var sign byte     5   25 NASM
 11907                                  ;    4 var sign byte     5    5 LIST
 11908                                  ;    5 def unsg byte     6    - LSTART=200
 11909                                  ;    6 def unsg byte     7    - VARMAX=300
 11910                                  ;    7 def unsg byte     8    - GNAMEMAX=4800
 11911                                  ;    8 def unsg byte     9    - FUNCMAX=300
 11912                                  ;    9 def unsg byte    10    - FNAMEMAX=4800
 11913                                  ;   10 def unsg byte    11    - CALLMAX=2000
 11914                                  ;   11 def unsg byte    12    - IDLENMAX=15
 11915                                  ;   12 def unsg byte    14    - T_NAME=256
 11916                                  ;   13 def unsg byte    15    - T_CONST=257
 11917                                  ;   14 def unsg byte    16    - T_STRING=258
 11918                                  ;   15 def unsg byte    17    - T_INCLUDE=510
 11919                                  ;   16 def unsg byte    18    - T_DEFINE=511
 11920                                  ;   17 def unsg byte    19    - T_RETURN=512
 11921                                  ;   18 def unsg byte    20    - T_IF=513
 11922                                  ;   19 def unsg byte    21    - T_ELSE=514
 11923                                  ;   20 def unsg byte    22    - T_WHILE=515
 11924                                  ;   21 def unsg byte    23    - T_DO=516
 11925                                  ;   22 def unsg byte    24    - T_INT=517
 11926                                  ;   23 def unsg byte    25    - T_ASM=518
 11927                                  ;   24 def unsg byte    26    - T_ASMBLOCK=519
 11928                                  ;   25 def unsg byte    27    - T_EMIT=520
 11929                                  ;   26 def unsg byte    28    - T_GOTO=521
 11930                                  ;   27 def unsg byte    29    - T_VOID=529
 11931                                  ;   28 def unsg byte    30    - T_CHAR=530
 11932                                  ;   29 def unsg byte    31    - T_SIGNED=531
 11933                                  ;   30 def unsg byte    32    - T_UNSIGNED=532
 11934                                  ;   31 def unsg byte    33    - T_LONG=533
 11935                                  ;   32 def unsg byte    34    - T_SHORT=534
 11936                                  ;   33 def unsg byte    36    - T_UINT32=545
 11937                                  ;   34 def unsg byte    38    - T_INTH=600
 11938                                  ;   35 def unsg byte    39    - T_IFCARRY=601
 11939                                  ;   36 def unsg byte    40    - T_IFZERO=602
 11940                                  ;   37 def unsg byte    41    - T_EQ=806
 11941                                  ;   38 def unsg byte    42    - T_NE=807
 11942                                  ;   39 def unsg byte    43    - T_GE=811
 11943                                  ;   40 def unsg byte    44    - T_LE=824
 11944                                  ;   41 def unsg byte    45    - T_PLUSPLUS=1219
 11945                                  ;   42 def unsg byte    46    - T_MINUSMINUS=1225
 11946                                  ;   43 def unsg byte    47    - T_PLUSASS=1230
 11947                                  ;   44 def unsg byte    48    - T_MINUSASS=1231
 11948                                  ;   45 def unsg byte    49    - T_MULASS=1232
 11949                                  ;   46 def unsg byte    50    - T_DIVASS=1233
 11950                                  ;   47 def unsg byte    51    - T_ANDASS=1234
 11951                                  ;   48 def unsg byte    52    - T_ORASS=1235
 11952                                  ;   49 def unsg byte    53    - T_LESSLESS=1240
 11953                                  ;   50 def unsg byte    54    - T_GREATGREAT=1241
 11954                                  ;   51 def unsg byte    55    - COMAX=3000
 11955                                  ;   52 def unsg byte    56    - CMDLENMAX=67
 11956                                  ;   53 var unsg word    57    3 ORGDATAORIG
 11957                                  ;   54 var unsg word    57   11 orgData
 11958                                  ;   55 arr sign byte    58    4 co[3000]
 11959                                  ;   56 var sign word    58    4 maxco
 11960                                  ;   57 var sign word    58    3 maxco1
 11961                                  ;   58 arr sign byte    59    2 coname[67]
 11962                                  ;   59 ptr sign byte    59    5 cloc
 11963                                  ;   60 var sign word    60    7 fdin
 11964                                  ;   61 var sign word    60    7 fdout
 11965                                  ;   62 arr sign byte    60  114 symbol[128]
 11966                                  ;   63 arr sign byte    61   12 fname[67]
 11967                                  ;   64 arr sign byte    61   12 namein[67]
 11968                                  ;   65 arr sign byte    62    7 namelst[67]
 11969                                  ;   66 arr sign byte    62    5 archivename[67]
 11970                                  ;   67 var sign word    63   52 token
 11971                                  ;   68 var sign byte    63    2 globC
 11972                                  ;   69 var sign word    63    3 spalte
 11973                                  ;   70 var sign byte    64   28 thechar
 11974                                  ;   71 var sign word    64    9 iscmp
 11975                                  ;   72 var sign word    64    4 nconst
 11976                                  ;   73 var sign word    65    3 nreturn
 11977                                  ;   74 var sign word    65   16 nlabel
 11978                                  ;   75 var sign word    65    3 callrecursive
 11979                                  ;   76 var sign word    66   24 GTop
 11980                                  ;   77 var sign word    66   20 LTop
 11981                                  ;   78 var unsg word    67   45 lexval
 11982                                  ;   79 var sign word    68    6 typei
 11983                                  ;   80 var sign byte    68    8 istype
 11984                                  ;   81 arr sign byte    68   11 GType[300]
 11985                                  ;   82 var sign word    69    6 signi
 11986                                  ;   83 var sign byte    69    6 issign
 11987                                  ;   84 arr sign byte    69    5 GSign[300]
 11988                                  ;   85 var sign word    70    9 widthi
 11989                                  ;   86 var sign byte    70   20 iswidth
 11990                                  ;   87 arr sign byte    70    5 GWidth[300]
 11991                                  ;   88 arr sign word    71    4 GAdr[300]
 11992                                  ;   89 arr sign word    71    6 GUsed[300]
 11993                                  ;   90 var sign word    72   26 wi
 11994                                  ;   91 arr sign word    72   11 GData[300]
 11995                                  ;   92 arr sign byte    72    2 GNameField[4800]
 11996                                  ;   93 var sign word    73   17 FTop
 11997                                  ;   94 var sign word    73    9 CTop
 11998                                  ;   95 arr sign byte    74    2 FType[300]
 11999                                  ;   96 arr sign byte    74    5 CType[2000]
 12000                                  ;   97 arr sign word    75    4 FAdr[300]
 12001                                  ;   98 arr sign word    75    5 CAdr[2000]
 12002                                  ;   99 arr sign word    76    4 FCalls[300]
 12003                                  ;  100 arr sign byte    77    5 FNameField[4800]
 12004                                  ;  101 arr sign byte    78    9 NameA[32]
 12005                                  ;  102 arr sign byte    79    5 fgetsdest[128]
 12006                                  ;  103 ptr unsg byte    79    8 CNameTop
 12007                                  ;  104 ptr unsg byte    80   10 fgetsp
 12008                                  ;  105 var unsg word    80    4 segE
 12009                                  ;  106 var unsg word    81   12 lineno
 12010                                  ;  107 var unsg word    81    2 linenoinclude
 12011                                  ;  108 ptr unsg byte    82   19 pt
 12012                                  ;  109 ptr unsg byte    82    8 p1
 12013                                  ;  110 var sign word    83   10 DOS_ERR
 12014                                  ;  111 var sign word    83    5 DOS_NoBytes
 12015                                  ;  112 var sign byte    83    3 DOS_ByteRead
 12016                                  ;  113 var sign word    85 NULL tt1
 12017                                  ;  114 var sign word    85 NULL tt2
 12018                                  ;  115 var sign dwrd    85    1 ex
 12019                                  ;  116 arr sign byte    99    2 doglobName[15]
 12020                                  ;  117 var sign word   249    5 mod1
 12021                                  ;  118 var sign word   249   12 ireg1
 12022                                  ;  119 var sign word   249    6 idx1
 12023                                  ;  120 var sign word   249    1 ids1
 12024                                  ;  121 var sign word   249    4 idw1
 12025                                  ;  122 var sign word   249    2 idt1
 12026                                  ;  123 var sign word   249 NULL val1
 12027                                  ;  124 var sign word   250    2 mod2
 12028                                  ;  125 var sign word   250    6 ireg2
 12029                                  ;  126 var sign word   250    6 idx2
 12030                                  ;  127 var sign word   250    1 ids2
 12031                                  ;  128 var sign word   250    4 idw2
 12032                                  ;  129 var sign word   250    2 idt2
 12033                                  ;  130 var sign word   250    2 val2
 12034                                  ;  131 arr sign byte   318    9 ops[5]
 12035                                  ;  132 arr sign byte   360    3 printregstr[74]
 12036                                  ;  133 var sign word   368    1 evalue
 12037                                  ;  134 var sign word   368    1 exprtype
 12038                                  ;  135 arr sign word   520    2 docalltype[10]
 12039                                  ;  136 arr sign word   520    2 docallvalue[10]
 12040                                  ;  137 arr sign byte   521    2 procname[17]
 12041                                  ;  138 ptr sign byte   576    1 arglen
 12042                                  ;  139 ptr sign byte   576    3 argv
 12043                                  ;  140 var sign byte   624    4 wasfunction
 12044                                  ;  141 arr sign byte   756    2 symboltemp[80]
 12045                                  ;  142 var unsg word   939    1 MAXUI
 12046                                  
 12047                                  
 12048                                  ;   # Calls Line Width  Name   list of functions
 12049                                  
 12050                                  ;    0    1   86   ttt
 12051                                  ;    1    4   93   a
 12052                                  ;    2   21   94   v
 12053                                  ;    3    4   96   checknamelen
 12054                                  ;    4    1  100   doglob
 12055                                  ;    5   12  151   gettypes
 12056                                  ;    6    9  160   adrofname
 12057                                  ;    7    7  161   adrF
 12058                                  ;    8    4  163   printName
 12059                                  ;    9   12  167   searchname
 12060                                  ;   10    3  171   checkName
 12061                                  ;   11   10  176   typeName
 12062                                  ;   12    3  186   name1
 12063                                  ;   13    1  188   storecall
 12064                                  ;   14    2  194   storefunc
 12065                                  ;   15    2  198   addlocal
 12066                                  ;   16    1  204   checkFunction
 12067                                  ;   17    2  207   dofunc
 12068                                  ;   18    1  242   isvariable
 12069                                  ;   19    3  252   pexpr
 12070                                  ;   20    1  259   constantexpr
 12071                                  ;   21    3  270   exprstart
 12072                                  ;   22    1  272   expr2
 12073                                  ;   23    3  319   doreg1
 12074                                  ;   24    6  338   checkreg
 12075                                  ;   25    6  363   printreg
 12076                                  ;   26    2  369   expr
 12077                                  ;   27    4  418   compoundass
 12078                                  ;   28    2  425   dovar1
 12079                                  ;   29    8  446   rterm
 12080                                  ;   30    1  459   isreg
 12081                                  ;   31   15  477   doreg
 12082                                  ;   32    1  483   doassign
 12083                                  ;   33    1  501   domul
 12084                                  ;   34    2  505   doidiv
 12085                                  ;   35    1  518   domod
 12086                                  ;   36    1  522   docall1
 12087                                  ;   37 NULL  564   main
 12088                                  ;   38    3  575   getfirstchar
 12089                                  ;   39    1  577   getarg
 12090                                  ;   40    2  600   parse
 12091                                  ;   41    2  609   checkcalls
 12092                                  ;   42    1  625   doar
 12093                                  ;   43    1  652   getfunctionhead
 12094                                  ;   44    1  659   doinclude
 12095                                  ;   45    1  670   dodefine
 12096                                  ;   46    8  689   stmt
 12097                                  ;   47    1  713   doemit
 12098                                  ;   48    3  717   cmpneg
 12099                                  ;   49    9  730   prlabel
 12100                                  ;   50    3  731   prjump
 12101                                  ;   51    1  732   doif
 12102                                  ;   52    1  737   doifcarry
 12103                                  ;   53    1  740   doifzero
 12104                                  ;   54    1  743   dodo
 12105                                  ;   55    1  747   dowhile
 12106                                  ;   56    4  750   isrelational
 12107                                  ;   57   22  757   getlex
 12108                                  ;   58    1  814   convertdefine
 12109                                  ;   59    1  821   getdigit
 12110                                  ;   60    1  830   getstring
 12111                                  ;   61   31  833   next
 12112                                  ;   62   84  834   istoken
 12113                                  ;   63   38  835   expect
 12114                                  ;   64    6  838   eprc
 12115                                  ;   65    5  839   eprs
 12116                                  ;   66   41  840   prc
 12117                                  ;   67    3  842   prscomment
 12118                                  ;   68    8  844   prnl
 12119                                  ;   69  283  846   prs
 12120                                  ;   70    2  851   eprnum
 12121                                  ;   71   18  853   pint1
 12122                                  ;   72   29  855   prunsign1
 12123                                  ;   73   26  858   printint51
 12124                                  ;   74    2  862   fgets1
 12125                                  ;   75    1  866   printinputline
 12126                                  ;   76    2  874   end1
 12127                                  ;   77   50  875   error1
 12128                                  ;   78    2  884   listproc
 12129                                  ;   79    2  892   listvar
 12130                                  ;   80    1  908   listcall
 12131                                  ;   81    1  911   calllisting
 12132                                  ;   82    1  917   countcalls
 12133                                  ;   83    1  925   listfunc
 12134                                  ;   84    1  929   funclisting
 12135                                  ;   85    1  940   epilog
 12136                                  ;   86    1  972   setblock
 12137                                  ;   87    1  974   allocmem
 12138                                  ;   88 NULL  978   copyF
 12139                                  ;   89    1  984   to_far
 12140                                  ;   90    4  992   from_far
 12141                                  ;   91    4 1001   writetty
 12142                                  ;   92    3 1002   putch
 12143                                  ;   93   12 1003   cputs
 12144                                  ;   94    4 1004   mkneg
 12145                                  ;   95    2 1005   pint
 12146                                  ;   96    1 1007   toupper
 12147                                  ;   97    8 1008   strlen
 12148                                  ;   98   25 1009   strcpy
 12149                                  ;   99    1 1010   instr1
 12150                                  ;  100    2 1011   instr2
 12151                                  ;  101    3 1012   digit
 12152                                  ;  102    3 1013   letter
 12153                                  ;  103   83 1016   eqstr
 12154                                  ;  104    1 1019   strcat1
 12155                                  ;  105    7 1020   DosInt
 12156                                  ;  106    3 1021   openR
 12157                                  ;  107    1 1022   creatR
 12158                                  ;  108    1 1023   readR
 12159                                  ;  109    1 1024   readRL
 12160                                  ;  110    1 1025   fputcR
 12161                                  ;  111    2 1027   fcloseR
 12162                                  ;  112    5 1028   exitR
 12163                                  ;  113 NULL 1029   LastFunctionByt
 12164                                  
 12165                                  ;    #  addr name   list of CALLs
 12166                                  
 12167                                  ;    0     0 ttt
 12168                                  ;    1     4 prs
 12169                                  ;    2     8 printName
 12170                                  ;    3    18 prc
 12171                                  ;    4    22 printName
 12172                                  ;    5    32 prc
 12173                                  ;    6    36 strlen
 12174                                  ;    7    43 error1
 12175                                  ;    8    50 error1
 12176                                  ;    9    57 error1
 12177                                  ;   10    64 checknamelen
 12178                                  ;   11    77 checkName
 12179                                  ;   12    87 error1
 12180                                  ;   13    94 istoken
 12181                                  ;   14   102 istoken
 12182                                  ;   15   110 prs
 12183                                  ;   16   114 prunsign1
 12184                                  ;   17   124 prs
 12185                                  ;   18   128 prunsign1
 12186                                  ;   19   138 prs
 12187                                  ;   20   142 prs
 12188                                  ;   21   146 prs
 12189                                  ;   22   150 prs
 12190                                  ;   23   154 prs
 12191                                  ;   24   158 prs
 12192                                  ;   25   162 prs
 12193                                  ;   26   166 prs
 12194                                  ;   27   170 prunsign1
 12195                                  ;   28   180 prs
 12196                                  ;   29   184 prs
 12197                                  ;   30   188 prs
 12198                                  ;   31   192 expect
 12199                                  ;   32   199 expect
 12200                                  ;   33   206 error1
 12201                                  ;   34   213 prs
 12202                                  ;   35   217 prs
 12203                                  ;   36   221 prs
 12204                                  ;   37   225 strcpy
 12205                                  ;   38   232 expect
 12206                                  ;   39   239 istoken
 12207                                  ;   40   247 prc
 12208                                  ;   41   251 prscomment
 12209                                  ;   42   262 prc
 12210                                  ;   43   266 prs
 12211                                  ;   44   270 strlen
 12212                                  ;   45   277 istoken
 12213                                  ;   46   285 prc
 12214                                  ;   47   289 expect
 12215                                  ;   48   296 prunsign1
 12216                                  ;   49   306 istoken
 12217                                  ;   50   314 expect
 12218                                  ;   51   321 error1
 12219                                  ;   52   328 prs
 12220                                  ;   53   332 prs
 12221                                  ;   54   336 prs
 12222                                  ;   55   340 prs
 12223                                  ;   56   344 prs
 12224                                  ;   57   348 prs
 12225                                  ;   58   352 istoken
 12226                                  ;   59   360 prc
 12227                                  ;   60   364 istoken
 12228                                  ;   61   372 expect
 12229                                  ;   62   379 prunsign1
 12230                                  ;   63   389 prunsign1
 12231                                  ;   64   399 adrofname
 12232                                  ;   65   409 strcpy
 12233                                  ;   66   416 strcpy
 12234                                  ;   67   423 expect
 12235                                  ;   68   430 adrF
 12236                                  ;   69   435 adrofname
 12237                                  ;   70   445 prs
 12238                                  ;   71   449 prs
 12239                                  ;   72   453 prc
 12240                                  ;   73   457 pint1
 12241                                  ;   74   463 prc
 12242                                  ;   75   467 checkName
 12243                                  ;   76   477 error1
 12244                                  ;   77   484 adrofname
 12245                                  ;   78   494 eqstr
 12246                                  ;   79   500 adrofname
 12247                                  ;   80   510 eqstr
 12248                                  ;   81   516 istoken
 12249                                  ;   82   524 istoken
 12250                                  ;   83   532 istoken
 12251                                  ;   84   540 istoken
 12252                                  ;   85   548 istoken
 12253                                  ;   86   556 istoken
 12254                                  ;   87   564 istoken
 12255                                  ;   88   572 istoken
 12256                                  ;   89   580 istoken
 12257                                  ;   90   588 istoken
 12258                                  ;   91   596 name1
 12259                                  ;   92   602 error1
 12260                                  ;   93   609 getlex
 12261                                  ;   94   616 error1
 12262                                  ;   95   623 error1
 12263                                  ;   96   630 strlen
 12264                                  ;   97   637 to_far
 12265                                  ;   98   644 error1
 12266                                  ;   99   651 adrF
 12267                                  ;  100   656 strcpy
 12268                                  ;  101   663 error1
 12269                                  ;  102   670 checkName
 12270                                  ;  103   680 error1
 12271                                  ;  104   687 adrF
 12272                                  ;  105   692 strcpy
 12273                                  ;  106   699 adrF
 12274                                  ;  107   704 eqstr
 12275                                  ;  108   710 checknamelen
 12276                                  ;  109   723 strcpy
 12277                                  ;  110   730 checkFunction
 12278                                  ;  111   744 error1
 12279                                  ;  112   751 storefunc
 12280                                  ;  113   761 prs
 12281                                  ;  114   765 prs
 12282                                  ;  115   769 prs
 12283                                  ;  116   773 expect
 12284                                  ;  117   780 istoken
 12285                                  ;  118   788 typeName
 12286                                  ;  119   797 addlocal
 12287                                  ;  120   806 istoken
 12288                                  ;  121   814 expect
 12289                                  ;  122   821 expect
 12290                                  ;  123   828 isvariable
 12291                                  ;  124   839 typeName
 12292                                  ;  125   848 checknamelen
 12293                                  ;  126   861 addlocal
 12294                                  ;  127   870 istoken
 12295                                  ;  128   878 expect
 12296                                  ;  129   885 expect
 12297                                  ;  130   892 istoken
 12298                                  ;  131   900 expect
 12299                                  ;  132   907 listproc
 12300                                  ;  133   916 prs
 12301                                  ;  134   920 mkneg
 12302                                  ;  135   926 pint1
 12303                                  ;  136   932 prs
 12304                                  ;  137   936 istoken
 12305                                  ;  138   944 stmt
 12306                                  ;  139   949 prs
 12307                                  ;  140   953 prs
 12308                                  ;  141   957 prs
 12309                                  ;  142   961 prs
 12310                                  ;  143   965 prs
 12311                                  ;  144   969 strlen
 12312                                  ;  145   976 strcpy
 12313                                  ;  146   983 expect
 12314                                  ;  147   990 eqstr
 12315                                  ;  148   996 constantexpr
 12316                                  ;  149  1009 checkreg
 12317                                  ;  150  1018 doreg1
 12318                                  ;  151  1025 exprstart
 12319                                  ;  152  1035 prs
 12320                                  ;  153  1039 prs
 12321                                  ;  154  1043 expect
 12322                                  ;  155  1050 getlex
 12323                                  ;  156  1057 typeName
 12324                                  ;  157  1066 searchname
 12325                                  ;  158  1077 gettypes
 12326                                  ;  159  1086 isrelational
 12327                                  ;  160  1099 error1
 12328                                  ;  161  1106 expect
 12329                                  ;  162  1113 prs
 12330                                  ;  163  1117 prs
 12331                                  ;  164  1121 gettypes
 12332                                  ;  165  1130 prs
 12333                                  ;  166  1134 prs
 12334                                  ;  167  1138 prs
 12335                                  ;  168  1142 v
 12336                                  ;  169  1144 prs
 12337                                  ;  170  1148 prunsign1
 12338                                  ;  171  1158 cmpneg
 12339                                  ;  172  1165 prs
 12340                                  ;  173  1169 expect
 12341                                  ;  174  1176 eqstr
 12342                                  ;  175  1182 expr2
 12343                                  ;  176  1188 expr
 12344                                  ;  177  1193 getlex
 12345                                  ;  178  1200 typeName
 12346                                  ;  179  1209 error1
 12347                                  ;  180  1216 checkreg
 12348                                  ;  181  1225 doreg1
 12349                                  ;  182  1232 searchname
 12350                                  ;  183  1243 gettypes
 12351                                  ;  184  1252 error1
 12352                                  ;  185  1259 isrelational
 12353                                  ;  186  1272 error1
 12354                                  ;  187  1279 istoken
 12355                                  ;  188  1287 error1
 12356                                  ;  189  1294 istoken
 12357                                  ;  190  1302 prs
 12358                                  ;  191  1306 prs
 12359                                  ;  192  1310 prs
 12360                                  ;  193  1314 prs
 12361                                  ;  194  1318 prs
 12362                                  ;  195  1322 prs
 12363                                  ;  196  1326 v
 12364                                  ;  197  1328 prs
 12365                                  ;  198  1332 prunsign1
 12366                                  ;  199  1342 adrofname
 12367                                  ;  200  1352 prs
 12368                                  ;  201  1356 prs
 12369                                  ;  202  1360 typeName
 12370                                  ;  203  1369 checkreg
 12371                                  ;  204  1378 prs
 12372                                  ;  205  1382 printreg
 12373                                  ;  206  1391 v
 12374                                  ;  207  1393 prs
 12375                                  ;  208  1397 printreg
 12376                                  ;  209  1406 error1
 12377                                  ;  210  1413 searchname
 12378                                  ;  211  1424 gettypes
 12379                                  ;  212  1433 error1
 12380                                  ;  213  1440 prs
 12381                                  ;  214  1444 printreg
 12382                                  ;  215  1453 error1
 12383                                  ;  216  1460 prs
 12384                                  ;  217  1464 a
 12385                                  ;  218  1466 prs
 12386                                  ;  219  1470 prs
 12387                                  ;  220  1474 prs
 12388                                  ;  221  1478 prs
 12389                                  ;  222  1482 v
 12390                                  ;  223  1484 adrofname
 12391                                  ;  224  1494 prs
 12392                                  ;  225  1498 prs
 12393                                  ;  226  1502 error1
 12394                                  ;  227  1509 istoken
 12395                                  ;  228  1517 strcpy
 12396                                  ;  229  1524 istoken
 12397                                  ;  230  1532 strcpy
 12398                                  ;  231  1539 istoken
 12399                                  ;  232  1547 strcpy
 12400                                  ;  233  1554 istoken
 12401                                  ;  234  1562 strcpy
 12402                                  ;  235  1569 istoken
 12403                                  ;  236  1577 strcpy
 12404                                  ;  237  1584 istoken
 12405                                  ;  238  1592 strcpy
 12406                                  ;  239  1599 istoken
 12407                                  ;  240  1607 strcpy
 12408                                  ;  241  1614 getlex
 12409                                  ;  242  1621 isrelational
 12410                                  ;  243  1634 error1
 12411                                  ;  244  1641 strcpy
 12412                                  ;  245  1648 prnl
 12413                                  ;  246  1653 prs
 12414                                  ;  247  1657 prs
 12415                                  ;  248  1661 printreg
 12416                                  ;  249  1670 prs
 12417                                  ;  250  1674 istoken
 12418                                  ;  251  1682 prunsign1
 12419                                  ;  252  1692 typeName
 12420                                  ;  253  1701 checkreg
 12421                                  ;  254  1710 printreg
 12422                                  ;  255  1719 searchname
 12423                                  ;  256  1730 a
 12424                                  ;  257  1732 v
 12425                                  ;  258  1734 cmpneg
 12426                                  ;  259  1741 prs
 12427                                  ;  260  1745 expect
 12428                                  ;  261  1752 strlen
 12429                                  ;  262  1759 eqstr
 12430                                  ;  263  1765 eqstr
 12431                                  ;  264  1771 eqstr
 12432                                  ;  265  1777 eqstr
 12433                                  ;  266  1783 eqstr
 12434                                  ;  267  1789 eqstr
 12435                                  ;  268  1795 eqstr
 12436                                  ;  269  1801 eqstr
 12437                                  ;  270  1807 eqstr
 12438                                  ;  271  1813 eqstr
 12439                                  ;  272  1819 eqstr
 12440                                  ;  273  1825 eqstr
 12441                                  ;  274  1831 eqstr
 12442                                  ;  275  1837 eqstr
 12443                                  ;  276  1843 eqstr
 12444                                  ;  277  1849 eqstr
 12445                                  ;  278  1855 eqstr
 12446                                  ;  279  1861 eqstr
 12447                                  ;  280  1867 eqstr
 12448                                  ;  281  1873 eqstr
 12449                                  ;  282  1879 eqstr
 12450                                  ;  283  1885 eqstr
 12451                                  ;  284  1891 strlen
 12452                                  ;  285  1898 eqstr
 12453                                  ;  286  1904 eqstr
 12454                                  ;  287  1910 eqstr
 12455                                  ;  288  1916 eqstr
 12456                                  ;  289  1922 eqstr
 12457                                  ;  290  1928 eqstr
 12458                                  ;  291  1934 eqstr
 12459                                  ;  292  1940 eqstr
 12460                                  ;  293  1946 eqstr
 12461                                  ;  294  1952 prc
 12462                                  ;  295  1956 prc
 12463                                  ;  296  1960 prc
 12464                                  ;  297  1964 istoken
 12465                                  ;  298  1972 prs
 12466                                  ;  299  1976 prunsign1
 12467                                  ;  300  1986 typeName
 12468                                  ;  301  1995 checkreg
 12469                                  ;  302  2004 doreg1
 12470                                  ;  303  2011 docall1
 12471                                  ;  304  2019 isreg
 12472                                  ;  305  2025 searchname
 12473                                  ;  306  2036 gettypes
 12474                                  ;  307  2045 istoken
 12475                                  ;  308  2053 istoken
 12476                                  ;  309  2061 expect
 12477                                  ;  310  2068 searchname
 12478                                  ;  311  2079 expect
 12479                                  ;  312  2086 expect
 12480                                  ;  313  2093 gettypes
 12481                                  ;  314  2102 error1
 12482                                  ;  315  2109 istoken
 12483                                  ;  316  2117 error1
 12484                                  ;  317  2124 prs
 12485                                  ;  318  2128 prs
 12486                                  ;  319  2132 prs
 12487                                  ;  320  2136 prs
 12488                                  ;  321  2140 v
 12489                                  ;  322  2142 istoken
 12490                                  ;  323  2150 error1
 12491                                  ;  324  2157 prs
 12492                                  ;  325  2161 prs
 12493                                  ;  326  2165 prs
 12494                                  ;  327  2169 prs
 12495                                  ;  328  2173 v
 12496                                  ;  329  2175 istoken
 12497                                  ;  330  2183 compoundass
 12498                                  ;  331  2195 istoken
 12499                                  ;  332  2203 compoundass
 12500                                  ;  333  2215 istoken
 12501                                  ;  334  2223 compoundass
 12502                                  ;  335  2235 istoken
 12503                                  ;  336  2243 compoundass
 12504                                  ;  337  2255 istoken
 12505                                  ;  338  2263 error1
 12506                                  ;  339  2270 istoken
 12507                                  ;  340  2278 error1
 12508                                  ;  341  2285 istoken
 12509                                  ;  342  2293 expr
 12510                                  ;  343  2298 doassign
 12511                                  ;  344  2307 dovar1
 12512                                  ;  345  2314 istoken
 12513                                  ;  346  2322 rterm
 12514                                  ;  347  2328 istoken
 12515                                  ;  348  2336 rterm
 12516                                  ;  349  2342 istoken
 12517                                  ;  350  2350 rterm
 12518                                  ;  351  2356 istoken
 12519                                  ;  352  2364 rterm
 12520                                  ;  353  2370 istoken
 12521                                  ;  354  2378 rterm
 12522                                  ;  355  2384 istoken
 12523                                  ;  356  2392 rterm
 12524                                  ;  357  2398 istoken
 12525                                  ;  358  2406 domul
 12526                                  ;  359  2412 istoken
 12527                                  ;  360  2420 doidiv
 12528                                  ;  361  2427 istoken
 12529                                  ;  362  2435 domod
 12530                                  ;  363  2441 isrelational
 12531                                  ;  364  2454 rterm
 12532                                  ;  365  2460 cmpneg
 12533                                  ;  366  2467 error1
 12534                                  ;  367  2474 prnl
 12535                                  ;  368  2479 prs
 12536                                  ;  369  2483 prs
 12537                                  ;  370  2487 gettypes
 12538                                  ;  371  2496 prs
 12539                                  ;  372  2500 prs
 12540                                  ;  373  2504 prs
 12541                                  ;  374  2508 v
 12542                                  ;  375  2510 prs
 12543                                  ;  376  2514 expect
 12544                                  ;  377  2521 prunsign1
 12545                                  ;  378  2531 gettypes
 12546                                  ;  379  2540 prs
 12547                                  ;  380  2544 v
 12548                                  ;  381  2546 prnl
 12549                                  ;  382  2551 prs
 12550                                  ;  383  2555 prs
 12551                                  ;  384  2559 prs
 12552                                  ;  385  2563 prnl
 12553                                  ;  386  2568 prs
 12554                                  ;  387  2572 prs
 12555                                  ;  388  2576 a
 12556                                  ;  389  2578 prs
 12557                                  ;  390  2582 v
 12558                                  ;  391  2584 prs
 12559                                  ;  392  2588 prs
 12560                                  ;  393  2592 prs
 12561                                  ;  394  2596 prs
 12562                                  ;  395  2600 prs
 12563                                  ;  396  2604 prc
 12564                                  ;  397  2608 printName
 12565                                  ;  398  2618 prs
 12566                                  ;  399  2622 prnl
 12567                                  ;  400  2627 prs
 12568                                  ;  401  2631 prs
 12569                                  ;  402  2635 prs
 12570                                  ;  403  2639 prs
 12571                                  ;  404  2643 v
 12572                                  ;  405  2645 istoken
 12573                                  ;  406  2653 prnl
 12574                                  ;  407  2658 prs
 12575                                  ;  408  2662 prs
 12576                                  ;  409  2666 prs
 12577                                  ;  410  2670 prs
 12578                                  ;  411  2674 prunsign1
 12579                                  ;  412  2684 typeName
 12580                                  ;  413  2693 searchname
 12581                                  ;  414  2704 istoken
 12582                                  ;  415  2712 searchname
 12583                                  ;  416  2723 expect
 12584                                  ;  417  2730 expect
 12585                                  ;  418  2737 gettypes
 12586                                  ;  419  2746 error1
 12587                                  ;  420  2753 eqstr
 12588                                  ;  421  2759 dovar1
 12589                                  ;  422  2766 eqstr
 12590                                  ;  423  2772 doreg
 12591                                  ;  424  2778 eqstr
 12592                                  ;  425  2784 doreg
 12593                                  ;  426  2790 eqstr
 12594                                  ;  427  2796 doreg
 12595                                  ;  428  2802 eqstr
 12596                                  ;  429  2808 doreg
 12597                                  ;  430  2814 eqstr
 12598                                  ;  431  2820 doreg
 12599                                  ;  432  2826 eqstr
 12600                                  ;  433  2832 doreg
 12601                                  ;  434  2838 eqstr
 12602                                  ;  435  2844 doreg
 12603                                  ;  436  2850 eqstr
 12604                                  ;  437  2856 doreg
 12605                                  ;  438  2862 eqstr
 12606                                  ;  439  2868 doreg
 12607                                  ;  440  2874 eqstr
 12608                                  ;  441  2880 doreg
 12609                                  ;  442  2886 eqstr
 12610                                  ;  443  2892 doreg
 12611                                  ;  444  2898 eqstr
 12612                                  ;  445  2904 doreg
 12613                                  ;  446  2910 eqstr
 12614                                  ;  447  2916 doreg
 12615                                  ;  448  2922 eqstr
 12616                                  ;  449  2928 doreg
 12617                                  ;  450  2934 eqstr
 12618                                  ;  451  2940 doreg
 12619                                  ;  452  2946 expect
 12620                                  ;  453  2953 prs
 12621                                  ;  454  2957 prs
 12622                                  ;  455  2961 prs
 12623                                  ;  456  2965 istoken
 12624                                  ;  457  2973 prunsign1
 12625                                  ;  458  2983 istoken
 12626                                  ;  459  2991 searchname
 12627                                  ;  460  3002 v
 12628                                  ;  461  3004 error1
 12629                                  ;  462  3011 gettypes
 12630                                  ;  463  3020 prs
 12631                                  ;  464  3024 v
 12632                                  ;  465  3026 prs
 12633                                  ;  466  3030 prs
 12634                                  ;  467  3034 prs
 12635                                  ;  468  3038 a
 12636                                  ;  469  3040 prs
 12637                                  ;  470  3044 prs
 12638                                  ;  471  3048 prunsign1
 12639                                  ;  472  3058 v
 12640                                  ;  473  3060 prs
 12641                                  ;  474  3064 prs
 12642                                  ;  475  3068 printName
 12643                                  ;  476  3078 prs
 12644                                  ;  477  3082 prs
 12645                                  ;  478  3086 prs
 12646                                  ;  479  3090 prs
 12647                                  ;  480  3094 prs
 12648                                  ;  481  3098 v
 12649                                  ;  482  3100 prs
 12650                                  ;  483  3104 prs
 12651                                  ;  484  3108 prs
 12652                                  ;  485  3112 prs
 12653                                  ;  486  3116 v
 12654                                  ;  487  3118 prs
 12655                                  ;  488  3122 prs
 12656                                  ;  489  3126 prs
 12657                                  ;  490  3130 prs
 12658                                  ;  491  3134 v
 12659                                  ;  492  3136 prs
 12660                                  ;  493  3140 rterm
 12661                                  ;  494  3146 istoken
 12662                                  ;  495  3154 prs
 12663                                  ;  496  3158 prunsign1
 12664                                  ;  497  3168 prs
 12665                                  ;  498  3172 error1
 12666                                  ;  499  3179 istoken
 12667                                  ;  500  3187 prs
 12668                                  ;  501  3191 prunsign1
 12669                                  ;  502  3201 prs
 12670                                  ;  503  3205 prs
 12671                                  ;  504  3209 typeName
 12672                                  ;  505  3218 searchname
 12673                                  ;  506  3229 error1
 12674                                  ;  507  3236 gettypes
 12675                                  ;  508  3245 error1
 12676                                  ;  509  3252 error1
 12677                                  ;  510  3259 prs
 12678                                  ;  511  3263 v
 12679                                  ;  512  3265 prs
 12680                                  ;  513  3269 prs
 12681                                  ;  514  3273 doidiv
 12682                                  ;  515  3280 prs
 12683                                  ;  516  3284 checknamelen
 12684                                  ;  517  3297 strcpy
 12685                                  ;  518  3304 storecall
 12686                                  ;  519  3314 expect
 12687                                  ;  520  3321 istoken
 12688                                  ;  521  3329 error1
 12689                                  ;  522  3336 istoken
 12690                                  ;  523  3344 istoken
 12691                                  ;  524  3352 eprs
 12692                                  ;  525  3357 eprs
 12693                                  ;  526  3362 eprc
 12694                                  ;  527  3367 eprnum
 12695                                  ;  528  3374 eprs
 12696                                  ;  529  3379 eprc
 12697                                  ;  530  3384 eprs
 12698                                  ;  531  3389 eprc
 12699                                  ;  532  3394 eprs
 12700                                  ;  533  3399 istoken
 12701                                  ;  534  3407 name1
 12702                                  ;  535  3413 searchname
 12703                                  ;  536  3424 istoken
 12704                                  ;  537  3432 checkreg
 12705                                  ;  538  3441 searchname
 12706                                  ;  539  3452 error1
 12707                                  ;  540  3459 istoken
 12708                                  ;  541  3467 expect
 12709                                  ;  542  3474 prs
 12710                                  ;  543  3478 pint1
 12711                                  ;  544  3484 prs
 12712                                  ;  545  3488 prs
 12713                                  ;  546  3492 prs
 12714                                  ;  547  3496 prc
 12715                                  ;  548  3500 pint1
 12716                                  ;  549  3506 prs
 12717                                  ;  550  3510 prs
 12718                                  ;  551  3514 v
 12719                                  ;  552  3516 prs
 12720                                  ;  553  3520 gettypes
 12721                                  ;  554  3529 prs
 12722                                  ;  555  3533 prs
 12723                                  ;  556  3537 v
 12724                                  ;  557  3539 prs
 12725                                  ;  558  3543 prs
 12726                                  ;  559  3547 v
 12727                                  ;  560  3549 prs
 12728                                  ;  561  3553 prs
 12729                                  ;  562  3557 printreg
 12730                                  ;  563  3566 prs
 12731                                  ;  564  3570 prs
 12732                                  ;  565  3574 prs
 12733                                  ;  566  3578 pint1
 12734                                  ;  567  3584 getarg
 12735                                  ;  568  3591 setblock
 12736                                  ;  569  3600 error1
 12737                                  ;  570  3607 allocmem
 12738                                  ;  571  3616 error1
 12739                                  ;  572  3623 getfirstchar
 12740                                  ;  573  3636 parse
 12741                                  ;  574  3642 checkcalls
 12742                                  ;  575  3653 epilog
 12743                                  ;  576  3660 fgets1
 12744                                  ;  577  3667 cputs
 12745                                  ;  578  3673 cputs
 12746                                  ;  579  3679 readRL
 12747                                  ;  580  3686 prnl
 12748                                  ;  581  3691 strcpy
 12749                                  ;  582  3698 instr2
 12750                                  ;  583  3705 strcat1
 12751                                  ;  584  3713 toupper
 12752                                  ;  585  3721 instr2
 12753                                  ;  586  3728 strcpy
 12754                                  ;  587  3735 cputs
 12755                                  ;  588  3741 exitR
 12756                                  ;  589  3747 strcpy
 12757                                  ;  590  3754 strlen
 12758                                  ;  591  3761 openR
 12759                                  ;  592  3767 cputs
 12760                                  ;  593  3773 cputs
 12761                                  ;  594  3779 exitR
 12762                                  ;  595  3785 creatR
 12763                                  ;  596  3792 cputs
 12764                                  ;  597  3798 cputs
 12765                                  ;  598  3804 exitR
 12766                                  ;  599  3810 prs
 12767                                  ;  600  3814 prs
 12768                                  ;  601  3818 prs
 12769                                  ;  602  3822 pint1
 12770                                  ;  603  3828 prs
 12771                                  ;  604  3832 prs
 12772                                  ;  605  3836 prs
 12773                                  ;  606  3840 prs
 12774                                  ;  607  3844 prs
 12775                                  ;  608  3848 prs
 12776                                  ;  609  3852 prs
 12777                                  ;  610  3856 prs
 12778                                  ;  611  3860 getlex
 12779                                  ;  612  3867 istoken
 12780                                  ;  613  3875 istoken
 12781                                  ;  614  3883 dodefine
 12782                                  ;  615  3892 istoken
 12783                                  ;  616  3900 doinclude
 12784                                  ;  617  3910 error1
 12785                                  ;  618  3917 typeName
 12786                                  ;  619  3926 dofunc
 12787                                  ;  620  3933 doglob
 12788                                  ;  621  3940 prs
 12789                                  ;  622  3944 from_far
 12790                                  ;  623  3953 adrF
 12791                                  ;  624  3958 eqstr
 12792                                  ;  625  3964 prs
 12793                                  ;  626  3968 prs
 12794                                  ;  627  3972 doar
 12795                                  ;  628  3977 prs
 12796                                  ;  629  3981 cputs
 12797                                  ;  630  3987 cputs
 12798                                  ;  631  3993 pint
 12799                                  ;  632  3998 prs
 12800                                  ;  633  4002 printint51
 12801                                  ;  634  4013 openR
 12802                                  ;  635  4019 cputs
 12803                                  ;  636  4025 cputs
 12804                                  ;  637  4031 exitR
 12805                                  ;  638  4037 prs
 12806                                  ;  639  4041 prs
 12807                                  ;  640  4045 getfirstchar
 12808                                  ;  641  4058 getfunctionhead
 12809                                  ;  642  4074 from_far
 12810                                  ;  643  4083 eqstr
 12811                                  ;  644  4089 prs
 12812                                  ;  645  4093 printint51
 12813                                  ;  646  4104 prs
 12814                                  ;  647  4108 prs
 12815                                  ;  648  4112 dofunc
 12816                                  ;  649  4119 prs
 12817                                  ;  650  4123 checkcalls
 12818                                  ;  651  4134 putch
 12819                                  ;  652  4140 cputs
 12820                                  ;  653  4146 error1
 12821                                  ;  654  4153 getlex
 12822                                  ;  655  4160 istoken
 12823                                  ;  656  4168 getlex
 12824                                  ;  657  4175 prs
 12825                                  ;  658  4179 prs
 12826                                  ;  659  4183 openR
 12827                                  ;  660  4189 prs
 12828                                  ;  661  4193 prs
 12829                                  ;  662  4197 error1
 12830                                  ;  663  4204 parse
 12831                                  ;  664  4210 prs
 12832                                  ;  665  4214 prs
 12833                                  ;  666  4218 getfirstchar
 12834                                  ;  667  4231 getlex
 12835                                  ;  668  4238 eqstr
 12836                                  ;  669  4244 getlex
 12837                                  ;  670  4251 eqstr
 12838                                  ;  671  4257 getlex
 12839                                  ;  672  4264 eqstr
 12840                                  ;  673  4270 getlex
 12841                                  ;  674  4277 eqstr
 12842                                  ;  675  4283 getlex
 12843                                  ;  676  4290 eqstr
 12844                                  ;  677  4296 getlex
 12845                                  ;  678  4303 prs
 12846                                  ;  679  4307 strcpy
 12847                                  ;  680  4314 prs
 12848                                  ;  681  4318 error1
 12849                                  ;  682  4325 getlex
 12850                                  ;  683  4332 expect
 12851                                  ;  684  4339 error1
 12852                                  ;  685  4346 strlen
 12853                                  ;  686  4353 error1
 12854                                  ;  687  4360 adrofname
 12855                                  ;  688  4370 strcpy
 12856                                  ;  689  4377 expect
 12857                                  ;  690  4384 istoken
 12858                                  ;  691  4392 istoken
 12859                                  ;  692  4400 stmt
 12860                                  ;  693  4405 istoken
 12861                                  ;  694  4413 doif
 12862                                  ;  695  4418 istoken
 12863                                  ;  696  4426 dodo
 12864                                  ;  697  4431 istoken
 12865                                  ;  698  4439 dowhile
 12866                                  ;  699  4447 istoken
 12867                                  ;  700  4455 prs
 12868                                  ;  701  4459 name1
 12869                                  ;  702  4465 prs
 12870                                  ;  703  4469 expect
 12871                                  ;  704  4476 prs
 12872                                  ;  705  4480 next
 12873                                  ;  706  4485 prc
 12874                                  ;  707  4489 next
 12875                                  ;  708  4494 getlex
 12876                                  ;  709  4501 istoken
 12877                                  ;  710  4509 prs
 12878                                  ;  711  4513 next
 12879                                  ;  712  4518 prc
 12880                                  ;  713  4522 next
 12881                                  ;  714  4527 getlex
 12882                                  ;  715  4534 error1
 12883                                  ;  716  4541 istoken
 12884                                  ;  717  4549 prs
 12885                                  ;  718  4553 expect
 12886                                  ;  719  4560 prunsign1
 12887                                  ;  720  4570 expect
 12888                                  ;  721  4577 istoken
 12889                                  ;  722  4585 doifcarry
 12890                                  ;  723  4595 istoken
 12891                                  ;  724  4603 doifzero
 12892                                  ;  725  4612 istoken
 12893                                  ;  726  4620 doemit
 12894                                  ;  727  4627 istoken
 12895                                  ;  728  4635 istoken
 12896                                  ;  729  4643 exprstart
 12897                                  ;  730  4653 prs
 12898                                  ;  731  4657 expect
 12899                                  ;  732  4664 prs
 12900                                  ;  733  4668 prs
 12901                                  ;  734  4672 prc
 12902                                  ;  735  4676 expect
 12903                                  ;  736  4683 expect
 12904                                  ;  737  4690 exprstart
 12905                                  ;  738  4700 expect
 12906                                  ;  739  4707 prs
 12907                                  ;  740  4711 getlex
 12908                                  ;  741  4718 prunsign1
 12909                                  ;  742  4728 getlex
 12910                                  ;  743  4735 prc
 12911                                  ;  744  4739 expect
 12912                                  ;  745  4746 prs
 12913                                  ;  746  4750 prs
 12914                                  ;  747  4754 prs
 12915                                  ;  748  4758 prs
 12916                                  ;  749  4762 prs
 12917                                  ;  750  4766 prunsign1
 12918                                  ;  751  4776 prs
 12919                                  ;  752  4780 prs
 12920                                  ;  753  4784 prunsign1
 12921                                  ;  754  4794 prs
 12922                                  ;  755  4798 prs
 12923                                  ;  756  4802 prs
 12924                                  ;  757  4806 error1
 12925                                  ;  758  4813 prs
 12926                                  ;  759  4817 prs
 12927                                  ;  760  4821 pint1
 12928                                  ;  761  4827 prc
 12929                                  ;  762  4831 prs
 12930                                  ;  763  4835 prs
 12931                                  ;  764  4839 pint1
 12932                                  ;  765  4845 pexpr
 12933                                  ;  766  4851 pint1
 12934                                  ;  767  4857 stmt
 12935                                  ;  768  4862 istoken
 12936                                  ;  769  4870 prjump
 12937                                  ;  770  4877 prlabel
 12938                                  ;  771  4885 stmt
 12939                                  ;  772  4890 prlabel
 12940                                  ;  773  4898 prlabel
 12941                                  ;  774  4906 prs
 12942                                  ;  775  4910 prs
 12943                                  ;  776  4914 pint1
 12944                                  ;  777  4920 stmt
 12945                                  ;  778  4925 prlabel
 12946                                  ;  779  4933 prs
 12947                                  ;  780  4937 prs
 12948                                  ;  781  4941 pint1
 12949                                  ;  782  4947 stmt
 12950                                  ;  783  4952 prlabel
 12951                                  ;  784  4960 prlabel
 12952                                  ;  785  4968 stmt
 12953                                  ;  786  4973 expect
 12954                                  ;  787  4980 pexpr
 12955                                  ;  788  4986 pint1
 12956                                  ;  789  4992 prjump
 12957                                  ;  790  4999 prlabel
 12958                                  ;  791  5007 prlabel
 12959                                  ;  792  5015 pexpr
 12960                                  ;  793  5021 pint1
 12961                                  ;  794  5027 stmt
 12962                                  ;  795  5032 prjump
 12963                                  ;  796  5039 prlabel
 12964                                  ;  797  5047 getlex
 12965                                  ;  798  5054 next
 12966                                  ;  799  5059 next
 12967                                  ;  800  5064 next
 12968                                  ;  801  5069 next
 12969                                  ;  802  5074 next
 12970                                  ;  803  5079 next
 12971                                  ;  804  5084 next
 12972                                  ;  805  5089 next
 12973                                  ;  806  5094 next
 12974                                  ;  807  5099 next
 12975                                  ;  808  5104 next
 12976                                  ;  809  5109 next
 12977                                  ;  810  5114 next
 12978                                  ;  811  5119 next
 12979                                  ;  812  5124 next
 12980                                  ;  813  5129 instr1
 12981                                  ;  814  5136 next
 12982                                  ;  815  5141 getlex
 12983                                  ;  816  5148 next
 12984                                  ;  817  5153 next
 12985                                  ;  818  5158 getlex
 12986                                  ;  819  5165 getstring
 12987                                  ;  820  5175 digit
 12988                                  ;  821  5181 getdigit
 12989                                  ;  822  5190 next
 12990                                  ;  823  5195 next
 12991                                  ;  824  5200 next
 12992                                  ;  825  5205 letter
 12993                                  ;  826  5212 strcpy
 12994                                  ;  827  5219 letter
 12995                                  ;  828  5226 next
 12996                                  ;  829  5231 eqstr
 12997                                  ;  830  5237 eqstr
 12998                                  ;  831  5243 eqstr
 12999                                  ;  832  5249 eqstr
 13000                                  ;  833  5255 eqstr
 13001                                  ;  834  5261 eqstr
 13002                                  ;  835  5267 eqstr
 13003                                  ;  836  5273 eqstr
 13004                                  ;  837  5279 eqstr
 13005                                  ;  838  5285 eqstr
 13006                                  ;  839  5291 eqstr
 13007                                  ;  840  5297 eqstr
 13008                                  ;  841  5303 eqstr
 13009                                  ;  842  5309 eqstr
 13010                                  ;  843  5315 eqstr
 13011                                  ;  844  5321 eqstr
 13012                                  ;  845  5327 eqstr
 13013                                  ;  846  5333 eqstr
 13014                                  ;  847  5339 eqstr
 13015                                  ;  848  5345 eqstr
 13016                                  ;  849  5351 eqstr
 13017                                  ;  850  5357 eqstr
 13018                                  ;  851  5363 convertdefine
 13019                                  ;  852  5377 strcpy
 13020                                  ;  853  5384 error1
 13021                                  ;  854  5391 adrofname
 13022                                  ;  855  5401 eqstr
 13023                                  ;  856  5407 next
 13024                                  ;  857  5412 letter
 13025                                  ;  858  5419 next
 13026                                  ;  859  5424 digit
 13027                                  ;  860  5430 next
 13028                                  ;  861  5435 next
 13029                                  ;  862  5440 next
 13030                                  ;  863  5445 fgets1
 13031                                  ;  864  5452 getlex
 13032                                  ;  865  5459 istoken
 13033                                  ;  866  5467 prs
 13034                                  ;  867  5471 listproc
 13035                                  ;  868  5480 prs
 13036                                  ;  869  5484 pint1
 13037                                  ;  870  5490 error1
 13038                                  ;  871  5497 eprc
 13039                                  ;  872  5502 writetty
 13040                                  ;  873  5511 writetty
 13041                                  ;  874  5520 fputcR
 13042                                  ;  875  5527 prc
 13043                                  ;  876  5531 prs
 13044                                  ;  877  5535 prc
 13045                                  ;  878  5539 eprc
 13046                                  ;  879  5544 mkneg
 13047                                  ;  880  5550 eprnum
 13048                                  ;  881  5557 eprc
 13049                                  ;  882  5562 prc
 13050                                  ;  883  5566 mkneg
 13051                                  ;  884  5572 pint1
 13052                                  ;  885  5578 prc
 13053                                  ;  886  5582 prunsign1
 13054                                  ;  887  5592 prc
 13055                                  ;  888  5596 prc
 13056                                  ;  889  5600 prc
 13057                                  ;  890  5604 prc
 13058                                  ;  891  5608 prc
 13059                                  ;  892  5612 prunsign1
 13060                                  ;  893  5622 printinputline
 13061                                  ;  894  5637 readR
 13062                                  ;  895  5643 prs
 13063                                  ;  896  5647 prunsign1
 13064                                  ;  897  5657 prc
 13065                                  ;  898  5661 prscomment
 13066                                  ;  899  5672 fcloseR
 13067                                  ;  900  5680 fcloseR
 13068                                  ;  901  5688 exitR
 13069                                  ;  902  5694 prnl
 13070                                  ;  903  5699 prscomment
 13071                                  ;  904  5710 prs
 13072                                  ;  905  5714 prunsign1
 13073                                  ;  906  5724 prs
 13074                                  ;  907  5728 prs
 13075                                  ;  908  5732 prs
 13076                                  ;  909  5736 pint1
 13077                                  ;  910  5742 prs
 13078                                  ;  911  5746 prunsign1
 13079                                  ;  912  5756 prs
 13080                                  ;  913  5760 prc
 13081                                  ;  914  5764 prs
 13082                                  ;  915  5768 pint1
 13083                                  ;  916  5774 prs
 13084                                  ;  917  5778 prs
 13085                                  ;  918  5782 end1
 13086                                  ;  919  5787 prs
 13087                                  ;  920  5791 prs
 13088                                  ;  921  5795 prs
 13089                                  ;  922  5799 prunsign1
 13090                                  ;  923  5809 prs
 13091                                  ;  924  5813 listvar
 13092                                  ;  925  5821 prs
 13093                                  ;  926  5825 printint51
 13094                                  ;  927  5836 prc
 13095                                  ;  928  5840 prs
 13096                                  ;  929  5844 prs
 13097                                  ;  930  5848 prs
 13098                                  ;  931  5852 prs
 13099                                  ;  932  5856 prs
 13100                                  ;  933  5860 prs
 13101                                  ;  934  5864 prs
 13102                                  ;  935  5868 prs
 13103                                  ;  936  5872 prs
 13104                                  ;  937  5876 printint51
 13105                                  ;  938  5887 printint51
 13106                                  ;  939  5898 prs
 13107                                  ;  940  5902 prs
 13108                                  ;  941  5906 prc
 13109                                  ;  942  5910 adrofname
 13110                                  ;  943  5920 prs
 13111                                  ;  944  5924 prc
 13112                                  ;  945  5928 prunsign1
 13113                                  ;  946  5938 prc
 13114                                  ;  947  5942 prunsign1
 13115                                  ;  948  5952 prc
 13116                                  ;  949  5956 prs
 13117                                  ;  950  5960 prc
 13118                                  ;  951  5964 pint1
 13119                                  ;  952  5970 prs
 13120                                  ;  953  5974 calllisting
 13121                                  ;  954  5986 prs
 13122                                  ;  955  5990 printint51
 13123                                  ;  956  6001 prc
 13124                                  ;  957  6005 prs
 13125                                  ;  958  6009 printint51
 13126                                  ;  959  6020 prc
 13127                                  ;  960  6024 from_far
 13128                                  ;  961  6033 prs
 13129                                  ;  962  6037 adrF
 13130                                  ;  963  6042 from_far
 13131                                  ;  964  6051 eqstr
 13132                                  ;  965  6057 prs
 13133                                  ;  966  6061 countcalls
 13134                                  ;  967  6072 funclisting
 13135                                  ;  968  6084 prs
 13136                                  ;  969  6088 printint51
 13137                                  ;  970  6099 printint51
 13138                                  ;  971  6110 prs
 13139                                  ;  972  6114 printint51
 13140                                  ;  973  6125 prc
 13141                                  ;  974  6129 prs
 13142                                  ;  975  6133 prs
 13143                                  ;  976  6137 prs
 13144                                  ;  977  6141 prs
 13145                                  ;  978  6145 prc
 13146                                  ;  979  6149 prc
 13147                                  ;  980  6153 adrF
 13148                                  ;  981  6158 prs
 13149                                  ;  982  6162 strcpy
 13150                                  ;  983  6169 storefunc
 13151                                  ;  984  6179 prs
 13152                                  ;  985  6183 prs
 13153                                  ;  986  6187 listvar
 13154                                  ;  987  6195 listfunc
 13155                                  ;  988  6204 listcall
 13156                                  ;  989  6213 prs
 13157                                  ;  990  6217 prs
 13158                                  ;  991  6221 prs
 13159                                  ;  992  6225 prs
 13160                                  ;  993  6229 prs
 13161                                  ;  994  6233 printint51
 13162                                  ;  995  6244 prs
 13163                                  ;  996  6248 printint51
 13164                                  ;  997  6259 prs
 13165                                  ;  998  6263 printint51
 13166                                  ;  999  6274 prs
 13167                                  ; 1000  6278 printint51
 13168                                  ; 1001  6289 prs
 13169                                  ; 1002  6293 printint51
 13170                                  ; 1003  6304 prs
 13171                                  ; 1004  6308 printint51
 13172                                  ; 1005  6319 prs
 13173                                  ; 1006  6323 printint51
 13174                                  ; 1007  6334 prs
 13175                                  ; 1008  6338 printint51
 13176                                  ; 1009  6349 prs
 13177                                  ; 1010  6353 printint51
 13178                                  ; 1011  6364 prs
 13179                                  ; 1012  6368 printint51
 13180                                  ; 1013  6379 prs
 13181                                  ; 1014  6383 printint51
 13182                                  ; 1015  6394 prs
 13183                                  ; 1016  6398 printint51
 13184                                  ; 1017  6409 prs
 13185                                  ; 1018  6413 prs
 13186                                  ; 1019  6417 prunsign1
 13187                                  ; 1020  6427 prs
 13188                                  ; 1021  6431 printint51
 13189                                  ; 1022  6442 prs
 13190                                  ; 1023  6446 prs
 13191                                  ; 1024  6450 prs
 13192                                  ; 1025  6454 prs
 13193                                  ; 1026  6458 printint51
 13194                                  ; 1027  6469 prs
 13195                                  ; 1028  6473 printint51
 13196                                  ; 1029  6484 prs
 13197                                  ; 1030  6488 printint51
 13198                                  ; 1031  6499 prs
 13199                                  ; 1032  6503 prs
 13200                                  ; 1033  6507 end1
 13201                                  ; 1034  6512 DosInt
 13202                                  ; 1035  6519 DosInt
 13203                                  ; 1036  6526 writetty
 13204                                  ; 1037  6535 writetty
 13205                                  ; 1038  6544 putch
 13206                                  ; 1039  6550 prc
 13207                                  ; 1040  6554 mkneg
 13208                                  ; 1041  6560 pint
 13209                                  ; 1042  6565 putch
 13210                                  ; 1043  6571 digit
 13211                                  ; 1044  6577 strcpy
 13212                                  ; 1045  6584 DosInt
 13213                                  ; 1046  6591 DosInt
 13214                                  ; 1047  6598 DosInt
 13215                                  ; 1048  6605 DosInt
 13216                                  ; 1049  6612 DosInt
 13217                                  ;Input: A.C, List: A.S,  Lines: 1030
 13218                                  ;Glob. variables:  142 max.:  200
 13219                                  ;Functions      :  114 max.:  300
 13220                                  ;Calls          : 1050 max.: 2000, NameField: 6619 max.:    65535
 13221                                  ;Code until     :23898 max.: 30000, free: 6102
 13222                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 13223                                  ;Max. Const in 'epilog' :  971 max. 3000, free: 2029
