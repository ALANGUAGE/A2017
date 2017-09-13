     1                                  
     2                                  ; A.COM CComp V0.9, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
     3                                  org  256 
     4 00000000 E96E2D                  jmp main
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
   102                                  ;-32 #define T_SHORT       534
   103                                  
   104                                  
   105                                  ;-33 //T_INT8 540   T_UINT8 541   T_INT16 542   T_UINT16 543   T_INT32 544
   106                                  
   107                                  
   108                                  ;-34 #define T_UINT32      545
   109                                  
   110                                  
   111                                  ;-35 //T_INT64 546   T_UINT64 547
   112                                  
   113                                  
   114                                  ;-36 #define T_INTH        600
   115                                  
   116                                  
   117                                  ;-37 #define T_IFCARRY     601
   118                                  
   119                                  
   120                                  ;-38 #define T_IFZERO      602
   121                                  
   122                                  
   123                                  ;-39 #define T_EQ          806
   124                                  
   125                                  
   126                                  ;-40 #define T_NE          807
   127                                  
   128                                  
   129                                  ;-41 #define T_GE          811
   130                                  
   131                                  
   132                                  ;-42 #define T_LE          824
   133                                  
   134                                  
   135                                  ;-43 #define T_PLUSPLUS   1219
   136                                  
   137                                  
   138                                  ;-44 #define T_MINUSMINUS 1225
   139                                  
   140                                  
   141                                  ;-45 #define T_PLUSASS    1230
   142                                  
   143                                  
   144                                  ;-46 #define T_MINUSASS   1231
   145                                  
   146                                  
   147                                  ;-47 #define T_MULASS     1232
   148                                  
   149                                  
   150                                  ;-48 #define T_DIVASS     1233
   151                                  
   152                                  
   153                                  ;-49 #define T_ANDASS     1234
   154                                  
   155                                  
   156                                  ;-50 #define T_ORASS      1235
   157                                  
   158                                  
   159                                  ;-51 #define T_LESSLESS   1240
   160                                  
   161                                  
   162                                  ;-52 #define T_GREATGREAT 1241
   163                                  
   164                                  
   165                                  ;-53 #define COMAX        3000
   166                                  
   167                                  
   168                                  ;-54 #define CMDLENMAX      67
   169                                  
   170                                  
   171                                  ;-55 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;
   172                                  
   173 00000014 3075                    ORGDATAORIG dw 30000
   174 00000016 3075                    orgData dw 30000
   175                                  
   176                                  ;-56 char co[COMAX];    int maxco=0;      int maxco1=0;
   177                                  
   178                                  section .bss
   179                                  absolute 30000
   180 00007530 <res 00000BB8>          co resb 3000
   181                                  section .text
   182 00000018 0000                    maxco dw 0
   183 0000001A 0000                    maxco1 dw 0
   184                                  
   185                                  ;-57 char coname[CMDLENMAX];              char *cloc=0;
   186                                  
   187                                  section .bss
   188                                  absolute 33000
   189 000080E8 <res 00000043>          coname resb 67
   190                                  section .text
   191 0000001C 0000                    cloc dw 0
   192                                  
   193                                  ;-58 int fdin=0;        int fdout=0;      char symbol[128];
   194                                  
   195 0000001E 0000                    fdin dw 0
   196 00000020 0000                    fdout dw 0
   197                                  section .bss
   198                                  absolute 33067
   199 0000812B <res 00000080>          symbol resb 128
   200                                  section .text
   201                                  
   202                                  ;-59 char fname[CMDLENMAX];               char namein[CMDLENMAX];
   203                                  
   204                                  section .bss
   205                                  absolute 33195
   206 000081AB <res 00000043>          fname resb 67
   207                                  section .text
   208                                  section .bss
   209                                  absolute 33262
   210 000081EE <res 00000043>          namein resb 67
   211                                  section .text
   212                                  
   213                                  ;-60 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];
   214                                  
   215                                  section .bss
   216                                  absolute 33329
   217 00008231 <res 00000043>          namelst resb 67
   218                                  section .text
   219                                  section .bss
   220                                  absolute 33396
   221 00008274 <res 00000043>          archivename resb 67
   222                                  section .text
   223                                  
   224                                  ;-61 int token=0;       char globC=0;     int spalte=0;
   225                                  
   226 00000022 0000                    token dw 0
   227 00000024 00                      globC db 0
   228 00000025 0000                    spalte dw 0
   229                                  
   230                                  ;-62 char thechar=0;    int iscmp=0;      int nconst=0;
   231                                  
   232 00000027 00                      thechar db 0
   233 00000028 0000                    iscmp dw 0
   234 0000002A 0000                    nconst dw 0
   235                                  
   236                                  ;-63 int nreturn=0;     int nlabel=0;     int callrecursive=0;
   237                                  
   238 0000002C 0000                    nreturn dw 0
   239 0000002E 0000                    nlabel dw 0
   240 00000030 0000                    callrecursive dw 0
   241                                  
   242                                  ;-64 int GTop=1;        int LTop=150;
   243                                  
   244 00000032 0100                    GTop dw 1
   245 00000034 9600                    LTop dw 150
   246                                  
   247                                  ;-65 unsigned int lexval=0;
   248                                  
   249 00000036 0000                    lexval dw 0
   250                                  
   251                                  ;-66 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#
   252                                  
   253 00000038 0000                    typei dw 0
   254 0000003A 00                      istype db 0
   255                                  section .bss
   256                                  absolute 33463
   257 000082B7 <res 0000012C>          GType resb 300
   258                                  section .text
   259                                  
   260                                  ;-67 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
   261                                  
   262 0000003B 0000                    signi dw 0
   263 0000003D 00                      issign db 0
   264                                  section .bss
   265                                  absolute 33763
   266 000083E3 <res 0000012C>          GSign resb 300
   267                                  section .text
   268                                  
   269                                  ;-68 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
   270                                  
   271 0000003E 0000                    widthi dw 0
   272 00000040 00                      iswidth db 0
   273                                  section .bss
   274                                  absolute 34063
   275 0000850F <res 0000012C>          GWidth resb 300
   276                                  section .text
   277                                  
   278                                  ;-69              int GAdr[VARMAX]; int  GUsed [VARMAX];
   279                                  
   280                                  section .bss
   281                                  absolute 34363
   282 0000863B <res 00000258>          GAdr resw 300
   283                                  section .text
   284                                  section .bss
   285                                  absolute 34963
   286 00008893 <res 00000258>          GUsed resw 300
   287                                  section .text
   288                                  
   289                                  ;-70 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
   290                                  
   291 00000041 0000                    wi dw 0
   292                                  section .bss
   293                                  absolute 35563
   294 00008AEB <res 00000258>          GData resw 300
   295                                  section .text
   296                                  section .bss
   297                                  absolute 36163
   298 00008D43 <res 000012C0>          GNameField resb 4800
   299                                  section .text
   300                                  
   301                                  ;-71 int  FTop=0;                 int  CTop=0;
   302                                  
   303 00000043 0000                    FTop dw 0
   304 00000045 0000                    CTop dw 0
   305                                  
   306                                  ;-72 char FType [FUNCMAX];        char CType[CALLMAX];
   307                                  
   308                                  section .bss
   309                                  absolute 40963
   310 0000A003 <res 0000012C>          FType resb 300
   311                                  section .text
   312                                  section .bss
   313                                  absolute 41263
   314 0000A12F <res 000007D0>          CType resb 2000
   315                                  section .text
   316                                  
   317                                  ;-73 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
   318                                  
   319                                  section .bss
   320                                  absolute 43263
   321 0000A8FF <res 00000258>          FAdr resw 300
   322                                  section .text
   323                                  section .bss
   324                                  absolute 43863
   325 0000AB57 <res 00000FA0>          CAdr resw 2000
   326                                  section .text
   327                                  
   328                                  ;-74 int  FCalls[FUNCMAX];
   329                                  
   330                                  section .bss
   331                                  absolute 47863
   332 0000BAF7 <res 00000258>          FCalls resw 300
   333                                  section .text
   334                                  
   335                                  ;-75 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
   336                                  
   337                                  section .bss
   338                                  absolute 48463
   339 0000BD4F <res 000012C0>          FNameField resb 4800
   340                                  section .text
   341                                  
   342                                  ;-76 char NameA[]="12345678901234567890123456789012"; //must be in low memory
   343                                  
   344 00000047 313233343536373839-     NameA db "12345678901234567890123456789012",0
   345 00000050 303132333435363738-
   346 00000059 393031323334353637-
   347 00000062 383930313200       
   348                                  
   349                                  ;-77 char fgetsdest[128];         unsigned char *CNameTop=0;
   350                                  
   351                                  section .bss
   352                                  absolute 53263
   353 0000D00F <res 00000080>          fgetsdest resb 128
   354                                  section .text
   355 00000068 0000                    CNameTop dw 0
   356                                  
   357                                  ;-78 unsigned char *fgetsp=0;     unsigned int segE;
   358                                  
   359 0000006A 0000                    fgetsp dw 0
   360 0000006C 0000                    segE dw 0
   361                                  
   362                                  ;-79 unsigned int lineno=1;       unsigned int linenoinclude=1;
   363                                  
   364 0000006E 0100                    lineno dw 1
   365 00000070 0100                    linenoinclude dw 1
   366                                  
   367                                  ;-80 unsigned char *pt=0;         unsigned char *p1=0;
   368                                  
   369 00000072 0000                    pt dw 0
   370 00000074 0000                    p1 dw 0
   371                                  
   372                                  ;-81 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;
   373                                  
   374 00000076 0000                    DOS_ERR dw 0
   375 00000078 0000                    DOS_NoBytes dw 0
   376 0000007A 00                      DOS_ByteRead db 0
   377                                  
   378                                  ;-82 
   379                                  
   380                                  
   381                                  ;-83 int tt1=7; int tt2; long ex;
   382                                  
   383 0000007B 0700                    tt1 dw 7
   384 0000007D 0000                    tt2 dw 0
   385 0000007F 00000000                ex dd 0
   386                                  
   387                                  ;-84 void ttt(long par1) {
   388                                  
   389                                  
   390                                  ttt:  ; *** PROC ***
   391                                  
   392                                  ;-85   int i1; long in; int i9;
   393                                  
   394                                  
   395                                  ;-86   ttt(in, ex );
   396                                  
   397                                  ;Function : ttt, Number of local variables: 4
   398                                  ;   # type sign width addr used name   list of local variables
   399                                  ;  200 var sign dwrd    84 NULL par1 = bp+4
   400                                  ;  201 var sign word    85 NULL i1 = bp-2
   401                                  ;  202 var sign dwrd    85 NULL in = bp-6
   402                                  ;  203 var sign word    85 NULL i9 = bp-8;
   403 00000083 C8080000                 ENTER  8,0
   404 00000087 A0[7F00]                 mov al, byte [ex]
   405 0000008A B400                     mov ah, 0
   406 0000008C 50                       push ax
   407 0000008D 8A46FA                   mov al, byte [bp-6]
   408 00000090 B400                     mov ah, 0
   409 00000092 50                       push ax
   410 00000093 E8EDFF                   call ttt
   411 00000096 83C404                   add  sp, 4
   412                                  
   413                                  ;-87  si = &FTop;  si=FTop;
   414                                  
   415 00000099 BE[4300]                 mov  si, FTop
   416 0000009C 8B36[4300]               mov  si, [FTop]
   417                                  
   418                                  ;-88  si= &FAdr;     si=FAdr;
   419                                  
   420 000000A0 BEFFA8                   mov  si, FAdr
   421 000000A3 8B36FFA8                 mov  si, [FAdr]
   422                                  
   423                                  ;-89  &FTop;         FTop;
   424                                  
   425 000000A7 B8[4300]                 mov ax, FTop
   426 000000AA A1[4300]                 mov ax, [FTop]
   427                                  
   428                                  ;-90   }
   429                                  
   430                                  
   431                                  ;-91 int a(unsigned int i) {  printName(i);}//address
   432 000000AD C9                       LEAVE
   433 000000AE C3                       ret
   434                                  ; ENDP
   435                                  
   436                                  a:  ; *** PROC ***
   437                                  ;Function : a, Number of local variables: 1
   438                                  ;   # type sign width addr used name   list of local variables
   439                                  ;  200 var unsg word    91 NULL i = bp+4;
   440 000000AF C8000000                 ENTER  0,0
   441 000000B3 FF7604                   push word [bp+4]
   442 000000B6 E88D05                   call printName
   443 000000B9 83C402                   add  sp, 2
   444                                  
   445                                  ;-92 int v(unsigned int i) {//value 
   446 000000BC C9                       LEAVE
   447 000000BD C3                       ret
   448                                  ; ENDP
   449                                  
   450                                  v:  ; *** PROC ***
   451                                  
   452                                  ;-93     if (i < LSTART) prc('['); 
   453                                  
   454                                  ;Function : v, Number of local variables: 1
   455                                  ;   # type sign width addr used name   list of local variables
   456                                  ;  200 var unsg word    92 NULL i = bp+4;
   457 000000BE C8000000                 ENTER  0,0
   458 000000C2 8B4604                   mov ax, [bp+4]
   459 000000C5 3DC800                   cmp ax, 200
   460 000000C8 0F8D0800                 jge @@v1
   461 000000CC 6A5B                     push 91
   462 000000CE E8AC45                   call prc
   463 000000D1 83C402                   add  sp, 2
   464                                  
   465                                  ;-94     printName(i);
   466                                  
   467                                  @@v1:
   468 000000D4 FF7604                   push word [bp+4]
   469 000000D7 E86C05                   call printName
   470 000000DA 83C402                   add  sp, 2
   471                                  
   472                                  ;-95     if (i < LSTART) prc(']');   
   473                                  
   474 000000DD 8B4604                   mov ax, [bp+4]
   475 000000E0 3DC800                   cmp ax, 200
   476 000000E3 0F8D0800                 jge @@v2
   477 000000E7 6A5D                     push 93
   478 000000E9 E89145                   call prc
   479 000000EC 83C402                   add  sp, 2
   480                                  
   481                                  ;-96 }
   482                                  
   483                                  @@v2:
   484                                  
   485                                  ;-97 int checknamelen() { int i;    i=strlen(symbol);
   486 000000EF C9                       LEAVE
   487 000000F0 C3                       ret
   488                                  ; ENDP
   489                                  
   490                                  checknamelen:  ; *** PROC ***
   491                                  ;Function : checknamelen, Number of local variables: 1
   492                                  ;   # type sign width addr used name   list of local variables
   493                                  ;  200 var sign word    97 NULL i = bp-2;
   494 000000F1 C8020000                 ENTER  2,0
   495 000000F5 8D062B81                 lea  ax, [symbol]
   496 000000F9 50                       push ax
   497 000000FA E86555                   call strlen
   498 000000FD 83C402                   add  sp, 2
   499 00000100 8946FE                   mov [bp-2], ax
   500                                  
   501                                  ;-98   if (i > IDLENMAX) error1("Item name is too long in characters)");
   502                                  
   503 00000103 8B46FE                   mov ax, [bp-2]
   504 00000106 83F80F                   cmp ax, 15
   505 00000109 0F8E0900                 jle @@checknamelen3
   506 0000010D 68[1801]                 push checknamelen_0
   507 00000110 E8BA48                   call error1
   508 00000113 83C402                   add  sp, 2
   509                                  
   510                                  ;-99 }
   511                                  
   512                                  @@checknamelen3:
   513                                  
   514                                  ;-100 char doglobName[IDLENMAX];
   515 00000116 C9                       LEAVE
   516 00000117 C3                       ret
   517                                  ; ENDP
   518 00000118 4974656D206E616D65-     checknamelen_0 db "Item name is too long in characters)",0
   519 00000121 20697320746F6F206C-
   520 0000012A 6F6E6720696E206368-
   521 00000133 617261637465727329-
   522 0000013C 00                 
   523                                  section .bss
   524                                  absolute 53391
   525 0000D08F <res 0000000F>          doglobName resb 15
   526                                  section .text
   527                                  
   528                                  ;-101 int doglob() { int i; int j; int isstrarr; isstrarr=0;
   529                                  
   530                                  
   531                                  doglob:  ; *** PROC ***
   532                                  ;Function : doglob, Number of local variables: 3
   533                                  ;   # type sign width addr used name   list of local variables
   534                                  ;  200 var sign word   101 NULL i = bp-2
   535                                  ;  201 var sign word   101 NULL j = bp-4
   536                                  ;  202 var sign word   101 NULL isstrarr = bp-6;
   537 0000013D C8060000                 ENTER  6,0
   538 00000141 B80000                   mov ax, 0
   539 00000144 8946FA                   mov [bp-6], ax
   540                                  
   541                                  ;-102   if (GTop >= LSTART) error1("Global table full");
   542                                  
   543 00000147 A1[3200]                 mov ax, [GTop]
   544 0000014A 3DC800                   cmp ax, 200 ;unsigned : 1
   545 0000014D 0F8C0900                 jl  @@doglob4
   546 00000151 68[9204]                 push doglob_0
   547 00000154 E87648                   call error1
   548 00000157 83C402                   add  sp, 2
   549                                  
   550                                  ;-103   if (iswidth == 0) error1("no VOID as var type");
   551                                  
   552                                  @@doglob4:
   553 0000015A A0[4000]                 mov al, [iswidth]
   554 0000015D 3C00                     cmp al, 0
   555 0000015F 0F850900                 jne @@doglob5
   556 00000163 68[A404]                 push doglob_1
   557 00000166 E86448                   call error1
   558 00000169 83C402                   add  sp, 2
   559                                  
   560                                  ;-104   checknamelen();
   561                                  
   562                                  @@doglob5:
   563 0000016C E882FF                   call checknamelen
   564                                  
   565                                  ;-105   if (checkName() != 0) error1("Variable already defined");
   566                                  
   567 0000016F E88305                   call checkName
   568 00000172 3C00                     cmp al, 0
   569 00000174 0F840900                 je  @@doglob6
   570 00000178 68[B804]                 push doglob_2
   571 0000017B E84F48                   call error1
   572 0000017E 83C402                   add  sp, 2
   573                                  
   574                                  ;-106   if (istoken('[')) { istype='&';
   575                                  
   576                                  @@doglob6:
   577 00000181 6A5B                     push 91
   578 00000183 E82944                   call istoken
   579 00000186 83C402                   add  sp, 2
   580 00000189 08C0                     or  al, al
   581 0000018B 0F84E201                 je @@doglob7
   582 0000018F B82600                   mov ax, 38
   583 00000192 A2[3A00]                 mov byte [istype], al
   584                                  
   585                                  ;-107     if (istoken(T_CONST)) {
   586                                  
   587 00000195 680101                   push 257
   588 00000198 E81444                   call istoken
   589 0000019B 83C402                   add  sp, 2
   590 0000019E 08C0                     or  al, al
   591 000001A0 0F84C200                 je @@doglob8
   592                                  
   593                                  ;-108       prs("\nsection .bss\nabsolute ");
   594                                  
   595 000001A4 68[D104]                 push doglob_3
   596 000001A7 E83A45                   call prs
   597 000001AA 83C402                   add  sp, 2
   598                                  
   599                                  ;-109       prunsign1(orgData);
   600                                  
   601 000001AD FF36[1600]               push word [orgData]
   602 000001B1 E88A46                   call prunsign1
   603 000001B4 83C402                   add  sp, 2
   604                                  
   605                                  ;-110       prs("\n"); prs(symbol); 
   606                                  
   607 000001B7 68[EB04]                 push doglob_4
   608 000001BA E82745                   call prs
   609 000001BD 83C402                   add  sp, 2
   610 000001C0 8D062B81                 lea  ax, [symbol]
   611 000001C4 50                       push ax
   612 000001C5 E81C45                   call prs
   613 000001C8 83C402                   add  sp, 2
   614                                  
   615                                  ;-111       if (iswidth==1) prs(" resb "); 
   616                                  
   617 000001CB A0[4000]                 mov al, [iswidth]
   618 000001CE 3C01                     cmp al, 1
   619 000001D0 0F850900                 jne @@doglob9
   620 000001D4 68[EE04]                 push doglob_5
   621 000001D7 E80A45                   call prs
   622 000001DA 83C402                   add  sp, 2
   623                                  
   624                                  ;-112       if (iswidth==2) prs(" resw ");
   625                                  
   626                                  @@doglob9:
   627 000001DD A0[4000]                 mov al, [iswidth]
   628 000001E0 3C02                     cmp al, 2
   629 000001E2 0F850900                 jne @@doglob10
   630 000001E6 68[F504]                 push doglob_6
   631 000001E9 E8F844                   call prs
   632 000001EC 83C402                   add  sp, 2
   633                                  
   634                                  ;-113       if (iswidth==4) prs(" resd ");
   635                                  
   636                                  @@doglob10:
   637 000001EF A0[4000]                 mov al, [iswidth]
   638 000001F2 3C04                     cmp al, 4
   639 000001F4 0F850900                 jne @@doglob11
   640 000001F8 68[FC04]                 push doglob_7
   641 000001FB E8E644                   call prs
   642 000001FE 83C402                   add  sp, 2
   643                                  
   644                                  ;-114       prunsign1(lexval); 
   645                                  
   646                                  @@doglob11:
   647 00000201 FF36[3600]               push word [lexval]
   648 00000205 E83646                   call prunsign1
   649 00000208 83C402                   add  sp, 2
   650                                  
   651                                  ;-115       prs("\nsection .text");
   652                                  
   653 0000020B 68[0305]                 push doglob_8
   654 0000020E E8D344                   call prs
   655 00000211 83C402                   add  sp, 2
   656                                  
   657                                  ;-116       orgData=orgData+lexval;
   658                                  
   659 00000214 A1[1600]                 mov ax, [orgData]
   660 00000217 0306[3600]               add ax, [lexval]
   661 0000021B A3[1600]                 mov word [orgData], ax
   662                                  
   663                                  ;-117       if (iswidth==2) orgData=orgData+lexval;
   664                                  
   665 0000021E A0[4000]                 mov al, [iswidth]
   666 00000221 3C02                     cmp al, 2
   667 00000223 0F850A00                 jne @@doglob12
   668 00000227 A1[1600]                 mov ax, [orgData]
   669 0000022A 0306[3600]               add ax, [lexval]
   670 0000022E A3[1600]                 mov word [orgData], ax
   671                                  
   672                                  ;-118       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
   673                                  
   674                                  @@doglob12:
   675 00000231 A0[4000]                 mov al, [iswidth]
   676 00000234 3C04                     cmp al, 4
   677 00000236 0F851400                 jne @@doglob13
   678 0000023A A1[3600]                 mov ax, [lexval]
   679 0000023D BB0300                   mov bx, 3
   680 00000240 F7E3                     mul bx
   681 00000242 8946FE                   mov [bp-2], ax
   682 00000245 A1[1600]                 mov ax, [orgData]
   683 00000248 0346FE                   add ax, [bp-2]
   684 0000024B A3[1600]                 mov word [orgData], ax
   685                                  
   686                                  ;-119       GData[GTop]=lexval; expect(']');
   687                                  
   688                                  @@doglob13:
   689 0000024E A1[3600]                 mov ax, [lexval]
   690 00000251 8B1E[3200]               mov bx, [GTop]
   691 00000255 D1E3                     shl bx, 1
   692 00000257 8987EB8A                 mov [GData+bx], ax
   693 0000025B 6A5D                     push 93
   694 0000025D E87143                   call expect
   695 00000260 83C402                   add  sp, 2
   696                                  
   697                                  ;-120     }else { expect(']');
   698                                  
   699 00000263 E90801                   jmp @@doglob14
   700                                  @@doglob8:
   701 00000266 6A5D                     push 93
   702 00000268 E86643                   call expect
   703 0000026B 83C402                   add  sp, 2
   704                                  
   705                                  ;-121       if (iswidth != 1) error1("Only ByteArray allowed");
   706                                  
   707 0000026E A0[4000]                 mov al, [iswidth]
   708 00000271 3C01                     cmp al, 1
   709 00000273 0F840900                 je  @@doglob15
   710 00000277 68[1305]                 push doglob_9
   711 0000027A E85047                   call error1
   712 0000027D 83C402                   add  sp, 2
   713                                  
   714                                  ;-122       prs("\n"); prs(symbol); prs(" db "); 
   715                                  
   716                                  @@doglob15:
   717 00000280 68[2A05]                 push doglob_10
   718 00000283 E85E44                   call prs
   719 00000286 83C402                   add  sp, 2
   720 00000289 8D062B81                 lea  ax, [symbol]
   721 0000028D 50                       push ax
   722 0000028E E85344                   call prs
   723 00000291 83C402                   add  sp, 2
   724 00000294 68[2D05]                 push doglob_11
   725 00000297 E84A44                   call prs
   726 0000029A 83C402                   add  sp, 2
   727                                  
   728                                  ;-123       isstrarr=1; strcpy(doglobName, symbol);
   729                                  
   730 0000029D B80100                   mov ax, 1
   731 000002A0 8946FA                   mov [bp-6], ax
   732 000002A3 8D062B81                 lea  ax, [symbol]
   733 000002A7 50                       push ax
   734 000002A8 8D068FD0                 lea  ax, [doglobName]
   735 000002AC 50                       push ax
   736 000002AD E8DA53                   call strcpy
   737 000002B0 83C404                   add  sp, 4
   738                                  
   739                                  ;-124       expect('='); 
   740                                  
   741 000002B3 6A3D                     push 61
   742 000002B5 E81943                   call expect
   743 000002B8 83C402                   add  sp, 2
   744                                  
   745                                  ;-125       if (istoken(T_STRING)) { 
   746                                  
   747 000002BB 680201                   push 258
   748 000002BE E8EE42                   call istoken
   749 000002C1 83C402                   add  sp, 2
   750 000002C4 08C0                     or  al, al
   751 000002C6 0F844200                 je @@doglob16
   752                                  
   753                                  ;-126         prc(34); prscomment(symbol); prc(34); prs(",0"); 
   754                                  
   755 000002CA 6A22                     push 34
   756 000002CC E8AE43                   call prc
   757 000002CF 83C402                   add  sp, 2
   758 000002D2 8D062B81                 lea  ax, [symbol]
   759 000002D6 50                       push ax
   760 000002D7 E8CE43                   call prscomment
   761 000002DA 83C402                   add  sp, 2
   762 000002DD 6A22                     push 34
   763 000002DF E89B43                   call prc
   764 000002E2 83C402                   add  sp, 2
   765 000002E5 68[3205]                 push doglob_12
   766 000002E8 E8F943                   call prs
   767 000002EB 83C402                   add  sp, 2
   768                                  
   769                                  ;-127         i=strlen(symbol); GData[GTop]=i; }
   770                                  
   771 000002EE 8D062B81                 lea  ax, [symbol]
   772 000002F2 50                       push ax
   773 000002F3 E86C53                   call strlen
   774 000002F6 83C402                   add  sp, 2
   775 000002F9 8946FE                   mov [bp-2], ax
   776 000002FC 8B46FE                   mov ax, [bp-2]
   777 000002FF 8B1E[3200]               mov bx, [GTop]
   778 00000303 D1E3                     shl bx, 1
   779 00000305 8987EB8A                 mov [GData+bx], ax
   780                                  
   781                                  ;-128       else if (istoken('{' )) { i=0;
   782                                  
   783 00000309 E96200                   jmp @@doglob17
   784                                  @@doglob16:
   785 0000030C 6A7B                     push 123
   786 0000030E E89E42                   call istoken
   787 00000311 83C402                   add  sp, 2
   788 00000314 08C0                     or  al, al
   789 00000316 0F844B00                 je @@doglob18
   790 0000031A B80000                   mov ax, 0
   791 0000031D 8946FE                   mov [bp-2], ax
   792                                  
   793                                  ;-129         do { if(i) prc(','); 
   794                                  
   795                                  @@doglob19:
   796 00000320 8B46FE                   mov ax, [bp-2]
   797 00000323 08C0                     or  al, al
   798 00000325 0F840800                 je @@doglob20
   799 00000329 6A2C                     push 44
   800 0000032B E84F43                   call prc
   801 0000032E 83C402                   add  sp, 2
   802                                  
   803                                  ;-130           expect(T_CONST); prunsign1(lexval); i=1; }
   804                                  
   805                                  @@doglob20:
   806 00000331 680101                   push 257
   807 00000334 E89A42                   call expect
   808 00000337 83C402                   add  sp, 2
   809 0000033A FF36[3600]               push word [lexval]
   810 0000033E E8FD44                   call prunsign1
   811 00000341 83C402                   add  sp, 2
   812 00000344 B80100                   mov ax, 1
   813 00000347 8946FE                   mov [bp-2], ax
   814                                  
   815                                  ;-131         while (istoken(',')); expect('}'); }  
   816                                  
   817 0000034A 6A2C                     push 44
   818 0000034C E86042                   call istoken
   819 0000034F 83C402                   add  sp, 2
   820 00000352 08C0                     or  al, al
   821 00000354 0F840200                 je @@doglob21
   822 00000358 EBC6                     jmp @@doglob19
   823                                  @@doglob21:
   824 0000035A 6A7D                     push 125
   825 0000035C E87242                   call expect
   826 0000035F 83C402                   add  sp, 2
   827                                  
   828                                  ;-132       else error1("String or number array expected");
   829                                  
   830 00000362 E90900                   jmp @@doglob22
   831                                  @@doglob18:
   832 00000365 68[3505]                 push doglob_13
   833 00000368 E86246                   call error1
   834 0000036B 83C402                   add  sp, 2
   835                                  
   836                                  ;-133       }; 
   837                                  
   838                                  @@doglob22:
   839                                  @@doglob17:
   840                                  @@doglob14:
   841                                  
   842                                  ;-134   }else { //expect('=');
   843                                  
   844 0000036E E99E00                   jmp @@doglob23
   845                                  @@doglob7:
   846                                  
   847                                  ;-135     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
   848                                  
   849 00000371 68[5505]                 push doglob_14
   850 00000374 E86D43                   call prs
   851 00000377 83C402                   add  sp, 2
   852 0000037A 8D062B81                 lea  ax, [symbol]
   853 0000037E 50                       push ax
   854 0000037F E86243                   call prs
   855 00000382 83C402                   add  sp, 2
   856 00000385 A0[3A00]                 mov al, [istype]
   857 00000388 3C2A                     cmp al, 42
   858 0000038A 0F850C00                 jne @@doglob24
   859 0000038E 68[5805]                 push doglob_15
   860 00000391 E85043                   call prs
   861 00000394 83C402                   add  sp, 2
   862                                  
   863                                  ;-136     else {
   864                                  
   865 00000397 E93300                   jmp @@doglob25
   866                                  @@doglob24:
   867                                  
   868                                  ;-137       if      (iswidth==1) prs(" db ");
   869                                  
   870 0000039A A0[4000]                 mov al, [iswidth]
   871 0000039D 3C01                     cmp al, 1
   872 0000039F 0F850C00                 jne @@doglob26
   873 000003A3 68[5D05]                 push doglob_16
   874 000003A6 E83B43                   call prs
   875 000003A9 83C402                   add  sp, 2
   876                                  
   877                                  ;-138       else if (iswidth==2) prs(" dw ");
   878                                  
   879 000003AC E91E00                   jmp @@doglob27
   880                                  @@doglob26:
   881 000003AF A0[4000]                 mov al, [iswidth]
   882 000003B2 3C02                     cmp al, 2
   883 000003B4 0F850C00                 jne @@doglob28
   884 000003B8 68[6205]                 push doglob_17
   885 000003BB E82643                   call prs
   886 000003BE 83C402                   add  sp, 2
   887                                  
   888                                  ;-139       else                 prs(" dd ");
   889                                  
   890 000003C1 E90900                   jmp @@doglob29
   891                                  @@doglob28:
   892 000003C4 68[6705]                 push doglob_18
   893 000003C7 E81A43                   call prs
   894 000003CA 83C402                   add  sp, 2
   895                                  
   896                                  ;-140     }
   897                                  
   898                                  @@doglob29:
   899                                  @@doglob27:
   900                                  
   901                                  ;-141     if(istoken('-')) prc('-');
   902                                  
   903                                  @@doglob25:
   904 000003CD 6A2D                     push 45
   905 000003CF E8DD41                   call istoken
   906 000003D2 83C402                   add  sp, 2
   907 000003D5 08C0                     or  al, al
   908 000003D7 0F840800                 je @@doglob30
   909 000003DB 6A2D                     push 45
   910 000003DD E89D42                   call prc
   911 000003E0 83C402                   add  sp, 2
   912                                  
   913                                  ;-142     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
   914                                  
   915                                  @@doglob30:
   916 000003E3 6A3D                     push 61
   917 000003E5 E8C741                   call istoken
   918 000003E8 83C402                   add  sp, 2
   919 000003EB 08C0                     or  al, al
   920 000003ED 0F841600                 je @@doglob31
   921 000003F1 680101                   push 257
   922 000003F4 E8DA41                   call expect
   923 000003F7 83C402                   add  sp, 2
   924 000003FA FF36[3600]               push word [lexval]
   925 000003FE E83D44                   call prunsign1
   926 00000401 83C402                   add  sp, 2
   927                                  
   928                                  ;-143     else prunsign1(0); }
   929                                  
   930 00000404 E90800                   jmp @@doglob32
   931                                  @@doglob31:
   932 00000407 6A00                     push 0
   933 00000409 E83244                   call prunsign1
   934 0000040C 83C402                   add  sp, 2
   935                                  @@doglob32:
   936                                  
   937                                  ;-144   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
   938                                  
   939                                  @@doglob23:
   940 0000040F A0[3D00]                 mov al, [issign]
   941 00000412 8B1E[3200]               mov bx, [GTop]
   942 00000416 8887E383                 mov [GSign+bx], al
   943 0000041A A0[4000]                 mov al, [iswidth]
   944 0000041D 8B1E[3200]               mov bx, [GTop]
   945 00000421 88870F85                 mov [GWidth+bx], al
   946 00000425 A0[3A00]                 mov al, [istype]
   947 00000428 8B1E[3200]               mov bx, [GTop]
   948 0000042C 8887B782                 mov [GType+bx], al
   949                                  
   950                                  ;-145   GAdr [GTop]=lineno-1; GUsed [GTop]=0;
   951                                  
   952 00000430 A1[6E00]                 mov ax, [lineno]
   953 00000433 83E801                   sub ax, 1
   954 00000436 8B1E[3200]               mov bx, [GTop]
   955 0000043A D1E3                     shl bx, 1
   956 0000043C 89873B86                 mov [GAdr+bx], ax
   957 00000440 B80000                   mov ax, 0
   958 00000443 8B1E[3200]               mov bx, [GTop]
   959 00000447 D1E3                     shl bx, 1
   960 00000449 89879388                 mov [GUsed+bx], ax
   961                                  
   962                                  ;-146   pt=adrofname(GTop);
   963                                  
   964 0000044D FF36[3200]               push word [GTop]
   965 00000451 E8CF01                   call adrofname
   966 00000454 83C402                   add  sp, 2
   967 00000457 A3[7200]                 mov word [pt], ax
   968                                  
   969                                  ;-147   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
   970                                  
   971 0000045A 8B46FA                   mov ax, [bp-6]
   972 0000045D 08C0                     or  al, al
   973 0000045F 0F841200                 je @@doglob33
   974 00000463 8D068FD0                 lea  ax, [doglobName]
   975 00000467 50                       push ax
   976 00000468 FF36[7200]               push word [pt]
   977 0000046C E81B52                   call strcpy
   978 0000046F 83C404                   add  sp, 4
   979 00000472 E90F00                   jmp @@doglob34
   980                                  @@doglob33:
   981 00000475 8D062B81                 lea  ax, [symbol]
   982 00000479 50                       push ax
   983 0000047A FF36[7200]               push word [pt]
   984 0000047E E80952                   call strcpy
   985 00000481 83C404                   add  sp, 4
   986                                  
   987                                  ;-148   GTop++; expect(';'); }
   988                                  
   989                                  @@doglob34:
   990 00000484 FF06[3200]               inc  word[GTop]
   991 00000488 6A3B                     push 59
   992 0000048A E84441                   call expect
   993 0000048D 83C402                   add  sp, 2
   994                                  
   995                                  ;-149 
   996                                  
   997                                  
   998                                  ;-150 int gettypes(int i) {int j; char c;
   999 00000490 C9                       LEAVE
  1000 00000491 C3                       ret
  1001                                  ; ENDP
  1002 00000492 476C6F62616C207461-     doglob_0 db "Global table full",0
  1003 0000049B 626C652066756C6C00 
  1004 000004A4 6E6F20564F49442061-     doglob_1 db "no VOID as var type",0
  1005 000004AD 732076617220747970-
  1006 000004B6 6500               
  1007 000004B8 5661726961626C6520-     doglob_2 db "Variable already defined",0
  1008 000004C1 616C72656164792064-
  1009 000004CA 6566696E656400     
  1010 000004D1 5C6E73656374696F6E-     doglob_3 db "\nsection .bss\nabsolute ",0
  1011 000004DA 202E6273735C6E6162-
  1012 000004E3 736F6C7574652000   
  1013 000004EB 5C6E00                  doglob_4 db "\n",0
  1014 000004EE 20726573622000          doglob_5 db " resb ",0
  1015 000004F5 20726573772000          doglob_6 db " resw ",0
  1016 000004FC 20726573642000          doglob_7 db " resd ",0
  1017 00000503 5C6E73656374696F6E-     doglob_8 db "\nsection .text",0
  1018 0000050C 202E7465787400     
  1019 00000513 4F6E6C792042797465-     doglob_9 db "Only ByteArray allowed",0
  1020 0000051C 417272617920616C6C-
  1021 00000525 6F77656400         
  1022 0000052A 5C6E00                  doglob_10 db "\n",0
  1023 0000052D 2064622000              doglob_11 db " db ",0
  1024 00000532 2C3000                  doglob_12 db ",0",0
  1025 00000535 537472696E67206F72-     doglob_13 db "String or number array expected",0
  1026 0000053E 206E756D6265722061-
  1027 00000547 727261792065787065-
  1028 00000550 6374656400         
  1029 00000555 5C6E00                  doglob_14 db "\n",0
  1030 00000558 2064772000              doglob_15 db " dw ",0
  1031 0000055D 2064622000              doglob_16 db " db ",0
  1032 00000562 2064772000              doglob_17 db " dw ",0
  1033 00000567 2064642000              doglob_18 db " dd ",0
  1034                                  
  1035                                  gettypes:  ; *** PROC ***
  1036                                  
  1037                                  ;-151   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  1038                                  
  1039                                  ;Function : gettypes, Number of local variables: 3
  1040                                  ;   # type sign width addr used name   list of local variables
  1041                                  ;  200 var sign word   150 NULL i = bp+4
  1042                                  ;  201 var sign word   150 NULL j = bp-2
  1043                                  ;  202 var sign byte   150 NULL c = bp-4;
  1044 0000056C C8040000                 ENTER  4,0
  1045 00000570 8B5E04                   mov bx, [bp+4]
  1046 00000573 8A87E383                 mov al, [GSign + bx]
  1047 00000577 8846FC                   mov [bp-4], al
  1048 0000057A 8A46FC                   mov al, [bp-4]
  1049 0000057D 3C53                     cmp al, 83
  1050 0000057F 0F850900                 jne @@gettypes35
  1051 00000583 B80100                   mov ax, 1
  1052 00000586 A3[3B00]                 mov word [signi], ax
  1053 00000589 E90600                   jmp @@gettypes36
  1054                                  @@gettypes35:
  1055 0000058C B80000                   mov ax, 0
  1056 0000058F A3[3B00]                 mov word [signi], ax
  1057                                  
  1058                                  ;-152   c=GWidth[i]; widthi=0;wi=0;
  1059                                  
  1060                                  @@gettypes36:
  1061 00000592 8B5E04                   mov bx, [bp+4]
  1062 00000595 8A870F85                 mov al, [GWidth + bx]
  1063 00000599 8846FC                   mov [bp-4], al
  1064 0000059C B80000                   mov ax, 0
  1065 0000059F A3[3E00]                 mov word [widthi], ax
  1066 000005A2 B80000                   mov ax, 0
  1067 000005A5 A3[4100]                 mov word [wi], ax
  1068                                  
  1069                                  ;-153   if (c==1) {widthi=1;wi=1;}
  1070                                  
  1071 000005A8 8A46FC                   mov al, [bp-4]
  1072 000005AB 3C01                     cmp al, 1
  1073 000005AD 0F850C00                 jne @@gettypes37
  1074 000005B1 B80100                   mov ax, 1
  1075 000005B4 A3[3E00]                 mov word [widthi], ax
  1076 000005B7 B80100                   mov ax, 1
  1077 000005BA A3[4100]                 mov word [wi], ax
  1078                                  
  1079                                  ;-154   if (c==2) {widthi=2;wi=2;}
  1080                                  
  1081                                  @@gettypes37:
  1082 000005BD 8A46FC                   mov al, [bp-4]
  1083 000005C0 3C02                     cmp al, 2
  1084 000005C2 0F850C00                 jne @@gettypes38
  1085 000005C6 B80200                   mov ax, 2
  1086 000005C9 A3[3E00]                 mov word [widthi], ax
  1087 000005CC B80200                   mov ax, 2
  1088 000005CF A3[4100]                 mov word [wi], ax
  1089                                  
  1090                                  ;-155   if (c==4) {widthi=4;wi=4;}
  1091                                  
  1092                                  @@gettypes38:
  1093 000005D2 8A46FC                   mov al, [bp-4]
  1094 000005D5 3C04                     cmp al, 4
  1095 000005D7 0F850C00                 jne @@gettypes39
  1096 000005DB B80400                   mov ax, 4
  1097 000005DE A3[3E00]                 mov word [widthi], ax
  1098 000005E1 B80400                   mov ax, 4
  1099 000005E4 A3[4100]                 mov word [wi], ax
  1100                                  
  1101                                  ;-156   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  1102                                  
  1103                                  @@gettypes39:
  1104 000005E7 8B5E04                   mov bx, [bp+4]
  1105 000005EA 8A87B782                 mov al, [GType + bx]
  1106 000005EE 8846FC                   mov [bp-4], al
  1107 000005F1 B80000                   mov ax, 0
  1108 000005F4 A3[3800]                 mov word [typei], ax
  1109 000005F7 8A46FC                   mov al, [bp-4]
  1110 000005FA 3C2A                     cmp al, 42
  1111 000005FC 0F850C00                 jne @@gettypes40
  1112 00000600 B80100                   mov ax, 1
  1113 00000603 A3[3800]                 mov word [typei], ax
  1114 00000606 B80200                   mov ax, 2
  1115 00000609 A3[4100]                 mov word [wi], ax
  1116                                  
  1117                                  ;-157   if (c=='&')  typei=2;  
  1118                                  
  1119                                  @@gettypes40:
  1120 0000060C 8A46FC                   mov al, [bp-4]
  1121 0000060F 3C26                     cmp al, 38
  1122 00000611 0F850600                 jne @@gettypes41
  1123 00000615 B80200                   mov ax, 2
  1124 00000618 A3[3800]                 mov word [typei], ax
  1125                                  
  1126                                  ;-158   return i; }  
  1127                                  
  1128                                  @@gettypes41:
  1129 0000061B 8B4604                   mov ax, [bp+4]
  1130 0000061E E90000                   jmp @@retn
  1131                                  
  1132                                  ;-159 int adrofname(unsigned int i) { adrF(GNameField, i); }
  1133                                  
  1134 00000621 C9                      @@retn: LEAVE
  1135 00000622 C3                       ret
  1136                                  ; ENDP
  1137                                  
  1138                                  adrofname:  ; *** PROC ***
  1139                                  ;Function : adrofname, Number of local variables: 1
  1140                                  ;   # type sign width addr used name   list of local variables
  1141                                  ;  200 var unsg word   159 NULL i = bp+4;
  1142 00000623 C8000000                 ENTER  0,0
  1143 00000627 FF7604                   push word [bp+4]
  1144 0000062A 8D06438D                 lea  ax, [GNameField]
  1145 0000062E 50                       push ax
  1146 0000062F E80500                   call adrF
  1147 00000632 83C404                   add  sp, 4
  1148                                  
  1149                                  ;-160 int adrF(char *s, unsigned int i) { i << 4;
  1150 00000635 C9                       LEAVE
  1151 00000636 C3                       ret
  1152                                  ; ENDP
  1153                                  
  1154                                  adrF:  ; *** PROC ***
  1155                                  ;Function : adrF, Number of local variables: 2
  1156                                  ;   # type sign width addr used name   list of local variables
  1157                                  ;  200 ptr sign byte   160 NULL s = bp+4
  1158                                  ;  201 var unsg word   160 NULL i = bp+6;
  1159 00000637 C8000000                 ENTER  0,0
  1160 0000063B 8B4606                   mov ax, [bp+6]
  1161 0000063E C1E004                   shl ax, 4
  1162                                  
  1163                                  ;-161   __asm{ add ax, [bp+4]  ; offset s } }
  1164                                  
  1165 00000641 034604                   add ax, [bp+4]  ; offset s 
  1166                                  
  1167                                  ;-162 int printName(unsigned int i) {int j;
  1168 00000644 C9                       LEAVE
  1169 00000645 C3                       ret
  1170                                  ; ENDP
  1171                                  
  1172                                  printName:  ; *** PROC ***
  1173                                  
  1174                                  ;-163   if (i < LSTART) { i=adrofname(i); prs(i); }
  1175                                  
  1176                                  ;Function : printName, Number of local variables: 2
  1177                                  ;   # type sign width addr used name   list of local variables
  1178                                  ;  200 var unsg word   162 NULL i = bp+4
  1179                                  ;  201 var sign word   162 NULL j = bp-2;
  1180 00000646 C8020000                 ENTER  2,0
  1181 0000064A 8B4604                   mov ax, [bp+4]
  1182 0000064D 3DC800                   cmp ax, 200
  1183 00000650 0F8D1800                 jge @@printName42
  1184 00000654 FF7604                   push word [bp+4]
  1185 00000657 E8C9FF                   call adrofname
  1186 0000065A 83C402                   add  sp, 2
  1187 0000065D 894604                   mov [bp+4], ax
  1188 00000660 FF7604                   push word [bp+4]
  1189 00000663 E87E40                   call prs
  1190 00000666 83C402                   add  sp, 2
  1191                                  
  1192                                  ;-164   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
  1193                                  
  1194 00000669 E93800                   jmp @@printName43
  1195                                  @@printName42:
  1196 0000066C 68[A606]                 push printName_0
  1197 0000066F E87240                   call prs
  1198 00000672 83C402                   add  sp, 2
  1199 00000675 8B5E04                   mov bx, [bp+4]
  1200 00000678 D1E3                     shl bx, 1
  1201 0000067A 8B87EB8A                 mov ax, [GData + bx]
  1202 0000067E 8946FE                   mov [bp-2], ax
  1203 00000681 8B46FE                   mov ax, [bp-2]
  1204 00000684 83F800                   cmp ax, 0
  1205 00000687 0F8E0800                 jle @@printName44
  1206 0000068B 6A2B                     push 43
  1207 0000068D E8ED3F                   call prc
  1208 00000690 83C402                   add  sp, 2
  1209                                  @@printName44:
  1210 00000693 FF76FE                   push word [bp-2]
  1211 00000696 E84241                   call pint1
  1212 00000699 83C402                   add  sp, 2
  1213 0000069C 6A5D                     push 93
  1214 0000069E E8DC3F                   call prc
  1215 000006A1 83C402                   add  sp, 2
  1216                                  
  1217                                  ;-165 }
  1218                                  
  1219                                  @@printName43:
  1220                                  
  1221                                  ;-166 int searchname() { unsigned int i;
  1222 000006A4 C9                       LEAVE
  1223 000006A5 C3                       ret
  1224                                  ; ENDP
  1225 000006A6 5B627000                printName_0 db "[bp",0
  1226                                  
  1227                                  searchname:  ; *** PROC ***
  1228                                  
  1229                                  ;-167   i=checkName(); if (i == 0) error1("Variable unknown");
  1230                                  
  1231                                  ;Function : searchname, Number of local variables: 1
  1232                                  ;   # type sign width addr used name   list of local variables
  1233                                  ;  200 var unsg word   166 NULL i = bp-2;
  1234 000006AA C8020000                 ENTER  2,0
  1235 000006AE E84400                   call checkName
  1236 000006B1 8946FE                   mov [bp-2], ax
  1237 000006B4 8B46FE                   mov ax, [bp-2]
  1238 000006B7 83F800                   cmp ax, 0
  1239 000006BA 0F850900                 jne @@searchname45
  1240 000006BE 68[E406]                 push searchname_0
  1241 000006C1 E80943                   call error1
  1242 000006C4 83C402                   add  sp, 2
  1243                                  
  1244                                  ;-168   GUsed[i]=GUsed[i] + 1; return i;
  1245                                  
  1246                                  @@searchname45:
  1247 000006C7 8B5EFE                   mov bx, [bp-2]
  1248 000006CA D1E3                     shl bx, 1
  1249 000006CC 8B879388                 mov ax, [GUsed + bx]
  1250 000006D0 83C001                   add ax, 1
  1251 000006D3 8B5EFE                   mov bx, [bp-2]
  1252 000006D6 D1E3                     shl bx, 1
  1253 000006D8 89879388                 mov [GUsed+bx], ax
  1254 000006DC 8B46FE                   mov ax, [bp-2]
  1255 000006DF E90000                   jmp @@retn
  1256                                  
  1257                                  ;-169 }
  1258                                  
  1259                                  
  1260                                  ;-170 int checkName() { unsigned int i; unsigned int j;
  1261                                  
  1262 000006E2 C9                      @@retn: LEAVE
  1263 000006E3 C3                       ret
  1264                                  ; ENDP
  1265 000006E4 5661726961626C6520-     searchname_0 db "Variable unknown",0
  1266 000006ED 756E6B6E6F776E00   
  1267                                  
  1268                                  checkName:  ; *** PROC ***
  1269                                  
  1270                                  ;-171   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1271                                  
  1272                                  ;Function : checkName, Number of local variables: 2
  1273                                  ;   # type sign width addr used name   list of local variables
  1274                                  ;  200 var unsg word   170 NULL i = bp-2
  1275                                  ;  201 var unsg word   170 NULL j = bp-4;
  1276 000006F5 C8040000                 ENTER  4,0
  1277 000006F9 B8C800                   mov ax, 200
  1278 000006FC 8946FE                   mov [bp-2], ax
  1279                                  @@checkName46:
  1280 000006FF 8B46FE                   mov ax, [bp-2]
  1281 00000702 3B06[3400]               cmp ax, [LTop]
  1282 00000706 0F8D2B00                 jge @@checkName47
  1283 0000070A FF76FE                   push word [bp-2]
  1284 0000070D E813FF                   call adrofname
  1285 00000710 83C402                   add  sp, 2
  1286 00000713 8946FC                   mov [bp-4], ax
  1287 00000716 FF76FC                   push word [bp-4]
  1288 00000719 8D062B81                 lea  ax, [symbol]
  1289 0000071D 50                       push ax
  1290 0000071E E89050                   call eqstr
  1291 00000721 83C404                   add  sp, 4
  1292 00000724 08C0                     or  al, al
  1293 00000726 0F840600                 je @@checkName48
  1294 0000072A 8B46FE                   mov ax, [bp-2]
  1295 0000072D E94700                   jmp @@retn
  1296                                  @@checkName48:
  1297 00000730 FF46FE                   inc  word[bp-2]
  1298                                  
  1299                                  ;-172   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  1300                                  
  1301 00000733 EBCA                     jmp @@checkName46
  1302                                  @@checkName47:
  1303 00000735 B80100                   mov ax, 1
  1304 00000738 8946FE                   mov [bp-2], ax
  1305                                  @@checkName49:
  1306 0000073B 8B46FE                   mov ax, [bp-2]
  1307 0000073E 3B06[3200]               cmp ax, [GTop]
  1308 00000742 0F8D2B00                 jge @@checkName50
  1309 00000746 FF76FE                   push word [bp-2]
  1310 00000749 E8D7FE                   call adrofname
  1311 0000074C 83C402                   add  sp, 2
  1312 0000074F 8946FC                   mov [bp-4], ax
  1313 00000752 FF76FC                   push word [bp-4]
  1314 00000755 8D062B81                 lea  ax, [symbol]
  1315 00000759 50                       push ax
  1316 0000075A E85450                   call eqstr
  1317 0000075D 83C404                   add  sp, 4
  1318 00000760 08C0                     or  al, al
  1319 00000762 0F840600                 je @@checkName51
  1320 00000766 8B46FE                   mov ax, [bp-2]
  1321 00000769 E90B00                   jmp @@retn
  1322                                  @@checkName51:
  1323 0000076C FF46FE                   inc  word[bp-2]
  1324                                  
  1325                                  ;-173   return 0;
  1326                                  
  1327 0000076F EBCA                     jmp @@checkName49
  1328                                  @@checkName50:
  1329 00000771 B80000                   mov ax, 0
  1330 00000774 E90000                   jmp @@retn
  1331                                  
  1332                                  ;-174 }    
  1333                                  
  1334                                  
  1335                                  ;-175 int typeName() { int m; //0=V,1=*,2=&
  1336                                  
  1337 00000777 C9                      @@retn: LEAVE
  1338 00000778 C3                       ret
  1339                                  ; ENDP
  1340                                  
  1341                                  typeName:  ; *** PROC ***
  1342                                  
  1343                                  ;-176   issign='S';
  1344                                  
  1345                                  ;Function : typeName, Number of local variables: 1
  1346                                  ;   # type sign width addr used name   list of local variables
  1347                                  ;  200 var sign word   175 NULL m = bp-2;
  1348 00000779 C8020000                 ENTER  2,0
  1349 0000077D B85300                   mov ax, 83
  1350 00000780 A2[3D00]                 mov byte [issign], al
  1351                                  
  1352                                  ;-177   if(istoken(T_SIGNED))   issign='S';  if(istoken(T_UNSIGNED)) issign='U';
  1353                                  
  1354 00000783 681302                   push 531
  1355 00000786 E8263E                   call istoken
  1356 00000789 83C402                   add  sp, 2
  1357 0000078C 08C0                     or  al, al
  1358 0000078E 0F840600                 je @@typeName52
  1359 00000792 B85300                   mov ax, 83
  1360 00000795 A2[3D00]                 mov byte [issign], al
  1361                                  @@typeName52:
  1362 00000798 681402                   push 532
  1363 0000079B E8113E                   call istoken
  1364 0000079E 83C402                   add  sp, 2
  1365 000007A1 08C0                     or  al, al
  1366 000007A3 0F840600                 je @@typeName53
  1367 000007A7 B85500                   mov ax, 85
  1368 000007AA A2[3D00]                 mov byte [issign], al
  1369                                  
  1370                                  ;-178   iswidth=2;                           if(istoken(T_VOID))     iswidth=0;
  1371                                  
  1372                                  @@typeName53:
  1373 000007AD B80200                   mov ax, 2
  1374 000007B0 A2[4000]                 mov byte [iswidth], al
  1375 000007B3 681102                   push 529
  1376 000007B6 E8F63D                   call istoken
  1377 000007B9 83C402                   add  sp, 2
  1378 000007BC 08C0                     or  al, al
  1379 000007BE 0F840600                 je @@typeName54
  1380 000007C2 B80000                   mov ax, 0
  1381 000007C5 A2[4000]                 mov byte [iswidth], al
  1382                                  
  1383                                  ;-179   if(istoken(T_CHAR))     iswidth=1;   if(istoken(T_INT))      iswidth=2;
  1384                                  
  1385                                  @@typeName54:
  1386 000007C8 681202                   push 530
  1387 000007CB E8E13D                   call istoken
  1388 000007CE 83C402                   add  sp, 2
  1389 000007D1 08C0                     or  al, al
  1390 000007D3 0F840600                 je @@typeName55
  1391 000007D7 B80100                   mov ax, 1
  1392 000007DA A2[4000]                 mov byte [iswidth], al
  1393                                  @@typeName55:
  1394 000007DD 680502                   push 517
  1395 000007E0 E8CC3D                   call istoken
  1396 000007E3 83C402                   add  sp, 2
  1397 000007E6 08C0                     or  al, al
  1398 000007E8 0F840600                 je @@typeName56
  1399 000007EC B80200                   mov ax, 2
  1400 000007EF A2[4000]                 mov byte [iswidth], al
  1401                                  
  1402                                  ;-180   if(istoken(T_SHORT))    iswidth=2;   if(istoken(T_LONG))     iswidth=4;
  1403                                  
  1404                                  @@typeName56:
  1405 000007F2 681602                   push 534
  1406 000007F5 E8B73D                   call istoken
  1407 000007F8 83C402                   add  sp, 2
  1408 000007FB 08C0                     or  al, al
  1409 000007FD 0F840600                 je @@typeName57
  1410 00000801 B80200                   mov ax, 2
  1411 00000804 A2[4000]                 mov byte [iswidth], al
  1412                                  @@typeName57:
  1413 00000807 681502                   push 533
  1414 0000080A E8A23D                   call istoken
  1415 0000080D 83C402                   add  sp, 2
  1416 00000810 08C0                     or  al, al
  1417 00000812 0F840600                 je @@typeName58
  1418 00000816 B80400                   mov ax, 4
  1419 00000819 A2[4000]                 mov byte [iswidth], al
  1420                                  
  1421                                  ;-181   if(istoken(T_UINT32)) { iswidth=4; issign='U'; }
  1422                                  
  1423                                  @@typeName58:
  1424 0000081C 682102                   push 545
  1425 0000081F E88D3D                   call istoken
  1426 00000822 83C402                   add  sp, 2
  1427 00000825 08C0                     or  al, al
  1428 00000827 0F840C00                 je @@typeName59
  1429 0000082B B80400                   mov ax, 4
  1430 0000082E A2[4000]                 mov byte [iswidth], al
  1431 00000831 B85500                   mov ax, 85
  1432 00000834 A2[3D00]                 mov byte [issign], al
  1433                                  
  1434                                  ;-182   istype='V'; m=0;
  1435                                  
  1436                                  @@typeName59:
  1437 00000837 B85600                   mov ax, 86
  1438 0000083A A2[3A00]                 mov byte [istype], al
  1439 0000083D B80000                   mov ax, 0
  1440 00000840 8946FE                   mov [bp-2], ax
  1441                                  
  1442                                  ;-183   if(istoken('*'))  { istype='*'; m=1; } if(istoken('&'))  {istype='&'; m=2;}
  1443                                  
  1444 00000843 6A2A                     push 42
  1445 00000845 E8673D                   call istoken
  1446 00000848 83C402                   add  sp, 2
  1447 0000084B 08C0                     or  al, al
  1448 0000084D 0F840C00                 je @@typeName60
  1449 00000851 B82A00                   mov ax, 42
  1450 00000854 A2[3A00]                 mov byte [istype], al
  1451 00000857 B80100                   mov ax, 1
  1452 0000085A 8946FE                   mov [bp-2], ax
  1453                                  @@typeName60:
  1454 0000085D 6A26                     push 38
  1455 0000085F E84D3D                   call istoken
  1456 00000862 83C402                   add  sp, 2
  1457 00000865 08C0                     or  al, al
  1458 00000867 0F840C00                 je @@typeName61
  1459 0000086B B82600                   mov ax, 38
  1460 0000086E A2[3A00]                 mov byte [istype], al
  1461 00000871 B80200                   mov ax, 2
  1462 00000874 8946FE                   mov [bp-2], ax
  1463                                  
  1464                                  ;-184   name1(); return m; }
  1465                                  
  1466                                  @@typeName61:
  1467 00000877 E80800                   call name1
  1468 0000087A 8B46FE                   mov ax, [bp-2]
  1469 0000087D E90000                   jmp @@retn
  1470                                  
  1471                                  ;-185 int name1() {if (token!=T_NAME) error1("Name expected"); token=getlex(); }
  1472                                  
  1473 00000880 C9                      @@retn: LEAVE
  1474 00000881 C3                       ret
  1475                                  ; ENDP
  1476                                  
  1477                                  name1:  ; *** PROC ***
  1478 00000882 A1[2200]                 mov ax, [token]
  1479 00000885 3D0001                   cmp ax, 256
  1480 00000888 0F840900                 je  @@name162
  1481 0000088C 68[9C08]                 push name1_0
  1482 0000088F E83B41                   call error1
  1483 00000892 83C402                   add  sp, 2
  1484                                  @@name162:
  1485 00000895 E85035                   call getlex
  1486 00000898 A3[2200]                 mov word [token], ax
  1487                                  
  1488                                  ;-186 
  1489                                  
  1490                                  
  1491                                  ;-187 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  1492                                  
  1493 0000089B C3                       ret
  1494                                  ; ENDP
  1495 0000089C 4E616D652065787065-     name1_0 db "Name expected",0
  1496 000008A5 6374656400         
  1497                                  
  1498                                  storecall:  ; *** PROC ***
  1499                                  ;Function : storecall, Number of local variables: 1
  1500                                  ;   # type sign width addr used name   list of local variables
  1501                                  ;  200 var sign word   187 NULL i = bp-2;
  1502 000008AA C8020000                 ENTER  2,0
  1503 000008AE A1[4500]                 mov ax, [CTop]
  1504 000008B1 3DD007                   cmp ax, 2000 ;unsigned : 1
  1505 000008B4 0F8C0900                 jl  @@storecall63
  1506 000008B8 68[1C09]                 push storecall_0
  1507 000008BB E80F41                   call error1
  1508 000008BE 83C402                   add  sp, 2
  1509                                  
  1510                                  ;-188   if (CNameTop >= 65468) error1("Call name table fuill");
  1511                                  
  1512                                  @@storecall63:
  1513 000008C1 A1[6800]                 mov ax, [CNameTop]
  1514 000008C4 3DBCFF                   cmp ax, 65468 ;unsigned : 0
  1515 000008C7 0F820900                 jb  @@storecall64
  1516 000008CB 68[2C09]                 push storecall_1
  1517 000008CE E8FC40                   call error1
  1518 000008D1 83C402                   add  sp, 2
  1519                                  
  1520                                  ;-189     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
  1521                                  
  1522                                  @@storecall64:
  1523 000008D4 B80000                   mov ax, 0
  1524 000008D7 8B1E[4500]               mov bx, [CTop]
  1525 000008DB 88872FA1                 mov [CType+bx], al
  1526 000008DF A1[6800]                 mov ax, [CNameTop]
  1527 000008E2 8B1E[4500]               mov bx, [CTop]
  1528 000008E6 D1E3                     shl bx, 1
  1529 000008E8 898757AB                 mov [CAdr+bx], ax
  1530 000008EC 8D062B81                 lea  ax, [symbol]
  1531 000008F0 50                       push ax
  1532 000008F1 E86E4D                   call strlen
  1533 000008F4 83C402                   add  sp, 2
  1534 000008F7 8946FE                   mov [bp-2], ax
  1535                                  
  1536                                  ;-190     to_far(CNameTop, symbol);
  1537                                  
  1538 000008FA 8D062B81                 lea  ax, [symbol]
  1539 000008FE 50                       push ax
  1540 000008FF FF36[6800]               push word [CNameTop]
  1541 00000903 E8204C                   call to_far
  1542 00000906 83C404                   add  sp, 4
  1543                                  
  1544                                  ;-191     CNameTop=CNameTop+i; CNameTop++; CTop++;
  1545                                  
  1546 00000909 A1[6800]                 mov ax, [CNameTop]
  1547 0000090C 0346FE                   add ax, [bp-2]
  1548 0000090F A3[6800]                 mov word [CNameTop], ax
  1549 00000912 FF06[6800]               inc  word[CNameTop]
  1550 00000916 FF06[4500]               inc  word[CTop]
  1551                                  
  1552                                  ;-192 }
  1553                                  
  1554                                  
  1555                                  ;-193 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
  1556 0000091A C9                       LEAVE
  1557 0000091B C3                       ret
  1558                                  ; ENDP
  1559 0000091C 43616C6C207461626C-     storecall_0 db "Call table full",0
  1560 00000925 652066756C6C00     
  1561 0000092C 43616C6C206E616D65-     storecall_1 db "Call name table fuill",0
  1562 00000935 207461626C65206675-
  1563 0000093E 696C6C00           
  1564                                  
  1565                                  storefunc:  ; *** PROC ***
  1566 00000942 A1[4300]                 mov ax, [FTop]
  1567 00000945 3D2C01                   cmp ax, 300 ;unsigned : 1
  1568 00000948 0F8C0900                 jl  @@storefunc65
  1569 0000094C 68[A309]                 push storefunc_0
  1570 0000094F E87B40                   call error1
  1571 00000952 83C402                   add  sp, 2
  1572                                  
  1573                                  ;-194     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
  1574                                  
  1575                                  @@storefunc65:
  1576 00000955 A1[6E00]                 mov ax, [lineno]
  1577 00000958 83E801                   sub ax, 1
  1578 0000095B 8B1E[4300]               mov bx, [FTop]
  1579 0000095F D1E3                     shl bx, 1
  1580 00000961 8987FFA8                 mov [FAdr+bx], ax
  1581 00000965 B80000                   mov ax, 0
  1582 00000968 8B1E[4300]               mov bx, [FTop]
  1583 0000096C D1E3                     shl bx, 1
  1584 0000096E 8987F7BA                 mov [FCalls+bx], ax
  1585 00000972 A0[4000]                 mov al, [iswidth]
  1586 00000975 8B1E[4300]               mov bx, [FTop]
  1587 00000979 888703A0                 mov [FType+bx], al
  1588                                  
  1589                                  ;-195     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
  1590                                  
  1591 0000097D FF36[4300]               push word [FTop]
  1592 00000981 8D064FBD                 lea  ax, [FNameField]
  1593 00000985 50                       push ax
  1594 00000986 E8AEFC                   call adrF
  1595 00000989 83C404                   add  sp, 4
  1596 0000098C A3[7200]                 mov word [pt], ax
  1597 0000098F 8D062B81                 lea  ax, [symbol]
  1598 00000993 50                       push ax
  1599 00000994 FF36[7200]               push word [pt]
  1600 00000998 E8EF4C                   call strcpy
  1601 0000099B 83C404                   add  sp, 4
  1602 0000099E FF06[4300]               inc  word[FTop]
  1603                                  
  1604                                  ;-196 }
  1605                                  
  1606                                  
  1607                                  ;-197 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  1608                                  
  1609 000009A2 C3                       ret
  1610                                  ; ENDP
  1611 000009A3 46756E6374696F6E20-     storefunc_0 db "Function table full",0
  1612 000009AC 7461626C652066756C-
  1613 000009B5 6C00               
  1614                                  
  1615                                  addlocal:  ; *** PROC ***
  1616 000009B7 A1[3400]                 mov ax, [LTop]
  1617 000009BA 3D2C01                   cmp ax, 300 ;unsigned : 1
  1618 000009BD 0F8C0900                 jl  @@addlocal66
  1619 000009C1 68[3D0A]                 push addlocal_0
  1620 000009C4 E80640                   call error1
  1621 000009C7 83C402                   add  sp, 2
  1622                                  
  1623                                  ;-198   if (checkName() != 0) error1("Variable already defined");
  1624                                  
  1625                                  @@addlocal66:
  1626 000009CA E828FD                   call checkName
  1627 000009CD 83F800                   cmp ax, 0
  1628 000009D0 0F840900                 je  @@addlocal67
  1629 000009D4 68[570A]                 push addlocal_1
  1630 000009D7 E8F33F                   call error1
  1631 000009DA 83C402                   add  sp, 2
  1632                                  
  1633                                  ;-199   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  1634                                  
  1635                                  @@addlocal67:
  1636 000009DD A0[3D00]                 mov al, [issign]
  1637 000009E0 8B1E[3400]               mov bx, [LTop]
  1638 000009E4 8887E383                 mov [GSign+bx], al
  1639 000009E8 A0[4000]                 mov al, [iswidth]
  1640 000009EB 8B1E[3400]               mov bx, [LTop]
  1641 000009EF 88870F85                 mov [GWidth+bx], al
  1642 000009F3 A0[3A00]                 mov al, [istype]
  1643 000009F6 8B1E[3400]               mov bx, [LTop]
  1644 000009FA 8887B782                 mov [GType+bx], al
  1645                                  
  1646                                  ;-200   GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  1647                                  
  1648 000009FE A1[6E00]                 mov ax, [lineno]
  1649 00000A01 83E801                   sub ax, 1
  1650 00000A04 8B1E[3400]               mov bx, [LTop]
  1651 00000A08 D1E3                     shl bx, 1
  1652 00000A0A 89873B86                 mov [GAdr+bx], ax
  1653 00000A0E B80000                   mov ax, 0
  1654 00000A11 8B1E[3400]               mov bx, [LTop]
  1655 00000A15 D1E3                     shl bx, 1
  1656 00000A17 89879388                 mov [GUsed+bx], ax
  1657                                  
  1658                                  ;-201   pt=adrF(GNameField, LTop); strcpy(pt, symbol);
  1659                                  
  1660 00000A1B FF36[3400]               push word [LTop]
  1661 00000A1F 8D06438D                 lea  ax, [GNameField]
  1662 00000A23 50                       push ax
  1663 00000A24 E810FC                   call adrF
  1664 00000A27 83C404                   add  sp, 4
  1665 00000A2A A3[7200]                 mov word [pt], ax
  1666 00000A2D 8D062B81                 lea  ax, [symbol]
  1667 00000A31 50                       push ax
  1668 00000A32 FF36[7200]               push word [pt]
  1669 00000A36 E8514C                   call strcpy
  1670 00000A39 83C404                   add  sp, 4
  1671                                  
  1672                                  ;-202 }
  1673                                  
  1674                                  
  1675                                  ;-203 int checkFunction() { unsigned int i; unsigned int j; i=0;
  1676                                  
  1677 00000A3C C3                       ret
  1678                                  ; ENDP
  1679 00000A3D 4C6F63616C20766172-     addlocal_0 db "Local variable table full",0
  1680 00000A46 6961626C6520746162-
  1681 00000A4F 6C652066756C6C00   
  1682 00000A57 5661726961626C6520-     addlocal_1 db "Variable already defined",0
  1683 00000A60 616C72656164792064-
  1684 00000A69 6566696E656400     
  1685                                  
  1686                                  checkFunction:  ; *** PROC ***
  1687                                  ;Function : checkFunction, Number of local variables: 2
  1688                                  ;   # type sign width addr used name   list of local variables
  1689                                  ;  200 var unsg word   203 NULL i = bp-2
  1690                                  ;  201 var unsg word   203 NULL j = bp-4;
  1691 00000A70 C8040000                 ENTER  4,0
  1692 00000A74 B80000                   mov ax, 0
  1693 00000A77 8946FE                   mov [bp-2], ax
  1694                                  
  1695                                  ;-204   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  1696                                  
  1697                                  @@checkFunction68:
  1698 00000A7A 8B46FE                   mov ax, [bp-2]
  1699 00000A7D 3B06[4300]               cmp ax, [FTop]
  1700 00000A81 0F8D3000                 jge @@checkFunction69
  1701 00000A85 FF76FE                   push word [bp-2]
  1702 00000A88 8D064FBD                 lea  ax, [FNameField]
  1703 00000A8C 50                       push ax
  1704 00000A8D E8A7FB                   call adrF
  1705 00000A90 83C404                   add  sp, 4
  1706 00000A93 8946FC                   mov [bp-4], ax
  1707 00000A96 FF76FC                   push word [bp-4]
  1708 00000A99 8D062B81                 lea  ax, [symbol]
  1709 00000A9D 50                       push ax
  1710 00000A9E E8104D                   call eqstr
  1711 00000AA1 83C404                   add  sp, 4
  1712 00000AA4 08C0                     or  al, al
  1713 00000AA6 0F840600                 je @@checkFunction70
  1714 00000AAA 8B46FE                   mov ax, [bp-2]
  1715 00000AAD E90B00                   jmp @@retn
  1716                                  @@checkFunction70:
  1717 00000AB0 FF46FE                   inc  word[bp-2]
  1718                                  
  1719                                  ;-205   return 0; }
  1720                                  
  1721 00000AB3 EBC5                     jmp @@checkFunction68
  1722                                  @@checkFunction69:
  1723 00000AB5 B80000                   mov ax, 0
  1724 00000AB8 E90000                   jmp @@retn
  1725                                  
  1726                                  ;-206 int dofunc() { int nloc; int i; int narg;  
  1727                                  
  1728 00000ABB C9                      @@retn: LEAVE
  1729 00000ABC C3                       ret
  1730                                  ; ENDP
  1731                                  
  1732                                  dofunc:  ; *** PROC ***
  1733                                  
  1734                                  ;-207   cloc=&co; 
  1735                                  
  1736                                  ;Function : dofunc, Number of local variables: 3
  1737                                  ;   # type sign width addr used name   list of local variables
  1738                                  ;  200 var sign word   206 NULL nloc = bp-2
  1739                                  ;  201 var sign word   206 NULL i = bp-4
  1740                                  ;  202 var sign word   206 NULL narg = bp-6;
  1741 00000ABD C8060000                 ENTER  6,0
  1742 00000AC1 B83075                   mov ax, co
  1743 00000AC4 A3[1C00]                 mov word [cloc], ax
  1744                                  
  1745                                  ;-208   checknamelen();
  1746                                  
  1747 00000AC7 E827F6                   call checknamelen
  1748                                  
  1749                                  ;-209   strcpy(fname, symbol);
  1750                                  
  1751 00000ACA 8D062B81                 lea  ax, [symbol]
  1752 00000ACE 50                       push ax
  1753 00000ACF 8D06AB81                 lea  ax, [fname]
  1754 00000AD3 50                       push ax
  1755 00000AD4 E8B34B                   call strcpy
  1756 00000AD7 83C404                   add  sp, 4
  1757                                  
  1758                                  ;-210   if (checkFunction() ) error1("Function already defined");
  1759                                  
  1760 00000ADA E893FF                   call checkFunction
  1761 00000ADD 08C0                     or  al, al
  1762 00000ADF 0F840900                 je @@dofunc71
  1763 00000AE3 68[F40C]                 push dofunc_0
  1764 00000AE6 E8E43E                   call error1
  1765 00000AE9 83C402                   add  sp, 2
  1766                                  
  1767                                  ;-211   storefunc();
  1768                                  
  1769                                  @@dofunc71:
  1770 00000AEC E853FE                   call storefunc
  1771                                  
  1772                                  ;-212   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  1773                                  
  1774 00000AEF 68[0D0D]                 push dofunc_1
  1775 00000AF2 E8EF3B                   call prs
  1776 00000AF5 83C402                   add  sp, 2
  1777 00000AF8 8D062B81                 lea  ax, [symbol]
  1778 00000AFC 50                       push ax
  1779 00000AFD E8E43B                   call prs
  1780 00000B00 83C402                   add  sp, 2
  1781 00000B03 68[120D]                 push dofunc_2
  1782 00000B06 E8DB3B                   call prs
  1783 00000B09 83C402                   add  sp, 2
  1784                                  
  1785                                  ;-213   expect('('); LTop=LSTART;  i=0;
  1786                                  
  1787 00000B0C 6A28                     push 40
  1788 00000B0E E8C03A                   call expect
  1789 00000B11 83C402                   add  sp, 2
  1790 00000B14 B8C800                   mov ax, 200
  1791 00000B17 A3[3400]                 mov word [LTop], ax
  1792 00000B1A B80000                   mov ax, 0
  1793 00000B1D 8946FC                   mov [bp-4], ax
  1794                                  
  1795                                  ;-214   if (istoken(')')==0) { narg=2; 
  1796                                  
  1797 00000B20 6A29                     push 41
  1798 00000B22 E88A3A                   call istoken
  1799 00000B25 83C402                   add  sp, 2
  1800 00000B28 83F800                   cmp ax, 0
  1801 00000B2B 0F854600                 jne @@dofunc72
  1802 00000B2F B80200                   mov ax, 2
  1803 00000B32 8946FA                   mov [bp-6], ax
  1804                                  
  1805                                  ;-215     do { typeName();  addlocal(); narg+=2;
  1806                                  
  1807                                  @@dofunc73:
  1808 00000B35 E841FC                   call typeName
  1809 00000B38 E87CFE                   call addlocal
  1810 00000B3B 8346FA02                 add  word[bp-6], 2
  1811                                  
  1812                                  ;-216          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
  1813                                  
  1814 00000B3F 8B46FA                   mov ax, [bp-6]
  1815 00000B42 8B1E[3400]               mov bx, [LTop]
  1816 00000B46 D1E3                     shl bx, 1
  1817 00000B48 8987EB8A                 mov [GData+bx], ax
  1818 00000B4C A0[4000]                 mov al, [iswidth]
  1819 00000B4F 3C04                     cmp al, 4
  1820 00000B51 0F850400                 jne @@dofunc74
  1821 00000B55 8346FA02                 add  word[bp-6], 2
  1822                                  @@dofunc74:
  1823 00000B59 FF06[3400]               inc  word[LTop]
  1824                                  
  1825                                  ;-217     while (istoken(','));  expect(')'); }
  1826                                  
  1827 00000B5D 6A2C                     push 44
  1828 00000B5F E84D3A                   call istoken
  1829 00000B62 83C402                   add  sp, 2
  1830 00000B65 08C0                     or  al, al
  1831 00000B67 0F840200                 je @@dofunc75
  1832 00000B6B EBC8                     jmp @@dofunc73
  1833                                  @@dofunc75:
  1834 00000B6D 6A29                     push 41
  1835 00000B6F E85F3A                   call expect
  1836 00000B72 83C402                   add  sp, 2
  1837                                  
  1838                                  ;-218     
  1839                                  
  1840                                  
  1841                                  ;-219   expect('{'); /*body*/
  1842                                  
  1843                                  @@dofunc72:
  1844 00000B75 6A7B                     push 123
  1845 00000B77 E8573A                   call expect
  1846 00000B7A 83C402                   add  sp, 2
  1847                                  
  1848                                  ;-220   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  1849                                  
  1850 00000B7D B80000                   mov ax, 0
  1851 00000B80 8946FE                   mov [bp-2], ax
  1852 00000B83 B80000                   mov ax, 0
  1853 00000B86 A3[2C00]                 mov word [nreturn], ax
  1854 00000B89 B80000                   mov ax, 0
  1855 00000B8C A3[2A00]                 mov word [nconst], ax
  1856 00000B8F B80000                   mov ax, 0
  1857 00000B92 8946FC                   mov [bp-4], ax
  1858                                  
  1859                                  ;-221   while(isvariable()) {
  1860                                  
  1861                                  @@dofunc76:
  1862 00000B95 E8BC01                   call isvariable
  1863 00000B98 08C0                     or  al, al
  1864 00000B9A 0F849200                 je @@dofunc77
  1865                                  
  1866                                  ;-222     do {typeName();
  1867                                  
  1868                                  @@dofunc78:
  1869 00000B9E E8D8FB                   call typeName
  1870                                  
  1871                                  ;-223         checknamelen();
  1872                                  
  1873 00000BA1 E84DF5                   call checknamelen
  1874                                  
  1875                                  ;-224         addlocal(); nloc-=2;
  1876                                  
  1877 00000BA4 E810FE                   call addlocal
  1878 00000BA7 836EFE02                 sub  word[bp-2], 2
  1879                                  
  1880                                  ;-225         if (iswidth == 4) nloc-=2;
  1881                                  
  1882 00000BAB A0[4000]                 mov al, [iswidth]
  1883 00000BAE 3C04                     cmp al, 4
  1884 00000BB0 0F850400                 jne @@dofunc79
  1885 00000BB4 836EFE02                 sub  word[bp-2], 2
  1886                                  
  1887                                  ;-226         GData[LTop]=nloc;
  1888                                  
  1889                                  @@dofunc79:
  1890 00000BB8 8B46FE                   mov ax, [bp-2]
  1891 00000BBB 8B1E[3400]               mov bx, [LTop]
  1892 00000BBF D1E3                     shl bx, 1
  1893 00000BC1 8987EB8A                 mov [GData+bx], ax
  1894                                  
  1895                                  ;-227         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
  1896                                  
  1897 00000BC5 6A5B                     push 91
  1898 00000BC7 E8E539                   call istoken
  1899 00000BCA 83C402                   add  sp, 2
  1900 00000BCD 08C0                     or  al, al
  1901 00000BCF 0F843D00                 je @@dofunc80
  1902 00000BD3 B82600                   mov ax, 38
  1903 00000BD6 A2[3A00]                 mov byte [istype], al
  1904 00000BD9 B82600                   mov ax, 38
  1905 00000BDC 8B1E[3400]               mov bx, [LTop]
  1906 00000BE0 8887B782                 mov [GType+bx], al
  1907 00000BE4 680101                   push 257
  1908 00000BE7 E8E739                   call expect
  1909 00000BEA 83C402                   add  sp, 2
  1910 00000BED 6A5D                     push 93
  1911 00000BEF E8DF39                   call expect
  1912 00000BF2 83C402                   add  sp, 2
  1913                                  
  1914                                  ;-228             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
  1915                                  
  1916 00000BF5 8B46FE                   mov ax, [bp-2]
  1917 00000BF8 2B06[3600]               sub ax, [lexval]
  1918 00000BFC 8946FE                   mov [bp-2], ax
  1919 00000BFF 8346FE02                 add  word[bp-2], 2
  1920 00000C03 8B46FE                   mov ax, [bp-2]
  1921 00000C06 8B1E[3400]               mov bx, [LTop]
  1922 00000C0A D1E3                     shl bx, 1
  1923 00000C0C 8987EB8A                 mov [GData+bx], ax
  1924                                  
  1925                                  ;-229         LTop++;
  1926                                  
  1927                                  @@dofunc80:
  1928 00000C10 FF06[3400]               inc  word[LTop]
  1929                                  
  1930                                  ;-230       } while (istoken(',')); expect(';'); }
  1931                                  
  1932 00000C14 6A2C                     push 44
  1933 00000C16 E89639                   call istoken
  1934 00000C19 83C402                   add  sp, 2
  1935 00000C1C 08C0                     or  al, al
  1936 00000C1E 0F840300                 je @@dofunc81
  1937 00000C22 E979FF                   jmp @@dofunc78
  1938                                  @@dofunc81:
  1939 00000C25 6A3B                     push 59
  1940 00000C27 E8A739                   call expect
  1941 00000C2A 83C402                   add  sp, 2
  1942                                  
  1943                                  ;-231   listproc(); 
  1944                                  
  1945 00000C2D E965FF                   jmp @@dofunc76
  1946                                  @@dofunc77:
  1947 00000C30 E89C3E                   call listproc
  1948                                  
  1949                                  ;-232   if (LTop>LSTART){prs(";\n ENTER  "); 
  1950                                  
  1951 00000C33 A1[3400]                 mov ax, [LTop]
  1952 00000C36 3DC800                   cmp ax, 200
  1953 00000C39 0F8E2700                 jle @@dofunc82
  1954 00000C3D 68[240D]                 push dofunc_3
  1955 00000C40 E8A13A                   call prs
  1956 00000C43 83C402                   add  sp, 2
  1957                                  
  1958                                  ;-233     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }
  1959                                  
  1960 00000C46 FF76FE                   push word [bp-2]
  1961 00000C49 E86549                   call mkneg
  1962 00000C4C 83C402                   add  sp, 2
  1963 00000C4F 8946FE                   mov [bp-2], ax
  1964 00000C52 FF76FE                   push word [bp-2]
  1965 00000C55 E8833B                   call pint1
  1966 00000C58 83C402                   add  sp, 2
  1967 00000C5B 68[300D]                 push dofunc_4
  1968 00000C5E E8833A                   call prs
  1969 00000C61 83C402                   add  sp, 2
  1970                                  
  1971                                  ;-234   while(istoken('}')==0)   stmt();
  1972                                  
  1973                                  @@dofunc82:
  1974                                  @@dofunc83:
  1975 00000C64 6A7D                     push 125
  1976 00000C66 E84639                   call istoken
  1977 00000C69 83C402                   add  sp, 2
  1978 00000C6C 83F800                   cmp ax, 0
  1979 00000C6F 0F850500                 jne @@dofunc84
  1980 00000C73 E8092B                   call stmt
  1981                                  
  1982                                  ;-235   if (nreturn) { prs("\n@@retn:");}
  1983                                  
  1984 00000C76 EBEC                     jmp @@dofunc83
  1985                                  @@dofunc84:
  1986 00000C78 A1[2C00]                 mov ax, [nreturn]
  1987 00000C7B 08C0                     or  al, al
  1988 00000C7D 0F840900                 je @@dofunc85
  1989 00000C81 68[330D]                 push dofunc_5
  1990 00000C84 E85D3A                   call prs
  1991 00000C87 83C402                   add  sp, 2
  1992                                  
  1993                                  ;-236   if (LTop > LSTART) prs(" LEAVE");
  1994                                  
  1995                                  @@dofunc85:
  1996 00000C8A A1[3400]                 mov ax, [LTop]
  1997 00000C8D 3DC800                   cmp ax, 200
  1998 00000C90 0F8E0900                 jle @@dofunc86
  1999 00000C94 68[3D0D]                 push dofunc_6
  2000 00000C97 E84A3A                   call prs
  2001 00000C9A 83C402                   add  sp, 2
  2002                                  
  2003                                  ;-237   prs("\n ret"); prs("\n; ENDP"); 
  2004                                  
  2005                                  @@dofunc86:
  2006 00000C9D 68[440D]                 push dofunc_7
  2007 00000CA0 E8413A                   call prs
  2008 00000CA3 83C402                   add  sp, 2
  2009 00000CA6 68[4B0D]                 push dofunc_8
  2010 00000CA9 E8383A                   call prs
  2011 00000CAC 83C402                   add  sp, 2
  2012                                  
  2013                                  ;-238   *cloc=0; prs(co); maxco1=strlen(co);
  2014                                  
  2015 00000CAF B80000                   mov ax, 0
  2016 00000CB2 8B1E[1C00]               mov  bx, [cloc]
  2017 00000CB6 8807                     mov  [bx], al
  2018 00000CB8 8D063075                 lea  ax, [co]
  2019 00000CBC 50                       push ax
  2020 00000CBD E8243A                   call prs
  2021 00000CC0 83C402                   add  sp, 2
  2022 00000CC3 8D063075                 lea  ax, [co]
  2023 00000CC7 50                       push ax
  2024 00000CC8 E89749                   call strlen
  2025 00000CCB 83C402                   add  sp, 2
  2026 00000CCE A3[1A00]                 mov word [maxco1], ax
  2027                                  
  2028                                  ;-239   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  2029                                  
  2030 00000CD1 A1[1A00]                 mov ax, [maxco1]
  2031 00000CD4 3B06[1800]               cmp ax, [maxco]
  2032 00000CD8 0F8E1600                 jle @@dofunc87
  2033 00000CDC A1[1A00]                 mov ax, [maxco1]
  2034 00000CDF A3[1800]                 mov word [maxco], ax
  2035 00000CE2 8D06AB81                 lea  ax, [fname]
  2036 00000CE6 50                       push ax
  2037 00000CE7 8D06E880                 lea  ax, [coname]
  2038 00000CEB 50                       push ax
  2039 00000CEC E89B49                   call strcpy
  2040 00000CEF 83C404                   add  sp, 4
  2041                                  
  2042                                  ;-240 }
  2043                                  
  2044                                  @@dofunc87:
  2045                                  
  2046                                  ;-241 int isvariable() {
  2047 00000CF2 C9                       LEAVE
  2048 00000CF3 C3                       ret
  2049                                  ; ENDP
  2050 00000CF4 46756E6374696F6E20-     dofunc_0 db "Function already defined",0
  2051 00000CFD 616C72656164792064-
  2052 00000D06 6566696E656400     
  2053 00000D0D 5C6E5C6E00              dofunc_1 db "\n\n",0
  2054 00000D12 3A20203B202A2A2A20-     dofunc_2 db ":  ; *** PROC ***",0
  2055 00000D1B 50524F43202A2A2A00 
  2056 00000D24 3B5C6E20454E544552-     dofunc_3 db ";\n ENTER  ",0
  2057 00000D2D 202000             
  2058 00000D30 2C3000                  dofunc_4 db ",0",0
  2059 00000D33 5C6E40407265746E3A-     dofunc_5 db "\n@@retn:",0
  2060 00000D3C 00                 
  2061 00000D3D 204C4541564500          dofunc_6 db " LEAVE",0
  2062 00000D44 5C6E2072657400          dofunc_7 db "\n ret",0
  2063 00000D4B 5C6E3B20454E445000      dofunc_8 db "\n; ENDP",0
  2064                                  
  2065                                  isvariable:  ; *** PROC ***
  2066                                  
  2067                                  ;-242   if(token==T_SIGNED) goto v1;   if(token==T_UNSIGNED) goto v1;
  2068                                  
  2069 00000D54 A1[2200]                 mov ax, [token]
  2070 00000D57 3D1302                   cmp ax, 531
  2071 00000D5A 0F850300                 jne @@isvariable88
  2072 00000D5E E95400                   jmp @@v1
  2073                                  @@isvariable88:
  2074 00000D61 A1[2200]                 mov ax, [token]
  2075 00000D64 3D1402                   cmp ax, 532
  2076 00000D67 0F850300                 jne @@isvariable89
  2077 00000D6B E94700                   jmp @@v1
  2078                                  
  2079                                  ;-243   if(token==T_CHAR)   goto v1;   if(token==T_INT)      goto v1;
  2080                                  
  2081                                  @@isvariable89:
  2082 00000D6E A1[2200]                 mov ax, [token]
  2083 00000D71 3D1202                   cmp ax, 530
  2084 00000D74 0F850300                 jne @@isvariable90
  2085 00000D78 E93A00                   jmp @@v1
  2086                                  @@isvariable90:
  2087 00000D7B A1[2200]                 mov ax, [token]
  2088 00000D7E 3D0502                   cmp ax, 517
  2089 00000D81 0F850300                 jne @@isvariable91
  2090 00000D85 E92D00                   jmp @@v1
  2091                                  
  2092                                  ;-244   if(token==T_SHORT)  goto v1;   if(token==T_LONG)     goto v1;
  2093                                  
  2094                                  @@isvariable91:
  2095 00000D88 A1[2200]                 mov ax, [token]
  2096 00000D8B 3D1602                   cmp ax, 534
  2097 00000D8E 0F850300                 jne @@isvariable92
  2098 00000D92 E92000                   jmp @@v1
  2099                                  @@isvariable92:
  2100 00000D95 A1[2200]                 mov ax, [token]
  2101 00000D98 3D1502                   cmp ax, 533
  2102 00000D9B 0F850300                 jne @@isvariable93
  2103 00000D9F E91300                   jmp @@v1
  2104                                  
  2105                                  ;-245   if(token==T_UINT32) goto v1;   return 0;  v1: return 1;
  2106                                  
  2107                                  @@isvariable93:
  2108 00000DA2 A1[2200]                 mov ax, [token]
  2109 00000DA5 3D2102                   cmp ax, 545
  2110 00000DA8 0F850300                 jne @@isvariable94
  2111 00000DAC E90600                   jmp @@v1
  2112                                  @@isvariable94:
  2113 00000DAF B80000                   mov ax, 0
  2114 00000DB2 E90600                   jmp @@retn
  2115                                  @@v1:
  2116 00000DB5 B80100                   mov ax, 1
  2117 00000DB8 E90000                   jmp @@retn
  2118                                  
  2119                                  ;-246 }
  2120                                  
  2121                                  
  2122                                  ;-247                   
  2123                                  
  2124                                  
  2125                                  ;-248 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
  2126                                  
  2127                                  @@retn:
  2128 00000DBB C3                       ret
  2129                                  ; ENDP
  2130 00000DBC 0000                    mod1 dw 0
  2131 00000DBE 0000                    ireg1 dw 0
  2132 00000DC0 0000                    idx1 dw 0
  2133 00000DC2 0000                    ids1 dw 0
  2134 00000DC4 0000                    idw1 dw 0
  2135 00000DC6 0000                    idt1 dw 0
  2136 00000DC8 0000                    val1 dw 0
  2137                                  
  2138                                  ;-249 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;
  2139                                  
  2140 00000DCA 0000                    mod2 dw 0
  2141 00000DCC 0000                    ireg2 dw 0
  2142 00000DCE 0000                    idx2 dw 0
  2143 00000DD0 0000                    ids2 dw 0
  2144 00000DD2 0000                    idw2 dw 0
  2145 00000DD4 0000                    idt2 dw 0
  2146 00000DD6 0000                    val2 dw 0
  2147                                  
  2148                                  ;-250 
  2149                                  
  2150                                  
  2151                                  ;-251 int pexpr() {expect('('); iscmp=0; 
  2152                                  
  2153                                  
  2154                                  pexpr:  ; *** PROC ***
  2155 00000DD8 6A28                     push 40
  2156 00000DDA E8F437                   call expect
  2157 00000DDD 83C402                   add  sp, 2
  2158 00000DE0 B80000                   mov ax, 0
  2159 00000DE3 A3[2800]                 mov word [iscmp], ax
  2160                                  
  2161                                  ;-252   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
  2162                                  
  2163 00000DE6 A1[2200]                 mov ax, [token]
  2164 00000DE9 3D0001                   cmp ax, 256
  2165 00000DEC 0F853400                 jne @@pexpr95
  2166 00000DF0 68[4E0E]                 push pexpr_0
  2167 00000DF3 8D062B81                 lea  ax, [symbol]
  2168 00000DF7 50                       push ax
  2169 00000DF8 E8B649                   call eqstr
  2170 00000DFB 83C404                   add  sp, 4
  2171 00000DFE 08C0                     or  al, al
  2172 00000E00 0F840600                 je @@pexpr96
  2173 00000E04 E85F00                   call constantexpr
  2174 00000E07 E94300                   jmp @@retn
  2175                                  
  2176                                  ;-253     ireg1=checkreg();
  2177                                  
  2178                                  @@pexpr96:
  2179 00000E0A E89B07                   call checkreg
  2180 00000E0D A3[BE0D]                 mov word [ireg1], ax
  2181                                  
  2182                                  ;-254     if (ireg1) { doreg1(1); return; }  }
  2183                                  
  2184 00000E10 A1[BE0D]                 mov ax, [ireg1]
  2185 00000E13 08C0                     or  al, al
  2186 00000E15 0F840B00                 je @@pexpr97
  2187 00000E19 6A01                     push 1
  2188 00000E1B E89E05                   call doreg1
  2189 00000E1E 83C402                   add  sp, 2
  2190 00000E21 E92900                   jmp @@retn
  2191                                  @@pexpr97:
  2192                                  
  2193                                  ;-255   exprstart(); if (iscmp==0) prs("\n or  al, al\n je @@");  prs(fname);
  2194                                  
  2195                                  @@pexpr95:
  2196 00000E24 E83E01                   call exprstart
  2197 00000E27 A1[2800]                 mov ax, [iscmp]
  2198 00000E2A 83F800                   cmp ax, 0
  2199 00000E2D 0F850900                 jne @@pexpr98
  2200 00000E31 68[500E]                 push pexpr_1
  2201 00000E34 E8AD38                   call prs
  2202 00000E37 83C402                   add  sp, 2
  2203                                  @@pexpr98:
  2204 00000E3A 8D06AB81                 lea  ax, [fname]
  2205 00000E3E 50                       push ax
  2206 00000E3F E8A238                   call prs
  2207 00000E42 83C402                   add  sp, 2
  2208                                  
  2209                                  ;-256   expect(')'); }           /*error1("Vergleich fehlt");*/
  2210                                  
  2211 00000E45 6A29                     push 41
  2212 00000E47 E88737                   call expect
  2213 00000E4A 83C402                   add  sp, 2
  2214                                  
  2215                                  ;-257 
  2216                                  
  2217                                  
  2218                                  ;-258 int constantexpr() { int mode; int id1;int ids;
  2219                                  
  2220                                  @@retn:
  2221 00000E4D C3                       ret
  2222                                  ; ENDP
  2223 00000E4E 5F00                    pexpr_0 db "_",0
  2224 00000E50 5C6E206F722020616C-     pexpr_1 db "\n or  al, al\n je @@",0
  2225 00000E59 2C20616C5C6E206A65-
  2226 00000E62 20404000           
  2227                                  
  2228                                  constantexpr:  ; *** PROC ***
  2229                                  
  2230                                  ;-259   token=getlex();   mode=typeName();  
  2231                                  
  2232                                  ;Function : constantexpr, Number of local variables: 3
  2233                                  ;   # type sign width addr used name   list of local variables
  2234                                  ;  200 var sign word   258 NULL mode = bp-2
  2235                                  ;  201 var sign word   258 NULL id1 = bp-4
  2236                                  ;  202 var sign word   258 NULL ids = bp-6;
  2237 00000E66 C8060000                 ENTER  6,0
  2238 00000E6A E87B2F                   call getlex
  2239 00000E6D A3[2200]                 mov word [token], ax
  2240 00000E70 E806F9                   call typeName
  2241 00000E73 8946FE                   mov [bp-2], ax
  2242                                  
  2243                                  ;-260   id1=searchname(); gettypes(id1); ids=signi;
  2244                                  
  2245 00000E76 E831F8                   call searchname
  2246 00000E79 8946FC                   mov [bp-4], ax
  2247 00000E7C FF76FC                   push word [bp-4]
  2248 00000E7F E8EAF6                   call gettypes
  2249 00000E82 83C402                   add  sp, 2
  2250 00000E85 A1[3B00]                 mov ax, [signi]
  2251 00000E88 8946FA                   mov [bp-6], ax
  2252                                  
  2253                                  ;-261   if (isrelational() ==0) error1("Relational expression expected");
  2254                                  
  2255 00000E8B E8F32E                   call isrelational
  2256 00000E8E 83F800                   cmp ax, 0
  2257 00000E91 0F850900                 jne @@constantexpr99
  2258 00000E95 68[1B0F]                 push constantexpr_0
  2259 00000E98 E8323B                   call error1
  2260 00000E9B 83C402                   add  sp, 2
  2261                                  
  2262                                  ;-262   expect(T_CONST);  prs(" ; constant expression");
  2263                                  
  2264                                  @@constantexpr99:
  2265 00000E9E 680101                   push 257
  2266 00000EA1 E82D37                   call expect
  2267 00000EA4 83C402                   add  sp, 2
  2268 00000EA7 68[3A0F]                 push constantexpr_1
  2269 00000EAA E83738                   call prs
  2270 00000EAD 83C402                   add  sp, 2
  2271                                  
  2272                                  ;-263   prs("\ncmp "); 
  2273                                  
  2274 00000EB0 68[510F]                 push constantexpr_2
  2275 00000EB3 E82E38                   call prs
  2276 00000EB6 83C402                   add  sp, 2
  2277                                  
  2278                                  ;-264   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  2279                                  
  2280 00000EB9 FF76FC                   push word [bp-4]
  2281 00000EBC E8ADF6                   call gettypes
  2282 00000EBF 83C402                   add  sp, 2
  2283 00000EC2 A1[4100]                 mov ax, [wi]
  2284 00000EC5 83F802                   cmp ax, 2
  2285 00000EC8 0F850C00                 jne @@constantexpr100
  2286 00000ECC 68[580F]                 push constantexpr_3
  2287 00000ECF E81238                   call prs
  2288 00000ED2 83C402                   add  sp, 2
  2289 00000ED5 E90900                   jmp @@constantexpr101
  2290                                  @@constantexpr100:
  2291 00000ED8 68[5D0F]                 push constantexpr_4
  2292 00000EDB E80638                   call prs
  2293 00000EDE 83C402                   add  sp, 2
  2294                                  
  2295                                  ;-265   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  2296                                  
  2297                                  @@constantexpr101:
  2298 00000EE1 FF76FC                   push word [bp-4]
  2299 00000EE4 E8D7F1                   call v
  2300 00000EE7 83C402                   add  sp, 2
  2301 00000EEA 68[620F]                 push constantexpr_5
  2302 00000EED E8F437                   call prs
  2303 00000EF0 83C402                   add  sp, 2
  2304 00000EF3 FF36[3600]               push word [lexval]
  2305 00000EF7 E84439                   call prunsign1
  2306 00000EFA 83C402                   add  sp, 2
  2307 00000EFD FF76FA                   push word [bp-6]
  2308 00000F00 E82F2B                   call cmpneg
  2309 00000F03 83C402                   add  sp, 2
  2310 00000F06 8D06AB81                 lea  ax, [fname]
  2311 00000F0A 50                       push ax
  2312 00000F0B E8D637                   call prs
  2313 00000F0E 83C402                   add  sp, 2
  2314                                  
  2315                                  ;-266   expect(')');
  2316                                  
  2317 00000F11 6A29                     push 41
  2318 00000F13 E8BB36                   call expect
  2319 00000F16 83C402                   add  sp, 2
  2320                                  
  2321                                  ;-267 }  
  2322                                  
  2323                                  
  2324                                  ;-268 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
  2325 00000F19 C9                       LEAVE
  2326 00000F1A C3                       ret
  2327                                  ; ENDP
  2328 00000F1B 52656C6174696F6E61-     constantexpr_0 db "Relational expression expected",0
  2329 00000F24 6C2065787072657373-
  2330 00000F2D 696F6E206578706563-
  2331 00000F36 74656400           
  2332 00000F3A 203B20636F6E737461-     constantexpr_1 db " ; constant expression",0
  2333 00000F43 6E7420657870726573-
  2334 00000F4C 73696F6E00         
  2335 00000F51 5C6E636D702000          constantexpr_2 db "\ncmp ",0
  2336 00000F58 776F726400              constantexpr_3 db "word",0
  2337 00000F5D 6279746500              constantexpr_4 db "byte",0
  2338 00000F62 2C2000                  constantexpr_5 db ", ",0
  2339                                  
  2340                                  exprstart:  ; *** PROC ***
  2341 00000F65 68[8D0F]                 push exprstart_0
  2342 00000F68 8D062B81                 lea  ax, [symbol]
  2343 00000F6C 50                       push ax
  2344 00000F6D E84148                   call eqstr
  2345 00000F70 83C404                   add  sp, 4
  2346 00000F73 08C0                     or  al, al
  2347 00000F75 0F840B00                 je @@exprstart102
  2348 00000F79 6A00                     push 0
  2349 00000F7B E81100                   call expr2
  2350 00000F7E 83C402                   add  sp, 2
  2351 00000F81 E90800                   jmp @@exprstart103
  2352                                  @@exprstart102:
  2353 00000F84 6A00                     push 0
  2354 00000F86 E89E0A                   call expr
  2355 00000F89 83C402                   add  sp, 2
  2356                                  @@exprstart103:
  2357                                  
  2358                                  ;-269 
  2359                                  
  2360                                  
  2361                                  ;-270 int expr2(int kind) {  int i;
  2362                                  
  2363 00000F8C C3                       ret
  2364                                  ; ENDP
  2365 00000F8D 5F00                    exprstart_0 db "_",0
  2366                                  
  2367                                  expr2:  ; *** PROC ***
  2368                                  
  2369                                  ;-271   if(kind != 1) token=getlex();
  2370                                  
  2371                                  ;Function : expr2, Number of local variables: 2
  2372                                  ;   # type sign width addr used name   list of local variables
  2373                                  ;  200 var sign word   270 NULL kind = bp+4
  2374                                  ;  201 var sign word   270 NULL i = bp-2;
  2375 00000F8F C8020000                 ENTER  2,0
  2376 00000F93 8B4604                   mov ax, [bp+4]
  2377 00000F96 83F801                   cmp ax, 1
  2378 00000F99 0F840600                 je  @@expr2104
  2379 00000F9D E8482E                   call getlex
  2380 00000FA0 A3[2200]                 mov word [token], ax
  2381                                  
  2382                                  ;-272   mod1=typeName();
  2383                                  
  2384                                  @@expr2104:
  2385 00000FA3 E8D3F7                   call typeName
  2386 00000FA6 A3[BC0D]                 mov word [mod1], ax
  2387                                  
  2388                                  ;-273   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  2389                                  
  2390 00000FA9 A1[BC0D]                 mov ax, [mod1]
  2391 00000FAC 08C0                     or  al, al
  2392 00000FAE 0F840900                 je @@expr2105
  2393 00000FB2 68[4712]                 push expr2_0
  2394 00000FB5 E8153A                   call error1
  2395 00000FB8 83C402                   add  sp, 2
  2396                                  
  2397                                  ;-274   ireg1=checkreg();
  2398                                  
  2399                                  @@expr2105:
  2400 00000FBB E8EA05                   call checkreg
  2401 00000FBE A3[BE0D]                 mov word [ireg1], ax
  2402                                  
  2403                                  ;-275   if (ireg1) { doreg1(0); return; }
  2404                                  
  2405 00000FC1 A1[BE0D]                 mov ax, [ireg1]
  2406 00000FC4 08C0                     or  al, al
  2407 00000FC6 0F840B00                 je @@expr2106
  2408 00000FCA 6A00                     push 0
  2409 00000FCC E8ED03                   call doreg1
  2410 00000FCF 83C402                   add  sp, 2
  2411 00000FD2 E97002                   jmp @@retn
  2412                                  
  2413                                  ;-276   if (ireg1 == 0) { idx1=searchname();
  2414                                  
  2415                                  @@expr2106:
  2416 00000FD5 A1[BE0D]                 mov ax, [ireg1]
  2417 00000FD8 83F800                   cmp ax, 0
  2418 00000FDB 0F853400                 jne @@expr2107
  2419 00000FDF E8C8F6                   call searchname
  2420 00000FE2 A3[C00D]                 mov word [idx1], ax
  2421                                  
  2422                                  ;-277     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
  2423                                  
  2424 00000FE5 FF36[C00D]               push word [idx1]
  2425 00000FE9 E880F5                   call gettypes
  2426 00000FEC 83C402                   add  sp, 2
  2427 00000FEF A1[3B00]                 mov ax, [signi]
  2428 00000FF2 A3[C20D]                 mov word [ids1], ax
  2429 00000FF5 A1[4100]                 mov ax, [wi]
  2430 00000FF8 A3[C40D]                 mov word [idw1], ax
  2431 00000FFB A1[3800]                 mov ax, [typei]
  2432 00000FFE A3[C60D]                 mov word [idt1], ax
  2433                                  
  2434                                  ;-278     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  2435                                  
  2436 00001001 A1[C60D]                 mov ax, [idt1]
  2437 00001004 08C0                     or  al, al
  2438 00001006 0F840900                 je @@expr2108
  2439 0000100A 68[7612]                 push expr2_1
  2440 0000100D E8BD39                   call error1
  2441 00001010 83C402                   add  sp, 2
  2442                                  @@expr2108:
  2443                                  
  2444                                  ;-279   
  2445                                  
  2446                                  
  2447                                  ;-280   if (isrelational()) { error1("Vergleich noch nicht implementiert");
  2448                                  
  2449                                  @@expr2107:
  2450 00001013 E86B2D                   call isrelational
  2451 00001016 08C0                     or  al, al
  2452 00001018 0F840900                 je @@expr2109
  2453 0000101C 68[A112]                 push expr2_2
  2454 0000101F E8AB39                   call error1
  2455 00001022 83C402                   add  sp, 2
  2456                                  
  2457                                  ;-281   }
  2458                                  
  2459                                  
  2460                                  ;-282   if (istoken('=') == 0) error1("Assign expected");
  2461                                  
  2462                                  @@expr2109:
  2463 00001025 6A3D                     push 61
  2464 00001027 E88535                   call istoken
  2465 0000102A 83C402                   add  sp, 2
  2466 0000102D 83F800                   cmp ax, 0
  2467 00001030 0F850900                 jne @@expr2110
  2468 00001034 68[C412]                 push expr2_3
  2469 00001037 E89339                   call error1
  2470 0000103A 83C402                   add  sp, 2
  2471                                  
  2472                                  ;-283   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
  2473                                  
  2474                                  @@expr2110:
  2475 0000103D 680101                   push 257
  2476 00001040 E86C35                   call istoken
  2477 00001043 83C402                   add  sp, 2
  2478 00001046 08C0                     or  al, al
  2479 00001048 0F849A00                 je @@expr2111
  2480 0000104C A1[3600]                 mov ax, [lexval]
  2481 0000104F A3[D60D]                 mov word [val2], ax
  2482 00001052 68[D412]                 push expr2_4
  2483 00001055 E88C36                   call prs
  2484 00001058 83C402                   add  sp, 2
  2485                                  
  2486                                  ;-284     prs("\nmov ");
  2487                                  
  2488 0000105B 68[EB12]                 push expr2_5
  2489 0000105E E88336                   call prs
  2490 00001061 83C402                   add  sp, 2
  2491                                  
  2492                                  ;-285     if (idw1 == 1) prs("byte ");
  2493                                  
  2494 00001064 A1[C40D]                 mov ax, [idw1]
  2495 00001067 83F801                   cmp ax, 1
  2496 0000106A 0F850900                 jne @@expr2112
  2497 0000106E 68[F212]                 push expr2_6
  2498 00001071 E87036                   call prs
  2499 00001074 83C402                   add  sp, 2
  2500                                  
  2501                                  ;-286     if (idw1 == 2) prs("word ");
  2502                                  
  2503                                  @@expr2112:
  2504 00001077 A1[C40D]                 mov ax, [idw1]
  2505 0000107A 83F802                   cmp ax, 2
  2506 0000107D 0F850900                 jne @@expr2113
  2507 00001081 68[F812]                 push expr2_7
  2508 00001084 E85D36                   call prs
  2509 00001087 83C402                   add  sp, 2
  2510                                  
  2511                                  ;-287     if (idw1 == 4) prs("dword ");
  2512                                  
  2513                                  @@expr2113:
  2514 0000108A A1[C40D]                 mov ax, [idw1]
  2515 0000108D 83F804                   cmp ax, 4
  2516 00001090 0F850900                 jne @@expr2114
  2517 00001094 68[FE12]                 push expr2_8
  2518 00001097 E84A36                   call prs
  2519 0000109A 83C402                   add  sp, 2
  2520                                  
  2521                                  ;-288     v(idx1);
  2522                                  
  2523                                  @@expr2114:
  2524 0000109D FF36[C00D]               push word [idx1]
  2525 000010A1 E81AF0                   call v
  2526 000010A4 83C402                   add  sp, 2
  2527                                  
  2528                                  ;-289     prs(", "); prunsign1(val2);
  2529                                  
  2530 000010A7 68[0513]                 push expr2_9
  2531 000010AA E83736                   call prs
  2532 000010AD 83C402                   add  sp, 2
  2533 000010B0 FF36[D60D]               push word [val2]
  2534 000010B4 E88737                   call prunsign1
  2535 000010B7 83C402                   add  sp, 2
  2536                                  
  2537                                  ;-290     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  2538                                  
  2539 000010BA A1[C00D]                 mov ax, [idx1]
  2540 000010BD 3DC800                   cmp ax, 200 ;unsigned : 1
  2541 000010C0 0F8C1F00                 jl  @@expr2115
  2542 000010C4 FF36[C00D]               push word [idx1]
  2543 000010C8 E858F5                   call adrofname
  2544 000010CB 83C402                   add  sp, 2
  2545 000010CE 8946FE                   mov [bp-2], ax
  2546 000010D1 68[0813]                 push expr2_10
  2547 000010D4 E80D36                   call prs
  2548 000010D7 83C402                   add  sp, 2
  2549 000010DA FF76FE                   push word [bp-2]
  2550 000010DD E80436                   call prs
  2551 000010E0 83C402                   add  sp, 2
  2552                                  @@expr2115:
  2553 000010E3 E95F01                   jmp @@retn
  2554                                  
  2555                                  ;-291   
  2556                                  
  2557                                  
  2558                                  ;-292   mod1=typeName(); ireg2=checkreg();
  2559                                  
  2560                                  @@expr2111:
  2561 000010E6 E890F6                   call typeName
  2562 000010E9 A3[BC0D]                 mov word [mod1], ax
  2563 000010EC E8B904                   call checkreg
  2564 000010EF A3[CC0D]                 mov word [ireg2], ax
  2565                                  
  2566                                  ;-293   if (ireg2) { prs("\nmov ");
  2567                                  
  2568 000010F2 A1[CC0D]                 mov ax, [ireg2]
  2569 000010F5 08C0                     or  al, al
  2570 000010F7 0F844200                 je @@expr2116
  2571 000010FB 68[0B13]                 push expr2_11
  2572 000010FE E8E335                   call prs
  2573 00001101 83C402                   add  sp, 2
  2574                                  
  2575                                  ;-294     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  2576                                  
  2577 00001104 A1[BE0D]                 mov ax, [ireg1]
  2578 00001107 08C0                     or  al, al
  2579 00001109 0F840D00                 je @@expr2117
  2580 0000110D FF36[BE0D]               push word [ireg1]
  2581 00001111 E8A208                   call printreg
  2582 00001114 83C402                   add  sp, 2
  2583 00001117 E90A00                   jmp @@expr2118
  2584                                  @@expr2117:
  2585 0000111A FF36[C00D]               push word [idx1]
  2586 0000111E E89DEF                   call v
  2587 00001121 83C402                   add  sp, 2
  2588                                  @@expr2118:
  2589 00001124 68[1213]                 push expr2_12
  2590 00001127 E8BA35                   call prs
  2591 0000112A 83C402                   add  sp, 2
  2592 0000112D FF36[CC0D]               push word [ireg2]
  2593 00001131 E88208                   call printreg
  2594 00001134 83C402                   add  sp, 2
  2595 00001137 E90B01                   jmp @@retn
  2596                                  
  2597                                  ;-295   else {
  2598                                  
  2599 0000113A E9FF00                   jmp @@expr2119
  2600                                  @@expr2116:
  2601                                  
  2602                                  ;-296     if (mod1 == 1) error1("Noch kein * im Text erlaubt");
  2603                                  
  2604 0000113D A1[BC0D]                 mov ax, [mod1]
  2605 00001140 83F801                   cmp ax, 1
  2606 00001143 0F850900                 jne @@expr2120
  2607 00001147 68[1513]                 push expr2_13
  2608 0000114A E88038                   call error1
  2609 0000114D 83C402                   add  sp, 2
  2610                                  
  2611                                  ;-297     
  2612                                  
  2613                                  
  2614                                  ;-298     idx2=searchname();
  2615                                  
  2616                                  @@expr2120:
  2617 00001150 E857F5                   call searchname
  2618 00001153 A3[CE0D]                 mov word [idx2], ax
  2619                                  
  2620                                  ;-299     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
  2621                                  
  2622 00001156 FF36[CE0D]               push word [idx2]
  2623 0000115A E80FF4                   call gettypes
  2624 0000115D 83C402                   add  sp, 2
  2625 00001160 A1[3B00]                 mov ax, [signi]
  2626 00001163 A3[D00D]                 mov word [ids2], ax
  2627 00001166 A1[4100]                 mov ax, [wi]
  2628 00001169 A3[D20D]                 mov word [idw2], ax
  2629 0000116C A1[3800]                 mov ax, [typei]
  2630 0000116F A3[D40D]                 mov word [idt2], ax
  2631                                  
  2632                                  ;-300     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
  2633                                  
  2634 00001172 A1[D40D]                 mov ax, [idt2]
  2635 00001175 83F801                   cmp ax, 1
  2636 00001178 0F850900                 jne @@expr2121
  2637 0000117C 68[3113]                 push expr2_14
  2638 0000117F E84B38                   call error1
  2639 00001182 83C402                   add  sp, 2
  2640                                  
  2641                                  ;-301     prs("\nmov ");
  2642                                  
  2643                                  @@expr2121:
  2644 00001185 68[5013]                 push expr2_15
  2645 00001188 E85935                   call prs
  2646 0000118B 83C402                   add  sp, 2
  2647                                  
  2648                                  ;-302     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
  2649                                  
  2650 0000118E A1[BE0D]                 mov ax, [ireg1]
  2651 00001191 08C0                     or  al, al
  2652 00001193 0F840D00                 je @@expr2122
  2653 00001197 FF36[BE0D]               push word [ireg1]
  2654 0000119B E81808                   call printreg
  2655 0000119E 83C402                   add  sp, 2
  2656 000011A1 E90900                   jmp @@expr2123
  2657                                  @@expr2122:
  2658 000011A4 68[5713]                 push expr2_16
  2659 000011A7 E82338                   call error1
  2660 000011AA 83C402                   add  sp, 2
  2661                                  
  2662                                  ;-303     prs(", ");
  2663                                  
  2664                                  @@expr2123:
  2665 000011AD 68[7913]                 push expr2_17
  2666 000011B0 E83135                   call prs
  2667 000011B3 83C402                   add  sp, 2
  2668                                  
  2669                                  ;-304     if (mod1 == 2) a(idx2);
  2670                                  
  2671 000011B6 A1[BC0D]                 mov ax, [mod1]
  2672 000011B9 83F802                   cmp ax, 2
  2673 000011BC 0F850D00                 jne @@expr2124
  2674 000011C0 FF36[CE0D]               push word [idx2]
  2675 000011C4 E8E8EE                   call a
  2676 000011C7 83C402                   add  sp, 2
  2677                                  
  2678                                  ;-305     else {
  2679                                  
  2680 000011CA E96C00                   jmp @@expr2125
  2681                                  @@expr2124:
  2682                                  
  2683                                  ;-306       if (idw2 == 1) prs("byte ");
  2684                                  
  2685 000011CD A1[D20D]                 mov ax, [idw2]
  2686 000011D0 83F801                   cmp ax, 1
  2687 000011D3 0F850900                 jne @@expr2126
  2688 000011D7 68[7C13]                 push expr2_18
  2689 000011DA E80735                   call prs
  2690 000011DD 83C402                   add  sp, 2
  2691                                  
  2692                                  ;-307       if (idw2 == 2) prs("word ");
  2693                                  
  2694                                  @@expr2126:
  2695 000011E0 A1[D20D]                 mov ax, [idw2]
  2696 000011E3 83F802                   cmp ax, 2
  2697 000011E6 0F850900                 jne @@expr2127
  2698 000011EA 68[8213]                 push expr2_19
  2699 000011ED E8F434                   call prs
  2700 000011F0 83C402                   add  sp, 2
  2701                                  
  2702                                  ;-308       if (idw2 == 4) prs("dword ");
  2703                                  
  2704                                  @@expr2127:
  2705 000011F3 A1[D20D]                 mov ax, [idw2]
  2706 000011F6 83F804                   cmp ax, 4
  2707 000011F9 0F850900                 jne @@expr2128
  2708 000011FD 68[8813]                 push expr2_20
  2709 00001200 E8E134                   call prs
  2710 00001203 83C402                   add  sp, 2
  2711                                  
  2712                                  ;-309       v(idx2);
  2713                                  
  2714                                  @@expr2128:
  2715 00001206 FF36[CE0D]               push word [idx2]
  2716 0000120A E8B1EE                   call v
  2717 0000120D 83C402                   add  sp, 2
  2718                                  
  2719                                  ;-310       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
  2720                                  
  2721 00001210 A1[CE0D]                 mov ax, [idx2]
  2722 00001213 3DC800                   cmp ax, 200 ;unsigned : 1
  2723 00001216 0F8C1F00                 jl  @@expr2129
  2724 0000121A FF36[CE0D]               push word [idx2]
  2725 0000121E E802F4                   call adrofname
  2726 00001221 83C402                   add  sp, 2
  2727 00001224 8946FE                   mov [bp-2], ax
  2728 00001227 68[8F13]                 push expr2_21
  2729 0000122A E8B734                   call prs
  2730 0000122D 83C402                   add  sp, 2
  2731 00001230 FF76FE                   push word [bp-2]
  2732 00001233 E8AE34                   call prs
  2733 00001236 83C402                   add  sp, 2
  2734                                  @@expr2129:
  2735                                  
  2736                                  ;-311     return;
  2737                                  
  2738                                  @@expr2125:
  2739 00001239 E90900                   jmp @@retn
  2740                                  
  2741                                  ;-312   } error1("Internal error: only const or reg allowed");
  2742                                  
  2743                                  @@expr2119:
  2744 0000123C 68[9213]                 push expr2_22
  2745 0000123F E88B37                   call error1
  2746 00001242 83C402                   add  sp, 2
  2747                                  
  2748                                  ;-313 }
  2749                                  
  2750                                  
  2751                                  ;-314 char ops[5];
  2752                                  
  2753 00001245 C9                      @@retn: LEAVE
  2754 00001246 C3                       ret
  2755                                  ; ENDP
  2756 00001247 4E6F6368206B65696E-     expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
  2757 00001250 202620756E64202A20-
  2758 00001259 696D20546578742028-
  2759 00001262 4C696E6B652048616E-
  2760 0000126B 64292065726C617562-
  2761 00001274 7400               
  2762 00001276 4E6F6368206B65696E-     expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
  2763 0000127F 204172726179206F64-
  2764 00001288 657220506F696E7465-
  2765 00001291 72206C696E6B732065-
  2766 0000129A 726C6175627400     
  2767 000012A1 566572676C65696368-     expr2_2 db "Vergleich noch nicht implementiert",0
  2768 000012AA 206E6F6368206E6963-
  2769 000012B3 687420696D706C656D-
  2770 000012BC 656E746965727400   
  2771 000012C4 41737369676E206578-     expr2_3 db "Assign expected",0
  2772 000012CD 70656374656400     
  2773 000012D4 203B20636F6E737461-     expr2_4 db " ; constant expression",0
  2774 000012DD 6E7420657870726573-
  2775 000012E6 73696F6E00         
  2776 000012EB 5C6E6D6F762000          expr2_5 db "\nmov ",0
  2777 000012F2 627974652000            expr2_6 db "byte ",0
  2778 000012F8 776F72642000            expr2_7 db "word ",0
  2779 000012FE 64776F72642000          expr2_8 db "dword ",0
  2780 00001305 2C2000                  expr2_9 db ", ",0
  2781 00001308 3B2000                  expr2_10 db "; ",0
  2782 0000130B 5C6E6D6F762000          expr2_11 db "\nmov ",0
  2783 00001312 2C2000                  expr2_12 db ", ",0
  2784 00001315 4E6F6368206B65696E-     expr2_13 db "Noch kein * im Text erlaubt",0
  2785 0000131E 202A20696D20546578-
  2786 00001327 742065726C61756274-
  2787 00001330 00                 
  2788 00001331 4E6F6368206B65696E-     expr2_14 db "Noch kein Array rechts erlaubt",0
  2789 0000133A 204172726179207265-
  2790 00001343 636874732065726C61-
  2791 0000134C 75627400           
  2792 00001350 5C6E6D6F762000          expr2_15 db "\nmov ",0
  2793 00001357 4D656D20746F204D65-     expr2_16 db "Mem to Mem not allowed by x86-CPU",0
  2794 00001360 6D206E6F7420616C6C-
  2795 00001369 6F7765642062792078-
  2796 00001372 38362D43505500     
  2797 00001379 2C2000                  expr2_17 db ", ",0
  2798 0000137C 627974652000            expr2_18 db "byte ",0
  2799 00001382 776F72642000            expr2_19 db "word ",0
  2800 00001388 64776F72642000          expr2_20 db "dword ",0
  2801 0000138F 3B2000                  expr2_21 db "; ",0
  2802 00001392 496E7465726E616C20-     expr2_22 db "Internal error: only const or reg allowed",0
  2803 0000139B 6572726F723A206F6E-
  2804 000013A4 6C7920636F6E737420-
  2805 000013AD 6F722072656720616C-
  2806 000013B6 6C6F77656400       
  2807                                  section .bss
  2808                                  absolute 53406
  2809 0000D09E <res 00000005>          ops resb 5
  2810                                  section .text
  2811                                  
  2812                                  ;-315 int doreg1(int iscmp1) { int i;
  2813                                  
  2814                                  
  2815                                  doreg1:  ; *** PROC ***
  2816                                  
  2817                                  ;-316   if (istoken('='))          strcpy(ops, "mov");
  2818                                  
  2819                                  ;Function : doreg1, Number of local variables: 2
  2820                                  ;   # type sign width addr used name   list of local variables
  2821                                  ;  200 var sign word   315 NULL iscmp1 = bp+4
  2822                                  ;  201 var sign word   315 NULL i = bp-2;
  2823 000013BC C8020000                 ENTER  2,0
  2824 000013C0 6A3D                     push 61
  2825 000013C2 E8EA31                   call istoken
  2826 000013C5 83C402                   add  sp, 2
  2827 000013C8 08C0                     or  al, al
  2828 000013CA 0F840E00                 je @@doreg1130
  2829 000013CE 68[6F15]                 push doreg1_0
  2830 000013D1 8D069ED0                 lea  ax, [ops]
  2831 000013D5 50                       push ax
  2832 000013D6 E8B142                   call strcpy
  2833 000013D9 83C404                   add  sp, 4
  2834                                  
  2835                                  ;-317   if (istoken(T_PLUSASS))    strcpy(ops, "add");
  2836                                  
  2837                                  @@doreg1130:
  2838 000013DC 68CE04                   push 1230
  2839 000013DF E8CD31                   call istoken
  2840 000013E2 83C402                   add  sp, 2
  2841 000013E5 08C0                     or  al, al
  2842 000013E7 0F840E00                 je @@doreg1131
  2843 000013EB 68[7315]                 push doreg1_1
  2844 000013EE 8D069ED0                 lea  ax, [ops]
  2845 000013F2 50                       push ax
  2846 000013F3 E89442                   call strcpy
  2847 000013F6 83C404                   add  sp, 4
  2848                                  
  2849                                  ;-318   if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  2850                                  
  2851                                  @@doreg1131:
  2852 000013F9 68CF04                   push 1231
  2853 000013FC E8B031                   call istoken
  2854 000013FF 83C402                   add  sp, 2
  2855 00001402 08C0                     or  al, al
  2856 00001404 0F840E00                 je @@doreg1132
  2857 00001408 68[7715]                 push doreg1_2
  2858 0000140B 8D069ED0                 lea  ax, [ops]
  2859 0000140F 50                       push ax
  2860 00001410 E87742                   call strcpy
  2861 00001413 83C404                   add  sp, 4
  2862                                  
  2863                                  ;-319   if (istoken(T_ANDASS))     strcpy(ops, "and");
  2864                                  
  2865                                  @@doreg1132:
  2866 00001416 68D204                   push 1234
  2867 00001419 E89331                   call istoken
  2868 0000141C 83C402                   add  sp, 2
  2869 0000141F 08C0                     or  al, al
  2870 00001421 0F840E00                 je @@doreg1133
  2871 00001425 68[7B15]                 push doreg1_3
  2872 00001428 8D069ED0                 lea  ax, [ops]
  2873 0000142C 50                       push ax
  2874 0000142D E85A42                   call strcpy
  2875 00001430 83C404                   add  sp, 4
  2876                                  
  2877                                  ;-320   if (istoken(T_ORASS))      strcpy(ops, "or" );
  2878                                  
  2879                                  @@doreg1133:
  2880 00001433 68D304                   push 1235
  2881 00001436 E87631                   call istoken
  2882 00001439 83C402                   add  sp, 2
  2883 0000143C 08C0                     or  al, al
  2884 0000143E 0F840E00                 je @@doreg1134
  2885 00001442 68[7F15]                 push doreg1_4
  2886 00001445 8D069ED0                 lea  ax, [ops]
  2887 00001449 50                       push ax
  2888 0000144A E83D42                   call strcpy
  2889 0000144D 83C404                   add  sp, 4
  2890                                  
  2891                                  ;-321   if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  2892                                  
  2893                                  @@doreg1134:
  2894 00001450 68D804                   push 1240
  2895 00001453 E85931                   call istoken
  2896 00001456 83C402                   add  sp, 2
  2897 00001459 08C0                     or  al, al
  2898 0000145B 0F840E00                 je @@doreg1135
  2899 0000145F 68[8215]                 push doreg1_5
  2900 00001462 8D069ED0                 lea  ax, [ops]
  2901 00001466 50                       push ax
  2902 00001467 E82042                   call strcpy
  2903 0000146A 83C404                   add  sp, 4
  2904                                  
  2905                                  ;-322   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  2906                                  
  2907                                  @@doreg1135:
  2908 0000146D 68D904                   push 1241
  2909 00001470 E83C31                   call istoken
  2910 00001473 83C402                   add  sp, 2
  2911 00001476 08C0                     or  al, al
  2912 00001478 0F840E00                 je @@doreg1136
  2913 0000147C 68[8615]                 push doreg1_6
  2914 0000147F 8D069ED0                 lea  ax, [ops]
  2915 00001483 50                       push ax
  2916 00001484 E80342                   call strcpy
  2917 00001487 83C404                   add  sp, 4
  2918                                  
  2919                                  ;-323   if (iscmp1 == 1) { token=getlex();
  2920                                  
  2921                                  @@doreg1136:
  2922 0000148A 8B4604                   mov ax, [bp+4]
  2923 0000148D 83F801                   cmp ax, 1
  2924 00001490 0F852700                 jne @@doreg1137
  2925 00001494 E85129                   call getlex
  2926 00001497 A3[2200]                 mov word [token], ax
  2927                                  
  2928                                  ;-324       if (isrelational() ==0) error1("Relational expected");
  2929                                  
  2930 0000149A E8E428                   call isrelational
  2931 0000149D 83F800                   cmp ax, 0
  2932 000014A0 0F850900                 jne @@doreg1138
  2933 000014A4 68[8A15]                 push doreg1_7
  2934 000014A7 E82335                   call error1
  2935 000014AA 83C402                   add  sp, 2
  2936                                  
  2937                                  ;-325       strcpy(ops, "cmp"); }
  2938                                  
  2939                                  @@doreg1138:
  2940 000014AD 68[9E15]                 push doreg1_8
  2941 000014B0 8D069ED0                 lea  ax, [ops]
  2942 000014B4 50                       push ax
  2943 000014B5 E8D241                   call strcpy
  2944 000014B8 83C404                   add  sp, 4
  2945                                  
  2946                                  ;-326   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");
  2947                                  
  2948                                  @@doreg1137:
  2949 000014BB E81832                   call prnl
  2950 000014BE 8D069ED0                 lea  ax, [ops]
  2951 000014C2 50                       push ax
  2952 000014C3 E81E32                   call prs
  2953 000014C6 83C402                   add  sp, 2
  2954 000014C9 68[A215]                 push doreg1_9
  2955 000014CC E81532                   call prs
  2956 000014CF 83C402                   add  sp, 2
  2957 000014D2 FF36[BE0D]               push word [ireg1]
  2958 000014D6 E8DD04                   call printreg
  2959 000014D9 83C402                   add  sp, 2
  2960 000014DC 68[A515]                 push doreg1_10
  2961 000014DF E80232                   call prs
  2962 000014E2 83C402                   add  sp, 2
  2963                                  
  2964                                  ;-327 
  2965                                  
  2966                                  
  2967                                  ;-328   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  2968                                  
  2969 000014E5 680101                   push 257
  2970 000014E8 E8C430                   call istoken
  2971 000014EB 83C402                   add  sp, 2
  2972 000014EE 08C0                     or  al, al
  2973 000014F0 0F840D00                 je @@doreg1139
  2974 000014F4 FF36[3600]               push word [lexval]
  2975 000014F8 E84333                   call prunsign1
  2976 000014FB 83C402                   add  sp, 2
  2977 000014FE E94700                   jmp @@reg1
  2978                                  
  2979                                  ;-329   mod2=typeName(); ireg2=checkreg();
  2980                                  
  2981                                  @@doreg1139:
  2982 00001501 E875F2                   call typeName
  2983 00001504 A3[CA0D]                 mov word [mod2], ax
  2984 00001507 E89E00                   call checkreg
  2985 0000150A A3[CC0D]                 mov word [ireg2], ax
  2986                                  
  2987                                  ;-330   if (ireg2) {printreg(ireg2); goto reg1;}
  2988                                  
  2989 0000150D A1[CC0D]                 mov ax, [ireg2]
  2990 00001510 08C0                     or  al, al
  2991 00001512 0F840D00                 je @@doreg1140
  2992 00001516 FF36[CC0D]               push word [ireg2]
  2993 0000151A E89904                   call printreg
  2994 0000151D 83C402                   add  sp, 2
  2995 00001520 E92500                   jmp @@reg1
  2996                                  
  2997                                  ;-331   i=searchname();  if (mod2 == 2) a(i); else v(i);
  2998                                  
  2999                                  @@doreg1140:
  3000 00001523 E884F1                   call searchname
  3001 00001526 8946FE                   mov [bp-2], ax
  3002 00001529 A1[CA0D]                 mov ax, [mod2]
  3003 0000152C 83F802                   cmp ax, 2
  3004 0000152F 0F850C00                 jne @@doreg1141
  3005 00001533 FF76FE                   push word [bp-2]
  3006 00001536 E876EB                   call a
  3007 00001539 83C402                   add  sp, 2
  3008 0000153C E90900                   jmp @@doreg1142
  3009                                  @@doreg1141:
  3010 0000153F FF76FE                   push word [bp-2]
  3011 00001542 E879EB                   call v
  3012 00001545 83C402                   add  sp, 2
  3013                                  
  3014                                  ;-332   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
  3015                                  
  3016                                  @@doreg1142:
  3017                                  @@reg1:
  3018 00001548 8B4604                   mov ax, [bp+4]
  3019 0000154B 83F801                   cmp ax, 1
  3020 0000154E 0F851B00                 jne @@doreg1143
  3021 00001552 6A00                     push 0
  3022 00001554 E8DB24                   call cmpneg
  3023 00001557 83C402                   add  sp, 2
  3024 0000155A 8D06AB81                 lea  ax, [fname]
  3025 0000155E 50                       push ax
  3026 0000155F E88231                   call prs
  3027 00001562 83C402                   add  sp, 2
  3028 00001565 6A29                     push 41
  3029 00001567 E86730                   call expect
  3030 0000156A 83C402                   add  sp, 2
  3031                                  
  3032                                  ;-333 }
  3033                                  
  3034                                  @@doreg1143:
  3035                                  
  3036                                  ;-334 int checkreg() { // >=17 = 16bit, >=47 = 32bit
  3037 0000156D C9                       LEAVE
  3038 0000156E C3                       ret
  3039                                  ; ENDP
  3040 0000156F 6D6F7600                doreg1_0 db "mov",0
  3041 00001573 61646400                doreg1_1 db "add",0
  3042 00001577 73756200                doreg1_2 db "sub",0
  3043 0000157B 616E6400                doreg1_3 db "and",0
  3044 0000157F 6F7200                  doreg1_4 db "or",0
  3045 00001582 73686C00                doreg1_5 db "shl",0
  3046 00001586 73687200                doreg1_6 db "shr",0
  3047 0000158A 52656C6174696F6E61-     doreg1_7 db "Relational expected",0
  3048 00001593 6C2065787065637465-
  3049 0000159C 6400               
  3050 0000159E 636D7000                doreg1_8 db "cmp",0
  3051 000015A2 202000                  doreg1_9 db "  ",0
  3052 000015A5 2C2000                  doreg1_10 db ", ",0
  3053                                  
  3054                                  checkreg:  ; *** PROC ***
  3055                                  
  3056                                  ;-335   if (strlen(symbol) <  2) return 0;
  3057                                  
  3058 000015A8 8D062B81                 lea  ax, [symbol]
  3059 000015AC 50                       push ax
  3060 000015AD E8B240                   call strlen
  3061 000015B0 83C402                   add  sp, 2
  3062 000015B3 83F802                   cmp ax, 2
  3063 000015B6 0F8D0600                 jge @@checkreg144
  3064 000015BA B80000                   mov ax, 0
  3065 000015BD E94403                   jmp @@retn
  3066                                  
  3067                                  ;-336   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  3068                                  
  3069                                  @@checkreg144:
  3070 000015C0 68[0519]                 push checkreg_0
  3071 000015C3 8D062B81                 lea  ax, [symbol]
  3072 000015C7 50                       push ax
  3073 000015C8 E8E641                   call eqstr
  3074 000015CB 83C404                   add  sp, 4
  3075 000015CE 08C0                     or  al, al
  3076 000015D0 0F840600                 je @@checkreg145
  3077 000015D4 B80100                   mov ax, 1
  3078 000015D7 E92A03                   jmp @@retn
  3079                                  @@checkreg145:
  3080 000015DA 68[0819]                 push checkreg_1
  3081 000015DD 8D062B81                 lea  ax, [symbol]
  3082 000015E1 50                       push ax
  3083 000015E2 E8CC41                   call eqstr
  3084 000015E5 83C404                   add  sp, 4
  3085 000015E8 08C0                     or  al, al
  3086 000015EA 0F840600                 je @@checkreg146
  3087 000015EE B80300                   mov ax, 3
  3088 000015F1 E91003                   jmp @@retn
  3089                                  
  3090                                  ;-337   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  3091                                  
  3092                                  @@checkreg146:
  3093 000015F4 68[0B19]                 push checkreg_2
  3094 000015F7 8D062B81                 lea  ax, [symbol]
  3095 000015FB 50                       push ax
  3096 000015FC E8B241                   call eqstr
  3097 000015FF 83C404                   add  sp, 4
  3098 00001602 08C0                     or  al, al
  3099 00001604 0F840600                 je @@checkreg147
  3100 00001608 B80500                   mov ax, 5
  3101 0000160B E9F602                   jmp @@retn
  3102                                  @@checkreg147:
  3103 0000160E 68[0E19]                 push checkreg_3
  3104 00001611 8D062B81                 lea  ax, [symbol]
  3105 00001615 50                       push ax
  3106 00001616 E89841                   call eqstr
  3107 00001619 83C404                   add  sp, 4
  3108 0000161C 08C0                     or  al, al
  3109 0000161E 0F840600                 je @@checkreg148
  3110 00001622 B80700                   mov ax, 7
  3111 00001625 E9DC02                   jmp @@retn
  3112                                  
  3113                                  ;-338   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  3114                                  
  3115                                  @@checkreg148:
  3116 00001628 68[1119]                 push checkreg_4
  3117 0000162B 8D062B81                 lea  ax, [symbol]
  3118 0000162F 50                       push ax
  3119 00001630 E87E41                   call eqstr
  3120 00001633 83C404                   add  sp, 4
  3121 00001636 08C0                     or  al, al
  3122 00001638 0F840600                 je @@checkreg149
  3123 0000163C B80900                   mov ax, 9
  3124 0000163F E9C202                   jmp @@retn
  3125                                  @@checkreg149:
  3126 00001642 68[1419]                 push checkreg_5
  3127 00001645 8D062B81                 lea  ax, [symbol]
  3128 00001649 50                       push ax
  3129 0000164A E86441                   call eqstr
  3130 0000164D 83C404                   add  sp, 4
  3131 00001650 08C0                     or  al, al
  3132 00001652 0F840600                 je @@checkreg150
  3133 00001656 B80B00                   mov ax, 11
  3134 00001659 E9A802                   jmp @@retn
  3135                                  
  3136                                  ;-339   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  3137                                  
  3138                                  @@checkreg150:
  3139 0000165C 68[1719]                 push checkreg_6
  3140 0000165F 8D062B81                 lea  ax, [symbol]
  3141 00001663 50                       push ax
  3142 00001664 E84A41                   call eqstr
  3143 00001667 83C404                   add  sp, 4
  3144 0000166A 08C0                     or  al, al
  3145 0000166C 0F840600                 je @@checkreg151
  3146 00001670 B80D00                   mov ax, 13
  3147 00001673 E98E02                   jmp @@retn
  3148                                  @@checkreg151:
  3149 00001676 68[1A19]                 push checkreg_7
  3150 00001679 8D062B81                 lea  ax, [symbol]
  3151 0000167D 50                       push ax
  3152 0000167E E83041                   call eqstr
  3153 00001681 83C404                   add  sp, 4
  3154 00001684 08C0                     or  al, al
  3155 00001686 0F840600                 je @@checkreg152
  3156 0000168A B80F00                   mov ax, 15
  3157 0000168D E97402                   jmp @@retn
  3158                                  
  3159                                  ;-340   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  3160                                  
  3161                                  @@checkreg152:
  3162 00001690 68[1D19]                 push checkreg_8
  3163 00001693 8D062B81                 lea  ax, [symbol]
  3164 00001697 50                       push ax
  3165 00001698 E81641                   call eqstr
  3166 0000169B 83C404                   add  sp, 4
  3167 0000169E 08C0                     or  al, al
  3168 000016A0 0F840600                 je @@checkreg153
  3169 000016A4 B81100                   mov ax, 17
  3170 000016A7 E95A02                   jmp @@retn
  3171                                  @@checkreg153:
  3172 000016AA 68[2019]                 push checkreg_9
  3173 000016AD 8D062B81                 lea  ax, [symbol]
  3174 000016B1 50                       push ax
  3175 000016B2 E8FC40                   call eqstr
  3176 000016B5 83C404                   add  sp, 4
  3177 000016B8 08C0                     or  al, al
  3178 000016BA 0F840600                 je @@checkreg154
  3179 000016BE B81300                   mov ax, 19
  3180 000016C1 E94002                   jmp @@retn
  3181                                  
  3182                                  ;-341   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  3183                                  
  3184                                  @@checkreg154:
  3185 000016C4 68[2319]                 push checkreg_10
  3186 000016C7 8D062B81                 lea  ax, [symbol]
  3187 000016CB 50                       push ax
  3188 000016CC E8E240                   call eqstr
  3189 000016CF 83C404                   add  sp, 4
  3190 000016D2 08C0                     or  al, al
  3191 000016D4 0F840600                 je @@checkreg155
  3192 000016D8 B81500                   mov ax, 21
  3193 000016DB E92602                   jmp @@retn
  3194                                  @@checkreg155:
  3195 000016DE 68[2619]                 push checkreg_11
  3196 000016E1 8D062B81                 lea  ax, [symbol]
  3197 000016E5 50                       push ax
  3198 000016E6 E8C840                   call eqstr
  3199 000016E9 83C404                   add  sp, 4
  3200 000016EC 08C0                     or  al, al
  3201 000016EE 0F840600                 je @@checkreg156
  3202 000016F2 B81700                   mov ax, 23
  3203 000016F5 E90C02                   jmp @@retn
  3204                                  
  3205                                  ;-342   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  3206                                  
  3207                                  @@checkreg156:
  3208 000016F8 68[2919]                 push checkreg_12
  3209 000016FB 8D062B81                 lea  ax, [symbol]
  3210 000016FF 50                       push ax
  3211 00001700 E8AE40                   call eqstr
  3212 00001703 83C404                   add  sp, 4
  3213 00001706 08C0                     or  al, al
  3214 00001708 0F840600                 je @@checkreg157
  3215 0000170C B81900                   mov ax, 25
  3216 0000170F E9F201                   jmp @@retn
  3217                                  @@checkreg157:
  3218 00001712 68[2C19]                 push checkreg_13
  3219 00001715 8D062B81                 lea  ax, [symbol]
  3220 00001719 50                       push ax
  3221 0000171A E89440                   call eqstr
  3222 0000171D 83C404                   add  sp, 4
  3223 00001720 08C0                     or  al, al
  3224 00001722 0F840600                 je @@checkreg158
  3225 00001726 B81B00                   mov ax, 27
  3226 00001729 E9D801                   jmp @@retn
  3227                                  
  3228                                  ;-343   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  3229                                  
  3230                                  @@checkreg158:
  3231 0000172C 68[2F19]                 push checkreg_14
  3232 0000172F 8D062B81                 lea  ax, [symbol]
  3233 00001733 50                       push ax
  3234 00001734 E87A40                   call eqstr
  3235 00001737 83C404                   add  sp, 4
  3236 0000173A 08C0                     or  al, al
  3237 0000173C 0F840600                 je @@checkreg159
  3238 00001740 B81D00                   mov ax, 29
  3239 00001743 E9BE01                   jmp @@retn
  3240                                  @@checkreg159:
  3241 00001746 68[3219]                 push checkreg_15
  3242 00001749 8D062B81                 lea  ax, [symbol]
  3243 0000174D 50                       push ax
  3244 0000174E E86040                   call eqstr
  3245 00001751 83C404                   add  sp, 4
  3246 00001754 08C0                     or  al, al
  3247 00001756 0F840600                 je @@checkreg160
  3248 0000175A B81F00                   mov ax, 31
  3249 0000175D E9A401                   jmp @@retn
  3250                                  
  3251                                  ;-344   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  3252                                  
  3253                                  @@checkreg160:
  3254 00001760 68[3519]                 push checkreg_16
  3255 00001763 8D062B81                 lea  ax, [symbol]
  3256 00001767 50                       push ax
  3257 00001768 E84640                   call eqstr
  3258 0000176B 83C404                   add  sp, 4
  3259 0000176E 08C0                     or  al, al
  3260 00001770 0F840600                 je @@checkreg161
  3261 00001774 B82100                   mov ax, 33
  3262 00001777 E98A01                   jmp @@retn
  3263                                  @@checkreg161:
  3264 0000177A 68[3819]                 push checkreg_17
  3265 0000177D 8D062B81                 lea  ax, [symbol]
  3266 00001781 50                       push ax
  3267 00001782 E82C40                   call eqstr
  3268 00001785 83C404                   add  sp, 4
  3269 00001788 08C0                     or  al, al
  3270 0000178A 0F840600                 je @@checkreg162
  3271 0000178E B82300                   mov ax, 35
  3272 00001791 E97001                   jmp @@retn
  3273                                  
  3274                                  ;-345   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  3275                                  
  3276                                  @@checkreg162:
  3277 00001794 68[3B19]                 push checkreg_18
  3278 00001797 8D062B81                 lea  ax, [symbol]
  3279 0000179B 50                       push ax
  3280 0000179C E81240                   call eqstr
  3281 0000179F 83C404                   add  sp, 4
  3282 000017A2 08C0                     or  al, al
  3283 000017A4 0F840600                 je @@checkreg163
  3284 000017A8 B82500                   mov ax, 37
  3285 000017AB E95601                   jmp @@retn
  3286                                  @@checkreg163:
  3287 000017AE 68[3E19]                 push checkreg_19
  3288 000017B1 8D062B81                 lea  ax, [symbol]
  3289 000017B5 50                       push ax
  3290 000017B6 E8F83F                   call eqstr
  3291 000017B9 83C404                   add  sp, 4
  3292 000017BC 08C0                     or  al, al
  3293 000017BE 0F840600                 je @@checkreg164
  3294 000017C2 B82700                   mov ax, 39
  3295 000017C5 E93C01                   jmp @@retn
  3296                                  
  3297                                  ;-346   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  3298                                  
  3299                                  @@checkreg164:
  3300 000017C8 68[4119]                 push checkreg_20
  3301 000017CB 8D062B81                 lea  ax, [symbol]
  3302 000017CF 50                       push ax
  3303 000017D0 E8DE3F                   call eqstr
  3304 000017D3 83C404                   add  sp, 4
  3305 000017D6 08C0                     or  al, al
  3306 000017D8 0F840600                 je @@checkreg165
  3307 000017DC B82900                   mov ax, 41
  3308 000017DF E92201                   jmp @@retn
  3309                                  @@checkreg165:
  3310 000017E2 68[4419]                 push checkreg_21
  3311 000017E5 8D062B81                 lea  ax, [symbol]
  3312 000017E9 50                       push ax
  3313 000017EA E8C43F                   call eqstr
  3314 000017ED 83C404                   add  sp, 4
  3315 000017F0 08C0                     or  al, al
  3316 000017F2 0F840600                 je @@checkreg166
  3317 000017F6 B82B00                   mov ax, 43
  3318 000017F9 E90801                   jmp @@retn
  3319                                  
  3320                                  ;-347   // (eqstr(symbol,"ip")) return 45;
  3321                                  
  3322                                  
  3323                                  ;-348   if (strlen(symbol) >   3) return 0;
  3324                                  
  3325                                  @@checkreg166:
  3326 000017FC 8D062B81                 lea  ax, [symbol]
  3327 00001800 50                       push ax
  3328 00001801 E85E3E                   call strlen
  3329 00001804 83C402                   add  sp, 2
  3330 00001807 83F803                   cmp ax, 3
  3331 0000180A 0F8E0600                 jle @@checkreg167
  3332 0000180E B80000                   mov ax, 0
  3333 00001811 E9F000                   jmp @@retn
  3334                                  
  3335                                  ;-349   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  3336                                  
  3337                                  @@checkreg167:
  3338 00001814 68[4719]                 push checkreg_22
  3339 00001817 8D062B81                 lea  ax, [symbol]
  3340 0000181B 50                       push ax
  3341 0000181C E8923F                   call eqstr
  3342 0000181F 83C404                   add  sp, 4
  3343 00001822 08C0                     or  al, al
  3344 00001824 0F840600                 je @@checkreg168
  3345 00001828 B82F00                   mov ax, 47
  3346 0000182B E9D600                   jmp @@retn
  3347                                  @@checkreg168:
  3348 0000182E 68[4B19]                 push checkreg_23
  3349 00001831 8D062B81                 lea  ax, [symbol]
  3350 00001835 50                       push ax
  3351 00001836 E8783F                   call eqstr
  3352 00001839 83C404                   add  sp, 4
  3353 0000183C 08C0                     or  al, al
  3354 0000183E 0F840600                 je @@checkreg169
  3355 00001842 B83200                   mov ax, 50
  3356 00001845 E9BC00                   jmp @@retn
  3357                                  
  3358                                  ;-350   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  3359                                  
  3360                                  @@checkreg169:
  3361 00001848 68[4F19]                 push checkreg_24
  3362 0000184B 8D062B81                 lea  ax, [symbol]
  3363 0000184F 50                       push ax
  3364 00001850 E85E3F                   call eqstr
  3365 00001853 83C404                   add  sp, 4
  3366 00001856 08C0                     or  al, al
  3367 00001858 0F840600                 je @@checkreg170
  3368 0000185C B83500                   mov ax, 53
  3369 0000185F E9A200                   jmp @@retn
  3370                                  @@checkreg170:
  3371 00001862 68[5319]                 push checkreg_25
  3372 00001865 8D062B81                 lea  ax, [symbol]
  3373 00001869 50                       push ax
  3374 0000186A E8443F                   call eqstr
  3375 0000186D 83C404                   add  sp, 4
  3376 00001870 08C0                     or  al, al
  3377 00001872 0F840600                 je @@checkreg171
  3378 00001876 B83800                   mov ax, 56
  3379 00001879 E98800                   jmp @@retn
  3380                                  
  3381                                  ;-351   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  3382                                  
  3383                                  @@checkreg171:
  3384 0000187C 68[5719]                 push checkreg_26
  3385 0000187F 8D062B81                 lea  ax, [symbol]
  3386 00001883 50                       push ax
  3387 00001884 E82A3F                   call eqstr
  3388 00001887 83C404                   add  sp, 4
  3389 0000188A 08C0                     or  al, al
  3390 0000188C 0F840600                 je @@checkreg172
  3391 00001890 B83B00                   mov ax, 59
  3392 00001893 E96E00                   jmp @@retn
  3393                                  @@checkreg172:
  3394 00001896 68[5B19]                 push checkreg_27
  3395 00001899 8D062B81                 lea  ax, [symbol]
  3396 0000189D 50                       push ax
  3397 0000189E E8103F                   call eqstr
  3398 000018A1 83C404                   add  sp, 4
  3399 000018A4 08C0                     or  al, al
  3400 000018A6 0F840600                 je @@checkreg173
  3401 000018AA B83E00                   mov ax, 62
  3402 000018AD E95400                   jmp @@retn
  3403                                  
  3404                                  ;-352   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  3405                                  
  3406                                  @@checkreg173:
  3407 000018B0 68[5F19]                 push checkreg_28
  3408 000018B3 8D062B81                 lea  ax, [symbol]
  3409 000018B7 50                       push ax
  3410 000018B8 E8F63E                   call eqstr
  3411 000018BB 83C404                   add  sp, 4
  3412 000018BE 08C0                     or  al, al
  3413 000018C0 0F840600                 je @@checkreg174
  3414 000018C4 B84100                   mov ax, 65
  3415 000018C7 E93A00                   jmp @@retn
  3416                                  @@checkreg174:
  3417 000018CA 68[6319]                 push checkreg_29
  3418 000018CD 8D062B81                 lea  ax, [symbol]
  3419 000018D1 50                       push ax
  3420 000018D2 E8DC3E                   call eqstr
  3421 000018D5 83C404                   add  sp, 4
  3422 000018D8 08C0                     or  al, al
  3423 000018DA 0F840600                 je @@checkreg175
  3424 000018DE B84400                   mov ax, 68
  3425 000018E1 E92000                   jmp @@retn
  3426                                  
  3427                                  ;-353   if (eqstr(symbol,"cr0")) return 71;
  3428                                  
  3429                                  @@checkreg175:
  3430 000018E4 68[6719]                 push checkreg_30
  3431 000018E7 8D062B81                 lea  ax, [symbol]
  3432 000018EB 50                       push ax
  3433 000018EC E8C23E                   call eqstr
  3434 000018EF 83C404                   add  sp, 4
  3435 000018F2 08C0                     or  al, al
  3436 000018F4 0F840600                 je @@checkreg176
  3437 000018F8 B84700                   mov ax, 71
  3438 000018FB E90600                   jmp @@retn
  3439                                  
  3440                                  ;-354   return 0;   }
  3441                                  
  3442                                  @@checkreg176:
  3443 000018FE B80000                   mov ax, 0
  3444 00001901 E90000                   jmp @@retn
  3445                                  
  3446                                  ;-355 char printregstr[]
  3447                                  
  3448                                  @@retn:
  3449 00001904 C3                       ret
  3450                                  ; ENDP
  3451 00001905 616C00                  checkreg_0 db "al",0
  3452 00001908 636C00                  checkreg_1 db "cl",0
  3453 0000190B 646C00                  checkreg_2 db "dl",0
  3454 0000190E 626C00                  checkreg_3 db "bl",0
  3455 00001911 616800                  checkreg_4 db "ah",0
  3456 00001914 636800                  checkreg_5 db "ch",0
  3457 00001917 646800                  checkreg_6 db "dh",0
  3458 0000191A 626800                  checkreg_7 db "bh",0
  3459 0000191D 617800                  checkreg_8 db "ax",0
  3460 00001920 637800                  checkreg_9 db "cx",0
  3461 00001923 647800                  checkreg_10 db "dx",0
  3462 00001926 627800                  checkreg_11 db "bx",0
  3463 00001929 737000                  checkreg_12 db "sp",0
  3464 0000192C 627000                  checkreg_13 db "bp",0
  3465 0000192F 736900                  checkreg_14 db "si",0
  3466 00001932 646900                  checkreg_15 db "di",0
  3467 00001935 657300                  checkreg_16 db "es",0
  3468 00001938 637300                  checkreg_17 db "cs",0
  3469 0000193B 737300                  checkreg_18 db "ss",0
  3470 0000193E 647300                  checkreg_19 db "ds",0
  3471 00001941 667300                  checkreg_20 db "fs",0
  3472 00001944 677300                  checkreg_21 db "gs",0
  3473 00001947 65617800                checkreg_22 db "eax",0
  3474 0000194B 65637800                checkreg_23 db "ecx",0
  3475 0000194F 65647800                checkreg_24 db "edx",0
  3476 00001953 65627800                checkreg_25 db "ebx",0
  3477 00001957 65737000                checkreg_26 db "esp",0
  3478 0000195B 65627000                checkreg_27 db "ebp",0
  3479 0000195F 65736900                checkreg_28 db "esi",0
  3480 00001963 65646900                checkreg_29 db "edi",0
  3481 00001967 63723000                checkreg_30 db "cr0",0
  3482                                  
  3483                                  ;-356 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
  3484                                  
  3485 0000196B 2A616C636C646C626C-     printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0
  3486 00001974 616863686468626861-
  3487 0000197D 786378647862787370-
  3488 00001986 627073696469657363-
  3489 0000198F 737373647366736773-
  3490 00001998 697065617865637865-
  3491 000019A1 647865627865737065-
  3492 000019AA 627065736965646963-
  3493 000019B3 723000             
  3494                                  
  3495                                  ;-357 //          1         2         3         4         5         6         7
  3496                                  
  3497                                  
  3498                                  ;-358 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
  3499                                  
  3500                                  
  3501                                  ;-359 int printreg(int i) {  unsigned int k; unsigned char c;
  3502                                  
  3503                                  
  3504                                  printreg:  ; *** PROC ***
  3505                                  
  3506                                  ;-360   k = &printregstr + i; c=*k; prc(c); i++;
  3507                                  
  3508                                  ;Function : printreg, Number of local variables: 3
  3509                                  ;   # type sign width addr used name   list of local variables
  3510                                  ;  200 var sign word   359 NULL i = bp+4
  3511                                  ;  201 var unsg word   359 NULL k = bp-2
  3512                                  ;  202 var unsg byte   359 NULL c = bp-4;
  3513 000019B6 C8040000                 ENTER  4,0
  3514 000019BA B8[6B19]                 mov ax, printregstr
  3515 000019BD 034604                   add ax, [bp+4]
  3516 000019C0 8946FE                   mov [bp-2], ax
  3517 000019C3 8B5EFE                   mov bx, [bp-2]
  3518 000019C6 8B07                     mov ax, [bx]
  3519 000019C8 8846FC                   mov [bp-4], al
  3520 000019CB 8A46FC                   mov al, byte [bp-4]
  3521 000019CE B400                     mov ah, 0
  3522 000019D0 50                       push ax
  3523 000019D1 E8A92C                   call prc
  3524 000019D4 83C402                   add  sp, 2
  3525 000019D7 FF4604                   inc  word[bp+4]
  3526                                  
  3527                                  ;-361   k = &printregstr + i; c=*k; prc(c);
  3528                                  
  3529 000019DA B8[6B19]                 mov ax, printregstr
  3530 000019DD 034604                   add ax, [bp+4]
  3531 000019E0 8946FE                   mov [bp-2], ax
  3532 000019E3 8B5EFE                   mov bx, [bp-2]
  3533 000019E6 8B07                     mov ax, [bx]
  3534 000019E8 8846FC                   mov [bp-4], al
  3535 000019EB 8A46FC                   mov al, byte [bp-4]
  3536 000019EE B400                     mov ah, 0
  3537 000019F0 50                       push ax
  3538 000019F1 E8892C                   call prc
  3539 000019F4 83C402                   add  sp, 2
  3540                                  
  3541                                  ;-362   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
  3542                                  
  3543 000019F7 8B4604                   mov ax, [bp+4]
  3544 000019FA 83F82F                   cmp ax, 47
  3545 000019FD 0F8E2000                 jle @@printreg177
  3546 00001A01 FF4604                   inc  word[bp+4]
  3547 00001A04 B8[6B19]                 mov ax, printregstr
  3548 00001A07 034604                   add ax, [bp+4]
  3549 00001A0A 8946FE                   mov [bp-2], ax
  3550 00001A0D 8B5EFE                   mov bx, [bp-2]
  3551 00001A10 8B07                     mov ax, [bx]
  3552 00001A12 8846FC                   mov [bp-4], al
  3553 00001A15 8A46FC                   mov al, byte [bp-4]
  3554 00001A18 B400                     mov ah, 0
  3555 00001A1A 50                       push ax
  3556 00001A1B E85F2C                   call prc
  3557 00001A1E 83C402                   add  sp, 2
  3558                                  
  3559                                  ;-363 }
  3560                                  
  3561                                  @@printreg177:
  3562                                  
  3563                                  ;-364 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
  3564 00001A21 C9                       LEAVE
  3565 00001A22 C3                       ret
  3566                                  ; ENDP
  3567 00001A23 0000                    evalue dw 0
  3568 00001A25 0A00                    exprtype dw 10
  3569                                  
  3570                                  ;-365 int expr(int isRight)
  3571                                  
  3572                                  
  3573                                  expr:  ; *** PROC ***
  3574                                  
  3575                                  ;-366 { int mode; int id1;     int ixarr; int ixconst;
  3576                                  
  3577                                  
  3578                                  ;-367   int ids;  int isCONST; int i;     unsigned char *p;
  3579                                  
  3580                                  
  3581                                  ;-368   if (istoken(T_CONST)) { evalue=lexval;
  3582                                  
  3583                                  ;Function : expr, Number of local variables: 9
  3584                                  ;   # type sign width addr used name   list of local variables
  3585                                  ;  200 var sign word   365 NULL isRight = bp+4
  3586                                  ;  201 var sign word   366 NULL mode = bp-2
  3587                                  ;  202 var sign word   366 NULL id1 = bp-4
  3588                                  ;  203 var sign word   366 NULL ixarr = bp-6
  3589                                  ;  204 var sign word   366 NULL ixconst = bp-8
  3590                                  ;  205 var sign word   367 NULL ids = bp-10
  3591                                  ;  206 var sign word   367 NULL isCONST = bp-12
  3592                                  ;  207 var sign word   367 NULL i = bp-14
  3593                                  ;  208 ptr unsg byte   367 NULL p = bp-16;
  3594 00001A27 C8100000                 ENTER  16,0
  3595 00001A2B 680101                   push 257
  3596 00001A2E E87E2B                   call istoken
  3597 00001A31 83C402                   add  sp, 2
  3598 00001A34 08C0                     or  al, al
  3599 00001A36 0F841F00                 je @@expr178
  3600 00001A3A A1[3600]                 mov ax, [lexval]
  3601 00001A3D A3[231A]                 mov word [evalue], ax
  3602                                  
  3603                                  ;-369     prs("\n mov ax, "); prunsign1(lexval); return 4; }
  3604                                  
  3605 00001A40 68[C71D]                 push expr_0
  3606 00001A43 E89E2C                   call prs
  3607 00001A46 83C402                   add  sp, 2
  3608 00001A49 FF36[3600]               push word [lexval]
  3609 00001A4D E8EE2D                   call prunsign1
  3610 00001A50 83C402                   add  sp, 2
  3611 00001A53 B80400                   mov ax, 4
  3612 00001A56 E96C03                   jmp @@retn
  3613                                  
  3614                                  ;-370   mode=typeName(); /*0=V,1=*,2=&*/
  3615                                  
  3616                                  @@expr178:
  3617 00001A59 E81DED                   call typeName
  3618 00001A5C 8946FE                   mov [bp-2], ax
  3619                                  
  3620                                  ;-371   ireg1=checkreg();
  3621                                  
  3622 00001A5F E846FB                   call checkreg
  3623 00001A62 A3[BE0D]                 mov word [ireg1], ax
  3624                                  
  3625                                  ;-372   if (ireg1) { doreg1(0); return; }
  3626                                  
  3627 00001A65 A1[BE0D]                 mov ax, [ireg1]
  3628 00001A68 08C0                     or  al, al
  3629 00001A6A 0F840B00                 je @@expr179
  3630 00001A6E 6A00                     push 0
  3631 00001A70 E849F9                   call doreg1
  3632 00001A73 83C402                   add  sp, 2
  3633 00001A76 E94C03                   jmp @@retn
  3634                                  
  3635                                  ;-373   if (token=='(')  {docall1(); goto e1; }
  3636                                  
  3637                                  @@expr179:
  3638 00001A79 A1[2200]                 mov ax, [token]
  3639 00001A7C 83F828                   cmp ax, 40
  3640 00001A7F 0F850600                 jne @@expr180
  3641 00001A83 E82E0F                   call docall1
  3642 00001A86 E93202                   jmp @@e1
  3643                                  
  3644                                  ;-374   if (isreg()) goto e1;
  3645                                  
  3646                                  @@expr180:
  3647 00001A89 E88307                   call isreg
  3648 00001A8C 08C0                     or  al, al
  3649 00001A8E 0F840300                 je @@expr181
  3650 00001A92 E92602                   jmp @@e1
  3651                                  
  3652                                  ;-375 
  3653                                  
  3654                                  
  3655                                  ;-376   id1=searchname(); gettypes(id1); ids=signi;
  3656                                  
  3657                                  @@expr181:
  3658 00001A95 E812EC                   call searchname
  3659 00001A98 8946FC                   mov [bp-4], ax
  3660 00001A9B FF76FC                   push word [bp-4]
  3661 00001A9E E8CBEA                   call gettypes
  3662 00001AA1 83C402                   add  sp, 2
  3663 00001AA4 A1[3B00]                 mov ax, [signi]
  3664 00001AA7 8946F6                   mov [bp-10], ax
  3665                                  
  3666                                  ;-377   ixarr=0;  ixconst=0;
  3667                                  
  3668 00001AAA B80000                   mov ax, 0
  3669 00001AAD 8946FA                   mov [bp-6], ax
  3670 00001AB0 B80000                   mov ax, 0
  3671 00001AB3 8946F8                   mov [bp-8], ax
  3672                                  
  3673                                  ;-378     if (istoken('[')) { if (istoken(T_CONST)) {
  3674                                  
  3675 00001AB6 6A5B                     push 91
  3676 00001AB8 E8F42A                   call istoken
  3677 00001ABB 83C402                   add  sp, 2
  3678 00001ABE 08C0                     or  al, al
  3679 00001AC0 0F845900                 je @@expr182
  3680 00001AC4 680101                   push 257
  3681 00001AC7 E8E52A                   call istoken
  3682 00001ACA 83C402                   add  sp, 2
  3683 00001ACD 08C0                     or  al, al
  3684 00001ACF 0F841700                 je @@expr183
  3685                                  
  3686                                  ;-379       ixconst=1; ixarr=lexval; expect(']');  }
  3687                                  
  3688 00001AD3 B80100                   mov ax, 1
  3689 00001AD6 8946F8                   mov [bp-8], ax
  3690 00001AD9 A1[3600]                 mov ax, [lexval]
  3691 00001ADC 8946FA                   mov [bp-6], ax
  3692 00001ADF 6A5D                     push 93
  3693 00001AE1 E8ED2A                   call expect
  3694 00001AE4 83C402                   add  sp, 2
  3695                                  
  3696                                  ;-380     else {ixarr=searchname(); expect(T_NAME); expect(']');
  3697                                  
  3698 00001AE7 E93300                   jmp @@expr184
  3699                                  @@expr183:
  3700 00001AEA E8BDEB                   call searchname
  3701 00001AED 8946FA                   mov [bp-6], ax
  3702 00001AF0 680001                   push 256
  3703 00001AF3 E8DB2A                   call expect
  3704 00001AF6 83C402                   add  sp, 2
  3705 00001AF9 6A5D                     push 93
  3706 00001AFB E8D32A                   call expect
  3707 00001AFE 83C402                   add  sp, 2
  3708                                  
  3709                                  ;-381     gettypes(ixarr);
  3710                                  
  3711 00001B01 FF76FA                   push word [bp-6]
  3712 00001B04 E865EA                   call gettypes
  3713 00001B07 83C402                   add  sp, 2
  3714                                  
  3715                                  ;-382     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  3716                                  
  3717 00001B0A A1[3E00]                 mov ax, [widthi]
  3718 00001B0D 83F802                   cmp ax, 2
  3719 00001B10 0F840900                 je  @@expr185
  3720 00001B14 68[D31D]                 push expr_1
  3721 00001B17 E8B32E                   call error1
  3722 00001B1A 83C402                   add  sp, 2
  3723                                  @@expr185:
  3724                                  @@expr184:
  3725                                  
  3726                                  ;-383   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
  3727                                  
  3728                                  @@expr182:
  3729 00001B1D 68C304                   push 1219
  3730 00001B20 E88C2A                   call istoken
  3731 00001B23 83C402                   add  sp, 2
  3732 00001B26 08C0                     or  al, al
  3733 00001B28 0F844600                 je @@expr186
  3734 00001B2C 8B46FE                   mov ax, [bp-2]
  3735 00001B2F 08C0                     or  al, al
  3736 00001B31 0F840900                 je @@expr187
  3737 00001B35 68[F61D]                 push expr_2
  3738 00001B38 E8922E                   call error1
  3739 00001B3B 83C402                   add  sp, 2
  3740                                  
  3741                                  ;-384      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
  3742                                  
  3743                                  @@expr187:
  3744 00001B3E 68[061E]                 push expr_3
  3745 00001B41 E8A02B                   call prs
  3746 00001B44 83C402                   add  sp, 2
  3747 00001B47 A1[4100]                 mov ax, [wi]
  3748 00001B4A 83F802                   cmp ax, 2
  3749 00001B4D 0F850C00                 jne @@expr188
  3750 00001B51 68[0F1E]                 push expr_4
  3751 00001B54 E88D2B                   call prs
  3752 00001B57 83C402                   add  sp, 2
  3753 00001B5A E90900                   jmp @@expr189
  3754                                  @@expr188:
  3755 00001B5D 68[141E]                 push expr_5
  3756 00001B60 E8812B                   call prs
  3757 00001B63 83C402                   add  sp, 2
  3758                                  
  3759                                  ;-385      v(id1); goto e1;}
  3760                                  
  3761                                  @@expr189:
  3762 00001B66 FF76FC                   push word [bp-4]
  3763 00001B69 E852E5                   call v
  3764 00001B6C 83C402                   add  sp, 2
  3765 00001B6F E94901                   jmp @@e1
  3766                                  
  3767                                  ;-386   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
  3768                                  
  3769                                  @@expr186:
  3770 00001B72 68C904                   push 1225
  3771 00001B75 E8372A                   call istoken
  3772 00001B78 83C402                   add  sp, 2
  3773 00001B7B 08C0                     or  al, al
  3774 00001B7D 0F844600                 je @@expr190
  3775 00001B81 8B46FE                   mov ax, [bp-2]
  3776 00001B84 08C0                     or  al, al
  3777 00001B86 0F840900                 je @@expr191
  3778 00001B8A 68[191E]                 push expr_6
  3779 00001B8D E83D2E                   call error1
  3780 00001B90 83C402                   add  sp, 2
  3781                                  
  3782                                  ;-387      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
  3783                                  
  3784                                  @@expr191:
  3785 00001B93 68[291E]                 push expr_7
  3786 00001B96 E84B2B                   call prs
  3787 00001B99 83C402                   add  sp, 2
  3788 00001B9C A1[4100]                 mov ax, [wi]
  3789 00001B9F 83F802                   cmp ax, 2
  3790 00001BA2 0F850C00                 jne @@expr192
  3791 00001BA6 68[321E]                 push expr_8
  3792 00001BA9 E8382B                   call prs
  3793 00001BAC 83C402                   add  sp, 2
  3794 00001BAF E90900                   jmp @@expr193
  3795                                  @@expr192:
  3796 00001BB2 68[371E]                 push expr_9
  3797 00001BB5 E82C2B                   call prs
  3798 00001BB8 83C402                   add  sp, 2
  3799                                  
  3800                                  ;-388      v(id1); goto e1;}
  3801                                  
  3802                                  @@expr193:
  3803 00001BBB FF76FC                   push word [bp-4]
  3804 00001BBE E8FDE4                   call v
  3805 00001BC1 83C402                   add  sp, 2
  3806 00001BC4 E9F400                   jmp @@e1
  3807                                  
  3808                                  ;-389        
  3809                                  
  3810                                  
  3811                                  ;-390   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  3812                                  
  3813                                  @@expr190:
  3814 00001BC7 68CE04                   push 1230
  3815 00001BCA E8E229                   call istoken
  3816 00001BCD 83C402                   add  sp, 2
  3817 00001BD0 08C0                     or  al, al
  3818 00001BD2 0F841200                 je @@expr194
  3819 00001BD6 FF76FC                   push word [bp-4]
  3820 00001BD9 FF76FE                   push word [bp-2]
  3821 00001BDC 68[3C1E]                 push expr_10
  3822 00001BDF E8A802                   call compoundass
  3823 00001BE2 83C406                   add  sp, 6
  3824 00001BE5 E9D300                   jmp @@e1
  3825                                  
  3826                                  ;-391   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  3827                                  
  3828                                  @@expr194:
  3829 00001BE8 68CF04                   push 1231
  3830 00001BEB E8C129                   call istoken
  3831 00001BEE 83C402                   add  sp, 2
  3832 00001BF1 08C0                     or  al, al
  3833 00001BF3 0F841200                 je @@expr195
  3834 00001BF7 FF76FC                   push word [bp-4]
  3835 00001BFA FF76FE                   push word [bp-2]
  3836 00001BFD 68[401E]                 push expr_11
  3837 00001C00 E88702                   call compoundass
  3838 00001C03 83C406                   add  sp, 6
  3839 00001C06 E9B200                   jmp @@e1
  3840                                  
  3841                                  ;-392   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  3842                                  
  3843                                  @@expr195:
  3844 00001C09 68D204                   push 1234
  3845 00001C0C E8A029                   call istoken
  3846 00001C0F 83C402                   add  sp, 2
  3847 00001C12 08C0                     or  al, al
  3848 00001C14 0F841200                 je @@expr196
  3849 00001C18 FF76FC                   push word [bp-4]
  3850 00001C1B FF76FE                   push word [bp-2]
  3851 00001C1E 68[441E]                 push expr_12
  3852 00001C21 E86602                   call compoundass
  3853 00001C24 83C406                   add  sp, 6
  3854 00001C27 E99100                   jmp @@e1
  3855                                  
  3856                                  ;-393   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  3857                                  
  3858                                  @@expr196:
  3859 00001C2A 68D304                   push 1235
  3860 00001C2D E87F29                   call istoken
  3861 00001C30 83C402                   add  sp, 2
  3862 00001C33 08C0                     or  al, al
  3863 00001C35 0F841200                 je @@expr197
  3864 00001C39 FF76FC                   push word [bp-4]
  3865 00001C3C FF76FE                   push word [bp-2]
  3866 00001C3F 68[481E]                 push expr_13
  3867 00001C42 E84502                   call compoundass
  3868 00001C45 83C406                   add  sp, 6
  3869 00001C48 E97000                   jmp @@e1
  3870                                  
  3871                                  ;-394   if (istoken(T_MULASS    )) {error1("not implemented");}
  3872                                  
  3873                                  @@expr197:
  3874 00001C4B 68D004                   push 1232
  3875 00001C4E E85E29                   call istoken
  3876 00001C51 83C402                   add  sp, 2
  3877 00001C54 08C0                     or  al, al
  3878 00001C56 0F840900                 je @@expr198
  3879 00001C5A 68[4B1E]                 push expr_14
  3880 00001C5D E86D2D                   call error1
  3881 00001C60 83C402                   add  sp, 2
  3882                                  
  3883                                  ;-395   if (istoken(T_DIVASS    )) {error1("not implemented");}
  3884                                  
  3885                                  @@expr198:
  3886 00001C63 68D104                   push 1233
  3887 00001C66 E84629                   call istoken
  3888 00001C69 83C402                   add  sp, 2
  3889 00001C6C 08C0                     or  al, al
  3890 00001C6E 0F840900                 je @@expr199
  3891 00001C72 68[5B1E]                 push expr_15
  3892 00001C75 E8552D                   call error1
  3893 00001C78 83C402                   add  sp, 2
  3894                                  
  3895                                  ;-396 
  3896                                  
  3897                                  
  3898                                  ;-397   if (istoken('=')) { exprtype= expr(1); 
  3899                                  
  3900                                  @@expr199:
  3901 00001C7B 6A3D                     push 61
  3902 00001C7D E82F29                   call istoken
  3903 00001C80 83C402                   add  sp, 2
  3904 00001C83 08C0                     or  al, al
  3905 00001C85 0F842000                 je @@expr200
  3906 00001C89 6A01                     push 1
  3907 00001C8B E899FD                   call expr
  3908 00001C8E 83C402                   add  sp, 2
  3909 00001C91 A3[251A]                 mov word [exprtype], ax
  3910                                  
  3911                                  ;-398   doassign(mode, id1, ixarr, ixconst); goto e1;  }
  3912                                  
  3913 00001C94 FF76F8                   push word [bp-8]
  3914 00001C97 FF76FA                   push word [bp-6]
  3915 00001C9A FF76FC                   push word [bp-4]
  3916 00001C9D FF76FE                   push word [bp-2]
  3917 00001CA0 E85E08                   call doassign
  3918 00001CA3 83C408                   add  sp, 8
  3919 00001CA6 E91200                   jmp @@e1
  3920                                  
  3921                                  ;-399   dovar1(mode, "mov", ixarr, id1);
  3922                                  
  3923                                  @@expr200:
  3924 00001CA9 FF76FC                   push word [bp-4]
  3925 00001CAC FF76FA                   push word [bp-6]
  3926 00001CAF 68[6B1E]                 push expr_16
  3927 00001CB2 FF76FE                   push word [bp-2]
  3928 00001CB5 E87402                   call dovar1
  3929 00001CB8 83C408                   add  sp, 8
  3930                                  
  3931                                  ;-400   
  3932                                  
  3933                                  
  3934                                  ;-401 e1:    if (istoken('+')) rterm("add");
  3935                                  
  3936                                  @@e1:
  3937 00001CBB 6A2B                     push 43
  3938 00001CBD E8EF28                   call istoken
  3939 00001CC0 83C402                   add  sp, 2
  3940 00001CC3 08C0                     or  al, al
  3941 00001CC5 0F840C00                 je @@expr201
  3942 00001CC9 68[6F1E]                 push expr_17
  3943 00001CCC E82704                   call rterm
  3944 00001CCF 83C402                   add  sp, 2
  3945                                  
  3946                                  ;-402   else if (istoken('-')) rterm("sub" );
  3947                                  
  3948 00001CD2 E9CF00                   jmp @@expr202
  3949                                  @@expr201:
  3950 00001CD5 6A2D                     push 45
  3951 00001CD7 E8D528                   call istoken
  3952 00001CDA 83C402                   add  sp, 2
  3953 00001CDD 08C0                     or  al, al
  3954 00001CDF 0F840C00                 je @@expr203
  3955 00001CE3 68[731E]                 push expr_18
  3956 00001CE6 E80D04                   call rterm
  3957 00001CE9 83C402                   add  sp, 2
  3958                                  
  3959                                  ;-403   else if (istoken('&')) rterm("and" );
  3960                                  
  3961 00001CEC E9B500                   jmp @@expr204
  3962                                  @@expr203:
  3963 00001CEF 6A26                     push 38
  3964 00001CF1 E8BB28                   call istoken
  3965 00001CF4 83C402                   add  sp, 2
  3966 00001CF7 08C0                     or  al, al
  3967 00001CF9 0F840C00                 je @@expr205
  3968 00001CFD 68[771E]                 push expr_19
  3969 00001D00 E8F303                   call rterm
  3970 00001D03 83C402                   add  sp, 2
  3971                                  
  3972                                  ;-404   else if (istoken('|')) rterm("or" );  
  3973                                  
  3974 00001D06 E99B00                   jmp @@expr206
  3975                                  @@expr205:
  3976 00001D09 6A7C                     push 124
  3977 00001D0B E8A128                   call istoken
  3978 00001D0E 83C402                   add  sp, 2
  3979 00001D11 08C0                     or  al, al
  3980 00001D13 0F840C00                 je @@expr207
  3981 00001D17 68[7B1E]                 push expr_20
  3982 00001D1A E8D903                   call rterm
  3983 00001D1D 83C402                   add  sp, 2
  3984                                  
  3985                                  ;-405   else if (istoken(T_LESSLESS)) rterm("shl");
  3986                                  
  3987 00001D20 E98100                   jmp @@expr208
  3988                                  @@expr207:
  3989 00001D23 68D804                   push 1240
  3990 00001D26 E88628                   call istoken
  3991 00001D29 83C402                   add  sp, 2
  3992 00001D2C 08C0                     or  al, al
  3993 00001D2E 0F840C00                 je @@expr209
  3994 00001D32 68[7E1E]                 push expr_21
  3995 00001D35 E8BE03                   call rterm
  3996 00001D38 83C402                   add  sp, 2
  3997                                  
  3998                                  ;-406   else if (istoken(T_GREATGREAT)) rterm("shr");  
  3999                                  
  4000 00001D3B E96600                   jmp @@expr210
  4001                                  @@expr209:
  4002 00001D3E 68D904                   push 1241
  4003 00001D41 E86B28                   call istoken
  4004 00001D44 83C402                   add  sp, 2
  4005 00001D47 08C0                     or  al, al
  4006 00001D49 0F840C00                 je @@expr211
  4007 00001D4D 68[821E]                 push expr_22
  4008 00001D50 E8A303                   call rterm
  4009 00001D53 83C402                   add  sp, 2
  4010                                  
  4011                                  ;-407   else if (istoken('*')) domul (ids);
  4012                                  
  4013 00001D56 E94B00                   jmp @@expr212
  4014                                  @@expr211:
  4015 00001D59 6A2A                     push 42
  4016 00001D5B E85128                   call istoken
  4017 00001D5E 83C402                   add  sp, 2
  4018 00001D61 08C0                     or  al, al
  4019 00001D63 0F840C00                 je @@expr213
  4020 00001D67 FF76F6                   push word [bp-10]
  4021 00001D6A E8DD09                   call domul
  4022 00001D6D 83C402                   add  sp, 2
  4023                                  
  4024                                  ;-408   else if (istoken('/')) doidiv(ids);
  4025                                  
  4026 00001D70 E93100                   jmp @@expr214
  4027                                  @@expr213:
  4028 00001D73 6A2F                     push 47
  4029 00001D75 E83728                   call istoken
  4030 00001D78 83C402                   add  sp, 2
  4031 00001D7B 08C0                     or  al, al
  4032 00001D7D 0F840C00                 je @@expr215
  4033 00001D81 FF76F6                   push word [bp-10]
  4034 00001D84 E8640A                   call doidiv
  4035 00001D87 83C402                   add  sp, 2
  4036                                  
  4037                                  ;-409   else if (istoken('%')) domod (ids);
  4038                                  
  4039 00001D8A E91700                   jmp @@expr216
  4040                                  @@expr215:
  4041 00001D8D 6A25                     push 37
  4042 00001D8F E81D28                   call istoken
  4043 00001D92 83C402                   add  sp, 2
  4044 00001D95 08C0                     or  al, al
  4045 00001D97 0F840900                 je @@expr217
  4046 00001D9B FF76F6                   push word [bp-10]
  4047 00001D9E E8ED0B                   call domod
  4048 00001DA1 83C402                   add  sp, 2
  4049                                  
  4050                                  ;-410   if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  4051                                  
  4052                                  @@expr217:
  4053                                  @@expr216:
  4054                                  @@expr214:
  4055                                  @@expr212:
  4056                                  @@expr210:
  4057                                  @@expr208:
  4058                                  @@expr206:
  4059                                  @@expr204:
  4060                                  @@expr202:
  4061 00001DA4 E8DA1F                   call isrelational
  4062 00001DA7 08C0                     or  al, al
  4063 00001DA9 0F841200                 je @@expr218
  4064 00001DAD 68[861E]                 push expr_23
  4065 00001DB0 E84303                   call rterm
  4066 00001DB3 83C402                   add  sp, 2
  4067 00001DB6 FF76F6                   push word [bp-10]
  4068 00001DB9 E8761C                   call cmpneg
  4069 00001DBC 83C402                   add  sp, 2
  4070                                  
  4071                                  ;-411   return 0;
  4072                                  
  4073                                  @@expr218:
  4074 00001DBF B80000                   mov ax, 0
  4075 00001DC2 E90000                   jmp @@retn
  4076                                  
  4077                                  ;-412 }
  4078                                  
  4079                                  
  4080                                  ;-413 
  4081                                  
  4082                                  
  4083                                  ;-414 int compoundass(char *op, int mode, int id1) {
  4084                                  
  4085 00001DC5 C9                      @@retn: LEAVE
  4086 00001DC6 C3                       ret
  4087                                  ; ENDP
  4088 00001DC7 5C6E206D6F76206178-     expr_0 db "\n mov ax, ",0
  4089 00001DD0 2C2000             
  4090 00001DD3 4172726179696E6465-     expr_1 db "Arrayindex muss Zahl oder int sein",0
  4091 00001DDC 78206D757373205A61-
  4092 00001DE5 686C206F6465722069-
  4093 00001DEE 6E74207365696E00   
  4094 00001DF6 4E7572207661722065-     expr_2 db "Nur var erlaubt",0
  4095 00001DFF 726C6175627400     
  4096 00001E06 5C6E20696E63202000      expr_3 db "\n inc  ",0
  4097 00001E0F 776F726400              expr_4 db "word",0
  4098 00001E14 6279746500              expr_5 db "byte",0
  4099 00001E19 4E7572207661722065-     expr_6 db "Nur var erlaubt",0
  4100 00001E22 726C6175627400     
  4101 00001E29 5C6E20646563202000      expr_7 db "\n dec  ",0
  4102 00001E32 776F726400              expr_8 db "word",0
  4103 00001E37 6279746500              expr_9 db "byte",0
  4104 00001E3C 61646400                expr_10 db "add",0
  4105 00001E40 73756200                expr_11 db "sub",0
  4106 00001E44 616E6400                expr_12 db "and",0
  4107 00001E48 6F7200                  expr_13 db "or",0
  4108 00001E4B 6E6F7420696D706C65-     expr_14 db "not implemented",0
  4109 00001E54 6D656E74656400     
  4110 00001E5B 6E6F7420696D706C65-     expr_15 db "not implemented",0
  4111 00001E64 6D656E74656400     
  4112 00001E6B 6D6F7600                expr_16 db "mov",0
  4113 00001E6F 61646400                expr_17 db "add",0
  4114 00001E73 73756200                expr_18 db "sub",0
  4115 00001E77 616E6400                expr_19 db "and",0
  4116 00001E7B 6F7200                  expr_20 db "or",0
  4117 00001E7E 73686C00                expr_21 db "shl",0
  4118 00001E82 73687200                expr_22 db "shr",0
  4119 00001E86 636D7000                expr_23 db "cmp",0
  4120                                  
  4121                                  compoundass:  ; *** PROC ***
  4122                                  
  4123                                  ;-415   if(mode) error1("only scalar Var allowed");
  4124                                  
  4125                                  ;Function : compoundass, Number of local variables: 3
  4126                                  ;   # type sign width addr used name   list of local variables
  4127                                  ;  200 ptr sign byte   414 NULL op = bp+4
  4128                                  ;  201 var sign word   414 NULL mode = bp+6
  4129                                  ;  202 var sign word   414 NULL id1 = bp+8;
  4130 00001E8A C8000000                 ENTER  0,0
  4131 00001E8E 8B4606                   mov ax, [bp+6]
  4132 00001E91 08C0                     or  al, al
  4133 00001E93 0F840900                 je @@compoundass219
  4134 00001E97 68[041F]                 push compoundass_0
  4135 00001E9A E8302B                   call error1
  4136 00001E9D 83C402                   add  sp, 2
  4137                                  
  4138                                  ;-416   prnl(); prs(op); prs("  "); 
  4139                                  
  4140                                  @@compoundass219:
  4141 00001EA0 E83328                   call prnl
  4142 00001EA3 FF7604                   push word [bp+4]
  4143 00001EA6 E83B28                   call prs
  4144 00001EA9 83C402                   add  sp, 2
  4145 00001EAC 68[1C1F]                 push compoundass_1
  4146 00001EAF E83228                   call prs
  4147 00001EB2 83C402                   add  sp, 2
  4148                                  
  4149                                  ;-417   gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  4150                                  
  4151 00001EB5 FF7608                   push word [bp+8]
  4152 00001EB8 E8B1E6                   call gettypes
  4153 00001EBB 83C402                   add  sp, 2
  4154 00001EBE A1[4100]                 mov ax, [wi]
  4155 00001EC1 83F802                   cmp ax, 2
  4156 00001EC4 0F850C00                 jne @@compoundass220
  4157 00001EC8 68[1F1F]                 push compoundass_2
  4158 00001ECB E81628                   call prs
  4159 00001ECE 83C402                   add  sp, 2
  4160 00001ED1 E90900                   jmp @@compoundass221
  4161                                  @@compoundass220:
  4162 00001ED4 68[241F]                 push compoundass_3
  4163 00001ED7 E80A28                   call prs
  4164 00001EDA 83C402                   add  sp, 2
  4165                                  
  4166                                  ;-418   v(id1); prs(", ");
  4167                                  
  4168                                  @@compoundass221:
  4169 00001EDD FF7608                   push word [bp+8]
  4170 00001EE0 E8DBE1                   call v
  4171 00001EE3 83C402                   add  sp, 2
  4172 00001EE6 68[291F]                 push compoundass_4
  4173 00001EE9 E8F827                   call prs
  4174 00001EEC 83C402                   add  sp, 2
  4175                                  
  4176                                  ;-419   expect(T_CONST); prunsign1(lexval);
  4177                                  
  4178 00001EEF 680101                   push 257
  4179 00001EF2 E8DC26                   call expect
  4180 00001EF5 83C402                   add  sp, 2
  4181 00001EF8 FF36[3600]               push word [lexval]
  4182 00001EFC E83F29                   call prunsign1
  4183 00001EFF 83C402                   add  sp, 2
  4184                                  
  4185                                  ;-420 }
  4186                                  
  4187                                  
  4188                                  ;-421 int dovar1(int mode, int op, int ixarr, int id1) { 
  4189 00001F02 C9                       LEAVE
  4190 00001F03 C3                       ret
  4191                                  ; ENDP
  4192 00001F04 6F6E6C79207363616C-     compoundass_0 db "only scalar Var allowed",0
  4193 00001F0D 61722056617220616C-
  4194 00001F16 6C6F77656400       
  4195 00001F1C 202000                  compoundass_1 db "  ",0
  4196 00001F1F 776F726400              compoundass_2 db "word",0
  4197 00001F24 6279746500              compoundass_3 db "byte",0
  4198 00001F29 2C2000                  compoundass_4 db ", ",0
  4199                                  
  4200                                  dovar1:  ; *** PROC ***
  4201                                  
  4202                                  ;-422   gettypes(id1);
  4203                                  
  4204                                  ;Function : dovar1, Number of local variables: 4
  4205                                  ;   # type sign width addr used name   list of local variables
  4206                                  ;  200 var sign word   421 NULL mode = bp+4
  4207                                  ;  201 var sign word   421 NULL op = bp+6
  4208                                  ;  202 var sign word   421 NULL ixarr = bp+8
  4209                                  ;  203 var sign word   421 NULL id1 = bp+10;
  4210 00001F2C C8000000                 ENTER  0,0
  4211 00001F30 FF760A                   push word [bp+10]
  4212 00001F33 E836E6                   call gettypes
  4213 00001F36 83C402                   add  sp, 2
  4214                                  
  4215                                  ;-423   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
  4216                                  
  4217 00001F39 8B4604                   mov ax, [bp+4]
  4218 00001F3C 83F801                   cmp ax, 1
  4219 00001F3F 0F854700                 jne @@dovar1222
  4220 00001F43 68[8120]                 push dovar1_0
  4221 00001F46 E89B27                   call prs
  4222 00001F49 83C402                   add  sp, 2
  4223 00001F4C FF760A                   push word [bp+10]
  4224 00001F4F E86CE1                   call v
  4225 00001F52 83C402                   add  sp, 2
  4226 00001F55 E87E27                   call prnl
  4227 00001F58 FF7606                   push word [bp+6]
  4228 00001F5B E88627                   call prs
  4229 00001F5E 83C402                   add  sp, 2
  4230                                  
  4231                                  ;-424     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
  4232                                  
  4233 00001F61 A1[3E00]                 mov ax, [widthi]
  4234 00001F64 83F801                   cmp ax, 1
  4235 00001F67 0F850900                 jne @@dovar1223
  4236 00001F6B 68[8D20]                 push dovar1_1
  4237 00001F6E E87327                   call prs
  4238 00001F71 83C402                   add  sp, 2
  4239                                  
  4240                                  ;-425     if(widthi == 2) prs(" ax, [bx]");
  4241                                  
  4242                                  @@dovar1223:
  4243 00001F74 A1[3E00]                 mov ax, [widthi]
  4244 00001F77 83F802                   cmp ax, 2
  4245 00001F7A 0F850900                 jne @@dovar1224
  4246 00001F7E 68[A320]                 push dovar1_2
  4247 00001F81 E86027                   call prs
  4248 00001F84 83C402                   add  sp, 2
  4249                                  
  4250                                  ;-426     return; }
  4251                                  
  4252                                  @@dovar1224:
  4253 00001F87 E9F500                   jmp @@retn
  4254                                  
  4255                                  ;-427   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  4256                                  
  4257                                  @@dovar1222:
  4258 00001F8A 8B4604                   mov ax, [bp+4]
  4259 00001F8D 83F802                   cmp ax, 2
  4260 00001F90 0F852100                 jne @@dovar1225
  4261 00001F94 E83F27                   call prnl
  4262 00001F97 FF7606                   push word [bp+6]
  4263 00001F9A E84727                   call prs
  4264 00001F9D 83C402                   add  sp, 2
  4265 00001FA0 68[AD20]                 push dovar1_3
  4266 00001FA3 E83E27                   call prs
  4267 00001FA6 83C402                   add  sp, 2
  4268 00001FA9 FF760A                   push word [bp+10]
  4269 00001FAC E800E1                   call a
  4270 00001FAF 83C402                   add  sp, 2
  4271 00001FB2 E9CA00                   jmp @@retn
  4272                                  
  4273                                  ;-428   if (ixarr) {
  4274                                  
  4275                                  @@dovar1225:
  4276 00001FB5 8B4608                   mov ax, [bp+8]
  4277 00001FB8 08C0                     or  al, al
  4278 00001FBA 0F847300                 je @@dovar1226
  4279                                  
  4280                                  ;-429     prs("\n mov bx, "); v(ixarr);
  4281                                  
  4282 00001FBE 68[B320]                 push dovar1_4
  4283 00001FC1 E82027                   call prs
  4284 00001FC4 83C402                   add  sp, 2
  4285 00001FC7 FF7608                   push word [bp+8]
  4286 00001FCA E8F1E0                   call v
  4287 00001FCD 83C402                   add  sp, 2
  4288                                  
  4289                                  ;-430     if (wi==2) prs("\n shl bx, 1");
  4290                                  
  4291 00001FD0 A1[4100]                 mov ax, [wi]
  4292 00001FD3 83F802                   cmp ax, 2
  4293 00001FD6 0F850900                 jne @@dovar1227
  4294 00001FDA 68[BF20]                 push dovar1_5
  4295 00001FDD E80427                   call prs
  4296 00001FE0 83C402                   add  sp, 2
  4297                                  
  4298                                  ;-431     prs("\n "); prs(op);
  4299                                  
  4300                                  @@dovar1227:
  4301 00001FE3 68[CC20]                 push dovar1_6
  4302 00001FE6 E8FB26                   call prs
  4303 00001FE9 83C402                   add  sp, 2
  4304 00001FEC FF7606                   push word [bp+6]
  4305 00001FEF E8F226                   call prs
  4306 00001FF2 83C402                   add  sp, 2
  4307                                  
  4308                                  ;-432     if (wi==2) prs(" ax, "); else prs(" al, ");
  4309                                  
  4310 00001FF5 A1[4100]                 mov ax, [wi]
  4311 00001FF8 83F802                   cmp ax, 2
  4312 00001FFB 0F850C00                 jne @@dovar1228
  4313 00001FFF 68[D020]                 push dovar1_7
  4314 00002002 E8DF26                   call prs
  4315 00002005 83C402                   add  sp, 2
  4316 00002008 E90900                   jmp @@dovar1229
  4317                                  @@dovar1228:
  4318 0000200B 68[D620]                 push dovar1_8
  4319 0000200E E8D326                   call prs
  4320 00002011 83C402                   add  sp, 2
  4321                                  
  4322                                  ;-433 // v(id1); prs(" [bx]");
  4323                                  
  4324                                  
  4325                                  ;-434     prc('['); printName(id1); prs(" + bx]"); 
  4326                                  
  4327                                  @@dovar1229:
  4328 00002014 6A5B                     push 91
  4329 00002016 E86426                   call prc
  4330 00002019 83C402                   add  sp, 2
  4331 0000201C FF760A                   push word [bp+10]
  4332 0000201F E824E6                   call printName
  4333 00002022 83C402                   add  sp, 2
  4334 00002025 68[DC20]                 push dovar1_9
  4335 00002028 E8B926                   call prs
  4336 0000202B 83C402                   add  sp, 2
  4337                                  
  4338                                  ;-435     return; }
  4339                                  
  4340 0000202E E94E00                   jmp @@retn
  4341                                  
  4342                                  ;-436   prnl();prs(op);
  4343                                  
  4344                                  @@dovar1226:
  4345 00002031 E8A226                   call prnl
  4346 00002034 FF7606                   push word [bp+6]
  4347 00002037 E8AA26                   call prs
  4348 0000203A 83C402                   add  sp, 2
  4349                                  
  4350                                  ;-437   if(wi==1) prs(" al, ");
  4351                                  
  4352 0000203D A1[4100]                 mov ax, [wi]
  4353 00002040 83F801                   cmp ax, 1
  4354 00002043 0F850900                 jne @@dovar1230
  4355 00002047 68[E320]                 push dovar1_10
  4356 0000204A E89726                   call prs
  4357 0000204D 83C402                   add  sp, 2
  4358                                  
  4359                                  ;-438   if(wi==2) prs(" ax, ");
  4360                                  
  4361                                  @@dovar1230:
  4362 00002050 A1[4100]                 mov ax, [wi]
  4363 00002053 83F802                   cmp ax, 2
  4364 00002056 0F850900                 jne @@dovar1231
  4365 0000205A 68[E920]                 push dovar1_11
  4366 0000205D E88426                   call prs
  4367 00002060 83C402                   add  sp, 2
  4368                                  
  4369                                  ;-439   if(wi==4) prs(" eax, ");
  4370                                  
  4371                                  @@dovar1231:
  4372 00002063 A1[4100]                 mov ax, [wi]
  4373 00002066 83F804                   cmp ax, 4
  4374 00002069 0F850900                 jne @@dovar1232
  4375 0000206D 68[EF20]                 push dovar1_12
  4376 00002070 E87126                   call prs
  4377 00002073 83C402                   add  sp, 2
  4378                                  
  4379                                  ;-440   v(id1);
  4380                                  
  4381                                  @@dovar1232:
  4382 00002076 FF760A                   push word [bp+10]
  4383 00002079 E842E0                   call v
  4384 0000207C 83C402                   add  sp, 2
  4385                                  
  4386                                  ;-441 }
  4387                                  
  4388                                  
  4389                                  ;-442 int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  4390                                  
  4391 0000207F C9                      @@retn: LEAVE
  4392 00002080 C3                       ret
  4393                                  ; ENDP
  4394 00002081 5C6E206D6F76206278-     dovar1_0 db "\n mov bx, ",0
  4395 0000208A 2C2000             
  4396 0000208D 20616C2C205B62785D-     dovar1_1 db " al, [bx]\n mov ah, 0",0
  4397 00002096 5C6E206D6F76206168-
  4398 0000209F 2C203000           
  4399 000020A3 2061782C205B62785D-     dovar1_2 db " ax, [bx]",0
  4400 000020AC 00                 
  4401 000020AD 2061782C2000            dovar1_3 db " ax, ",0
  4402 000020B3 5C6E206D6F76206278-     dovar1_4 db "\n mov bx, ",0
  4403 000020BC 2C2000             
  4404 000020BF 5C6E2073686C206278-     dovar1_5 db "\n shl bx, 1",0
  4405 000020C8 2C203100           
  4406 000020CC 5C6E2000                dovar1_6 db "\n ",0
  4407 000020D0 2061782C2000            dovar1_7 db " ax, ",0
  4408 000020D6 20616C2C2000            dovar1_8 db " al, ",0
  4409 000020DC 202B2062785D00          dovar1_9 db " + bx]",0
  4410 000020E3 20616C2C2000            dovar1_10 db " al, ",0
  4411 000020E9 2061782C2000            dovar1_11 db " ax, ",0
  4412 000020EF 206561782C2000          dovar1_12 db " eax, ",0
  4413                                  
  4414                                  rterm:  ; *** PROC ***
  4415                                  
  4416                                  ;-443   if (istoken(T_CONST)) { prnl(); prs(op); 
  4417                                  
  4418                                  ;Function : rterm, Number of local variables: 5
  4419                                  ;   # type sign width addr used name   list of local variables
  4420                                  ;  200 ptr sign byte   442 NULL op = bp+4
  4421                                  ;  201 var sign word   442 NULL mode = bp-2
  4422                                  ;  202 var sign word   442 NULL opint = bp-4
  4423                                  ;  203 var sign word   442 NULL ixarr = bp-6
  4424                                  ;  204 var sign word   442 NULL id1 = bp-8;
  4425 000020F6 C8080000                 ENTER  8,0
  4426 000020FA 680101                   push 257
  4427 000020FD E8AF24                   call istoken
  4428 00002100 83C402                   add  sp, 2
  4429 00002103 08C0                     or  al, al
  4430 00002105 0F845200                 je @@rterm233
  4431 00002109 E8CA25                   call prnl
  4432 0000210C FF7604                   push word [bp+4]
  4433 0000210F E8D225                   call prs
  4434 00002112 83C402                   add  sp, 2
  4435                                  
  4436                                  ;-444     if (wi==1) prs(" al, ");
  4437                                  
  4438 00002115 A1[4100]                 mov ax, [wi]
  4439 00002118 83F801                   cmp ax, 1
  4440 0000211B 0F850900                 jne @@rterm234
  4441 0000211F 68[DF21]                 push rterm_0
  4442 00002122 E8BF25                   call prs
  4443 00002125 83C402                   add  sp, 2
  4444                                  
  4445                                  ;-445     if (wi==2) prs(" ax, ");
  4446                                  
  4447                                  @@rterm234:
  4448 00002128 A1[4100]                 mov ax, [wi]
  4449 0000212B 83F802                   cmp ax, 2
  4450 0000212E 0F850900                 jne @@rterm235
  4451 00002132 68[E521]                 push rterm_1
  4452 00002135 E8AC25                   call prs
  4453 00002138 83C402                   add  sp, 2
  4454                                  
  4455                                  ;-446     if (wi==4) prs(" eax, ");
  4456                                  
  4457                                  @@rterm235:
  4458 0000213B A1[4100]                 mov ax, [wi]
  4459 0000213E 83F804                   cmp ax, 4
  4460 00002141 0F850900                 jne @@rterm236
  4461 00002145 68[EB21]                 push rterm_2
  4462 00002148 E89925                   call prs
  4463 0000214B 83C402                   add  sp, 2
  4464                                  
  4465                                  ;-447     prunsign1(lexval); return;}
  4466                                  
  4467                                  @@rterm236:
  4468 0000214E FF36[3600]               push word [lexval]
  4469 00002152 E8E926                   call prunsign1
  4470 00002155 83C402                   add  sp, 2
  4471 00002158 E98200                   jmp @@retn
  4472                                  
  4473                                  ;-448   mode=typeName(); id1=searchname(); ixarr=0;
  4474                                  
  4475                                  @@rterm233:
  4476 0000215B E81BE6                   call typeName
  4477 0000215E 8946FE                   mov [bp-2], ax
  4478 00002161 E846E5                   call searchname
  4479 00002164 8946F8                   mov [bp-8], ax
  4480 00002167 B80000                   mov ax, 0
  4481 0000216A 8946FA                   mov [bp-6], ax
  4482                                  
  4483                                  ;-449   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
  4484                                  
  4485 0000216D 6A5B                     push 91
  4486 0000216F E83D24                   call istoken
  4487 00002172 83C402                   add  sp, 2
  4488 00002175 08C0                     or  al, al
  4489 00002177 0F843300                 je @@rterm237
  4490 0000217B E82CE5                   call searchname
  4491 0000217E 8946FA                   mov [bp-6], ax
  4492 00002181 680001                   push 256
  4493 00002184 E84A24                   call expect
  4494 00002187 83C402                   add  sp, 2
  4495 0000218A 6A5D                     push 93
  4496 0000218C E84224                   call expect
  4497 0000218F 83C402                   add  sp, 2
  4498                                  
  4499                                  ;-450     gettypes(ixarr);
  4500                                  
  4501 00002192 FF76FA                   push word [bp-6]
  4502 00002195 E8D4E3                   call gettypes
  4503 00002198 83C402                   add  sp, 2
  4504                                  
  4505                                  ;-451     if (widthi != 2) error1("Arrayindex muss int sein"); }
  4506                                  
  4507 0000219B A1[3E00]                 mov ax, [widthi]
  4508 0000219E 83F802                   cmp ax, 2
  4509 000021A1 0F840900                 je  @@rterm238
  4510 000021A5 68[F221]                 push rterm_3
  4511 000021A8 E82228                   call error1
  4512 000021AB 83C402                   add  sp, 2
  4513                                  @@rterm238:
  4514                                  
  4515                                  ;-452   if (eqstr(symbol,"_AX")) return;
  4516                                  
  4517                                  @@rterm237:
  4518 000021AE 68[0B22]                 push rterm_4
  4519 000021B1 8D062B81                 lea  ax, [symbol]
  4520 000021B5 50                       push ax
  4521 000021B6 E8F835                   call eqstr
  4522 000021B9 83C404                   add  sp, 4
  4523 000021BC 08C0                     or  al, al
  4524 000021BE 0F840300                 je @@rterm239
  4525 000021C2 E91800                   jmp @@retn
  4526                                  
  4527                                  ;-453   opint=op; dovar1(mode, opint, ixarr, id1);
  4528                                  
  4529                                  @@rterm239:
  4530 000021C5 8B4604                   mov ax, [bp+4]
  4531 000021C8 8946FC                   mov [bp-4], ax
  4532 000021CB FF76F8                   push word [bp-8]
  4533 000021CE FF76FA                   push word [bp-6]
  4534 000021D1 FF76FC                   push word [bp-4]
  4535 000021D4 FF76FE                   push word [bp-2]
  4536 000021D7 E852FD                   call dovar1
  4537 000021DA 83C408                   add  sp, 8
  4538                                  
  4539                                  ;-454 }
  4540                                  
  4541                                  
  4542                                  ;-455 int isreg() {
  4543                                  
  4544 000021DD C9                      @@retn: LEAVE
  4545 000021DE C3                       ret
  4546                                  ; ENDP
  4547 000021DF 20616C2C2000            rterm_0 db " al, ",0
  4548 000021E5 2061782C2000            rterm_1 db " ax, ",0
  4549 000021EB 206561782C2000          rterm_2 db " eax, ",0
  4550 000021F2 4172726179696E6465-     rterm_3 db "Arrayindex muss int sein",0
  4551 000021FB 78206D75737320696E-
  4552 00002204 74207365696E00     
  4553 0000220B 5F415800                rterm_4 db "_AX",0
  4554                                  
  4555                                  isreg:  ; *** PROC ***
  4556                                  
  4557                                  ;-456   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  4558                                  
  4559 0000220F 68[FC23]                 push isreg_0
  4560 00002212 8D062B81                 lea  ax, [symbol]
  4561 00002216 50                       push ax
  4562 00002217 E89735                   call eqstr
  4563 0000221A 83C404                   add  sp, 4
  4564 0000221D 08C0                     or  al, al
  4565 0000221F 0F840C00                 je @@isreg240
  4566 00002223 68[0024]                 push isreg_1
  4567 00002226 E84202                   call doreg
  4568 00002229 83C402                   add  sp, 2
  4569 0000222C E9C601                   jmp @@r1
  4570                                  
  4571                                  ;-457   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  4572                                  
  4573                                  @@isreg240:
  4574 0000222F 68[0324]                 push isreg_2
  4575 00002232 8D062B81                 lea  ax, [symbol]
  4576 00002236 50                       push ax
  4577 00002237 E87735                   call eqstr
  4578 0000223A 83C404                   add  sp, 4
  4579 0000223D 08C0                     or  al, al
  4580 0000223F 0F840C00                 je @@isreg241
  4581 00002243 68[0724]                 push isreg_3
  4582 00002246 E82202                   call doreg
  4583 00002249 83C402                   add  sp, 2
  4584 0000224C E9A601                   jmp @@r1
  4585                                  
  4586                                  ;-458   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  4587                                  
  4588                                  @@isreg241:
  4589 0000224F 68[0A24]                 push isreg_4
  4590 00002252 8D062B81                 lea  ax, [symbol]
  4591 00002256 50                       push ax
  4592 00002257 E85735                   call eqstr
  4593 0000225A 83C404                   add  sp, 4
  4594 0000225D 08C0                     or  al, al
  4595 0000225F 0F840C00                 je @@isreg242
  4596 00002263 68[0E24]                 push isreg_5
  4597 00002266 E80202                   call doreg
  4598 00002269 83C402                   add  sp, 2
  4599 0000226C E98601                   jmp @@r1
  4600                                  
  4601                                  ;-459   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  4602                                  
  4603                                  @@isreg242:
  4604 0000226F 68[1124]                 push isreg_6
  4605 00002272 8D062B81                 lea  ax, [symbol]
  4606 00002276 50                       push ax
  4607 00002277 E83735                   call eqstr
  4608 0000227A 83C404                   add  sp, 4
  4609 0000227D 08C0                     or  al, al
  4610 0000227F 0F840C00                 je @@isreg243
  4611 00002283 68[1524]                 push isreg_7
  4612 00002286 E8E201                   call doreg
  4613 00002289 83C402                   add  sp, 2
  4614 0000228C E96601                   jmp @@r1
  4615                                  
  4616                                  ;-460   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  4617                                  
  4618                                  @@isreg243:
  4619 0000228F 68[1824]                 push isreg_8
  4620 00002292 8D062B81                 lea  ax, [symbol]
  4621 00002296 50                       push ax
  4622 00002297 E81735                   call eqstr
  4623 0000229A 83C404                   add  sp, 4
  4624 0000229D 08C0                     or  al, al
  4625 0000229F 0F840C00                 je @@isreg244
  4626 000022A3 68[1C24]                 push isreg_9
  4627 000022A6 E8C201                   call doreg
  4628 000022A9 83C402                   add  sp, 2
  4629 000022AC E94601                   jmp @@r1
  4630                                  
  4631                                  ;-461   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  4632                                  
  4633                                  @@isreg244:
  4634 000022AF 68[1F24]                 push isreg_10
  4635 000022B2 8D062B81                 lea  ax, [symbol]
  4636 000022B6 50                       push ax
  4637 000022B7 E8F734                   call eqstr
  4638 000022BA 83C404                   add  sp, 4
  4639 000022BD 08C0                     or  al, al
  4640 000022BF 0F840C00                 je @@isreg245
  4641 000022C3 68[2324]                 push isreg_11
  4642 000022C6 E8A201                   call doreg
  4643 000022C9 83C402                   add  sp, 2
  4644 000022CC E92601                   jmp @@r1
  4645                                  
  4646                                  ;-462   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  4647                                  
  4648                                  @@isreg245:
  4649 000022CF 68[2624]                 push isreg_12
  4650 000022D2 8D062B81                 lea  ax, [symbol]
  4651 000022D6 50                       push ax
  4652 000022D7 E8D734                   call eqstr
  4653 000022DA 83C404                   add  sp, 4
  4654 000022DD 08C0                     or  al, al
  4655 000022DF 0F840C00                 je @@isreg246
  4656 000022E3 68[2A24]                 push isreg_13
  4657 000022E6 E88201                   call doreg
  4658 000022E9 83C402                   add  sp, 2
  4659 000022EC E90601                   jmp @@r1
  4660                                  
  4661                                  ;-463   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  4662                                  
  4663                                  @@isreg246:
  4664 000022EF 68[2D24]                 push isreg_14
  4665 000022F2 8D062B81                 lea  ax, [symbol]
  4666 000022F6 50                       push ax
  4667 000022F7 E8B734                   call eqstr
  4668 000022FA 83C404                   add  sp, 4
  4669 000022FD 08C0                     or  al, al
  4670 000022FF 0F840C00                 je @@isreg247
  4671 00002303 68[3124]                 push isreg_15
  4672 00002306 E86201                   call doreg
  4673 00002309 83C402                   add  sp, 2
  4674 0000230C E9E600                   jmp @@r1
  4675                                  
  4676                                  ;-464   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  4677                                  
  4678                                  @@isreg247:
  4679 0000230F 68[3424]                 push isreg_16
  4680 00002312 8D062B81                 lea  ax, [symbol]
  4681 00002316 50                       push ax
  4682 00002317 E89734                   call eqstr
  4683 0000231A 83C404                   add  sp, 4
  4684 0000231D 08C0                     or  al, al
  4685 0000231F 0F840C00                 je @@isreg248
  4686 00002323 68[3824]                 push isreg_17
  4687 00002326 E84201                   call doreg
  4688 00002329 83C402                   add  sp, 2
  4689 0000232C E9C600                   jmp @@r1
  4690                                  
  4691                                  ;-465   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  4692                                  
  4693                                  @@isreg248:
  4694 0000232F 68[3B24]                 push isreg_18
  4695 00002332 8D062B81                 lea  ax, [symbol]
  4696 00002336 50                       push ax
  4697 00002337 E87734                   call eqstr
  4698 0000233A 83C404                   add  sp, 4
  4699 0000233D 08C0                     or  al, al
  4700 0000233F 0F840C00                 je @@isreg249
  4701 00002343 68[3F24]                 push isreg_19
  4702 00002346 E82201                   call doreg
  4703 00002349 83C402                   add  sp, 2
  4704 0000234C E9A600                   jmp @@r1
  4705                                  
  4706                                  ;-466   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  4707                                  
  4708                                  @@isreg249:
  4709 0000234F 68[4224]                 push isreg_20
  4710 00002352 8D062B81                 lea  ax, [symbol]
  4711 00002356 50                       push ax
  4712 00002357 E85734                   call eqstr
  4713 0000235A 83C404                   add  sp, 4
  4714 0000235D 08C0                     or  al, al
  4715 0000235F 0F840C00                 je @@isreg250
  4716 00002363 68[4624]                 push isreg_21
  4717 00002366 E80201                   call doreg
  4718 00002369 83C402                   add  sp, 2
  4719 0000236C E98600                   jmp @@r1
  4720                                  
  4721                                  ;-467   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  4722                                  
  4723                                  @@isreg250:
  4724 0000236F 68[4924]                 push isreg_22
  4725 00002372 8D062B81                 lea  ax, [symbol]
  4726 00002376 50                       push ax
  4727 00002377 E83734                   call eqstr
  4728 0000237A 83C404                   add  sp, 4
  4729 0000237D 08C0                     or  al, al
  4730 0000237F 0F840C00                 je @@isreg251
  4731 00002383 68[4D24]                 push isreg_23
  4732 00002386 E8E200                   call doreg
  4733 00002389 83C402                   add  sp, 2
  4734 0000238C E96600                   jmp @@r1
  4735                                  
  4736                                  ;-468   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  4737                                  
  4738                                  @@isreg251:
  4739 0000238F 68[5024]                 push isreg_24
  4740 00002392 8D062B81                 lea  ax, [symbol]
  4741 00002396 50                       push ax
  4742 00002397 E81734                   call eqstr
  4743 0000239A 83C404                   add  sp, 4
  4744 0000239D 08C0                     or  al, al
  4745 0000239F 0F840C00                 je @@isreg252
  4746 000023A3 68[5424]                 push isreg_25
  4747 000023A6 E8C200                   call doreg
  4748 000023A9 83C402                   add  sp, 2
  4749 000023AC E94600                   jmp @@r1
  4750                                  
  4751                                  ;-469   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  4752                                  
  4753                                  @@isreg252:
  4754 000023AF 68[5724]                 push isreg_26
  4755 000023B2 8D062B81                 lea  ax, [symbol]
  4756 000023B6 50                       push ax
  4757 000023B7 E8F733                   call eqstr
  4758 000023BA 83C404                   add  sp, 4
  4759 000023BD 08C0                     or  al, al
  4760 000023BF 0F840C00                 je @@isreg253
  4761 000023C3 68[5B24]                 push isreg_27
  4762 000023C6 E8A200                   call doreg
  4763 000023C9 83C402                   add  sp, 2
  4764 000023CC E92600                   jmp @@r1
  4765                                  
  4766                                  ;-470   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  4767                                  
  4768                                  @@isreg253:
  4769 000023CF 68[5E24]                 push isreg_28
  4770 000023D2 8D062B81                 lea  ax, [symbol]
  4771 000023D6 50                       push ax
  4772 000023D7 E8D733                   call eqstr
  4773 000023DA 83C404                   add  sp, 4
  4774 000023DD 08C0                     or  al, al
  4775 000023DF 0F840C00                 je @@isreg254
  4776 000023E3 68[6524]                 push isreg_29
  4777 000023E6 E88200                   call doreg
  4778 000023E9 83C402                   add  sp, 2
  4779 000023EC E90600                   jmp @@r1
  4780                                  
  4781                                  ;-471   return 0;   r1: return 1; 
  4782                                  
  4783                                  @@isreg254:
  4784 000023EF B80000                   mov ax, 0
  4785 000023F2 E90600                   jmp @@retn
  4786                                  @@r1:
  4787 000023F5 B80100                   mov ax, 1
  4788 000023F8 E90000                   jmp @@retn
  4789                                  
  4790                                  ;-472 }
  4791                                  
  4792                                  
  4793                                  ;-473 int doreg(char *dr) { int i; expect('=');
  4794                                  
  4795                                  @@retn:
  4796 000023FB C3                       ret
  4797                                  ; ENDP
  4798 000023FC 5F414800                isreg_0 db "_AH",0
  4799 00002400 616800                  isreg_1 db "ah",0
  4800 00002403 5F414C00                isreg_2 db "_AL",0
  4801 00002407 616C00                  isreg_3 db "al",0
  4802 0000240A 5F415800                isreg_4 db "_AX",0
  4803 0000240E 617800                  isreg_5 db "ax",0
  4804 00002411 5F424800                isreg_6 db "_BH",0
  4805 00002415 626800                  isreg_7 db "bh",0
  4806 00002418 5F424C00                isreg_8 db "_BL",0
  4807 0000241C 626C00                  isreg_9 db "bl",0
  4808 0000241F 5F425800                isreg_10 db "_BX",0
  4809 00002423 627800                  isreg_11 db "bx",0
  4810 00002426 5F434800                isreg_12 db "_CH",0
  4811 0000242A 636800                  isreg_13 db "ch",0
  4812 0000242D 5F434C00                isreg_14 db "_CL",0
  4813 00002431 636C00                  isreg_15 db "cl",0
  4814 00002434 5F435800                isreg_16 db "_CX",0
  4815 00002438 637800                  isreg_17 db "cx",0
  4816 0000243B 5F444800                isreg_18 db "_DH",0
  4817 0000243F 646800                  isreg_19 db "dh",0
  4818 00002442 5F444C00                isreg_20 db "_DL",0
  4819 00002446 646C00                  isreg_21 db "dl",0
  4820 00002449 5F445800                isreg_22 db "_DX",0
  4821 0000244D 647800                  isreg_23 db "dx",0
  4822 00002450 5F534900                isreg_24 db "_SI",0
  4823 00002454 736900                  isreg_25 db "si",0
  4824 00002457 5F444900                isreg_26 db "_DI",0
  4825 0000245B 646900                  isreg_27 db "di",0
  4826 0000245E 5F464C41475300          isreg_28 db "_FLAGS",0
  4827 00002465 666C61677300            isreg_29 db "flags",0
  4828                                  
  4829                                  doreg:  ; *** PROC ***
  4830                                  ;Function : doreg, Number of local variables: 2
  4831                                  ;   # type sign width addr used name   list of local variables
  4832                                  ;  200 ptr sign byte   473 NULL dr = bp+4
  4833                                  ;  201 var sign word   473 NULL i = bp-2;
  4834 0000246B C8020000                 ENTER  2,0
  4835 0000246F 6A3D                     push 61
  4836 00002471 E85D21                   call expect
  4837 00002474 83C402                   add  sp, 2
  4838                                  
  4839                                  ;-474   prs("\n mov  "); prs(dr); prs(", ");
  4840                                  
  4841 00002477 68[DA24]                 push doreg_0
  4842 0000247A E86722                   call prs
  4843 0000247D 83C402                   add  sp, 2
  4844 00002480 FF7604                   push word [bp+4]
  4845 00002483 E85E22                   call prs
  4846 00002486 83C402                   add  sp, 2
  4847 00002489 68[E324]                 push doreg_1
  4848 0000248C E85522                   call prs
  4849 0000248F 83C402                   add  sp, 2
  4850                                  
  4851                                  ;-475        if (istoken(T_CONST)) prunsign1(lexval);
  4852                                  
  4853 00002492 680101                   push 257
  4854 00002495 E81721                   call istoken
  4855 00002498 83C402                   add  sp, 2
  4856 0000249B 08C0                     or  al, al
  4857 0000249D 0F840D00                 je @@doreg255
  4858 000024A1 FF36[3600]               push word [lexval]
  4859 000024A5 E89623                   call prunsign1
  4860 000024A8 83C402                   add  sp, 2
  4861                                  
  4862                                  ;-476   else if (istoken(T_NAME )) { i=searchname(); v(i); }
  4863                                  
  4864 000024AB E92A00                   jmp @@doreg256
  4865                                  @@doreg255:
  4866 000024AE 680001                   push 256
  4867 000024B1 E8FB20                   call istoken
  4868 000024B4 83C402                   add  sp, 2
  4869 000024B7 08C0                     or  al, al
  4870 000024B9 0F841200                 je @@doreg257
  4871 000024BD E8EAE1                   call searchname
  4872 000024C0 8946FE                   mov [bp-2], ax
  4873 000024C3 FF76FE                   push word [bp-2]
  4874 000024C6 E8F5DB                   call v
  4875 000024C9 83C402                   add  sp, 2
  4876                                  
  4877                                  ;-477   else error1("only number or var allowed"); }
  4878                                  
  4879 000024CC E90900                   jmp @@doreg258
  4880                                  @@doreg257:
  4881 000024CF 68[E624]                 push doreg_2
  4882 000024D2 E8F824                   call error1
  4883 000024D5 83C402                   add  sp, 2
  4884                                  @@doreg258:
  4885                                  @@doreg256:
  4886                                  
  4887                                  ;-478 
  4888                                  
  4889                                  
  4890                                  ;-479 int doassign(int mode, int i, int ixarr, int ixconst) {
  4891 000024D8 C9                       LEAVE
  4892 000024D9 C3                       ret
  4893                                  ; ENDP
  4894 000024DA 5C6E206D6F76202000      doreg_0 db "\n mov  ",0
  4895 000024E3 2C2000                  doreg_1 db ", ",0
  4896 000024E6 6F6E6C79206E756D62-     doreg_2 db "only number or var allowed",0
  4897 000024EF 6572206F7220766172-
  4898 000024F8 20616C6C6F77656400 
  4899                                  
  4900                                  doassign:  ; *** PROC ***
  4901                                  
  4902                                  ;-480   gettypes(i);
  4903                                  
  4904                                  ;Function : doassign, Number of local variables: 4
  4905                                  ;   # type sign width addr used name   list of local variables
  4906                                  ;  200 var sign word   479 NULL mode = bp+4
  4907                                  ;  201 var sign word   479 NULL i = bp+6
  4908                                  ;  202 var sign word   479 NULL ixarr = bp+8
  4909                                  ;  203 var sign word   479 NULL ixconst = bp+10;
  4910 00002501 C8000000                 ENTER  0,0
  4911 00002505 FF7606                   push word [bp+6]
  4912 00002508 E861E0                   call gettypes
  4913 0000250B 83C402                   add  sp, 2
  4914                                  
  4915                                  ;-481   if (mode==1) {prs("\n mov  bx, ");v(i);                  
  4916                                  
  4917 0000250E 8B4604                   mov ax, [bp+4]
  4918 00002511 83F801                   cmp ax, 1
  4919 00002514 0F853400                 jne @@doassign259
  4920 00002518 68[9E26]                 push doassign_0
  4921 0000251B E8C621                   call prs
  4922 0000251E 83C402                   add  sp, 2
  4923 00002521 FF7606                   push word [bp+6]
  4924 00002524 E897DB                   call v
  4925 00002527 83C402                   add  sp, 2
  4926                                  
  4927                                  ;-482     if (widthi == 2) prs("\n mov  [bx], ax");
  4928                                  
  4929 0000252A A1[3E00]                 mov ax, [widthi]
  4930 0000252D 83F802                   cmp ax, 2
  4931 00002530 0F850C00                 jne @@doassign260
  4932 00002534 68[AB26]                 push doassign_1
  4933 00002537 E8AA21                   call prs
  4934 0000253A 83C402                   add  sp, 2
  4935                                  
  4936                                  ;-483     else  prs("\n mov  [bx], al"); return;}
  4937                                  
  4938 0000253D E90900                   jmp @@doassign261
  4939                                  @@doassign260:
  4940 00002540 68[BC26]                 push doassign_2
  4941 00002543 E89E21                   call prs
  4942 00002546 83C402                   add  sp, 2
  4943                                  @@doassign261:
  4944 00002549 E95001                   jmp @@retn
  4945                                  
  4946                                  ;-484   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  4947                                  
  4948                                  @@doassign259:
  4949 0000254C 8B4604                   mov ax, [bp+4]
  4950 0000254F 83F802                   cmp ax, 2
  4951 00002552 0F851E00                 jne @@doassign262
  4952 00002556 68[CD26]                 push doassign_3
  4953 00002559 E88821                   call prs
  4954 0000255C 83C402                   add  sp, 2
  4955 0000255F FF7606                   push word [bp+6]
  4956 00002562 E84ADB                   call a
  4957 00002565 83C402                   add  sp, 2
  4958 00002568 68[D626]                 push doassign_4
  4959 0000256B E87621                   call prs
  4960 0000256E 83C402                   add  sp, 2
  4961 00002571 E92801                   jmp @@retn
  4962                                  
  4963                                  ;-485   if (ixarr) {  prs("\n mov bx, ");
  4964                                  
  4965                                  @@doassign262:
  4966 00002574 8B4608                   mov ax, [bp+8]
  4967 00002577 08C0                     or  al, al
  4968 00002579 0F846E00                 je @@doassign263
  4969 0000257D 68[DB26]                 push doassign_5
  4970 00002580 E86121                   call prs
  4971 00002583 83C402                   add  sp, 2
  4972                                  
  4973                                  ;-486     if(ixconst) prunsign1(ixarr); else v(ixarr);
  4974                                  
  4975 00002586 8B460A                   mov ax, [bp+10]
  4976 00002589 08C0                     or  al, al
  4977 0000258B 0F840C00                 je @@doassign264
  4978 0000258F FF7608                   push word [bp+8]
  4979 00002592 E8A922                   call prunsign1
  4980 00002595 83C402                   add  sp, 2
  4981 00002598 E90900                   jmp @@doassign265
  4982                                  @@doassign264:
  4983 0000259B FF7608                   push word [bp+8]
  4984 0000259E E81DDB                   call v
  4985 000025A1 83C402                   add  sp, 2
  4986                                  
  4987                                  ;-487     if (wi==2) prs("\n shl bx, 1");
  4988                                  
  4989                                  @@doassign265:
  4990 000025A4 A1[4100]                 mov ax, [wi]
  4991 000025A7 83F802                   cmp ax, 2
  4992 000025AA 0F850900                 jne @@doassign266
  4993 000025AE 68[E726]                 push doassign_6
  4994 000025B1 E83021                   call prs
  4995 000025B4 83C402                   add  sp, 2
  4996                                  
  4997                                  ;-488     prs("\n mov ["); printName(i);
  4998                                  
  4999                                  @@doassign266:
  5000 000025B7 68[F426]                 push doassign_7
  5001 000025BA E82721                   call prs
  5002 000025BD 83C402                   add  sp, 2
  5003 000025C0 FF7606                   push word [bp+6]
  5004 000025C3 E880E0                   call printName
  5005 000025C6 83C402                   add  sp, 2
  5006                                  
  5007                                  ;-489     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  5008                                  
  5009 000025C9 A1[4100]                 mov ax, [wi]
  5010 000025CC 83F802                   cmp ax, 2
  5011 000025CF 0F850C00                 jne @@doassign267
  5012 000025D3 68[FD26]                 push doassign_8
  5013 000025D6 E80B21                   call prs
  5014 000025D9 83C402                   add  sp, 2
  5015 000025DC E90900                   jmp @@doassign268
  5016                                  @@doassign267:
  5017 000025DF 68[0627]                 push doassign_9
  5018 000025E2 E8FF20                   call prs
  5019 000025E5 83C402                   add  sp, 2
  5020                                  @@doassign268:
  5021 000025E8 E9B100                   jmp @@retn
  5022                                  
  5023                                  ;-490   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
  5024                                  
  5025                                  @@doassign263:
  5026 000025EB A1[4100]                 mov ax, [wi]
  5027 000025EE 83F801                   cmp ax, 1
  5028 000025F1 0F853100                 jne @@doassign269
  5029 000025F5 68[0F27]                 push doassign_10
  5030 000025F8 E8E920                   call prs
  5031 000025FB 83C402                   add  sp, 2
  5032 000025FE 8B4606                   mov ax, [bp+6]
  5033 00002601 3DC800                   cmp ax, 200
  5034 00002604 0F8D0900                 jge @@doassign270
  5035 00002608 68[1727]                 push doassign_11
  5036 0000260B E8D620                   call prs
  5037 0000260E 83C402                   add  sp, 2
  5038                                  
  5039                                  ;-491     } v(i); prs(", al"); return; }
  5040                                  
  5041                                  @@doassign270:
  5042 00002611 FF7606                   push word [bp+6]
  5043 00002614 E8A7DA                   call v
  5044 00002617 83C402                   add  sp, 2
  5045 0000261A 68[1D27]                 push doassign_12
  5046 0000261D E8C420                   call prs
  5047 00002620 83C402                   add  sp, 2
  5048 00002623 E97600                   jmp @@retn
  5049                                  
  5050                                  ;-492   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
  5051                                  
  5052                                  @@doassign269:
  5053 00002626 A1[4100]                 mov ax, [wi]
  5054 00002629 83F802                   cmp ax, 2
  5055 0000262C 0F853100                 jne @@doassign271
  5056 00002630 68[2227]                 push doassign_13
  5057 00002633 E8AE20                   call prs
  5058 00002636 83C402                   add  sp, 2
  5059 00002639 8B4606                   mov ax, [bp+6]
  5060 0000263C 3DC800                   cmp ax, 200
  5061 0000263F 0F8D0900                 jge @@doassign272
  5062 00002643 68[2A27]                 push doassign_14
  5063 00002646 E89B20                   call prs
  5064 00002649 83C402                   add  sp, 2
  5065                                  
  5066                                  ;-493     } v(i); prs(", ax"); return; }
  5067                                  
  5068                                  @@doassign272:
  5069 0000264C FF7606                   push word [bp+6]
  5070 0000264F E86CDA                   call v
  5071 00002652 83C402                   add  sp, 2
  5072 00002655 68[3027]                 push doassign_15
  5073 00002658 E88920                   call prs
  5074 0000265B 83C402                   add  sp, 2
  5075 0000265E E93B00                   jmp @@retn
  5076                                  
  5077                                  ;-494   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
  5078                                  
  5079                                  @@doassign271:
  5080 00002661 A1[4100]                 mov ax, [wi]
  5081 00002664 83F804                   cmp ax, 4
  5082 00002667 0F853100                 jne @@doassign273
  5083 0000266B 68[3527]                 push doassign_16
  5084 0000266E E87320                   call prs
  5085 00002671 83C402                   add  sp, 2
  5086 00002674 8B4606                   mov ax, [bp+6]
  5087 00002677 3DC800                   cmp ax, 200
  5088 0000267A 0F8D0900                 jge @@doassign274
  5089 0000267E 68[3D27]                 push doassign_17
  5090 00002681 E86020                   call prs
  5091 00002684 83C402                   add  sp, 2
  5092                                  
  5093                                  ;-495     } v(i); prs(", eax"); return; }
  5094                                  
  5095                                  @@doassign274:
  5096 00002687 FF7606                   push word [bp+6]
  5097 0000268A E831DA                   call v
  5098 0000268D 83C402                   add  sp, 2
  5099 00002690 68[4427]                 push doassign_18
  5100 00002693 E84E20                   call prs
  5101 00002696 83C402                   add  sp, 2
  5102 00002699 E90000                   jmp @@retn
  5103                                  
  5104                                  ;-496 }
  5105                                  
  5106                                  @@doassign273:
  5107                                  
  5108                                  ;-497 int domul(int ids) {
  5109                                  
  5110 0000269C C9                      @@retn: LEAVE
  5111 0000269D C3                       ret
  5112                                  ; ENDP
  5113 0000269E 5C6E206D6F76202062-     doassign_0 db "\n mov  bx, ",0
  5114 000026A7 782C2000           
  5115 000026AB 5C6E206D6F7620205B-     doassign_1 db "\n mov  [bx], ax",0
  5116 000026B4 62785D2C20617800   
  5117 000026BC 5C6E206D6F7620205B-     doassign_2 db "\n mov  [bx], al",0
  5118 000026C5 62785D2C20616C00   
  5119 000026CD 5C6E206D6F76202000      doassign_3 db "\n mov  ",0
  5120 000026D6 2C20617800              doassign_4 db ", ax",0
  5121 000026DB 5C6E206D6F76206278-     doassign_5 db "\n mov bx, ",0
  5122 000026E4 2C2000             
  5123 000026E7 5C6E2073686C206278-     doassign_6 db "\n shl bx, 1",0
  5124 000026F0 2C203100           
  5125 000026F4 5C6E206D6F76205B00      doassign_7 db "\n mov [",0
  5126 000026FD 2B62785D2C20617800      doassign_8 db "+bx], ax",0
  5127 00002706 2B62785D2C20616C00      doassign_9 db "+bx], al",0
  5128 0000270F 5C6E206D6F762000        doassign_10 db "\n mov ",0
  5129 00002717 627974652000            doassign_11 db "byte ",0
  5130 0000271D 2C20616C00              doassign_12 db ", al",0
  5131 00002722 5C6E206D6F762000        doassign_13 db "\n mov ",0
  5132 0000272A 776F72642000            doassign_14 db "word ",0
  5133 00002730 2C20617800              doassign_15 db ", ax",0
  5134 00002735 5C6E206D6F762000        doassign_16 db "\n mov ",0
  5135 0000273D 64776F72642000          doassign_17 db "dword ",0
  5136 00002744 2C2065617800            doassign_18 db ", eax",0
  5137                                  
  5138                                  domul:  ; *** PROC ***
  5139                                  
  5140                                  ;-498   if (ids) rterm("imul"); else {
  5141                                  
  5142                                  ;Function : domul, Number of local variables: 1
  5143                                  ;   # type sign width addr used name   list of local variables
  5144                                  ;  200 var sign word   497 NULL ids = bp+4;
  5145 0000274A C8000000                 ENTER  0,0
  5146 0000274E 8B4604                   mov ax, [bp+4]
  5147 00002751 08C0                     or  al, al
  5148 00002753 0F840C00                 je @@domul275
  5149 00002757 68[9C27]                 push domul_0
  5150 0000275A E899F9                   call rterm
  5151 0000275D 83C402                   add  sp, 2
  5152 00002760 E93700                   jmp @@domul276
  5153                                  @@domul275:
  5154                                  
  5155                                  ;-499   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  5156                                  
  5157 00002763 680101                   push 257
  5158 00002766 E8461E                   call istoken
  5159 00002769 83C402                   add  sp, 2
  5160 0000276C 08C0                     or  al, al
  5161 0000276E 0F841F00                 je @@domul277
  5162 00002772 68[A127]                 push domul_1
  5163 00002775 E86C1F                   call prs
  5164 00002778 83C402                   add  sp, 2
  5165 0000277B FF36[3600]               push word [lexval]
  5166 0000277F E8BC20                   call prunsign1
  5167 00002782 83C402                   add  sp, 2
  5168 00002785 68[AD27]                 push domul_2
  5169 00002788 E8591F                   call prs
  5170 0000278B 83C402                   add  sp, 2
  5171                                  
  5172                                  ;-500   else error1("with MUL only const number as multiplicator allowed"); } }
  5173                                  
  5174 0000278E E90900                   jmp @@domul278
  5175                                  @@domul277:
  5176 00002791 68[B727]                 push domul_3
  5177 00002794 E83622                   call error1
  5178 00002797 83C402                   add  sp, 2
  5179                                  @@domul278:
  5180                                  @@domul276:
  5181                                  
  5182                                  ;-501 int doidiv(int ids) { int mode; int id1;
  5183 0000279A C9                       LEAVE
  5184 0000279B C3                       ret
  5185                                  ; ENDP
  5186 0000279C 696D756C00              domul_0 db "imul",0
  5187 000027A1 5C6E206D6F76206278-     domul_1 db "\n mov bx, ",0
  5188 000027AA 2C2000             
  5189 000027AD 5C6E206D756C206278-     domul_2 db "\n mul bx",0
  5190 000027B6 00                 
  5191 000027B7 77697468204D554C20-     domul_3 db "with MUL only const number as multiplicator allowed",0
  5192 000027C0 6F6E6C7920636F6E73-
  5193 000027C9 74206E756D62657220-
  5194 000027D2 6173206D756C746970-
  5195 000027DB 6C696361746F722061-
  5196 000027E4 6C6C6F77656400     
  5197                                  
  5198                                  doidiv:  ; *** PROC ***
  5199                                  
  5200                                  ;-502   if (istoken(T_CONST)) {
  5201                                  
  5202                                  ;Function : doidiv, Number of local variables: 3
  5203                                  ;   # type sign width addr used name   list of local variables
  5204                                  ;  200 var sign word   501 NULL ids = bp+4
  5205                                  ;  201 var sign word   501 NULL mode = bp-2
  5206                                  ;  202 var sign word   501 NULL id1 = bp-4;
  5207 000027EB C8040000                 ENTER  4,0
  5208 000027EF 680101                   push 257
  5209 000027F2 E8BA1D                   call istoken
  5210 000027F5 83C402                   add  sp, 2
  5211 000027F8 08C0                     or  al, al
  5212 000027FA 0F843400                 je @@doidiv279
  5213                                  
  5214                                  ;-503     prs("\n mov bx, "); prunsign1(lexval);
  5215                                  
  5216 000027FE 68[B028]                 push doidiv_0
  5217 00002801 E8E01E                   call prs
  5218 00002804 83C402                   add  sp, 2
  5219 00002807 FF36[3600]               push word [lexval]
  5220 0000280B E83020                   call prunsign1
  5221 0000280E 83C402                   add  sp, 2
  5222                                  
  5223                                  ;-504     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5224                                  
  5225 00002811 8B4604                   mov ax, [bp+4]
  5226 00002814 08C0                     or  al, al
  5227 00002816 0F840C00                 je @@doidiv280
  5228 0000281A 68[BC28]                 push doidiv_1
  5229 0000281D E8C41E                   call prs
  5230 00002820 83C402                   add  sp, 2
  5231 00002823 E90900                   jmp @@doidiv281
  5232                                  @@doidiv280:
  5233 00002826 68[CD28]                 push doidiv_2
  5234 00002829 E8B81E                   call prs
  5235 0000282C 83C402                   add  sp, 2
  5236                                  @@doidiv281:
  5237                                  
  5238                                  ;-505   else {
  5239                                  
  5240 0000282F E97C00                   jmp @@doidiv282
  5241                                  @@doidiv279:
  5242                                  
  5243                                  ;-506     mode=typeName(); id1=searchname();
  5244                                  
  5245 00002832 E844DF                   call typeName
  5246 00002835 8946FE                   mov [bp-2], ax
  5247 00002838 E86FDE                   call searchname
  5248 0000283B 8946FC                   mov [bp-4], ax
  5249                                  
  5250                                  ;-507     if (mode) error1("only const number or int as divisor allowed");
  5251                                  
  5252 0000283E 8B46FE                   mov ax, [bp-2]
  5253 00002841 08C0                     or  al, al
  5254 00002843 0F840900                 je @@doidiv283
  5255 00002847 68[E328]                 push doidiv_3
  5256 0000284A E88021                   call error1
  5257 0000284D 83C402                   add  sp, 2
  5258                                  
  5259                                  ;-508     gettypes(id1);
  5260                                  
  5261                                  @@doidiv283:
  5262 00002850 FF76FC                   push word [bp-4]
  5263 00002853 E816DD                   call gettypes
  5264 00002856 83C402                   add  sp, 2
  5265                                  
  5266                                  ;-509     if (typei) error1("only int as simple var divisor allowed");
  5267                                  
  5268 00002859 A1[3800]                 mov ax, [typei]
  5269 0000285C 08C0                     or  al, al
  5270 0000285E 0F840900                 je @@doidiv284
  5271 00002862 68[0F29]                 push doidiv_4
  5272 00002865 E86521                   call error1
  5273 00002868 83C402                   add  sp, 2
  5274                                  
  5275                                  ;-510     if (wi!=2) error1("only int, no byte as divisor allowed");
  5276                                  
  5277                                  @@doidiv284:
  5278 0000286B A1[4100]                 mov ax, [wi]
  5279 0000286E 83F802                   cmp ax, 2
  5280 00002871 0F840900                 je  @@doidiv285
  5281 00002875 68[3629]                 push doidiv_5
  5282 00002878 E85221                   call error1
  5283 0000287B 83C402                   add  sp, 2
  5284                                  
  5285                                  ;-511     prs("\n mov bx, "); v(id1);
  5286                                  
  5287                                  @@doidiv285:
  5288 0000287E 68[5B29]                 push doidiv_6
  5289 00002881 E8601E                   call prs
  5290 00002884 83C402                   add  sp, 2
  5291 00002887 FF76FC                   push word [bp-4]
  5292 0000288A E831D8                   call v
  5293 0000288D 83C402                   add  sp, 2
  5294                                  
  5295                                  ;-512     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  5296                                  
  5297 00002890 8B4604                   mov ax, [bp+4]
  5298 00002893 08C0                     or  al, al
  5299 00002895 0F840C00                 je @@doidiv286
  5300 00002899 68[6729]                 push doidiv_7
  5301 0000289C E8451E                   call prs
  5302 0000289F 83C402                   add  sp, 2
  5303 000028A2 E90900                   jmp @@doidiv287
  5304                                  @@doidiv286:
  5305 000028A5 68[7829]                 push doidiv_8
  5306 000028A8 E8391E                   call prs
  5307 000028AB 83C402                   add  sp, 2
  5308                                  @@doidiv287:
  5309                                  
  5310                                  ;-513 }
  5311                                  
  5312                                  @@doidiv282:
  5313                                  
  5314                                  ;-514 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
  5315 000028AE C9                       LEAVE
  5316 000028AF C3                       ret
  5317                                  ; ENDP
  5318 000028B0 5C6E206D6F76206278-     doidiv_0 db "\n mov bx, ",0
  5319 000028B9 2C2000             
  5320 000028BC 5C6E206377645C6E20-     doidiv_1 db "\n cwd\n idiv bx",0
  5321 000028C5 6964697620627800   
  5322 000028CD 5C6E206D6F76206478-     doidiv_2 db "\n mov dx, 0\n div bx",0
  5323 000028D6 2C20305C6E20646976-
  5324 000028DF 20627800           
  5325 000028E3 6F6E6C7920636F6E73-     doidiv_3 db "only const number or int as divisor allowed",0
  5326 000028EC 74206E756D62657220-
  5327 000028F5 6F7220696E74206173-
  5328 000028FE 2064697669736F7220-
  5329 00002907 616C6C6F77656400   
  5330 0000290F 6F6E6C7920696E7420-     doidiv_4 db "only int as simple var divisor allowed",0
  5331 00002918 61732073696D706C65-
  5332 00002921 207661722064697669-
  5333 0000292A 736F7220616C6C6F77-
  5334 00002933 656400             
  5335 00002936 6F6E6C7920696E742C-     doidiv_5 db "only int, no byte as divisor allowed",0
  5336 0000293F 206E6F206279746520-
  5337 00002948 61732064697669736F-
  5338 00002951 7220616C6C6F776564-
  5339 0000295A 00                 
  5340 0000295B 5C6E206D6F76206278-     doidiv_6 db "\n mov bx, ",0
  5341 00002964 2C2000             
  5342 00002967 5C6E206377645C6E20-     doidiv_7 db "\n cwd\n idiv bx",0
  5343 00002970 6964697620627800   
  5344 00002978 5C6E206D6F76206478-     doidiv_8 db "\n mov dx, 0\n div bx",0
  5345 00002981 2C20305C6E20646976-
  5346 0000298A 20627800           
  5347                                  
  5348                                  domod:  ; *** PROC ***
  5349                                  ;Function : domod, Number of local variables: 1
  5350                                  ;   # type sign width addr used name   list of local variables
  5351                                  ;  200 var sign word   514 NULL ids = bp+4;
  5352 0000298E C8000000                 ENTER  0,0
  5353 00002992 FF7604                   push word [bp+4]
  5354 00002995 E853FE                   call doidiv
  5355 00002998 83C402                   add  sp, 2
  5356 0000299B 68[A629]                 push domod_0
  5357 0000299E E8431D                   call prs
  5358 000029A1 83C402                   add  sp, 2
  5359                                  
  5360                                  ;-515 
  5361                                  
  5362                                  
  5363                                  ;-516 int docalltype[10]; int docallvalue[10];
  5364 000029A4 C9                       LEAVE
  5365 000029A5 C3                       ret
  5366                                  ; ENDP
  5367 000029A6 5C6E206D6F76206178-     domod_0 db "\n mov ax, dx",0
  5368 000029AF 2C20647800         
  5369                                  section .bss
  5370                                  absolute 53411
  5371 0000D0A3 <res 00000014>          docalltype resw 10
  5372                                  section .text
  5373                                  section .bss
  5374                                  absolute 53431
  5375 0000D0B7 <res 00000014>          docallvalue resw 10
  5376                                  section .text
  5377                                  
  5378                                  ;-517 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
  5379                                  
  5380                                  section .bss
  5381                                  absolute 53451
  5382 0000D0CB <res 00000011>          procname resb 17
  5383                                  section .text
  5384                                  
  5385                                  ;-518 int docall1() {int i; int narg; int t0; int n0;  int sz32;
  5386                                  
  5387                                  
  5388                                  docall1:  ; *** PROC ***
  5389                                  
  5390                                  ;-519   narg=0;  sz32=0;
  5391                                  
  5392                                  ;Function : docall1, Number of local variables: 5
  5393                                  ;   # type sign width addr used name   list of local variables
  5394                                  ;  200 var sign word   518 NULL i = bp-2
  5395                                  ;  201 var sign word   518 NULL narg = bp-4
  5396                                  ;  202 var sign word   518 NULL t0 = bp-6
  5397                                  ;  203 var sign word   518 NULL n0 = bp-8
  5398                                  ;  204 var sign word   518 NULL sz32 = bp-10;
  5399 000029B4 C80A0000                 ENTER  10,0
  5400 000029B8 B80000                   mov ax, 0
  5401 000029BB 8946FC                   mov [bp-4], ax
  5402 000029BE B80000                   mov ax, 0
  5403 000029C1 8946F6                   mov [bp-10], ax
  5404                                  
  5405                                  ;-520   checknamelen();
  5406                                  
  5407 000029C4 E82AD7                   call checknamelen
  5408                                  
  5409                                  ;-521   strcpy(&procname, symbol);
  5410                                  
  5411 000029C7 8D062B81                 lea  ax, [symbol]
  5412 000029CB 50                       push ax
  5413 000029CC 8D06CBD0                 lea  ax, [procname]
  5414 000029D0 50                       push ax
  5415 000029D1 E8B62C                   call strcpy
  5416 000029D4 83C404                   add  sp, 4
  5417                                  
  5418                                  ;-522   storecall();
  5419                                  
  5420 000029D7 E8D0DE                   call storecall
  5421                                  
  5422                                  ;-523   expect('(');
  5423                                  
  5424 000029DA 6A28                     push 40
  5425 000029DC E8F21B                   call expect
  5426 000029DF 83C402                   add  sp, 2
  5427                                  
  5428                                  ;-524 	if (istoken(')') ==0 ) {
  5429                                  
  5430 000029E2 6A29                     push 41
  5431 000029E4 E8C81B                   call istoken
  5432 000029E7 83C402                   add  sp, 2
  5433 000029EA 83F800                   cmp ax, 0
  5434 000029ED 0F857802                 jne @@docall1288
  5435                                  
  5436                                  ;-525 	  do { narg++;
  5437                                  
  5438                                  @@docall1289:
  5439 000029F1 FF46FC                   inc  word[bp-4]
  5440                                  
  5441                                  ;-526 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
  5442                                  
  5443 000029F4 8B46FC                   mov ax, [bp-4]
  5444 000029F7 83F809                   cmp ax, 9
  5445 000029FA 0F8E0900                 jle @@docall1290
  5446 000029FE 68[AD2C]                 push docall1_0
  5447 00002A01 E8C91F                   call error1
  5448 00002A04 83C402                   add  sp, 2
  5449                                  @@docall1290:
  5450 00002A07 B80000                   mov ax, 0
  5451 00002A0A 8946FA                   mov [bp-6], ax
  5452                                  
  5453                                  ;-527       if(istoken(T_CONST)) {t0=1; n0=lexval; }
  5454                                  
  5455 00002A0D 680101                   push 257
  5456 00002A10 E89C1B                   call istoken
  5457 00002A13 83C402                   add  sp, 2
  5458 00002A16 08C0                     or  al, al
  5459 00002A18 0F840C00                 je @@docall1291
  5460 00002A1C B80100                   mov ax, 1
  5461 00002A1F 8946FA                   mov [bp-6], ax
  5462 00002A22 A1[3600]                 mov ax, [lexval]
  5463 00002A25 8946F8                   mov [bp-8], ax
  5464                                  
  5465                                  ;-528       if(istoken(T_STRING)){t0=2; n0=nconst;
  5466                                  
  5467                                  @@docall1291:
  5468 00002A28 680201                   push 258
  5469 00002A2B E8811B                   call istoken
  5470 00002A2E 83C402                   add  sp, 2
  5471 00002A31 08C0                     or  al, al
  5472 00002A33 0F846300                 je @@docall1292
  5473 00002A37 B80200                   mov ax, 2
  5474 00002A3A 8946FA                   mov [bp-6], ax
  5475 00002A3D A1[2A00]                 mov ax, [nconst]
  5476 00002A40 8946F8                   mov [bp-8], ax
  5477                                  
  5478                                  ;-529         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
  5479                                  
  5480 00002A43 68[BF2C]                 push docall1_1
  5481 00002A46 E8061C                   call eprs
  5482 00002A49 83C402                   add  sp, 2
  5483 00002A4C 8D06AB81                 lea  ax, [fname]
  5484 00002A50 50                       push ax
  5485 00002A51 E8FB1B                   call eprs
  5486 00002A54 83C402                   add  sp, 2
  5487 00002A57 6A5F                     push 95
  5488 00002A59 E8E01B                   call eprc
  5489 00002A5C 83C402                   add  sp, 2
  5490 00002A5F FF36[2A00]               push word [nconst]
  5491 00002A63 E8121D                   call eprnum
  5492 00002A66 83C402                   add  sp, 2
  5493 00002A69 68[C22C]                 push docall1_2
  5494 00002A6C E8E01B                   call eprs
  5495 00002A6F 83C402                   add  sp, 2
  5496                                  
  5497                                  ;-530         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
  5498                                  
  5499 00002A72 6A22                     push 34
  5500 00002A74 E8C51B                   call eprc
  5501 00002A77 83C402                   add  sp, 2
  5502 00002A7A 8D062B81                 lea  ax, [symbol]
  5503 00002A7E 50                       push ax
  5504 00002A7F E8CD1B                   call eprs
  5505 00002A82 83C402                   add  sp, 2
  5506 00002A85 6A22                     push 34
  5507 00002A87 E8B21B                   call eprc
  5508 00002A8A 83C402                   add  sp, 2
  5509 00002A8D 68[C72C]                 push docall1_3
  5510 00002A90 E8BC1B                   call eprs
  5511 00002A93 83C402                   add  sp, 2
  5512 00002A96 FF06[2A00]               inc  word[nconst]
  5513                                  
  5514                                  ;-531       if(istoken('&'))     {t0=3; name1(); n0=searchname();}
  5515                                  
  5516                                  @@docall1292:
  5517 00002A9A 6A26                     push 38
  5518 00002A9C E8101B                   call istoken
  5519 00002A9F 83C402                   add  sp, 2
  5520 00002AA2 08C0                     or  al, al
  5521 00002AA4 0F840F00                 je @@docall1293
  5522 00002AA8 B80300                   mov ax, 3
  5523 00002AAB 8946FA                   mov [bp-6], ax
  5524 00002AAE E8D1DD                   call name1
  5525 00002AB1 E8F6DB                   call searchname
  5526 00002AB4 8946F8                   mov [bp-8], ax
  5527                                  
  5528                                  ;-532       if(istoken(T_NAME))  { n0=checkreg();
  5529                                  
  5530                                  @@docall1293:
  5531 00002AB7 680001                   push 256
  5532 00002ABA E8F21A                   call istoken
  5533 00002ABD 83C402                   add  sp, 2
  5534 00002AC0 08C0                     or  al, al
  5535 00002AC2 0F844800                 je @@docall1294
  5536 00002AC6 E8DFEA                   call checkreg
  5537 00002AC9 8946F8                   mov [bp-8], ax
  5538                                  
  5539                                  ;-533         if (n0) t0=5;
  5540                                  
  5541 00002ACC 8B46F8                   mov ax, [bp-8]
  5542 00002ACF 08C0                     or  al, al
  5543 00002AD1 0F840900                 je @@docall1295
  5544 00002AD5 B80500                   mov ax, 5
  5545 00002AD8 8946FA                   mov [bp-6], ax
  5546                                  
  5547                                  ;-534         else {t0=4; n0=searchname();
  5548                                  
  5549 00002ADB E93000                   jmp @@docall1296
  5550                                  @@docall1295:
  5551 00002ADE B80400                   mov ax, 4
  5552 00002AE1 8946FA                   mov [bp-6], ax
  5553 00002AE4 E8C3DB                   call searchname
  5554 00002AE7 8946F8                   mov [bp-8], ax
  5555                                  
  5556                                  ;-535           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
  5557                                  
  5558 00002AEA B8B782                   mov ax, GType
  5559 00002AED A3[7400]                 mov word [p1], ax
  5560 00002AF0 A1[7400]                 mov ax, [p1]
  5561 00002AF3 0346F8                   add ax, [bp-8]
  5562 00002AF6 A3[7400]                 mov word [p1], ax
  5563 00002AF9 8B1E[7400]               mov bx, [p1]
  5564 00002AFD 8A07                     mov al, [bx]
  5565 00002AFF B400                     mov ah, 0
  5566 00002B01 83F826                   cmp ax, 38
  5567 00002B04 0F850600                 jne @@docall1297
  5568 00002B08 B80300                   mov ax, 3
  5569 00002B0B 8946FA                   mov [bp-6], ax
  5570                                  @@docall1297:
  5571                                  @@docall1296:
  5572                                  
  5573                                  ;-536       if (t0==0) error1("parameter not recognized (no * allowed)");
  5574                                  
  5575                                  @@docall1294:
  5576 00002B0E 8B46FA                   mov ax, [bp-6]
  5577 00002B11 83F800                   cmp ax, 0
  5578 00002B14 0F850900                 jne @@docall1298
  5579 00002B18 68[CA2C]                 push docall1_4
  5580 00002B1B E8AF1E                   call error1
  5581 00002B1E 83C402                   add  sp, 2
  5582                                  
  5583                                  ;-537       docalltype [narg] = t0;
  5584                                  
  5585                                  @@docall1298:
  5586 00002B21 8B46FA                   mov ax, [bp-6]
  5587 00002B24 8B5EFC                   mov bx, [bp-4]
  5588 00002B27 D1E3                     shl bx, 1
  5589 00002B29 8987A3D0                 mov [docalltype+bx], ax
  5590                                  
  5591                                  ;-538       docallvalue[narg] = n0;
  5592                                  
  5593 00002B2D 8B46F8                   mov ax, [bp-8]
  5594 00002B30 8B5EFC                   mov bx, [bp-4]
  5595 00002B33 D1E3                     shl bx, 1
  5596 00002B35 8987B7D0                 mov [docallvalue+bx], ax
  5597                                  
  5598                                  ;-539     } while (istoken(','));
  5599                                  
  5600 00002B39 6A2C                     push 44
  5601 00002B3B E8711A                   call istoken
  5602 00002B3E 83C402                   add  sp, 2
  5603 00002B41 08C0                     or  al, al
  5604 00002B43 0F840300                 je @@docall1299
  5605 00002B47 E9A7FE                   jmp @@docall1289
  5606                                  @@docall1299:
  5607                                  
  5608                                  ;-540     
  5609                                  
  5610                                  
  5611                                  ;-541   	expect(')');  i=narg;
  5612                                  
  5613 00002B4A 6A29                     push 41
  5614 00002B4C E8821A                   call expect
  5615 00002B4F 83C402                   add  sp, 2
  5616 00002B52 8B46FC                   mov ax, [bp-4]
  5617 00002B55 8946FE                   mov [bp-2], ax
  5618                                  
  5619                                  ;-542     do {
  5620                                  
  5621                                  @@docall1300:
  5622                                  
  5623                                  ;-543       t0 = docalltype [i];
  5624                                  
  5625 00002B58 8B5EFE                   mov bx, [bp-2]
  5626 00002B5B D1E3                     shl bx, 1
  5627 00002B5D 8B87A3D0                 mov ax, [docalltype + bx]
  5628 00002B61 8946FA                   mov [bp-6], ax
  5629                                  
  5630                                  ;-544       n0 = docallvalue[i];     
  5631                                  
  5632 00002B64 8B5EFE                   mov bx, [bp-2]
  5633 00002B67 D1E3                     shl bx, 1
  5634 00002B69 8B87B7D0                 mov ax, [docallvalue + bx]
  5635 00002B6D 8946F8                   mov [bp-8], ax
  5636                                  
  5637                                  ;-545       if(t0==1){ prs("\n push "); pint1(n0);}
  5638                                  
  5639 00002B70 8B46FA                   mov ax, [bp-6]
  5640 00002B73 83F801                   cmp ax, 1
  5641 00002B76 0F851200                 jne @@docall1301
  5642 00002B7A 68[F22C]                 push docall1_5
  5643 00002B7D E8641B                   call prs
  5644 00002B80 83C402                   add  sp, 2
  5645 00002B83 FF76F8                   push word [bp-8]
  5646 00002B86 E8521C                   call pint1
  5647 00002B89 83C402                   add  sp, 2
  5648                                  
  5649                                  ;-546       if(t0==2){ prs("\n push "); 
  5650                                  
  5651                                  @@docall1301:
  5652 00002B8C 8B46FA                   mov ax, [bp-6]
  5653 00002B8F 83F802                   cmp ax, 2
  5654 00002B92 0F852500                 jne @@docall1302
  5655 00002B96 68[FB2C]                 push docall1_6
  5656 00002B99 E8481B                   call prs
  5657 00002B9C 83C402                   add  sp, 2
  5658                                  
  5659                                  ;-547         prs(fname);prc(95);pint1(n0);}
  5660                                  
  5661 00002B9F 8D06AB81                 lea  ax, [fname]
  5662 00002BA3 50                       push ax
  5663 00002BA4 E83D1B                   call prs
  5664 00002BA7 83C402                   add  sp, 2
  5665 00002BAA 6A5F                     push 95
  5666 00002BAC E8CE1A                   call prc
  5667 00002BAF 83C402                   add  sp, 2
  5668 00002BB2 FF76F8                   push word [bp-8]
  5669 00002BB5 E8231C                   call pint1
  5670 00002BB8 83C402                   add  sp, 2
  5671                                  
  5672                                  ;-548       if(t0==3){ prs("\n lea  ax, ");   v(n0);
  5673                                  
  5674                                  @@docall1302:
  5675 00002BBB 8B46FA                   mov ax, [bp-6]
  5676 00002BBE 83F803                   cmp ax, 3
  5677 00002BC1 0F851B00                 jne @@docall1303
  5678 00002BC5 68[042D]                 push docall1_7
  5679 00002BC8 E8191B                   call prs
  5680 00002BCB 83C402                   add  sp, 2
  5681 00002BCE FF76F8                   push word [bp-8]
  5682 00002BD1 E8EAD4                   call v
  5683 00002BD4 83C402                   add  sp, 2
  5684                                  
  5685                                  ;-549         prs("\n push ax");}
  5686                                  
  5687 00002BD7 68[112D]                 push docall1_8
  5688 00002BDA E8071B                   call prs
  5689 00002BDD 83C402                   add  sp, 2
  5690                                  
  5691                                  ;-550       if(t0==4){ gettypes(n0); 
  5692                                  
  5693                                  @@docall1303:
  5694 00002BE0 8B46FA                   mov ax, [bp-6]
  5695 00002BE3 83F804                   cmp ax, 4
  5696 00002BE6 0F854300                 jne @@docall1304
  5697 00002BEA FF76F8                   push word [bp-8]
  5698 00002BED E87CD9                   call gettypes
  5699 00002BF0 83C402                   add  sp, 2
  5700                                  
  5701                                  ;-551         if(wi==2) { prs("\n push word "); v(n0);}
  5702                                  
  5703 00002BF3 A1[4100]                 mov ax, [wi]
  5704 00002BF6 83F802                   cmp ax, 2
  5705 00002BF9 0F851500                 jne @@docall1305
  5706 00002BFD 68[1C2D]                 push docall1_9
  5707 00002C00 E8E11A                   call prs
  5708 00002C03 83C402                   add  sp, 2
  5709 00002C06 FF76F8                   push word [bp-8]
  5710 00002C09 E8B2D4                   call v
  5711 00002C0C 83C402                   add  sp, 2
  5712                                  
  5713                                  ;-552         else { prs("\n mov al, byte ");   v(n0);
  5714                                  
  5715 00002C0F E91B00                   jmp @@docall1306
  5716                                  @@docall1305:
  5717 00002C12 68[2A2D]                 push docall1_10
  5718 00002C15 E8CC1A                   call prs
  5719 00002C18 83C402                   add  sp, 2
  5720 00002C1B FF76F8                   push word [bp-8]
  5721 00002C1E E89DD4                   call v
  5722 00002C21 83C402                   add  sp, 2
  5723                                  
  5724                                  ;-553         prs("\n mov ah, 0\n push ax"); } }
  5725                                  
  5726 00002C24 68[3B2D]                 push docall1_11
  5727 00002C27 E8BA1A                   call prs
  5728 00002C2A 83C402                   add  sp, 2
  5729                                  @@docall1306:
  5730                                  
  5731                                  ;-554       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
  5732                                  
  5733                                  @@docall1304:
  5734 00002C2D 8B46FA                   mov ax, [bp-6]
  5735 00002C30 83F805                   cmp ax, 5
  5736 00002C33 0F852200                 jne @@docall1307
  5737 00002C37 68[522D]                 push docall1_12
  5738 00002C3A E8A71A                   call prs
  5739 00002C3D 83C402                   add  sp, 2
  5740 00002C40 FF76F8                   push word [bp-8]
  5741 00002C43 E870ED                   call printreg
  5742 00002C46 83C402                   add  sp, 2
  5743 00002C49 8B46F8                   mov ax, [bp-8]
  5744 00002C4C 83F82F                   cmp ax, 47 ;unsigned : 1
  5745 00002C4F 0F8C0600                 jl  @@docall1308
  5746 00002C53 8B46F6                   mov ax, [bp-10]
  5747 00002C56 83C002                   add ax, 2
  5748                                  @@docall1308:
  5749                                  
  5750                                  ;-555    i--; } while (i > 0);  }
  5751                                  
  5752                                  @@docall1307:
  5753 00002C59 FF4EFE                   dec  word[bp-2]
  5754 00002C5C 8B46FE                   mov ax, [bp-2]
  5755 00002C5F 83F800                   cmp ax, 0
  5756 00002C62 0F8E0300                 jle @@docall1309
  5757 00002C66 E9EFFE                   jmp @@docall1300
  5758                                  @@docall1309:
  5759                                  
  5760                                  ;-556 	 prs("\n call "); prs(&procname);
  5761                                  
  5762                                  @@docall1288:
  5763 00002C69 68[5B2D]                 push docall1_13
  5764 00002C6C E8751A                   call prs
  5765 00002C6F 83C402                   add  sp, 2
  5766 00002C72 8D06CBD0                 lea  ax, [procname]
  5767 00002C76 50                       push ax
  5768 00002C77 E86A1A                   call prs
  5769 00002C7A 83C402                   add  sp, 2
  5770                                  
  5771                                  ;-557 	 if (narg>0) {prs("\n add  sp, ");
  5772                                  
  5773 00002C7D 8B46FC                   mov ax, [bp-4]
  5774 00002C80 83F800                   cmp ax, 0
  5775 00002C83 0F8E2400                 jle @@docall1310
  5776 00002C87 68[642D]                 push docall1_14
  5777 00002C8A E8571A                   call prs
  5778 00002C8D 83C402                   add  sp, 2
  5779                                  
  5780                                  ;-558      narg=narg+narg; narg=narg+sz32; pint1(narg); } }
  5781                                  
  5782 00002C90 8B46FC                   mov ax, [bp-4]
  5783 00002C93 0346FC                   add ax, [bp-4]
  5784 00002C96 8946FC                   mov [bp-4], ax
  5785 00002C99 8B46FC                   mov ax, [bp-4]
  5786 00002C9C 0346F6                   add ax, [bp-10]
  5787 00002C9F 8946FC                   mov [bp-4], ax
  5788 00002CA2 FF76FC                   push word [bp-4]
  5789 00002CA5 E8331B                   call pint1
  5790 00002CA8 83C402                   add  sp, 2
  5791                                  @@docall1310:
  5792                                  
  5793                                  ;-559 /****************************************************************************/
  5794                                  
  5795                                  
  5796                                  ;-560 int main() {
  5797 00002CAB C9                       LEAVE
  5798 00002CAC C3                       ret
  5799                                  ; ENDP
  5800 00002CAD 4D61782E2039207061-     docall1_0 db "Max. 9 parameters",0
  5801 00002CB6 72616D657465727300 
  5802 00002CBF 5C6E00                  docall1_1 db "\n",0
  5803 00002CC2 2064622000              docall1_2 db " db ",0
  5804 00002CC7 2C3000                  docall1_3 db ",0",0
  5805 00002CCA 706172616D65746572-     docall1_4 db "parameter not recognized (no * allowed)",0
  5806 00002CD3 206E6F74207265636F-
  5807 00002CDC 676E697A656420286E-
  5808 00002CE5 6F202A20616C6C6F77-
  5809 00002CEE 65642900           
  5810 00002CF2 5C6E20707573682000      docall1_5 db "\n push ",0
  5811 00002CFB 5C6E20707573682000      docall1_6 db "\n push ",0
  5812 00002D04 5C6E206C6561202061-     docall1_7 db "\n lea  ax, ",0
  5813 00002D0D 782C2000           
  5814 00002D11 5C6E20707573682061-     docall1_8 db "\n push ax",0
  5815 00002D1A 7800               
  5816 00002D1C 5C6E20707573682077-     docall1_9 db "\n push word ",0
  5817 00002D25 6F72642000         
  5818 00002D2A 5C6E206D6F7620616C-     docall1_10 db "\n mov al, byte ",0
  5819 00002D33 2C20627974652000   
  5820 00002D3B 5C6E206D6F76206168-     docall1_11 db "\n mov ah, 0\n push ax",0
  5821 00002D44 2C20305C6E20707573-
  5822 00002D4D 6820617800         
  5823 00002D52 5C6E20707573682000      docall1_12 db "\n push ",0
  5824 00002D5B 5C6E2063616C6C2000      docall1_13 db "\n call ",0
  5825 00002D64 5C6E20616464202073-     docall1_14 db "\n add  sp, ",0
  5826 00002D6D 702C2000           
  5827                                  
  5828                                  main:  ; *** PROC ***
  5829                                  
  5830                                  ;-561   getarg();
  5831                                  
  5832 00002D71 E88D00                   call getarg
  5833                                  
  5834                                  ;-562   setblock(4096);
  5835                                  
  5836 00002D74 680010                   push 4096
  5837 00002D77 E84827                   call setblock
  5838 00002D7A 83C402                   add  sp, 2
  5839                                  
  5840                                  ;-563   if (DOS_ERR) error1("SetBlock , AX=");
  5841                                  
  5842 00002D7D A1[7600]                 mov ax, [DOS_ERR]
  5843 00002D80 08C0                     or  al, al
  5844 00002D82 0F840900                 je @@main311
  5845 00002D86 68[C62D]                 push main_0
  5846 00002D89 E8411C                   call error1
  5847 00002D8C 83C402                   add  sp, 2
  5848                                  
  5849                                  ;-564   segE=allocmem(4096);
  5850                                  
  5851                                  @@main311:
  5852 00002D8F 680010                   push 4096
  5853 00002D92 E84627                   call allocmem
  5854 00002D95 83C402                   add  sp, 2
  5855 00002D98 A3[6C00]                 mov word [segE], ax
  5856                                  
  5857                                  ;-565   if (DOS_ERR)  error1("alloc memory, AX=");
  5858                                  
  5859 00002D9B A1[7600]                 mov ax, [DOS_ERR]
  5860 00002D9E 08C0                     or  al, al
  5861 00002DA0 0F840900                 je @@main312
  5862 00002DA4 68[D52D]                 push main_1
  5863 00002DA7 E8231C                   call error1
  5864 00002DAA 83C402                   add  sp, 2
  5865                                  
  5866                                  ;-566   CNameTop=0;
  5867                                  
  5868                                  @@main312:
  5869 00002DAD B80000                   mov ax, 0
  5870 00002DB0 A3[6800]                 mov word [CNameTop], ax
  5871                                  
  5872                                  ;-567   getfirstchar();
  5873                                  
  5874 00002DB3 E83100                   call getfirstchar
  5875                                  
  5876                                  ;-568   parse();
  5877                                  
  5878 00002DB6 E89302                   call parse
  5879                                  
  5880                                  ;-569   callrecursive=0; checkcalls(); epilog();
  5881                                  
  5882 00002DB9 B80000                   mov ax, 0
  5883 00002DBC A3[3000]                 mov word [callrecursive], ax
  5884 00002DBF E82103                   call checkcalls
  5885 00002DC2 E8E322                   call epilog
  5886                                  
  5887                                  ;-570 }
  5888                                  
  5889                                  
  5890                                  ;-571 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
  5891                                  
  5892 00002DC5 C3                       ret
  5893                                  ; ENDP
  5894 00002DC6 536574426C6F636B20-     main_0 db "SetBlock , AX=",0
  5895 00002DCF 2C2041583D00       
  5896 00002DD5 616C6C6F63206D656D-     main_1 db "alloc memory, AX=",0
  5897 00002DDE 6F72792C2041583D00 
  5898                                  
  5899                                  getfirstchar:  ; *** PROC ***
  5900 00002DE7 B80FD0                   mov ax, fgetsdest
  5901 00002DEA A3[6A00]                 mov word [fgetsp], ax
  5902 00002DED B80000                   mov ax, 0
  5903 00002DF0 8B1E[6A00]               mov  bx, [fgetsp]
  5904 00002DF4 8807                     mov  [bx], al
  5905 00002DF6 E8DE1A                   call fgets1
  5906 00002DF9 A2[2700]                 mov byte [thechar], al
  5907                                  
  5908                                  ;-572 char *arglen=0x80; char *argv=0x82;
  5909                                  
  5910 00002DFC C3                       ret
  5911                                  ; ENDP
  5912 00002DFD 8000                    arglen dw 128
  5913 00002DFF 8200                    argv dw 130
  5914                                  
  5915                                  ;-573 int getarg() { int arglen1; int i; char *c;
  5916                                  
  5917                                  
  5918                                  getarg:  ; *** PROC ***
  5919                                  
  5920                                  ;-574   arglen1=*arglen;
  5921                                  
  5922                                  ;Function : getarg, Number of local variables: 3
  5923                                  ;   # type sign width addr used name   list of local variables
  5924                                  ;  200 var sign word   573 NULL arglen1 = bp-2
  5925                                  ;  201 var sign word   573 NULL i = bp-4
  5926                                  ;  202 ptr sign byte   573 NULL c = bp-6;
  5927 00002E01 C8060000                 ENTER  6,0
  5928 00002E05 8B1E[FD2D]               mov bx, [arglen]
  5929 00002E09 8A07                     mov al, [bx]
  5930 00002E0B B400                     mov ah, 0
  5931 00002E0D 8946FE                   mov [bp-2], ax
  5932                                  
  5933                                  ;-575   if (arglen1) { i=arglen1+129; *i=0; }
  5934                                  
  5935 00002E10 8B46FE                   mov ax, [bp-2]
  5936 00002E13 08C0                     or  al, al
  5937 00002E15 0F841400                 je @@getarg313
  5938 00002E19 8B46FE                   mov ax, [bp-2]
  5939 00002E1C 058100                   add ax, 129
  5940 00002E1F 8946FC                   mov [bp-4], ax
  5941 00002E22 B80000                   mov ax, 0
  5942 00002E25 8B5EFC                   mov  bx, [bp-4]
  5943 00002E28 8907                     mov  [bx], ax
  5944                                  
  5945                                  ;-576   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
  5946                                  
  5947 00002E2A E93900                   jmp @@getarg314
  5948                                  @@getarg313:
  5949 00002E2D 8D06[0300]               lea  ax, [Version1]
  5950 00002E31 50                       push ax
  5951 00002E32 E84E27                   call cputs
  5952 00002E35 83C402                   add  sp, 2
  5953 00002E38 68[AF2F]                 push getarg_0
  5954 00002E3B E84527                   call cputs
  5955 00002E3E 83C402                   add  sp, 2
  5956                                  
  5957                                  ;-577     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  5958                                  
  5959 00002E41 6A43                     push 67
  5960 00002E43 6A00                     push 0
  5961 00002E45 FF36[FF2D]               push word [argv]
  5962 00002E49 E8152A                   call readRL
  5963 00002E4C 83C406                   add  sp, 6
  5964 00002E4F A3[7800]                 mov word [DOS_NoBytes], ax
  5965 00002E52 A1[7800]                 mov ax, [DOS_NoBytes]
  5966 00002E55 058000                   add ax, 128
  5967 00002E58 8946FA                   mov [bp-6], ax
  5968 00002E5B B80000                   mov ax, 0
  5969 00002E5E 8B5EFA                   mov  bx, [bp-6]
  5970 00002E61 8807                     mov  [bx], al
  5971 00002E63 E87018                   call prnl
  5972                                  
  5973                                  ;-578   strcpy(namein, argv);
  5974                                  
  5975                                  @@getarg314:
  5976 00002E66 FF36[FF2D]               push word [argv]
  5977 00002E6A 8D06EE81                 lea  ax, [namein]
  5978 00002E6E 50                       push ax
  5979 00002E6F E81828                   call strcpy
  5980 00002E72 83C404                   add  sp, 4
  5981                                  
  5982                                  ;-579   if (instr2(namein, '.') == 0) strcat1(namein, ".C");
  5983                                  
  5984 00002E75 6A2E                     push 46
  5985 00002E77 8D06EE81                 lea  ax, [namein]
  5986 00002E7B 50                       push ax
  5987 00002E7C E86D28                   call instr2
  5988 00002E7F 83C404                   add  sp, 4
  5989 00002E82 83F800                   cmp ax, 0
  5990 00002E85 0F850E00                 jne @@getarg315
  5991 00002E89 68[CB2F]                 push getarg_1
  5992 00002E8C 8D06EE81                 lea  ax, [namein]
  5993 00002E90 50                       push ax
  5994 00002E91 E86929                   call strcat1
  5995 00002E94 83C404                   add  sp, 4
  5996                                  
  5997                                  ;-580   toupper(namein);
  5998                                  
  5999                                  @@getarg315:
  6000 00002E97 8D06EE81                 lea  ax, [namein]
  6001 00002E9B 50                       push ax
  6002 00002E9C E88027                   call toupper
  6003 00002E9F 83C402                   add  sp, 2
  6004                                  
  6005                                  ;-581   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
  6006                                  
  6007 00002EA2 8D06EE81                 lea  ax, [namein]
  6008 00002EA6 50                       push ax
  6009 00002EA7 8D063182                 lea  ax, [namelst]
  6010 00002EAB 50                       push ax
  6011 00002EAC E8DB27                   call strcpy
  6012 00002EAF 83C404                   add  sp, 4
  6013 00002EB2 8D063182                 lea  ax, [namelst]
  6014 00002EB6 50                       push ax
  6015 00002EB7 E8A827                   call strlen
  6016 00002EBA 83C402                   add  sp, 2
  6017 00002EBD 8946FC                   mov [bp-4], ax
  6018 00002EC0 FF4EFC                   dec  word[bp-4]
  6019 00002EC3 B83182                   mov ax, namelst
  6020 00002EC6 0346FC                   add ax, [bp-4]
  6021 00002EC9 8946FA                   mov [bp-6], ax
  6022 00002ECC B85300                   mov ax, 83
  6023 00002ECF 8B5EFA                   mov  bx, [bp-6]
  6024 00002ED2 8807                     mov  [bx], al
  6025                                  
  6026                                  ;-582  
  6027                                  
  6028                                  
  6029                                  ;-583   fdin=openR (namein);
  6030                                  
  6031 00002ED4 8D06EE81                 lea  ax, [namein]
  6032 00002ED8 50                       push ax
  6033 00002ED9 E84F29                   call openR
  6034 00002EDC 83C402                   add  sp, 2
  6035 00002EDF A3[1E00]                 mov word [fdin], ax
  6036                                  
  6037                                  ;-584   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  6038                                  
  6039 00002EE2 A1[7600]                 mov ax, [DOS_ERR]
  6040 00002EE5 08C0                     or  al, al
  6041 00002EE7 0F841C00                 je @@getarg316
  6042 00002EEB 68[CE2F]                 push getarg_2
  6043 00002EEE E89226                   call cputs
  6044 00002EF1 83C402                   add  sp, 2
  6045 00002EF4 8D06EE81                 lea  ax, [namein]
  6046 00002EF8 50                       push ax
  6047 00002EF9 E88726                   call cputs
  6048 00002EFC 83C402                   add  sp, 2
  6049 00002EFF 6A01                     push 1
  6050 00002F01 E89529                   call exitR
  6051 00002F04 83C402                   add  sp, 2
  6052                                  
  6053                                  ;-585   fdout=creatR(namelst);
  6054                                  
  6055                                  @@getarg316:
  6056 00002F07 8D063182                 lea  ax, [namelst]
  6057 00002F0B 50                       push ax
  6058 00002F0C E82B29                   call creatR
  6059 00002F0F 83C402                   add  sp, 2
  6060 00002F12 A3[2000]                 mov word [fdout], ax
  6061                                  
  6062                                  ;-586   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  6063                                  
  6064 00002F15 A1[7600]                 mov ax, [DOS_ERR]
  6065 00002F18 08C0                     or  al, al
  6066 00002F1A 0F841C00                 je @@getarg317
  6067 00002F1E 68[E92F]                 push getarg_3
  6068 00002F21 E85F26                   call cputs
  6069 00002F24 83C402                   add  sp, 2
  6070 00002F27 8D063182                 lea  ax, [namelst]
  6071 00002F2B 50                       push ax
  6072 00002F2C E85426                   call cputs
  6073 00002F2F 83C402                   add  sp, 2
  6074 00002F32 6A02                     push 2
  6075 00002F34 E86229                   call exitR
  6076 00002F37 83C402                   add  sp, 2
  6077                                  
  6078                                  ;-587   prs("\n; ");prs(Version1);
  6079                                  
  6080                                  @@getarg317:
  6081 00002F3A 68[0330]                 push getarg_4
  6082 00002F3D E8A417                   call prs
  6083 00002F40 83C402                   add  sp, 2
  6084 00002F43 8D06[0300]               lea  ax, [Version1]
  6085 00002F47 50                       push ax
  6086 00002F48 E89917                   call prs
  6087 00002F4B 83C402                   add  sp, 2
  6088                                  
  6089                                  ;-588   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}
  6090                                  
  6091 00002F4E 68[0830]                 push getarg_5
  6092 00002F51 E89017                   call prs
  6093 00002F54 83C402                   add  sp, 2
  6094 00002F57 FF76FE                   push word [bp-2]
  6095 00002F5A E87E18                   call pint1
  6096 00002F5D 83C402                   add  sp, 2
  6097 00002F60 8B46FE                   mov ax, [bp-2]
  6098 00002F63 08C0                     or  al, al
  6099 00002F65 0F841300                 je @@getarg318
  6100 00002F69 68[1330]                 push getarg_6
  6101 00002F6C E87517                   call prs
  6102 00002F6F 83C402                   add  sp, 2
  6103 00002F72 FF36[FF2D]               push word [argv]
  6104 00002F76 E86B17                   call prs
  6105 00002F79 83C402                   add  sp, 2
  6106                                  
  6107                                  ;-589   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  6108                                  
  6109                                  @@getarg318:
  6110 00002F7C 68[1C30]                 push getarg_7
  6111 00002F7F E86217                   call prs
  6112 00002F82 83C402                   add  sp, 2
  6113 00002F85 8D06EE81                 lea  ax, [namein]
  6114 00002F89 50                       push ax
  6115 00002F8A E85717                   call prs
  6116 00002F8D 83C402                   add  sp, 2
  6117 00002F90 68[2730]                 push getarg_8
  6118 00002F93 E84E17                   call prs
  6119 00002F96 83C402                   add  sp, 2
  6120 00002F99 8D063182                 lea  ax, [namelst]
  6121 00002F9D 50                       push ax
  6122 00002F9E E84317                   call prs
  6123 00002FA1 83C402                   add  sp, 2
  6124                                  
  6125                                  ;-590   prs("\norg  256 \njmp main"); 
  6126                                  
  6127 00002FA4 68[3630]                 push getarg_9
  6128 00002FA7 E83A17                   call prs
  6129 00002FAA 83C402                   add  sp, 2
  6130                                  
  6131                                  ;-591 }
  6132                                  
  6133                                  
  6134                                  ;-592 int parse() { token=getlex(); do {
  6135 00002FAD C9                       LEAVE
  6136 00002FAE C3                       ret
  6137                                  ; ENDP
  6138 00002FAF 2055736167653A2041-     getarg_0 db " Usage: A.COM in_file[.C]: ",0
  6139 00002FB8 2E434F4D20696E5F66-
  6140 00002FC1 696C655B2E435D3A20-
  6141 00002FCA 00                 
  6142 00002FCB 2E4300                  getarg_1 db ".C",0
  6143 00002FCE 536F75726365206669-     getarg_2 db "Source file missing (.C): ",0
  6144 00002FD7 6C65206D697373696E-
  6145 00002FE0 6720282E43293A2000 
  6146 00002FE9 6C6973742066696C65-     getarg_3 db "list file not creatable: ",0
  6147 00002FF2 206E6F742063726561-
  6148 00002FFB 7461626C653A2000   
  6149 00003003 5C6E3B2000              getarg_4 db "\n; ",0
  6150 00003008 2C204172676C656E3A-     getarg_5 db ", Arglen: ",0
  6151 00003011 2000               
  6152 00003013 2C20417267763A2000      getarg_6 db ", Argv: ",0
  6153 0000301C 2C20536F757263653A-     getarg_7 db ", Source: ",0
  6154 00003025 2000               
  6155 00003027 2C204F757470757420-     getarg_8 db ", Output asm: ",0
  6156 00003030 61736D3A2000       
  6157 00003036 5C6E6F726720203235-     getarg_9 db "\norg  256 \njmp main",0
  6158 0000303F 36205C6E6A6D70206D-
  6159 00003048 61696E00           
  6160                                  
  6161                                  parse:  ; *** PROC ***
  6162 0000304C E8990D                   call getlex
  6163 0000304F A3[2200]                 mov word [token], ax
  6164                                  @@parse319:
  6165                                  
  6166                                  ;-593     if (token <= 0) return 1;
  6167                                  
  6168 00003052 A1[2200]                 mov ax, [token]
  6169 00003055 83F800                   cmp ax, 0
  6170 00003058 0F8F0600                 jg  @@parse320
  6171 0000305C B80100                   mov ax, 1
  6172 0000305F E96500                   jmp @@retn
  6173                                  
  6174                                  ;-594     if (istoken('#')) {
  6175                                  
  6176                                  @@parse320:
  6177 00003062 6A23                     push 35
  6178 00003064 E84815                   call istoken
  6179 00003067 83C402                   add  sp, 2
  6180 0000306A 08C0                     or  al, al
  6181 0000306C 0F843600                 je @@parse321
  6182                                  
  6183                                  ;-595       if (istoken(T_DEFINE)) dodefine();
  6184                                  
  6185 00003070 68FF01                   push 511
  6186 00003073 E83915                   call istoken
  6187 00003076 83C402                   add  sp, 2
  6188 00003079 08C0                     or  al, al
  6189 0000307B 0F840600                 je @@parse322
  6190 0000307F E83D05                   call dodefine
  6191                                  
  6192                                  ;-596       else if (istoken(T_INCLUDE)) doinclude();
  6193                                  
  6194 00003082 E91E00                   jmp @@parse323
  6195                                  @@parse322:
  6196 00003085 68FE01                   push 510
  6197 00003088 E82415                   call istoken
  6198 0000308B 83C402                   add  sp, 2
  6199 0000308E 08C0                     or  al, al
  6200 00003090 0F840600                 je @@parse324
  6201 00003094 E84204                   call doinclude
  6202                                  
  6203                                  ;-597       else error1("define or include expected");  }
  6204                                  
  6205 00003097 E90900                   jmp @@parse325
  6206                                  @@parse324:
  6207 0000309A 68[C830]                 push parse_0
  6208 0000309D E82D19                   call error1
  6209 000030A0 83C402                   add  sp, 2
  6210                                  @@parse325:
  6211                                  @@parse323:
  6212                                  
  6213                                  ;-598     else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  6214                                  
  6215 000030A3 E91600                   jmp @@parse326
  6216                                  @@parse321:
  6217 000030A6 E8D0D6                   call typeName
  6218 000030A9 A1[2200]                 mov ax, [token]
  6219 000030AC 83F828                   cmp ax, 40
  6220 000030AF 0F850600                 jne @@parse327
  6221 000030B3 E807DA                   call dofunc
  6222 000030B6 E90300                   jmp @@parse328
  6223                                  @@parse327:
  6224 000030B9 E881D0                   call doglob
  6225                                  @@parse328:
  6226                                  
  6227                                  ;-599   } while(1);
  6228                                  
  6229                                  @@parse326:
  6230 000030BC B80100                   mov ax, 1
  6231 000030BF 08C0                     or  al, al
  6232 000030C1 0F840200                 je @@parse329
  6233 000030C5 EB8B                     jmp @@parse319
  6234                                  @@parse329:
  6235                                  
  6236                                  ;-600 }
  6237                                  
  6238                                  
  6239                                  ;-601 int checkcalls() { int i; int j; int k;
  6240                                  
  6241                                  @@retn:
  6242 000030C7 C3                       ret
  6243                                  ; ENDP
  6244 000030C8 646566696E65206F72-     parse_0 db "define or include expected",0
  6245 000030D1 20696E636C75646520-
  6246 000030DA 657870656374656400 
  6247                                  
  6248                                  checkcalls:  ; *** PROC ***
  6249                                  
  6250                                  ;-602   prs("\n \n; missing functions: ");
  6251                                  
  6252                                  ;Function : checkcalls, Number of local variables: 3
  6253                                  ;   # type sign width addr used name   list of local variables
  6254                                  ;  200 var sign word   601 NULL i = bp-2
  6255                                  ;  201 var sign word   601 NULL j = bp-4
  6256                                  ;  202 var sign word   601 NULL k = bp-6;
  6257 000030E3 C8060000                 ENTER  6,0
  6258 000030E7 68[C031]                 push checkcalls_0
  6259 000030EA E8F715                   call prs
  6260 000030ED 83C402                   add  sp, 2
  6261                                  
  6262                                  ;-603   i=0;  k=0;
  6263                                  
  6264 000030F0 B80000                   mov ax, 0
  6265 000030F3 8946FE                   mov [bp-2], ax
  6266 000030F6 B80000                   mov ax, 0
  6267 000030F9 8946FA                   mov [bp-6], ax
  6268                                  
  6269                                  ;-604   while (i < CTop) {
  6270                                  
  6271                                  @@checkcalls330:
  6272 000030FC 8B46FE                   mov ax, [bp-2]
  6273 000030FF 3B06[4500]               cmp ax, [CTop]
  6274 00003103 0F8D8F00                 jge @@checkcalls331
  6275                                  
  6276                                  ;-605     pt=CAdr[i];
  6277                                  
  6278 00003107 8B5EFE                   mov bx, [bp-2]
  6279 0000310A D1E3                     shl bx, 1
  6280 0000310C 8B8757AB                 mov ax, [CAdr + bx]
  6281 00003110 A3[7200]                 mov word [pt], ax
  6282                                  
  6283                                  ;-606     from_far(NameA, pt);
  6284                                  
  6285 00003113 FF36[7200]               push word [pt]
  6286 00003117 8D06[4700]               lea  ax, [NameA]
  6287 0000311B 50                       push ax
  6288 0000311C E82324                   call from_far
  6289 0000311F 83C404                   add  sp, 4
  6290                                  
  6291                                  ;-607     j=0;
  6292                                  
  6293 00003122 B80000                   mov ax, 0
  6294 00003125 8946FC                   mov [bp-4], ax
  6295                                  
  6296                                  ;-608     do { p1=adrF(FNameField, j);
  6297                                  
  6298                                  @@checkcalls332:
  6299 00003128 FF76FC                   push word [bp-4]
  6300 0000312B 8D064FBD                 lea  ax, [FNameField]
  6301 0000312F 50                       push ax
  6302 00003130 E804D5                   call adrF
  6303 00003133 83C404                   add  sp, 4
  6304 00003136 A3[7400]                 mov word [p1], ax
  6305                                  
  6306                                  ;-609       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
  6307                                  
  6308 00003139 FF36[7400]               push word [p1]
  6309 0000313D 8D06[4700]               lea  ax, [NameA]
  6310 00003141 50                       push ax
  6311 00003142 E86C26                   call eqstr
  6312 00003145 83C404                   add  sp, 4
  6313 00003148 08C0                     or  al, al
  6314 0000314A 0F841000                 je @@checkcalls333
  6315 0000314E B80100                   mov ax, 1
  6316 00003151 8B5EFE                   mov bx, [bp-2]
  6317 00003154 88872FA1                 mov [CType+bx], al
  6318 00003158 A1[4300]                 mov ax, [FTop]
  6319 0000315B 8946FC                   mov [bp-4], ax
  6320                                  
  6321                                  ;-610       j++; } while (j < FTop);
  6322                                  
  6323                                  @@checkcalls333:
  6324 0000315E FF46FC                   inc  word[bp-4]
  6325 00003161 8B46FC                   mov ax, [bp-4]
  6326 00003164 3B06[4300]               cmp ax, [FTop]
  6327 00003168 0F8D0200                 jge @@checkcalls334
  6328 0000316C EBBA                     jmp @@checkcalls332
  6329                                  @@checkcalls334:
  6330                                  
  6331                                  ;-611     if (j == FTop) { k++; prs("\n; "); prs(NameA); }
  6332                                  
  6333 0000316E 8B46FC                   mov ax, [bp-4]
  6334 00003171 3B06[4300]               cmp ax, [FTop]
  6335 00003175 0F851700                 jne @@checkcalls335
  6336 00003179 FF46FA                   inc  word[bp-6]
  6337 0000317C 68[DB31]                 push checkcalls_1
  6338 0000317F E86215                   call prs
  6339 00003182 83C402                   add  sp, 2
  6340 00003185 8D06[4700]               lea  ax, [NameA]
  6341 00003189 50                       push ax
  6342 0000318A E85715                   call prs
  6343 0000318D 83C402                   add  sp, 2
  6344                                  
  6345                                  ;-612     i++; }
  6346                                  
  6347                                  @@checkcalls335:
  6348 00003190 FF46FE                   inc  word[bp-2]
  6349                                  
  6350                                  ;-613   if (k!=0) doar(k); else {prs(" All FUNCTIONs in place");
  6351                                  
  6352 00003193 E966FF                   jmp @@checkcalls330
  6353                                  @@checkcalls331:
  6354 00003196 8B46FA                   mov ax, [bp-6]
  6355 00003199 83F800                   cmp ax, 0
  6356 0000319C 0F840C00                 je  @@checkcalls336
  6357 000031A0 FF76FA                   push word [bp-6]
  6358 000031A3 E86400                   call doar
  6359 000031A6 83C402                   add  sp, 2
  6360 000031A9 E91200                   jmp @@checkcalls337
  6361                                  @@checkcalls336:
  6362 000031AC 68[E031]                 push checkcalls_2
  6363 000031AF E83215                   call prs
  6364 000031B2 83C402                   add  sp, 2
  6365                                  
  6366                                  ;-614     cputs("  All CALLs OK! "); }
  6367                                  
  6368 000031B5 68[F831]                 push checkcalls_3
  6369 000031B8 E8C823                   call cputs
  6370 000031BB 83C402                   add  sp, 2
  6371                                  
  6372                                  ;-615 }
  6373                                  
  6374                                  @@checkcalls337:
  6375                                  
  6376                                  ;-616 char wasfunction;
  6377 000031BE C9                       LEAVE
  6378 000031BF C3                       ret
  6379                                  ; ENDP
  6380 000031C0 5C6E205C6E3B206D69-     checkcalls_0 db "\n \n; missing functions: ",0
  6381 000031C9 7373696E672066756E-
  6382 000031D2 6374696F6E733A2000 
  6383 000031DB 5C6E3B2000              checkcalls_1 db "\n; ",0
  6384 000031E0 20416C6C2046554E43-     checkcalls_2 db " All FUNCTIONs in place",0
  6385 000031E9 54494F4E7320696E20-
  6386 000031F2 706C61636500       
  6387 000031F8 2020416C6C2043414C-     checkcalls_3 db "  All CALLs OK! ",0
  6388 00003201 4C73204F4B212000   
  6389 00003209 00                      wasfunction db 0
  6390                                  
  6391                                  ;-617 int doar(int k) { int i; int fdtemp; int fdout1; int used; int found;
  6392                                  
  6393                                  
  6394                                  doar:  ; *** PROC ***
  6395                                  
  6396                                  ;-618   cputs("  Open CALLs :"); pint(k);
  6397                                  
  6398                                  ;Function : doar, Number of local variables: 6
  6399                                  ;   # type sign width addr used name   list of local variables
  6400                                  ;  200 var sign word   617 NULL k = bp+4
  6401                                  ;  201 var sign word   617 NULL i = bp-2
  6402                                  ;  202 var sign word   617 NULL fdtemp = bp-4
  6403                                  ;  203 var sign word   617 NULL fdout1 = bp-6
  6404                                  ;  204 var sign word   617 NULL used = bp-8
  6405                                  ;  205 var sign word   617 NULL found = bp-10;
  6406 0000320A C80A0000                 ENTER  10,0
  6407 0000320E 68[9433]                 push doar_0
  6408 00003211 E86F23                   call cputs
  6409 00003214 83C402                   add  sp, 2
  6410 00003217 FF7604                   push word [bp+4]
  6411 0000321A E89F23                   call pint
  6412 0000321D 83C402                   add  sp, 2
  6413                                  
  6414                                  ;-619   prs("\n; Number of unresolved CALLs :"); printint51(k);
  6415                                  
  6416 00003220 68[A333]                 push doar_1
  6417 00003223 E8BE14                   call prs
  6418 00003226 83C402                   add  sp, 2
  6419 00003229 FF7604                   push word [bp+4]
  6420 0000322C E85116                   call printint51
  6421 0000322F 83C402                   add  sp, 2
  6422                                  
  6423                                  ;-620   fdin=openR (archivename);
  6424                                  
  6425 00003232 8D067482                 lea  ax, [archivename]
  6426 00003236 50                       push ax
  6427 00003237 E8F125                   call openR
  6428 0000323A 83C402                   add  sp, 2
  6429 0000323D A3[1E00]                 mov word [fdin], ax
  6430                                  
  6431                                  ;-621   if(DOS_ERR){cputs("Archive file missing: "); cputs(archivename); exitR(3); }
  6432                                  
  6433 00003240 A1[7600]                 mov ax, [DOS_ERR]
  6434 00003243 08C0                     or  al, al
  6435 00003245 0F841C00                 je @@doar338
  6436 00003249 68[C433]                 push doar_2
  6437 0000324C E83423                   call cputs
  6438 0000324F 83C402                   add  sp, 2
  6439 00003252 8D067482                 lea  ax, [archivename]
  6440 00003256 50                       push ax
  6441 00003257 E82923                   call cputs
  6442 0000325A 83C402                   add  sp, 2
  6443 0000325D 6A03                     push 3
  6444 0000325F E83726                   call exitR
  6445 00003262 83C402                   add  sp, 2
  6446                                  
  6447                                  ;-622   prs("\n;use archive file: "); prs(archivename);
  6448                                  
  6449                                  @@doar338:
  6450 00003265 68[DB33]                 push doar_3
  6451 00003268 E87914                   call prs
  6452 0000326B 83C402                   add  sp, 2
  6453 0000326E 8D067482                 lea  ax, [archivename]
  6454 00003272 50                       push ax
  6455 00003273 E86E14                   call prs
  6456 00003276 83C402                   add  sp, 2
  6457                                  
  6458                                  ;-623   fdtemp=fdout;
  6459                                  
  6460 00003279 A1[2000]                 mov ax, [fdout]
  6461 0000327C 8946FC                   mov [bp-4], ax
  6462                                  
  6463                                  ;-624   wasfunction=0;
  6464                                  
  6465 0000327F B80000                   mov ax, 0
  6466 00003282 A2[0932]                 mov byte [wasfunction], al
  6467                                  
  6468                                  ;-625   getfirstchar();
  6469                                  
  6470 00003285 E85FFB                   call getfirstchar
  6471                                  
  6472                                  ;-626   do { fdout=0;do {found=getfunctionhead();}while (found==0); fdout=fdtemp;
  6473                                  
  6474                                  @@doar339:
  6475 00003288 B80000                   mov ax, 0
  6476 0000328B A3[2000]                 mov word [fdout], ax
  6477                                  @@doar340:
  6478 0000328E E8E401                   call getfunctionhead
  6479 00003291 8946F6                   mov [bp-10], ax
  6480 00003294 8B46F6                   mov ax, [bp-10]
  6481 00003297 83F800                   cmp ax, 0
  6482 0000329A 0F850200                 jne @@doar341
  6483 0000329E EBEE                     jmp @@doar340
  6484                                  @@doar341:
  6485 000032A0 8B46FC                   mov ax, [bp-4]
  6486 000032A3 A3[2000]                 mov word [fdout], ax
  6487                                  
  6488                                  ;-627        if (found > 0) {
  6489                                  
  6490 000032A6 8B46F6                   mov ax, [bp-10]
  6491 000032A9 83F800                   cmp ax, 0
  6492 000032AC 0F8E9F00                 jle @@doar342
  6493                                  
  6494                                  ;-628          used=0; i=0;
  6495                                  
  6496 000032B0 B80000                   mov ax, 0
  6497 000032B3 8946F8                   mov [bp-8], ax
  6498 000032B6 B80000                   mov ax, 0
  6499 000032B9 8946FE                   mov [bp-2], ax
  6500                                  
  6501                                  ;-629          while (i < CTop) {
  6502                                  
  6503                                  @@doar343:
  6504 000032BC 8B46FE                   mov ax, [bp-2]
  6505 000032BF 3B06[4500]               cmp ax, [CTop]
  6506 000032C3 0F8D5000                 jge @@doar344
  6507                                  
  6508                                  ;-630            pt=CAdr[i];
  6509                                  
  6510 000032C7 8B5EFE                   mov bx, [bp-2]
  6511 000032CA D1E3                     shl bx, 1
  6512 000032CC 8B8757AB                 mov ax, [CAdr + bx]
  6513 000032D0 A3[7200]                 mov word [pt], ax
  6514                                  
  6515                                  ;-631            from_far(NameA, pt);
  6516                                  
  6517 000032D3 FF36[7200]               push word [pt]
  6518 000032D7 8D06[4700]               lea  ax, [NameA]
  6519 000032DB 50                       push ax
  6520 000032DC E86322                   call from_far
  6521 000032DF 83C404                   add  sp, 4
  6522                                  
  6523                                  ;-632            if (eqstr(symbol, NameA)) {
  6524                                  
  6525 000032E2 8D06[4700]               lea  ax, [NameA]
  6526 000032E6 50                       push ax
  6527 000032E7 8D062B81                 lea  ax, [symbol]
  6528 000032EB 50                       push ax
  6529 000032EC E8C224                   call eqstr
  6530 000032EF 83C404                   add  sp, 4
  6531 000032F2 08C0                     or  al, al
  6532 000032F4 0F841A00                 je @@doar345
  6533                                  
  6534                                  ;-633              if (CType[i] == 0) {CType[i]=1; used++; } }  i++; }
  6535                                  
  6536 000032F8 8B5EFE                   mov bx, [bp-2]
  6537 000032FB 8A872FA1                 mov al, [CType + bx]
  6538 000032FF 3C00                     cmp al, 0
  6539 00003301 0F850D00                 jne @@doar346
  6540 00003305 B80100                   mov ax, 1
  6541 00003308 8B5EFE                   mov bx, [bp-2]
  6542 0000330B 88872FA1                 mov [CType+bx], al
  6543 0000330F FF46F8                   inc  word[bp-8]
  6544                                  @@doar346:
  6545                                  @@doar345:
  6546 00003312 FF46FE                   inc  word[bp-2]
  6547                                  
  6548                                  ;-634            if (used) {
  6549                                  
  6550 00003315 EBA5                     jmp @@doar343
  6551                                  @@doar344:
  6552 00003317 8B46F8                   mov ax, [bp-8]
  6553 0000331A 08C0                     or  al, al
  6554 0000331C 0F842F00                 je @@doar347
  6555                                  
  6556                                  ;-635               prs("\n;Number of CALLs:"); printint51(used);
  6557                                  
  6558 00003320 68[F133]                 push doar_4
  6559 00003323 E8BE13                   call prs
  6560 00003326 83C402                   add  sp, 2
  6561 00003329 FF76F8                   push word [bp-8]
  6562 0000332C E85115                   call printint51
  6563 0000332F 83C402                   add  sp, 2
  6564                                  
  6565                                  ;-636               prs(" : "); prs(symbol); dofunc(); wasfunction=1; }
  6566                                  
  6567 00003332 68[0534]                 push doar_5
  6568 00003335 E8AC13                   call prs
  6569 00003338 83C402                   add  sp, 2
  6570 0000333B 8D062B81                 lea  ax, [symbol]
  6571 0000333F 50                       push ax
  6572 00003340 E8A113                   call prs
  6573 00003343 83C402                   add  sp, 2
  6574 00003346 E874D7                   call dofunc
  6575 00003349 B80100                   mov ax, 1
  6576 0000334C A2[0932]                 mov byte [wasfunction], al
  6577                                  
  6578                                  ;-637         }
  6579                                  
  6580                                  @@doar347:
  6581                                  
  6582                                  ;-638      } while (token);
  6583                                  
  6584                                  @@doar342:
  6585 0000334F A1[2200]                 mov ax, [token]
  6586 00003352 08C0                     or  al, al
  6587 00003354 0F840300                 je @@doar348
  6588 00003358 E92DFF                   jmp @@doar339
  6589                                  @@doar348:
  6590                                  
  6591                                  ;-639   prs("\n;End of archive file. ");
  6592                                  
  6593 0000335B 68[0934]                 push doar_6
  6594 0000335E E88313                   call prs
  6595 00003361 83C402                   add  sp, 2
  6596                                  
  6597                                  ;-640   callrecursive++; if (callrecursive < 5) checkcalls();
  6598                                  
  6599 00003364 FF06[3000]               inc  word[callrecursive]
  6600 00003368 A1[3000]                 mov ax, [callrecursive]
  6601 0000336B 83F805                   cmp ax, 5
  6602 0000336E 0F8D0600                 jge @@doar349
  6603 00003372 E86EFD                   call checkcalls
  6604                                  
  6605                                  ;-641     else {putch(10); cputs("***ERROR*** function(s) missing! ");
  6606                                  
  6607 00003375 E91A00                   jmp @@doar350
  6608                                  @@doar349:
  6609 00003378 6A0A                     push 10
  6610 0000337A E8ED21                   call putch
  6611 0000337D 83C402                   add  sp, 2
  6612 00003380 68[2234]                 push doar_7
  6613 00003383 E8FD21                   call cputs
  6614 00003386 83C402                   add  sp, 2
  6615                                  
  6616                                  ;-642     error1("At least 1 function is missing in archive file! "); }
  6617                                  
  6618 00003389 68[4434]                 push doar_8
  6619 0000338C E83E16                   call error1
  6620 0000338F 83C402                   add  sp, 2
  6621                                  
  6622                                  ;-643 }
  6623                                  
  6624                                  @@doar350:
  6625                                  
  6626                                  ;-644 int getfunctionhead() {
  6627 00003392 C9                       LEAVE
  6628 00003393 C3                       ret
  6629                                  ; ENDP
  6630 00003394 20204F70656E204341-     doar_0 db "  Open CALLs :",0
  6631 0000339D 4C4C73203A00       
  6632 000033A3 5C6E3B204E756D6265-     doar_1 db "\n; Number of unresolved CALLs :",0
  6633 000033AC 72206F6620756E7265-
  6634 000033B5 736F6C766564204341-
  6635 000033BE 4C4C73203A00       
  6636 000033C4 417263686976652066-     doar_2 db "Archive file missing: ",0
  6637 000033CD 696C65206D69737369-
  6638 000033D6 6E673A2000         
  6639 000033DB 5C6E3B757365206172-     doar_3 db "\n;use archive file: ",0
  6640 000033E4 63686976652066696C-
  6641 000033ED 653A2000           
  6642 000033F1 5C6E3B4E756D626572-     doar_4 db "\n;Number of CALLs:",0
  6643 000033FA 206F662043414C4C73-
  6644 00003403 3A00               
  6645 00003405 203A2000                doar_5 db " : ",0
  6646 00003409 5C6E3B456E64206F66-     doar_6 db "\n;End of archive file. ",0
  6647 00003412 206172636869766520-
  6648 0000341B 66696C652E2000     
  6649 00003422 2A2A2A4552524F522A-     doar_7 db "***ERROR*** function(s) missing! ",0
  6650 0000342B 2A2A2066756E637469-
  6651 00003434 6F6E287329206D6973-
  6652 0000343D 73696E67212000     
  6653 00003444 4174206C6561737420-     doar_8 db "At least 1 function is missing in archive file! ",0
  6654 0000344D 312066756E6374696F-
  6655 00003456 6E206973206D697373-
  6656 0000345F 696E6720696E206172-
  6657 00003468 63686976652066696C-
  6658 00003471 65212000           
  6659                                  
  6660                                  getfunctionhead:  ; *** PROC ***
  6661                                  
  6662                                  ;-645   if (wasfunction) wasfunction=0; else token=getlex();
  6663                                  
  6664 00003475 A0[0932]                 mov al, [wasfunction]
  6665 00003478 08C0                     or  al, al
  6666 0000347A 0F840900                 je @@getfunctionhead351
  6667 0000347E B80000                   mov ax, 0
  6668 00003481 A2[0932]                 mov byte [wasfunction], al
  6669 00003484 E90600                   jmp @@getfunctionhead352
  6670                                  @@getfunctionhead351:
  6671 00003487 E85E09                   call getlex
  6672 0000348A A3[2200]                 mov word [token], ax
  6673                                  
  6674                                  ;-646   if (token == 0) return 0xFFFF;
  6675                                  
  6676                                  @@getfunctionhead352:
  6677 0000348D A1[2200]                 mov ax, [token]
  6678 00003490 83F800                   cmp ax, 0
  6679 00003493 0F850600                 jne @@getfunctionhead353
  6680 00003497 B8FFFF                   mov ax, 65535
  6681 0000349A E93B00                   jmp @@retn
  6682                                  
  6683                                  ;-647   if(istoken(T_INT))  { if (token != T_NAME) return 0;
  6684                                  
  6685                                  @@getfunctionhead353:
  6686 0000349D 680502                   push 517
  6687 000034A0 E80C11                   call istoken
  6688 000034A3 83C402                   add  sp, 2
  6689 000034A6 08C0                     or  al, al
  6690 000034A8 0F842600                 je @@getfunctionhead354
  6691 000034AC A1[2200]                 mov ax, [token]
  6692 000034AF 3D0001                   cmp ax, 256
  6693 000034B2 0F840600                 je  @@getfunctionhead355
  6694 000034B6 B80000                   mov ax, 0
  6695 000034B9 E91C00                   jmp @@retn
  6696                                  
  6697                                  ;-648   token=getlex(); if (token == '(') return 1; }
  6698                                  
  6699                                  @@getfunctionhead355:
  6700 000034BC E82909                   call getlex
  6701 000034BF A3[2200]                 mov word [token], ax
  6702 000034C2 A1[2200]                 mov ax, [token]
  6703 000034C5 83F828                   cmp ax, 40
  6704 000034C8 0F850600                 jne @@getfunctionhead356
  6705 000034CC B80100                   mov ax, 1
  6706 000034CF E90600                   jmp @@retn
  6707                                  @@getfunctionhead356:
  6708                                  
  6709                                  ;-649   return 0;
  6710                                  
  6711                                  @@getfunctionhead354:
  6712 000034D2 B80000                   mov ax, 0
  6713 000034D5 E90000                   jmp @@retn
  6714                                  
  6715                                  ;-650 }
  6716                                  
  6717                                  
  6718                                  ;-651 int doinclude() { int fdtemp;
  6719                                  
  6720                                  @@retn:
  6721 000034D8 C3                       ret
  6722                                  ; ENDP
  6723                                  
  6724                                  doinclude:  ; *** PROC ***
  6725                                  
  6726                                  ;-652   if (token==T_STRING) {  fdtemp=fdin;
  6727                                  
  6728                                  ;Function : doinclude, Number of local variables: 1
  6729                                  ;   # type sign width addr used name   list of local variables
  6730                                  ;  200 var sign word   651 NULL fdtemp = bp-2;
  6731 000034D9 C8020000                 ENTER  2,0
  6732 000034DD A1[2200]                 mov ax, [token]
  6733 000034E0 3D0201                   cmp ax, 258
  6734 000034E3 0F858700                 jne @@doinclude357
  6735 000034E7 A1[1E00]                 mov ax, [fdin]
  6736 000034EA 8946FE                   mov [bp-2], ax
  6737                                  
  6738                                  ;-653   prs("\n;Use include file: "); prs(symbol);
  6739                                  
  6740 000034ED 68[7035]                 push doinclude_0
  6741 000034F0 E8F111                   call prs
  6742 000034F3 83C402                   add  sp, 2
  6743 000034F6 8D062B81                 lea  ax, [symbol]
  6744 000034FA 50                       push ax
  6745 000034FB E8E611                   call prs
  6746 000034FE 83C402                   add  sp, 2
  6747                                  
  6748                                  ;-654   fdin=openR(symbol);
  6749                                  
  6750 00003501 8D062B81                 lea  ax, [symbol]
  6751 00003505 50                       push ax
  6752 00003506 E82223                   call openR
  6753 00003509 83C402                   add  sp, 2
  6754 0000350C A3[1E00]                 mov word [fdin], ax
  6755                                  
  6756                                  ;-655   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
  6757                                  
  6758 0000350F A1[7600]                 mov ax, [DOS_ERR]
  6759 00003512 83F800                   cmp ax, 0
  6760 00003515 0F841D00                 je  @@doinclude358
  6761 00003519 68[8635]                 push doinclude_1
  6762 0000351C E8C511                   call prs
  6763 0000351F 83C402                   add  sp, 2
  6764 00003522 8D062B81                 lea  ax, [symbol]
  6765 00003526 50                       push ax
  6766 00003527 E8BA11                   call prs
  6767 0000352A 83C402                   add  sp, 2
  6768                                  
  6769                                  ;-656     error1(" Stop!!"); }
  6770                                  
  6771 0000352D 68[9D35]                 push doinclude_2
  6772 00003530 E89A14                   call error1
  6773 00003533 83C402                   add  sp, 2
  6774                                  
  6775                                  ;-657   linenoinclude=lineno; lineno=1;
  6776                                  
  6777                                  @@doinclude358:
  6778 00003536 A1[6E00]                 mov ax, [lineno]
  6779 00003539 A3[7000]                 mov word [linenoinclude], ax
  6780 0000353C B80100                   mov ax, 1
  6781 0000353F A3[6E00]                 mov word [lineno], ax
  6782                                  
  6783                                  ;-658   parse(); lineno=linenoinclude;
  6784                                  
  6785 00003542 E807FB                   call parse
  6786 00003545 A1[7000]                 mov ax, [linenoinclude]
  6787 00003548 A3[6E00]                 mov word [lineno], ax
  6788                                  
  6789                                  ;-659   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  6790                                  
  6791 0000354B 8B46FE                   mov ax, [bp-2]
  6792 0000354E A3[1E00]                 mov word [fdin], ax
  6793 00003551 68[A535]                 push doinclude_3
  6794 00003554 E88D11                   call prs
  6795 00003557 83C402                   add  sp, 2
  6796 0000355A 8D06EE81                 lea  ax, [namein]
  6797 0000355E 50                       push ax
  6798 0000355F E88211                   call prs
  6799 00003562 83C402                   add  sp, 2
  6800                                  
  6801                                  ;-660   getfirstchar(); token=getlex(); }
  6802                                  
  6803 00003565 E87FF8                   call getfirstchar
  6804 00003568 E87D08                   call getlex
  6805 0000356B A3[2200]                 mov word [token], ax
  6806                                  
  6807                                  ;-661 }
  6808                                  
  6809                                  @@doinclude357:
  6810                                  
  6811                                  ;-662 int dodefine() { int i; int j; int fdtemp;
  6812 0000356E C9                       LEAVE
  6813 0000356F C3                       ret
  6814                                  ; ENDP
  6815 00003570 5C6E3B55736520696E-     doinclude_0 db "\n;Use include file: ",0
  6816 00003579 636C7564652066696C-
  6817 00003582 653A2000           
  6818 00003586 496E636C7564652066-     doinclude_1 db "Include file missing: ",0
  6819 0000358F 696C65206D69737369-
  6820 00003598 6E673A2000         
  6821 0000359D 2053746F70212100        doinclude_2 db " Stop!!",0
  6822 000035A5 5C6E3B4261636B2074-     doinclude_3 db "\n;Back to main program: ",0
  6823 000035AE 6F206D61696E207072-
  6824 000035B7 6F6772616D3A2000   
  6825                                  
  6826                                  dodefine:  ; *** PROC ***
  6827                                  
  6828                                  ;-663   if (eqstr(symbol, "ORGDATA")) {token=getlex();
  6829                                  
  6830                                  ;Function : dodefine, Number of local variables: 3
  6831                                  ;   # type sign width addr used name   list of local variables
  6832                                  ;  200 var sign word   662 NULL i = bp-2
  6833                                  ;  201 var sign word   662 NULL j = bp-4
  6834                                  ;  202 var sign word   662 NULL fdtemp = bp-6;
  6835 000035BF C8060000                 ENTER  6,0
  6836 000035C3 68[0637]                 push dodefine_0
  6837 000035C6 8D062B81                 lea  ax, [symbol]
  6838 000035CA 50                       push ax
  6839 000035CB E8E321                   call eqstr
  6840 000035CE 83C404                   add  sp, 4
  6841 000035D1 08C0                     or  al, al
  6842 000035D3 0F841500                 je @@dodefine359
  6843 000035D7 E80E08                   call getlex
  6844 000035DA A3[2200]                 mov word [token], ax
  6845                                  
  6846                                  ;-664     ORGDATAORIG=lexval; orgData=lexval; return; }
  6847                                  
  6848 000035DD A1[3600]                 mov ax, [lexval]
  6849 000035E0 A3[1400]                 mov word [ORGDATAORIG], ax
  6850 000035E3 A1[3600]                 mov ax, [lexval]
  6851 000035E6 A3[1600]                 mov word [orgData], ax
  6852 000035E9 E91801                   jmp @@retn
  6853                                  
  6854                                  ;-665   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
  6855                                  
  6856                                  @@dodefine359:
  6857 000035EC 68[0E37]                 push dodefine_1
  6858 000035EF 8D062B81                 lea  ax, [symbol]
  6859 000035F3 50                       push ax
  6860 000035F4 E8BA21                   call eqstr
  6861 000035F7 83C404                   add  sp, 4
  6862 000035FA 08C0                     or  al, al
  6863 000035FC 0F844900                 je @@dodefine360
  6864 00003600 E8E507                   call getlex
  6865 00003603 A3[2200]                 mov word [token], ax
  6866 00003606 A1[2200]                 mov ax, [token]
  6867 00003609 3D0201                   cmp ax, 258
  6868 0000360C 0F852700                 jne @@dodefine361
  6869                                  
  6870                                  ;-666     prs("\n;Use archive file: ");
  6871                                  
  6872 00003610 68[1637]                 push dodefine_2
  6873 00003613 E8CE10                   call prs
  6874 00003616 83C402                   add  sp, 2
  6875                                  
  6876                                  ;-667     strcpy(archivename, symbol); prs(archivename);
  6877                                  
  6878 00003619 8D062B81                 lea  ax, [symbol]
  6879 0000361D 50                       push ax
  6880 0000361E 8D067482                 lea  ax, [archivename]
  6881 00003622 50                       push ax
  6882 00003623 E86420                   call strcpy
  6883 00003626 83C404                   add  sp, 4
  6884 00003629 8D067482                 lea  ax, [archivename]
  6885 0000362D 50                       push ax
  6886 0000362E E8B310                   call prs
  6887 00003631 83C402                   add  sp, 2
  6888                                  
  6889                                  ;-668     } else error1("Name of archive file missing"); token=getlex(); return;}
  6890                                  
  6891 00003634 E90900                   jmp @@dodefine362
  6892                                  @@dodefine361:
  6893 00003637 68[2C37]                 push dodefine_3
  6894 0000363A E89013                   call error1
  6895 0000363D 83C402                   add  sp, 2
  6896                                  @@dodefine362:
  6897 00003640 E8A507                   call getlex
  6898 00003643 A3[2200]                 mov word [token], ax
  6899 00003646 E9BB00                   jmp @@retn
  6900                                  
  6901                                  ;-669    expect(T_NAME);
  6902                                  
  6903                                  @@dodefine360:
  6904 00003649 680001                   push 256
  6905 0000364C E8820F                   call expect
  6906 0000364F 83C402                   add  sp, 2
  6907                                  
  6908                                  ;-670   if (token==T_CONST) { 
  6909                                  
  6910 00003652 A1[2200]                 mov ax, [token]
  6911 00003655 3D0101                   cmp ax, 257
  6912 00003658 0F85A800                 jne @@dodefine363
  6913                                  
  6914                                  ;-671     if (GTop >= LSTART) error1("global table (define) full");
  6915                                  
  6916 0000365C A1[3200]                 mov ax, [GTop]
  6917 0000365F 3DC800                   cmp ax, 200 ;unsigned : 1
  6918 00003662 0F8C0900                 jl  @@dodefine364
  6919 00003666 68[4937]                 push dodefine_4
  6920 00003669 E86113                   call error1
  6921 0000366C 83C402                   add  sp, 2
  6922                                  
  6923                                  ;-672     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
  6924                                  
  6925                                  @@dodefine364:
  6926 0000366F 8D062B81                 lea  ax, [symbol]
  6927 00003673 50                       push ax
  6928 00003674 E8EB1F                   call strlen
  6929 00003677 83C402                   add  sp, 2
  6930 0000367A 8946FE                   mov [bp-2], ax
  6931 0000367D 8B46FE                   mov ax, [bp-2]
  6932 00003680 83F80F                   cmp ax, 15
  6933 00003683 0F8E0900                 jle @@dodefine365
  6934 00003687 68[6437]                 push dodefine_5
  6935 0000368A E84013                   call error1
  6936 0000368D 83C402                   add  sp, 2
  6937                                  
  6938                                  ;-673     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
  6939                                  
  6940                                  @@dodefine365:
  6941 00003690 B85500                   mov ax, 85
  6942 00003693 8B1E[3200]               mov bx, [GTop]
  6943 00003697 8887E383                 mov [GSign+bx], al
  6944 0000369B B80100                   mov ax, 1
  6945 0000369E 8B1E[3200]               mov bx, [GTop]
  6946 000036A2 88870F85                 mov [GWidth+bx], al
  6947 000036A6 B82300                   mov ax, 35
  6948 000036A9 8B1E[3200]               mov bx, [GTop]
  6949 000036AD 8887B782                 mov [GType+bx], al
  6950                                  
  6951                                  ;-674     GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  6952                                  
  6953 000036B1 A1[6E00]                 mov ax, [lineno]
  6954 000036B4 83E801                   sub ax, 1
  6955 000036B7 8B1E[3200]               mov bx, [GTop]
  6956 000036BB D1E3                     shl bx, 1
  6957 000036BD 89873B86                 mov [GAdr+bx], ax
  6958 000036C1 B80000                   mov ax, 0
  6959 000036C4 8B1E[3200]               mov bx, [GTop]
  6960 000036C8 D1E3                     shl bx, 1
  6961 000036CA 89879388                 mov [GUsed+bx], ax
  6962                                  
  6963                                  ;-675     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
  6964                                  
  6965 000036CE FF36[3200]               push word [GTop]
  6966 000036D2 E84ECF                   call adrofname
  6967 000036D5 83C402                   add  sp, 2
  6968 000036D8 A3[7200]                 mov word [pt], ax
  6969 000036DB 8D062B81                 lea  ax, [symbol]
  6970 000036DF 50                       push ax
  6971 000036E0 FF36[7200]               push word [pt]
  6972 000036E4 E8A31F                   call strcpy
  6973 000036E7 83C404                   add  sp, 4
  6974 000036EA A1[3600]                 mov ax, [lexval]
  6975 000036ED 8B1E[3200]               mov bx, [GTop]
  6976 000036F1 D1E3                     shl bx, 1
  6977 000036F3 8987EB8A                 mov [GData+bx], ax
  6978                                  
  6979                                  ;-676     expect(T_CONST); GTop++;  } 
  6980                                  
  6981 000036F7 680101                   push 257
  6982 000036FA E8D40E                   call expect
  6983 000036FD 83C402                   add  sp, 2
  6984 00003700 FF06[3200]               inc  word[GTop]
  6985                                  
  6986                                  ;-677 }
  6987                                  
  6988                                  @@dodefine363:
  6989                                  
  6990                                  ;-678 int stmt() { int c; char cha;
  6991                                  
  6992 00003704 C9                      @@retn: LEAVE
  6993 00003705 C3                       ret
  6994                                  ; ENDP
  6995 00003706 4F52474441544100        dodefine_0 db "ORGDATA",0
  6996 0000370E 4152434849564500        dodefine_1 db "ARCHIVE",0
  6997 00003716 5C6E3B557365206172-     dodefine_2 db "\n;Use archive file: ",0
  6998 0000371F 63686976652066696C-
  6999 00003728 653A2000           
  7000 0000372C 4E616D65206F662061-     dodefine_3 db "Name of archive file missing",0
  7001 00003735 726368697665206669-
  7002 0000373E 6C65206D697373696E-
  7003 00003747 6700               
  7004 00003749 676C6F62616C207461-     dodefine_4 db "global table (define) full",0
  7005 00003752 626C65202864656669-
  7006 0000375B 6E65292066756C6C00 
  7007 00003764 446566696E65206E61-     dodefine_5 db "Define name longer 15 char",0
  7008 0000376D 6D65206C6F6E676572-
  7009 00003776 203135206368617200 
  7010                                  
  7011                                  stmt:  ; *** PROC ***
  7012                                  
  7013                                  ;-679        if(istoken('{'))     {while(istoken('}')==0) stmt();}
  7014                                  
  7015                                  ;Function : stmt, Number of local variables: 2
  7016                                  ;   # type sign width addr used name   list of local variables
  7017                                  ;  200 var sign word   678 NULL c = bp-2
  7018                                  ;  201 var sign byte   678 NULL cha = bp-4;
  7019 0000377F C8040000                 ENTER  4,0
  7020 00003783 6A7B                     push 123
  7021 00003785 E8270E                   call istoken
  7022 00003788 83C402                   add  sp, 2
  7023 0000378B 08C0                     or  al, al
  7024 0000378D 0F841700                 je @@stmt366
  7025                                  @@stmt367:
  7026 00003791 6A7D                     push 125
  7027 00003793 E8190E                   call istoken
  7028 00003796 83C402                   add  sp, 2
  7029 00003799 83F800                   cmp ax, 0
  7030 0000379C 0F850500                 jne @@stmt368
  7031 000037A0 E8DCFF                   call stmt
  7032 000037A3 EBEC                     jmp @@stmt367
  7033                                  @@stmt368:
  7034                                  
  7035                                  ;-680   else if(istoken(T_IF))    doif();
  7036                                  
  7037 000037A5 E90502                   jmp @@stmt369
  7038                                  @@stmt366:
  7039 000037A8 680102                   push 513
  7040 000037AB E8010E                   call istoken
  7041 000037AE 83C402                   add  sp, 2
  7042 000037B1 08C0                     or  al, al
  7043 000037B3 0F840600                 je @@stmt370
  7044 000037B7 E84204                   call doif
  7045                                  
  7046                                  ;-681   else if(istoken(T_DO))    dodo();
  7047                                  
  7048 000037BA E9F001                   jmp @@stmt371
  7049                                  @@stmt370:
  7050 000037BD 680402                   push 516
  7051 000037C0 E8EC0D                   call istoken
  7052 000037C3 83C402                   add  sp, 2
  7053 000037C6 08C0                     or  al, al
  7054 000037C8 0F840600                 je @@stmt372
  7055 000037CC E82105                   call dodo
  7056                                  
  7057                                  ;-682   else if(istoken(T_WHILE)) dowhile();
  7058                                  
  7059 000037CF E9DB01                   jmp @@stmt373
  7060                                  @@stmt372:
  7061 000037D2 680302                   push 515
  7062 000037D5 E8D70D                   call istoken
  7063 000037D8 83C402                   add  sp, 2
  7064 000037DB 08C0                     or  al, al
  7065 000037DD 0F840600                 je @@stmt374
  7066 000037E1 E85905                   call dowhile
  7067                                  
  7068                                  ;-683   else if(istoken(T_GOTO))  {prs("\n jmp @@");name1();prs(symbol);expect(';');}
  7069                                  
  7070 000037E4 E9C601                   jmp @@stmt375
  7071                                  @@stmt374:
  7072 000037E7 680902                   push 521
  7073 000037EA E8C20D                   call istoken
  7074 000037ED 83C402                   add  sp, 2
  7075 000037F0 08C0                     or  al, al
  7076 000037F2 0F842200                 je @@stmt376
  7077 000037F6 68[AF39]                 push stmt_0
  7078 000037F9 E8E80E                   call prs
  7079 000037FC 83C402                   add  sp, 2
  7080 000037FF E880D0                   call name1
  7081 00003802 8D062B81                 lea  ax, [symbol]
  7082 00003806 50                       push ax
  7083 00003807 E8DA0E                   call prs
  7084 0000380A 83C402                   add  sp, 2
  7085 0000380D 6A3B                     push 59
  7086 0000380F E8BF0D                   call expect
  7087 00003812 83C402                   add  sp, 2
  7088                                  
  7089                                  ;-684   else if(token==T_ASM)     {prs("\n"); c=next();
  7090                                  
  7091 00003815 E99501                   jmp @@stmt377
  7092                                  @@stmt376:
  7093 00003818 A1[2200]                 mov ax, [token]
  7094 0000381B 3D0602                   cmp ax, 518
  7095 0000381E 0F853300                 jne @@stmt378
  7096 00003822 68[B939]                 push stmt_1
  7097 00003825 E8BC0E                   call prs
  7098 00003828 83C402                   add  sp, 2
  7099 0000382B E8630D                   call next
  7100 0000382E 8946FE                   mov [bp-2], ax
  7101                                  
  7102                                  ;-685     while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  7103                                  
  7104                                  @@stmt379:
  7105 00003831 8B46FE                   mov ax, [bp-2]
  7106 00003834 83F80A                   cmp ax, 10
  7107 00003837 0F841100                 je  @@stmt380
  7108 0000383B FF76FE                   push word [bp-2]
  7109 0000383E E83C0E                   call prc
  7110 00003841 83C402                   add  sp, 2
  7111 00003844 E84A0D                   call next
  7112 00003847 8946FE                   mov [bp-2], ax
  7113 0000384A EBE5                     jmp @@stmt379
  7114                                  @@stmt380:
  7115 0000384C E89905                   call getlex
  7116 0000384F A3[2200]                 mov word [token], ax
  7117                                  
  7118                                  ;-686   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
  7119                                  
  7120 00003852 E95801                   jmp @@stmt381
  7121                                  @@stmt378:
  7122 00003855 680702                   push 519
  7123 00003858 E8540D                   call istoken
  7124 0000385B 83C402                   add  sp, 2
  7125 0000385E 08C0                     or  al, al
  7126 00003860 0F844B00                 je @@stmt382
  7127 00003864 A1[2200]                 mov ax, [token]
  7128 00003867 83F87B                   cmp ax, 123
  7129 0000386A 0F853500                 jne @@stmt383
  7130 0000386E 68[BC39]                 push stmt_2
  7131 00003871 E8700E                   call prs
  7132 00003874 83C402                   add  sp, 2
  7133 00003877 E8170D                   call next
  7134 0000387A 8846FC                   mov [bp-4], al
  7135                                  
  7136                                  ;-687     while(cha!= '}') { prc(cha); cha=next(); }
  7137                                  
  7138                                  @@stmt384:
  7139 0000387D 8A46FC                   mov al, [bp-4]
  7140 00003880 3C7D                     cmp al, 125
  7141 00003882 0F841400                 je  @@stmt385
  7142 00003886 8A46FC                   mov al, byte [bp-4]
  7143 00003889 B400                     mov ah, 0
  7144 0000388B 50                       push ax
  7145 0000388C E8EE0D                   call prc
  7146 0000388F 83C402                   add  sp, 2
  7147 00003892 E8FC0C                   call next
  7148 00003895 8846FC                   mov [bp-4], al
  7149                                  
  7150                                  ;-688     token=getlex(); }
  7151                                  
  7152 00003898 EBE3                     jmp @@stmt384
  7153                                  @@stmt385:
  7154 0000389A E84B05                   call getlex
  7155 0000389D A3[2200]                 mov word [token], ax
  7156                                  
  7157                                  ;-689     else error1("Curly open expected"); }
  7158                                  
  7159 000038A0 E90900                   jmp @@stmt386
  7160                                  @@stmt383:
  7161 000038A3 68[BF39]                 push stmt_3
  7162 000038A6 E82411                   call error1
  7163 000038A9 83C402                   add  sp, 2
  7164                                  @@stmt386:
  7165                                  
  7166                                  ;-690   else if(istoken(T_INTH))  {prs("\n int  "); expect(T_CONST);
  7167                                  
  7168 000038AC E9FE00                   jmp @@stmt387
  7169                                  @@stmt382:
  7170 000038AF 685802                   push 600
  7171 000038B2 E8FA0C                   call istoken
  7172 000038B5 83C402                   add  sp, 2
  7173 000038B8 08C0                     or  al, al
  7174 000038BA 0F842700                 je @@stmt388
  7175 000038BE 68[D339]                 push stmt_4
  7176 000038C1 E8200E                   call prs
  7177 000038C4 83C402                   add  sp, 2
  7178 000038C7 680101                   push 257
  7179 000038CA E8040D                   call expect
  7180 000038CD 83C402                   add  sp, 2
  7181                                  
  7182                                  ;-691     prunsign1(lexval); expect(';');    }
  7183                                  
  7184 000038D0 FF36[3600]               push word [lexval]
  7185 000038D4 E8670F                   call prunsign1
  7186 000038D7 83C402                   add  sp, 2
  7187 000038DA 6A3B                     push 59
  7188 000038DC E8F20C                   call expect
  7189 000038DF 83C402                   add  sp, 2
  7190                                  
  7191                                  ;-692   else if(istoken(T_IFCARRY))doifcarry();
  7192                                  
  7193 000038E2 E9C800                   jmp @@stmt389
  7194                                  @@stmt388:
  7195 000038E5 685902                   push 601
  7196 000038E8 E8C40C                   call istoken
  7197 000038EB 83C402                   add  sp, 2
  7198 000038EE 08C0                     or  al, al
  7199 000038F0 0F840600                 je @@stmt390
  7200 000038F4 E86703                   call doifcarry
  7201                                  
  7202                                  ;-693   else if(istoken(T_IFZERO))doifzero();
  7203                                  
  7204 000038F7 E9B300                   jmp @@stmt391
  7205                                  @@stmt390:
  7206 000038FA 685A02                   push 602
  7207 000038FD E8AF0C                   call istoken
  7208 00003900 83C402                   add  sp, 2
  7209 00003903 08C0                     or  al, al
  7210 00003905 0F840600                 je @@stmt392
  7211 00003909 E89B03                   call doifzero
  7212                                  
  7213                                  ;-694   else if(istoken(T_EMIT))   doemit();
  7214                                  
  7215 0000390C E99E00                   jmp @@stmt393
  7216                                  @@stmt392:
  7217 0000390F 680802                   push 520
  7218 00003912 E89A0C                   call istoken
  7219 00003915 83C402                   add  sp, 2
  7220 00003918 08C0                     or  al, al
  7221 0000391A 0F840600                 je @@stmt394
  7222 0000391E E8CE00                   call doemit
  7223                                  
  7224                                  ;-695   else if(istoken(';'))      { }
  7225                                  
  7226 00003921 E98900                   jmp @@stmt395
  7227                                  @@stmt394:
  7228 00003924 6A3B                     push 59
  7229 00003926 E8860C                   call istoken
  7230 00003929 83C402                   add  sp, 2
  7231 0000392C 08C0                     or  al, al
  7232 0000392E 0F840300                 je @@stmt396
  7233                                  
  7234                                  ;-696   else if(istoken(T_RETURN)) {if (token!=';') exprstart();
  7235                                  
  7236 00003932 E97800                   jmp @@stmt397
  7237                                  @@stmt396:
  7238 00003935 680002                   push 512
  7239 00003938 E8740C                   call istoken
  7240 0000393B 83C402                   add  sp, 2
  7241 0000393E 08C0                     or  al, al
  7242 00003940 0F842500                 je @@stmt398
  7243 00003944 A1[2200]                 mov ax, [token]
  7244 00003947 83F83B                   cmp ax, 59
  7245 0000394A 0F840300                 je  @@stmt399
  7246 0000394E E814D6                   call exprstart
  7247                                  
  7248                                  ;-697     prs("\n jmp @@retn"); nreturn++; expect(';');}
  7249                                  
  7250                                  @@stmt399:
  7251 00003951 68[DC39]                 push stmt_5
  7252 00003954 E88D0D                   call prs
  7253 00003957 83C402                   add  sp, 2
  7254 0000395A FF06[2C00]               inc  word[nreturn]
  7255 0000395E 6A3B                     push 59
  7256 00003960 E86E0C                   call expect
  7257 00003963 83C402                   add  sp, 2
  7258                                  
  7259                                  ;-698   else if(thechar==':')      {prs("\n@@"); // Label
  7260                                  
  7261 00003966 E94400                   jmp @@stmt400
  7262                                  @@stmt398:
  7263 00003969 A0[2700]                 mov al, [thechar]
  7264 0000396C 3C3A                     cmp al, 58
  7265 0000396E 0F853000                 jne @@stmt401
  7266 00003972 68[EA39]                 push stmt_6
  7267 00003975 E86C0D                   call prs
  7268 00003978 83C402                   add  sp, 2
  7269                                  
  7270                                  ;-699      prs(symbol); prc(':');  expect(T_NAME); expect(':'); }
  7271                                  
  7272 0000397B 8D062B81                 lea  ax, [symbol]
  7273 0000397F 50                       push ax
  7274 00003980 E8610D                   call prs
  7275 00003983 83C402                   add  sp, 2
  7276 00003986 6A3A                     push 58
  7277 00003988 E8F20C                   call prc
  7278 0000398B 83C402                   add  sp, 2
  7279 0000398E 680001                   push 256
  7280 00003991 E83D0C                   call expect
  7281 00003994 83C402                   add  sp, 2
  7282 00003997 6A3A                     push 58
  7283 00003999 E8350C                   call expect
  7284 0000399C 83C402                   add  sp, 2
  7285                                  
  7286                                  ;-700   else                       {exprstart(); expect(';'); } }
  7287                                  
  7288 0000399F E90B00                   jmp @@stmt402
  7289                                  @@stmt401:
  7290 000039A2 E8C0D5                   call exprstart
  7291 000039A5 6A3B                     push 59
  7292 000039A7 E8270C                   call expect
  7293 000039AA 83C402                   add  sp, 2
  7294                                  @@stmt402:
  7295                                  @@stmt400:
  7296                                  @@stmt397:
  7297                                  @@stmt395:
  7298                                  @@stmt393:
  7299                                  @@stmt391:
  7300                                  @@stmt389:
  7301                                  @@stmt387:
  7302                                  @@stmt381:
  7303                                  @@stmt377:
  7304                                  @@stmt375:
  7305                                  @@stmt373:
  7306                                  @@stmt371:
  7307                                  @@stmt369:
  7308                                  
  7309                                  ;-701 
  7310                                  
  7311                                  
  7312                                  ;-702 int doemit() {prs("\n db ");
  7313 000039AD C9                       LEAVE
  7314 000039AE C3                       ret
  7315                                  ; ENDP
  7316 000039AF 5C6E206A6D70204040-     stmt_0 db "\n jmp @@",0
  7317 000039B8 00                 
  7318 000039B9 5C6E00                  stmt_1 db "\n",0
  7319 000039BC 5C6E00                  stmt_2 db "\n",0
  7320 000039BF 4375726C79206F7065-     stmt_3 db "Curly open expected",0
  7321 000039C8 6E2065787065637465-
  7322 000039D1 6400               
  7323 000039D3 5C6E20696E74202000      stmt_4 db "\n int  ",0
  7324 000039DC 5C6E206A6D70204040-     stmt_5 db "\n jmp @@retn",0
  7325 000039E5 7265746E00         
  7326 000039EA 5C6E404000              stmt_6 db "\n@@",0
  7327                                  
  7328                                  doemit:  ; *** PROC ***
  7329 000039EF 68[2B3A]                 push doemit_0
  7330 000039F2 E8EF0C                   call prs
  7331 000039F5 83C402                   add  sp, 2
  7332                                  
  7333                                  ;-703   L1: token=getlex(); prunsign1(lexval); token=getlex();
  7334                                  
  7335                                  @@L1:
  7336 000039F8 E8ED03                   call getlex
  7337 000039FB A3[2200]                 mov word [token], ax
  7338 000039FE FF36[3600]               push word [lexval]
  7339 00003A02 E8390E                   call prunsign1
  7340 00003A05 83C402                   add  sp, 2
  7341 00003A08 E8DD03                   call getlex
  7342 00003A0B A3[2200]                 mov word [token], ax
  7343                                  
  7344                                  ;-704     if (token== ',') {prc(','); goto L1;} expect(')'); }
  7345                                  
  7346 00003A0E A1[2200]                 mov ax, [token]
  7347 00003A11 83F82C                   cmp ax, 44
  7348 00003A14 0F850A00                 jne @@doemit403
  7349 00003A18 6A2C                     push 44
  7350 00003A1A E8600C                   call prc
  7351 00003A1D 83C402                   add  sp, 2
  7352 00003A20 EBD6                     jmp @@L1
  7353                                  @@doemit403:
  7354 00003A22 6A29                     push 41
  7355 00003A24 E8AA0B                   call expect
  7356 00003A27 83C402                   add  sp, 2
  7357                                  
  7358                                  ;-705 
  7359                                  
  7360                                  
  7361                                  ;-706 int cmpneg(int ids) {
  7362                                  
  7363 00003A2A C3                       ret
  7364                                  ; ENDP
  7365 00003A2B 5C6E2064622000          doemit_0 db "\n db ",0
  7366                                  
  7367                                  cmpneg:  ; *** PROC ***
  7368                                  
  7369                                  ;-707        if(iscmp==T_EQ) prs("\n jne @@");         //ZF=0
  7370                                  
  7371                                  ;Function : cmpneg, Number of local variables: 1
  7372                                  ;   # type sign width addr used name   list of local variables
  7373                                  ;  200 var sign word   706 NULL ids = bp+4;
  7374 00003A32 C8000000                 ENTER  0,0
  7375 00003A36 A1[2800]                 mov ax, [iscmp]
  7376 00003A39 3D2603                   cmp ax, 806
  7377 00003A3C 0F850C00                 jne @@cmpneg404
  7378 00003A40 68[133B]                 push cmpneg_0
  7379 00003A43 E89E0C                   call prs
  7380 00003A46 83C402                   add  sp, 2
  7381                                  
  7382                                  ;-708   else if(iscmp==T_NE) prs("\n je  @@");         //ZF=1
  7383                                  
  7384 00003A49 E9C500                   jmp @@cmpneg405
  7385                                  @@cmpneg404:
  7386 00003A4C A1[2800]                 mov ax, [iscmp]
  7387 00003A4F 3D2703                   cmp ax, 807
  7388 00003A52 0F850C00                 jne @@cmpneg406
  7389 00003A56 68[1D3B]                 push cmpneg_1
  7390 00003A59 E8880C                   call prs
  7391 00003A5C 83C402                   add  sp, 2
  7392                                  
  7393                                  ;-709   else if(iscmp==T_LE) if (ids) prs("\n jg  @@");//ZF=0      SF =OF
  7394                                  
  7395 00003A5F E9AF00                   jmp @@cmpneg407
  7396                                  @@cmpneg406:
  7397 00003A62 A1[2800]                 mov ax, [iscmp]
  7398 00003A65 3D3803                   cmp ax, 824
  7399 00003A68 0F852100                 jne @@cmpneg408
  7400 00003A6C 8B4604                   mov ax, [bp+4]
  7401 00003A6F 08C0                     or  al, al
  7402 00003A71 0F840C00                 je @@cmpneg409
  7403 00003A75 68[273B]                 push cmpneg_2
  7404 00003A78 E8690C                   call prs
  7405 00003A7B 83C402                   add  sp, 2
  7406                                  
  7407                                  ;-710                            else prs("\n ja  @@");//ZF=0 CF=0
  7408                                  
  7409 00003A7E E90900                   jmp @@cmpneg410
  7410                                  @@cmpneg409:
  7411 00003A81 68[313B]                 push cmpneg_3
  7412 00003A84 E85D0C                   call prs
  7413 00003A87 83C402                   add  sp, 2
  7414                                  
  7415                                  ;-711   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
  7416                                  
  7417                                  @@cmpneg410:
  7418 00003A8A E98400                   jmp @@cmpneg411
  7419                                  @@cmpneg408:
  7420 00003A8D A1[2800]                 mov ax, [iscmp]
  7421 00003A90 3D2B03                   cmp ax, 811
  7422 00003A93 0F854500                 jne @@cmpneg412
  7423 00003A97 8B4604                   mov ax, [bp+4]
  7424 00003A9A 08C0                     or  al, al
  7425 00003A9C 0F841E00                 je @@cmpneg413
  7426 00003AA0 68[3B3B]                 push cmpneg_4
  7427 00003AA3 E83E0C                   call prs
  7428 00003AA6 83C402                   add  sp, 2
  7429 00003AA9 FF7604                   push word [bp+4]
  7430 00003AAC E88F0D                   call prunsign1
  7431 00003AAF 83C402                   add  sp, 2
  7432                                  
  7433                                  ;-712                                prs("\n jl  @@");}//          SF!=OF
  7434                                  
  7435 00003AB2 68[493B]                 push cmpneg_5
  7436 00003AB5 E82C0C                   call prs
  7437 00003AB8 83C402                   add  sp, 2
  7438                                  
  7439                                  ;-713                            else{prs(" ;unsigned : "); prunsign1(ids);
  7440                                  
  7441 00003ABB E91B00                   jmp @@cmpneg414
  7442                                  @@cmpneg413:
  7443 00003ABE 68[533B]                 push cmpneg_6
  7444 00003AC1 E8200C                   call prs
  7445 00003AC4 83C402                   add  sp, 2
  7446 00003AC7 FF7604                   push word [bp+4]
  7447 00003ACA E8710D                   call prunsign1
  7448 00003ACD 83C402                   add  sp, 2
  7449                                  
  7450                                  ;-714                                prs("\n jb  @@");}//jb=jc=CF=1
  7451                                  
  7452 00003AD0 68[613B]                 push cmpneg_7
  7453 00003AD3 E80E0C                   call prs
  7454 00003AD6 83C402                   add  sp, 2
  7455                                  
  7456                                  ;-715   else if(iscmp=='<' ) prs("\n jge @@");         //          SF =OF
  7457                                  
  7458                                  @@cmpneg414:
  7459 00003AD9 E93500                   jmp @@cmpneg415
  7460                                  @@cmpneg412:
  7461 00003ADC A1[2800]                 mov ax, [iscmp]
  7462 00003ADF 83F83C                   cmp ax, 60
  7463 00003AE2 0F850C00                 jne @@cmpneg416
  7464 00003AE6 68[6B3B]                 push cmpneg_8
  7465 00003AE9 E8F80B                   call prs
  7466 00003AEC 83C402                   add  sp, 2
  7467                                  
  7468                                  ;-716   else if(iscmp=='>' ) prs("\n jle @@");         //ZF=1 oder SF!=OF
  7469                                  
  7470 00003AEF E91F00                   jmp @@cmpneg417
  7471                                  @@cmpneg416:
  7472 00003AF2 A1[2800]                 mov ax, [iscmp]
  7473 00003AF5 83F83E                   cmp ax, 62
  7474 00003AF8 0F850C00                 jne @@cmpneg418
  7475 00003AFC 68[753B]                 push cmpneg_9
  7476 00003AFF E8E20B                   call prs
  7477 00003B02 83C402                   add  sp, 2
  7478                                  
  7479                                  ;-717   else error1("Vergleich unbekannt in CMPNEG()");  }
  7480                                  
  7481 00003B05 E90900                   jmp @@cmpneg419
  7482                                  @@cmpneg418:
  7483 00003B08 68[7F3B]                 push cmpneg_10
  7484 00003B0B E8BF0E                   call error1
  7485 00003B0E 83C402                   add  sp, 2
  7486                                  @@cmpneg419:
  7487                                  @@cmpneg417:
  7488                                  @@cmpneg415:
  7489                                  @@cmpneg411:
  7490                                  @@cmpneg407:
  7491                                  @@cmpneg405:
  7492                                  
  7493                                  ;-718 
  7494                                  
  7495                                  
  7496                                  ;-719 int prlabel(int n) {prs("\n@@"); prs(fname); pint1(n); prc(':'); }
  7497 00003B11 C9                       LEAVE
  7498 00003B12 C3                       ret
  7499                                  ; ENDP
  7500 00003B13 5C6E206A6E65204040-     cmpneg_0 db "\n jne @@",0
  7501 00003B1C 00                 
  7502 00003B1D 5C6E206A6520204040-     cmpneg_1 db "\n je  @@",0
  7503 00003B26 00                 
  7504 00003B27 5C6E206A6720204040-     cmpneg_2 db "\n jg  @@",0
  7505 00003B30 00                 
  7506 00003B31 5C6E206A6120204040-     cmpneg_3 db "\n ja  @@",0
  7507 00003B3A 00                 
  7508 00003B3B 203B756E7369676E65-     cmpneg_4 db " ;unsigned : ",0
  7509 00003B44 64203A2000         
  7510 00003B49 5C6E206A6C20204040-     cmpneg_5 db "\n jl  @@",0
  7511 00003B52 00                 
  7512 00003B53 203B756E7369676E65-     cmpneg_6 db " ;unsigned : ",0
  7513 00003B5C 64203A2000         
  7514 00003B61 5C6E206A6220204040-     cmpneg_7 db "\n jb  @@",0
  7515 00003B6A 00                 
  7516 00003B6B 5C6E206A6765204040-     cmpneg_8 db "\n jge @@",0
  7517 00003B74 00                 
  7518 00003B75 5C6E206A6C65204040-     cmpneg_9 db "\n jle @@",0
  7519 00003B7E 00                 
  7520 00003B7F 566572676C65696368-     cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0
  7521 00003B88 20756E62656B616E6E-
  7522 00003B91 7420696E20434D504E-
  7523 00003B9A 4547282900         
  7524                                  
  7525                                  prlabel:  ; *** PROC ***
  7526                                  ;Function : prlabel, Number of local variables: 1
  7527                                  ;   # type sign width addr used name   list of local variables
  7528                                  ;  200 var sign word   719 NULL n = bp+4;
  7529 00003B9F C8000000                 ENTER  0,0
  7530 00003BA3 68[CA3B]                 push prlabel_0
  7531 00003BA6 E83B0B                   call prs
  7532 00003BA9 83C402                   add  sp, 2
  7533 00003BAC 8D06AB81                 lea  ax, [fname]
  7534 00003BB0 50                       push ax
  7535 00003BB1 E8300B                   call prs
  7536 00003BB4 83C402                   add  sp, 2
  7537 00003BB7 FF7604                   push word [bp+4]
  7538 00003BBA E81E0C                   call pint1
  7539 00003BBD 83C402                   add  sp, 2
  7540 00003BC0 6A3A                     push 58
  7541 00003BC2 E8B80A                   call prc
  7542 00003BC5 83C402                   add  sp, 2
  7543                                  
  7544                                  ;-720 int prjump (int n) {prs("\n jmp @@"); prs(fname); pint1(n); }
  7545 00003BC8 C9                       LEAVE
  7546 00003BC9 C3                       ret
  7547                                  ; ENDP
  7548 00003BCA 5C6E404000              prlabel_0 db "\n@@",0
  7549                                  
  7550                                  prjump:  ; *** PROC ***
  7551                                  ;Function : prjump, Number of local variables: 1
  7552                                  ;   # type sign width addr used name   list of local variables
  7553                                  ;  200 var sign word   720 NULL n = bp+4;
  7554 00003BCF C8000000                 ENTER  0,0
  7555 00003BD3 68[F23B]                 push prjump_0
  7556 00003BD6 E80B0B                   call prs
  7557 00003BD9 83C402                   add  sp, 2
  7558 00003BDC 8D06AB81                 lea  ax, [fname]
  7559 00003BE0 50                       push ax
  7560 00003BE1 E8000B                   call prs
  7561 00003BE4 83C402                   add  sp, 2
  7562 00003BE7 FF7604                   push word [bp+4]
  7563 00003BEA E8EE0B                   call pint1
  7564 00003BED 83C402                   add  sp, 2
  7565                                  
  7566                                  ;-721 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  7567 00003BF0 C9                       LEAVE
  7568 00003BF1 C3                       ret
  7569                                  ; ENDP
  7570 00003BF2 5C6E206A6D70204040-     prjump_0 db "\n jmp @@",0
  7571 00003BFB 00                 
  7572                                  
  7573                                  doif:  ; *** PROC ***
  7574                                  ;Function : doif, Number of local variables: 2
  7575                                  ;   # type sign width addr used name   list of local variables
  7576                                  ;  200 var sign word   721 NULL jdest = bp-2
  7577                                  ;  201 var sign word   721 NULL tst = bp-4;
  7578 00003BFC C8040000                 ENTER  4,0
  7579 00003C00 E8D5D1                   call pexpr
  7580 00003C03 FF06[2E00]               inc  word[nlabel]
  7581 00003C07 A1[2E00]                 mov ax, [nlabel]
  7582 00003C0A 8946FE                   mov [bp-2], ax
  7583                                  
  7584                                  ;-722   pint1(jdest); stmt();
  7585                                  
  7586 00003C0D FF76FE                   push word [bp-2]
  7587 00003C10 E8C80B                   call pint1
  7588 00003C13 83C402                   add  sp, 2
  7589 00003C16 E866FB                   call stmt
  7590                                  
  7591                                  ;-723   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
  7592                                  
  7593 00003C19 680202                   push 514
  7594 00003C1C E89009                   call istoken
  7595 00003C1F 83C402                   add  sp, 2
  7596 00003C22 08C0                     or  al, al
  7597 00003C24 0F842B00                 je @@doif420
  7598 00003C28 FF06[2E00]               inc  word[nlabel]
  7599 00003C2C A1[2E00]                 mov ax, [nlabel]
  7600 00003C2F 8946FC                   mov [bp-4], ax
  7601                                  
  7602                                  ;-724     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  7603                                  
  7604 00003C32 FF76FC                   push word [bp-4]
  7605 00003C35 E897FF                   call prjump
  7606 00003C38 83C402                   add  sp, 2
  7607 00003C3B FF76FE                   push word [bp-2]
  7608 00003C3E E85EFF                   call prlabel
  7609 00003C41 83C402                   add  sp, 2
  7610 00003C44 E838FB                   call stmt
  7611 00003C47 FF76FC                   push word [bp-4]
  7612 00003C4A E852FF                   call prlabel
  7613 00003C4D 83C402                   add  sp, 2
  7614                                  
  7615                                  ;-725   else prlabel(jdest); }
  7616                                  
  7617 00003C50 E90900                   jmp @@doif421
  7618                                  @@doif420:
  7619 00003C53 FF76FE                   push word [bp-2]
  7620 00003C56 E846FF                   call prlabel
  7621 00003C59 83C402                   add  sp, 2
  7622                                  @@doif421:
  7623                                  
  7624                                  ;-726 int doifcarry() {int jdest;  nlabel++; jdest=nlabel;
  7625 00003C5C C9                       LEAVE
  7626 00003C5D C3                       ret
  7627                                  ; ENDP
  7628                                  
  7629                                  doifcarry:  ; *** PROC ***
  7630                                  ;Function : doifcarry, Number of local variables: 1
  7631                                  ;   # type sign width addr used name   list of local variables
  7632                                  ;  200 var sign word   726 NULL jdest = bp-2;
  7633 00003C5E C8020000                 ENTER  2,0
  7634 00003C62 FF06[2E00]               inc  word[nlabel]
  7635 00003C66 A1[2E00]                 mov ax, [nlabel]
  7636 00003C69 8946FE                   mov [bp-2], ax
  7637                                  
  7638                                  ;-727   prs("\n jae short @@");/*jnc*/ prs(fname);  pint1(jdest);
  7639                                  
  7640 00003C6C 68[973C]                 push doifcarry_0
  7641 00003C6F E8720A                   call prs
  7642 00003C72 83C402                   add  sp, 2
  7643 00003C75 8D06AB81                 lea  ax, [fname]
  7644 00003C79 50                       push ax
  7645 00003C7A E8670A                   call prs
  7646 00003C7D 83C402                   add  sp, 2
  7647 00003C80 FF76FE                   push word [bp-2]
  7648 00003C83 E8550B                   call pint1
  7649 00003C86 83C402                   add  sp, 2
  7650                                  
  7651                                  ;-728   stmt(); prlabel(jdest); }
  7652                                  
  7653 00003C89 E8F3FA                   call stmt
  7654 00003C8C FF76FE                   push word [bp-2]
  7655 00003C8F E80DFF                   call prlabel
  7656 00003C92 83C402                   add  sp, 2
  7657                                  
  7658                                  ;-729 int doifzero() {int jdest;  nlabel++; jdest=nlabel;
  7659 00003C95 C9                       LEAVE
  7660 00003C96 C3                       ret
  7661                                  ; ENDP
  7662 00003C97 5C6E206A6165207368-     doifcarry_0 db "\n jae short @@",0
  7663 00003CA0 6F727420404000     
  7664                                  
  7665                                  doifzero:  ; *** PROC ***
  7666                                  ;Function : doifzero, Number of local variables: 1
  7667                                  ;   # type sign width addr used name   list of local variables
  7668                                  ;  200 var sign word   729 NULL jdest = bp-2;
  7669 00003CA7 C8020000                 ENTER  2,0
  7670 00003CAB FF06[2E00]               inc  word[nlabel]
  7671 00003CAF A1[2E00]                 mov ax, [nlabel]
  7672 00003CB2 8946FE                   mov [bp-2], ax
  7673                                  
  7674                                  ;-730   prs("\n jne short @@");        prs(fname);  pint1(jdest);
  7675                                  
  7676 00003CB5 68[E03C]                 push doifzero_0
  7677 00003CB8 E8290A                   call prs
  7678 00003CBB 83C402                   add  sp, 2
  7679 00003CBE 8D06AB81                 lea  ax, [fname]
  7680 00003CC2 50                       push ax
  7681 00003CC3 E81E0A                   call prs
  7682 00003CC6 83C402                   add  sp, 2
  7683 00003CC9 FF76FE                   push word [bp-2]
  7684 00003CCC E80C0B                   call pint1
  7685 00003CCF 83C402                   add  sp, 2
  7686                                  
  7687                                  ;-731   stmt(); prlabel(jdest); }
  7688                                  
  7689 00003CD2 E8AAFA                   call stmt
  7690 00003CD5 FF76FE                   push word [bp-2]
  7691 00003CD8 E8C4FE                   call prlabel
  7692 00003CDB 83C402                   add  sp, 2
  7693                                  
  7694                                  ;-732 int dodo() {int jdest; int jtemp;
  7695 00003CDE C9                       LEAVE
  7696 00003CDF C3                       ret
  7697                                  ; ENDP
  7698 00003CE0 5C6E206A6E65207368-     doifzero_0 db "\n jne short @@",0
  7699 00003CE9 6F727420404000     
  7700                                  
  7701                                  dodo:  ; *** PROC ***
  7702                                  
  7703                                  ;-733   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  7704                                  
  7705                                  ;Function : dodo, Number of local variables: 2
  7706                                  ;   # type sign width addr used name   list of local variables
  7707                                  ;  200 var sign word   732 NULL jdest = bp-2
  7708                                  ;  201 var sign word   732 NULL jtemp = bp-4;
  7709 00003CF0 C8040000                 ENTER  4,0
  7710 00003CF4 FF06[2E00]               inc  word[nlabel]
  7711 00003CF8 A1[2E00]                 mov ax, [nlabel]
  7712 00003CFB 8946FE                   mov [bp-2], ax
  7713 00003CFE FF76FE                   push word [bp-2]
  7714 00003D01 E89BFE                   call prlabel
  7715 00003D04 83C402                   add  sp, 2
  7716 00003D07 E875FA                   call stmt
  7717                                  
  7718                                  ;-734   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  7719                                  
  7720 00003D0A 680302                   push 515
  7721 00003D0D E8C108                   call expect
  7722 00003D10 83C402                   add  sp, 2
  7723 00003D13 E8C2D0                   call pexpr
  7724 00003D16 FF06[2E00]               inc  word[nlabel]
  7725 00003D1A A1[2E00]                 mov ax, [nlabel]
  7726 00003D1D 8946FC                   mov [bp-4], ax
  7727 00003D20 FF76FC                   push word [bp-4]
  7728 00003D23 E8B50A                   call pint1
  7729 00003D26 83C402                   add  sp, 2
  7730                                  
  7731                                  ;-735   prjump(jdest); prlabel(jtemp); }
  7732                                  
  7733 00003D29 FF76FE                   push word [bp-2]
  7734 00003D2C E8A0FE                   call prjump
  7735 00003D2F 83C402                   add  sp, 2
  7736 00003D32 FF76FC                   push word [bp-4]
  7737 00003D35 E867FE                   call prlabel
  7738 00003D38 83C402                   add  sp, 2
  7739                                  
  7740                                  ;-736 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  7741 00003D3B C9                       LEAVE
  7742 00003D3C C3                       ret
  7743                                  ; ENDP
  7744                                  
  7745                                  dowhile:  ; *** PROC ***
  7746                                  ;Function : dowhile, Number of local variables: 2
  7747                                  ;   # type sign width addr used name   list of local variables
  7748                                  ;  200 var sign word   736 NULL jdest = bp-2
  7749                                  ;  201 var sign word   736 NULL tst = bp-4;
  7750 00003D3D C8040000                 ENTER  4,0
  7751 00003D41 FF06[2E00]               inc  word[nlabel]
  7752 00003D45 A1[2E00]                 mov ax, [nlabel]
  7753 00003D48 8946FE                   mov [bp-2], ax
  7754                                  
  7755                                  ;-737   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  7756                                  
  7757 00003D4B FF76FE                   push word [bp-2]
  7758 00003D4E E84EFE                   call prlabel
  7759 00003D51 83C402                   add  sp, 2
  7760 00003D54 E881D0                   call pexpr
  7761 00003D57 FF06[2E00]               inc  word[nlabel]
  7762 00003D5B A1[2E00]                 mov ax, [nlabel]
  7763 00003D5E 8946FC                   mov [bp-4], ax
  7764 00003D61 FF76FC                   push word [bp-4]
  7765 00003D64 E8740A                   call pint1
  7766 00003D67 83C402                   add  sp, 2
  7767                                  
  7768                                  ;-738   stmt(); prjump(jdest); prlabel(tst); }
  7769                                  
  7770 00003D6A E812FA                   call stmt
  7771 00003D6D FF76FE                   push word [bp-2]
  7772 00003D70 E85CFE                   call prjump
  7773 00003D73 83C402                   add  sp, 2
  7774 00003D76 FF76FC                   push word [bp-4]
  7775 00003D79 E823FE                   call prlabel
  7776 00003D7C 83C402                   add  sp, 2
  7777                                  
  7778                                  ;-739 int isrelational() {
  7779 00003D7F C9                       LEAVE
  7780 00003D80 C3                       ret
  7781                                  ; ENDP
  7782                                  
  7783                                  isrelational:  ; *** PROC ***
  7784                                  
  7785                                  ;-740   if (token==T_EQ) goto w; if (token==T_NE) goto w;
  7786                                  
  7787 00003D81 A1[2200]                 mov ax, [token]
  7788 00003D84 3D2603                   cmp ax, 806
  7789 00003D87 0F850300                 jne @@isrelational422
  7790 00003D8B E94700                   jmp @@w
  7791                                  @@isrelational422:
  7792 00003D8E A1[2200]                 mov ax, [token]
  7793 00003D91 3D2703                   cmp ax, 807
  7794 00003D94 0F850300                 jne @@isrelational423
  7795 00003D98 E93A00                   jmp @@w
  7796                                  
  7797                                  ;-741   if (token==T_LE) goto w; if (token==T_GE) goto w;
  7798                                  
  7799                                  @@isrelational423:
  7800 00003D9B A1[2200]                 mov ax, [token]
  7801 00003D9E 3D3803                   cmp ax, 824
  7802 00003DA1 0F850300                 jne @@isrelational424
  7803 00003DA5 E92D00                   jmp @@w
  7804                                  @@isrelational424:
  7805 00003DA8 A1[2200]                 mov ax, [token]
  7806 00003DAB 3D2B03                   cmp ax, 811
  7807 00003DAE 0F850300                 jne @@isrelational425
  7808 00003DB2 E92000                   jmp @@w
  7809                                  
  7810                                  ;-742   if (token=='<' ) goto w; if (token=='>' ) goto w;
  7811                                  
  7812                                  @@isrelational425:
  7813 00003DB5 A1[2200]                 mov ax, [token]
  7814 00003DB8 83F83C                   cmp ax, 60
  7815 00003DBB 0F850300                 jne @@isrelational426
  7816 00003DBF E91300                   jmp @@w
  7817                                  @@isrelational426:
  7818 00003DC2 A1[2200]                 mov ax, [token]
  7819 00003DC5 83F83E                   cmp ax, 62
  7820 00003DC8 0F850300                 jne @@isrelational427
  7821 00003DCC E90600                   jmp @@w
  7822                                  
  7823                                  ;-743   return 0;  w: iscmp=token; token=getlex(); return 1;}
  7824                                  
  7825                                  @@isrelational427:
  7826 00003DCF B80000                   mov ax, 0
  7827 00003DD2 E91200                   jmp @@retn
  7828                                  @@w:
  7829 00003DD5 A1[2200]                 mov ax, [token]
  7830 00003DD8 A3[2800]                 mov word [iscmp], ax
  7831 00003DDB E80A00                   call getlex
  7832 00003DDE A3[2200]                 mov word [token], ax
  7833 00003DE1 B80100                   mov ax, 1
  7834 00003DE4 E90000                   jmp @@retn
  7835                                  
  7836                                  ;-744  
  7837                                  
  7838                                  
  7839                                  ;-745 char symboltemp[80];    
  7840                                  
  7841                                  @@retn:
  7842 00003DE7 C3                       ret
  7843                                  ; ENDP
  7844                                  section .bss
  7845                                  absolute 53468
  7846 0000D0DC <res 00000050>          symboltemp resb 80
  7847                                  section .text
  7848                                  
  7849                                  ;-746 int getlex() { char c; char *p; 
  7850                                  
  7851                                  
  7852                                  getlex:  ; *** PROC ***
  7853                                  
  7854                                  ;-747 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  7855                                  
  7856                                  ;Function : getlex, Number of local variables: 2
  7857                                  ;   # type sign width addr used name   list of local variables
  7858                                  ;  200 var sign byte   746 NULL c = bp-2
  7859                                  ;  201 ptr sign byte   746 NULL p = bp-4;
  7860 00003DE8 C8040000                 ENTER  4,0
  7861                                  @@g1:
  7862 00003DEC E8A207                   call next
  7863 00003DEF 8846FE                   mov [bp-2], al
  7864 00003DF2 8A46FE                   mov al, [bp-2]
  7865 00003DF5 3C00                     cmp al, 0
  7866 00003DF7 0F850600                 jne @@getlex428
  7867 00003DFB B80000                   mov ax, 0
  7868 00003DFE E96D05                   jmp @@retn
  7869                                  @@getlex428:
  7870 00003E01 8A46FE                   mov al, [bp-2]
  7871 00003E04 3C20                     cmp al, 32
  7872 00003E06 0F8F0200                 jg  @@getlex429
  7873 00003E0A EBE0                     jmp @@g1
  7874                                  
  7875                                  ;-748   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  7876                                  
  7877                                  @@getlex429:
  7878 00003E0C 8A46FE                   mov al, [bp-2]
  7879 00003E0F 3C3D                     cmp al, 61
  7880 00003E11 0F851200                 jne @@getlex430
  7881 00003E15 A0[2700]                 mov al, [thechar]
  7882 00003E18 3C3D                     cmp al, 61
  7883 00003E1A 0F850900                 jne @@getlex431
  7884 00003E1E E87007                   call next
  7885 00003E21 B82603                   mov ax, 806
  7886 00003E24 E94705                   jmp @@retn
  7887                                  @@getlex431:
  7888                                  
  7889                                  ;-749   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  7890                                  
  7891                                  @@getlex430:
  7892 00003E27 8A46FE                   mov al, [bp-2]
  7893 00003E2A 3C21                     cmp al, 33
  7894 00003E2C 0F851200                 jne @@getlex432
  7895 00003E30 A0[2700]                 mov al, [thechar]
  7896 00003E33 3C3D                     cmp al, 61
  7897 00003E35 0F850900                 jne @@getlex433
  7898 00003E39 E85507                   call next
  7899 00003E3C B82703                   mov ax, 807
  7900 00003E3F E92C05                   jmp @@retn
  7901                                  @@getlex433:
  7902                                  
  7903                                  ;-750   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  7904                                  
  7905                                  @@getlex432:
  7906 00003E42 8A46FE                   mov al, [bp-2]
  7907 00003E45 3C3C                     cmp al, 60
  7908 00003E47 0F851200                 jne @@getlex434
  7909 00003E4B A0[2700]                 mov al, [thechar]
  7910 00003E4E 3C3D                     cmp al, 61
  7911 00003E50 0F850900                 jne @@getlex435
  7912 00003E54 E83A07                   call next
  7913 00003E57 B83803                   mov ax, 824
  7914 00003E5A E91105                   jmp @@retn
  7915                                  @@getlex435:
  7916                                  
  7917                                  ;-751   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  7918                                  
  7919                                  @@getlex434:
  7920 00003E5D 8A46FE                   mov al, [bp-2]
  7921 00003E60 3C3E                     cmp al, 62
  7922 00003E62 0F851200                 jne @@getlex436
  7923 00003E66 A0[2700]                 mov al, [thechar]
  7924 00003E69 3C3D                     cmp al, 61
  7925 00003E6B 0F850900                 jne @@getlex437
  7926 00003E6F E81F07                   call next
  7927 00003E72 B82B03                   mov ax, 811
  7928 00003E75 E9F604                   jmp @@retn
  7929                                  @@getlex437:
  7930                                  
  7931                                  ;-752   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  7932                                  
  7933                                  @@getlex436:
  7934 00003E78 8A46FE                   mov al, [bp-2]
  7935 00003E7B 3C3C                     cmp al, 60
  7936 00003E7D 0F851200                 jne @@getlex438
  7937 00003E81 A0[2700]                 mov al, [thechar]
  7938 00003E84 3C3C                     cmp al, 60
  7939 00003E86 0F850900                 jne @@getlex439
  7940 00003E8A E80407                   call next
  7941 00003E8D B8D804                   mov ax, 1240
  7942 00003E90 E9DB04                   jmp @@retn
  7943                                  @@getlex439:
  7944                                  
  7945                                  ;-753   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  7946                                  
  7947                                  @@getlex438:
  7948 00003E93 8A46FE                   mov al, [bp-2]
  7949 00003E96 3C3E                     cmp al, 62
  7950 00003E98 0F851200                 jne @@getlex440
  7951 00003E9C A0[2700]                 mov al, [thechar]
  7952 00003E9F 3C3E                     cmp al, 62
  7953 00003EA1 0F850900                 jne @@getlex441
  7954 00003EA5 E8E906                   call next
  7955 00003EA8 B8D904                   mov ax, 1241
  7956 00003EAB E9C004                   jmp @@retn
  7957                                  @@getlex441:
  7958                                  
  7959                                  ;-754   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  7960                                  
  7961                                  @@getlex440:
  7962 00003EAE 8A46FE                   mov al, [bp-2]
  7963 00003EB1 3C2B                     cmp al, 43
  7964 00003EB3 0F851200                 jne @@getlex442
  7965 00003EB7 A0[2700]                 mov al, [thechar]
  7966 00003EBA 3C2B                     cmp al, 43
  7967 00003EBC 0F850900                 jne @@getlex443
  7968 00003EC0 E8CE06                   call next
  7969 00003EC3 B8C304                   mov ax, 1219
  7970 00003EC6 E9A504                   jmp @@retn
  7971                                  @@getlex443:
  7972                                  
  7973                                  ;-755   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  7974                                  
  7975                                  @@getlex442:
  7976 00003EC9 8A46FE                   mov al, [bp-2]
  7977 00003ECC 3C2D                     cmp al, 45
  7978 00003ECE 0F851200                 jne @@getlex444
  7979 00003ED2 A0[2700]                 mov al, [thechar]
  7980 00003ED5 3C2D                     cmp al, 45
  7981 00003ED7 0F850900                 jne @@getlex445
  7982 00003EDB E8B306                   call next
  7983 00003EDE B8C904                   mov ax, 1225
  7984 00003EE1 E98A04                   jmp @@retn
  7985                                  @@getlex445:
  7986                                  
  7987                                  ;-756   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  7988                                  
  7989                                  @@getlex444:
  7990 00003EE4 8A46FE                   mov al, [bp-2]
  7991 00003EE7 3C2B                     cmp al, 43
  7992 00003EE9 0F851200                 jne @@getlex446
  7993 00003EED A0[2700]                 mov al, [thechar]
  7994 00003EF0 3C3D                     cmp al, 61
  7995 00003EF2 0F850900                 jne @@getlex447
  7996 00003EF6 E89806                   call next
  7997 00003EF9 B8CE04                   mov ax, 1230
  7998 00003EFC E96F04                   jmp @@retn
  7999                                  @@getlex447:
  8000                                  
  8001                                  ;-757   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  8002                                  
  8003                                  @@getlex446:
  8004 00003EFF 8A46FE                   mov al, [bp-2]
  8005 00003F02 3C2D                     cmp al, 45
  8006 00003F04 0F851200                 jne @@getlex448
  8007 00003F08 A0[2700]                 mov al, [thechar]
  8008 00003F0B 3C3D                     cmp al, 61
  8009 00003F0D 0F850900                 jne @@getlex449
  8010 00003F11 E87D06                   call next
  8011 00003F14 B8CF04                   mov ax, 1231
  8012 00003F17 E95404                   jmp @@retn
  8013                                  @@getlex449:
  8014                                  
  8015                                  ;-758   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  8016                                  
  8017                                  @@getlex448:
  8018 00003F1A 8A46FE                   mov al, [bp-2]
  8019 00003F1D 3C26                     cmp al, 38
  8020 00003F1F 0F851200                 jne @@getlex450
  8021 00003F23 A0[2700]                 mov al, [thechar]
  8022 00003F26 3C3D                     cmp al, 61
  8023 00003F28 0F850900                 jne @@getlex451
  8024 00003F2C E86206                   call next
  8025 00003F2F B8D204                   mov ax, 1234
  8026 00003F32 E93904                   jmp @@retn
  8027                                  @@getlex451:
  8028                                  
  8029                                  ;-759   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  8030                                  
  8031                                  @@getlex450:
  8032 00003F35 8A46FE                   mov al, [bp-2]
  8033 00003F38 3C7C                     cmp al, 124
  8034 00003F3A 0F851200                 jne @@getlex452
  8035 00003F3E A0[2700]                 mov al, [thechar]
  8036 00003F41 3C3D                     cmp al, 61
  8037 00003F43 0F850900                 jne @@getlex453
  8038 00003F47 E84706                   call next
  8039 00003F4A B8D304                   mov ax, 1235
  8040 00003F4D E91E04                   jmp @@retn
  8041                                  @@getlex453:
  8042                                  
  8043                                  ;-760   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  8044                                  
  8045                                  @@getlex452:
  8046 00003F50 8A46FE                   mov al, [bp-2]
  8047 00003F53 3C2A                     cmp al, 42
  8048 00003F55 0F851200                 jne @@getlex454
  8049 00003F59 A0[2700]                 mov al, [thechar]
  8050 00003F5C 3C3D                     cmp al, 61
  8051 00003F5E 0F850900                 jne @@getlex455
  8052 00003F62 E82C06                   call next
  8053 00003F65 B8D004                   mov ax, 1232
  8054 00003F68 E90304                   jmp @@retn
  8055                                  @@getlex455:
  8056                                  
  8057                                  ;-761   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  8058                                  
  8059                                  @@getlex454:
  8060 00003F6B 8A46FE                   mov al, [bp-2]
  8061 00003F6E 3C2F                     cmp al, 47
  8062 00003F70 0F851200                 jne @@getlex456
  8063 00003F74 A0[2700]                 mov al, [thechar]
  8064 00003F77 3C3D                     cmp al, 61
  8065 00003F79 0F850900                 jne @@getlex457
  8066 00003F7D E81106                   call next
  8067 00003F80 B8D104                   mov ax, 1233
  8068 00003F83 E9E803                   jmp @@retn
  8069                                  @@getlex457:
  8070                                  
  8071                                  ;-762   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  8072                                  
  8073                                  @@getlex456:
  8074 00003F86 8A46FE                   mov al, byte [bp-2]
  8075 00003F89 B400                     mov ah, 0
  8076 00003F8B 50                       push ax
  8077 00003F8C 68[7043]                 push getlex_0
  8078 00003F8F E82817                   call instr1
  8079 00003F92 83C404                   add  sp, 4
  8080 00003F95 08C0                     or  al, al
  8081 00003F97 0F840600                 je @@getlex458
  8082 00003F9B 8A46FE                   mov al, [bp-2]
  8083 00003F9E E9CD03                   jmp @@retn
  8084                                  
  8085                                  ;-763   if (c == '/') { if (thechar == '/') {
  8086                                  
  8087                                  @@getlex458:
  8088 00003FA1 8A46FE                   mov al, [bp-2]
  8089 00003FA4 3C2F                     cmp al, 47
  8090 00003FA6 0F852000                 jne @@getlex459
  8091 00003FAA A0[2700]                 mov al, [thechar]
  8092 00003FAD 3C2F                     cmp al, 47
  8093 00003FAF 0F851700                 jne @@getlex460
  8094                                  
  8095                                  ;-764       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  8096                                  
  8097                                  @@getlex461:
  8098 00003FB3 E8DB05                   call next
  8099 00003FB6 8846FE                   mov [bp-2], al
  8100 00003FB9 8A46FE                   mov al, [bp-2]
  8101 00003FBC 3C0D                     cmp al, 13
  8102 00003FBE 0F840200                 je  @@getlex462
  8103 00003FC2 EBEF                     jmp @@getlex461
  8104                                  @@getlex462:
  8105 00003FC4 E821FE                   call getlex
  8106 00003FC7 E9A403                   jmp @@retn
  8107                                  @@getlex460:
  8108                                  
  8109                                  ;-765   if (c == '/') { if (thechar == '*') {
  8110                                  
  8111                                  @@getlex459:
  8112 00003FCA 8A46FE                   mov al, [bp-2]
  8113 00003FCD 3C2F                     cmp al, 47
  8114 00003FCF 0F853A00                 jne @@getlex463
  8115 00003FD3 A0[2700]                 mov al, [thechar]
  8116 00003FD6 3C2A                     cmp al, 42
  8117 00003FD8 0F852B00                 jne @@getlex464
  8118                                  
  8119                                  ;-766       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
  8120                                  
  8121                                  @@g2:
  8122 00003FDC E8B205                   call next
  8123 00003FDF 8846FE                   mov [bp-2], al
  8124 00003FE2 8A46FE                   mov al, [bp-2]
  8125 00003FE5 3C2A                     cmp al, 42
  8126 00003FE7 0F840200                 je  @@getlex465
  8127 00003FEB EBEF                     jmp @@g2
  8128                                  @@getlex465:
  8129 00003FED A0[2700]                 mov al, [thechar]
  8130 00003FF0 3C2F                     cmp al, 47
  8131 00003FF2 0F840200                 je  @@getlex466
  8132 00003FF6 EBE4                     jmp @@g2
  8133                                  
  8134                                  ;-767       c=next(); return getlex(); } else  return '/'; }
  8135                                  
  8136                                  @@getlex466:
  8137 00003FF8 E89605                   call next
  8138 00003FFB 8846FE                   mov [bp-2], al
  8139 00003FFE E8E7FD                   call getlex
  8140 00004001 E96A03                   jmp @@retn
  8141 00004004 E90600                   jmp @@getlex467
  8142                                  @@getlex464:
  8143 00004007 B82F00                   mov ax, 47
  8144 0000400A E96103                   jmp @@retn
  8145                                  @@getlex467:
  8146                                  
  8147                                  ;-768   if (c == '"') {getstring(c); return T_STRING;}
  8148                                  
  8149                                  @@getlex463:
  8150 0000400D 8A46FE                   mov al, [bp-2]
  8151 00004010 3C22                     cmp al, 34
  8152 00004012 0F851200                 jne @@getlex468
  8153 00004016 8A46FE                   mov al, byte [bp-2]
  8154 00004019 B400                     mov ah, 0
  8155 0000401B 50                       push ax
  8156 0000401C E83B05                   call getstring
  8157 0000401F 83C402                   add  sp, 2
  8158 00004022 B80201                   mov ax, 258
  8159 00004025 E94603                   jmp @@retn
  8160                                  
  8161                                  ;-769   if (digit(c)) { getdigit(c); return T_CONST; }
  8162                                  
  8163                                  @@getlex468:
  8164 00004028 8A46FE                   mov al, byte [bp-2]
  8165 0000402B B400                     mov ah, 0
  8166 0000402D 50                       push ax
  8167 0000402E E8ED16                   call digit
  8168 00004031 83C402                   add  sp, 2
  8169 00004034 08C0                     or  al, al
  8170 00004036 0F841200                 je @@getlex469
  8171 0000403A 8A46FE                   mov al, byte [bp-2]
  8172 0000403D B400                     mov ah, 0
  8173 0000403F 50                       push ax
  8174 00004040 E84104                   call getdigit
  8175 00004043 83C402                   add  sp, 2
  8176 00004046 B80101                   mov ax, 257
  8177 00004049 E92203                   jmp @@retn
  8178                                  
  8179                                  ;-770   if (c==39) { lexval=next();
  8180                                  
  8181                                  @@getlex469:
  8182 0000404C 8A46FE                   mov al, [bp-2]
  8183 0000404F 3C27                     cmp al, 39
  8184 00004051 0F854F00                 jne @@getlex470
  8185 00004055 E83905                   call next
  8186 00004058 A3[3600]                 mov word [lexval], ax
  8187                                  
  8188                                  ;-771     if (lexval==92) {lexval=next();
  8189                                  
  8190 0000405B A1[3600]                 mov ax, [lexval]
  8191 0000405E 83F85C                   cmp ax, 92
  8192 00004061 0F853600                 jne @@getlex471
  8193 00004065 E82905                   call next
  8194 00004068 A3[3600]                 mov word [lexval], ax
  8195                                  
  8196                                  ;-772       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
  8197                                  
  8198 0000406B A1[3600]                 mov ax, [lexval]
  8199 0000406E 83F86E                   cmp ax, 110
  8200 00004071 0F850600                 jne @@getlex472
  8201 00004075 B80A00                   mov ax, 10
  8202 00004078 A3[3600]                 mov word [lexval], ax
  8203                                  @@getlex472:
  8204 0000407B A1[3600]                 mov ax, [lexval]
  8205 0000407E 83F874                   cmp ax, 116
  8206 00004081 0F850600                 jne @@getlex473
  8207 00004085 B80900                   mov ax, 9
  8208 00004088 A3[3600]                 mov word [lexval], ax
  8209                                  
  8210                                  ;-773       if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  8211                                  
  8212                                  @@getlex473:
  8213 0000408B A1[3600]                 mov ax, [lexval]
  8214 0000408E 83F830                   cmp ax, 48
  8215 00004091 0F850600                 jne @@getlex474
  8216 00004095 B80000                   mov ax, 0
  8217 00004098 A3[3600]                 mov word [lexval], ax
  8218                                  @@getlex474:
  8219                                  @@getlex471:
  8220 0000409B E8F304                   call next
  8221 0000409E B80101                   mov ax, 257
  8222 000040A1 E9CA02                   jmp @@retn
  8223                                  
  8224                                  ;-774   if (letter(c)) { 
  8225                                  
  8226                                  @@getlex470:
  8227 000040A4 8A46FE                   mov al, byte [bp-2]
  8228 000040A7 B400                     mov ah, 0
  8229 000040A9 50                       push ax
  8230 000040AA E89B16                   call letter
  8231 000040AD 83C402                   add  sp, 2
  8232 000040B0 08C0                     or  al, al
  8233 000040B2 0F84AF02                 je @@getlex475
  8234                                  
  8235                                  ;-775     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
  8236                                  
  8237 000040B6 8D062B81                 lea  ax, [symbol]
  8238 000040BA 50                       push ax
  8239 000040BB 8D06DCD0                 lea  ax, [symboltemp]
  8240 000040BF 50                       push ax
  8241 000040C0 E8C715                   call strcpy
  8242 000040C3 83C404                   add  sp, 4
  8243 000040C6 B82B81                   mov ax, symbol
  8244 000040C9 8946FC                   mov [bp-4], ax
  8245 000040CC 8A46FE                   mov al, [bp-2]
  8246 000040CF 8B5EFC                   mov  bx, [bp-4]
  8247 000040D2 8807                     mov  [bx], al
  8248 000040D4 FF46FC                   inc  word[bp-4]
  8249                                  
  8250                                  ;-776     while(letter(thechar)) {c=next(); *p=c;  p++; } 
  8251                                  
  8252                                  @@getlex476:
  8253 000040D7 A0[2700]                 mov al, byte [thechar]
  8254 000040DA B400                     mov ah, 0
  8255 000040DC 50                       push ax
  8256 000040DD E86816                   call letter
  8257 000040E0 83C402                   add  sp, 2
  8258 000040E3 08C0                     or  al, al
  8259 000040E5 0F841300                 je @@getlex477
  8260 000040E9 E8A504                   call next
  8261 000040EC 8846FE                   mov [bp-2], al
  8262 000040EF 8A46FE                   mov al, [bp-2]
  8263 000040F2 8B5EFC                   mov  bx, [bp-4]
  8264 000040F5 8807                     mov  [bx], al
  8265 000040F7 FF46FC                   inc  word[bp-4]
  8266                                  
  8267                                  ;-777       *p=0;
  8268                                  
  8269 000040FA EBDB                     jmp @@getlex476
  8270                                  @@getlex477:
  8271 000040FC B80000                   mov ax, 0
  8272 000040FF 8B5EFC                   mov  bx, [bp-4]
  8273 00004102 8807                     mov  [bx], al
  8274                                  
  8275                                  ;-778     if (eqstr(symbol,"signed"  )) return T_SIGNED;
  8276                                  
  8277 00004104 68[8643]                 push getlex_1
  8278 00004107 8D062B81                 lea  ax, [symbol]
  8279 0000410B 50                       push ax
  8280 0000410C E8A216                   call eqstr
  8281 0000410F 83C404                   add  sp, 4
  8282 00004112 08C0                     or  al, al
  8283 00004114 0F840600                 je @@getlex478
  8284 00004118 B81302                   mov ax, 531
  8285 0000411B E95002                   jmp @@retn
  8286                                  
  8287                                  ;-779     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
  8288                                  
  8289                                  @@getlex478:
  8290 0000411E 68[8D43]                 push getlex_2
  8291 00004121 8D062B81                 lea  ax, [symbol]
  8292 00004125 50                       push ax
  8293 00004126 E88816                   call eqstr
  8294 00004129 83C404                   add  sp, 4
  8295 0000412C 08C0                     or  al, al
  8296 0000412E 0F840600                 je @@getlex479
  8297 00004132 B81402                   mov ax, 532
  8298 00004135 E93602                   jmp @@retn
  8299                                  
  8300                                  ;-780     if (eqstr(symbol,"void"    )) return T_VOID;
  8301                                  
  8302                                  @@getlex479:
  8303 00004138 68[9643]                 push getlex_3
  8304 0000413B 8D062B81                 lea  ax, [symbol]
  8305 0000413F 50                       push ax
  8306 00004140 E86E16                   call eqstr
  8307 00004143 83C404                   add  sp, 4
  8308 00004146 08C0                     or  al, al
  8309 00004148 0F840600                 je @@getlex480
  8310 0000414C B81102                   mov ax, 529
  8311 0000414F E91C02                   jmp @@retn
  8312                                  
  8313                                  ;-781     if (eqstr(symbol,"int"     )) return T_INT;
  8314                                  
  8315                                  @@getlex480:
  8316 00004152 68[9B43]                 push getlex_4
  8317 00004155 8D062B81                 lea  ax, [symbol]
  8318 00004159 50                       push ax
  8319 0000415A E85416                   call eqstr
  8320 0000415D 83C404                   add  sp, 4
  8321 00004160 08C0                     or  al, al
  8322 00004162 0F840600                 je @@getlex481
  8323 00004166 B80502                   mov ax, 517
  8324 00004169 E90202                   jmp @@retn
  8325                                  
  8326                                  ;-782     if (eqstr(symbol,"short"   )) return T_SHORT;
  8327                                  
  8328                                  @@getlex481:
  8329 0000416C 68[9F43]                 push getlex_5
  8330 0000416F 8D062B81                 lea  ax, [symbol]
  8331 00004173 50                       push ax
  8332 00004174 E83A16                   call eqstr
  8333 00004177 83C404                   add  sp, 4
  8334 0000417A 08C0                     or  al, al
  8335 0000417C 0F840600                 je @@getlex482
  8336 00004180 B81602                   mov ax, 534
  8337 00004183 E9E801                   jmp @@retn
  8338                                  
  8339                                  ;-783     if (eqstr(symbol,"long"    )) return T_LONG;
  8340                                  
  8341                                  @@getlex482:
  8342 00004186 68[A543]                 push getlex_6
  8343 00004189 8D062B81                 lea  ax, [symbol]
  8344 0000418D 50                       push ax
  8345 0000418E E82016                   call eqstr
  8346 00004191 83C404                   add  sp, 4
  8347 00004194 08C0                     or  al, al
  8348 00004196 0F840600                 je @@getlex483
  8349 0000419A B81502                   mov ax, 533
  8350 0000419D E9CE01                   jmp @@retn
  8351                                  
  8352                                  ;-784     if (eqstr(symbol,"uint32"  )) return T_UINT32;
  8353                                  
  8354                                  @@getlex483:
  8355 000041A0 68[AA43]                 push getlex_7
  8356 000041A3 8D062B81                 lea  ax, [symbol]
  8357 000041A7 50                       push ax
  8358 000041A8 E80616                   call eqstr
  8359 000041AB 83C404                   add  sp, 4
  8360 000041AE 08C0                     or  al, al
  8361 000041B0 0F840600                 je @@getlex484
  8362 000041B4 B82102                   mov ax, 545
  8363 000041B7 E9B401                   jmp @@retn
  8364                                  
  8365                                  ;-785     if (eqstr(symbol,"inth"    )) return T_INTH;
  8366                                  
  8367                                  @@getlex484:
  8368 000041BA 68[B143]                 push getlex_8
  8369 000041BD 8D062B81                 lea  ax, [symbol]
  8370 000041C1 50                       push ax
  8371 000041C2 E8EC15                   call eqstr
  8372 000041C5 83C404                   add  sp, 4
  8373 000041C8 08C0                     or  al, al
  8374 000041CA 0F840600                 je @@getlex485
  8375 000041CE B85802                   mov ax, 600
  8376 000041D1 E99A01                   jmp @@retn
  8377                                  
  8378                                  ;-786     if (eqstr(symbol,"char"    )) return T_CHAR;
  8379                                  
  8380                                  @@getlex485:
  8381 000041D4 68[B643]                 push getlex_9
  8382 000041D7 8D062B81                 lea  ax, [symbol]
  8383 000041DB 50                       push ax
  8384 000041DC E8D215                   call eqstr
  8385 000041DF 83C404                   add  sp, 4
  8386 000041E2 08C0                     or  al, al
  8387 000041E4 0F840600                 je @@getlex486
  8388 000041E8 B81202                   mov ax, 530
  8389 000041EB E98001                   jmp @@retn
  8390                                  
  8391                                  ;-787     if (eqstr(symbol,"asm"     )) return T_ASM;
  8392                                  
  8393                                  @@getlex486:
  8394 000041EE 68[BB43]                 push getlex_10
  8395 000041F1 8D062B81                 lea  ax, [symbol]
  8396 000041F5 50                       push ax
  8397 000041F6 E8B815                   call eqstr
  8398 000041F9 83C404                   add  sp, 4
  8399 000041FC 08C0                     or  al, al
  8400 000041FE 0F840600                 je @@getlex487
  8401 00004202 B80602                   mov ax, 518
  8402 00004205 E96601                   jmp @@retn
  8403                                  
  8404                                  ;-788     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
  8405                                  
  8406                                  @@getlex487:
  8407 00004208 68[BF43]                 push getlex_11
  8408 0000420B 8D062B81                 lea  ax, [symbol]
  8409 0000420F 50                       push ax
  8410 00004210 E89E15                   call eqstr
  8411 00004213 83C404                   add  sp, 4
  8412 00004216 08C0                     or  al, al
  8413 00004218 0F840600                 je @@getlex488
  8414 0000421C B80702                   mov ax, 519
  8415 0000421F E94C01                   jmp @@retn
  8416                                  
  8417                                  ;-789     if (eqstr(symbol,"__emit__")) return T_EMIT;
  8418                                  
  8419                                  @@getlex488:
  8420 00004222 68[C543]                 push getlex_12
  8421 00004225 8D062B81                 lea  ax, [symbol]
  8422 00004229 50                       push ax
  8423 0000422A E88415                   call eqstr
  8424 0000422D 83C404                   add  sp, 4
  8425 00004230 08C0                     or  al, al
  8426 00004232 0F840600                 je @@getlex489
  8427 00004236 B80802                   mov ax, 520
  8428 00004239 E93201                   jmp @@retn
  8429                                  
  8430                                  ;-790     if (eqstr(symbol,"return"  )) return T_RETURN;
  8431                                  
  8432                                  @@getlex489:
  8433 0000423C 68[CE43]                 push getlex_13
  8434 0000423F 8D062B81                 lea  ax, [symbol]
  8435 00004243 50                       push ax
  8436 00004244 E86A15                   call eqstr
  8437 00004247 83C404                   add  sp, 4
  8438 0000424A 08C0                     or  al, al
  8439 0000424C 0F840600                 je @@getlex490
  8440 00004250 B80002                   mov ax, 512
  8441 00004253 E91801                   jmp @@retn
  8442                                  
  8443                                  ;-791     if (eqstr(symbol,"if"      )) return T_IF;
  8444                                  
  8445                                  @@getlex490:
  8446 00004256 68[D543]                 push getlex_14
  8447 00004259 8D062B81                 lea  ax, [symbol]
  8448 0000425D 50                       push ax
  8449 0000425E E85015                   call eqstr
  8450 00004261 83C404                   add  sp, 4
  8451 00004264 08C0                     or  al, al
  8452 00004266 0F840600                 je @@getlex491
  8453 0000426A B80102                   mov ax, 513
  8454 0000426D E9FE00                   jmp @@retn
  8455                                  
  8456                                  ;-792     if (eqstr(symbol,"ifcarry" )) return T_IFCARRY;
  8457                                  
  8458                                  @@getlex491:
  8459 00004270 68[D843]                 push getlex_15
  8460 00004273 8D062B81                 lea  ax, [symbol]
  8461 00004277 50                       push ax
  8462 00004278 E83615                   call eqstr
  8463 0000427B 83C404                   add  sp, 4
  8464 0000427E 08C0                     or  al, al
  8465 00004280 0F840600                 je @@getlex492
  8466 00004284 B85902                   mov ax, 601
  8467 00004287 E9E400                   jmp @@retn
  8468                                  
  8469                                  ;-793     if (eqstr(symbol,"ifzero"  )) return T_IFZERO;
  8470                                  
  8471                                  @@getlex492:
  8472 0000428A 68[E043]                 push getlex_16
  8473 0000428D 8D062B81                 lea  ax, [symbol]
  8474 00004291 50                       push ax
  8475 00004292 E81C15                   call eqstr
  8476 00004295 83C404                   add  sp, 4
  8477 00004298 08C0                     or  al, al
  8478 0000429A 0F840600                 je @@getlex493
  8479 0000429E B85A02                   mov ax, 602
  8480 000042A1 E9CA00                   jmp @@retn
  8481                                  
  8482                                  ;-794     if (eqstr(symbol,"else"    )) return T_ELSE;
  8483                                  
  8484                                  @@getlex493:
  8485 000042A4 68[E743]                 push getlex_17
  8486 000042A7 8D062B81                 lea  ax, [symbol]
  8487 000042AB 50                       push ax
  8488 000042AC E80215                   call eqstr
  8489 000042AF 83C404                   add  sp, 4
  8490 000042B2 08C0                     or  al, al
  8491 000042B4 0F840600                 je @@getlex494
  8492 000042B8 B80202                   mov ax, 514
  8493 000042BB E9B000                   jmp @@retn
  8494                                  
  8495                                  ;-795     if (eqstr(symbol,"while"   )) return T_WHILE;
  8496                                  
  8497                                  @@getlex494:
  8498 000042BE 68[EC43]                 push getlex_18
  8499 000042C1 8D062B81                 lea  ax, [symbol]
  8500 000042C5 50                       push ax
  8501 000042C6 E8E814                   call eqstr
  8502 000042C9 83C404                   add  sp, 4
  8503 000042CC 08C0                     or  al, al
  8504 000042CE 0F840600                 je @@getlex495
  8505 000042D2 B80302                   mov ax, 515
  8506 000042D5 E99600                   jmp @@retn
  8507                                  
  8508                                  ;-796     if (eqstr(symbol,"do"      )) return T_DO;
  8509                                  
  8510                                  @@getlex495:
  8511 000042D8 68[F243]                 push getlex_19
  8512 000042DB 8D062B81                 lea  ax, [symbol]
  8513 000042DF 50                       push ax
  8514 000042E0 E8CE14                   call eqstr
  8515 000042E3 83C404                   add  sp, 4
  8516 000042E6 08C0                     or  al, al
  8517 000042E8 0F840600                 je @@getlex496
  8518 000042EC B80402                   mov ax, 516
  8519 000042EF E97C00                   jmp @@retn
  8520                                  
  8521                                  ;-797     if (eqstr(symbol,"goto"    )) return T_GOTO;
  8522                                  
  8523                                  @@getlex496:
  8524 000042F2 68[F543]                 push getlex_20
  8525 000042F5 8D062B81                 lea  ax, [symbol]
  8526 000042F9 50                       push ax
  8527 000042FA E8B414                   call eqstr
  8528 000042FD 83C404                   add  sp, 4
  8529 00004300 08C0                     or  al, al
  8530 00004302 0F840600                 je @@getlex497
  8531 00004306 B80902                   mov ax, 521
  8532 00004309 E96200                   jmp @@retn
  8533                                  
  8534                                  ;-798     if (eqstr(symbol,"define"  )) return T_DEFINE;   
  8535                                  
  8536                                  @@getlex497:
  8537 0000430C 68[FA43]                 push getlex_21
  8538 0000430F 8D062B81                 lea  ax, [symbol]
  8539 00004313 50                       push ax
  8540 00004314 E89A14                   call eqstr
  8541 00004317 83C404                   add  sp, 4
  8542 0000431A 08C0                     or  al, al
  8543 0000431C 0F840600                 je @@getlex498
  8544 00004320 B8FF01                   mov ax, 511
  8545 00004323 E94800                   jmp @@retn
  8546                                  
  8547                                  ;-799     if (eqstr(symbol,"include" )) return T_INCLUDE;   
  8548                                  
  8549                                  @@getlex498:
  8550 00004326 68[0144]                 push getlex_22
  8551 00004329 8D062B81                 lea  ax, [symbol]
  8552 0000432D 50                       push ax
  8553 0000432E E88014                   call eqstr
  8554 00004331 83C404                   add  sp, 4
  8555 00004334 08C0                     or  al, al
  8556 00004336 0F840600                 je @@getlex499
  8557 0000433A B8FE01                   mov ax, 510
  8558 0000433D E92E00                   jmp @@retn
  8559                                  
  8560                                  ;-800     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
  8561                                  
  8562                                  @@getlex499:
  8563 00004340 E8E000                   call convertdefine
  8564 00004343 08C0                     or  al, al
  8565 00004345 0F841600                 je @@getlex500
  8566 00004349 8D06DCD0                 lea  ax, [symboltemp]
  8567 0000434D 50                       push ax
  8568 0000434E 8D062B81                 lea  ax, [symbol]
  8569 00004352 50                       push ax
  8570 00004353 E83413                   call strcpy
  8571 00004356 83C404                   add  sp, 4
  8572 00004359 B80101                   mov ax, 257
  8573 0000435C E90F00                   jmp @@retn
  8574                                  
  8575                                  ;-801     return T_NAME; } error1("Input item not recognized"); }
  8576                                  
  8577                                  @@getlex500:
  8578 0000435F B80001                   mov ax, 256
  8579 00004362 E90900                   jmp @@retn
  8580                                  @@getlex475:
  8581 00004365 68[0944]                 push getlex_23
  8582 00004368 E86206                   call error1
  8583 0000436B 83C402                   add  sp, 2
  8584                                  
  8585                                  ;-802 
  8586                                  
  8587                                  
  8588                                  ;-803 int convertdefine() { int i; int j;   i=0;
  8589                                  
  8590 0000436E C9                      @@retn: LEAVE
  8591 0000436F C3                       ret
  8592                                  ; ENDP
  8593 00004370 28295B5D7B7D2C3B2A-     getlex_0 db "()[]{},;*:%-><=+!&|#?",0
  8594 00004379 3A252D3E3C3D2B2126-
  8595 00004382 7C233F00           
  8596 00004386 7369676E656400          getlex_1 db "signed",0
  8597 0000438D 756E7369676E656400      getlex_2 db "unsigned",0
  8598 00004396 766F696400              getlex_3 db "void",0
  8599 0000439B 696E7400                getlex_4 db "int",0
  8600 0000439F 73686F727400            getlex_5 db "short",0
  8601 000043A5 6C6F6E6700              getlex_6 db "long",0
  8602 000043AA 75696E74333200          getlex_7 db "uint32",0
  8603 000043B1 696E746800              getlex_8 db "inth",0
  8604 000043B6 6368617200              getlex_9 db "char",0
  8605 000043BB 61736D00                getlex_10 db "asm",0
  8606 000043BF 5F5F61736D00            getlex_11 db "__asm",0
  8607 000043C5 5F5F656D69745F5F00      getlex_12 db "__emit__",0
  8608 000043CE 72657475726E00          getlex_13 db "return",0
  8609 000043D5 696600                  getlex_14 db "if",0
  8610 000043D8 6966636172727900        getlex_15 db "ifcarry",0
  8611 000043E0 69667A65726F00          getlex_16 db "ifzero",0
  8612 000043E7 656C736500              getlex_17 db "else",0
  8613 000043EC 7768696C6500            getlex_18 db "while",0
  8614 000043F2 646F00                  getlex_19 db "do",0
  8615 000043F5 676F746F00              getlex_20 db "goto",0
  8616 000043FA 646566696E6500          getlex_21 db "define",0
  8617 00004401 696E636C75646500        getlex_22 db "include",0
  8618 00004409 496E70757420697465-     getlex_23 db "Input item not recognized",0
  8619 00004412 6D206E6F7420726563-
  8620 0000441B 6F676E697A656400   
  8621                                  
  8622                                  convertdefine:  ; *** PROC ***
  8623                                  ;Function : convertdefine, Number of local variables: 2
  8624                                  ;   # type sign width addr used name   list of local variables
  8625                                  ;  200 var sign word   803 NULL i = bp-2
  8626                                  ;  201 var sign word   803 NULL j = bp-4;
  8627 00004423 C8040000                 ENTER  4,0
  8628 00004427 B80000                   mov ax, 0
  8629 0000442A 8946FE                   mov [bp-2], ax
  8630                                  
  8631                                  ;-804   while (i < GTop) {
  8632                                  
  8633                                  @@convertdefine501:
  8634 0000442D 8B46FE                   mov ax, [bp-2]
  8635 00004430 3B06[3200]               cmp ax, [GTop]
  8636 00004434 0F8D4400                 jge @@convertdefine502
  8637                                  
  8638                                  ;-805    j=adrofname(i); 
  8639                                  
  8640 00004438 FF76FE                   push word [bp-2]
  8641 0000443B E8E5C1                   call adrofname
  8642 0000443E 83C402                   add  sp, 2
  8643 00004441 8946FC                   mov [bp-4], ax
  8644                                  
  8645                                  ;-806    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
  8646                                  
  8647 00004444 FF76FC                   push word [bp-4]
  8648 00004447 8D062B81                 lea  ax, [symbol]
  8649 0000444B 50                       push ax
  8650 0000444C E86213                   call eqstr
  8651 0000444F 83C404                   add  sp, 4
  8652 00004452 08C0                     or  al, al
  8653 00004454 0F841F00                 je @@convertdefine503
  8654 00004458 8B5EFE                   mov bx, [bp-2]
  8655 0000445B 8A87B782                 mov al, [GType + bx]
  8656 0000445F 3C23                     cmp al, 35
  8657 00004461 0F851200                 jne @@convertdefine504
  8658 00004465 8B5EFE                   mov bx, [bp-2]
  8659 00004468 D1E3                     shl bx, 1
  8660 0000446A 8B87EB8A                 mov ax, [GData + bx]
  8661 0000446E A3[3600]                 mov word [lexval], ax
  8662                                  
  8663                                  ;-807    return T_CONST; } }
  8664                                  
  8665 00004471 B80101                   mov ax, 257
  8666 00004474 E90B00                   jmp @@retn
  8667                                  @@convertdefine504:
  8668                                  
  8669                                  ;-808    i++; } 
  8670                                  
  8671                                  @@convertdefine503:
  8672 00004477 FF46FE                   inc  word[bp-2]
  8673                                  
  8674                                  ;-809    return 0; }
  8675                                  
  8676 0000447A EBB1                     jmp @@convertdefine501
  8677                                  @@convertdefine502:
  8678 0000447C B80000                   mov ax, 0
  8679 0000447F E90000                   jmp @@retn
  8680                                  
  8681                                  ;-810 int getdigit(char c) { int i;
  8682                                  
  8683 00004482 C9                      @@retn: LEAVE
  8684 00004483 C3                       ret
  8685                                  ; ENDP
  8686                                  
  8687                                  getdigit:  ; *** PROC ***
  8688                                  
  8689                                  ;-811     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
  8690                                  
  8691                                  ;Function : getdigit, Number of local variables: 2
  8692                                  ;   # type sign width addr used name   list of local variables
  8693                                  ;  200 var sign byte   810 NULL c = bp+4
  8694                                  ;  201 var sign word   810 NULL i = bp-2;
  8695 00004484 C8020000                 ENTER  2,0
  8696 00004488 B80000                   mov ax, 0
  8697 0000448B A3[3600]                 mov word [lexval], ax
  8698 0000448E 8A4604                   mov al, [bp+4]
  8699 00004491 2C30                     sub al, 48
  8700 00004493 A3[3600]                 mov word [lexval], ax
  8701                                  
  8702                                  ;-812     if (thechar=='x') thechar='X'; if (thechar=='X') { next();
  8703                                  
  8704 00004496 A0[2700]                 mov al, [thechar]
  8705 00004499 3C78                     cmp al, 120
  8706 0000449B 0F850600                 jne @@getdigit505
  8707 0000449F B85800                   mov ax, 88
  8708 000044A2 A2[2700]                 mov byte [thechar], al
  8709                                  @@getdigit505:
  8710 000044A5 A0[2700]                 mov al, [thechar]
  8711 000044A8 3C58                     cmp al, 88
  8712 000044AA 0F856800                 jne @@getdigit506
  8713 000044AE E8E000                   call next
  8714                                  
  8715                                  ;-813       while(letter(thechar)) { c=next(); if(c>96) c=c-39;
  8716                                  
  8717                                  @@getdigit507:
  8718 000044B1 A0[2700]                 mov al, byte [thechar]
  8719 000044B4 B400                     mov ah, 0
  8720 000044B6 50                       push ax
  8721 000044B7 E88E12                   call letter
  8722 000044BA 83C402                   add  sp, 2
  8723 000044BD 08C0                     or  al, al
  8724 000044BF 0F845000                 je @@getdigit508
  8725 000044C3 E8CB00                   call next
  8726 000044C6 884604                   mov [bp+4], al
  8727 000044C9 8A4604                   mov al, [bp+4]
  8728 000044CC 3C60                     cmp al, 96
  8729 000044CE 0F8E0800                 jle @@getdigit509
  8730 000044D2 8A4604                   mov al, [bp+4]
  8731 000044D5 2C27                     sub al, 39
  8732 000044D7 884604                   mov [bp+4], al
  8733                                  
  8734                                  ;-814 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
  8735                                  
  8736                                  @@getdigit509:
  8737 000044DA 8A4604                   mov al, [bp+4]
  8738 000044DD 3C40                     cmp al, 64
  8739 000044DF 0F8E0800                 jle @@getdigit510
  8740 000044E3 8A4604                   mov al, [bp+4]
  8741 000044E6 2C07                     sub al, 7
  8742 000044E8 884604                   mov [bp+4], al
  8743                                  @@getdigit510:
  8744 000044EB 8A4604                   mov al, [bp+4]
  8745 000044EE 2C30                     sub al, 48
  8746 000044F0 884604                   mov [bp+4], al
  8747 000044F3 A1[3600]                 mov ax, [lexval]
  8748 000044F6 C1E004                   shl ax, 4
  8749 000044F9 A3[3600]                 mov word [lexval], ax
  8750                                  
  8751                                  ;-815      i=0; i=c; lexval=lexval+i;}
  8752                                  
  8753 000044FC B80000                   mov ax, 0
  8754 000044FF 8946FE                   mov [bp-2], ax
  8755 00004502 8A4604                   mov al, [bp+4]
  8756 00004505 8946FE                   mov [bp-2], ax
  8757 00004508 A1[3600]                 mov ax, [lexval]
  8758 0000450B 0346FE                   add ax, [bp-2]
  8759 0000450E A3[3600]                 mov word [lexval], ax
  8760                                  
  8761                                  ;-816     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
  8762                                  
  8763 00004511 EB9E                     jmp @@getdigit507
  8764                                  @@getdigit508:
  8765 00004513 E94200                   jmp @@getdigit511
  8766                                  @@getdigit506:
  8767                                  @@getdigit512:
  8768 00004516 A0[2700]                 mov al, byte [thechar]
  8769 00004519 B400                     mov ah, 0
  8770 0000451B 50                       push ax
  8771 0000451C E8FF11                   call digit
  8772 0000451F 83C402                   add  sp, 2
  8773 00004522 08C0                     or  al, al
  8774 00004524 0F843000                 je @@getdigit513
  8775 00004528 E86600                   call next
  8776 0000452B 884604                   mov [bp+4], al
  8777 0000452E 8A4604                   mov al, [bp+4]
  8778 00004531 2C30                     sub al, 48
  8779 00004533 884604                   mov [bp+4], al
  8780 00004536 A1[3600]                 mov ax, [lexval]
  8781 00004539 BB0A00                   mov bx, 10
  8782 0000453C F7E3                     mul bx
  8783 0000453E A3[3600]                 mov word [lexval], ax
  8784                                  
  8785                                  ;-817      i=0; i=c; lexval=lexval+i; } } 
  8786                                  
  8787 00004541 B80000                   mov ax, 0
  8788 00004544 8946FE                   mov [bp-2], ax
  8789 00004547 8A4604                   mov al, [bp+4]
  8790 0000454A 8946FE                   mov [bp-2], ax
  8791 0000454D A1[3600]                 mov ax, [lexval]
  8792 00004550 0346FE                   add ax, [bp-2]
  8793 00004553 A3[3600]                 mov word [lexval], ax
  8794 00004556 EBBE                     jmp @@getdigit512
  8795                                  @@getdigit513:
  8796                                  
  8797                                  ;-818 }
  8798                                  
  8799                                  @@getdigit511:
  8800                                  
  8801                                  ;-819 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  8802 00004558 C9                       LEAVE
  8803 00004559 C3                       ret
  8804                                  ; ENDP
  8805                                  
  8806                                  getstring:  ; *** PROC ***
  8807                                  ;Function : getstring, Number of local variables: 3
  8808                                  ;   # type sign width addr used name   list of local variables
  8809                                  ;  200 var sign word   819 NULL delim = bp+4
  8810                                  ;  201 var sign word   819 NULL c = bp-2
  8811                                  ;  202 ptr sign byte   819 NULL p = bp-4;
  8812 0000455A C8040000                 ENTER  4,0
  8813 0000455E B82B81                   mov ax, symbol
  8814 00004561 8946FC                   mov [bp-4], ax
  8815 00004564 E82A00                   call next
  8816 00004567 8946FE                   mov [bp-2], ax
  8817                                  
  8818                                  ;-820   while (c != delim) {*p=c; p++; c=next(); } *p=0; }
  8819                                  
  8820                                  @@getstring514:
  8821 0000456A 8B46FE                   mov ax, [bp-2]
  8822 0000456D 3B4604                   cmp ax, [bp+4]
  8823 00004570 0F841300                 je  @@getstring515
  8824 00004574 8B46FE                   mov ax, [bp-2]
  8825 00004577 8B5EFC                   mov  bx, [bp-4]
  8826 0000457A 8807                     mov  [bx], al
  8827 0000457C FF46FC                   inc  word[bp-4]
  8828 0000457F E80F00                   call next
  8829 00004582 8946FE                   mov [bp-2], ax
  8830 00004585 EBE3                     jmp @@getstring514
  8831                                  @@getstring515:
  8832 00004587 B80000                   mov ax, 0
  8833 0000458A 8B5EFC                   mov  bx, [bp-4]
  8834 0000458D 8807                     mov  [bx], al
  8835                                  
  8836                                  ;-821 
  8837                                  
  8838                                  
  8839                                  ;-822 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
  8840 0000458F C9                       LEAVE
  8841 00004590 C3                       ret
  8842                                  ; ENDP
  8843                                  
  8844                                  next:  ; *** PROC ***
  8845                                  ;Function : next, Number of local variables: 1
  8846                                  ;   # type sign width addr used name   list of local variables
  8847                                  ;  200 var sign byte   822 NULL r = bp-2;
  8848 00004591 C8020000                 ENTER  2,0
  8849 00004595 A0[2700]                 mov al, [thechar]
  8850 00004598 8846FE                   mov [bp-2], al
  8851 0000459B 8A46FE                   mov al, [bp-2]
  8852 0000459E A2[2400]                 mov byte [globC], al
  8853 000045A1 E83303                   call fgets1
  8854 000045A4 A2[2700]                 mov byte [thechar], al
  8855 000045A7 8A46FE                   mov al, [bp-2]
  8856 000045AA E90000                   jmp @@retn
  8857                                  
  8858                                  ;-823 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
  8859                                  
  8860 000045AD C9                      @@retn: LEAVE
  8861 000045AE C3                       ret
  8862                                  ; ENDP
  8863                                  
  8864                                  istoken:  ; *** PROC ***
  8865                                  ;Function : istoken, Number of local variables: 1
  8866                                  ;   # type sign width addr used name   list of local variables
  8867                                  ;  200 var sign word   823 NULL t = bp+4;
  8868 000045AF C8000000                 ENTER  0,0
  8869 000045B3 A1[2200]                 mov ax, [token]
  8870 000045B6 3B4604                   cmp ax, [bp+4]
  8871 000045B9 0F850C00                 jne @@istoken516
  8872 000045BD E828F8                   call getlex
  8873 000045C0 A3[2200]                 mov word [token], ax
  8874 000045C3 B80100                   mov ax, 1
  8875 000045C6 E90600                   jmp @@retn
  8876                                  @@istoken516:
  8877 000045C9 B80000                   mov ax, 0
  8878 000045CC E90000                   jmp @@retn
  8879                                  
  8880                                  ;-824 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  8881                                  
  8882 000045CF C9                      @@retn: LEAVE
  8883 000045D0 C3                       ret
  8884                                  ; ENDP
  8885                                  
  8886                                  expect:  ; *** PROC ***
  8887                                  ;Function : expect, Number of local variables: 1
  8888                                  ;   # type sign width addr used name   list of local variables
  8889                                  ;  200 var sign word   824 NULL t = bp+4;
  8890 000045D1 C8000000                 ENTER  0,0
  8891 000045D5 FF7604                   push word [bp+4]
  8892 000045D8 E8D4FF                   call istoken
  8893 000045DB 83C402                   add  sp, 2
  8894 000045DE 83F800                   cmp ax, 0
  8895 000045E1 0F853200                 jne @@expect517
  8896 000045E5 B80000                   mov ax, 0
  8897 000045E8 8B1E[1C00]               mov  bx, [cloc]
  8898 000045EC 8807                     mov  [bx], al
  8899 000045EE 8D063075                 lea  ax, [co]
  8900 000045F2 50                       push ax
  8901 000045F3 E8EE00                   call prs
  8902 000045F6 83C402                   add  sp, 2
  8903 000045F9 E8D304                   call listproc
  8904                                  
  8905                                  ;-825   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }
  8906                                  
  8907 000045FC 68[1946]                 push expect_0
  8908 000045FF E8E200                   call prs
  8909 00004602 83C402                   add  sp, 2
  8910 00004605 FF7604                   push word [bp+4]
  8911 00004608 E8D001                   call pint1
  8912 0000460B 83C402                   add  sp, 2
  8913 0000460E 68[3146]                 push expect_1
  8914 00004611 E8B903                   call error1
  8915 00004614 83C402                   add  sp, 2
  8916                                  @@expect517:
  8917                                  
  8918                                  ;-826 
  8919                                  
  8920                                  
  8921                                  ;-827 int eprc(char c)  {*cloc=c; cloc++; }
  8922 00004617 C9                       LEAVE
  8923 00004618 C3                       ret
  8924                                  ; ENDP
  8925 00004619 5C6E45787065637465-     expect_0 db "\nExpected ASCII(dez): ",0
  8926 00004622 642041534349492864-
  8927 0000462B 657A293A2000       
  8928 00004631 206E6F7420666F756E-     expect_1 db " not found",0
  8929 0000463A 6400               
  8930                                  
  8931                                  eprc:  ; *** PROC ***
  8932                                  ;Function : eprc, Number of local variables: 1
  8933                                  ;   # type sign width addr used name   list of local variables
  8934                                  ;  200 var sign byte   827 NULL c = bp+4;
  8935 0000463C C8000000                 ENTER  0,0
  8936 00004640 8A4604                   mov al, [bp+4]
  8937 00004643 8B1E[1C00]               mov  bx, [cloc]
  8938 00004647 8807                     mov  [bx], al
  8939 00004649 FF06[1C00]               inc  word[cloc]
  8940                                  
  8941                                  ;-828 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
  8942 0000464D C9                       LEAVE
  8943 0000464E C3                       ret
  8944                                  ; ENDP
  8945                                  
  8946                                  eprs:  ; *** PROC ***
  8947                                  ;Function : eprs, Number of local variables: 2
  8948                                  ;   # type sign width addr used name   list of local variables
  8949                                  ;  200 ptr sign byte   828 NULL s = bp+4
  8950                                  ;  201 var sign byte   828 NULL c = bp-2;
  8951 0000464F C8020000                 ENTER  2,0
  8952                                  @@eprs518:
  8953 00004653 8B5E04                   mov bx, [bp+4]
  8954 00004656 8A07                     mov al, [bx]
  8955 00004658 B400                     mov ah, 0
  8956 0000465A 08C0                     or  al, al
  8957 0000465C 0F841B00                 je @@eprs519
  8958 00004660 8B5E04                   mov bx, [bp+4]
  8959 00004663 8A07                     mov al, [bx]
  8960 00004665 B400                     mov ah, 0
  8961 00004667 8846FE                   mov [bp-2], al
  8962 0000466A 8A46FE                   mov al, byte [bp-2]
  8963 0000466D B400                     mov ah, 0
  8964 0000466F 50                       push ax
  8965 00004670 E8C9FF                   call eprc
  8966 00004673 83C402                   add  sp, 2
  8967 00004676 FF4604                   inc  word[bp+4]
  8968 00004679 EBD8                     jmp @@eprs518
  8969                                  @@eprs519:
  8970                                  
  8971                                  ;-829 int prc(unsigned char c) { 
  8972 0000467B C9                       LEAVE
  8973 0000467C C3                       ret
  8974                                  ; ENDP
  8975                                  
  8976                                  prc:  ; *** PROC ***
  8977                                  
  8978                                  ;-830   if (c==10) {_AX=13; writetty(); }
  8979                                  
  8980                                  ;Function : prc, Number of local variables: 1
  8981                                  ;   # type sign width addr used name   list of local variables
  8982                                  ;  200 var unsg byte   829 NULL c = bp+4;
  8983 0000467D C8000000                 ENTER  0,0
  8984 00004681 8A4604                   mov al, [bp+4]
  8985 00004684 3C0A                     cmp al, 10
  8986 00004686 0F850600                 jne @@prc520
  8987 0000468A B80D00                   mov  ax, 13
  8988 0000468D E8D20E                   call writetty
  8989                                  
  8990                                  ;-831   _AL=c; writetty(); 
  8991                                  
  8992                                  @@prc520:
  8993 00004690 8A4604                   mov  al, [bp+4]
  8994 00004693 E8CC0E                   call writetty
  8995                                  
  8996                                  ;-832   fputcR(c, fdout); 
  8997                                  
  8998 00004696 FF36[2000]               push word [fdout]
  8999 0000469A 8A4604                   mov al, byte [bp+4]
  9000 0000469D B400                     mov ah, 0
  9001 0000469F 50                       push ax
  9002 000046A0 E8D311                   call fputcR
  9003 000046A3 83C404                   add  sp, 4
  9004                                  
  9005                                  ;-833   }
  9006                                  
  9007                                  
  9008                                  ;-834 int prscomment(unsigned char *s) {unsigned char c;
  9009 000046A6 C9                       LEAVE
  9010 000046A7 C3                       ret
  9011                                  ; ENDP
  9012                                  
  9013                                  prscomment:  ; *** PROC ***
  9014                                  
  9015                                  ;-835   while(*s){c=*s;prc(c);s++;} }
  9016                                  
  9017                                  ;Function : prscomment, Number of local variables: 2
  9018                                  ;   # type sign width addr used name   list of local variables
  9019                                  ;  200 ptr unsg byte   834 NULL s = bp+4
  9020                                  ;  201 var unsg byte   834 NULL c = bp-2;
  9021 000046A8 C8020000                 ENTER  2,0
  9022                                  @@prscomment521:
  9023 000046AC 8B5E04                   mov bx, [bp+4]
  9024 000046AF 8A07                     mov al, [bx]
  9025 000046B1 B400                     mov ah, 0
  9026 000046B3 08C0                     or  al, al
  9027 000046B5 0F841B00                 je @@prscomment522
  9028 000046B9 8B5E04                   mov bx, [bp+4]
  9029 000046BC 8A07                     mov al, [bx]
  9030 000046BE B400                     mov ah, 0
  9031 000046C0 8846FE                   mov [bp-2], al
  9032 000046C3 8A46FE                   mov al, byte [bp-2]
  9033 000046C6 B400                     mov ah, 0
  9034 000046C8 50                       push ax
  9035 000046C9 E8B1FF                   call prc
  9036 000046CC 83C402                   add  sp, 2
  9037 000046CF FF4604                   inc  word[bp+4]
  9038 000046D2 EBD8                     jmp @@prscomment521
  9039                                  @@prscomment522:
  9040                                  
  9041                                  ;-836 int prnl() { prs("\n ");}
  9042 000046D4 C9                       LEAVE
  9043 000046D5 C3                       ret
  9044                                  ; ENDP
  9045                                  
  9046                                  prnl:  ; *** PROC ***
  9047 000046D6 68[E046]                 push prnl_0
  9048 000046D9 E80800                   call prs
  9049 000046DC 83C402                   add  sp, 2
  9050                                  
  9051                                  ;-837 
  9052                                  
  9053                                  
  9054                                  ;-838 int prs(unsigned char *s) {unsigned char c; int com; com=0;
  9055                                  
  9056 000046DF C3                       ret
  9057                                  ; ENDP
  9058 000046E0 5C6E2000                prnl_0 db "\n ",0
  9059                                  
  9060                                  prs:  ; *** PROC ***
  9061                                  ;Function : prs, Number of local variables: 3
  9062                                  ;   # type sign width addr used name   list of local variables
  9063                                  ;  200 ptr unsg byte   838 NULL s = bp+4
  9064                                  ;  201 var unsg byte   838 NULL c = bp-2
  9065                                  ;  202 var sign word   838 NULL com = bp-4;
  9066 000046E4 C8040000                 ENTER  4,0
  9067 000046E8 B80000                   mov ax, 0
  9068 000046EB 8946FC                   mov [bp-4], ax
  9069                                  
  9070                                  ;-839   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
  9071                                  
  9072                                  @@prs523:
  9073 000046EE 8B5E04                   mov bx, [bp+4]
  9074 000046F1 8A07                     mov al, [bx]
  9075 000046F3 B400                     mov ah, 0
  9076 000046F5 08C0                     or  al, al
  9077 000046F7 0F847B00                 je @@prs524
  9078 000046FB 8B5E04                   mov bx, [bp+4]
  9079 000046FE 8A07                     mov al, [bx]
  9080 00004700 B400                     mov ah, 0
  9081 00004702 8846FE                   mov [bp-2], al
  9082 00004705 8A46FE                   mov al, [bp-2]
  9083 00004708 3C22                     cmp al, 34
  9084 0000470A 0F851800                 jne @@prs525
  9085 0000470E 8B46FC                   mov ax, [bp-4]
  9086 00004711 08C0                     or  al, al
  9087 00004713 0F840900                 je @@prs526
  9088 00004717 B80000                   mov ax, 0
  9089 0000471A 8946FC                   mov [bp-4], ax
  9090 0000471D E90600                   jmp @@prs527
  9091                                  @@prs526:
  9092 00004720 B80100                   mov ax, 1
  9093 00004723 8946FC                   mov [bp-4], ax
  9094                                  
  9095                                  ;-840     if (c==92) { if (com==0) { s++; c=*s;
  9096                                  
  9097                                  @@prs527:
  9098                                  @@prs525:
  9099 00004726 8A46FE                   mov al, [bp-2]
  9100 00004729 3C5C                     cmp al, 92
  9101 0000472B 0F853500                 jne @@prs528
  9102 0000472F 8B46FC                   mov ax, [bp-4]
  9103 00004732 83F800                   cmp ax, 0
  9104 00004735 0F852B00                 jne @@prs529
  9105 00004739 FF4604                   inc  word[bp+4]
  9106 0000473C 8B5E04                   mov bx, [bp+4]
  9107 0000473F 8A07                     mov al, [bx]
  9108 00004741 B400                     mov ah, 0
  9109 00004743 8846FE                   mov [bp-2], al
  9110                                  
  9111                                  ;-841           if (c=='n') c=10; if (c=='t') c= 9;
  9112                                  
  9113 00004746 8A46FE                   mov al, [bp-2]
  9114 00004749 3C6E                     cmp al, 110
  9115 0000474B 0F850600                 jne @@prs530
  9116 0000474F B80A00                   mov ax, 10
  9117 00004752 8846FE                   mov [bp-2], al
  9118                                  @@prs530:
  9119 00004755 8A46FE                   mov al, [bp-2]
  9120 00004758 3C74                     cmp al, 116
  9121 0000475A 0F850600                 jne @@prs531
  9122 0000475E B80900                   mov ax, 9
  9123 00004761 8846FE                   mov [bp-2], al
  9124                                  
  9125                                  ;-842     } } prc(c); s++;  } }
  9126                                  
  9127                                  @@prs531:
  9128                                  @@prs529:
  9129                                  @@prs528:
  9130 00004764 8A46FE                   mov al, byte [bp-2]
  9131 00004767 B400                     mov ah, 0
  9132 00004769 50                       push ax
  9133 0000476A E810FF                   call prc
  9134 0000476D 83C402                   add  sp, 2
  9135 00004770 FF4604                   inc  word[bp+4]
  9136 00004773 E978FF                   jmp @@prs523
  9137                                  @@prs524:
  9138                                  
  9139                                  ;-843 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  9140 00004776 C9                       LEAVE
  9141 00004777 C3                       ret
  9142                                  ; ENDP
  9143                                  
  9144                                  eprnum:  ; *** PROC ***
  9145                                  ;Function : eprnum, Number of local variables: 2
  9146                                  ;   # type sign width addr used name   list of local variables
  9147                                  ;  200 var sign word   843 NULL n = bp+4
  9148                                  ;  201 var sign word   843 NULL e = bp-2;
  9149 00004778 C8020000                 ENTER  2,0
  9150 0000477C 8B4604                   mov ax, [bp+4]
  9151 0000477F 83F800                   cmp ax, 0
  9152 00004782 0F8D1400                 jge @@eprnum532
  9153 00004786 6A2D                     push 45
  9154 00004788 E8B1FE                   call eprc
  9155 0000478B 83C402                   add  sp, 2
  9156 0000478E FF7604                   push word [bp+4]
  9157 00004791 E81D0E                   call mkneg
  9158 00004794 83C402                   add  sp, 2
  9159 00004797 894604                   mov [bp+4], ax
  9160                                  
  9161                                  ;-844   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
  9162                                  
  9163                                  @@eprnum532:
  9164 0000479A 8B4604                   mov ax, [bp+4]
  9165 0000479D 83F80A                   cmp ax, 10 ;unsigned : 1
  9166 000047A0 0F8C1500                 jl  @@eprnum533
  9167 000047A4 8B4604                   mov ax, [bp+4]
  9168 000047A7 BB0A00                   mov bx, 10
  9169 000047AA 99                       cwd
  9170 000047AB F7FB                     idiv bx
  9171 000047AD 8946FE                   mov [bp-2], ax
  9172 000047B0 FF76FE                   push word [bp-2]
  9173 000047B3 E8C2FF                   call eprnum
  9174 000047B6 83C402                   add  sp, 2
  9175                                  @@eprnum533:
  9176 000047B9 8B4604                   mov ax, [bp+4]
  9177 000047BC BB0A00                   mov bx, 10
  9178 000047BF 99                       cwd
  9179 000047C0 F7FB                     idiv bx
  9180 000047C2 89D0                     mov ax, dx
  9181 000047C4 894604                   mov [bp+4], ax
  9182 000047C7 8B4604                   mov ax, [bp+4]
  9183 000047CA 83C030                   add ax, 48
  9184 000047CD 894604                   mov [bp+4], ax
  9185 000047D0 FF7604                   push word [bp+4]
  9186 000047D3 E866FE                   call eprc
  9187 000047D6 83C402                   add  sp, 2
  9188                                  
  9189                                  ;-845 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  9190 000047D9 C9                       LEAVE
  9191 000047DA C3                       ret
  9192                                  ; ENDP
  9193                                  
  9194                                  pint1:  ; *** PROC ***
  9195                                  ;Function : pint1, Number of local variables: 2
  9196                                  ;   # type sign width addr used name   list of local variables
  9197                                  ;  200 var sign word   845 NULL n = bp+4
  9198                                  ;  201 var sign word   845 NULL e = bp-2;
  9199 000047DB C8020000                 ENTER  2,0
  9200 000047DF 8B4604                   mov ax, [bp+4]
  9201 000047E2 83F800                   cmp ax, 0
  9202 000047E5 0F8D1400                 jge @@pint1534
  9203 000047E9 6A2D                     push 45
  9204 000047EB E88FFE                   call prc
  9205 000047EE 83C402                   add  sp, 2
  9206 000047F1 FF7604                   push word [bp+4]
  9207 000047F4 E8BA0D                   call mkneg
  9208 000047F7 83C402                   add  sp, 2
  9209 000047FA 894604                   mov [bp+4], ax
  9210                                  
  9211                                  ;-846   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }
  9212                                  
  9213                                  @@pint1534:
  9214 000047FD 8B4604                   mov ax, [bp+4]
  9215 00004800 83F80A                   cmp ax, 10 ;unsigned : 1
  9216 00004803 0F8C1500                 jl  @@pint1535
  9217 00004807 8B4604                   mov ax, [bp+4]
  9218 0000480A BB0A00                   mov bx, 10
  9219 0000480D 99                       cwd
  9220 0000480E F7FB                     idiv bx
  9221 00004810 8946FE                   mov [bp-2], ax
  9222 00004813 FF76FE                   push word [bp-2]
  9223 00004816 E8C2FF                   call pint1
  9224 00004819 83C402                   add  sp, 2
  9225                                  @@pint1535:
  9226 0000481C 8B4604                   mov ax, [bp+4]
  9227 0000481F BB0A00                   mov bx, 10
  9228 00004822 99                       cwd
  9229 00004823 F7FB                     idiv bx
  9230 00004825 89D0                     mov ax, dx
  9231 00004827 894604                   mov [bp+4], ax
  9232 0000482A 8B4604                   mov ax, [bp+4]
  9233 0000482D 83C030                   add ax, 48
  9234 00004830 894604                   mov [bp+4], ax
  9235 00004833 FF7604                   push word [bp+4]
  9236 00004836 E844FE                   call prc
  9237 00004839 83C402                   add  sp, 2
  9238                                  
  9239                                  ;-847 int prunsign1(unsigned int n) { unsigned int e;
  9240 0000483C C9                       LEAVE
  9241 0000483D C3                       ret
  9242                                  ; ENDP
  9243                                  
  9244                                  prunsign1:  ; *** PROC ***
  9245                                  
  9246                                  ;-848   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }
  9247                                  
  9248                                  ;Function : prunsign1, Number of local variables: 2
  9249                                  ;   # type sign width addr used name   list of local variables
  9250                                  ;  200 var unsg word   847 NULL n = bp+4
  9251                                  ;  201 var unsg word   847 NULL e = bp-2;
  9252 0000483E C8020000                 ENTER  2,0 ; constant expression
  9253 00004842 837E040A                cmp word[bp+4], 10 ;unsigned : 0
  9254 00004846 0F821700                 jb  @@prunsign1536
  9255 0000484A 8B4604                   mov ax, [bp+4]
  9256 0000484D BB0A00                   mov bx, 10
  9257 00004850 BA0000                   mov dx, 0
  9258 00004853 F7F3                     div bx
  9259 00004855 8946FE                   mov [bp-2], ax
  9260 00004858 FF76FE                   push word [bp-2]
  9261 0000485B E8E0FF                   call prunsign1
  9262 0000485E 83C402                   add  sp, 2
  9263                                  
  9264                                  ;-849     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }
  9265                                  
  9266                                  @@prunsign1536:
  9267 00004861 8B4604                   mov ax, [bp+4]
  9268 00004864 BB0A00                   mov bx, 10
  9269 00004867 BA0000                   mov dx, 0
  9270 0000486A F7F3                     div bx
  9271 0000486C 89D0                     mov ax, dx
  9272 0000486E 894604                   mov [bp+4], ax
  9273 00004871 83460430                 add  word[bp+4], 48
  9274 00004875 FF7604                   push word [bp+4]
  9275 00004878 E802FE                   call prc
  9276 0000487B 83C402                   add  sp, 2
  9277                                  
  9278                                  ;-850 int printint51(unsigned int j)  {
  9279 0000487E C9                       LEAVE
  9280 0000487F C3                       ret
  9281                                  ; ENDP
  9282                                  
  9283                                  printint51:  ; *** PROC ***
  9284                                  
  9285                                  ;-851   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
  9286                                  
  9287                                  ;Function : printint51, Number of local variables: 1
  9288                                  ;   # type sign width addr used name   list of local variables
  9289                                  ;  200 var unsg word   850 NULL j = bp+4;
  9290 00004880 C8000000                 ENTER  0,0
  9291 00004884 8B4604                   mov ax, [bp+4]
  9292 00004887 3D1027                   cmp ax, 10000
  9293 0000488A 0F8D0800                 jge @@printint51537
  9294 0000488E 6A20                     push 32
  9295 00004890 E8EAFD                   call prc
  9296 00004893 83C402                   add  sp, 2
  9297                                  @@printint51537:
  9298 00004896 8B4604                   mov ax, [bp+4]
  9299 00004899 3DE803                   cmp ax, 1000
  9300 0000489C 0F8D0800                 jge @@printint51538
  9301 000048A0 6A20                     push 32
  9302 000048A2 E8D8FD                   call prc
  9303 000048A5 83C402                   add  sp, 2
  9304                                  @@printint51538:
  9305 000048A8 8B4604                   mov ax, [bp+4]
  9306 000048AB 83F864                   cmp ax, 100
  9307 000048AE 0F8D0800                 jge @@printint51539
  9308 000048B2 6A20                     push 32
  9309 000048B4 E8C6FD                   call prc
  9310 000048B7 83C402                   add  sp, 2
  9311                                  
  9312                                  ;-852    if (j<10) prc(32);  prunsign1(j); }
  9313                                  
  9314                                  @@printint51539:
  9315 000048BA 8B4604                   mov ax, [bp+4]
  9316 000048BD 83F80A                   cmp ax, 10
  9317 000048C0 0F8D0800                 jge @@printint51540
  9318 000048C4 6A20                     push 32
  9319 000048C6 E8B4FD                   call prc
  9320 000048C9 83C402                   add  sp, 2
  9321                                  @@printint51540:
  9322 000048CC FF7604                   push word [bp+4]
  9323 000048CF E86CFF                   call prunsign1
  9324 000048D2 83C402                   add  sp, 2
  9325                                  
  9326                                  ;-853 
  9327                                  
  9328                                  
  9329                                  ;-854 int fgets1() { char c; c=*fgetsp;
  9330 000048D5 C9                       LEAVE
  9331 000048D6 C3                       ret
  9332                                  ; ENDP
  9333                                  
  9334                                  fgets1:  ; *** PROC ***
  9335                                  ;Function : fgets1, Number of local variables: 1
  9336                                  ;   # type sign width addr used name   list of local variables
  9337                                  ;  200 var sign byte   854 NULL c = bp-2;
  9338 000048D7 C8020000                 ENTER  2,0
  9339 000048DB 8B1E[6A00]               mov bx, [fgetsp]
  9340 000048DF 8A07                     mov al, [bx]
  9341 000048E1 B400                     mov ah, 0
  9342 000048E3 8846FE                   mov [bp-2], al
  9343                                  
  9344                                  ;-855   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
  9345                                  
  9346 000048E6 8A46FE                   mov al, [bp-2]
  9347 000048E9 3C00                     cmp al, 0
  9348 000048EB 0F852A00                 jne @@fgets1541
  9349 000048EF E83700                   call printinputline
  9350 000048F2 A1[7800]                 mov ax, [DOS_NoBytes]
  9351 000048F5 83F800                   cmp ax, 0
  9352 000048F8 0F850600                 jne @@fgets1542
  9353 000048FC B80000                   mov ax, 0
  9354 000048FF E92500                   jmp @@retn
  9355                                  
  9356                                  ;-856     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  9357                                  
  9358                                  @@fgets1542:
  9359 00004902 B80FD0                   mov ax, fgetsdest
  9360 00004905 A3[6A00]                 mov word [fgetsp], ax
  9361 00004908 8B1E[6A00]               mov bx, [fgetsp]
  9362 0000490C 8A07                     mov al, [bx]
  9363 0000490E B400                     mov ah, 0
  9364 00004910 8846FE                   mov [bp-2], al
  9365 00004913 B80000                   mov ax, 0
  9366 00004916 A3[2500]                 mov word [spalte], ax
  9367                                  
  9368                                  ;-857   fgetsp++; spalte++;  return c; }
  9369                                  
  9370                                  @@fgets1541:
  9371 00004919 FF06[6A00]               inc  word[fgetsp]
  9372 0000491D FF06[2500]               inc  word[spalte]
  9373 00004921 8A46FE                   mov al, [bp-2]
  9374 00004924 E90000                   jmp @@retn
  9375                                  
  9376                                  ;-858 int printinputline() { fgetsp=&fgetsdest;
  9377                                  
  9378 00004927 C9                      @@retn: LEAVE
  9379 00004928 C3                       ret
  9380                                  ; ENDP
  9381                                  
  9382                                  printinputline:  ; *** PROC ***
  9383 00004929 B80FD0                   mov ax, fgetsdest
  9384 0000492C A3[6A00]                 mov word [fgetsp], ax
  9385                                  
  9386                                  ;-859   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);
  9387                                  
  9388                                  @@printinputline543:
  9389 0000492F FF36[1E00]               push word [fdin]
  9390 00004933 8D06[7A00]               lea  ax, [DOS_ByteRead]
  9391 00004937 50                       push ax
  9392 00004938 E8110F                   call readR
  9393 0000493B 83C404                   add  sp, 4
  9394 0000493E A3[7800]                 mov word [DOS_NoBytes], ax
  9395                                  
  9396                                  ;-860   if (DOS_NoBytes == 0) return; 
  9397                                  
  9398 00004941 A1[7800]                 mov ax, [DOS_NoBytes]
  9399 00004944 83F800                   cmp ax, 0
  9400 00004947 0F850300                 jne @@printinputline544
  9401 0000494B E95400                   jmp @@retn
  9402                                  
  9403                                  ;-861     *fgetsp=DOS_ByteRead; fgetsp++;} 
  9404                                  
  9405                                  @@printinputline544:
  9406 0000494E A0[7A00]                 mov al, [DOS_ByteRead]
  9407 00004951 8B1E[6A00]               mov  bx, [fgetsp]
  9408 00004955 8807                     mov  [bx], al
  9409 00004957 FF06[6A00]               inc  word[fgetsp]
  9410                                  
  9411                                  ;-862   while (DOS_ByteRead != 10); *fgetsp=0;
  9412                                  
  9413 0000495B A0[7A00]                 mov al, [DOS_ByteRead]
  9414 0000495E 3C0A                     cmp al, 10
  9415 00004960 0F840200                 je  @@printinputline545
  9416 00004964 EBC9                     jmp @@printinputline543
  9417                                  @@printinputline545:
  9418 00004966 B80000                   mov ax, 0
  9419 00004969 8B1E[6A00]               mov  bx, [fgetsp]
  9420 0000496D 8807                     mov  [bx], al
  9421                                  
  9422                                  ;-863     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
  9423                                  
  9424 0000496F A1[2000]                 mov ax, [fdout]
  9425 00004972 08C0                     or  al, al
  9426 00004974 0F842A00                 je @@printinputline546
  9427 00004978 68[A349]                 push printinputline_0
  9428 0000497B E866FD                   call prs
  9429 0000497E 83C402                   add  sp, 2
  9430 00004981 FF36[6E00]               push word [lineno]
  9431 00004985 E8B6FE                   call prunsign1
  9432 00004988 83C402                   add  sp, 2
  9433 0000498B 6A20                     push 32
  9434 0000498D E8EDFC                   call prc
  9435 00004990 83C402                   add  sp, 2
  9436 00004993 FF06[6E00]               inc  word[lineno]
  9437                                  
  9438                                  ;-864       prscomment(&fgetsdest);}
  9439                                  
  9440 00004997 8D060FD0                 lea  ax, [fgetsdest]
  9441 0000499B 50                       push ax
  9442 0000499C E809FD                   call prscomment
  9443 0000499F 83C402                   add  sp, 2
  9444                                  
  9445                                  ;-865 }
  9446                                  
  9447                                  @@printinputline546:
  9448                                  
  9449                                  ;-866 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
  9450                                  
  9451                                  @@retn:
  9452 000049A2 C3                       ret
  9453                                  ; ENDP
  9454 000049A3 5C6E5C6E3B2D00          printinputline_0 db "\n\n;-",0
  9455                                  
  9456                                  end1:  ; *** PROC ***
  9457                                  ;Function : end1, Number of local variables: 1
  9458                                  ;   # type sign width addr used name   list of local variables
  9459                                  ;  200 var sign word   866 NULL n = bp+4;
  9460 000049AA C8000000                 ENTER  0,0
  9461 000049AE FF36[1E00]               push word [fdin]
  9462 000049B2 E8D60E                   call fcloseR
  9463 000049B5 83C402                   add  sp, 2
  9464 000049B8 FF36[2000]               push word [fdout]
  9465 000049BC E8CC0E                   call fcloseR
  9466 000049BF 83C402                   add  sp, 2
  9467 000049C2 FF7604                   push word [bp+4]
  9468 000049C5 E8D10E                   call exitR
  9469 000049C8 83C402                   add  sp, 2
  9470                                  
  9471                                  ;-867 int error1(char *s) { 
  9472 000049CB C9                       LEAVE
  9473 000049CC C3                       ret
  9474                                  ; ENDP
  9475                                  
  9476                                  error1:  ; *** PROC ***
  9477                                  
  9478                                  ;-868   lineno--;
  9479                                  
  9480                                  ;Function : error1, Number of local variables: 1
  9481                                  ;   # type sign width addr used name   list of local variables
  9482                                  ;  200 ptr sign byte   867 NULL s = bp+4;
  9483 000049CD C8000000                 ENTER  0,0
  9484 000049D1 FF0E[6E00]               dec  word[lineno]
  9485                                  
  9486                                  ;-869   prnl(); prscomment(&fgetsdest);
  9487                                  
  9488 000049D5 E8FEFC                   call prnl
  9489 000049D8 8D060FD0                 lea  ax, [fgetsdest]
  9490 000049DC 50                       push ax
  9491 000049DD E8C8FC                   call prscomment
  9492 000049E0 83C402                   add  sp, 2
  9493                                  
  9494                                  ;-870   prs(";Line: "); prunsign1(lineno);
  9495                                  
  9496 000049E3 68[764A]                 push error1_0
  9497 000049E6 E8FBFC                   call prs
  9498 000049E9 83C402                   add  sp, 2
  9499 000049EC FF36[6E00]               push word [lineno]
  9500 000049F0 E84BFE                   call prunsign1
  9501 000049F3 83C402                   add  sp, 2
  9502                                  
  9503                                  ;-871   prs(" ************** ERROR: "); prs(s);
  9504                                  
  9505 000049F6 68[7E4A]                 push error1_1
  9506 000049F9 E8E8FC                   call prs
  9507 000049FC 83C402                   add  sp, 2
  9508 000049FF FF7604                   push word [bp+4]
  9509 00004A02 E8DFFC                   call prs
  9510 00004A05 83C402                   add  sp, 2
  9511                                  
  9512                                  ;-872   prs("  in column: "); pint1(spalte);
  9513                                  
  9514 00004A08 68[964A]                 push error1_2
  9515 00004A0B E8D6FC                   call prs
  9516 00004A0E 83C402                   add  sp, 2
  9517 00004A11 FF36[2500]               push word [spalte]
  9518 00004A15 E8C3FD                   call pint1
  9519 00004A18 83C402                   add  sp, 2
  9520                                  
  9521                                  ;-873   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  9522                                  
  9523 00004A1B 68[A44A]                 push error1_3
  9524 00004A1E E8C3FC                   call prs
  9525 00004A21 83C402                   add  sp, 2
  9526 00004A24 FF36[2200]               push word [token]
  9527 00004A28 E813FE                   call prunsign1
  9528 00004A2B 83C402                   add  sp, 2
  9529 00004A2E 68[AE4A]                 push error1_4
  9530 00004A31 E8B0FC                   call prs
  9531 00004A34 83C402                   add  sp, 2
  9532 00004A37 A0[2400]                 mov al, byte [globC]
  9533 00004A3A B400                     mov ah, 0
  9534 00004A3C 50                       push ax
  9535 00004A3D E83DFC                   call prc
  9536 00004A40 83C402                   add  sp, 2
  9537                                  
  9538                                  ;-874   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);
  9539                                  
  9540 00004A43 68[B84A]                 push error1_5
  9541 00004A46 E89BFC                   call prs
  9542 00004A49 83C402                   add  sp, 2
  9543 00004A4C A0[2700]                 mov al, byte [thechar]
  9544 00004A4F B400                     mov ah, 0
  9545 00004A51 50                       push ax
  9546 00004A52 E886FD                   call pint1
  9547 00004A55 83C402                   add  sp, 2
  9548 00004A58 68[C44A]                 push error1_6
  9549 00004A5B E886FC                   call prs
  9550 00004A5E 83C402                   add  sp, 2
  9551 00004A61 8D062B81                 lea  ax, [symbol]
  9552 00004A65 50                       push ax
  9553 00004A66 E87BFC                   call prs
  9554 00004A69 83C402                   add  sp, 2
  9555                                  
  9556                                  ;-875   end1(1); }
  9557                                  
  9558 00004A6C 6A01                     push 1
  9559 00004A6E E839FF                   call end1
  9560 00004A71 83C402                   add  sp, 2
  9561                                  
  9562                                  ;-876 int listproc() {int i; 
  9563 00004A74 C9                       LEAVE
  9564 00004A75 C3                       ret
  9565                                  ; ENDP
  9566 00004A76 3B4C696E653A2000        error1_0 db ";Line: ",0
  9567 00004A7E 202A2A2A2A2A2A2A2A-     error1_1 db " ************** ERROR: ",0
  9568 00004A87 2A2A2A2A2A2A204552-
  9569 00004A90 524F523A2000       
  9570 00004A96 2020696E20636F6C75-     error1_2 db "  in column: ",0
  9571 00004A9F 6D6E3A2000         
  9572 00004AA4 5C6E546F6B656E3A20-     error1_3 db "\nToken: ",0
  9573 00004AAD 00                 
  9574 00004AAE 2C20676C6F62433A20-     error1_4 db ", globC: ",0
  9575 00004AB7 00                 
  9576 00004AB8 2C2074686563686172-     error1_5 db ", thechar: ",0
  9577 00004AC1 3A2000             
  9578 00004AC4 2C2073796D626F6C3A-     error1_6 db ", symbol: ",0
  9579 00004ACD 2000               
  9580                                  
  9581                                  listproc:  ; *** PROC ***
  9582                                  
  9583                                  ;-877   if (LTop > LSTART) {
  9584                                  
  9585                                  ;Function : listproc, Number of local variables: 1
  9586                                  ;   # type sign width addr used name   list of local variables
  9587                                  ;  200 var sign word   876 NULL i = bp-2;
  9588 00004ACF C8020000                 ENTER  2,0
  9589 00004AD3 A1[3400]                 mov ax, [LTop]
  9590 00004AD6 3DC800                   cmp ax, 200
  9591 00004AD9 0F8E5700                 jle @@listproc547
  9592                                  
  9593                                  ;-878   prs("\n;Function : "); prs(fname);
  9594                                  
  9595 00004ADD 68[364B]                 push listproc_0
  9596 00004AE0 E801FC                   call prs
  9597 00004AE3 83C402                   add  sp, 2
  9598 00004AE6 8D06AB81                 lea  ax, [fname]
  9599 00004AEA 50                       push ax
  9600 00004AEB E8F6FB                   call prs
  9601 00004AEE 83C402                   add  sp, 2
  9602                                  
  9603                                  ;-879   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  9604                                  
  9605 00004AF1 68[454B]                 push listproc_1
  9606 00004AF4 E8EDFB                   call prs
  9607 00004AF7 83C402                   add  sp, 2
  9608 00004AFA A1[3400]                 mov ax, [LTop]
  9609 00004AFD 2DC800                   sub ax, 200
  9610 00004B00 8946FE                   mov [bp-2], ax
  9611 00004B03 FF76FE                   push word [bp-2]
  9612 00004B06 E835FD                   call prunsign1
  9613 00004B09 83C402                   add  sp, 2
  9614                                  
  9615                                  ;-880   prs("\n;   # type sign width addr used name   list of local variables");
  9616                                  
  9617 00004B0C 68[634B]                 push listproc_2
  9618 00004B0F E8D2FB                   call prs
  9619 00004B12 83C402                   add  sp, 2
  9620                                  
  9621                                  ;-881     i=LSTART; 
  9622                                  
  9623 00004B15 B8C800                   mov ax, 200
  9624 00004B18 8946FE                   mov [bp-2], ax
  9625                                  
  9626                                  ;-882     while (i < LTop) { listvar(i); i++; } } 
  9627                                  
  9628                                  @@listproc548:
  9629 00004B1B 8B46FE                   mov ax, [bp-2]
  9630 00004B1E 3B06[3400]               cmp ax, [LTop]
  9631 00004B22 0F8D0E00                 jge @@listproc549
  9632 00004B26 FF76FE                   push word [bp-2]
  9633 00004B29 E87800                   call listvar
  9634 00004B2C 83C402                   add  sp, 2
  9635 00004B2F FF46FE                   inc  word[bp-2]
  9636 00004B32 EBE7                     jmp @@listproc548
  9637                                  @@listproc549:
  9638                                  
  9639                                  ;-883 }
  9640                                  
  9641                                  @@listproc547:
  9642                                  
  9643                                  ;-884 int listvar(unsigned int i) {unsigned int j; char c;
  9644 00004B34 C9                       LEAVE
  9645 00004B35 C3                       ret
  9646                                  ; ENDP
  9647 00004B36 5C6E3B46756E637469-     listproc_0 db "\n;Function : ",0
  9648 00004B3F 6F6E203A2000       
  9649 00004B45 2C204E756D62657220-     listproc_1 db ", Number of local variables: ",0
  9650 00004B4E 6F66206C6F63616C20-
  9651 00004B57 7661726961626C6573-
  9652 00004B60 3A2000             
  9653 00004B63 5C6E3B202020232074-     listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
  9654 00004B6C 797065207369676E20-
  9655 00004B75 776964746820616464-
  9656 00004B7E 722075736564206E61-
  9657 00004B87 6D652020206C697374-
  9658 00004B90 206F66206C6F63616C-
  9659 00004B99 207661726961626C65-
  9660 00004BA2 7300               
  9661                                  
  9662                                  listvar:  ; *** PROC ***
  9663                                  
  9664                                  ;-885   prs("\n;"); printint51(i); prc(32);
  9665                                  
  9666                                  ;Function : listvar, Number of local variables: 3
  9667                                  ;   # type sign width addr used name   list of local variables
  9668                                  ;  200 var unsg word   884 NULL i = bp+4
  9669                                  ;  201 var unsg word   884 NULL j = bp-2
  9670                                  ;  202 var sign byte   884 NULL c = bp-4;
  9671 00004BA4 C8040000                 ENTER  4,0
  9672 00004BA8 68[904D]                 push listvar_0
  9673 00004BAB E836FB                   call prs
  9674 00004BAE 83C402                   add  sp, 2
  9675 00004BB1 FF7604                   push word [bp+4]
  9676 00004BB4 E8C9FC                   call printint51
  9677 00004BB7 83C402                   add  sp, 2
  9678 00004BBA 6A20                     push 32
  9679 00004BBC E8BEFA                   call prc
  9680 00004BBF 83C402                   add  sp, 2
  9681                                  
  9682                                  ;-886   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
  9683                                  
  9684 00004BC2 8B5E04                   mov bx, [bp+4]
  9685 00004BC5 8A87B782                 mov al, [GType + bx]
  9686 00004BC9 8846FC                   mov [bp-4], al
  9687 00004BCC 8A46FC                   mov al, [bp-4]
  9688 00004BCF 3C56                     cmp al, 86
  9689 00004BD1 0F850900                 jne @@listvar550
  9690 00004BD5 68[944D]                 push listvar_1
  9691 00004BD8 E809FB                   call prs
  9692 00004BDB 83C402                   add  sp, 2
  9693                                  @@listvar550:
  9694 00004BDE 8A46FC                   mov al, [bp-4]
  9695 00004BE1 3C2A                     cmp al, 42
  9696 00004BE3 0F850900                 jne @@listvar551
  9697 00004BE7 68[994D]                 push listvar_2
  9698 00004BEA E8F7FA                   call prs
  9699 00004BED 83C402                   add  sp, 2
  9700                                  
  9701                                  ;-887                if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  9702                                  
  9703                                  @@listvar551:
  9704 00004BF0 8A46FC                   mov al, [bp-4]
  9705 00004BF3 3C26                     cmp al, 38
  9706 00004BF5 0F850900                 jne @@listvar552
  9707 00004BF9 68[9E4D]                 push listvar_3
  9708 00004BFC E8E5FA                   call prs
  9709 00004BFF 83C402                   add  sp, 2
  9710                                  @@listvar552:
  9711 00004C02 8A46FC                   mov al, [bp-4]
  9712 00004C05 3C23                     cmp al, 35
  9713 00004C07 0F850900                 jne @@listvar553
  9714 00004C0B 68[A34D]                 push listvar_4
  9715 00004C0E E8D3FA                   call prs
  9716 00004C11 83C402                   add  sp, 2
  9717                                  
  9718                                  ;-888   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  9719                                  
  9720                                  @@listvar553:
  9721 00004C14 8B5E04                   mov bx, [bp+4]
  9722 00004C17 8A87E383                 mov al, [GSign + bx]
  9723 00004C1B 8846FC                   mov [bp-4], al
  9724 00004C1E 8A46FC                   mov al, [bp-4]
  9725 00004C21 3C53                     cmp al, 83
  9726 00004C23 0F850900                 jne @@listvar554
  9727 00004C27 68[A84D]                 push listvar_5
  9728 00004C2A E8B7FA                   call prs
  9729 00004C2D 83C402                   add  sp, 2
  9730                                  @@listvar554:
  9731 00004C30 8A46FC                   mov al, [bp-4]
  9732 00004C33 3C55                     cmp al, 85
  9733 00004C35 0F850900                 jne @@listvar555
  9734 00004C39 68[AE4D]                 push listvar_6
  9735 00004C3C E8A5FA                   call prs
  9736 00004C3F 83C402                   add  sp, 2
  9737                                  
  9738                                  ;-889   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
  9739                                  
  9740                                  @@listvar555:
  9741 00004C42 8B5E04                   mov bx, [bp+4]
  9742 00004C45 8A870F85                 mov al, [GWidth + bx]
  9743 00004C49 8846FC                   mov [bp-4], al
  9744 00004C4C 8A46FC                   mov al, [bp-4]
  9745 00004C4F 3C01                     cmp al, 1
  9746 00004C51 0F850900                 jne @@listvar556
  9747 00004C55 68[B44D]                 push listvar_7
  9748 00004C58 E889FA                   call prs
  9749 00004C5B 83C402                   add  sp, 2
  9750                                  @@listvar556:
  9751 00004C5E 8A46FC                   mov al, [bp-4]
  9752 00004C61 3C02                     cmp al, 2
  9753 00004C63 0F850900                 jne @@listvar557
  9754 00004C67 68[BA4D]                 push listvar_8
  9755 00004C6A E877FA                   call prs
  9756 00004C6D 83C402                   add  sp, 2
  9757                                  
  9758                                  ;-890                if(c==  4)prs("dwrd " );
  9759                                  
  9760                                  @@listvar557:
  9761 00004C70 8A46FC                   mov al, [bp-4]
  9762 00004C73 3C04                     cmp al, 4
  9763 00004C75 0F850900                 jne @@listvar558
  9764 00004C79 68[C04D]                 push listvar_9
  9765 00004C7C E865FA                   call prs
  9766 00004C7F 83C402                   add  sp, 2
  9767                                  
  9768                                  ;-891   j=GAdr[i]; printint51(j);
  9769                                  
  9770                                  @@listvar558:
  9771 00004C82 8B5E04                   mov bx, [bp+4]
  9772 00004C85 D1E3                     shl bx, 1
  9773 00004C87 8B873B86                 mov ax, [GAdr + bx]
  9774 00004C8B 8946FE                   mov [bp-2], ax
  9775 00004C8E FF76FE                   push word [bp-2]
  9776 00004C91 E8ECFB                   call printint51
  9777 00004C94 83C402                   add  sp, 2
  9778                                  
  9779                                  ;-892   j=GUsed[i]; if (j) printint51(j);
  9780                                  
  9781 00004C97 8B5E04                   mov bx, [bp+4]
  9782 00004C9A D1E3                     shl bx, 1
  9783 00004C9C 8B879388                 mov ax, [GUsed + bx]
  9784 00004CA0 8946FE                   mov [bp-2], ax
  9785 00004CA3 8B46FE                   mov ax, [bp-2]
  9786 00004CA6 08C0                     or  al, al
  9787 00004CA8 0F840C00                 je @@listvar559
  9788 00004CAC FF76FE                   push word [bp-2]
  9789 00004CAF E8CEFB                   call printint51
  9790 00004CB2 83C402                   add  sp, 2
  9791                                  
  9792                                  ;-893   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  9793                                  
  9794 00004CB5 E92200                   jmp @@listvar560
  9795                                  @@listvar559:
  9796 00004CB8 8B5E04                   mov bx, [bp+4]
  9797 00004CBB 8A87B782                 mov al, [GType + bx]
  9798 00004CBF 3C23                     cmp al, 35
  9799 00004CC1 0F850C00                 jne @@listvar561
  9800 00004CC5 68[C64D]                 push listvar_10
  9801 00004CC8 E819FA                   call prs
  9802 00004CCB 83C402                   add  sp, 2
  9803 00004CCE E90900                   jmp @@listvar562
  9804                                  @@listvar561:
  9805 00004CD1 68[CC4D]                 push listvar_11
  9806 00004CD4 E80DFA                   call prs
  9807 00004CD7 83C402                   add  sp, 2
  9808                                  @@listvar562:
  9809                                  
  9810                                  ;-894   prc(32);  pt=adrofname(i); prs(pt);
  9811                                  
  9812                                  @@listvar560:
  9813 00004CDA 6A20                     push 32
  9814 00004CDC E89EF9                   call prc
  9815 00004CDF 83C402                   add  sp, 2
  9816 00004CE2 FF7604                   push word [bp+4]
  9817 00004CE5 E83BB9                   call adrofname
  9818 00004CE8 83C402                   add  sp, 2
  9819 00004CEB A3[7200]                 mov word [pt], ax
  9820 00004CEE FF36[7200]               push word [pt]
  9821 00004CF2 E8EFF9                   call prs
  9822 00004CF5 83C402                   add  sp, 2
  9823                                  
  9824                                  ;-895   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  9825                                  
  9826 00004CF8 8B5E04                   mov bx, [bp+4]
  9827 00004CFB 8A87B782                 mov al, [GType + bx]
  9828 00004CFF 3C23                     cmp al, 35
  9829 00004D01 0F851D00                 jne @@listvar563
  9830 00004D05 6A3D                     push 61
  9831 00004D07 E873F9                   call prc
  9832 00004D0A 83C402                   add  sp, 2
  9833 00004D0D 8B5E04                   mov bx, [bp+4]
  9834 00004D10 D1E3                     shl bx, 1
  9835 00004D12 8B87EB8A                 mov ax, [GData + bx]
  9836 00004D16 8946FE                   mov [bp-2], ax
  9837 00004D19 FF76FE                   push word [bp-2]
  9838 00004D1C E81FFB                   call prunsign1
  9839 00004D1F 83C402                   add  sp, 2
  9840                                  
  9841                                  ;-896   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  9842                                  
  9843                                  @@listvar563:
  9844 00004D22 8B5E04                   mov bx, [bp+4]
  9845 00004D25 8A87B782                 mov al, [GType + bx]
  9846 00004D29 3C26                     cmp al, 38
  9847 00004D2B 0F852500                 jne @@listvar564
  9848 00004D2F 6A5B                     push 91
  9849 00004D31 E849F9                   call prc
  9850 00004D34 83C402                   add  sp, 2
  9851 00004D37 8B5E04                   mov bx, [bp+4]
  9852 00004D3A D1E3                     shl bx, 1
  9853 00004D3C 8B87EB8A                 mov ax, [GData + bx]
  9854 00004D40 8946FE                   mov [bp-2], ax
  9855 00004D43 FF76FE                   push word [bp-2]
  9856 00004D46 E8F5FA                   call prunsign1
  9857 00004D49 83C402                   add  sp, 2
  9858 00004D4C 6A5D                     push 93
  9859 00004D4E E82CF9                   call prc
  9860 00004D51 83C402                   add  sp, 2
  9861                                  
  9862                                  ;-897   if (i >= LSTART) { prs(" = bp"); j=GData[i];
  9863                                  
  9864                                  @@listvar564:
  9865 00004D54 8B4604                   mov ax, [bp+4]
  9866 00004D57 3DC800                   cmp ax, 200 ;unsigned : 0
  9867 00004D5A 0F823000                 jb  @@listvar565
  9868 00004D5E 68[D24D]                 push listvar_12
  9869 00004D61 E880F9                   call prs
  9870 00004D64 83C402                   add  sp, 2
  9871 00004D67 8B5E04                   mov bx, [bp+4]
  9872 00004D6A D1E3                     shl bx, 1
  9873 00004D6C 8B87EB8A                 mov ax, [GData + bx]
  9874 00004D70 8946FE                   mov [bp-2], ax
  9875                                  
  9876                                  ;-898     if (j > 0) prc('+'); pint1(j);  }
  9877                                  
  9878 00004D73 8B46FE                   mov ax, [bp-2]
  9879 00004D76 83F800                   cmp ax, 0
  9880 00004D79 0F8E0800                 jle @@listvar566
  9881 00004D7D 6A2B                     push 43
  9882 00004D7F E8FBF8                   call prc
  9883 00004D82 83C402                   add  sp, 2
  9884                                  @@listvar566:
  9885 00004D85 FF76FE                   push word [bp-2]
  9886 00004D88 E850FA                   call pint1
  9887 00004D8B 83C402                   add  sp, 2
  9888                                  
  9889                                  ;-899 }
  9890                                  
  9891                                  @@listvar565:
  9892                                  
  9893                                  ;-900 int listcall() { int i;
  9894 00004D8E C9                       LEAVE
  9895 00004D8F C3                       ret
  9896                                  ; ENDP
  9897 00004D90 5C6E3B00                listvar_0 db "\n;",0
  9898 00004D94 7661722000              listvar_1 db "var ",0
  9899 00004D99 7074722000              listvar_2 db "ptr ",0
  9900 00004D9E 6172722000              listvar_3 db "arr ",0
  9901 00004DA3 6465662000              listvar_4 db "def ",0
  9902 00004DA8 7369676E2000            listvar_5 db "sign ",0
  9903 00004DAE 756E73672000            listvar_6 db "unsg ",0
  9904 00004DB4 627974652000            listvar_7 db "byte ",0
  9905 00004DBA 776F72642000            listvar_8 db "word ",0
  9906 00004DC0 647772642000            listvar_9 db "dwrd ",0
  9907 00004DC6 202020202D00            listvar_10 db "    -",0
  9908 00004DCC 204E554C4C00            listvar_11 db " NULL",0
  9909 00004DD2 203D20627000            listvar_12 db " = bp",0
  9910                                  
  9911                                  listcall:  ; *** PROC ***
  9912                                  
  9913                                  ;-901   prs("\n\n;    #  addr name   list of CALLs\n");
  9914                                  
  9915                                  ;Function : listcall, Number of local variables: 1
  9916                                  ;   # type sign width addr used name   list of local variables
  9917                                  ;  200 var sign word   900 NULL i = bp-2;
  9918 00004DD8 C8020000                 ENTER  2,0
  9919 00004DDC 68[064E]                 push listcall_0
  9920 00004DDF E802F9                   call prs
  9921 00004DE2 83C402                   add  sp, 2
  9922                                  
  9923                                  ;-902   i=0;  while (i< CTop) { calllisting(i); i++; } }
  9924                                  
  9925 00004DE5 B80000                   mov ax, 0
  9926 00004DE8 8946FE                   mov [bp-2], ax
  9927                                  @@listcall567:
  9928 00004DEB 8B46FE                   mov ax, [bp-2]
  9929 00004DEE 3B06[4500]               cmp ax, [CTop]
  9930 00004DF2 0F8D0E00                 jge @@listcall568
  9931 00004DF6 FF76FE                   push word [bp-2]
  9932 00004DF9 E83200                   call calllisting
  9933 00004DFC 83C402                   add  sp, 2
  9934 00004DFF FF46FE                   inc  word[bp-2]
  9935 00004E02 EBE7                     jmp @@listcall567
  9936                                  @@listcall568:
  9937                                  
  9938                                  ;-903 int calllisting(int i) {char c; int j;
  9939 00004E04 C9                       LEAVE
  9940 00004E05 C3                       ret
  9941                                  ; ENDP
  9942 00004E06 5C6E5C6E3B20202020-     listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
  9943 00004E0F 23202061646472206E-
  9944 00004E18 616D652020206C6973-
  9945 00004E21 74206F662043414C4C-
  9946 00004E2A 735C6E00           
  9947                                  
  9948                                  calllisting:  ; *** PROC ***
  9949                                  
  9950                                  ;-904   prs("\n;"); printint51(i); prc(32);
  9951                                  
  9952                                  ;Function : calllisting, Number of local variables: 3
  9953                                  ;   # type sign width addr used name   list of local variables
  9954                                  ;  200 var sign word   903 NULL i = bp+4
  9955                                  ;  201 var sign byte   903 NULL c = bp-2
  9956                                  ;  202 var sign word   903 NULL j = bp-4;
  9957 00004E2E C8040000                 ENTER  4,0
  9958 00004E32 68[A04E]                 push calllisting_0
  9959 00004E35 E8ACF8                   call prs
  9960 00004E38 83C402                   add  sp, 2
  9961 00004E3B FF7604                   push word [bp+4]
  9962 00004E3E E83FFA                   call printint51
  9963 00004E41 83C402                   add  sp, 2
  9964 00004E44 6A20                     push 32
  9965 00004E46 E834F8                   call prc
  9966 00004E49 83C402                   add  sp, 2
  9967                                  
  9968                                  ;-905   c=CType [i]; if(c==0)prs("unresolved ");
  9969                                  
  9970 00004E4C 8B5E04                   mov bx, [bp+4]
  9971 00004E4F 8A872FA1                 mov al, [CType + bx]
  9972 00004E53 8846FE                   mov [bp-2], al
  9973 00004E56 8A46FE                   mov al, [bp-2]
  9974 00004E59 3C00                     cmp al, 0
  9975 00004E5B 0F850900                 jne @@calllisting569
  9976 00004E5F 68[A44E]                 push calllisting_1
  9977 00004E62 E87FF8                   call prs
  9978 00004E65 83C402                   add  sp, 2
  9979                                  
  9980                                  ;-906   j=CAdr[i];            printint51(j); prc(32);
  9981                                  
  9982                                  @@calllisting569:
  9983 00004E68 8B5E04                   mov bx, [bp+4]
  9984 00004E6B D1E3                     shl bx, 1
  9985 00004E6D 8B8757AB                 mov ax, [CAdr + bx]
  9986 00004E71 8946FC                   mov [bp-4], ax
  9987 00004E74 FF76FC                   push word [bp-4]
  9988 00004E77 E806FA                   call printint51
  9989 00004E7A 83C402                   add  sp, 2
  9990 00004E7D 6A20                     push 32
  9991 00004E7F E8FBF7                   call prc
  9992 00004E82 83C402                   add  sp, 2
  9993                                  
  9994                                  ;-907   from_far(NameA, j);   prs(NameA);
  9995                                  
  9996 00004E85 FF76FC                   push word [bp-4]
  9997 00004E88 8D06[4700]               lea  ax, [NameA]
  9998 00004E8C 50                       push ax
  9999 00004E8D E8B206                   call from_far
 10000 00004E90 83C404                   add  sp, 4
 10001 00004E93 8D06[4700]               lea  ax, [NameA]
 10002 00004E97 50                       push ax
 10003 00004E98 E849F8                   call prs
 10004 00004E9B 83C402                   add  sp, 2
 10005                                  
 10006                                  ;-908 }
 10007                                  
 10008                                  
 10009                                  ;-909 int countcalls(int f) { unsigned int i;
 10010 00004E9E C9                       LEAVE
 10011 00004E9F C3                       ret
 10012                                  ; ENDP
 10013 00004EA0 5C6E3B00                calllisting_0 db "\n;",0
 10014 00004EA4 756E7265736F6C7665-     calllisting_1 db "unresolved ",0
 10015 00004EAD 642000             
 10016                                  
 10017                                  countcalls:  ; *** PROC ***
 10018                                  
 10019                                  ;-910   pt=adrF(FNameField, f);
 10020                                  
 10021                                  ;Function : countcalls, Number of local variables: 2
 10022                                  ;   # type sign width addr used name   list of local variables
 10023                                  ;  200 var sign word   909 NULL f = bp+4
 10024                                  ;  201 var unsg word   909 NULL i = bp-2;
 10025 00004EB0 C8020000                 ENTER  2,0
 10026 00004EB4 FF7604                   push word [bp+4]
 10027 00004EB7 8D064FBD                 lea  ax, [FNameField]
 10028 00004EBB 50                       push ax
 10029 00004EBC E878B7                   call adrF
 10030 00004EBF 83C404                   add  sp, 4
 10031 00004EC2 A3[7200]                 mov word [pt], ax
 10032                                  
 10033                                  ;-911   i=0;  while (i < CTop) {
 10034                                  
 10035 00004EC5 B80000                   mov ax, 0
 10036 00004EC8 8946FE                   mov [bp-2], ax
 10037                                  @@countcalls570:
 10038 00004ECB 8B46FE                   mov ax, [bp-2]
 10039 00004ECE 3B06[4500]               cmp ax, [CTop]
 10040 00004ED2 0F8D4A00                 jge @@countcalls571
 10041                                  
 10042                                  ;-912     p1=CAdr[i];
 10043                                  
 10044 00004ED6 8B5EFE                   mov bx, [bp-2]
 10045 00004ED9 D1E3                     shl bx, 1
 10046 00004EDB 8B8757AB                 mov ax, [CAdr + bx]
 10047 00004EDF A3[7400]                 mov word [p1], ax
 10048                                  
 10049                                  ;-913     from_far(NameA, p1);
 10050                                  
 10051 00004EE2 FF36[7400]               push word [p1]
 10052 00004EE6 8D06[4700]               lea  ax, [NameA]
 10053 00004EEA 50                       push ax
 10054 00004EEB E85406                   call from_far
 10055 00004EEE 83C404                   add  sp, 4
 10056                                  
 10057                                  ;-914     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
 10058                                  
 10059 00004EF1 8D06[4700]               lea  ax, [NameA]
 10060 00004EF5 50                       push ax
 10061 00004EF6 FF36[7200]               push word [pt]
 10062 00004EFA E8B408                   call eqstr
 10063 00004EFD 83C404                   add  sp, 4
 10064 00004F00 08C0                     or  al, al
 10065 00004F02 0F841500                 je @@countcalls572
 10066 00004F06 8B5E04                   mov bx, [bp+4]
 10067 00004F09 D1E3                     shl bx, 1
 10068 00004F0B 8B87F7BA                 mov ax, [FCalls + bx]
 10069 00004F0F 83C001                   add ax, 1
 10070 00004F12 8B5E04                   mov bx, [bp+4]
 10071 00004F15 D1E3                     shl bx, 1
 10072 00004F17 8987F7BA                 mov [FCalls+bx], ax
 10073                                  
 10074                                  ;-915     i++; }
 10075                                  
 10076                                  @@countcalls572:
 10077 00004F1B FF46FE                   inc  word[bp-2]
 10078                                  
 10079                                  ;-916 }
 10080                                  
 10081 00004F1E EBAB                     jmp @@countcalls570
 10082                                  @@countcalls571:
 10083                                  
 10084                                  ;-917 int listfunc() { int i;
 10085 00004F20 C9                       LEAVE
 10086 00004F21 C3                       ret
 10087                                  ; ENDP
 10088                                  
 10089                                  listfunc:  ; *** PROC ***
 10090                                  
 10091                                  ;-918   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
 10092                                  
 10093                                  ;Function : listfunc, Number of local variables: 1
 10094                                  ;   # type sign width addr used name   list of local variables
 10095                                  ;  200 var sign word   917 NULL i = bp-2;
 10096 00004F22 C8020000                 ENTER  2,0
 10097 00004F26 68[6F4F]                 push listfunc_0
 10098 00004F29 E8B8F7                   call prs
 10099 00004F2C 83C402                   add  sp, 2
 10100                                  
 10101                                  ;-919   i=0;  while (i < FTop) { countcalls (i); i++; } 
 10102                                  
 10103 00004F2F B80000                   mov ax, 0
 10104 00004F32 8946FE                   mov [bp-2], ax
 10105                                  @@listfunc573:
 10106 00004F35 8B46FE                   mov ax, [bp-2]
 10107 00004F38 3B06[4300]               cmp ax, [FTop]
 10108 00004F3C 0F8D0E00                 jge @@listfunc574
 10109 00004F40 FF76FE                   push word [bp-2]
 10110 00004F43 E86AFF                   call countcalls
 10111 00004F46 83C402                   add  sp, 2
 10112 00004F49 FF46FE                   inc  word[bp-2]
 10113                                  
 10114                                  ;-920   i=0;  while (i < FTop) { funclisting(i); i++; } }
 10115                                  
 10116 00004F4C EBE7                     jmp @@listfunc573
 10117                                  @@listfunc574:
 10118 00004F4E B80000                   mov ax, 0
 10119 00004F51 8946FE                   mov [bp-2], ax
 10120                                  @@listfunc575:
 10121 00004F54 8B46FE                   mov ax, [bp-2]
 10122 00004F57 3B06[4300]               cmp ax, [FTop]
 10123 00004F5B 0F8D0E00                 jge @@listfunc576
 10124 00004F5F FF76FE                   push word [bp-2]
 10125 00004F62 E84300                   call funclisting
 10126 00004F65 83C402                   add  sp, 2
 10127 00004F68 FF46FE                   inc  word[bp-2]
 10128 00004F6B EBE7                     jmp @@listfunc575
 10129                                  @@listfunc576:
 10130                                  
 10131                                  ;-921 int funclisting(int i) {int j;  char c;
 10132 00004F6D C9                       LEAVE
 10133 00004F6E C3                       ret
 10134                                  ; ENDP
 10135 00004F6F 5C6E5C6E5C6E3B2020-     listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
 10136 00004F78 20232043616C6C7320-
 10137 00004F81 4C696E652057696474-
 10138 00004F8A 6820204E616D652020-
 10139 00004F93 206C697374206F6620-
 10140 00004F9C 66756E6374696F6E73-
 10141 00004FA5 5C6E00             
 10142                                  
 10143                                  funclisting:  ; *** PROC ***
 10144                                  
 10145                                  ;-922   prs("\n;");    printint51(i);
 10146                                  
 10147                                  ;Function : funclisting, Number of local variables: 3
 10148                                  ;   # type sign width addr used name   list of local variables
 10149                                  ;  200 var sign word   921 NULL i = bp+4
 10150                                  ;  201 var sign word   921 NULL j = bp-2
 10151                                  ;  202 var sign byte   921 NULL c = bp-4;
 10152 00004FA8 C8040000                 ENTER  4,0
 10153 00004FAC 68[8450]                 push funclisting_0
 10154 00004FAF E832F7                   call prs
 10155 00004FB2 83C402                   add  sp, 2
 10156 00004FB5 FF7604                   push word [bp+4]
 10157 00004FB8 E8C5F8                   call printint51
 10158 00004FBB 83C402                   add  sp, 2
 10159                                  
 10160                                  ;-923   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
 10161                                  
 10162 00004FBE 8B5E04                   mov bx, [bp+4]
 10163 00004FC1 D1E3                     shl bx, 1
 10164 00004FC3 8B87F7BA                 mov ax, [FCalls + bx]
 10165 00004FC7 8946FE                   mov [bp-2], ax
 10166 00004FCA 8B46FE                   mov ax, [bp-2]
 10167 00004FCD 08C0                     or  al, al
 10168 00004FCF 0F840C00                 je @@funclisting577
 10169 00004FD3 FF76FE                   push word [bp-2]
 10170 00004FD6 E8A7F8                   call printint51
 10171 00004FD9 83C402                   add  sp, 2
 10172 00004FDC E90900                   jmp @@funclisting578
 10173                                  @@funclisting577:
 10174 00004FDF 68[8850]                 push funclisting_1
 10175 00004FE2 E8FFF6                   call prs
 10176 00004FE5 83C402                   add  sp, 2
 10177                                  
 10178                                  ;-924   j = FAdr[i];   printint51(j); prc(32);
 10179                                  
 10180                                  @@funclisting578:
 10181 00004FE8 8B5E04                   mov bx, [bp+4]
 10182 00004FEB D1E3                     shl bx, 1
 10183 00004FED 8B87FFA8                 mov ax, [FAdr + bx]
 10184 00004FF1 8946FE                   mov [bp-2], ax
 10185 00004FF4 FF76FE                   push word [bp-2]
 10186 00004FF7 E886F8                   call printint51
 10187 00004FFA 83C402                   add  sp, 2
 10188 00004FFD 6A20                     push 32
 10189 00004FFF E87BF6                   call prc
 10190 00005002 83C402                   add  sp, 2
 10191                                  
 10192                                  ;-925   c=FType[i];
 10193                                  
 10194 00005005 8B5E04                   mov bx, [bp+4]
 10195 00005008 8A8703A0                 mov al, [FType + bx]
 10196 0000500C 8846FC                   mov [bp-4], al
 10197                                  
 10198                                  ;-926   if(c=='V')prs("void " );    if(c=='B')prs("byte " );
 10199                                  
 10200 0000500F 8A46FC                   mov al, [bp-4]
 10201 00005012 3C56                     cmp al, 86
 10202 00005014 0F850900                 jne @@funclisting579
 10203 00005018 68[8E50]                 push funclisting_2
 10204 0000501B E8C6F6                   call prs
 10205 0000501E 83C402                   add  sp, 2
 10206                                  @@funclisting579:
 10207 00005021 8A46FC                   mov al, [bp-4]
 10208 00005024 3C42                     cmp al, 66
 10209 00005026 0F850900                 jne @@funclisting580
 10210 0000502A 68[9450]                 push funclisting_3
 10211 0000502D E8B4F6                   call prs
 10212 00005030 83C402                   add  sp, 2
 10213                                  
 10214                                  ;-927   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
 10215                                  
 10216                                  @@funclisting580:
 10217 00005033 8A46FC                   mov al, [bp-4]
 10218 00005036 3C57                     cmp al, 87
 10219 00005038 0F850900                 jne @@funclisting581
 10220 0000503C 68[9A50]                 push funclisting_4
 10221 0000503F E8A2F6                   call prs
 10222 00005042 83C402                   add  sp, 2
 10223                                  @@funclisting581:
 10224 00005045 8A46FC                   mov al, [bp-4]
 10225 00005048 3C44                     cmp al, 68
 10226 0000504A 0F850900                 jne @@funclisting582
 10227 0000504E 68[A050]                 push funclisting_5
 10228 00005051 E890F6                   call prs
 10229 00005054 83C402                   add  sp, 2
 10230                                  
 10231                                  ;-928   prc(32); prc(32);
 10232                                  
 10233                                  @@funclisting582:
 10234 00005057 6A20                     push 32
 10235 00005059 E821F6                   call prc
 10236 0000505C 83C402                   add  sp, 2
 10237 0000505F 6A20                     push 32
 10238 00005061 E819F6                   call prc
 10239 00005064 83C402                   add  sp, 2
 10240                                  
 10241                                  ;-929   pt=adrF(FNameField, i); prs(pt);
 10242                                  
 10243 00005067 FF7604                   push word [bp+4]
 10244 0000506A 8D064FBD                 lea  ax, [FNameField]
 10245 0000506E 50                       push ax
 10246 0000506F E8C5B5                   call adrF
 10247 00005072 83C404                   add  sp, 4
 10248 00005075 A3[7200]                 mov word [pt], ax
 10249 00005078 FF36[7200]               push word [pt]
 10250 0000507C E865F6                   call prs
 10251 0000507F 83C402                   add  sp, 2
 10252                                  
 10253                                  ;-930 }
 10254                                  
 10255                                  
 10256                                  ;-931 unsigned int MAXUI=65535;
 10257 00005082 C9                       LEAVE
 10258 00005083 C3                       ret
 10259                                  ; ENDP
 10260 00005084 5C6E3B00                funclisting_0 db "\n;",0
 10261 00005088 204E554C4C00            funclisting_1 db " NULL",0
 10262 0000508E 766F69642000            funclisting_2 db "void ",0
 10263 00005094 627974652000            funclisting_3 db "byte ",0
 10264 0000509A 776F72642000            funclisting_4 db "word ",0
 10265 000050A0 647772642000            funclisting_5 db "dwrd ",0
 10266 000050A6 FFFF                    MAXUI dw 65535
 10267                                  
 10268                                  ;-932 int epilog() {unsigned int i; 
 10269                                  
 10270                                  
 10271                                  epilog:  ; *** PROC ***
 10272                                  
 10273                                  ;-933   strcpy(symbol, "LastFunctionByt");  storefunc();
 10274                                  
 10275                                  ;Function : epilog, Number of local variables: 1
 10276                                  ;   # type sign width addr used name   list of local variables
 10277                                  ;  200 var unsg word   932 NULL i = bp-2;
 10278 000050A8 C8020000                 ENTER  2,0
 10279 000050AC 68[D952]                 push epilog_0
 10280 000050AF 8D062B81                 lea  ax, [symbol]
 10281 000050B3 50                       push ax
 10282 000050B4 E8D305                   call strcpy
 10283 000050B7 83C404                   add  sp, 4
 10284 000050BA E885B8                   call storefunc
 10285                                  
 10286                                  ;-934   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
 10287                                  
 10288 000050BD 68[E952]                 push epilog_1
 10289 000050C0 E821F6                   call prs
 10290 000050C3 83C402                   add  sp, 2
 10291                                  
 10292                                  ;-935   prs("\n \n;   # type sign width  adr used name   list of global variables\n");
 10293                                  
 10294 000050C6 68[1653]                 push epilog_2
 10295 000050C9 E818F6                   call prs
 10296 000050CC 83C402                   add  sp, 2
 10297                                  
 10298                                  ;-936   i=1;
 10299                                  
 10300 000050CF B80100                   mov ax, 1
 10301 000050D2 8946FE                   mov [bp-2], ax
 10302                                  
 10303                                  ;-937   while (i< GTop) { listvar(i); i++; }
 10304                                  
 10305                                  @@epilog583:
 10306 000050D5 8B46FE                   mov ax, [bp-2]
 10307 000050D8 3B06[3200]               cmp ax, [GTop]
 10308 000050DC 0F8D0E00                 jge @@epilog584
 10309 000050E0 FF76FE                   push word [bp-2]
 10310 000050E3 E8BEFA                   call listvar
 10311 000050E6 83C402                   add  sp, 2
 10312 000050E9 FF46FE                   inc  word[bp-2]
 10313                                  
 10314                                  ;-938   listfunc();   listcall();
 10315                                  
 10316 000050EC EBE7                     jmp @@epilog583
 10317                                  @@epilog584:
 10318 000050EE E831FE                   call listfunc
 10319 000050F1 E8E4FC                   call listcall
 10320                                  
 10321                                  ;-939 
 10322                                  
 10323                                  
 10324                                  ;-940   prs("\n;Input: "); prs(&namein);
 10325                                  
 10326 000050F4 68[5D53]                 push epilog_3
 10327 000050F7 E8EAF5                   call prs
 10328 000050FA 83C402                   add  sp, 2
 10329 000050FD 8D06EE81                 lea  ax, [namein]
 10330 00005101 50                       push ax
 10331 00005102 E8DFF5                   call prs
 10332 00005105 83C402                   add  sp, 2
 10333                                  
 10334                                  ;-941   prs(", List: ");   prs(&namelst);
 10335                                  
 10336 00005108 68[6853]                 push epilog_4
 10337 0000510B E8D6F5                   call prs
 10338 0000510E 83C402                   add  sp, 2
 10339 00005111 8D063182                 lea  ax, [namelst]
 10340 00005115 50                       push ax
 10341 00005116 E8CBF5                   call prs
 10342 00005119 83C402                   add  sp, 2
 10343                                  
 10344                                  ;-942   prs(",  Lines:"); printint51(lineno);
 10345                                  
 10346 0000511C 68[7153]                 push epilog_5
 10347 0000511F E8C2F5                   call prs
 10348 00005122 83C402                   add  sp, 2
 10349 00005125 FF36[6E00]               push word [lineno]
 10350 00005129 E854F7                   call printint51
 10351 0000512C 83C402                   add  sp, 2
 10352                                  
 10353                                  ;-943   prs("\n;Glob. variables:"); GTop--; printint51(GTop);
 10354                                  
 10355 0000512F 68[7B53]                 push epilog_6
 10356 00005132 E8AFF5                   call prs
 10357 00005135 83C402                   add  sp, 2
 10358 00005138 FF0E[3200]               dec  word[GTop]
 10359 0000513C FF36[3200]               push word [GTop]
 10360 00005140 E83DF7                   call printint51
 10361 00005143 83C402                   add  sp, 2
 10362                                  
 10363                                  ;-944   prs(" max.:"); printint51(LSTART);
 10364                                  
 10365 00005146 68[8F53]                 push epilog_7
 10366 00005149 E898F5                   call prs
 10367 0000514C 83C402                   add  sp, 2
 10368 0000514F 68C800                   push 200
 10369 00005152 E82BF7                   call printint51
 10370 00005155 83C402                   add  sp, 2
 10371                                  
 10372                                  ;-945   prs("\n;Functions      :"); printint51(FTop);
 10373                                  
 10374 00005158 68[9653]                 push epilog_8
 10375 0000515B E886F5                   call prs
 10376 0000515E 83C402                   add  sp, 2
 10377 00005161 FF36[4300]               push word [FTop]
 10378 00005165 E818F7                   call printint51
 10379 00005168 83C402                   add  sp, 2
 10380                                  
 10381                                  ;-946   prs(" max.:"); printint51(FUNCMAX);
 10382                                  
 10383 0000516B 68[AA53]                 push epilog_9
 10384 0000516E E873F5                   call prs
 10385 00005171 83C402                   add  sp, 2
 10386 00005174 682C01                   push 300
 10387 00005177 E806F7                   call printint51
 10388 0000517A 83C402                   add  sp, 2
 10389                                  
 10390                                  ;-947   prs("\n;Calls          :"); printint51(CTop);
 10391                                  
 10392 0000517D 68[B153]                 push epilog_10
 10393 00005180 E861F5                   call prs
 10394 00005183 83C402                   add  sp, 2
 10395 00005186 FF36[4500]               push word [CTop]
 10396 0000518A E8F3F6                   call printint51
 10397 0000518D 83C402                   add  sp, 2
 10398                                  
 10399                                  ;-948   prs(" max.:"); printint51(CALLMAX);
 10400                                  
 10401 00005190 68[C553]                 push epilog_11
 10402 00005193 E84EF5                   call prs
 10403 00005196 83C402                   add  sp, 2
 10404 00005199 68D007                   push 2000
 10405 0000519C E8E1F6                   call printint51
 10406 0000519F 83C402                   add  sp, 2
 10407                                  
 10408                                  ;-949   prs(", NameField:"); printint51(CNameTop);
 10409                                  
 10410 000051A2 68[CC53]                 push epilog_12
 10411 000051A5 E83CF5                   call prs
 10412 000051A8 83C402                   add  sp, 2
 10413 000051AB FF36[6800]               push word [CNameTop]
 10414 000051AF E8CEF6                   call printint51
 10415 000051B2 83C402                   add  sp, 2
 10416                                  
 10417                                  ;-950   prs(" max.:"); printint51(65535);
 10418                                  
 10419 000051B5 68[D953]                 push epilog_13
 10420 000051B8 E829F5                   call prs
 10421 000051BB 83C402                   add  sp, 2
 10422 000051BE 6AFF                     push -1
 10423 000051C0 E8BDF6                   call printint51
 10424 000051C3 83C402                   add  sp, 2
 10425                                  
 10426                                  ;-951 //  prs(", segE:"); printint51(segE);
 10427                                  
 10428                                  
 10429                                  ;-952   __asm{call LastFunctionByt}  _ i=ax;
 10430                                  
 10431 000051C6 E8DD06                  call LastFunctionByt
 10432 000051C9 8946FE                  mov [bp-2], ax
 10433                                  
 10434                                  ;-953   prs("\n;Code until     :"); printint51(i);
 10435                                  
 10436 000051CC 68[E053]                 push epilog_14
 10437 000051CF E812F5                   call prs
 10438 000051D2 83C402                   add  sp, 2
 10439 000051D5 FF76FE                   push word [bp-2]
 10440 000051D8 E8A5F6                   call printint51
 10441 000051DB 83C402                   add  sp, 2
 10442                                  
 10443                                  ;-954   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
 10444                                  
 10445 000051DE 68[F453]                 push epilog_15
 10446 000051E1 E800F5                   call prs
 10447 000051E4 83C402                   add  sp, 2
 10448 000051E7 FF36[1400]               push word [ORGDATAORIG]
 10449 000051EB E892F6                   call printint51
 10450 000051EE 83C402                   add  sp, 2
 10451 000051F1 A1[1400]                 mov ax, [ORGDATAORIG]
 10452 000051F4 2B46FE                   sub ax, [bp-2]
 10453 000051F7 8946FE                   mov [bp-2], ax
 10454 000051FA 68[FC53]                 push epilog_16
 10455 000051FD E8E4F4                   call prs
 10456 00005200 83C402                   add  sp, 2
 10457                                  
 10458                                  ;-955   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
 10459                                  
 10460 00005203 FF76FE                   push word [bp-2]
 10461 00005206 E877F6                   call printint51
 10462 00005209 83C402                   add  sp, 2
 10463 0000520C 8B46FE                   mov ax, [bp-2]
 10464 0000520F 3DE803                   cmp ax, 1000
 10465 00005212 0F870900                 ja  @@epilog585
 10466 00005216 68[0454]                 push epilog_17
 10467 00005219 E8C8F4                   call prs
 10468 0000521C 83C402                   add  sp, 2
 10469                                  
 10470                                  ;-956   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
 10471                                  
 10472                                  @@epilog585:
 10473 0000521F 68[2954]                 push epilog_18
 10474 00005222 E8BFF4                   call prs
 10475 00005225 83C402                   add  sp, 2
 10476 00005228 FF36[1600]               push word [orgData]
 10477 0000522C E80FF6                   call prunsign1
 10478 0000522F 83C402                   add  sp, 2
 10479 00005232 A1[A650]                 mov ax, [MAXUI]
 10480 00005235 2B06[1600]               sub ax, [orgData]
 10481 00005239 8946FE                   mov [bp-2], ax
 10482                                  
 10483                                  ;-957   prs(", resting stacksize: ");printint51(i);
 10484                                  
 10485 0000523C 68[3D54]                 push epilog_19
 10486 0000523F E8A2F4                   call prs
 10487 00005242 83C402                   add  sp, 2
 10488 00005245 FF76FE                   push word [bp-2]
 10489 00005248 E835F6                   call printint51
 10490 0000524B 83C402                   add  sp, 2
 10491                                  
 10492                                  ;-958   if (i <= 5000) prs(" *** Warning *** Stack too small");
 10493                                  
 10494 0000524E 8B46FE                   mov ax, [bp-2]
 10495 00005251 3D8813                   cmp ax, 5000
 10496 00005254 0F870900                 ja  @@epilog586
 10497 00005258 68[5354]                 push epilog_20
 10498 0000525B E886F4                   call prs
 10499 0000525E 83C402                   add  sp, 2
 10500                                  
 10501                                  ;-959   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
 10502                                  
 10503                                  @@epilog586:
 10504 00005261 68[7454]                 push epilog_21
 10505 00005264 E87DF4                   call prs
 10506 00005267 83C402                   add  sp, 2
 10507 0000526A 8D06E880                 lea  ax, [coname]
 10508 0000526E 50                       push ax
 10509 0000526F E872F4                   call prs
 10510 00005272 83C402                   add  sp, 2
 10511 00005275 68[8754]                 push epilog_22
 10512 00005278 E869F4                   call prs
 10513 0000527B 83C402                   add  sp, 2
 10514 0000527E FF36[1800]               push word [maxco]
 10515 00005282 E8FBF5                   call printint51
 10516 00005285 83C402                   add  sp, 2
 10517                                  
 10518                                  ;-960   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
 10519                                  
 10520 00005288 68[8B54]                 push epilog_23
 10521 0000528B E856F4                   call prs
 10522 0000528E 83C402                   add  sp, 2
 10523 00005291 68B80B                   push 3000
 10524 00005294 E8E9F5                   call printint51
 10525 00005297 83C402                   add  sp, 2
 10526 0000529A B8B80B                   mov ax, 3000
 10527 0000529D 8946FE                   mov [bp-2], ax
 10528 000052A0 8B46FE                   mov ax, [bp-2]
 10529 000052A3 2B06[1800]               sub ax, [maxco]
 10530 000052A7 8946FE                   mov [bp-2], ax
 10531 000052AA 68[9154]                 push epilog_24
 10532 000052AD E834F4                   call prs
 10533 000052B0 83C402                   add  sp, 2
 10534                                  
 10535                                  ;-961   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
 10536                                  
 10537 000052B3 FF76FE                   push word [bp-2]
 10538 000052B6 E8C7F5                   call printint51
 10539 000052B9 83C402                   add  sp, 2
 10540 000052BC 8B46FE                   mov ax, [bp-2]
 10541 000052BF 3DE803                   cmp ax, 1000
 10542 000052C2 0F870900                 ja  @@epilog587
 10543 000052C6 68[9954]                 push epilog_25
 10544 000052C9 E818F4                   call prs
 10545 000052CC 83C402                   add  sp, 2
 10546                                  
 10547                                  ;-962   end1(0);}
 10548                                  
 10549                                  @@epilog587:
 10550 000052CF 6A00                     push 0
 10551 000052D1 E8D6F6                   call end1
 10552 000052D4 83C402                   add  sp, 2
 10553                                  
 10554                                  ;-963 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
 10555                                  
 10556                                  
 10557                                  ;-964 int setblock(unsigned int i) {
 10558 000052D7 C9                       LEAVE
 10559 000052D8 C3                       ret
 10560                                  ; ENDP
 10561 000052D9 4C61737446756E6374-     epilog_0 db "LastFunctionByt",0
 10562 000052E2 696F6E42797400     
 10563 000052E9 5C6E4C61737446756E-     epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
 10564 000052F2 6374696F6E4279743A-
 10565 000052FB 646220304538682C20-
 10566 00005304 302C20305C6E706F70-
 10567 0000530D 2061785C6E72657400 
 10568 00005316 5C6E205C6E3B202020-     epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
 10569 0000531F 232074797065207369-
 10570 00005328 676E20776964746820-
 10571 00005331 206164722075736564-
 10572 0000533A 206E616D652020206C-
 10573 00005343 697374206F6620676C-
 10574 0000534C 6F62616C2076617269-
 10575 00005355 61626C65735C6E00   
 10576 0000535D 5C6E3B496E7075743A-     epilog_3 db "\n;Input: ",0
 10577 00005366 2000               
 10578 00005368 2C204C6973743A2000      epilog_4 db ", List: ",0
 10579 00005371 2C20204C696E65733A-     epilog_5 db ",  Lines:",0
 10580 0000537A 00                 
 10581 0000537B 5C6E3B476C6F622E20-     epilog_6 db "\n;Glob. variables:",0
 10582 00005384 7661726961626C6573-
 10583 0000538D 3A00               
 10584 0000538F 206D61782E3A00          epilog_7 db " max.:",0
 10585 00005396 5C6E3B46756E637469-     epilog_8 db "\n;Functions      :",0
 10586 0000539F 6F6E73202020202020-
 10587 000053A8 3A00               
 10588 000053AA 206D61782E3A00          epilog_9 db " max.:",0
 10589 000053B1 5C6E3B43616C6C7320-     epilog_10 db "\n;Calls          :",0
 10590 000053BA 202020202020202020-
 10591 000053C3 3A00               
 10592 000053C5 206D61782E3A00          epilog_11 db " max.:",0
 10593 000053CC 2C204E616D65466965-     epilog_12 db ", NameField:",0
 10594 000053D5 6C643A00           
 10595 000053D9 206D61782E3A00          epilog_13 db " max.:",0
 10596 000053E0 5C6E3B436F64652075-     epilog_14 db "\n;Code until     :",0
 10597 000053E9 6E74696C2020202020-
 10598 000053F2 3A00               
 10599 000053F4 206D61782E3A2000        epilog_15 db " max.: ",0
 10600 000053FC 2C20667265653A00        epilog_16 db ", free:",0
 10601 00005404 202A2A2A205761726E-     epilog_17 db " *** Warning *** Code area too small",0
 10602 0000540D 696E67202A2A2A2043-
 10603 00005416 6F6465206172656120-
 10604 0000541F 746F6F20736D616C6C-
 10605 00005428 00                 
 10606 00005429 5C6E3B446174612028-     epilog_18 db "\n;Data (HeapEnd) :",0
 10607 00005432 48656170456E642920-
 10608 0000543B 3A00               
 10609 0000543D 2C2072657374696E67-     epilog_19 db ", resting stacksize: ",0
 10610 00005446 20737461636B73697A-
 10611 0000544F 653A2000           
 10612 00005453 202A2A2A205761726E-     epilog_20 db " *** Warning *** Stack too small",0
 10613 0000545C 696E67202A2A2A2053-
 10614 00005465 7461636B20746F6F20-
 10615 0000546E 736D616C6C00       
 10616 00005474 5C6E3B4D61782E2043-     epilog_21 db "\n;Max. Const in '",0
 10617 0000547D 6F6E737420696E2027-
 10618 00005486 00                 
 10619 00005487 27203A00                epilog_22 db "' :",0
 10620 0000548B 206D61782E00            epilog_23 db " max.",0
 10621 00005491 2C20667265653A00        epilog_24 db ", free:",0
 10622 00005499 202A2A2A205761726E-     epilog_25 db " *** Warning *** constant area too small",0
 10623 000054A2 696E67202A2A2A2063-
 10624 000054AB 6F6E7374616E742061-
 10625 000054B4 72656120746F6F2073-
 10626 000054BD 6D616C6C00         
 10627                                  
 10628                                  setblock:  ; *** PROC ***
 10629                                  
 10630                                  ;-965   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
 10631                                  
 10632                                  ;Function : setblock, Number of local variables: 1
 10633                                  ;   # type sign width addr used name   list of local variables
 10634                                  ;  200 var unsg word   964 NULL i = bp+4;
 10635 000054C2 C8000000                 ENTER  0,0
 10636 000054C6 B80000                   mov ax, 0
 10637 000054C9 A3[7600]                 mov word [DOS_ERR], ax
 10638 000054CC 8B5E04                   mov  bx, [bp+4]
 10639 000054CF 8CC8                     mov  ax, cs
 10640 000054D1 8EC0                     mov  es, ax
 10641 000054D3 B8004A                   mov  ax, 18944
 10642 000054D6 E84903                   call DosInt
 10643                                  
 10644                                  ;-966 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 10645 000054D9 C9                       LEAVE
 10646 000054DA C3                       ret
 10647                                  ; ENDP
 10648                                  
 10649                                  allocmem:  ; *** PROC ***
 10650                                  
 10651                                  ;-967   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
 10652                                  
 10653                                  ;Function : allocmem, Number of local variables: 3
 10654                                  ;   # type sign width addr used name   list of local variables
 10655                                  ;  200 var unsg word   966 NULL i = bp+4
 10656                                  ;  201 var unsg word   966 NULL vAX = bp-2
 10657                                  ;  202 var unsg word   966 NULL vBX = bp-4;
 10658 000054DB C8040000                 ENTER  4,0
 10659 000054DF B80000                   mov ax, 0
 10660 000054E2 A3[7600]                 mov word [DOS_ERR], ax
 10661 000054E5 8B5E04                   mov  bx, [bp+4]
 10662 000054E8 B80048                   mov  ax, 18432
 10663 000054EB E83403                   call DosInt
 10664 000054EE 8946FE                  mov [bp-2], ax
 10665 000054F1 895EFC                  mov [bp-4], bx
 10666                                  
 10667                                  ;-968   if(DOS_ERR) return vBX;   return vAX;
 10668                                  
 10669 000054F4 A1[7600]                 mov ax, [DOS_ERR]
 10670 000054F7 08C0                     or  al, al
 10671 000054F9 0F840600                 je @@allocmem588
 10672 000054FD 8B46FC                   mov ax, [bp-4]
 10673 00005500 E90600                   jmp @@retn
 10674                                  @@allocmem588:
 10675 00005503 8B46FE                   mov ax, [bp-2]
 10676 00005506 E90000                   jmp @@retn
 10677                                  
 10678                                  ;-969 }
 10679                                  
 10680                                  
 10681                                  ;-970 int copyF(char *dest, char *src, unsigned int sz) {
 10682                                  
 10683 00005509 C9                      @@retn: LEAVE
 10684 0000550A C3                       ret
 10685                                  ; ENDP
 10686                                  
 10687                                  copyF:  ; *** PROC ***
 10688                                  
 10689                                  ;-971   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
 10690                                  
 10691                                  ;Function : copyF, Number of local variables: 3
 10692                                  ;   # type sign width addr used name   list of local variables
 10693                                  ;  200 ptr sign byte   970 NULL dest = bp+4
 10694                                  ;  201 ptr sign byte   970 NULL src = bp+6
 10695                                  ;  202 var unsg word   970 NULL sz = bp+8;
 10696 0000550B C8000000                 ENTER  0,0
 10697 0000550F A1[6C00]                 mov ax, [segE]
 10698 00005512 8EC0                     mov  es, ax
 10699 00005514 8B7606                   mov  si, [bp+6]
 10700 00005517 8B7E04                   mov  di, [bp+4]
 10701 0000551A 8B4E08                   mov  cx, [bp+8]
 10702                                  
 10703                                  ;-972   asm cld
 10704                                  
 10705 0000551D FC                       cld
 10706                                  
 10707                                  ;-973   asm rep movsb
 10708                                  
 10709 0000551E F3A4                     rep movsb
 10710                                  
 10711                                  ;-974   asm mov byte [es:di], 0
 10712                                  
 10713 00005520 26C60500                 mov byte [es:di], 0
 10714                                  
 10715                                  ;-975 }
 10716                                  
 10717                                  
 10718                                  ;-976 int to_far(char *dest, char *src) {
 10719 00005524 C9                       LEAVE
 10720 00005525 C3                       ret
 10721                                  ; ENDP
 10722                                  
 10723                                  to_far:  ; *** PROC ***
 10724                                  
 10725                                  ;-977   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10726                                  
 10727                                  ;Function : to_far, Number of local variables: 2
 10728                                  ;   # type sign width addr used name   list of local variables
 10729                                  ;  200 ptr sign byte   976 NULL dest = bp+4
 10730                                  ;  201 ptr sign byte   976 NULL src = bp+6;
 10731 00005526 C8000000                 ENTER  0,0
 10732 0000552A A1[6C00]                 mov ax, [segE]
 10733 0000552D 8EC0                     mov  es, ax
 10734 0000552F 8B7606                   mov  si, [bp+6]
 10735 00005532 8B7E04                   mov  di, [bp+4]
 10736                                  
 10737                                  ;-978   asm cld
 10738                                  
 10739 00005535 FC                       cld
 10740                                  
 10741                                  ;-979   do{
 10742                                  
 10743                                  @@to_far589:
 10744                                  
 10745                                  ;-980   asm lodsb  ; inc si
 10746                                  
 10747 00005536 AC                       lodsb  ; inc si
 10748                                  
 10749                                  ;-981   asm stosb  ; inc di
 10750                                  
 10751 00005537 AA                       stosb  ; inc di
 10752                                  
 10753                                  ;-982   } while (al != 0);
 10754                                  
 10755 00005538 3C00                     cmp  al, 0
 10756 0000553A 0F840200                 je  @@to_far590
 10757 0000553E EBF6                     jmp @@to_far589
 10758                                  @@to_far590:
 10759                                  
 10760                                  ;-983 }
 10761                                  
 10762                                  
 10763                                  ;-984 int from_far(char *dest, char *src) {
 10764 00005540 C9                       LEAVE
 10765 00005541 C3                       ret
 10766                                  ; ENDP
 10767                                  
 10768                                  from_far:  ; *** PROC ***
 10769                                  
 10770                                  ;-985   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
 10771                                  
 10772                                  ;Function : from_far, Number of local variables: 2
 10773                                  ;   # type sign width addr used name   list of local variables
 10774                                  ;  200 ptr sign byte   984 NULL dest = bp+4
 10775                                  ;  201 ptr sign byte   984 NULL src = bp+6;
 10776 00005542 C8000000                 ENTER  0,0
 10777 00005546 A1[6C00]                 mov ax, [segE]
 10778 00005549 8EC0                     mov  es, ax
 10779 0000554B 8B7606                   mov  si, [bp+6]
 10780 0000554E 8B7E04                   mov  di, [bp+4]
 10781                                  
 10782                                  ;-986   do{
 10783                                  
 10784                                  @@from_far591:
 10785                                  
 10786                                  ;-987   asm mov al, [es:si]
 10787                                  
 10788 00005551 268A04                   mov al, [es:si]
 10789                                  
 10790                                  ;-988   asm inc si
 10791                                  
 10792 00005554 46                       inc si
 10793                                  
 10794                                  ;-989   asm mov [di], al
 10795                                  
 10796 00005555 8805                     mov [di], al
 10797                                  
 10798                                  ;-990   asm inc di
 10799                                  
 10800 00005557 47                       inc di
 10801                                  
 10802                                  ;-991   } while (al != 0);
 10803                                  
 10804 00005558 3C00                     cmp  al, 0
 10805 0000555A 0F840200                 je  @@from_far592
 10806 0000555E EBF1                     jmp @@from_far591
 10807                                  @@from_far592:
 10808                                  
 10809                                  ;-992 }
 10810 00005560 C9                       LEAVE
 10811 00005561 C3                       ret
 10812                                  ; ENDP
 10813                                   
 10814                                  ; missing functions: 
 10815                                  ; strlen
 10816                                  ; strcpy
 10817                                  ; strlen
 10818                                  ; strcpy
 10819                                  ; strcpy
 10820                                  ; eqstr
 10821                                  ; eqstr
 10822                                  ; strlen
 10823                                  ; strcpy
 10824                                  ; strcpy
 10825                                  ; eqstr
 10826                                  ; strcpy
 10827                                  ; mkneg
 10828                                  ; strlen
 10829                                  ; strcpy
 10830                                  ; eqstr
 10831                                  ; eqstr
 10832                                  ; strcpy
 10833                                  ; strcpy
 10834                                  ; strcpy
 10835                                  ; strcpy
 10836                                  ; strcpy
 10837                                  ; strcpy
 10838                                  ; strcpy
 10839                                  ; strcpy
 10840                                  ; strlen
 10841                                  ; eqstr
 10842                                  ; eqstr
 10843                                  ; eqstr
 10844                                  ; eqstr
 10845                                  ; eqstr
 10846                                  ; eqstr
 10847                                  ; eqstr
 10848                                  ; eqstr
 10849                                  ; eqstr
 10850                                  ; eqstr
 10851                                  ; eqstr
 10852                                  ; eqstr
 10853                                  ; eqstr
 10854                                  ; eqstr
 10855                                  ; eqstr
 10856                                  ; eqstr
 10857                                  ; eqstr
 10858                                  ; eqstr
 10859                                  ; eqstr
 10860                                  ; eqstr
 10861                                  ; eqstr
 10862                                  ; eqstr
 10863                                  ; strlen
 10864                                  ; eqstr
 10865                                  ; eqstr
 10866                                  ; eqstr
 10867                                  ; eqstr
 10868                                  ; eqstr
 10869                                  ; eqstr
 10870                                  ; eqstr
 10871                                  ; eqstr
 10872                                  ; eqstr
 10873                                  ; eqstr
 10874                                  ; eqstr
 10875                                  ; eqstr
 10876                                  ; eqstr
 10877                                  ; eqstr
 10878                                  ; eqstr
 10879                                  ; eqstr
 10880                                  ; eqstr
 10881                                  ; eqstr
 10882                                  ; eqstr
 10883                                  ; eqstr
 10884                                  ; eqstr
 10885                                  ; eqstr
 10886                                  ; eqstr
 10887                                  ; eqstr
 10888                                  ; eqstr
 10889                                  ; strcpy
 10890                                  ; cputs
 10891                                  ; cputs
 10892                                  ; readRL
 10893                                  ; strcpy
 10894                                  ; instr2
 10895                                  ; strcat1
 10896                                  ; toupper
 10897                                  ; strcpy
 10898                                  ; strlen
 10899                                  ; openR
 10900                                  ; cputs
 10901                                  ; cputs
 10902                                  ; exitR
 10903                                  ; creatR
 10904                                  ; cputs
 10905                                  ; cputs
 10906                                  ; exitR
 10907                                  ; eqstr
 10908                                  ; cputs
 10909                                  ; cputs
 10910                                  ; pint
 10911                                  ; openR
 10912                                  ; cputs
 10913                                  ; cputs
 10914                                  ; exitR
 10915                                  ; eqstr
 10916                                  ; putch
 10917                                  ; cputs
 10918                                  ; openR
 10919                                  ; eqstr
 10920                                  ; eqstr
 10921                                  ; strcpy
 10922                                  ; strlen
 10923                                  ; strcpy
 10924                                  ; instr1
 10925                                  ; digit
 10926                                  ; letter
 10927                                  ; strcpy
 10928                                  ; letter
 10929                                  ; eqstr
 10930                                  ; eqstr
 10931                                  ; eqstr
 10932                                  ; eqstr
 10933                                  ; eqstr
 10934                                  ; eqstr
 10935                                  ; eqstr
 10936                                  ; eqstr
 10937                                  ; eqstr
 10938                                  ; eqstr
 10939                                  ; eqstr
 10940                                  ; eqstr
 10941                                  ; eqstr
 10942                                  ; eqstr
 10943                                  ; eqstr
 10944                                  ; eqstr
 10945                                  ; eqstr
 10946                                  ; eqstr
 10947                                  ; eqstr
 10948                                  ; eqstr
 10949                                  ; eqstr
 10950                                  ; eqstr
 10951                                  ; strcpy
 10952                                  ; eqstr
 10953                                  ; letter
 10954                                  ; digit
 10955                                  ; writetty
 10956                                  ; writetty
 10957                                  ; fputcR
 10958                                  ; mkneg
 10959                                  ; mkneg
 10960                                  ; readR
 10961                                  ; fcloseR
 10962                                  ; fcloseR
 10963                                  ; exitR
 10964                                  ; eqstr
 10965                                  ; strcpy
 10966                                  ; DosInt
 10967                                  ; DosInt
 10968                                  ; Number of unresolved CALLs :  153
 10969                                  ;use archive file: AR.C
 10970                                  
 10971                                  ;-993 // AR.C Archive
 10972                                  
 10973                                  ;Number of CALLs:    2 : writetty
 10974                                  
 10975                                  writetty:  ; *** PROC ***
 10976 00005562 B40E                     mov  ah, 14
 10977 00005564 BB0000                   mov  bx, 0
 10978 00005567 CD10                     int  16
 10979                                  
 10980                                  ;-994 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
 10981                                  
 10982 00005569 C3                       ret
 10983                                  ; ENDP
 10984                                  ;Number of CALLs:    1 : putch
 10985                                  
 10986                                  putch:  ; *** PROC ***
 10987                                  ;Function : putch, Number of local variables: 1
 10988                                  ;   # type sign width addr used name   list of local variables
 10989                                  ;  200 var sign byte   994 NULL c = bp+4;
 10990 0000556A C8000000                 ENTER  0,0 ; constant expression
 10991 0000556E 807E040A                cmp byte[bp+4], 10
 10992 00005572 0F850500                 jne @@putch593
 10993 00005576 B00D                     mov  al, 13
 10994 00005578 E8E7FF                   call writetty
 10995                                  @@putch593:
 10996 0000557B 8A4604                   mov  al, [bp+4]
 10997 0000557E E8E1FF                   call writetty
 10998                                  
 10999                                  ;-995 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 11000 00005581 C9                       LEAVE
 11001 00005582 C3                       ret
 11002                                  ; ENDP
 11003                                  ;Number of CALLs:   11 : cputs
 11004                                  
 11005                                  cputs:  ; *** PROC ***
 11006                                  ;Function : cputs, Number of local variables: 2
 11007                                  ;   # type sign width addr used name   list of local variables
 11008                                  ;  200 ptr sign byte   995 NULL s = bp+4
 11009                                  ;  201 var sign byte   995 NULL c = bp-2;
 11010 00005583 C8020000                 ENTER  2,0
 11011                                  @@cputs594:
 11012 00005587 8B5E04                   mov bx, [bp+4]
 11013 0000558A 8A07                     mov al, [bx]
 11014 0000558C B400                     mov ah, 0
 11015 0000558E 08C0                     or  al, al
 11016 00005590 0F841B00                 je @@cputs595
 11017 00005594 8B5E04                   mov bx, [bp+4]
 11018 00005597 8A07                     mov al, [bx]
 11019 00005599 B400                     mov ah, 0
 11020 0000559B 8846FE                   mov [bp-2], al
 11021 0000559E 8A46FE                   mov al, byte [bp-2]
 11022 000055A1 B400                     mov ah, 0
 11023 000055A3 50                       push ax
 11024 000055A4 E8C3FF                   call putch
 11025 000055A7 83C402                   add  sp, 2
 11026 000055AA FF4604                   inc  word[bp+4]
 11027 000055AD EBD8                     jmp @@cputs594
 11028                                  @@cputs595:
 11029                                  
 11030                                  ;-996 int mkneg(int n) { n; __asm {neg ax} }
 11031 000055AF C9                       LEAVE
 11032 000055B0 C3                       ret
 11033                                  ; ENDP
 11034                                  ;Number of CALLs:    3 : mkneg
 11035                                  
 11036                                  mkneg:  ; *** PROC ***
 11037                                  ;Function : mkneg, Number of local variables: 1
 11038                                  ;   # type sign width addr used name   list of local variables
 11039                                  ;  200 var sign word   996 NULL n = bp+4;
 11040 000055B1 C8000000                 ENTER  0,0
 11041 000055B5 8B4604                   mov ax, [bp+4]
 11042 000055B8 F7D8                    neg ax
 11043                                  
 11044                                  ;-997 int prunsign(unsigned int n) { unsigned int e;
 11045 000055BA C9                       LEAVE
 11046 000055BB C3                       ret
 11047                                  ; ENDP
 11048                                  ;Number of CALLs:    1 : pint
 11049                                  
 11050                                  pint:  ; *** PROC ***
 11051                                  ;Function : pint, Number of local variables: 2
 11052                                  ;   # type sign width addr used name   list of local variables
 11053                                  ;  200 var sign word   997 NULL n = bp+4
 11054                                  ;  201 var sign word   997 NULL e = bp-2;
 11055 000055BC C8020000                 ENTER  2,0
 11056 000055C0 8B4604                   mov ax, [bp+4]
 11057 000055C3 83F800                   cmp ax, 0
 11058 000055C6 0F8D1400                 jge @@pint596
 11059 000055CA 6A2D                     push 45
 11060 000055CC E8AEF0                   call prc
 11061 000055CF 83C402                   add  sp, 2
 11062 000055D2 FF7604                   push word [bp+4]
 11063 000055D5 E8D9FF                   call mkneg
 11064 000055D8 83C402                   add  sp, 2
 11065 000055DB 894604                   mov [bp+4], ax
 11066                                  
 11067                                  ;-998   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }
 11068                                  
 11069                                  @@pint596:
 11070 000055DE 8B4604                   mov ax, [bp+4]
 11071 000055E1 83F80A                   cmp ax, 10 ;unsigned : 1
 11072 000055E4 0F8C1500                 jl  @@pint597
 11073 000055E8 8B4604                   mov ax, [bp+4]
 11074 000055EB BB0A00                   mov bx, 10
 11075 000055EE 99                       cwd
 11076 000055EF F7FB                     idiv bx
 11077 000055F1 8946FE                   mov [bp-2], ax
 11078 000055F4 FF76FE                   push word [bp-2]
 11079 000055F7 E8C2FF                   call pint
 11080 000055FA 83C402                   add  sp, 2
 11081                                  @@pint597:
 11082 000055FD 8B4604                   mov ax, [bp+4]
 11083 00005600 BB0A00                   mov bx, 10
 11084 00005603 99                       cwd
 11085 00005604 F7FB                     idiv bx
 11086 00005606 89D0                     mov ax, dx
 11087 00005608 894604                   mov [bp+4], ax
 11088 0000560B 8B4604                   mov ax, [bp+4]
 11089 0000560E 83C030                   add ax, 48
 11090 00005611 894604                   mov [bp+4], ax
 11091 00005614 FF7604                   push word [bp+4]
 11092 00005617 E850FF                   call putch
 11093 0000561A 83C402                   add  sp, 2
 11094                                  
 11095                                  ;-999 int printint5(unsigned int j)  {
 11096 0000561D C9                       LEAVE
 11097 0000561E C3                       ret
 11098                                  ; ENDP
 11099                                  ;Number of CALLs:    1 : toupper
 11100                                  
 11101                                  toupper:  ; *** PROC ***
 11102                                  ;Function : toupper, Number of local variables: 1
 11103                                  ;   # type sign width addr used name   list of local variables
 11104                                  ;  200 ptr sign byte   999 NULL s = bp+4;
 11105 0000561F C8000000                 ENTER  0,0
 11106                                  @@toupper598:
 11107 00005623 8B5E04                   mov bx, [bp+4]
 11108 00005626 8A07                     mov al, [bx]
 11109 00005628 B400                     mov ah, 0
 11110 0000562A 08C0                     or  al, al
 11111 0000562C 0F843000                 je @@toupper599
 11112 00005630 8B5E04                   mov bx, [bp+4]
 11113 00005633 8A07                     mov al, [bx]
 11114 00005635 B400                     mov ah, 0
 11115 00005637 83F861                   cmp ax, 97 ;unsigned : 1
 11116 0000563A 0F8C1D00                 jl  @@toupper600
 11117 0000563E 8B5E04                   mov bx, [bp+4]
 11118 00005641 8A07                     mov al, [bx]
 11119 00005643 B400                     mov ah, 0
 11120 00005645 83F87A                   cmp ax, 122
 11121 00005648 0F8F0F00                 jg  @@toupper601
 11122 0000564C 8B5E04                   mov bx, [bp+4]
 11123 0000564F 8A07                     mov al, [bx]
 11124 00005651 B400                     mov ah, 0
 11125 00005653 83E820                   sub ax, 32
 11126 00005656 8B5E04                   mov  bx, [bp+4]
 11127 00005659 8807                     mov  [bx], al
 11128                                  @@toupper601:
 11129                                  @@toupper600:
 11130 0000565B FF4604                   inc  word[bp+4]
 11131 0000565E EBC3                     jmp @@toupper598
 11132                                  @@toupper599:
 11133                                  
 11134                                  ;-1000 int head1  (char *s) {while(letter(*s)) s++;     *s=0; }
 11135 00005660 C9                       LEAVE
 11136 00005661 C3                       ret
 11137                                  ; ENDP
 11138                                  ;Number of CALLs:    8 : strlen
 11139                                  
 11140                                  strlen:  ; *** PROC ***
 11141                                  ;Function : strlen, Number of local variables: 2
 11142                                  ;   # type sign width addr used name   list of local variables
 11143                                  ;  200 ptr sign byte  1000 NULL s = bp+4
 11144                                  ;  201 var sign word  1000 NULL c = bp-2;
 11145 00005662 C8020000                 ENTER  2,0
 11146 00005666 B80000                   mov ax, 0
 11147 00005669 8946FE                   mov [bp-2], ax
 11148                                  @@strlen602:
 11149 0000566C 8B5E04                   mov bx, [bp+4]
 11150 0000566F 8A07                     mov al, [bx]
 11151 00005671 B400                     mov ah, 0
 11152 00005673 83F800                   cmp ax, 0
 11153 00005676 0F840800                 je  @@strlen603
 11154 0000567A FF4604                   inc  word[bp+4]
 11155 0000567D FF46FE                   inc  word[bp-2]
 11156 00005680 EBEA                     jmp @@strlen602
 11157                                  @@strlen603:
 11158 00005682 8B46FE                   mov ax, [bp-2]
 11159 00005685 E90000                   jmp @@retn
 11160                                  
 11161                                  ;-1001 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
 11162                                  
 11163 00005688 C9                      @@retn: LEAVE
 11164 00005689 C3                       ret
 11165                                  ; ENDP
 11166                                  ;Number of CALLs:   23 : strcpy
 11167                                  
 11168                                  strcpy:  ; *** PROC ***
 11169                                  ;Function : strcpy, Number of local variables: 2
 11170                                  ;   # type sign width addr used name   list of local variables
 11171                                  ;  200 ptr sign byte  1001 NULL s = bp+4
 11172                                  ;  201 ptr sign byte  1001 NULL t = bp+6;
 11173 0000568A C8000000                 ENTER  0,0
 11174                                  @@strcpy604:
 11175 0000568E 8B5E06                   mov bx, [bp+6]
 11176 00005691 8A07                     mov al, [bx]
 11177 00005693 B400                     mov ah, 0
 11178 00005695 8B5E04                   mov  bx, [bp+4]
 11179 00005698 8807                     mov  [bx], al
 11180 0000569A FF4604                   inc  word[bp+4]
 11181 0000569D FF4606                   inc  word[bp+6]
 11182 000056A0 8B5E06                   mov bx, [bp+6]
 11183 000056A3 8A07                     mov al, [bx]
 11184 000056A5 B400                     mov ah, 0
 11185 000056A7 83F800                   cmp ax, 0
 11186 000056AA 0F840200                 je  @@strcpy605
 11187 000056AE EBDE                     jmp @@strcpy604
 11188                                  @@strcpy605:
 11189 000056B0 B80000                   mov ax, 0
 11190 000056B3 8B5E04                   mov  bx, [bp+4]
 11191 000056B6 8807                     mov  [bx], al
 11192                                  
 11193                                  ;-1002 int strncpy(char *s, char *t, int n) { if (_ n==0) return;
 11194 000056B8 C9                       LEAVE
 11195 000056B9 C3                       ret
 11196                                  ; ENDP
 11197                                  ;Number of CALLs:    1 : instr1
 11198                                  
 11199                                  instr1:  ; *** PROC ***
 11200                                  ;Function : instr1, Number of local variables: 2
 11201                                  ;   # type sign width addr used name   list of local variables
 11202                                  ;  200 ptr sign byte  1002 NULL s = bp+4
 11203                                  ;  201 var sign byte  1002 NULL c = bp+6;
 11204 000056BA C8000000                 ENTER  0,0
 11205                                  @@instr1606:
 11206 000056BE 8B5E04                   mov bx, [bp+4]
 11207 000056C1 8A07                     mov al, [bx]
 11208 000056C3 B400                     mov ah, 0
 11209 000056C5 08C0                     or  al, al
 11210 000056C7 0F841900                 je @@instr1607
 11211 000056CB 8B5E04                   mov bx, [bp+4]
 11212 000056CE 8A07                     mov al, [bx]
 11213 000056D0 B400                     mov ah, 0
 11214 000056D2 3A4606                   cmp al, [bp+6]
 11215 000056D5 0F850600                 jne @@instr1608
 11216 000056D9 B80100                   mov ax, 1
 11217 000056DC E90B00                   jmp @@retn
 11218                                  @@instr1608:
 11219 000056DF FF4604                   inc  word[bp+4]
 11220 000056E2 EBDA                     jmp @@instr1606
 11221                                  @@instr1607:
 11222 000056E4 B80000                   mov ax, 0
 11223 000056E7 E90000                   jmp @@retn
 11224                                  
 11225                                  ;-1003 int instr2(char *s, char c) { while(*s) { if (*s==c) return &s; s++;} return 0;}
 11226                                  
 11227 000056EA C9                      @@retn: LEAVE
 11228 000056EB C3                       ret
 11229                                  ; ENDP
 11230                                  ;Number of CALLs:    1 : instr2
 11231                                  
 11232                                  instr2:  ; *** PROC ***
 11233                                  ;Function : instr2, Number of local variables: 2
 11234                                  ;   # type sign width addr used name   list of local variables
 11235                                  ;  200 ptr sign byte  1003 NULL s = bp+4
 11236                                  ;  201 var sign byte  1003 NULL c = bp+6;
 11237 000056EC C8000000                 ENTER  0,0
 11238                                  @@instr2609:
 11239 000056F0 8B5E04                   mov bx, [bp+4]
 11240 000056F3 8A07                     mov al, [bx]
 11241 000056F5 B400                     mov ah, 0
 11242 000056F7 08C0                     or  al, al
 11243 000056F9 0F841900                 je @@instr2610
 11244 000056FD 8B5E04                   mov bx, [bp+4]
 11245 00005700 8A07                     mov al, [bx]
 11246 00005702 B400                     mov ah, 0
 11247 00005704 3A4606                   cmp al, [bp+6]
 11248 00005707 0F850600                 jne @@instr2611
 11249 0000570B 8B4604                   mov ax, [bp+4]
 11250 0000570E E90B00                   jmp @@retn
 11251                                  @@instr2611:
 11252 00005711 FF4604                   inc  word[bp+4]
 11253 00005714 EBDA                     jmp @@instr2609
 11254                                  @@instr2610:
 11255 00005716 B80000                   mov ax, 0
 11256 00005719 E90000                   jmp @@retn
 11257                                  
 11258                                  ;-1004 int digit(char c){ if(c<'0') return 0; if(c>'9') return 0; return 1; }
 11259                                  
 11260 0000571C C9                      @@retn: LEAVE
 11261 0000571D C3                       ret
 11262                                  ; ENDP
 11263                                  ;Number of CALLs:    2 : digit
 11264                                  
 11265                                  digit:  ; *** PROC ***
 11266                                  ;Function : digit, Number of local variables: 1
 11267                                  ;   # type sign width addr used name   list of local variables
 11268                                  ;  200 var sign byte  1004 NULL c = bp+4;
 11269 0000571E C8000000                 ENTER  0,0
 11270 00005722 8A4604                   mov al, [bp+4]
 11271 00005725 3C30                     cmp al, 48
 11272 00005727 0F8D0600                 jge @@digit612
 11273 0000572B B80000                   mov ax, 0
 11274 0000572E E91500                   jmp @@retn
 11275                                  @@digit612:
 11276 00005731 8A4604                   mov al, [bp+4]
 11277 00005734 3C39                     cmp al, 57
 11278 00005736 0F8E0600                 jle @@digit613
 11279 0000573A B80000                   mov ax, 0
 11280 0000573D E90600                   jmp @@retn
 11281                                  @@digit613:
 11282 00005740 B80100                   mov ax, 1
 11283 00005743 E90000                   jmp @@retn
 11284                                  
 11285                                  ;-1005 int letter(char c) { if (digit(c)) return 1; if (c=='_') return 1;
 11286                                  
 11287 00005746 C9                      @@retn: LEAVE
 11288 00005747 C3                       ret
 11289                                  ; ENDP
 11290                                  ;Number of CALLs:    3 : letter
 11291                                  
 11292                                  letter:  ; *** PROC ***
 11293                                  ;Function : letter, Number of local variables: 1
 11294                                  ;   # type sign width addr used name   list of local variables
 11295                                  ;  200 var sign byte  1005 NULL c = bp+4;
 11296 00005748 C8000000                 ENTER  0,0
 11297 0000574C 8A4604                   mov al, byte [bp+4]
 11298 0000574F B400                     mov ah, 0
 11299 00005751 50                       push ax
 11300 00005752 E8C9FF                   call digit
 11301 00005755 83C402                   add  sp, 2
 11302 00005758 08C0                     or  al, al
 11303 0000575A 0F840600                 je @@letter614
 11304 0000575E B80100                   mov ax, 1
 11305 00005761 E94B00                   jmp @@retn
 11306                                  @@letter614:
 11307 00005764 8A4604                   mov al, [bp+4]
 11308 00005767 3C5F                     cmp al, 95
 11309 00005769 0F850600                 jne @@letter615
 11310 0000576D B80100                   mov ax, 1
 11311 00005770 E93C00                   jmp @@retn
 11312                                  
 11313                                  ;-1006   if (c> 'z') return 0; if (c< '@') return 0;
 11314                                  
 11315                                  @@letter615:
 11316 00005773 8A4604                   mov al, [bp+4]
 11317 00005776 3C7A                     cmp al, 122
 11318 00005778 0F8E0600                 jle @@letter616
 11319 0000577C B80000                   mov ax, 0
 11320 0000577F E92D00                   jmp @@retn
 11321                                  @@letter616:
 11322 00005782 8A4604                   mov al, [bp+4]
 11323 00005785 3C40                     cmp al, 64
 11324 00005787 0F8D0600                 jge @@letter617
 11325 0000578B B80000                   mov ax, 0
 11326 0000578E E91E00                   jmp @@retn
 11327                                  
 11328                                  ;-1007   if (c> 'Z') { if (c< 'a') return 0; }  return 1; }
 11329                                  
 11330                                  @@letter617:
 11331 00005791 8A4604                   mov al, [bp+4]
 11332 00005794 3C5A                     cmp al, 90
 11333 00005796 0F8E0F00                 jle @@letter618
 11334 0000579A 8A4604                   mov al, [bp+4]
 11335 0000579D 3C61                     cmp al, 97
 11336 0000579F 0F8D0600                 jge @@letter619
 11337 000057A3 B80000                   mov ax, 0
 11338 000057A6 E90600                   jmp @@retn
 11339                                  @@letter619:
 11340                                  @@letter618:
 11341 000057A9 B80100                   mov ax, 1
 11342 000057AC E90000                   jmp @@retn
 11343                                  
 11344                                  ;-1008 int eqstr(char *p, char *q) { while(*p) {
 11345                                  
 11346 000057AF C9                      @@retn: LEAVE
 11347 000057B0 C3                       ret
 11348                                  ; ENDP
 11349                                  ;Number of CALLs:   80 : eqstr
 11350                                  
 11351                                  eqstr:  ; *** PROC ***
 11352                                  ;Function : eqstr, Number of local variables: 2
 11353                                  ;   # type sign width addr used name   list of local variables
 11354                                  ;  200 ptr sign byte  1008 NULL p = bp+4
 11355                                  ;  201 ptr sign byte  1008 NULL q = bp+6;
 11356 000057B1 C8000000                 ENTER  0,0
 11357                                  @@eqstr620:
 11358 000057B5 8B5E04                   mov bx, [bp+4]
 11359 000057B8 8A07                     mov al, [bx]
 11360 000057BA B400                     mov ah, 0
 11361 000057BC 08C0                     or  al, al
 11362 000057BE 0F842000                 je @@eqstr621
 11363                                  
 11364                                  ;-1009     if (*p != *q) return 0; p++; q++; }
 11365                                  
 11366 000057C2 8B5E04                   mov bx, [bp+4]
 11367 000057C5 8A07                     mov al, [bx]
 11368 000057C7 B400                     mov ah, 0
 11369 000057C9 8B5E06                   mov bx, [bp+6]
 11370 000057CC 3A07                     cmp al, [bx]
 11371 000057CE B400                     mov ah, 0
 11372 000057D0 0F840600                 je  @@eqstr622
 11373 000057D4 B80000                   mov ax, 0
 11374 000057D7 E92100                   jmp @@retn
 11375                                  @@eqstr622:
 11376 000057DA FF4604                   inc  word[bp+4]
 11377 000057DD FF4606                   inc  word[bp+6]
 11378                                  
 11379                                  ;-1010     if(*q) return 0; return 1; }
 11380                                  
 11381 000057E0 EBD3                     jmp @@eqstr620
 11382                                  @@eqstr621:
 11383 000057E2 8B5E06                   mov bx, [bp+6]
 11384 000057E5 8A07                     mov al, [bx]
 11385 000057E7 B400                     mov ah, 0
 11386 000057E9 08C0                     or  al, al
 11387 000057EB 0F840600                 je @@eqstr623
 11388 000057EF B80000                   mov ax, 0
 11389 000057F2 E90600                   jmp @@retn
 11390                                  @@eqstr623:
 11391 000057F5 B80100                   mov ax, 1
 11392 000057F8 E90000                   jmp @@retn
 11393                                  
 11394                                  ;-1011 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
 11395                                  
 11396 000057FB C9                      @@retn: LEAVE
 11397 000057FC C3                       ret
 11398                                  ; ENDP
 11399                                  ;Number of CALLs:    1 : strcat1
 11400                                  
 11401                                  strcat1:  ; *** PROC ***
 11402                                  ;Function : strcat1, Number of local variables: 2
 11403                                  ;   # type sign width addr used name   list of local variables
 11404                                  ;  200 ptr sign byte  1011 NULL s = bp+4
 11405                                  ;  201 ptr sign byte  1011 NULL t = bp+6;
 11406 000057FD C8000000                 ENTER  0,0
 11407                                  @@strcat1624:
 11408 00005801 8B5E04                   mov bx, [bp+4]
 11409 00005804 8A07                     mov al, [bx]
 11410 00005806 B400                     mov ah, 0
 11411 00005808 83F800                   cmp ax, 0
 11412 0000580B 0F840500                 je  @@strcat1625
 11413 0000580F FF4604                   inc  word[bp+4]
 11414 00005812 EBED                     jmp @@strcat1624
 11415                                  @@strcat1625:
 11416 00005814 FF7606                   push word [bp+6]
 11417 00005817 FF7604                   push word [bp+4]
 11418 0000581A E86DFE                   call strcpy
 11419 0000581D 83C404                   add  sp, 4
 11420                                  
 11421                                  ;-1012 int basename(char *s) { char *p; p=0;
 11422 00005820 C9                       LEAVE
 11423 00005821 C3                       ret
 11424                                  ; ENDP
 11425                                  ;Number of CALLs:    2 : DosInt
 11426                                  
 11427                                  DosInt:  ; *** PROC ***
 11428 00005822 CD21                     int  33
 11429 00005824 7304                     jae short @@DosInt626
 11430 00005826 FF06[7600]               inc  word[DOS_ERR]
 11431                                  @@DosInt626:
 11432                                  
 11433                                  ;-1013 int openR (char *s) { dx=s; ax=0x3D02;  DosInt(); }
 11434                                  
 11435 0000582A C3                       ret
 11436                                  ; ENDP
 11437                                  ;Number of CALLs:    3 : openR
 11438                                  
 11439                                  openR:  ; *** PROC ***
 11440                                  ;Function : openR, Number of local variables: 1
 11441                                  ;   # type sign width addr used name   list of local variables
 11442                                  ;  200 ptr sign byte  1013 NULL s = bp+4;
 11443 0000582B C8000000                 ENTER  0,0
 11444 0000582F 8B5604                   mov  dx, [bp+4]
 11445 00005832 B8023D                   mov  ax, 15618
 11446 00005835 E8EAFF                   call DosInt
 11447                                  
 11448                                  ;-1014 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 11449 00005838 C9                       LEAVE
 11450 00005839 C3                       ret
 11451                                  ; ENDP
 11452                                  ;Number of CALLs:    1 : creatR
 11453                                  
 11454                                  creatR:  ; *** PROC ***
 11455                                  ;Function : creatR, Number of local variables: 1
 11456                                  ;   # type sign width addr used name   list of local variables
 11457                                  ;  200 ptr sign byte  1014 NULL s = bp+4;
 11458 0000583A C8000000                 ENTER  0,0
 11459 0000583E 8B5604                   mov  dx, [bp+4]
 11460 00005841 B90000                   mov  cx, 0
 11461 00005844 B8003C                   mov  ax, 15360
 11462 00005847 E8D8FF                   call DosInt
 11463                                  
 11464                                  ;-1015 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
 11465 0000584A C9                       LEAVE
 11466 0000584B C3                       ret
 11467                                  ; ENDP
 11468                                  ;Number of CALLs:    1 : readR
 11469                                  
 11470                                  readR:  ; *** PROC ***
 11471                                  ;Function : readR, Number of local variables: 2
 11472                                  ;   # type sign width addr used name   list of local variables
 11473                                  ;  200 ptr sign byte  1015 NULL s = bp+4
 11474                                  ;  201 var sign word  1015 NULL fd = bp+6;
 11475 0000584C C8000000                 ENTER  0,0
 11476 00005850 8B5604                   mov  dx, [bp+4]
 11477 00005853 B90100                   mov  cx, 1
 11478 00005856 8B5E06                   mov  bx, [bp+6]
 11479 00005859 B8003F                   mov  ax, 16128
 11480 0000585C E8C3FF                   call DosInt
 11481                                  
 11482                                  ;-1016 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
 11483 0000585F C9                       LEAVE
 11484 00005860 C3                       ret
 11485                                  ; ENDP
 11486                                  ;Number of CALLs:    1 : readRL
 11487                                  
 11488                                  readRL:  ; *** PROC ***
 11489                                  ;Function : readRL, Number of local variables: 3
 11490                                  ;   # type sign width addr used name   list of local variables
 11491                                  ;  200 ptr sign byte  1016 NULL s = bp+4
 11492                                  ;  201 var sign word  1016 NULL fd = bp+6
 11493                                  ;  202 var sign word  1016 NULL len = bp+8;
 11494 00005861 C8000000                 ENTER  0,0
 11495 00005865 8B5604                   mov  dx, [bp+4]
 11496 00005868 8B4E08                   mov  cx, [bp+8]
 11497 0000586B 8B5E06                   mov  bx, [bp+6]
 11498 0000586E B8003F                   mov  ax, 16128
 11499 00005871 E8AEFF                   call DosInt
 11500                                  
 11501                                  ;-1017 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 11502 00005874 C9                       LEAVE
 11503 00005875 C3                       ret
 11504                                  ; ENDP
 11505                                  ;Number of CALLs:    1 : fputcR
 11506                                  
 11507                                  fputcR:  ; *** PROC ***
 11508                                  ;Function : fputcR, Number of local variables: 2
 11509                                  ;   # type sign width addr used name   list of local variables
 11510                                  ;  200 ptr sign byte  1017 NULL n = bp+4
 11511                                  ;  201 var sign word  1017 NULL fd = bp+6;
 11512 00005876 C8000000                 ENTER  0,0
 11513 0000587A 8D5604                  lea dx, [bp+4]
 11514                                  
 11515                                  ;-1018   cx=1; bx=fd; ax=0x4000; DosInt(); }
 11516                                  
 11517 0000587D B90100                   mov  cx, 1
 11518 00005880 8B5E06                   mov  bx, [bp+6]
 11519 00005883 B80040                   mov  ax, 16384
 11520 00005886 E899FF                   call DosInt
 11521                                  
 11522                                  ;-1019 int writeRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x4000; DosInt();}
 11523 00005889 C9                       LEAVE
 11524 0000588A C3                       ret
 11525                                  ; ENDP
 11526                                  ;Number of CALLs:    2 : fcloseR
 11527                                  
 11528                                  fcloseR:  ; *** PROC ***
 11529                                  ;Function : fcloseR, Number of local variables: 1
 11530                                  ;   # type sign width addr used name   list of local variables
 11531                                  ;  200 var sign word  1019 NULL fd = bp+4;
 11532 0000588B C8000000                 ENTER  0,0
 11533 0000588F 8B5E04                   mov  bx, [bp+4]
 11534 00005892 B8003E                   mov  ax, 15872
 11535 00005895 CD21                     int  33
 11536                                  
 11537                                  ;-1020 int exitR(char c) {ah=0x4C; al=c; inth 0x21; }
 11538 00005897 C9                       LEAVE
 11539 00005898 C3                       ret
 11540                                  ; ENDP
 11541                                  ;Number of CALLs:    4 : exitR
 11542                                  
 11543                                  exitR:  ; *** PROC ***
 11544                                  ;Function : exitR, Number of local variables: 1
 11545                                  ;   # type sign width addr used name   list of local variables
 11546                                  ;  200 var sign byte  1020 NULL c = bp+4;
 11547 00005899 C8000000                 ENTER  0,0
 11548 0000589D B44C                     mov  ah, 76
 11549 0000589F 8A4604                   mov  al, [bp+4]
 11550 000058A2 CD21                     int  33
 11551                                  
 11552                                  ;-1021 int setdta(char *s) {dx=s; ah=0x1A; inth 0x21; }
 11553 000058A4 C9                       LEAVE
 11554 000058A5 C3                       ret
 11555                                  ; ENDP
 11556                                  ;End of archive file. 
 11557                                   
 11558                                  ; missing functions:  All FUNCTIONs in place
 11559 000058A6 E80000                  LastFunctionByt:db 0E8h, 0, 0
 11560 000058A9 58                      pop ax
 11561 000058AA C3                      ret
 11562                                   
 11563                                  ;   # type sign width  adr used name   list of global variables
 11564                                  
 11565                                  ;    1 arr sign byte     2    2 Version1[16]
 11566                                  ;    2 def unsg byte     4    - LSTART=200
 11567                                  ;    3 def unsg byte     5    - VARMAX=300
 11568                                  ;    4 def unsg byte     6    - GNAMEMAX=4800
 11569                                  ;    5 def unsg byte     7    - FUNCMAX=300
 11570                                  ;    6 def unsg byte     8    - FNAMEMAX=4800
 11571                                  ;    7 def unsg byte     9    - CALLMAX=2000
 11572                                  ;    8 def unsg byte    10    - IDLENMAX=15
 11573                                  ;    9 def unsg byte    12    - T_NAME=256
 11574                                  ;   10 def unsg byte    13    - T_CONST=257
 11575                                  ;   11 def unsg byte    14    - T_STRING=258
 11576                                  ;   12 def unsg byte    15    - T_INCLUDE=510
 11577                                  ;   13 def unsg byte    16    - T_DEFINE=511
 11578                                  ;   14 def unsg byte    17    - T_RETURN=512
 11579                                  ;   15 def unsg byte    18    - T_IF=513
 11580                                  ;   16 def unsg byte    19    - T_ELSE=514
 11581                                  ;   17 def unsg byte    20    - T_WHILE=515
 11582                                  ;   18 def unsg byte    21    - T_DO=516
 11583                                  ;   19 def unsg byte    22    - T_INT=517
 11584                                  ;   20 def unsg byte    23    - T_ASM=518
 11585                                  ;   21 def unsg byte    24    - T_ASMBLOCK=519
 11586                                  ;   22 def unsg byte    25    - T_EMIT=520
 11587                                  ;   23 def unsg byte    26    - T_GOTO=521
 11588                                  ;   24 def unsg byte    27    - T_VOID=529
 11589                                  ;   25 def unsg byte    28    - T_CHAR=530
 11590                                  ;   26 def unsg byte    29    - T_SIGNED=531
 11591                                  ;   27 def unsg byte    30    - T_UNSIGNED=532
 11592                                  ;   28 def unsg byte    31    - T_LONG=533
 11593                                  ;   29 def unsg byte    32    - T_SHORT=534
 11594                                  ;   30 def unsg byte    34    - T_UINT32=545
 11595                                  ;   31 def unsg byte    36    - T_INTH=600
 11596                                  ;   32 def unsg byte    37    - T_IFCARRY=601
 11597                                  ;   33 def unsg byte    38    - T_IFZERO=602
 11598                                  ;   34 def unsg byte    39    - T_EQ=806
 11599                                  ;   35 def unsg byte    40    - T_NE=807
 11600                                  ;   36 def unsg byte    41    - T_GE=811
 11601                                  ;   37 def unsg byte    42    - T_LE=824
 11602                                  ;   38 def unsg byte    43    - T_PLUSPLUS=1219
 11603                                  ;   39 def unsg byte    44    - T_MINUSMINUS=1225
 11604                                  ;   40 def unsg byte    45    - T_PLUSASS=1230
 11605                                  ;   41 def unsg byte    46    - T_MINUSASS=1231
 11606                                  ;   42 def unsg byte    47    - T_MULASS=1232
 11607                                  ;   43 def unsg byte    48    - T_DIVASS=1233
 11608                                  ;   44 def unsg byte    49    - T_ANDASS=1234
 11609                                  ;   45 def unsg byte    50    - T_ORASS=1235
 11610                                  ;   46 def unsg byte    51    - T_LESSLESS=1240
 11611                                  ;   47 def unsg byte    52    - T_GREATGREAT=1241
 11612                                  ;   48 def unsg byte    53    - COMAX=3000
 11613                                  ;   49 def unsg byte    54    - CMDLENMAX=67
 11614                                  ;   50 var unsg word    55    3 ORGDATAORIG
 11615                                  ;   51 var unsg word    55   10 orgData
 11616                                  ;   52 arr sign byte    56    4 co[3000]
 11617                                  ;   53 var sign word    56    4 maxco
 11618                                  ;   54 var sign word    56    3 maxco1
 11619                                  ;   55 arr sign byte    57    2 coname[67]
 11620                                  ;   56 ptr sign byte    57    5 cloc
 11621                                  ;   57 var sign word    58    7 fdin
 11622                                  ;   58 var sign word    58    7 fdout
 11623                                  ;   59 arr sign byte    58  111 symbol[128]
 11624                                  ;   60 arr sign byte    59   12 fname[67]
 11625                                  ;   61 arr sign byte    59   10 namein[67]
 11626                                  ;   62 arr sign byte    60    7 namelst[67]
 11627                                  ;   63 arr sign byte    60    5 archivename[67]
 11628                                  ;   64 var sign word    61   49 token
 11629                                  ;   65 var sign byte    61    2 globC
 11630                                  ;   66 var sign word    61    3 spalte
 11631                                  ;   67 var sign byte    62   28 thechar
 11632                                  ;   68 var sign word    62    9 iscmp
 11633                                  ;   69 var sign word    62    4 nconst
 11634                                  ;   70 var sign word    63    3 nreturn
 11635                                  ;   71 var sign word    63   16 nlabel
 11636                                  ;   72 var sign word    63    3 callrecursive
 11637                                  ;   73 var sign word    64   24 GTop
 11638                                  ;   74 var sign word    64   20 LTop
 11639                                  ;   75 var unsg word    65   45 lexval
 11640                                  ;   76 var sign word    66    6 typei
 11641                                  ;   77 var sign byte    66    8 istype
 11642                                  ;   78 arr sign byte    66   11 GType[300]
 11643                                  ;   79 var sign word    67    6 signi
 11644                                  ;   80 var sign byte    67    6 issign
 11645                                  ;   81 arr sign byte    67    5 GSign[300]
 11646                                  ;   82 var sign word    68    9 widthi
 11647                                  ;   83 var sign byte    68   21 iswidth
 11648                                  ;   84 arr sign byte    68    5 GWidth[300]
 11649                                  ;   85 arr sign word    69    4 GAdr[300]
 11650                                  ;   86 arr sign word    69    6 GUsed[300]
 11651                                  ;   87 var sign word    70   26 wi
 11652                                  ;   88 arr sign word    70   11 GData[300]
 11653                                  ;   89 arr sign byte    70    2 GNameField[4800]
 11654                                  ;   90 var sign word    71   17 FTop
 11655                                  ;   91 var sign word    71    9 CTop
 11656                                  ;   92 arr sign byte    72    2 FType[300]
 11657                                  ;   93 arr sign byte    72    5 CType[2000]
 11658                                  ;   94 arr sign word    73    4 FAdr[300]
 11659                                  ;   95 arr sign word    73    5 CAdr[2000]
 11660                                  ;   96 arr sign word    74    4 FCalls[300]
 11661                                  ;   97 arr sign byte    75    5 FNameField[4800]
 11662                                  ;   98 arr sign byte    76    9 NameA[32]
 11663                                  ;   99 arr sign byte    77    5 fgetsdest[128]
 11664                                  ;  100 ptr unsg byte    77    8 CNameTop
 11665                                  ;  101 ptr unsg byte    78   10 fgetsp
 11666                                  ;  102 var unsg word    78    4 segE
 11667                                  ;  103 var unsg word    79   12 lineno
 11668                                  ;  104 var unsg word    79    2 linenoinclude
 11669                                  ;  105 ptr unsg byte    80   19 pt
 11670                                  ;  106 ptr unsg byte    80    8 p1
 11671                                  ;  107 var sign word    81   10 DOS_ERR
 11672                                  ;  108 var sign word    81    5 DOS_NoBytes
 11673                                  ;  109 var sign byte    81    3 DOS_ByteRead
 11674                                  ;  110 var sign word    83 NULL tt1
 11675                                  ;  111 var sign word    83 NULL tt2
 11676                                  ;  112 var sign dwrd    83    1 ex
 11677                                  ;  113 arr sign byte   100    2 doglobName[15]
 11678                                  ;  114 var sign word   248    5 mod1
 11679                                  ;  115 var sign word   248   12 ireg1
 11680                                  ;  116 var sign word   248    6 idx1
 11681                                  ;  117 var sign word   248    1 ids1
 11682                                  ;  118 var sign word   248    4 idw1
 11683                                  ;  119 var sign word   248    2 idt1
 11684                                  ;  120 var sign word   248 NULL val1
 11685                                  ;  121 var sign word   249    2 mod2
 11686                                  ;  122 var sign word   249    6 ireg2
 11687                                  ;  123 var sign word   249    6 idx2
 11688                                  ;  124 var sign word   249    1 ids2
 11689                                  ;  125 var sign word   249    4 idw2
 11690                                  ;  126 var sign word   249    2 idt2
 11691                                  ;  127 var sign word   249    2 val2
 11692                                  ;  128 arr sign byte   314    9 ops[5]
 11693                                  ;  129 arr sign byte   356    3 printregstr[74]
 11694                                  ;  130 var sign word   364    1 evalue
 11695                                  ;  131 var sign word   364    1 exprtype
 11696                                  ;  132 arr sign word   516    2 docalltype[10]
 11697                                  ;  133 arr sign word   516    2 docallvalue[10]
 11698                                  ;  134 arr sign byte   517    2 procname[17]
 11699                                  ;  135 ptr sign byte   572    1 arglen
 11700                                  ;  136 ptr sign byte   572    3 argv
 11701                                  ;  137 var sign byte   616    4 wasfunction
 11702                                  ;  138 arr sign byte   745    2 symboltemp[80]
 11703                                  ;  139 var unsg word   931    1 MAXUI
 11704                                  
 11705                                  
 11706                                  ;   # Calls Line Width  Name   list of functions
 11707                                  
 11708                                  ;    0    1   84   ttt
 11709                                  ;    1    4   91   a
 11710                                  ;    2   21   92   v
 11711                                  ;    3    4   97   checknamelen
 11712                                  ;    4    1  101   doglob
 11713                                  ;    5   12  150   gettypes
 11714                                  ;    6    9  159   adrofname
 11715                                  ;    7    7  160   adrF
 11716                                  ;    8    4  162   printName
 11717                                  ;    9   12  166   searchname
 11718                                  ;   10    3  170   checkName
 11719                                  ;   11   10  175   typeName
 11720                                  ;   12    3  185   name1
 11721                                  ;   13    1  187   storecall
 11722                                  ;   14    2  193   storefunc
 11723                                  ;   15    2  197   addlocal
 11724                                  ;   16    1  203   checkFunction
 11725                                  ;   17    2  206   dofunc
 11726                                  ;   18    1  241   isvariable
 11727                                  ;   19    3  251   pexpr
 11728                                  ;   20    1  258   constantexpr
 11729                                  ;   21    3  268   exprstart
 11730                                  ;   22    1  270   expr2
 11731                                  ;   23    3  315   doreg1
 11732                                  ;   24    6  334   checkreg
 11733                                  ;   25    6  359   printreg
 11734                                  ;   26    2  365   expr
 11735                                  ;   27    4  414   compoundass
 11736                                  ;   28    2  421   dovar1
 11737                                  ;   29    8  442   rterm
 11738                                  ;   30    1  455   isreg
 11739                                  ;   31   15  473   doreg
 11740                                  ;   32    1  479   doassign
 11741                                  ;   33    1  497   domul
 11742                                  ;   34    2  501   doidiv
 11743                                  ;   35    1  514   domod
 11744                                  ;   36    1  518   docall1
 11745                                  ;   37 NULL  560   main
 11746                                  ;   38    3  571   getfirstchar
 11747                                  ;   39    1  573   getarg
 11748                                  ;   40    2  592   parse
 11749                                  ;   41    2  601   checkcalls
 11750                                  ;   42    1  617   doar
 11751                                  ;   43    1  644   getfunctionhead
 11752                                  ;   44    1  651   doinclude
 11753                                  ;   45    1  662   dodefine
 11754                                  ;   46    8  678   stmt
 11755                                  ;   47    1  702   doemit
 11756                                  ;   48    3  706   cmpneg
 11757                                  ;   49    9  719   prlabel
 11758                                  ;   50    3  720   prjump
 11759                                  ;   51    1  721   doif
 11760                                  ;   52    1  726   doifcarry
 11761                                  ;   53    1  729   doifzero
 11762                                  ;   54    1  732   dodo
 11763                                  ;   55    1  736   dowhile
 11764                                  ;   56    4  739   isrelational
 11765                                  ;   57   19  746   getlex
 11766                                  ;   58    1  803   convertdefine
 11767                                  ;   59    1  810   getdigit
 11768                                  ;   60    1  819   getstring
 11769                                  ;   61   31  822   next
 11770                                  ;   62   84  823   istoken
 11771                                  ;   63   38  824   expect
 11772                                  ;   64    6  827   eprc
 11773                                  ;   65    5  828   eprs
 11774                                  ;   66   41  829   prc
 11775                                  ;   67    3  834   prscomment
 11776                                  ;   68    8  836   prnl
 11777                                  ;   69  261  838   prs
 11778                                  ;   70    2  843   eprnum
 11779                                  ;   71   18  845   pint1
 11780                                  ;   72   28  847   prunsign1
 11781                                  ;   73   26  850   printint51
 11782                                  ;   74    2  854   fgets1
 11783                                  ;   75    1  858   printinputline
 11784                                  ;   76    2  866   end1
 11785                                  ;   77   50  867   error1
 11786                                  ;   78    2  876   listproc
 11787                                  ;   79    2  884   listvar
 11788                                  ;   80    1  900   listcall
 11789                                  ;   81    1  903   calllisting
 11790                                  ;   82    1  909   countcalls
 11791                                  ;   83    1  917   listfunc
 11792                                  ;   84    1  921   funclisting
 11793                                  ;   85    1  932   epilog
 11794                                  ;   86    1  964   setblock
 11795                                  ;   87    1  966   allocmem
 11796                                  ;   88 NULL  970   copyF
 11797                                  ;   89    1  976   to_far
 11798                                  ;   90    4  984   from_far
 11799                                  ;   91    4  993   writetty
 11800                                  ;   92    3  994   putch
 11801                                  ;   93   11  995   cputs
 11802                                  ;   94    4  996   mkneg
 11803                                  ;   95    2  997   pint
 11804                                  ;   96    1  999   toupper
 11805                                  ;   97    8 1000   strlen
 11806                                  ;   98   24 1001   strcpy
 11807                                  ;   99    1 1002   instr1
 11808                                  ;  100    1 1003   instr2
 11809                                  ;  101    3 1004   digit
 11810                                  ;  102    3 1005   letter
 11811                                  ;  103   80 1008   eqstr
 11812                                  ;  104    1 1011   strcat1
 11813                                  ;  105    7 1012   DosInt
 11814                                  ;  106    3 1013   openR
 11815                                  ;  107    1 1014   creatR
 11816                                  ;  108    1 1015   readR
 11817                                  ;  109    1 1016   readRL
 11818                                  ;  110    1 1017   fputcR
 11819                                  ;  111    2 1019   fcloseR
 11820                                  ;  112    4 1020   exitR
 11821                                  ;  113 NULL 1021   LastFunctionByt
 11822                                  
 11823                                  ;    #  addr name   list of CALLs
 11824                                  
 11825                                  ;    0     0 ttt
 11826                                  ;    1     4 printName
 11827                                  ;    2    14 prc
 11828                                  ;    3    18 printName
 11829                                  ;    4    28 prc
 11830                                  ;    5    32 strlen
 11831                                  ;    6    39 error1
 11832                                  ;    7    46 error1
 11833                                  ;    8    53 error1
 11834                                  ;    9    60 checknamelen
 11835                                  ;   10    73 checkName
 11836                                  ;   11    83 error1
 11837                                  ;   12    90 istoken
 11838                                  ;   13    98 istoken
 11839                                  ;   14   106 prs
 11840                                  ;   15   110 prunsign1
 11841                                  ;   16   120 prs
 11842                                  ;   17   124 prs
 11843                                  ;   18   128 prs
 11844                                  ;   19   132 prs
 11845                                  ;   20   136 prs
 11846                                  ;   21   140 prunsign1
 11847                                  ;   22   150 prs
 11848                                  ;   23   154 expect
 11849                                  ;   24   161 expect
 11850                                  ;   25   168 error1
 11851                                  ;   26   175 prs
 11852                                  ;   27   179 prs
 11853                                  ;   28   183 prs
 11854                                  ;   29   187 strcpy
 11855                                  ;   30   194 expect
 11856                                  ;   31   201 istoken
 11857                                  ;   32   209 prc
 11858                                  ;   33   213 prscomment
 11859                                  ;   34   224 prc
 11860                                  ;   35   228 prs
 11861                                  ;   36   232 strlen
 11862                                  ;   37   239 istoken
 11863                                  ;   38   247 prc
 11864                                  ;   39   251 expect
 11865                                  ;   40   258 prunsign1
 11866                                  ;   41   268 istoken
 11867                                  ;   42   276 expect
 11868                                  ;   43   283 error1
 11869                                  ;   44   290 prs
 11870                                  ;   45   294 prs
 11871                                  ;   46   298 prs
 11872                                  ;   47   302 prs
 11873                                  ;   48   306 prs
 11874                                  ;   49   310 prs
 11875                                  ;   50   314 istoken
 11876                                  ;   51   322 prc
 11877                                  ;   52   326 istoken
 11878                                  ;   53   334 expect
 11879                                  ;   54   341 prunsign1
 11880                                  ;   55   351 prunsign1
 11881                                  ;   56   361 adrofname
 11882                                  ;   57   371 strcpy
 11883                                  ;   58   378 strcpy
 11884                                  ;   59   385 expect
 11885                                  ;   60   392 adrF
 11886                                  ;   61   397 adrofname
 11887                                  ;   62   407 prs
 11888                                  ;   63   411 prs
 11889                                  ;   64   415 prc
 11890                                  ;   65   419 pint1
 11891                                  ;   66   425 prc
 11892                                  ;   67   429 checkName
 11893                                  ;   68   439 error1
 11894                                  ;   69   446 adrofname
 11895                                  ;   70   456 eqstr
 11896                                  ;   71   462 adrofname
 11897                                  ;   72   472 eqstr
 11898                                  ;   73   478 istoken
 11899                                  ;   74   486 istoken
 11900                                  ;   75   494 istoken
 11901                                  ;   76   502 istoken
 11902                                  ;   77   510 istoken
 11903                                  ;   78   518 istoken
 11904                                  ;   79   526 istoken
 11905                                  ;   80   534 istoken
 11906                                  ;   81   542 istoken
 11907                                  ;   82   550 istoken
 11908                                  ;   83   558 name1
 11909                                  ;   84   564 error1
 11910                                  ;   85   571 getlex
 11911                                  ;   86   578 error1
 11912                                  ;   87   585 error1
 11913                                  ;   88   592 strlen
 11914                                  ;   89   599 to_far
 11915                                  ;   90   606 error1
 11916                                  ;   91   613 adrF
 11917                                  ;   92   618 strcpy
 11918                                  ;   93   625 error1
 11919                                  ;   94   632 checkName
 11920                                  ;   95   642 error1
 11921                                  ;   96   649 adrF
 11922                                  ;   97   654 strcpy
 11923                                  ;   98   661 adrF
 11924                                  ;   99   666 eqstr
 11925                                  ;  100   672 checknamelen
 11926                                  ;  101   685 strcpy
 11927                                  ;  102   692 checkFunction
 11928                                  ;  103   706 error1
 11929                                  ;  104   713 storefunc
 11930                                  ;  105   723 prs
 11931                                  ;  106   727 prs
 11932                                  ;  107   731 prs
 11933                                  ;  108   735 expect
 11934                                  ;  109   742 istoken
 11935                                  ;  110   750 typeName
 11936                                  ;  111   759 addlocal
 11937                                  ;  112   768 istoken
 11938                                  ;  113   776 expect
 11939                                  ;  114   783 expect
 11940                                  ;  115   790 isvariable
 11941                                  ;  116   801 typeName
 11942                                  ;  117   810 checknamelen
 11943                                  ;  118   823 addlocal
 11944                                  ;  119   832 istoken
 11945                                  ;  120   840 expect
 11946                                  ;  121   847 expect
 11947                                  ;  122   854 istoken
 11948                                  ;  123   862 expect
 11949                                  ;  124   869 listproc
 11950                                  ;  125   878 prs
 11951                                  ;  126   882 mkneg
 11952                                  ;  127   888 pint1
 11953                                  ;  128   894 prs
 11954                                  ;  129   898 istoken
 11955                                  ;  130   906 stmt
 11956                                  ;  131   911 prs
 11957                                  ;  132   915 prs
 11958                                  ;  133   919 prs
 11959                                  ;  134   923 prs
 11960                                  ;  135   927 prs
 11961                                  ;  136   931 strlen
 11962                                  ;  137   938 strcpy
 11963                                  ;  138   945 expect
 11964                                  ;  139   952 eqstr
 11965                                  ;  140   958 constantexpr
 11966                                  ;  141   971 checkreg
 11967                                  ;  142   980 doreg1
 11968                                  ;  143   987 exprstart
 11969                                  ;  144   997 prs
 11970                                  ;  145  1001 prs
 11971                                  ;  146  1005 expect
 11972                                  ;  147  1012 getlex
 11973                                  ;  148  1019 typeName
 11974                                  ;  149  1028 searchname
 11975                                  ;  150  1039 gettypes
 11976                                  ;  151  1048 isrelational
 11977                                  ;  152  1061 error1
 11978                                  ;  153  1068 expect
 11979                                  ;  154  1075 prs
 11980                                  ;  155  1079 prs
 11981                                  ;  156  1083 gettypes
 11982                                  ;  157  1092 prs
 11983                                  ;  158  1096 prs
 11984                                  ;  159  1100 v
 11985                                  ;  160  1102 prs
 11986                                  ;  161  1106 prunsign1
 11987                                  ;  162  1116 cmpneg
 11988                                  ;  163  1123 prs
 11989                                  ;  164  1127 expect
 11990                                  ;  165  1134 eqstr
 11991                                  ;  166  1140 expr2
 11992                                  ;  167  1146 expr
 11993                                  ;  168  1151 getlex
 11994                                  ;  169  1158 typeName
 11995                                  ;  170  1167 error1
 11996                                  ;  171  1174 checkreg
 11997                                  ;  172  1183 doreg1
 11998                                  ;  173  1190 searchname
 11999                                  ;  174  1201 gettypes
 12000                                  ;  175  1210 error1
 12001                                  ;  176  1217 isrelational
 12002                                  ;  177  1230 error1
 12003                                  ;  178  1237 istoken
 12004                                  ;  179  1245 error1
 12005                                  ;  180  1252 istoken
 12006                                  ;  181  1260 prs
 12007                                  ;  182  1264 prs
 12008                                  ;  183  1268 prs
 12009                                  ;  184  1272 prs
 12010                                  ;  185  1276 prs
 12011                                  ;  186  1280 v
 12012                                  ;  187  1282 prs
 12013                                  ;  188  1286 prunsign1
 12014                                  ;  189  1296 adrofname
 12015                                  ;  190  1306 prs
 12016                                  ;  191  1310 prs
 12017                                  ;  192  1314 typeName
 12018                                  ;  193  1323 checkreg
 12019                                  ;  194  1332 prs
 12020                                  ;  195  1336 printreg
 12021                                  ;  196  1345 v
 12022                                  ;  197  1347 prs
 12023                                  ;  198  1351 printreg
 12024                                  ;  199  1360 error1
 12025                                  ;  200  1367 searchname
 12026                                  ;  201  1378 gettypes
 12027                                  ;  202  1387 error1
 12028                                  ;  203  1394 prs
 12029                                  ;  204  1398 printreg
 12030                                  ;  205  1407 error1
 12031                                  ;  206  1414 prs
 12032                                  ;  207  1418 a
 12033                                  ;  208  1420 prs
 12034                                  ;  209  1424 prs
 12035                                  ;  210  1428 prs
 12036                                  ;  211  1432 v
 12037                                  ;  212  1434 adrofname
 12038                                  ;  213  1444 prs
 12039                                  ;  214  1448 prs
 12040                                  ;  215  1452 error1
 12041                                  ;  216  1459 istoken
 12042                                  ;  217  1467 strcpy
 12043                                  ;  218  1474 istoken
 12044                                  ;  219  1482 strcpy
 12045                                  ;  220  1489 istoken
 12046                                  ;  221  1497 strcpy
 12047                                  ;  222  1504 istoken
 12048                                  ;  223  1512 strcpy
 12049                                  ;  224  1519 istoken
 12050                                  ;  225  1527 strcpy
 12051                                  ;  226  1534 istoken
 12052                                  ;  227  1542 strcpy
 12053                                  ;  228  1549 istoken
 12054                                  ;  229  1557 strcpy
 12055                                  ;  230  1564 getlex
 12056                                  ;  231  1571 isrelational
 12057                                  ;  232  1584 error1
 12058                                  ;  233  1591 strcpy
 12059                                  ;  234  1598 prnl
 12060                                  ;  235  1603 prs
 12061                                  ;  236  1607 prs
 12062                                  ;  237  1611 printreg
 12063                                  ;  238  1620 prs
 12064                                  ;  239  1624 istoken
 12065                                  ;  240  1632 prunsign1
 12066                                  ;  241  1642 typeName
 12067                                  ;  242  1651 checkreg
 12068                                  ;  243  1660 printreg
 12069                                  ;  244  1669 searchname
 12070                                  ;  245  1680 a
 12071                                  ;  246  1682 v
 12072                                  ;  247  1684 cmpneg
 12073                                  ;  248  1691 prs
 12074                                  ;  249  1695 expect
 12075                                  ;  250  1702 strlen
 12076                                  ;  251  1709 eqstr
 12077                                  ;  252  1715 eqstr
 12078                                  ;  253  1721 eqstr
 12079                                  ;  254  1727 eqstr
 12080                                  ;  255  1733 eqstr
 12081                                  ;  256  1739 eqstr
 12082                                  ;  257  1745 eqstr
 12083                                  ;  258  1751 eqstr
 12084                                  ;  259  1757 eqstr
 12085                                  ;  260  1763 eqstr
 12086                                  ;  261  1769 eqstr
 12087                                  ;  262  1775 eqstr
 12088                                  ;  263  1781 eqstr
 12089                                  ;  264  1787 eqstr
 12090                                  ;  265  1793 eqstr
 12091                                  ;  266  1799 eqstr
 12092                                  ;  267  1805 eqstr
 12093                                  ;  268  1811 eqstr
 12094                                  ;  269  1817 eqstr
 12095                                  ;  270  1823 eqstr
 12096                                  ;  271  1829 eqstr
 12097                                  ;  272  1835 eqstr
 12098                                  ;  273  1841 strlen
 12099                                  ;  274  1848 eqstr
 12100                                  ;  275  1854 eqstr
 12101                                  ;  276  1860 eqstr
 12102                                  ;  277  1866 eqstr
 12103                                  ;  278  1872 eqstr
 12104                                  ;  279  1878 eqstr
 12105                                  ;  280  1884 eqstr
 12106                                  ;  281  1890 eqstr
 12107                                  ;  282  1896 eqstr
 12108                                  ;  283  1902 prc
 12109                                  ;  284  1906 prc
 12110                                  ;  285  1910 prc
 12111                                  ;  286  1914 istoken
 12112                                  ;  287  1922 prs
 12113                                  ;  288  1926 prunsign1
 12114                                  ;  289  1936 typeName
 12115                                  ;  290  1945 checkreg
 12116                                  ;  291  1954 doreg1
 12117                                  ;  292  1961 docall1
 12118                                  ;  293  1969 isreg
 12119                                  ;  294  1975 searchname
 12120                                  ;  295  1986 gettypes
 12121                                  ;  296  1995 istoken
 12122                                  ;  297  2003 istoken
 12123                                  ;  298  2011 expect
 12124                                  ;  299  2018 searchname
 12125                                  ;  300  2029 expect
 12126                                  ;  301  2036 expect
 12127                                  ;  302  2043 gettypes
 12128                                  ;  303  2052 error1
 12129                                  ;  304  2059 istoken
 12130                                  ;  305  2067 error1
 12131                                  ;  306  2074 prs
 12132                                  ;  307  2078 prs
 12133                                  ;  308  2082 prs
 12134                                  ;  309  2086 v
 12135                                  ;  310  2088 istoken
 12136                                  ;  311  2096 error1
 12137                                  ;  312  2103 prs
 12138                                  ;  313  2107 prs
 12139                                  ;  314  2111 prs
 12140                                  ;  315  2115 v
 12141                                  ;  316  2117 istoken
 12142                                  ;  317  2125 compoundass
 12143                                  ;  318  2137 istoken
 12144                                  ;  319  2145 compoundass
 12145                                  ;  320  2157 istoken
 12146                                  ;  321  2165 compoundass
 12147                                  ;  322  2177 istoken
 12148                                  ;  323  2185 compoundass
 12149                                  ;  324  2197 istoken
 12150                                  ;  325  2205 error1
 12151                                  ;  326  2212 istoken
 12152                                  ;  327  2220 error1
 12153                                  ;  328  2227 istoken
 12154                                  ;  329  2235 expr
 12155                                  ;  330  2240 doassign
 12156                                  ;  331  2249 dovar1
 12157                                  ;  332  2256 istoken
 12158                                  ;  333  2264 rterm
 12159                                  ;  334  2270 istoken
 12160                                  ;  335  2278 rterm
 12161                                  ;  336  2284 istoken
 12162                                  ;  337  2292 rterm
 12163                                  ;  338  2298 istoken
 12164                                  ;  339  2306 rterm
 12165                                  ;  340  2312 istoken
 12166                                  ;  341  2320 rterm
 12167                                  ;  342  2326 istoken
 12168                                  ;  343  2334 rterm
 12169                                  ;  344  2340 istoken
 12170                                  ;  345  2348 domul
 12171                                  ;  346  2354 istoken
 12172                                  ;  347  2362 doidiv
 12173                                  ;  348  2369 istoken
 12174                                  ;  349  2377 domod
 12175                                  ;  350  2383 isrelational
 12176                                  ;  351  2396 rterm
 12177                                  ;  352  2402 cmpneg
 12178                                  ;  353  2409 error1
 12179                                  ;  354  2416 prnl
 12180                                  ;  355  2421 prs
 12181                                  ;  356  2425 prs
 12182                                  ;  357  2429 gettypes
 12183                                  ;  358  2438 prs
 12184                                  ;  359  2442 prs
 12185                                  ;  360  2446 v
 12186                                  ;  361  2448 prs
 12187                                  ;  362  2452 expect
 12188                                  ;  363  2459 prunsign1
 12189                                  ;  364  2469 gettypes
 12190                                  ;  365  2478 prs
 12191                                  ;  366  2482 v
 12192                                  ;  367  2484 prnl
 12193                                  ;  368  2489 prs
 12194                                  ;  369  2493 prs
 12195                                  ;  370  2497 prs
 12196                                  ;  371  2501 prnl
 12197                                  ;  372  2506 prs
 12198                                  ;  373  2510 prs
 12199                                  ;  374  2514 a
 12200                                  ;  375  2516 prs
 12201                                  ;  376  2520 v
 12202                                  ;  377  2522 prs
 12203                                  ;  378  2526 prs
 12204                                  ;  379  2530 prs
 12205                                  ;  380  2534 prs
 12206                                  ;  381  2538 prs
 12207                                  ;  382  2542 prc
 12208                                  ;  383  2546 printName
 12209                                  ;  384  2556 prs
 12210                                  ;  385  2560 prnl
 12211                                  ;  386  2565 prs
 12212                                  ;  387  2569 prs
 12213                                  ;  388  2573 prs
 12214                                  ;  389  2577 prs
 12215                                  ;  390  2581 v
 12216                                  ;  391  2583 istoken
 12217                                  ;  392  2591 prnl
 12218                                  ;  393  2596 prs
 12219                                  ;  394  2600 prs
 12220                                  ;  395  2604 prs
 12221                                  ;  396  2608 prs
 12222                                  ;  397  2612 prunsign1
 12223                                  ;  398  2622 typeName
 12224                                  ;  399  2631 searchname
 12225                                  ;  400  2642 istoken
 12226                                  ;  401  2650 searchname
 12227                                  ;  402  2661 expect
 12228                                  ;  403  2668 expect
 12229                                  ;  404  2675 gettypes
 12230                                  ;  405  2684 error1
 12231                                  ;  406  2691 eqstr
 12232                                  ;  407  2697 dovar1
 12233                                  ;  408  2704 eqstr
 12234                                  ;  409  2710 doreg
 12235                                  ;  410  2716 eqstr
 12236                                  ;  411  2722 doreg
 12237                                  ;  412  2728 eqstr
 12238                                  ;  413  2734 doreg
 12239                                  ;  414  2740 eqstr
 12240                                  ;  415  2746 doreg
 12241                                  ;  416  2752 eqstr
 12242                                  ;  417  2758 doreg
 12243                                  ;  418  2764 eqstr
 12244                                  ;  419  2770 doreg
 12245                                  ;  420  2776 eqstr
 12246                                  ;  421  2782 doreg
 12247                                  ;  422  2788 eqstr
 12248                                  ;  423  2794 doreg
 12249                                  ;  424  2800 eqstr
 12250                                  ;  425  2806 doreg
 12251                                  ;  426  2812 eqstr
 12252                                  ;  427  2818 doreg
 12253                                  ;  428  2824 eqstr
 12254                                  ;  429  2830 doreg
 12255                                  ;  430  2836 eqstr
 12256                                  ;  431  2842 doreg
 12257                                  ;  432  2848 eqstr
 12258                                  ;  433  2854 doreg
 12259                                  ;  434  2860 eqstr
 12260                                  ;  435  2866 doreg
 12261                                  ;  436  2872 eqstr
 12262                                  ;  437  2878 doreg
 12263                                  ;  438  2884 expect
 12264                                  ;  439  2891 prs
 12265                                  ;  440  2895 prs
 12266                                  ;  441  2899 prs
 12267                                  ;  442  2903 istoken
 12268                                  ;  443  2911 prunsign1
 12269                                  ;  444  2921 istoken
 12270                                  ;  445  2929 searchname
 12271                                  ;  446  2940 v
 12272                                  ;  447  2942 error1
 12273                                  ;  448  2949 gettypes
 12274                                  ;  449  2958 prs
 12275                                  ;  450  2962 v
 12276                                  ;  451  2964 prs
 12277                                  ;  452  2968 prs
 12278                                  ;  453  2972 prs
 12279                                  ;  454  2976 a
 12280                                  ;  455  2978 prs
 12281                                  ;  456  2982 prs
 12282                                  ;  457  2986 prunsign1
 12283                                  ;  458  2996 v
 12284                                  ;  459  2998 prs
 12285                                  ;  460  3002 prs
 12286                                  ;  461  3006 printName
 12287                                  ;  462  3016 prs
 12288                                  ;  463  3020 prs
 12289                                  ;  464  3024 prs
 12290                                  ;  465  3028 prs
 12291                                  ;  466  3032 v
 12292                                  ;  467  3034 prs
 12293                                  ;  468  3038 prs
 12294                                  ;  469  3042 prs
 12295                                  ;  470  3046 v
 12296                                  ;  471  3048 prs
 12297                                  ;  472  3052 prs
 12298                                  ;  473  3056 prs
 12299                                  ;  474  3060 v
 12300                                  ;  475  3062 prs
 12301                                  ;  476  3066 rterm
 12302                                  ;  477  3072 istoken
 12303                                  ;  478  3080 prs
 12304                                  ;  479  3084 prunsign1
 12305                                  ;  480  3094 prs
 12306                                  ;  481  3098 error1
 12307                                  ;  482  3105 istoken
 12308                                  ;  483  3113 prs
 12309                                  ;  484  3117 prunsign1
 12310                                  ;  485  3127 prs
 12311                                  ;  486  3131 prs
 12312                                  ;  487  3135 typeName
 12313                                  ;  488  3144 searchname
 12314                                  ;  489  3155 error1
 12315                                  ;  490  3162 gettypes
 12316                                  ;  491  3171 error1
 12317                                  ;  492  3178 error1
 12318                                  ;  493  3185 prs
 12319                                  ;  494  3189 v
 12320                                  ;  495  3191 prs
 12321                                  ;  496  3195 prs
 12322                                  ;  497  3199 doidiv
 12323                                  ;  498  3206 prs
 12324                                  ;  499  3210 checknamelen
 12325                                  ;  500  3223 strcpy
 12326                                  ;  501  3230 storecall
 12327                                  ;  502  3240 expect
 12328                                  ;  503  3247 istoken
 12329                                  ;  504  3255 error1
 12330                                  ;  505  3262 istoken
 12331                                  ;  506  3270 istoken
 12332                                  ;  507  3278 eprs
 12333                                  ;  508  3283 eprs
 12334                                  ;  509  3288 eprc
 12335                                  ;  510  3293 eprnum
 12336                                  ;  511  3300 eprs
 12337                                  ;  512  3305 eprc
 12338                                  ;  513  3310 eprs
 12339                                  ;  514  3315 eprc
 12340                                  ;  515  3320 eprs
 12341                                  ;  516  3325 istoken
 12342                                  ;  517  3333 name1
 12343                                  ;  518  3339 searchname
 12344                                  ;  519  3350 istoken
 12345                                  ;  520  3358 checkreg
 12346                                  ;  521  3367 searchname
 12347                                  ;  522  3378 error1
 12348                                  ;  523  3385 istoken
 12349                                  ;  524  3393 expect
 12350                                  ;  525  3400 prs
 12351                                  ;  526  3404 pint1
 12352                                  ;  527  3410 prs
 12353                                  ;  528  3414 prs
 12354                                  ;  529  3418 prc
 12355                                  ;  530  3422 pint1
 12356                                  ;  531  3428 prs
 12357                                  ;  532  3432 v
 12358                                  ;  533  3434 prs
 12359                                  ;  534  3438 gettypes
 12360                                  ;  535  3447 prs
 12361                                  ;  536  3451 v
 12362                                  ;  537  3453 prs
 12363                                  ;  538  3457 v
 12364                                  ;  539  3459 prs
 12365                                  ;  540  3463 prs
 12366                                  ;  541  3467 printreg
 12367                                  ;  542  3476 prs
 12368                                  ;  543  3480 prs
 12369                                  ;  544  3484 prs
 12370                                  ;  545  3488 pint1
 12371                                  ;  546  3494 getarg
 12372                                  ;  547  3501 setblock
 12373                                  ;  548  3510 error1
 12374                                  ;  549  3517 allocmem
 12375                                  ;  550  3526 error1
 12376                                  ;  551  3533 getfirstchar
 12377                                  ;  552  3546 parse
 12378                                  ;  553  3552 checkcalls
 12379                                  ;  554  3563 epilog
 12380                                  ;  555  3570 fgets1
 12381                                  ;  556  3577 cputs
 12382                                  ;  557  3583 cputs
 12383                                  ;  558  3589 readRL
 12384                                  ;  559  3596 prnl
 12385                                  ;  560  3601 strcpy
 12386                                  ;  561  3608 instr2
 12387                                  ;  562  3615 strcat1
 12388                                  ;  563  3623 toupper
 12389                                  ;  564  3631 strcpy
 12390                                  ;  565  3638 strlen
 12391                                  ;  566  3645 openR
 12392                                  ;  567  3651 cputs
 12393                                  ;  568  3657 cputs
 12394                                  ;  569  3663 exitR
 12395                                  ;  570  3669 creatR
 12396                                  ;  571  3676 cputs
 12397                                  ;  572  3682 cputs
 12398                                  ;  573  3688 exitR
 12399                                  ;  574  3694 prs
 12400                                  ;  575  3698 prs
 12401                                  ;  576  3702 prs
 12402                                  ;  577  3706 pint1
 12403                                  ;  578  3712 prs
 12404                                  ;  579  3716 prs
 12405                                  ;  580  3720 prs
 12406                                  ;  581  3724 prs
 12407                                  ;  582  3728 prs
 12408                                  ;  583  3732 prs
 12409                                  ;  584  3736 prs
 12410                                  ;  585  3740 getlex
 12411                                  ;  586  3747 istoken
 12412                                  ;  587  3755 istoken
 12413                                  ;  588  3763 dodefine
 12414                                  ;  589  3772 istoken
 12415                                  ;  590  3780 doinclude
 12416                                  ;  591  3790 error1
 12417                                  ;  592  3797 typeName
 12418                                  ;  593  3806 dofunc
 12419                                  ;  594  3813 doglob
 12420                                  ;  595  3820 prs
 12421                                  ;  596  3824 from_far
 12422                                  ;  597  3833 adrF
 12423                                  ;  598  3838 eqstr
 12424                                  ;  599  3844 prs
 12425                                  ;  600  3848 prs
 12426                                  ;  601  3852 doar
 12427                                  ;  602  3857 prs
 12428                                  ;  603  3861 cputs
 12429                                  ;  604  3867 cputs
 12430                                  ;  605  3873 pint
 12431                                  ;  606  3878 prs
 12432                                  ;  607  3882 printint51
 12433                                  ;  608  3893 openR
 12434                                  ;  609  3899 cputs
 12435                                  ;  610  3905 cputs
 12436                                  ;  611  3911 exitR
 12437                                  ;  612  3917 prs
 12438                                  ;  613  3921 prs
 12439                                  ;  614  3925 getfirstchar
 12440                                  ;  615  3938 getfunctionhead
 12441                                  ;  616  3954 from_far
 12442                                  ;  617  3963 eqstr
 12443                                  ;  618  3969 prs
 12444                                  ;  619  3973 printint51
 12445                                  ;  620  3984 prs
 12446                                  ;  621  3988 prs
 12447                                  ;  622  3992 dofunc
 12448                                  ;  623  3999 prs
 12449                                  ;  624  4003 checkcalls
 12450                                  ;  625  4014 putch
 12451                                  ;  626  4020 cputs
 12452                                  ;  627  4026 error1
 12453                                  ;  628  4033 getlex
 12454                                  ;  629  4040 istoken
 12455                                  ;  630  4048 getlex
 12456                                  ;  631  4055 prs
 12457                                  ;  632  4059 prs
 12458                                  ;  633  4063 openR
 12459                                  ;  634  4069 prs
 12460                                  ;  635  4073 prs
 12461                                  ;  636  4077 error1
 12462                                  ;  637  4084 parse
 12463                                  ;  638  4090 prs
 12464                                  ;  639  4094 prs
 12465                                  ;  640  4098 getfirstchar
 12466                                  ;  641  4111 getlex
 12467                                  ;  642  4118 eqstr
 12468                                  ;  643  4124 getlex
 12469                                  ;  644  4131 eqstr
 12470                                  ;  645  4137 getlex
 12471                                  ;  646  4144 prs
 12472                                  ;  647  4148 strcpy
 12473                                  ;  648  4155 prs
 12474                                  ;  649  4159 error1
 12475                                  ;  650  4166 getlex
 12476                                  ;  651  4173 expect
 12477                                  ;  652  4180 error1
 12478                                  ;  653  4187 strlen
 12479                                  ;  654  4194 error1
 12480                                  ;  655  4201 adrofname
 12481                                  ;  656  4211 strcpy
 12482                                  ;  657  4218 expect
 12483                                  ;  658  4225 istoken
 12484                                  ;  659  4233 istoken
 12485                                  ;  660  4241 stmt
 12486                                  ;  661  4246 istoken
 12487                                  ;  662  4254 doif
 12488                                  ;  663  4259 istoken
 12489                                  ;  664  4267 dodo
 12490                                  ;  665  4272 istoken
 12491                                  ;  666  4280 dowhile
 12492                                  ;  667  4288 istoken
 12493                                  ;  668  4296 prs
 12494                                  ;  669  4300 name1
 12495                                  ;  670  4306 prs
 12496                                  ;  671  4310 expect
 12497                                  ;  672  4317 prs
 12498                                  ;  673  4321 next
 12499                                  ;  674  4326 prc
 12500                                  ;  675  4330 next
 12501                                  ;  676  4335 getlex
 12502                                  ;  677  4342 istoken
 12503                                  ;  678  4350 prs
 12504                                  ;  679  4354 next
 12505                                  ;  680  4359 prc
 12506                                  ;  681  4363 next
 12507                                  ;  682  4368 getlex
 12508                                  ;  683  4375 error1
 12509                                  ;  684  4382 istoken
 12510                                  ;  685  4390 prs
 12511                                  ;  686  4394 expect
 12512                                  ;  687  4401 prunsign1
 12513                                  ;  688  4411 expect
 12514                                  ;  689  4418 istoken
 12515                                  ;  690  4426 doifcarry
 12516                                  ;  691  4436 istoken
 12517                                  ;  692  4444 doifzero
 12518                                  ;  693  4453 istoken
 12519                                  ;  694  4461 doemit
 12520                                  ;  695  4468 istoken
 12521                                  ;  696  4476 istoken
 12522                                  ;  697  4484 exprstart
 12523                                  ;  698  4494 prs
 12524                                  ;  699  4498 expect
 12525                                  ;  700  4505 prs
 12526                                  ;  701  4509 prs
 12527                                  ;  702  4513 prc
 12528                                  ;  703  4517 expect
 12529                                  ;  704  4524 expect
 12530                                  ;  705  4531 exprstart
 12531                                  ;  706  4541 expect
 12532                                  ;  707  4548 prs
 12533                                  ;  708  4552 getlex
 12534                                  ;  709  4559 prunsign1
 12535                                  ;  710  4569 getlex
 12536                                  ;  711  4576 prc
 12537                                  ;  712  4580 expect
 12538                                  ;  713  4587 prs
 12539                                  ;  714  4591 prs
 12540                                  ;  715  4595 prs
 12541                                  ;  716  4599 prs
 12542                                  ;  717  4603 prs
 12543                                  ;  718  4607 prunsign1
 12544                                  ;  719  4617 prs
 12545                                  ;  720  4621 prs
 12546                                  ;  721  4625 prunsign1
 12547                                  ;  722  4635 prs
 12548                                  ;  723  4639 prs
 12549                                  ;  724  4643 prs
 12550                                  ;  725  4647 error1
 12551                                  ;  726  4654 prs
 12552                                  ;  727  4658 prs
 12553                                  ;  728  4662 pint1
 12554                                  ;  729  4668 prc
 12555                                  ;  730  4672 prs
 12556                                  ;  731  4676 prs
 12557                                  ;  732  4680 pint1
 12558                                  ;  733  4686 pexpr
 12559                                  ;  734  4692 pint1
 12560                                  ;  735  4698 stmt
 12561                                  ;  736  4703 istoken
 12562                                  ;  737  4711 prjump
 12563                                  ;  738  4718 prlabel
 12564                                  ;  739  4726 stmt
 12565                                  ;  740  4731 prlabel
 12566                                  ;  741  4739 prlabel
 12567                                  ;  742  4747 prs
 12568                                  ;  743  4751 prs
 12569                                  ;  744  4755 pint1
 12570                                  ;  745  4761 stmt
 12571                                  ;  746  4766 prlabel
 12572                                  ;  747  4774 prs
 12573                                  ;  748  4778 prs
 12574                                  ;  749  4782 pint1
 12575                                  ;  750  4788 stmt
 12576                                  ;  751  4793 prlabel
 12577                                  ;  752  4801 prlabel
 12578                                  ;  753  4809 stmt
 12579                                  ;  754  4814 expect
 12580                                  ;  755  4821 pexpr
 12581                                  ;  756  4827 pint1
 12582                                  ;  757  4833 prjump
 12583                                  ;  758  4840 prlabel
 12584                                  ;  759  4848 prlabel
 12585                                  ;  760  4856 pexpr
 12586                                  ;  761  4862 pint1
 12587                                  ;  762  4868 stmt
 12588                                  ;  763  4873 prjump
 12589                                  ;  764  4880 prlabel
 12590                                  ;  765  4888 getlex
 12591                                  ;  766  4895 next
 12592                                  ;  767  4900 next
 12593                                  ;  768  4905 next
 12594                                  ;  769  4910 next
 12595                                  ;  770  4915 next
 12596                                  ;  771  4920 next
 12597                                  ;  772  4925 next
 12598                                  ;  773  4930 next
 12599                                  ;  774  4935 next
 12600                                  ;  775  4940 next
 12601                                  ;  776  4945 next
 12602                                  ;  777  4950 next
 12603                                  ;  778  4955 next
 12604                                  ;  779  4960 next
 12605                                  ;  780  4965 next
 12606                                  ;  781  4970 instr1
 12607                                  ;  782  4977 next
 12608                                  ;  783  4982 getlex
 12609                                  ;  784  4989 next
 12610                                  ;  785  4994 next
 12611                                  ;  786  4999 getlex
 12612                                  ;  787  5006 getstring
 12613                                  ;  788  5016 digit
 12614                                  ;  789  5022 getdigit
 12615                                  ;  790  5031 next
 12616                                  ;  791  5036 next
 12617                                  ;  792  5041 next
 12618                                  ;  793  5046 letter
 12619                                  ;  794  5053 strcpy
 12620                                  ;  795  5060 letter
 12621                                  ;  796  5067 next
 12622                                  ;  797  5072 eqstr
 12623                                  ;  798  5078 eqstr
 12624                                  ;  799  5084 eqstr
 12625                                  ;  800  5090 eqstr
 12626                                  ;  801  5096 eqstr
 12627                                  ;  802  5102 eqstr
 12628                                  ;  803  5108 eqstr
 12629                                  ;  804  5114 eqstr
 12630                                  ;  805  5120 eqstr
 12631                                  ;  806  5126 eqstr
 12632                                  ;  807  5132 eqstr
 12633                                  ;  808  5138 eqstr
 12634                                  ;  809  5144 eqstr
 12635                                  ;  810  5150 eqstr
 12636                                  ;  811  5156 eqstr
 12637                                  ;  812  5162 eqstr
 12638                                  ;  813  5168 eqstr
 12639                                  ;  814  5174 eqstr
 12640                                  ;  815  5180 eqstr
 12641                                  ;  816  5186 eqstr
 12642                                  ;  817  5192 eqstr
 12643                                  ;  818  5198 eqstr
 12644                                  ;  819  5204 convertdefine
 12645                                  ;  820  5218 strcpy
 12646                                  ;  821  5225 error1
 12647                                  ;  822  5232 adrofname
 12648                                  ;  823  5242 eqstr
 12649                                  ;  824  5248 next
 12650                                  ;  825  5253 letter
 12651                                  ;  826  5260 next
 12652                                  ;  827  5265 digit
 12653                                  ;  828  5271 next
 12654                                  ;  829  5276 next
 12655                                  ;  830  5281 next
 12656                                  ;  831  5286 fgets1
 12657                                  ;  832  5293 getlex
 12658                                  ;  833  5300 istoken
 12659                                  ;  834  5308 prs
 12660                                  ;  835  5312 listproc
 12661                                  ;  836  5321 prs
 12662                                  ;  837  5325 pint1
 12663                                  ;  838  5331 error1
 12664                                  ;  839  5338 eprc
 12665                                  ;  840  5343 writetty
 12666                                  ;  841  5352 writetty
 12667                                  ;  842  5361 fputcR
 12668                                  ;  843  5368 prc
 12669                                  ;  844  5372 prs
 12670                                  ;  845  5376 prc
 12671                                  ;  846  5380 eprc
 12672                                  ;  847  5385 mkneg
 12673                                  ;  848  5391 eprnum
 12674                                  ;  849  5398 eprc
 12675                                  ;  850  5403 prc
 12676                                  ;  851  5407 mkneg
 12677                                  ;  852  5413 pint1
 12678                                  ;  853  5419 prc
 12679                                  ;  854  5423 prunsign1
 12680                                  ;  855  5433 prc
 12681                                  ;  856  5437 prc
 12682                                  ;  857  5441 prc
 12683                                  ;  858  5445 prc
 12684                                  ;  859  5449 prc
 12685                                  ;  860  5453 prunsign1
 12686                                  ;  861  5463 printinputline
 12687                                  ;  862  5478 readR
 12688                                  ;  863  5484 prs
 12689                                  ;  864  5488 prunsign1
 12690                                  ;  865  5498 prc
 12691                                  ;  866  5502 prscomment
 12692                                  ;  867  5513 fcloseR
 12693                                  ;  868  5521 fcloseR
 12694                                  ;  869  5529 exitR
 12695                                  ;  870  5535 prnl
 12696                                  ;  871  5540 prscomment
 12697                                  ;  872  5551 prs
 12698                                  ;  873  5555 prunsign1
 12699                                  ;  874  5565 prs
 12700                                  ;  875  5569 prs
 12701                                  ;  876  5573 prs
 12702                                  ;  877  5577 pint1
 12703                                  ;  878  5583 prs
 12704                                  ;  879  5587 prunsign1
 12705                                  ;  880  5597 prs
 12706                                  ;  881  5601 prc
 12707                                  ;  882  5605 prs
 12708                                  ;  883  5609 pint1
 12709                                  ;  884  5615 prs
 12710                                  ;  885  5619 prs
 12711                                  ;  886  5623 end1
 12712                                  ;  887  5628 prs
 12713                                  ;  888  5632 prs
 12714                                  ;  889  5636 prs
 12715                                  ;  890  5640 prunsign1
 12716                                  ;  891  5650 prs
 12717                                  ;  892  5654 listvar
 12718                                  ;  893  5662 prs
 12719                                  ;  894  5666 printint51
 12720                                  ;  895  5677 prc
 12721                                  ;  896  5681 prs
 12722                                  ;  897  5685 prs
 12723                                  ;  898  5689 prs
 12724                                  ;  899  5693 prs
 12725                                  ;  900  5697 prs
 12726                                  ;  901  5701 prs
 12727                                  ;  902  5705 prs
 12728                                  ;  903  5709 prs
 12729                                  ;  904  5713 prs
 12730                                  ;  905  5717 printint51
 12731                                  ;  906  5728 printint51
 12732                                  ;  907  5739 prs
 12733                                  ;  908  5743 prs
 12734                                  ;  909  5747 prc
 12735                                  ;  910  5751 adrofname
 12736                                  ;  911  5761 prs
 12737                                  ;  912  5765 prc
 12738                                  ;  913  5769 prunsign1
 12739                                  ;  914  5779 prc
 12740                                  ;  915  5783 prunsign1
 12741                                  ;  916  5793 prc
 12742                                  ;  917  5797 prs
 12743                                  ;  918  5801 prc
 12744                                  ;  919  5805 pint1
 12745                                  ;  920  5811 prs
 12746                                  ;  921  5815 calllisting
 12747                                  ;  922  5827 prs
 12748                                  ;  923  5831 printint51
 12749                                  ;  924  5842 prc
 12750                                  ;  925  5846 prs
 12751                                  ;  926  5850 printint51
 12752                                  ;  927  5861 prc
 12753                                  ;  928  5865 from_far
 12754                                  ;  929  5874 prs
 12755                                  ;  930  5878 adrF
 12756                                  ;  931  5883 from_far
 12757                                  ;  932  5892 eqstr
 12758                                  ;  933  5898 prs
 12759                                  ;  934  5902 countcalls
 12760                                  ;  935  5913 funclisting
 12761                                  ;  936  5925 prs
 12762                                  ;  937  5929 printint51
 12763                                  ;  938  5940 printint51
 12764                                  ;  939  5951 prs
 12765                                  ;  940  5955 printint51
 12766                                  ;  941  5966 prc
 12767                                  ;  942  5970 prs
 12768                                  ;  943  5974 prs
 12769                                  ;  944  5978 prs
 12770                                  ;  945  5982 prs
 12771                                  ;  946  5986 prc
 12772                                  ;  947  5990 prc
 12773                                  ;  948  5994 adrF
 12774                                  ;  949  5999 prs
 12775                                  ;  950  6003 strcpy
 12776                                  ;  951  6010 storefunc
 12777                                  ;  952  6020 prs
 12778                                  ;  953  6024 prs
 12779                                  ;  954  6028 listvar
 12780                                  ;  955  6036 listfunc
 12781                                  ;  956  6045 listcall
 12782                                  ;  957  6054 prs
 12783                                  ;  958  6058 prs
 12784                                  ;  959  6062 prs
 12785                                  ;  960  6066 prs
 12786                                  ;  961  6070 prs
 12787                                  ;  962  6074 printint51
 12788                                  ;  963  6085 prs
 12789                                  ;  964  6089 printint51
 12790                                  ;  965  6100 prs
 12791                                  ;  966  6104 printint51
 12792                                  ;  967  6115 prs
 12793                                  ;  968  6119 printint51
 12794                                  ;  969  6130 prs
 12795                                  ;  970  6134 printint51
 12796                                  ;  971  6145 prs
 12797                                  ;  972  6149 printint51
 12798                                  ;  973  6160 prs
 12799                                  ;  974  6164 printint51
 12800                                  ;  975  6175 prs
 12801                                  ;  976  6179 printint51
 12802                                  ;  977  6190 prs
 12803                                  ;  978  6194 printint51
 12804                                  ;  979  6205 prs
 12805                                  ;  980  6209 printint51
 12806                                  ;  981  6220 prs
 12807                                  ;  982  6224 printint51
 12808                                  ;  983  6235 prs
 12809                                  ;  984  6239 printint51
 12810                                  ;  985  6250 prs
 12811                                  ;  986  6254 prs
 12812                                  ;  987  6258 prunsign1
 12813                                  ;  988  6268 prs
 12814                                  ;  989  6272 printint51
 12815                                  ;  990  6283 prs
 12816                                  ;  991  6287 prs
 12817                                  ;  992  6291 prs
 12818                                  ;  993  6295 prs
 12819                                  ;  994  6299 printint51
 12820                                  ;  995  6310 prs
 12821                                  ;  996  6314 printint51
 12822                                  ;  997  6325 prs
 12823                                  ;  998  6329 printint51
 12824                                  ;  999  6340 prs
 12825                                  ; 1000  6344 end1
 12826                                  ; 1001  6349 DosInt
 12827                                  ; 1002  6356 DosInt
 12828                                  ; 1003  6363 writetty
 12829                                  ; 1004  6372 writetty
 12830                                  ; 1005  6381 putch
 12831                                  ; 1006  6387 prc
 12832                                  ; 1007  6391 mkneg
 12833                                  ; 1008  6397 pint
 12834                                  ; 1009  6402 putch
 12835                                  ; 1010  6408 digit
 12836                                  ; 1011  6414 strcpy
 12837                                  ; 1012  6421 DosInt
 12838                                  ; 1013  6428 DosInt
 12839                                  ; 1014  6435 DosInt
 12840                                  ; 1015  6442 DosInt
 12841                                  ; 1016  6449 DosInt
 12842                                  ;Input: A.C, List: A.S,  Lines: 1022
 12843                                  ;Glob. variables:  139 max.:  200
 12844                                  ;Functions      :  114 max.:  300
 12845                                  ;Calls          : 1017 max.: 2000, NameField: 6456 max.:    65535
 12846                                  ;Code until     :22953 max.: 30000, free: 7047
 12847                                  ;Data (HeapEnd) :53548, resting stacksize: 11987
 12848                                  ;Max. Const in 'epilog' :  947 max. 3000, free: 2053
