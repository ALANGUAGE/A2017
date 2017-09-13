     1                                  
     2                                  ; A.COM CComp V0.9, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
     3                                  org  256 ; NASM ON
     4 00000000 E98A2F                  jmp main
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
    18                                  ;-4   char NASM=1;  
    19                                  
    20 00000014 01                      NASM db 1
    21                                  
    22                                  ;-5 #define LSTART        200
    23                                  
    24                                  
    25                                  ;-6 #define VARMAX        300
    26                                  
    27                                  
    28                                  ;-7 #define GNAMEMAX     4800 // 16*VARMAX
    29                                  
    30                                  
    31                                  ;-8 #define FUNCMAX       300
    32                                  
    33                                  
    34                                  ;-9 #define FNAMEMAX     4800 // 16*FUNCMAX
    35                                  
    36                                  
    37                                  ;-10 #define CALLMAX      2000
    38                                  
    39                                  
    40                                  ;-11 #define IDLENMAX       15
    41                                  
    42                                  
    43                                  ;-12 #define _                 // Konstantvergleich
    44                                  
    45                                  
    46                                  ;-13 #define T_NAME        256
    47                                  
    48                                  
    49                                  ;-14 #define T_CONST       257 
    50                                  
    51                                  
    52                                  ;-15 #define T_STRING      258     
    53                                  
    54                                  
    55                                  ;-16 #define T_INCLUDE     510     
    56                                  
    57                                  
    58                                  ;-17 #define T_DEFINE      511  
    59                                  
    60                                  
    61                                  ;-18 #define T_RETURN      512
    62                                  
    63                                  
    64                                  ;-19 #define T_IF          513      
    65                                  
    66                                  
    67                                  ;-20 #define T_ELSE        514  
    68                                  
    69                                  
    70                                  ;-21 #define T_WHILE       515      
    71                                  
    72                                  
    73                                  ;-22 #define T_DO          516
    74                                  
    75                                  
    76                                  ;-23 #define T_INT         517     
    77                                  
    78                                  
    79                                  ;-24 #define T_ASM         518   
    80                                  
    81                                  
    82                                  ;-25 #define T_ASMBLOCK    519   
    83                                  
    84                                  
    85                                  ;-26 #define T_EMIT        520
    86                                  
    87                                  
    88                                  ;-27 #define T_GOTO        521    
    89                                  
    90                                  
    91                                  ;-28 #define T_VOID        529  
    92                                  
    93                                  
    94                                  ;-29 #define T_CHAR        530       
    95                                  
    96                                  
    97                                  ;-30 #define T_SIGNED      531
    98                                  
    99                                  
   100                                  ;-31 #define T_UNSIGNED    532
   101                                  
   102                                  
   103                                  ;-32 #define T_LONG        533
   104                                  
   105                                  
   106                                  ;-33 #define T_SHORT       534
   107                                  
   108                                  
   109                                  ;-34 //T_INT8 540   T_UINT8 541   T_INT16 542   T_UINT16 543   T_INT32 544
   110                                  
   111                                  
   112                                  ;-35 #define T_UINT32      545
   113                                  
   114                                  
   115                                  ;-36 //T_INT64 546   T_UINT64 547
   116                                  
   117                                  
   118                                  ;-37 #define T_INTH        600
   119                                  
   120                                  
   121                                  ;-38 #define T_IFCARRY     601
   122                                  
   123                                  
   124                                  ;-39 #define T_IFZERO      602
   125                                  
   126                                  
   127                                  ;-40 #define T_EQ          806
   128                                  
   129                                  
   130                                  ;-41 #define T_NE          807
   131                                  
   132                                  
   133                                  ;-42 #define T_GE          811
   134                                  
   135                                  
   136                                  ;-43 #define T_LE          824
   137                                  
   138                                  
   139                                  ;-44 #define T_PLUSPLUS   1219
   140                                  
   141                                  
   142                                  ;-45 #define T_MINUSMINUS 1225
   143                                  
   144                                  
   145                                  ;-46 #define T_PLUSASS    1230
   146                                  
   147                                  
   148                                  ;-47 #define T_MINUSASS   1231
   149                                  
   150                                  
   151                                  ;-48 #define T_MULASS     1232
   152                                  
   153                                  
   154                                  ;-49 #define T_DIVASS     1233
   155                                  
   156                                  
   157                                  ;-50 #define T_ANDASS     1234
   158                                  
   159                                  
   160                                  ;-51 #define T_ORASS      1235
   161                                  
   162                                  
   163                                  ;-52 #define T_LESSLESS   1240
   164                                  
   165                                  
   166                                  ;-53 #define T_GREATGREAT 1241
   167                                  
   168                                  
   169                                  ;-54 #define COMAX        3000
   170                                  
   171                                  
   172                                  ;-55 #define CMDLENMAX      67
   173                                  
   174                                  
   175                                  ;-56 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;
   176                                  
   177 00000015 3075                    ORGDATAORIG dw 30000
   178 00000017 3075                    orgData dw 30000
   179                                  
   180                                  ;-57 char co[COMAX];    int maxco=0;      int maxco1=0;
   181                                  
   182                                  section .bss
   183                                  absolute 30000
   184 00007530 <res 00000BB8>          co resb 3000
   185                                  section .text
   186 00000019 0000                    maxco dw 0
   187 0000001B 0000                    maxco1 dw 0
   188                                  
   189                                  ;-58 char coname[CMDLENMAX];              char *cloc=0;
   190                                  
   191                                  section .bss
   192                                  absolute 33000
   193 000080E8 <res 00000043>          coname resb 67
   194                                  section .text
   195 0000001D 0000                    cloc dw 0
   196                                  
   197                                  ;-59 int fdin=0;        int fdout=0;      char symbol[128];
   198                                  
   199 0000001F 0000                    fdin dw 0
   200 00000021 0000                    fdout dw 0
   201                                  section .bss
   202                                  absolute 33067
   203 0000812B <res 00000080>          symbol resb 128
   204                                  section .text
   205                                  
   206                                  ;-60 char fname[CMDLENMAX];               char namein[CMDLENMAX];
   207                                  
   208                                  section .bss
   209                                  absolute 33195
   210 000081AB <res 00000043>          fname resb 67
   211                                  section .text
   212                                  section .bss
   213                                  absolute 33262
   214 000081EE <res 00000043>          namein resb 67
   215                                  section .text
   216                                  
   217                                  ;-61 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];
   218                                  
   219                                  section .bss
   220                                  absolute 33329
   221 00008231 <res 00000043>          namelst resb 67
   222                                  section .text
   223                                  section .bss
   224                                  absolute 33396
   225 00008274 <res 00000043>          archivename resb 67
   226                                  section .text
   227                                  
   228                                  ;-62 int token=0;       char globC=0;     int spalte=0;
   229                                  
   230 00000023 0000                    token dw 0
   231 00000025 00                      globC db 0
   232 00000026 0000                    spalte dw 0
   233                                  
   234                                  ;-63 char thechar=0;    int iscmp=0;      int nconst=0;
   235                                  
   236 00000028 00                      thechar db 0
   237 00000029 0000                    iscmp dw 0
   238 0000002B 0000                    nconst dw 0
   239                                  
   240                                  ;-64 int nreturn=0;     int nlabel=0;     int callrecursive=0;
   241                                  
   242 0000002D 0000                    nreturn dw 0
   243 0000002F 0000                    nlabel dw 0
   244 00000031 0000                    callrecursive dw 0
   245                                  
   246                                  ;-65 int GTop=1;        int LTop=150;
   247                                  
   248 00000033 0100                    GTop dw 1
   249 00000035 9600                    LTop dw 150
   250                                  
   251                                  ;-66 unsigned int lexval=0;
   252                                  
   253 00000037 0000                    lexval dw 0
   254                                  
   255                                  ;-67 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   256                                  
   257 00000039 0000                    typei dw 0
   258 0000003B 00                      istype db 0
   259                                  section .bss
   260                                  absolute 33463
   261 000082B7 <res 0000012C>          GType resb 300
   262                                  section .text
   263                                  
   264                                  ;-68 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
   265                                  
   266 0000003C 0000                    signi dw 0
   267 0000003E 00                      issign db 0
   268                                  section .bss
   269                                  absolute 33763
   270 000083E3 <res 0000012C>          GSign resb 300
   271                                  section .text
   272                                  
   273                                  ;-69 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
   274                                  
   275 0000003F 0000                    widthi dw 0
   276 00000041 00                      iswidth db 0
   277                                  section .bss
   278                                  absolute 34063
   279 0000850F <res 0000012C>          GWidth resb 300
   280                                  section .text
   281                                  
   282                                  ;-70              int GAdr[VARMAX]; int  GUsed [VARMAX];
   283                                  
   284                                  section .bss
   285                                  absolute 34363
   286 0000863B <res 00000258>          GAdr resw 300
   287                                  section .text
   288                                  section .bss
   289                                  absolute 34963
   290 00008893 <res 00000258>          GUsed resw 300
   291                                  section .text
   292                                  
   293                                  ;-71 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
   294                                  
   295 00000042 0000                    wi dw 0
   296                                  section .bss
   297                                  absolute 35563
   298 00008AEB <res 00000258>          GData resw 300
   299                                  section .text
   300                                  section .bss
   301                                  absolute 36163
   302 00008D43 <res 000012C0>          GNameField resb 4800
   303                                  section .text
   304                                  
   305                                  ;-72 int  FTop=0;                 int  CTop=0;
   306                                  
   307 00000044 0000                    FTop dw 0
   308 00000046 0000                    CTop dw 0
   309                                  
   310                                  ;-73 char FType [FUNCMAX];        char CType[CALLMAX];
   311                                  
   312                                  section .bss
   313                                  absolute 40963
   314 0000A003 <res 0000012C>          FType resb 300
   315                                  section .text
   316                                  section .bss
   317                                  absolute 41263
   318 0000A12F <res 000007D0>          CType resb 2000
   319                                  section .text
   320                                  
   321                                  ;-74 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
   322                                  
   323                                  section .bss
   324                                  absolute 43263
   325 0000A8FF <res 00000258>          FAdr resw 300
   326                                  section .text
   327                                  section .bss
   328                                  absolute 43863
   329 0000AB57 <res 00000FA0>          CAdr resw 2000
   330                                  section .text
   331                                  
   332                                  ;-75 int  FCalls[FUNCMAX];
   333                                  
   334                                  section .bss
   335                                  absolute 47863
   336 0000BAF7 <res 00000258>          FCalls resw 300
   337                                  section .text
   338                                  
   339                                  ;-76 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   340                                  
   341                                  section .bss
   342                                  absolute 48463
   343 0000BD4F <res 000012C0>          FNameField resb 4800
   344                                  section .text
   345                                  
   346                                  ;-77 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   347                                  
   348 00000048 313233343536373839-     NameA db "12345678901234567890123456789012",0
   349 00000051 303132333435363738-
   350 0000005A 393031323334353637-
   351 00000063 383930313200       
   352                                  
   353                                  ;-78 char fgetsdest[128];         unsigned char *CNameTop=0;
   354                                  
   355                                  section .bss
   356                                  absolute 53263
   357 0000D00F <res 00000080>          fgetsdest resb 128
   358                                  section .text
   359 00000069 0000                    CNameTop dw 0
   360                                  
   361                                  ;-79 unsigned char *fgetsp=0;     unsigned int segE;
   362                                  
   363 0000006B 0000                    fgetsp dw 0
   364 0000006D 0000                    segE dw 0
   365                                  
   366                                  ;-80 unsigned int lineno=1;       unsigned int linenoinclude=1;
   367                                  
   368 0000006F 0100                    lineno dw 1
   369 00000071 0100                    linenoinclude dw 1
   370                                  
   371                                  ;-81 unsigned char *pt=0;         unsigned char *p1=0;
   372                                  
   373 00000073 0000                    pt dw 0
   374 00000075 0000                    p1 dw 0
   375                                  
   376                                  ;-82 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;
   377                                  
   378 00000077 0000                    DOS_ERR dw 0
   379 00000079 0000                    DOS_NoBytes dw 0
   380 0000007B 00                      DOS_ByteRead db 0
   381                                  
   382                                  ;-83 
   383                                  
   384                                  
   385                                  ;-84 int tt1=7; int tt2; long ex;
   386                                  
   387 0000007C 0700                    tt1 dw 7
   388 0000007E 0000                    tt2 dw 0
   389 00000080 00000000                ex dd 0
   390                                  
   391                                  ;-85 void ttt(long par1) {
   392                                  
   393                                  
   394                                  ttt:  ; *** PROC ***
   395                                  
   396                                  ;-86   int i1; long in; int i9;
   397                                  
   398                                  
   399                                  ;-87   ttt(in, ex );
   400                                  
   401                                  ;Function : ttt, Number of local variables: 4
   402                                  ;   # type sign width addr used name   list of local variables
   403                                  ;  200 var sign dwrd    85 NULL par1 = bp+4
   404                                  ;  201 var sign word    86 NULL i1 = bp-2
   405                                  ;  202 var sign dwrd    86 NULL in = bp-6
   406                                  ;  203 var sign word    86 NULL i9 = bp-8;
   407 00000084 C8080000                 ENTER  8,0
   408 00000088 A0[8000]                 mov al, byte [ex]
   409 0000008B B400                     mov ah, 0
   410 0000008D 50                       push ax
   411 0000008E 8A46FA                   mov al, byte [bp-6]
   412 00000091 B400                     mov ah, 0
   413 00000093 50                       push ax
   414 00000094 E8EDFF                   call ttt
   415 00000097 83C404                   add  sp, 4
   416                                  
   417                                  ;-88  si = &FTop;  si=FTop;
   418                                  
   419 0000009A BE[4400]                 mov  si, FTop
   420 0000009D 8B36[4400]               mov  si, [FTop]
   421                                  
   422                                  ;-89  si= &FAdr;     si=FAdr;
   423                                  
   424 000000A1 BEFFA8                   mov  si, FAdr
   425 000000A4 8B36FFA8                 mov  si, [FAdr]
   426                                  
   427                                  ;-90  &FTop;         FTop;
   428                                  
   429 000000A8 B8[4400]                 mov ax, FTop
   430 000000AB A1[4400]                 mov ax, [FTop]
   431                                  
   432                                  ;-91   }
   433                                  
   434                                  
   435                                  ;-92 int a(unsigned int i) { if(NASM == 0) prs("offset "); printName(i);}//address
   436 000000AE C9                       LEAVE
   437 000000AF C3                       ret
   438                                  ; ENDP
   439                                  
   440                                  a:  ; *** PROC ***
   441                                  ;Function : a, Number of local variables: 1
   442                                  ;   # type sign width addr used name   list of local variables
   443                                  ;  200 var unsg word    92 NULL i = bp+4;
   444 000000B0 C8000000                 ENTER  0,0
   445 000000B4 A0[1400]                 mov al, [NASM]
   446 000000B7 3C00                     cmp al, 0
   447 000000B9 0F850900                 jne @@a1
   448 000000BD 68[D100]                 push a_0
   449 000000C0 E80949                   call prs
   450 000000C3 83C402                   add  sp, 2
   451                                  @@a1:
   452 000000C6 FF7604                   push word [bp+4]
   453 000000C9 E85F06                   call printName
   454 000000CC 83C402                   add  sp, 2
   455                                  
   456                                  ;-93 int v(unsigned int i) { if(NASM) { if (i < LSTART) prc('['); }
   457 000000CF C9                       LEAVE
   458 000000D0 C3                       ret
   459                                  ; ENDP
   460 000000D1 6F66667365742000        a_0 db "offset ",0
   461                                  
   462                                  v:  ; *** PROC ***
   463                                  ;Function : v, Number of local variables: 1
   464                                  ;   # type sign width addr used name   list of local variables
   465                                  ;  200 var unsg word    93 NULL i = bp+4;
   466 000000D9 C8000000                 ENTER  0,0
   467 000000DD A0[1400]                 mov al, [NASM]
   468 000000E0 08C0                     or  al, al
   469 000000E2 0F841200                 je @@v2
   470 000000E6 8B4604                   mov ax, [bp+4]
   471 000000E9 3DC800                   cmp ax, 200
   472 000000EC 0F8D0800                 jge @@v3
   473 000000F0 6A5B                     push 91
   474 000000F2 E87048                   call prc
   475 000000F5 83C402                   add  sp, 2
   476                                  @@v3:
   477                                  
   478                                  ;-94   printName(i); if(NASM) { if (i < LSTART) prc(']'); }   }//value
   479                                  
   480                                  @@v2:
   481 000000F8 FF7604                   push word [bp+4]
   482 000000FB E82D06                   call printName
   483 000000FE 83C402                   add  sp, 2
   484 00000101 A0[1400]                 mov al, [NASM]
   485 00000104 08C0                     or  al, al
   486 00000106 0F841200                 je @@v4
   487 0000010A 8B4604                   mov ax, [bp+4]
   488 0000010D 3DC800                   cmp ax, 200
   489 00000110 0F8D0800                 jge @@v5
   490 00000114 6A5D                     push 93
   491 00000116 E84C48                   call prc
   492 00000119 83C402                   add  sp, 2
   493                                  @@v5:
   494                                  @@v4:
   495                                  
   496                                  ;-95 int checknamelen() { int i;    i=strlen(symbol);
   497 0000011C C9                       LEAVE
   498 0000011D C3                       ret
   499                                  ; ENDP
   500                                  
   501                                  checknamelen:  ; *** PROC ***
   502                                  ;Function : checknamelen, Number of local variables: 1
   503                                  ;   # type sign width addr used name   list of local variables
   504                                  ;  200 var sign word    95 NULL i = bp-2;
   505 0000011E C8020000                 ENTER  2,0
   506 00000122 8D062B81                 lea  ax, [symbol]
   507 00000126 50                       push ax
   508 00000127 E83858                   call strlen
   509 0000012A 83C402                   add  sp, 2
   510 0000012D 8946FE                   mov [bp-2], ax
   511                                  
   512                                  ;-96   if (i > IDLENMAX) error1("Item name is too long in characters)");
   513                                  
   514 00000130 8B46FE                   mov ax, [bp-2]
   515 00000133 83F80F                   cmp ax, 15
   516 00000136 0F8E0900                 jle @@checknamelen6
   517 0000013A 68[4501]                 push checknamelen_0
   518 0000013D E8754B                   call error1
   519 00000140 83C402                   add  sp, 2
   520                                  
   521                                  ;-97 }
   522                                  
   523                                  @@checknamelen6:
   524                                  
   525                                  ;-98 char doglobName[IDLENMAX];
   526 00000143 C9                       LEAVE
   527 00000144 C3                       ret
   528                                  ; ENDP
   529 00000145 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
   530 0000014E 20697320746F6F206C-
   531 00000157 6F6E6720696E206368-
   532 00000160 617261637465727329-
   533 00000169 00                 
   534                                  section .bss
   535                                  absolute 53391
   536 0000D08F <res 0000000F>          doglobName resb 15
   537                                  section .text
   538                                  
   539                                  ;-99 int doglob() { int i; int j; int isstrarr; isstrarr=0;
   540                                  
   541                                  
   542                                  doglob:  ; *** PROC ***
   543                                  ;Function : doglob, Number of local variables: 3
   544                                  ;   # type sign width addr used name   list of local variables
   545                                  ;  200 var sign word    99 NULL i = bp-2
   546                                  ;  201 var sign word    99 NULL j = bp-4
   547                                  ;  202 var sign word    99 NULL isstrarr = bp-6;
   548 0000016A C8060000                 ENTER  6,0
   549 0000016E B80000                   mov ax, 0
   550 00000171 8946FA                   mov [bp-6], ax
   551                                  
   552                                  ;-100   if (GTop >= LSTART) error1("Global table full");
   553                                  
   554 00000174 A1[3300]                 mov ax, [GTop]
   555 00000177 3DC800                   cmp ax, 200 ;unsigned : 1
   556 0000017A 0F8C0900                 jl  @@doglob7
   557 0000017E 68[4105]                 push doglob_0
   558 00000181 E8314B                   call error1
   559 00000184 83C402                   add  sp, 2
   560                                  
   561                                  ;-101   if (iswidth == 0) error1("no VOID as var type");
   562                                  
   563                                  @@doglob7:
   564 00000187 A0[4100]                 mov al, [iswidth]
   565 0000018A 3C00                     cmp al, 0
   566 0000018C 0F850900                 jne @@doglob8
   567 00000190 68[5305]                 push doglob_1
   568 00000193 E81F4B                   call error1
   569 00000196 83C402                   add  sp, 2
   570                                  
   571                                  ;-102   checknamelen();
   572                                  
   573                                  @@doglob8:
   574 00000199 E882FF                   call checknamelen
   575                                  
   576                                  ;-103   if (checkName() != 0) error1("Variable already defined");
   577                                  
   578 0000019C E83B06                   call checkName
   579 0000019F 3C00                     cmp al, 0
   580 000001A1 0F840900                 je  @@doglob9
   581 000001A5 68[6705]                 push doglob_2
   582 000001A8 E80A4B                   call error1
   583 000001AB 83C402                   add  sp, 2
   584                                  
   585                                  ;-104   if (istoken('[')) { istype='&';
   586                                  
   587                                  @@doglob9:
   588 000001AE 6A5B                     push 91
   589 000001B0 E8E446                   call istoken
   590 000001B3 83C402                   add  sp, 2
   591 000001B6 08C0                     or  al, al
   592 000001B8 0F846402                 je @@doglob10
   593 000001BC B82600                   mov ax, 38
   594 000001BF A2[3B00]                 mov byte [istype], al
   595                                  
   596                                  ;-105     if (istoken(T_CONST)) {
   597                                  
   598 000001C2 680101                   push 257
   599 000001C5 E8CF46                   call istoken
   600 000001C8 83C402                   add  sp, 2
   601 000001CB 08C0                     or  al, al
   602 000001CD 0F844401                 je @@doglob11
   603                                  
   604                                  ;-106       if (NASM) {prs("\nsection .bss\nabsolute ");
   605                                  
   606 000001D1 A0[1400]                 mov al, [NASM]
   607 000001D4 08C0                     or  al, al
   608 000001D6 0F841600                 je @@doglob12
   609 000001DA 68[8005]                 push doglob_3
   610 000001DD E8EC47                   call prs
   611 000001E0 83C402                   add  sp, 2
   612                                  
   613                                  ;-107         prunsign1(orgData); }
   614                                  
   615 000001E3 FF36[1700]               push word [orgData]
   616 000001E7 E83C49                   call prunsign1
   617 000001EA 83C402                   add  sp, 2
   618                                  
   619                                  ;-108         else {prs("\nAData = $\norg "); prunsign1(orgData);} 
   620                                  
   621 000001ED E91300                   jmp @@doglob13
   622                                  @@doglob12:
   623 000001F0 68[9A05]                 push doglob_4
   624 000001F3 E8D647                   call prs
   625 000001F6 83C402                   add  sp, 2
   626 000001F9 FF36[1700]               push word [orgData]
   627 000001FD E82649                   call prunsign1
   628 00000200 83C402                   add  sp, 2
   629                                  
   630                                  ;-109       prs("\n"); prs(symbol); 
   631                                  
   632                                  @@doglob13:
   633 00000203 68[AC05]                 push doglob_5
   634 00000206 E8C347                   call prs
   635 00000209 83C402                   add  sp, 2
   636 0000020C 8D062B81                 lea  ax, [symbol]
   637 00000210 50                       push ax
   638 00000211 E8B847                   call prs
   639 00000214 83C402                   add  sp, 2
   640                                  
   641                                  ;-110       if      (iswidth==1) {if (NASM) prs(" resb "); else prs(" db ");}
   642                                  
   643 00000217 A0[4100]                 mov al, [iswidth]
   644 0000021A 3C01                     cmp al, 1
   645 0000021C 0F852100                 jne @@doglob14
   646 00000220 A0[1400]                 mov al, [NASM]
   647 00000223 08C0                     or  al, al
   648 00000225 0F840C00                 je @@doglob15
   649 00000229 68[AF05]                 push doglob_6
   650 0000022C E89D47                   call prs
   651 0000022F 83C402                   add  sp, 2
   652 00000232 E90900                   jmp @@doglob16
   653                                  @@doglob15:
   654 00000235 68[B605]                 push doglob_7
   655 00000238 E89147                   call prs
   656 0000023B 83C402                   add  sp, 2
   657                                  @@doglob16:
   658                                  
   659                                  ;-111       else if (iswidth==2) {if (NASM) prs(" resw "); else prs(" dw ");}
   660                                  
   661 0000023E E94800                   jmp @@doglob17
   662                                  @@doglob14:
   663 00000241 A0[4100]                 mov al, [iswidth]
   664 00000244 3C02                     cmp al, 2
   665 00000246 0F852100                 jne @@doglob18
   666 0000024A A0[1400]                 mov al, [NASM]
   667 0000024D 08C0                     or  al, al
   668 0000024F 0F840C00                 je @@doglob19
   669 00000253 68[BB05]                 push doglob_8
   670 00000256 E87347                   call prs
   671 00000259 83C402                   add  sp, 2
   672 0000025C E90900                   jmp @@doglob20
   673                                  @@doglob19:
   674 0000025F 68[C205]                 push doglob_9
   675 00000262 E86747                   call prs
   676 00000265 83C402                   add  sp, 2
   677                                  @@doglob20:
   678                                  
   679                                  ;-112       else                 {if (NASM) prs(" resd "); else prs(" dd ");}
   680                                  
   681 00000268 E91E00                   jmp @@doglob21
   682                                  @@doglob18:
   683 0000026B A0[1400]                 mov al, [NASM]
   684 0000026E 08C0                     or  al, al
   685 00000270 0F840C00                 je @@doglob22
   686 00000274 68[C705]                 push doglob_10
   687 00000277 E85247                   call prs
   688 0000027A 83C402                   add  sp, 2
   689 0000027D E90900                   jmp @@doglob23
   690                                  @@doglob22:
   691 00000280 68[CE05]                 push doglob_11
   692 00000283 E84647                   call prs
   693 00000286 83C402                   add  sp, 2
   694                                  @@doglob23:
   695                                  
   696                                  ;-113       prunsign1(lexval); if (NASM==0)prs(" dup (?)");
   697                                  
   698                                  @@doglob21:
   699                                  @@doglob17:
   700 00000289 FF36[3700]               push word [lexval]
   701 0000028D E89648                   call prunsign1
   702 00000290 83C402                   add  sp, 2
   703 00000293 A0[1400]                 mov al, [NASM]
   704 00000296 3C00                     cmp al, 0
   705 00000298 0F850900                 jne @@doglob24
   706 0000029C 68[D305]                 push doglob_12
   707 0000029F E82A47                   call prs
   708 000002A2 83C402                   add  sp, 2
   709                                  
   710                                  ;-114       if(NASM) prs("\nsection .text");
   711                                  
   712                                  @@doglob24:
   713 000002A5 A0[1400]                 mov al, [NASM]
   714 000002A8 08C0                     or  al, al
   715 000002AA 0F840C00                 je @@doglob25
   716 000002AE 68[DC05]                 push doglob_13
   717 000002B1 E81847                   call prs
   718 000002B4 83C402                   add  sp, 2
   719                                  
   720                                  ;-115         else prs("\norg AData"); 
   721                                  
   722 000002B7 E90900                   jmp @@doglob26
   723                                  @@doglob25:
   724 000002BA 68[EC05]                 push doglob_14
   725 000002BD E80C47                   call prs
   726 000002C0 83C402                   add  sp, 2
   727                                  
   728                                  ;-116       orgData=orgData+lexval;
   729                                  
   730                                  @@doglob26:
   731 000002C3 A1[1700]                 mov ax, [orgData]
   732 000002C6 0306[3700]               add ax, [lexval]
   733 000002CA A3[1700]                 mov word [orgData], ax
   734                                  
   735                                  ;-117       if (iswidth==2) orgData=orgData+lexval;
   736                                  
   737 000002CD A0[4100]                 mov al, [iswidth]
   738 000002D0 3C02                     cmp al, 2
   739 000002D2 0F850A00                 jne @@doglob27
   740 000002D6 A1[1700]                 mov ax, [orgData]
   741 000002D9 0306[3700]               add ax, [lexval]
   742 000002DD A3[1700]                 mov word [orgData], ax
   743                                  
   744                                  ;-118       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
   745                                  
   746                                  @@doglob27:
   747 000002E0 A0[4100]                 mov al, [iswidth]
   748 000002E3 3C04                     cmp al, 4
   749 000002E5 0F851400                 jne @@doglob28
   750 000002E9 A1[3700]                 mov ax, [lexval]
   751 000002EC BB0300                   mov bx, 3
   752 000002EF F7E3                     mul bx
   753 000002F1 8946FE                   mov [bp-2], ax
   754 000002F4 A1[1700]                 mov ax, [orgData]
   755 000002F7 0346FE                   add ax, [bp-2]
   756 000002FA A3[1700]                 mov word [orgData], ax
   757                                  
   758                                  ;-119       GData[GTop]=lexval; expect(']');
   759                                  
   760                                  @@doglob28:
   761 000002FD A1[3700]                 mov ax, [lexval]
   762 00000300 8B1E[3300]               mov bx, [GTop]
   763 00000304 D1E3                     shl bx, 1
   764 00000306 8987EB8A                 mov [GData+bx], ax
   765 0000030A 6A5D                     push 93
   766 0000030C E8AA45                   call expect
   767 0000030F 83C402                   add  sp, 2
   768                                  
   769                                  ;-120     }else { expect(']');
   770                                  
   771 00000312 E90801                   jmp @@doglob29
   772                                  @@doglob11:
   773 00000315 6A5D                     push 93
   774 00000317 E89F45                   call expect
   775 0000031A 83C402                   add  sp, 2
   776                                  
   777                                  ;-121       if (iswidth != 1) error1("Only ByteArray allowed");
   778                                  
   779 0000031D A0[4100]                 mov al, [iswidth]
   780 00000320 3C01                     cmp al, 1
   781 00000322 0F840900                 je  @@doglob30
   782 00000326 68[F805]                 push doglob_15
   783 00000329 E88949                   call error1
   784 0000032C 83C402                   add  sp, 2
   785                                  
   786                                  ;-122       prs("\n"); prs(symbol); prs(" db "); 
   787                                  
   788                                  @@doglob30:
   789 0000032F 68[0F06]                 push doglob_16
   790 00000332 E89746                   call prs
   791 00000335 83C402                   add  sp, 2
   792 00000338 8D062B81                 lea  ax, [symbol]
   793 0000033C 50                       push ax
   794 0000033D E88C46                   call prs
   795 00000340 83C402                   add  sp, 2
   796 00000343 68[1206]                 push doglob_17
   797 00000346 E88346                   call prs
   798 00000349 83C402                   add  sp, 2
   799                                  
   800                                  ;-123       isstrarr=1; strcpy(doglobName, symbol);
   801                                  
   802 0000034C B80100                   mov ax, 1
   803 0000034F 8946FA                   mov [bp-6], ax
   804 00000352 8D062B81                 lea  ax, [symbol]
   805 00000356 50                       push ax
   806 00000357 8D068FD0                 lea  ax, [doglobName]
   807 0000035B 50                       push ax
   808 0000035C E82B56                   call strcpy
   809 0000035F 83C404                   add  sp, 4
   810                                  
   811                                  ;-124       expect('='); 
   812                                  
   813 00000362 6A3D                     push 61
   814 00000364 E85245                   call expect
   815 00000367 83C402                   add  sp, 2
   816                                  
   817                                  ;-125       if (istoken(T_STRING)) { 
   818                                  
   819 0000036A 680201                   push 258
   820 0000036D E82745                   call istoken
   821 00000370 83C402                   add  sp, 2
   822 00000373 08C0                     or  al, al
   823 00000375 0F844200                 je @@doglob31
   824                                  
   825                                  ;-126         prc(34); prscomment(symbol); prc(34); prs(",0"); 
   826                                  
   827 00000379 6A22                     push 34
   828 0000037B E8E745                   call prc
   829 0000037E 83C402                   add  sp, 2
   830 00000381 8D062B81                 lea  ax, [symbol]
   831 00000385 50                       push ax
   832 00000386 E80746                   call prscomment
   833 00000389 83C402                   add  sp, 2
   834 0000038C 6A22                     push 34
   835 0000038E E8D445                   call prc
   836 00000391 83C402                   add  sp, 2
   837 00000394 68[1706]                 push doglob_18
   838 00000397 E83246                   call prs
   839 0000039A 83C402                   add  sp, 2
   840                                  
   841                                  ;-127         i=strlen(symbol); GData[GTop]=i; }
   842                                  
   843 0000039D 8D062B81                 lea  ax, [symbol]
   844 000003A1 50                       push ax
   845 000003A2 E8BD55                   call strlen
   846 000003A5 83C402                   add  sp, 2
   847 000003A8 8946FE                   mov [bp-2], ax
   848 000003AB 8B46FE                   mov ax, [bp-2]
   849 000003AE 8B1E[3300]               mov bx, [GTop]
   850 000003B2 D1E3                     shl bx, 1
   851 000003B4 8987EB8A                 mov [GData+bx], ax
   852                                  
   853                                  ;-128       else if (istoken('{' )) { i=0;
   854                                  
   855 000003B8 E96200                   jmp @@doglob32
   856                                  @@doglob31:
   857 000003BB 6A7B                     push 123
   858 000003BD E8D744                   call istoken
   859 000003C0 83C402                   add  sp, 2
   860 000003C3 08C0                     or  al, al
   861 000003C5 0F844B00                 je @@doglob33
   862 000003C9 B80000                   mov ax, 0
   863 000003CC 8946FE                   mov [bp-2], ax
   864                                  
   865                                  ;-129         do { if(i) prc(','); 
   866                                  
   867                                  @@doglob34:
   868 000003CF 8B46FE                   mov ax, [bp-2]
   869 000003D2 08C0                     or  al, al
   870 000003D4 0F840800                 je @@doglob35
   871 000003D8 6A2C                     push 44
   872 000003DA E88845                   call prc
   873 000003DD 83C402                   add  sp, 2
   874                                  
   875                                  ;-130           expect(T_CONST); prunsign1(lexval); i=1; }
   876                                  
   877                                  @@doglob35:
   878 000003E0 680101                   push 257
   879 000003E3 E8D344                   call expect
   880 000003E6 83C402                   add  sp, 2
   881 000003E9 FF36[3700]               push word [lexval]
   882 000003ED E83647                   call prunsign1
   883 000003F0 83C402                   add  sp, 2
   884 000003F3 B80100                   mov ax, 1
   885 000003F6 8946FE                   mov [bp-2], ax
   886                                  
   887                                  ;-131         while (istoken(',')); expect('}'); }  
   888                                  
   889 000003F9 6A2C                     push 44
   890 000003FB E89944                   call istoken
   891 000003FE 83C402                   add  sp, 2
   892 00000401 08C0                     or  al, al
   893 00000403 0F840200                 je @@doglob36
   894 00000407 EBC6                     jmp @@doglob34
   895                                  @@doglob36:
   896 00000409 6A7D                     push 125
   897 0000040B E8AB44                   call expect
   898 0000040E 83C402                   add  sp, 2
   899                                  
   900                                  ;-132       else error1("String or number array expected");
   901                                  
   902 00000411 E90900                   jmp @@doglob37
   903                                  @@doglob33:
   904 00000414 68[1A06]                 push doglob_19
   905 00000417 E89B48                   call error1
   906 0000041A 83C402                   add  sp, 2
   907                                  
   908                                  ;-133       }; 
   909                                  
   910                                  @@doglob37:
   911                                  @@doglob32:
   912                                  @@doglob29:
   913                                  
   914                                  ;-134   }else { //expect('=');
   915                                  
   916 0000041D E99E00                   jmp @@doglob38
   917                                  @@doglob10:
   918                                  
   919                                  ;-135     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
   920                                  
   921 00000420 68[3A06]                 push doglob_20
   922 00000423 E8A645                   call prs
   923 00000426 83C402                   add  sp, 2
   924 00000429 8D062B81                 lea  ax, [symbol]
   925 0000042D 50                       push ax
   926 0000042E E89B45                   call prs
   927 00000431 83C402                   add  sp, 2
   928 00000434 A0[3B00]                 mov al, [istype]
   929 00000437 3C2A                     cmp al, 42
   930 00000439 0F850C00                 jne @@doglob39
   931 0000043D 68[3D06]                 push doglob_21
   932 00000440 E88945                   call prs
   933 00000443 83C402                   add  sp, 2
   934                                  
   935                                  ;-136     else {
   936                                  
   937 00000446 E93300                   jmp @@doglob40
   938                                  @@doglob39:
   939                                  
   940                                  ;-137       if      (iswidth==1) prs(" db ");
   941                                  
   942 00000449 A0[4100]                 mov al, [iswidth]
   943 0000044C 3C01                     cmp al, 1
   944 0000044E 0F850C00                 jne @@doglob41
   945 00000452 68[4206]                 push doglob_22
   946 00000455 E87445                   call prs
   947 00000458 83C402                   add  sp, 2
   948                                  
   949                                  ;-138       else if (iswidth==2) prs(" dw ");
   950                                  
   951 0000045B E91E00                   jmp @@doglob42
   952                                  @@doglob41:
   953 0000045E A0[4100]                 mov al, [iswidth]
   954 00000461 3C02                     cmp al, 2
   955 00000463 0F850C00                 jne @@doglob43
   956 00000467 68[4706]                 push doglob_23
   957 0000046A E85F45                   call prs
   958 0000046D 83C402                   add  sp, 2
   959                                  
   960                                  ;-139       else                 prs(" dd ");
   961                                  
   962 00000470 E90900                   jmp @@doglob44
   963                                  @@doglob43:
   964 00000473 68[4C06]                 push doglob_24
   965 00000476 E85345                   call prs
   966 00000479 83C402                   add  sp, 2
   967                                  
   968                                  ;-140     }
   969                                  
   970                                  @@doglob44:
   971                                  @@doglob42:
   972                                  
   973                                  ;-141     if(istoken('-')) prc('-');
   974                                  
   975                                  @@doglob40:
   976 0000047C 6A2D                     push 45
   977 0000047E E81644                   call istoken
   978 00000481 83C402                   add  sp, 2
   979 00000484 08C0                     or  al, al
   980 00000486 0F840800                 je @@doglob45
   981 0000048A 6A2D                     push 45
   982 0000048C E8D644                   call prc
   983 0000048F 83C402                   add  sp, 2
   984                                  
   985                                  ;-142     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
   986                                  
   987                                  @@doglob45:
   988 00000492 6A3D                     push 61
   989 00000494 E80044                   call istoken
   990 00000497 83C402                   add  sp, 2
   991 0000049A 08C0                     or  al, al
   992 0000049C 0F841600                 je @@doglob46
   993 000004A0 680101                   push 257
   994 000004A3 E81344                   call expect
   995 000004A6 83C402                   add  sp, 2
   996 000004A9 FF36[3700]               push word [lexval]
   997 000004AD E87646                   call prunsign1
   998 000004B0 83C402                   add  sp, 2
   999                                  
  1000                                  ;-143     else prunsign1(0); }
  1001                                  
  1002 000004B3 E90800                   jmp @@doglob47
  1003                                  @@doglob46:
  1004 000004B6 6A00                     push 0
  1005 000004B8 E86B46                   call prunsign1
  1006 000004BB 83C402                   add  sp, 2
  1007                                  @@doglob47:
  1008                                  
  1009                                  ;-144   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  1010                                  
  1011                                  @@doglob38:
  1012 000004BE A0[3E00]                 mov al, [issign]
  1013 000004C1 8B1E[3300]               mov bx, [GTop]
  1014 000004C5 8887E383                 mov [GSign+bx], al
  1015 000004C9 A0[4100]                 mov al, [iswidth]
  1016 000004CC 8B1E[3300]               mov bx, [GTop]
  1017 000004D0 88870F85                 mov [GWidth+bx], al
  1018 000004D4 A0[3B00]                 mov al, [istype]
  1019 000004D7 8B1E[3300]               mov bx, [GTop]
  1020 000004DB 8887B782                 mov [GType+bx], al
  1021                                  
  1022                                  ;-145   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  1023                                  
  1024 000004DF A1[6F00]                 mov ax, [lineno]
  1025 000004E2 83E801                   sub ax, 1
  1026 000004E5 8B1E[3300]               mov bx, [GTop]
  1027 000004E9 D1E3                     shl bx, 1
  1028 000004EB 89873B86                 mov [GAdr+bx], ax
  1029 000004EF B80000                   mov ax, 0
  1030 000004F2 8B1E[3300]               mov bx, [GTop]
  1031 000004F6 D1E3                     shl bx, 1
  1032 000004F8 89879388                 mov [GUsed+bx], ax
  1033                                  
  1034                                  ;-146   pt=adrofname(GTop);
  1035                                  
  1036 000004FC FF36[3300]               push word [GTop]
  1037 00000500 E80502                   call adrofname
  1038 00000503 83C402                   add  sp, 2
  1039 00000506 A3[7300]                 mov word [pt], ax
  1040                                  
  1041                                  ;-147   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  1042                                  
  1043 00000509 8B46FA                   mov ax, [bp-6]
  1044 0000050C 08C0                     or  al, al
  1045 0000050E 0F841200                 je @@doglob48
  1046 00000512 8D068FD0                 lea  ax, [doglobName]
  1047 00000516 50                       push ax
  1048 00000517 FF36[7300]               push word [pt]
  1049 0000051B E86C54                   call strcpy
  1050 0000051E 83C404                   add  sp, 4
  1051 00000521 E90F00                   jmp @@doglob49
  1052                                  @@doglob48:
  1053 00000524 8D062B81                 lea  ax, [symbol]
  1054 00000528 50                       push ax
  1055 00000529 FF36[7300]               push word [pt]
  1056 0000052D E85A54                   call strcpy
  1057 00000530 83C404                   add  sp, 4
  1058                                  
  1059                                  ;-148   GTop++; expect(';'); }
  1060                                  
  1061                                  @@doglob49:
  1062 00000533 FF06[3300]               inc  word[GTop]
  1063 00000537 6A3B                     push 59
  1064 00000539 E87D43                   call expect
  1065 0000053C 83C402                   add  sp, 2
  1066                                  
  1067                                  ;-149 
  1068                                  
  1069                                  
  1070                                  ;-150 int gettypes(int i) {int j; char c;
  1071 0000053F C9                       LEAVE
  1072 00000540 C3                       ret
  1073                                  ; ENDP
  1074 00000541 476C6F62616C207461-     doglob_0 db "Global table full",0
  1075 0000054A 626C652066756C6C00 
  1076 00000553 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1077 0000055C 732076617220747970-
  1078 00000565 6500               
  1079 00000567 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1080 00000570 616C72656164792064-
  1081 00000579 6566696E656400     
  1082 00000580 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1083 00000589 202E6273735C6E6162-
  1084 00000592 736F6C7574652000   
  1085 0000059A 5C6E4144617461203D-     doglob_4 db "\nAData = $\norg ",0
  1086 000005A3 20245C6E6F72672000 
  1087 000005AC 5C6E00                  doglob_5 db "\n",0
  1088 000005AF 20726573622000          doglob_6 db " resb ",0
  1089 000005B6 2064622000              doglob_7 db " db ",0
  1090 000005BB 20726573772000          doglob_8 db " resw ",0
  1091 000005C2 2064772000              doglob_9 db " dw ",0
  1092 000005C7 20726573642000          doglob_10 db " resd ",0
  1093 000005CE 2064642000              doglob_11 db " dd ",0
  1094 000005D3 2064757020283F2900      doglob_12 db " dup (?)",0
  1095 000005DC 5C6E73656374696F6E-     doglob_13 db "\nsection .text",0
  1096 000005E5 202E7465787400     
  1097 000005EC 5C6E6F726720414461-     doglob_14 db "\norg AData",0
  1098 000005F5 746100             
  1099 000005F8 4F6E6C792042797465-     doglob_15 db "Only ByteArray allowed",0
  1100 00000601 417272617920616C6C-
  1101 0000060A 6F77656400         
  1102 0000060F 5C6E00                  doglob_16 db "\n",0
  1103 00000612 2064622000              doglob_17 db " db ",0
  1104 00000617 2C3000                  doglob_18 db ",0",0
  1105 0000061A 537472696E67206F72-     doglob_19 db "String or number array expected",0
  1106 00000623 206E756D6265722061-
  1107 0000062C 727261792065787065-
  1108 00000635 6374656400         
  1109 0000063A 5C6E00                  doglob_20 db "\n",0
  1110 0000063D 2064772000              doglob_21 db " dw ",0
  1111 00000642 2064622000              doglob_22 db " db ",0
  1112 00000647 2064772000              doglob_23 db " dw ",0
  1113 0000064C 2064642000              doglob_24 db " dd ",0
  1114                                  
  1115                                  gettypes:  ; *** PROC ***
  1116                                  
  1117                                  ;-151   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1118                                  
  1119                                  ;Function : gettypes, Number of local variables: 3
  1120                                  ;   # type sign width addr used name   list of local variables
  1121                                  ;  200 var sign word   150 NULL i = bp+4
  1122                                  ;  201 var sign word   150 NULL j = bp-2
  1123                                  ;  202 var sign byte   150 NULL c = bp-4;
  1124 00000651 C8040000                 ENTER  4,0
  1125 00000655 8B5E04                   mov bx, [bp+4]
  1126 00000658 8A87E383                 mov al, [GSign + bx]
  1127 0000065C 8846FC                   mov [bp-4], al
  1128 0000065F 8A46FC                   mov al, [bp-4]
  1129 00000662 3C53                     cmp al, 83
  1130 00000664 0F850900                 jne @@gettypes50
  1131 00000668 B80100                   mov ax, 1
  1132 0000066B A3[3C00]                 mov word [signi], ax
  1133 0000066E E90600                   jmp @@gettypes51
  1134                                  @@gettypes50:
  1135 00000671 B80000                   mov ax, 0
  1136 00000674 A3[3C00]                 mov word [signi], ax
  1137                                  
  1138                                  ;-152   c=GWidth[i]; widthi=0;wi=0;
  1139                                  
  1140                                  @@gettypes51:
  1141 00000677 8B5E04                   mov bx, [bp+4]
  1142 0000067A 8A870F85                 mov al, [GWidth + bx]
  1143 0000067E 8846FC                   mov [bp-4], al
  1144 00000681 B80000                   mov ax, 0
  1145 00000684 A3[3F00]                 mov word [widthi], ax
  1146 00000687 B80000                   mov ax, 0
  1147 0000068A A3[4200]                 mov word [wi], ax
  1148                                  
  1149                                  ;-153   if (c==1) {widthi=1;wi=1;}
  1150                                  
  1151 0000068D 8A46FC                   mov al, [bp-4]
  1152 00000690 3C01                     cmp al, 1
  1153 00000692 0F850C00                 jne @@gettypes52
  1154 00000696 B80100                   mov ax, 1
  1155 00000699 A3[3F00]                 mov word [widthi], ax
  1156 0000069C B80100                   mov ax, 1
  1157 0000069F A3[4200]                 mov word [wi], ax
  1158                                  
  1159                                  ;-154   if (c==2) {widthi=2;wi=2;}
  1160                                  
  1161                                  @@gettypes52:
  1162 000006A2 8A46FC                   mov al, [bp-4]
  1163 000006A5 3C02                     cmp al, 2
  1164 000006A7 0F850C00                 jne @@gettypes53
  1165 000006AB B80200                   mov ax, 2
  1166 000006AE A3[3F00]                 mov word [widthi], ax
  1167 000006B1 B80200                   mov ax, 2
  1168 000006B4 A3[4200]                 mov word [wi], ax
  1169                                  
  1170                                  ;-155   if (c==4) {widthi=4;wi=4;}
  1171                                  
  1172                                  @@gettypes53:
  1173 000006B7 8A46FC                   mov al, [bp-4]
  1174 000006BA 3C04                     cmp al, 4
  1175 000006BC 0F850C00                 jne @@gettypes54
  1176 000006C0 B80400                   mov ax, 4
  1177 000006C3 A3[3F00]                 mov word [widthi], ax
  1178 000006C6 B80400                   mov ax, 4
  1179 000006C9 A3[4200]                 mov word [wi], ax
  1180                                  
  1181                                  ;-156   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1182                                  
  1183                                  @@gettypes54:
  1184 000006CC 8B5E04                   mov bx, [bp+4]
  1185 000006CF 8A87B782                 mov al, [GType + bx]
  1186 000006D3 8846FC                   mov [bp-4], al
  1187 000006D6 B80000                   mov ax, 0
  1188 000006D9 A3[3900]                 mov word [typei], ax
  1189 000006DC 8A46FC                   mov al, [bp-4]
  1190 000006DF 3C2A                     cmp al, 42
  1191 000006E1 0F850C00                 jne @@gettypes55
  1192 000006E5 B80100                   mov ax, 1
  1193 000006E8 A3[3900]                 mov word [typei], ax
  1194 000006EB B80200                   mov ax, 2
  1195 000006EE A3[4200]                 mov word [wi], ax
  1196                                  
  1197                                  ;-157   if (c=='&')  typei=2;  
  1198                                  
  1199                                  @@gettypes55:
  1200 000006F1 8A46FC                   mov al, [bp-4]
  1201 000006F4 3C26                     cmp al, 38
  1202 000006F6 0F850600                 jne @@gettypes56
  1203 000006FA B80200                   mov ax, 2
  1204 000006FD A3[3900]                 mov word [typei], ax
  1205                                  
  1206                                  ;-158   return i; }  
  1207                                  
  1208                                  @@gettypes56:
  1209 00000700 8B4604                   mov ax, [bp+4]
  1210 00000703 E90000                   jmp @@retn
  1211                                  
  1212                                  ;-159 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1213                                  
  1214 00000706 C9                      @@retn: LEAVE
  1215 00000707 C3                       ret
  1216                                  ; ENDP
  1217                                  
  1218                                  adrofname:  ; *** PROC ***
  1219                                  ;Function : adrofname, Number of local variables: 1
  1220                                  ;   # type sign width addr used name   list of local variables
  1221                                  ;  200 var unsg word   159 NULL i = bp+4;
  1222 00000708 C8000000                 ENTER  0,0
  1223 0000070C FF7604                   push word [bp+4]
  1224 0000070F 8D06438D                 lea  ax, [GNameField]
  1225 00000713 50                       push ax
  1226 00000714 E80500                   call adrF
  1227 00000717 83C404                   add  sp, 4
  1228                                  
  1229                                  ;-160 int adrF(char *s, unsigned int i) { i << 4;
  1230 0000071A C9                       LEAVE
  1231 0000071B C3                       ret
  1232                                  ; ENDP
  1233                                  
  1234                                  adrF:  ; *** PROC ***
  1235                                  ;Function : adrF, Number of local variables: 2
  1236                                  ;   # type sign width addr used name   list of local variables
  1237                                  ;  200 ptr sign byte   160 NULL s = bp+4
  1238                                  ;  201 var unsg word   160 NULL i = bp+6;
  1239 0000071C C8000000                 ENTER  0,0
  1240 00000720 8B4606                   mov ax, [bp+6]
  1241 00000723 C1E004                   shl ax, 4
  1242                                  
  1243                                  ;-161   __asm{ add ax, [bp+4]  ; offset s } }
  1244                                  
  1245 00000726 034604                   add ax, [bp+4]  ; offset s 
  1246                                  
  1247                                  ;-162 int printName(unsigned int i) {int j;
  1248 00000729 C9                       LEAVE
  1249 0000072A C3                       ret
  1250                                  ; ENDP
  1251                                  
  1252                                  printName:  ; *** PROC ***
  1253                                  
  1254                                  ;-163   if (i < LSTART) { i=adrofname(i); prs(i); }
  1255                                  
  1256                                  ;Function : printName, Number of local variables: 2
  1257                                  ;   # type sign width addr used name   list of local variables
  1258                                  ;  200 var unsg word   162 NULL i = bp+4
  1259                                  ;  201 var sign word   162 NULL j = bp-2;
  1260 0000072B C8020000                 ENTER  2,0
  1261 0000072F 8B4604                   mov ax, [bp+4]
  1262 00000732 3DC800                   cmp ax, 200
  1263 00000735 0F8D1800                 jge @@printName57
  1264 00000739 FF7604                   push word [bp+4]
  1265 0000073C E8C9FF                   call adrofname
  1266 0000073F 83C402                   add  sp, 2
  1267 00000742 894604                   mov [bp+4], ax
  1268 00000745 FF7604                   push word [bp+4]
  1269 00000748 E88142                   call prs
  1270 0000074B 83C402                   add  sp, 2
  1271                                  
  1272                                  ;-164   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1273                                  
  1274 0000074E E93800                   jmp @@printName58
  1275                                  @@printName57:
  1276 00000751 68[8B07]                 push printName_0
  1277 00000754 E87542                   call prs
  1278 00000757 83C402                   add  sp, 2
  1279 0000075A 8B5E04                   mov bx, [bp+4]
  1280 0000075D D1E3                     shl bx, 1
  1281 0000075F 8B87EB8A                 mov ax, [GData + bx]
  1282 00000763 8946FE                   mov [bp-2], ax
  1283 00000766 8B46FE                   mov ax, [bp-2]
  1284 00000769 83F800                   cmp ax, 0
  1285 0000076C 0F8E0800                 jle @@printName59
  1286 00000770 6A2B                     push 43
  1287 00000772 E8F041                   call prc
  1288 00000775 83C402                   add  sp, 2
  1289                                  @@printName59:
  1290 00000778 FF76FE                   push word [bp-2]
  1291 0000077B E84543                   call pint1
  1292 0000077E 83C402                   add  sp, 2
  1293 00000781 6A5D                     push 93
  1294 00000783 E8DF41                   call prc
  1295 00000786 83C402                   add  sp, 2
  1296                                  
  1297                                  ;-165 }
  1298                                  
  1299                                  @@printName58:
  1300                                  
  1301                                  ;-166 int searchname() { unsigned int i;
  1302 00000789 C9                       LEAVE
  1303 0000078A C3                       ret
  1304                                  ; ENDP
  1305 0000078B 5B627000                printName_0 db "[bp",0
  1306                                  
  1307                                  searchname:  ; *** PROC ***
  1308                                  
  1309                                  ;-167   i=checkName(); if (i == 0) error1("Variable unknown");
  1310                                  
  1311                                  ;Function : searchname, Number of local variables: 1
  1312                                  ;   # type sign width addr used name   list of local variables
  1313                                  ;  200 var unsg word   166 NULL i = bp-2;
  1314 0000078F C8020000                 ENTER  2,0
  1315 00000793 E84400                   call checkName
  1316 00000796 8946FE                   mov [bp-2], ax
  1317 00000799 8B46FE                   mov ax, [bp-2]
  1318 0000079C 83F800                   cmp ax, 0
  1319 0000079F 0F850900                 jne @@searchname60
  1320 000007A3 68[C907]                 push searchname_0
  1321 000007A6 E80C45                   call error1
  1322 000007A9 83C402                   add  sp, 2
  1323                                  
  1324                                  ;-168   GUsed[i]=GUsed[i] + 1; return i;
  1325                                  
  1326                                  @@searchname60:
  1327 000007AC 8B5EFE                   mov bx, [bp-2]
  1328 000007AF D1E3                     shl bx, 1
  1329 000007B1 8B879388                 mov ax, [GUsed + bx]
  1330 000007B5 83C001                   add ax, 1
  1331 000007B8 8B5EFE                   mov bx, [bp-2]
  1332 000007BB D1E3                     shl bx, 1
  1333 000007BD 89879388                 mov [GUsed+bx], ax
  1334 000007C1 8B46FE                   mov ax, [bp-2]
  1335 000007C4 E90000                   jmp @@retn
  1336                                  
  1337                                  ;-169 }
  1338                                  
  1339                                  
  1340                                  ;-170 int checkName() { unsigned int i; unsigned int j;
  1341                                  
  1342 000007C7 C9                      @@retn: LEAVE
  1343 000007C8 C3                       ret
  1344                                  ; ENDP
  1345 000007C9 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1346 000007D2 756E6B6E6F776E00   
  1347                                  
  1348                                  checkName:  ; *** PROC ***
  1349                                  
  1350                                  ;-171   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1351                                  
  1352                                  ;Function : checkName, Number of local variables: 2
  1353                                  ;   # type sign width addr used name   list of local variables
  1354                                  ;  200 var unsg word   170 NULL i = bp-2
  1355                                  ;  201 var unsg word   170 NULL j = bp-4;
  1356 000007DA C8040000                 ENTER  4,0
  1357 000007DE B8C800                   mov ax, 200
  1358 000007E1 8946FE                   mov [bp-2], ax
  1359                                  @@checkName61:
  1360 000007E4 8B46FE                   mov ax, [bp-2]
  1361 000007E7 3B06[3500]               cmp ax, [LTop]
  1362 000007EB 0F8D2B00                 jge @@checkName62
  1363 000007EF FF76FE                   push word [bp-2]
  1364 000007F2 E813FF                   call adrofname
  1365 000007F5 83C402                   add  sp, 2
  1366 000007F8 8946FC                   mov [bp-4], ax
  1367 000007FB FF76FC                   push word [bp-4]
  1368 000007FE 8D062B81                 lea  ax, [symbol]
  1369 00000802 50                       push ax
  1370 00000803 E8AB52                   call eqstr
  1371 00000806 83C404                   add  sp, 4
  1372 00000809 08C0                     or  al, al
  1373 0000080B 0F840600                 je @@checkName63
  1374 0000080F 8B46FE                   mov ax, [bp-2]
  1375 00000812 E94700                   jmp @@retn
  1376                                  @@checkName63:
  1377 00000815 FF46FE                   inc  word[bp-2]
  1378                                  
  1379                                  ;-172   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1380                                  
  1381 00000818 EBCA                     jmp @@checkName61
  1382                                  @@checkName62:
  1383 0000081A B80100                   mov ax, 1
  1384 0000081D 8946FE                   mov [bp-2], ax
  1385                                  @@checkName64:
  1386 00000820 8B46FE                   mov ax, [bp-2]
  1387 00000823 3B06[3300]               cmp ax, [GTop]
  1388 00000827 0F8D2B00                 jge @@checkName65
  1389 0000082B FF76FE                   push word [bp-2]
  1390 0000082E E8D7FE                   call adrofname
  1391 00000831 83C402                   add  sp, 2
  1392 00000834 8946FC                   mov [bp-4], ax
  1393 00000837 FF76FC                   push word [bp-4]
  1394 0000083A 8D062B81                 lea  ax, [symbol]
  1395 0000083E 50                       push ax
  1396 0000083F E86F52                   call eqstr
  1397 00000842 83C404                   add  sp, 4
  1398 00000845 08C0                     or  al, al
  1399 00000847 0F840600                 je @@checkName66
  1400 0000084B 8B46FE                   mov ax, [bp-2]
  1401 0000084E E90B00                   jmp @@retn
  1402                                  @@checkName66:
  1403 00000851 FF46FE                   inc  word[bp-2]
  1404                                  
  1405                                  ;-173   return 0;
  1406                                  
  1407 00000854 EBCA                     jmp @@checkName64
  1408                                  @@checkName65:
  1409 00000856 B80000                   mov ax, 0
  1410 00000859 E90000                   jmp @@retn
  1411                                  
  1412                                  ;-174 }    
  1413                                  
  1414                                  
  1415                                  ;-175 int typeName() { int m; //0=V,1=*,2=&
  1416                                  
  1417 0000085C C9                      @@retn: LEAVE
  1418 0000085D C3                       ret
  1419                                  ; ENDP
  1420                                  
  1421                                  typeName:  ; *** PROC ***
  1422                                  
  1423                                  ;-176   issign='S';
  1424                                  
  1425                                  ;Function : typeName, Number of local variables: 1
  1426                                  ;   # type sign width addr used name   list of local variables
  1427                                  ;  200 var sign word   175 NULL m = bp-2;
  1428 0000085E C8020000                 ENTER  2,0
  1429 00000862 B85300                   mov ax, 83
  1430 00000865 A2[3E00]                 mov byte [issign], al
  1431                                  
  1432                                  ;-177   if(istoken(T_SIGNED))   issign='S';  if(istoken(T_UNSIGNED)) issign='U';
  1433                                  
  1434 00000868 681302                   push 531
  1435 0000086B E82940                   call istoken
  1436 0000086E 83C402                   add  sp, 2
  1437 00000871 08C0                     or  al, al
  1438 00000873 0F840600                 je @@typeName67
  1439 00000877 B85300                   mov ax, 83
  1440 0000087A A2[3E00]                 mov byte [issign], al
  1441                                  @@typeName67:
  1442 0000087D 681402                   push 532
  1443 00000880 E81440                   call istoken
  1444 00000883 83C402                   add  sp, 2
  1445 00000886 08C0                     or  al, al
  1446 00000888 0F840600                 je @@typeName68
  1447 0000088C B85500                   mov ax, 85
  1448 0000088F A2[3E00]                 mov byte [issign], al
  1449                                  
  1450                                  ;-178   iswidth=2;                           if(istoken(T_VOID))     iswidth=0;
  1451                                  
  1452                                  @@typeName68:
  1453 00000892 B80200                   mov ax, 2
  1454 00000895 A2[4100]                 mov byte [iswidth], al
  1455 00000898 681102                   push 529
  1456 0000089B E8F93F                   call istoken
  1457 0000089E 83C402                   add  sp, 2
  1458 000008A1 08C0                     or  al, al
  1459 000008A3 0F840600                 je @@typeName69
  1460 000008A7 B80000                   mov ax, 0
  1461 000008AA A2[4100]                 mov byte [iswidth], al
  1462                                  
  1463                                  ;-179   if(istoken(T_CHAR))     iswidth=1;   if(istoken(T_INT))      iswidth=2;
  1464                                  
  1465                                  @@typeName69:
  1466 000008AD 681202                   push 530
  1467 000008B0 E8E43F                   call istoken
  1468 000008B3 83C402                   add  sp, 2
  1469 000008B6 08C0                     or  al, al
  1470 000008B8 0F840600                 je @@typeName70
  1471 000008BC B80100                   mov ax, 1
  1472 000008BF A2[4100]                 mov byte [iswidth], al
  1473                                  @@typeName70:
  1474 000008C2 680502                   push 517
  1475 000008C5 E8CF3F                   call istoken
  1476 000008C8 83C402                   add  sp, 2
  1477 000008CB 08C0                     or  al, al
  1478 000008CD 0F840600                 je @@typeName71
  1479 000008D1 B80200                   mov ax, 2
  1480 000008D4 A2[4100]                 mov byte [iswidth], al
  1481                                  
  1482                                  ;-180   if(istoken(T_SHORT))    iswidth=2;   if(istoken(T_LONG))     iswidth=4;
  1483                                  
  1484                                  @@typeName71:
  1485 000008D7 681602                   push 534
  1486 000008DA E8BA3F                   call istoken
  1487 000008DD 83C402                   add  sp, 2
  1488 000008E0 08C0                     or  al, al
  1489 000008E2 0F840600                 je @@typeName72
  1490 000008E6 B80200                   mov ax, 2
  1491 000008E9 A2[4100]                 mov byte [iswidth], al
  1492                                  @@typeName72:
  1493 000008EC 681502                   push 533
  1494 000008EF E8A53F                   call istoken
  1495 000008F2 83C402                   add  sp, 2
  1496 000008F5 08C0                     or  al, al
  1497 000008F7 0F840600                 je @@typeName73
  1498 000008FB B80400                   mov ax, 4
  1499 000008FE A2[4100]                 mov byte [iswidth], al
  1500                                  
  1501                                  ;-181   if(istoken(T_UINT32)) { iswidth=4; issign='U'; }
  1502                                  
  1503                                  @@typeName73:
  1504 00000901 682102                   push 545
  1505 00000904 E8903F                   call istoken
  1506 00000907 83C402                   add  sp, 2
  1507 0000090A 08C0                     or  al, al
  1508 0000090C 0F840C00                 je @@typeName74
  1509 00000910 B80400                   mov ax, 4
  1510 00000913 A2[4100]                 mov byte [iswidth], al
  1511 00000916 B85500                   mov ax, 85
  1512 00000919 A2[3E00]                 mov byte [issign], al
  1513                                  
  1514                                  ;-182   istype='V'; m=0;
  1515                                  
  1516                                  @@typeName74:
  1517 0000091C B85600                   mov ax, 86
  1518 0000091F A2[3B00]                 mov byte [istype], al
  1519 00000922 B80000                   mov ax, 0
  1520 00000925 8946FE                   mov [bp-2], ax
  1521                                  
  1522                                  ;-183   if(istoken('*'))  { istype='*'; m=1; } if(istoken('&'))  {istype='&'; m=2;}
  1523                                  
  1524 00000928 6A2A                     push 42
  1525 0000092A E86A3F                   call istoken
  1526 0000092D 83C402                   add  sp, 2
  1527 00000930 08C0                     or  al, al
  1528 00000932 0F840C00                 je @@typeName75
  1529 00000936 B82A00                   mov ax, 42
  1530 00000939 A2[3B00]                 mov byte [istype], al
  1531 0000093C B80100                   mov ax, 1
  1532 0000093F 8946FE                   mov [bp-2], ax
  1533                                  @@typeName75:
  1534 00000942 6A26                     push 38
  1535 00000944 E8503F                   call istoken
  1536 00000947 83C402                   add  sp, 2
  1537 0000094A 08C0                     or  al, al
  1538 0000094C 0F840C00                 je @@typeName76
  1539 00000950 B82600                   mov ax, 38
  1540 00000953 A2[3B00]                 mov byte [istype], al
  1541 00000956 B80200                   mov ax, 2
  1542 00000959 8946FE                   mov [bp-2], ax
  1543                                  
  1544                                  ;-184   name1(); return m; }
  1545                                  
  1546                                  @@typeName76:
  1547 0000095C E80800                   call name1
  1548 0000095F 8B46FE                   mov ax, [bp-2]
  1549 00000962 E90000                   jmp @@retn
  1550                                  
  1551                                  ;-185 int name1() {if (token!=T_NAME) error1("Name expected"); token=getlex(); }
  1552                                  
  1553 00000965 C9                      @@retn: LEAVE
  1554 00000966 C3                       ret
  1555                                  ; ENDP
  1556                                  
  1557                                  name1:  ; *** PROC ***
  1558 00000967 A1[2300]                 mov ax, [token]
  1559 0000096A 3D0001                   cmp ax, 256
  1560 0000096D 0F840900                 je  @@name177
  1561 00000971 68[8109]                 push name1_0
  1562 00000974 E83E43                   call error1
  1563 00000977 83C402                   add  sp, 2
  1564                                  @@name177:
  1565 0000097A E85337                   call getlex
  1566 0000097D A3[2300]                 mov word [token], ax
  1567                                  
  1568                                  ;-186 
  1569                                  
  1570                                  
  1571                                  ;-187 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  1572                                  
  1573 00000980 C3                       ret
  1574                                  ; ENDP
  1575 00000981 4E616D652065787065-     name1_0 db "Name expected",0
  1576 0000098A 6374656400         
  1577                                  
  1578                                  storecall:  ; *** PROC ***
  1579                                  ;Function : storecall, Number of local variables: 1
  1580                                  ;   # type sign width addr used name   list of local variables
  1581                                  ;  200 var sign word   187 NULL i = bp-2;
  1582 0000098F C8020000                 ENTER  2,0
  1583 00000993 A1[4600]                 mov ax, [CTop]
  1584 00000996 3DD007                   cmp ax, 2000 ;unsigned : 1
  1585 00000999 0F8C0900                 jl  @@storecall78
  1586 0000099D 68[010A]                 push storecall_0
  1587 000009A0 E81243                   call error1
  1588 000009A3 83C402                   add  sp, 2
  1589                                  
  1590                                  ;-188   if (CNameTop >= 65468) error1("Call name table fuill");
  1591                                  
  1592                                  @@storecall78:
  1593 000009A6 A1[6900]                 mov ax, [CNameTop]
  1594 000009A9 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  1595 000009AC 0F820900                 jb  @@storecall79
  1596 000009B0 68[110A]                 push storecall_1
  1597 000009B3 E8FF42                   call error1
  1598 000009B6 83C402                   add  sp, 2
  1599                                  
  1600                                  ;-189     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  1601                                  
  1602                                  @@storecall79:
  1603 000009B9 B80000                   mov ax, 0
  1604 000009BC 8B1E[4600]               mov bx, [CTop]
  1605 000009C0 88872FA1                 mov [CType+bx], al
  1606 000009C4 A1[6900]                 mov ax, [CNameTop]
  1607 000009C7 8B1E[4600]               mov bx, [CTop]
  1608 000009CB D1E3                     shl bx, 1
  1609 000009CD 898757AB                 mov [CAdr+bx], ax
  1610 000009D1 8D062B81                 lea  ax, [symbol]
  1611 000009D5 50                       push ax
  1612 000009D6 E8894F                   call strlen
  1613 000009D9 83C402                   add  sp, 2
  1614 000009DC 8946FE                   mov [bp-2], ax
  1615                                  
  1616                                  ;-190     to_far(CNameTop, symbol);
  1617                                  
  1618 000009DF 8D062B81                 lea  ax, [symbol]
  1619 000009E3 50                       push ax
  1620 000009E4 FF36[6900]               push word [CNameTop]
  1621 000009E8 E83B4E                   call to_far
  1622 000009EB 83C404                   add  sp, 4
  1623                                  
  1624                                  ;-191     CNameTop=CNameTop+i; CNameTop++; CTop++;
  1625                                  
  1626 000009EE A1[6900]                 mov ax, [CNameTop]
  1627 000009F1 0346FE                   add ax, [bp-2]
  1628 000009F4 A3[6900]                 mov word [CNameTop], ax
  1629 000009F7 FF06[6900]               inc  word[CNameTop]
  1630 000009FB FF06[4600]               inc  word[CTop]
  1631                                  
  1632                                  ;-192 }
  1633                                  
  1634                                  
  1635                                  ;-193 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  1636 000009FF C9                       LEAVE
  1637 00000A00 C3                       ret
  1638                                  ; ENDP
  1639 00000A01 43616C6C207461626C-     storecall_0 db "Call table full",0
  1640 00000A0A 652066756C6C00     
  1641 00000A11 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  1642 00000A1A 207461626C65206675-
  1643 00000A23 696C6C00           
  1644                                  
  1645                                  storefunc:  ; *** PROC ***
  1646 00000A27 A1[4400]                 mov ax, [FTop]
  1647 00000A2A 3D2C01                   cmp ax, 300 ;unsigned : 1
  1648 00000A2D 0F8C0900                 jl  @@storefunc80
  1649 00000A31 68[880A]                 push storefunc_0
  1650 00000A34 E87E42                   call error1
  1651 00000A37 83C402                   add  sp, 2
  1652                                  
  1653                                  ;-194     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  1654                                  
  1655                                  @@storefunc80:
  1656 00000A3A A1[6F00]                 mov ax, [lineno]
  1657 00000A3D 83E801                   sub ax, 1
  1658 00000A40 8B1E[4400]               mov bx, [FTop]
  1659 00000A44 D1E3                     shl bx, 1
  1660 00000A46 8987FFA8                 mov [FAdr+bx], ax
  1661 00000A4A B80000                   mov ax, 0
  1662 00000A4D 8B1E[4400]               mov bx, [FTop]
  1663 00000A51 D1E3                     shl bx, 1
  1664 00000A53 8987F7BA                 mov [FCalls+bx], ax
  1665 00000A57 A0[4100]                 mov al, [iswidth]
  1666 00000A5A 8B1E[4400]               mov bx, [FTop]
  1667 00000A5E 888703A0                 mov [FType+bx], al
  1668                                  
  1669                                  ;-195     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  1670                                  
  1671 00000A62 FF36[4400]               push word [FTop]
  1672 00000A66 8D064FBD                 lea  ax, [FNameField]
  1673 00000A6A 50                       push ax
  1674 00000A6B E8AEFC                   call adrF
  1675 00000A6E 83C404                   add  sp, 4
  1676 00000A71 A3[7300]                 mov word [pt], ax
  1677 00000A74 8D062B81                 lea  ax, [symbol]
  1678 00000A78 50                       push ax
  1679 00000A79 FF36[7300]               push word [pt]
  1680 00000A7D E80A4F                   call strcpy
  1681 00000A80 83C404                   add  sp, 4
  1682 00000A83 FF06[4400]               inc  word[FTop]
  1683                                  
  1684                                  ;-196 }
  1685                                  
  1686                                  
  1687                                  ;-197 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  1688                                  
  1689 00000A87 C3                       ret
  1690                                  ; ENDP
  1691 00000A88 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  1692 00000A91 7461626C652066756C-
  1693 00000A9A 6C00               
  1694                                  
  1695                                  addlocal:  ; *** PROC ***
  1696 00000A9C A1[3500]                 mov ax, [LTop]
  1697 00000A9F 3D2C01                   cmp ax, 300 ;unsigned : 1
  1698 00000AA2 0F8C0900                 jl  @@addlocal81
  1699 00000AA6 68[220B]                 push addlocal_0
  1700 00000AA9 E80942                   call error1
  1701 00000AAC 83C402                   add  sp, 2
  1702                                  
  1703                                  ;-198   if (checkName() != 0) error1("Variable already defined");
  1704                                  
  1705                                  @@addlocal81:
  1706 00000AAF E828FD                   call checkName
  1707 00000AB2 83F800                   cmp ax, 0
  1708 00000AB5 0F840900                 je  @@addlocal82
  1709 00000AB9 68[3C0B]                 push addlocal_1
  1710 00000ABC E8F641                   call error1
  1711 00000ABF 83C402                   add  sp, 2
  1712                                  
  1713                                  ;-199   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  1714                                  
  1715                                  @@addlocal82:
  1716 00000AC2 A0[3E00]                 mov al, [issign]
  1717 00000AC5 8B1E[3500]               mov bx, [LTop]
  1718 00000AC9 8887E383                 mov [GSign+bx], al
  1719 00000ACD A0[4100]                 mov al, [iswidth]
  1720 00000AD0 8B1E[3500]               mov bx, [LTop]
  1721 00000AD4 88870F85                 mov [GWidth+bx], al
  1722 00000AD8 A0[3B00]                 mov al, [istype]
  1723 00000ADB 8B1E[3500]               mov bx, [LTop]
  1724 00000ADF 8887B782                 mov [GType+bx], al
  1725                                  
  1726                                  ;-200   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  1727                                  
  1728 00000AE3 A1[6F00]                 mov ax, [lineno]
  1729 00000AE6 83E801                   sub ax, 1
  1730 00000AE9 8B1E[3500]               mov bx, [LTop]
  1731 00000AED D1E3                     shl bx, 1
  1732 00000AEF 89873B86                 mov [GAdr+bx], ax
  1733 00000AF3 B80000                   mov ax, 0
  1734 00000AF6 8B1E[3500]               mov bx, [LTop]
  1735 00000AFA D1E3                     shl bx, 1
  1736 00000AFC 89879388                 mov [GUsed+bx], ax
  1737                                  
  1738                                  ;-201   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  1739                                  
  1740 00000B00 FF36[3500]               push word [LTop]
  1741 00000B04 8D06438D                 lea  ax, [GNameField]
  1742 00000B08 50                       push ax
  1743 00000B09 E810FC                   call adrF
  1744 00000B0C 83C404                   add  sp, 4
  1745 00000B0F A3[7300]                 mov word [pt], ax
  1746 00000B12 8D062B81                 lea  ax, [symbol]
  1747 00000B16 50                       push ax
  1748 00000B17 FF36[7300]               push word [pt]
  1749 00000B1B E86C4E                   call strcpy
  1750 00000B1E 83C404                   add  sp, 4
  1751                                  
  1752                                  ;-202 }
  1753                                  
  1754                                  
  1755                                  ;-203 int checkFunction() { unsigned int i; unsigned int j; i=0;
  1756                                  
  1757 00000B21 C3                       ret
  1758                                  ; ENDP
  1759 00000B22 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  1760 00000B2B 6961626C6520746162-
  1761 00000B34 6C652066756C6C00   
  1762 00000B3C 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  1763 00000B45 616C72656164792064-
  1764 00000B4E 6566696E656400     
  1765                                  
  1766                                  checkFunction:  ; *** PROC ***
  1767                                  ;Function : checkFunction, Number of local variables: 2
  1768                                  ;   # type sign width addr used name   list of local variables
  1769                                  ;  200 var unsg word   203 NULL i = bp-2
  1770                                  ;  201 var unsg word   203 NULL j = bp-4;
  1771 00000B55 C8040000                 ENTER  4,0
  1772 00000B59 B80000                   mov ax, 0
  1773 00000B5C 8946FE                   mov [bp-2], ax
  1774                                  
  1775                                  ;-204   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  1776                                  
  1777                                  @@checkFunction83:
  1778 00000B5F 8B46FE                   mov ax, [bp-2]
  1779 00000B62 3B06[4400]               cmp ax, [FTop]
  1780 00000B66 0F8D3000                 jge @@checkFunction84
  1781 00000B6A FF76FE                   push word [bp-2]
  1782 00000B6D 8D064FBD                 lea  ax, [FNameField]
  1783 00000B71 50                       push ax
  1784 00000B72 E8A7FB                   call adrF
  1785 00000B75 83C404                   add  sp, 4
  1786 00000B78 8946FC                   mov [bp-4], ax
  1787 00000B7B FF76FC                   push word [bp-4]
  1788 00000B7E 8D062B81                 lea  ax, [symbol]
  1789 00000B82 50                       push ax
  1790 00000B83 E82B4F                   call eqstr
  1791 00000B86 83C404                   add  sp, 4
  1792 00000B89 08C0                     or  al, al
  1793 00000B8B 0F840600                 je @@checkFunction85
  1794 00000B8F 8B46FE                   mov ax, [bp-2]
  1795 00000B92 E90B00                   jmp @@retn
  1796                                  @@checkFunction85:
  1797 00000B95 FF46FE                   inc  word[bp-2]
  1798                                  
  1799                                  ;-205   return 0; }
  1800                                  
  1801 00000B98 EBC5                     jmp @@checkFunction83
  1802                                  @@checkFunction84:
  1803 00000B9A B80000                   mov ax, 0
  1804 00000B9D E90000                   jmp @@retn
  1805                                  
  1806                                  ;-206 int dofunc() { int nloc; int i; int narg;  
  1807                                  
  1808 00000BA0 C9                      @@retn: LEAVE
  1809 00000BA1 C3                       ret
  1810                                  ; ENDP
  1811                                  
  1812                                  dofunc:  ; *** PROC ***
  1813                                  
  1814                                  ;-207   cloc=&co; 
  1815                                  
  1816                                  ;Function : dofunc, Number of local variables: 3
  1817                                  ;   # type sign width addr used name   list of local variables
  1818                                  ;  200 var sign word   206 NULL nloc = bp-2
  1819                                  ;  201 var sign word   206 NULL i = bp-4
  1820                                  ;  202 var sign word   206 NULL narg = bp-6;
  1821 00000BA2 C8060000                 ENTER  6,0
  1822 00000BA6 B83075                   mov ax, co
  1823 00000BA9 A3[1D00]                 mov word [cloc], ax
  1824                                  
  1825                                  ;-208   checknamelen();
  1826                                  
  1827 00000BAC E86FF5                   call checknamelen
  1828                                  
  1829                                  ;-209   strcpy(fname, symbol);
  1830                                  
  1831 00000BAF 8D062B81                 lea  ax, [symbol]
  1832 00000BB3 50                       push ax
  1833 00000BB4 8D06AB81                 lea  ax, [fname]
  1834 00000BB8 50                       push ax
  1835 00000BB9 E8CE4D                   call strcpy
  1836 00000BBC 83C404                   add  sp, 4
  1837                                  
  1838                                  ;-210   if (checkFunction() ) error1("Function already defined");
  1839                                  
  1840 00000BBF E893FF                   call checkFunction
  1841 00000BC2 08C0                     or  al, al
  1842 00000BC4 0F840900                 je @@dofunc86
  1843 00000BC8 68[D90D]                 push dofunc_0
  1844 00000BCB E8E740                   call error1
  1845 00000BCE 83C402                   add  sp, 2
  1846                                  
  1847                                  ;-211   storefunc();
  1848                                  
  1849                                  @@dofunc86:
  1850 00000BD1 E853FE                   call storefunc
  1851                                  
  1852                                  ;-212   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  1853                                  
  1854 00000BD4 68[F20D]                 push dofunc_1
  1855 00000BD7 E8F23D                   call prs
  1856 00000BDA 83C402                   add  sp, 2
  1857 00000BDD 8D062B81                 lea  ax, [symbol]
  1858 00000BE1 50                       push ax
  1859 00000BE2 E8E73D                   call prs
  1860 00000BE5 83C402                   add  sp, 2
  1861 00000BE8 68[F70D]                 push dofunc_2
  1862 00000BEB E8DE3D                   call prs
  1863 00000BEE 83C402                   add  sp, 2
  1864                                  
  1865                                  ;-213   expect('('); LTop=LSTART;  i=0;
  1866                                  
  1867 00000BF1 6A28                     push 40
  1868 00000BF3 E8C33C                   call expect
  1869 00000BF6 83C402                   add  sp, 2
  1870 00000BF9 B8C800                   mov ax, 200
  1871 00000BFC A3[3500]                 mov word [LTop], ax
  1872 00000BFF B80000                   mov ax, 0
  1873 00000C02 8946FC                   mov [bp-4], ax
  1874                                  
  1875                                  ;-214   if (istoken(')')==0) { narg=2; 
  1876                                  
  1877 00000C05 6A29                     push 41
  1878 00000C07 E88D3C                   call istoken
  1879 00000C0A 83C402                   add  sp, 2
  1880 00000C0D 83F800                   cmp ax, 0
  1881 00000C10 0F854600                 jne @@dofunc87
  1882 00000C14 B80200                   mov ax, 2
  1883 00000C17 8946FA                   mov [bp-6], ax
  1884                                  
  1885                                  ;-215     do { typeName();  addlocal(); narg+=2;
  1886                                  
  1887                                  @@dofunc88:
  1888 00000C1A E841FC                   call typeName
  1889 00000C1D E87CFE                   call addlocal
  1890 00000C20 8346FA02                 add  word[bp-6], 2
  1891                                  
  1892                                  ;-216          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  1893                                  
  1894 00000C24 8B46FA                   mov ax, [bp-6]
  1895 00000C27 8B1E[3500]               mov bx, [LTop]
  1896 00000C2B D1E3                     shl bx, 1
  1897 00000C2D 8987EB8A                 mov [GData+bx], ax
  1898 00000C31 A0[4100]                 mov al, [iswidth]
  1899 00000C34 3C04                     cmp al, 4
  1900 00000C36 0F850400                 jne @@dofunc89
  1901 00000C3A 8346FA02                 add  word[bp-6], 2
  1902                                  @@dofunc89:
  1903 00000C3E FF06[3500]               inc  word[LTop]
  1904                                  
  1905                                  ;-217     while (istoken(','));  expect(')'); }
  1906                                  
  1907 00000C42 6A2C                     push 44
  1908 00000C44 E8503C                   call istoken
  1909 00000C47 83C402                   add  sp, 2
  1910 00000C4A 08C0                     or  al, al
  1911 00000C4C 0F840200                 je @@dofunc90
  1912 00000C50 EBC8                     jmp @@dofunc88
  1913                                  @@dofunc90:
  1914 00000C52 6A29                     push 41
  1915 00000C54 E8623C                   call expect
  1916 00000C57 83C402                   add  sp, 2
  1917                                  
  1918                                  ;-218     
  1919                                  
  1920                                  
  1921                                  ;-219   expect('{'); /*body*/
  1922                                  
  1923                                  @@dofunc87:
  1924 00000C5A 6A7B                     push 123
  1925 00000C5C E85A3C                   call expect
  1926 00000C5F 83C402                   add  sp, 2
  1927                                  
  1928                                  ;-220   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  1929                                  
  1930 00000C62 B80000                   mov ax, 0
  1931 00000C65 8946FE                   mov [bp-2], ax
  1932 00000C68 B80000                   mov ax, 0
  1933 00000C6B A3[2D00]                 mov word [nreturn], ax
  1934 00000C6E B80000                   mov ax, 0
  1935 00000C71 A3[2B00]                 mov word [nconst], ax
  1936 00000C74 B80000                   mov ax, 0
  1937 00000C77 8946FC                   mov [bp-4], ax
  1938                                  
  1939                                  ;-221   while(isvariable()) {
  1940                                  
  1941                                  @@dofunc91:
  1942 00000C7A E8BC01                   call isvariable
  1943 00000C7D 08C0                     or  al, al
  1944 00000C7F 0F849200                 je @@dofunc92
  1945                                  
  1946                                  ;-222     do {typeName();
  1947                                  
  1948                                  @@dofunc93:
  1949 00000C83 E8D8FB                   call typeName
  1950                                  
  1951                                  ;-223         checknamelen();
  1952                                  
  1953 00000C86 E895F4                   call checknamelen
  1954                                  
  1955                                  ;-224         addlocal(); nloc-=2;
  1956                                  
  1957 00000C89 E810FE                   call addlocal
  1958 00000C8C 836EFE02                 sub  word[bp-2], 2
  1959                                  
  1960                                  ;-225         if (iswidth == 4) nloc-=2;
  1961                                  
  1962 00000C90 A0[4100]                 mov al, [iswidth]
  1963 00000C93 3C04                     cmp al, 4
  1964 00000C95 0F850400                 jne @@dofunc94
  1965 00000C99 836EFE02                 sub  word[bp-2], 2
  1966                                  
  1967                                  ;-226         GData[LTop]=nloc;
  1968                                  
  1969                                  @@dofunc94:
  1970 00000C9D 8B46FE                   mov ax, [bp-2]
  1971 00000CA0 8B1E[3500]               mov bx, [LTop]
  1972 00000CA4 D1E3                     shl bx, 1
  1973 00000CA6 8987EB8A                 mov [GData+bx], ax
  1974                                  
  1975                                  ;-227         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  1976                                  
  1977 00000CAA 6A5B                     push 91
  1978 00000CAC E8E83B                   call istoken
  1979 00000CAF 83C402                   add  sp, 2
  1980 00000CB2 08C0                     or  al, al
  1981 00000CB4 0F843D00                 je @@dofunc95
  1982 00000CB8 B82600                   mov ax, 38
  1983 00000CBB A2[3B00]                 mov byte [istype], al
  1984 00000CBE B82600                   mov ax, 38
  1985 00000CC1 8B1E[3500]               mov bx, [LTop]
  1986 00000CC5 8887B782                 mov [GType+bx], al
  1987 00000CC9 680101                   push 257
  1988 00000CCC E8EA3B                   call expect
  1989 00000CCF 83C402                   add  sp, 2
  1990 00000CD2 6A5D                     push 93
  1991 00000CD4 E8E23B                   call expect
  1992 00000CD7 83C402                   add  sp, 2
  1993                                  
  1994                                  ;-228             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  1995                                  
  1996 00000CDA 8B46FE                   mov ax, [bp-2]
  1997 00000CDD 2B06[3700]               sub ax, [lexval]
  1998 00000CE1 8946FE                   mov [bp-2], ax
  1999 00000CE4 8346FE02                 add  word[bp-2], 2
  2000 00000CE8 8B46FE                   mov ax, [bp-2]
  2001 00000CEB 8B1E[3500]               mov bx, [LTop]
  2002 00000CEF D1E3                     shl bx, 1
  2003 00000CF1 8987EB8A                 mov [GData+bx], ax
  2004                                  
  2005                                  ;-229         LTop++;
  2006                                  
  2007                                  @@dofunc95:
  2008 00000CF5 FF06[3500]               inc  word[LTop]
  2009                                  
  2010                                  ;-230       } while (istoken(',')); expect(';'); }
  2011                                  
  2012 00000CF9 6A2C                     push 44
  2013 00000CFB E8993B                   call istoken
  2014 00000CFE 83C402                   add  sp, 2
  2015 00000D01 08C0                     or  al, al
  2016 00000D03 0F840300                 je @@dofunc96
  2017 00000D07 E979FF                   jmp @@dofunc93
  2018                                  @@dofunc96:
  2019 00000D0A 6A3B                     push 59
  2020 00000D0C E8AA3B                   call expect
  2021 00000D0F 83C402                   add  sp, 2
  2022                                  
  2023                                  ;-231   listproc(); 
  2024                                  
  2025 00000D12 E965FF                   jmp @@dofunc91
  2026                                  @@dofunc92:
  2027 00000D15 E89F40                   call listproc
  2028                                  
  2029                                  ;-232   if (LTop>LSTART){prs(";\n ENTER  "); 
  2030                                  
  2031 00000D18 A1[3500]                 mov ax, [LTop]
  2032 00000D1B 3DC800                   cmp ax, 200
  2033 00000D1E 0F8E2700                 jle @@dofunc97
  2034 00000D22 68[090E]                 push dofunc_3
  2035 00000D25 E8A43C                   call prs
  2036 00000D28 83C402                   add  sp, 2
  2037                                  
  2038                                  ;-233     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  2039                                  
  2040 00000D2B FF76FE                   push word [bp-2]
  2041 00000D2E E8804B                   call mkneg
  2042 00000D31 83C402                   add  sp, 2
  2043 00000D34 8946FE                   mov [bp-2], ax
  2044 00000D37 FF76FE                   push word [bp-2]
  2045 00000D3A E8863D                   call pint1
  2046 00000D3D 83C402                   add  sp, 2
  2047 00000D40 68[150E]                 push dofunc_4
  2048 00000D43 E8863C                   call prs
  2049 00000D46 83C402                   add  sp, 2
  2050                                  
  2051                                  ;-234   while(istoken('}')==0)   stmt();
  2052                                  
  2053                                  @@dofunc97:
  2054                                  @@dofunc98:
  2055 00000D49 6A7D                     push 125
  2056 00000D4B E8493B                   call istoken
  2057 00000D4E 83C402                   add  sp, 2
  2058 00000D51 83F800                   cmp ax, 0
  2059 00000D54 0F850500                 jne @@dofunc99
  2060 00000D58 E80C2D                   call stmt
  2061                                  
  2062                                  ;-235   if (nreturn) { prs("\n@@retn:");}
  2063                                  
  2064 00000D5B EBEC                     jmp @@dofunc98
  2065                                  @@dofunc99:
  2066 00000D5D A1[2D00]                 mov ax, [nreturn]
  2067 00000D60 08C0                     or  al, al
  2068 00000D62 0F840900                 je @@dofunc100
  2069 00000D66 68[180E]                 push dofunc_5
  2070 00000D69 E8603C                   call prs
  2071 00000D6C 83C402                   add  sp, 2
  2072                                  
  2073                                  ;-236   if (LTop > LSTART) prs(" LEAVE");
  2074                                  
  2075                                  @@dofunc100:
  2076 00000D6F A1[3500]                 mov ax, [LTop]
  2077 00000D72 3DC800                   cmp ax, 200
  2078 00000D75 0F8E0900                 jle @@dofunc101
  2079 00000D79 68[220E]                 push dofunc_6
  2080 00000D7C E84D3C                   call prs
  2081 00000D7F 83C402                   add  sp, 2
  2082                                  
  2083                                  ;-237   prs("\n ret"); prs("\n; ENDP"); 
  2084                                  
  2085                                  @@dofunc101:
  2086 00000D82 68[290E]                 push dofunc_7
  2087 00000D85 E8443C                   call prs
  2088 00000D88 83C402                   add  sp, 2
  2089 00000D8B 68[300E]                 push dofunc_8
  2090 00000D8E E83B3C                   call prs
  2091 00000D91 83C402                   add  sp, 2
  2092                                  
  2093                                  ;-238   *cloc=0; prs(co); maxco1=strlen(co);
  2094                                  
  2095 00000D94 B80000                   mov ax, 0
  2096 00000D97 8B1E[1D00]               mov  bx, [cloc]
  2097 00000D9B 8807                     mov  [bx], al
  2098 00000D9D 8D063075                 lea  ax, [co]
  2099 00000DA1 50                       push ax
  2100 00000DA2 E8273C                   call prs
  2101 00000DA5 83C402                   add  sp, 2
  2102 00000DA8 8D063075                 lea  ax, [co]
  2103 00000DAC 50                       push ax
  2104 00000DAD E8B24B                   call strlen
  2105 00000DB0 83C402                   add  sp, 2
  2106 00000DB3 A3[1B00]                 mov word [maxco1], ax
  2107                                  
  2108                                  ;-239   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2109                                  
  2110 00000DB6 A1[1B00]                 mov ax, [maxco1]
  2111 00000DB9 3B06[1900]               cmp ax, [maxco]
  2112 00000DBD 0F8E1600                 jle @@dofunc102
  2113 00000DC1 A1[1B00]                 mov ax, [maxco1]
  2114 00000DC4 A3[1900]                 mov word [maxco], ax
  2115 00000DC7 8D06AB81                 lea  ax, [fname]
  2116 00000DCB 50                       push ax
  2117 00000DCC 8D06E880                 lea  ax, [coname]
  2118 00000DD0 50                       push ax
  2119 00000DD1 E8B64B                   call strcpy
  2120 00000DD4 83C404                   add  sp, 4
  2121                                  
  2122                                  ;-240 }
  2123                                  
  2124                                  @@dofunc102:
  2125                                  
  2126                                  ;-241 int isvariable() {
  2127 00000DD7 C9                       LEAVE
  2128 00000DD8 C3                       ret
  2129                                  ; ENDP
  2130 00000DD9 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2131 00000DE2 616C72656164792064-
  2132 00000DEB 6566696E656400     
  2133 00000DF2 5C6E5C6E00              dofunc_1 db "\n\n",0
  2134 00000DF7 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2135 00000E00 50524F43202A2A2A00 
  2136 00000E09 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2137 00000E12 202000             
  2138 00000E15 2C3000                  dofunc_4 db ",0",0
  2139 00000E18 5C6E40407265746E3A-     dofunc_5 db "\n@@retn:",0
  2140 00000E21 00                 
  2141 00000E22 204C4541564500          dofunc_6 db " LEAVE",0
  2142 00000E29 5C6E2072657400          dofunc_7 db "\n ret",0
  2143 00000E30 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2144                                  
  2145                                  isvariable:  ; *** PROC ***
  2146                                  
  2147                                  ;-242   if(token==T_SIGNED) goto v1;   if(token==T_UNSIGNED) goto v1;
  2148                                  
  2149 00000E39 A1[2300]                 mov ax, [token]
  2150 00000E3C 3D1302                   cmp ax, 531
  2151 00000E3F 0F850300                 jne @@isvariable103
  2152 00000E43 E95400                   jmp @@v1
  2153                                  @@isvariable103:
  2154 00000E46 A1[2300]                 mov ax, [token]
  2155 00000E49 3D1402                   cmp ax, 532
  2156 00000E4C 0F850300                 jne @@isvariable104
  2157 00000E50 E94700                   jmp @@v1
  2158                                  
  2159                                  ;-243   if(token==T_CHAR)   goto v1;   if(token==T_INT)      goto v1;
  2160                                  
  2161                                  @@isvariable104:
  2162 00000E53 A1[2300]                 mov ax, [token]
  2163 00000E56 3D1202                   cmp ax, 530
  2164 00000E59 0F850300                 jne @@isvariable105
  2165 00000E5D E93A00                   jmp @@v1
  2166                                  @@isvariable105:
  2167 00000E60 A1[2300]                 mov ax, [token]
  2168 00000E63 3D0502                   cmp ax, 517
  2169 00000E66 0F850300                 jne @@isvariable106
  2170 00000E6A E92D00                   jmp @@v1
  2171                                  
  2172                                  ;-244   if(token==T_SHORT)  goto v1;   if(token==T_LONG)     goto v1;
  2173                                  
  2174                                  @@isvariable106:
  2175 00000E6D A1[2300]                 mov ax, [token]
  2176 00000E70 3D1602                   cmp ax, 534
  2177 00000E73 0F850300                 jne @@isvariable107
  2178 00000E77 E92000                   jmp @@v1
  2179                                  @@isvariable107:
  2180 00000E7A A1[2300]                 mov ax, [token]
  2181 00000E7D 3D1502                   cmp ax, 533
  2182 00000E80 0F850300                 jne @@isvariable108
  2183 00000E84 E91300                   jmp @@v1
  2184                                  
  2185                                  ;-245   if(token==T_UINT32) goto v1;   return 0;  v1: return 1;
  2186                                  
  2187                                  @@isvariable108:
  2188 00000E87 A1[2300]                 mov ax, [token]
  2189 00000E8A 3D2102                   cmp ax, 545
  2190 00000E8D 0F850300                 jne @@isvariable109
  2191 00000E91 E90600                   jmp @@v1
  2192                                  @@isvariable109:
  2193 00000E94 B80000                   mov ax, 0
  2194 00000E97 E90600                   jmp @@retn
  2195                                  @@v1:
  2196 00000E9A B80100                   mov ax, 1
  2197 00000E9D E90000                   jmp @@retn
  2198                                  
  2199                                  ;-246 }
  2200                                  
  2201                                  
  2202                                  ;-247                   
  2203                                  
  2204                                  
  2205                                  ;-248 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2206                                  
  2207                                  @@retn:
  2208 00000EA0 C3                       ret
  2209                                  ; ENDP
  2210 00000EA1 0000                    mod1 dw 0
  2211 00000EA3 0000                    ireg1 dw 0
  2212 00000EA5 0000                    idx1 dw 0
  2213 00000EA7 0000                    ids1 dw 0
  2214 00000EA9 0000                    idw1 dw 0
  2215 00000EAB 0000                    idt1 dw 0
  2216 00000EAD 0000                    val1 dw 0
  2217                                  
  2218                                  ;-249 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2219                                  
  2220 00000EAF 0000                    mod2 dw 0
  2221 00000EB1 0000                    ireg2 dw 0
  2222 00000EB3 0000                    idx2 dw 0
  2223 00000EB5 0000                    ids2 dw 0
  2224 00000EB7 0000                    idw2 dw 0
  2225 00000EB9 0000                    idt2 dw 0
  2226 00000EBB 0000                    val2 dw 0
  2227                                  
  2228                                  ;-250 
  2229                                  
  2230                                  
  2231                                  ;-251 int pexpr() {expect('('); iscmp=0; 
  2232                                  
  2233                                  
  2234                                  pexpr:  ; *** PROC ***
  2235 00000EBD 6A28                     push 40
  2236 00000EBF E8F739                   call expect
  2237 00000EC2 83C402                   add  sp, 2
  2238 00000EC5 B80000                   mov ax, 0
  2239 00000EC8 A3[2900]                 mov word [iscmp], ax
  2240                                  
  2241                                  ;-252   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2242                                  
  2243 00000ECB A1[2300]                 mov ax, [token]
  2244 00000ECE 3D0001                   cmp ax, 256
  2245 00000ED1 0F853400                 jne @@pexpr110
  2246 00000ED5 68[330F]                 push pexpr_0
  2247 00000ED8 8D062B81                 lea  ax, [symbol]
  2248 00000EDC 50                       push ax
  2249 00000EDD E8D14B                   call eqstr
  2250 00000EE0 83C404                   add  sp, 4
  2251 00000EE3 08C0                     or  al, al
  2252 00000EE5 0F840600                 je @@pexpr111
  2253 00000EE9 E85F00                   call constantexpr
  2254 00000EEC E94300                   jmp @@retn
  2255                                  
  2256                                  ;-253     ireg1=checkreg();
  2257                                  
  2258                                  @@pexpr111:
  2259 00000EEF E8E107                   call checkreg
  2260 00000EF2 A3[A30E]                 mov word [ireg1], ax
  2261                                  
  2262                                  ;-254     if (ireg1) { doreg1(1); return; }  }
  2263                                  
  2264 00000EF5 A1[A30E]                 mov ax, [ireg1]
  2265 00000EF8 08C0                     or  al, al
  2266 00000EFA 0F840B00                 je @@pexpr112
  2267 00000EFE 6A01                     push 1
  2268 00000F00 E8E405                   call doreg1
  2269 00000F03 83C402                   add  sp, 2
  2270 00000F06 E92900                   jmp @@retn
  2271                                  @@pexpr112:
  2272                                  
  2273                                  ;-255   exprstart(); if (iscmp==0) prs("\n or  al, al\n je @@");  prs(fname);
  2274                                  
  2275                                  @@pexpr110:
  2276 00000F09 E85601                   call exprstart
  2277 00000F0C A1[2900]                 mov ax, [iscmp]
  2278 00000F0F 83F800                   cmp ax, 0
  2279 00000F12 0F850900                 jne @@pexpr113
  2280 00000F16 68[350F]                 push pexpr_1
  2281 00000F19 E8B03A                   call prs
  2282 00000F1C 83C402                   add  sp, 2
  2283                                  @@pexpr113:
  2284 00000F1F 8D06AB81                 lea  ax, [fname]
  2285 00000F23 50                       push ax
  2286 00000F24 E8A53A                   call prs
  2287 00000F27 83C402                   add  sp, 2
  2288                                  
  2289                                  ;-256   expect(')'); }           /*error1("Vergleich fehlt");*/
  2290                                  
  2291 00000F2A 6A29                     push 41
  2292 00000F2C E88A39                   call expect
  2293 00000F2F 83C402                   add  sp, 2
  2294                                  
  2295                                  ;-257 
  2296                                  
  2297                                  
  2298                                  ;-258 int constantexpr() { int mode; int id1;int ids;
  2299                                  
  2300                                  @@retn:
  2301 00000F32 C3                       ret
  2302                                  ; ENDP
  2303 00000F33 5F00                    pexpr_0 db "_",0
  2304 00000F35 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je @@",0
  2305 00000F3E 2C20616C5C6E206A65-
  2306 00000F47 20404000           
  2307                                  
  2308                                  constantexpr:  ; *** PROC ***
  2309                                  
  2310                                  ;-259   token=getlex();   mode=typeName();  
  2311                                  
  2312                                  ;Function : constantexpr, Number of local variables: 3
  2313                                  ;   # type sign width addr used name   list of local variables
  2314                                  ;  200 var sign word   258 NULL mode = bp-2
  2315                                  ;  201 var sign word   258 NULL id1 = bp-4
  2316                                  ;  202 var sign word   258 NULL ids = bp-6;
  2317 00000F4B C8060000                 ENTER  6,0
  2318 00000F4F E87E31                   call getlex
  2319 00000F52 A3[2300]                 mov word [token], ax
  2320 00000F55 E806F9                   call typeName
  2321 00000F58 8946FE                   mov [bp-2], ax
  2322                                  
  2323                                  ;-260   id1=searchname(); gettypes(id1); ids=signi;
  2324                                  
  2325 00000F5B E831F8                   call searchname
  2326 00000F5E 8946FC                   mov [bp-4], ax
  2327 00000F61 FF76FC                   push word [bp-4]
  2328 00000F64 E8EAF6                   call gettypes
  2329 00000F67 83C402                   add  sp, 2
  2330 00000F6A A1[3C00]                 mov ax, [signi]
  2331 00000F6D 8946FA                   mov [bp-6], ax
  2332                                  
  2333                                  ;-261   if (isrelational() ==0) error1("Relational expression expected");
  2334                                  
  2335 00000F70 E8F630                   call isrelational
  2336 00000F73 83F800                   cmp ax, 0
  2337 00000F76 0F850900                 jne @@constantexpr114
  2338 00000F7A 68[1210]                 push constantexpr_0
  2339 00000F7D E8353D                   call error1
  2340 00000F80 83C402                   add  sp, 2
  2341                                  
  2342                                  ;-262   expect(T_CONST);  prs(" ; constant expression");
  2343                                  
  2344                                  @@constantexpr114:
  2345 00000F83 680101                   push 257
  2346 00000F86 E83039                   call expect
  2347 00000F89 83C402                   add  sp, 2
  2348 00000F8C 68[3110]                 push constantexpr_1
  2349 00000F8F E83A3A                   call prs
  2350 00000F92 83C402                   add  sp, 2
  2351                                  
  2352                                  ;-263   prs("\ncmp "); 
  2353                                  
  2354 00000F95 68[4810]                 push constantexpr_2
  2355 00000F98 E8313A                   call prs
  2356 00000F9B 83C402                   add  sp, 2
  2357                                  
  2358                                  ;-264   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2359                                  
  2360 00000F9E FF76FC                   push word [bp-4]
  2361 00000FA1 E8ADF6                   call gettypes
  2362 00000FA4 83C402                   add  sp, 2
  2363 00000FA7 A1[4200]                 mov ax, [wi]
  2364 00000FAA 83F802                   cmp ax, 2
  2365 00000FAD 0F850C00                 jne @@constantexpr115
  2366 00000FB1 68[4F10]                 push constantexpr_3
  2367 00000FB4 E8153A                   call prs
  2368 00000FB7 83C402                   add  sp, 2
  2369 00000FBA E90900                   jmp @@constantexpr116
  2370                                  @@constantexpr115:
  2371 00000FBD 68[5410]                 push constantexpr_4
  2372 00000FC0 E8093A                   call prs
  2373 00000FC3 83C402                   add  sp, 2
  2374                                  
  2375                                  ;-265   if (NASM==0) prs(" ptr ");
  2376                                  
  2377                                  @@constantexpr116:
  2378 00000FC6 A0[1400]                 mov al, [NASM]
  2379 00000FC9 3C00                     cmp al, 0
  2380 00000FCB 0F850900                 jne @@constantexpr117
  2381 00000FCF 68[5910]                 push constantexpr_5
  2382 00000FD2 E8F739                   call prs
  2383 00000FD5 83C402                   add  sp, 2
  2384                                  
  2385                                  ;-266   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2386                                  
  2387                                  @@constantexpr117:
  2388 00000FD8 FF76FC                   push word [bp-4]
  2389 00000FDB E8FBF0                   call v
  2390 00000FDE 83C402                   add  sp, 2
  2391 00000FE1 68[5F10]                 push constantexpr_6
  2392 00000FE4 E8E539                   call prs
  2393 00000FE7 83C402                   add  sp, 2
  2394 00000FEA FF36[3700]               push word [lexval]
  2395 00000FEE E8353B                   call prunsign1
  2396 00000FF1 83C402                   add  sp, 2
  2397 00000FF4 FF76FA                   push word [bp-6]
  2398 00000FF7 E8202D                   call cmpneg
  2399 00000FFA 83C402                   add  sp, 2
  2400 00000FFD 8D06AB81                 lea  ax, [fname]
  2401 00001001 50                       push ax
  2402 00001002 E8C739                   call prs
  2403 00001005 83C402                   add  sp, 2
  2404                                  
  2405                                  ;-267   expect(')');
  2406                                  
  2407 00001008 6A29                     push 41
  2408 0000100A E8AC38                   call expect
  2409 0000100D 83C402                   add  sp, 2
  2410                                  
  2411                                  ;-268 }  
  2412                                  
  2413                                  
  2414                                  ;-269 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2415 00001010 C9                       LEAVE
  2416 00001011 C3                       ret
  2417                                  ; ENDP
  2418 00001012 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2419 0000101B 6C2065787072657373-
  2420 00001024 696F6E206578706563-
  2421 0000102D 74656400           
  2422 00001031 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2423 0000103A 6E7420657870726573-
  2424 00001043 73696F6E00         
  2425 00001048 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2426 0000104F 776F726400              constantexpr_3 db "word",0
  2427 00001054 6279746500              constantexpr_4 db "byte",0
  2428 00001059 207074722000            constantexpr_5 db " ptr ",0
  2429 0000105F 2C2000                  constantexpr_6 db ", ",0
  2430                                  
  2431                                  exprstart:  ; *** PROC ***
  2432 00001062 68[8A10]                 push exprstart_0
  2433 00001065 8D062B81                 lea  ax, [symbol]
  2434 00001069 50                       push ax
  2435 0000106A E8444A                   call eqstr
  2436 0000106D 83C404                   add  sp, 4
  2437 00001070 08C0                     or  al, al
  2438 00001072 0F840B00                 je @@exprstart118
  2439 00001076 6A00                     push 0
  2440 00001078 E81100                   call expr2
  2441 0000107B 83C402                   add  sp, 2
  2442 0000107E E90800                   jmp @@exprstart119
  2443                                  @@exprstart118:
  2444 00001081 6A00                     push 0
  2445 00001083 E8CC0A                   call expr
  2446 00001086 83C402                   add  sp, 2
  2447                                  @@exprstart119:
  2448                                  
  2449                                  ;-270 
  2450                                  
  2451                                  
  2452                                  ;-271 int expr2(int kind) {  int i;
  2453                                  
  2454 00001089 C3                       ret
  2455                                  ; ENDP
  2456 0000108A 5F00                    exprstart_0 db "_",0
  2457                                  
  2458                                  expr2:  ; *** PROC ***
  2459                                  
  2460                                  ;-272   if(kind != 1) token=getlex();
  2461                                  
  2462                                  ;Function : expr2, Number of local variables: 2
  2463                                  ;   # type sign width addr used name   list of local variables
  2464                                  ;  200 var sign word   271 NULL kind = bp+4
  2465                                  ;  201 var sign word   271 NULL i = bp-2;
  2466 0000108C C8020000                 ENTER  2,0
  2467 00001090 8B4604                   mov ax, [bp+4]
  2468 00001093 83F801                   cmp ax, 1
  2469 00001096 0F840600                 je  @@expr2120
  2470 0000109A E83330                   call getlex
  2471 0000109D A3[2300]                 mov word [token], ax
  2472                                  
  2473                                  ;-273   mod1=typeName();
  2474                                  
  2475                                  @@expr2120:
  2476 000010A0 E8BBF7                   call typeName
  2477 000010A3 A3[A10E]                 mov word [mod1], ax
  2478                                  
  2479                                  ;-274   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2480                                  
  2481 000010A6 A1[A10E]                 mov ax, [mod1]
  2482 000010A9 08C0                     or  al, al
  2483 000010AB 0F840900                 je @@expr2121
  2484 000010AF 68[6813]                 push expr2_0
  2485 000010B2 E8003C                   call error1
  2486 000010B5 83C402                   add  sp, 2
  2487                                  
  2488                                  ;-275   ireg1=checkreg();
  2489                                  
  2490                                  @@expr2121:
  2491 000010B8 E81806                   call checkreg
  2492 000010BB A3[A30E]                 mov word [ireg1], ax
  2493                                  
  2494                                  ;-276   if (ireg1) { doreg1(0); return; }
  2495                                  
  2496 000010BE A1[A30E]                 mov ax, [ireg1]
  2497 000010C1 08C0                     or  al, al
  2498 000010C3 0F840B00                 je @@expr2122
  2499 000010C7 6A00                     push 0
  2500 000010C9 E81B04                   call doreg1
  2501 000010CC 83C402                   add  sp, 2
  2502 000010CF E99402                   jmp @@retn
  2503                                  
  2504                                  ;-277   if (ireg1 == 0) { idx1=searchname();
  2505                                  
  2506                                  @@expr2122:
  2507 000010D2 A1[A30E]                 mov ax, [ireg1]
  2508 000010D5 83F800                   cmp ax, 0
  2509 000010D8 0F853400                 jne @@expr2123
  2510 000010DC E8B0F6                   call searchname
  2511 000010DF A3[A50E]                 mov word [idx1], ax
  2512                                  
  2513                                  ;-278     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  2514                                  
  2515 000010E2 FF36[A50E]               push word [idx1]
  2516 000010E6 E868F5                   call gettypes
  2517 000010E9 83C402                   add  sp, 2
  2518 000010EC A1[3C00]                 mov ax, [signi]
  2519 000010EF A3[A70E]                 mov word [ids1], ax
  2520 000010F2 A1[4200]                 mov ax, [wi]
  2521 000010F5 A3[A90E]                 mov word [idw1], ax
  2522 000010F8 A1[3900]                 mov ax, [typei]
  2523 000010FB A3[AB0E]                 mov word [idt1], ax
  2524                                  
  2525                                  ;-279     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  2526                                  
  2527 000010FE A1[AB0E]                 mov ax, [idt1]
  2528 00001101 08C0                     or  al, al
  2529 00001103 0F840900                 je @@expr2124
  2530 00001107 68[9713]                 push expr2_1
  2531 0000110A E8A83B                   call error1
  2532 0000110D 83C402                   add  sp, 2
  2533                                  @@expr2124:
  2534                                  
  2535                                  ;-280   
  2536                                  
  2537                                  
  2538                                  ;-281   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  2539                                  
  2540                                  @@expr2123:
  2541 00001110 E8562F                   call isrelational
  2542 00001113 08C0                     or  al, al
  2543 00001115 0F840900                 je @@expr2125
  2544 00001119 68[C213]                 push expr2_2
  2545 0000111C E8963B                   call error1
  2546 0000111F 83C402                   add  sp, 2
  2547                                  
  2548                                  ;-282   }
  2549                                  
  2550                                  
  2551                                  ;-283   if (istoken('=') == 0) error1("Assign expected");
  2552                                  
  2553                                  @@expr2125:
  2554 00001122 6A3D                     push 61
  2555 00001124 E87037                   call istoken
  2556 00001127 83C402                   add  sp, 2
  2557 0000112A 83F800                   cmp ax, 0
  2558 0000112D 0F850900                 jne @@expr2126
  2559 00001131 68[E513]                 push expr2_3
  2560 00001134 E87E3B                   call error1
  2561 00001137 83C402                   add  sp, 2
  2562                                  
  2563                                  ;-284   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  2564                                  
  2565                                  @@expr2126:
  2566 0000113A 680101                   push 257
  2567 0000113D E85737                   call istoken
  2568 00001140 83C402                   add  sp, 2
  2569 00001143 08C0                     or  al, al
  2570 00001145 0F84AC00                 je @@expr2127
  2571 00001149 A1[3700]                 mov ax, [lexval]
  2572 0000114C A3[BB0E]                 mov word [val2], ax
  2573 0000114F 68[F513]                 push expr2_4
  2574 00001152 E87738                   call prs
  2575 00001155 83C402                   add  sp, 2
  2576                                  
  2577                                  ;-285     prs("\nmov ");
  2578                                  
  2579 00001158 68[0C14]                 push expr2_5
  2580 0000115B E86E38                   call prs
  2581 0000115E 83C402                   add  sp, 2
  2582                                  
  2583                                  ;-286     if (idw1 == 1) prs("byte ");
  2584                                  
  2585 00001161 A1[A90E]                 mov ax, [idw1]
  2586 00001164 83F801                   cmp ax, 1
  2587 00001167 0F850900                 jne @@expr2128
  2588 0000116B 68[1314]                 push expr2_6
  2589 0000116E E85B38                   call prs
  2590 00001171 83C402                   add  sp, 2
  2591                                  
  2592                                  ;-287     if (idw1 == 2) prs("word ");
  2593                                  
  2594                                  @@expr2128:
  2595 00001174 A1[A90E]                 mov ax, [idw1]
  2596 00001177 83F802                   cmp ax, 2
  2597 0000117A 0F850900                 jne @@expr2129
  2598 0000117E 68[1914]                 push expr2_7
  2599 00001181 E84838                   call prs
  2600 00001184 83C402                   add  sp, 2
  2601                                  
  2602                                  ;-288     if (idw1 == 4) prs("dword ");
  2603                                  
  2604                                  @@expr2129:
  2605 00001187 A1[A90E]                 mov ax, [idw1]
  2606 0000118A 83F804                   cmp ax, 4
  2607 0000118D 0F850900                 jne @@expr2130
  2608 00001191 68[1F14]                 push expr2_8
  2609 00001194 E83538                   call prs
  2610 00001197 83C402                   add  sp, 2
  2611                                  
  2612                                  ;-289     if (NASM == 0) prs("ptr ");
  2613                                  
  2614                                  @@expr2130:
  2615 0000119A A0[1400]                 mov al, [NASM]
  2616 0000119D 3C00                     cmp al, 0
  2617 0000119F 0F850900                 jne @@expr2131
  2618 000011A3 68[2614]                 push expr2_9
  2619 000011A6 E82338                   call prs
  2620 000011A9 83C402                   add  sp, 2
  2621                                  
  2622                                  ;-290     v(idx1);
  2623                                  
  2624                                  @@expr2131:
  2625 000011AC FF36[A50E]               push word [idx1]
  2626 000011B0 E826EF                   call v
  2627 000011B3 83C402                   add  sp, 2
  2628                                  
  2629                                  ;-291     prs(", "); prunsign1(val2);
  2630                                  
  2631 000011B6 68[2B14]                 push expr2_10
  2632 000011B9 E81038                   call prs
  2633 000011BC 83C402                   add  sp, 2
  2634 000011BF FF36[BB0E]               push word [val2]
  2635 000011C3 E86039                   call prunsign1
  2636 000011C6 83C402                   add  sp, 2
  2637                                  
  2638                                  ;-292     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  2639                                  
  2640 000011C9 A1[A50E]                 mov ax, [idx1]
  2641 000011CC 3DC800                   cmp ax, 200 ;unsigned : 1
  2642 000011CF 0F8C1F00                 jl  @@expr2132
  2643 000011D3 FF36[A50E]               push word [idx1]
  2644 000011D7 E82EF5                   call adrofname
  2645 000011DA 83C402                   add  sp, 2
  2646 000011DD 8946FE                   mov [bp-2], ax
  2647 000011E0 68[2E14]                 push expr2_11
  2648 000011E3 E8E637                   call prs
  2649 000011E6 83C402                   add  sp, 2
  2650 000011E9 FF76FE                   push word [bp-2]
  2651 000011EC E8DD37                   call prs
  2652 000011EF 83C402                   add  sp, 2
  2653                                  @@expr2132:
  2654 000011F2 E97101                   jmp @@retn
  2655                                  
  2656                                  ;-293   
  2657                                  
  2658                                  
  2659                                  ;-294   mod1=typeName(); ireg2=checkreg();
  2660                                  
  2661                                  @@expr2127:
  2662 000011F5 E866F6                   call typeName
  2663 000011F8 A3[A10E]                 mov word [mod1], ax
  2664 000011FB E8D504                   call checkreg
  2665 000011FE A3[B10E]                 mov word [ireg2], ax
  2666                                  
  2667                                  ;-295   if (ireg2) { prs("\nmov ");
  2668                                  
  2669 00001201 A1[B10E]                 mov ax, [ireg2]
  2670 00001204 08C0                     or  al, al
  2671 00001206 0F844200                 je @@expr2133
  2672 0000120A 68[3114]                 push expr2_12
  2673 0000120D E8BC37                   call prs
  2674 00001210 83C402                   add  sp, 2
  2675                                  
  2676                                  ;-296     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  2677                                  
  2678 00001213 A1[A30E]                 mov ax, [ireg1]
  2679 00001216 08C0                     or  al, al
  2680 00001218 0F840D00                 je @@expr2134
  2681 0000121C FF36[A30E]               push word [ireg1]
  2682 00001220 E8BE08                   call printreg
  2683 00001223 83C402                   add  sp, 2
  2684 00001226 E90A00                   jmp @@expr2135
  2685                                  @@expr2134:
  2686 00001229 FF36[A50E]               push word [idx1]
  2687 0000122D E8A9EE                   call v
  2688 00001230 83C402                   add  sp, 2
  2689                                  @@expr2135:
  2690 00001233 68[3814]                 push expr2_13
  2691 00001236 E89337                   call prs
  2692 00001239 83C402                   add  sp, 2
  2693 0000123C FF36[B10E]               push word [ireg2]
  2694 00001240 E89E08                   call printreg
  2695 00001243 83C402                   add  sp, 2
  2696 00001246 E91D01                   jmp @@retn
  2697                                  
  2698                                  ;-297   else {
  2699                                  
  2700 00001249 E91101                   jmp @@expr2136
  2701                                  @@expr2133:
  2702                                  
  2703                                  ;-298     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  2704                                  
  2705 0000124C A1[A10E]                 mov ax, [mod1]
  2706 0000124F 83F801                   cmp ax, 1
  2707 00001252 0F850900                 jne @@expr2137
  2708 00001256 68[3B14]                 push expr2_14
  2709 00001259 E8593A                   call error1
  2710 0000125C 83C402                   add  sp, 2
  2711                                  
  2712                                  ;-299     
  2713                                  
  2714                                  
  2715                                  ;-300     idx2=searchname();
  2716                                  
  2717                                  @@expr2137:
  2718 0000125F E82DF5                   call searchname
  2719 00001262 A3[B30E]                 mov word [idx2], ax
  2720                                  
  2721                                  ;-301     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  2722                                  
  2723 00001265 FF36[B30E]               push word [idx2]
  2724 00001269 E8E5F3                   call gettypes
  2725 0000126C 83C402                   add  sp, 2
  2726 0000126F A1[3C00]                 mov ax, [signi]
  2727 00001272 A3[B50E]                 mov word [ids2], ax
  2728 00001275 A1[4200]                 mov ax, [wi]
  2729 00001278 A3[B70E]                 mov word [idw2], ax
  2730 0000127B A1[3900]                 mov ax, [typei]
  2731 0000127E A3[B90E]                 mov word [idt2], ax
  2732                                  
  2733                                  ;-302     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  2734                                  
  2735 00001281 A1[B90E]                 mov ax, [idt2]
  2736 00001284 83F801                   cmp ax, 1
  2737 00001287 0F850900                 jne @@expr2138
  2738 0000128B 68[5714]                 push expr2_15
  2739 0000128E E8243A                   call error1
  2740 00001291 83C402                   add  sp, 2
  2741                                  
  2742                                  ;-303     prs("\nmov ");
  2743                                  
  2744                                  @@expr2138:
  2745 00001294 68[7614]                 push expr2_16
  2746 00001297 E83237                   call prs
  2747 0000129A 83C402                   add  sp, 2
  2748                                  
  2749                                  ;-304     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  2750                                  
  2751 0000129D A1[A30E]                 mov ax, [ireg1]
  2752 000012A0 08C0                     or  al, al
  2753 000012A2 0F840D00                 je @@expr2139
  2754 000012A6 FF36[A30E]               push word [ireg1]
  2755 000012AA E83408                   call printreg
  2756 000012AD 83C402                   add  sp, 2
  2757 000012B0 E90900                   jmp @@expr2140
  2758                                  @@expr2139:
  2759 000012B3 68[7D14]                 push expr2_17
  2760 000012B6 E8FC39                   call error1
  2761 000012B9 83C402                   add  sp, 2
  2762                                  
  2763                                  ;-305     prs(", ");
  2764                                  
  2765                                  @@expr2140:
  2766 000012BC 68[9F14]                 push expr2_18
  2767 000012BF E80A37                   call prs
  2768 000012C2 83C402                   add  sp, 2
  2769                                  
  2770                                  ;-306     if (mod1 == 2) a(idx2);
  2771                                  
  2772 000012C5 A1[A10E]                 mov ax, [mod1]
  2773 000012C8 83F802                   cmp ax, 2
  2774 000012CB 0F850D00                 jne @@expr2141
  2775 000012CF FF36[B30E]               push word [idx2]
  2776 000012D3 E8DAED                   call a
  2777 000012D6 83C402                   add  sp, 2
  2778                                  
  2779                                  ;-307     else {
  2780                                  
  2781 000012D9 E97E00                   jmp @@expr2142
  2782                                  @@expr2141:
  2783                                  
  2784                                  ;-308       if (idw2 == 1) prs("byte ");
  2785                                  
  2786 000012DC A1[B70E]                 mov ax, [idw2]
  2787 000012DF 83F801                   cmp ax, 1
  2788 000012E2 0F850900                 jne @@expr2143
  2789 000012E6 68[A214]                 push expr2_19
  2790 000012E9 E8E036                   call prs
  2791 000012EC 83C402                   add  sp, 2
  2792                                  
  2793                                  ;-309       if (idw2 == 2) prs("word ");
  2794                                  
  2795                                  @@expr2143:
  2796 000012EF A1[B70E]                 mov ax, [idw2]
  2797 000012F2 83F802                   cmp ax, 2
  2798 000012F5 0F850900                 jne @@expr2144
  2799 000012F9 68[A814]                 push expr2_20
  2800 000012FC E8CD36                   call prs
  2801 000012FF 83C402                   add  sp, 2
  2802                                  
  2803                                  ;-310       if (idw2 == 4) prs("dword ");
  2804                                  
  2805                                  @@expr2144:
  2806 00001302 A1[B70E]                 mov ax, [idw2]
  2807 00001305 83F804                   cmp ax, 4
  2808 00001308 0F850900                 jne @@expr2145
  2809 0000130C 68[AE14]                 push expr2_21
  2810 0000130F E8BA36                   call prs
  2811 00001312 83C402                   add  sp, 2
  2812                                  
  2813                                  ;-311       if (NASM == 0) prs("ptr ");
  2814                                  
  2815                                  @@expr2145:
  2816 00001315 A0[1400]                 mov al, [NASM]
  2817 00001318 3C00                     cmp al, 0
  2818 0000131A 0F850900                 jne @@expr2146
  2819 0000131E 68[B514]                 push expr2_22
  2820 00001321 E8A836                   call prs
  2821 00001324 83C402                   add  sp, 2
  2822                                  
  2823                                  ;-312       v(idx2);
  2824                                  
  2825                                  @@expr2146:
  2826 00001327 FF36[B30E]               push word [idx2]
  2827 0000132B E8ABED                   call v
  2828 0000132E 83C402                   add  sp, 2
  2829                                  
  2830                                  ;-313       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  2831                                  
  2832 00001331 A1[B30E]                 mov ax, [idx2]
  2833 00001334 3DC800                   cmp ax, 200 ;unsigned : 1
  2834 00001337 0F8C1F00                 jl  @@expr2147
  2835 0000133B FF36[B30E]               push word [idx2]
  2836 0000133F E8C6F3                   call adrofname
  2837 00001342 83C402                   add  sp, 2
  2838 00001345 8946FE                   mov [bp-2], ax
  2839 00001348 68[BA14]                 push expr2_23
  2840 0000134B E87E36                   call prs
  2841 0000134E 83C402                   add  sp, 2
  2842 00001351 FF76FE                   push word [bp-2]
  2843 00001354 E87536                   call prs
  2844 00001357 83C402                   add  sp, 2
  2845                                  @@expr2147:
  2846                                  
  2847                                  ;-314     return;
  2848                                  
  2849                                  @@expr2142:
  2850 0000135A E90900                   jmp @@retn
  2851                                  
  2852                                  ;-315   } error1("Internal error: only const or reg allowed");
  2853                                  
  2854                                  @@expr2136:
  2855 0000135D 68[BD14]                 push expr2_24
  2856 00001360 E85239                   call error1
  2857 00001363 83C402                   add  sp, 2
  2858                                  
  2859                                  ;-316 }
  2860                                  
  2861                                  
  2862                                  ;-317 char ops[5];
  2863                                  
  2864 00001366 C9                      @@retn: LEAVE
  2865 00001367 C3                       ret
  2866                                  ; ENDP
  2867 00001368 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  2868 00001371 202620756E64202A20-
  2869 0000137A 696D20546578742028-
  2870 00001383 4C696E6B652048616E-
  2871 0000138C 64292065726C617562-
  2872 00001395 7400               
  2873 00001397 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  2874 000013A0 204172726179206F64-
  2875 000013A9 657220506F696E7465-
  2876 000013B2 72206C696E6B732065-
  2877 000013BB 726C6175627400     
  2878 000013C2 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  2879 000013CB 206E6F6368206E6963-
  2880 000013D4 687420696D706C656D-
  2881 000013DD 656E746965727400   
  2882 000013E5 41737369676E206578-     expr2_3 db "Assign expected",0
  2883 000013EE 70656374656400     
  2884 000013F5 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  2885 000013FE 6E7420657870726573-
  2886 00001407 73696F6E00         
  2887 0000140C 5C6E6D6F762000          expr2_5 db "\nmov ",0
  2888 00001413 627974652000            expr2_6 db "byte ",0
  2889 00001419 776F72642000            expr2_7 db "word ",0
  2890 0000141F 64776F72642000          expr2_8 db "dword ",0
  2891 00001426 7074722000              expr2_9 db "ptr ",0
  2892 0000142B 2C2000                  expr2_10 db ", ",0
  2893 0000142E 3B2000                  expr2_11 db "; ",0
  2894 00001431 5C6E6D6F762000          expr2_12 db "\nmov ",0
  2895 00001438 2C2000                  expr2_13 db ", ",0
  2896 0000143B 4E6F6368206B65696E-     expr2_14 db "Noch kein * im Text erlaubt",0
  2897 00001444 202A20696D20546578-
  2898 0000144D 742065726C61756274-
  2899 00001456 00                 
  2900 00001457 4E6F6368206B65696E-     expr2_15 db "Noch kein Array rechts erlaubt",0
  2901 00001460 204172726179207265-
  2902 00001469 636874732065726C61-
  2903 00001472 75627400           
  2904 00001476 5C6E6D6F762000          expr2_16 db "\nmov ",0
  2905 0000147D 4D656D20746F204D65-     expr2_17 db "Mem to Mem not allowed by x86-CPU",0
  2906 00001486 6D206E6F7420616C6C-
  2907 0000148F 6F7765642062792078-
  2908 00001498 38362D43505500     
  2909 0000149F 2C2000                  expr2_18 db ", ",0
  2910 000014A2 627974652000            expr2_19 db "byte ",0
  2911 000014A8 776F72642000            expr2_20 db "word ",0
  2912 000014AE 64776F72642000          expr2_21 db "dword ",0
  2913 000014B5 7074722000              expr2_22 db "ptr ",0
  2914 000014BA 3B2000                  expr2_23 db "; ",0
  2915 000014BD 496E7465726E616C20-     expr2_24 db "Internal error: only const or reg allowed",0
  2916 000014C6 6572726F723A206F6E-
  2917 000014CF 6C7920636F6E737420-
  2918 000014D8 6F722072656720616C-
  2919 000014E1 6C6F77656400       
  2920                                  section .bss
  2921                                  absolute 53406
  2922 0000D09E <res 00000005>          ops resb 5
  2923                                  section .text
  2924                                  
  2925                                  ;-318 int doreg1(int iscmp1) { int i;
  2926                                  
  2927                                  
  2928                                  doreg1:  ; *** PROC ***
  2929                                  
  2930                                  ;-319   if (istoken('='))          strcpy(ops, "mov");
  2931                                  
  2932                                  ;Function : doreg1, Number of local variables: 2
  2933                                  ;   # type sign width addr used name   list of local variables
  2934                                  ;  200 var sign word   318 NULL iscmp1 = bp+4
  2935                                  ;  201 var sign word   318 NULL i = bp-2;
  2936 000014E7 C8020000                 ENTER  2,0
  2937 000014EB 6A3D                     push 61
  2938 000014ED E8A733                   call istoken
  2939 000014F0 83C402                   add  sp, 2
  2940 000014F3 08C0                     or  al, al
  2941 000014F5 0F840E00                 je @@doreg1148
  2942 000014F9 68[9A16]                 push doreg1_0
  2943 000014FC 8D069ED0                 lea  ax, [ops]
  2944 00001500 50                       push ax
  2945 00001501 E88644                   call strcpy
  2946 00001504 83C404                   add  sp, 4
  2947                                  
  2948                                  ;-320   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  2949                                  
  2950                                  @@doreg1148:
  2951 00001507 68CE04                   push 1230
  2952 0000150A E88A33                   call istoken
  2953 0000150D 83C402                   add  sp, 2
  2954 00001510 08C0                     or  al, al
  2955 00001512 0F840E00                 je @@doreg1149
  2956 00001516 68[9E16]                 push doreg1_1
  2957 00001519 8D069ED0                 lea  ax, [ops]
  2958 0000151D 50                       push ax
  2959 0000151E E86944                   call strcpy
  2960 00001521 83C404                   add  sp, 4
  2961                                  
  2962                                  ;-321   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  2963                                  
  2964                                  @@doreg1149:
  2965 00001524 68CF04                   push 1231
  2966 00001527 E86D33                   call istoken
  2967 0000152A 83C402                   add  sp, 2
  2968 0000152D 08C0                     or  al, al
  2969 0000152F 0F840E00                 je @@doreg1150
  2970 00001533 68[A216]                 push doreg1_2
  2971 00001536 8D069ED0                 lea  ax, [ops]
  2972 0000153A 50                       push ax
  2973 0000153B E84C44                   call strcpy
  2974 0000153E 83C404                   add  sp, 4
  2975                                  
  2976                                  ;-322   if (istoken(T_ANDASS))     strcpy(ops, "and");
  2977                                  
  2978                                  @@doreg1150:
  2979 00001541 68D204                   push 1234
  2980 00001544 E85033                   call istoken
  2981 00001547 83C402                   add  sp, 2
  2982 0000154A 08C0                     or  al, al
  2983 0000154C 0F840E00                 je @@doreg1151
  2984 00001550 68[A616]                 push doreg1_3
  2985 00001553 8D069ED0                 lea  ax, [ops]
  2986 00001557 50                       push ax
  2987 00001558 E82F44                   call strcpy
  2988 0000155B 83C404                   add  sp, 4
  2989                                  
  2990                                  ;-323   if (istoken(T_ORASS))      strcpy(ops, "or" );
  2991                                  
  2992                                  @@doreg1151:
  2993 0000155E 68D304                   push 1235
  2994 00001561 E83333                   call istoken
  2995 00001564 83C402                   add  sp, 2
  2996 00001567 08C0                     or  al, al
  2997 00001569 0F840E00                 je @@doreg1152
  2998 0000156D 68[AA16]                 push doreg1_4
  2999 00001570 8D069ED0                 lea  ax, [ops]
  3000 00001574 50                       push ax
  3001 00001575 E81244                   call strcpy
  3002 00001578 83C404                   add  sp, 4
  3003                                  
  3004                                  ;-324   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  3005                                  
  3006                                  @@doreg1152:
  3007 0000157B 68D804                   push 1240
  3008 0000157E E81633                   call istoken
  3009 00001581 83C402                   add  sp, 2
  3010 00001584 08C0                     or  al, al
  3011 00001586 0F840E00                 je @@doreg1153
  3012 0000158A 68[AD16]                 push doreg1_5
  3013 0000158D 8D069ED0                 lea  ax, [ops]
  3014 00001591 50                       push ax
  3015 00001592 E8F543                   call strcpy
  3016 00001595 83C404                   add  sp, 4
  3017                                  
  3018                                  ;-325   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  3019                                  
  3020                                  @@doreg1153:
  3021 00001598 68D904                   push 1241
  3022 0000159B E8F932                   call istoken
  3023 0000159E 83C402                   add  sp, 2
  3024 000015A1 08C0                     or  al, al
  3025 000015A3 0F840E00                 je @@doreg1154
  3026 000015A7 68[B116]                 push doreg1_6
  3027 000015AA 8D069ED0                 lea  ax, [ops]
  3028 000015AE 50                       push ax
  3029 000015AF E8D843                   call strcpy
  3030 000015B2 83C404                   add  sp, 4
  3031                                  
  3032                                  ;-326   if (iscmp1 == 1) { token=getlex();
  3033                                  
  3034                                  @@doreg1154:
  3035 000015B5 8B4604                   mov ax, [bp+4]
  3036 000015B8 83F801                   cmp ax, 1
  3037 000015BB 0F852700                 jne @@doreg1155
  3038 000015BF E80E2B                   call getlex
  3039 000015C2 A3[2300]                 mov word [token], ax
  3040                                  
  3041                                  ;-327       if (isrelational() ==0) error1("Relational expected");
  3042                                  
  3043 000015C5 E8A12A                   call isrelational
  3044 000015C8 83F800                   cmp ax, 0
  3045 000015CB 0F850900                 jne @@doreg1156
  3046 000015CF 68[B516]                 push doreg1_7
  3047 000015D2 E8E036                   call error1
  3048 000015D5 83C402                   add  sp, 2
  3049                                  
  3050                                  ;-328       strcpy(ops, "cmp"); }
  3051                                  
  3052                                  @@doreg1156:
  3053 000015D8 68[C916]                 push doreg1_8
  3054 000015DB 8D069ED0                 lea  ax, [ops]
  3055 000015DF 50                       push ax
  3056 000015E0 E8A743                   call strcpy
  3057 000015E3 83C404                   add  sp, 4
  3058                                  
  3059                                  ;-329   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  3060                                  
  3061                                  @@doreg1155:
  3062 000015E6 E8D533                   call prnl
  3063 000015E9 8D069ED0                 lea  ax, [ops]
  3064 000015ED 50                       push ax
  3065 000015EE E8DB33                   call prs
  3066 000015F1 83C402                   add  sp, 2
  3067 000015F4 68[CD16]                 push doreg1_9
  3068 000015F7 E8D233                   call prs
  3069 000015FA 83C402                   add  sp, 2
  3070 000015FD FF36[A30E]               push word [ireg1]
  3071 00001601 E8DD04                   call printreg
  3072 00001604 83C402                   add  sp, 2
  3073 00001607 68[D016]                 push doreg1_10
  3074 0000160A E8BF33                   call prs
  3075 0000160D 83C402                   add  sp, 2
  3076                                  
  3077                                  ;-330 
  3078                                  
  3079                                  
  3080                                  ;-331   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  3081                                  
  3082 00001610 680101                   push 257
  3083 00001613 E88132                   call istoken
  3084 00001616 83C402                   add  sp, 2
  3085 00001619 08C0                     or  al, al
  3086 0000161B 0F840D00                 je @@doreg1157
  3087 0000161F FF36[3700]               push word [lexval]
  3088 00001623 E80035                   call prunsign1
  3089 00001626 83C402                   add  sp, 2
  3090 00001629 E94700                   jmp @@reg1
  3091                                  
  3092                                  ;-332   mod2=typeName(); ireg2=checkreg();
  3093                                  
  3094                                  @@doreg1157:
  3095 0000162C E82FF2                   call typeName
  3096 0000162F A3[AF0E]                 mov word [mod2], ax
  3097 00001632 E89E00                   call checkreg
  3098 00001635 A3[B10E]                 mov word [ireg2], ax
  3099                                  
  3100                                  ;-333   if (ireg2) {printreg(ireg2); goto reg1;}
  3101                                  
  3102 00001638 A1[B10E]                 mov ax, [ireg2]
  3103 0000163B 08C0                     or  al, al
  3104 0000163D 0F840D00                 je @@doreg1158
  3105 00001641 FF36[B10E]               push word [ireg2]
  3106 00001645 E89904                   call printreg
  3107 00001648 83C402                   add  sp, 2
  3108 0000164B E92500                   jmp @@reg1
  3109                                  
  3110                                  ;-334   i=searchname();  if (mod2 == 2) a(i); else v(i);
  3111                                  
  3112                                  @@doreg1158:
  3113 0000164E E83EF1                   call searchname
  3114 00001651 8946FE                   mov [bp-2], ax
  3115 00001654 A1[AF0E]                 mov ax, [mod2]
  3116 00001657 83F802                   cmp ax, 2
  3117 0000165A 0F850C00                 jne @@doreg1159
  3118 0000165E FF76FE                   push word [bp-2]
  3119 00001661 E84CEA                   call a
  3120 00001664 83C402                   add  sp, 2
  3121 00001667 E90900                   jmp @@doreg1160
  3122                                  @@doreg1159:
  3123 0000166A FF76FE                   push word [bp-2]
  3124 0000166D E869EA                   call v
  3125 00001670 83C402                   add  sp, 2
  3126                                  
  3127                                  ;-335   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3128                                  
  3129                                  @@doreg1160:
  3130                                  @@reg1:
  3131 00001673 8B4604                   mov ax, [bp+4]
  3132 00001676 83F801                   cmp ax, 1
  3133 00001679 0F851B00                 jne @@doreg1161
  3134 0000167D 6A00                     push 0
  3135 0000167F E89826                   call cmpneg
  3136 00001682 83C402                   add  sp, 2
  3137 00001685 8D06AB81                 lea  ax, [fname]
  3138 00001689 50                       push ax
  3139 0000168A E83F33                   call prs
  3140 0000168D 83C402                   add  sp, 2
  3141 00001690 6A29                     push 41
  3142 00001692 E82432                   call expect
  3143 00001695 83C402                   add  sp, 2
  3144                                  
  3145                                  ;-336 }
  3146                                  
  3147                                  @@doreg1161:
  3148                                  
  3149                                  ;-337 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3150 00001698 C9                       LEAVE
  3151 00001699 C3                       ret
  3152                                  ; ENDP
  3153 0000169A 6D6F7600                doreg1_0 db "mov",0
  3154 0000169E 61646400                doreg1_1 db "add",0
  3155 000016A2 73756200                doreg1_2 db "sub",0
  3156 000016A6 616E6400                doreg1_3 db "and",0
  3157 000016AA 6F7200                  doreg1_4 db "or",0
  3158 000016AD 73686C00                doreg1_5 db "shl",0
  3159 000016B1 73687200                doreg1_6 db "shr",0
  3160 000016B5 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3161 000016BE 6C2065787065637465-
  3162 000016C7 6400               
  3163 000016C9 636D7000                doreg1_8 db "cmp",0
  3164 000016CD 202000                  doreg1_9 db "  ",0
  3165 000016D0 2C2000                  doreg1_10 db ", ",0
  3166                                  
  3167                                  checkreg:  ; *** PROC ***
  3168                                  
  3169                                  ;-338   if (strlen(symbol) <  2) return 0;
  3170                                  
  3171 000016D3 8D062B81                 lea  ax, [symbol]
  3172 000016D7 50                       push ax
  3173 000016D8 E88742                   call strlen
  3174 000016DB 83C402                   add  sp, 2
  3175 000016DE 83F802                   cmp ax, 2
  3176 000016E1 0F8D0600                 jge @@checkreg162
  3177 000016E5 B80000                   mov ax, 0
  3178 000016E8 E94403                   jmp @@retn
  3179                                  
  3180                                  ;-339   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3181                                  
  3182                                  @@checkreg162:
  3183 000016EB 68[301A]                 push checkreg_0
  3184 000016EE 8D062B81                 lea  ax, [symbol]
  3185 000016F2 50                       push ax
  3186 000016F3 E8BB43                   call eqstr
  3187 000016F6 83C404                   add  sp, 4
  3188 000016F9 08C0                     or  al, al
  3189 000016FB 0F840600                 je @@checkreg163
  3190 000016FF B80100                   mov ax, 1
  3191 00001702 E92A03                   jmp @@retn
  3192                                  @@checkreg163:
  3193 00001705 68[331A]                 push checkreg_1
  3194 00001708 8D062B81                 lea  ax, [symbol]
  3195 0000170C 50                       push ax
  3196 0000170D E8A143                   call eqstr
  3197 00001710 83C404                   add  sp, 4
  3198 00001713 08C0                     or  al, al
  3199 00001715 0F840600                 je @@checkreg164
  3200 00001719 B80300                   mov ax, 3
  3201 0000171C E91003                   jmp @@retn
  3202                                  
  3203                                  ;-340   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3204                                  
  3205                                  @@checkreg164:
  3206 0000171F 68[361A]                 push checkreg_2
  3207 00001722 8D062B81                 lea  ax, [symbol]
  3208 00001726 50                       push ax
  3209 00001727 E88743                   call eqstr
  3210 0000172A 83C404                   add  sp, 4
  3211 0000172D 08C0                     or  al, al
  3212 0000172F 0F840600                 je @@checkreg165
  3213 00001733 B80500                   mov ax, 5
  3214 00001736 E9F602                   jmp @@retn
  3215                                  @@checkreg165:
  3216 00001739 68[391A]                 push checkreg_3
  3217 0000173C 8D062B81                 lea  ax, [symbol]
  3218 00001740 50                       push ax
  3219 00001741 E86D43                   call eqstr
  3220 00001744 83C404                   add  sp, 4
  3221 00001747 08C0                     or  al, al
  3222 00001749 0F840600                 je @@checkreg166
  3223 0000174D B80700                   mov ax, 7
  3224 00001750 E9DC02                   jmp @@retn
  3225                                  
  3226                                  ;-341   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3227                                  
  3228                                  @@checkreg166:
  3229 00001753 68[3C1A]                 push checkreg_4
  3230 00001756 8D062B81                 lea  ax, [symbol]
  3231 0000175A 50                       push ax
  3232 0000175B E85343                   call eqstr
  3233 0000175E 83C404                   add  sp, 4
  3234 00001761 08C0                     or  al, al
  3235 00001763 0F840600                 je @@checkreg167
  3236 00001767 B80900                   mov ax, 9
  3237 0000176A E9C202                   jmp @@retn
  3238                                  @@checkreg167:
  3239 0000176D 68[3F1A]                 push checkreg_5
  3240 00001770 8D062B81                 lea  ax, [symbol]
  3241 00001774 50                       push ax
  3242 00001775 E83943                   call eqstr
  3243 00001778 83C404                   add  sp, 4
  3244 0000177B 08C0                     or  al, al
  3245 0000177D 0F840600                 je @@checkreg168
  3246 00001781 B80B00                   mov ax, 11
  3247 00001784 E9A802                   jmp @@retn
  3248                                  
  3249                                  ;-342   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3250                                  
  3251                                  @@checkreg168:
  3252 00001787 68[421A]                 push checkreg_6
  3253 0000178A 8D062B81                 lea  ax, [symbol]
  3254 0000178E 50                       push ax
  3255 0000178F E81F43                   call eqstr
  3256 00001792 83C404                   add  sp, 4
  3257 00001795 08C0                     or  al, al
  3258 00001797 0F840600                 je @@checkreg169
  3259 0000179B B80D00                   mov ax, 13
  3260 0000179E E98E02                   jmp @@retn
  3261                                  @@checkreg169:
  3262 000017A1 68[451A]                 push checkreg_7
  3263 000017A4 8D062B81                 lea  ax, [symbol]
  3264 000017A8 50                       push ax
  3265 000017A9 E80543                   call eqstr
  3266 000017AC 83C404                   add  sp, 4
  3267 000017AF 08C0                     or  al, al
  3268 000017B1 0F840600                 je @@checkreg170
  3269 000017B5 B80F00                   mov ax, 15
  3270 000017B8 E97402                   jmp @@retn
  3271                                  
  3272                                  ;-343   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3273                                  
  3274                                  @@checkreg170:
  3275 000017BB 68[481A]                 push checkreg_8
  3276 000017BE 8D062B81                 lea  ax, [symbol]
  3277 000017C2 50                       push ax
  3278 000017C3 E8EB42                   call eqstr
  3279 000017C6 83C404                   add  sp, 4
  3280 000017C9 08C0                     or  al, al
  3281 000017CB 0F840600                 je @@checkreg171
  3282 000017CF B81100                   mov ax, 17
  3283 000017D2 E95A02                   jmp @@retn
  3284                                  @@checkreg171:
  3285 000017D5 68[4B1A]                 push checkreg_9
  3286 000017D8 8D062B81                 lea  ax, [symbol]
  3287 000017DC 50                       push ax
  3288 000017DD E8D142                   call eqstr
  3289 000017E0 83C404                   add  sp, 4
  3290 000017E3 08C0                     or  al, al
  3291 000017E5 0F840600                 je @@checkreg172
  3292 000017E9 B81300                   mov ax, 19
  3293 000017EC E94002                   jmp @@retn
  3294                                  
  3295                                  ;-344   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3296                                  
  3297                                  @@checkreg172:
  3298 000017EF 68[4E1A]                 push checkreg_10
  3299 000017F2 8D062B81                 lea  ax, [symbol]
  3300 000017F6 50                       push ax
  3301 000017F7 E8B742                   call eqstr
  3302 000017FA 83C404                   add  sp, 4
  3303 000017FD 08C0                     or  al, al
  3304 000017FF 0F840600                 je @@checkreg173
  3305 00001803 B81500                   mov ax, 21
  3306 00001806 E92602                   jmp @@retn
  3307                                  @@checkreg173:
  3308 00001809 68[511A]                 push checkreg_11
  3309 0000180C 8D062B81                 lea  ax, [symbol]
  3310 00001810 50                       push ax
  3311 00001811 E89D42                   call eqstr
  3312 00001814 83C404                   add  sp, 4
  3313 00001817 08C0                     or  al, al
  3314 00001819 0F840600                 je @@checkreg174
  3315 0000181D B81700                   mov ax, 23
  3316 00001820 E90C02                   jmp @@retn
  3317                                  
  3318                                  ;-345   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3319                                  
  3320                                  @@checkreg174:
  3321 00001823 68[541A]                 push checkreg_12
  3322 00001826 8D062B81                 lea  ax, [symbol]
  3323 0000182A 50                       push ax
  3324 0000182B E88342                   call eqstr
  3325 0000182E 83C404                   add  sp, 4
  3326 00001831 08C0                     or  al, al
  3327 00001833 0F840600                 je @@checkreg175
  3328 00001837 B81900                   mov ax, 25
  3329 0000183A E9F201                   jmp @@retn
  3330                                  @@checkreg175:
  3331 0000183D 68[571A]                 push checkreg_13
  3332 00001840 8D062B81                 lea  ax, [symbol]
  3333 00001844 50                       push ax
  3334 00001845 E86942                   call eqstr
  3335 00001848 83C404                   add  sp, 4
  3336 0000184B 08C0                     or  al, al
  3337 0000184D 0F840600                 je @@checkreg176
  3338 00001851 B81B00                   mov ax, 27
  3339 00001854 E9D801                   jmp @@retn
  3340                                  
  3341                                  ;-346   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3342                                  
  3343                                  @@checkreg176:
  3344 00001857 68[5A1A]                 push checkreg_14
  3345 0000185A 8D062B81                 lea  ax, [symbol]
  3346 0000185E 50                       push ax
  3347 0000185F E84F42                   call eqstr
  3348 00001862 83C404                   add  sp, 4
  3349 00001865 08C0                     or  al, al
  3350 00001867 0F840600                 je @@checkreg177
  3351 0000186B B81D00                   mov ax, 29
  3352 0000186E E9BE01                   jmp @@retn
  3353                                  @@checkreg177:
  3354 00001871 68[5D1A]                 push checkreg_15
  3355 00001874 8D062B81                 lea  ax, [symbol]
  3356 00001878 50                       push ax
  3357 00001879 E83542                   call eqstr
  3358 0000187C 83C404                   add  sp, 4
  3359 0000187F 08C0                     or  al, al
  3360 00001881 0F840600                 je @@checkreg178
  3361 00001885 B81F00                   mov ax, 31
  3362 00001888 E9A401                   jmp @@retn
  3363                                  
  3364                                  ;-347   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3365                                  
  3366                                  @@checkreg178:
  3367 0000188B 68[601A]                 push checkreg_16
  3368 0000188E 8D062B81                 lea  ax, [symbol]
  3369 00001892 50                       push ax
  3370 00001893 E81B42                   call eqstr
  3371 00001896 83C404                   add  sp, 4
  3372 00001899 08C0                     or  al, al
  3373 0000189B 0F840600                 je @@checkreg179
  3374 0000189F B82100                   mov ax, 33
  3375 000018A2 E98A01                   jmp @@retn
  3376                                  @@checkreg179:
  3377 000018A5 68[631A]                 push checkreg_17
  3378 000018A8 8D062B81                 lea  ax, [symbol]
  3379 000018AC 50                       push ax
  3380 000018AD E80142                   call eqstr
  3381 000018B0 83C404                   add  sp, 4
  3382 000018B3 08C0                     or  al, al
  3383 000018B5 0F840600                 je @@checkreg180
  3384 000018B9 B82300                   mov ax, 35
  3385 000018BC E97001                   jmp @@retn
  3386                                  
  3387                                  ;-348   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3388                                  
  3389                                  @@checkreg180:
  3390 000018BF 68[661A]                 push checkreg_18
  3391 000018C2 8D062B81                 lea  ax, [symbol]
  3392 000018C6 50                       push ax
  3393 000018C7 E8E741                   call eqstr
  3394 000018CA 83C404                   add  sp, 4
  3395 000018CD 08C0                     or  al, al
  3396 000018CF 0F840600                 je @@checkreg181
  3397 000018D3 B82500                   mov ax, 37
  3398 000018D6 E95601                   jmp @@retn
  3399                                  @@checkreg181:
  3400 000018D9 68[691A]                 push checkreg_19
  3401 000018DC 8D062B81                 lea  ax, [symbol]
  3402 000018E0 50                       push ax
  3403 000018E1 E8CD41                   call eqstr
  3404 000018E4 83C404                   add  sp, 4
  3405 000018E7 08C0                     or  al, al
  3406 000018E9 0F840600                 je @@checkreg182
  3407 000018ED B82700                   mov ax, 39
  3408 000018F0 E93C01                   jmp @@retn
  3409                                  
  3410                                  ;-349   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3411                                  
  3412                                  @@checkreg182:
  3413 000018F3 68[6C1A]                 push checkreg_20
  3414 000018F6 8D062B81                 lea  ax, [symbol]
  3415 000018FA 50                       push ax
  3416 000018FB E8B341                   call eqstr
  3417 000018FE 83C404                   add  sp, 4
  3418 00001901 08C0                     or  al, al
  3419 00001903 0F840600                 je @@checkreg183
  3420 00001907 B82900                   mov ax, 41
  3421 0000190A E92201                   jmp @@retn
  3422                                  @@checkreg183:
  3423 0000190D 68[6F1A]                 push checkreg_21
  3424 00001910 8D062B81                 lea  ax, [symbol]
  3425 00001914 50                       push ax
  3426 00001915 E89941                   call eqstr
  3427 00001918 83C404                   add  sp, 4
  3428 0000191B 08C0                     or  al, al
  3429 0000191D 0F840600                 je @@checkreg184
  3430 00001921 B82B00                   mov ax, 43
  3431 00001924 E90801                   jmp @@retn
  3432                                  
  3433                                  ;-350   // (eqstr(symbol,"ip")) return 45;
  3434                                  
  3435                                  
  3436                                  ;-351   if (strlen(symbol) >   3) return 0;
  3437                                  
  3438                                  @@checkreg184:
  3439 00001927 8D062B81                 lea  ax, [symbol]
  3440 0000192B 50                       push ax
  3441 0000192C E83340                   call strlen
  3442 0000192F 83C402                   add  sp, 2
  3443 00001932 83F803                   cmp ax, 3
  3444 00001935 0F8E0600                 jle @@checkreg185
  3445 00001939 B80000                   mov ax, 0
  3446 0000193C E9F000                   jmp @@retn
  3447                                  
  3448                                  ;-352   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3449                                  
  3450                                  @@checkreg185:
  3451 0000193F 68[721A]                 push checkreg_22
  3452 00001942 8D062B81                 lea  ax, [symbol]
  3453 00001946 50                       push ax
  3454 00001947 E86741                   call eqstr
  3455 0000194A 83C404                   add  sp, 4
  3456 0000194D 08C0                     or  al, al
  3457 0000194F 0F840600                 je @@checkreg186
  3458 00001953 B82F00                   mov ax, 47
  3459 00001956 E9D600                   jmp @@retn
  3460                                  @@checkreg186:
  3461 00001959 68[761A]                 push checkreg_23
  3462 0000195C 8D062B81                 lea  ax, [symbol]
  3463 00001960 50                       push ax
  3464 00001961 E84D41                   call eqstr
  3465 00001964 83C404                   add  sp, 4
  3466 00001967 08C0                     or  al, al
  3467 00001969 0F840600                 je @@checkreg187
  3468 0000196D B83200                   mov ax, 50
  3469 00001970 E9BC00                   jmp @@retn
  3470                                  
  3471                                  ;-353   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3472                                  
  3473                                  @@checkreg187:
  3474 00001973 68[7A1A]                 push checkreg_24
  3475 00001976 8D062B81                 lea  ax, [symbol]
  3476 0000197A 50                       push ax
  3477 0000197B E83341                   call eqstr
  3478 0000197E 83C404                   add  sp, 4
  3479 00001981 08C0                     or  al, al
  3480 00001983 0F840600                 je @@checkreg188
  3481 00001987 B83500                   mov ax, 53
  3482 0000198A E9A200                   jmp @@retn
  3483                                  @@checkreg188:
  3484 0000198D 68[7E1A]                 push checkreg_25
  3485 00001990 8D062B81                 lea  ax, [symbol]
  3486 00001994 50                       push ax
  3487 00001995 E81941                   call eqstr
  3488 00001998 83C404                   add  sp, 4
  3489 0000199B 08C0                     or  al, al
  3490 0000199D 0F840600                 je @@checkreg189
  3491 000019A1 B83800                   mov ax, 56
  3492 000019A4 E98800                   jmp @@retn
  3493                                  
  3494                                  ;-354   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3495                                  
  3496                                  @@checkreg189:
  3497 000019A7 68[821A]                 push checkreg_26
  3498 000019AA 8D062B81                 lea  ax, [symbol]
  3499 000019AE 50                       push ax
  3500 000019AF E8FF40                   call eqstr
  3501 000019B2 83C404                   add  sp, 4
  3502 000019B5 08C0                     or  al, al
  3503 000019B7 0F840600                 je @@checkreg190
  3504 000019BB B83B00                   mov ax, 59
  3505 000019BE E96E00                   jmp @@retn
  3506                                  @@checkreg190:
  3507 000019C1 68[861A]                 push checkreg_27
  3508 000019C4 8D062B81                 lea  ax, [symbol]
  3509 000019C8 50                       push ax
  3510 000019C9 E8E540                   call eqstr
  3511 000019CC 83C404                   add  sp, 4
  3512 000019CF 08C0                     or  al, al
  3513 000019D1 0F840600                 je @@checkreg191
  3514 000019D5 B83E00                   mov ax, 62
  3515 000019D8 E95400                   jmp @@retn
  3516                                  
  3517                                  ;-355   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3518                                  
  3519                                  @@checkreg191:
  3520 000019DB 68[8A1A]                 push checkreg_28
  3521 000019DE 8D062B81                 lea  ax, [symbol]
  3522 000019E2 50                       push ax
  3523 000019E3 E8CB40                   call eqstr
  3524 000019E6 83C404                   add  sp, 4
  3525 000019E9 08C0                     or  al, al
  3526 000019EB 0F840600                 je @@checkreg192
  3527 000019EF B84100                   mov ax, 65
  3528 000019F2 E93A00                   jmp @@retn
  3529                                  @@checkreg192:
  3530 000019F5 68[8E1A]                 push checkreg_29
  3531 000019F8 8D062B81                 lea  ax, [symbol]
  3532 000019FC 50                       push ax
  3533 000019FD E8B140                   call eqstr
  3534 00001A00 83C404                   add  sp, 4
  3535 00001A03 08C0                     or  al, al
  3536 00001A05 0F840600                 je @@checkreg193
  3537 00001A09 B84400                   mov ax, 68
  3538 00001A0C E92000                   jmp @@retn
  3539                                  
  3540                                  ;-356   if (eqstr(symbol,"cr0")) return 71;
  3541                                  
  3542                                  @@checkreg193:
  3543 00001A0F 68[921A]                 push checkreg_30
  3544 00001A12 8D062B81                 lea  ax, [symbol]
  3545 00001A16 50                       push ax
  3546 00001A17 E89740                   call eqstr
  3547 00001A1A 83C404                   add  sp, 4
  3548 00001A1D 08C0                     or  al, al
  3549 00001A1F 0F840600                 je @@checkreg194
  3550 00001A23 B84700                   mov ax, 71
  3551 00001A26 E90600                   jmp @@retn
  3552                                  
  3553                                  ;-357   return 0;   }
  3554                                  
  3555                                  @@checkreg194:
  3556 00001A29 B80000                   mov ax, 0
  3557 00001A2C E90000                   jmp @@retn
  3558                                  
  3559                                  ;-358 char printregstr[]
  3560                                  
  3561                                  @@retn:
  3562 00001A2F C3                       ret
  3563                                  ; ENDP
  3564 00001A30 616C00                  checkreg_0 db "al",0
  3565 00001A33 636C00                  checkreg_1 db "cl",0
  3566 00001A36 646C00                  checkreg_2 db "dl",0
  3567 00001A39 626C00                  checkreg_3 db "bl",0
  3568 00001A3C 616800                  checkreg_4 db "ah",0
  3569 00001A3F 636800                  checkreg_5 db "ch",0
  3570 00001A42 646800                  checkreg_6 db "dh",0
  3571 00001A45 626800                  checkreg_7 db "bh",0
  3572 00001A48 617800                  checkreg_8 db "ax",0
  3573 00001A4B 637800                  checkreg_9 db "cx",0
  3574 00001A4E 647800                  checkreg_10 db "dx",0
  3575 00001A51 627800                  checkreg_11 db "bx",0
  3576 00001A54 737000                  checkreg_12 db "sp",0
  3577 00001A57 627000                  checkreg_13 db "bp",0
  3578 00001A5A 736900                  checkreg_14 db "si",0
  3579 00001A5D 646900                  checkreg_15 db "di",0
  3580 00001A60 657300                  checkreg_16 db "es",0
  3581 00001A63 637300                  checkreg_17 db "cs",0
  3582 00001A66 737300                  checkreg_18 db "ss",0
  3583 00001A69 647300                  checkreg_19 db "ds",0
  3584 00001A6C 667300                  checkreg_20 db "fs",0
  3585 00001A6F 677300                  checkreg_21 db "gs",0
  3586 00001A72 65617800                checkreg_22 db "eax",0
  3587 00001A76 65637800                checkreg_23 db "ecx",0
  3588 00001A7A 65647800                checkreg_24 db "edx",0
  3589 00001A7E 65627800                checkreg_25 db "ebx",0
  3590 00001A82 65737000                checkreg_26 db "esp",0
  3591 00001A86 65627000                checkreg_27 db "ebp",0
  3592 00001A8A 65736900                checkreg_28 db "esi",0
  3593 00001A8E 65646900                checkreg_29 db "edi",0
  3594 00001A92 63723000                checkreg_30 db "cr0",0
  3595                                  
  3596                                  ;-359 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  3597                                  
  3598 00001A96 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  3599 00001A9F 616863686468626861-
  3600 00001AA8 786378647862787370-
  3601 00001AB1 627073696469657363-
  3602 00001ABA 737373647366736773-
  3603 00001AC3 697065617865637865-
  3604 00001ACC 647865627865737065-
  3605 00001AD5 627065736965646963-
  3606 00001ADE 723000             
  3607                                  
  3608                                  ;-360 //          1         2         3         4         5         6         7
  3609                                  
  3610                                  
  3611                                  ;-361 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  3612                                  
  3613                                  
  3614                                  ;-362 int printreg(int i) {  unsigned int k; unsigned char c;
  3615                                  
  3616                                  
  3617                                  printreg:  ; *** PROC ***
  3618                                  
  3619                                  ;-363   k = &printregstr + i; c=*k; prc(c); i++;
  3620                                  
  3621                                  ;Function : printreg, Number of local variables: 3
  3622                                  ;   # type sign width addr used name   list of local variables
  3623                                  ;  200 var sign word   362 NULL i = bp+4
  3624                                  ;  201 var unsg word   362 NULL k = bp-2
  3625                                  ;  202 var unsg byte   362 NULL c = bp-4;
  3626 00001AE1 C8040000                 ENTER  4,0
  3627 00001AE5 B8[961A]                 mov ax, printregstr
  3628 00001AE8 034604                   add ax, [bp+4]
  3629 00001AEB 8946FE                   mov [bp-2], ax
  3630 00001AEE 8B5EFE                   mov bx, [bp-2]
  3631 00001AF1 8B07                     mov ax, [bx]
  3632 00001AF3 8846FC                   mov [bp-4], al
  3633 00001AF6 8A46FC                   mov al, byte [bp-4]
  3634 00001AF9 B400                     mov ah, 0
  3635 00001AFB 50                       push ax
  3636 00001AFC E8662E                   call prc
  3637 00001AFF 83C402                   add  sp, 2
  3638 00001B02 FF4604                   inc  word[bp+4]
  3639                                  
  3640                                  ;-364   k = &printregstr + i; c=*k; prc(c);
  3641                                  
  3642 00001B05 B8[961A]                 mov ax, printregstr
  3643 00001B08 034604                   add ax, [bp+4]
  3644 00001B0B 8946FE                   mov [bp-2], ax
  3645 00001B0E 8B5EFE                   mov bx, [bp-2]
  3646 00001B11 8B07                     mov ax, [bx]
  3647 00001B13 8846FC                   mov [bp-4], al
  3648 00001B16 8A46FC                   mov al, byte [bp-4]
  3649 00001B19 B400                     mov ah, 0
  3650 00001B1B 50                       push ax
  3651 00001B1C E8462E                   call prc
  3652 00001B1F 83C402                   add  sp, 2
  3653                                  
  3654                                  ;-365   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  3655                                  
  3656 00001B22 8B4604                   mov ax, [bp+4]
  3657 00001B25 83F82F                   cmp ax, 47
  3658 00001B28 0F8E2000                 jle @@printreg195
  3659 00001B2C FF4604                   inc  word[bp+4]
  3660 00001B2F B8[961A]                 mov ax, printregstr
  3661 00001B32 034604                   add ax, [bp+4]
  3662 00001B35 8946FE                   mov [bp-2], ax
  3663 00001B38 8B5EFE                   mov bx, [bp-2]
  3664 00001B3B 8B07                     mov ax, [bx]
  3665 00001B3D 8846FC                   mov [bp-4], al
  3666 00001B40 8A46FC                   mov al, byte [bp-4]
  3667 00001B43 B400                     mov ah, 0
  3668 00001B45 50                       push ax
  3669 00001B46 E81C2E                   call prc
  3670 00001B49 83C402                   add  sp, 2
  3671                                  
  3672                                  ;-366 }
  3673                                  
  3674                                  @@printreg195:
  3675                                  
  3676                                  ;-367 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  3677 00001B4C C9                       LEAVE
  3678 00001B4D C3                       ret
  3679                                  ; ENDP
  3680 00001B4E 0000                    evalue dw 0
  3681 00001B50 0A00                    exprtype dw 10
  3682                                  
  3683                                  ;-368 int expr(int isRight)
  3684                                  
  3685                                  
  3686                                  expr:  ; *** PROC ***
  3687                                  
  3688                                  ;-369 { int mode; int id1;     int ixarr; int ixconst;
  3689                                  
  3690                                  
  3691                                  ;-370   int ids;  int isCONST; int i;     unsigned char *p;
  3692                                  
  3693                                  
  3694                                  ;-371   if (istoken(T_CONST)) { evalue=lexval;
  3695                                  
  3696                                  ;Function : expr, Number of local variables: 9
  3697                                  ;   # type sign width addr used name   list of local variables
  3698                                  ;  200 var sign word   368 NULL isRight = bp+4
  3699                                  ;  201 var sign word   369 NULL mode = bp-2
  3700                                  ;  202 var sign word   369 NULL id1 = bp-4
  3701                                  ;  203 var sign word   369 NULL ixarr = bp-6
  3702                                  ;  204 var sign word   369 NULL ixconst = bp-8
  3703                                  ;  205 var sign word   370 NULL ids = bp-10
  3704                                  ;  206 var sign word   370 NULL isCONST = bp-12
  3705                                  ;  207 var sign word   370 NULL i = bp-14
  3706                                  ;  208 ptr unsg byte   370 NULL p = bp-16;
  3707 00001B52 C8100000                 ENTER  16,0
  3708 00001B56 680101                   push 257
  3709 00001B59 E83B2D                   call istoken
  3710 00001B5C 83C402                   add  sp, 2
  3711 00001B5F 08C0                     or  al, al
  3712 00001B61 0F841F00                 je @@expr196
  3713 00001B65 A1[3700]                 mov ax, [lexval]
  3714 00001B68 A3[4E1B]                 mov word [evalue], ax
  3715                                  
  3716                                  ;-372     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  3717                                  
  3718 00001B6B 68[161F]                 push expr_0
  3719 00001B6E E85B2E                   call prs
  3720 00001B71 83C402                   add  sp, 2
  3721 00001B74 FF36[3700]               push word [lexval]
  3722 00001B78 E8AB2F                   call prunsign1
  3723 00001B7B 83C402                   add  sp, 2
  3724 00001B7E B80400                   mov ax, 4
  3725 00001B81 E99003                   jmp @@retn
  3726                                  
  3727                                  ;-373   mode=typeName(); /*0=V,1=*,2=&*/
  3728                                  
  3729                                  @@expr196:
  3730 00001B84 E8D7EC                   call typeName
  3731 00001B87 8946FE                   mov [bp-2], ax
  3732                                  
  3733                                  ;-374   ireg1=checkreg();
  3734                                  
  3735 00001B8A E846FB                   call checkreg
  3736 00001B8D A3[A30E]                 mov word [ireg1], ax
  3737                                  
  3738                                  ;-375   if (ireg1) { doreg1(0); return; }
  3739                                  
  3740 00001B90 A1[A30E]                 mov ax, [ireg1]
  3741 00001B93 08C0                     or  al, al
  3742 00001B95 0F840B00                 je @@expr197
  3743 00001B99 6A00                     push 0
  3744 00001B9B E849F9                   call doreg1
  3745 00001B9E 83C402                   add  sp, 2
  3746 00001BA1 E97003                   jmp @@retn
  3747                                  
  3748                                  ;-376   if (token=='(')  {docall1(); goto e1; }
  3749                                  
  3750                                  @@expr197:
  3751 00001BA4 A1[2300]                 mov ax, [token]
  3752 00001BA7 83F828                   cmp ax, 40
  3753 00001BAA 0F850600                 jne @@expr198
  3754 00001BAE E8BB0F                   call docall1
  3755 00001BB1 E95602                   jmp @@e1
  3756                                  
  3757                                  ;-377   if (isreg()) goto e1;
  3758                                  
  3759                                  @@expr198:
  3760 00001BB4 E8CB07                   call isreg
  3761 00001BB7 08C0                     or  al, al
  3762 00001BB9 0F840300                 je @@expr199
  3763 00001BBD E94A02                   jmp @@e1
  3764                                  
  3765                                  ;-378 
  3766                                  
  3767                                  
  3768                                  ;-379   id1=searchname(); gettypes(id1); ids=signi;
  3769                                  
  3770                                  @@expr199:
  3771 00001BC0 E8CCEB                   call searchname
  3772 00001BC3 8946FC                   mov [bp-4], ax
  3773 00001BC6 FF76FC                   push word [bp-4]
  3774 00001BC9 E885EA                   call gettypes
  3775 00001BCC 83C402                   add  sp, 2
  3776 00001BCF A1[3C00]                 mov ax, [signi]
  3777 00001BD2 8946F6                   mov [bp-10], ax
  3778                                  
  3779                                  ;-380   ixarr=0;  ixconst=0;
  3780                                  
  3781 00001BD5 B80000                   mov ax, 0
  3782 00001BD8 8946FA                   mov [bp-6], ax
  3783 00001BDB B80000                   mov ax, 0
  3784 00001BDE 8946F8                   mov [bp-8], ax
  3785                                  
  3786                                  ;-381     if (istoken('[')) { if (istoken(T_CONST)) {
  3787                                  
  3788 00001BE1 6A5B                     push 91
  3789 00001BE3 E8B12C                   call istoken
  3790 00001BE6 83C402                   add  sp, 2
  3791 00001BE9 08C0                     or  al, al
  3792 00001BEB 0F845900                 je @@expr200
  3793 00001BEF 680101                   push 257
  3794 00001BF2 E8A22C                   call istoken
  3795 00001BF5 83C402                   add  sp, 2
  3796 00001BF8 08C0                     or  al, al
  3797 00001BFA 0F841700                 je @@expr201
  3798                                  
  3799                                  ;-382       ixconst=1; ixarr=lexval; expect(']');  }
  3800                                  
  3801 00001BFE B80100                   mov ax, 1
  3802 00001C01 8946F8                   mov [bp-8], ax
  3803 00001C04 A1[3700]                 mov ax, [lexval]
  3804 00001C07 8946FA                   mov [bp-6], ax
  3805 00001C0A 6A5D                     push 93
  3806 00001C0C E8AA2C                   call expect
  3807 00001C0F 83C402                   add  sp, 2
  3808                                  
  3809                                  ;-383     else {ixarr=searchname(); expect(T_NAME); expect(']');
  3810                                  
  3811 00001C12 E93300                   jmp @@expr202
  3812                                  @@expr201:
  3813 00001C15 E877EB                   call searchname
  3814 00001C18 8946FA                   mov [bp-6], ax
  3815 00001C1B 680001                   push 256
  3816 00001C1E E8982C                   call expect
  3817 00001C21 83C402                   add  sp, 2
  3818 00001C24 6A5D                     push 93
  3819 00001C26 E8902C                   call expect
  3820 00001C29 83C402                   add  sp, 2
  3821                                  
  3822                                  ;-384     gettypes(ixarr);
  3823                                  
  3824 00001C2C FF76FA                   push word [bp-6]
  3825 00001C2F E81FEA                   call gettypes
  3826 00001C32 83C402                   add  sp, 2
  3827                                  
  3828                                  ;-385     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  3829                                  
  3830 00001C35 A1[3F00]                 mov ax, [widthi]
  3831 00001C38 83F802                   cmp ax, 2
  3832 00001C3B 0F840900                 je  @@expr203
  3833 00001C3F 68[221F]                 push expr_1
  3834 00001C42 E87030                   call error1
  3835 00001C45 83C402                   add  sp, 2
  3836                                  @@expr203:
  3837                                  @@expr202:
  3838                                  
  3839                                  ;-386   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  3840                                  
  3841                                  @@expr200:
  3842 00001C48 68C304                   push 1219
  3843 00001C4B E8492C                   call istoken
  3844 00001C4E 83C402                   add  sp, 2
  3845 00001C51 08C0                     or  al, al
  3846 00001C53 0F845800                 je @@expr204
  3847 00001C57 8B46FE                   mov ax, [bp-2]
  3848 00001C5A 08C0                     or  al, al
  3849 00001C5C 0F840900                 je @@expr205
  3850 00001C60 68[451F]                 push expr_2
  3851 00001C63 E84F30                   call error1
  3852 00001C66 83C402                   add  sp, 2
  3853                                  
  3854                                  ;-387      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  3855                                  
  3856                                  @@expr205:
  3857 00001C69 68[551F]                 push expr_3
  3858 00001C6C E85D2D                   call prs
  3859 00001C6F 83C402                   add  sp, 2
  3860 00001C72 A1[4200]                 mov ax, [wi]
  3861 00001C75 83F802                   cmp ax, 2
  3862 00001C78 0F850C00                 jne @@expr206
  3863 00001C7C 68[5E1F]                 push expr_4
  3864 00001C7F E84A2D                   call prs
  3865 00001C82 83C402                   add  sp, 2
  3866 00001C85 E90900                   jmp @@expr207
  3867                                  @@expr206:
  3868 00001C88 68[631F]                 push expr_5
  3869 00001C8B E83E2D                   call prs
  3870 00001C8E 83C402                   add  sp, 2
  3871                                  
  3872                                  ;-388        if(NASM==0)prs(" ptr "); v(id1); goto e1;}
  3873                                  
  3874                                  @@expr207:
  3875 00001C91 A0[1400]                 mov al, [NASM]
  3876 00001C94 3C00                     cmp al, 0
  3877 00001C96 0F850900                 jne @@expr208
  3878 00001C9A 68[681F]                 push expr_6
  3879 00001C9D E82C2D                   call prs
  3880 00001CA0 83C402                   add  sp, 2
  3881                                  @@expr208:
  3882 00001CA3 FF76FC                   push word [bp-4]
  3883 00001CA6 E830E4                   call v
  3884 00001CA9 83C402                   add  sp, 2
  3885 00001CAC E95B01                   jmp @@e1
  3886                                  
  3887                                  ;-389   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  3888                                  
  3889                                  @@expr204:
  3890 00001CAF 68C904                   push 1225
  3891 00001CB2 E8E22B                   call istoken
  3892 00001CB5 83C402                   add  sp, 2
  3893 00001CB8 08C0                     or  al, al
  3894 00001CBA 0F845800                 je @@expr209
  3895 00001CBE 8B46FE                   mov ax, [bp-2]
  3896 00001CC1 08C0                     or  al, al
  3897 00001CC3 0F840900                 je @@expr210
  3898 00001CC7 68[6E1F]                 push expr_7
  3899 00001CCA E8E82F                   call error1
  3900 00001CCD 83C402                   add  sp, 2
  3901                                  
  3902                                  ;-390      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  3903                                  
  3904                                  @@expr210:
  3905 00001CD0 68[7E1F]                 push expr_8
  3906 00001CD3 E8F62C                   call prs
  3907 00001CD6 83C402                   add  sp, 2
  3908 00001CD9 A1[4200]                 mov ax, [wi]
  3909 00001CDC 83F802                   cmp ax, 2
  3910 00001CDF 0F850C00                 jne @@expr211
  3911 00001CE3 68[871F]                 push expr_9
  3912 00001CE6 E8E32C                   call prs
  3913 00001CE9 83C402                   add  sp, 2
  3914 00001CEC E90900                   jmp @@expr212
  3915                                  @@expr211:
  3916 00001CEF 68[8C1F]                 push expr_10
  3917 00001CF2 E8D72C                   call prs
  3918 00001CF5 83C402                   add  sp, 2
  3919                                  
  3920                                  ;-391        if(NASM==0)prs(" ptr "); v(id1); goto e1;}
  3921                                  
  3922                                  @@expr212:
  3923 00001CF8 A0[1400]                 mov al, [NASM]
  3924 00001CFB 3C00                     cmp al, 0
  3925 00001CFD 0F850900                 jne @@expr213
  3926 00001D01 68[911F]                 push expr_11
  3927 00001D04 E8C52C                   call prs
  3928 00001D07 83C402                   add  sp, 2
  3929                                  @@expr213:
  3930 00001D0A FF76FC                   push word [bp-4]
  3931 00001D0D E8C9E3                   call v
  3932 00001D10 83C402                   add  sp, 2
  3933 00001D13 E9F400                   jmp @@e1
  3934                                  
  3935                                  ;-392        
  3936                                  
  3937                                  
  3938                                  ;-393   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  3939                                  
  3940                                  @@expr209:
  3941 00001D16 68CE04                   push 1230
  3942 00001D19 E87B2B                   call istoken
  3943 00001D1C 83C402                   add  sp, 2
  3944 00001D1F 08C0                     or  al, al
  3945 00001D21 0F841200                 je @@expr214
  3946 00001D25 FF76FC                   push word [bp-4]
  3947 00001D28 FF76FE                   push word [bp-2]
  3948 00001D2B 68[971F]                 push expr_12
  3949 00001D2E E8B402                   call compoundass
  3950 00001D31 83C406                   add  sp, 6
  3951 00001D34 E9D300                   jmp @@e1
  3952                                  
  3953                                  ;-394   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  3954                                  
  3955                                  @@expr214:
  3956 00001D37 68CF04                   push 1231
  3957 00001D3A E85A2B                   call istoken
  3958 00001D3D 83C402                   add  sp, 2
  3959 00001D40 08C0                     or  al, al
  3960 00001D42 0F841200                 je @@expr215
  3961 00001D46 FF76FC                   push word [bp-4]
  3962 00001D49 FF76FE                   push word [bp-2]
  3963 00001D4C 68[9B1F]                 push expr_13
  3964 00001D4F E89302                   call compoundass
  3965 00001D52 83C406                   add  sp, 6
  3966 00001D55 E9B200                   jmp @@e1
  3967                                  
  3968                                  ;-395   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  3969                                  
  3970                                  @@expr215:
  3971 00001D58 68D204                   push 1234
  3972 00001D5B E8392B                   call istoken
  3973 00001D5E 83C402                   add  sp, 2
  3974 00001D61 08C0                     or  al, al
  3975 00001D63 0F841200                 je @@expr216
  3976 00001D67 FF76FC                   push word [bp-4]
  3977 00001D6A FF76FE                   push word [bp-2]
  3978 00001D6D 68[9F1F]                 push expr_14
  3979 00001D70 E87202                   call compoundass
  3980 00001D73 83C406                   add  sp, 6
  3981 00001D76 E99100                   jmp @@e1
  3982                                  
  3983                                  ;-396   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  3984                                  
  3985                                  @@expr216:
  3986 00001D79 68D304                   push 1235
  3987 00001D7C E8182B                   call istoken
  3988 00001D7F 83C402                   add  sp, 2
  3989 00001D82 08C0                     or  al, al
  3990 00001D84 0F841200                 je @@expr217
  3991 00001D88 FF76FC                   push word [bp-4]
  3992 00001D8B FF76FE                   push word [bp-2]
  3993 00001D8E 68[A31F]                 push expr_15
  3994 00001D91 E85102                   call compoundass
  3995 00001D94 83C406                   add  sp, 6
  3996 00001D97 E97000                   jmp @@e1
  3997                                  
  3998                                  ;-397   if (istoken(T_MULASS    )) {error1("not implemented");}
  3999                                  
  4000                                  @@expr217:
  4001 00001D9A 68D004                   push 1232
  4002 00001D9D E8F72A                   call istoken
  4003 00001DA0 83C402                   add  sp, 2
  4004 00001DA3 08C0                     or  al, al
  4005 00001DA5 0F840900                 je @@expr218
  4006 00001DA9 68[A61F]                 push expr_16
  4007 00001DAC E8062F                   call error1
  4008 00001DAF 83C402                   add  sp, 2
  4009                                  
  4010                                  ;-398   if (istoken(T_DIVASS    )) {error1("not implemented");}
  4011                                  
  4012                                  @@expr218:
  4013 00001DB2 68D104                   push 1233
  4014 00001DB5 E8DF2A                   call istoken
  4015 00001DB8 83C402                   add  sp, 2
  4016 00001DBB 08C0                     or  al, al
  4017 00001DBD 0F840900                 je @@expr219
  4018 00001DC1 68[B61F]                 push expr_17
  4019 00001DC4 E8EE2E                   call error1
  4020 00001DC7 83C402                   add  sp, 2
  4021                                  
  4022                                  ;-399 
  4023                                  
  4024                                  
  4025                                  ;-400   if (istoken('=')) { exprtype= expr(1); 
  4026                                  
  4027                                  @@expr219:
  4028 00001DCA 6A3D                     push 61
  4029 00001DCC E8C82A                   call istoken
  4030 00001DCF 83C402                   add  sp, 2
  4031 00001DD2 08C0                     or  al, al
  4032 00001DD4 0F842000                 je @@expr220
  4033 00001DD8 6A01                     push 1
  4034 00001DDA E875FD                   call expr
  4035 00001DDD 83C402                   add  sp, 2
  4036 00001DE0 A3[501B]                 mov word [exprtype], ax
  4037                                  
  4038                                  ;-401   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  4039                                  
  4040 00001DE3 FF76F8                   push word [bp-8]
  4041 00001DE6 FF76FA                   push word [bp-6]
  4042 00001DE9 FF76FC                   push word [bp-4]
  4043 00001DEC FF76FE                   push word [bp-2]
  4044 00001DEF E88208                   call doassign
  4045 00001DF2 83C408                   add  sp, 8
  4046 00001DF5 E91200                   jmp @@e1
  4047                                  
  4048                                  ;-402   dovar1(mode, "mov", ixarr, id1);
  4049                                  
  4050                                  @@expr220:
  4051 00001DF8 FF76FC                   push word [bp-4]
  4052 00001DFB FF76FA                   push word [bp-6]
  4053 00001DFE 68[C61F]                 push expr_18
  4054 00001E01 FF76FE                   push word [bp-2]
  4055 00001E04 E89802                   call dovar1
  4056 00001E07 83C408                   add  sp, 8
  4057                                  
  4058                                  ;-403   
  4059                                  
  4060                                  
  4061                                  ;-404 e1:    if (istoken('+')) rterm("add");
  4062                                  
  4063                                  @@e1:
  4064 00001E0A 6A2B                     push 43
  4065 00001E0C E8882A                   call istoken
  4066 00001E0F 83C402                   add  sp, 2
  4067 00001E12 08C0                     or  al, al
  4068 00001E14 0F840C00                 je @@expr221
  4069 00001E18 68[CA1F]                 push expr_19
  4070 00001E1B E84B04                   call rterm
  4071 00001E1E 83C402                   add  sp, 2
  4072                                  
  4073                                  ;-405   else if (istoken('-')) rterm("sub" );
  4074                                  
  4075 00001E21 E9CF00                   jmp @@expr222
  4076                                  @@expr221:
  4077 00001E24 6A2D                     push 45
  4078 00001E26 E86E2A                   call istoken
  4079 00001E29 83C402                   add  sp, 2
  4080 00001E2C 08C0                     or  al, al
  4081 00001E2E 0F840C00                 je @@expr223
  4082 00001E32 68[CE1F]                 push expr_20
  4083 00001E35 E83104                   call rterm
  4084 00001E38 83C402                   add  sp, 2
  4085                                  
  4086                                  ;-406   else if (istoken('&')) rterm("and" );
  4087                                  
  4088 00001E3B E9B500                   jmp @@expr224
  4089                                  @@expr223:
  4090 00001E3E 6A26                     push 38
  4091 00001E40 E8542A                   call istoken
  4092 00001E43 83C402                   add  sp, 2
  4093 00001E46 08C0                     or  al, al
  4094 00001E48 0F840C00                 je @@expr225
  4095 00001E4C 68[D21F]                 push expr_21
  4096 00001E4F E81704                   call rterm
  4097 00001E52 83C402                   add  sp, 2
  4098                                  
  4099                                  ;-407   else if (istoken('|')) rterm("or" );  
  4100                                  
  4101 00001E55 E99B00                   jmp @@expr226
  4102                                  @@expr225:
  4103 00001E58 6A7C                     push 124
  4104 00001E5A E83A2A                   call istoken
  4105 00001E5D 83C402                   add  sp, 2
  4106 00001E60 08C0                     or  al, al
  4107 00001E62 0F840C00                 je @@expr227
  4108 00001E66 68[D61F]                 push expr_22
  4109 00001E69 E8FD03                   call rterm
  4110 00001E6C 83C402                   add  sp, 2
  4111                                  
  4112                                  ;-408   else if (istoken(T_LESSLESS)) rterm("shl");
  4113                                  
  4114 00001E6F E98100                   jmp @@expr228
  4115                                  @@expr227:
  4116 00001E72 68D804                   push 1240
  4117 00001E75 E81F2A                   call istoken
  4118 00001E78 83C402                   add  sp, 2
  4119 00001E7B 08C0                     or  al, al
  4120 00001E7D 0F840C00                 je @@expr229
  4121 00001E81 68[D91F]                 push expr_23
  4122 00001E84 E8E203                   call rterm
  4123 00001E87 83C402                   add  sp, 2
  4124                                  
  4125                                  ;-409   else if (istoken(T_GREATGREAT)) rterm("shr");  
  4126                                  
  4127 00001E8A E96600                   jmp @@expr230
  4128                                  @@expr229:
  4129 00001E8D 68D904                   push 1241
  4130 00001E90 E8042A                   call istoken
  4131 00001E93 83C402                   add  sp, 2
  4132 00001E96 08C0                     or  al, al
  4133 00001E98 0F840C00                 je @@expr231
  4134 00001E9C 68[DD1F]                 push expr_24
  4135 00001E9F E8C703                   call rterm
  4136 00001EA2 83C402                   add  sp, 2
  4137                                  
  4138                                  ;-410   else if (istoken('*')) domul (ids);
  4139                                  
  4140 00001EA5 E94B00                   jmp @@expr232
  4141                                  @@expr231:
  4142 00001EA8 6A2A                     push 42
  4143 00001EAA E8EA29                   call istoken
  4144 00001EAD 83C402                   add  sp, 2
  4145 00001EB0 08C0                     or  al, al
  4146 00001EB2 0F840C00                 je @@expr233
  4147 00001EB6 FF76F6                   push word [bp-10]
  4148 00001EB9 E8460A                   call domul
  4149 00001EBC 83C402                   add  sp, 2
  4150                                  
  4151                                  ;-411   else if (istoken('/')) doidiv(ids);
  4152                                  
  4153 00001EBF E93100                   jmp @@expr234
  4154                                  @@expr233:
  4155 00001EC2 6A2F                     push 47
  4156 00001EC4 E8D029                   call istoken
  4157 00001EC7 83C402                   add  sp, 2
  4158 00001ECA 08C0                     or  al, al
  4159 00001ECC 0F840C00                 je @@expr235
  4160 00001ED0 FF76F6                   push word [bp-10]
  4161 00001ED3 E8CD0A                   call doidiv
  4162 00001ED6 83C402                   add  sp, 2
  4163                                  
  4164                                  ;-412   else if (istoken('%')) domod (ids);
  4165                                  
  4166 00001ED9 E91700                   jmp @@expr236
  4167                                  @@expr235:
  4168 00001EDC 6A25                     push 37
  4169 00001EDE E8B629                   call istoken
  4170 00001EE1 83C402                   add  sp, 2
  4171 00001EE4 08C0                     or  al, al
  4172 00001EE6 0F840900                 je @@expr237
  4173 00001EEA FF76F6                   push word [bp-10]
  4174 00001EED E8560C                   call domod
  4175 00001EF0 83C402                   add  sp, 2
  4176                                  
  4177                                  ;-413   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4178                                  
  4179                                  @@expr237:
  4180                                  @@expr236:
  4181                                  @@expr234:
  4182                                  @@expr232:
  4183                                  @@expr230:
  4184                                  @@expr228:
  4185                                  @@expr226:
  4186                                  @@expr224:
  4187                                  @@expr222:
  4188 00001EF3 E87321                   call isrelational
  4189 00001EF6 08C0                     or  al, al
  4190 00001EF8 0F841200                 je @@expr238
  4191 00001EFC 68[E11F]                 push expr_25
  4192 00001EFF E86703                   call rterm
  4193 00001F02 83C402                   add  sp, 2
  4194 00001F05 FF76F6                   push word [bp-10]
  4195 00001F08 E80F1E                   call cmpneg
  4196 00001F0B 83C402                   add  sp, 2
  4197                                  
  4198                                  ;-414   return 0;
  4199                                  
  4200                                  @@expr238:
  4201 00001F0E B80000                   mov ax, 0
  4202 00001F11 E90000                   jmp @@retn
  4203                                  
  4204                                  ;-415 }
  4205                                  
  4206                                  
  4207                                  ;-416 
  4208                                  
  4209                                  
  4210                                  ;-417 int compoundass(char *op, int mode, int id1) {
  4211                                  
  4212 00001F14 C9                      @@retn: LEAVE
  4213 00001F15 C3                       ret
  4214                                  ; ENDP
  4215 00001F16 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4216 00001F1F 2C2000             
  4217 00001F22 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4218 00001F2B 78206D757373205A61-
  4219 00001F34 686C206F6465722069-
  4220 00001F3D 6E74207365696E00   
  4221 00001F45 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4222 00001F4E 726C6175627400     
  4223 00001F55 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4224 00001F5E 776F726400              expr_4 db "word",0
  4225 00001F63 6279746500              expr_5 db "byte",0
  4226 00001F68 207074722000            expr_6 db " ptr ",0
  4227 00001F6E 4E7572207661722065-     expr_7 db "Nur var erlaubt",0
  4228 00001F77 726C6175627400     
  4229 00001F7E 5C6E20646563202000      expr_8 db "\n dec  ",0
  4230 00001F87 776F726400              expr_9 db "word",0
  4231 00001F8C 6279746500              expr_10 db "byte",0
  4232 00001F91 207074722000            expr_11 db " ptr ",0
  4233 00001F97 61646400                expr_12 db "add",0
  4234 00001F9B 73756200                expr_13 db "sub",0
  4235 00001F9F 616E6400                expr_14 db "and",0
  4236 00001FA3 6F7200                  expr_15 db "or",0
  4237 00001FA6 6E6F7420696D706C65-     expr_16 db "not implemented",0
  4238 00001FAF 6D656E74656400     
  4239 00001FB6 6E6F7420696D706C65-     expr_17 db "not implemented",0
  4240 00001FBF 6D656E74656400     
  4241 00001FC6 6D6F7600                expr_18 db "mov",0
  4242 00001FCA 61646400                expr_19 db "add",0
  4243 00001FCE 73756200                expr_20 db "sub",0
  4244 00001FD2 616E6400                expr_21 db "and",0
  4245 00001FD6 6F7200                  expr_22 db "or",0
  4246 00001FD9 73686C00                expr_23 db "shl",0
  4247 00001FDD 73687200                expr_24 db "shr",0
  4248 00001FE1 636D7000                expr_25 db "cmp",0
  4249                                  
  4250                                  compoundass:  ; *** PROC ***
  4251                                  
  4252                                  ;-418   if(mode) error1("only scalar Var allowed");
  4253                                  
  4254                                  ;Function : compoundass, Number of local variables: 3
  4255                                  ;   # type sign width addr used name   list of local variables
  4256                                  ;  200 ptr sign byte   417 NULL op = bp+4
  4257                                  ;  201 var sign word   417 NULL mode = bp+6
  4258                                  ;  202 var sign word   417 NULL id1 = bp+8;
  4259 00001FE5 C8000000                 ENTER  0,0
  4260 00001FE9 8B4606                   mov ax, [bp+6]
  4261 00001FEC 08C0                     or  al, al
  4262 00001FEE 0F840900                 je @@compoundass239
  4263 00001FF2 68[7120]                 push compoundass_0
  4264 00001FF5 E8BD2C                   call error1
  4265 00001FF8 83C402                   add  sp, 2
  4266                                  
  4267                                  ;-419   prnl(); prs(op); prs("  "); 
  4268                                  
  4269                                  @@compoundass239:
  4270 00001FFB E8C029                   call prnl
  4271 00001FFE FF7604                   push word [bp+4]
  4272 00002001 E8C829                   call prs
  4273 00002004 83C402                   add  sp, 2
  4274 00002007 68[8920]                 push compoundass_1
  4275 0000200A E8BF29                   call prs
  4276 0000200D 83C402                   add  sp, 2
  4277                                  
  4278                                  ;-420   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4279                                  
  4280 00002010 FF7608                   push word [bp+8]
  4281 00002013 E83BE6                   call gettypes
  4282 00002016 83C402                   add  sp, 2
  4283 00002019 A1[4200]                 mov ax, [wi]
  4284 0000201C 83F802                   cmp ax, 2
  4285 0000201F 0F850C00                 jne @@compoundass240
  4286 00002023 68[8C20]                 push compoundass_2
  4287 00002026 E8A329                   call prs
  4288 00002029 83C402                   add  sp, 2
  4289 0000202C E90900                   jmp @@compoundass241
  4290                                  @@compoundass240:
  4291 0000202F 68[9120]                 push compoundass_3
  4292 00002032 E89729                   call prs
  4293 00002035 83C402                   add  sp, 2
  4294                                  
  4295                                  ;-421     if (NASM==0) prs(" ptr "); v(id1); prs(", ");
  4296                                  
  4297                                  @@compoundass241:
  4298 00002038 A0[1400]                 mov al, [NASM]
  4299 0000203B 3C00                     cmp al, 0
  4300 0000203D 0F850900                 jne @@compoundass242
  4301 00002041 68[9620]                 push compoundass_4
  4302 00002044 E88529                   call prs
  4303 00002047 83C402                   add  sp, 2
  4304                                  @@compoundass242:
  4305 0000204A FF7608                   push word [bp+8]
  4306 0000204D E889E0                   call v
  4307 00002050 83C402                   add  sp, 2
  4308 00002053 68[9C20]                 push compoundass_5
  4309 00002056 E87329                   call prs
  4310 00002059 83C402                   add  sp, 2
  4311                                  
  4312                                  ;-422   expect(T_CONST); prunsign1(lexval);
  4313                                  
  4314 0000205C 680101                   push 257
  4315 0000205F E85728                   call expect
  4316 00002062 83C402                   add  sp, 2
  4317 00002065 FF36[3700]               push word [lexval]
  4318 00002069 E8BA2A                   call prunsign1
  4319 0000206C 83C402                   add  sp, 2
  4320                                  
  4321                                  ;-423 }
  4322                                  
  4323                                  
  4324                                  ;-424 int dovar1(int mode, int op, int ixarr, int id1) { 
  4325 0000206F C9                       LEAVE
  4326 00002070 C3                       ret
  4327                                  ; ENDP
  4328 00002071 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4329 0000207A 61722056617220616C-
  4330 00002083 6C6F77656400       
  4331 00002089 202000                  compoundass_1 db "  ",0
  4332 0000208C 776F726400              compoundass_2 db "word",0
  4333 00002091 6279746500              compoundass_3 db "byte",0
  4334 00002096 207074722000            compoundass_4 db " ptr ",0
  4335 0000209C 2C2000                  compoundass_5 db ", ",0
  4336                                  
  4337                                  dovar1:  ; *** PROC ***
  4338                                  
  4339                                  ;-425   gettypes(id1);
  4340                                  
  4341                                  ;Function : dovar1, Number of local variables: 4
  4342                                  ;   # type sign width addr used name   list of local variables
  4343                                  ;  200 var sign word   424 NULL mode = bp+4
  4344                                  ;  201 var sign word   424 NULL op = bp+6
  4345                                  ;  202 var sign word   424 NULL ixarr = bp+8
  4346                                  ;  203 var sign word   424 NULL id1 = bp+10;
  4347 0000209F C8000000                 ENTER  0,0
  4348 000020A3 FF760A                   push word [bp+10]
  4349 000020A6 E8A8E5                   call gettypes
  4350 000020A9 83C402                   add  sp, 2
  4351                                  
  4352                                  ;-426   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4353                                  
  4354 000020AC 8B4604                   mov ax, [bp+4]
  4355 000020AF 83F801                   cmp ax, 1
  4356 000020B2 0F854700                 jne @@dovar1243
  4357 000020B6 68[F421]                 push dovar1_0
  4358 000020B9 E81029                   call prs
  4359 000020BC 83C402                   add  sp, 2
  4360 000020BF FF760A                   push word [bp+10]
  4361 000020C2 E814E0                   call v
  4362 000020C5 83C402                   add  sp, 2
  4363 000020C8 E8F328                   call prnl
  4364 000020CB FF7606                   push word [bp+6]
  4365 000020CE E8FB28                   call prs
  4366 000020D1 83C402                   add  sp, 2
  4367                                  
  4368                                  ;-427     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4369                                  
  4370 000020D4 A1[3F00]                 mov ax, [widthi]
  4371 000020D7 83F801                   cmp ax, 1
  4372 000020DA 0F850900                 jne @@dovar1244
  4373 000020DE 68[0022]                 push dovar1_1
  4374 000020E1 E8E828                   call prs
  4375 000020E4 83C402                   add  sp, 2
  4376                                  
  4377                                  ;-428     if(widthi == 2) prs(" ax, [bx]");
  4378                                  
  4379                                  @@dovar1244:
  4380 000020E7 A1[3F00]                 mov ax, [widthi]
  4381 000020EA 83F802                   cmp ax, 2
  4382 000020ED 0F850900                 jne @@dovar1245
  4383 000020F1 68[1622]                 push dovar1_2
  4384 000020F4 E8D528                   call prs
  4385 000020F7 83C402                   add  sp, 2
  4386                                  
  4387                                  ;-429     return; }
  4388                                  
  4389                                  @@dovar1245:
  4390 000020FA E9F500                   jmp @@retn
  4391                                  
  4392                                  ;-430   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4393                                  
  4394                                  @@dovar1243:
  4395 000020FD 8B4604                   mov ax, [bp+4]
  4396 00002100 83F802                   cmp ax, 2
  4397 00002103 0F852100                 jne @@dovar1246
  4398 00002107 E8B428                   call prnl
  4399 0000210A FF7606                   push word [bp+6]
  4400 0000210D E8BC28                   call prs
  4401 00002110 83C402                   add  sp, 2
  4402 00002113 68[2022]                 push dovar1_3
  4403 00002116 E8B328                   call prs
  4404 00002119 83C402                   add  sp, 2
  4405 0000211C FF760A                   push word [bp+10]
  4406 0000211F E88EDF                   call a
  4407 00002122 83C402                   add  sp, 2
  4408 00002125 E9CA00                   jmp @@retn
  4409                                  
  4410                                  ;-431   if (ixarr) {
  4411                                  
  4412                                  @@dovar1246:
  4413 00002128 8B4608                   mov ax, [bp+8]
  4414 0000212B 08C0                     or  al, al
  4415 0000212D 0F847300                 je @@dovar1247
  4416                                  
  4417                                  ;-432     prs("\n mov bx, "); v(ixarr);
  4418                                  
  4419 00002131 68[2622]                 push dovar1_4
  4420 00002134 E89528                   call prs
  4421 00002137 83C402                   add  sp, 2
  4422 0000213A FF7608                   push word [bp+8]
  4423 0000213D E899DF                   call v
  4424 00002140 83C402                   add  sp, 2
  4425                                  
  4426                                  ;-433     if (wi==2) prs("\n shl bx, 1");
  4427                                  
  4428 00002143 A1[4200]                 mov ax, [wi]
  4429 00002146 83F802                   cmp ax, 2
  4430 00002149 0F850900                 jne @@dovar1248
  4431 0000214D 68[3222]                 push dovar1_5
  4432 00002150 E87928                   call prs
  4433 00002153 83C402                   add  sp, 2
  4434                                  
  4435                                  ;-434     prs("\n "); prs(op);
  4436                                  
  4437                                  @@dovar1248:
  4438 00002156 68[3F22]                 push dovar1_6
  4439 00002159 E87028                   call prs
  4440 0000215C 83C402                   add  sp, 2
  4441 0000215F FF7606                   push word [bp+6]
  4442 00002162 E86728                   call prs
  4443 00002165 83C402                   add  sp, 2
  4444                                  
  4445                                  ;-435     if (wi==2) prs(" ax, "); else prs(" al, ");
  4446                                  
  4447 00002168 A1[4200]                 mov ax, [wi]
  4448 0000216B 83F802                   cmp ax, 2
  4449 0000216E 0F850C00                 jne @@dovar1249
  4450 00002172 68[4322]                 push dovar1_7
  4451 00002175 E85428                   call prs
  4452 00002178 83C402                   add  sp, 2
  4453 0000217B E90900                   jmp @@dovar1250
  4454                                  @@dovar1249:
  4455 0000217E 68[4922]                 push dovar1_8
  4456 00002181 E84828                   call prs
  4457 00002184 83C402                   add  sp, 2
  4458                                  
  4459                                  ;-436 // v(id1); prs(" [bx]");
  4460                                  
  4461                                  
  4462                                  ;-437     prc('['); printName(id1); prs(" + bx]"); 
  4463                                  
  4464                                  @@dovar1250:
  4465 00002187 6A5B                     push 91
  4466 00002189 E8D927                   call prc
  4467 0000218C 83C402                   add  sp, 2
  4468 0000218F FF760A                   push word [bp+10]
  4469 00002192 E896E5                   call printName
  4470 00002195 83C402                   add  sp, 2
  4471 00002198 68[4F22]                 push dovar1_9
  4472 0000219B E82E28                   call prs
  4473 0000219E 83C402                   add  sp, 2
  4474                                  
  4475                                  ;-438     return; }
  4476                                  
  4477 000021A1 E94E00                   jmp @@retn
  4478                                  
  4479                                  ;-439   prnl();prs(op);
  4480                                  
  4481                                  @@dovar1247:
  4482 000021A4 E81728                   call prnl
  4483 000021A7 FF7606                   push word [bp+6]
  4484 000021AA E81F28                   call prs
  4485 000021AD 83C402                   add  sp, 2
  4486                                  
  4487                                  ;-440   if(wi==1) prs(" al, ");
  4488                                  
  4489 000021B0 A1[4200]                 mov ax, [wi]
  4490 000021B3 83F801                   cmp ax, 1
  4491 000021B6 0F850900                 jne @@dovar1251
  4492 000021BA 68[5622]                 push dovar1_10
  4493 000021BD E80C28                   call prs
  4494 000021C0 83C402                   add  sp, 2
  4495                                  
  4496                                  ;-441   if(wi==2) prs(" ax, ");
  4497                                  
  4498                                  @@dovar1251:
  4499 000021C3 A1[4200]                 mov ax, [wi]
  4500 000021C6 83F802                   cmp ax, 2
  4501 000021C9 0F850900                 jne @@dovar1252
  4502 000021CD 68[5C22]                 push dovar1_11
  4503 000021D0 E8F927                   call prs
  4504 000021D3 83C402                   add  sp, 2
  4505                                  
  4506                                  ;-442   if(wi==4) prs(" eax, ");
  4507                                  
  4508                                  @@dovar1252:
  4509 000021D6 A1[4200]                 mov ax, [wi]
  4510 000021D9 83F804                   cmp ax, 4
  4511 000021DC 0F850900                 jne @@dovar1253
  4512 000021E0 68[6222]                 push dovar1_12
  4513 000021E3 E8E627                   call prs
  4514 000021E6 83C402                   add  sp, 2
  4515                                  
  4516                                  ;-443   v(id1);
  4517                                  
  4518                                  @@dovar1253:
  4519 000021E9 FF760A                   push word [bp+10]
  4520 000021EC E8EADE                   call v
  4521 000021EF 83C402                   add  sp, 2
  4522                                  
  4523                                  ;-444 }
  4524                                  
  4525                                  
  4526                                  ;-445 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4527                                  
  4528 000021F2 C9                      @@retn: LEAVE
  4529 000021F3 C3                       ret
  4530                                  ; ENDP
  4531 000021F4 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4532 000021FD 2C2000             
  4533 00002200 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4534 00002209 5C6E206D6F76206168-
  4535 00002212 2C203000           
  4536 00002216 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4537 0000221F 00                 
  4538 00002220 2061782C2000            dovar1_3 db " ax, ",0
  4539 00002226 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4540 0000222F 2C2000             
  4541 00002232 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4542 0000223B 2C203100           
  4543 0000223F 5C6E2000                dovar1_6 db "\n ",0
  4544 00002243 2061782C2000            dovar1_7 db " ax, ",0
  4545 00002249 20616C2C2000            dovar1_8 db " al, ",0
  4546 0000224F 202B2062785D00          dovar1_9 db " + bx]",0
  4547 00002256 20616C2C2000            dovar1_10 db " al, ",0
  4548 0000225C 2061782C2000            dovar1_11 db " ax, ",0
  4549 00002262 206561782C2000          dovar1_12 db " eax, ",0
  4550                                  
  4551                                  rterm:  ; *** PROC ***
  4552                                  
  4553                                  ;-446   if (istoken(T_CONST)) { prnl(); prs(op); 
  4554                                  
  4555                                  ;Function : rterm, Number of local variables: 5
  4556                                  ;   # type sign width addr used name   list of local variables
  4557                                  ;  200 ptr sign byte   445 NULL op = bp+4
  4558                                  ;  201 var sign word   445 NULL mode = bp-2
  4559                                  ;  202 var sign word   445 NULL opint = bp-4
  4560                                  ;  203 var sign word   445 NULL ixarr = bp-6
  4561                                  ;  204 var sign word   445 NULL id1 = bp-8;
  4562 00002269 C8080000                 ENTER  8,0
  4563 0000226D 680101                   push 257
  4564 00002270 E82426                   call istoken
  4565 00002273 83C402                   add  sp, 2
  4566 00002276 08C0                     or  al, al
  4567 00002278 0F845200                 je @@rterm254
  4568 0000227C E83F27                   call prnl
  4569 0000227F FF7604                   push word [bp+4]
  4570 00002282 E84727                   call prs
  4571 00002285 83C402                   add  sp, 2
  4572                                  
  4573                                  ;-447     if (wi==1) prs(" al, ");
  4574                                  
  4575 00002288 A1[4200]                 mov ax, [wi]
  4576 0000228B 83F801                   cmp ax, 1
  4577 0000228E 0F850900                 jne @@rterm255
  4578 00002292 68[5223]                 push rterm_0
  4579 00002295 E83427                   call prs
  4580 00002298 83C402                   add  sp, 2
  4581                                  
  4582                                  ;-448     if (wi==2) prs(" ax, ");
  4583                                  
  4584                                  @@rterm255:
  4585 0000229B A1[4200]                 mov ax, [wi]
  4586 0000229E 83F802                   cmp ax, 2
  4587 000022A1 0F850900                 jne @@rterm256
  4588 000022A5 68[5823]                 push rterm_1
  4589 000022A8 E82127                   call prs
  4590 000022AB 83C402                   add  sp, 2
  4591                                  
  4592                                  ;-449     if (wi==4) prs(" eax, ");
  4593                                  
  4594                                  @@rterm256:
  4595 000022AE A1[4200]                 mov ax, [wi]
  4596 000022B1 83F804                   cmp ax, 4
  4597 000022B4 0F850900                 jne @@rterm257
  4598 000022B8 68[5E23]                 push rterm_2
  4599 000022BB E80E27                   call prs
  4600 000022BE 83C402                   add  sp, 2
  4601                                  
  4602                                  ;-450     prunsign1(lexval); return;}
  4603                                  
  4604                                  @@rterm257:
  4605 000022C1 FF36[3700]               push word [lexval]
  4606 000022C5 E85E28                   call prunsign1
  4607 000022C8 83C402                   add  sp, 2
  4608 000022CB E98200                   jmp @@retn
  4609                                  
  4610                                  ;-451   mode=typeName(); id1=searchname(); ixarr=0;
  4611                                  
  4612                                  @@rterm254:
  4613 000022CE E88DE5                   call typeName
  4614 000022D1 8946FE                   mov [bp-2], ax
  4615 000022D4 E8B8E4                   call searchname
  4616 000022D7 8946F8                   mov [bp-8], ax
  4617 000022DA B80000                   mov ax, 0
  4618 000022DD 8946FA                   mov [bp-6], ax
  4619                                  
  4620                                  ;-452   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  4621                                  
  4622 000022E0 6A5B                     push 91
  4623 000022E2 E8B225                   call istoken
  4624 000022E5 83C402                   add  sp, 2
  4625 000022E8 08C0                     or  al, al
  4626 000022EA 0F843300                 je @@rterm258
  4627 000022EE E89EE4                   call searchname
  4628 000022F1 8946FA                   mov [bp-6], ax
  4629 000022F4 680001                   push 256
  4630 000022F7 E8BF25                   call expect
  4631 000022FA 83C402                   add  sp, 2
  4632 000022FD 6A5D                     push 93
  4633 000022FF E8B725                   call expect
  4634 00002302 83C402                   add  sp, 2
  4635                                  
  4636                                  ;-453     gettypes(ixarr);
  4637                                  
  4638 00002305 FF76FA                   push word [bp-6]
  4639 00002308 E846E3                   call gettypes
  4640 0000230B 83C402                   add  sp, 2
  4641                                  
  4642                                  ;-454     if (widthi != 2) error1("Arrayindex muss int sein"); }
  4643                                  
  4644 0000230E A1[3F00]                 mov ax, [widthi]
  4645 00002311 83F802                   cmp ax, 2
  4646 00002314 0F840900                 je  @@rterm259
  4647 00002318 68[6523]                 push rterm_3
  4648 0000231B E89729                   call error1
  4649 0000231E 83C402                   add  sp, 2
  4650                                  @@rterm259:
  4651                                  
  4652                                  ;-455   if (eqstr(symbol,"_AX")) return;
  4653                                  
  4654                                  @@rterm258:
  4655 00002321 68[7E23]                 push rterm_4
  4656 00002324 8D062B81                 lea  ax, [symbol]
  4657 00002328 50                       push ax
  4658 00002329 E88537                   call eqstr
  4659 0000232C 83C404                   add  sp, 4
  4660 0000232F 08C0                     or  al, al
  4661 00002331 0F840300                 je @@rterm260
  4662 00002335 E91800                   jmp @@retn
  4663                                  
  4664                                  ;-456   opint=op; dovar1(mode, opint, ixarr, id1);
  4665                                  
  4666                                  @@rterm260:
  4667 00002338 8B4604                   mov ax, [bp+4]
  4668 0000233B 8946FC                   mov [bp-4], ax
  4669 0000233E FF76F8                   push word [bp-8]
  4670 00002341 FF76FA                   push word [bp-6]
  4671 00002344 FF76FC                   push word [bp-4]
  4672 00002347 FF76FE                   push word [bp-2]
  4673 0000234A E852FD                   call dovar1
  4674 0000234D 83C408                   add  sp, 8
  4675                                  
  4676                                  ;-457 }
  4677                                  
  4678                                  
  4679                                  ;-458 int isreg() {
  4680                                  
  4681 00002350 C9                      @@retn: LEAVE
  4682 00002351 C3                       ret
  4683                                  ; ENDP
  4684 00002352 20616C2C2000            rterm_0 db " al, ",0
  4685 00002358 2061782C2000            rterm_1 db " ax, ",0
  4686 0000235E 206561782C2000          rterm_2 db " eax, ",0
  4687 00002365 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  4688 0000236E 78206D75737320696E-
  4689 00002377 74207365696E00     
  4690 0000237E 5F415800                rterm_4 db "_AX",0
  4691                                  
  4692                                  isreg:  ; *** PROC ***
  4693                                  
  4694                                  ;-459   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  4695                                  
  4696 00002382 68[6F25]                 push isreg_0
  4697 00002385 8D062B81                 lea  ax, [symbol]
  4698 00002389 50                       push ax
  4699 0000238A E82437                   call eqstr
  4700 0000238D 83C404                   add  sp, 4
  4701 00002390 08C0                     or  al, al
  4702 00002392 0F840C00                 je @@isreg261
  4703 00002396 68[7325]                 push isreg_1
  4704 00002399 E84202                   call doreg
  4705 0000239C 83C402                   add  sp, 2
  4706 0000239F E9C601                   jmp @@r1
  4707                                  
  4708                                  ;-460   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  4709                                  
  4710                                  @@isreg261:
  4711 000023A2 68[7625]                 push isreg_2
  4712 000023A5 8D062B81                 lea  ax, [symbol]
  4713 000023A9 50                       push ax
  4714 000023AA E80437                   call eqstr
  4715 000023AD 83C404                   add  sp, 4
  4716 000023B0 08C0                     or  al, al
  4717 000023B2 0F840C00                 je @@isreg262
  4718 000023B6 68[7A25]                 push isreg_3
  4719 000023B9 E82202                   call doreg
  4720 000023BC 83C402                   add  sp, 2
  4721 000023BF E9A601                   jmp @@r1
  4722                                  
  4723                                  ;-461   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  4724                                  
  4725                                  @@isreg262:
  4726 000023C2 68[7D25]                 push isreg_4
  4727 000023C5 8D062B81                 lea  ax, [symbol]
  4728 000023C9 50                       push ax
  4729 000023CA E8E436                   call eqstr
  4730 000023CD 83C404                   add  sp, 4
  4731 000023D0 08C0                     or  al, al
  4732 000023D2 0F840C00                 je @@isreg263
  4733 000023D6 68[8125]                 push isreg_5
  4734 000023D9 E80202                   call doreg
  4735 000023DC 83C402                   add  sp, 2
  4736 000023DF E98601                   jmp @@r1
  4737                                  
  4738                                  ;-462   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  4739                                  
  4740                                  @@isreg263:
  4741 000023E2 68[8425]                 push isreg_6
  4742 000023E5 8D062B81                 lea  ax, [symbol]
  4743 000023E9 50                       push ax
  4744 000023EA E8C436                   call eqstr
  4745 000023ED 83C404                   add  sp, 4
  4746 000023F0 08C0                     or  al, al
  4747 000023F2 0F840C00                 je @@isreg264
  4748 000023F6 68[8825]                 push isreg_7
  4749 000023F9 E8E201                   call doreg
  4750 000023FC 83C402                   add  sp, 2
  4751 000023FF E96601                   jmp @@r1
  4752                                  
  4753                                  ;-463   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  4754                                  
  4755                                  @@isreg264:
  4756 00002402 68[8B25]                 push isreg_8
  4757 00002405 8D062B81                 lea  ax, [symbol]
  4758 00002409 50                       push ax
  4759 0000240A E8A436                   call eqstr
  4760 0000240D 83C404                   add  sp, 4
  4761 00002410 08C0                     or  al, al
  4762 00002412 0F840C00                 je @@isreg265
  4763 00002416 68[8F25]                 push isreg_9
  4764 00002419 E8C201                   call doreg
  4765 0000241C 83C402                   add  sp, 2
  4766 0000241F E94601                   jmp @@r1
  4767                                  
  4768                                  ;-464   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  4769                                  
  4770                                  @@isreg265:
  4771 00002422 68[9225]                 push isreg_10
  4772 00002425 8D062B81                 lea  ax, [symbol]
  4773 00002429 50                       push ax
  4774 0000242A E88436                   call eqstr
  4775 0000242D 83C404                   add  sp, 4
  4776 00002430 08C0                     or  al, al
  4777 00002432 0F840C00                 je @@isreg266
  4778 00002436 68[9625]                 push isreg_11
  4779 00002439 E8A201                   call doreg
  4780 0000243C 83C402                   add  sp, 2
  4781 0000243F E92601                   jmp @@r1
  4782                                  
  4783                                  ;-465   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  4784                                  
  4785                                  @@isreg266:
  4786 00002442 68[9925]                 push isreg_12
  4787 00002445 8D062B81                 lea  ax, [symbol]
  4788 00002449 50                       push ax
  4789 0000244A E86436                   call eqstr
  4790 0000244D 83C404                   add  sp, 4
  4791 00002450 08C0                     or  al, al
  4792 00002452 0F840C00                 je @@isreg267
  4793 00002456 68[9D25]                 push isreg_13
  4794 00002459 E88201                   call doreg
  4795 0000245C 83C402                   add  sp, 2
  4796 0000245F E90601                   jmp @@r1
  4797                                  
  4798                                  ;-466   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  4799                                  
  4800                                  @@isreg267:
  4801 00002462 68[A025]                 push isreg_14
  4802 00002465 8D062B81                 lea  ax, [symbol]
  4803 00002469 50                       push ax
  4804 0000246A E84436                   call eqstr
  4805 0000246D 83C404                   add  sp, 4
  4806 00002470 08C0                     or  al, al
  4807 00002472 0F840C00                 je @@isreg268
  4808 00002476 68[A425]                 push isreg_15
  4809 00002479 E86201                   call doreg
  4810 0000247C 83C402                   add  sp, 2
  4811 0000247F E9E600                   jmp @@r1
  4812                                  
  4813                                  ;-467   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  4814                                  
  4815                                  @@isreg268:
  4816 00002482 68[A725]                 push isreg_16
  4817 00002485 8D062B81                 lea  ax, [symbol]
  4818 00002489 50                       push ax
  4819 0000248A E82436                   call eqstr
  4820 0000248D 83C404                   add  sp, 4
  4821 00002490 08C0                     or  al, al
  4822 00002492 0F840C00                 je @@isreg269
  4823 00002496 68[AB25]                 push isreg_17
  4824 00002499 E84201                   call doreg
  4825 0000249C 83C402                   add  sp, 2
  4826 0000249F E9C600                   jmp @@r1
  4827                                  
  4828                                  ;-468   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  4829                                  
  4830                                  @@isreg269:
  4831 000024A2 68[AE25]                 push isreg_18
  4832 000024A5 8D062B81                 lea  ax, [symbol]
  4833 000024A9 50                       push ax
  4834 000024AA E80436                   call eqstr
  4835 000024AD 83C404                   add  sp, 4
  4836 000024B0 08C0                     or  al, al
  4837 000024B2 0F840C00                 je @@isreg270
  4838 000024B6 68[B225]                 push isreg_19
  4839 000024B9 E82201                   call doreg
  4840 000024BC 83C402                   add  sp, 2
  4841 000024BF E9A600                   jmp @@r1
  4842                                  
  4843                                  ;-469   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  4844                                  
  4845                                  @@isreg270:
  4846 000024C2 68[B525]                 push isreg_20
  4847 000024C5 8D062B81                 lea  ax, [symbol]
  4848 000024C9 50                       push ax
  4849 000024CA E8E435                   call eqstr
  4850 000024CD 83C404                   add  sp, 4
  4851 000024D0 08C0                     or  al, al
  4852 000024D2 0F840C00                 je @@isreg271
  4853 000024D6 68[B925]                 push isreg_21
  4854 000024D9 E80201                   call doreg
  4855 000024DC 83C402                   add  sp, 2
  4856 000024DF E98600                   jmp @@r1
  4857                                  
  4858                                  ;-470   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  4859                                  
  4860                                  @@isreg271:
  4861 000024E2 68[BC25]                 push isreg_22
  4862 000024E5 8D062B81                 lea  ax, [symbol]
  4863 000024E9 50                       push ax
  4864 000024EA E8C435                   call eqstr
  4865 000024ED 83C404                   add  sp, 4
  4866 000024F0 08C0                     or  al, al
  4867 000024F2 0F840C00                 je @@isreg272
  4868 000024F6 68[C025]                 push isreg_23
  4869 000024F9 E8E200                   call doreg
  4870 000024FC 83C402                   add  sp, 2
  4871 000024FF E96600                   jmp @@r1
  4872                                  
  4873                                  ;-471   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  4874                                  
  4875                                  @@isreg272:
  4876 00002502 68[C325]                 push isreg_24
  4877 00002505 8D062B81                 lea  ax, [symbol]
  4878 00002509 50                       push ax
  4879 0000250A E8A435                   call eqstr
  4880 0000250D 83C404                   add  sp, 4
  4881 00002510 08C0                     or  al, al
  4882 00002512 0F840C00                 je @@isreg273
  4883 00002516 68[C725]                 push isreg_25
  4884 00002519 E8C200                   call doreg
  4885 0000251C 83C402                   add  sp, 2
  4886 0000251F E94600                   jmp @@r1
  4887                                  
  4888                                  ;-472   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  4889                                  
  4890                                  @@isreg273:
  4891 00002522 68[CA25]                 push isreg_26
  4892 00002525 8D062B81                 lea  ax, [symbol]
  4893 00002529 50                       push ax
  4894 0000252A E88435                   call eqstr
  4895 0000252D 83C404                   add  sp, 4
  4896 00002530 08C0                     or  al, al
  4897 00002532 0F840C00                 je @@isreg274
  4898 00002536 68[CE25]                 push isreg_27
  4899 00002539 E8A200                   call doreg
  4900 0000253C 83C402                   add  sp, 2
  4901 0000253F E92600                   jmp @@r1
  4902                                  
  4903                                  ;-473   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  4904                                  
  4905                                  @@isreg274:
  4906 00002542 68[D125]                 push isreg_28
  4907 00002545 8D062B81                 lea  ax, [symbol]
  4908 00002549 50                       push ax
  4909 0000254A E86435                   call eqstr
  4910 0000254D 83C404                   add  sp, 4
  4911 00002550 08C0                     or  al, al
  4912 00002552 0F840C00                 je @@isreg275
  4913 00002556 68[D825]                 push isreg_29
  4914 00002559 E88200                   call doreg
  4915 0000255C 83C402                   add  sp, 2
  4916 0000255F E90600                   jmp @@r1
  4917                                  
  4918                                  ;-474   return 0;   r1: return 1; 
  4919                                  
  4920                                  @@isreg275:
  4921 00002562 B80000                   mov ax, 0
  4922 00002565 E90600                   jmp @@retn
  4923                                  @@r1:
  4924 00002568 B80100                   mov ax, 1
  4925 0000256B E90000                   jmp @@retn
  4926                                  
  4927                                  ;-475 }
  4928                                  
  4929                                  
  4930                                  ;-476 int doreg(char *dr) { int i; expect('=');
  4931                                  
  4932                                  @@retn:
  4933 0000256E C3                       ret
  4934                                  ; ENDP
  4935 0000256F 5F414800                isreg_0 db "_AH",0
  4936 00002573 616800                  isreg_1 db "ah",0
  4937 00002576 5F414C00                isreg_2 db "_AL",0
  4938 0000257A 616C00                  isreg_3 db "al",0
  4939 0000257D 5F415800                isreg_4 db "_AX",0
  4940 00002581 617800                  isreg_5 db "ax",0
  4941 00002584 5F424800                isreg_6 db "_BH",0
  4942 00002588 626800                  isreg_7 db "bh",0
  4943 0000258B 5F424C00                isreg_8 db "_BL",0
  4944 0000258F 626C00                  isreg_9 db "bl",0
  4945 00002592 5F425800                isreg_10 db "_BX",0
  4946 00002596 627800                  isreg_11 db "bx",0
  4947 00002599 5F434800                isreg_12 db "_CH",0
  4948 0000259D 636800                  isreg_13 db "ch",0
  4949 000025A0 5F434C00                isreg_14 db "_CL",0
  4950 000025A4 636C00                  isreg_15 db "cl",0
  4951 000025A7 5F435800                isreg_16 db "_CX",0
  4952 000025AB 637800                  isreg_17 db "cx",0
  4953 000025AE 5F444800                isreg_18 db "_DH",0
  4954 000025B2 646800                  isreg_19 db "dh",0
  4955 000025B5 5F444C00                isreg_20 db "_DL",0
  4956 000025B9 646C00                  isreg_21 db "dl",0
  4957 000025BC 5F445800                isreg_22 db "_DX",0
  4958 000025C0 647800                  isreg_23 db "dx",0
  4959 000025C3 5F534900                isreg_24 db "_SI",0
  4960 000025C7 736900                  isreg_25 db "si",0
  4961 000025CA 5F444900                isreg_26 db "_DI",0
  4962 000025CE 646900                  isreg_27 db "di",0
  4963 000025D1 5F464C41475300          isreg_28 db "_FLAGS",0
  4964 000025D8 666C61677300            isreg_29 db "flags",0
  4965                                  
  4966                                  doreg:  ; *** PROC ***
  4967                                  ;Function : doreg, Number of local variables: 2
  4968                                  ;   # type sign width addr used name   list of local variables
  4969                                  ;  200 ptr sign byte   476 NULL dr = bp+4
  4970                                  ;  201 var sign word   476 NULL i = bp-2;
  4971 000025DE C8020000                 ENTER  2,0
  4972 000025E2 6A3D                     push 61
  4973 000025E4 E8D222                   call expect
  4974 000025E7 83C402                   add  sp, 2
  4975                                  
  4976                                  ;-477   prs("\n mov  "); prs(dr); prs(", ");
  4977                                  
  4978 000025EA 68[4D26]                 push doreg_0
  4979 000025ED E8DC23                   call prs
  4980 000025F0 83C402                   add  sp, 2
  4981 000025F3 FF7604                   push word [bp+4]
  4982 000025F6 E8D323                   call prs
  4983 000025F9 83C402                   add  sp, 2
  4984 000025FC 68[5626]                 push doreg_1
  4985 000025FF E8CA23                   call prs
  4986 00002602 83C402                   add  sp, 2
  4987                                  
  4988                                  ;-478        if (istoken(T_CONST)) prunsign1(lexval);
  4989                                  
  4990 00002605 680101                   push 257
  4991 00002608 E88C22                   call istoken
  4992 0000260B 83C402                   add  sp, 2
  4993 0000260E 08C0                     or  al, al
  4994 00002610 0F840D00                 je @@doreg276
  4995 00002614 FF36[3700]               push word [lexval]
  4996 00002618 E80B25                   call prunsign1
  4997 0000261B 83C402                   add  sp, 2
  4998                                  
  4999                                  ;-479   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  5000                                  
  5001 0000261E E92A00                   jmp @@doreg277
  5002                                  @@doreg276:
  5003 00002621 680001                   push 256
  5004 00002624 E87022                   call istoken
  5005 00002627 83C402                   add  sp, 2
  5006 0000262A 08C0                     or  al, al
  5007 0000262C 0F841200                 je @@doreg278
  5008 00002630 E85CE1                   call searchname
  5009 00002633 8946FE                   mov [bp-2], ax
  5010 00002636 FF76FE                   push word [bp-2]
  5011 00002639 E89DDA                   call v
  5012 0000263C 83C402                   add  sp, 2
  5013                                  
  5014                                  ;-480   else error1("only number or var allowed"); }
  5015                                  
  5016 0000263F E90900                   jmp @@doreg279
  5017                                  @@doreg278:
  5018 00002642 68[5926]                 push doreg_2
  5019 00002645 E86D26                   call error1
  5020 00002648 83C402                   add  sp, 2
  5021                                  @@doreg279:
  5022                                  @@doreg277:
  5023                                  
  5024                                  ;-481 
  5025                                  
  5026                                  
  5027                                  ;-482 int doassign(int mode, int i, int ixarr, int ixconst) {
  5028 0000264B C9                       LEAVE
  5029 0000264C C3                       ret
  5030                                  ; ENDP
  5031 0000264D 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  5032 00002656 2C2000                  doreg_1 db ", ",0
  5033 00002659 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  5034 00002662 6572206F7220766172-
  5035 0000266B 20616C6C6F77656400 
  5036                                  
  5037                                  doassign:  ; *** PROC ***
  5038                                  
  5039                                  ;-483   gettypes(i);
  5040                                  
  5041                                  ;Function : doassign, Number of local variables: 4
  5042                                  ;   # type sign width addr used name   list of local variables
  5043                                  ;  200 var sign word   482 NULL mode = bp+4
  5044                                  ;  201 var sign word   482 NULL i = bp+6
  5045                                  ;  202 var sign word   482 NULL ixarr = bp+8
  5046                                  ;  203 var sign word   482 NULL ixconst = bp+10;
  5047 00002674 C8000000                 ENTER  0,0
  5048 00002678 FF7606                   push word [bp+6]
  5049 0000267B E8D3DF                   call gettypes
  5050 0000267E 83C402                   add  sp, 2
  5051                                  
  5052                                  ;-484   if (mode==1) {prs("\n mov  bx, ");v(i);                       /*NASM??*/
  5053                                  
  5054 00002681 8B4604                   mov ax, [bp+4]
  5055 00002684 83F801                   cmp ax, 1
  5056 00002687 0F853400                 jne @@doassign280
  5057 0000268B 68[4728]                 push doassign_0
  5058 0000268E E83B23                   call prs
  5059 00002691 83C402                   add  sp, 2
  5060 00002694 FF7606                   push word [bp+6]
  5061 00002697 E83FDA                   call v
  5062 0000269A 83C402                   add  sp, 2
  5063                                  
  5064                                  ;-485     if (widthi == 2) prs("\n mov  [bx], ax");
  5065                                  
  5066 0000269D A1[3F00]                 mov ax, [widthi]
  5067 000026A0 83F802                   cmp ax, 2
  5068 000026A3 0F850C00                 jne @@doassign281
  5069 000026A7 68[5428]                 push doassign_1
  5070 000026AA E81F23                   call prs
  5071 000026AD 83C402                   add  sp, 2
  5072                                  
  5073                                  ;-486     else  prs("\n mov  [bx], al"); return;}
  5074                                  
  5075 000026B0 E90900                   jmp @@doassign282
  5076                                  @@doassign281:
  5077 000026B3 68[6528]                 push doassign_2
  5078 000026B6 E81323                   call prs
  5079 000026B9 83C402                   add  sp, 2
  5080                                  @@doassign282:
  5081 000026BC E98601                   jmp @@retn
  5082                                  
  5083                                  ;-487   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  5084                                  
  5085                                  @@doassign280:
  5086 000026BF 8B4604                   mov ax, [bp+4]
  5087 000026C2 83F802                   cmp ax, 2
  5088 000026C5 0F851E00                 jne @@doassign283
  5089 000026C9 68[7628]                 push doassign_3
  5090 000026CC E8FD22                   call prs
  5091 000026CF 83C402                   add  sp, 2
  5092 000026D2 FF7606                   push word [bp+6]
  5093 000026D5 E8D8D9                   call a
  5094 000026D8 83C402                   add  sp, 2
  5095 000026DB 68[7F28]                 push doassign_4
  5096 000026DE E8EB22                   call prs
  5097 000026E1 83C402                   add  sp, 2
  5098 000026E4 E95E01                   jmp @@retn
  5099                                  
  5100                                  ;-488   if (ixarr) {  prs("\n mov bx, ");
  5101                                  
  5102                                  @@doassign283:
  5103 000026E7 8B4608                   mov ax, [bp+8]
  5104 000026EA 08C0                     or  al, al
  5105 000026EC 0F846E00                 je @@doassign284
  5106 000026F0 68[8428]                 push doassign_5
  5107 000026F3 E8D622                   call prs
  5108 000026F6 83C402                   add  sp, 2
  5109                                  
  5110                                  ;-489     if(ixconst) prunsign1(ixarr); else v(ixarr);
  5111                                  
  5112 000026F9 8B460A                   mov ax, [bp+10]
  5113 000026FC 08C0                     or  al, al
  5114 000026FE 0F840C00                 je @@doassign285
  5115 00002702 FF7608                   push word [bp+8]
  5116 00002705 E81E24                   call prunsign1
  5117 00002708 83C402                   add  sp, 2
  5118 0000270B E90900                   jmp @@doassign286
  5119                                  @@doassign285:
  5120 0000270E FF7608                   push word [bp+8]
  5121 00002711 E8C5D9                   call v
  5122 00002714 83C402                   add  sp, 2
  5123                                  
  5124                                  ;-490     if (wi==2) prs("\n shl bx, 1");
  5125                                  
  5126                                  @@doassign286:
  5127 00002717 A1[4200]                 mov ax, [wi]
  5128 0000271A 83F802                   cmp ax, 2
  5129 0000271D 0F850900                 jne @@doassign287
  5130 00002721 68[9028]                 push doassign_6
  5131 00002724 E8A522                   call prs
  5132 00002727 83C402                   add  sp, 2
  5133                                  
  5134                                  ;-491     prs("\n mov ["); printName(i);
  5135                                  
  5136                                  @@doassign287:
  5137 0000272A 68[9D28]                 push doassign_7
  5138 0000272D E89C22                   call prs
  5139 00002730 83C402                   add  sp, 2
  5140 00002733 FF7606                   push word [bp+6]
  5141 00002736 E8F2DF                   call printName
  5142 00002739 83C402                   add  sp, 2
  5143                                  
  5144                                  ;-492     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5145                                  
  5146 0000273C A1[4200]                 mov ax, [wi]
  5147 0000273F 83F802                   cmp ax, 2
  5148 00002742 0F850C00                 jne @@doassign288
  5149 00002746 68[A628]                 push doassign_8
  5150 00002749 E88022                   call prs
  5151 0000274C 83C402                   add  sp, 2
  5152 0000274F E90900                   jmp @@doassign289
  5153                                  @@doassign288:
  5154 00002752 68[AF28]                 push doassign_9
  5155 00002755 E87422                   call prs
  5156 00002758 83C402                   add  sp, 2
  5157                                  @@doassign289:
  5158 0000275B E9E700                   jmp @@retn
  5159                                  
  5160                                  ;-493   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5161                                  
  5162                                  @@doassign284:
  5163 0000275E A1[4200]                 mov ax, [wi]
  5164 00002761 83F801                   cmp ax, 1
  5165 00002764 0F854300                 jne @@doassign290
  5166 00002768 68[B828]                 push doassign_10
  5167 0000276B E85E22                   call prs
  5168 0000276E 83C402                   add  sp, 2
  5169 00002771 8B4606                   mov ax, [bp+6]
  5170 00002774 3DC800                   cmp ax, 200
  5171 00002777 0F8D1B00                 jge @@doassign291
  5172 0000277B 68[C028]                 push doassign_11
  5173 0000277E E84B22                   call prs
  5174 00002781 83C402                   add  sp, 2
  5175                                  
  5176                                  ;-494     if(NASM==0)prs("ptr ");} v(i); prs(", al"); return; }
  5177                                  
  5178 00002784 A0[1400]                 mov al, [NASM]
  5179 00002787 3C00                     cmp al, 0
  5180 00002789 0F850900                 jne @@doassign292
  5181 0000278D 68[C628]                 push doassign_12
  5182 00002790 E83922                   call prs
  5183 00002793 83C402                   add  sp, 2
  5184                                  @@doassign292:
  5185                                  @@doassign291:
  5186 00002796 FF7606                   push word [bp+6]
  5187 00002799 E83DD9                   call v
  5188 0000279C 83C402                   add  sp, 2
  5189 0000279F 68[CB28]                 push doassign_13
  5190 000027A2 E82722                   call prs
  5191 000027A5 83C402                   add  sp, 2
  5192 000027A8 E99A00                   jmp @@retn
  5193                                  
  5194                                  ;-495   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5195                                  
  5196                                  @@doassign290:
  5197 000027AB A1[4200]                 mov ax, [wi]
  5198 000027AE 83F802                   cmp ax, 2
  5199 000027B1 0F854300                 jne @@doassign293
  5200 000027B5 68[D028]                 push doassign_14
  5201 000027B8 E81122                   call prs
  5202 000027BB 83C402                   add  sp, 2
  5203 000027BE 8B4606                   mov ax, [bp+6]
  5204 000027C1 3DC800                   cmp ax, 200
  5205 000027C4 0F8D1B00                 jge @@doassign294
  5206 000027C8 68[D828]                 push doassign_15
  5207 000027CB E8FE21                   call prs
  5208 000027CE 83C402                   add  sp, 2
  5209                                  
  5210                                  ;-496     if(NASM==0)prs("ptr ");} v(i); prs(", ax"); return; }
  5211                                  
  5212 000027D1 A0[1400]                 mov al, [NASM]
  5213 000027D4 3C00                     cmp al, 0
  5214 000027D6 0F850900                 jne @@doassign295
  5215 000027DA 68[DE28]                 push doassign_16
  5216 000027DD E8EC21                   call prs
  5217 000027E0 83C402                   add  sp, 2
  5218                                  @@doassign295:
  5219                                  @@doassign294:
  5220 000027E3 FF7606                   push word [bp+6]
  5221 000027E6 E8F0D8                   call v
  5222 000027E9 83C402                   add  sp, 2
  5223 000027EC 68[E328]                 push doassign_17
  5224 000027EF E8DA21                   call prs
  5225 000027F2 83C402                   add  sp, 2
  5226 000027F5 E94D00                   jmp @@retn
  5227                                  
  5228                                  ;-497   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5229                                  
  5230                                  @@doassign293:
  5231 000027F8 A1[4200]                 mov ax, [wi]
  5232 000027FB 83F804                   cmp ax, 4
  5233 000027FE 0F854300                 jne @@doassign296
  5234 00002802 68[E828]                 push doassign_18
  5235 00002805 E8C421                   call prs
  5236 00002808 83C402                   add  sp, 2
  5237 0000280B 8B4606                   mov ax, [bp+6]
  5238 0000280E 3DC800                   cmp ax, 200
  5239 00002811 0F8D1B00                 jge @@doassign297
  5240 00002815 68[F028]                 push doassign_19
  5241 00002818 E8B121                   call prs
  5242 0000281B 83C402                   add  sp, 2
  5243                                  
  5244                                  ;-498     if(NASM==0)prs("ptr ");} v(i); prs(", eax"); return; }
  5245                                  
  5246 0000281E A0[1400]                 mov al, [NASM]
  5247 00002821 3C00                     cmp al, 0
  5248 00002823 0F850900                 jne @@doassign298
  5249 00002827 68[F728]                 push doassign_20
  5250 0000282A E89F21                   call prs
  5251 0000282D 83C402                   add  sp, 2
  5252                                  @@doassign298:
  5253                                  @@doassign297:
  5254 00002830 FF7606                   push word [bp+6]
  5255 00002833 E8A3D8                   call v
  5256 00002836 83C402                   add  sp, 2
  5257 00002839 68[FC28]                 push doassign_21
  5258 0000283C E88D21                   call prs
  5259 0000283F 83C402                   add  sp, 2
  5260 00002842 E90000                   jmp @@retn
  5261                                  
  5262                                  ;-499 }
  5263                                  
  5264                                  @@doassign296:
  5265                                  
  5266                                  ;-500 int domul(int ids) {
  5267                                  
  5268 00002845 C9                      @@retn: LEAVE
  5269 00002846 C3                       ret
  5270                                  ; ENDP
  5271 00002847 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5272 00002850 782C2000           
  5273 00002854 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5274 0000285D 62785D2C20617800   
  5275 00002865 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5276 0000286E 62785D2C20616C00   
  5277 00002876 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5278 0000287F 2C20617800              doassign_4 db ", ax",0
  5279 00002884 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5280 0000288D 2C2000             
  5281 00002890 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5282 00002899 2C203100           
  5283 0000289D 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5284 000028A6 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5285 000028AF 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5286 000028B8 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5287 000028C0 627974652000            doassign_11 db "byte ",0
  5288 000028C6 7074722000              doassign_12 db "ptr ",0
  5289 000028CB 2C20616C00              doassign_13 db ", al",0
  5290 000028D0 5C6E206D6F762000        doassign_14 db "\n mov ",0
  5291 000028D8 776F72642000            doassign_15 db "word ",0
  5292 000028DE 7074722000              doassign_16 db "ptr ",0
  5293 000028E3 2C20617800              doassign_17 db ", ax",0
  5294 000028E8 5C6E206D6F762000        doassign_18 db "\n mov ",0
  5295 000028F0 64776F72642000          doassign_19 db "dword ",0
  5296 000028F7 7074722000              doassign_20 db "ptr ",0
  5297 000028FC 2C2065617800            doassign_21 db ", eax",0
  5298                                  
  5299                                  domul:  ; *** PROC ***
  5300                                  
  5301                                  ;-501   if (ids) rterm("imul"); else {
  5302                                  
  5303                                  ;Function : domul, Number of local variables: 1
  5304                                  ;   # type sign width addr used name   list of local variables
  5305                                  ;  200 var sign word   500 NULL ids = bp+4;
  5306 00002902 C8000000                 ENTER  0,0
  5307 00002906 8B4604                   mov ax, [bp+4]
  5308 00002909 08C0                     or  al, al
  5309 0000290B 0F840C00                 je @@domul299
  5310 0000290F 68[5429]                 push domul_0
  5311 00002912 E854F9                   call rterm
  5312 00002915 83C402                   add  sp, 2
  5313 00002918 E93700                   jmp @@domul300
  5314                                  @@domul299:
  5315                                  
  5316                                  ;-502   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5317                                  
  5318 0000291B 680101                   push 257
  5319 0000291E E8761F                   call istoken
  5320 00002921 83C402                   add  sp, 2
  5321 00002924 08C0                     or  al, al
  5322 00002926 0F841F00                 je @@domul301
  5323 0000292A 68[5929]                 push domul_1
  5324 0000292D E89C20                   call prs
  5325 00002930 83C402                   add  sp, 2
  5326 00002933 FF36[3700]               push word [lexval]
  5327 00002937 E8EC21                   call prunsign1
  5328 0000293A 83C402                   add  sp, 2
  5329 0000293D 68[6529]                 push domul_2
  5330 00002940 E88920                   call prs
  5331 00002943 83C402                   add  sp, 2
  5332                                  
  5333                                  ;-503   else error1("with MUL only const number as multiplicator allowed"); } }
  5334                                  
  5335 00002946 E90900                   jmp @@domul302
  5336                                  @@domul301:
  5337 00002949 68[6F29]                 push domul_3
  5338 0000294C E86623                   call error1
  5339 0000294F 83C402                   add  sp, 2
  5340                                  @@domul302:
  5341                                  @@domul300:
  5342                                  
  5343                                  ;-504 int doidiv(int ids) { int mode; int id1;
  5344 00002952 C9                       LEAVE
  5345 00002953 C3                       ret
  5346                                  ; ENDP
  5347 00002954 696D756C00              domul_0 db "imul",0
  5348 00002959 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5349 00002962 2C2000             
  5350 00002965 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5351 0000296E 00                 
  5352 0000296F 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5353 00002978 6F6E6C7920636F6E73-
  5354 00002981 74206E756D62657220-
  5355 0000298A 6173206D756C746970-
  5356 00002993 6C696361746F722061-
  5357 0000299C 6C6C6F77656400     
  5358                                  
  5359                                  doidiv:  ; *** PROC ***
  5360                                  
  5361                                  ;-505   if (istoken(T_CONST)) {
  5362                                  
  5363                                  ;Function : doidiv, Number of local variables: 3
  5364                                  ;   # type sign width addr used name   list of local variables
  5365                                  ;  200 var sign word   504 NULL ids = bp+4
  5366                                  ;  201 var sign word   504 NULL mode = bp-2
  5367                                  ;  202 var sign word   504 NULL id1 = bp-4;
  5368 000029A3 C8040000                 ENTER  4,0
  5369 000029A7 680101                   push 257
  5370 000029AA E8EA1E                   call istoken
  5371 000029AD 83C402                   add  sp, 2
  5372 000029B0 08C0                     or  al, al
  5373 000029B2 0F843400                 je @@doidiv303
  5374                                  
  5375                                  ;-506     prs("\n mov bx, "); prunsign1(lexval);
  5376                                  
  5377 000029B6 68[682A]                 push doidiv_0
  5378 000029B9 E81020                   call prs
  5379 000029BC 83C402                   add  sp, 2
  5380 000029BF FF36[3700]               push word [lexval]
  5381 000029C3 E86021                   call prunsign1
  5382 000029C6 83C402                   add  sp, 2
  5383                                  
  5384                                  ;-507     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5385                                  
  5386 000029C9 8B4604                   mov ax, [bp+4]
  5387 000029CC 08C0                     or  al, al
  5388 000029CE 0F840C00                 je @@doidiv304
  5389 000029D2 68[742A]                 push doidiv_1
  5390 000029D5 E8F41F                   call prs
  5391 000029D8 83C402                   add  sp, 2
  5392 000029DB E90900                   jmp @@doidiv305
  5393                                  @@doidiv304:
  5394 000029DE 68[852A]                 push doidiv_2
  5395 000029E1 E8E81F                   call prs
  5396 000029E4 83C402                   add  sp, 2
  5397                                  @@doidiv305:
  5398                                  
  5399                                  ;-508   else {
  5400                                  
  5401 000029E7 E97C00                   jmp @@doidiv306
  5402                                  @@doidiv303:
  5403                                  
  5404                                  ;-509     mode=typeName(); id1=searchname();
  5405                                  
  5406 000029EA E871DE                   call typeName
  5407 000029ED 8946FE                   mov [bp-2], ax
  5408 000029F0 E89CDD                   call searchname
  5409 000029F3 8946FC                   mov [bp-4], ax
  5410                                  
  5411                                  ;-510     if (mode) error1("only const number or int as divisor allowed");
  5412                                  
  5413 000029F6 8B46FE                   mov ax, [bp-2]
  5414 000029F9 08C0                     or  al, al
  5415 000029FB 0F840900                 je @@doidiv307
  5416 000029FF 68[9B2A]                 push doidiv_3
  5417 00002A02 E8B022                   call error1
  5418 00002A05 83C402                   add  sp, 2
  5419                                  
  5420                                  ;-511     gettypes(id1);
  5421                                  
  5422                                  @@doidiv307:
  5423 00002A08 FF76FC                   push word [bp-4]
  5424 00002A0B E843DC                   call gettypes
  5425 00002A0E 83C402                   add  sp, 2
  5426                                  
  5427                                  ;-512     if (typei) error1("only int as simple var divisor allowed");
  5428                                  
  5429 00002A11 A1[3900]                 mov ax, [typei]
  5430 00002A14 08C0                     or  al, al
  5431 00002A16 0F840900                 je @@doidiv308
  5432 00002A1A 68[C72A]                 push doidiv_4
  5433 00002A1D E89522                   call error1
  5434 00002A20 83C402                   add  sp, 2
  5435                                  
  5436                                  ;-513     if (wi!=2) error1("only int, no byte as divisor allowed");
  5437                                  
  5438                                  @@doidiv308:
  5439 00002A23 A1[4200]                 mov ax, [wi]
  5440 00002A26 83F802                   cmp ax, 2
  5441 00002A29 0F840900                 je  @@doidiv309
  5442 00002A2D 68[EE2A]                 push doidiv_5
  5443 00002A30 E88222                   call error1
  5444 00002A33 83C402                   add  sp, 2
  5445                                  
  5446                                  ;-514     prs("\n mov bx, "); v(id1);
  5447                                  
  5448                                  @@doidiv309:
  5449 00002A36 68[132B]                 push doidiv_6
  5450 00002A39 E8901F                   call prs
  5451 00002A3C 83C402                   add  sp, 2
  5452 00002A3F FF76FC                   push word [bp-4]
  5453 00002A42 E894D6                   call v
  5454 00002A45 83C402                   add  sp, 2
  5455                                  
  5456                                  ;-515     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5457                                  
  5458 00002A48 8B4604                   mov ax, [bp+4]
  5459 00002A4B 08C0                     or  al, al
  5460 00002A4D 0F840C00                 je @@doidiv310
  5461 00002A51 68[1F2B]                 push doidiv_7
  5462 00002A54 E8751F                   call prs
  5463 00002A57 83C402                   add  sp, 2
  5464 00002A5A E90900                   jmp @@doidiv311
  5465                                  @@doidiv310:
  5466 00002A5D 68[302B]                 push doidiv_8
  5467 00002A60 E8691F                   call prs
  5468 00002A63 83C402                   add  sp, 2
  5469                                  @@doidiv311:
  5470                                  
  5471                                  ;-516 }
  5472                                  
  5473                                  @@doidiv306:
  5474                                  
  5475                                  ;-517 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5476 00002A66 C9                       LEAVE
  5477 00002A67 C3                       ret
  5478                                  ; ENDP
  5479 00002A68 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5480 00002A71 2C2000             
  5481 00002A74 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5482 00002A7D 6964697620627800   
  5483 00002A85 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5484 00002A8E 2C20305C6E20646976-
  5485 00002A97 20627800           
  5486 00002A9B 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5487 00002AA4 74206E756D62657220-
  5488 00002AAD 6F7220696E74206173-
  5489 00002AB6 2064697669736F7220-
  5490 00002ABF 616C6C6F77656400   
  5491 00002AC7 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5492 00002AD0 61732073696D706C65-
  5493 00002AD9 207661722064697669-
  5494 00002AE2 736F7220616C6C6F77-
  5495 00002AEB 656400             
  5496 00002AEE 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5497 00002AF7 206E6F206279746520-
  5498 00002B00 61732064697669736F-
  5499 00002B09 7220616C6C6F776564-
  5500 00002B12 00                 
  5501 00002B13 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5502 00002B1C 2C2000             
  5503 00002B1F 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5504 00002B28 6964697620627800   
  5505 00002B30 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5506 00002B39 2C20305C6E20646976-
  5507 00002B42 20627800           
  5508                                  
  5509                                  domod:  ; *** PROC ***
  5510                                  ;Function : domod, Number of local variables: 1
  5511                                  ;   # type sign width addr used name   list of local variables
  5512                                  ;  200 var sign word   517 NULL ids = bp+4;
  5513 00002B46 C8000000                 ENTER  0,0
  5514 00002B4A FF7604                   push word [bp+4]
  5515 00002B4D E853FE                   call doidiv
  5516 00002B50 83C402                   add  sp, 2
  5517 00002B53 68[5E2B]                 push domod_0
  5518 00002B56 E8731E                   call prs
  5519 00002B59 83C402                   add  sp, 2
  5520                                  
  5521                                  ;-518 
  5522                                  
  5523                                  
  5524                                  ;-519 int docalltype[10]; int docallvalue[10];
  5525 00002B5C C9                       LEAVE
  5526 00002B5D C3                       ret
  5527                                  ; ENDP
  5528 00002B5E 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5529 00002B67 2C20647800         
  5530                                  section .bss
  5531                                  absolute 53411
  5532 0000D0A3 <res 00000014>          docalltype resw 10
  5533                                  section .text
  5534                                  section .bss
  5535                                  absolute 53431
  5536 0000D0B7 <res 00000014>          docallvalue resw 10
  5537                                  section .text
  5538                                  
  5539                                  ;-520 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5540                                  
  5541                                  section .bss
  5542                                  absolute 53451
  5543 0000D0CB <res 00000011>          procname resb 17
  5544                                  section .text
  5545                                  
  5546                                  ;-521 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5547                                  
  5548                                  
  5549                                  docall1:  ; *** PROC ***
  5550                                  
  5551                                  ;-522   narg=0;  sz32=0;
  5552                                  
  5553                                  ;Function : docall1, Number of local variables: 5
  5554                                  ;   # type sign width addr used name   list of local variables
  5555                                  ;  200 var sign word   521 NULL i = bp-2
  5556                                  ;  201 var sign word   521 NULL narg = bp-4
  5557                                  ;  202 var sign word   521 NULL t0 = bp-6
  5558                                  ;  203 var sign word   521 NULL n0 = bp-8
  5559                                  ;  204 var sign word   521 NULL sz32 = bp-10;
  5560 00002B6C C80A0000                 ENTER  10,0
  5561 00002B70 B80000                   mov ax, 0
  5562 00002B73 8946FC                   mov [bp-4], ax
  5563 00002B76 B80000                   mov ax, 0
  5564 00002B79 8946F6                   mov [bp-10], ax
  5565                                  
  5566                                  ;-523   checknamelen();
  5567                                  
  5568 00002B7C E89FD5                   call checknamelen
  5569                                  
  5570                                  ;-524   strcpy(&procname, symbol);
  5571                                  
  5572 00002B7F 8D062B81                 lea  ax, [symbol]
  5573 00002B83 50                       push ax
  5574 00002B84 8D06CBD0                 lea  ax, [procname]
  5575 00002B88 50                       push ax
  5576 00002B89 E8FE2D                   call strcpy
  5577 00002B8C 83C404                   add  sp, 4
  5578                                  
  5579                                  ;-525   storecall();
  5580                                  
  5581 00002B8F E8FDDD                   call storecall
  5582                                  
  5583                                  ;-526   expect('(');
  5584                                  
  5585 00002B92 6A28                     push 40
  5586 00002B94 E8221D                   call expect
  5587 00002B97 83C402                   add  sp, 2
  5588                                  
  5589                                  ;-527 	if (istoken(')') ==0 ) {
  5590                                  
  5591 00002B9A 6A29                     push 41
  5592 00002B9C E8F81C                   call istoken
  5593 00002B9F 83C402                   add  sp, 2
  5594 00002BA2 83F800                   cmp ax, 0
  5595 00002BA5 0F85C002                 jne @@docall1312
  5596                                  
  5597                                  ;-528 	  do { narg++;
  5598                                  
  5599                                  @@docall1313:
  5600 00002BA9 FF46FC                   inc  word[bp-4]
  5601                                  
  5602                                  ;-529 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  5603                                  
  5604 00002BAC 8B46FC                   mov ax, [bp-4]
  5605 00002BAF 83F809                   cmp ax, 9
  5606 00002BB2 0F8E0900                 jle @@docall1314
  5607 00002BB6 68[AD2E]                 push docall1_0
  5608 00002BB9 E8F920                   call error1
  5609 00002BBC 83C402                   add  sp, 2
  5610                                  @@docall1314:
  5611 00002BBF B80000                   mov ax, 0
  5612 00002BC2 8946FA                   mov [bp-6], ax
  5613                                  
  5614                                  ;-530       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  5615                                  
  5616 00002BC5 680101                   push 257
  5617 00002BC8 E8CC1C                   call istoken
  5618 00002BCB 83C402                   add  sp, 2
  5619 00002BCE 08C0                     or  al, al
  5620 00002BD0 0F840C00                 je @@docall1315
  5621 00002BD4 B80100                   mov ax, 1
  5622 00002BD7 8946FA                   mov [bp-6], ax
  5623 00002BDA A1[3700]                 mov ax, [lexval]
  5624 00002BDD 8946F8                   mov [bp-8], ax
  5625                                  
  5626                                  ;-531       if(istoken(T_STRING)){t0=2; n0=nconst;
  5627                                  
  5628                                  @@docall1315:
  5629 00002BE0 680201                   push 258
  5630 00002BE3 E8B11C                   call istoken
  5631 00002BE6 83C402                   add  sp, 2
  5632 00002BE9 08C0                     or  al, al
  5633 00002BEB 0F846300                 je @@docall1316
  5634 00002BEF B80200                   mov ax, 2
  5635 00002BF2 8946FA                   mov [bp-6], ax
  5636 00002BF5 A1[2B00]                 mov ax, [nconst]
  5637 00002BF8 8946F8                   mov [bp-8], ax
  5638                                  
  5639                                  ;-532         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  5640                                  
  5641 00002BFB 68[BF2E]                 push docall1_1
  5642 00002BFE E8361D                   call eprs
  5643 00002C01 83C402                   add  sp, 2
  5644 00002C04 8D06AB81                 lea  ax, [fname]
  5645 00002C08 50                       push ax
  5646 00002C09 E82B1D                   call eprs
  5647 00002C0C 83C402                   add  sp, 2
  5648 00002C0F 6A5F                     push 95
  5649 00002C11 E8101D                   call eprc
  5650 00002C14 83C402                   add  sp, 2
  5651 00002C17 FF36[2B00]               push word [nconst]
  5652 00002C1B E8421E                   call eprnum
  5653 00002C1E 83C402                   add  sp, 2
  5654 00002C21 68[C22E]                 push docall1_2
  5655 00002C24 E8101D                   call eprs
  5656 00002C27 83C402                   add  sp, 2
  5657                                  
  5658                                  ;-533         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  5659                                  
  5660 00002C2A 6A22                     push 34
  5661 00002C2C E8F51C                   call eprc
  5662 00002C2F 83C402                   add  sp, 2
  5663 00002C32 8D062B81                 lea  ax, [symbol]
  5664 00002C36 50                       push ax
  5665 00002C37 E8FD1C                   call eprs
  5666 00002C3A 83C402                   add  sp, 2
  5667 00002C3D 6A22                     push 34
  5668 00002C3F E8E21C                   call eprc
  5669 00002C42 83C402                   add  sp, 2
  5670 00002C45 68[C72E]                 push docall1_3
  5671 00002C48 E8EC1C                   call eprs
  5672 00002C4B 83C402                   add  sp, 2
  5673 00002C4E FF06[2B00]               inc  word[nconst]
  5674                                  
  5675                                  ;-534       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  5676                                  
  5677                                  @@docall1316:
  5678 00002C52 6A26                     push 38
  5679 00002C54 E8401C                   call istoken
  5680 00002C57 83C402                   add  sp, 2
  5681 00002C5A 08C0                     or  al, al
  5682 00002C5C 0F840F00                 je @@docall1317
  5683 00002C60 B80300                   mov ax, 3
  5684 00002C63 8946FA                   mov [bp-6], ax
  5685 00002C66 E8FEDC                   call name1
  5686 00002C69 E823DB                   call searchname
  5687 00002C6C 8946F8                   mov [bp-8], ax
  5688                                  
  5689                                  ;-535       if(istoken(T_NAME))  { n0=checkreg();
  5690                                  
  5691                                  @@docall1317:
  5692 00002C6F 680001                   push 256
  5693 00002C72 E8221C                   call istoken
  5694 00002C75 83C402                   add  sp, 2
  5695 00002C78 08C0                     or  al, al
  5696 00002C7A 0F844800                 je @@docall1318
  5697 00002C7E E852EA                   call checkreg
  5698 00002C81 8946F8                   mov [bp-8], ax
  5699                                  
  5700                                  ;-536         if (n0) t0=5;
  5701                                  
  5702 00002C84 8B46F8                   mov ax, [bp-8]
  5703 00002C87 08C0                     or  al, al
  5704 00002C89 0F840900                 je @@docall1319
  5705 00002C8D B80500                   mov ax, 5
  5706 00002C90 8946FA                   mov [bp-6], ax
  5707                                  
  5708                                  ;-537         else {t0=4; n0=searchname();
  5709                                  
  5710 00002C93 E93000                   jmp @@docall1320
  5711                                  @@docall1319:
  5712 00002C96 B80400                   mov ax, 4
  5713 00002C99 8946FA                   mov [bp-6], ax
  5714 00002C9C E8F0DA                   call searchname
  5715 00002C9F 8946F8                   mov [bp-8], ax
  5716                                  
  5717                                  ;-538           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  5718                                  
  5719 00002CA2 B8B782                   mov ax, GType
  5720 00002CA5 A3[7500]                 mov word [p1], ax
  5721 00002CA8 A1[7500]                 mov ax, [p1]
  5722 00002CAB 0346F8                   add ax, [bp-8]
  5723 00002CAE A3[7500]                 mov word [p1], ax
  5724 00002CB1 8B1E[7500]               mov bx, [p1]
  5725 00002CB5 8A07                     mov al, [bx]
  5726 00002CB7 B400                     mov ah, 0
  5727 00002CB9 83F826                   cmp ax, 38
  5728 00002CBC 0F850600                 jne @@docall1321
  5729 00002CC0 B80300                   mov ax, 3
  5730 00002CC3 8946FA                   mov [bp-6], ax
  5731                                  @@docall1321:
  5732                                  @@docall1320:
  5733                                  
  5734                                  ;-539       if (t0==0) error1("parameter not recognized (no * allowed)");
  5735                                  
  5736                                  @@docall1318:
  5737 00002CC6 8B46FA                   mov ax, [bp-6]
  5738 00002CC9 83F800                   cmp ax, 0
  5739 00002CCC 0F850900                 jne @@docall1322
  5740 00002CD0 68[CA2E]                 push docall1_4
  5741 00002CD3 E8DF1F                   call error1
  5742 00002CD6 83C402                   add  sp, 2
  5743                                  
  5744                                  ;-540       docalltype [narg] = t0;
  5745                                  
  5746                                  @@docall1322:
  5747 00002CD9 8B46FA                   mov ax, [bp-6]
  5748 00002CDC 8B5EFC                   mov bx, [bp-4]
  5749 00002CDF D1E3                     shl bx, 1
  5750 00002CE1 8987A3D0                 mov [docalltype+bx], ax
  5751                                  
  5752                                  ;-541       docallvalue[narg] = n0;
  5753                                  
  5754 00002CE5 8B46F8                   mov ax, [bp-8]
  5755 00002CE8 8B5EFC                   mov bx, [bp-4]
  5756 00002CEB D1E3                     shl bx, 1
  5757 00002CED 8987B7D0                 mov [docallvalue+bx], ax
  5758                                  
  5759                                  ;-542     } while (istoken(','));
  5760                                  
  5761 00002CF1 6A2C                     push 44
  5762 00002CF3 E8A11B                   call istoken
  5763 00002CF6 83C402                   add  sp, 2
  5764 00002CF9 08C0                     or  al, al
  5765 00002CFB 0F840300                 je @@docall1323
  5766 00002CFF E9A7FE                   jmp @@docall1313
  5767                                  @@docall1323:
  5768                                  
  5769                                  ;-543     
  5770                                  
  5771                                  
  5772                                  ;-544   	expect(')');  i=narg;
  5773                                  
  5774 00002D02 6A29                     push 41
  5775 00002D04 E8B21B                   call expect
  5776 00002D07 83C402                   add  sp, 2
  5777 00002D0A 8B46FC                   mov ax, [bp-4]
  5778 00002D0D 8946FE                   mov [bp-2], ax
  5779                                  
  5780                                  ;-545     do {
  5781                                  
  5782                                  @@docall1324:
  5783                                  
  5784                                  ;-546       t0 = docalltype [i];
  5785                                  
  5786 00002D10 8B5EFE                   mov bx, [bp-2]
  5787 00002D13 D1E3                     shl bx, 1
  5788 00002D15 8B87A3D0                 mov ax, [docalltype + bx]
  5789 00002D19 8946FA                   mov [bp-6], ax
  5790                                  
  5791                                  ;-547       n0 = docallvalue[i];     
  5792                                  
  5793 00002D1C 8B5EFE                   mov bx, [bp-2]
  5794 00002D1F D1E3                     shl bx, 1
  5795 00002D21 8B87B7D0                 mov ax, [docallvalue + bx]
  5796 00002D25 8946F8                   mov [bp-8], ax
  5797                                  
  5798                                  ;-548       if(t0==1){ prs("\n push "); pint1(n0);}
  5799                                  
  5800 00002D28 8B46FA                   mov ax, [bp-6]
  5801 00002D2B 83F801                   cmp ax, 1
  5802 00002D2E 0F851200                 jne @@docall1325
  5803 00002D32 68[F22E]                 push docall1_5
  5804 00002D35 E8941C                   call prs
  5805 00002D38 83C402                   add  sp, 2
  5806 00002D3B FF76F8                   push word [bp-8]
  5807 00002D3E E8821D                   call pint1
  5808 00002D41 83C402                   add  sp, 2
  5809                                  
  5810                                  ;-549       if(t0==2){ prs("\n push "); if(NASM==0) prs("offset ");
  5811                                  
  5812                                  @@docall1325:
  5813 00002D44 8B46FA                   mov ax, [bp-6]
  5814 00002D47 83F802                   cmp ax, 2
  5815 00002D4A 0F853700                 jne @@docall1326
  5816 00002D4E 68[FB2E]                 push docall1_6
  5817 00002D51 E8781C                   call prs
  5818 00002D54 83C402                   add  sp, 2
  5819 00002D57 A0[1400]                 mov al, [NASM]
  5820 00002D5A 3C00                     cmp al, 0
  5821 00002D5C 0F850900                 jne @@docall1327
  5822 00002D60 68[042F]                 push docall1_7
  5823 00002D63 E8661C                   call prs
  5824 00002D66 83C402                   add  sp, 2
  5825                                  
  5826                                  ;-550         prs(fname);prc(95);pint1(n0);}
  5827                                  
  5828                                  @@docall1327:
  5829 00002D69 8D06AB81                 lea  ax, [fname]
  5830 00002D6D 50                       push ax
  5831 00002D6E E85B1C                   call prs
  5832 00002D71 83C402                   add  sp, 2
  5833 00002D74 6A5F                     push 95
  5834 00002D76 E8EC1B                   call prc
  5835 00002D79 83C402                   add  sp, 2
  5836 00002D7C FF76F8                   push word [bp-8]
  5837 00002D7F E8411D                   call pint1
  5838 00002D82 83C402                   add  sp, 2
  5839                                  
  5840                                  ;-551       if(t0==3){ prs("\n lea  ax, "); if(NASM==0)prs("word ptr ");  v(n0);
  5841                                  
  5842                                  @@docall1326:
  5843 00002D85 8B46FA                   mov ax, [bp-6]
  5844 00002D88 83F803                   cmp ax, 3
  5845 00002D8B 0F852D00                 jne @@docall1328
  5846 00002D8F 68[0C2F]                 push docall1_8
  5847 00002D92 E8371C                   call prs
  5848 00002D95 83C402                   add  sp, 2
  5849 00002D98 A0[1400]                 mov al, [NASM]
  5850 00002D9B 3C00                     cmp al, 0
  5851 00002D9D 0F850900                 jne @@docall1329
  5852 00002DA1 68[192F]                 push docall1_9
  5853 00002DA4 E8251C                   call prs
  5854 00002DA7 83C402                   add  sp, 2
  5855                                  @@docall1329:
  5856 00002DAA FF76F8                   push word [bp-8]
  5857 00002DAD E829D3                   call v
  5858 00002DB0 83C402                   add  sp, 2
  5859                                  
  5860                                  ;-552         prs("\n push ax");}
  5861                                  
  5862 00002DB3 68[232F]                 push docall1_10
  5863 00002DB6 E8131C                   call prs
  5864 00002DB9 83C402                   add  sp, 2
  5865                                  
  5866                                  ;-553       if(t0==4){ gettypes(n0); 
  5867                                  
  5868                                  @@docall1328:
  5869 00002DBC 8B46FA                   mov ax, [bp-6]
  5870 00002DBF 83F804                   cmp ax, 4
  5871 00002DC2 0F856700                 jne @@docall1330
  5872 00002DC6 FF76F8                   push word [bp-8]
  5873 00002DC9 E885D8                   call gettypes
  5874 00002DCC 83C402                   add  sp, 2
  5875                                  
  5876                                  ;-554         if(wi==2) { prs("\n push word ");if(NASM==0)prs("ptr "); v(n0);}
  5877                                  
  5878 00002DCF A1[4200]                 mov ax, [wi]
  5879 00002DD2 83F802                   cmp ax, 2
  5880 00002DD5 0F852700                 jne @@docall1331
  5881 00002DD9 68[2E2F]                 push docall1_11
  5882 00002DDC E8ED1B                   call prs
  5883 00002DDF 83C402                   add  sp, 2
  5884 00002DE2 A0[1400]                 mov al, [NASM]
  5885 00002DE5 3C00                     cmp al, 0
  5886 00002DE7 0F850900                 jne @@docall1332
  5887 00002DEB 68[3C2F]                 push docall1_12
  5888 00002DEE E8DB1B                   call prs
  5889 00002DF1 83C402                   add  sp, 2
  5890                                  @@docall1332:
  5891 00002DF4 FF76F8                   push word [bp-8]
  5892 00002DF7 E8DFD2                   call v
  5893 00002DFA 83C402                   add  sp, 2
  5894                                  
  5895                                  ;-555         else { prs("\n mov al, byte ");  if(NASM==0)prs("ptr "); v(n0);
  5896                                  
  5897 00002DFD E92D00                   jmp @@docall1333
  5898                                  @@docall1331:
  5899 00002E00 68[412F]                 push docall1_13
  5900 00002E03 E8C61B                   call prs
  5901 00002E06 83C402                   add  sp, 2
  5902 00002E09 A0[1400]                 mov al, [NASM]
  5903 00002E0C 3C00                     cmp al, 0
  5904 00002E0E 0F850900                 jne @@docall1334
  5905 00002E12 68[522F]                 push docall1_14
  5906 00002E15 E8B41B                   call prs
  5907 00002E18 83C402                   add  sp, 2
  5908                                  @@docall1334:
  5909 00002E1B FF76F8                   push word [bp-8]
  5910 00002E1E E8B8D2                   call v
  5911 00002E21 83C402                   add  sp, 2
  5912                                  
  5913                                  ;-556         prs("\n mov ah, 0\n push ax"); } }
  5914                                  
  5915 00002E24 68[572F]                 push docall1_15
  5916 00002E27 E8A21B                   call prs
  5917 00002E2A 83C402                   add  sp, 2
  5918                                  @@docall1333:
  5919                                  
  5920                                  ;-557       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  5921                                  
  5922                                  @@docall1330:
  5923 00002E2D 8B46FA                   mov ax, [bp-6]
  5924 00002E30 83F805                   cmp ax, 5
  5925 00002E33 0F852200                 jne @@docall1335
  5926 00002E37 68[6E2F]                 push docall1_16
  5927 00002E3A E88F1B                   call prs
  5928 00002E3D 83C402                   add  sp, 2
  5929 00002E40 FF76F8                   push word [bp-8]
  5930 00002E43 E89BEC                   call printreg
  5931 00002E46 83C402                   add  sp, 2
  5932 00002E49 8B46F8                   mov ax, [bp-8]
  5933 00002E4C 83F82F                   cmp ax, 47 ;unsigned : 1
  5934 00002E4F 0F8C0600                 jl  @@docall1336
  5935 00002E53 8B46F6                   mov ax, [bp-10]
  5936 00002E56 83C002                   add ax, 2
  5937                                  @@docall1336:
  5938                                  
  5939                                  ;-558    i--; } while (i > 0);  }
  5940                                  
  5941                                  @@docall1335:
  5942 00002E59 FF4EFE                   dec  word[bp-2]
  5943 00002E5C 8B46FE                   mov ax, [bp-2]
  5944 00002E5F 83F800                   cmp ax, 0
  5945 00002E62 0F8E0300                 jle @@docall1337
  5946 00002E66 E9A7FE                   jmp @@docall1324
  5947                                  @@docall1337:
  5948                                  
  5949                                  ;-559 	 prs("\n call "); prs(&procname);
  5950                                  
  5951                                  @@docall1312:
  5952 00002E69 68[772F]                 push docall1_17
  5953 00002E6C E85D1B                   call prs
  5954 00002E6F 83C402                   add  sp, 2
  5955 00002E72 8D06CBD0                 lea  ax, [procname]
  5956 00002E76 50                       push ax
  5957 00002E77 E8521B                   call prs
  5958 00002E7A 83C402                   add  sp, 2
  5959                                  
  5960                                  ;-560 	 if (narg>0) {prs("\n add  sp, ");
  5961                                  
  5962 00002E7D 8B46FC                   mov ax, [bp-4]
  5963 00002E80 83F800                   cmp ax, 0
  5964 00002E83 0F8E2400                 jle @@docall1338
  5965 00002E87 68[802F]                 push docall1_18
  5966 00002E8A E83F1B                   call prs
  5967 00002E8D 83C402                   add  sp, 2
  5968                                  
  5969                                  ;-561      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  5970                                  
  5971 00002E90 8B46FC                   mov ax, [bp-4]
  5972 00002E93 0346FC                   add ax, [bp-4]
  5973 00002E96 8946FC                   mov [bp-4], ax
  5974 00002E99 8B46FC                   mov ax, [bp-4]
  5975 00002E9C 0346F6                   add ax, [bp-10]
  5976 00002E9F 8946FC                   mov [bp-4], ax
  5977 00002EA2 FF76FC                   push word [bp-4]
  5978 00002EA5 E81B1C                   call pint1
  5979 00002EA8 83C402                   add  sp, 2
  5980                                  @@docall1338:
  5981                                  
  5982                                  ;-562 /****************************************************************************/
  5983                                  
  5984                                  
  5985                                  ;-563 int main() {
  5986 00002EAB C9                       LEAVE
  5987 00002EAC C3                       ret
  5988                                  ; ENDP
  5989 00002EAD 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  5990 00002EB6 72616D657465727300 
  5991 00002EBF 5C6E00                  docall1_1 db "\n",0
  5992 00002EC2 2064622000              docall1_2 db " db ",0
  5993 00002EC7 2C3000                  docall1_3 db ",0",0
  5994 00002ECA 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  5995 00002ED3 206E6F74207265636F-
  5996 00002EDC 676E697A656420286E-
  5997 00002EE5 6F202A20616C6C6F77-
  5998 00002EEE 65642900           
  5999 00002EF2 5C6E20707573682000      docall1_5 db "\n push ",0
  6000 00002EFB 5C6E20707573682000      docall1_6 db "\n push ",0
  6001 00002F04 6F66667365742000        docall1_7 db "offset ",0
  6002 00002F0C 5C6E206C6561202061-     docall1_8 db "\n lea  ax, ",0
  6003 00002F15 782C2000           
  6004 00002F19 776F72642070747220-     docall1_9 db "word ptr ",0
  6005 00002F22 00                 
  6006 00002F23 5C6E20707573682061-     docall1_10 db "\n push ax",0
  6007 00002F2C 7800               
  6008 00002F2E 5C6E20707573682077-     docall1_11 db "\n push word ",0
  6009 00002F37 6F72642000         
  6010 00002F3C 7074722000              docall1_12 db "ptr ",0
  6011 00002F41 5C6E206D6F7620616C-     docall1_13 db "\n mov al, byte ",0
  6012 00002F4A 2C20627974652000   
  6013 00002F52 7074722000              docall1_14 db "ptr ",0
  6014 00002F57 5C6E206D6F76206168-     docall1_15 db "\n mov ah, 0\n push ax",0
  6015 00002F60 2C20305C6E20707573-
  6016 00002F69 6820617800         
  6017 00002F6E 5C6E20707573682000      docall1_16 db "\n push ",0
  6018 00002F77 5C6E2063616C6C2000      docall1_17 db "\n call ",0
  6019 00002F80 5C6E20616464202073-     docall1_18 db "\n add  sp, ",0
  6020 00002F89 702C2000           
  6021                                  
  6022                                  main:  ; *** PROC ***
  6023                                  
  6024                                  ;-564   getarg();
  6025                                  
  6026 00002F8D E88D00                   call getarg
  6027                                  
  6028                                  ;-565   setblock(4096);
  6029                                  
  6030 00002F90 680010                   push 4096
  6031 00002F93 E82C28                   call setblock
  6032 00002F96 83C402                   add  sp, 2
  6033                                  
  6034                                  ;-566   if (DOS_ERR) error1("SetBlock , AX=");
  6035                                  
  6036 00002F99 A1[7700]                 mov ax, [DOS_ERR]
  6037 00002F9C 08C0                     or  al, al
  6038 00002F9E 0F840900                 je @@main339
  6039 00002FA2 68[E22F]                 push main_0
  6040 00002FA5 E80D1D                   call error1
  6041 00002FA8 83C402                   add  sp, 2
  6042                                  
  6043                                  ;-567   segE=allocmem(4096);
  6044                                  
  6045                                  @@main339:
  6046 00002FAB 680010                   push 4096
  6047 00002FAE E82A28                   call allocmem
  6048 00002FB1 83C402                   add  sp, 2
  6049 00002FB4 A3[6D00]                 mov word [segE], ax
  6050                                  
  6051                                  ;-568   if (DOS_ERR)  error1("alloc memory, AX=");
  6052                                  
  6053 00002FB7 A1[7700]                 mov ax, [DOS_ERR]
  6054 00002FBA 08C0                     or  al, al
  6055 00002FBC 0F840900                 je @@main340
  6056 00002FC0 68[F12F]                 push main_1
  6057 00002FC3 E8EF1C                   call error1
  6058 00002FC6 83C402                   add  sp, 2
  6059                                  
  6060                                  ;-569   CNameTop=0;
  6061                                  
  6062                                  @@main340:
  6063 00002FC9 B80000                   mov ax, 0
  6064 00002FCC A3[6900]                 mov word [CNameTop], ax
  6065                                  
  6066                                  ;-570   getfirstchar();
  6067                                  
  6068 00002FCF E83100                   call getfirstchar
  6069                                  
  6070                                  ;-571   parse();
  6071                                  
  6072 00002FD2 E85F03                   call parse
  6073                                  
  6074                                  ;-572   callrecursive=0; checkcalls(); epilog();
  6075                                  
  6076 00002FD5 B80000                   mov ax, 0
  6077 00002FD8 A3[3100]                 mov word [callrecursive], ax
  6078 00002FDB E8ED03                   call checkcalls
  6079 00002FDE E8AF23                   call epilog
  6080                                  
  6081                                  ;-573 }
  6082                                  
  6083                                  
  6084                                  ;-574 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  6085                                  
  6086 00002FE1 C3                       ret
  6087                                  ; ENDP
  6088 00002FE2 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  6089 00002FEB 2C2041583D00       
  6090 00002FF1 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  6091 00002FFA 6F72792C2041583D00 
  6092                                  
  6093                                  getfirstchar:  ; *** PROC ***
  6094 00003003 B80FD0                   mov ax, fgetsdest
  6095 00003006 A3[6B00]                 mov word [fgetsp], ax
  6096 00003009 B80000                   mov ax, 0
  6097 0000300C 8B1E[6B00]               mov  bx, [fgetsp]
  6098 00003010 8807                     mov  [bx], al
  6099 00003012 E8AA1B                   call fgets1
  6100 00003015 A2[2800]                 mov byte [thechar], al
  6101                                  
  6102                                  ;-575 char *arglen=0x80; char *argv=0x82;
  6103                                  
  6104 00003018 C3                       ret
  6105                                  ; ENDP
  6106 00003019 8000                    arglen dw 128
  6107 0000301B 8200                    argv dw 130
  6108                                  
  6109                                  ;-576 int getarg() { int arglen1; int i; char *c;
  6110                                  
  6111                                  
  6112                                  getarg:  ; *** PROC ***
  6113                                  
  6114                                  ;-577   arglen1=*arglen;
  6115                                  
  6116                                  ;Function : getarg, Number of local variables: 3
  6117                                  ;   # type sign width addr used name   list of local variables
  6118                                  ;  200 var sign word   576 NULL arglen1 = bp-2
  6119                                  ;  201 var sign word   576 NULL i = bp-4
  6120                                  ;  202 ptr sign byte   576 NULL c = bp-6;
  6121 0000301D C8060000                 ENTER  6,0
  6122 00003021 8B1E[1930]               mov bx, [arglen]
  6123 00003025 8A07                     mov al, [bx]
  6124 00003027 B400                     mov ah, 0
  6125 00003029 8946FE                   mov [bp-2], ax
  6126                                  
  6127                                  ;-578   if (arglen1) { i=arglen1+129; *i=0; }
  6128                                  
  6129 0000302C 8B46FE                   mov ax, [bp-2]
  6130 0000302F 08C0                     or  al, al
  6131 00003031 0F841400                 je @@getarg341
  6132 00003035 8B46FE                   mov ax, [bp-2]
  6133 00003038 058100                   add ax, 129
  6134 0000303B 8946FC                   mov [bp-4], ax
  6135 0000303E B80000                   mov ax, 0
  6136 00003041 8B5EFC                   mov  bx, [bp-4]
  6137 00003044 8907                     mov  [bx], ax
  6138                                  
  6139                                  ;-579   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  6140                                  
  6141 00003046 E93900                   jmp @@getarg342
  6142                                  @@getarg341:
  6143 00003049 8D06[0300]               lea  ax, [Version1]
  6144 0000304D 50                       push ax
  6145 0000304E E83228                   call cputs
  6146 00003051 83C402                   add  sp, 2
  6147 00003054 68[3732]                 push getarg_0
  6148 00003057 E82928                   call cputs
  6149 0000305A 83C402                   add  sp, 2
  6150                                  
  6151                                  ;-580     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  6152                                  
  6153 0000305D 6A43                     push 67
  6154 0000305F 6A00                     push 0
  6155 00003061 FF36[1B30]               push word [argv]
  6156 00003065 E8F92A                   call readRL
  6157 00003068 83C406                   add  sp, 6
  6158 0000306B A3[7900]                 mov word [DOS_NoBytes], ax
  6159 0000306E A1[7900]                 mov ax, [DOS_NoBytes]
  6160 00003071 058000                   add ax, 128
  6161 00003074 8946FA                   mov [bp-6], ax
  6162 00003077 B80000                   mov ax, 0
  6163 0000307A 8B5EFA                   mov  bx, [bp-6]
  6164 0000307D 8807                     mov  [bx], al
  6165 0000307F E83C19                   call prnl
  6166                                  
  6167                                  ;-581   strcpy(namein, argv);
  6168                                  
  6169                                  @@getarg342:
  6170 00003082 FF36[1B30]               push word [argv]
  6171 00003086 8D06EE81                 lea  ax, [namein]
  6172 0000308A 50                       push ax
  6173 0000308B E8FC28                   call strcpy
  6174 0000308E 83C404                   add  sp, 4
  6175                                  
  6176                                  ;-582   if (instr2(namein, '.') == 0) strcat1(namein, ".C");
  6177                                  
  6178 00003091 6A2E                     push 46
  6179 00003093 8D06EE81                 lea  ax, [namein]
  6180 00003097 50                       push ax
  6181 00003098 E85129                   call instr2
  6182 0000309B 83C404                   add  sp, 4
  6183 0000309E 83F800                   cmp ax, 0
  6184 000030A1 0F850E00                 jne @@getarg343
  6185 000030A5 68[5332]                 push getarg_1
  6186 000030A8 8D06EE81                 lea  ax, [namein]
  6187 000030AC 50                       push ax
  6188 000030AD E84D2A                   call strcat1
  6189 000030B0 83C404                   add  sp, 4
  6190                                  
  6191                                  ;-583   toupper(namein);
  6192                                  
  6193                                  @@getarg343:
  6194 000030B3 8D06EE81                 lea  ax, [namein]
  6195 000030B7 50                       push ax
  6196 000030B8 E86428                   call toupper
  6197 000030BB 83C402                   add  sp, 2
  6198                                  
  6199                                  ;-584   c=instr2(namein, '/');
  6200                                  
  6201 000030BE 6A2F                     push 47
  6202 000030C0 8D06EE81                 lea  ax, [namein]
  6203 000030C4 50                       push ax
  6204 000030C5 E82429                   call instr2
  6205 000030C8 83C404                   add  sp, 4
  6206 000030CB 8946FA                   mov [bp-6], ax
  6207                                  
  6208                                  ;-585   if (c != 0)  { c++; if (*c == 'N') {NASM=1; c+=2; strcpy(namein, c);  }
  6209                                  
  6210 000030CE 8B46FA                   mov ax, [bp-6]
  6211 000030D1 83F800                   cmp ax, 0
  6212 000030D4 0F843D00                 je  @@getarg344
  6213 000030D8 FF46FA                   inc  word[bp-6]
  6214 000030DB 8B5EFA                   mov bx, [bp-6]
  6215 000030DE 8A07                     mov al, [bx]
  6216 000030E0 B400                     mov ah, 0
  6217 000030E2 83F84E                   cmp ax, 78
  6218 000030E5 0F851B00                 jne @@getarg345
  6219 000030E9 B80100                   mov ax, 1
  6220 000030EC A2[1400]                 mov byte [NASM], al
  6221 000030EF 8346FA02                 add  word[bp-6], 2
  6222 000030F3 FF76FA                   push word [bp-6]
  6223 000030F6 8D06EE81                 lea  ax, [namein]
  6224 000030FA 50                       push ax
  6225 000030FB E88C28                   call strcpy
  6226 000030FE 83C404                   add  sp, 4
  6227                                  
  6228                                  ;-586     else {cputs("Parameter unknown "); exitR(3);  }  }
  6229                                  
  6230 00003101 E91100                   jmp @@getarg346
  6231                                  @@getarg345:
  6232 00003104 68[5632]                 push getarg_2
  6233 00003107 E87927                   call cputs
  6234 0000310A 83C402                   add  sp, 2
  6235 0000310D 6A03                     push 3
  6236 0000310F E8872A                   call exitR
  6237 00003112 83C402                   add  sp, 2
  6238                                  @@getarg346:
  6239                                  
  6240                                  ;-587   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6241                                  
  6242                                  @@getarg344:
  6243 00003115 8D06EE81                 lea  ax, [namein]
  6244 00003119 50                       push ax
  6245 0000311A 8D063182                 lea  ax, [namelst]
  6246 0000311E 50                       push ax
  6247 0000311F E86828                   call strcpy
  6248 00003122 83C404                   add  sp, 4
  6249 00003125 8D063182                 lea  ax, [namelst]
  6250 00003129 50                       push ax
  6251 0000312A E83528                   call strlen
  6252 0000312D 83C402                   add  sp, 2
  6253 00003130 8946FC                   mov [bp-4], ax
  6254 00003133 FF4EFC                   dec  word[bp-4]
  6255 00003136 B83182                   mov ax, namelst
  6256 00003139 0346FC                   add ax, [bp-4]
  6257 0000313C 8946FA                   mov [bp-6], ax
  6258 0000313F B85300                   mov ax, 83
  6259 00003142 8B5EFA                   mov  bx, [bp-6]
  6260 00003145 8807                     mov  [bx], al
  6261                                  
  6262                                  ;-588  
  6263                                  
  6264                                  
  6265                                  ;-589   fdin=openR (namein);
  6266                                  
  6267 00003147 8D06EE81                 lea  ax, [namein]
  6268 0000314B 50                       push ax
  6269 0000314C E8DC29                   call openR
  6270 0000314F 83C402                   add  sp, 2
  6271 00003152 A3[1F00]                 mov word [fdin], ax
  6272                                  
  6273                                  ;-590   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6274                                  
  6275 00003155 A1[7700]                 mov ax, [DOS_ERR]
  6276 00003158 08C0                     or  al, al
  6277 0000315A 0F841C00                 je @@getarg347
  6278 0000315E 68[6932]                 push getarg_3
  6279 00003161 E81F27                   call cputs
  6280 00003164 83C402                   add  sp, 2
  6281 00003167 8D06EE81                 lea  ax, [namein]
  6282 0000316B 50                       push ax
  6283 0000316C E81427                   call cputs
  6284 0000316F 83C402                   add  sp, 2
  6285 00003172 6A01                     push 1
  6286 00003174 E8222A                   call exitR
  6287 00003177 83C402                   add  sp, 2
  6288                                  
  6289                                  ;-591   fdout=creatR(namelst);
  6290                                  
  6291                                  @@getarg347:
  6292 0000317A 8D063182                 lea  ax, [namelst]
  6293 0000317E 50                       push ax
  6294 0000317F E8B829                   call creatR
  6295 00003182 83C402                   add  sp, 2
  6296 00003185 A3[2100]                 mov word [fdout], ax
  6297                                  
  6298                                  ;-592   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6299                                  
  6300 00003188 A1[7700]                 mov ax, [DOS_ERR]
  6301 0000318B 08C0                     or  al, al
  6302 0000318D 0F841C00                 je @@getarg348
  6303 00003191 68[8432]                 push getarg_4
  6304 00003194 E8EC26                   call cputs
  6305 00003197 83C402                   add  sp, 2
  6306 0000319A 8D063182                 lea  ax, [namelst]
  6307 0000319E 50                       push ax
  6308 0000319F E8E126                   call cputs
  6309 000031A2 83C402                   add  sp, 2
  6310 000031A5 6A02                     push 2
  6311 000031A7 E8EF29                   call exitR
  6312 000031AA 83C402                   add  sp, 2
  6313                                  
  6314                                  ;-593   prs("\n; ");prs(Version1);
  6315                                  
  6316                                  @@getarg348:
  6317 000031AD 68[9E32]                 push getarg_5
  6318 000031B0 E81918                   call prs
  6319 000031B3 83C402                   add  sp, 2
  6320 000031B6 8D06[0300]               lea  ax, [Version1]
  6321 000031BA 50                       push ax
  6322 000031BB E80E18                   call prs
  6323 000031BE 83C402                   add  sp, 2
  6324                                  
  6325                                  ;-594   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}
  6326                                  
  6327 000031C1 68[A332]                 push getarg_6
  6328 000031C4 E80518                   call prs
  6329 000031C7 83C402                   add  sp, 2
  6330 000031CA FF76FE                   push word [bp-2]
  6331 000031CD E8F318                   call pint1
  6332 000031D0 83C402                   add  sp, 2
  6333 000031D3 8B46FE                   mov ax, [bp-2]
  6334 000031D6 08C0                     or  al, al
  6335 000031D8 0F841300                 je @@getarg349
  6336 000031DC 68[AE32]                 push getarg_7
  6337 000031DF E8EA17                   call prs
  6338 000031E2 83C402                   add  sp, 2
  6339 000031E5 FF36[1B30]               push word [argv]
  6340 000031E9 E8E017                   call prs
  6341 000031EC 83C402                   add  sp, 2
  6342                                  
  6343                                  ;-595   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6344                                  
  6345                                  @@getarg349:
  6346 000031EF 68[B732]                 push getarg_8
  6347 000031F2 E8D717                   call prs
  6348 000031F5 83C402                   add  sp, 2
  6349 000031F8 8D06EE81                 lea  ax, [namein]
  6350 000031FC 50                       push ax
  6351 000031FD E8CC17                   call prs
  6352 00003200 83C402                   add  sp, 2
  6353 00003203 68[C232]                 push getarg_9
  6354 00003206 E8C317                   call prs
  6355 00003209 83C402                   add  sp, 2
  6356 0000320C 8D063182                 lea  ax, [namelst]
  6357 00003210 50                       push ax
  6358 00003211 E8B817                   call prs
  6359 00003214 83C402                   add  sp, 2
  6360                                  
  6361                                  ;-596   if (NASM) prs("\norg  256 ; NASM ON\njmp main"); else
  6362                                  
  6363 00003217 A0[1400]                 mov al, [NASM]
  6364 0000321A 08C0                     or  al, al
  6365 0000321C 0F840C00                 je @@getarg350
  6366 00003220 68[D132]                 push getarg_10
  6367 00003223 E8A617                   call prs
  6368 00003226 83C402                   add  sp, 2
  6369                                  
  6370                                  ;-597   prs("\n.MODEL TINY,C\n.386P\n.CODE\nJUMPS\nLOCALS\nSTARTUPCODE\njmp main");
  6371                                  
  6372 00003229 E90900                   jmp @@getarg351
  6373                                  @@getarg350:
  6374 0000322C 68[F032]                 push getarg_11
  6375 0000322F E89A17                   call prs
  6376 00003232 83C402                   add  sp, 2
  6377                                  
  6378                                  ;-598 }
  6379                                  
  6380                                  @@getarg351:
  6381                                  
  6382                                  ;-599 int parse() { token=getlex(); do {
  6383 00003235 C9                       LEAVE
  6384 00003236 C3                       ret
  6385                                  ; ENDP
  6386 00003237 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6387 00003240 2E434F4D20696E5F66-
  6388 00003249 696C655B2E435D3A20-
  6389 00003252 00                 
  6390 00003253 2E4300                  getarg_1 db ".C",0
  6391 00003256 506172616D65746572-     getarg_2 db "Parameter unknown ",0
  6392 0000325F 20756E6B6E6F776E20-
  6393 00003268 00                 
  6394 00003269 536F75726365206669-     getarg_3 db "Source file missing (.C): ",0
  6395 00003272 6C65206D697373696E-
  6396 0000327B 6720282E43293A2000 
  6397 00003284 6C6973742066696C65-     getarg_4 db "list file not creatable: ",0
  6398 0000328D 206E6F742063726561-
  6399 00003296 7461626C653A2000   
  6400 0000329E 5C6E3B2000              getarg_5 db "\n; ",0
  6401 000032A3 2C204172676C656E3A-     getarg_6 db ", Arglen: ",0
  6402 000032AC 2000               
  6403 000032AE 2C20417267763A2000      getarg_7 db ", Argv: ",0
  6404 000032B7 2C20536F757263653A-     getarg_8 db ", Source: ",0
  6405 000032C0 2000               
  6406 000032C2 2C204F757470757420-     getarg_9 db ", Output asm: ",0
  6407 000032CB 61736D3A2000       
  6408 000032D1 5C6E6F726720203235-     getarg_10 db "\norg  256 ; NASM ON\njmp main",0
  6409 000032DA 36203B204E41534D20-
  6410 000032E3 4F4E5C6E6A6D70206D-
  6411 000032EC 61696E00           
  6412 000032F0 5C6E2E4D4F44454C20-     getarg_11 db "\n.MODEL TINY,C\n.386P\n.CODE\nJUMPS\nLOCALS\nSTARTUPCODE\njmp main",0
  6413 000032F9 54494E592C435C6E2E-
  6414 00003302 333836505C6E2E434F-
  6415 0000330B 44455C6E4A554D5053-
  6416 00003314 5C6E4C4F43414C535C-
  6417 0000331D 6E5354415254555043-
  6418 00003326 4F44455C6E6A6D7020-
  6419 0000332F 6D61696E00         
  6420                                  
  6421                                  parse:  ; *** PROC ***
  6422 00003334 E8990D                   call getlex
  6423 00003337 A3[2300]                 mov word [token], ax
  6424                                  @@parse352:
  6425                                  
  6426                                  ;-600     if (token <= 0) return 1;
  6427                                  
  6428 0000333A A1[2300]                 mov ax, [token]
  6429 0000333D 83F800                   cmp ax, 0
  6430 00003340 0F8F0600                 jg  @@parse353
  6431 00003344 B80100                   mov ax, 1
  6432 00003347 E96500                   jmp @@retn
  6433                                  
  6434                                  ;-601     if (istoken('#')) {
  6435                                  
  6436                                  @@parse353:
  6437 0000334A 6A23                     push 35
  6438 0000334C E84815                   call istoken
  6439 0000334F 83C402                   add  sp, 2
  6440 00003352 08C0                     or  al, al
  6441 00003354 0F843600                 je @@parse354
  6442                                  
  6443                                  ;-602       if (istoken(T_DEFINE)) dodefine();
  6444                                  
  6445 00003358 68FF01                   push 511
  6446 0000335B E83915                   call istoken
  6447 0000335E 83C402                   add  sp, 2
  6448 00003361 08C0                     or  al, al
  6449 00003363 0F840600                 je @@parse355
  6450 00003367 E83D05                   call dodefine
  6451                                  
  6452                                  ;-603       else if (istoken(T_INCLUDE)) doinclude();
  6453                                  
  6454 0000336A E91E00                   jmp @@parse356
  6455                                  @@parse355:
  6456 0000336D 68FE01                   push 510
  6457 00003370 E82415                   call istoken
  6458 00003373 83C402                   add  sp, 2
  6459 00003376 08C0                     or  al, al
  6460 00003378 0F840600                 je @@parse357
  6461 0000337C E84204                   call doinclude
  6462                                  
  6463                                  ;-604       else error1("define or include expected");  }
  6464                                  
  6465 0000337F E90900                   jmp @@parse358
  6466                                  @@parse357:
  6467 00003382 68[B033]                 push parse_0
  6468 00003385 E82D19                   call error1
  6469 00003388 83C402                   add  sp, 2
  6470                                  @@parse358:
  6471                                  @@parse356:
  6472                                  
  6473                                  ;-605     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6474                                  
  6475 0000338B E91600                   jmp @@parse359
  6476                                  @@parse354:
  6477 0000338E E8CDD4                   call typeName
  6478 00003391 A1[2300]                 mov ax, [token]
  6479 00003394 83F828                   cmp ax, 40
  6480 00003397 0F850600                 jne @@parse360
  6481 0000339B E804D8                   call dofunc
  6482 0000339E E90300                   jmp @@parse361
  6483                                  @@parse360:
  6484 000033A1 E8C6CD                   call doglob
  6485                                  @@parse361:
  6486                                  
  6487                                  ;-606   } while(1);
  6488                                  
  6489                                  @@parse359:
  6490 000033A4 B80100                   mov ax, 1
  6491 000033A7 08C0                     or  al, al
  6492 000033A9 0F840200                 je @@parse362
  6493 000033AD EB8B                     jmp @@parse352
  6494                                  @@parse362:
  6495                                  
  6496                                  ;-607 }
  6497                                  
  6498                                  
  6499                                  ;-608 int checkcalls() { int i; int j; int k;
  6500                                  
  6501                                  @@retn:
  6502 000033AF C3                       ret
  6503                                  ; ENDP
  6504 000033B0 646566696E65206F72-     parse_0 db "define or include expected",0
  6505 000033B9 20696E636C75646520-
  6506 000033C2 657870656374656400 
  6507                                  
  6508                                  checkcalls:  ; *** PROC ***
  6509                                  
  6510                                  ;-609   prs("\n \n; missing functions: ");
  6511                                  
  6512                                  ;Function : checkcalls, Number of local variables: 3
  6513                                  ;   # type sign width addr used name   list of local variables
  6514                                  ;  200 var sign word   608 NULL i = bp-2
  6515                                  ;  201 var sign word   608 NULL j = bp-4
  6516                                  ;  202 var sign word   608 NULL k = bp-6;
  6517 000033CB C8060000                 ENTER  6,0
  6518 000033CF 68[A834]                 push checkcalls_0
  6519 000033D2 E8F715                   call prs
  6520 000033D5 83C402                   add  sp, 2
  6521                                  
  6522                                  ;-610   i=0;  k=0;
  6523                                  
  6524 000033D8 B80000                   mov ax, 0
  6525 000033DB 8946FE                   mov [bp-2], ax
  6526 000033DE B80000                   mov ax, 0
  6527 000033E1 8946FA                   mov [bp-6], ax
  6528                                  
  6529                                  ;-611   while (i < CTop) {
  6530                                  
  6531                                  @@checkcalls363:
  6532 000033E4 8B46FE                   mov ax, [bp-2]
  6533 000033E7 3B06[4600]               cmp ax, [CTop]
  6534 000033EB 0F8D8F00                 jge @@checkcalls364
  6535                                  
  6536                                  ;-612     pt=CAdr[i];
  6537                                  
  6538 000033EF 8B5EFE                   mov bx, [bp-2]
  6539 000033F2 D1E3                     shl bx, 1
  6540 000033F4 8B8757AB                 mov ax, [CAdr + bx]
  6541 000033F8 A3[7300]                 mov word [pt], ax
  6542                                  
  6543                                  ;-613     from_far(NameA, pt);
  6544                                  
  6545 000033FB FF36[7300]               push word [pt]
  6546 000033FF 8D06[4800]               lea  ax, [NameA]
  6547 00003403 50                       push ax
  6548 00003404 E83B24                   call from_far
  6549 00003407 83C404                   add  sp, 4
  6550                                  
  6551                                  ;-614     j=0;
  6552                                  
  6553 0000340A B80000                   mov ax, 0
  6554 0000340D 8946FC                   mov [bp-4], ax
  6555                                  
  6556                                  ;-615     do { p1=adrF(FNameField, j);
  6557                                  
  6558                                  @@checkcalls365:
  6559 00003410 FF76FC                   push word [bp-4]
  6560 00003413 8D064FBD                 lea  ax, [FNameField]
  6561 00003417 50                       push ax
  6562 00003418 E801D3                   call adrF
  6563 0000341B 83C404                   add  sp, 4
  6564 0000341E A3[7500]                 mov word [p1], ax
  6565                                  
  6566                                  ;-616       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6567                                  
  6568 00003421 FF36[7500]               push word [p1]
  6569 00003425 8D06[4800]               lea  ax, [NameA]
  6570 00003429 50                       push ax
  6571 0000342A E88426                   call eqstr
  6572 0000342D 83C404                   add  sp, 4
  6573 00003430 08C0                     or  al, al
  6574 00003432 0F841000                 je @@checkcalls366
  6575 00003436 B80100                   mov ax, 1
  6576 00003439 8B5EFE                   mov bx, [bp-2]
  6577 0000343C 88872FA1                 mov [CType+bx], al
  6578 00003440 A1[4400]                 mov ax, [FTop]
  6579 00003443 8946FC                   mov [bp-4], ax
  6580                                  
  6581                                  ;-617       j++; } while (j < FTop);
  6582                                  
  6583                                  @@checkcalls366:
  6584 00003446 FF46FC                   inc  word[bp-4]
  6585 00003449 8B46FC                   mov ax, [bp-4]
  6586 0000344C 3B06[4400]               cmp ax, [FTop]
  6587 00003450 0F8D0200                 jge @@checkcalls367
  6588 00003454 EBBA                     jmp @@checkcalls365
  6589                                  @@checkcalls367:
  6590                                  
  6591                                  ;-618     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6592                                  
  6593 00003456 8B46FC                   mov ax, [bp-4]
  6594 00003459 3B06[4400]               cmp ax, [FTop]
  6595 0000345D 0F851700                 jne @@checkcalls368
  6596 00003461 FF46FA                   inc  word[bp-6]
  6597 00003464 68[C334]                 push checkcalls_1
  6598 00003467 E86215                   call prs
  6599 0000346A 83C402                   add  sp, 2
  6600 0000346D 8D06[4800]               lea  ax, [NameA]
  6601 00003471 50                       push ax
  6602 00003472 E85715                   call prs
  6603 00003475 83C402                   add  sp, 2
  6604                                  
  6605                                  ;-619     i++; }
  6606                                  
  6607                                  @@checkcalls368:
  6608 00003478 FF46FE                   inc  word[bp-2]
  6609                                  
  6610                                  ;-620   if (k!=0) doar(k); else {prs(" All FUNCTIONs in place");
  6611                                  
  6612 0000347B E966FF                   jmp @@checkcalls363
  6613                                  @@checkcalls364:
  6614 0000347E 8B46FA                   mov ax, [bp-6]
  6615 00003481 83F800                   cmp ax, 0
  6616 00003484 0F840C00                 je  @@checkcalls369
  6617 00003488 FF76FA                   push word [bp-6]
  6618 0000348B E86400                   call doar
  6619 0000348E 83C402                   add  sp, 2
  6620 00003491 E91200                   jmp @@checkcalls370
  6621                                  @@checkcalls369:
  6622 00003494 68[C834]                 push checkcalls_2
  6623 00003497 E83215                   call prs
  6624 0000349A 83C402                   add  sp, 2
  6625                                  
  6626                                  ;-621     cputs("  All CALLs OK! "); }
  6627                                  
  6628 0000349D 68[E034]                 push checkcalls_3
  6629 000034A0 E8E023                   call cputs
  6630 000034A3 83C402                   add  sp, 2
  6631                                  
  6632                                  ;-622 }
  6633                                  
  6634                                  @@checkcalls370:
  6635                                  
  6636                                  ;-623 char wasfunction;
  6637 000034A6 C9                       LEAVE
  6638 000034A7 C3                       ret
  6639                                  ; ENDP
  6640 000034A8 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6641 000034B1 7373696E672066756E-
  6642 000034BA 6374696F6E733A2000 
  6643 000034C3 5C6E3B2000              checkcalls_1 db "\n; ",0
  6644 000034C8 20416C6C2046554E43-     checkcalls_2 db " All FUNCTIONs in place",0
  6645 000034D1 54494F4E7320696E20-
  6646 000034DA 706C61636500       
  6647 000034E0 2020416C6C2043414C-     checkcalls_3 db "  All CALLs OK! ",0
  6648 000034E9 4C73204F4B212000   
  6649 000034F1 00                      wasfunction db 0
  6650                                  
  6651                                  ;-624 int doar(int k) { int i; int fdtemp; int fdout1; int used; int found;
  6652                                  
  6653                                  
  6654                                  doar:  ; *** PROC ***
  6655                                  
  6656                                  ;-625   cputs("  Open CALLs :"); pint(k);
  6657                                  
  6658                                  ;Function : doar, Number of local variables: 6
  6659                                  ;   # type sign width addr used name   list of local variables
  6660                                  ;  200 var sign word   624 NULL k = bp+4
  6661                                  ;  201 var sign word   624 NULL i = bp-2
  6662                                  ;  202 var sign word   624 NULL fdtemp = bp-4
  6663                                  ;  203 var sign word   624 NULL fdout1 = bp-6
  6664                                  ;  204 var sign word   624 NULL used = bp-8
  6665                                  ;  205 var sign word   624 NULL found = bp-10;
  6666 000034F2 C80A0000                 ENTER  10,0
  6667 000034F6 68[7C36]                 push doar_0
  6668 000034F9 E88723                   call cputs
  6669 000034FC 83C402                   add  sp, 2
  6670 000034FF FF7604                   push word [bp+4]
  6671 00003502 E8B723                   call pint
  6672 00003505 83C402                   add  sp, 2
  6673                                  
  6674                                  ;-626   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6675                                  
  6676 00003508 68[8B36]                 push doar_1
  6677 0000350B E8BE14                   call prs
  6678 0000350E 83C402                   add  sp, 2
  6679 00003511 FF7604                   push word [bp+4]
  6680 00003514 E85116                   call printint51
  6681 00003517 83C402                   add  sp, 2
  6682                                  
  6683                                  ;-627   fdin=openR (archivename);
  6684                                  
  6685 0000351A 8D067482                 lea  ax, [archivename]
  6686 0000351E 50                       push ax
  6687 0000351F E80926                   call openR
  6688 00003522 83C402                   add  sp, 2
  6689 00003525 A3[1F00]                 mov word [fdin], ax
  6690                                  
  6691                                  ;-628   if(DOS_ERR){cputs("Archive file missing: "); cputs(archivename); exitR(3); }
  6692                                  
  6693 00003528 A1[7700]                 mov ax, [DOS_ERR]
  6694 0000352B 08C0                     or  al, al
  6695 0000352D 0F841C00                 je @@doar371
  6696 00003531 68[AC36]                 push doar_2
  6697 00003534 E84C23                   call cputs
  6698 00003537 83C402                   add  sp, 2
  6699 0000353A 8D067482                 lea  ax, [archivename]
  6700 0000353E 50                       push ax
  6701 0000353F E84123                   call cputs
  6702 00003542 83C402                   add  sp, 2
  6703 00003545 6A03                     push 3
  6704 00003547 E84F26                   call exitR
  6705 0000354A 83C402                   add  sp, 2
  6706                                  
  6707                                  ;-629   prs("\n;use archive file: "); prs(archivename);
  6708                                  
  6709                                  @@doar371:
  6710 0000354D 68[C336]                 push doar_3
  6711 00003550 E87914                   call prs
  6712 00003553 83C402                   add  sp, 2
  6713 00003556 8D067482                 lea  ax, [archivename]
  6714 0000355A 50                       push ax
  6715 0000355B E86E14                   call prs
  6716 0000355E 83C402                   add  sp, 2
  6717                                  
  6718                                  ;-630   fdtemp=fdout;
  6719                                  
  6720 00003561 A1[2100]                 mov ax, [fdout]
  6721 00003564 8946FC                   mov [bp-4], ax
  6722                                  
  6723                                  ;-631   wasfunction=0;
  6724                                  
  6725 00003567 B80000                   mov ax, 0
  6726 0000356A A2[F134]                 mov byte [wasfunction], al
  6727                                  
  6728                                  ;-632   getfirstchar();
  6729                                  
  6730 0000356D E893FA                   call getfirstchar
  6731                                  
  6732                                  ;-633   do { fdout=0;do {found=getfunctionhead();}while (found==0); fdout=fdtemp;
  6733                                  
  6734                                  @@doar372:
  6735 00003570 B80000                   mov ax, 0
  6736 00003573 A3[2100]                 mov word [fdout], ax
  6737                                  @@doar373:
  6738 00003576 E8E401                   call getfunctionhead
  6739 00003579 8946F6                   mov [bp-10], ax
  6740 0000357C 8B46F6                   mov ax, [bp-10]
  6741 0000357F 83F800                   cmp ax, 0
  6742 00003582 0F850200                 jne @@doar374
  6743 00003586 EBEE                     jmp @@doar373
  6744                                  @@doar374:
  6745 00003588 8B46FC                   mov ax, [bp-4]
  6746 0000358B A3[2100]                 mov word [fdout], ax
  6747                                  
  6748                                  ;-634        if (found > 0) {
  6749                                  
  6750 0000358E 8B46F6                   mov ax, [bp-10]
  6751 00003591 83F800                   cmp ax, 0
  6752 00003594 0F8E9F00                 jle @@doar375
  6753                                  
  6754                                  ;-635          used=0; i=0;
  6755                                  
  6756 00003598 B80000                   mov ax, 0
  6757 0000359B 8946F8                   mov [bp-8], ax
  6758 0000359E B80000                   mov ax, 0
  6759 000035A1 8946FE                   mov [bp-2], ax
  6760                                  
  6761                                  ;-636          while (i < CTop) {
  6762                                  
  6763                                  @@doar376:
  6764 000035A4 8B46FE                   mov ax, [bp-2]
  6765 000035A7 3B06[4600]               cmp ax, [CTop]
  6766 000035AB 0F8D5000                 jge @@doar377
  6767                                  
  6768                                  ;-637            pt=CAdr[i];
  6769                                  
  6770 000035AF 8B5EFE                   mov bx, [bp-2]
  6771 000035B2 D1E3                     shl bx, 1
  6772 000035B4 8B8757AB                 mov ax, [CAdr + bx]
  6773 000035B8 A3[7300]                 mov word [pt], ax
  6774                                  
  6775                                  ;-638            from_far(NameA, pt);
  6776                                  
  6777 000035BB FF36[7300]               push word [pt]
  6778 000035BF 8D06[4800]               lea  ax, [NameA]
  6779 000035C3 50                       push ax
  6780 000035C4 E87B22                   call from_far
  6781 000035C7 83C404                   add  sp, 4
  6782                                  
  6783                                  ;-639            if (eqstr(symbol, NameA)) {
  6784                                  
  6785 000035CA 8D06[4800]               lea  ax, [NameA]
  6786 000035CE 50                       push ax
  6787 000035CF 8D062B81                 lea  ax, [symbol]
  6788 000035D3 50                       push ax
  6789 000035D4 E8DA24                   call eqstr
  6790 000035D7 83C404                   add  sp, 4
  6791 000035DA 08C0                     or  al, al
  6792 000035DC 0F841A00                 je @@doar378
  6793                                  
  6794                                  ;-640              if (CType[i] == 0) {CType[i]=1; used++; } }  i++; }
  6795                                  
  6796 000035E0 8B5EFE                   mov bx, [bp-2]
  6797 000035E3 8A872FA1                 mov al, [CType + bx]
  6798 000035E7 3C00                     cmp al, 0
  6799 000035E9 0F850D00                 jne @@doar379
  6800 000035ED B80100                   mov ax, 1
  6801 000035F0 8B5EFE                   mov bx, [bp-2]
  6802 000035F3 88872FA1                 mov [CType+bx], al
  6803 000035F7 FF46F8                   inc  word[bp-8]
  6804                                  @@doar379:
  6805                                  @@doar378:
  6806 000035FA FF46FE                   inc  word[bp-2]
  6807                                  
  6808                                  ;-641            if (used) {
  6809                                  
  6810 000035FD EBA5                     jmp @@doar376
  6811                                  @@doar377:
  6812 000035FF 8B46F8                   mov ax, [bp-8]
  6813 00003602 08C0                     or  al, al
  6814 00003604 0F842F00                 je @@doar380
  6815                                  
  6816                                  ;-642               prs("\n;Number of CALLs:"); printint51(used);
  6817                                  
  6818 00003608 68[D936]                 push doar_4
  6819 0000360B E8BE13                   call prs
  6820 0000360E 83C402                   add  sp, 2
  6821 00003611 FF76F8                   push word [bp-8]
  6822 00003614 E85115                   call printint51
  6823 00003617 83C402                   add  sp, 2
  6824                                  
  6825                                  ;-643               prs(" : "); prs(symbol); dofunc(); wasfunction=1; }
  6826                                  
  6827 0000361A 68[ED36]                 push doar_5
  6828 0000361D E8AC13                   call prs
  6829 00003620 83C402                   add  sp, 2
  6830 00003623 8D062B81                 lea  ax, [symbol]
  6831 00003627 50                       push ax
  6832 00003628 E8A113                   call prs
  6833 0000362B 83C402                   add  sp, 2
  6834 0000362E E871D5                   call dofunc
  6835 00003631 B80100                   mov ax, 1
  6836 00003634 A2[F134]                 mov byte [wasfunction], al
  6837                                  
  6838                                  ;-644         }
  6839                                  
  6840                                  @@doar380:
  6841                                  
  6842                                  ;-645      } while (token);
  6843                                  
  6844                                  @@doar375:
  6845 00003637 A1[2300]                 mov ax, [token]
  6846 0000363A 08C0                     or  al, al
  6847 0000363C 0F840300                 je @@doar381
  6848 00003640 E92DFF                   jmp @@doar372
  6849                                  @@doar381:
  6850                                  
  6851                                  ;-646   prs("\n;End of archive file. ");
  6852                                  
  6853 00003643 68[F136]                 push doar_6
  6854 00003646 E88313                   call prs
  6855 00003649 83C402                   add  sp, 2
  6856                                  
  6857                                  ;-647   callrecursive++; if (callrecursive < 5) checkcalls();
  6858                                  
  6859 0000364C FF06[3100]               inc  word[callrecursive]
  6860 00003650 A1[3100]                 mov ax, [callrecursive]
  6861 00003653 83F805                   cmp ax, 5
  6862 00003656 0F8D0600                 jge @@doar382
  6863 0000365A E86EFD                   call checkcalls
  6864                                  
  6865                                  ;-648     else {putch(10); cputs("***ERROR*** function(s) missing! ");
  6866                                  
  6867 0000365D E91A00                   jmp @@doar383
  6868                                  @@doar382:
  6869 00003660 6A0A                     push 10
  6870 00003662 E80522                   call putch
  6871 00003665 83C402                   add  sp, 2
  6872 00003668 68[0A37]                 push doar_7
  6873 0000366B E81522                   call cputs
  6874 0000366E 83C402                   add  sp, 2
  6875                                  
  6876                                  ;-649     error1("At least 1 function is missing in archive file! "); }
  6877                                  
  6878 00003671 68[2C37]                 push doar_8
  6879 00003674 E83E16                   call error1
  6880 00003677 83C402                   add  sp, 2
  6881                                  
  6882                                  ;-650 }
  6883                                  
  6884                                  @@doar383:
  6885                                  
  6886                                  ;-651 int getfunctionhead() {
  6887 0000367A C9                       LEAVE
  6888 0000367B C3                       ret
  6889                                  ; ENDP
  6890 0000367C 20204F70656E204341-     doar_0 db "  Open CALLs :",0
  6891 00003685 4C4C73203A00       
  6892 0000368B 5C6E3B204E756D6265-     doar_1 db "\n; Number of unresolved CALLs :",0
  6893 00003694 72206F6620756E7265-
  6894 0000369D 736F6C766564204341-
  6895 000036A6 4C4C73203A00       
  6896 000036AC 417263686976652066-     doar_2 db "Archive file missing: ",0
  6897 000036B5 696C65206D69737369-
  6898 000036BE 6E673A2000         
  6899 000036C3 5C6E3B757365206172-     doar_3 db "\n;use archive file: ",0
  6900 000036CC 63686976652066696C-
  6901 000036D5 653A2000           
  6902 000036D9 5C6E3B4E756D626572-     doar_4 db "\n;Number of CALLs:",0
  6903 000036E2 206F662043414C4C73-
  6904 000036EB 3A00               
  6905 000036ED 203A2000                doar_5 db " : ",0
  6906 000036F1 5C6E3B456E64206F66-     doar_6 db "\n;End of archive file. ",0
  6907 000036FA 206172636869766520-
  6908 00003703 66696C652E2000     
  6909 0000370A 2A2A2A4552524F522A-     doar_7 db "***ERROR*** function(s) missing! ",0
  6910 00003713 2A2A2066756E637469-
  6911 0000371C 6F6E287329206D6973-
  6912 00003725 73696E67212000     
  6913 0000372C 4174206C6561737420-     doar_8 db "At least 1 function is missing in archive file! ",0
  6914 00003735 312066756E6374696F-
  6915 0000373E 6E206973206D697373-
  6916 00003747 696E6720696E206172-
  6917 00003750 63686976652066696C-
  6918 00003759 65212000           
  6919                                  
  6920                                  getfunctionhead:  ; *** PROC ***
  6921                                  
  6922                                  ;-652   if (wasfunction) wasfunction=0; else token=getlex();
  6923                                  
  6924 0000375D A0[F134]                 mov al, [wasfunction]
  6925 00003760 08C0                     or  al, al
  6926 00003762 0F840900                 je @@getfunctionhead384
  6927 00003766 B80000                   mov ax, 0
  6928 00003769 A2[F134]                 mov byte [wasfunction], al
  6929 0000376C E90600                   jmp @@getfunctionhead385
  6930                                  @@getfunctionhead384:
  6931 0000376F E85E09                   call getlex
  6932 00003772 A3[2300]                 mov word [token], ax
  6933                                  
  6934                                  ;-653   if (token == 0) return 0xFFFF;
  6935                                  
  6936                                  @@getfunctionhead385:
  6937 00003775 A1[2300]                 mov ax, [token]
  6938 00003778 83F800                   cmp ax, 0
  6939 0000377B 0F850600                 jne @@getfunctionhead386
  6940 0000377F B8FFFF                   mov ax, 65535
  6941 00003782 E93B00                   jmp @@retn
  6942                                  
  6943                                  ;-654   if(istoken(T_INT))  { if (token != T_NAME) return 0;
  6944                                  
  6945                                  @@getfunctionhead386:
  6946 00003785 680502                   push 517
  6947 00003788 E80C11                   call istoken
  6948 0000378B 83C402                   add  sp, 2
  6949 0000378E 08C0                     or  al, al
  6950 00003790 0F842600                 je @@getfunctionhead387
  6951 00003794 A1[2300]                 mov ax, [token]
  6952 00003797 3D0001                   cmp ax, 256
  6953 0000379A 0F840600                 je  @@getfunctionhead388
  6954 0000379E B80000                   mov ax, 0
  6955 000037A1 E91C00                   jmp @@retn
  6956                                  
  6957                                  ;-655   token=getlex(); if (token == '(') return 1; }
  6958                                  
  6959                                  @@getfunctionhead388:
  6960 000037A4 E82909                   call getlex
  6961 000037A7 A3[2300]                 mov word [token], ax
  6962 000037AA A1[2300]                 mov ax, [token]
  6963 000037AD 83F828                   cmp ax, 40
  6964 000037B0 0F850600                 jne @@getfunctionhead389
  6965 000037B4 B80100                   mov ax, 1
  6966 000037B7 E90600                   jmp @@retn
  6967                                  @@getfunctionhead389:
  6968                                  
  6969                                  ;-656   return 0;
  6970                                  
  6971                                  @@getfunctionhead387:
  6972 000037BA B80000                   mov ax, 0
  6973 000037BD E90000                   jmp @@retn
  6974                                  
  6975                                  ;-657 }
  6976                                  
  6977                                  
  6978                                  ;-658 int doinclude() { int fdtemp;
  6979                                  
  6980                                  @@retn:
  6981 000037C0 C3                       ret
  6982                                  ; ENDP
  6983                                  
  6984                                  doinclude:  ; *** PROC ***
  6985                                  
  6986                                  ;-659   if (token==T_STRING) {  fdtemp=fdin;
  6987                                  
  6988                                  ;Function : doinclude, Number of local variables: 1
  6989                                  ;   # type sign width addr used name   list of local variables
  6990                                  ;  200 var sign word   658 NULL fdtemp = bp-2;
  6991 000037C1 C8020000                 ENTER  2,0
  6992 000037C5 A1[2300]                 mov ax, [token]
  6993 000037C8 3D0201                   cmp ax, 258
  6994 000037CB 0F858700                 jne @@doinclude390
  6995 000037CF A1[1F00]                 mov ax, [fdin]
  6996 000037D2 8946FE                   mov [bp-2], ax
  6997                                  
  6998                                  ;-660   prs("\n;Use include file: "); prs(symbol);
  6999                                  
  7000 000037D5 68[5838]                 push doinclude_0
  7001 000037D8 E8F111                   call prs
  7002 000037DB 83C402                   add  sp, 2
  7003 000037DE 8D062B81                 lea  ax, [symbol]
  7004 000037E2 50                       push ax
  7005 000037E3 E8E611                   call prs
  7006 000037E6 83C402                   add  sp, 2
  7007                                  
  7008                                  ;-661   fdin=openR(symbol);
  7009                                  
  7010 000037E9 8D062B81                 lea  ax, [symbol]
  7011 000037ED 50                       push ax
  7012 000037EE E83A23                   call openR
  7013 000037F1 83C402                   add  sp, 2
  7014 000037F4 A3[1F00]                 mov word [fdin], ax
  7015                                  
  7016                                  ;-662   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  7017                                  
  7018 000037F7 A1[7700]                 mov ax, [DOS_ERR]
  7019 000037FA 83F800                   cmp ax, 0
  7020 000037FD 0F841D00                 je  @@doinclude391
  7021 00003801 68[6E38]                 push doinclude_1
  7022 00003804 E8C511                   call prs
  7023 00003807 83C402                   add  sp, 2
  7024 0000380A 8D062B81                 lea  ax, [symbol]
  7025 0000380E 50                       push ax
  7026 0000380F E8BA11                   call prs
  7027 00003812 83C402                   add  sp, 2
  7028                                  
  7029                                  ;-663     error1(" Stop!!"); }
  7030                                  
  7031 00003815 68[8538]                 push doinclude_2
  7032 00003818 E89A14                   call error1
  7033 0000381B 83C402                   add  sp, 2
  7034                                  
  7035                                  ;-664   linenoinclude=lineno; lineno=1;
  7036                                  
  7037                                  @@doinclude391:
  7038 0000381E A1[6F00]                 mov ax, [lineno]
  7039 00003821 A3[7100]                 mov word [linenoinclude], ax
  7040 00003824 B80100                   mov ax, 1
  7041 00003827 A3[6F00]                 mov word [lineno], ax
  7042                                  
  7043                                  ;-665   parse(); lineno=linenoinclude;
  7044                                  
  7045 0000382A E807FB                   call parse
  7046 0000382D A1[7100]                 mov ax, [linenoinclude]
  7047 00003830 A3[6F00]                 mov word [lineno], ax
  7048                                  
  7049                                  ;-666   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  7050                                  
  7051 00003833 8B46FE                   mov ax, [bp-2]
  7052 00003836 A3[1F00]                 mov word [fdin], ax
  7053 00003839 68[8D38]                 push doinclude_3
  7054 0000383C E88D11                   call prs
  7055 0000383F 83C402                   add  sp, 2
  7056 00003842 8D06EE81                 lea  ax, [namein]
  7057 00003846 50                       push ax
  7058 00003847 E88211                   call prs
  7059 0000384A 83C402                   add  sp, 2
  7060                                  
  7061                                  ;-667   getfirstchar(); token=getlex(); }
  7062                                  
  7063 0000384D E8B3F7                   call getfirstchar
  7064 00003850 E87D08                   call getlex
  7065 00003853 A3[2300]                 mov word [token], ax
  7066                                  
  7067                                  ;-668 }
  7068                                  
  7069                                  @@doinclude390:
  7070                                  
  7071                                  ;-669 int dodefine() { int i; int j; int fdtemp;
  7072 00003856 C9                       LEAVE
  7073 00003857 C3                       ret
  7074                                  ; ENDP
  7075 00003858 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  7076 00003861 636C7564652066696C-
  7077 0000386A 653A2000           
  7078 0000386E 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  7079 00003877 696C65206D69737369-
  7080 00003880 6E673A2000         
  7081 00003885 2053746F70212100        doinclude_2 db " Stop!!",0
  7082 0000388D 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  7083 00003896 6F206D61696E207072-
  7084 0000389F 6F6772616D3A2000   
  7085                                  
  7086                                  dodefine:  ; *** PROC ***
  7087                                  
  7088                                  ;-670   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  7089                                  
  7090                                  ;Function : dodefine, Number of local variables: 3
  7091                                  ;   # type sign width addr used name   list of local variables
  7092                                  ;  200 var sign word   669 NULL i = bp-2
  7093                                  ;  201 var sign word   669 NULL j = bp-4
  7094                                  ;  202 var sign word   669 NULL fdtemp = bp-6;
  7095 000038A7 C8060000                 ENTER  6,0
  7096 000038AB 68[EE39]                 push dodefine_0
  7097 000038AE 8D062B81                 lea  ax, [symbol]
  7098 000038B2 50                       push ax
  7099 000038B3 E8FB21                   call eqstr
  7100 000038B6 83C404                   add  sp, 4
  7101 000038B9 08C0                     or  al, al
  7102 000038BB 0F841500                 je @@dodefine392
  7103 000038BF E80E08                   call getlex
  7104 000038C2 A3[2300]                 mov word [token], ax
  7105                                  
  7106                                  ;-671     ORGDATAORIG=lexval; orgData=lexval; return; }
  7107                                  
  7108 000038C5 A1[3700]                 mov ax, [lexval]
  7109 000038C8 A3[1500]                 mov word [ORGDATAORIG], ax
  7110 000038CB A1[3700]                 mov ax, [lexval]
  7111 000038CE A3[1700]                 mov word [orgData], ax
  7112 000038D1 E91801                   jmp @@retn
  7113                                  
  7114                                  ;-672   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  7115                                  
  7116                                  @@dodefine392:
  7117 000038D4 68[F639]                 push dodefine_1
  7118 000038D7 8D062B81                 lea  ax, [symbol]
  7119 000038DB 50                       push ax
  7120 000038DC E8D221                   call eqstr
  7121 000038DF 83C404                   add  sp, 4
  7122 000038E2 08C0                     or  al, al
  7123 000038E4 0F844900                 je @@dodefine393
  7124 000038E8 E8E507                   call getlex
  7125 000038EB A3[2300]                 mov word [token], ax
  7126 000038EE A1[2300]                 mov ax, [token]
  7127 000038F1 3D0201                   cmp ax, 258
  7128 000038F4 0F852700                 jne @@dodefine394
  7129                                  
  7130                                  ;-673     prs("\n;Use archive file: ");
  7131                                  
  7132 000038F8 68[FE39]                 push dodefine_2
  7133 000038FB E8CE10                   call prs
  7134 000038FE 83C402                   add  sp, 2
  7135                                  
  7136                                  ;-674     strcpy(archivename, symbol); prs(archivename);
  7137                                  
  7138 00003901 8D062B81                 lea  ax, [symbol]
  7139 00003905 50                       push ax
  7140 00003906 8D067482                 lea  ax, [archivename]
  7141 0000390A 50                       push ax
  7142 0000390B E87C20                   call strcpy
  7143 0000390E 83C404                   add  sp, 4
  7144 00003911 8D067482                 lea  ax, [archivename]
  7145 00003915 50                       push ax
  7146 00003916 E8B310                   call prs
  7147 00003919 83C402                   add  sp, 2
  7148                                  
  7149                                  ;-675     } else error1("Name of archive file missing"); token=getlex(); return;}
  7150                                  
  7151 0000391C E90900                   jmp @@dodefine395
  7152                                  @@dodefine394:
  7153 0000391F 68[143A]                 push dodefine_3
  7154 00003922 E89013                   call error1
  7155 00003925 83C402                   add  sp, 2
  7156                                  @@dodefine395:
  7157 00003928 E8A507                   call getlex
  7158 0000392B A3[2300]                 mov word [token], ax
  7159 0000392E E9BB00                   jmp @@retn
  7160                                  
  7161                                  ;-676    expect(T_NAME);
  7162                                  
  7163                                  @@dodefine393:
  7164 00003931 680001                   push 256
  7165 00003934 E8820F                   call expect
  7166 00003937 83C402                   add  sp, 2
  7167                                  
  7168                                  ;-677   if (token==T_CONST) { 
  7169                                  
  7170 0000393A A1[2300]                 mov ax, [token]
  7171 0000393D 3D0101                   cmp ax, 257
  7172 00003940 0F85A800                 jne @@dodefine396
  7173                                  
  7174                                  ;-678     if (GTop >= LSTART) error1("global table (define) full");
  7175                                  
  7176 00003944 A1[3300]                 mov ax, [GTop]
  7177 00003947 3DC800                   cmp ax, 200 ;unsigned : 1
  7178 0000394A 0F8C0900                 jl  @@dodefine397
  7179 0000394E 68[313A]                 push dodefine_4
  7180 00003951 E86113                   call error1
  7181 00003954 83C402                   add  sp, 2
  7182                                  
  7183                                  ;-679     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  7184                                  
  7185                                  @@dodefine397:
  7186 00003957 8D062B81                 lea  ax, [symbol]
  7187 0000395B 50                       push ax
  7188 0000395C E80320                   call strlen
  7189 0000395F 83C402                   add  sp, 2
  7190 00003962 8946FE                   mov [bp-2], ax
  7191 00003965 8B46FE                   mov ax, [bp-2]
  7192 00003968 83F80F                   cmp ax, 15
  7193 0000396B 0F8E0900                 jle @@dodefine398
  7194 0000396F 68[4C3A]                 push dodefine_5
  7195 00003972 E84013                   call error1
  7196 00003975 83C402                   add  sp, 2
  7197                                  
  7198                                  ;-680     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  7199                                  
  7200                                  @@dodefine398:
  7201 00003978 B85500                   mov ax, 85
  7202 0000397B 8B1E[3300]               mov bx, [GTop]
  7203 0000397F 8887E383                 mov [GSign+bx], al
  7204 00003983 B80100                   mov ax, 1
  7205 00003986 8B1E[3300]               mov bx, [GTop]
  7206 0000398A 88870F85                 mov [GWidth+bx], al
  7207 0000398E B82300                   mov ax, 35
  7208 00003991 8B1E[3300]               mov bx, [GTop]
  7209 00003995 8887B782                 mov [GType+bx], al
  7210                                  
  7211                                  ;-681     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  7212                                  
  7213 00003999 A1[6F00]                 mov ax, [lineno]
  7214 0000399C 83E801                   sub ax, 1
  7215 0000399F 8B1E[3300]               mov bx, [GTop]
  7216 000039A3 D1E3                     shl bx, 1
  7217 000039A5 89873B86                 mov [GAdr+bx], ax
  7218 000039A9 B80000                   mov ax, 0
  7219 000039AC 8B1E[3300]               mov bx, [GTop]
  7220 000039B0 D1E3                     shl bx, 1
  7221 000039B2 89879388                 mov [GUsed+bx], ax
  7222                                  
  7223                                  ;-682     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  7224                                  
  7225 000039B6 FF36[3300]               push word [GTop]
  7226 000039BA E84BCD                   call adrofname
  7227 000039BD 83C402                   add  sp, 2
  7228 000039C0 A3[7300]                 mov word [pt], ax
  7229 000039C3 8D062B81                 lea  ax, [symbol]
  7230 000039C7 50                       push ax
  7231 000039C8 FF36[7300]               push word [pt]
  7232 000039CC E8BB1F                   call strcpy
  7233 000039CF 83C404                   add  sp, 4
  7234 000039D2 A1[3700]                 mov ax, [lexval]
  7235 000039D5 8B1E[3300]               mov bx, [GTop]
  7236 000039D9 D1E3                     shl bx, 1
  7237 000039DB 8987EB8A                 mov [GData+bx], ax
  7238                                  
  7239                                  ;-683     expect(T_CONST); GTop++;  } 
  7240                                  
  7241 000039DF 680101                   push 257
  7242 000039E2 E8D40E                   call expect
  7243 000039E5 83C402                   add  sp, 2
  7244 000039E8 FF06[3300]               inc  word[GTop]
  7245                                  
  7246                                  ;-684 }
  7247                                  
  7248                                  @@dodefine396:
  7249                                  
  7250                                  ;-685 int stmt() { int c; char cha;
  7251                                  
  7252 000039EC C9                      @@retn: LEAVE
  7253 000039ED C3                       ret
  7254                                  ; ENDP
  7255 000039EE 4F52474441544100        dodefine_0 db "ORGDATA",0
  7256 000039F6 4152434849564500        dodefine_1 db "ARCHIVE",0
  7257 000039FE 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  7258 00003A07 63686976652066696C-
  7259 00003A10 653A2000           
  7260 00003A14 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7261 00003A1D 726368697665206669-
  7262 00003A26 6C65206D697373696E-
  7263 00003A2F 6700               
  7264 00003A31 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7265 00003A3A 626C65202864656669-
  7266 00003A43 6E65292066756C6C00 
  7267 00003A4C 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7268 00003A55 6D65206C6F6E676572-
  7269 00003A5E 203135206368617200 
  7270                                  
  7271                                  stmt:  ; *** PROC ***
  7272                                  
  7273                                  ;-686        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7274                                  
  7275                                  ;Function : stmt, Number of local variables: 2
  7276                                  ;   # type sign width addr used name   list of local variables
  7277                                  ;  200 var sign word   685 NULL c = bp-2
  7278                                  ;  201 var sign byte   685 NULL cha = bp-4;
  7279 00003A67 C8040000                 ENTER  4,0
  7280 00003A6B 6A7B                     push 123
  7281 00003A6D E8270E                   call istoken
  7282 00003A70 83C402                   add  sp, 2
  7283 00003A73 08C0                     or  al, al
  7284 00003A75 0F841700                 je @@stmt399
  7285                                  @@stmt400:
  7286 00003A79 6A7D                     push 125
  7287 00003A7B E8190E                   call istoken
  7288 00003A7E 83C402                   add  sp, 2
  7289 00003A81 83F800                   cmp ax, 0
  7290 00003A84 0F850500                 jne @@stmt401
  7291 00003A88 E8DCFF                   call stmt
  7292 00003A8B EBEC                     jmp @@stmt400
  7293                                  @@stmt401:
  7294                                  
  7295                                  ;-687   else if(istoken(T_IF))    doif();
  7296                                  
  7297 00003A8D E90502                   jmp @@stmt402
  7298                                  @@stmt399:
  7299 00003A90 680102                   push 513
  7300 00003A93 E8010E                   call istoken
  7301 00003A96 83C402                   add  sp, 2
  7302 00003A99 08C0                     or  al, al
  7303 00003A9B 0F840600                 je @@stmt403
  7304 00003A9F E84204                   call doif
  7305                                  
  7306                                  ;-688   else if(istoken(T_DO))    dodo();
  7307                                  
  7308 00003AA2 E9F001                   jmp @@stmt404
  7309                                  @@stmt403:
  7310 00003AA5 680402                   push 516
  7311 00003AA8 E8EC0D                   call istoken
  7312 00003AAB 83C402                   add  sp, 2
  7313 00003AAE 08C0                     or  al, al
  7314 00003AB0 0F840600                 je @@stmt405
  7315 00003AB4 E82105                   call dodo
  7316                                  
  7317                                  ;-689   else if(istoken(T_WHILE)) dowhile();
  7318                                  
  7319 00003AB7 E9DB01                   jmp @@stmt406
  7320                                  @@stmt405:
  7321 00003ABA 680302                   push 515
  7322 00003ABD E8D70D                   call istoken
  7323 00003AC0 83C402                   add  sp, 2
  7324 00003AC3 08C0                     or  al, al
  7325 00003AC5 0F840600                 je @@stmt407
  7326 00003AC9 E85905                   call dowhile
  7327                                  
  7328                                  ;-690   else if(istoken(T_GOTO))  {prs("\n jmp @@");name1();prs(symbol);expect(';');}
  7329                                  
  7330 00003ACC E9C601                   jmp @@stmt408
  7331                                  @@stmt407:
  7332 00003ACF 680902                   push 521
  7333 00003AD2 E8C20D                   call istoken
  7334 00003AD5 83C402                   add  sp, 2
  7335 00003AD8 08C0                     or  al, al
  7336 00003ADA 0F842200                 je @@stmt409
  7337 00003ADE 68[973C]                 push stmt_0
  7338 00003AE1 E8E80E                   call prs
  7339 00003AE4 83C402                   add  sp, 2
  7340 00003AE7 E87DCE                   call name1
  7341 00003AEA 8D062B81                 lea  ax, [symbol]
  7342 00003AEE 50                       push ax
  7343 00003AEF E8DA0E                   call prs
  7344 00003AF2 83C402                   add  sp, 2
  7345 00003AF5 6A3B                     push 59
  7346 00003AF7 E8BF0D                   call expect
  7347 00003AFA 83C402                   add  sp, 2
  7348                                  
  7349                                  ;-691   else if(token==T_ASM)     {prs("\n"); c=next();
  7350                                  
  7351 00003AFD E99501                   jmp @@stmt410
  7352                                  @@stmt409:
  7353 00003B00 A1[2300]                 mov ax, [token]
  7354 00003B03 3D0602                   cmp ax, 518
  7355 00003B06 0F853300                 jne @@stmt411
  7356 00003B0A 68[A13C]                 push stmt_1
  7357 00003B0D E8BC0E                   call prs
  7358 00003B10 83C402                   add  sp, 2
  7359 00003B13 E8630D                   call next
  7360 00003B16 8946FE                   mov [bp-2], ax
  7361                                  
  7362                                  ;-692     while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7363                                  
  7364                                  @@stmt412:
  7365 00003B19 8B46FE                   mov ax, [bp-2]
  7366 00003B1C 83F80A                   cmp ax, 10
  7367 00003B1F 0F841100                 je  @@stmt413
  7368 00003B23 FF76FE                   push word [bp-2]
  7369 00003B26 E83C0E                   call prc
  7370 00003B29 83C402                   add  sp, 2
  7371 00003B2C E84A0D                   call next
  7372 00003B2F 8946FE                   mov [bp-2], ax
  7373 00003B32 EBE5                     jmp @@stmt412
  7374                                  @@stmt413:
  7375 00003B34 E89905                   call getlex
  7376 00003B37 A3[2300]                 mov word [token], ax
  7377                                  
  7378                                  ;-693   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7379                                  
  7380 00003B3A E95801                   jmp @@stmt414
  7381                                  @@stmt411:
  7382 00003B3D 680702                   push 519
  7383 00003B40 E8540D                   call istoken
  7384 00003B43 83C402                   add  sp, 2
  7385 00003B46 08C0                     or  al, al
  7386 00003B48 0F844B00                 je @@stmt415
  7387 00003B4C A1[2300]                 mov ax, [token]
  7388 00003B4F 83F87B                   cmp ax, 123
  7389 00003B52 0F853500                 jne @@stmt416
  7390 00003B56 68[A43C]                 push stmt_2
  7391 00003B59 E8700E                   call prs
  7392 00003B5C 83C402                   add  sp, 2
  7393 00003B5F E8170D                   call next
  7394 00003B62 8846FC                   mov [bp-4], al
  7395                                  
  7396                                  ;-694     while(cha!= '}') { prc(cha); cha=next(); }
  7397                                  
  7398                                  @@stmt417:
  7399 00003B65 8A46FC                   mov al, [bp-4]
  7400 00003B68 3C7D                     cmp al, 125
  7401 00003B6A 0F841400                 je  @@stmt418
  7402 00003B6E 8A46FC                   mov al, byte [bp-4]
  7403 00003B71 B400                     mov ah, 0
  7404 00003B73 50                       push ax
  7405 00003B74 E8EE0D                   call prc
  7406 00003B77 83C402                   add  sp, 2
  7407 00003B7A E8FC0C                   call next
  7408 00003B7D 8846FC                   mov [bp-4], al
  7409                                  
  7410                                  ;-695     token=getlex(); }
  7411                                  
  7412 00003B80 EBE3                     jmp @@stmt417
  7413                                  @@stmt418:
  7414 00003B82 E84B05                   call getlex
  7415 00003B85 A3[2300]                 mov word [token], ax
  7416                                  
  7417                                  ;-696     else error1("Curly open expected"); }
  7418                                  
  7419 00003B88 E90900                   jmp @@stmt419
  7420                                  @@stmt416:
  7421 00003B8B 68[A73C]                 push stmt_3
  7422 00003B8E E82411                   call error1
  7423 00003B91 83C402                   add  sp, 2
  7424                                  @@stmt419:
  7425                                  
  7426                                  ;-697   else if(istoken(T_INTH))  {prs("\n int  "); expect(T_CONST);
  7427                                  
  7428 00003B94 E9FE00                   jmp @@stmt420
  7429                                  @@stmt415:
  7430 00003B97 685802                   push 600
  7431 00003B9A E8FA0C                   call istoken
  7432 00003B9D 83C402                   add  sp, 2
  7433 00003BA0 08C0                     or  al, al
  7434 00003BA2 0F842700                 je @@stmt421
  7435 00003BA6 68[BB3C]                 push stmt_4
  7436 00003BA9 E8200E                   call prs
  7437 00003BAC 83C402                   add  sp, 2
  7438 00003BAF 680101                   push 257
  7439 00003BB2 E8040D                   call expect
  7440 00003BB5 83C402                   add  sp, 2
  7441                                  
  7442                                  ;-698     prunsign1(lexval); expect(';');    }
  7443                                  
  7444 00003BB8 FF36[3700]               push word [lexval]
  7445 00003BBC E8670F                   call prunsign1
  7446 00003BBF 83C402                   add  sp, 2
  7447 00003BC2 6A3B                     push 59
  7448 00003BC4 E8F20C                   call expect
  7449 00003BC7 83C402                   add  sp, 2
  7450                                  
  7451                                  ;-699   else if(istoken(T_IFCARRY))doifcarry();
  7452                                  
  7453 00003BCA E9C800                   jmp @@stmt422
  7454                                  @@stmt421:
  7455 00003BCD 685902                   push 601
  7456 00003BD0 E8C40C                   call istoken
  7457 00003BD3 83C402                   add  sp, 2
  7458 00003BD6 08C0                     or  al, al
  7459 00003BD8 0F840600                 je @@stmt423
  7460 00003BDC E86703                   call doifcarry
  7461                                  
  7462                                  ;-700   else if(istoken(T_IFZERO))doifzero();
  7463                                  
  7464 00003BDF E9B300                   jmp @@stmt424
  7465                                  @@stmt423:
  7466 00003BE2 685A02                   push 602
  7467 00003BE5 E8AF0C                   call istoken
  7468 00003BE8 83C402                   add  sp, 2
  7469 00003BEB 08C0                     or  al, al
  7470 00003BED 0F840600                 je @@stmt425
  7471 00003BF1 E89B03                   call doifzero
  7472                                  
  7473                                  ;-701   else if(istoken(T_EMIT))   doemit();
  7474                                  
  7475 00003BF4 E99E00                   jmp @@stmt426
  7476                                  @@stmt425:
  7477 00003BF7 680802                   push 520
  7478 00003BFA E89A0C                   call istoken
  7479 00003BFD 83C402                   add  sp, 2
  7480 00003C00 08C0                     or  al, al
  7481 00003C02 0F840600                 je @@stmt427
  7482 00003C06 E8CE00                   call doemit
  7483                                  
  7484                                  ;-702   else if(istoken(';'))      { }
  7485                                  
  7486 00003C09 E98900                   jmp @@stmt428
  7487                                  @@stmt427:
  7488 00003C0C 6A3B                     push 59
  7489 00003C0E E8860C                   call istoken
  7490 00003C11 83C402                   add  sp, 2
  7491 00003C14 08C0                     or  al, al
  7492 00003C16 0F840300                 je @@stmt429
  7493                                  
  7494                                  ;-703   else if(istoken(T_RETURN)) {if (token!=';') exprstart();
  7495                                  
  7496 00003C1A E97800                   jmp @@stmt430
  7497                                  @@stmt429:
  7498 00003C1D 680002                   push 512
  7499 00003C20 E8740C                   call istoken
  7500 00003C23 83C402                   add  sp, 2
  7501 00003C26 08C0                     or  al, al
  7502 00003C28 0F842500                 je @@stmt431
  7503 00003C2C A1[2300]                 mov ax, [token]
  7504 00003C2F 83F83B                   cmp ax, 59
  7505 00003C32 0F840300                 je  @@stmt432
  7506 00003C36 E829D4                   call exprstart
  7507                                  
  7508                                  ;-704     prs("\n jmp @@retn"); nreturn++; expect(';');}
  7509                                  
  7510                                  @@stmt432:
  7511 00003C39 68[C43C]                 push stmt_5
  7512 00003C3C E88D0D                   call prs
  7513 00003C3F 83C402                   add  sp, 2
  7514 00003C42 FF06[2D00]               inc  word[nreturn]
  7515 00003C46 6A3B                     push 59
  7516 00003C48 E86E0C                   call expect
  7517 00003C4B 83C402                   add  sp, 2
  7518                                  
  7519                                  ;-705   else if(thechar==':')      {prs("\n@@"); // Label
  7520                                  
  7521 00003C4E E94400                   jmp @@stmt433
  7522                                  @@stmt431:
  7523 00003C51 A0[2800]                 mov al, [thechar]
  7524 00003C54 3C3A                     cmp al, 58
  7525 00003C56 0F853000                 jne @@stmt434
  7526 00003C5A 68[D23C]                 push stmt_6
  7527 00003C5D E86C0D                   call prs
  7528 00003C60 83C402                   add  sp, 2
  7529                                  
  7530                                  ;-706      prs(symbol); prc(':');  expect(T_NAME); expect(':'); }
  7531                                  
  7532 00003C63 8D062B81                 lea  ax, [symbol]
  7533 00003C67 50                       push ax
  7534 00003C68 E8610D                   call prs
  7535 00003C6B 83C402                   add  sp, 2
  7536 00003C6E 6A3A                     push 58
  7537 00003C70 E8F20C                   call prc
  7538 00003C73 83C402                   add  sp, 2
  7539 00003C76 680001                   push 256
  7540 00003C79 E83D0C                   call expect
  7541 00003C7C 83C402                   add  sp, 2
  7542 00003C7F 6A3A                     push 58
  7543 00003C81 E8350C                   call expect
  7544 00003C84 83C402                   add  sp, 2
  7545                                  
  7546                                  ;-707   else                       {exprstart(); expect(';'); } }
  7547                                  
  7548 00003C87 E90B00                   jmp @@stmt435
  7549                                  @@stmt434:
  7550 00003C8A E8D5D3                   call exprstart
  7551 00003C8D 6A3B                     push 59
  7552 00003C8F E8270C                   call expect
  7553 00003C92 83C402                   add  sp, 2
  7554                                  @@stmt435:
  7555                                  @@stmt433:
  7556                                  @@stmt430:
  7557                                  @@stmt428:
  7558                                  @@stmt426:
  7559                                  @@stmt424:
  7560                                  @@stmt422:
  7561                                  @@stmt420:
  7562                                  @@stmt414:
  7563                                  @@stmt410:
  7564                                  @@stmt408:
  7565                                  @@stmt406:
  7566                                  @@stmt404:
  7567                                  @@stmt402:
  7568                                  
  7569                                  ;-708 
  7570                                  
  7571                                  
  7572                                  ;-709 int doemit() {prs("\n db ");
  7573 00003C95 C9                       LEAVE
  7574 00003C96 C3                       ret
  7575                                  ; ENDP
  7576 00003C97 5C6E206A6D70204040-     stmt_0 db "\n jmp @@",0
  7577 00003CA0 00                 
  7578 00003CA1 5C6E00                  stmt_1 db "\n",0
  7579 00003CA4 5C6E00                  stmt_2 db "\n",0
  7580 00003CA7 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7581 00003CB0 6E2065787065637465-
  7582 00003CB9 6400               
  7583 00003CBB 5C6E20696E74202000      stmt_4 db "\n int  ",0
  7584 00003CC4 5C6E206A6D70204040-     stmt_5 db "\n jmp @@retn",0
  7585 00003CCD 7265746E00         
  7586 00003CD2 5C6E404000              stmt_6 db "\n@@",0
  7587                                  
  7588                                  doemit:  ; *** PROC ***
  7589 00003CD7 68[133D]                 push doemit_0
  7590 00003CDA E8EF0C                   call prs
  7591 00003CDD 83C402                   add  sp, 2
  7592                                  
  7593                                  ;-710   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7594                                  
  7595                                  @@L1:
  7596 00003CE0 E8ED03                   call getlex
  7597 00003CE3 A3[2300]                 mov word [token], ax
  7598 00003CE6 FF36[3700]               push word [lexval]
  7599 00003CEA E8390E                   call prunsign1
  7600 00003CED 83C402                   add  sp, 2
  7601 00003CF0 E8DD03                   call getlex
  7602 00003CF3 A3[2300]                 mov word [token], ax
  7603                                  
  7604                                  ;-711     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7605                                  
  7606 00003CF6 A1[2300]                 mov ax, [token]
  7607 00003CF9 83F82C                   cmp ax, 44
  7608 00003CFC 0F850A00                 jne @@doemit436
  7609 00003D00 6A2C                     push 44
  7610 00003D02 E8600C                   call prc
  7611 00003D05 83C402                   add  sp, 2
  7612 00003D08 EBD6                     jmp @@L1
  7613                                  @@doemit436:
  7614 00003D0A 6A29                     push 41
  7615 00003D0C E8AA0B                   call expect
  7616 00003D0F 83C402                   add  sp, 2
  7617                                  
  7618                                  ;-712 
  7619                                  
  7620                                  
  7621                                  ;-713 int cmpneg(int ids) {
  7622                                  
  7623 00003D12 C3                       ret
  7624                                  ; ENDP
  7625 00003D13 5C6E2064622000          doemit_0 db "\n db ",0
  7626                                  
  7627                                  cmpneg:  ; *** PROC ***
  7628                                  
  7629                                  ;-714        if(iscmp==T_EQ) prs("\n jne @@");         //ZF=0
  7630                                  
  7631                                  ;Function : cmpneg, Number of local variables: 1
  7632                                  ;   # type sign width addr used name   list of local variables
  7633                                  ;  200 var sign word   713 NULL ids = bp+4;
  7634 00003D1A C8000000                 ENTER  0,0
  7635 00003D1E A1[2900]                 mov ax, [iscmp]
  7636 00003D21 3D2603                   cmp ax, 806
  7637 00003D24 0F850C00                 jne @@cmpneg437
  7638 00003D28 68[FB3D]                 push cmpneg_0
  7639 00003D2B E89E0C                   call prs
  7640 00003D2E 83C402                   add  sp, 2
  7641                                  
  7642                                  ;-715   else if(iscmp==T_NE) prs("\n je  @@");         //ZF=1
  7643                                  
  7644 00003D31 E9C500                   jmp @@cmpneg438
  7645                                  @@cmpneg437:
  7646 00003D34 A1[2900]                 mov ax, [iscmp]
  7647 00003D37 3D2703                   cmp ax, 807
  7648 00003D3A 0F850C00                 jne @@cmpneg439
  7649 00003D3E 68[053E]                 push cmpneg_1
  7650 00003D41 E8880C                   call prs
  7651 00003D44 83C402                   add  sp, 2
  7652                                  
  7653                                  ;-716   else if(iscmp==T_LE) if (ids) prs("\n jg  @@");//ZF=0      SF =OF
  7654                                  
  7655 00003D47 E9AF00                   jmp @@cmpneg440
  7656                                  @@cmpneg439:
  7657 00003D4A A1[2900]                 mov ax, [iscmp]
  7658 00003D4D 3D3803                   cmp ax, 824
  7659 00003D50 0F852100                 jne @@cmpneg441
  7660 00003D54 8B4604                   mov ax, [bp+4]
  7661 00003D57 08C0                     or  al, al
  7662 00003D59 0F840C00                 je @@cmpneg442
  7663 00003D5D 68[0F3E]                 push cmpneg_2
  7664 00003D60 E8690C                   call prs
  7665 00003D63 83C402                   add  sp, 2
  7666                                  
  7667                                  ;-717                            else prs("\n ja  @@");//ZF=0 CF=0
  7668                                  
  7669 00003D66 E90900                   jmp @@cmpneg443
  7670                                  @@cmpneg442:
  7671 00003D69 68[193E]                 push cmpneg_3
  7672 00003D6C E85D0C                   call prs
  7673 00003D6F 83C402                   add  sp, 2
  7674                                  
  7675                                  ;-718   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7676                                  
  7677                                  @@cmpneg443:
  7678 00003D72 E98400                   jmp @@cmpneg444
  7679                                  @@cmpneg441:
  7680 00003D75 A1[2900]                 mov ax, [iscmp]
  7681 00003D78 3D2B03                   cmp ax, 811
  7682 00003D7B 0F854500                 jne @@cmpneg445
  7683 00003D7F 8B4604                   mov ax, [bp+4]
  7684 00003D82 08C0                     or  al, al
  7685 00003D84 0F841E00                 je @@cmpneg446
  7686 00003D88 68[233E]                 push cmpneg_4
  7687 00003D8B E83E0C                   call prs
  7688 00003D8E 83C402                   add  sp, 2
  7689 00003D91 FF7604                   push word [bp+4]
  7690 00003D94 E88F0D                   call prunsign1
  7691 00003D97 83C402                   add  sp, 2
  7692                                  
  7693                                  ;-719                                prs("\n jl  @@");}//          SF!=OF
  7694                                  
  7695 00003D9A 68[313E]                 push cmpneg_5
  7696 00003D9D E82C0C                   call prs
  7697 00003DA0 83C402                   add  sp, 2
  7698                                  
  7699                                  ;-720                            else{prs(" ;unsigned : "); prunsign1(ids);
  7700                                  
  7701 00003DA3 E91B00                   jmp @@cmpneg447
  7702                                  @@cmpneg446:
  7703 00003DA6 68[3B3E]                 push cmpneg_6
  7704 00003DA9 E8200C                   call prs
  7705 00003DAC 83C402                   add  sp, 2
  7706 00003DAF FF7604                   push word [bp+4]
  7707 00003DB2 E8710D                   call prunsign1
  7708 00003DB5 83C402                   add  sp, 2
  7709                                  
  7710                                  ;-721                                prs("\n jb  @@");}//jb=jc=CF=1
  7711                                  
  7712 00003DB8 68[493E]                 push cmpneg_7
  7713 00003DBB E80E0C                   call prs
  7714 00003DBE 83C402                   add  sp, 2
  7715                                  
  7716                                  ;-722   else if(iscmp=='<' ) prs("\n jge @@");         //          SF =OF
  7717                                  
  7718                                  @@cmpneg447:
  7719 00003DC1 E93500                   jmp @@cmpneg448
  7720                                  @@cmpneg445:
  7721 00003DC4 A1[2900]                 mov ax, [iscmp]
  7722 00003DC7 83F83C                   cmp ax, 60
  7723 00003DCA 0F850C00                 jne @@cmpneg449
  7724 00003DCE 68[533E]                 push cmpneg_8
  7725 00003DD1 E8F80B                   call prs
  7726 00003DD4 83C402                   add  sp, 2
  7727                                  
  7728                                  ;-723   else if(iscmp=='>' ) prs("\n jle @@");         //ZF=1 oder SF!=OF
  7729                                  
  7730 00003DD7 E91F00                   jmp @@cmpneg450
  7731                                  @@cmpneg449:
  7732 00003DDA A1[2900]                 mov ax, [iscmp]
  7733 00003DDD 83F83E                   cmp ax, 62
  7734 00003DE0 0F850C00                 jne @@cmpneg451
  7735 00003DE4 68[5D3E]                 push cmpneg_9
  7736 00003DE7 E8E20B                   call prs
  7737 00003DEA 83C402                   add  sp, 2
  7738                                  
  7739                                  ;-724   else error1("Vergleich unbekannt in CMPNEG()");  }
  7740                                  
  7741 00003DED E90900                   jmp @@cmpneg452
  7742                                  @@cmpneg451:
  7743 00003DF0 68[673E]                 push cmpneg_10
  7744 00003DF3 E8BF0E                   call error1
  7745 00003DF6 83C402                   add  sp, 2
  7746                                  @@cmpneg452:
  7747                                  @@cmpneg450:
  7748                                  @@cmpneg448:
  7749                                  @@cmpneg444:
  7750                                  @@cmpneg440:
  7751                                  @@cmpneg438:
  7752                                  
  7753                                  ;-725 
  7754                                  
  7755                                  
  7756                                  ;-726 int prlabel(int n) {prs("\n@@"); prs(fname); pint1(n); prc(':'); }
  7757 00003DF9 C9                       LEAVE
  7758 00003DFA C3                       ret
  7759                                  ; ENDP
  7760 00003DFB 5C6E206A6E65204040-     cmpneg_0 db "\n jne @@",0
  7761 00003E04 00                 
  7762 00003E05 5C6E206A6520204040-     cmpneg_1 db "\n je  @@",0
  7763 00003E0E 00                 
  7764 00003E0F 5C6E206A6720204040-     cmpneg_2 db "\n jg  @@",0
  7765 00003E18 00                 
  7766 00003E19 5C6E206A6120204040-     cmpneg_3 db "\n ja  @@",0
  7767 00003E22 00                 
  7768 00003E23 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7769 00003E2C 64203A2000         
  7770 00003E31 5C6E206A6C20204040-     cmpneg_5 db "\n jl  @@",0
  7771 00003E3A 00                 
  7772 00003E3B 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7773 00003E44 64203A2000         
  7774 00003E49 5C6E206A6220204040-     cmpneg_7 db "\n jb  @@",0
  7775 00003E52 00                 
  7776 00003E53 5C6E206A6765204040-     cmpneg_8 db "\n jge @@",0
  7777 00003E5C 00                 
  7778 00003E5D 5C6E206A6C65204040-     cmpneg_9 db "\n jle @@",0
  7779 00003E66 00                 
  7780 00003E67 566572676C65696368-     cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0
  7781 00003E70 20756E62656B616E6E-
  7782 00003E79 7420696E20434D504E-
  7783 00003E82 4547282900         
  7784                                  
  7785                                  prlabel:  ; *** PROC ***
  7786                                  ;Function : prlabel, Number of local variables: 1
  7787                                  ;   # type sign width addr used name   list of local variables
  7788                                  ;  200 var sign word   726 NULL n = bp+4;
  7789 00003E87 C8000000                 ENTER  0,0
  7790 00003E8B 68[B23E]                 push prlabel_0
  7791 00003E8E E83B0B                   call prs
  7792 00003E91 83C402                   add  sp, 2
  7793 00003E94 8D06AB81                 lea  ax, [fname]
  7794 00003E98 50                       push ax
  7795 00003E99 E8300B                   call prs
  7796 00003E9C 83C402                   add  sp, 2
  7797 00003E9F FF7604                   push word [bp+4]
  7798 00003EA2 E81E0C                   call pint1
  7799 00003EA5 83C402                   add  sp, 2
  7800 00003EA8 6A3A                     push 58
  7801 00003EAA E8B80A                   call prc
  7802 00003EAD 83C402                   add  sp, 2
  7803                                  
  7804                                  ;-727 int prjump (int n) {prs("\n jmp @@"); prs(fname); pint1(n); }
  7805 00003EB0 C9                       LEAVE
  7806 00003EB1 C3                       ret
  7807                                  ; ENDP
  7808 00003EB2 5C6E404000              prlabel_0 db "\n@@",0
  7809                                  
  7810                                  prjump:  ; *** PROC ***
  7811                                  ;Function : prjump, Number of local variables: 1
  7812                                  ;   # type sign width addr used name   list of local variables
  7813                                  ;  200 var sign word   727 NULL n = bp+4;
  7814 00003EB7 C8000000                 ENTER  0,0
  7815 00003EBB 68[DA3E]                 push prjump_0
  7816 00003EBE E80B0B                   call prs
  7817 00003EC1 83C402                   add  sp, 2
  7818 00003EC4 8D06AB81                 lea  ax, [fname]
  7819 00003EC8 50                       push ax
  7820 00003EC9 E8000B                   call prs
  7821 00003ECC 83C402                   add  sp, 2
  7822 00003ECF FF7604                   push word [bp+4]
  7823 00003ED2 E8EE0B                   call pint1
  7824 00003ED5 83C402                   add  sp, 2
  7825                                  
  7826                                  ;-728 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7827 00003ED8 C9                       LEAVE
  7828 00003ED9 C3                       ret
  7829                                  ; ENDP
  7830 00003EDA 5C6E206A6D70204040-     prjump_0 db "\n jmp @@",0
  7831 00003EE3 00                 
  7832                                  
  7833                                  doif:  ; *** PROC ***
  7834                                  ;Function : doif, Number of local variables: 2
  7835                                  ;   # type sign width addr used name   list of local variables
  7836                                  ;  200 var sign word   728 NULL jdest = bp-2
  7837                                  ;  201 var sign word   728 NULL tst = bp-4;
  7838 00003EE4 C8040000                 ENTER  4,0
  7839 00003EE8 E8D2CF                   call pexpr
  7840 00003EEB FF06[2F00]               inc  word[nlabel]
  7841 00003EEF A1[2F00]                 mov ax, [nlabel]
  7842 00003EF2 8946FE                   mov [bp-2], ax
  7843                                  
  7844                                  ;-729   pint1(jdest); stmt();
  7845                                  
  7846 00003EF5 FF76FE                   push word [bp-2]
  7847 00003EF8 E8C80B                   call pint1
  7848 00003EFB 83C402                   add  sp, 2
  7849 00003EFE E866FB                   call stmt
  7850                                  
  7851                                  ;-730   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7852                                  
  7853 00003F01 680202                   push 514
  7854 00003F04 E89009                   call istoken
  7855 00003F07 83C402                   add  sp, 2
  7856 00003F0A 08C0                     or  al, al
  7857 00003F0C 0F842B00                 je @@doif453
  7858 00003F10 FF06[2F00]               inc  word[nlabel]
  7859 00003F14 A1[2F00]                 mov ax, [nlabel]
  7860 00003F17 8946FC                   mov [bp-4], ax
  7861                                  
  7862                                  ;-731     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7863                                  
  7864 00003F1A FF76FC                   push word [bp-4]
  7865 00003F1D E897FF                   call prjump
  7866 00003F20 83C402                   add  sp, 2
  7867 00003F23 FF76FE                   push word [bp-2]
  7868 00003F26 E85EFF                   call prlabel
  7869 00003F29 83C402                   add  sp, 2
  7870 00003F2C E838FB                   call stmt
  7871 00003F2F FF76FC                   push word [bp-4]
  7872 00003F32 E852FF                   call prlabel
  7873 00003F35 83C402                   add  sp, 2
  7874                                  
  7875                                  ;-732   else prlabel(jdest); }
  7876                                  
  7877 00003F38 E90900                   jmp @@doif454
  7878                                  @@doif453:
  7879 00003F3B FF76FE                   push word [bp-2]
  7880 00003F3E E846FF                   call prlabel
  7881 00003F41 83C402                   add  sp, 2
  7882                                  @@doif454:
  7883                                  
  7884                                  ;-733 int doifcarry() {int jdest;  nlabel++; jdest=nlabel;
  7885 00003F44 C9                       LEAVE
  7886 00003F45 C3                       ret
  7887                                  ; ENDP
  7888                                  
  7889                                  doifcarry:  ; *** PROC ***
  7890                                  ;Function : doifcarry, Number of local variables: 1
  7891                                  ;   # type sign width addr used name   list of local variables
  7892                                  ;  200 var sign word   733 NULL jdest = bp-2;
  7893 00003F46 C8020000                 ENTER  2,0
  7894 00003F4A FF06[2F00]               inc  word[nlabel]
  7895 00003F4E A1[2F00]                 mov ax, [nlabel]
  7896 00003F51 8946FE                   mov [bp-2], ax
  7897                                  
  7898                                  ;-734   prs("\n jae short @@");/*jnc*/ prs(fname);  pint1(jdest);
  7899                                  
  7900 00003F54 68[7F3F]                 push doifcarry_0
  7901 00003F57 E8720A                   call prs
  7902 00003F5A 83C402                   add  sp, 2
  7903 00003F5D 8D06AB81                 lea  ax, [fname]
  7904 00003F61 50                       push ax
  7905 00003F62 E8670A                   call prs
  7906 00003F65 83C402                   add  sp, 2
  7907 00003F68 FF76FE                   push word [bp-2]
  7908 00003F6B E8550B                   call pint1
  7909 00003F6E 83C402                   add  sp, 2
  7910                                  
  7911                                  ;-735   stmt(); prlabel(jdest); }
  7912                                  
  7913 00003F71 E8F3FA                   call stmt
  7914 00003F74 FF76FE                   push word [bp-2]
  7915 00003F77 E80DFF                   call prlabel
  7916 00003F7A 83C402                   add  sp, 2
  7917                                  
  7918                                  ;-736 int doifzero() {int jdest;  nlabel++; jdest=nlabel;
  7919 00003F7D C9                       LEAVE
  7920 00003F7E C3                       ret
  7921                                  ; ENDP
  7922 00003F7F 5C6E206A6165207368-     doifcarry_0 db "\n jae short @@",0
  7923 00003F88 6F727420404000     
  7924                                  
  7925                                  doifzero:  ; *** PROC ***
  7926                                  ;Function : doifzero, Number of local variables: 1
  7927                                  ;   # type sign width addr used name   list of local variables
  7928                                  ;  200 var sign word   736 NULL jdest = bp-2;
  7929 00003F8F C8020000                 ENTER  2,0
  7930 00003F93 FF06[2F00]               inc  word[nlabel]
  7931 00003F97 A1[2F00]                 mov ax, [nlabel]
  7932 00003F9A 8946FE                   mov [bp-2], ax
  7933                                  
  7934                                  ;-737   prs("\n jne short @@");        prs(fname);  pint1(jdest);
  7935                                  
  7936 00003F9D 68[C83F]                 push doifzero_0
  7937 00003FA0 E8290A                   call prs
  7938 00003FA3 83C402                   add  sp, 2
  7939 00003FA6 8D06AB81                 lea  ax, [fname]
  7940 00003FAA 50                       push ax
  7941 00003FAB E81E0A                   call prs
  7942 00003FAE 83C402                   add  sp, 2
  7943 00003FB1 FF76FE                   push word [bp-2]
  7944 00003FB4 E80C0B                   call pint1
  7945 00003FB7 83C402                   add  sp, 2
  7946                                  
  7947                                  ;-738   stmt(); prlabel(jdest); }
  7948                                  
  7949 00003FBA E8AAFA                   call stmt
  7950 00003FBD FF76FE                   push word [bp-2]
  7951 00003FC0 E8C4FE                   call prlabel
  7952 00003FC3 83C402                   add  sp, 2
  7953                                  
  7954                                  ;-739 int dodo() {int jdest; int jtemp;
  7955 00003FC6 C9                       LEAVE
  7956 00003FC7 C3                       ret
  7957                                  ; ENDP
  7958 00003FC8 5C6E206A6E65207368-     doifzero_0 db "\n jne short @@",0
  7959 00003FD1 6F727420404000     
  7960                                  
  7961                                  dodo:  ; *** PROC ***
  7962                                  
  7963                                  ;-740   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7964                                  
  7965                                  ;Function : dodo, Number of local variables: 2
  7966                                  ;   # type sign width addr used name   list of local variables
  7967                                  ;  200 var sign word   739 NULL jdest = bp-2
  7968                                  ;  201 var sign word   739 NULL jtemp = bp-4;
  7969 00003FD8 C8040000                 ENTER  4,0
  7970 00003FDC FF06[2F00]               inc  word[nlabel]
  7971 00003FE0 A1[2F00]                 mov ax, [nlabel]
  7972 00003FE3 8946FE                   mov [bp-2], ax
  7973 00003FE6 FF76FE                   push word [bp-2]
  7974 00003FE9 E89BFE                   call prlabel
  7975 00003FEC 83C402                   add  sp, 2
  7976 00003FEF E875FA                   call stmt
  7977                                  
  7978                                  ;-741   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7979                                  
  7980 00003FF2 680302                   push 515
  7981 00003FF5 E8C108                   call expect
  7982 00003FF8 83C402                   add  sp, 2
  7983 00003FFB E8BFCE                   call pexpr
  7984 00003FFE FF06[2F00]               inc  word[nlabel]
  7985 00004002 A1[2F00]                 mov ax, [nlabel]
  7986 00004005 8946FC                   mov [bp-4], ax
  7987 00004008 FF76FC                   push word [bp-4]
  7988 0000400B E8B50A                   call pint1
  7989 0000400E 83C402                   add  sp, 2
  7990                                  
  7991                                  ;-742   prjump(jdest); prlabel(jtemp); }
  7992                                  
  7993 00004011 FF76FE                   push word [bp-2]
  7994 00004014 E8A0FE                   call prjump
  7995 00004017 83C402                   add  sp, 2
  7996 0000401A FF76FC                   push word [bp-4]
  7997 0000401D E867FE                   call prlabel
  7998 00004020 83C402                   add  sp, 2
  7999                                  
  8000                                  ;-743 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  8001 00004023 C9                       LEAVE
  8002 00004024 C3                       ret
  8003                                  ; ENDP
  8004                                  
  8005                                  dowhile:  ; *** PROC ***
  8006                                  ;Function : dowhile, Number of local variables: 2
  8007                                  ;   # type sign width addr used name   list of local variables
  8008                                  ;  200 var sign word   743 NULL jdest = bp-2
  8009                                  ;  201 var sign word   743 NULL tst = bp-4;
  8010 00004025 C8040000                 ENTER  4,0
  8011 00004029 FF06[2F00]               inc  word[nlabel]
  8012 0000402D A1[2F00]                 mov ax, [nlabel]
  8013 00004030 8946FE                   mov [bp-2], ax
  8014                                  
  8015                                  ;-744   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  8016                                  
  8017 00004033 FF76FE                   push word [bp-2]
  8018 00004036 E84EFE                   call prlabel
  8019 00004039 83C402                   add  sp, 2
  8020 0000403C E87ECE                   call pexpr
  8021 0000403F FF06[2F00]               inc  word[nlabel]
  8022 00004043 A1[2F00]                 mov ax, [nlabel]
  8023 00004046 8946FC                   mov [bp-4], ax
  8024 00004049 FF76FC                   push word [bp-4]
  8025 0000404C E8740A                   call pint1
  8026 0000404F 83C402                   add  sp, 2
  8027                                  
  8028                                  ;-745   stmt(); prjump(jdest); prlabel(tst); }
  8029                                  
  8030 00004052 E812FA                   call stmt
  8031 00004055 FF76FE                   push word [bp-2]
  8032 00004058 E85CFE                   call prjump
  8033 0000405B 83C402                   add  sp, 2
  8034 0000405E FF76FC                   push word [bp-4]
  8035 00004061 E823FE                   call prlabel
  8036 00004064 83C402                   add  sp, 2
  8037                                  
  8038                                  ;-746 int isrelational() {
  8039 00004067 C9                       LEAVE
  8040 00004068 C3                       ret
  8041                                  ; ENDP
  8042                                  
  8043                                  isrelational:  ; *** PROC ***
  8044                                  
  8045                                  ;-747   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  8046                                  
  8047 00004069 A1[2300]                 mov ax, [token]
  8048 0000406C 3D2603                   cmp ax, 806
  8049 0000406F 0F850300                 jne @@isrelational455
  8050 00004073 E94700                   jmp @@w
  8051                                  @@isrelational455:
  8052 00004076 A1[2300]                 mov ax, [token]
  8053 00004079 3D2703                   cmp ax, 807
  8054 0000407C 0F850300                 jne @@isrelational456
  8055 00004080 E93A00                   jmp @@w
  8056                                  
  8057                                  ;-748   if (token==T_LE) goto w; if (token==T_GE) goto w;
  8058                                  
  8059                                  @@isrelational456:
  8060 00004083 A1[2300]                 mov ax, [token]
  8061 00004086 3D3803                   cmp ax, 824
  8062 00004089 0F850300                 jne @@isrelational457
  8063 0000408D E92D00                   jmp @@w
  8064                                  @@isrelational457:
  8065 00004090 A1[2300]                 mov ax, [token]
  8066 00004093 3D2B03                   cmp ax, 811
  8067 00004096 0F850300                 jne @@isrelational458
  8068 0000409A E92000                   jmp @@w
  8069                                  
  8070                                  ;-749   if (token=='<' ) goto w; if (token=='>' ) goto w;
  8071                                  
  8072                                  @@isrelational458:
  8073 0000409D A1[2300]                 mov ax, [token]
  8074 000040A0 83F83C                   cmp ax, 60
  8075 000040A3 0F850300                 jne @@isrelational459
  8076 000040A7 E91300                   jmp @@w
  8077                                  @@isrelational459:
  8078 000040AA A1[2300]                 mov ax, [token]
  8079 000040AD 83F83E                   cmp ax, 62
  8080 000040B0 0F850300                 jne @@isrelational460
  8081 000040B4 E90600                   jmp @@w
  8082                                  
  8083                                  ;-750   return 0;  w: iscmp=token; token=getlex(); return 1;}
  8084                                  
  8085                                  @@isrelational460:
  8086 000040B7 B80000                   mov ax, 0
  8087 000040BA E91200                   jmp @@retn
  8088                                  @@w:
  8089 000040BD A1[2300]                 mov ax, [token]
  8090 000040C0 A3[2900]                 mov word [iscmp], ax
  8091 000040C3 E80A00                   call getlex
  8092 000040C6 A3[2300]                 mov word [token], ax
  8093 000040C9 B80100                   mov ax, 1
  8094 000040CC E90000                   jmp @@retn
  8095                                  
  8096                                  ;-751  
  8097                                  
  8098                                  
  8099                                  ;-752 char symboltemp[80];    
  8100                                  
  8101                                  @@retn:
  8102 000040CF C3                       ret
  8103                                  ; ENDP
  8104                                  section .bss
  8105                                  absolute 53468
  8106 0000D0DC <res 00000050>          symboltemp resb 80
  8107                                  section .text
  8108                                  
  8109                                  ;-753 int getlex() { char c; char *p; 
  8110                                  
  8111                                  
  8112                                  getlex:  ; *** PROC ***
  8113                                  
  8114                                  ;-754 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  8115                                  
  8116                                  ;Function : getlex, Number of local variables: 2
  8117                                  ;   # type sign width addr used name   list of local variables
  8118                                  ;  200 var sign byte   753 NULL c = bp-2
  8119                                  ;  201 ptr sign byte   753 NULL p = bp-4;
  8120 000040D0 C8040000                 ENTER  4,0
  8121                                  @@g1:
  8122 000040D4 E8A207                   call next
  8123 000040D7 8846FE                   mov [bp-2], al
  8124 000040DA 8A46FE                   mov al, [bp-2]
  8125 000040DD 3C00                     cmp al, 0
  8126 000040DF 0F850600                 jne @@getlex461
  8127 000040E3 B80000                   mov ax, 0
  8128 000040E6 E96D05                   jmp @@retn
  8129                                  @@getlex461:
  8130 000040E9 8A46FE                   mov al, [bp-2]
  8131 000040EC 3C20                     cmp al, 32
  8132 000040EE 0F8F0200                 jg  @@getlex462
  8133 000040F2 EBE0                     jmp @@g1
  8134                                  
  8135                                  ;-755   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  8136                                  
  8137                                  @@getlex462:
  8138 000040F4 8A46FE                   mov al, [bp-2]
  8139 000040F7 3C3D                     cmp al, 61
  8140 000040F9 0F851200                 jne @@getlex463
  8141 000040FD A0[2800]                 mov al, [thechar]
  8142 00004100 3C3D                     cmp al, 61
  8143 00004102 0F850900                 jne @@getlex464
  8144 00004106 E87007                   call next
  8145 00004109 B82603                   mov ax, 806
  8146 0000410C E94705                   jmp @@retn
  8147                                  @@getlex464:
  8148                                  
  8149                                  ;-756   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  8150                                  
  8151                                  @@getlex463:
  8152 0000410F 8A46FE                   mov al, [bp-2]
  8153 00004112 3C21                     cmp al, 33
  8154 00004114 0F851200                 jne @@getlex465
  8155 00004118 A0[2800]                 mov al, [thechar]
  8156 0000411B 3C3D                     cmp al, 61
  8157 0000411D 0F850900                 jne @@getlex466
  8158 00004121 E85507                   call next
  8159 00004124 B82703                   mov ax, 807
  8160 00004127 E92C05                   jmp @@retn
  8161                                  @@getlex466:
  8162                                  
  8163                                  ;-757   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  8164                                  
  8165                                  @@getlex465:
  8166 0000412A 8A46FE                   mov al, [bp-2]
  8167 0000412D 3C3C                     cmp al, 60
  8168 0000412F 0F851200                 jne @@getlex467
  8169 00004133 A0[2800]                 mov al, [thechar]
  8170 00004136 3C3D                     cmp al, 61
  8171 00004138 0F850900                 jne @@getlex468
  8172 0000413C E83A07                   call next
  8173 0000413F B83803                   mov ax, 824
  8174 00004142 E91105                   jmp @@retn
  8175                                  @@getlex468:
  8176                                  
  8177                                  ;-758   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  8178                                  
  8179                                  @@getlex467:
  8180 00004145 8A46FE                   mov al, [bp-2]
  8181 00004148 3C3E                     cmp al, 62
  8182 0000414A 0F851200                 jne @@getlex469
  8183 0000414E A0[2800]                 mov al, [thechar]
  8184 00004151 3C3D                     cmp al, 61
  8185 00004153 0F850900                 jne @@getlex470
  8186 00004157 E81F07                   call next
  8187 0000415A B82B03                   mov ax, 811
  8188 0000415D E9F604                   jmp @@retn
  8189                                  @@getlex470:
  8190                                  
  8191                                  ;-759   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  8192                                  
  8193                                  @@getlex469:
  8194 00004160 8A46FE                   mov al, [bp-2]
  8195 00004163 3C3C                     cmp al, 60
  8196 00004165 0F851200                 jne @@getlex471
  8197 00004169 A0[2800]                 mov al, [thechar]
  8198 0000416C 3C3C                     cmp al, 60
  8199 0000416E 0F850900                 jne @@getlex472
  8200 00004172 E80407                   call next
  8201 00004175 B8D804                   mov ax, 1240
  8202 00004178 E9DB04                   jmp @@retn
  8203                                  @@getlex472:
  8204                                  
  8205                                  ;-760   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  8206                                  
  8207                                  @@getlex471:
  8208 0000417B 8A46FE                   mov al, [bp-2]
  8209 0000417E 3C3E                     cmp al, 62
  8210 00004180 0F851200                 jne @@getlex473
  8211 00004184 A0[2800]                 mov al, [thechar]
  8212 00004187 3C3E                     cmp al, 62
  8213 00004189 0F850900                 jne @@getlex474
  8214 0000418D E8E906                   call next
  8215 00004190 B8D904                   mov ax, 1241
  8216 00004193 E9C004                   jmp @@retn
  8217                                  @@getlex474:
  8218                                  
  8219                                  ;-761   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  8220                                  
  8221                                  @@getlex473:
  8222 00004196 8A46FE                   mov al, [bp-2]
  8223 00004199 3C2B                     cmp al, 43
  8224 0000419B 0F851200                 jne @@getlex475
  8225 0000419F A0[2800]                 mov al, [thechar]
  8226 000041A2 3C2B                     cmp al, 43
  8227 000041A4 0F850900                 jne @@getlex476
  8228 000041A8 E8CE06                   call next
  8229 000041AB B8C304                   mov ax, 1219
  8230 000041AE E9A504                   jmp @@retn
  8231                                  @@getlex476:
  8232                                  
  8233                                  ;-762   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  8234                                  
  8235                                  @@getlex475:
  8236 000041B1 8A46FE                   mov al, [bp-2]
  8237 000041B4 3C2D                     cmp al, 45
  8238 000041B6 0F851200                 jne @@getlex477
  8239 000041BA A0[2800]                 mov al, [thechar]
  8240 000041BD 3C2D                     cmp al, 45
  8241 000041BF 0F850900                 jne @@getlex478
  8242 000041C3 E8B306                   call next
  8243 000041C6 B8C904                   mov ax, 1225
  8244 000041C9 E98A04                   jmp @@retn
  8245                                  @@getlex478:
  8246                                  
  8247                                  ;-763   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  8248                                  
  8249                                  @@getlex477:
  8250 000041CC 8A46FE                   mov al, [bp-2]
  8251 000041CF 3C2B                     cmp al, 43
  8252 000041D1 0F851200                 jne @@getlex479
  8253 000041D5 A0[2800]                 mov al, [thechar]
  8254 000041D8 3C3D                     cmp al, 61
  8255 000041DA 0F850900                 jne @@getlex480
  8256 000041DE E89806                   call next
  8257 000041E1 B8CE04                   mov ax, 1230
  8258 000041E4 E96F04                   jmp @@retn
  8259                                  @@getlex480:
  8260                                  
  8261                                  ;-764   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8262                                  
  8263                                  @@getlex479:
  8264 000041E7 8A46FE                   mov al, [bp-2]
  8265 000041EA 3C2D                     cmp al, 45
  8266 000041EC 0F851200                 jne @@getlex481
  8267 000041F0 A0[2800]                 mov al, [thechar]
  8268 000041F3 3C3D                     cmp al, 61
  8269 000041F5 0F850900                 jne @@getlex482
  8270 000041F9 E87D06                   call next
  8271 000041FC B8CF04                   mov ax, 1231
  8272 000041FF E95404                   jmp @@retn
  8273                                  @@getlex482:
  8274                                  
  8275                                  ;-765   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8276                                  
  8277                                  @@getlex481:
  8278 00004202 8A46FE                   mov al, [bp-2]
  8279 00004205 3C26                     cmp al, 38
  8280 00004207 0F851200                 jne @@getlex483
  8281 0000420B A0[2800]                 mov al, [thechar]
  8282 0000420E 3C3D                     cmp al, 61
  8283 00004210 0F850900                 jne @@getlex484
  8284 00004214 E86206                   call next
  8285 00004217 B8D204                   mov ax, 1234
  8286 0000421A E93904                   jmp @@retn
  8287                                  @@getlex484:
  8288                                  
  8289                                  ;-766   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8290                                  
  8291                                  @@getlex483:
  8292 0000421D 8A46FE                   mov al, [bp-2]
  8293 00004220 3C7C                     cmp al, 124
  8294 00004222 0F851200                 jne @@getlex485
  8295 00004226 A0[2800]                 mov al, [thechar]
  8296 00004229 3C3D                     cmp al, 61
  8297 0000422B 0F850900                 jne @@getlex486
  8298 0000422F E84706                   call next
  8299 00004232 B8D304                   mov ax, 1235
  8300 00004235 E91E04                   jmp @@retn
  8301                                  @@getlex486:
  8302                                  
  8303                                  ;-767   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8304                                  
  8305                                  @@getlex485:
  8306 00004238 8A46FE                   mov al, [bp-2]
  8307 0000423B 3C2A                     cmp al, 42
  8308 0000423D 0F851200                 jne @@getlex487
  8309 00004241 A0[2800]                 mov al, [thechar]
  8310 00004244 3C3D                     cmp al, 61
  8311 00004246 0F850900                 jne @@getlex488
  8312 0000424A E82C06                   call next
  8313 0000424D B8D004                   mov ax, 1232
  8314 00004250 E90304                   jmp @@retn
  8315                                  @@getlex488:
  8316                                  
  8317                                  ;-768   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8318                                  
  8319                                  @@getlex487:
  8320 00004253 8A46FE                   mov al, [bp-2]
  8321 00004256 3C2F                     cmp al, 47
  8322 00004258 0F851200                 jne @@getlex489
  8323 0000425C A0[2800]                 mov al, [thechar]
  8324 0000425F 3C3D                     cmp al, 61
  8325 00004261 0F850900                 jne @@getlex490
  8326 00004265 E81106                   call next
  8327 00004268 B8D104                   mov ax, 1233
  8328 0000426B E9E803                   jmp @@retn
  8329                                  @@getlex490:
  8330                                  
  8331                                  ;-769   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8332                                  
  8333                                  @@getlex489:
  8334 0000426E 8A46FE                   mov al, byte [bp-2]
  8335 00004271 B400                     mov ah, 0
  8336 00004273 50                       push ax
  8337 00004274 68[5846]                 push getlex_0
  8338 00004277 E84017                   call instr1
  8339 0000427A 83C404                   add  sp, 4
  8340 0000427D 08C0                     or  al, al
  8341 0000427F 0F840600                 je @@getlex491
  8342 00004283 8A46FE                   mov al, [bp-2]
  8343 00004286 E9CD03                   jmp @@retn
  8344                                  
  8345                                  ;-770   if (c == '/') { if (thechar == '/') {
  8346                                  
  8347                                  @@getlex491:
  8348 00004289 8A46FE                   mov al, [bp-2]
  8349 0000428C 3C2F                     cmp al, 47
  8350 0000428E 0F852000                 jne @@getlex492
  8351 00004292 A0[2800]                 mov al, [thechar]
  8352 00004295 3C2F                     cmp al, 47
  8353 00004297 0F851700                 jne @@getlex493
  8354                                  
  8355                                  ;-771       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8356                                  
  8357                                  @@getlex494:
  8358 0000429B E8DB05                   call next
  8359 0000429E 8846FE                   mov [bp-2], al
  8360 000042A1 8A46FE                   mov al, [bp-2]
  8361 000042A4 3C0D                     cmp al, 13
  8362 000042A6 0F840200                 je  @@getlex495
  8363 000042AA EBEF                     jmp @@getlex494
  8364                                  @@getlex495:
  8365 000042AC E821FE                   call getlex
  8366 000042AF E9A403                   jmp @@retn
  8367                                  @@getlex493:
  8368                                  
  8369                                  ;-772   if (c == '/') { if (thechar == '*') {
  8370                                  
  8371                                  @@getlex492:
  8372 000042B2 8A46FE                   mov al, [bp-2]
  8373 000042B5 3C2F                     cmp al, 47
  8374 000042B7 0F853A00                 jne @@getlex496
  8375 000042BB A0[2800]                 mov al, [thechar]
  8376 000042BE 3C2A                     cmp al, 42
  8377 000042C0 0F852B00                 jne @@getlex497
  8378                                  
  8379                                  ;-773       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8380                                  
  8381                                  @@g2:
  8382 000042C4 E8B205                   call next
  8383 000042C7 8846FE                   mov [bp-2], al
  8384 000042CA 8A46FE                   mov al, [bp-2]
  8385 000042CD 3C2A                     cmp al, 42
  8386 000042CF 0F840200                 je  @@getlex498
  8387 000042D3 EBEF                     jmp @@g2
  8388                                  @@getlex498:
  8389 000042D5 A0[2800]                 mov al, [thechar]
  8390 000042D8 3C2F                     cmp al, 47
  8391 000042DA 0F840200                 je  @@getlex499
  8392 000042DE EBE4                     jmp @@g2
  8393                                  
  8394                                  ;-774       c=next(); return getlex(); } else  return '/'; }
  8395                                  
  8396                                  @@getlex499:
  8397 000042E0 E89605                   call next
  8398 000042E3 8846FE                   mov [bp-2], al
  8399 000042E6 E8E7FD                   call getlex
  8400 000042E9 E96A03                   jmp @@retn
  8401 000042EC E90600                   jmp @@getlex500
  8402                                  @@getlex497:
  8403 000042EF B82F00                   mov ax, 47
  8404 000042F2 E96103                   jmp @@retn
  8405                                  @@getlex500:
  8406                                  
  8407                                  ;-775   if (c == '"') {getstring(c); return T_STRING;}
  8408                                  
  8409                                  @@getlex496:
  8410 000042F5 8A46FE                   mov al, [bp-2]
  8411 000042F8 3C22                     cmp al, 34
  8412 000042FA 0F851200                 jne @@getlex501
  8413 000042FE 8A46FE                   mov al, byte [bp-2]
  8414 00004301 B400                     mov ah, 0
  8415 00004303 50                       push ax
  8416 00004304 E83B05                   call getstring
  8417 00004307 83C402                   add  sp, 2
  8418 0000430A B80201                   mov ax, 258
  8419 0000430D E94603                   jmp @@retn
  8420                                  
  8421                                  ;-776   if (digit(c)) { getdigit(c); return T_CONST; }
  8422                                  
  8423                                  @@getlex501:
  8424 00004310 8A46FE                   mov al, byte [bp-2]
  8425 00004313 B400                     mov ah, 0
  8426 00004315 50                       push ax
  8427 00004316 E80517                   call digit
  8428 00004319 83C402                   add  sp, 2
  8429 0000431C 08C0                     or  al, al
  8430 0000431E 0F841200                 je @@getlex502
  8431 00004322 8A46FE                   mov al, byte [bp-2]
  8432 00004325 B400                     mov ah, 0
  8433 00004327 50                       push ax
  8434 00004328 E84104                   call getdigit
  8435 0000432B 83C402                   add  sp, 2
  8436 0000432E B80101                   mov ax, 257
  8437 00004331 E92203                   jmp @@retn
  8438                                  
  8439                                  ;-777   if (c==39) { lexval=next();
  8440                                  
  8441                                  @@getlex502:
  8442 00004334 8A46FE                   mov al, [bp-2]
  8443 00004337 3C27                     cmp al, 39
  8444 00004339 0F854F00                 jne @@getlex503
  8445 0000433D E83905                   call next
  8446 00004340 A3[3700]                 mov word [lexval], ax
  8447                                  
  8448                                  ;-778     if (lexval==92) {lexval=next();
  8449                                  
  8450 00004343 A1[3700]                 mov ax, [lexval]
  8451 00004346 83F85C                   cmp ax, 92
  8452 00004349 0F853600                 jne @@getlex504
  8453 0000434D E82905                   call next
  8454 00004350 A3[3700]                 mov word [lexval], ax
  8455                                  
  8456                                  ;-779       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8457                                  
  8458 00004353 A1[3700]                 mov ax, [lexval]
  8459 00004356 83F86E                   cmp ax, 110
  8460 00004359 0F850600                 jne @@getlex505
  8461 0000435D B80A00                   mov ax, 10
  8462 00004360 A3[3700]                 mov word [lexval], ax
  8463                                  @@getlex505:
  8464 00004363 A1[3700]                 mov ax, [lexval]
  8465 00004366 83F874                   cmp ax, 116
  8466 00004369 0F850600                 jne @@getlex506
  8467 0000436D B80900                   mov ax, 9
  8468 00004370 A3[3700]                 mov word [lexval], ax
  8469                                  
  8470                                  ;-780       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8471                                  
  8472                                  @@getlex506:
  8473 00004373 A1[3700]                 mov ax, [lexval]
  8474 00004376 83F830                   cmp ax, 48
  8475 00004379 0F850600                 jne @@getlex507
  8476 0000437D B80000                   mov ax, 0
  8477 00004380 A3[3700]                 mov word [lexval], ax
  8478                                  @@getlex507:
  8479                                  @@getlex504:
  8480 00004383 E8F304                   call next
  8481 00004386 B80101                   mov ax, 257
  8482 00004389 E9CA02                   jmp @@retn
  8483                                  
  8484                                  ;-781   if (letter(c)) { 
  8485                                  
  8486                                  @@getlex503:
  8487 0000438C 8A46FE                   mov al, byte [bp-2]
  8488 0000438F B400                     mov ah, 0
  8489 00004391 50                       push ax
  8490 00004392 E8B316                   call letter
  8491 00004395 83C402                   add  sp, 2
  8492 00004398 08C0                     or  al, al
  8493 0000439A 0F84AF02                 je @@getlex508
  8494                                  
  8495                                  ;-782     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8496                                  
  8497 0000439E 8D062B81                 lea  ax, [symbol]
  8498 000043A2 50                       push ax
  8499 000043A3 8D06DCD0                 lea  ax, [symboltemp]
  8500 000043A7 50                       push ax
  8501 000043A8 E8DF15                   call strcpy
  8502 000043AB 83C404                   add  sp, 4
  8503 000043AE B82B81                   mov ax, symbol
  8504 000043B1 8946FC                   mov [bp-4], ax
  8505 000043B4 8A46FE                   mov al, [bp-2]
  8506 000043B7 8B5EFC                   mov  bx, [bp-4]
  8507 000043BA 8807                     mov  [bx], al
  8508 000043BC FF46FC                   inc  word[bp-4]
  8509                                  
  8510                                  ;-783     while(letter(thechar)) {c=next(); *p=c;  p++; } 
  8511                                  
  8512                                  @@getlex509:
  8513 000043BF A0[2800]                 mov al, byte [thechar]
  8514 000043C2 B400                     mov ah, 0
  8515 000043C4 50                       push ax
  8516 000043C5 E88016                   call letter
  8517 000043C8 83C402                   add  sp, 2
  8518 000043CB 08C0                     or  al, al
  8519 000043CD 0F841300                 je @@getlex510
  8520 000043D1 E8A504                   call next
  8521 000043D4 8846FE                   mov [bp-2], al
  8522 000043D7 8A46FE                   mov al, [bp-2]
  8523 000043DA 8B5EFC                   mov  bx, [bp-4]
  8524 000043DD 8807                     mov  [bx], al
  8525 000043DF FF46FC                   inc  word[bp-4]
  8526                                  
  8527                                  ;-784       *p=0;
  8528                                  
  8529 000043E2 EBDB                     jmp @@getlex509
  8530                                  @@getlex510:
  8531 000043E4 B80000                   mov ax, 0
  8532 000043E7 8B5EFC                   mov  bx, [bp-4]
  8533 000043EA 8807                     mov  [bx], al
  8534                                  
  8535                                  ;-785     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8536                                  
  8537 000043EC 68[6E46]                 push getlex_1
  8538 000043EF 8D062B81                 lea  ax, [symbol]
  8539 000043F3 50                       push ax
  8540 000043F4 E8BA16                   call eqstr
  8541 000043F7 83C404                   add  sp, 4
  8542 000043FA 08C0                     or  al, al
  8543 000043FC 0F840600                 je @@getlex511
  8544 00004400 B81302                   mov ax, 531
  8545 00004403 E95002                   jmp @@retn
  8546                                  
  8547                                  ;-786     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8548                                  
  8549                                  @@getlex511:
  8550 00004406 68[7546]                 push getlex_2
  8551 00004409 8D062B81                 lea  ax, [symbol]
  8552 0000440D 50                       push ax
  8553 0000440E E8A016                   call eqstr
  8554 00004411 83C404                   add  sp, 4
  8555 00004414 08C0                     or  al, al
  8556 00004416 0F840600                 je @@getlex512
  8557 0000441A B81402                   mov ax, 532
  8558 0000441D E93602                   jmp @@retn
  8559                                  
  8560                                  ;-787     if (eqstr(symbol,"void"    )) return T_VOID;
  8561                                  
  8562                                  @@getlex512:
  8563 00004420 68[7E46]                 push getlex_3
  8564 00004423 8D062B81                 lea  ax, [symbol]
  8565 00004427 50                       push ax
  8566 00004428 E88616                   call eqstr
  8567 0000442B 83C404                   add  sp, 4
  8568 0000442E 08C0                     or  al, al
  8569 00004430 0F840600                 je @@getlex513
  8570 00004434 B81102                   mov ax, 529
  8571 00004437 E91C02                   jmp @@retn
  8572                                  
  8573                                  ;-788     if (eqstr(symbol,"int"     )) return T_INT;
  8574                                  
  8575                                  @@getlex513:
  8576 0000443A 68[8346]                 push getlex_4
  8577 0000443D 8D062B81                 lea  ax, [symbol]
  8578 00004441 50                       push ax
  8579 00004442 E86C16                   call eqstr
  8580 00004445 83C404                   add  sp, 4
  8581 00004448 08C0                     or  al, al
  8582 0000444A 0F840600                 je @@getlex514
  8583 0000444E B80502                   mov ax, 517
  8584 00004451 E90202                   jmp @@retn
  8585                                  
  8586                                  ;-789     if (eqstr(symbol,"short"   )) return T_SHORT;
  8587                                  
  8588                                  @@getlex514:
  8589 00004454 68[8746]                 push getlex_5
  8590 00004457 8D062B81                 lea  ax, [symbol]
  8591 0000445B 50                       push ax
  8592 0000445C E85216                   call eqstr
  8593 0000445F 83C404                   add  sp, 4
  8594 00004462 08C0                     or  al, al
  8595 00004464 0F840600                 je @@getlex515
  8596 00004468 B81602                   mov ax, 534
  8597 0000446B E9E801                   jmp @@retn
  8598                                  
  8599                                  ;-790     if (eqstr(symbol,"long"    )) return T_LONG;
  8600                                  
  8601                                  @@getlex515:
  8602 0000446E 68[8D46]                 push getlex_6
  8603 00004471 8D062B81                 lea  ax, [symbol]
  8604 00004475 50                       push ax
  8605 00004476 E83816                   call eqstr
  8606 00004479 83C404                   add  sp, 4
  8607 0000447C 08C0                     or  al, al
  8608 0000447E 0F840600                 je @@getlex516
  8609 00004482 B81502                   mov ax, 533
  8610 00004485 E9CE01                   jmp @@retn
  8611                                  
  8612                                  ;-791     if (eqstr(symbol,"uint32"  )) return T_UINT32;
  8613                                  
  8614                                  @@getlex516:
  8615 00004488 68[9246]                 push getlex_7
  8616 0000448B 8D062B81                 lea  ax, [symbol]
  8617 0000448F 50                       push ax
  8618 00004490 E81E16                   call eqstr
  8619 00004493 83C404                   add  sp, 4
  8620 00004496 08C0                     or  al, al
  8621 00004498 0F840600                 je @@getlex517
  8622 0000449C B82102                   mov ax, 545
  8623 0000449F E9B401                   jmp @@retn
  8624                                  
  8625                                  ;-792     if (eqstr(symbol,"inth"    )) return T_INTH;
  8626                                  
  8627                                  @@getlex517:
  8628 000044A2 68[9946]                 push getlex_8
  8629 000044A5 8D062B81                 lea  ax, [symbol]
  8630 000044A9 50                       push ax
  8631 000044AA E80416                   call eqstr
  8632 000044AD 83C404                   add  sp, 4
  8633 000044B0 08C0                     or  al, al
  8634 000044B2 0F840600                 je @@getlex518
  8635 000044B6 B85802                   mov ax, 600
  8636 000044B9 E99A01                   jmp @@retn
  8637                                  
  8638                                  ;-793     if (eqstr(symbol,"char"    )) return T_CHAR;
  8639                                  
  8640                                  @@getlex518:
  8641 000044BC 68[9E46]                 push getlex_9
  8642 000044BF 8D062B81                 lea  ax, [symbol]
  8643 000044C3 50                       push ax
  8644 000044C4 E8EA15                   call eqstr
  8645 000044C7 83C404                   add  sp, 4
  8646 000044CA 08C0                     or  al, al
  8647 000044CC 0F840600                 je @@getlex519
  8648 000044D0 B81202                   mov ax, 530
  8649 000044D3 E98001                   jmp @@retn
  8650                                  
  8651                                  ;-794     if (eqstr(symbol,"asm"     )) return T_ASM;
  8652                                  
  8653                                  @@getlex519:
  8654 000044D6 68[A346]                 push getlex_10
  8655 000044D9 8D062B81                 lea  ax, [symbol]
  8656 000044DD 50                       push ax
  8657 000044DE E8D015                   call eqstr
  8658 000044E1 83C404                   add  sp, 4
  8659 000044E4 08C0                     or  al, al
  8660 000044E6 0F840600                 je @@getlex520
  8661 000044EA B80602                   mov ax, 518
  8662 000044ED E96601                   jmp @@retn
  8663                                  
  8664                                  ;-795     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8665                                  
  8666                                  @@getlex520:
  8667 000044F0 68[A746]                 push getlex_11
  8668 000044F3 8D062B81                 lea  ax, [symbol]
  8669 000044F7 50                       push ax
  8670 000044F8 E8B615                   call eqstr
  8671 000044FB 83C404                   add  sp, 4
  8672 000044FE 08C0                     or  al, al
  8673 00004500 0F840600                 je @@getlex521
  8674 00004504 B80702                   mov ax, 519
  8675 00004507 E94C01                   jmp @@retn
  8676                                  
  8677                                  ;-796     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8678                                  
  8679                                  @@getlex521:
  8680 0000450A 68[AD46]                 push getlex_12
  8681 0000450D 8D062B81                 lea  ax, [symbol]
  8682 00004511 50                       push ax
  8683 00004512 E89C15                   call eqstr
  8684 00004515 83C404                   add  sp, 4
  8685 00004518 08C0                     or  al, al
  8686 0000451A 0F840600                 je @@getlex522
  8687 0000451E B80802                   mov ax, 520
  8688 00004521 E93201                   jmp @@retn
  8689                                  
  8690                                  ;-797     if (eqstr(symbol,"return"  )) return T_RETURN;
  8691                                  
  8692                                  @@getlex522:
  8693 00004524 68[B646]                 push getlex_13
  8694 00004527 8D062B81                 lea  ax, [symbol]
  8695 0000452B 50                       push ax
  8696 0000452C E88215                   call eqstr
  8697 0000452F 83C404                   add  sp, 4
  8698 00004532 08C0                     or  al, al
  8699 00004534 0F840600                 je @@getlex523
  8700 00004538 B80002                   mov ax, 512
  8701 0000453B E91801                   jmp @@retn
  8702                                  
  8703                                  ;-798     if (eqstr(symbol,"if"      )) return T_IF;
  8704                                  
  8705                                  @@getlex523:
  8706 0000453E 68[BD46]                 push getlex_14
  8707 00004541 8D062B81                 lea  ax, [symbol]
  8708 00004545 50                       push ax
  8709 00004546 E86815                   call eqstr
  8710 00004549 83C404                   add  sp, 4
  8711 0000454C 08C0                     or  al, al
  8712 0000454E 0F840600                 je @@getlex524
  8713 00004552 B80102                   mov ax, 513
  8714 00004555 E9FE00                   jmp @@retn
  8715                                  
  8716                                  ;-799     if (eqstr(symbol,"ifcarry" )) return T_IFCARRY;
  8717                                  
  8718                                  @@getlex524:
  8719 00004558 68[C046]                 push getlex_15
  8720 0000455B 8D062B81                 lea  ax, [symbol]
  8721 0000455F 50                       push ax
  8722 00004560 E84E15                   call eqstr
  8723 00004563 83C404                   add  sp, 4
  8724 00004566 08C0                     or  al, al
  8725 00004568 0F840600                 je @@getlex525
  8726 0000456C B85902                   mov ax, 601
  8727 0000456F E9E400                   jmp @@retn
  8728                                  
  8729                                  ;-800     if (eqstr(symbol,"ifzero"  )) return T_IFZERO;
  8730                                  
  8731                                  @@getlex525:
  8732 00004572 68[C846]                 push getlex_16
  8733 00004575 8D062B81                 lea  ax, [symbol]
  8734 00004579 50                       push ax
  8735 0000457A E83415                   call eqstr
  8736 0000457D 83C404                   add  sp, 4
  8737 00004580 08C0                     or  al, al
  8738 00004582 0F840600                 je @@getlex526
  8739 00004586 B85A02                   mov ax, 602
  8740 00004589 E9CA00                   jmp @@retn
  8741                                  
  8742                                  ;-801     if (eqstr(symbol,"else"    )) return T_ELSE;
  8743                                  
  8744                                  @@getlex526:
  8745 0000458C 68[CF46]                 push getlex_17
  8746 0000458F 8D062B81                 lea  ax, [symbol]
  8747 00004593 50                       push ax
  8748 00004594 E81A15                   call eqstr
  8749 00004597 83C404                   add  sp, 4
  8750 0000459A 08C0                     or  al, al
  8751 0000459C 0F840600                 je @@getlex527
  8752 000045A0 B80202                   mov ax, 514
  8753 000045A3 E9B000                   jmp @@retn
  8754                                  
  8755                                  ;-802     if (eqstr(symbol,"while"   )) return T_WHILE;
  8756                                  
  8757                                  @@getlex527:
  8758 000045A6 68[D446]                 push getlex_18
  8759 000045A9 8D062B81                 lea  ax, [symbol]
  8760 000045AD 50                       push ax
  8761 000045AE E80015                   call eqstr
  8762 000045B1 83C404                   add  sp, 4
  8763 000045B4 08C0                     or  al, al
  8764 000045B6 0F840600                 je @@getlex528
  8765 000045BA B80302                   mov ax, 515
  8766 000045BD E99600                   jmp @@retn
  8767                                  
  8768                                  ;-803     if (eqstr(symbol,"do"      )) return T_DO;
  8769                                  
  8770                                  @@getlex528:
  8771 000045C0 68[DA46]                 push getlex_19
  8772 000045C3 8D062B81                 lea  ax, [symbol]
  8773 000045C7 50                       push ax
  8774 000045C8 E8E614                   call eqstr
  8775 000045CB 83C404                   add  sp, 4
  8776 000045CE 08C0                     or  al, al
  8777 000045D0 0F840600                 je @@getlex529
  8778 000045D4 B80402                   mov ax, 516
  8779 000045D7 E97C00                   jmp @@retn
  8780                                  
  8781                                  ;-804     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8782                                  
  8783                                  @@getlex529:
  8784 000045DA 68[DD46]                 push getlex_20
  8785 000045DD 8D062B81                 lea  ax, [symbol]
  8786 000045E1 50                       push ax
  8787 000045E2 E8CC14                   call eqstr
  8788 000045E5 83C404                   add  sp, 4
  8789 000045E8 08C0                     or  al, al
  8790 000045EA 0F840600                 je @@getlex530
  8791 000045EE B80902                   mov ax, 521
  8792 000045F1 E96200                   jmp @@retn
  8793                                  
  8794                                  ;-805     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8795                                  
  8796                                  @@getlex530:
  8797 000045F4 68[E246]                 push getlex_21
  8798 000045F7 8D062B81                 lea  ax, [symbol]
  8799 000045FB 50                       push ax
  8800 000045FC E8B214                   call eqstr
  8801 000045FF 83C404                   add  sp, 4
  8802 00004602 08C0                     or  al, al
  8803 00004604 0F840600                 je @@getlex531
  8804 00004608 B8FF01                   mov ax, 511
  8805 0000460B E94800                   jmp @@retn
  8806                                  
  8807                                  ;-806     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8808                                  
  8809                                  @@getlex531:
  8810 0000460E 68[E946]                 push getlex_22
  8811 00004611 8D062B81                 lea  ax, [symbol]
  8812 00004615 50                       push ax
  8813 00004616 E89814                   call eqstr
  8814 00004619 83C404                   add  sp, 4
  8815 0000461C 08C0                     or  al, al
  8816 0000461E 0F840600                 je @@getlex532
  8817 00004622 B8FE01                   mov ax, 510
  8818 00004625 E92E00                   jmp @@retn
  8819                                  
  8820                                  ;-807     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8821                                  
  8822                                  @@getlex532:
  8823 00004628 E8E000                   call convertdefine
  8824 0000462B 08C0                     or  al, al
  8825 0000462D 0F841600                 je @@getlex533
  8826 00004631 8D06DCD0                 lea  ax, [symboltemp]
  8827 00004635 50                       push ax
  8828 00004636 8D062B81                 lea  ax, [symbol]
  8829 0000463A 50                       push ax
  8830 0000463B E84C13                   call strcpy
  8831 0000463E 83C404                   add  sp, 4
  8832 00004641 B80101                   mov ax, 257
  8833 00004644 E90F00                   jmp @@retn
  8834                                  
  8835                                  ;-808     return T_NAME; } error1("Input item not recognized"); }
  8836                                  
  8837                                  @@getlex533:
  8838 00004647 B80001                   mov ax, 256
  8839 0000464A E90900                   jmp @@retn
  8840                                  @@getlex508:
  8841 0000464D 68[F146]                 push getlex_23
  8842 00004650 E86206                   call error1
  8843 00004653 83C402                   add  sp, 2
  8844                                  
  8845                                  ;-809 
  8846                                  
  8847                                  
  8848                                  ;-810 int convertdefine() { int i; int j;   i=0;
  8849                                  
  8850 00004656 C9                      @@retn: LEAVE
  8851 00004657 C3                       ret
  8852                                  ; ENDP
  8853 00004658 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8854 00004661 3A252D3E3C3D2B2126-
  8855 0000466A 7C233F00           
  8856 0000466E 7369676E656400          getlex_1 db "signed",0
  8857 00004675 756E7369676E656400      getlex_2 db "unsigned",0
  8858 0000467E 766F696400              getlex_3 db "void",0
  8859 00004683 696E7400                getlex_4 db "int",0
  8860 00004687 73686F727400            getlex_5 db "short",0
  8861 0000468D 6C6F6E6700              getlex_6 db "long",0
  8862 00004692 75696E74333200          getlex_7 db "uint32",0
  8863 00004699 696E746800              getlex_8 db "inth",0
  8864 0000469E 6368617200              getlex_9 db "char",0
  8865 000046A3 61736D00                getlex_10 db "asm",0
  8866 000046A7 5F5F61736D00            getlex_11 db "__asm",0
  8867 000046AD 5F5F656D69745F5F00      getlex_12 db "__emit__",0
  8868 000046B6 72657475726E00          getlex_13 db "return",0
  8869 000046BD 696600                  getlex_14 db "if",0
  8870 000046C0 6966636172727900        getlex_15 db "ifcarry",0
  8871 000046C8 69667A65726F00          getlex_16 db "ifzero",0
  8872 000046CF 656C736500              getlex_17 db "else",0
  8873 000046D4 7768696C6500            getlex_18 db "while",0
  8874 000046DA 646F00                  getlex_19 db "do",0
  8875 000046DD 676F746F00              getlex_20 db "goto",0
  8876 000046E2 646566696E6500          getlex_21 db "define",0
  8877 000046E9 696E636C75646500        getlex_22 db "include",0
  8878 000046F1 496E70757420697465-     getlex_23 db "Input item not recognized",0
  8879 000046FA 6D206E6F7420726563-
  8880 00004703 6F676E697A656400   
  8881                                  
  8882                                  convertdefine:  ; *** PROC ***
  8883                                  ;Function : convertdefine, Number of local variables: 2
  8884                                  ;   # type sign width addr used name   list of local variables
  8885                                  ;  200 var sign word   810 NULL i = bp-2
  8886                                  ;  201 var sign word   810 NULL j = bp-4;
  8887 0000470B C8040000                 ENTER  4,0
  8888 0000470F B80000                   mov ax, 0
  8889 00004712 8946FE                   mov [bp-2], ax
  8890                                  
  8891                                  ;-811   while (i < GTop) {
  8892                                  
  8893                                  @@convertdefine534:
  8894 00004715 8B46FE                   mov ax, [bp-2]
  8895 00004718 3B06[3300]               cmp ax, [GTop]
  8896 0000471C 0F8D4400                 jge @@convertdefine535
  8897                                  
  8898                                  ;-812    j=adrofname(i); 
  8899                                  
  8900 00004720 FF76FE                   push word [bp-2]
  8901 00004723 E8E2BF                   call adrofname
  8902 00004726 83C402                   add  sp, 2
  8903 00004729 8946FC                   mov [bp-4], ax
  8904                                  
  8905                                  ;-813    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8906                                  
  8907 0000472C FF76FC                   push word [bp-4]
  8908 0000472F 8D062B81                 lea  ax, [symbol]
  8909 00004733 50                       push ax
  8910 00004734 E87A13                   call eqstr
  8911 00004737 83C404                   add  sp, 4
  8912 0000473A 08C0                     or  al, al
  8913 0000473C 0F841F00                 je @@convertdefine536
  8914 00004740 8B5EFE                   mov bx, [bp-2]
  8915 00004743 8A87B782                 mov al, [GType + bx]
  8916 00004747 3C23                     cmp al, 35
  8917 00004749 0F851200                 jne @@convertdefine537
  8918 0000474D 8B5EFE                   mov bx, [bp-2]
  8919 00004750 D1E3                     shl bx, 1
  8920 00004752 8B87EB8A                 mov ax, [GData + bx]
  8921 00004756 A3[3700]                 mov word [lexval], ax
  8922                                  
  8923                                  ;-814    return T_CONST; } }
  8924                                  
  8925 00004759 B80101                   mov ax, 257
  8926 0000475C E90B00                   jmp @@retn
  8927                                  @@convertdefine537:
  8928                                  
  8929                                  ;-815    i++; } 
  8930                                  
  8931                                  @@convertdefine536:
  8932 0000475F FF46FE                   inc  word[bp-2]
  8933                                  
  8934                                  ;-816    return 0; }
  8935                                  
  8936 00004762 EBB1                     jmp @@convertdefine534
  8937                                  @@convertdefine535:
  8938 00004764 B80000                   mov ax, 0
  8939 00004767 E90000                   jmp @@retn
  8940                                  
  8941                                  ;-817 int getdigit(char c) { int i;
  8942                                  
  8943 0000476A C9                      @@retn: LEAVE
  8944 0000476B C3                       ret
  8945                                  ; ENDP
  8946                                  
  8947                                  getdigit:  ; *** PROC ***
  8948                                  
  8949                                  ;-818     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8950                                  
  8951                                  ;Function : getdigit, Number of local variables: 2
  8952                                  ;   # type sign width addr used name   list of local variables
  8953                                  ;  200 var sign byte   817 NULL c = bp+4
  8954                                  ;  201 var sign word   817 NULL i = bp-2;
  8955 0000476C C8020000                 ENTER  2,0
  8956 00004770 B80000                   mov ax, 0
  8957 00004773 A3[3700]                 mov word [lexval], ax
  8958 00004776 8A4604                   mov al, [bp+4]
  8959 00004779 2C30                     sub al, 48
  8960 0000477B A3[3700]                 mov word [lexval], ax
  8961                                  
  8962                                  ;-819     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8963                                  
  8964 0000477E A0[2800]                 mov al, [thechar]
  8965 00004781 3C78                     cmp al, 120
  8966 00004783 0F850600                 jne @@getdigit538
  8967 00004787 B85800                   mov ax, 88
  8968 0000478A A2[2800]                 mov byte [thechar], al
  8969                                  @@getdigit538:
  8970 0000478D A0[2800]                 mov al, [thechar]
  8971 00004790 3C58                     cmp al, 88
  8972 00004792 0F856800                 jne @@getdigit539
  8973 00004796 E8E000                   call next
  8974                                  
  8975                                  ;-820       while(letter(thechar)) { c=next(); if(c>96) c=c-39;
  8976                                  
  8977                                  @@getdigit540:
  8978 00004799 A0[2800]                 mov al, byte [thechar]
  8979 0000479C B400                     mov ah, 0
  8980 0000479E 50                       push ax
  8981 0000479F E8A612                   call letter
  8982 000047A2 83C402                   add  sp, 2
  8983 000047A5 08C0                     or  al, al
  8984 000047A7 0F845000                 je @@getdigit541
  8985 000047AB E8CB00                   call next
  8986 000047AE 884604                   mov [bp+4], al
  8987 000047B1 8A4604                   mov al, [bp+4]
  8988 000047B4 3C60                     cmp al, 96
  8989 000047B6 0F8E0800                 jle @@getdigit542
  8990 000047BA 8A4604                   mov al, [bp+4]
  8991 000047BD 2C27                     sub al, 39
  8992 000047BF 884604                   mov [bp+4], al
  8993                                  
  8994                                  ;-821 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8995                                  
  8996                                  @@getdigit542:
  8997 000047C2 8A4604                   mov al, [bp+4]
  8998 000047C5 3C40                     cmp al, 64
  8999 000047C7 0F8E0800                 jle @@getdigit543
  9000 000047CB 8A4604                   mov al, [bp+4]
  9001 000047CE 2C07                     sub al, 7
  9002 000047D0 884604                   mov [bp+4], al
  9003                                  @@getdigit543:
  9004 000047D3 8A4604                   mov al, [bp+4]
  9005 000047D6 2C30                     sub al, 48
  9006 000047D8 884604                   mov [bp+4], al
  9007 000047DB A1[3700]                 mov ax, [lexval]
  9008 000047DE C1E004                   shl ax, 4
  9009 000047E1 A3[3700]                 mov word [lexval], ax
  9010                                  
  9011                                  ;-822      i=0; i=c; lexval=lexval+i;}
  9012                                  
  9013 000047E4 B80000                   mov ax, 0
  9014 000047E7 8946FE                   mov [bp-2], ax
  9015 000047EA 8A4604                   mov al, [bp+4]
  9016 000047ED 8946FE                   mov [bp-2], ax
  9017 000047F0 A1[3700]                 mov ax, [lexval]
  9018 000047F3 0346FE                   add ax, [bp-2]
  9019 000047F6 A3[3700]                 mov word [lexval], ax
  9020                                  
  9021                                  ;-823     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  9022                                  
  9023 000047F9 EB9E                     jmp @@getdigit540
  9024                                  @@getdigit541:
  9025 000047FB E94200                   jmp @@getdigit544
  9026                                  @@getdigit539:
  9027                                  @@getdigit545:
  9028 000047FE A0[2800]                 mov al, byte [thechar]
  9029 00004801 B400                     mov ah, 0
  9030 00004803 50                       push ax
  9031 00004804 E81712                   call digit
  9032 00004807 83C402                   add  sp, 2
  9033 0000480A 08C0                     or  al, al
  9034 0000480C 0F843000                 je @@getdigit546
  9035 00004810 E86600                   call next
  9036 00004813 884604                   mov [bp+4], al
  9037 00004816 8A4604                   mov al, [bp+4]
  9038 00004819 2C30                     sub al, 48
  9039 0000481B 884604                   mov [bp+4], al
  9040 0000481E A1[3700]                 mov ax, [lexval]
  9041 00004821 BB0A00                   mov bx, 10
  9042 00004824 F7E3                     mul bx
  9043 00004826 A3[3700]                 mov word [lexval], ax
  9044                                  
  9045                                  ;-824      i=0; i=c; lexval=lexval+i; } } 
  9046                                  
  9047 00004829 B80000                   mov ax, 0
  9048 0000482C 8946FE                   mov [bp-2], ax
  9049 0000482F 8A4604                   mov al, [bp+4]
  9050 00004832 8946FE                   mov [bp-2], ax
  9051 00004835 A1[3700]                 mov ax, [lexval]
  9052 00004838 0346FE                   add ax, [bp-2]
  9053 0000483B A3[3700]                 mov word [lexval], ax
  9054 0000483E EBBE                     jmp @@getdigit545
  9055                                  @@getdigit546:
  9056                                  
  9057                                  ;-825 }
  9058                                  
  9059                                  @@getdigit544:
  9060                                  
  9061                                  ;-826 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  9062 00004840 C9                       LEAVE
  9063 00004841 C3                       ret
  9064                                  ; ENDP
  9065                                  
  9066                                  getstring:  ; *** PROC ***
  9067                                  ;Function : getstring, Number of local variables: 3
  9068                                  ;   # type sign width addr used name   list of local variables
  9069                                  ;  200 var sign word   826 NULL delim = bp+4
  9070                                  ;  201 var sign word   826 NULL c = bp-2
  9071                                  ;  202 ptr sign byte   826 NULL p = bp-4;
  9072 00004842 C8040000                 ENTER  4,0
  9073 00004846 B82B81                   mov ax, symbol
  9074 00004849 8946FC                   mov [bp-4], ax
  9075 0000484C E82A00                   call next
  9076 0000484F 8946FE                   mov [bp-2], ax
  9077                                  
  9078                                  ;-827   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  9079                                  
  9080                                  @@getstring547:
  9081 00004852 8B46FE                   mov ax, [bp-2]
  9082 00004855 3B4604                   cmp ax, [bp+4]
  9083 00004858 0F841300                 je  @@getstring548
  9084 0000485C 8B46FE                   mov ax, [bp-2]
  9085 0000485F 8B5EFC                   mov  bx, [bp-4]
  9086 00004862 8807                     mov  [bx], al
  9087 00004864 FF46FC                   inc  word[bp-4]
  9088 00004867 E80F00                   call next
  9089 0000486A 8946FE                   mov [bp-2], ax
  9090 0000486D EBE3                     jmp @@getstring547
  9091                                  @@getstring548:
  9092 0000486F B80000                   mov ax, 0
  9093 00004872 8B5EFC                   mov  bx, [bp-4]
  9094 00004875 8807                     mov  [bx], al
  9095                                  
  9096                                  ;-828 
  9097                                  
  9098                                  
  9099                                  ;-829 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  9100 00004877 C9                       LEAVE
  9101 00004878 C3                       ret
  9102                                  ; ENDP
  9103                                  
  9104                                  next:  ; *** PROC ***
  9105                                  ;Function : next, Number of local variables: 1
  9106                                  ;   # type sign width addr used name   list of local variables
  9107                                  ;  200 var sign byte   829 NULL r = bp-2;
  9108 00004879 C8020000                 ENTER  2,0
  9109 0000487D A0[2800]                 mov al, [thechar]
  9110 00004880 8846FE                   mov [bp-2], al
  9111 00004883 8A46FE                   mov al, [bp-2]
  9112 00004886 A2[2500]                 mov byte [globC], al
  9113 00004889 E83303                   call fgets1
  9114 0000488C A2[2800]                 mov byte [thechar], al
  9115 0000488F 8A46FE                   mov al, [bp-2]
  9116 00004892 E90000                   jmp @@retn
  9117                                  
  9118                                  ;-830 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  9119                                  
  9120 00004895 C9                      @@retn: LEAVE
  9121 00004896 C3                       ret
  9122                                  ; ENDP
  9123                                  
  9124                                  istoken:  ; *** PROC ***
  9125                                  ;Function : istoken, Number of local variables: 1
  9126                                  ;   # type sign width addr used name   list of local variables
  9127                                  ;  200 var sign word   830 NULL t = bp+4;
  9128 00004897 C8000000                 ENTER  0,0
  9129 0000489B A1[2300]                 mov ax, [token]
  9130 0000489E 3B4604                   cmp ax, [bp+4]
  9131 000048A1 0F850C00                 jne @@istoken549
  9132 000048A5 E828F8                   call getlex
  9133 000048A8 A3[2300]                 mov word [token], ax
  9134 000048AB B80100                   mov ax, 1
  9135 000048AE E90600                   jmp @@retn
  9136                                  @@istoken549:
  9137 000048B1 B80000                   mov ax, 0
  9138 000048B4 E90000                   jmp @@retn
  9139                                  
  9140                                  ;-831 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  9141                                  
  9142 000048B7 C9                      @@retn: LEAVE
  9143 000048B8 C3                       ret
  9144                                  ; ENDP
  9145                                  
  9146                                  expect:  ; *** PROC ***
  9147                                  ;Function : expect, Number of local variables: 1
  9148                                  ;   # type sign width addr used name   list of local variables
  9149                                  ;  200 var sign word   831 NULL t = bp+4;
  9150 000048B9 C8000000                 ENTER  0,0
  9151 000048BD FF7604                   push word [bp+4]
  9152 000048C0 E8D4FF                   call istoken
  9153 000048C3 83C402                   add  sp, 2
  9154 000048C6 83F800                   cmp ax, 0
  9155 000048C9 0F853200                 jne @@expect550
  9156 000048CD B80000                   mov ax, 0
  9157 000048D0 8B1E[1D00]               mov  bx, [cloc]
  9158 000048D4 8807                     mov  [bx], al
  9159 000048D6 8D063075                 lea  ax, [co]
  9160 000048DA 50                       push ax
  9161 000048DB E8EE00                   call prs
  9162 000048DE 83C402                   add  sp, 2
  9163 000048E1 E8D304                   call listproc
  9164                                  
  9165                                  ;-832   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  9166                                  
  9167 000048E4 68[0149]                 push expect_0
  9168 000048E7 E8E200                   call prs
  9169 000048EA 83C402                   add  sp, 2
  9170 000048ED FF7604                   push word [bp+4]
  9171 000048F0 E8D001                   call pint1
  9172 000048F3 83C402                   add  sp, 2
  9173 000048F6 68[1949]                 push expect_1
  9174 000048F9 E8B903                   call error1
  9175 000048FC 83C402                   add  sp, 2
  9176                                  @@expect550:
  9177                                  
  9178                                  ;-833 
  9179                                  
  9180                                  
  9181                                  ;-834 int eprc(char c)  {*cloc=c; cloc++; }
  9182 000048FF C9                       LEAVE
  9183 00004900 C3                       ret
  9184                                  ; ENDP
  9185 00004901 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  9186 0000490A 642041534349492864-
  9187 00004913 657A293A2000       
  9188 00004919 206E6F7420666F756E-     expect_1 db " not found",0
  9189 00004922 6400               
  9190                                  
  9191                                  eprc:  ; *** PROC ***
  9192                                  ;Function : eprc, Number of local variables: 1
  9193                                  ;   # type sign width addr used name   list of local variables
  9194                                  ;  200 var sign byte   834 NULL c = bp+4;
  9195 00004924 C8000000                 ENTER  0,0
  9196 00004928 8A4604                   mov al, [bp+4]
  9197 0000492B 8B1E[1D00]               mov  bx, [cloc]
  9198 0000492F 8807                     mov  [bx], al
  9199 00004931 FF06[1D00]               inc  word[cloc]
  9200                                  
  9201                                  ;-835 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  9202 00004935 C9                       LEAVE
  9203 00004936 C3                       ret
  9204                                  ; ENDP
  9205                                  
  9206                                  eprs:  ; *** PROC ***
  9207                                  ;Function : eprs, Number of local variables: 2
  9208                                  ;   # type sign width addr used name   list of local variables
  9209                                  ;  200 ptr sign byte   835 NULL s = bp+4
  9210                                  ;  201 var sign byte   835 NULL c = bp-2;
  9211 00004937 C8020000                 ENTER  2,0
  9212                                  @@eprs551:
  9213 0000493B 8B5E04                   mov bx, [bp+4]
  9214 0000493E 8A07                     mov al, [bx]
  9215 00004940 B400                     mov ah, 0
  9216 00004942 08C0                     or  al, al
  9217 00004944 0F841B00                 je @@eprs552
  9218 00004948 8B5E04                   mov bx, [bp+4]
  9219 0000494B 8A07                     mov al, [bx]
  9220 0000494D B400                     mov ah, 0
  9221 0000494F 8846FE                   mov [bp-2], al
  9222 00004952 8A46FE                   mov al, byte [bp-2]
  9223 00004955 B400                     mov ah, 0
  9224 00004957 50                       push ax
  9225 00004958 E8C9FF                   call eprc
  9226 0000495B 83C402                   add  sp, 2
  9227 0000495E FF4604                   inc  word[bp+4]
  9228 00004961 EBD8                     jmp @@eprs551
  9229                                  @@eprs552:
  9230                                  
  9231                                  ;-836 int prc(unsigned char c) { 
  9232 00004963 C9                       LEAVE
  9233 00004964 C3                       ret
  9234                                  ; ENDP
  9235                                  
  9236                                  prc:  ; *** PROC ***
  9237                                  
  9238                                  ;-837   if (c==10) {_AX=13; writetty(); }
  9239                                  
  9240                                  ;Function : prc, Number of local variables: 1
  9241                                  ;   # type sign width addr used name   list of local variables
  9242                                  ;  200 var unsg byte   836 NULL c = bp+4;
  9243 00004965 C8000000                 ENTER  0,0
  9244 00004969 8A4604                   mov al, [bp+4]
  9245 0000496C 3C0A                     cmp al, 10
  9246 0000496E 0F850600                 jne @@prc553
  9247 00004972 B80D00                   mov  ax, 13
  9248 00004975 E8EA0E                   call writetty
  9249                                  
  9250                                  ;-838   _AL=c; writetty(); 
  9251                                  
  9252                                  @@prc553:
  9253 00004978 8A4604                   mov  al, [bp+4]
  9254 0000497B E8E40E                   call writetty
  9255                                  
  9256                                  ;-839   fputcR(c, fdout); 
  9257                                  
  9258 0000497E FF36[2100]               push word [fdout]
  9259 00004982 8A4604                   mov al, byte [bp+4]
  9260 00004985 B400                     mov ah, 0
  9261 00004987 50                       push ax
  9262 00004988 E8EB11                   call fputcR
  9263 0000498B 83C404                   add  sp, 4
  9264                                  
  9265                                  ;-840   }
  9266                                  
  9267                                  
  9268                                  ;-841 int prscomment(unsigned char *s) {unsigned char c;
  9269 0000498E C9                       LEAVE
  9270 0000498F C3                       ret
  9271                                  ; ENDP
  9272                                  
  9273                                  prscomment:  ; *** PROC ***
  9274                                  
  9275                                  ;-842   while(*s){c=*s;prc(c);s++;} }
  9276                                  
  9277                                  ;Function : prscomment, Number of local variables: 2
  9278                                  ;   # type sign width addr used name   list of local variables
  9279                                  ;  200 ptr unsg byte   841 NULL s = bp+4
  9280                                  ;  201 var unsg byte   841 NULL c = bp-2;
  9281 00004990 C8020000                 ENTER  2,0
  9282                                  @@prscomment554:
  9283 00004994 8B5E04                   mov bx, [bp+4]
  9284 00004997 8A07                     mov al, [bx]
  9285 00004999 B400                     mov ah, 0
  9286 0000499B 08C0                     or  al, al
  9287 0000499D 0F841B00                 je @@prscomment555
  9288 000049A1 8B5E04                   mov bx, [bp+4]
  9289 000049A4 8A07                     mov al, [bx]
  9290 000049A6 B400                     mov ah, 0
  9291 000049A8 8846FE                   mov [bp-2], al
  9292 000049AB 8A46FE                   mov al, byte [bp-2]
  9293 000049AE B400                     mov ah, 0
  9294 000049B0 50                       push ax
  9295 000049B1 E8B1FF                   call prc
  9296 000049B4 83C402                   add  sp, 2
  9297 000049B7 FF4604                   inc  word[bp+4]
  9298 000049BA EBD8                     jmp @@prscomment554
  9299                                  @@prscomment555:
  9300                                  
  9301                                  ;-843 int prnl() { prs("\n ");}
  9302 000049BC C9                       LEAVE
  9303 000049BD C3                       ret
  9304                                  ; ENDP
  9305                                  
  9306                                  prnl:  ; *** PROC ***
  9307 000049BE 68[C849]                 push prnl_0
  9308 000049C1 E80800                   call prs
  9309 000049C4 83C402                   add  sp, 2
  9310                                  
  9311                                  ;-844 
  9312                                  
  9313                                  
  9314                                  ;-845 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9315                                  
  9316 000049C7 C3                       ret
  9317                                  ; ENDP
  9318 000049C8 5C6E2000                prnl_0 db "\n ",0
  9319                                  
  9320                                  prs:  ; *** PROC ***
  9321                                  ;Function : prs, Number of local variables: 3
  9322                                  ;   # type sign width addr used name   list of local variables
  9323                                  ;  200 ptr unsg byte   845 NULL s = bp+4
  9324                                  ;  201 var unsg byte   845 NULL c = bp-2
  9325                                  ;  202 var sign word   845 NULL com = bp-4;
  9326 000049CC C8040000                 ENTER  4,0
  9327 000049D0 B80000                   mov ax, 0
  9328 000049D3 8946FC                   mov [bp-4], ax
  9329                                  
  9330                                  ;-846   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9331                                  
  9332                                  @@prs556:
  9333 000049D6 8B5E04                   mov bx, [bp+4]
  9334 000049D9 8A07                     mov al, [bx]
  9335 000049DB B400                     mov ah, 0
  9336 000049DD 08C0                     or  al, al
  9337 000049DF 0F847B00                 je @@prs557
  9338 000049E3 8B5E04                   mov bx, [bp+4]
  9339 000049E6 8A07                     mov al, [bx]
  9340 000049E8 B400                     mov ah, 0
  9341 000049EA 8846FE                   mov [bp-2], al
  9342 000049ED 8A46FE                   mov al, [bp-2]
  9343 000049F0 3C22                     cmp al, 34
  9344 000049F2 0F851800                 jne @@prs558
  9345 000049F6 8B46FC                   mov ax, [bp-4]
  9346 000049F9 08C0                     or  al, al
  9347 000049FB 0F840900                 je @@prs559
  9348 000049FF B80000                   mov ax, 0
  9349 00004A02 8946FC                   mov [bp-4], ax
  9350 00004A05 E90600                   jmp @@prs560
  9351                                  @@prs559:
  9352 00004A08 B80100                   mov ax, 1
  9353 00004A0B 8946FC                   mov [bp-4], ax
  9354                                  
  9355                                  ;-847     if (c==92) { if (com==0) { s++; c=*s;
  9356                                  
  9357                                  @@prs560:
  9358                                  @@prs558:
  9359 00004A0E 8A46FE                   mov al, [bp-2]
  9360 00004A11 3C5C                     cmp al, 92
  9361 00004A13 0F853500                 jne @@prs561
  9362 00004A17 8B46FC                   mov ax, [bp-4]
  9363 00004A1A 83F800                   cmp ax, 0
  9364 00004A1D 0F852B00                 jne @@prs562
  9365 00004A21 FF4604                   inc  word[bp+4]
  9366 00004A24 8B5E04                   mov bx, [bp+4]
  9367 00004A27 8A07                     mov al, [bx]
  9368 00004A29 B400                     mov ah, 0
  9369 00004A2B 8846FE                   mov [bp-2], al
  9370                                  
  9371                                  ;-848           if (c=='n') c=10; if (c=='t') c= 9;
  9372                                  
  9373 00004A2E 8A46FE                   mov al, [bp-2]
  9374 00004A31 3C6E                     cmp al, 110
  9375 00004A33 0F850600                 jne @@prs563
  9376 00004A37 B80A00                   mov ax, 10
  9377 00004A3A 8846FE                   mov [bp-2], al
  9378                                  @@prs563:
  9379 00004A3D 8A46FE                   mov al, [bp-2]
  9380 00004A40 3C74                     cmp al, 116
  9381 00004A42 0F850600                 jne @@prs564
  9382 00004A46 B80900                   mov ax, 9
  9383 00004A49 8846FE                   mov [bp-2], al
  9384                                  
  9385                                  ;-849     } } prc(c); s++;  } }
  9386                                  
  9387                                  @@prs564:
  9388                                  @@prs562:
  9389                                  @@prs561:
  9390 00004A4C 8A46FE                   mov al, byte [bp-2]
  9391 00004A4F B400                     mov ah, 0
  9392 00004A51 50                       push ax
  9393 00004A52 E810FF                   call prc
  9394 00004A55 83C402                   add  sp, 2
  9395 00004A58 FF4604                   inc  word[bp+4]
  9396 00004A5B E978FF                   jmp @@prs556
  9397                                  @@prs557:
  9398                                  
  9399                                  ;-850 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9400 00004A5E C9                       LEAVE
  9401 00004A5F C3                       ret
  9402                                  ; ENDP
  9403                                  
  9404                                  eprnum:  ; *** PROC ***
  9405                                  ;Function : eprnum, Number of local variables: 2
  9406                                  ;   # type sign width addr used name   list of local variables
  9407                                  ;  200 var sign word   850 NULL n = bp+4
  9408                                  ;  201 var sign word   850 NULL e = bp-2;
  9409 00004A60 C8020000                 ENTER  2,0
  9410 00004A64 8B4604                   mov ax, [bp+4]
  9411 00004A67 83F800                   cmp ax, 0
  9412 00004A6A 0F8D1400                 jge @@eprnum565
  9413 00004A6E 6A2D                     push 45
  9414 00004A70 E8B1FE                   call eprc
  9415 00004A73 83C402                   add  sp, 2
  9416 00004A76 FF7604                   push word [bp+4]
  9417 00004A79 E8350E                   call mkneg
  9418 00004A7C 83C402                   add  sp, 2
  9419 00004A7F 894604                   mov [bp+4], ax
  9420                                  
  9421                                  ;-851   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9422                                  
  9423                                  @@eprnum565:
  9424 00004A82 8B4604                   mov ax, [bp+4]
  9425 00004A85 83F80A                   cmp ax, 10 ;unsigned : 1
  9426 00004A88 0F8C1500                 jl  @@eprnum566
  9427 00004A8C 8B4604                   mov ax, [bp+4]
  9428 00004A8F BB0A00                   mov bx, 10
  9429 00004A92 99                       cwd
  9430 00004A93 F7FB                     idiv bx
  9431 00004A95 8946FE                   mov [bp-2], ax
  9432 00004A98 FF76FE                   push word [bp-2]
  9433 00004A9B E8C2FF                   call eprnum
  9434 00004A9E 83C402                   add  sp, 2
  9435                                  @@eprnum566:
  9436 00004AA1 8B4604                   mov ax, [bp+4]
  9437 00004AA4 BB0A00                   mov bx, 10
  9438 00004AA7 99                       cwd
  9439 00004AA8 F7FB                     idiv bx
  9440 00004AAA 89D0                     mov ax, dx
  9441 00004AAC 894604                   mov [bp+4], ax
  9442 00004AAF 8B4604                   mov ax, [bp+4]
  9443 00004AB2 83C030                   add ax, 48
  9444 00004AB5 894604                   mov [bp+4], ax
  9445 00004AB8 FF7604                   push word [bp+4]
  9446 00004ABB E866FE                   call eprc
  9447 00004ABE 83C402                   add  sp, 2
  9448                                  
  9449                                  ;-852 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9450 00004AC1 C9                       LEAVE
  9451 00004AC2 C3                       ret
  9452                                  ; ENDP
  9453                                  
  9454                                  pint1:  ; *** PROC ***
  9455                                  ;Function : pint1, Number of local variables: 2
  9456                                  ;   # type sign width addr used name   list of local variables
  9457                                  ;  200 var sign word   852 NULL n = bp+4
  9458                                  ;  201 var sign word   852 NULL e = bp-2;
  9459 00004AC3 C8020000                 ENTER  2,0
  9460 00004AC7 8B4604                   mov ax, [bp+4]
  9461 00004ACA 83F800                   cmp ax, 0
  9462 00004ACD 0F8D1400                 jge @@pint1567
  9463 00004AD1 6A2D                     push 45
  9464 00004AD3 E88FFE                   call prc
  9465 00004AD6 83C402                   add  sp, 2
  9466 00004AD9 FF7604                   push word [bp+4]
  9467 00004ADC E8D20D                   call mkneg
  9468 00004ADF 83C402                   add  sp, 2
  9469 00004AE2 894604                   mov [bp+4], ax
  9470                                  
  9471                                  ;-853   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9472                                  
  9473                                  @@pint1567:
  9474 00004AE5 8B4604                   mov ax, [bp+4]
  9475 00004AE8 83F80A                   cmp ax, 10 ;unsigned : 1
  9476 00004AEB 0F8C1500                 jl  @@pint1568
  9477 00004AEF 8B4604                   mov ax, [bp+4]
  9478 00004AF2 BB0A00                   mov bx, 10
  9479 00004AF5 99                       cwd
  9480 00004AF6 F7FB                     idiv bx
  9481 00004AF8 8946FE                   mov [bp-2], ax
  9482 00004AFB FF76FE                   push word [bp-2]
  9483 00004AFE E8C2FF                   call pint1
  9484 00004B01 83C402                   add  sp, 2
  9485                                  @@pint1568:
  9486 00004B04 8B4604                   mov ax, [bp+4]
  9487 00004B07 BB0A00                   mov bx, 10
  9488 00004B0A 99                       cwd
  9489 00004B0B F7FB                     idiv bx
  9490 00004B0D 89D0                     mov ax, dx
  9491 00004B0F 894604                   mov [bp+4], ax
  9492 00004B12 8B4604                   mov ax, [bp+4]
  9493 00004B15 83C030                   add ax, 48
  9494 00004B18 894604                   mov [bp+4], ax
  9495 00004B1B FF7604                   push word [bp+4]
  9496 00004B1E E844FE                   call prc
  9497 00004B21 83C402                   add  sp, 2
  9498                                  
  9499                                  ;-854 int prunsign1(unsigned int n) { unsigned int e;
  9500 00004B24 C9                       LEAVE
  9501 00004B25 C3                       ret
  9502                                  ; ENDP
  9503                                  
  9504                                  prunsign1:  ; *** PROC ***
  9505                                  
  9506                                  ;-855   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9507                                  
  9508                                  ;Function : prunsign1, Number of local variables: 2
  9509                                  ;   # type sign width addr used name   list of local variables
  9510                                  ;  200 var unsg word   854 NULL n = bp+4
  9511                                  ;  201 var unsg word   854 NULL e = bp-2;
  9512 00004B26 C8020000                 ENTER  2,0 ; constant expression
  9513 00004B2A 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9514 00004B2E 0F821700                 jb  @@prunsign1569
  9515 00004B32 8B4604                   mov ax, [bp+4]
  9516 00004B35 BB0A00                   mov bx, 10
  9517 00004B38 BA0000                   mov dx, 0
  9518 00004B3B F7F3                     div bx
  9519 00004B3D 8946FE                   mov [bp-2], ax
  9520 00004B40 FF76FE                   push word [bp-2]
  9521 00004B43 E8E0FF                   call prunsign1
  9522 00004B46 83C402                   add  sp, 2
  9523                                  
  9524                                  ;-856     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9525                                  
  9526                                  @@prunsign1569:
  9527 00004B49 8B4604                   mov ax, [bp+4]
  9528 00004B4C BB0A00                   mov bx, 10
  9529 00004B4F BA0000                   mov dx, 0
  9530 00004B52 F7F3                     div bx
  9531 00004B54 89D0                     mov ax, dx
  9532 00004B56 894604                   mov [bp+4], ax
  9533 00004B59 83460430                 add  word[bp+4], 48
  9534 00004B5D FF7604                   push word [bp+4]
  9535 00004B60 E802FE                   call prc
  9536 00004B63 83C402                   add  sp, 2
  9537                                  
  9538                                  ;-857 int printint51(unsigned int j)  {
  9539 00004B66 C9                       LEAVE
  9540 00004B67 C3                       ret
  9541                                  ; ENDP
  9542                                  
  9543                                  printint51:  ; *** PROC ***
  9544                                  
  9545                                  ;-858   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9546                                  
  9547                                  ;Function : printint51, Number of local variables: 1
  9548                                  ;   # type sign width addr used name   list of local variables
  9549                                  ;  200 var unsg word   857 NULL j = bp+4;
  9550 00004B68 C8000000                 ENTER  0,0
  9551 00004B6C 8B4604                   mov ax, [bp+4]
  9552 00004B6F 3D1027                   cmp ax, 10000
  9553 00004B72 0F8D0800                 jge @@printint51570
  9554 00004B76 6A20                     push 32
  9555 00004B78 E8EAFD                   call prc
  9556 00004B7B 83C402                   add  sp, 2
  9557                                  @@printint51570:
  9558 00004B7E 8B4604                   mov ax, [bp+4]
  9559 00004B81 3DE803                   cmp ax, 1000
  9560 00004B84 0F8D0800                 jge @@printint51571
  9561 00004B88 6A20                     push 32
  9562 00004B8A E8D8FD                   call prc
  9563 00004B8D 83C402                   add  sp, 2
  9564                                  @@printint51571:
  9565 00004B90 8B4604                   mov ax, [bp+4]
  9566 00004B93 83F864                   cmp ax, 100
  9567 00004B96 0F8D0800                 jge @@printint51572
  9568 00004B9A 6A20                     push 32
  9569 00004B9C E8C6FD                   call prc
  9570 00004B9F 83C402                   add  sp, 2
  9571                                  
  9572                                  ;-859    if (j<10) prc(32);  prunsign1(j); }
  9573                                  
  9574                                  @@printint51572:
  9575 00004BA2 8B4604                   mov ax, [bp+4]
  9576 00004BA5 83F80A                   cmp ax, 10
  9577 00004BA8 0F8D0800                 jge @@printint51573
  9578 00004BAC 6A20                     push 32
  9579 00004BAE E8B4FD                   call prc
  9580 00004BB1 83C402                   add  sp, 2
  9581                                  @@printint51573:
  9582 00004BB4 FF7604                   push word [bp+4]
  9583 00004BB7 E86CFF                   call prunsign1
  9584 00004BBA 83C402                   add  sp, 2
  9585                                  
  9586                                  ;-860 
  9587                                  
  9588                                  
  9589                                  ;-861 int fgets1() { char c; c=*fgetsp;
  9590 00004BBD C9                       LEAVE
  9591 00004BBE C3                       ret
  9592                                  ; ENDP
  9593                                  
  9594                                  fgets1:  ; *** PROC ***
  9595                                  ;Function : fgets1, Number of local variables: 1
  9596                                  ;   # type sign width addr used name   list of local variables
  9597                                  ;  200 var sign byte   861 NULL c = bp-2;
  9598 00004BBF C8020000                 ENTER  2,0
  9599 00004BC3 8B1E[6B00]               mov bx, [fgetsp]
  9600 00004BC7 8A07                     mov al, [bx]
  9601 00004BC9 B400                     mov ah, 0
  9602 00004BCB 8846FE                   mov [bp-2], al
  9603                                  
  9604                                  ;-862   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9605                                  
  9606 00004BCE 8A46FE                   mov al, [bp-2]
  9607 00004BD1 3C00                     cmp al, 0
  9608 00004BD3 0F852A00                 jne @@fgets1574
  9609 00004BD7 E83700                   call printinputline
  9610 00004BDA A1[7900]                 mov ax, [DOS_NoBytes]
  9611 00004BDD 83F800                   cmp ax, 0
  9612 00004BE0 0F850600                 jne @@fgets1575
  9613 00004BE4 B80000                   mov ax, 0
  9614 00004BE7 E92500                   jmp @@retn
  9615                                  
  9616                                  ;-863     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9617                                  
  9618                                  @@fgets1575:
  9619 00004BEA B80FD0                   mov ax, fgetsdest
  9620 00004BED A3[6B00]                 mov word [fgetsp], ax
  9621 00004BF0 8B1E[6B00]               mov bx, [fgetsp]
  9622 00004BF4 8A07                     mov al, [bx]
  9623 00004BF6 B400                     mov ah, 0
  9624 00004BF8 8846FE                   mov [bp-2], al
  9625 00004BFB B80000                   mov ax, 0
  9626 00004BFE A3[2600]                 mov word [spalte], ax
  9627                                  
  9628                                  ;-864   fgetsp++; spalte++;  return c; }
  9629                                  
  9630                                  @@fgets1574:
  9631 00004C01 FF06[6B00]               inc  word[fgetsp]
  9632 00004C05 FF06[2600]               inc  word[spalte]
  9633 00004C09 8A46FE                   mov al, [bp-2]
  9634 00004C0C E90000                   jmp @@retn
  9635                                  
  9636                                  ;-865 int printinputline() { fgetsp=&fgetsdest;
  9637                                  
  9638 00004C0F C9                      @@retn: LEAVE
  9639 00004C10 C3                       ret
  9640                                  ; ENDP
  9641                                  
  9642                                  printinputline:  ; *** PROC ***
  9643 00004C11 B80FD0                   mov ax, fgetsdest
  9644 00004C14 A3[6B00]                 mov word [fgetsp], ax
  9645                                  
  9646                                  ;-866   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);
  9647                                  
  9648                                  @@printinputline576:
  9649 00004C17 FF36[1F00]               push word [fdin]
  9650 00004C1B 8D06[7B00]               lea  ax, [DOS_ByteRead]
  9651 00004C1F 50                       push ax
  9652 00004C20 E8290F                   call readR
  9653 00004C23 83C404                   add  sp, 4
  9654 00004C26 A3[7900]                 mov word [DOS_NoBytes], ax
  9655                                  
  9656                                  ;-867   if (DOS_NoBytes == 0) return; 
  9657                                  
  9658 00004C29 A1[7900]                 mov ax, [DOS_NoBytes]
  9659 00004C2C 83F800                   cmp ax, 0
  9660 00004C2F 0F850300                 jne @@printinputline577
  9661 00004C33 E95400                   jmp @@retn
  9662                                  
  9663                                  ;-868     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9664                                  
  9665                                  @@printinputline577:
  9666 00004C36 A0[7B00]                 mov al, [DOS_ByteRead]
  9667 00004C39 8B1E[6B00]               mov  bx, [fgetsp]
  9668 00004C3D 8807                     mov  [bx], al
  9669 00004C3F FF06[6B00]               inc  word[fgetsp]
  9670                                  
  9671                                  ;-869   while (DOS_ByteRead != 10); *fgetsp=0;
  9672                                  
  9673 00004C43 A0[7B00]                 mov al, [DOS_ByteRead]
  9674 00004C46 3C0A                     cmp al, 10
  9675 00004C48 0F840200                 je  @@printinputline578
  9676 00004C4C EBC9                     jmp @@printinputline576
  9677                                  @@printinputline578:
  9678 00004C4E B80000                   mov ax, 0
  9679 00004C51 8B1E[6B00]               mov  bx, [fgetsp]
  9680 00004C55 8807                     mov  [bx], al
  9681                                  
  9682                                  ;-870     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9683                                  
  9684 00004C57 A1[2100]                 mov ax, [fdout]
  9685 00004C5A 08C0                     or  al, al
  9686 00004C5C 0F842A00                 je @@printinputline579
  9687 00004C60 68[8B4C]                 push printinputline_0
  9688 00004C63 E866FD                   call prs
  9689 00004C66 83C402                   add  sp, 2
  9690 00004C69 FF36[6F00]               push word [lineno]
  9691 00004C6D E8B6FE                   call prunsign1
  9692 00004C70 83C402                   add  sp, 2
  9693 00004C73 6A20                     push 32
  9694 00004C75 E8EDFC                   call prc
  9695 00004C78 83C402                   add  sp, 2
  9696 00004C7B FF06[6F00]               inc  word[lineno]
  9697                                  
  9698                                  ;-871       prscomment(&fgetsdest);}
  9699                                  
  9700 00004C7F 8D060FD0                 lea  ax, [fgetsdest]
  9701 00004C83 50                       push ax
  9702 00004C84 E809FD                   call prscomment
  9703 00004C87 83C402                   add  sp, 2
  9704                                  
  9705                                  ;-872 }
  9706                                  
  9707                                  @@printinputline579:
  9708                                  
  9709                                  ;-873 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9710                                  
  9711                                  @@retn:
  9712 00004C8A C3                       ret
  9713                                  ; ENDP
  9714 00004C8B 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9715                                  
  9716                                  end1:  ; *** PROC ***
  9717                                  ;Function : end1, Number of local variables: 1
  9718                                  ;   # type sign width addr used name   list of local variables
  9719                                  ;  200 var sign word   873 NULL n = bp+4;
  9720 00004C92 C8000000                 ENTER  0,0
  9721 00004C96 FF36[1F00]               push word [fdin]
  9722 00004C9A E8EE0E                   call fcloseR
  9723 00004C9D 83C402                   add  sp, 2
  9724 00004CA0 FF36[2100]               push word [fdout]
  9725 00004CA4 E8E40E                   call fcloseR
  9726 00004CA7 83C402                   add  sp, 2
  9727 00004CAA FF7604                   push word [bp+4]
  9728 00004CAD E8E90E                   call exitR
  9729 00004CB0 83C402                   add  sp, 2
  9730                                  
  9731                                  ;-874 int error1(char *s) { 
  9732 00004CB3 C9                       LEAVE
  9733 00004CB4 C3                       ret
  9734                                  ; ENDP
  9735                                  
  9736                                  error1:  ; *** PROC ***
  9737                                  
  9738                                  ;-875   lineno--;
  9739                                  
  9740                                  ;Function : error1, Number of local variables: 1
  9741                                  ;   # type sign width addr used name   list of local variables
  9742                                  ;  200 ptr sign byte   874 NULL s = bp+4;
  9743 00004CB5 C8000000                 ENTER  0,0
  9744 00004CB9 FF0E[6F00]               dec  word[lineno]
  9745                                  
  9746                                  ;-876   prnl(); prscomment(&fgetsdest);
  9747                                  
  9748 00004CBD E8FEFC                   call prnl
  9749 00004CC0 8D060FD0                 lea  ax, [fgetsdest]
  9750 00004CC4 50                       push ax
  9751 00004CC5 E8C8FC                   call prscomment
  9752 00004CC8 83C402                   add  sp, 2
  9753                                  
  9754                                  ;-877   prs(";Line: "); prunsign1(lineno);
  9755                                  
  9756 00004CCB 68[5E4D]                 push error1_0
  9757 00004CCE E8FBFC                   call prs
  9758 00004CD1 83C402                   add  sp, 2
  9759 00004CD4 FF36[6F00]               push word [lineno]
  9760 00004CD8 E84BFE                   call prunsign1
  9761 00004CDB 83C402                   add  sp, 2
  9762                                  
  9763                                  ;-878   prs(" ************** ERROR: "); prs(s);
  9764                                  
  9765 00004CDE 68[664D]                 push error1_1
  9766 00004CE1 E8E8FC                   call prs
  9767 00004CE4 83C402                   add  sp, 2
  9768 00004CE7 FF7604                   push word [bp+4]
  9769 00004CEA E8DFFC                   call prs
  9770 00004CED 83C402                   add  sp, 2
  9771                                  
  9772                                  ;-879   prs("  in column: "); pint1(spalte);
  9773                                  
  9774 00004CF0 68[7E4D]                 push error1_2
  9775 00004CF3 E8D6FC                   call prs
  9776 00004CF6 83C402                   add  sp, 2
  9777 00004CF9 FF36[2600]               push word [spalte]
  9778 00004CFD E8C3FD                   call pint1
  9779 00004D00 83C402                   add  sp, 2
  9780                                  
  9781                                  ;-880   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9782                                  
  9783 00004D03 68[8C4D]                 push error1_3
  9784 00004D06 E8C3FC                   call prs
  9785 00004D09 83C402                   add  sp, 2
  9786 00004D0C FF36[2300]               push word [token]
  9787 00004D10 E813FE                   call prunsign1
  9788 00004D13 83C402                   add  sp, 2
  9789 00004D16 68[964D]                 push error1_4
  9790 00004D19 E8B0FC                   call prs
  9791 00004D1C 83C402                   add  sp, 2
  9792 00004D1F A0[2500]                 mov al, byte [globC]
  9793 00004D22 B400                     mov ah, 0
  9794 00004D24 50                       push ax
  9795 00004D25 E83DFC                   call prc
  9796 00004D28 83C402                   add  sp, 2
  9797                                  
  9798                                  ;-881   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9799                                  
  9800 00004D2B 68[A04D]                 push error1_5
  9801 00004D2E E89BFC                   call prs
  9802 00004D31 83C402                   add  sp, 2
  9803 00004D34 A0[2800]                 mov al, byte [thechar]
  9804 00004D37 B400                     mov ah, 0
  9805 00004D39 50                       push ax
  9806 00004D3A E886FD                   call pint1
  9807 00004D3D 83C402                   add  sp, 2
  9808 00004D40 68[AC4D]                 push error1_6
  9809 00004D43 E886FC                   call prs
  9810 00004D46 83C402                   add  sp, 2
  9811 00004D49 8D062B81                 lea  ax, [symbol]
  9812 00004D4D 50                       push ax
  9813 00004D4E E87BFC                   call prs
  9814 00004D51 83C402                   add  sp, 2
  9815                                  
  9816                                  ;-882   end1(1); }
  9817                                  
  9818 00004D54 6A01                     push 1
  9819 00004D56 E839FF                   call end1
  9820 00004D59 83C402                   add  sp, 2
  9821                                  
  9822                                  ;-883 int listproc() {int i; 
  9823 00004D5C C9                       LEAVE
  9824 00004D5D C3                       ret
  9825                                  ; ENDP
  9826 00004D5E 3B4C696E653A2000        error1_0 db ";Line: ",0
  9827 00004D66 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9828 00004D6F 2A2A2A2A2A2A204552-
  9829 00004D78 524F523A2000       
  9830 00004D7E 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9831 00004D87 6D6E3A2000         
  9832 00004D8C 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9833 00004D95 00                 
  9834 00004D96 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9835 00004D9F 00                 
  9836 00004DA0 2C2074686563686172-     error1_5 db ", thechar: ",0
  9837 00004DA9 3A2000             
  9838 00004DAC 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9839 00004DB5 2000               
  9840                                  
  9841                                  listproc:  ; *** PROC ***
  9842                                  
  9843                                  ;-884   if (LTop > LSTART) {
  9844                                  
  9845                                  ;Function : listproc, Number of local variables: 1
  9846                                  ;   # type sign width addr used name   list of local variables
  9847                                  ;  200 var sign word   883 NULL i = bp-2;
  9848 00004DB7 C8020000                 ENTER  2,0
  9849 00004DBB A1[3500]                 mov ax, [LTop]
  9850 00004DBE 3DC800                   cmp ax, 200
  9851 00004DC1 0F8E5700                 jle @@listproc580
  9852                                  
  9853                                  ;-885   prs("\n;Function : "); prs(fname);
  9854                                  
  9855 00004DC5 68[1E4E]                 push listproc_0
  9856 00004DC8 E801FC                   call prs
  9857 00004DCB 83C402                   add  sp, 2
  9858 00004DCE 8D06AB81                 lea  ax, [fname]
  9859 00004DD2 50                       push ax
  9860 00004DD3 E8F6FB                   call prs
  9861 00004DD6 83C402                   add  sp, 2
  9862                                  
  9863                                  ;-886   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9864                                  
  9865 00004DD9 68[2D4E]                 push listproc_1
  9866 00004DDC E8EDFB                   call prs
  9867 00004DDF 83C402                   add  sp, 2
  9868 00004DE2 A1[3500]                 mov ax, [LTop]
  9869 00004DE5 2DC800                   sub ax, 200
  9870 00004DE8 8946FE                   mov [bp-2], ax
  9871 00004DEB FF76FE                   push word [bp-2]
  9872 00004DEE E835FD                   call prunsign1
  9873 00004DF1 83C402                   add  sp, 2
  9874                                  
  9875                                  ;-887   prs("\n;   # type sign width addr used name   list of local variables");
  9876                                  
  9877 00004DF4 68[4B4E]                 push listproc_2
  9878 00004DF7 E8D2FB                   call prs
  9879 00004DFA 83C402                   add  sp, 2
  9880                                  
  9881                                  ;-888     i=LSTART; 
  9882                                  
  9883 00004DFD B8C800                   mov ax, 200
  9884 00004E00 8946FE                   mov [bp-2], ax
  9885                                  
  9886                                  ;-889     while (i < LTop) { listvar(i); i++; } } 
  9887                                  
  9888                                  @@listproc581:
  9889 00004E03 8B46FE                   mov ax, [bp-2]
  9890 00004E06 3B06[3500]               cmp ax, [LTop]
  9891 00004E0A 0F8D0E00                 jge @@listproc582
  9892 00004E0E FF76FE                   push word [bp-2]
  9893 00004E11 E87800                   call listvar
  9894 00004E14 83C402                   add  sp, 2
  9895 00004E17 FF46FE                   inc  word[bp-2]
  9896 00004E1A EBE7                     jmp @@listproc581
  9897                                  @@listproc582:
  9898                                  
  9899                                  ;-890 }
  9900                                  
  9901                                  @@listproc580:
  9902                                  
  9903                                  ;-891 int listvar(unsigned int i) {unsigned int j; char c;
  9904 00004E1C C9                       LEAVE
  9905 00004E1D C3                       ret
  9906                                  ; ENDP
  9907 00004E1E 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9908 00004E27 6F6E203A2000       
  9909 00004E2D 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9910 00004E36 6F66206C6F63616C20-
  9911 00004E3F 7661726961626C6573-
  9912 00004E48 3A2000             
  9913 00004E4B 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9914 00004E54 797065207369676E20-
  9915 00004E5D 776964746820616464-
  9916 00004E66 722075736564206E61-
  9917 00004E6F 6D652020206C697374-
  9918 00004E78 206F66206C6F63616C-
  9919 00004E81 207661726961626C65-
  9920 00004E8A 7300               
  9921                                  
  9922                                  listvar:  ; *** PROC ***
  9923                                  
  9924                                  ;-892   prs("\n;"); printint51(i); prc(32);
  9925                                  
  9926                                  ;Function : listvar, Number of local variables: 3
  9927                                  ;   # type sign width addr used name   list of local variables
  9928                                  ;  200 var unsg word   891 NULL i = bp+4
  9929                                  ;  201 var unsg word   891 NULL j = bp-2
  9930                                  ;  202 var sign byte   891 NULL c = bp-4;
  9931 00004E8C C8040000                 ENTER  4,0
  9932 00004E90 68[7850]                 push listvar_0
  9933 00004E93 E836FB                   call prs
  9934 00004E96 83C402                   add  sp, 2
  9935 00004E99 FF7604                   push word [bp+4]
  9936 00004E9C E8C9FC                   call printint51
  9937 00004E9F 83C402                   add  sp, 2
  9938 00004EA2 6A20                     push 32
  9939 00004EA4 E8BEFA                   call prc
  9940 00004EA7 83C402                   add  sp, 2
  9941                                  
  9942                                  ;-893   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9943                                  
  9944 00004EAA 8B5E04                   mov bx, [bp+4]
  9945 00004EAD 8A87B782                 mov al, [GType + bx]
  9946 00004EB1 8846FC                   mov [bp-4], al
  9947 00004EB4 8A46FC                   mov al, [bp-4]
  9948 00004EB7 3C56                     cmp al, 86
  9949 00004EB9 0F850900                 jne @@listvar583
  9950 00004EBD 68[7C50]                 push listvar_1
  9951 00004EC0 E809FB                   call prs
  9952 00004EC3 83C402                   add  sp, 2
  9953                                  @@listvar583:
  9954 00004EC6 8A46FC                   mov al, [bp-4]
  9955 00004EC9 3C2A                     cmp al, 42
  9956 00004ECB 0F850900                 jne @@listvar584
  9957 00004ECF 68[8150]                 push listvar_2
  9958 00004ED2 E8F7FA                   call prs
  9959 00004ED5 83C402                   add  sp, 2
  9960                                  
  9961                                  ;-894                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9962                                  
  9963                                  @@listvar584:
  9964 00004ED8 8A46FC                   mov al, [bp-4]
  9965 00004EDB 3C26                     cmp al, 38
  9966 00004EDD 0F850900                 jne @@listvar585
  9967 00004EE1 68[8650]                 push listvar_3
  9968 00004EE4 E8E5FA                   call prs
  9969 00004EE7 83C402                   add  sp, 2
  9970                                  @@listvar585:
  9971 00004EEA 8A46FC                   mov al, [bp-4]
  9972 00004EED 3C23                     cmp al, 35
  9973 00004EEF 0F850900                 jne @@listvar586
  9974 00004EF3 68[8B50]                 push listvar_4
  9975 00004EF6 E8D3FA                   call prs
  9976 00004EF9 83C402                   add  sp, 2
  9977                                  
  9978                                  ;-895   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9979                                  
  9980                                  @@listvar586:
  9981 00004EFC 8B5E04                   mov bx, [bp+4]
  9982 00004EFF 8A87E383                 mov al, [GSign + bx]
  9983 00004F03 8846FC                   mov [bp-4], al
  9984 00004F06 8A46FC                   mov al, [bp-4]
  9985 00004F09 3C53                     cmp al, 83
  9986 00004F0B 0F850900                 jne @@listvar587
  9987 00004F0F 68[9050]                 push listvar_5
  9988 00004F12 E8B7FA                   call prs
  9989 00004F15 83C402                   add  sp, 2
  9990                                  @@listvar587:
  9991 00004F18 8A46FC                   mov al, [bp-4]
  9992 00004F1B 3C55                     cmp al, 85
  9993 00004F1D 0F850900                 jne @@listvar588
  9994 00004F21 68[9650]                 push listvar_6
  9995 00004F24 E8A5FA                   call prs
  9996 00004F27 83C402                   add  sp, 2
  9997                                  
  9998                                  ;-896   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9999                                  
 10000                                  @@listvar588:
 10001 00004F2A 8B5E04                   mov bx, [bp+4]
 10002 00004F2D 8A870F85                 mov al, [GWidth + bx]
 10003 00004F31 8846FC                   mov [bp-4], al
 10004 00004F34 8A46FC                   mov al, [bp-4]
 10005 00004F37 3C01                     cmp al, 1
 10006 00004F39 0F850900                 jne @@listvar589
 10007 00004F3D 68[9C50]                 push listvar_7
 10008 00004F40 E889FA                   call prs
 10009 00004F43 83C402                   add  sp, 2
 10010                                  @@listvar589:
 10011 00004F46 8A46FC                   mov al, [bp-4]
 10012 00004F49 3C02                     cmp al, 2
 10013 00004F4B 0F850900                 jne @@listvar590
 10014 00004F4F 68[A250]                 push listvar_8
 10015 00004F52 E877FA                   call prs
 10016 00004F55 83C402                   add  sp, 2
 10017                                  
 10018                                  ;-897                if(c==  4)prs("dwrd " );
 10019                                  
 10020                                  @@listvar590:
 10021 00004F58 8A46FC                   mov al, [bp-4]
 10022 00004F5B 3C04                     cmp al, 4
 10023 00004F5D 0F850900                 jne @@listvar591
 10024 00004F61 68[A850]                 push listvar_9
 10025 00004F64 E865FA                   call prs
 10026 00004F67 83C402                   add  sp, 2
 10027                                  
 10028                                  ;-898   j=GAdr[i]; printint51(j);
 10029                                  
 10030                                  @@listvar591:
 10031 00004F6A 8B5E04                   mov bx, [bp+4]
 10032 00004F6D D1E3                     shl bx, 1
 10033 00004F6F 8B873B86                 mov ax, [GAdr + bx]
 10034 00004F73 8946FE                   mov [bp-2], ax
 10035 00004F76 FF76FE                   push word [bp-2]
 10036 00004F79 E8ECFB                   call printint51
 10037 00004F7C 83C402                   add  sp, 2
 10038                                  
 10039                                  ;-899   j=GUsed[i]; if (j) printint51(j);
 10040                                  
 10041 00004F7F 8B5E04                   mov bx, [bp+4]
 10042 00004F82 D1E3                     shl bx, 1
 10043 00004F84 8B879388                 mov ax, [GUsed + bx]
 10044 00004F88 8946FE                   mov [bp-2], ax
 10045 00004F8B 8B46FE                   mov ax, [bp-2]
 10046 00004F8E 08C0                     or  al, al
 10047 00004F90 0F840C00                 je @@listvar592
 10048 00004F94 FF76FE                   push word [bp-2]
 10049 00004F97 E8CEFB                   call printint51
 10050 00004F9A 83C402                   add  sp, 2
 10051                                  
 10052                                  ;-900   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
 10053                                  
 10054 00004F9D E92200                   jmp @@listvar593
 10055                                  @@listvar592:
 10056 00004FA0 8B5E04                   mov bx, [bp+4]
 10057 00004FA3 8A87B782                 mov al, [GType + bx]
 10058 00004FA7 3C23                     cmp al, 35
 10059 00004FA9 0F850C00                 jne @@listvar594
 10060 00004FAD 68[AE50]                 push listvar_10
 10061 00004FB0 E819FA                   call prs
 10062 00004FB3 83C402                   add  sp, 2
 10063 00004FB6 E90900                   jmp @@listvar595
 10064                                  @@listvar594:
 10065 00004FB9 68[B450]                 push listvar_11
 10066 00004FBC E80DFA                   call prs
 10067 00004FBF 83C402                   add  sp, 2
 10068                                  @@listvar595:
 10069                                  
 10070                                  ;-901   prc(32);  pt=adrofname(i); prs(pt);
 10071                                  
 10072                                  @@listvar593:
 10073 00004FC2 6A20                     push 32
 10074 00004FC4 E89EF9                   call prc
 10075 00004FC7 83C402                   add  sp, 2
 10076 00004FCA FF7604                   push word [bp+4]
 10077 00004FCD E838B7                   call adrofname
 10078 00004FD0 83C402                   add  sp, 2
 10079 00004FD3 A3[7300]                 mov word [pt], ax
 10080 00004FD6 FF36[7300]               push word [pt]
 10081 00004FDA E8EFF9                   call prs
 10082 00004FDD 83C402                   add  sp, 2
 10083                                  
 10084                                  ;-902   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
 10085                                  
 10086 00004FE0 8B5E04                   mov bx, [bp+4]
 10087 00004FE3 8A87B782                 mov al, [GType + bx]
 10088 00004FE7 3C23                     cmp al, 35
 10089 00004FE9 0F851D00                 jne @@listvar596
 10090 00004FED 6A3D                     push 61
 10091 00004FEF E873F9                   call prc
 10092 00004FF2 83C402                   add  sp, 2
 10093 00004FF5 8B5E04                   mov bx, [bp+4]
 10094 00004FF8 D1E3                     shl bx, 1
 10095 00004FFA 8B87EB8A                 mov ax, [GData + bx]
 10096 00004FFE 8946FE                   mov [bp-2], ax
 10097 00005001 FF76FE                   push word [bp-2]
 10098 00005004 E81FFB                   call prunsign1
 10099 00005007 83C402                   add  sp, 2
 10100                                  
 10101                                  ;-903   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
 10102                                  
 10103                                  @@listvar596:
 10104 0000500A 8B5E04                   mov bx, [bp+4]
 10105 0000500D 8A87B782                 mov al, [GType + bx]
 10106 00005011 3C26                     cmp al, 38
 10107 00005013 0F852500                 jne @@listvar597
 10108 00005017 6A5B                     push 91
 10109 00005019 E849F9                   call prc
 10110 0000501C 83C402                   add  sp, 2
 10111 0000501F 8B5E04                   mov bx, [bp+4]
 10112 00005022 D1E3                     shl bx, 1
 10113 00005024 8B87EB8A                 mov ax, [GData + bx]
 10114 00005028 8946FE                   mov [bp-2], ax
 10115 0000502B FF76FE                   push word [bp-2]
 10116 0000502E E8F5FA                   call prunsign1
 10117 00005031 83C402                   add  sp, 2
 10118 00005034 6A5D                     push 93
 10119 00005036 E82CF9                   call prc
 10120 00005039 83C402                   add  sp, 2
 10121                                  
 10122                                  ;-904   if (i >= LSTART) { prs(" = bp"); j=GData[i];
 10123                                  
 10124                                  @@listvar597:
 10125 0000503C 8B4604                   mov ax, [bp+4]
 10126 0000503F 3DC800                   cmp ax, 200 ;unsigned : 0
 10127 00005042 0F823000                 jb  @@listvar598
 10128 00005046 68[BA50]                 push listvar_12
 10129 00005049 E880F9                   call prs
 10130 0000504C 83C402                   add  sp, 2
 10131 0000504F 8B5E04                   mov bx, [bp+4]
 10132 00005052 D1E3                     shl bx, 1
 10133 00005054 8B87EB8A                 mov ax, [GData + bx]
 10134 00005058 8946FE                   mov [bp-2], ax
 10135                                  
 10136                                  ;-905     if (j > 0) prc('+'); pint1(j);  }
 10137                                  
 10138 0000505B 8B46FE                   mov ax, [bp-2]
 10139 0000505E 83F800                   cmp ax, 0
 10140 00005061 0F8E0800                 jle @@listvar599
 10141 00005065 6A2B                     push 43
 10142 00005067 E8FBF8                   call prc
 10143 0000506A 83C402                   add  sp, 2
 10144                                  @@listvar599:
 10145 0000506D FF76FE                   push word [bp-2]
 10146 00005070 E850FA                   call pint1
 10147 00005073 83C402                   add  sp, 2
 10148                                  
 10149                                  ;-906 }
 10150                                  
 10151                                  @@listvar598:
 10152                                  
 10153                                  ;-907 int listcall() { int i;
 10154 00005076 C9                       LEAVE
 10155 00005077 C3                       ret
 10156                                  ; ENDP
 10157 00005078 5C6E3B00                listvar_0 db "\n;",0
 10158 0000507C 7661722000              listvar_1 db "var ",0
 10159 00005081 7074722000              listvar_2 db "ptr ",0
 10160 00005086 6172722000              listvar_3 db "arr ",0
 10161 0000508B 6465662000              listvar_4 db "def ",0
 10162 00005090 7369676E2000            listvar_5 db "sign ",0
 10163 00005096 756E73672000            listvar_6 db "unsg ",0
 10164 0000509C 627974652000            listvar_7 db "byte ",0
 10165 000050A2 776F72642000            listvar_8 db "word ",0
 10166 000050A8 647772642000            listvar_9 db "dwrd ",0
 10167 000050AE 202020202D00            listvar_10 db "    -",0
 10168 000050B4 204E554C4C00            listvar_11 db " NULL",0
 10169 000050BA 203D20627000            listvar_12 db " = bp",0
 10170                                  
 10171                                  listcall:  ; *** PROC ***
 10172                                  
 10173                                  ;-908   prs("\n\n;    #  addr name   list of CALLs\n");
 10174                                  
 10175                                  ;Function : listcall, Number of local variables: 1
 10176                                  ;   # type sign width addr used name   list of local variables
 10177                                  ;  200 var sign word   907 NULL i = bp-2;
 10178 000050C0 C8020000                 ENTER  2,0
 10179 000050C4 68[EE50]                 push listcall_0
 10180 000050C7 E802F9                   call prs
 10181 000050CA 83C402                   add  sp, 2
 10182                                  
 10183                                  ;-909   i=0;  while (i< CTop) { calllisting(i); i++; } }
 10184                                  
 10185 000050CD B80000                   mov ax, 0
 10186 000050D0 8946FE                   mov [bp-2], ax
 10187                                  @@listcall600:
 10188 000050D3 8B46FE                   mov ax, [bp-2]
 10189 000050D6 3B06[4600]               cmp ax, [CTop]
 10190 000050DA 0F8D0E00                 jge @@listcall601
 10191 000050DE FF76FE                   push word [bp-2]
 10192 000050E1 E83200                   call calllisting
 10193 000050E4 83C402                   add  sp, 2
 10194 000050E7 FF46FE                   inc  word[bp-2]
 10195 000050EA EBE7                     jmp @@listcall600
 10196                                  @@listcall601:
 10197                                  
 10198                                  ;-910 int calllisting(int i) {char c; int j;
 10199 000050EC C9                       LEAVE
 10200 000050ED C3                       ret
 10201                                  ; ENDP
 10202 000050EE 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
 10203 000050F7 23202061646472206E-
 10204 00005100 616D652020206C6973-
 10205 00005109 74206F662043414C4C-
 10206 00005112 735C6E00           
 10207                                  
 10208                                  calllisting:  ; *** PROC ***
 10209                                  
 10210                                  ;-911   prs("\n;"); printint51(i); prc(32);
 10211                                  
 10212                                  ;Function : calllisting, Number of local variables: 3
 10213                                  ;   # type sign width addr used name   list of local variables
 10214                                  ;  200 var sign word   910 NULL i = bp+4
 10215                                  ;  201 var sign byte   910 NULL c = bp-2
 10216                                  ;  202 var sign word   910 NULL j = bp-4;
 10217 00005116 C8040000                 ENTER  4,0
 10218 0000511A 68[8851]                 push calllisting_0
 10219 0000511D E8ACF8                   call prs
 10220 00005120 83C402                   add  sp, 2
 10221 00005123 FF7604                   push word [bp+4]
 10222 00005126 E83FFA                   call printint51
 10223 00005129 83C402                   add  sp, 2
 10224 0000512C 6A20                     push 32
 10225 0000512E E834F8                   call prc
 10226 00005131 83C402                   add  sp, 2
 10227                                  
 10228                                  ;-912   c=CType [i]; if(c==0)prs("unresolved ");
 10229                                  
 10230 00005134 8B5E04                   mov bx, [bp+4]
 10231 00005137 8A872FA1                 mov al, [CType + bx]
 10232 0000513B 8846FE                   mov [bp-2], al
 10233 0000513E 8A46FE                   mov al, [bp-2]
 10234 00005141 3C00                     cmp al, 0
 10235 00005143 0F850900                 jne @@calllisting602
 10236 00005147 68[8C51]                 push calllisting_1
 10237 0000514A E87FF8                   call prs
 10238 0000514D 83C402                   add  sp, 2
 10239                                  
 10240                                  ;-913   j=CAdr[i];            printint51(j); prc(32);
 10241                                  
 10242                                  @@calllisting602:
 10243 00005150 8B5E04                   mov bx, [bp+4]
 10244 00005153 D1E3                     shl bx, 1
 10245 00005155 8B8757AB                 mov ax, [CAdr + bx]
 10246 00005159 8946FC                   mov [bp-4], ax
 10247 0000515C FF76FC                   push word [bp-4]
 10248 0000515F E806FA                   call printint51
 10249 00005162 83C402                   add  sp, 2
 10250 00005165 6A20                     push 32
 10251 00005167 E8FBF7                   call prc
 10252 0000516A 83C402                   add  sp, 2
 10253                                  
 10254                                  ;-914   from_far(NameA, j);   prs(NameA);
 10255                                  
 10256 0000516D FF76FC                   push word [bp-4]
 10257 00005170 8D06[4800]               lea  ax, [NameA]
 10258 00005174 50                       push ax
 10259 00005175 E8CA06                   call from_far
 10260 00005178 83C404                   add  sp, 4
 10261 0000517B 8D06[4800]               lea  ax, [NameA]
 10262 0000517F 50                       push ax
 10263 00005180 E849F8                   call prs
 10264 00005183 83C402                   add  sp, 2
 10265                                  
 10266                                  ;-915 }
 10267                                  
 10268                                  
 10269                                  ;-916 int countcalls(int f) { unsigned int i;
 10270 00005186 C9                       LEAVE
 10271 00005187 C3                       ret
 10272                                  ; ENDP
 10273 00005188 5C6E3B00                calllisting_0 db "\n;",0
 10274 0000518C 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10275 00005195 642000             
 10276                                  
 10277                                  countcalls:  ; *** PROC ***
 10278                                  
 10279                                  ;-917   pt=adrF(FNameField, f);
 10280                                  
 10281                                  ;Function : countcalls, Number of local variables: 2
 10282                                  ;   # type sign width addr used name   list of local variables
 10283                                  ;  200 var sign word   916 NULL f = bp+4
 10284                                  ;  201 var unsg word   916 NULL i = bp-2;
 10285 00005198 C8020000                 ENTER  2,0
 10286 0000519C FF7604                   push word [bp+4]
 10287 0000519F 8D064FBD                 lea  ax, [FNameField]
 10288 000051A3 50                       push ax
 10289 000051A4 E875B5                   call adrF
 10290 000051A7 83C404                   add  sp, 4
 10291 000051AA A3[7300]                 mov word [pt], ax
 10292                                  
 10293                                  ;-918   i=0;  while (i < CTop) {
 10294                                  
 10295 000051AD B80000                   mov ax, 0
 10296 000051B0 8946FE                   mov [bp-2], ax
 10297                                  @@countcalls603:
 10298 000051B3 8B46FE                   mov ax, [bp-2]
 10299 000051B6 3B06[4600]               cmp ax, [CTop]
 10300 000051BA 0F8D4A00                 jge @@countcalls604
 10301                                  
 10302                                  ;-919     p1=CAdr[i];
 10303                                  
 10304 000051BE 8B5EFE                   mov bx, [bp-2]
 10305 000051C1 D1E3                     shl bx, 1
 10306 000051C3 8B8757AB                 mov ax, [CAdr + bx]
 10307 000051C7 A3[7500]                 mov word [p1], ax
 10308                                  
 10309                                  ;-920     from_far(NameA, p1);
 10310                                  
 10311 000051CA FF36[7500]               push word [p1]
 10312 000051CE 8D06[4800]               lea  ax, [NameA]
 10313 000051D2 50                       push ax
 10314 000051D3 E86C06                   call from_far
 10315 000051D6 83C404                   add  sp, 4
 10316                                  
 10317                                  ;-921     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10318                                  
 10319 000051D9 8D06[4800]               lea  ax, [NameA]
 10320 000051DD 50                       push ax
 10321 000051DE FF36[7300]               push word [pt]
 10322 000051E2 E8CC08                   call eqstr
 10323 000051E5 83C404                   add  sp, 4
 10324 000051E8 08C0                     or  al, al
 10325 000051EA 0F841500                 je @@countcalls605
 10326 000051EE 8B5E04                   mov bx, [bp+4]
 10327 000051F1 D1E3                     shl bx, 1
 10328 000051F3 8B87F7BA                 mov ax, [FCalls + bx]
 10329 000051F7 83C001                   add ax, 1
 10330 000051FA 8B5E04                   mov bx, [bp+4]
 10331 000051FD D1E3                     shl bx, 1
 10332 000051FF 8987F7BA                 mov [FCalls+bx], ax
 10333                                  
 10334                                  ;-922     i++; }
 10335                                  
 10336                                  @@countcalls605:
 10337 00005203 FF46FE                   inc  word[bp-2]
 10338                                  
 10339                                  ;-923 }
 10340                                  
 10341 00005206 EBAB                     jmp @@countcalls603
 10342                                  @@countcalls604:
 10343                                  
 10344                                  ;-924 int listfunc() { int i;
 10345 00005208 C9                       LEAVE
 10346 00005209 C3                       ret
 10347                                  ; ENDP
 10348                                  
 10349                                  listfunc:  ; *** PROC ***
 10350                                  
 10351                                  ;-925   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10352                                  
 10353                                  ;Function : listfunc, Number of local variables: 1
 10354                                  ;   # type sign width addr used name   list of local variables
 10355                                  ;  200 var sign word   924 NULL i = bp-2;
 10356 0000520A C8020000                 ENTER  2,0
 10357 0000520E 68[5752]                 push listfunc_0
 10358 00005211 E8B8F7                   call prs
 10359 00005214 83C402                   add  sp, 2
 10360                                  
 10361                                  ;-926   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10362                                  
 10363 00005217 B80000                   mov ax, 0
 10364 0000521A 8946FE                   mov [bp-2], ax
 10365                                  @@listfunc606:
 10366 0000521D 8B46FE                   mov ax, [bp-2]
 10367 00005220 3B06[4400]               cmp ax, [FTop]
 10368 00005224 0F8D0E00                 jge @@listfunc607
 10369 00005228 FF76FE                   push word [bp-2]
 10370 0000522B E86AFF                   call countcalls
 10371 0000522E 83C402                   add  sp, 2
 10372 00005231 FF46FE                   inc  word[bp-2]
 10373                                  
 10374                                  ;-927   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10375                                  
 10376 00005234 EBE7                     jmp @@listfunc606
 10377                                  @@listfunc607:
 10378 00005236 B80000                   mov ax, 0
 10379 00005239 8946FE                   mov [bp-2], ax
 10380                                  @@listfunc608:
 10381 0000523C 8B46FE                   mov ax, [bp-2]
 10382 0000523F 3B06[4400]               cmp ax, [FTop]
 10383 00005243 0F8D0E00                 jge @@listfunc609
 10384 00005247 FF76FE                   push word [bp-2]
 10385 0000524A E84300                   call funclisting
 10386 0000524D 83C402                   add  sp, 2
 10387 00005250 FF46FE                   inc  word[bp-2]
 10388 00005253 EBE7                     jmp @@listfunc608
 10389                                  @@listfunc609:
 10390                                  
 10391                                  ;-928 int funclisting(int i) {int j;  char c;
 10392 00005255 C9                       LEAVE
 10393 00005256 C3                       ret
 10394                                  ; ENDP
 10395 00005257 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10396 00005260 20232043616C6C7320-
 10397 00005269 4C696E652057696474-
 10398 00005272 6820204E616D652020-
 10399 0000527B 206C697374206F6620-
 10400 00005284 66756E6374696F6E73-
 10401 0000528D 5C6E00             
 10402                                  
 10403                                  funclisting:  ; *** PROC ***
 10404                                  
 10405                                  ;-929   prs("\n;");    printint51(i);
 10406                                  
 10407                                  ;Function : funclisting, Number of local variables: 3
 10408                                  ;   # type sign width addr used name   list of local variables
 10409                                  ;  200 var sign word   928 NULL i = bp+4
 10410                                  ;  201 var sign word   928 NULL j = bp-2
 10411                                  ;  202 var sign byte   928 NULL c = bp-4;
 10412 00005290 C8040000                 ENTER  4,0
 10413 00005294 68[6C53]                 push funclisting_0
 10414 00005297 E832F7                   call prs
 10415 0000529A 83C402                   add  sp, 2
 10416 0000529D FF7604                   push word [bp+4]
 10417 000052A0 E8C5F8                   call printint51
 10418 000052A3 83C402                   add  sp, 2
 10419                                  
 10420                                  ;-930   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10421                                  
 10422 000052A6 8B5E04                   mov bx, [bp+4]
 10423 000052A9 D1E3                     shl bx, 1
 10424 000052AB 8B87F7BA                 mov ax, [FCalls + bx]
 10425 000052AF 8946FE                   mov [bp-2], ax
 10426 000052B2 8B46FE                   mov ax, [bp-2]
 10427 000052B5 08C0                     or  al, al
 10428 000052B7 0F840C00                 je @@funclisting610
 10429 000052BB FF76FE                   push word [bp-2]
 10430 000052BE E8A7F8                   call printint51
 10431 000052C1 83C402                   add  sp, 2
 10432 000052C4 E90900                   jmp @@funclisting611
 10433                                  @@funclisting610:
 10434 000052C7 68[7053]                 push funclisting_1
 10435 000052CA E8FFF6                   call prs
 10436 000052CD 83C402                   add  sp, 2
 10437                                  
 10438                                  ;-931   j = FAdr[i];   printint51(j); prc(32);
 10439                                  
 10440                                  @@funclisting611:
 10441 000052D0 8B5E04                   mov bx, [bp+4]
 10442 000052D3 D1E3                     shl bx, 1
 10443 000052D5 8B87FFA8                 mov ax, [FAdr + bx]
 10444 000052D9 8946FE                   mov [bp-2], ax
 10445 000052DC FF76FE                   push word [bp-2]
 10446 000052DF E886F8                   call printint51
 10447 000052E2 83C402                   add  sp, 2
 10448 000052E5 6A20                     push 32
 10449 000052E7 E87BF6                   call prc
 10450 000052EA 83C402                   add  sp, 2
 10451                                  
 10452                                  ;-932   c=FType[i];
 10453                                  
 10454 000052ED 8B5E04                   mov bx, [bp+4]
 10455 000052F0 8A8703A0                 mov al, [FType + bx]
 10456 000052F4 8846FC                   mov [bp-4], al
 10457                                  
 10458                                  ;-933   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10459                                  
 10460 000052F7 8A46FC                   mov al, [bp-4]
 10461 000052FA 3C56                     cmp al, 86
 10462 000052FC 0F850900                 jne @@funclisting612
 10463 00005300 68[7653]                 push funclisting_2
 10464 00005303 E8C6F6                   call prs
 10465 00005306 83C402                   add  sp, 2
 10466                                  @@funclisting612:
 10467 00005309 8A46FC                   mov al, [bp-4]
 10468 0000530C 3C42                     cmp al, 66
 10469 0000530E 0F850900                 jne @@funclisting613
 10470 00005312 68[7C53]                 push funclisting_3
 10471 00005315 E8B4F6                   call prs
 10472 00005318 83C402                   add  sp, 2
 10473                                  
 10474                                  ;-934   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10475                                  
 10476                                  @@funclisting613:
 10477 0000531B 8A46FC                   mov al, [bp-4]
 10478 0000531E 3C57                     cmp al, 87
 10479 00005320 0F850900                 jne @@funclisting614
 10480 00005324 68[8253]                 push funclisting_4
 10481 00005327 E8A2F6                   call prs
 10482 0000532A 83C402                   add  sp, 2
 10483                                  @@funclisting614:
 10484 0000532D 8A46FC                   mov al, [bp-4]
 10485 00005330 3C44                     cmp al, 68
 10486 00005332 0F850900                 jne @@funclisting615
 10487 00005336 68[8853]                 push funclisting_5
 10488 00005339 E890F6                   call prs
 10489 0000533C 83C402                   add  sp, 2
 10490                                  
 10491                                  ;-935   prc(32); prc(32);
 10492                                  
 10493                                  @@funclisting615:
 10494 0000533F 6A20                     push 32
 10495 00005341 E821F6                   call prc
 10496 00005344 83C402                   add  sp, 2
 10497 00005347 6A20                     push 32
 10498 00005349 E819F6                   call prc
 10499 0000534C 83C402                   add  sp, 2
 10500                                  
 10501                                  ;-936   pt=adrF(FNameField, i); prs(pt);
 10502                                  
 10503 0000534F FF7604                   push word [bp+4]
 10504 00005352 8D064FBD                 lea  ax, [FNameField]
 10505 00005356 50                       push ax
 10506 00005357 E8C2B3                   call adrF
 10507 0000535A 83C404                   add  sp, 4
 10508 0000535D A3[7300]                 mov word [pt], ax
 10509 00005360 FF36[7300]               push word [pt]
 10510 00005364 E865F6                   call prs
 10511 00005367 83C402                   add  sp, 2
 10512                                  
 10513                                  ;-937 }
 10514                                  
 10515                                  
 10516                                  ;-938 unsigned int MAXUI=65535;
 10517 0000536A C9                       LEAVE
 10518 0000536B C3                       ret
 10519                                  ; ENDP
 10520 0000536C 5C6E3B00                funclisting_0 db "\n;",0
 10521 00005370 204E554C4C00            funclisting_1 db " NULL",0
 10522 00005376 766F69642000            funclisting_2 db "void ",0
 10523 0000537C 627974652000            funclisting_3 db "byte ",0
 10524 00005382 776F72642000            funclisting_4 db "word ",0
 10525 00005388 647772642000            funclisting_5 db "dwrd ",0
 10526 0000538E FFFF                    MAXUI dw 65535
 10527                                  
 10528                                  ;-939 int epilog() {unsigned int i; 
 10529                                  
 10530                                  
 10531                                  epilog:  ; *** PROC ***
 10532                                  
 10533                                  ;-940   strcpy(symbol, "LastFunctionByt");  storefunc();
 10534                                  
 10535                                  ;Function : epilog, Number of local variables: 1
 10536                                  ;   # type sign width addr used name   list of local variables
 10537                                  ;  200 var unsg word   939 NULL i = bp-2;
 10538 00005390 C8020000                 ENTER  2,0
 10539 00005394 68[D355]                 push epilog_0
 10540 00005397 8D062B81                 lea  ax, [symbol]
 10541 0000539B 50                       push ax
 10542 0000539C E8EB05                   call strcpy
 10543 0000539F 83C404                   add  sp, 4
 10544 000053A2 E882B6                   call storefunc
 10545                                  
 10546                                  ;-941   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10547                                  
 10548 000053A5 68[E355]                 push epilog_1
 10549 000053A8 E821F6                   call prs
 10550 000053AB 83C402                   add  sp, 2
 10551                                  
 10552                                  ;-942   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10553                                  
 10554 000053AE 68[1056]                 push epilog_2
 10555 000053B1 E818F6                   call prs
 10556 000053B4 83C402                   add  sp, 2
 10557                                  
 10558                                  ;-943   i=1;
 10559                                  
 10560 000053B7 B80100                   mov ax, 1
 10561 000053BA 8946FE                   mov [bp-2], ax
 10562                                  
 10563                                  ;-944   while (i< GTop) { listvar(i); i++; }
 10564                                  
 10565                                  @@epilog616:
 10566 000053BD 8B46FE                   mov ax, [bp-2]
 10567 000053C0 3B06[3300]               cmp ax, [GTop]
 10568 000053C4 0F8D0E00                 jge @@epilog617
 10569 000053C8 FF76FE                   push word [bp-2]
 10570 000053CB E8BEFA                   call listvar
 10571 000053CE 83C402                   add  sp, 2
 10572 000053D1 FF46FE                   inc  word[bp-2]
 10573                                  
 10574                                  ;-945   listfunc();   listcall();
 10575                                  
 10576 000053D4 EBE7                     jmp @@epilog616
 10577                                  @@epilog617:
 10578 000053D6 E831FE                   call listfunc
 10579 000053D9 E8E4FC                   call listcall
 10580                                  
 10581                                  ;-946 
 10582                                  
 10583                                  
 10584                                  ;-947   prs("\n;Input: "); prs(&namein);
 10585                                  
 10586 000053DC 68[5756]                 push epilog_3
 10587 000053DF E8EAF5                   call prs
 10588 000053E2 83C402                   add  sp, 2
 10589 000053E5 8D06EE81                 lea  ax, [namein]
 10590 000053E9 50                       push ax
 10591 000053EA E8DFF5                   call prs
 10592 000053ED 83C402                   add  sp, 2
 10593                                  
 10594                                  ;-948   prs(", List: ");   prs(&namelst);
 10595                                  
 10596 000053F0 68[6256]                 push epilog_4
 10597 000053F3 E8D6F5                   call prs
 10598 000053F6 83C402                   add  sp, 2
 10599 000053F9 8D063182                 lea  ax, [namelst]
 10600 000053FD 50                       push ax
 10601 000053FE E8CBF5                   call prs
 10602 00005401 83C402                   add  sp, 2
 10603                                  
 10604                                  ;-949   prs(",  Lines:"); printint51(lineno);
 10605                                  
 10606 00005404 68[6B56]                 push epilog_5
 10607 00005407 E8C2F5                   call prs
 10608 0000540A 83C402                   add  sp, 2
 10609 0000540D FF36[6F00]               push word [lineno]
 10610 00005411 E854F7                   call printint51
 10611 00005414 83C402                   add  sp, 2
 10612                                  
 10613                                  ;-950   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10614                                  
 10615 00005417 68[7556]                 push epilog_6
 10616 0000541A E8AFF5                   call prs
 10617 0000541D 83C402                   add  sp, 2
 10618 00005420 FF0E[3300]               dec  word[GTop]
 10619 00005424 FF36[3300]               push word [GTop]
 10620 00005428 E83DF7                   call printint51
 10621 0000542B 83C402                   add  sp, 2
 10622                                  
 10623                                  ;-951   prs(" max.:"); printint51(LSTART);
 10624                                  
 10625 0000542E 68[8956]                 push epilog_7
 10626 00005431 E898F5                   call prs
 10627 00005434 83C402                   add  sp, 2
 10628 00005437 68C800                   push 200
 10629 0000543A E82BF7                   call printint51
 10630 0000543D 83C402                   add  sp, 2
 10631                                  
 10632                                  ;-952   prs("\n;Functions      :"); printint51(FTop);
 10633                                  
 10634 00005440 68[9056]                 push epilog_8
 10635 00005443 E886F5                   call prs
 10636 00005446 83C402                   add  sp, 2
 10637 00005449 FF36[4400]               push word [FTop]
 10638 0000544D E818F7                   call printint51
 10639 00005450 83C402                   add  sp, 2
 10640                                  
 10641                                  ;-953   prs(" max.:"); printint51(FUNCMAX);
 10642                                  
 10643 00005453 68[A456]                 push epilog_9
 10644 00005456 E873F5                   call prs
 10645 00005459 83C402                   add  sp, 2
 10646 0000545C 682C01                   push 300
 10647 0000545F E806F7                   call printint51
 10648 00005462 83C402                   add  sp, 2
 10649                                  
 10650                                  ;-954   prs("\n;Calls          :"); printint51(CTop);
 10651                                  
 10652 00005465 68[AB56]                 push epilog_10
 10653 00005468 E861F5                   call prs
 10654 0000546B 83C402                   add  sp, 2
 10655 0000546E FF36[4600]               push word [CTop]
 10656 00005472 E8F3F6                   call printint51
 10657 00005475 83C402                   add  sp, 2
 10658                                  
 10659                                  ;-955   prs(" max.:"); printint51(CALLMAX);
 10660                                  
 10661 00005478 68[BF56]                 push epilog_11
 10662 0000547B E84EF5                   call prs
 10663 0000547E 83C402                   add  sp, 2
 10664 00005481 68D007                   push 2000
 10665 00005484 E8E1F6                   call printint51
 10666 00005487 83C402                   add  sp, 2
 10667                                  
 10668                                  ;-956   prs(", NameField:"); printint51(CNameTop);
 10669                                  
 10670 0000548A 68[C656]                 push epilog_12
 10671 0000548D E83CF5                   call prs
 10672 00005490 83C402                   add  sp, 2
 10673 00005493 FF36[6900]               push word [CNameTop]
 10674 00005497 E8CEF6                   call printint51
 10675 0000549A 83C402                   add  sp, 2
 10676                                  
 10677                                  ;-957   prs(" max.:"); printint51(65535);
 10678                                  
 10679 0000549D 68[D356]                 push epilog_13
 10680 000054A0 E829F5                   call prs
 10681 000054A3 83C402                   add  sp, 2
 10682 000054A6 6AFF                     push -1
 10683 000054A8 E8BDF6                   call printint51
 10684 000054AB 83C402                   add  sp, 2
 10685                                  
 10686                                  ;-958 //  prs(", segE:"); printint51(segE);
 10687                                  
 10688                                  
 10689                                  ;-959   __asm{call LastFunctionByt}  _ i=ax;
 10690                                  
 10691 000054AE E8F506                  call LastFunctionByt
 10692 000054B1 8946FE                  mov [bp-2], ax
 10693                                  
 10694                                  ;-960   prs("\n;Code until     :"); printint51(i);
 10695                                  
 10696 000054B4 68[DA56]                 push epilog_14
 10697 000054B7 E812F5                   call prs
 10698 000054BA 83C402                   add  sp, 2
 10699 000054BD FF76FE                   push word [bp-2]
 10700 000054C0 E8A5F6                   call printint51
 10701 000054C3 83C402                   add  sp, 2
 10702                                  
 10703                                  ;-961   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10704                                  
 10705 000054C6 68[EE56]                 push epilog_15
 10706 000054C9 E800F5                   call prs
 10707 000054CC 83C402                   add  sp, 2
 10708 000054CF FF36[1500]               push word [ORGDATAORIG]
 10709 000054D3 E892F6                   call printint51
 10710 000054D6 83C402                   add  sp, 2
 10711 000054D9 A1[1500]                 mov ax, [ORGDATAORIG]
 10712 000054DC 2B46FE                   sub ax, [bp-2]
 10713 000054DF 8946FE                   mov [bp-2], ax
 10714 000054E2 68[F656]                 push epilog_16
 10715 000054E5 E8E4F4                   call prs
 10716 000054E8 83C402                   add  sp, 2
 10717                                  
 10718                                  ;-962   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10719                                  
 10720 000054EB FF76FE                   push word [bp-2]
 10721 000054EE E877F6                   call printint51
 10722 000054F1 83C402                   add  sp, 2
 10723 000054F4 8B46FE                   mov ax, [bp-2]
 10724 000054F7 3DE803                   cmp ax, 1000
 10725 000054FA 0F870900                 ja  @@epilog618
 10726 000054FE 68[FE56]                 push epilog_17
 10727 00005501 E8C8F4                   call prs
 10728 00005504 83C402                   add  sp, 2
 10729                                  
 10730                                  ;-963   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10731                                  
 10732                                  @@epilog618:
 10733 00005507 68[2357]                 push epilog_18
 10734 0000550A E8BFF4                   call prs
 10735 0000550D 83C402                   add  sp, 2
 10736 00005510 FF36[1700]               push word [orgData]
 10737 00005514 E80FF6                   call prunsign1
 10738 00005517 83C402                   add  sp, 2
 10739 0000551A A1[8E53]                 mov ax, [MAXUI]
 10740 0000551D 2B06[1700]               sub ax, [orgData]
 10741 00005521 8946FE                   mov [bp-2], ax
 10742                                  
 10743                                  ;-964   prs(", resting stacksize: ");printint51(i);
 10744                                  
 10745 00005524 68[3757]                 push epilog_19
 10746 00005527 E8A2F4                   call prs
 10747 0000552A 83C402                   add  sp, 2
 10748 0000552D FF76FE                   push word [bp-2]
 10749 00005530 E835F6                   call printint51
 10750 00005533 83C402                   add  sp, 2
 10751                                  
 10752                                  ;-965   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10753                                  
 10754 00005536 8B46FE                   mov ax, [bp-2]
 10755 00005539 3D8813                   cmp ax, 5000
 10756 0000553C 0F870900                 ja  @@epilog619
 10757 00005540 68[4D57]                 push epilog_20
 10758 00005543 E886F4                   call prs
 10759 00005546 83C402                   add  sp, 2
 10760                                  
 10761                                  ;-966   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10762                                  
 10763                                  @@epilog619:
 10764 00005549 68[6E57]                 push epilog_21
 10765 0000554C E87DF4                   call prs
 10766 0000554F 83C402                   add  sp, 2
 10767 00005552 8D06E880                 lea  ax, [coname]
 10768 00005556 50                       push ax
 10769 00005557 E872F4                   call prs
 10770 0000555A 83C402                   add  sp, 2
 10771 0000555D 68[8157]                 push epilog_22
 10772 00005560 E869F4                   call prs
 10773 00005563 83C402                   add  sp, 2
 10774 00005566 FF36[1900]               push word [maxco]
 10775 0000556A E8FBF5                   call printint51
 10776 0000556D 83C402                   add  sp, 2
 10777                                  
 10778                                  ;-967   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10779                                  
 10780 00005570 68[8557]                 push epilog_23
 10781 00005573 E856F4                   call prs
 10782 00005576 83C402                   add  sp, 2
 10783 00005579 68B80B                   push 3000
 10784 0000557C E8E9F5                   call printint51
 10785 0000557F 83C402                   add  sp, 2
 10786 00005582 B8B80B                   mov ax, 3000
 10787 00005585 8946FE                   mov [bp-2], ax
 10788 00005588 8B46FE                   mov ax, [bp-2]
 10789 0000558B 2B06[1900]               sub ax, [maxco]
 10790 0000558F 8946FE                   mov [bp-2], ax
 10791 00005592 68[8B57]                 push epilog_24
 10792 00005595 E834F4                   call prs
 10793 00005598 83C402                   add  sp, 2
 10794                                  
 10795                                  ;-968   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10796                                  
 10797 0000559B FF76FE                   push word [bp-2]
 10798 0000559E E8C7F5                   call printint51
 10799 000055A1 83C402                   add  sp, 2
 10800 000055A4 8B46FE                   mov ax, [bp-2]
 10801 000055A7 3DE803                   cmp ax, 1000
 10802 000055AA 0F870900                 ja  @@epilog620
 10803 000055AE 68[9357]                 push epilog_25
 10804 000055B1 E818F4                   call prs
 10805 000055B4 83C402                   add  sp, 2
 10806                                  
 10807                                  ;-969   if(NASM==0)prs("\nEND");end1(0);}
 10808                                  
 10809                                  @@epilog620:
 10810 000055B7 A0[1400]                 mov al, [NASM]
 10811 000055BA 3C00                     cmp al, 0
 10812 000055BC 0F850900                 jne @@epilog621
 10813 000055C0 68[BC57]                 push epilog_26
 10814 000055C3 E806F4                   call prs
 10815 000055C6 83C402                   add  sp, 2
 10816                                  @@epilog621:
 10817 000055C9 6A00                     push 0
 10818 000055CB E8C4F6                   call end1
 10819 000055CE 83C402                   add  sp, 2
 10820                                  
 10821                                  ;-970 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10822                                  
 10823                                  
 10824                                  ;-971 int setblock(unsigned int i) {
 10825 000055D1 C9                       LEAVE
 10826 000055D2 C3                       ret
 10827                                  ; ENDP
 10828 000055D3 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10829 000055DC 696F6E42797400     
 10830 000055E3 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10831 000055EC 6374696F6E4279743A-
 10832 000055F5 646220304538682C20-
 10833 000055FE 302C20305C6E706F70-
 10834 00005607 2061785C6E72657400 
 10835 00005610 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10836 00005619 232074797065207369-
 10837 00005622 676E20776964746820-
 10838 0000562B 206164722075736564-
 10839 00005634 206E616D652020206C-
 10840 0000563D 697374206F6620676C-
 10841 00005646 6F62616C2076617269-
 10842 0000564F 61626C65735C6E00   
 10843 00005657 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10844 00005660 2000               
 10845 00005662 2C204C6973743A2000      epilog_4 db ", List: ",0
 10846 0000566B 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10847 00005674 00                 
 10848 00005675 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10849 0000567E 7661726961626C6573-
 10850 00005687 3A00               
 10851 00005689 206D61782E3A00          epilog_7 db " max.:",0
 10852 00005690 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10853 00005699 6F6E73202020202020-
 10854 000056A2 3A00               
 10855 000056A4 206D61782E3A00          epilog_9 db " max.:",0
 10856 000056AB 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10857 000056B4 202020202020202020-
 10858 000056BD 3A00               
 10859 000056BF 206D61782E3A00          epilog_11 db " max.:",0
 10860 000056C6 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10861 000056CF 6C643A00           
 10862 000056D3 206D61782E3A00          epilog_13 db " max.:",0
 10863 000056DA 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10864 000056E3 6E74696C2020202020-
 10865 000056EC 3A00               
 10866 000056EE 206D61782E3A2000        epilog_15 db " max.: ",0
 10867 000056F6 2C20667265653A00        epilog_16 db ", free:",0
 10868 000056FE 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10869 00005707 696E67202A2A2A2043-
 10870 00005710 6F6465206172656120-
 10871 00005719 746F6F20736D616C6C-
 10872 00005722 00                 
 10873 00005723 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10874 0000572C 48656170456E642920-
 10875 00005735 3A00               
 10876 00005737 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10877 00005740 20737461636B73697A-
 10878 00005749 653A2000           
 10879 0000574D 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10880 00005756 696E67202A2A2A2053-
 10881 0000575F 7461636B20746F6F20-
 10882 00005768 736D616C6C00       
 10883 0000576E 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10884 00005777 6F6E737420696E2027-
 10885 00005780 00                 
 10886 00005781 27203A00                epilog_22 db "' :",0
 10887 00005785 206D61782E00            epilog_23 db " max.",0
 10888 0000578B 2C20667265653A00        epilog_24 db ", free:",0
 10889 00005793 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10890 0000579C 696E67202A2A2A2063-
 10891 000057A5 6F6E7374616E742061-
 10892 000057AE 72656120746F6F2073-
 10893 000057B7 6D616C6C00         
 10894 000057BC 5C6E454E4400            epilog_26 db "\nEND",0
 10895                                  
 10896                                  setblock:  ; *** PROC ***
 10897                                  
 10898                                  ;-972   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10899                                  
 10900                                  ;Function : setblock, Number of local variables: 1
 10901                                  ;   # type sign width addr used name   list of local variables
 10902                                  ;  200 var unsg word   971 NULL i = bp+4;
 10903 000057C2 C8000000                 ENTER  0,0
 10904 000057C6 B80000                   mov ax, 0
 10905 000057C9 A3[7700]                 mov word [DOS_ERR], ax
 10906 000057CC 8B5E04                   mov  bx, [bp+4]
 10907 000057CF 8CC8                     mov  ax, cs
 10908 000057D1 8EC0                     mov  es, ax
 10909 000057D3 B8004A                   mov  ax, 18944
 10910 000057D6 E84903                   call DosInt
 10911                                  
 10912                                  ;-973 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10913 000057D9 C9                       LEAVE
 10914 000057DA C3                       ret
 10915                                  ; ENDP
 10916                                  
 10917                                  allocmem:  ; *** PROC ***
 10918                                  
 10919                                  ;-974   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10920                                  
 10921                                  ;Function : allocmem, Number of local variables: 3
 10922                                  ;   # type sign width addr used name   list of local variables
 10923                                  ;  200 var unsg word   973 NULL i = bp+4
 10924                                  ;  201 var unsg word   973 NULL vAX = bp-2
 10925                                  ;  202 var unsg word   973 NULL vBX = bp-4;
 10926 000057DB C8040000                 ENTER  4,0
 10927 000057DF B80000                   mov ax, 0
 10928 000057E2 A3[7700]                 mov word [DOS_ERR], ax
 10929 000057E5 8B5E04                   mov  bx, [bp+4]
 10930 000057E8 B80048                   mov  ax, 18432
 10931 000057EB E83403                   call DosInt
 10932 000057EE 8946FE                  mov [bp-2], ax
 10933 000057F1 895EFC                  mov [bp-4], bx
 10934                                  
 10935                                  ;-975   if(DOS_ERR) return vBX;   return vAX;
 10936                                  
 10937 000057F4 A1[7700]                 mov ax, [DOS_ERR]
 10938 000057F7 08C0                     or  al, al
 10939 000057F9 0F840600                 je @@allocmem622
 10940 000057FD 8B46FC                   mov ax, [bp-4]
 10941 00005800 E90600                   jmp @@retn
 10942                                  @@allocmem622:
 10943 00005803 8B46FE                   mov ax, [bp-2]
 10944 00005806 E90000                   jmp @@retn
 10945                                  
 10946                                  ;-976 }
 10947                                  
 10948                                  
 10949                                  ;-977 int copyF(char *dest, char *src, unsigned int sz) {
 10950                                  
 10951 00005809 C9                      @@retn: LEAVE
 10952 0000580A C3                       ret
 10953                                  ; ENDP
 10954                                  
 10955                                  copyF:  ; *** PROC ***
 10956                                  
 10957                                  ;-978   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10958                                  
 10959                                  ;Function : copyF, Number of local variables: 3
 10960                                  ;   # type sign width addr used name   list of local variables
 10961                                  ;  200 ptr sign byte   977 NULL dest = bp+4
 10962                                  ;  201 ptr sign byte   977 NULL src = bp+6
 10963                                  ;  202 var unsg word   977 NULL sz = bp+8;
 10964 0000580B C8000000                 ENTER  0,0
 10965 0000580F A1[6D00]                 mov ax, [segE]
 10966 00005812 8EC0                     mov  es, ax
 10967 00005814 8B7606                   mov  si, [bp+6]
 10968 00005817 8B7E04                   mov  di, [bp+4]
 10969 0000581A 8B4E08                   mov  cx, [bp+8]
 10970                                  
 10971                                  ;-979   asm cld
 10972                                  
 10973 0000581D FC                       cld
 10974                                  
 10975                                  ;-980   asm rep movsb
 10976                                  
 10977 0000581E F3A4                     rep movsb
 10978                                  
 10979                                  ;-981   asm mov byte [es:di], 0
 10980                                  
 10981 00005820 26C60500                 mov byte [es:di], 0
 10982                                  
 10983                                  ;-982 }
 10984                                  
 10985                                  
 10986                                  ;-983 int to_far(char *dest, char *src) {
 10987 00005824 C9                       LEAVE
 10988 00005825 C3                       ret
 10989                                  ; ENDP
 10990                                  
 10991                                  to_far:  ; *** PROC ***
 10992                                  
 10993                                  ;-984   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10994                                  
 10995                                  ;Function : to_far, Number of local variables: 2
 10996                                  ;   # type sign width addr used name   list of local variables
 10997                                  ;  200 ptr sign byte   983 NULL dest = bp+4
 10998                                  ;  201 ptr sign byte   983 NULL src = bp+6;
 10999 00005826 C8000000                 ENTER  0,0
 11000 0000582A A1[6D00]                 mov ax, [segE]
 11001 0000582D 8EC0                     mov  es, ax
 11002 0000582F 8B7606                   mov  si, [bp+6]
 11003 00005832 8B7E04                   mov  di, [bp+4]
 11004                                  
 11005                                  ;-985   asm cld
 11006                                  
 11007 00005835 FC                       cld
 11008                                  
 11009                                  ;-986   do{
 11010                                  
 11011                                  @@to_far623:
 11012                                  
 11013                                  ;-987   asm lodsb  ; inc si
 11014                                  
 11015 00005836 AC                       lodsb  ; inc si
 11016                                  
 11017                                  ;-988   asm stosb  ; inc di
 11018                                  
 11019 00005837 AA                       stosb  ; inc di
 11020                                  
 11021                                  ;-989   } while (al != 0);
 11022                                  
 11023 00005838 3C00                     cmp  al, 0
 11024 0000583A 0F840200                 je  @@to_far624
 11025 0000583E EBF6                     jmp @@to_far623
 11026                                  @@to_far624:
 11027                                  
 11028                                  ;-990 }
 11029                                  
 11030                                  
 11031                                  ;-991 int from_far(char *dest, char *src) {
 11032 00005840 C9                       LEAVE
 11033 00005841 C3                       ret
 11034                                  ; ENDP
 11035                                  
 11036                                  from_far:  ; *** PROC ***
 11037                                  
 11038                                  ;-992   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 11039                                  
 11040                                  ;Function : from_far, Number of local variables: 2
 11041                                  ;   # type sign width addr used name   list of local variables
 11042                                  ;  200 ptr sign byte   991 NULL dest = bp+4
 11043                                  ;  201 ptr sign byte   991 NULL src = bp+6;
 11044 00005842 C8000000                 ENTER  0,0
 11045 00005846 A1[6D00]                 mov ax, [segE]
 11046 00005849 8EC0                     mov  es, ax
 11047 0000584B 8B7606                   mov  si, [bp+6]
 11048 0000584E 8B7E04                   mov  di, [bp+4]
 11049                                  
 11050                                  ;-993   do{
 11051                                  
 11052                                  @@from_far625:
 11053                                  
 11054                                  ;-994   asm mov al, [es:si]
 11055                                  
 11056 00005851 268A04                   mov al, [es:si]
 11057                                  
 11058                                  ;-995   asm inc si
 11059                                  
 11060 00005854 46                       inc si
 11061                                  
 11062                                  ;-996   asm mov [di], al
 11063                                  
 11064 00005855 8805                     mov [di], al
 11065                                  
 11066                                  ;-997   asm inc di
 11067                                  
 11068 00005857 47                       inc di
 11069                                  
 11070                                  ;-998   } while (al != 0);
 11071                                  
 11072 00005858 3C00                     cmp  al, 0
 11073 0000585A 0F840200                 je  @@from_far626
 11074 0000585E EBF1                     jmp @@from_far625
 11075                                  @@from_far626:
 11076                                  
 11077                                  ;-999 }
 11078 00005860 C9                       LEAVE
 11079 00005861 C3                       ret
 11080                                  ; ENDP
 11081                                   
 11082                                  ; missing functions: 
 11083                                  ; strlen
 11084                                  ; strcpy
 11085                                  ; strlen
 11086                                  ; strcpy
 11087                                  ; strcpy
 11088                                  ; eqstr
 11089                                  ; eqstr
 11090                                  ; strlen
 11091                                  ; strcpy
 11092                                  ; strcpy
 11093                                  ; eqstr
 11094                                  ; strcpy
 11095                                  ; mkneg
 11096                                  ; strlen
 11097                                  ; strcpy
 11098                                  ; eqstr
 11099                                  ; eqstr
 11100                                  ; strcpy
 11101                                  ; strcpy
 11102                                  ; strcpy
 11103                                  ; strcpy
 11104                                  ; strcpy
 11105                                  ; strcpy
 11106                                  ; strcpy
 11107                                  ; strcpy
 11108                                  ; strlen
 11109                                  ; eqstr
 11110                                  ; eqstr
 11111                                  ; eqstr
 11112                                  ; eqstr
 11113                                  ; eqstr
 11114                                  ; eqstr
 11115                                  ; eqstr
 11116                                  ; eqstr
 11117                                  ; eqstr
 11118                                  ; eqstr
 11119                                  ; eqstr
 11120                                  ; eqstr
 11121                                  ; eqstr
 11122                                  ; eqstr
 11123                                  ; eqstr
 11124                                  ; eqstr
 11125                                  ; eqstr
 11126                                  ; eqstr
 11127                                  ; eqstr
 11128                                  ; eqstr
 11129                                  ; eqstr
 11130                                  ; eqstr
 11131                                  ; strlen
 11132                                  ; eqstr
 11133                                  ; eqstr
 11134                                  ; eqstr
 11135                                  ; eqstr
 11136                                  ; eqstr
 11137                                  ; eqstr
 11138                                  ; eqstr
 11139                                  ; eqstr
 11140                                  ; eqstr
 11141                                  ; eqstr
 11142                                  ; eqstr
 11143                                  ; eqstr
 11144                                  ; eqstr
 11145                                  ; eqstr
 11146                                  ; eqstr
 11147                                  ; eqstr
 11148                                  ; eqstr
 11149                                  ; eqstr
 11150                                  ; eqstr
 11151                                  ; eqstr
 11152                                  ; eqstr
 11153                                  ; eqstr
 11154                                  ; eqstr
 11155                                  ; eqstr
 11156                                  ; eqstr
 11157                                  ; strcpy
 11158                                  ; cputs
 11159                                  ; cputs
 11160                                  ; readRL
 11161                                  ; strcpy
 11162                                  ; instr2
 11163                                  ; strcat1
 11164                                  ; toupper
 11165                                  ; instr2
 11166                                  ; strcpy
 11167                                  ; cputs
 11168                                  ; exitR
 11169                                  ; strcpy
 11170                                  ; strlen
 11171                                  ; openR
 11172                                  ; cputs
 11173                                  ; cputs
 11174                                  ; exitR
 11175                                  ; creatR
 11176                                  ; cputs
 11177                                  ; cputs
 11178                                  ; exitR
 11179                                  ; eqstr
 11180                                  ; cputs
 11181                                  ; cputs
 11182                                  ; pint
 11183                                  ; openR
 11184                                  ; cputs
 11185                                  ; cputs
 11186                                  ; exitR
 11187                                  ; eqstr
 11188                                  ; putch
 11189                                  ; cputs
 11190                                  ; openR
 11191                                  ; eqstr
 11192                                  ; eqstr
 11193                                  ; strcpy
 11194                                  ; strlen
 11195                                  ; strcpy
 11196                                  ; instr1
 11197                                  ; digit
 11198                                  ; letter
 11199                                  ; strcpy
 11200                                  ; letter
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
 11221                                  ; eqstr
 11222                                  ; eqstr
 11223                                  ; strcpy
 11224                                  ; eqstr
 11225                                  ; letter
 11226                                  ; digit
 11227                                  ; writetty
 11228                                  ; writetty
 11229                                  ; fputcR
 11230                                  ; mkneg
 11231                                  ; mkneg
 11232                                  ; readR
 11233                                  ; fcloseR
 11234                                  ; fcloseR
 11235                                  ; exitR
 11236                                  ; eqstr
 11237                                  ; strcpy
 11238                                  ; DosInt
 11239                                  ; DosInt
 11240                                  ; Number of unresolved CALLs :  157
 11241                                  ;use archive file: AR.C
 11242                                  
 11243                                  ;-1000 // AR.C Archive
 11244                                  
 11245                                  ;Number of CALLs:    2 : writetty
 11246                                  
 11247                                  writetty:  ; *** PROC ***
 11248 00005862 B40E                     mov  ah, 14
 11249 00005864 BB0000                   mov  bx, 0
 11250 00005867 CD10                     int  16
 11251                                  
 11252                                  ;-1001 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
 11253                                  
 11254 00005869 C3                       ret
 11255                                  ; ENDP
 11256                                  ;Number of CALLs:    1 : putch
 11257                                  
 11258                                  putch:  ; *** PROC ***
 11259                                  ;Function : putch, Number of local variables: 1
 11260                                  ;   # type sign width addr used name   list of local variables
 11261                                  ;  200 var sign byte  1001 NULL c = bp+4;
 11262 0000586A C8000000                 ENTER  0,0 ; constant expression
 11263 0000586E 807E040A                cmp byte[bp+4], 10
 11264 00005872 0F850500                 jne @@putch627
 11265 00005876 B00D                     mov  al, 13
 11266 00005878 E8E7FF                   call writetty
 11267                                  @@putch627:
 11268 0000587B 8A4604                   mov  al, [bp+4]
 11269 0000587E E8E1FF                   call writetty
 11270                                  
 11271                                  ;-1002 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 11272 00005881 C9                       LEAVE
 11273 00005882 C3                       ret
 11274                                  ; ENDP
 11275                                  ;Number of CALLs:   12 : cputs
 11276                                  
 11277                                  cputs:  ; *** PROC ***
 11278                                  ;Function : cputs, Number of local variables: 2
 11279                                  ;   # type sign width addr used name   list of local variables
 11280                                  ;  200 ptr sign byte  1002 NULL s = bp+4
 11281                                  ;  201 var sign byte  1002 NULL c = bp-2;
 11282 00005883 C8020000                 ENTER  2,0
 11283                                  @@cputs628:
 11284 00005887 8B5E04                   mov bx, [bp+4]
 11285 0000588A 8A07                     mov al, [bx]
 11286 0000588C B400                     mov ah, 0
 11287 0000588E 08C0                     or  al, al
 11288 00005890 0F841B00                 je @@cputs629
 11289 00005894 8B5E04                   mov bx, [bp+4]
 11290 00005897 8A07                     mov al, [bx]
 11291 00005899 B400                     mov ah, 0
 11292 0000589B 8846FE                   mov [bp-2], al
 11293 0000589E 8A46FE                   mov al, byte [bp-2]
 11294 000058A1 B400                     mov ah, 0
 11295 000058A3 50                       push ax
 11296 000058A4 E8C3FF                   call putch
 11297 000058A7 83C402                   add  sp, 2
 11298 000058AA FF4604                   inc  word[bp+4]
 11299 000058AD EBD8                     jmp @@cputs628
 11300                                  @@cputs629:
 11301                                  
 11302                                  ;-1003 int mkneg(int n) { n; __asm {neg ax} }
 11303 000058AF C9                       LEAVE
 11304 000058B0 C3                       ret
 11305                                  ; ENDP
 11306                                  ;Number of CALLs:    3 : mkneg
 11307                                  
 11308                                  mkneg:  ; *** PROC ***
 11309                                  ;Function : mkneg, Number of local variables: 1
 11310                                  ;   # type sign width addr used name   list of local variables
 11311                                  ;  200 var sign word  1003 NULL n = bp+4;
 11312 000058B1 C8000000                 ENTER  0,0
 11313 000058B5 8B4604                   mov ax, [bp+4]
 11314 000058B8 F7D8                    neg ax
 11315                                  
 11316                                  ;-1004 int prunsign(unsigned int n) { unsigned int e;
 11317 000058BA C9                       LEAVE
 11318 000058BB C3                       ret
 11319                                  ; ENDP
 11320                                  ;Number of CALLs:    1 : pint
 11321                                  
 11322                                  pint:  ; *** PROC ***
 11323                                  ;Function : pint, Number of local variables: 2
 11324                                  ;   # type sign width addr used name   list of local variables
 11325                                  ;  200 var sign word  1004 NULL n = bp+4
 11326                                  ;  201 var sign word  1004 NULL e = bp-2;
 11327 000058BC C8020000                 ENTER  2,0
 11328 000058C0 8B4604                   mov ax, [bp+4]
 11329 000058C3 83F800                   cmp ax, 0
 11330 000058C6 0F8D1400                 jge @@pint630
 11331 000058CA 6A2D                     push 45
 11332 000058CC E896F0                   call prc
 11333 000058CF 83C402                   add  sp, 2
 11334 000058D2 FF7604                   push word [bp+4]
 11335 000058D5 E8D9FF                   call mkneg
 11336 000058D8 83C402                   add  sp, 2
 11337 000058DB 894604                   mov [bp+4], ax
 11338                                  
 11339                                  ;-1005   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }
 11340                                  
 11341                                  @@pint630:
 11342 000058DE 8B4604                   mov ax, [bp+4]
 11343 000058E1 83F80A                   cmp ax, 10 ;unsigned : 1
 11344 000058E4 0F8C1500                 jl  @@pint631
 11345 000058E8 8B4604                   mov ax, [bp+4]
 11346 000058EB BB0A00                   mov bx, 10
 11347 000058EE 99                       cwd
 11348 000058EF F7FB                     idiv bx
 11349 000058F1 8946FE                   mov [bp-2], ax
 11350 000058F4 FF76FE                   push word [bp-2]
 11351 000058F7 E8C2FF                   call pint
 11352 000058FA 83C402                   add  sp, 2
 11353                                  @@pint631:
 11354 000058FD 8B4604                   mov ax, [bp+4]
 11355 00005900 BB0A00                   mov bx, 10
 11356 00005903 99                       cwd
 11357 00005904 F7FB                     idiv bx
 11358 00005906 89D0                     mov ax, dx
 11359 00005908 894604                   mov [bp+4], ax
 11360 0000590B 8B4604                   mov ax, [bp+4]
 11361 0000590E 83C030                   add ax, 48
 11362 00005911 894604                   mov [bp+4], ax
 11363 00005914 FF7604                   push word [bp+4]
 11364 00005917 E850FF                   call putch
 11365 0000591A 83C402                   add  sp, 2
 11366                                  
 11367                                  ;-1006 int printint5(unsigned int j)  {
 11368 0000591D C9                       LEAVE
 11369 0000591E C3                       ret
 11370                                  ; ENDP
 11371                                  ;Number of CALLs:    1 : toupper
 11372                                  
 11373                                  toupper:  ; *** PROC ***
 11374                                  ;Function : toupper, Number of local variables: 1
 11375                                  ;   # type sign width addr used name   list of local variables
 11376                                  ;  200 ptr sign byte  1006 NULL s = bp+4;
 11377 0000591F C8000000                 ENTER  0,0
 11378                                  @@toupper632:
 11379 00005923 8B5E04                   mov bx, [bp+4]
 11380 00005926 8A07                     mov al, [bx]
 11381 00005928 B400                     mov ah, 0
 11382 0000592A 08C0                     or  al, al
 11383 0000592C 0F843000                 je @@toupper633
 11384 00005930 8B5E04                   mov bx, [bp+4]
 11385 00005933 8A07                     mov al, [bx]
 11386 00005935 B400                     mov ah, 0
 11387 00005937 83F861                   cmp ax, 97 ;unsigned : 1
 11388 0000593A 0F8C1D00                 jl  @@toupper634
 11389 0000593E 8B5E04                   mov bx, [bp+4]
 11390 00005941 8A07                     mov al, [bx]
 11391 00005943 B400                     mov ah, 0
 11392 00005945 83F87A                   cmp ax, 122
 11393 00005948 0F8F0F00                 jg  @@toupper635
 11394 0000594C 8B5E04                   mov bx, [bp+4]
 11395 0000594F 8A07                     mov al, [bx]
 11396 00005951 B400                     mov ah, 0
 11397 00005953 83E820                   sub ax, 32
 11398 00005956 8B5E04                   mov  bx, [bp+4]
 11399 00005959 8807                     mov  [bx], al
 11400                                  @@toupper635:
 11401                                  @@toupper634:
 11402 0000595B FF4604                   inc  word[bp+4]
 11403 0000595E EBC3                     jmp @@toupper632
 11404                                  @@toupper633:
 11405                                  
 11406                                  ;-1007 int head1  (char *s) {while(letter(*s)) s++;     *s=0; }
 11407 00005960 C9                       LEAVE
 11408 00005961 C3                       ret
 11409                                  ; ENDP
 11410                                  ;Number of CALLs:    8 : strlen
 11411                                  
 11412                                  strlen:  ; *** PROC ***
 11413                                  ;Function : strlen, Number of local variables: 2
 11414                                  ;   # type sign width addr used name   list of local variables
 11415                                  ;  200 ptr sign byte  1007 NULL s = bp+4
 11416                                  ;  201 var sign word  1007 NULL c = bp-2;
 11417 00005962 C8020000                 ENTER  2,0
 11418 00005966 B80000                   mov ax, 0
 11419 00005969 8946FE                   mov [bp-2], ax
 11420                                  @@strlen636:
 11421 0000596C 8B5E04                   mov bx, [bp+4]
 11422 0000596F 8A07                     mov al, [bx]
 11423 00005971 B400                     mov ah, 0
 11424 00005973 83F800                   cmp ax, 0
 11425 00005976 0F840800                 je  @@strlen637
 11426 0000597A FF4604                   inc  word[bp+4]
 11427 0000597D FF46FE                   inc  word[bp-2]
 11428 00005980 EBEA                     jmp @@strlen636
 11429                                  @@strlen637:
 11430 00005982 8B46FE                   mov ax, [bp-2]
 11431 00005985 E90000                   jmp @@retn
 11432                                  
 11433                                  ;-1008 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
 11434                                  
 11435 00005988 C9                      @@retn: LEAVE
 11436 00005989 C3                       ret
 11437                                  ; ENDP
 11438                                  ;Number of CALLs:   24 : strcpy
 11439                                  
 11440                                  strcpy:  ; *** PROC ***
 11441                                  ;Function : strcpy, Number of local variables: 2
 11442                                  ;   # type sign width addr used name   list of local variables
 11443                                  ;  200 ptr sign byte  1008 NULL s = bp+4
 11444                                  ;  201 ptr sign byte  1008 NULL t = bp+6;
 11445 0000598A C8000000                 ENTER  0,0
 11446                                  @@strcpy638:
 11447 0000598E 8B5E06                   mov bx, [bp+6]
 11448 00005991 8A07                     mov al, [bx]
 11449 00005993 B400                     mov ah, 0
 11450 00005995 8B5E04                   mov  bx, [bp+4]
 11451 00005998 8807                     mov  [bx], al
 11452 0000599A FF4604                   inc  word[bp+4]
 11453 0000599D FF4606                   inc  word[bp+6]
 11454 000059A0 8B5E06                   mov bx, [bp+6]
 11455 000059A3 8A07                     mov al, [bx]
 11456 000059A5 B400                     mov ah, 0
 11457 000059A7 83F800                   cmp ax, 0
 11458 000059AA 0F840200                 je  @@strcpy639
 11459 000059AE EBDE                     jmp @@strcpy638
 11460                                  @@strcpy639:
 11461 000059B0 B80000                   mov ax, 0
 11462 000059B3 8B5E04                   mov  bx, [bp+4]
 11463 000059B6 8807                     mov  [bx], al
 11464                                  
 11465                                  ;-1009 int strncpy(char *s, char *t, int n) { if (_ n==0) return;
 11466 000059B8 C9                       LEAVE
 11467 000059B9 C3                       ret
 11468                                  ; ENDP
 11469                                  ;Number of CALLs:    1 : instr1
 11470                                  
 11471                                  instr1:  ; *** PROC ***
 11472                                  ;Function : instr1, Number of local variables: 2
 11473                                  ;   # type sign width addr used name   list of local variables
 11474                                  ;  200 ptr sign byte  1009 NULL s = bp+4
 11475                                  ;  201 var sign byte  1009 NULL c = bp+6;
 11476 000059BA C8000000                 ENTER  0,0
 11477                                  @@instr1640:
 11478 000059BE 8B5E04                   mov bx, [bp+4]
 11479 000059C1 8A07                     mov al, [bx]
 11480 000059C3 B400                     mov ah, 0
 11481 000059C5 08C0                     or  al, al
 11482 000059C7 0F841900                 je @@instr1641
 11483 000059CB 8B5E04                   mov bx, [bp+4]
 11484 000059CE 8A07                     mov al, [bx]
 11485 000059D0 B400                     mov ah, 0
 11486 000059D2 3A4606                   cmp al, [bp+6]
 11487 000059D5 0F850600                 jne @@instr1642
 11488 000059D9 B80100                   mov ax, 1
 11489 000059DC E90B00                   jmp @@retn
 11490                                  @@instr1642:
 11491 000059DF FF4604                   inc  word[bp+4]
 11492 000059E2 EBDA                     jmp @@instr1640
 11493                                  @@instr1641:
 11494 000059E4 B80000                   mov ax, 0
 11495 000059E7 E90000                   jmp @@retn
 11496                                  
 11497                                  ;-1010 int instr2(char *s, char c) { while(*s) { if (*s==c) return &s; s++;} return 0;}
 11498                                  
 11499 000059EA C9                      @@retn: LEAVE
 11500 000059EB C3                       ret
 11501                                  ; ENDP
 11502                                  ;Number of CALLs:    2 : instr2
 11503                                  
 11504                                  instr2:  ; *** PROC ***
 11505                                  ;Function : instr2, Number of local variables: 2
 11506                                  ;   # type sign width addr used name   list of local variables
 11507                                  ;  200 ptr sign byte  1010 NULL s = bp+4
 11508                                  ;  201 var sign byte  1010 NULL c = bp+6;
 11509 000059EC C8000000                 ENTER  0,0
 11510                                  @@instr2643:
 11511 000059F0 8B5E04                   mov bx, [bp+4]
 11512 000059F3 8A07                     mov al, [bx]
 11513 000059F5 B400                     mov ah, 0
 11514 000059F7 08C0                     or  al, al
 11515 000059F9 0F841900                 je @@instr2644
 11516 000059FD 8B5E04                   mov bx, [bp+4]
 11517 00005A00 8A07                     mov al, [bx]
 11518 00005A02 B400                     mov ah, 0
 11519 00005A04 3A4606                   cmp al, [bp+6]
 11520 00005A07 0F850600                 jne @@instr2645
 11521 00005A0B 8B4604                   mov ax, [bp+4]
 11522 00005A0E E90B00                   jmp @@retn
 11523                                  @@instr2645:
 11524 00005A11 FF4604                   inc  word[bp+4]
 11525 00005A14 EBDA                     jmp @@instr2643
 11526                                  @@instr2644:
 11527 00005A16 B80000                   mov ax, 0
 11528 00005A19 E90000                   jmp @@retn
 11529                                  
 11530                                  ;-1011 int digit(char c){ if(c<'0') return 0; if(c>'9') return 0; return 1; }
 11531                                  
 11532 00005A1C C9                      @@retn: LEAVE
 11533 00005A1D C3                       ret
 11534                                  ; ENDP
 11535                                  ;Number of CALLs:    2 : digit
 11536                                  
 11537                                  digit:  ; *** PROC ***
 11538                                  ;Function : digit, Number of local variables: 1
 11539                                  ;   # type sign width addr used name   list of local variables
 11540                                  ;  200 var sign byte  1011 NULL c = bp+4;
 11541 00005A1E C8000000                 ENTER  0,0
 11542 00005A22 8A4604                   mov al, [bp+4]
 11543 00005A25 3C30                     cmp al, 48
 11544 00005A27 0F8D0600                 jge @@digit646
 11545 00005A2B B80000                   mov ax, 0
 11546 00005A2E E91500                   jmp @@retn
 11547                                  @@digit646:
 11548 00005A31 8A4604                   mov al, [bp+4]
 11549 00005A34 3C39                     cmp al, 57
 11550 00005A36 0F8E0600                 jle @@digit647
 11551 00005A3A B80000                   mov ax, 0
 11552 00005A3D E90600                   jmp @@retn
 11553                                  @@digit647:
 11554 00005A40 B80100                   mov ax, 1
 11555 00005A43 E90000                   jmp @@retn
 11556                                  
 11557                                  ;-1012 int letter(char c) { if (digit(c)) return 1; if (c=='_') return 1;
 11558                                  
 11559 00005A46 C9                      @@retn: LEAVE
 11560 00005A47 C3                       ret
 11561                                  ; ENDP
 11562                                  ;Number of CALLs:    3 : letter
 11563                                  
 11564                                  letter:  ; *** PROC ***
 11565                                  ;Function : letter, Number of local variables: 1
 11566                                  ;   # type sign width addr used name   list of local variables
 11567                                  ;  200 var sign byte  1012 NULL c = bp+4;
 11568 00005A48 C8000000                 ENTER  0,0
 11569 00005A4C 8A4604                   mov al, byte [bp+4]
 11570 00005A4F B400                     mov ah, 0
 11571 00005A51 50                       push ax
 11572 00005A52 E8C9FF                   call digit
 11573 00005A55 83C402                   add  sp, 2
 11574 00005A58 08C0                     or  al, al
 11575 00005A5A 0F840600                 je @@letter648
 11576 00005A5E B80100                   mov ax, 1
 11577 00005A61 E94B00                   jmp @@retn
 11578                                  @@letter648:
 11579 00005A64 8A4604                   mov al, [bp+4]
 11580 00005A67 3C5F                     cmp al, 95
 11581 00005A69 0F850600                 jne @@letter649
 11582 00005A6D B80100                   mov ax, 1
 11583 00005A70 E93C00                   jmp @@retn
 11584                                  
 11585                                  ;-1013   if (c> 'z') return 0; if (c< '@') return 0;
 11586                                  
 11587                                  @@letter649:
 11588 00005A73 8A4604                   mov al, [bp+4]
 11589 00005A76 3C7A                     cmp al, 122
 11590 00005A78 0F8E0600                 jle @@letter650
 11591 00005A7C B80000                   mov ax, 0
 11592 00005A7F E92D00                   jmp @@retn
 11593                                  @@letter650:
 11594 00005A82 8A4604                   mov al, [bp+4]
 11595 00005A85 3C40                     cmp al, 64
 11596 00005A87 0F8D0600                 jge @@letter651
 11597 00005A8B B80000                   mov ax, 0
 11598 00005A8E E91E00                   jmp @@retn
 11599                                  
 11600                                  ;-1014   if (c> 'Z') { if (c< 'a') return 0; }  return 1; }
 11601                                  
 11602                                  @@letter651:
 11603 00005A91 8A4604                   mov al, [bp+4]
 11604 00005A94 3C5A                     cmp al, 90
 11605 00005A96 0F8E0F00                 jle @@letter652
 11606 00005A9A 8A4604                   mov al, [bp+4]
 11607 00005A9D 3C61                     cmp al, 97
 11608 00005A9F 0F8D0600                 jge @@letter653
 11609 00005AA3 B80000                   mov ax, 0
 11610 00005AA6 E90600                   jmp @@retn
 11611                                  @@letter653:
 11612                                  @@letter652:
 11613 00005AA9 B80100                   mov ax, 1
 11614 00005AAC E90000                   jmp @@retn
 11615                                  
 11616                                  ;-1015 int eqstr(char *p, char *q) { while(*p) {
 11617                                  
 11618 00005AAF C9                      @@retn: LEAVE
 11619 00005AB0 C3                       ret
 11620                                  ; ENDP
 11621                                  ;Number of CALLs:   80 : eqstr
 11622                                  
 11623                                  eqstr:  ; *** PROC ***
 11624                                  ;Function : eqstr, Number of local variables: 2
 11625                                  ;   # type sign width addr used name   list of local variables
 11626                                  ;  200 ptr sign byte  1015 NULL p = bp+4
 11627                                  ;  201 ptr sign byte  1015 NULL q = bp+6;
 11628 00005AB1 C8000000                 ENTER  0,0
 11629                                  @@eqstr654:
 11630 00005AB5 8B5E04                   mov bx, [bp+4]
 11631 00005AB8 8A07                     mov al, [bx]
 11632 00005ABA B400                     mov ah, 0
 11633 00005ABC 08C0                     or  al, al
 11634 00005ABE 0F842000                 je @@eqstr655
 11635                                  
 11636                                  ;-1016     if (*p != *q) return 0; p++; q++; }
 11637                                  
 11638 00005AC2 8B5E04                   mov bx, [bp+4]
 11639 00005AC5 8A07                     mov al, [bx]
 11640 00005AC7 B400                     mov ah, 0
 11641 00005AC9 8B5E06                   mov bx, [bp+6]
 11642 00005ACC 3A07                     cmp al, [bx]
 11643 00005ACE B400                     mov ah, 0
 11644 00005AD0 0F840600                 je  @@eqstr656
 11645 00005AD4 B80000                   mov ax, 0
 11646 00005AD7 E92100                   jmp @@retn
 11647                                  @@eqstr656:
 11648 00005ADA FF4604                   inc  word[bp+4]
 11649 00005ADD FF4606                   inc  word[bp+6]
 11650                                  
 11651                                  ;-1017     if(*q) return 0; return 1; }
 11652                                  
 11653 00005AE0 EBD3                     jmp @@eqstr654
 11654                                  @@eqstr655:
 11655 00005AE2 8B5E06                   mov bx, [bp+6]
 11656 00005AE5 8A07                     mov al, [bx]
 11657 00005AE7 B400                     mov ah, 0
 11658 00005AE9 08C0                     or  al, al
 11659 00005AEB 0F840600                 je @@eqstr657
 11660 00005AEF B80000                   mov ax, 0
 11661 00005AF2 E90600                   jmp @@retn
 11662                                  @@eqstr657:
 11663 00005AF5 B80100                   mov ax, 1
 11664 00005AF8 E90000                   jmp @@retn
 11665                                  
 11666                                  ;-1018 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
 11667                                  
 11668 00005AFB C9                      @@retn: LEAVE
 11669 00005AFC C3                       ret
 11670                                  ; ENDP
 11671                                  ;Number of CALLs:    1 : strcat1
 11672                                  
 11673                                  strcat1:  ; *** PROC ***
 11674                                  ;Function : strcat1, Number of local variables: 2
 11675                                  ;   # type sign width addr used name   list of local variables
 11676                                  ;  200 ptr sign byte  1018 NULL s = bp+4
 11677                                  ;  201 ptr sign byte  1018 NULL t = bp+6;
 11678 00005AFD C8000000                 ENTER  0,0
 11679                                  @@strcat1658:
 11680 00005B01 8B5E04                   mov bx, [bp+4]
 11681 00005B04 8A07                     mov al, [bx]
 11682 00005B06 B400                     mov ah, 0
 11683 00005B08 83F800                   cmp ax, 0
 11684 00005B0B 0F840500                 je  @@strcat1659
 11685 00005B0F FF4604                   inc  word[bp+4]
 11686 00005B12 EBED                     jmp @@strcat1658
 11687                                  @@strcat1659:
 11688 00005B14 FF7606                   push word [bp+6]
 11689 00005B17 FF7604                   push word [bp+4]
 11690 00005B1A E86DFE                   call strcpy
 11691 00005B1D 83C404                   add  sp, 4
 11692                                  
 11693                                  ;-1019 int basename(char *s) { char *p; p=0;
 11694 00005B20 C9                       LEAVE
 11695 00005B21 C3                       ret
 11696                                  ; ENDP
 11697                                  ;Number of CALLs:    2 : DosInt
 11698                                  
 11699                                  DosInt:  ; *** PROC ***
 11700 00005B22 CD21                     int  33
 11701 00005B24 7304                     jae short @@DosInt660
 11702 00005B26 FF06[7700]               inc  word[DOS_ERR]
 11703                                  @@DosInt660:
 11704                                  
 11705                                  ;-1020 int openR (char *s) { dx=s; ax=0x3D02;  DosInt(); }
 11706                                  
 11707 00005B2A C3                       ret
 11708                                  ; ENDP
 11709                                  ;Number of CALLs:    3 : openR
 11710                                  
 11711                                  openR:  ; *** PROC ***
 11712                                  ;Function : openR, Number of local variables: 1
 11713                                  ;   # type sign width addr used name   list of local variables
 11714                                  ;  200 ptr sign byte  1020 NULL s = bp+4;
 11715 00005B2B C8000000                 ENTER  0,0
 11716 00005B2F 8B5604                   mov  dx, [bp+4]
 11717 00005B32 B8023D                   mov  ax, 15618
 11718 00005B35 E8EAFF                   call DosInt
 11719                                  
 11720                                  ;-1021 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 11721 00005B38 C9                       LEAVE
 11722 00005B39 C3                       ret
 11723                                  ; ENDP
 11724                                  ;Number of CALLs:    1 : creatR
 11725                                  
 11726                                  creatR:  ; *** PROC ***
 11727                                  ;Function : creatR, Number of local variables: 1
 11728                                  ;   # type sign width addr used name   list of local variables
 11729                                  ;  200 ptr sign byte  1021 NULL s = bp+4;
 11730 00005B3A C8000000                 ENTER  0,0
 11731 00005B3E 8B5604                   mov  dx, [bp+4]
 11732 00005B41 B90000                   mov  cx, 0
 11733 00005B44 B8003C                   mov  ax, 15360
 11734 00005B47 E8D8FF                   call DosInt
 11735                                  
 11736                                  ;-1022 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
 11737 00005B4A C9                       LEAVE
 11738 00005B4B C3                       ret
 11739                                  ; ENDP
 11740                                  ;Number of CALLs:    1 : readR
 11741                                  
 11742                                  readR:  ; *** PROC ***
 11743                                  ;Function : readR, Number of local variables: 2
 11744                                  ;   # type sign width addr used name   list of local variables
 11745                                  ;  200 ptr sign byte  1022 NULL s = bp+4
 11746                                  ;  201 var sign word  1022 NULL fd = bp+6;
 11747 00005B4C C8000000                 ENTER  0,0
 11748 00005B50 8B5604                   mov  dx, [bp+4]
 11749 00005B53 B90100                   mov  cx, 1
 11750 00005B56 8B5E06                   mov  bx, [bp+6]
 11751 00005B59 B8003F                   mov  ax, 16128
 11752 00005B5C E8C3FF                   call DosInt
 11753                                  
 11754                                  ;-1023 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
 11755 00005B5F C9                       LEAVE
 11756 00005B60 C3                       ret
 11757                                  ; ENDP
 11758                                  ;Number of CALLs:    1 : readRL
 11759                                  
 11760                                  readRL:  ; *** PROC ***
 11761                                  ;Function : readRL, Number of local variables: 3
 11762                                  ;   # type sign width addr used name   list of local variables
 11763                                  ;  200 ptr sign byte  1023 NULL s = bp+4
 11764                                  ;  201 var sign word  1023 NULL fd = bp+6
 11765                                  ;  202 var sign word  1023 NULL len = bp+8;
 11766 00005B61 C8000000                 ENTER  0,0
 11767 00005B65 8B5604                   mov  dx, [bp+4]
 11768 00005B68 8B4E08                   mov  cx, [bp+8]
 11769 00005B6B 8B5E06                   mov  bx, [bp+6]
 11770 00005B6E B8003F                   mov  ax, 16128
 11771 00005B71 E8AEFF                   call DosInt
 11772                                  
 11773                                  ;-1024 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 11774 00005B74 C9                       LEAVE
 11775 00005B75 C3                       ret
 11776                                  ; ENDP
 11777                                  ;Number of CALLs:    1 : fputcR
 11778                                  
 11779                                  fputcR:  ; *** PROC ***
 11780                                  ;Function : fputcR, Number of local variables: 2
 11781                                  ;   # type sign width addr used name   list of local variables
 11782                                  ;  200 ptr sign byte  1024 NULL n = bp+4
 11783                                  ;  201 var sign word  1024 NULL fd = bp+6;
 11784 00005B76 C8000000                 ENTER  0,0
 11785 00005B7A 8D5604                  lea dx, [bp+4]
 11786                                  
 11787                                  ;-1025   cx=1; bx=fd; ax=0x4000; DosInt(); }
 11788                                  
 11789 00005B7D B90100                   mov  cx, 1
 11790 00005B80 8B5E06                   mov  bx, [bp+6]
 11791 00005B83 B80040                   mov  ax, 16384
 11792 00005B86 E899FF                   call DosInt
 11793                                  
 11794                                  ;-1026 int writeRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x4000; DosInt();}
 11795 00005B89 C9                       LEAVE
 11796 00005B8A C3                       ret
 11797                                  ; ENDP
 11798                                  ;Number of CALLs:    2 : fcloseR
 11799                                  
 11800                                  fcloseR:  ; *** PROC ***
 11801                                  ;Function : fcloseR, Number of local variables: 1
 11802                                  ;   # type sign width addr used name   list of local variables
 11803                                  ;  200 var sign word  1026 NULL fd = bp+4;
 11804 00005B8B C8000000                 ENTER  0,0
 11805 00005B8F 8B5E04                   mov  bx, [bp+4]
 11806 00005B92 B8003E                   mov  ax, 15872
 11807 00005B95 CD21                     int  33
 11808                                  
 11809                                  ;-1027 int exitR(char c) {ah=0x4C; al=c; inth 0x21; }
 11810 00005B97 C9                       LEAVE
 11811 00005B98 C3                       ret
 11812                                  ; ENDP
 11813                                  ;Number of CALLs:    5 : exitR
 11814                                  
 11815                                  exitR:  ; *** PROC ***
 11816                                  ;Function : exitR, Number of local variables: 1
 11817                                  ;   # type sign width addr used name   list of local variables
 11818                                  ;  200 var sign byte  1027 NULL c = bp+4;
 11819 00005B99 C8000000                 ENTER  0,0
 11820 00005B9D B44C                     mov  ah, 76
 11821 00005B9F 8A4604                   mov  al, [bp+4]
 11822 00005BA2 CD21                     int  33
 11823                                  
 11824                                  ;-1028 int setdta(char *s) {dx=s; ah=0x1A; inth 0x21; }
 11825 00005BA4 C9                       LEAVE
 11826 00005BA5 C3                       ret
 11827                                  ; ENDP
 11828                                  ;End of archive file. 
 11829                                   
 11830                                  ; missing functions:  All FUNCTIONs in place
 11831 00005BA6 E80000                  LastFunctionByt:db 0E8h, 0, 0
 11832 00005BA9 58                      pop ax
 11833 00005BAA C3                      ret
 11834                                   
 11835                                  ;   # type sign width  adr used name   list of global variables
 11836                                  
 11837                                  ;    1 arr sign byte     2    2 Version1[16]
 11838                                  ;    2 var sign byte     4   25 NASM
 11839                                  ;    3 def unsg byte     5    - LSTART=200
 11840                                  ;    4 def unsg byte     6    - VARMAX=300
 11841                                  ;    5 def unsg byte     7    - GNAMEMAX=4800
 11842                                  ;    6 def unsg byte     8    - FUNCMAX=300
 11843                                  ;    7 def unsg byte     9    - FNAMEMAX=4800
 11844                                  ;    8 def unsg byte    10    - CALLMAX=2000
 11845                                  ;    9 def unsg byte    11    - IDLENMAX=15
 11846                                  ;   10 def unsg byte    13    - T_NAME=256
 11847                                  ;   11 def unsg byte    14    - T_CONST=257
 11848                                  ;   12 def unsg byte    15    - T_STRING=258
 11849                                  ;   13 def unsg byte    16    - T_INCLUDE=510
 11850                                  ;   14 def unsg byte    17    - T_DEFINE=511
 11851                                  ;   15 def unsg byte    18    - T_RETURN=512
 11852                                  ;   16 def unsg byte    19    - T_IF=513
 11853                                  ;   17 def unsg byte    20    - T_ELSE=514
 11854                                  ;   18 def unsg byte    21    - T_WHILE=515
 11855                                  ;   19 def unsg byte    22    - T_DO=516
 11856                                  ;   20 def unsg byte    23    - T_INT=517
 11857                                  ;   21 def unsg byte    24    - T_ASM=518
 11858                                  ;   22 def unsg byte    25    - T_ASMBLOCK=519
 11859                                  ;   23 def unsg byte    26    - T_EMIT=520
 11860                                  ;   24 def unsg byte    27    - T_GOTO=521
 11861                                  ;   25 def unsg byte    28    - T_VOID=529
 11862                                  ;   26 def unsg byte    29    - T_CHAR=530
 11863                                  ;   27 def unsg byte    30    - T_SIGNED=531
 11864                                  ;   28 def unsg byte    31    - T_UNSIGNED=532
 11865                                  ;   29 def unsg byte    32    - T_LONG=533
 11866                                  ;   30 def unsg byte    33    - T_SHORT=534
 11867                                  ;   31 def unsg byte    35    - T_UINT32=545
 11868                                  ;   32 def unsg byte    37    - T_INTH=600
 11869                                  ;   33 def unsg byte    38    - T_IFCARRY=601
 11870                                  ;   34 def unsg byte    39    - T_IFZERO=602
 11871                                  ;   35 def unsg byte    40    - T_EQ=806
 11872                                  ;   36 def unsg byte    41    - T_NE=807
 11873                                  ;   37 def unsg byte    42    - T_GE=811
 11874                                  ;   38 def unsg byte    43    - T_LE=824
 11875                                  ;   39 def unsg byte    44    - T_PLUSPLUS=1219
 11876                                  ;   40 def unsg byte    45    - T_MINUSMINUS=1225
 11877                                  ;   41 def unsg byte    46    - T_PLUSASS=1230
 11878                                  ;   42 def unsg byte    47    - T_MINUSASS=1231
 11879                                  ;   43 def unsg byte    48    - T_MULASS=1232
 11880                                  ;   44 def unsg byte    49    - T_DIVASS=1233
 11881                                  ;   45 def unsg byte    50    - T_ANDASS=1234
 11882                                  ;   46 def unsg byte    51    - T_ORASS=1235
 11883                                  ;   47 def unsg byte    52    - T_LESSLESS=1240
 11884                                  ;   48 def unsg byte    53    - T_GREATGREAT=1241
 11885                                  ;   49 def unsg byte    54    - COMAX=3000
 11886                                  ;   50 def unsg byte    55    - CMDLENMAX=67
 11887                                  ;   51 var unsg word    56    3 ORGDATAORIG
 11888                                  ;   52 var unsg word    56   11 orgData
 11889                                  ;   53 arr sign byte    57    4 co[3000]
 11890                                  ;   54 var sign word    57    4 maxco
 11891                                  ;   55 var sign word    57    3 maxco1
 11892                                  ;   56 arr sign byte    58    2 coname[67]
 11893                                  ;   57 ptr sign byte    58    5 cloc
 11894                                  ;   58 var sign word    59    7 fdin
 11895                                  ;   59 var sign word    59    7 fdout
 11896                                  ;   60 arr sign byte    59  111 symbol[128]
 11897                                  ;   61 arr sign byte    60   12 fname[67]
 11898                                  ;   62 arr sign byte    60   12 namein[67]
 11899                                  ;   63 arr sign byte    61    7 namelst[67]
 11900                                  ;   64 arr sign byte    61    5 archivename[67]
 11901                                  ;   65 var sign word    62   49 token
 11902                                  ;   66 var sign byte    62    2 globC
 11903                                  ;   67 var sign word    62    3 spalte
 11904                                  ;   68 var sign byte    63   28 thechar
 11905                                  ;   69 var sign word    63    9 iscmp
 11906                                  ;   70 var sign word    63    4 nconst
 11907                                  ;   71 var sign word    64    3 nreturn
 11908                                  ;   72 var sign word    64   16 nlabel
 11909                                  ;   73 var sign word    64    3 callrecursive
 11910                                  ;   74 var sign word    65   24 GTop
 11911                                  ;   75 var sign word    65   20 LTop
 11912                                  ;   76 var unsg word    66   45 lexval
 11913                                  ;   77 var sign word    67    6 typei
 11914                                  ;   78 var sign byte    67    8 istype
 11915                                  ;   79 arr sign byte    67   11 GType[300]
 11916                                  ;   80 var sign word    68    6 signi
 11917                                  ;   81 var sign byte    68    6 issign
 11918                                  ;   82 arr sign byte    68    5 GSign[300]
 11919                                  ;   83 var sign word    69    9 widthi
 11920                                  ;   84 var sign byte    69   20 iswidth
 11921                                  ;   85 arr sign byte    69    5 GWidth[300]
 11922                                  ;   86 arr sign word    70    4 GAdr[300]
 11923                                  ;   87 arr sign word    70    6 GUsed[300]
 11924                                  ;   88 var sign word    71   26 wi
 11925                                  ;   89 arr sign word    71   11 GData[300]
 11926                                  ;   90 arr sign byte    71    2 GNameField[4800]
 11927                                  ;   91 var sign word    72   17 FTop
 11928                                  ;   92 var sign word    72    9 CTop
 11929                                  ;   93 arr sign byte    73    2 FType[300]
 11930                                  ;   94 arr sign byte    73    5 CType[2000]
 11931                                  ;   95 arr sign word    74    4 FAdr[300]
 11932                                  ;   96 arr sign word    74    5 CAdr[2000]
 11933                                  ;   97 arr sign word    75    4 FCalls[300]
 11934                                  ;   98 arr sign byte    76    5 FNameField[4800]
 11935                                  ;   99 arr sign byte    77    9 NameA[32]
 11936                                  ;  100 arr sign byte    78    5 fgetsdest[128]
 11937                                  ;  101 ptr unsg byte    78    8 CNameTop
 11938                                  ;  102 ptr unsg byte    79   10 fgetsp
 11939                                  ;  103 var unsg word    79    4 segE
 11940                                  ;  104 var unsg word    80   12 lineno
 11941                                  ;  105 var unsg word    80    2 linenoinclude
 11942                                  ;  106 ptr unsg byte    81   19 pt
 11943                                  ;  107 ptr unsg byte    81    8 p1
 11944                                  ;  108 var sign word    82   10 DOS_ERR
 11945                                  ;  109 var sign word    82    5 DOS_NoBytes
 11946                                  ;  110 var sign byte    82    3 DOS_ByteRead
 11947                                  ;  111 var sign word    84 NULL tt1
 11948                                  ;  112 var sign word    84 NULL tt2
 11949                                  ;  113 var sign dwrd    84    1 ex
 11950                                  ;  114 arr sign byte    98    2 doglobName[15]
 11951                                  ;  115 var sign word   248    5 mod1
 11952                                  ;  116 var sign word   248   12 ireg1
 11953                                  ;  117 var sign word   248    6 idx1
 11954                                  ;  118 var sign word   248    1 ids1
 11955                                  ;  119 var sign word   248    4 idw1
 11956                                  ;  120 var sign word   248    2 idt1
 11957                                  ;  121 var sign word   248 NULL val1
 11958                                  ;  122 var sign word   249    2 mod2
 11959                                  ;  123 var sign word   249    6 ireg2
 11960                                  ;  124 var sign word   249    6 idx2
 11961                                  ;  125 var sign word   249    1 ids2
 11962                                  ;  126 var sign word   249    4 idw2
 11963                                  ;  127 var sign word   249    2 idt2
 11964                                  ;  128 var sign word   249    2 val2
 11965                                  ;  129 arr sign byte   317    9 ops[5]
 11966                                  ;  130 arr sign byte   359    3 printregstr[74]
 11967                                  ;  131 var sign word   367    1 evalue
 11968                                  ;  132 var sign word   367    1 exprtype
 11969                                  ;  133 arr sign word   519    2 docalltype[10]
 11970                                  ;  134 arr sign word   519    2 docallvalue[10]
 11971                                  ;  135 arr sign byte   520    2 procname[17]
 11972                                  ;  136 ptr sign byte   575    1 arglen
 11973                                  ;  137 ptr sign byte   575    3 argv
 11974                                  ;  138 var sign byte   623    4 wasfunction
 11975                                  ;  139 arr sign byte   752    2 symboltemp[80]
 11976                                  ;  140 var unsg word   938    1 MAXUI
 11977                                  
 11978                                  
 11979                                  ;   # Calls Line Width  Name   list of functions
 11980                                  
 11981                                  ;    0    1   85   ttt
 11982                                  ;    1    4   92   a
 11983                                  ;    2   21   93   v
 11984                                  ;    3    4   95   checknamelen
 11985                                  ;    4    1   99   doglob
 11986                                  ;    5   12  150   gettypes
 11987                                  ;    6    9  159   adrofname
 11988                                  ;    7    7  160   adrF
 11989                                  ;    8    4  162   printName
 11990                                  ;    9   12  166   searchname
 11991                                  ;   10    3  170   checkName
 11992                                  ;   11   10  175   typeName
 11993                                  ;   12    3  185   name1
 11994                                  ;   13    1  187   storecall
 11995                                  ;   14    2  193   storefunc
 11996                                  ;   15    2  197   addlocal
 11997                                  ;   16    1  203   checkFunction
 11998                                  ;   17    2  206   dofunc
 11999                                  ;   18    1  241   isvariable
 12000                                  ;   19    3  251   pexpr
 12001                                  ;   20    1  258   constantexpr
 12002                                  ;   21    3  269   exprstart
 12003                                  ;   22    1  271   expr2
 12004                                  ;   23    3  318   doreg1
 12005                                  ;   24    6  337   checkreg
 12006                                  ;   25    6  362   printreg
 12007                                  ;   26    2  368   expr
 12008                                  ;   27    4  417   compoundass
 12009                                  ;   28    2  424   dovar1
 12010                                  ;   29    8  445   rterm
 12011                                  ;   30    1  458   isreg
 12012                                  ;   31   15  476   doreg
 12013                                  ;   32    1  482   doassign
 12014                                  ;   33    1  500   domul
 12015                                  ;   34    2  504   doidiv
 12016                                  ;   35    1  517   domod
 12017                                  ;   36    1  521   docall1
 12018                                  ;   37 NULL  563   main
 12019                                  ;   38    3  574   getfirstchar
 12020                                  ;   39    1  576   getarg
 12021                                  ;   40    2  599   parse
 12022                                  ;   41    2  608   checkcalls
 12023                                  ;   42    1  624   doar
 12024                                  ;   43    1  651   getfunctionhead
 12025                                  ;   44    1  658   doinclude
 12026                                  ;   45    1  669   dodefine
 12027                                  ;   46    8  685   stmt
 12028                                  ;   47    1  709   doemit
 12029                                  ;   48    3  713   cmpneg
 12030                                  ;   49    9  726   prlabel
 12031                                  ;   50    3  727   prjump
 12032                                  ;   51    1  728   doif
 12033                                  ;   52    1  733   doifcarry
 12034                                  ;   53    1  736   doifzero
 12035                                  ;   54    1  739   dodo
 12036                                  ;   55    1  743   dowhile
 12037                                  ;   56    4  746   isrelational
 12038                                  ;   57   19  753   getlex
 12039                                  ;   58    1  810   convertdefine
 12040                                  ;   59    1  817   getdigit
 12041                                  ;   60    1  826   getstring
 12042                                  ;   61   31  829   next
 12043                                  ;   62   84  830   istoken
 12044                                  ;   63   38  831   expect
 12045                                  ;   64    6  834   eprc
 12046                                  ;   65    5  835   eprs
 12047                                  ;   66   41  836   prc
 12048                                  ;   67    3  841   prscomment
 12049                                  ;   68    8  843   prnl
 12050                                  ;   69  283  845   prs
 12051                                  ;   70    2  850   eprnum
 12052                                  ;   71   18  852   pint1
 12053                                  ;   72   29  854   prunsign1
 12054                                  ;   73   26  857   printint51
 12055                                  ;   74    2  861   fgets1
 12056                                  ;   75    1  865   printinputline
 12057                                  ;   76    2  873   end1
 12058                                  ;   77   50  874   error1
 12059                                  ;   78    2  883   listproc
 12060                                  ;   79    2  891   listvar
 12061                                  ;   80    1  907   listcall
 12062                                  ;   81    1  910   calllisting
 12063                                  ;   82    1  916   countcalls
 12064                                  ;   83    1  924   listfunc
 12065                                  ;   84    1  928   funclisting
 12066                                  ;   85    1  939   epilog
 12067                                  ;   86    1  971   setblock
 12068                                  ;   87    1  973   allocmem
 12069                                  ;   88 NULL  977   copyF
 12070                                  ;   89    1  983   to_far
 12071                                  ;   90    4  991   from_far
 12072                                  ;   91    4 1000   writetty
 12073                                  ;   92    3 1001   putch
 12074                                  ;   93   12 1002   cputs
 12075                                  ;   94    4 1003   mkneg
 12076                                  ;   95    2 1004   pint
 12077                                  ;   96    1 1006   toupper
 12078                                  ;   97    8 1007   strlen
 12079                                  ;   98   25 1008   strcpy
 12080                                  ;   99    1 1009   instr1
 12081                                  ;  100    2 1010   instr2
 12082                                  ;  101    3 1011   digit
 12083                                  ;  102    3 1012   letter
 12084                                  ;  103   80 1015   eqstr
 12085                                  ;  104    1 1018   strcat1
 12086                                  ;  105    7 1019   DosInt
 12087                                  ;  106    3 1020   openR
 12088                                  ;  107    1 1021   creatR
 12089                                  ;  108    1 1022   readR
 12090                                  ;  109    1 1023   readRL
 12091                                  ;  110    1 1024   fputcR
 12092                                  ;  111    2 1026   fcloseR
 12093                                  ;  112    5 1027   exitR
 12094                                  ;  113 NULL 1028   LastFunctionByt
 12095                                  
 12096                                  ;    #  addr name   list of CALLs
 12097                                  
 12098                                  ;    0     0 ttt
 12099                                  ;    1     4 prs
 12100                                  ;    2     8 printName
 12101                                  ;    3    18 prc
 12102                                  ;    4    22 printName
 12103                                  ;    5    32 prc
 12104                                  ;    6    36 strlen
 12105                                  ;    7    43 error1
 12106                                  ;    8    50 error1
 12107                                  ;    9    57 error1
 12108                                  ;   10    64 checknamelen
 12109                                  ;   11    77 checkName
 12110                                  ;   12    87 error1
 12111                                  ;   13    94 istoken
 12112                                  ;   14   102 istoken
 12113                                  ;   15   110 prs
 12114                                  ;   16   114 prunsign1
 12115                                  ;   17   124 prs
 12116                                  ;   18   128 prunsign1
 12117                                  ;   19   138 prs
 12118                                  ;   20   142 prs
 12119                                  ;   21   146 prs
 12120                                  ;   22   150 prs
 12121                                  ;   23   154 prs
 12122                                  ;   24   158 prs
 12123                                  ;   25   162 prs
 12124                                  ;   26   166 prs
 12125                                  ;   27   170 prunsign1
 12126                                  ;   28   180 prs
 12127                                  ;   29   184 prs
 12128                                  ;   30   188 prs
 12129                                  ;   31   192 expect
 12130                                  ;   32   199 expect
 12131                                  ;   33   206 error1
 12132                                  ;   34   213 prs
 12133                                  ;   35   217 prs
 12134                                  ;   36   221 prs
 12135                                  ;   37   225 strcpy
 12136                                  ;   38   232 expect
 12137                                  ;   39   239 istoken
 12138                                  ;   40   247 prc
 12139                                  ;   41   251 prscomment
 12140                                  ;   42   262 prc
 12141                                  ;   43   266 prs
 12142                                  ;   44   270 strlen
 12143                                  ;   45   277 istoken
 12144                                  ;   46   285 prc
 12145                                  ;   47   289 expect
 12146                                  ;   48   296 prunsign1
 12147                                  ;   49   306 istoken
 12148                                  ;   50   314 expect
 12149                                  ;   51   321 error1
 12150                                  ;   52   328 prs
 12151                                  ;   53   332 prs
 12152                                  ;   54   336 prs
 12153                                  ;   55   340 prs
 12154                                  ;   56   344 prs
 12155                                  ;   57   348 prs
 12156                                  ;   58   352 istoken
 12157                                  ;   59   360 prc
 12158                                  ;   60   364 istoken
 12159                                  ;   61   372 expect
 12160                                  ;   62   379 prunsign1
 12161                                  ;   63   389 prunsign1
 12162                                  ;   64   399 adrofname
 12163                                  ;   65   409 strcpy
 12164                                  ;   66   416 strcpy
 12165                                  ;   67   423 expect
 12166                                  ;   68   430 adrF
 12167                                  ;   69   435 adrofname
 12168                                  ;   70   445 prs
 12169                                  ;   71   449 prs
 12170                                  ;   72   453 prc
 12171                                  ;   73   457 pint1
 12172                                  ;   74   463 prc
 12173                                  ;   75   467 checkName
 12174                                  ;   76   477 error1
 12175                                  ;   77   484 adrofname
 12176                                  ;   78   494 eqstr
 12177                                  ;   79   500 adrofname
 12178                                  ;   80   510 eqstr
 12179                                  ;   81   516 istoken
 12180                                  ;   82   524 istoken
 12181                                  ;   83   532 istoken
 12182                                  ;   84   540 istoken
 12183                                  ;   85   548 istoken
 12184                                  ;   86   556 istoken
 12185                                  ;   87   564 istoken
 12186                                  ;   88   572 istoken
 12187                                  ;   89   580 istoken
 12188                                  ;   90   588 istoken
 12189                                  ;   91   596 name1
 12190                                  ;   92   602 error1
 12191                                  ;   93   609 getlex
 12192                                  ;   94   616 error1
 12193                                  ;   95   623 error1
 12194                                  ;   96   630 strlen
 12195                                  ;   97   637 to_far
 12196                                  ;   98   644 error1
 12197                                  ;   99   651 adrF
 12198                                  ;  100   656 strcpy
 12199                                  ;  101   663 error1
 12200                                  ;  102   670 checkName
 12201                                  ;  103   680 error1
 12202                                  ;  104   687 adrF
 12203                                  ;  105   692 strcpy
 12204                                  ;  106   699 adrF
 12205                                  ;  107   704 eqstr
 12206                                  ;  108   710 checknamelen
 12207                                  ;  109   723 strcpy
 12208                                  ;  110   730 checkFunction
 12209                                  ;  111   744 error1
 12210                                  ;  112   751 storefunc
 12211                                  ;  113   761 prs
 12212                                  ;  114   765 prs
 12213                                  ;  115   769 prs
 12214                                  ;  116   773 expect
 12215                                  ;  117   780 istoken
 12216                                  ;  118   788 typeName
 12217                                  ;  119   797 addlocal
 12218                                  ;  120   806 istoken
 12219                                  ;  121   814 expect
 12220                                  ;  122   821 expect
 12221                                  ;  123   828 isvariable
 12222                                  ;  124   839 typeName
 12223                                  ;  125   848 checknamelen
 12224                                  ;  126   861 addlocal
 12225                                  ;  127   870 istoken
 12226                                  ;  128   878 expect
 12227                                  ;  129   885 expect
 12228                                  ;  130   892 istoken
 12229                                  ;  131   900 expect
 12230                                  ;  132   907 listproc
 12231                                  ;  133   916 prs
 12232                                  ;  134   920 mkneg
 12233                                  ;  135   926 pint1
 12234                                  ;  136   932 prs
 12235                                  ;  137   936 istoken
 12236                                  ;  138   944 stmt
 12237                                  ;  139   949 prs
 12238                                  ;  140   953 prs
 12239                                  ;  141   957 prs
 12240                                  ;  142   961 prs
 12241                                  ;  143   965 prs
 12242                                  ;  144   969 strlen
 12243                                  ;  145   976 strcpy
 12244                                  ;  146   983 expect
 12245                                  ;  147   990 eqstr
 12246                                  ;  148   996 constantexpr
 12247                                  ;  149  1009 checkreg
 12248                                  ;  150  1018 doreg1
 12249                                  ;  151  1025 exprstart
 12250                                  ;  152  1035 prs
 12251                                  ;  153  1039 prs
 12252                                  ;  154  1043 expect
 12253                                  ;  155  1050 getlex
 12254                                  ;  156  1057 typeName
 12255                                  ;  157  1066 searchname
 12256                                  ;  158  1077 gettypes
 12257                                  ;  159  1086 isrelational
 12258                                  ;  160  1099 error1
 12259                                  ;  161  1106 expect
 12260                                  ;  162  1113 prs
 12261                                  ;  163  1117 prs
 12262                                  ;  164  1121 gettypes
 12263                                  ;  165  1130 prs
 12264                                  ;  166  1134 prs
 12265                                  ;  167  1138 prs
 12266                                  ;  168  1142 v
 12267                                  ;  169  1144 prs
 12268                                  ;  170  1148 prunsign1
 12269                                  ;  171  1158 cmpneg
 12270                                  ;  172  1165 prs
 12271                                  ;  173  1169 expect
 12272                                  ;  174  1176 eqstr
 12273                                  ;  175  1182 expr2
 12274                                  ;  176  1188 expr
 12275                                  ;  177  1193 getlex
 12276                                  ;  178  1200 typeName
 12277                                  ;  179  1209 error1
 12278                                  ;  180  1216 checkreg
 12279                                  ;  181  1225 doreg1
 12280                                  ;  182  1232 searchname
 12281                                  ;  183  1243 gettypes
 12282                                  ;  184  1252 error1
 12283                                  ;  185  1259 isrelational
 12284                                  ;  186  1272 error1
 12285                                  ;  187  1279 istoken
 12286                                  ;  188  1287 error1
 12287                                  ;  189  1294 istoken
 12288                                  ;  190  1302 prs
 12289                                  ;  191  1306 prs
 12290                                  ;  192  1310 prs
 12291                                  ;  193  1314 prs
 12292                                  ;  194  1318 prs
 12293                                  ;  195  1322 prs
 12294                                  ;  196  1326 v
 12295                                  ;  197  1328 prs
 12296                                  ;  198  1332 prunsign1
 12297                                  ;  199  1342 adrofname
 12298                                  ;  200  1352 prs
 12299                                  ;  201  1356 prs
 12300                                  ;  202  1360 typeName
 12301                                  ;  203  1369 checkreg
 12302                                  ;  204  1378 prs
 12303                                  ;  205  1382 printreg
 12304                                  ;  206  1391 v
 12305                                  ;  207  1393 prs
 12306                                  ;  208  1397 printreg
 12307                                  ;  209  1406 error1
 12308                                  ;  210  1413 searchname
 12309                                  ;  211  1424 gettypes
 12310                                  ;  212  1433 error1
 12311                                  ;  213  1440 prs
 12312                                  ;  214  1444 printreg
 12313                                  ;  215  1453 error1
 12314                                  ;  216  1460 prs
 12315                                  ;  217  1464 a
 12316                                  ;  218  1466 prs
 12317                                  ;  219  1470 prs
 12318                                  ;  220  1474 prs
 12319                                  ;  221  1478 prs
 12320                                  ;  222  1482 v
 12321                                  ;  223  1484 adrofname
 12322                                  ;  224  1494 prs
 12323                                  ;  225  1498 prs
 12324                                  ;  226  1502 error1
 12325                                  ;  227  1509 istoken
 12326                                  ;  228  1517 strcpy
 12327                                  ;  229  1524 istoken
 12328                                  ;  230  1532 strcpy
 12329                                  ;  231  1539 istoken
 12330                                  ;  232  1547 strcpy
 12331                                  ;  233  1554 istoken
 12332                                  ;  234  1562 strcpy
 12333                                  ;  235  1569 istoken
 12334                                  ;  236  1577 strcpy
 12335                                  ;  237  1584 istoken
 12336                                  ;  238  1592 strcpy
 12337                                  ;  239  1599 istoken
 12338                                  ;  240  1607 strcpy
 12339                                  ;  241  1614 getlex
 12340                                  ;  242  1621 isrelational
 12341                                  ;  243  1634 error1
 12342                                  ;  244  1641 strcpy
 12343                                  ;  245  1648 prnl
 12344                                  ;  246  1653 prs
 12345                                  ;  247  1657 prs
 12346                                  ;  248  1661 printreg
 12347                                  ;  249  1670 prs
 12348                                  ;  250  1674 istoken
 12349                                  ;  251  1682 prunsign1
 12350                                  ;  252  1692 typeName
 12351                                  ;  253  1701 checkreg
 12352                                  ;  254  1710 printreg
 12353                                  ;  255  1719 searchname
 12354                                  ;  256  1730 a
 12355                                  ;  257  1732 v
 12356                                  ;  258  1734 cmpneg
 12357                                  ;  259  1741 prs
 12358                                  ;  260  1745 expect
 12359                                  ;  261  1752 strlen
 12360                                  ;  262  1759 eqstr
 12361                                  ;  263  1765 eqstr
 12362                                  ;  264  1771 eqstr
 12363                                  ;  265  1777 eqstr
 12364                                  ;  266  1783 eqstr
 12365                                  ;  267  1789 eqstr
 12366                                  ;  268  1795 eqstr
 12367                                  ;  269  1801 eqstr
 12368                                  ;  270  1807 eqstr
 12369                                  ;  271  1813 eqstr
 12370                                  ;  272  1819 eqstr
 12371                                  ;  273  1825 eqstr
 12372                                  ;  274  1831 eqstr
 12373                                  ;  275  1837 eqstr
 12374                                  ;  276  1843 eqstr
 12375                                  ;  277  1849 eqstr
 12376                                  ;  278  1855 eqstr
 12377                                  ;  279  1861 eqstr
 12378                                  ;  280  1867 eqstr
 12379                                  ;  281  1873 eqstr
 12380                                  ;  282  1879 eqstr
 12381                                  ;  283  1885 eqstr
 12382                                  ;  284  1891 strlen
 12383                                  ;  285  1898 eqstr
 12384                                  ;  286  1904 eqstr
 12385                                  ;  287  1910 eqstr
 12386                                  ;  288  1916 eqstr
 12387                                  ;  289  1922 eqstr
 12388                                  ;  290  1928 eqstr
 12389                                  ;  291  1934 eqstr
 12390                                  ;  292  1940 eqstr
 12391                                  ;  293  1946 eqstr
 12392                                  ;  294  1952 prc
 12393                                  ;  295  1956 prc
 12394                                  ;  296  1960 prc
 12395                                  ;  297  1964 istoken
 12396                                  ;  298  1972 prs
 12397                                  ;  299  1976 prunsign1
 12398                                  ;  300  1986 typeName
 12399                                  ;  301  1995 checkreg
 12400                                  ;  302  2004 doreg1
 12401                                  ;  303  2011 docall1
 12402                                  ;  304  2019 isreg
 12403                                  ;  305  2025 searchname
 12404                                  ;  306  2036 gettypes
 12405                                  ;  307  2045 istoken
 12406                                  ;  308  2053 istoken
 12407                                  ;  309  2061 expect
 12408                                  ;  310  2068 searchname
 12409                                  ;  311  2079 expect
 12410                                  ;  312  2086 expect
 12411                                  ;  313  2093 gettypes
 12412                                  ;  314  2102 error1
 12413                                  ;  315  2109 istoken
 12414                                  ;  316  2117 error1
 12415                                  ;  317  2124 prs
 12416                                  ;  318  2128 prs
 12417                                  ;  319  2132 prs
 12418                                  ;  320  2136 prs
 12419                                  ;  321  2140 v
 12420                                  ;  322  2142 istoken
 12421                                  ;  323  2150 error1
 12422                                  ;  324  2157 prs
 12423                                  ;  325  2161 prs
 12424                                  ;  326  2165 prs
 12425                                  ;  327  2169 prs
 12426                                  ;  328  2173 v
 12427                                  ;  329  2175 istoken
 12428                                  ;  330  2183 compoundass
 12429                                  ;  331  2195 istoken
 12430                                  ;  332  2203 compoundass
 12431                                  ;  333  2215 istoken
 12432                                  ;  334  2223 compoundass
 12433                                  ;  335  2235 istoken
 12434                                  ;  336  2243 compoundass
 12435                                  ;  337  2255 istoken
 12436                                  ;  338  2263 error1
 12437                                  ;  339  2270 istoken
 12438                                  ;  340  2278 error1
 12439                                  ;  341  2285 istoken
 12440                                  ;  342  2293 expr
 12441                                  ;  343  2298 doassign
 12442                                  ;  344  2307 dovar1
 12443                                  ;  345  2314 istoken
 12444                                  ;  346  2322 rterm
 12445                                  ;  347  2328 istoken
 12446                                  ;  348  2336 rterm
 12447                                  ;  349  2342 istoken
 12448                                  ;  350  2350 rterm
 12449                                  ;  351  2356 istoken
 12450                                  ;  352  2364 rterm
 12451                                  ;  353  2370 istoken
 12452                                  ;  354  2378 rterm
 12453                                  ;  355  2384 istoken
 12454                                  ;  356  2392 rterm
 12455                                  ;  357  2398 istoken
 12456                                  ;  358  2406 domul
 12457                                  ;  359  2412 istoken
 12458                                  ;  360  2420 doidiv
 12459                                  ;  361  2427 istoken
 12460                                  ;  362  2435 domod
 12461                                  ;  363  2441 isrelational
 12462                                  ;  364  2454 rterm
 12463                                  ;  365  2460 cmpneg
 12464                                  ;  366  2467 error1
 12465                                  ;  367  2474 prnl
 12466                                  ;  368  2479 prs
 12467                                  ;  369  2483 prs
 12468                                  ;  370  2487 gettypes
 12469                                  ;  371  2496 prs
 12470                                  ;  372  2500 prs
 12471                                  ;  373  2504 prs
 12472                                  ;  374  2508 v
 12473                                  ;  375  2510 prs
 12474                                  ;  376  2514 expect
 12475                                  ;  377  2521 prunsign1
 12476                                  ;  378  2531 gettypes
 12477                                  ;  379  2540 prs
 12478                                  ;  380  2544 v
 12479                                  ;  381  2546 prnl
 12480                                  ;  382  2551 prs
 12481                                  ;  383  2555 prs
 12482                                  ;  384  2559 prs
 12483                                  ;  385  2563 prnl
 12484                                  ;  386  2568 prs
 12485                                  ;  387  2572 prs
 12486                                  ;  388  2576 a
 12487                                  ;  389  2578 prs
 12488                                  ;  390  2582 v
 12489                                  ;  391  2584 prs
 12490                                  ;  392  2588 prs
 12491                                  ;  393  2592 prs
 12492                                  ;  394  2596 prs
 12493                                  ;  395  2600 prs
 12494                                  ;  396  2604 prc
 12495                                  ;  397  2608 printName
 12496                                  ;  398  2618 prs
 12497                                  ;  399  2622 prnl
 12498                                  ;  400  2627 prs
 12499                                  ;  401  2631 prs
 12500                                  ;  402  2635 prs
 12501                                  ;  403  2639 prs
 12502                                  ;  404  2643 v
 12503                                  ;  405  2645 istoken
 12504                                  ;  406  2653 prnl
 12505                                  ;  407  2658 prs
 12506                                  ;  408  2662 prs
 12507                                  ;  409  2666 prs
 12508                                  ;  410  2670 prs
 12509                                  ;  411  2674 prunsign1
 12510                                  ;  412  2684 typeName
 12511                                  ;  413  2693 searchname
 12512                                  ;  414  2704 istoken
 12513                                  ;  415  2712 searchname
 12514                                  ;  416  2723 expect
 12515                                  ;  417  2730 expect
 12516                                  ;  418  2737 gettypes
 12517                                  ;  419  2746 error1
 12518                                  ;  420  2753 eqstr
 12519                                  ;  421  2759 dovar1
 12520                                  ;  422  2766 eqstr
 12521                                  ;  423  2772 doreg
 12522                                  ;  424  2778 eqstr
 12523                                  ;  425  2784 doreg
 12524                                  ;  426  2790 eqstr
 12525                                  ;  427  2796 doreg
 12526                                  ;  428  2802 eqstr
 12527                                  ;  429  2808 doreg
 12528                                  ;  430  2814 eqstr
 12529                                  ;  431  2820 doreg
 12530                                  ;  432  2826 eqstr
 12531                                  ;  433  2832 doreg
 12532                                  ;  434  2838 eqstr
 12533                                  ;  435  2844 doreg
 12534                                  ;  436  2850 eqstr
 12535                                  ;  437  2856 doreg
 12536                                  ;  438  2862 eqstr
 12537                                  ;  439  2868 doreg
 12538                                  ;  440  2874 eqstr
 12539                                  ;  441  2880 doreg
 12540                                  ;  442  2886 eqstr
 12541                                  ;  443  2892 doreg
 12542                                  ;  444  2898 eqstr
 12543                                  ;  445  2904 doreg
 12544                                  ;  446  2910 eqstr
 12545                                  ;  447  2916 doreg
 12546                                  ;  448  2922 eqstr
 12547                                  ;  449  2928 doreg
 12548                                  ;  450  2934 eqstr
 12549                                  ;  451  2940 doreg
 12550                                  ;  452  2946 expect
 12551                                  ;  453  2953 prs
 12552                                  ;  454  2957 prs
 12553                                  ;  455  2961 prs
 12554                                  ;  456  2965 istoken
 12555                                  ;  457  2973 prunsign1
 12556                                  ;  458  2983 istoken
 12557                                  ;  459  2991 searchname
 12558                                  ;  460  3002 v
 12559                                  ;  461  3004 error1
 12560                                  ;  462  3011 gettypes
 12561                                  ;  463  3020 prs
 12562                                  ;  464  3024 v
 12563                                  ;  465  3026 prs
 12564                                  ;  466  3030 prs
 12565                                  ;  467  3034 prs
 12566                                  ;  468  3038 a
 12567                                  ;  469  3040 prs
 12568                                  ;  470  3044 prs
 12569                                  ;  471  3048 prunsign1
 12570                                  ;  472  3058 v
 12571                                  ;  473  3060 prs
 12572                                  ;  474  3064 prs
 12573                                  ;  475  3068 printName
 12574                                  ;  476  3078 prs
 12575                                  ;  477  3082 prs
 12576                                  ;  478  3086 prs
 12577                                  ;  479  3090 prs
 12578                                  ;  480  3094 prs
 12579                                  ;  481  3098 v
 12580                                  ;  482  3100 prs
 12581                                  ;  483  3104 prs
 12582                                  ;  484  3108 prs
 12583                                  ;  485  3112 prs
 12584                                  ;  486  3116 v
 12585                                  ;  487  3118 prs
 12586                                  ;  488  3122 prs
 12587                                  ;  489  3126 prs
 12588                                  ;  490  3130 prs
 12589                                  ;  491  3134 v
 12590                                  ;  492  3136 prs
 12591                                  ;  493  3140 rterm
 12592                                  ;  494  3146 istoken
 12593                                  ;  495  3154 prs
 12594                                  ;  496  3158 prunsign1
 12595                                  ;  497  3168 prs
 12596                                  ;  498  3172 error1
 12597                                  ;  499  3179 istoken
 12598                                  ;  500  3187 prs
 12599                                  ;  501  3191 prunsign1
 12600                                  ;  502  3201 prs
 12601                                  ;  503  3205 prs
 12602                                  ;  504  3209 typeName
 12603                                  ;  505  3218 searchname
 12604                                  ;  506  3229 error1
 12605                                  ;  507  3236 gettypes
 12606                                  ;  508  3245 error1
 12607                                  ;  509  3252 error1
 12608                                  ;  510  3259 prs
 12609                                  ;  511  3263 v
 12610                                  ;  512  3265 prs
 12611                                  ;  513  3269 prs
 12612                                  ;  514  3273 doidiv
 12613                                  ;  515  3280 prs
 12614                                  ;  516  3284 checknamelen
 12615                                  ;  517  3297 strcpy
 12616                                  ;  518  3304 storecall
 12617                                  ;  519  3314 expect
 12618                                  ;  520  3321 istoken
 12619                                  ;  521  3329 error1
 12620                                  ;  522  3336 istoken
 12621                                  ;  523  3344 istoken
 12622                                  ;  524  3352 eprs
 12623                                  ;  525  3357 eprs
 12624                                  ;  526  3362 eprc
 12625                                  ;  527  3367 eprnum
 12626                                  ;  528  3374 eprs
 12627                                  ;  529  3379 eprc
 12628                                  ;  530  3384 eprs
 12629                                  ;  531  3389 eprc
 12630                                  ;  532  3394 eprs
 12631                                  ;  533  3399 istoken
 12632                                  ;  534  3407 name1
 12633                                  ;  535  3413 searchname
 12634                                  ;  536  3424 istoken
 12635                                  ;  537  3432 checkreg
 12636                                  ;  538  3441 searchname
 12637                                  ;  539  3452 error1
 12638                                  ;  540  3459 istoken
 12639                                  ;  541  3467 expect
 12640                                  ;  542  3474 prs
 12641                                  ;  543  3478 pint1
 12642                                  ;  544  3484 prs
 12643                                  ;  545  3488 prs
 12644                                  ;  546  3492 prs
 12645                                  ;  547  3496 prc
 12646                                  ;  548  3500 pint1
 12647                                  ;  549  3506 prs
 12648                                  ;  550  3510 prs
 12649                                  ;  551  3514 v
 12650                                  ;  552  3516 prs
 12651                                  ;  553  3520 gettypes
 12652                                  ;  554  3529 prs
 12653                                  ;  555  3533 prs
 12654                                  ;  556  3537 v
 12655                                  ;  557  3539 prs
 12656                                  ;  558  3543 prs
 12657                                  ;  559  3547 v
 12658                                  ;  560  3549 prs
 12659                                  ;  561  3553 prs
 12660                                  ;  562  3557 printreg
 12661                                  ;  563  3566 prs
 12662                                  ;  564  3570 prs
 12663                                  ;  565  3574 prs
 12664                                  ;  566  3578 pint1
 12665                                  ;  567  3584 getarg
 12666                                  ;  568  3591 setblock
 12667                                  ;  569  3600 error1
 12668                                  ;  570  3607 allocmem
 12669                                  ;  571  3616 error1
 12670                                  ;  572  3623 getfirstchar
 12671                                  ;  573  3636 parse
 12672                                  ;  574  3642 checkcalls
 12673                                  ;  575  3653 epilog
 12674                                  ;  576  3660 fgets1
 12675                                  ;  577  3667 cputs
 12676                                  ;  578  3673 cputs
 12677                                  ;  579  3679 readRL
 12678                                  ;  580  3686 prnl
 12679                                  ;  581  3691 strcpy
 12680                                  ;  582  3698 instr2
 12681                                  ;  583  3705 strcat1
 12682                                  ;  584  3713 toupper
 12683                                  ;  585  3721 instr2
 12684                                  ;  586  3728 strcpy
 12685                                  ;  587  3735 cputs
 12686                                  ;  588  3741 exitR
 12687                                  ;  589  3747 strcpy
 12688                                  ;  590  3754 strlen
 12689                                  ;  591  3761 openR
 12690                                  ;  592  3767 cputs
 12691                                  ;  593  3773 cputs
 12692                                  ;  594  3779 exitR
 12693                                  ;  595  3785 creatR
 12694                                  ;  596  3792 cputs
 12695                                  ;  597  3798 cputs
 12696                                  ;  598  3804 exitR
 12697                                  ;  599  3810 prs
 12698                                  ;  600  3814 prs
 12699                                  ;  601  3818 prs
 12700                                  ;  602  3822 pint1
 12701                                  ;  603  3828 prs
 12702                                  ;  604  3832 prs
 12703                                  ;  605  3836 prs
 12704                                  ;  606  3840 prs
 12705                                  ;  607  3844 prs
 12706                                  ;  608  3848 prs
 12707                                  ;  609  3852 prs
 12708                                  ;  610  3856 prs
 12709                                  ;  611  3860 getlex
 12710                                  ;  612  3867 istoken
 12711                                  ;  613  3875 istoken
 12712                                  ;  614  3883 dodefine
 12713                                  ;  615  3892 istoken
 12714                                  ;  616  3900 doinclude
 12715                                  ;  617  3910 error1
 12716                                  ;  618  3917 typeName
 12717                                  ;  619  3926 dofunc
 12718                                  ;  620  3933 doglob
 12719                                  ;  621  3940 prs
 12720                                  ;  622  3944 from_far
 12721                                  ;  623  3953 adrF
 12722                                  ;  624  3958 eqstr
 12723                                  ;  625  3964 prs
 12724                                  ;  626  3968 prs
 12725                                  ;  627  3972 doar
 12726                                  ;  628  3977 prs
 12727                                  ;  629  3981 cputs
 12728                                  ;  630  3987 cputs
 12729                                  ;  631  3993 pint
 12730                                  ;  632  3998 prs
 12731                                  ;  633  4002 printint51
 12732                                  ;  634  4013 openR
 12733                                  ;  635  4019 cputs
 12734                                  ;  636  4025 cputs
 12735                                  ;  637  4031 exitR
 12736                                  ;  638  4037 prs
 12737                                  ;  639  4041 prs
 12738                                  ;  640  4045 getfirstchar
 12739                                  ;  641  4058 getfunctionhead
 12740                                  ;  642  4074 from_far
 12741                                  ;  643  4083 eqstr
 12742                                  ;  644  4089 prs
 12743                                  ;  645  4093 printint51
 12744                                  ;  646  4104 prs
 12745                                  ;  647  4108 prs
 12746                                  ;  648  4112 dofunc
 12747                                  ;  649  4119 prs
 12748                                  ;  650  4123 checkcalls
 12749                                  ;  651  4134 putch
 12750                                  ;  652  4140 cputs
 12751                                  ;  653  4146 error1
 12752                                  ;  654  4153 getlex
 12753                                  ;  655  4160 istoken
 12754                                  ;  656  4168 getlex
 12755                                  ;  657  4175 prs
 12756                                  ;  658  4179 prs
 12757                                  ;  659  4183 openR
 12758                                  ;  660  4189 prs
 12759                                  ;  661  4193 prs
 12760                                  ;  662  4197 error1
 12761                                  ;  663  4204 parse
 12762                                  ;  664  4210 prs
 12763                                  ;  665  4214 prs
 12764                                  ;  666  4218 getfirstchar
 12765                                  ;  667  4231 getlex
 12766                                  ;  668  4238 eqstr
 12767                                  ;  669  4244 getlex
 12768                                  ;  670  4251 eqstr
 12769                                  ;  671  4257 getlex
 12770                                  ;  672  4264 prs
 12771                                  ;  673  4268 strcpy
 12772                                  ;  674  4275 prs
 12773                                  ;  675  4279 error1
 12774                                  ;  676  4286 getlex
 12775                                  ;  677  4293 expect
 12776                                  ;  678  4300 error1
 12777                                  ;  679  4307 strlen
 12778                                  ;  680  4314 error1
 12779                                  ;  681  4321 adrofname
 12780                                  ;  682  4331 strcpy
 12781                                  ;  683  4338 expect
 12782                                  ;  684  4345 istoken
 12783                                  ;  685  4353 istoken
 12784                                  ;  686  4361 stmt
 12785                                  ;  687  4366 istoken
 12786                                  ;  688  4374 doif
 12787                                  ;  689  4379 istoken
 12788                                  ;  690  4387 dodo
 12789                                  ;  691  4392 istoken
 12790                                  ;  692  4400 dowhile
 12791                                  ;  693  4408 istoken
 12792                                  ;  694  4416 prs
 12793                                  ;  695  4420 name1
 12794                                  ;  696  4426 prs
 12795                                  ;  697  4430 expect
 12796                                  ;  698  4437 prs
 12797                                  ;  699  4441 next
 12798                                  ;  700  4446 prc
 12799                                  ;  701  4450 next
 12800                                  ;  702  4455 getlex
 12801                                  ;  703  4462 istoken
 12802                                  ;  704  4470 prs
 12803                                  ;  705  4474 next
 12804                                  ;  706  4479 prc
 12805                                  ;  707  4483 next
 12806                                  ;  708  4488 getlex
 12807                                  ;  709  4495 error1
 12808                                  ;  710  4502 istoken
 12809                                  ;  711  4510 prs
 12810                                  ;  712  4514 expect
 12811                                  ;  713  4521 prunsign1
 12812                                  ;  714  4531 expect
 12813                                  ;  715  4538 istoken
 12814                                  ;  716  4546 doifcarry
 12815                                  ;  717  4556 istoken
 12816                                  ;  718  4564 doifzero
 12817                                  ;  719  4573 istoken
 12818                                  ;  720  4581 doemit
 12819                                  ;  721  4588 istoken
 12820                                  ;  722  4596 istoken
 12821                                  ;  723  4604 exprstart
 12822                                  ;  724  4614 prs
 12823                                  ;  725  4618 expect
 12824                                  ;  726  4625 prs
 12825                                  ;  727  4629 prs
 12826                                  ;  728  4633 prc
 12827                                  ;  729  4637 expect
 12828                                  ;  730  4644 expect
 12829                                  ;  731  4651 exprstart
 12830                                  ;  732  4661 expect
 12831                                  ;  733  4668 prs
 12832                                  ;  734  4672 getlex
 12833                                  ;  735  4679 prunsign1
 12834                                  ;  736  4689 getlex
 12835                                  ;  737  4696 prc
 12836                                  ;  738  4700 expect
 12837                                  ;  739  4707 prs
 12838                                  ;  740  4711 prs
 12839                                  ;  741  4715 prs
 12840                                  ;  742  4719 prs
 12841                                  ;  743  4723 prs
 12842                                  ;  744  4727 prunsign1
 12843                                  ;  745  4737 prs
 12844                                  ;  746  4741 prs
 12845                                  ;  747  4745 prunsign1
 12846                                  ;  748  4755 prs
 12847                                  ;  749  4759 prs
 12848                                  ;  750  4763 prs
 12849                                  ;  751  4767 error1
 12850                                  ;  752  4774 prs
 12851                                  ;  753  4778 prs
 12852                                  ;  754  4782 pint1
 12853                                  ;  755  4788 prc
 12854                                  ;  756  4792 prs
 12855                                  ;  757  4796 prs
 12856                                  ;  758  4800 pint1
 12857                                  ;  759  4806 pexpr
 12858                                  ;  760  4812 pint1
 12859                                  ;  761  4818 stmt
 12860                                  ;  762  4823 istoken
 12861                                  ;  763  4831 prjump
 12862                                  ;  764  4838 prlabel
 12863                                  ;  765  4846 stmt
 12864                                  ;  766  4851 prlabel
 12865                                  ;  767  4859 prlabel
 12866                                  ;  768  4867 prs
 12867                                  ;  769  4871 prs
 12868                                  ;  770  4875 pint1
 12869                                  ;  771  4881 stmt
 12870                                  ;  772  4886 prlabel
 12871                                  ;  773  4894 prs
 12872                                  ;  774  4898 prs
 12873                                  ;  775  4902 pint1
 12874                                  ;  776  4908 stmt
 12875                                  ;  777  4913 prlabel
 12876                                  ;  778  4921 prlabel
 12877                                  ;  779  4929 stmt
 12878                                  ;  780  4934 expect
 12879                                  ;  781  4941 pexpr
 12880                                  ;  782  4947 pint1
 12881                                  ;  783  4953 prjump
 12882                                  ;  784  4960 prlabel
 12883                                  ;  785  4968 prlabel
 12884                                  ;  786  4976 pexpr
 12885                                  ;  787  4982 pint1
 12886                                  ;  788  4988 stmt
 12887                                  ;  789  4993 prjump
 12888                                  ;  790  5000 prlabel
 12889                                  ;  791  5008 getlex
 12890                                  ;  792  5015 next
 12891                                  ;  793  5020 next
 12892                                  ;  794  5025 next
 12893                                  ;  795  5030 next
 12894                                  ;  796  5035 next
 12895                                  ;  797  5040 next
 12896                                  ;  798  5045 next
 12897                                  ;  799  5050 next
 12898                                  ;  800  5055 next
 12899                                  ;  801  5060 next
 12900                                  ;  802  5065 next
 12901                                  ;  803  5070 next
 12902                                  ;  804  5075 next
 12903                                  ;  805  5080 next
 12904                                  ;  806  5085 next
 12905                                  ;  807  5090 instr1
 12906                                  ;  808  5097 next
 12907                                  ;  809  5102 getlex
 12908                                  ;  810  5109 next
 12909                                  ;  811  5114 next
 12910                                  ;  812  5119 getlex
 12911                                  ;  813  5126 getstring
 12912                                  ;  814  5136 digit
 12913                                  ;  815  5142 getdigit
 12914                                  ;  816  5151 next
 12915                                  ;  817  5156 next
 12916                                  ;  818  5161 next
 12917                                  ;  819  5166 letter
 12918                                  ;  820  5173 strcpy
 12919                                  ;  821  5180 letter
 12920                                  ;  822  5187 next
 12921                                  ;  823  5192 eqstr
 12922                                  ;  824  5198 eqstr
 12923                                  ;  825  5204 eqstr
 12924                                  ;  826  5210 eqstr
 12925                                  ;  827  5216 eqstr
 12926                                  ;  828  5222 eqstr
 12927                                  ;  829  5228 eqstr
 12928                                  ;  830  5234 eqstr
 12929                                  ;  831  5240 eqstr
 12930                                  ;  832  5246 eqstr
 12931                                  ;  833  5252 eqstr
 12932                                  ;  834  5258 eqstr
 12933                                  ;  835  5264 eqstr
 12934                                  ;  836  5270 eqstr
 12935                                  ;  837  5276 eqstr
 12936                                  ;  838  5282 eqstr
 12937                                  ;  839  5288 eqstr
 12938                                  ;  840  5294 eqstr
 12939                                  ;  841  5300 eqstr
 12940                                  ;  842  5306 eqstr
 12941                                  ;  843  5312 eqstr
 12942                                  ;  844  5318 eqstr
 12943                                  ;  845  5324 convertdefine
 12944                                  ;  846  5338 strcpy
 12945                                  ;  847  5345 error1
 12946                                  ;  848  5352 adrofname
 12947                                  ;  849  5362 eqstr
 12948                                  ;  850  5368 next
 12949                                  ;  851  5373 letter
 12950                                  ;  852  5380 next
 12951                                  ;  853  5385 digit
 12952                                  ;  854  5391 next
 12953                                  ;  855  5396 next
 12954                                  ;  856  5401 next
 12955                                  ;  857  5406 fgets1
 12956                                  ;  858  5413 getlex
 12957                                  ;  859  5420 istoken
 12958                                  ;  860  5428 prs
 12959                                  ;  861  5432 listproc
 12960                                  ;  862  5441 prs
 12961                                  ;  863  5445 pint1
 12962                                  ;  864  5451 error1
 12963                                  ;  865  5458 eprc
 12964                                  ;  866  5463 writetty
 12965                                  ;  867  5472 writetty
 12966                                  ;  868  5481 fputcR
 12967                                  ;  869  5488 prc
 12968                                  ;  870  5492 prs
 12969                                  ;  871  5496 prc
 12970                                  ;  872  5500 eprc
 12971                                  ;  873  5505 mkneg
 12972                                  ;  874  5511 eprnum
 12973                                  ;  875  5518 eprc
 12974                                  ;  876  5523 prc
 12975                                  ;  877  5527 mkneg
 12976                                  ;  878  5533 pint1
 12977                                  ;  879  5539 prc
 12978                                  ;  880  5543 prunsign1
 12979                                  ;  881  5553 prc
 12980                                  ;  882  5557 prc
 12981                                  ;  883  5561 prc
 12982                                  ;  884  5565 prc
 12983                                  ;  885  5569 prc
 12984                                  ;  886  5573 prunsign1
 12985                                  ;  887  5583 printinputline
 12986                                  ;  888  5598 readR
 12987                                  ;  889  5604 prs
 12988                                  ;  890  5608 prunsign1
 12989                                  ;  891  5618 prc
 12990                                  ;  892  5622 prscomment
 12991                                  ;  893  5633 fcloseR
 12992                                  ;  894  5641 fcloseR
 12993                                  ;  895  5649 exitR
 12994                                  ;  896  5655 prnl
 12995                                  ;  897  5660 prscomment
 12996                                  ;  898  5671 prs
 12997                                  ;  899  5675 prunsign1
 12998                                  ;  900  5685 prs
 12999                                  ;  901  5689 prs
 13000                                  ;  902  5693 prs
 13001                                  ;  903  5697 pint1
 13002                                  ;  904  5703 prs
 13003                                  ;  905  5707 prunsign1
 13004                                  ;  906  5717 prs
 13005                                  ;  907  5721 prc
 13006                                  ;  908  5725 prs
 13007                                  ;  909  5729 pint1
 13008                                  ;  910  5735 prs
 13009                                  ;  911  5739 prs
 13010                                  ;  912  5743 end1
 13011                                  ;  913  5748 prs
 13012                                  ;  914  5752 prs
 13013                                  ;  915  5756 prs
 13014                                  ;  916  5760 prunsign1
 13015                                  ;  917  5770 prs
 13016                                  ;  918  5774 listvar
 13017                                  ;  919  5782 prs
 13018                                  ;  920  5786 printint51
 13019                                  ;  921  5797 prc
 13020                                  ;  922  5801 prs
 13021                                  ;  923  5805 prs
 13022                                  ;  924  5809 prs
 13023                                  ;  925  5813 prs
 13024                                  ;  926  5817 prs
 13025                                  ;  927  5821 prs
 13026                                  ;  928  5825 prs
 13027                                  ;  929  5829 prs
 13028                                  ;  930  5833 prs
 13029                                  ;  931  5837 printint51
 13030                                  ;  932  5848 printint51
 13031                                  ;  933  5859 prs
 13032                                  ;  934  5863 prs
 13033                                  ;  935  5867 prc
 13034                                  ;  936  5871 adrofname
 13035                                  ;  937  5881 prs
 13036                                  ;  938  5885 prc
 13037                                  ;  939  5889 prunsign1
 13038                                  ;  940  5899 prc
 13039                                  ;  941  5903 prunsign1
 13040                                  ;  942  5913 prc
 13041                                  ;  943  5917 prs
 13042                                  ;  944  5921 prc
 13043                                  ;  945  5925 pint1
 13044                                  ;  946  5931 prs
 13045                                  ;  947  5935 calllisting
 13046                                  ;  948  5947 prs
 13047                                  ;  949  5951 printint51
 13048                                  ;  950  5962 prc
 13049                                  ;  951  5966 prs
 13050                                  ;  952  5970 printint51
 13051                                  ;  953  5981 prc
 13052                                  ;  954  5985 from_far
 13053                                  ;  955  5994 prs
 13054                                  ;  956  5998 adrF
 13055                                  ;  957  6003 from_far
 13056                                  ;  958  6012 eqstr
 13057                                  ;  959  6018 prs
 13058                                  ;  960  6022 countcalls
 13059                                  ;  961  6033 funclisting
 13060                                  ;  962  6045 prs
 13061                                  ;  963  6049 printint51
 13062                                  ;  964  6060 printint51
 13063                                  ;  965  6071 prs
 13064                                  ;  966  6075 printint51
 13065                                  ;  967  6086 prc
 13066                                  ;  968  6090 prs
 13067                                  ;  969  6094 prs
 13068                                  ;  970  6098 prs
 13069                                  ;  971  6102 prs
 13070                                  ;  972  6106 prc
 13071                                  ;  973  6110 prc
 13072                                  ;  974  6114 adrF
 13073                                  ;  975  6119 prs
 13074                                  ;  976  6123 strcpy
 13075                                  ;  977  6130 storefunc
 13076                                  ;  978  6140 prs
 13077                                  ;  979  6144 prs
 13078                                  ;  980  6148 listvar
 13079                                  ;  981  6156 listfunc
 13080                                  ;  982  6165 listcall
 13081                                  ;  983  6174 prs
 13082                                  ;  984  6178 prs
 13083                                  ;  985  6182 prs
 13084                                  ;  986  6186 prs
 13085                                  ;  987  6190 prs
 13086                                  ;  988  6194 printint51
 13087                                  ;  989  6205 prs
 13088                                  ;  990  6209 printint51
 13089                                  ;  991  6220 prs
 13090                                  ;  992  6224 printint51
 13091                                  ;  993  6235 prs
 13092                                  ;  994  6239 printint51
 13093                                  ;  995  6250 prs
 13094                                  ;  996  6254 printint51
 13095                                  ;  997  6265 prs
 13096                                  ;  998  6269 printint51
 13097                                  ;  999  6280 prs
 13098                                  ; 1000  6284 printint51
 13099                                  ; 1001  6295 prs
 13100                                  ; 1002  6299 printint51
 13101                                  ; 1003  6310 prs
 13102                                  ; 1004  6314 printint51
 13103                                  ; 1005  6325 prs
 13104                                  ; 1006  6329 printint51
 13105                                  ; 1007  6340 prs
 13106                                  ; 1008  6344 printint51
 13107                                  ; 1009  6355 prs
 13108                                  ; 1010  6359 printint51
 13109                                  ; 1011  6370 prs
 13110                                  ; 1012  6374 prs
 13111                                  ; 1013  6378 prunsign1
 13112                                  ; 1014  6388 prs
 13113                                  ; 1015  6392 printint51
 13114                                  ; 1016  6403 prs
 13115                                  ; 1017  6407 prs
 13116                                  ; 1018  6411 prs
 13117                                  ; 1019  6415 prs
 13118                                  ; 1020  6419 printint51
 13119                                  ; 1021  6430 prs
 13120                                  ; 1022  6434 printint51
 13121                                  ; 1023  6445 prs
 13122                                  ; 1024  6449 printint51
 13123                                  ; 1025  6460 prs
 13124                                  ; 1026  6464 prs
 13125                                  ; 1027  6468 end1
 13126                                  ; 1028  6473 DosInt
 13127                                  ; 1029  6480 DosInt
 13128                                  ; 1030  6487 writetty
 13129                                  ; 1031  6496 writetty
 13130                                  ; 1032  6505 putch
 13131                                  ; 1033  6511 prc
 13132                                  ; 1034  6515 mkneg
 13133                                  ; 1035  6521 pint
 13134                                  ; 1036  6526 putch
 13135                                  ; 1037  6532 digit
 13136                                  ; 1038  6538 strcpy
 13137                                  ; 1039  6545 DosInt
 13138                                  ; 1040  6552 DosInt
 13139                                  ; 1041  6559 DosInt
 13140                                  ; 1042  6566 DosInt
 13141                                  ; 1043  6573 DosInt
 13142                                  ;Input: A.C, List: A.S,  Lines: 1029
 13143                                  ;Glob. variables:  140 max.:  200
 13144                                  ;Functions      :  114 max.:  300
 13145                                  ;Calls          : 1044 max.: 2000, NameField: 6580 max.:    65535
 13146                                  ;Code until     :23721 max.: 30000, free: 6279
 13147                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 13148                                  ;Max. Const in 'epilog' :  971 max. 3000, free: 2029
