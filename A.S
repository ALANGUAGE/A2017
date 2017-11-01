
; A.COM V0.9.2, Source: A.C, Output asm: A.S
org  256 
jmp main

;-1 char Version1[]="A.COM V0.9.2";//todo: 2. op=reg not recognized

Version1 db "A.COM V0.9.2",0

;-2 #define LSTART        200//max global var


;-3 #define VARMAX        300//max global and local var


;-4 #define GNAMEMAX     4800// 16*VARMAX


;-5 #define FUNCMAX       300//max functions


;-6 #define FNAMEMAX     4800// 16*FUNCMAX


;-7 #define CALLMAX      2000//max call


;-8 #define IDLENMAX       15//max length of names


;-9 #define COLUMNMAX     128


;-10 #define T_NAME        256//the following defines for better clearity


;-11 #define T_CONST       257


;-12 #define T_STRING      258


;-13 #define T_DEFINE      511


;-14 #define T_RETURN      512


;-15 #define T_IF          513


;-16 #define T_ELSE        514


;-17 #define T_WHILE       515


;-18 #define T_DO          516


;-19 #define T_INT         517


;-20 #define T_ASM         518


;-21 #define T_ASMBLOCK    519


;-22 #define T_EMIT        520


;-23 #define T_GOTO        521


;-24 #define T_VOID        529


;-25 #define T_CHAR        530


;-26 #define T_SIGNED      531


;-27 #define T_UNSIGNED    532


;-28 #define T_LONG        533


;-29 #define T_EQ          806


;-30 #define T_NE          807


;-31 #define T_GE          811


;-32 #define T_LE          824


;-33 #define T_PLUSPLUS   1219


;-34 #define T_MINUSMINUS 1225


;-35 #define T_PLUSASS    1230


;-36 #define T_MINUSASS   1231


;-37 #define T_MULASS     1232


;-38 #define T_DIVASS     1233


;-39 #define T_ANDASS     1234


;-40 #define T_ORASS      1235


;-41 #define T_LESSLESS   1240


;-42 #define T_GREATGREAT 1241


;-43 


;-44 unsigned int ORGDATAORIG=25000;//start of arrays

ORGDATAORIG dw 25000

;-45 unsigned int orgData;//actual max of array, must be less than stack

orgData dw 0

;-46 #define COMAX        2000


;-47 char co[COMAX];//constant storage

section .bss
absolute 25000
co resb 2000
section .text

;-48 int maxco=0;

maxco dw 0

;-49 int maxco1=0;

maxco1 dw 0

;-50 #define CMDLENMAX      67


;-51 char coname[CMDLENMAX];

section .bss
absolute 27000
coname resb 67
section .text

;-52 char symbol[COLUMNMAX];

section .bss
absolute 27067
symbol resb 128
section .text

;-53 char fname[CMDLENMAX];

section .bss
absolute 27195
fname resb 67
section .text

;-54 char namein[CMDLENMAX];

section .bss
absolute 27262
namein resb 67
section .text

;-55 char namelst[CMDLENMAX];

section .bss
absolute 27329
namelst resb 67
section .text

;-56 char archivename[CMDLENMAX];

section .bss
absolute 27396
archivename resb 67
section .text

;-57 char *cloc=0;

cloc dw 0

;-58 int fdin=0;

fdin dw 0

;-59 int fdout=0;

fdout dw 0

;-60 int token=0;

token dw 0

;-61 char globC=0;

globC db 0

;-62 int column=0;

column dw 0

;-63 char thechar=0;   //reads one char forward

thechar db 0

;-64 int iscmp=0;

iscmp dw 0

;-65 int nconst=0;

nconst dw 0

;-66 int nreturn=0;

nreturn dw 0

;-67 int nlabel=0;

nlabel dw 0

;-68 int GTop=1;

GTop dw 1

;-69 int LTop=LSTART;

LTop dw 200

;-70 unsigned int lexval=0;

lexval dw 0

;-71 int typei;       char istype;

typei dw 0
istype db 0

;-72 int signi;       char issign;

signi dw 0
issign db 0

;-73 int widthi;      char iswidth;

widthi dw 0
iswidth db 0

;-74 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 27463
GType resb 300
section .text

;-75 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 27763
GSign resb 300
section .text

;-76 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 28063
GWidth resb 300
section .text

;-77 int GAdr [VARMAX];

section .bss
absolute 28363
GAdr resw 300
section .text

;-78 int GUsed[VARMAX];

section .bss
absolute 28963
GUsed resw 300
section .text

;-79 int GData[VARMAX];

section .bss
absolute 29563
GData resw 300
section .text

;-80 char GNameField[GNAMEMAX];

section .bss
absolute 30163
GNameField resb 4800
section .text

;-81 int wi=0;

wi dw 0

;-82 int  FTop=0;

FTop dw 0

;-83 int  CTop=0;

CTop dw 0

;-84 char FType [FUNCMAX];

section .bss
absolute 34963
FType resb 300
section .text

;-85 char CType[CALLMAX];

section .bss
absolute 35263
CType resb 2000
section .text

;-86 int  FAdr  [FUNCMAX];

section .bss
absolute 37263
FAdr resw 300
section .text

;-87 int  CAdr [CALLMAX];

section .bss
absolute 37863
CAdr resw 2000
section .text

;-88 int  FCalls[FUNCMAX];

section .bss
absolute 41863
FCalls resw 300
section .text

;-89 char FNameField[FNAMEMAX];

section .bss
absolute 42463
FNameField resb 4800
section .text

;-90 //char CNameField[CNAMEMAX];


;-91 


;-92 char NameA[]="12345678901234567890123456789012"; //must be in low memory

NameA db "12345678901234567890123456789012",0

;-93 char fgetsdest[COLUMNMAX];

section .bss
absolute 47263
fgetsdest resb 128
section .text

;-94 unsigned char *CNameTop=0;

CNameTop dw 0

;-95 unsigned char *fgetsp=0;

fgetsp dw 0

;-96 unsigned int segE;

segE dw 0

;-97 unsigned int lineno=1;

lineno dw 1

;-98 unsigned int linenoinclude=1;

linenoinclude dw 1

;-99 unsigned char *pt=0;

pt dw 0

;-100 unsigned char *p1=0;

p1 dw 0

;-101 int DOS_ERR=0;

DOS_ERR dw 0

;-102 int DOS_NoBytes=0;

DOS_NoBytes dw 0

;-103 char DOS_ByteRead=0;

DOS_ByteRead db 0

;-104 


;-105 


;-106 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-107 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }

 ret
ENDP

putch: PROC
;Function : putch, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   107 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
 mov  al, 13
 call writetty
.putch1:
 mov  al, [bp+4]
 call writetty

;-108 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
ENDP

cputs: PROC
;Function : cputs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   108 NULL s = bp+4
;  201 var sign byte   108 NULL c = bp-2;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
 inc  word[bp+4]
 jmp .cputs2
.cputs3:

;-109 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC
;Function : mkneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   109 NULL n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-110 


;-111 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-112     __emit__(0xCD,0x21);//inth 0x21;

 db 205,33

;-113     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-114     DOS_ERR++;

 inc  word[DOS_ERR]

;-115 }


;-116 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC
;Function : openR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   116 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-117 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC
;Function : creatR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   117 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-118 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC
;Function : fcloseR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   118 NULL fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-119 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC
;Function : exitR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   119 NULL c = bp+4;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-120 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-121     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}

;Function : readRL, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   120 NULL s = bp+4
;  201 var sign word   120 NULL fd = bp+6
;  202 var sign word   120 NULL len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-122 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC
;Function : fputcR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   122 NULL n = bp+4
;  201 var sign word   122 NULL fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]

;-123   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-124 


;-125   int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-126       if (c=='_') return 1;

;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   125 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-127       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-128       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-129       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-130       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-131       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-132       if (c> 'Z') { if (c< 'a') return 0; }

.letter9:
 mov al, [bp+4]
 cmp al, 90
 jle .letter10
 mov al, [bp+4]
 cmp al, 97
 jge .letter11
 mov ax, 0
 jmp .retnletter
.letter11:

;-133       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-134   }


;-135   int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-136       if(c<'0') return 0;

;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   135 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-137       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-138       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-139   }


;-140   int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-141     if (digit (c)) return 1;

;Function : alnum, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   140 NULL c = bp+4;
 ENTER  0,0
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .alnum14
 mov ax, 1
 jmp .retnalnum

;-142     if (letter(c)) return 1;

.alnum14:
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je .alnum15
 mov ax, 1
 jmp .retnalnum

;-143     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-144   }


;-145 


;-146 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-147     c=0;

;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   146 NULL s = bp+4
;  201 var sign word   146 NULL c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-148     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-149     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-150 }


;-151 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-152     do { *s=*t; s++; t++; }

;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   151 NULL s = bp+4
;  201 ptr sign byte   151 NULL t = bp+6;
 ENTER  0,0
.strcpy18:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]

;-153     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-154     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-155     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-156 }


;-157 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-158     while(*p) {

;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   157 NULL p = bp+4
;  201 ptr sign byte   157 NULL q = bp+6;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-159         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-160         p++;

.eqstr22:
 inc  word[bp+4]

;-161         q++;

 inc  word[bp+6]

;-162     }


;-163     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-164     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-165 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-166     while (*s != 0) s++;

;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   165 NULL s = bp+4
;  201 ptr sign byte   165 NULL t = bp+6;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-167     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-168 }


;-169 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-170     while(*s) {

;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   169 NULL s = bp+4;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-171         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 97 ;unsigned : 1
 jl  .toupper28
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 122
 jg  .toupper29
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 sub ax, 32
 mov  bx, [bp+4]
 mov  [bx], al

;-172         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-173     }


;-174 }

 jmp .toupper26
.toupper27:

;-175 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-176     while(*s) {

;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   175 NULL s = bp+4
;  201 var sign byte   175 NULL c = bp+6;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-177         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-178         s++;

.instr132:
 inc  word[bp+4]

;-179     }


;-180     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-181 }


;-182 


;-183 


;-184 int a(unsigned int i) { printName(i);//address

 .retninstr1: LEAVE
 ret
ENDP

a: PROC
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   184 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-185 }


;-186 int v(unsigned int i) {//value
 LEAVE
 ret
ENDP

v: PROC

;-187     if (i < LSTART) prc('[');

;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   186 NULL i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v33
 push 91
 call prc
 add  sp, 2

;-188     printName(i);

.v33:
 push word [bp+4]
 call printName
 add  sp, 2

;-189     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v34
 push 93
 call prc
 add  sp, 2

;-190 }

.v34:

;-191 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-192     int i;


;-193     i=strlen(symbol);

;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   192 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-194     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen35
 push checknamelen_0
 call error1
 add  sp, 2

;-195 }

.checknamelen35:

;-196 


;-197 int next() {
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

next: PROC

;-198     char r;


;-199     r = thechar;

;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   198 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-200     globC=r;

 mov al, [bp-2]
 mov byte [globC], al

;-201     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-202     return r;

 mov al, [bp-2]
 jmp .retnnext

;-203 }


;-204 int istoken(int t) {

 .retnnext: LEAVE
 ret
ENDP

istoken: PROC

;-205     if (token == t) {

;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   204 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken36

;-206         token=getlex();

 call getlex
 mov word [token], ax

;-207         return 1;

 mov ax, 1
 jmp .retnistoken

;-208     }


;-209     return 0;

.istoken36:
 mov ax, 0
 jmp .retnistoken

;-210 }


;-211 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-212     if (istoken(t)==0) {

;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   211 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect37

;-213         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-214         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-215         listproc();

 call listproc

;-216         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-217         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-218         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-219     }


;-220 }

.expect37:

;-221 


;-222 int eprc(char c)  {
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

eprc: PROC

;-223     *cloc=c;

;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   222 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al

;-224     cloc++;

 inc  word[cloc]

;-225 }


;-226 int eprs(char *s) {
 LEAVE
 ret
ENDP

eprs: PROC

;-227     char c;


;-228     while(*s) {

;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   226 NULL s = bp+4
;  201 var sign byte   227 NULL c = bp-2;
 ENTER  2,0
.eprs38:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs39

;-229         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-230         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2

;-231         s++;

 inc  word[bp+4]

;-232     }


;-233 }

 jmp .eprs38
.eprs39:

;-234 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-235     if (c==10) {

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   234 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc40

;-236         _AX=13;

 mov  ax, 13

;-237         writetty();

 call writetty

;-238     }


;-239     _AL=c;

.prc40:
 mov  al, [bp+4]

;-240     writetty();

 call writetty

;-241     fputcR(c, fdout);

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-242 }


;-243 int prscomment(unsigned char *s) {
 LEAVE
 ret
ENDP

prscomment: PROC

;-244     unsigned char c;


;-245     while(*s){

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   243 NULL s = bp+4
;  201 var unsg byte   244 NULL c = bp-2;
 ENTER  2,0
.prscomment41:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment42

;-246         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-247         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-248         s++;

 inc  word[bp+4]

;-249     }


;-250 }

 jmp .prscomment41
.prscomment42:

;-251 int prnl() {
 LEAVE
 ret
ENDP

prnl: PROC

;-252     prs("\n ");

 push prnl_0
 call prs
 add  sp, 2

;-253 }


;-254 


;-255 int prs(unsigned char *s) {

 ret
prnl_0 db "\n ",0
ENDP

prs: PROC

;-256     unsigned char c; int com;


;-257     com=0;

;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   255 NULL s = bp+4
;  201 var unsg byte   256 NULL c = bp-2
;  202 var sign word   256 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-258     while(*s) {

.prs43:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs44

;-259         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-260         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs45
 mov ax, [bp-4]
 or  al, al
 je .prs46
 mov ax, 0
 mov [bp-4], ax

;-261                    else com=1;

 jmp .prs47
.prs46:
 mov ax, 1
 mov [bp-4], ax

;-262         if (c==92) {

.prs47:
.prs45:
 mov al, [bp-2]
 cmp al, 92
 jne .prs48

;-263             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs49

;-264                 s++;

 inc  word[bp+4]

;-265                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-266                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs50
 mov ax, 10
 mov [bp-2], al

;-267                 if (c=='t') c= 9;

.prs50:
 mov al, [bp-2]
 cmp al, 116
 jne .prs51
 mov ax, 9
 mov [bp-2], al

;-268             }

.prs51:

;-269         }

.prs49:

;-270         prc(c);

.prs48:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-271         s++;

 inc  word[bp+4]

;-272     }


;-273 }

 jmp .prs43
.prs44:

;-274 int eprnum(int n){//for docall1 procedure
 LEAVE
 ret
ENDP

eprnum: PROC

;-275     int e;


;-276     if(n<0) {

;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   274 NULL n = bp+4
;  201 var sign word   275 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum52

;-277         eprc('-');

 push 45
 call eprc
 add  sp, 2

;-278         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-279     }


;-280     if (n >= 10) {

.eprnum52:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum53

;-281         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-282         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2

;-283     }


;-284     n=n%10;

.eprnum53:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-285     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax

;-286     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2

;-287 }


;-288 int pint1 (int n){
 LEAVE
 ret
ENDP

pint1: PROC

;-289     int e;


;-290     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   288 NULL n = bp+4
;  201 var sign word   289 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint154
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-291     if (n >= 10) {

.pint154:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint155

;-292         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-293         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2

;-294     }


;-295     n=n%10;

.pint155:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-296     n += '0';

 add  word[bp+4], 48

;-297     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-298 }


;-299 int prunsign1(unsigned int n) {
 LEAVE
 ret
ENDP

prunsign1: PROC

;-300     unsigned int e;


;-301     if (n >= 10) {

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   299 NULL n = bp+4
;  201 var unsg word   300 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign156

;-302         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax

;-303         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-304     }


;-305     n = n % 10; /*unsigned mod*/

.prunsign156:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax

;-306     n += '0';

 add  word[bp+4], 48

;-307     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-308 }


;-309 int printint51(unsigned int j)  {
 LEAVE
 ret
ENDP

printint51: PROC

;-310     if (j<10000) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   309 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint5157
 push 32
 call prc
 add  sp, 2

;-311     if (j<1000) prc(32);

.printint5157:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint5158
 push 32
 call prc
 add  sp, 2

;-312     if (j<100) prc(32);

.printint5158:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint5159
 push 32
 call prc
 add  sp, 2

;-313     if (j<10) prc(32);

.printint5159:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint5160
 push 32
 call prc
 add  sp, 2

;-314     prunsign1(j);

.printint5160:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-315 }


;-316 


;-317 


;-318 char doglobName[IDLENMAX];
 LEAVE
 ret
ENDP
section .bss
absolute 47391
doglobName resb 15
section .text

;-319 int doglob() {


doglob: PROC

;-320     int i; int j; int isstrarr; isstrarr=0;

;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   320 NULL i = bp-2
;  201 var sign word   320 NULL j = bp-4
;  202 var sign word   320 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-321   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob61
 push doglob_0
 call error1
 add  sp, 2

;-322   if (iswidth == 0) error1("no VOID as var type");

.doglob61:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob62
 push doglob_1
 call error1
 add  sp, 2

;-323   checknamelen();

.doglob62:
 call checknamelen

;-324   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob63
 push doglob_2
 call error1
 add  sp, 2

;-325   if (istoken('[')) { istype='&';

.doglob63:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob64
 mov ax, 38
 mov byte [istype], al

;-326     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob65

;-327       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-328       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-329       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-330       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob66
 push doglob_5
 call prs
 add  sp, 2

;-331       if (iswidth==2) prs(" resw ");

.doglob66:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob67
 push doglob_6
 call prs
 add  sp, 2

;-332       if (iswidth==4) prs(" resd ");

.doglob67:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob68
 push doglob_7
 call prs
 add  sp, 2

;-333       prunsign1(lexval);

.doglob68:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-334       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-335       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-336       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob69
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-337       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob69:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob70
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-338       GData[GTop]=lexval; expect(']');

.doglob70:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-339     }else { expect(']');

 jmp .doglob71
.doglob65:
 push 93
 call expect
 add  sp, 2

;-340       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob72
 push doglob_9
 call error1
 add  sp, 2

;-341       prs("\n"); prs(symbol); prs(" db ");

.doglob72:
 push doglob_10
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push doglob_11
 call prs
 add  sp, 2

;-342       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-343       expect('=');

 push 61
 call expect
 add  sp, 2

;-344       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob73

;-345         prc(34); prscomment(symbol); prc(34); prs(",0");

 push 34
 call prc
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
 push 34
 call prc
 add  sp, 2
 push doglob_12
 call prs
 add  sp, 2

;-346         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-347       else if (istoken('{' )) { i=0;

 jmp .doglob74
.doglob73:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob75
 mov ax, 0
 mov [bp-2], ax

;-348         do { if(i) prc(',');

.doglob76:
 mov ax, [bp-2]
 or  al, al
 je .doglob77
 push 44
 call prc
 add  sp, 2

;-349           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob77:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-350         while (istoken(',')); expect('}'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob78
 jmp .doglob76
.doglob78:
 push 125
 call expect
 add  sp, 2

;-351       else error1("String or number array expected");

 jmp .doglob79
.doglob75:
 push doglob_13
 call error1
 add  sp, 2

;-352       };

.doglob79:
.doglob74:
.doglob71:

;-353   }else { //expect('=');

 jmp .doglob80
.doglob64:

;-354     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob81
 push doglob_15
 call prs
 add  sp, 2

;-355     else {

 jmp .doglob82
.doglob81:

;-356       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob83
 push doglob_16
 call prs
 add  sp, 2

;-357       else if (iswidth==2) prs(" dw ");

 jmp .doglob84
.doglob83:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob85
 push doglob_17
 call prs
 add  sp, 2

;-358       else                 prs(" dd ");

 jmp .doglob86
.doglob85:
 push doglob_18
 call prs
 add  sp, 2

;-359     }

.doglob86:
.doglob84:

;-360     if(istoken('-')) prc('-');

.doglob82:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob87
 push 45
 call prc
 add  sp, 2

;-361     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob87:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob88
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-362     else prunsign1(0); }

 jmp .doglob89
.doglob88:
 push 0
 call prunsign1
 add  sp, 2
.doglob89:

;-363   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob80:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-364   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-365   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-366   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob90
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob91
.doglob90:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-367   GTop++; expect(';'); }

.doglob91:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-368 


;-369 int gettypes(int i) {int j; char c;
 LEAVE
 ret
doglob_0 db "Global table full",0
doglob_1 db "no VOID as var type",0
doglob_2 db "Variable already defined",0
doglob_3 db "\nsection .bss\nabsolute ",0
doglob_4 db "\n",0
doglob_5 db " resb ",0
doglob_6 db " resw ",0
doglob_7 db " resd ",0
doglob_8 db "\nsection .text",0
doglob_9 db "Only ByteArray allowed",0
doglob_10 db "\n",0
doglob_11 db " db ",0
doglob_12 db ",0",0
doglob_13 db "String or number array expected",0
doglob_14 db "\n",0
doglob_15 db " dw ",0
doglob_16 db " db ",0
doglob_17 db " dw ",0
doglob_18 db " dd ",0
ENDP

gettypes: PROC

;-370   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   369 NULL i = bp+4
;  201 var sign word   369 NULL j = bp-2
;  202 var sign byte   369 NULL c = bp-4;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes92
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes93
.gettypes92:
 mov ax, 0
 mov word [signi], ax

;-371   c=GWidth[i]; widthi=0;wi=0;

.gettypes93:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-372   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes94
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-373   if (c==2) {widthi=2;wi=2;}

.gettypes94:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes95
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-374   if (c==4) {widthi=4;wi=4;}

.gettypes95:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes96
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-375   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes96:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes97
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-376   if (c=='&')  typei=2;

.gettypes97:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes98
 mov ax, 2
 mov word [typei], ax

;-377   return i; }

.gettypes98:
 mov ax, [bp+4]
 jmp .retngettypes

;-378 int adrofname(unsigned int i) { adrF(GNameField, i); }

 .retngettypes: LEAVE
 ret
ENDP

adrofname: PROC
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   378 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-379 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
ENDP

adrF: PROC
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   379 NULL s = bp+4
;  201 var unsg word   379 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-380   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-381 int printName(unsigned int i) {int j;
 LEAVE
 ret
ENDP

printName: PROC

;-382   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   381 NULL i = bp+4
;  201 var sign word   381 NULL j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName99
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-383   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp .printName100
.printName99:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle .printName101
 push 43
 call prc
 add  sp, 2
.printName101:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-384 }

.printName100:

;-385 int searchname() { unsigned int i;
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

searchname: PROC

;-386   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   385 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname102
 push searchname_0
 call error1
 add  sp, 2

;-387   GUsed[i]=GUsed[i] + 1; return i;

.searchname102:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp .retnsearchname

;-388 }


;-389 int checkName() { unsigned int i; unsigned int j;

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

checkName: PROC

;-390   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   389 NULL i = bp-2
;  201 var unsg word   389 NULL j = bp-4;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
.checkName103:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName104
 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax
 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName105
 mov ax, [bp-2]
 jmp .retncheckName
.checkName105:
 inc  word[bp-2]

;-391   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp .checkName103
.checkName104:
 mov ax, 1
 mov [bp-2], ax
.checkName106:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName107
 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax
 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName108
 mov ax, [bp-2]
 jmp .retncheckName
.checkName108:
 inc  word[bp-2]

;-392   return 0;

 jmp .checkName106
.checkName107:
 mov ax, 0
 jmp .retncheckName

;-393 }


;-394 int typeName() { int m; //0=V,1=*,2=&

 .retncheckName: LEAVE
 ret
ENDP

typeName: PROC

;-395     issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   394 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-396     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName109
 mov ax, 83
 mov byte [issign], al

;-397     if(istoken(T_UNSIGNED)) issign='U';

.typeName109:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName110
 mov ax, 85
 mov byte [issign], al

;-398     iswidth=2;

.typeName110:
 mov ax, 2
 mov byte [iswidth], al

;-399     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName111
 mov ax, 0
 mov byte [iswidth], al

;-400     if(istoken(T_CHAR))     iswidth=1;

.typeName111:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName112
 mov ax, 1
 mov byte [iswidth], al

;-401     if(istoken(T_INT))      iswidth=2;

.typeName112:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName113
 mov ax, 2
 mov byte [iswidth], al

;-402     if(istoken(T_LONG))     iswidth=4;

.typeName113:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName114
 mov ax, 4
 mov byte [iswidth], al

;-403     istype='V';

.typeName114:
 mov ax, 86
 mov byte [istype], al

;-404     m=0;

 mov ax, 0
 mov [bp-2], ax

;-405     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName115
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-406     if(istoken('&'))  {istype='&'; m=2;}

.typeName115:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName116
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-407     name1();

.typeName116:
 call name1

;-408     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-409 }


;-410 int name1() {

 .retntypeName: LEAVE
 ret
ENDP

name1: PROC

;-411     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1117
 push name1_0
 call error1
 add  sp, 2

;-412     token=getlex();

.name1117:
 call getlex
 mov word [token], ax

;-413 }


;-414 


;-415 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");

 ret
name1_0 db "Name expected",0
ENDP

storecall: PROC
;Function : storecall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   415 NULL i = bp-2;
 ENTER  2,0
 mov ax, [CTop]
 cmp ax, 2000 ;unsigned : 1
 jl  .storecall118
 push storecall_0
 call error1
 add  sp, 2

;-416   if (CNameTop >= 65468) error1("Call name table fuill");

.storecall118:
 mov ax, [CNameTop]
 cmp ax, 65468 ;unsigned : 0
 jb  .storecall119
 push storecall_1
 call error1
 add  sp, 2

;-417     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

.storecall119:
 mov ax, 0
 mov bx, [CTop]
 mov [CType+bx], al
 mov ax, [CNameTop]
 mov bx, [CTop]
 shl bx, 1
 mov [CAdr+bx], ax
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-418     to_far(CNameTop, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNameTop]
 call to_far
 add  sp, 4

;-419     CNameTop=CNameTop+i; CNameTop++; CTop++;

 mov ax, [CNameTop]
 add ax, [bp-2]
 mov word [CNameTop], ax
 inc  word[CNameTop]
 inc  word[CTop]

;-420 }


;-421 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0
ENDP

storefunc: PROC
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc120
 push storefunc_0
 call error1
 add  sp, 2

;-422     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc120:
 mov ax, [lineno]
 sub ax, 1
 mov bx, [FTop]
 shl bx, 1
 mov [FAdr+bx], ax
 mov ax, 0
 mov bx, [FTop]
 shl bx, 1
 mov [FCalls+bx], ax
 mov al, [iswidth]
 mov bx, [FTop]
 mov [FType+bx], al

;-423     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 inc  word[FTop]

;-424 }


;-425 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal121
 push addlocal_0
 call error1
 add  sp, 2

;-426   if (checkName() != 0) error1("Variable already defined");

.addlocal121:
 call checkName
 cmp ax, 0
 je  .addlocal122
 push addlocal_1
 call error1
 add  sp, 2

;-427   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal122:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-428   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-429   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-430 }


;-431 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   431 NULL i = bp-2
;  201 var unsg word   431 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-432   while (i < FTop) {

.checkFunction123:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction124

;-433     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

 push word [bp-2]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkFunction125
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction125:
 inc  word[bp-2]

;-434   return 0; }

 jmp .checkFunction123
.checkFunction124:
 mov ax, 0
 jmp .retncheckFunction

;-435 int dofunc() { int nloc; int i; int narg;

 .retncheckFunction: LEAVE
 ret
ENDP

dofunc: PROC

;-436   cloc=&co;

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   435 NULL nloc = bp-2
;  201 var sign word   435 NULL i = bp-4
;  202 var sign word   435 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-437   checknamelen();

 call checknamelen

;-438   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-439   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc126
 push dofunc_0
 call error1
 add  sp, 2

;-440   storefunc();

.dofunc126:
 call storefunc

;-441   prs("\n\n"); prs(symbol); prs(": PROC");

 push dofunc_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push dofunc_2
 call prs
 add  sp, 2

;-442   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-443   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc127
 mov ax, 2
 mov [bp-6], ax

;-444     do { typeName();  addlocal(); narg+=2;

.dofunc128:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-445          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc129
 add  word[bp-6], 2
.dofunc129:
 inc  word[LTop]

;-446     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc130
 jmp .dofunc128
.dofunc130:
 push 41
 call expect
 add  sp, 2

;-447 


;-448   expect('{'); /*body*/

.dofunc127:
 push 123
 call expect
 add  sp, 2

;-449   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-450   while(isvariable()) {

.dofunc131:
 call isvariable
 or  al, al
 je .dofunc132

;-451     do {typeName();

.dofunc133:
 call typeName

;-452         checknamelen();

 call checknamelen

;-453         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-454         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc134
 sub  word[bp-2], 2

;-455         GData[LTop]=nloc;

.dofunc134:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-456         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc135

;-457             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

 mov ax, 38
 mov byte [istype], al
 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
 push 257
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-458             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-459             }


;-460         LTop++;

.dofunc135:
 inc  word[LTop]

;-461       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc136
 jmp .dofunc133
.dofunc136:
 push 59
 call expect
 add  sp, 2

;-462   listproc();

 jmp .dofunc131
.dofunc132:
 call listproc

;-463   if (LTop>LSTART){prs(";\n ENTER  ");

 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc137
 push dofunc_3
 call prs
 add  sp, 2

;-464     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2
 push dofunc_4
 call prs
 add  sp, 2

;-465   while(istoken('}')==0)   stmt();

.dofunc137:
.dofunc138:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc139
 call stmt

;-466   if (nreturn) {

 jmp .dofunc138
.dofunc139:
 mov ax, [nreturn]
 or  al, al
 je .dofunc140

;-467         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-468         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-469         prc(':');

 push 58
 call prc
 add  sp, 2

;-470         }


;-471   if (LTop > LSTART) prs(" LEAVE");

.dofunc140:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc141
 push dofunc_6
 call prs
 add  sp, 2

;-472   prs("\n ret");

.dofunc141:
 push dofunc_7
 call prs
 add  sp, 2

;-473   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-474   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-475   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc142
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-476   prs("\nENDP");

.dofunc142:
 push dofunc_8
 call prs
 add  sp, 2

;-477 }


;-478 int isvariable() {
 LEAVE
 ret
dofunc_0 db "Function already defined",0
dofunc_1 db "\n\n",0
dofunc_2 db ": PROC",0
dofunc_3 db ";\n ENTER  ",0
dofunc_4 db ",0",0
dofunc_5 db "\n .retn",0
dofunc_6 db " LEAVE",0
dofunc_7 db "\n ret",0
dofunc_8 db "\nENDP",0
ENDP

isvariable: PROC

;-479     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable143
 jmp .v1

;-480     if(token==T_UNSIGNED) goto v1;

.isvariable143:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable144
 jmp .v1

;-481     if(token==T_CHAR)     goto v1;

.isvariable144:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable145
 jmp .v1

;-482     if(token==T_INT)      goto v1;

.isvariable145:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable146
 jmp .v1

;-483     if(token==T_LONG)     goto v1;

.isvariable146:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable147
 jmp .v1

;-484     return 0;

.isvariable147:
 mov ax, 0
 jmp .retnisvariable

;-485 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-486 }


;-487 


;-488 int ireg1;

 .retnisvariable:
 ret
ENDP
ireg1 dw 0

;-489 int mod2; int ireg2;

mod2 dw 0
ireg2 dw 0

;-490 


;-491 int pexpr() {expect('('); iscmp=0;


pexpr: PROC
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-492   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr148
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr149
 call constantexpr
 jmp .retnpexpr

;-493     ireg1=checkreg();

.pexpr149:
 call checkreg
 mov word [ireg1], ax

;-494     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr150
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr150:

;-495   expr(0);

.pexpr148:
 push 0
 call expr
 add  sp, 2

;-496   if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr151
 push pexpr_1
 call prs
 add  sp, 2
.pexpr151:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-497   expect(')'); }

 push 41
 call expect
 add  sp, 2

;-498 


;-499 int constantexpr() { int mode; int id1;int ids;

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

constantexpr: PROC

;-500   token=getlex();   mode=typeName();

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   499 NULL mode = bp-2
;  201 var sign word   499 NULL id1 = bp-4
;  202 var sign word   499 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-501   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-502   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr152
 push constantexpr_0
 call error1
 add  sp, 2

;-503   expect(T_CONST);  prs(" ; constant expression");

.constantexpr152:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-504   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-505   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr153
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr154
.constantexpr153:
 push constantexpr_4
 call prs
 add  sp, 2

;-506   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr154:
 push word [bp-4]
 call v
 add  sp, 2
 push constantexpr_5
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push word [bp-6]
 call cmpneg
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-507   expect(')');

 push 41
 call expect
 add  sp, 2

;-508 }


;-509 


;-510 char ops[5];
 LEAVE
 ret
constantexpr_0 db "Relational expression expected",0
constantexpr_1 db " ; constant expression",0
constantexpr_2 db "\ncmp ",0
constantexpr_3 db "word",0
constantexpr_4 db "byte",0
constantexpr_5 db ", ",0
ENDP
section .bss
absolute 47406
ops resb 5
section .text

;-511 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-512   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   511 NULL iscmp1 = bp+4
;  201 var sign word   511 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1155
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-513   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1155:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1156
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-514   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1156:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1157
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-515   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1157:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1158
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-516   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1158:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1159
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-517   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1159:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1160
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-518   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1160:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1161
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-519   if (iscmp1 == 1) { token=getlex();

.doreg1161:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1162
 call getlex
 mov word [token], ax

;-520       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1163
 push doreg1_7
 call error1
 add  sp, 2

;-521       strcpy(ops, "cmp"); }

.doreg1163:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-522   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1162:
 call prnl
 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2
 push doreg1_9
 call prs
 add  sp, 2
 push word [ireg1]
 call printreg
 add  sp, 2
 push doreg1_10
 call prs
 add  sp, 2

;-523 


;-524   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1164
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-525   mod2=typeName(); ireg2=checkreg();

.doreg1164:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-526   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1165
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-527   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1165:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1166
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1167
.doreg1166:
 push word [bp-2]
 call v
 add  sp, 2

;-528   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1167:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1168
 push 0
 call cmpneg
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push 41
 call expect
 add  sp, 2

;-529 }

.doreg1168:

;-530 int checkreg() { // >=17 = 16bit, >=47 = 32bit
 LEAVE
 ret
doreg1_0 db "mov",0
doreg1_1 db "add",0
doreg1_2 db "sub",0
doreg1_3 db "and",0
doreg1_4 db "or",0
doreg1_5 db "shl",0
doreg1_6 db "shr",0
doreg1_7 db "Relational expected",0
doreg1_8 db "cmp",0
doreg1_9 db "  ",0
doreg1_10 db ", ",0
ENDP

checkreg: PROC

;-531   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg169
 mov ax, 0
 jmp .retncheckreg

;-532   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg169:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg170
 mov ax, 1
 jmp .retncheckreg
.checkreg170:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg171
 mov ax, 3
 jmp .retncheckreg

;-533   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg171:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg172
 mov ax, 5
 jmp .retncheckreg
.checkreg172:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg173
 mov ax, 7
 jmp .retncheckreg

;-534   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg173:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg174
 mov ax, 9
 jmp .retncheckreg
.checkreg174:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg175
 mov ax, 11
 jmp .retncheckreg

;-535   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg175:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg176
 mov ax, 13
 jmp .retncheckreg
.checkreg176:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg177
 mov ax, 15
 jmp .retncheckreg

;-536   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg177:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg178
 mov ax, 17
 jmp .retncheckreg
.checkreg178:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg179
 mov ax, 19
 jmp .retncheckreg

;-537   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg179:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg180
 mov ax, 21
 jmp .retncheckreg
.checkreg180:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg181
 mov ax, 23
 jmp .retncheckreg

;-538   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg181:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg182
 mov ax, 25
 jmp .retncheckreg
.checkreg182:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg183
 mov ax, 27
 jmp .retncheckreg

;-539   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg183:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg184
 mov ax, 29
 jmp .retncheckreg
.checkreg184:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg185
 mov ax, 31
 jmp .retncheckreg

;-540   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg185:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg186
 mov ax, 33
 jmp .retncheckreg
.checkreg186:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg187
 mov ax, 35
 jmp .retncheckreg

;-541   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg187:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg188
 mov ax, 37
 jmp .retncheckreg
.checkreg188:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg189
 mov ax, 39
 jmp .retncheckreg

;-542   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg189:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg190
 mov ax, 41
 jmp .retncheckreg
.checkreg190:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg191
 mov ax, 43
 jmp .retncheckreg

;-543   // (eqstr(symbol,"ip")) return 45;


;-544   if (strlen(symbol) >   3) return 0;

.checkreg191:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg192
 mov ax, 0
 jmp .retncheckreg

;-545   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg192:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg193
 mov ax, 47
 jmp .retncheckreg
.checkreg193:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg194
 mov ax, 50
 jmp .retncheckreg

;-546   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg194:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg195
 mov ax, 53
 jmp .retncheckreg
.checkreg195:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg196
 mov ax, 56
 jmp .retncheckreg

;-547   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg196:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg197
 mov ax, 59
 jmp .retncheckreg
.checkreg197:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 62
 jmp .retncheckreg

;-548   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg198:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 65
 jmp .retncheckreg
.checkreg199:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 68
 jmp .retncheckreg

;-549   if (eqstr(symbol,"cr0")) return 71;

.checkreg200:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 71
 jmp .retncheckreg

;-550   return 0;   }

.checkreg201:
 mov ax, 0
 jmp .retncheckreg

;-551 


;-552 char printregstr[]

 .retncheckreg:
 ret
checkreg_0 db "al",0
checkreg_1 db "cl",0
checkreg_2 db "dl",0
checkreg_3 db "bl",0
checkreg_4 db "ah",0
checkreg_5 db "ch",0
checkreg_6 db "dh",0
checkreg_7 db "bh",0
checkreg_8 db "ax",0
checkreg_9 db "cx",0
checkreg_10 db "dx",0
checkreg_11 db "bx",0
checkreg_12 db "sp",0
checkreg_13 db "bp",0
checkreg_14 db "si",0
checkreg_15 db "di",0
checkreg_16 db "es",0
checkreg_17 db "cs",0
checkreg_18 db "ss",0
checkreg_19 db "ds",0
checkreg_20 db "fs",0
checkreg_21 db "gs",0
checkreg_22 db "eax",0
checkreg_23 db "ecx",0
checkreg_24 db "edx",0
checkreg_25 db "ebx",0
checkreg_26 db "esp",0
checkreg_27 db "ebp",0
checkreg_28 db "esi",0
checkreg_29 db "edi",0
checkreg_30 db "cr0",0
ENDP

;-553 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-554 


;-555 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-556   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   555 NULL i = bp+4
;  201 var unsg word   555 NULL k = bp-2
;  202 var unsg byte   555 NULL c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]

;-557   k = &printregstr + i; c=*k; prc(c);

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-558   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg202
 inc  word[bp+4]
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-559 }

.printreg202:

;-560 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
ENDP
evalue dw 0
exprtype dw 10

;-561 int expr(int isRight)


expr: PROC

;-562 { int mode; int id1;     int ixarr; int ixconst;


;-563   int ids;  int isCONST; int i;     unsigned char *p;


;-564   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   561 NULL isRight = bp+4
;  201 var sign word   562 NULL mode = bp-2
;  202 var sign word   562 NULL id1 = bp-4
;  203 var sign word   562 NULL ixarr = bp-6
;  204 var sign word   562 NULL ixconst = bp-8
;  205 var sign word   563 NULL ids = bp-10
;  206 var sign word   563 NULL isCONST = bp-12
;  207 var sign word   563 NULL i = bp-14
;  208 ptr unsg byte   563 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr203
 mov ax, [lexval]
 mov word [evalue], ax

;-565     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-566   mode=typeName(); /*0=V,1=*,2=&*/

.expr203:
 call typeName
 mov [bp-2], ax

;-567   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-568   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr204
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-569   if (token=='(')  {docall1(); goto e1; }

.expr204:
 mov ax, [token]
 cmp ax, 40
 jne .expr205
 call docall1
 jmp .e1

;-570   if (isreg()) goto e1;

.expr205:
 call isreg
 or  al, al
 je .expr206
 jmp .e1

;-571 


;-572   id1=searchname(); gettypes(id1); ids=signi;

.expr206:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-573   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-574     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr207
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr208

;-575       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-576     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr209
.expr208:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-577     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-578     if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr210
 push expr_1
 call error1
 add  sp, 2
.expr210:
.expr209:

;-579   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

.expr207:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr211
 mov ax, [bp-2]
 or  al, al
 je .expr212
 push expr_2
 call error1
 add  sp, 2

;-580      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr212:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr213
 push expr_4
 call prs
 add  sp, 2
 jmp .expr214
.expr213:
 push expr_5
 call prs
 add  sp, 2

;-581      v(id1); goto e1;}

.expr214:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-582   if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

.expr211:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr215
 mov ax, [bp-2]
 or  al, al
 je .expr216
 push expr_6
 call error1
 add  sp, 2

;-583      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr216:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr217
 push expr_8
 call prs
 add  sp, 2
 jmp .expr218
.expr217:
 push expr_9
 call prs
 add  sp, 2

;-584      v(id1); goto e1;}

.expr218:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-585 


;-586   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr215:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr219
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-587   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr219:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr220
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-588   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr220:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr221
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-589   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr221:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr222
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-590   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr222:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr223
 push expr_14
 call error1
 add  sp, 2

;-591   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr223:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr224
 push expr_15
 call error1
 add  sp, 2

;-592 


;-593   if (istoken('=')) { exprtype= expr(1);

.expr224:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr225
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-594   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-595   dovar1(mode, "mov", ixarr, id1);

.expr225:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-596 


;-597 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr226
 push expr_17
 call rterm
 add  sp, 2

;-598   else if (istoken('-')) rterm("sub" );

 jmp .expr227
.expr226:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr228
 push expr_18
 call rterm
 add  sp, 2

;-599   else if (istoken('&')) rterm("and" );

 jmp .expr229
.expr228:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr230
 push expr_19
 call rterm
 add  sp, 2

;-600   else if (istoken('|')) rterm("or" );

 jmp .expr231
.expr230:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr232
 push expr_20
 call rterm
 add  sp, 2

;-601   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr233
.expr232:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr234
 push expr_21
 call rterm
 add  sp, 2

;-602   else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr235
.expr234:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr236
 push expr_22
 call rterm
 add  sp, 2

;-603   else if (istoken('*')) domul (ids);

 jmp .expr237
.expr236:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr238
 push word [bp-10]
 call domul
 add  sp, 2

;-604   else if (istoken('/')) doidiv(ids);

 jmp .expr239
.expr238:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr240
 push word [bp-10]
 call doidiv
 add  sp, 2

;-605   else if (istoken('%')) domod (ids);

 jmp .expr241
.expr240:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr242
 push word [bp-10]
 call domod
 add  sp, 2

;-606   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr242:
.expr241:
.expr239:
.expr237:
.expr235:
.expr233:
.expr231:
.expr229:
.expr227:
 call isrelational
 or  al, al
 je .expr243
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-607   return 0;

.expr243:
 mov ax, 0
 jmp .retnexpr

;-608 }


;-609 


;-610 int compoundass(char *op, int mode, int id1) {

 .retnexpr: LEAVE
 ret
expr_0 db "\n mov ax, ",0
expr_1 db "Array index must be number or int",0
expr_2 db "Only var allowed",0
expr_3 db "\n inc  ",0
expr_4 db "word",0
expr_5 db "byte",0
expr_6 db "Only var allowed",0
expr_7 db "\n dec  ",0
expr_8 db "word",0
expr_9 db "byte",0
expr_10 db "add",0
expr_11 db "sub",0
expr_12 db "and",0
expr_13 db "or",0
expr_14 db "not implemented",0
expr_15 db "not implemented",0
expr_16 db "mov",0
expr_17 db "add",0
expr_18 db "sub",0
expr_19 db "and",0
expr_20 db "or",0
expr_21 db "shl",0
expr_22 db "shr",0
expr_23 db "cmp",0
ENDP

compoundass: PROC

;-611   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   610 NULL op = bp+4
;  201 var sign word   610 NULL mode = bp+6
;  202 var sign word   610 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass244
 push compoundass_0
 call error1
 add  sp, 2

;-612   prnl(); prs(op); prs("  ");

.compoundass244:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-613   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass245
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass246
.compoundass245:
 push compoundass_3
 call prs
 add  sp, 2

;-614   v(id1); prs(", ");

.compoundass246:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-615   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-616 }


;-617 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-618   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   617 NULL mode = bp+4
;  201 var sign word   617 NULL op = bp+6
;  202 var sign word   617 NULL ixarr = bp+8
;  203 var sign word   617 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-619   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1247
 push dovar1_0
 call prs
 add  sp, 2
 push word [bp+10]
 call v
 add  sp, 2
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-620     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1248
 push dovar1_1
 call prs
 add  sp, 2

;-621     if(widthi == 2) prs(" ax, [bx]");

.dovar1248:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1249
 push dovar1_2
 call prs
 add  sp, 2

;-622     return; }

.dovar1249:
 jmp .retndovar1

;-623   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1247:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1250
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2
 push dovar1_3
 call prs
 add  sp, 2
 push word [bp+10]
 call a
 add  sp, 2
 jmp .retndovar1

;-624   if (ixarr) {

.dovar1250:
 mov ax, [bp+8]
 or  al, al
 je .dovar1251

;-625     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-626     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1252
 push dovar1_5
 call prs
 add  sp, 2

;-627     prs("\n "); prs(op);

.dovar1252:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-628     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1253
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1254
.dovar1253:
 push dovar1_8
 call prs
 add  sp, 2

;-629 // v(id1); prs(" [bx]");


;-630     prc('['); printName(id1); prs(" + bx]");

.dovar1254:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-631     return; }

 jmp .retndovar1

;-632   prnl();prs(op);

.dovar1251:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-633   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1255
 push dovar1_10
 call prs
 add  sp, 2

;-634   if(wi==2) prs(" ax, ");

.dovar1255:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1256
 push dovar1_11
 call prs
 add  sp, 2

;-635   if(wi==4) prs(" eax, ");

.dovar1256:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1257
 push dovar1_12
 call prs
 add  sp, 2

;-636   v(id1);

.dovar1257:
 push word [bp+10]
 call v
 add  sp, 2

;-637 }


;-638 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

 .retndovar1: LEAVE
 ret
dovar1_0 db "\n mov bx, ",0
dovar1_1 db " al, [bx]\n mov ah, 0",0
dovar1_2 db " ax, [bx]",0
dovar1_3 db " ax, ",0
dovar1_4 db "\n mov bx, ",0
dovar1_5 db "\n shl bx, 1",0
dovar1_6 db "\n ",0
dovar1_7 db " ax, ",0
dovar1_8 db " al, ",0
dovar1_9 db " + bx]",0
dovar1_10 db " al, ",0
dovar1_11 db " ax, ",0
dovar1_12 db " eax, ",0
ENDP

rterm: PROC

;-639   if (istoken(T_CONST)) { prnl(); prs(op);

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   638 NULL op = bp+4
;  201 var sign word   638 NULL mode = bp-2
;  202 var sign word   638 NULL opint = bp-4
;  203 var sign word   638 NULL ixarr = bp-6
;  204 var sign word   638 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm258
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-640     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm259
 push rterm_0
 call prs
 add  sp, 2

;-641     if (wi==2) prs(" ax, ");

.rterm259:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm260
 push rterm_1
 call prs
 add  sp, 2

;-642     if (wi==4) prs(" eax, ");

.rterm260:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm261
 push rterm_2
 call prs
 add  sp, 2

;-643     prunsign1(lexval); return;}

.rterm261:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-644   mode=typeName(); id1=searchname(); ixarr=0;

.rterm258:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-645   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm262
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-646     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-647     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm263
 push rterm_3
 call error1
 add  sp, 2
.rterm263:

;-648   if (eqstr(symbol,"_AX")) return;

.rterm262:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm264
 jmp .retnrterm

;-649   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm264:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-650 }


;-651 int isreg() {

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
ENDP

isreg: PROC

;-652   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg265
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-653   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg265:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg266
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-654   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg266:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg267
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-655   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg267:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg268
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-656   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg268:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg269
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-657   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg269:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg270
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-658   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg270:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg271
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-659   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg271:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg272
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-660   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg272:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg273
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-661   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg273:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg274
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-662   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg274:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg275
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-663   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg275:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg276
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-664   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg276:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg277
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-665   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg277:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg278
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-666   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg278:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg279
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-667   return 0;   r1: return 1;

.isreg279:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-668 }


;-669 int doreg(char *dr) { int i; expect('=');

 .retnisreg:
 ret
isreg_0 db "_AH",0
isreg_1 db "ah",0
isreg_2 db "_AL",0
isreg_3 db "al",0
isreg_4 db "_AX",0
isreg_5 db "ax",0
isreg_6 db "_BH",0
isreg_7 db "bh",0
isreg_8 db "_BL",0
isreg_9 db "bl",0
isreg_10 db "_BX",0
isreg_11 db "bx",0
isreg_12 db "_CH",0
isreg_13 db "ch",0
isreg_14 db "_CL",0
isreg_15 db "cl",0
isreg_16 db "_CX",0
isreg_17 db "cx",0
isreg_18 db "_DH",0
isreg_19 db "dh",0
isreg_20 db "_DL",0
isreg_21 db "dl",0
isreg_22 db "_DX",0
isreg_23 db "dx",0
isreg_24 db "_SI",0
isreg_25 db "si",0
isreg_26 db "_DI",0
isreg_27 db "di",0
isreg_28 db "_FLAGS",0
isreg_29 db "flags",0
ENDP

doreg: PROC
;Function : doreg, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   669 NULL dr = bp+4
;  201 var sign word   669 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-670   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-671        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg280
 push word [lexval]
 call prunsign1
 add  sp, 2

;-672   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg281
.doreg280:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg282
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-673   else error1("only number or var allowed"); }

 jmp .doreg283
.doreg282:
 push doreg_2
 call error1
 add  sp, 2
.doreg283:
.doreg281:

;-674 


;-675 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

doassign: PROC

;-676   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   675 NULL mode = bp+4
;  201 var sign word   675 NULL i = bp+6
;  202 var sign word   675 NULL ixarr = bp+8
;  203 var sign word   675 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-677   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign284
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-678     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign285
 push doassign_1
 call prs
 add  sp, 2

;-679     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign286
.doassign285:
 push doassign_2
 call prs
 add  sp, 2
.doassign286:
 jmp .retndoassign

;-680   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign284:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign287
 push doassign_3
 call prs
 add  sp, 2
 push word [bp+6]
 call a
 add  sp, 2
 push doassign_4
 call prs
 add  sp, 2
 jmp .retndoassign

;-681   if (ixarr) {  prs("\n mov bx, ");

.doassign287:
 mov ax, [bp+8]
 or  al, al
 je .doassign288
 push doassign_5
 call prs
 add  sp, 2

;-682     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign289
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign290
.doassign289:
 push word [bp+8]
 call v
 add  sp, 2

;-683     if (wi==2) prs("\n shl bx, 1");

.doassign290:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign291
 push doassign_6
 call prs
 add  sp, 2

;-684     prs("\n mov ["); printName(i);

.doassign291:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-685     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign292
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign293
.doassign292:
 push doassign_9
 call prs
 add  sp, 2
.doassign293:
 jmp .retndoassign

;-686   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign288:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign294
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign295
 push doassign_11
 call prs
 add  sp, 2

;-687     } v(i); prs(", al"); return; }

.doassign295:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-688   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign294:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign296
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign297
 push doassign_14
 call prs
 add  sp, 2

;-689     } v(i); prs(", ax"); return; }

.doassign297:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-690   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign296:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign298
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign299
 push doassign_17
 call prs
 add  sp, 2

;-691     } v(i); prs(", eax"); return; }

.doassign299:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-692 }

.doassign298:

;-693 int domul(int ids) {

 .retndoassign: LEAVE
 ret
doassign_0 db "\n mov  bx, ",0
doassign_1 db "\n mov  [bx], ax",0
doassign_2 db "\n mov  [bx], al",0
doassign_3 db "\n mov  ",0
doassign_4 db ", ax",0
doassign_5 db "\n mov bx, ",0
doassign_6 db "\n shl bx, 1",0
doassign_7 db "\n mov [",0
doassign_8 db "+bx], ax",0
doassign_9 db "+bx], al",0
doassign_10 db "\n mov ",0
doassign_11 db "byte ",0
doassign_12 db ", al",0
doassign_13 db "\n mov ",0
doassign_14 db "word ",0
doassign_15 db ", ax",0
doassign_16 db "\n mov ",0
doassign_17 db "dword ",0
doassign_18 db ", eax",0
ENDP

domul: PROC

;-694   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   693 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul300
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul301
.domul300:

;-695   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul302

;-696     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-697     }


;-698   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul303
.domul302:
 push domul_3
 call error1
 add  sp, 2
.domul303:
.domul301:

;-699 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-700   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   699 NULL ids = bp+4
;  201 var sign word   699 NULL mode = bp-2
;  202 var sign word   699 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv304

;-701     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-702     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv305
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv306
.doidiv305:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv306:

;-703   else {

 jmp .doidiv307
.doidiv304:

;-704     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-705     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv308
 push doidiv_3
 call error1
 add  sp, 2

;-706     gettypes(id1);

.doidiv308:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-707     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv309
 push doidiv_4
 call error1
 add  sp, 2

;-708     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv309:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv310
 push doidiv_5
 call error1
 add  sp, 2

;-709     prs("\n mov bx, "); v(id1);

.doidiv310:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-710     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv311
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv312
.doidiv311:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv312:

;-711 }

.doidiv307:

;-712 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
 LEAVE
 ret
doidiv_0 db "\n mov bx, ",0
doidiv_1 db "\n cwd\n idiv bx",0
doidiv_2 db "\n mov dx, 0\n div bx",0
doidiv_3 db "only const number or int as divisor allowed",0
doidiv_4 db "only int as simple var divisor allowed",0
doidiv_5 db "only int, no byte as divisor allowed",0
doidiv_6 db "\n mov bx, ",0
doidiv_7 db "\n cwd\n idiv bx",0
doidiv_8 db "\n mov dx, 0\n div bx",0
ENDP

domod: PROC
;Function : domod, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   712 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-713 


;-714 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 47411
docalltype resw 10
section .text
section .bss
absolute 47431
docallvalue resw 10
section .text

;-715 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 47451
procname resb 17
section .text

;-716 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-717   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   716 NULL i = bp-2
;  201 var sign word   716 NULL narg = bp-4
;  202 var sign word   716 NULL t0 = bp-6
;  203 var sign word   716 NULL n0 = bp-8
;  204 var sign word   716 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-718   checknamelen();

 call checknamelen

;-719   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-720   storecall();

 call storecall

;-721   expect('(');

 push 40
 call expect
 add  sp, 2

;-722 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1313

;-723 	  do { narg++;

.docall1314:
 inc  word[bp-4]

;-724 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1315
 push docall1_0
 call error1
 add  sp, 2
.docall1315:
 mov ax, 0
 mov [bp-6], ax

;-725       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1316
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-726       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1316:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1317
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-727         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

 push docall1_1
 call eprs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
 push 95
 call eprc
 add  sp, 2
 push word [nconst]
 call eprnum
 add  sp, 2
 push docall1_2
 call eprs
 add  sp, 2

;-728         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

 push 34
 call eprc
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
 push 34
 call eprc
 add  sp, 2
 push docall1_3
 call eprs
 add  sp, 2
 inc  word[nconst]

;-729       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1317:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1318
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-730       if(istoken(T_NAME))  { n0=checkreg();

.docall1318:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1319
 call checkreg
 mov [bp-8], ax

;-731         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1320
 mov ax, 5
 mov [bp-6], ax

;-732         else {t0=4; n0=searchname();

 jmp .docall1321
.docall1320:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-733           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1322
 mov ax, 3
 mov [bp-6], ax
.docall1322:
.docall1321:

;-734       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1319:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1323
 push docall1_4
 call error1
 add  sp, 2

;-735       docalltype [narg] = t0;

.docall1323:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-736       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-737     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1324
 jmp .docall1314
.docall1324:

;-738 


;-739   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-740     do {

.docall1325:

;-741       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-742       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-743       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1326
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-744       if(t0==2){ prs("\n push ");

.docall1326:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1327
 push docall1_6
 call prs
 add  sp, 2

;-745         prs(fname);prc(95);prunsign1(n0);}

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push 95
 call prc
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-746       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1327:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1328
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-747         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-748       if(t0==4){ gettypes(n0);

.docall1328:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1329
 push word [bp-8]
 call gettypes
 add  sp, 2

;-749         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1330
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-750         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1331
.docall1330:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-751         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1331:

;-752       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1329:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1332
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1333
 mov ax, [bp-10]
 add ax, 2
.docall1333:

;-753    i--; } while (i > 0);  }

.docall1332:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1334
 jmp .docall1325
.docall1334:

;-754 	 prs("\n call "); prs(&procname);

.docall1313:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-755 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1335
 push docall1_14
 call prs
 add  sp, 2

;-756      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2
.docall1335:

;-757 /***************************************************************/


;-758 


;-759 int doemit() {prs("\n db ");
 LEAVE
 ret
docall1_0 db "Max. 9 parameters",0
docall1_1 db "\n",0
docall1_2 db " db ",0
docall1_3 db ",0",0
docall1_4 db "parameter not recognized (no * allowed)",0
docall1_5 db "\n push ",0
docall1_6 db "\n push ",0
docall1_7 db "\n lea  ax, ",0
docall1_8 db "\n push ax",0
docall1_9 db "\n push word ",0
docall1_10 db "\n mov al, byte ",0
docall1_11 db "\n mov ah, 0\n push ax",0
docall1_12 db "\n push ",0
docall1_13 db "\n call ",0
docall1_14 db "\n add  sp, ",0
ENDP

doemit: PROC
 push doemit_0
 call prs
 add  sp, 2

;-760   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-761     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit336
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit336:
 push 41
 call expect
 add  sp, 2

;-762 


;-763 int cmpneg(int ids) {

 ret
doemit_0 db "\n db ",0
ENDP

cmpneg: PROC

;-764        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   763 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg337
 push cmpneg_0
 call prs
 add  sp, 2

;-765   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg338
.cmpneg337:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg339
 push cmpneg_1
 call prs
 add  sp, 2

;-766   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg340
.cmpneg339:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg341
 mov ax, [bp+4]
 or  al, al
 je .cmpneg342
 push cmpneg_2
 call prs
 add  sp, 2

;-767                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg343
.cmpneg342:
 push cmpneg_3
 call prs
 add  sp, 2

;-768   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg343:
 jmp .cmpneg344
.cmpneg341:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg345
 mov ax, [bp+4]
 or  al, al
 je .cmpneg346
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-769                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-770                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg347
.cmpneg346:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-771                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-772   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg347:
 jmp .cmpneg348
.cmpneg345:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg349
 push cmpneg_8
 call prs
 add  sp, 2

;-773   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg350
.cmpneg349:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg351
 push cmpneg_9
 call prs
 add  sp, 2

;-774   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg352
.cmpneg351:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg352:
.cmpneg350:
.cmpneg348:
.cmpneg344:
.cmpneg340:
.cmpneg338:

;-775 


;-776 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
 LEAVE
 ret
cmpneg_0 db "\n jne .",0
cmpneg_1 db "\n je  .",0
cmpneg_2 db "\n jg  .",0
cmpneg_3 db "\n ja  .",0
cmpneg_4 db " ;unsigned : ",0
cmpneg_5 db "\n jl  .",0
cmpneg_6 db " ;unsigned : ",0
cmpneg_7 db "\n jb  .",0
cmpneg_8 db "\n jge .",0
cmpneg_9 db "\n jle .",0
cmpneg_10 db "internal error compare unknown in CMPNEG()",0
ENDP

prlabel: PROC
;Function : prlabel, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   776 NULL n = bp+4;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-777 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   777 NULL n = bp+4;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-778 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

doif: PROC
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   778 NULL jdest = bp-2
;  201 var sign word   778 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-779   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-780   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif353
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-781     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

 push word [bp-4]
 call prjump
 add  sp, 2
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt
 push word [bp-4]
 call prlabel
 add  sp, 2

;-782   else prlabel(jdest); }

 jmp .doif354
.doif353:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif354:

;-783 


;-784 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
ENDP

dodo: PROC

;-785   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   784 NULL jdest = bp-2
;  201 var sign word   784 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-786   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

 push 515
 call expect
 add  sp, 2
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2

;-787   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-788 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
ENDP

dowhile: PROC
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   788 NULL jdest = bp-2
;  201 var sign word   788 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-789   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

 push word [bp-2]
 call prlabel
 add  sp, 2
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2

;-790   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-791 int isrelational() {
 LEAVE
 ret
ENDP

isrelational: PROC

;-792   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational355
 jmp .w
.isrelational355:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational356
 jmp .w

;-793   if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational356:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational357
 jmp .w
.isrelational357:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational358
 jmp .w

;-794   if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational358:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational359
 jmp .w
.isrelational359:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational360
 jmp .w

;-795   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational360:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-796 


;-797 char symboltemp[80];

 .retnisrelational:
 ret
ENDP
section .bss
absolute 47468
symboltemp resb 80
section .text

;-798 int getlex() { char c; char *p;


getlex: PROC

;-799 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   798 NULL c = bp-2
;  201 ptr sign byte   798 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex361
 mov ax, 0
 jmp .retngetlex
.getlex361:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex362
 jmp .g1

;-800   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex362:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex363
 mov al, [thechar]
 cmp al, 61
 jne .getlex364
 call next
 mov ax, 806
 jmp .retngetlex
.getlex364:

;-801   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex363:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex365
 mov al, [thechar]
 cmp al, 61
 jne .getlex366
 call next
 mov ax, 807
 jmp .retngetlex
.getlex366:

;-802   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex365:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex367
 mov al, [thechar]
 cmp al, 61
 jne .getlex368
 call next
 mov ax, 824
 jmp .retngetlex
.getlex368:

;-803   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex367:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex369
 mov al, [thechar]
 cmp al, 61
 jne .getlex370
 call next
 mov ax, 811
 jmp .retngetlex
.getlex370:

;-804   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex369:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex371
 mov al, [thechar]
 cmp al, 60
 jne .getlex372
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex372:

;-805   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex371:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex373
 mov al, [thechar]
 cmp al, 62
 jne .getlex374
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex374:

;-806   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex373:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex375
 mov al, [thechar]
 cmp al, 43
 jne .getlex376
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex376:

;-807   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex375:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex377
 mov al, [thechar]
 cmp al, 45
 jne .getlex378
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex378:

;-808   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex377:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex379
 mov al, [thechar]
 cmp al, 61
 jne .getlex380
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex380:

;-809   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex379:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex381
 mov al, [thechar]
 cmp al, 61
 jne .getlex382
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex382:

;-810   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex381:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex383
 mov al, [thechar]
 cmp al, 61
 jne .getlex384
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex384:

;-811   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex383:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex385
 mov al, [thechar]
 cmp al, 61
 jne .getlex386
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex386:

;-812   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex385:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex387
 mov al, [thechar]
 cmp al, 61
 jne .getlex388
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex388:

;-813   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex387:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex389
 mov al, [thechar]
 cmp al, 61
 jne .getlex390
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex390:

;-814   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex389:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex391
 mov al, [bp-2]
 jmp .retngetlex

;-815   if (c == '/') { if (thechar == '/') {

.getlex391:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex392
 mov al, [thechar]
 cmp al, 47
 jne .getlex393

;-816       do c=next(); while(ifEOL(c)==0) return getlex(); } }

.getlex394:
 call next
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex395
 jmp .getlex394
.getlex395:
 call getlex
 jmp .retngetlex
.getlex393:

;-817   if (c == '/') { if (thechar == '*') {

.getlex392:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex396
 mov al, [thechar]
 cmp al, 42
 jne .getlex397

;-818       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex398
 jmp .g2
.getlex398:
 mov al, [thechar]
 cmp al, 47
 je  .getlex399
 jmp .g2

;-819       c=next(); return getlex(); } else  return '/'; }

.getlex399:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex400
.getlex397:
 mov ax, 47
 jmp .retngetlex
.getlex400:

;-820   if (c == '"') {getstring(c); return T_STRING;}

.getlex396:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex401
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-821   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex401:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex402
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-822   if (c==39) { lexval=next();

.getlex402:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex403
 call next
 mov word [lexval], ax

;-823     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex404
 call next
 mov word [lexval], ax

;-824       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex405
 mov ax, 10
 mov word [lexval], ax
.getlex405:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex406
 mov ax, 9
 mov word [lexval], ax

;-825       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex406:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex407
 mov ax, 0
 mov word [lexval], ax
.getlex407:
.getlex404:
 call next
 mov ax, 257
 jmp .retngetlex

;-826   if (alnum(c)) {

.getlex403:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex408

;-827     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
 mov ax, symbol
 mov [bp-4], ax
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-828     while(alnum(thechar)) {c=next(); *p=c;  p++; }

.getlex409:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex410
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-829       *p=0;

 jmp .getlex409
.getlex410:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-830     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex411
 mov ax, 531
 jmp .retngetlex

;-831     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex411:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex412
 mov ax, 532
 jmp .retngetlex

;-832     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex412:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex413
 mov ax, 529
 jmp .retngetlex

;-833     if (eqstr(symbol,"int"     )) return T_INT;

.getlex413:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex414
 mov ax, 517
 jmp .retngetlex

;-834     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex414:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex415
 mov ax, 533
 jmp .retngetlex

;-835     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex415:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex416
 mov ax, 530
 jmp .retngetlex

;-836     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex416:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex417
 mov ax, 518
 jmp .retngetlex

;-837     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex417:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex418
 mov ax, 519
 jmp .retngetlex

;-838     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex418:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex419
 mov ax, 520
 jmp .retngetlex

;-839     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex419:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex420
 mov ax, 512
 jmp .retngetlex

;-840     if (eqstr(symbol,"if"      )) return T_IF;

.getlex420:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex421
 mov ax, 513
 jmp .retngetlex

;-841     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex421:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex422
 mov ax, 514
 jmp .retngetlex

;-842     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex422:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex423
 mov ax, 515
 jmp .retngetlex

;-843     if (eqstr(symbol,"do"      )) return T_DO;

.getlex423:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex424
 mov ax, 516
 jmp .retngetlex

;-844     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex424:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex425
 mov ax, 521
 jmp .retngetlex

;-845     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex425:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex426
 mov ax, 511
 jmp .retngetlex

;-846     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex426:
 call convertdefine
 or  al, al
 je .getlex427
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-847     return T_NAME; } error1("Input item not recognized"); }

.getlex427:
 mov ax, 256
 jmp .retngetlex
.getlex408:
 push getlex_17
 call error1
 add  sp, 2

;-848 


;-849 int convertdefine() { int i; int j;   i=0;

 .retngetlex: LEAVE
 ret
getlex_0 db "()[]{},;*:%-><=+!&|#?",0
getlex_1 db "signed",0
getlex_2 db "unsigned",0
getlex_3 db "void",0
getlex_4 db "int",0
getlex_5 db "long",0
getlex_6 db "char",0
getlex_7 db "asm",0
getlex_8 db "__asm",0
getlex_9 db "__emit__",0
getlex_10 db "return",0
getlex_11 db "if",0
getlex_12 db "else",0
getlex_13 db "while",0
getlex_14 db "do",0
getlex_15 db "goto",0
getlex_16 db "define",0
getlex_17 db "Input item not recognized",0
ENDP

convertdefine: PROC
;Function : convertdefine, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   849 NULL i = bp-2
;  201 var sign word   849 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-850   while (i < GTop) {

.convertdefine428:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine429

;-851    j=adrofname(i);

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-852    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine430
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine431
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-853    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine431:

;-854    i++; }

.convertdefine430:
 inc  word[bp-2]

;-855    return 0; }

 jmp .convertdefine428
.convertdefine429:
 mov ax, 0
 jmp .retnconvertdefine

;-856 


;-857 int getdigit(char c) { int i;

 .retnconvertdefine: LEAVE
 ret
ENDP

getdigit: PROC

;-858     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   857 NULL c = bp+4
;  201 var sign word   857 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-859     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit432
 mov ax, 88
 mov byte [thechar], al
.getdigit432:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit433
 call next

;-860       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit434:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit435
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit436
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-861 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit436:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit437
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit437:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-862      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-863     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

 jmp .getdigit434
.getdigit435:
 jmp .getdigit438
.getdigit433:
.getdigit439:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit440
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-864      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit439
.getdigit440:

;-865 }

.getdigit438:

;-866 


;-867 int stmt() { int c; char cha;
 LEAVE
 ret
ENDP

stmt: PROC

;-868        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   867 NULL c = bp-2
;  201 var sign byte   867 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt441
.stmt442:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt443
 call stmt
 jmp .stmt442
.stmt443:

;-869   else if(istoken(T_IF))    doif();

 jmp .stmt444
.stmt441:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt445
 call doif

;-870   else if(istoken(T_DO))    dodo();

 jmp .stmt446
.stmt445:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt447
 call dodo

;-871   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt448
.stmt447:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt449
 call dowhile

;-872   else if(istoken(T_GOTO))  {

 jmp .stmt450
.stmt449:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt451

;-873     prs("\n jmp .");name1();prs(symbol);expect(';');}

 push stmt_0
 call prs
 add  sp, 2
 call name1
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-874   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt452
.stmt451:
 mov ax, [token]
 cmp ax, 518
 jne .stmt453
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-875         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt454:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt455
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt454
.stmt455:
 call getlex
 mov word [token], ax

;-876   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();

 jmp .stmt456
.stmt453:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt457
 mov ax, [token]
 cmp ax, 123
 jne .stmt458
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-877         while(cha!= '}') { prc(cha); cha=next(); }

.stmt459:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt460
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-878         token=getlex(); }

 jmp .stmt459
.stmt460:
 call getlex
 mov word [token], ax

;-879         else error1("Curly open expected");

 jmp .stmt461
.stmt458:
 push stmt_3
 call error1
 add  sp, 2

;-880         }

.stmt461:

;-881   else if(istoken(T_EMIT))   doemit();

 jmp .stmt462
.stmt457:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt463
 call doemit

;-882   else if(istoken(';'))      { }

 jmp .stmt464
.stmt463:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt465

;-883   else if(istoken(T_RETURN)) {

 jmp .stmt466
.stmt465:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt467

;-884         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt468
 push 0
 call expr
 add  sp, 2

;-885         prs("\n jmp .retn");

.stmt468:
 push stmt_4
 call prs
 add  sp, 2

;-886         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-887         nreturn++;

 inc  word[nreturn]

;-888         expect(';');

 push 59
 call expect
 add  sp, 2

;-889         }


;-890   else if(thechar==':')      {

 jmp .stmt469
.stmt467:
 mov al, [thechar]
 cmp al, 58
 jne .stmt470

;-891         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-892         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-893         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-894         expect(':');

 push 58
 call expect
 add  sp, 2

;-895         }


;-896   else  {expr(0);; expect(';'); }

 jmp .stmt471
.stmt470:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-897 }

.stmt471:
.stmt469:
.stmt466:
.stmt464:
.stmt462:
.stmt456:
.stmt452:
.stmt450:
.stmt448:
.stmt446:
.stmt444:

;-898 


;-899 int getstring(int delim) {
 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n jmp .retn",0
stmt_5 db "\n.",0
ENDP

getstring: PROC

;-900     int c; char *p;


;-901     p=&symbol;

;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   899 NULL delim = bp+4
;  201 var sign word   900 NULL c = bp-2
;  202 ptr sign byte   900 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax

;-902     c=next();

 call next
 mov [bp-2], ax

;-903     while (c != delim) {

.getstring472:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring473

;-904         *p=c;

 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-905         p++;

 inc  word[bp-4]

;-906         c=next();

 call next
 mov [bp-2], ax

;-907     }


;-908     *p=0;

 jmp .getstring472
.getstring473:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-909 }


;-910 


;-911 int fgets1() {
 LEAVE
 ret
ENDP

fgets1: PROC

;-912     char c;


;-913     c=*fgetsp;

;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   912 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-914     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1474

;-915         printinputline();

 call printinputline

;-916         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1475
 mov ax, 0
 jmp .retnfgets1

;-917         fgetsp=&fgetsdest;

.fgets1475:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-918         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-919         column=0;

 mov ax, 0
 mov word [column], ax

;-920     }


;-921     fgetsp++;

.fgets1474:
 inc  word[fgetsp]

;-922     column++;

 inc  word[column]

;-923     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-924 }


;-925 int printinputline() {

 .retnfgets1: LEAVE
 ret
ENDP

printinputline: PROC

;-926     int col;


;-927     col=0;

;Function : printinputline, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   926 NULL col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-928     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-929     do {

.printinputline476:

;-930         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-931         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline477
 jmp .retnprintinputline

;-932         *fgetsp=DOS_ByteRead;

.printinputline477:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-933         fgetsp++;

 inc  word[fgetsp]

;-934         col++;

 inc  word[bp-2]

;-935         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline478
 push printinputline_0
 call error1
 add  sp, 2

;-936         }

.printinputline478:

;-937         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline479
 jmp .printinputline476
.printinputline479:

;-938     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-939     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline480

;-940         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-941         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-942         prc(' ');

 push 32
 call prc
 add  sp, 2

;-943         lineno++;

 inc  word[lineno]

;-944         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-945         }


;-946 }

.printinputline480:

;-947 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

ifEOL: PROC

;-948     if (c == 10) return 1;//LF

;Function : ifEOL, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   947 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL481
 mov ax, 1
 jmp .retnifEOL

;-949     if (c == 13) {//CR

.ifEOL481:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL482

;-950         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL483
 call next
 mov [bp+4], al

;-951         return 1;

.ifEOL483:
 mov ax, 1
 jmp .retnifEOL

;-952     }


;-953     return 0;

.ifEOL482:
 mov ax, 0
 jmp .retnifEOL

;-954 }


;-955 


;-956 int end1(int n) {

 .retnifEOL: LEAVE
 ret
ENDP

end1: PROC

;-957     fcloseR(fdin);

;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   956 NULL n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-958     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-959     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-960 }


;-961 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-962     lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   961 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-963     prnl();

 call prnl

;-964     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-965     prs(";Line: ");

 push error1_0
 call prs
 add  sp, 2

;-966     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-967     prs(" ************** ERROR: ");

 push error1_1
 call prs
 add  sp, 2

;-968     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-969     prs("  in column: ");

 push error1_2
 call prs
 add  sp, 2

;-970     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-971     prs("\nToken: ");

 push error1_3
 call prs
 add  sp, 2

;-972     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-973 //    prs(", globC: ");


;-974 //    prc(globC);


;-975 //    prs(", thechar: ");


;-976 //    prunsign1(thechar);


;-977     prs(", symbol: ");

 push error1_4
 call prs
 add  sp, 2

;-978     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-979     end1(1);

 push 1
 call end1
 add  sp, 2

;-980 }


;-981 int listproc() {
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP

listproc: PROC

;-982     int i;


;-983     if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   982 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle .listproc484

;-984         prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-985         prs(", Number of local variables: ");

 push listproc_1
 call prs
 add  sp, 2

;-986         i=LTop - LSTART;

 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax

;-987         prunsign1(i);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-988         prs("\n;   # type sign width addr used name");

 push listproc_2
 call prs
 add  sp, 2

;-989         prs("   list of local variables");

 push listproc_3
 call prs
 add  sp, 2

;-990         i=LSTART;

 mov ax, 200
 mov [bp-2], ax

;-991         while (i < LTop) {

.listproc485:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc486

;-992             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2

;-993             i++;

 inc  word[bp-2]

;-994             }


;-995         }

 jmp .listproc485
.listproc486:

;-996 }

.listproc484:

;-997 int listcall() {
 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name",0
listproc_3 db "   list of local variables",0
ENDP

listcall: PROC

;-998     int i;


;-999     prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   998 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-1000     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1001     while (i< CTop) {

.listcall487:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .listcall488

;-1002         calllisting(i);

 push word [bp-2]
 call calllisting
 add  sp, 2

;-1003         i++;

 inc  word[bp-2]

;-1004         }


;-1005 }

 jmp .listcall487
.listcall488:

;-1006 int calllisting(int i) {
 LEAVE
 ret
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
ENDP

calllisting: PROC

;-1007     char c; int j;


;-1008     prs("\n;");

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1006 NULL i = bp+4
;  201 var sign byte  1007 NULL c = bp-2
;  202 var sign word  1007 NULL j = bp-4;
 ENTER  4,0
 push calllisting_0
 call prs
 add  sp, 2

;-1009     printint51(i);

 push word [bp+4]
 call printint51
 add  sp, 2

;-1010     prc(32);

 push 32
 call prc
 add  sp, 2

;-1011     c=CType [i];

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al

;-1012     if(c==0)prs("unresolved ");

 mov al, [bp-2]
 cmp al, 0
 jne .calllisting489
 push calllisting_1
 call prs
 add  sp, 2

;-1013     j=CAdr[i];

.calllisting489:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov [bp-4], ax

;-1014     printint51(j);

 push word [bp-4]
 call printint51
 add  sp, 2

;-1015     prc(32);

 push 32
 call prc
 add  sp, 2

;-1016     from_far(NameA, j);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1017     prs(NameA);

 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-1018 }


;-1019 int countcalls(int f) {
 LEAVE
 ret
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0
ENDP

countcalls: PROC

;-1020     unsigned int i;


;-1021     pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word  1019 NULL f = bp+4
;  201 var unsg word  1020 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1022     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1023     while (i < CTop) {

.countcalls490:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .countcalls491

;-1024         p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-1025         from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1026         if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je .countcalls492
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-1027         i++;

.countcalls492:
 inc  word[bp-2]

;-1028         }


;-1029 }

 jmp .countcalls490
.countcalls491:

;-1030 int listfunc() {
 LEAVE
 ret
ENDP

listfunc: PROC

;-1031     int i;


;-1032     prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1031 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-1033     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1034     while (i < FTop) {

.listfunc493:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc494

;-1035         countcalls (i);

 push word [bp-2]
 call countcalls
 add  sp, 2

;-1036         i++;

 inc  word[bp-2]

;-1037         }


;-1038     i=0;

 jmp .listfunc493
.listfunc494:
 mov ax, 0
 mov [bp-2], ax

;-1039     while (i < FTop) {

.listfunc495:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc496

;-1040         funclisting(i);

 push word [bp-2]
 call funclisting
 add  sp, 2

;-1041         i++;

 inc  word[bp-2]

;-1042         }


;-1043 }

 jmp .listfunc495
.listfunc496:

;-1044 int funclisting(int i) {
 LEAVE
 ret
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
ENDP

funclisting: PROC

;-1045     int j;  char c;


;-1046     prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1044 NULL i = bp+4
;  201 var sign word  1045 NULL j = bp-2
;  202 var sign byte  1045 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-1047     j = FCalls[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax

;-1048     if (j) printint51(j);

 mov ax, [bp-2]
 or  al, al
 je .funclisting497
 push word [bp-2]
 call printint51
 add  sp, 2

;-1049         else prs(" NULL");

 jmp .funclisting498
.funclisting497:
 push funclisting_1
 call prs
 add  sp, 2

;-1050     j = FAdr[i];

.funclisting498:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FAdr + bx]
 mov [bp-2], ax

;-1051     printint51(j);

 push word [bp-2]
 call printint51
 add  sp, 2

;-1052     prc(32);

 push 32
 call prc
 add  sp, 2

;-1053     c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-1054     if(c=='V')prs("void " );

 mov al, [bp-4]
 cmp al, 86
 jne .funclisting499
 push funclisting_2
 call prs
 add  sp, 2

;-1055     if(c=='B')prs("byte " );

.funclisting499:
 mov al, [bp-4]
 cmp al, 66
 jne .funclisting500
 push funclisting_3
 call prs
 add  sp, 2

;-1056     if(c=='W')prs("word " );

.funclisting500:
 mov al, [bp-4]
 cmp al, 87
 jne .funclisting501
 push funclisting_4
 call prs
 add  sp, 2

;-1057     if(c=='D')prs("dwrd " );

.funclisting501:
 mov al, [bp-4]
 cmp al, 68
 jne .funclisting502
 push funclisting_5
 call prs
 add  sp, 2

;-1058     prc(32); prc(32);

.funclisting502:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-1059     pt=adrF(FNameField, i);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1060     prs(pt);

 push word [pt]
 call prs
 add  sp, 2

;-1061 }


;-1062 


;-1063 int listvar(unsigned int i) {
 LEAVE
 ret
funclisting_0 db "\n;",0
funclisting_1 db " NULL",0
funclisting_2 db "void ",0
funclisting_3 db "byte ",0
funclisting_4 db "word ",0
funclisting_5 db "dwrd ",0
ENDP

listvar: PROC

;-1064     unsigned int j; char c;


;-1065     prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1063 NULL i = bp+4
;  201 var unsg word  1064 NULL j = bp-2
;  202 var sign byte  1064 NULL c = bp-4;
 ENTER  4,0
 push listvar_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-1066     c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne .listvar503
 push listvar_1
 call prs
 add  sp, 2
.listvar503:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar504
 push listvar_2
 call prs
 add  sp, 2

;-1067                  if(c=='&')prs("arr ");   if(c=='#')prs("def ");

.listvar504:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar505
 push listvar_3
 call prs
 add  sp, 2
.listvar505:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar506
 push listvar_4
 call prs
 add  sp, 2

;-1068     c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

.listvar506:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .listvar507
 push listvar_5
 call prs
 add  sp, 2
.listvar507:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar508
 push listvar_6
 call prs
 add  sp, 2

;-1069     c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

.listvar508:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne .listvar509
 push listvar_7
 call prs
 add  sp, 2
.listvar509:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar510
 push listvar_8
 call prs
 add  sp, 2

;-1070                  if(c==  4)prs("dwrd " );

.listvar510:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar511
 push listvar_9
 call prs
 add  sp, 2

;-1071     j=GAdr[i]; printint51(j);

.listvar511:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1072     j=GUsed[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax

;-1073     if (j) printint51(j);

 mov ax, [bp-2]
 or  al, al
 je .listvar512
 push word [bp-2]
 call printint51
 add  sp, 2

;-1074     else {

 jmp .listvar513
.listvar512:

;-1075         if(GType[i]=='#') prs("    -");

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar514
 push listvar_10
 call prs
 add  sp, 2

;-1076         else prs(" NULL");

 jmp .listvar515
.listvar514:
 push listvar_11
 call prs
 add  sp, 2

;-1077          }

.listvar515:

;-1078     prc(32);

.listvar513:
 push 32
 call prc
 add  sp, 2

;-1079     pt=adrofname(i); prs(pt);

 push word [bp+4]
 call adrofname
 add  sp, 2
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-1080     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar516

;-1081         prc('=');

 push 61
 call prc
 add  sp, 2

;-1082         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1083         prunsign1(j);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1084         }


;-1085     if(GType[i]=='&') {

.listvar516:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar517

;-1086         prc('[');

 push 91
 call prc
 add  sp, 2

;-1087         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1088         prunsign1(j);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1089         prc(']');

 push 93
 call prc
 add  sp, 2

;-1090         }


;-1091     if (i >= LSTART) {

.listvar517:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  .listvar518

;-1092         prs(" = bp");

 push listvar_12
 call prs
 add  sp, 2

;-1093         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1094         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar519
 push 43
 call prc
 add  sp, 2

;-1095         pint1(j);

.listvar519:
 push word [bp-2]
 call pint1
 add  sp, 2

;-1096     }


;-1097 }

.listvar518:

;-1098 


;-1099 unsigned int MAXUI=65535;
 LEAVE
 ret
listvar_0 db "\n;",0
listvar_1 db "var ",0
listvar_2 db "ptr ",0
listvar_3 db "arr ",0
listvar_4 db "def ",0
listvar_5 db "sign ",0
listvar_6 db "unsg ",0
listvar_7 db "byte ",0
listvar_8 db "word ",0
listvar_9 db "dwrd ",0
listvar_10 db "    -",0
listvar_11 db " NULL",0
listvar_12 db " = bp",0
ENDP
MAXUI dw 65535

;-1100 int epilog() {


epilog: PROC

;-1101     unsigned int i;


;-1102     prs("\n \n;   # type sign width  adr used name");

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1101 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 call prs
 add  sp, 2

;-1103     prs("   list of global variables\n");

 push epilog_1
 call prs
 add  sp, 2

;-1104     i=1;

 mov ax, 1
 mov [bp-2], ax

;-1105     while (i< GTop) {

.epilog520:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .epilog521

;-1106         listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2

;-1107         i++;

 inc  word[bp-2]

;-1108         }


;-1109     listfunc();

 jmp .epilog520
.epilog521:
 call listfunc

;-1110     listcall();

 call listcall

;-1111     prs("\n;Input: "); prs(&namein);

 push epilog_2
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1112     prs(", List: ");   prs(&namelst);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1113     prs(",  Lines:"); printint51(lineno);

 push epilog_4
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-1114     prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_5
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-1115     prs(" max.:"); printint51(LSTART);

 push epilog_6
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-1116     prs("\n;Functions      :"); printint51(FTop);

 push epilog_7
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-1117     prs(" max.:"); printint51(FUNCMAX);

 push epilog_8
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-1118     prs("\n;Calls          :"); printint51(CTop);

 push epilog_9
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-1119     prs(" max.:"); printint51(CALLMAX);

 push epilog_10
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-1120     prs(", NameField:"); printint51(CNameTop);

 push epilog_11
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-1121 //    prs(" max.:");


;-1122     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);

 push epilog_12
 call prs
 add  sp, 2
 lea  ax, [coname]
 push ax
 call prs
 add  sp, 2
 push epilog_13
 call prs
 add  sp, 2
 push word [maxco]
 call printint51
 add  sp, 2

;-1123     prs(" max.:"); printint51(COMAX); i=COMAX; i=i-maxco;

 push epilog_14
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2
 mov ax, 2000
 mov [bp-2], ax
 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax

;-1124     if (i <= 1000)prs(" *** Warning *** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog522
 push epilog_15
 call prs
 add  sp, 2

;-1125     prs(", stacksize: ");

.epilog522:
 push epilog_16
 call prs
 add  sp, 2

;-1126     i=MAXUI-orgData; printint51(i);

 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1127     if (i <= 1000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog523
 push epilog_17
 call prs
 add  sp, 2

;-1128   end1(0);}

.epilog523:
 push 0
 call end1
 add  sp, 2

;-1129 


;-1130 int checkcalls() {
 LEAVE
 ret
epilog_0 db "\n \n;   # type sign width  adr used name",0
epilog_1 db "   list of global variables\n",0
epilog_2 db "\n;Input: ",0
epilog_3 db ", List: ",0
epilog_4 db ",  Lines:",0
epilog_5 db "\n;Glob. variables:",0
epilog_6 db " max.:",0
epilog_7 db "\n;Functions      :",0
epilog_8 db " max.:",0
epilog_9 db "\n;Calls          :",0
epilog_10 db " max.:",0
epilog_11 db ", NameField:",0
epilog_12 db "\n;Const in '",0
epilog_13 db "' :",0
epilog_14 db " max.:",0
epilog_15 db " *** Warning *** constant area too small",0
epilog_16 db ", stacksize: ",0
epilog_17 db " *** Warning *** Stack too small",0
ENDP

checkcalls: PROC

;-1131     int i; int j; int k;


;-1132     prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1131 NULL i = bp-2
;  201 var sign word  1131 NULL j = bp-4
;  202 var sign word  1131 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-1133     i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-1134     while (i < CTop) {

.checkcalls524:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .checkcalls525

;-1135         pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-1136         from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1137         j=0;

 mov ax, 0
 mov [bp-4], ax

;-1138         do {

.checkcalls526:

;-1139             p1=adrF(FNameField, j);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-1140             if (eqstr(NameA, p1)){

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkcalls527

;-1141                 CType[i]=1;

 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al

;-1142                 j=FTop;

 mov ax, [FTop]
 mov [bp-4], ax

;-1143                 }


;-1144             j++;

.checkcalls527:
 inc  word[bp-4]

;-1145             } while (j < FTop);

 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .checkcalls528
 jmp .checkcalls526
.checkcalls528:

;-1146         if (j == FTop) {

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne .checkcalls529

;-1147             k++; prs("\n; ");

 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2

;-1148             prs(NameA);

 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-1149         }


;-1150         i++;

.checkcalls529:
 inc  word[bp-2]

;-1151     }


;-1152     prs("\n; Number of unresolved CALLs :"); printint51(k);

 jmp .checkcalls524
.checkcalls525:
 push checkcalls_2
 call prs
 add  sp, 2
 push word [bp-6]
 call printint51
 add  sp, 2

;-1153     if (k!=0) error1("At least 1 function is missing! ");

 mov ax, [bp-6]
 cmp ax, 0
 je  .checkcalls530
 push checkcalls_3
 call error1
 add  sp, 2

;-1154     else prs(" All FUNCTIONs in place");

 jmp .checkcalls531
.checkcalls530:
 push checkcalls_4
 call prs
 add  sp, 2

;-1155 }

.checkcalls531:

;-1156 


;-1157 int dodefine() {
 LEAVE
 ret
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db "\n; Number of unresolved CALLs :",0
checkcalls_3 db "At least 1 function is missing! ",0
checkcalls_4 db " All FUNCTIONs in place",0
ENDP

dodefine: PROC

;-1158     int i; int j; int fdtemp;


;-1159     if (eqstr(symbol, "ORGDATA")) {

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1158 NULL i = bp-2
;  201 var sign word  1158 NULL j = bp-4
;  202 var sign word  1158 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine532

;-1160         token=getlex();

 call getlex
 mov word [token], ax

;-1161         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1162         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1163         return;

 jmp .retndodefine

;-1164     }


;-1165     expect(T_NAME);

.dodefine532:
 push 256
 call expect
 add  sp, 2

;-1166     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine533

;-1167         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine534
 push dodefine_1
 call error1
 add  sp, 2

;-1168         i=strlen(symbol);

.dodefine534:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1169         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine535
 push dodefine_2
 call error1
 add  sp, 2

;-1170         GSign [GTop]='U';

.dodefine535:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1171         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1172         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1173         GAdr [GTop]=lineno-1;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax

;-1174         GUsed [GTop]=0;

 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1175         pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-1176         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1177         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1178         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1179         GTop++;

 inc  word[GTop]

;-1180     }


;-1181 }

.dodefine533:

;-1182 


;-1183 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1184     token=getlex();

 call getlex
 mov word [token], ax

;-1185     do {

.parse536:

;-1186         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse537
 mov ax, 1
 jmp .retnparse

;-1187         if (istoken('#')) {

.parse537:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse538

;-1188              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse539
 call dodefine

;-1189              else error1("define expected");

 jmp .parse540
.parse539:
 push parse_0
 call error1
 add  sp, 2

;-1190         }

.parse540:

;-1191     else{

 jmp .parse541
.parse538:

;-1192         typeName();

 call typeName

;-1193         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse542
 call dofunc

;-1194         else doglob(); }

 jmp .parse543
.parse542:
 call doglob
.parse543:

;-1195     } while(1);

.parse541:
 mov ax, 1
 or  al, al
 je .parse544
 jmp .parse536
.parse544:

;-1196 }


;-1197 


;-1198 int getfirstchar() {

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP

getfirstchar: PROC

;-1199     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1200     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1201     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1202     }


;-1203 


;-1204 char *arglen=0x80; char *argv=0x82;

 ret
ENDP
arglen dw 128
argv dw 130

;-1205 int getarg() {


getarg: PROC

;-1206     int arglen1; int i; char *c;


;-1207     arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1206 NULL arglen1 = bp-2
;  201 var sign word  1206 NULL i = bp-4
;  202 ptr sign byte  1206 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1208     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarg545

;-1209         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1210         cputs(" Usage: A.COM in_file[.C]: ");

 push getarg_0
 call cputs
 add  sp, 2

;-1211         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1212         }


;-1213     i=arglen1+129;

.getarg545:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1214     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1215     arglen1--;

 dec  word[bp-2]

;-1216     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1217     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1218     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarg546
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-1219     strcpy(namelst, namein);

.getarg546:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1220     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1221     i--;

 dec  word[bp-4]

;-1222     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1223     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1224 


;-1225     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1226     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg547

;-1227         cputs("Source file missing (.C): ");

 push getarg_2
 call cputs
 add  sp, 2

;-1228         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1229         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1230         }


;-1231     fdout=creatR(namelst);

.getarg547:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1232     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg548

;-1233         cputs("list file not creatable: ");

 push getarg_3
 call cputs
 add  sp, 2

;-1234         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1235         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1236         }


;-1237     prs("\n; ");

.getarg548:
 push getarg_4
 call prs
 add  sp, 2

;-1238     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1239     prs(", Source: "); prs(namein);

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1240     prs(", Output asm: "); prs(namelst);

 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1241     prs("\norg  256 \njmp main");

 push getarg_7
 call prs
 add  sp, 2

;-1242 }


;-1243 


;-1244 int setblock(unsigned int i) {
 LEAVE
 ret
getarg_0 db " Usage: A.COM in_file[.C]: ",0
getarg_1 db ".C",0
getarg_2 db "Source file missing (.C): ",0
getarg_3 db "list file not creatable: ",0
getarg_4 db "\n; ",0
getarg_5 db ", Source: ",0
getarg_6 db ", Output asm: ",0
getarg_7 db "\norg  256 \njmp main",0
ENDP

setblock: PROC

;-1245     DOS_ERR=0;

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1244 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax

;-1246     bx=i;

 mov  bx, [bp+4]

;-1247     ax=cs;

 mov  ax, cs

;-1248     es=ax;

 mov  es, ax

;-1249     ax=0x4A00;

 mov  ax, 18944

;-1250     DosInt();

 call DosInt

;-1251 }


;-1252 int main() {
 LEAVE
 ret
ENDP

main: PROC

;-1253     getarg();

 call getarg

;-1254 setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-1255 if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main549
 push main_0
 call error1
 add  sp, 2

;-1256 segE=allocmem(4096);

.main549:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-1257 if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main550
 push main_1
 call error1
 add  sp, 2

;-1258     CNameTop=0;

.main550:
 mov ax, 0
 mov word [CNameTop], ax

;-1259     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1260     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1261     getfirstchar();

 call getfirstchar

;-1262     parse();

 call parse

;-1263   checkcalls();

 call checkcalls

;-1264   epilog();

 call epilog

;-1265 }


;-1266 


;-1267 


;-1268 


;-1269 int allocmem(unsigned int i) {

 ret
main_0 db "SetBlock , AX=",0
main_1 db "alloc memory, AX=",0
ENDP

allocmem: PROC

;-1270     unsigned int vAX; unsigned int vBX;


;-1271     DOS_ERR=0;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1269 NULL i = bp+4
;  201 var unsg word  1270 NULL vAX = bp-2
;  202 var unsg word  1270 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax

;-1272     bx=i;

 mov  bx, [bp+4]

;-1273     ax=0x4800;

 mov  ax, 18432

;-1274     DosInt();

 call DosInt

;-1275     asm mov [bp-2], ax; _ vAX=ax;

 mov [bp-2], ax; _ vAX=ax;

;-1276     asm mov [bp-4], bx; _ vBX=bx;

 mov [bp-4], bx; _ vBX=bx;

;-1277     if(DOS_ERR) return vBX;

 mov ax, [DOS_ERR]
 or  al, al
 je .allocmem551
 mov ax, [bp-4]
 jmp .retnallocmem

;-1278     return vAX;

.allocmem551:
 mov ax, [bp-2]
 jmp .retnallocmem

;-1279 }


;-1280 int to_far(char *dest, char *src) {

 .retnallocmem: LEAVE
 ret
ENDP

to_far: PROC

;-1281   segE;  es=ax;  si=src;  di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1280 NULL dest = bp+4
;  201 ptr sign byte  1280 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-1282   asm cld

 cld

;-1283   do{

.to_far552:

;-1284   asm lodsb  ; inc si

 lodsb  ; inc si

;-1285   asm stosb  ; inc di

 stosb  ; inc di

;-1286   } while (al != 0);

 cmp  al, 0
 je  .to_far553
 jmp .to_far552
.to_far553:

;-1287 }


;-1288 int from_far(char *dest, char *src) {
 LEAVE
 ret
ENDP

from_far: PROC

;-1289   segE;   es=ax;   si=src;   di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1288 NULL dest = bp+4
;  201 ptr sign byte  1288 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-1290   do{

.from_far554:

;-1291   asm mov al, [es:si]

 mov al, [es:si]

;-1292   asm inc si

 inc si

;-1293   asm mov [di], al

 mov [di], al

;-1294   asm inc di

 inc di

;-1295   } while (al != 0);

 cmp  al, 0
 je  .from_far555
 jmp .from_far554
.from_far555:

;-1296 }
 LEAVE
 ret
ENDP
 
; missing functions: 
; Number of unresolved CALLs :    0 All FUNCTIONs in place
 
;   # type sign width  adr used name   list of global variables

;    1 arr sign byte     1    2 Version1[12]
;    2 def unsg byte     2    - LSTART=200
;    3 def unsg byte     3    - VARMAX=300
;    4 def unsg byte     4    - GNAMEMAX=4800
;    5 def unsg byte     5    - FUNCMAX=300
;    6 def unsg byte     6    - FNAMEMAX=4800
;    7 def unsg byte     7    - CALLMAX=2000
;    8 def unsg byte     8    - IDLENMAX=15
;    9 def unsg byte     9    - COLUMNMAX=128
;   10 def unsg byte    10    - T_NAME=256
;   11 def unsg byte    11    - T_CONST=257
;   12 def unsg byte    12    - T_STRING=258
;   13 def unsg byte    13    - T_DEFINE=511
;   14 def unsg byte    14    - T_RETURN=512
;   15 def unsg byte    15    - T_IF=513
;   16 def unsg byte    16    - T_ELSE=514
;   17 def unsg byte    17    - T_WHILE=515
;   18 def unsg byte    18    - T_DO=516
;   19 def unsg byte    19    - T_INT=517
;   20 def unsg byte    20    - T_ASM=518
;   21 def unsg byte    21    - T_ASMBLOCK=519
;   22 def unsg byte    22    - T_EMIT=520
;   23 def unsg byte    23    - T_GOTO=521
;   24 def unsg byte    24    - T_VOID=529
;   25 def unsg byte    25    - T_CHAR=530
;   26 def unsg byte    26    - T_SIGNED=531
;   27 def unsg byte    27    - T_UNSIGNED=532
;   28 def unsg byte    28    - T_LONG=533
;   29 def unsg byte    29    - T_EQ=806
;   30 def unsg byte    30    - T_NE=807
;   31 def unsg byte    31    - T_GE=811
;   32 def unsg byte    32    - T_LE=824
;   33 def unsg byte    33    - T_PLUSPLUS=1219
;   34 def unsg byte    34    - T_MINUSMINUS=1225
;   35 def unsg byte    35    - T_PLUSASS=1230
;   36 def unsg byte    36    - T_MINUSASS=1231
;   37 def unsg byte    37    - T_MULASS=1232
;   38 def unsg byte    38    - T_DIVASS=1233
;   39 def unsg byte    39    - T_ANDASS=1234
;   40 def unsg byte    40    - T_ORASS=1235
;   41 def unsg byte    41    - T_LESSLESS=1240
;   42 def unsg byte    42    - T_GREATGREAT=1241
;   43 var unsg word    44    2 ORGDATAORIG
;   44 var unsg word    45   10 orgData
;   45 def unsg byte    46    - COMAX=2000
;   46 arr sign byte    47    4 co[2000]
;   47 var sign word    48    4 maxco
;   48 var sign word    49    3 maxco1
;   49 def unsg byte    50    - CMDLENMAX=67
;   50 arr sign byte    51    3 coname[67]
;   51 arr sign byte    52   96 symbol[128]
;   52 arr sign byte    53   12 fname[67]
;   53 arr sign byte    54    8 namein[67]
;   54 arr sign byte    55    7 namelst[67]
;   55 arr sign byte    56 NULL archivename[67]
;   56 ptr sign byte    57    5 cloc
;   57 var sign word    58    3 fdin
;   58 var sign word    59    4 fdout
;   59 var sign word    60   35 token
;   60 var sign byte    61    1 globC
;   61 var sign word    62    3 column
;   62 var sign byte    63   28 thechar
;   63 var sign word    64    9 iscmp
;   64 var sign word    65    4 nconst
;   65 var sign word    66    3 nreturn
;   66 var sign word    67   12 nlabel
;   67 var sign word    68   24 GTop
;   68 var sign word    69   20 LTop
;   69 var unsg word    70   43 lexval
;   70 var sign word    71    4 typei
;   71 var sign byte    71    8 istype
;   72 var sign word    72    4 signi
;   73 var sign byte    72    5 issign
;   74 var sign word    73    9 widthi
;   75 var sign byte    73   19 iswidth
;   76 arr sign byte    74   11 GType[300]
;   77 arr sign byte    75    5 GSign[300]
;   78 arr sign byte    76    5 GWidth[300]
;   79 arr sign word    77    4 GAdr[300]
;   80 arr sign word    78    6 GUsed[300]
;   81 arr sign word    79   11 GData[300]
;   82 arr sign byte    80    2 GNameField[4800]
;   83 var sign word    81   24 wi
;   84 var sign word    82   13 FTop
;   85 var sign word    83    8 CTop
;   86 arr sign byte    84    2 FType[300]
;   87 arr sign byte    85    3 CType[2000]
;   88 arr sign word    86    2 FAdr[300]
;   89 arr sign word    87    4 CAdr[2000]
;   90 arr sign word    88    4 FCalls[300]
;   91 arr sign byte    89    5 FNameField[4800]
;   92 arr sign byte    92    7 NameA[32]
;   93 arr sign byte    93    5 fgetsdest[128]
;   94 ptr unsg byte    94    8 CNameTop
;   95 ptr unsg byte    95   10 fgetsp
;   96 var unsg word    96    3 segE
;   97 var unsg word    97    9 lineno
;   98 var unsg word    98 NULL linenoinclude
;   99 ptr unsg byte    99   17 pt
;  100 ptr unsg byte   100    8 p1
;  101 var sign word   101    8 DOS_ERR
;  102 var sign word   102    3 DOS_NoBytes
;  103 var sign byte   103    3 DOS_ByteRead
;  104 arr sign byte   318    2 doglobName[15]
;  105 var sign word   488    5 ireg1
;  106 var sign word   489    2 mod2
;  107 var sign word   489    3 ireg2
;  108 arr sign byte   510    9 ops[5]
;  109 arr sign byte   553    3 printregstr[74]
;  110 var sign word   560    1 evalue
;  111 var sign word   560    1 exprtype
;  112 arr sign word   714    2 docalltype[10]
;  113 arr sign word   714    2 docallvalue[10]
;  114 arr sign byte   715    2 procname[17]
;  115 arr sign byte   797    2 symboltemp[80]
;  116 var unsg word  1099    1 MAXUI
;  117 ptr sign byte  1204    1 arglen
;  118 ptr sign byte  1204    2 argv


;   # Calls Line Width  Name   list of functions

;    0    4  106   writetty
;    1    1  107   putch
;    2    6  108   cputs
;    3    3  109   mkneg
;    4    8  111   DosInt
;    5    1  116   openR
;    6    1  117   creatR
;    7    2  118   fcloseR
;    8    4  119   exitR
;    9    1  120   readRL
;   10    1  122   fputcR
;   11    1  125   letter
;   12    3  135   digit
;   13    3  140   alnum
;   14    8  146   strlen
;   15   22  151   strcpy
;   16   71  157   eqstr
;   17    1  165   strcat1
;   18    1  169   toupper
;   19    2  175   instr1
;   20    3  184   a
;   21   18  186   v
;   22    4  191   checknamelen
;   23   32  197   next
;   24   75  204   istoken
;   25   36  211   expect
;   26    6  222   eprc
;   27    5  226   eprs
;   28   40  234   prc
;   29    3  243   prscomment
;   30    7  251   prnl
;   31  216  255   prs
;   32    2  274   eprnum
;   33    7  288   pint1
;   34   32  299   prunsign1
;   35   20  309   printint51
;   36    1  319   doglob
;   37   10  369   gettypes
;   38    7  378   adrofname
;   39    7  379   adrF
;   40    4  381   printName
;   41   10  385   searchname
;   42    3  389   checkName
;   43    8  394   typeName
;   44    3  410   name1
;   45    1  415   storecall
;   46    1  421   storefunc
;   47    2  425   addlocal
;   48    1  431   checkFunction
;   49    1  435   dofunc
;   50    1  478   isvariable
;   51    3  491   pexpr
;   52    1  499   constantexpr
;   53    2  511   doreg1
;   54    4  530   checkreg
;   55    3  555   printreg
;   56    4  561   expr
;   57    4  610   compoundass
;   58    2  617   dovar1
;   59    8  638   rterm
;   60    1  651   isreg
;   61   15  669   doreg
;   62    1  675   doassign
;   63    1  693   domul
;   64    2  699   doidiv
;   65    1  712   domod
;   66    1  716   docall1
;   67    1  759   doemit
;   68    3  763   cmpneg
;   69    7  776   prlabel
;   70    3  777   prjump
;   71    1  778   doif
;   72    1  784   dodo
;   73    1  788   dowhile
;   74    3  791   isrelational
;   75   13  798   getlex
;   76    1  849   convertdefine
;   77    1  857   getdigit
;   78    6  867   stmt
;   79    1  899   getstring
;   80    2  911   fgets1
;   81    1  925   printinputline
;   82    1  947   ifEOL
;   83    2  956   end1
;   84   41  961   error1
;   85    2  981   listproc
;   86    1  997   listcall
;   87    1 1006   calllisting
;   88    1 1019   countcalls
;   89    1 1030   listfunc
;   90    1 1044   funclisting
;   91    2 1063   listvar
;   92    1 1100   epilog
;   93    1 1130   checkcalls
;   94    1 1157   dodefine
;   95    1 1183   parse
;   96    1 1198   getfirstchar
;   97    1 1205   getarg
;   98    1 1244   setblock
;   99 NULL 1252   main
;  100    1 1269   allocmem
;  101    1 1280   to_far
;  102    3 1288   from_far

;    #  addr name   list of CALLs

;    0     0 writetty
;    1     9 writetty
;    2    18 putch
;    3    24 DosInt
;    4    31 DosInt
;    5    38 DosInt
;    6    45 DosInt
;    7    52 DosInt
;    8    59 DosInt
;    9    66 digit
;   10    72 letter
;   11    79 strcpy
;   12    86 printName
;   13    96 prc
;   14   100 printName
;   15   110 prc
;   16   114 strlen
;   17   121 error1
;   18   128 fgets1
;   19   135 getlex
;   20   142 istoken
;   21   150 prs
;   22   154 listproc
;   23   163 prs
;   24   167 pint1
;   25   173 error1
;   26   180 eprc
;   27   185 writetty
;   28   194 writetty
;   29   203 fputcR
;   30   210 prc
;   31   214 prs
;   32   218 prc
;   33   222 eprc
;   34   227 mkneg
;   35   233 eprnum
;   36   240 eprc
;   37   245 prc
;   38   249 mkneg
;   39   255 pint1
;   40   261 prc
;   41   265 prunsign1
;   42   275 prc
;   43   279 prc
;   44   283 prc
;   45   287 prc
;   46   291 prc
;   47   295 prunsign1
;   48   305 error1
;   49   312 error1
;   50   319 checknamelen
;   51   332 checkName
;   52   342 error1
;   53   349 istoken
;   54   357 istoken
;   55   365 prs
;   56   369 prunsign1
;   57   379 prs
;   58   383 prs
;   59   387 prs
;   60   391 prs
;   61   395 prs
;   62   399 prunsign1
;   63   409 prs
;   64   413 expect
;   65   420 expect
;   66   427 error1
;   67   434 prs
;   68   438 prs
;   69   442 prs
;   70   446 strcpy
;   71   453 expect
;   72   460 istoken
;   73   468 prc
;   74   472 prscomment
;   75   483 prc
;   76   487 prs
;   77   491 strlen
;   78   498 istoken
;   79   506 prc
;   80   510 expect
;   81   517 prunsign1
;   82   527 istoken
;   83   535 expect
;   84   542 error1
;   85   549 prs
;   86   553 prs
;   87   557 prs
;   88   561 prs
;   89   565 prs
;   90   569 prs
;   91   573 istoken
;   92   581 prc
;   93   585 istoken
;   94   593 expect
;   95   600 prunsign1
;   96   610 prunsign1
;   97   620 adrofname
;   98   630 strcpy
;   99   637 strcpy
;  100   644 expect
;  101   651 adrF
;  102   656 adrofname
;  103   666 prs
;  104   670 prs
;  105   674 prc
;  106   678 pint1
;  107   684 prc
;  108   688 checkName
;  109   698 error1
;  110   705 adrofname
;  111   715 eqstr
;  112   721 adrofname
;  113   731 eqstr
;  114   737 istoken
;  115   745 istoken
;  116   753 istoken
;  117   761 istoken
;  118   769 istoken
;  119   777 istoken
;  120   785 istoken
;  121   793 istoken
;  122   801 name1
;  123   807 error1
;  124   814 getlex
;  125   821 error1
;  126   828 error1
;  127   835 strlen
;  128   842 to_far
;  129   849 error1
;  130   856 adrF
;  131   861 strcpy
;  132   868 error1
;  133   875 checkName
;  134   885 error1
;  135   892 adrF
;  136   897 strcpy
;  137   904 adrF
;  138   909 eqstr
;  139   915 checknamelen
;  140   928 strcpy
;  141   935 checkFunction
;  142   949 error1
;  143   956 storefunc
;  144   966 prs
;  145   970 prs
;  146   974 prs
;  147   978 expect
;  148   985 istoken
;  149   993 typeName
;  150  1002 addlocal
;  151  1011 istoken
;  152  1019 expect
;  153  1026 expect
;  154  1033 isvariable
;  155  1044 typeName
;  156  1053 checknamelen
;  157  1066 addlocal
;  158  1075 istoken
;  159  1083 expect
;  160  1090 expect
;  161  1097 istoken
;  162  1105 expect
;  163  1112 listproc
;  164  1121 prs
;  165  1125 mkneg
;  166  1131 prunsign1
;  167  1141 prs
;  168  1145 istoken
;  169  1153 stmt
;  170  1158 prs
;  171  1162 prs
;  172  1166 prc
;  173  1170 prs
;  174  1174 prs
;  175  1178 prs
;  176  1182 strlen
;  177  1189 strcpy
;  178  1196 prs
;  179  1200 expect
;  180  1207 eqstr
;  181  1213 constantexpr
;  182  1226 checkreg
;  183  1235 doreg1
;  184  1242 expr
;  185  1247 prs
;  186  1251 prs
;  187  1255 expect
;  188  1262 getlex
;  189  1269 typeName
;  190  1278 searchname
;  191  1289 gettypes
;  192  1298 isrelational
;  193  1311 error1
;  194  1318 expect
;  195  1325 prs
;  196  1329 prs
;  197  1333 gettypes
;  198  1342 prs
;  199  1346 prs
;  200  1350 v
;  201  1352 prs
;  202  1356 prunsign1
;  203  1366 cmpneg
;  204  1373 prs
;  205  1377 expect
;  206  1384 istoken
;  207  1392 strcpy
;  208  1399 istoken
;  209  1407 strcpy
;  210  1414 istoken
;  211  1422 strcpy
;  212  1429 istoken
;  213  1437 strcpy
;  214  1444 istoken
;  215  1452 strcpy
;  216  1459 istoken
;  217  1467 strcpy
;  218  1474 istoken
;  219  1482 strcpy
;  220  1489 getlex
;  221  1496 isrelational
;  222  1509 error1
;  223  1516 strcpy
;  224  1523 prnl
;  225  1528 prs
;  226  1532 prs
;  227  1536 printreg
;  228  1545 prs
;  229  1549 istoken
;  230  1557 prunsign1
;  231  1567 typeName
;  232  1576 checkreg
;  233  1585 printreg
;  234  1594 searchname
;  235  1605 a
;  236  1607 v
;  237  1609 cmpneg
;  238  1616 prs
;  239  1620 expect
;  240  1627 strlen
;  241  1634 eqstr
;  242  1640 eqstr
;  243  1646 eqstr
;  244  1652 eqstr
;  245  1658 eqstr
;  246  1664 eqstr
;  247  1670 eqstr
;  248  1676 eqstr
;  249  1682 eqstr
;  250  1688 eqstr
;  251  1694 eqstr
;  252  1700 eqstr
;  253  1706 eqstr
;  254  1712 eqstr
;  255  1718 eqstr
;  256  1724 eqstr
;  257  1730 eqstr
;  258  1736 eqstr
;  259  1742 eqstr
;  260  1748 eqstr
;  261  1754 eqstr
;  262  1760 eqstr
;  263  1766 strlen
;  264  1773 eqstr
;  265  1779 eqstr
;  266  1785 eqstr
;  267  1791 eqstr
;  268  1797 eqstr
;  269  1803 eqstr
;  270  1809 eqstr
;  271  1815 eqstr
;  272  1821 eqstr
;  273  1827 prc
;  274  1831 prc
;  275  1835 prc
;  276  1839 istoken
;  277  1847 prs
;  278  1851 prunsign1
;  279  1861 typeName
;  280  1870 checkreg
;  281  1879 doreg1
;  282  1886 docall1
;  283  1894 isreg
;  284  1900 searchname
;  285  1911 gettypes
;  286  1920 istoken
;  287  1928 istoken
;  288  1936 expect
;  289  1943 searchname
;  290  1954 expect
;  291  1961 expect
;  292  1968 gettypes
;  293  1977 error1
;  294  1984 istoken
;  295  1992 error1
;  296  1999 prs
;  297  2003 prs
;  298  2007 prs
;  299  2011 v
;  300  2013 istoken
;  301  2021 error1
;  302  2028 prs
;  303  2032 prs
;  304  2036 prs
;  305  2040 v
;  306  2042 istoken
;  307  2050 compoundass
;  308  2062 istoken
;  309  2070 compoundass
;  310  2082 istoken
;  311  2090 compoundass
;  312  2102 istoken
;  313  2110 compoundass
;  314  2122 istoken
;  315  2130 error1
;  316  2137 istoken
;  317  2145 error1
;  318  2152 istoken
;  319  2160 expr
;  320  2165 doassign
;  321  2174 dovar1
;  322  2181 istoken
;  323  2189 rterm
;  324  2195 istoken
;  325  2203 rterm
;  326  2209 istoken
;  327  2217 rterm
;  328  2223 istoken
;  329  2231 rterm
;  330  2237 istoken
;  331  2245 rterm
;  332  2251 istoken
;  333  2259 rterm
;  334  2265 istoken
;  335  2273 domul
;  336  2279 istoken
;  337  2287 doidiv
;  338  2294 istoken
;  339  2302 domod
;  340  2308 isrelational
;  341  2321 rterm
;  342  2327 cmpneg
;  343  2334 error1
;  344  2341 prnl
;  345  2346 prs
;  346  2350 prs
;  347  2354 gettypes
;  348  2363 prs
;  349  2367 prs
;  350  2371 v
;  351  2373 prs
;  352  2377 expect
;  353  2384 prunsign1
;  354  2394 gettypes
;  355  2403 prs
;  356  2407 v
;  357  2409 prnl
;  358  2414 prs
;  359  2418 prs
;  360  2422 prs
;  361  2426 prnl
;  362  2431 prs
;  363  2435 prs
;  364  2439 a
;  365  2441 prs
;  366  2445 v
;  367  2447 prs
;  368  2451 prs
;  369  2455 prs
;  370  2459 prs
;  371  2463 prs
;  372  2467 prc
;  373  2471 printName
;  374  2481 prs
;  375  2485 prnl
;  376  2490 prs
;  377  2494 prs
;  378  2498 prs
;  379  2502 prs
;  380  2506 v
;  381  2508 istoken
;  382  2516 prnl
;  383  2521 prs
;  384  2525 prs
;  385  2529 prs
;  386  2533 prs
;  387  2537 prunsign1
;  388  2547 typeName
;  389  2556 searchname
;  390  2567 istoken
;  391  2575 searchname
;  392  2586 expect
;  393  2593 expect
;  394  2600 gettypes
;  395  2609 error1
;  396  2616 eqstr
;  397  2622 dovar1
;  398  2629 eqstr
;  399  2635 doreg
;  400  2641 eqstr
;  401  2647 doreg
;  402  2653 eqstr
;  403  2659 doreg
;  404  2665 eqstr
;  405  2671 doreg
;  406  2677 eqstr
;  407  2683 doreg
;  408  2689 eqstr
;  409  2695 doreg
;  410  2701 eqstr
;  411  2707 doreg
;  412  2713 eqstr
;  413  2719 doreg
;  414  2725 eqstr
;  415  2731 doreg
;  416  2737 eqstr
;  417  2743 doreg
;  418  2749 eqstr
;  419  2755 doreg
;  420  2761 eqstr
;  421  2767 doreg
;  422  2773 eqstr
;  423  2779 doreg
;  424  2785 eqstr
;  425  2791 doreg
;  426  2797 eqstr
;  427  2803 doreg
;  428  2809 expect
;  429  2816 prs
;  430  2820 prs
;  431  2824 prs
;  432  2828 istoken
;  433  2836 prunsign1
;  434  2846 istoken
;  435  2854 searchname
;  436  2865 v
;  437  2867 error1
;  438  2874 gettypes
;  439  2883 prs
;  440  2887 v
;  441  2889 prs
;  442  2893 prs
;  443  2897 prs
;  444  2901 a
;  445  2903 prs
;  446  2907 prs
;  447  2911 prunsign1
;  448  2921 v
;  449  2923 prs
;  450  2927 prs
;  451  2931 printName
;  452  2941 prs
;  453  2945 prs
;  454  2949 prs
;  455  2953 prs
;  456  2957 v
;  457  2959 prs
;  458  2963 prs
;  459  2967 prs
;  460  2971 v
;  461  2973 prs
;  462  2977 prs
;  463  2981 prs
;  464  2985 v
;  465  2987 prs
;  466  2991 rterm
;  467  2997 istoken
;  468  3005 prs
;  469  3009 prunsign1
;  470  3019 prs
;  471  3023 error1
;  472  3030 istoken
;  473  3038 prs
;  474  3042 prunsign1
;  475  3052 prs
;  476  3056 prs
;  477  3060 typeName
;  478  3069 searchname
;  479  3080 error1
;  480  3087 gettypes
;  481  3096 error1
;  482  3103 error1
;  483  3110 prs
;  484  3114 v
;  485  3116 prs
;  486  3120 prs
;  487  3124 doidiv
;  488  3131 prs
;  489  3135 checknamelen
;  490  3148 strcpy
;  491  3155 storecall
;  492  3165 expect
;  493  3172 istoken
;  494  3180 error1
;  495  3187 istoken
;  496  3195 istoken
;  497  3203 eprs
;  498  3208 eprs
;  499  3213 eprc
;  500  3218 eprnum
;  501  3225 eprs
;  502  3230 eprc
;  503  3235 eprs
;  504  3240 eprc
;  505  3245 eprs
;  506  3250 istoken
;  507  3258 name1
;  508  3264 searchname
;  509  3275 istoken
;  510  3283 checkreg
;  511  3292 searchname
;  512  3303 error1
;  513  3310 istoken
;  514  3318 expect
;  515  3325 prs
;  516  3329 prunsign1
;  517  3339 prs
;  518  3343 prs
;  519  3347 prc
;  520  3351 prunsign1
;  521  3361 prs
;  522  3365 v
;  523  3367 prs
;  524  3371 gettypes
;  525  3380 prs
;  526  3384 v
;  527  3386 prs
;  528  3390 v
;  529  3392 prs
;  530  3396 prs
;  531  3400 printreg
;  532  3409 prs
;  533  3413 prs
;  534  3417 prs
;  535  3421 prunsign1
;  536  3431 prs
;  537  3435 getlex
;  538  3442 prunsign1
;  539  3452 getlex
;  540  3459 prc
;  541  3463 expect
;  542  3470 prs
;  543  3474 prs
;  544  3478 prs
;  545  3482 prs
;  546  3486 prs
;  547  3490 prunsign1
;  548  3500 prs
;  549  3504 prs
;  550  3508 prunsign1
;  551  3518 prs
;  552  3522 prs
;  553  3526 prs
;  554  3530 error1
;  555  3537 prs
;  556  3541 prs
;  557  3545 prunsign1
;  558  3555 prc
;  559  3559 prs
;  560  3563 prs
;  561  3567 prunsign1
;  562  3577 pexpr
;  563  3583 pint1
;  564  3589 stmt
;  565  3594 istoken
;  566  3602 prjump
;  567  3609 prlabel
;  568  3617 stmt
;  569  3622 prlabel
;  570  3630 prlabel
;  571  3638 prlabel
;  572  3646 stmt
;  573  3651 expect
;  574  3658 pexpr
;  575  3664 pint1
;  576  3670 prjump
;  577  3677 prlabel
;  578  3685 prlabel
;  579  3693 pexpr
;  580  3699 pint1
;  581  3705 stmt
;  582  3710 prjump
;  583  3717 prlabel
;  584  3725 getlex
;  585  3732 next
;  586  3737 next
;  587  3742 next
;  588  3747 next
;  589  3752 next
;  590  3757 next
;  591  3762 next
;  592  3767 next
;  593  3772 next
;  594  3777 next
;  595  3782 next
;  596  3787 next
;  597  3792 next
;  598  3797 next
;  599  3802 next
;  600  3807 instr1
;  601  3814 next
;  602  3819 ifEOL
;  603  3825 getlex
;  604  3832 next
;  605  3837 next
;  606  3842 getlex
;  607  3849 getstring
;  608  3859 digit
;  609  3865 getdigit
;  610  3874 next
;  611  3879 next
;  612  3884 next
;  613  3889 alnum
;  614  3895 strcpy
;  615  3902 alnum
;  616  3908 next
;  617  3913 eqstr
;  618  3919 eqstr
;  619  3925 eqstr
;  620  3931 eqstr
;  621  3937 eqstr
;  622  3943 eqstr
;  623  3949 eqstr
;  624  3955 eqstr
;  625  3961 eqstr
;  626  3967 eqstr
;  627  3973 eqstr
;  628  3979 eqstr
;  629  3985 eqstr
;  630  3991 eqstr
;  631  3997 eqstr
;  632  4003 eqstr
;  633  4009 convertdefine
;  634  4023 strcpy
;  635  4030 error1
;  636  4037 adrofname
;  637  4047 eqstr
;  638  4053 next
;  639  4058 alnum
;  640  4064 next
;  641  4069 digit
;  642  4075 next
;  643  4080 istoken
;  644  4088 istoken
;  645  4096 stmt
;  646  4101 istoken
;  647  4109 doif
;  648  4114 istoken
;  649  4122 dodo
;  650  4127 istoken
;  651  4135 dowhile
;  652  4143 istoken
;  653  4151 prs
;  654  4155 name1
;  655  4161 prs
;  656  4165 expect
;  657  4172 prs
;  658  4176 next
;  659  4181 prc
;  660  4185 next
;  661  4190 getlex
;  662  4197 istoken
;  663  4205 prs
;  664  4209 next
;  665  4214 prc
;  666  4218 next
;  667  4223 getlex
;  668  4230 error1
;  669  4237 istoken
;  670  4245 doemit
;  671  4252 istoken
;  672  4260 istoken
;  673  4268 expr
;  674  4273 prs
;  675  4277 prs
;  676  4281 expect
;  677  4288 prs
;  678  4292 prs
;  679  4296 prc
;  680  4300 expect
;  681  4307 expect
;  682  4314 expr
;  683  4319 expect
;  684  4326 next
;  685  4331 next
;  686  4336 printinputline
;  687  4351 readRL
;  688  4358 error1
;  689  4365 prs
;  690  4369 prunsign1
;  691  4379 prc
;  692  4383 prscomment
;  693  4394 next
;  694  4399 fcloseR
;  695  4407 fcloseR
;  696  4415 exitR
;  697  4421 prnl
;  698  4426 prscomment
;  699  4437 prs
;  700  4441 prunsign1
;  701  4451 prs
;  702  4455 prs
;  703  4459 prs
;  704  4463 prunsign1
;  705  4473 prs
;  706  4477 prunsign1
;  707  4487 prs
;  708  4491 prs
;  709  4495 end1
;  710  4500 prs
;  711  4504 prs
;  712  4508 prs
;  713  4512 prunsign1
;  714  4522 prs
;  715  4526 prs
;  716  4530 listvar
;  717  4538 prs
;  718  4542 calllisting
;  719  4554 prs
;  720  4558 printint51
;  721  4569 prc
;  722  4573 prs
;  723  4577 printint51
;  724  4588 prc
;  725  4592 from_far
;  726  4601 prs
;  727  4605 adrF
;  728  4610 from_far
;  729  4619 eqstr
;  730  4625 prs
;  731  4629 countcalls
;  732  4640 funclisting
;  733  4652 prs
;  734  4656 printint51
;  735  4667 printint51
;  736  4678 prs
;  737  4682 printint51
;  738  4693 prc
;  739  4697 prs
;  740  4701 prs
;  741  4705 prs
;  742  4709 prs
;  743  4713 prc
;  744  4717 prc
;  745  4721 adrF
;  746  4726 prs
;  747  4730 prs
;  748  4734 printint51
;  749  4745 prc
;  750  4749 prs
;  751  4753 prs
;  752  4757 prs
;  753  4761 prs
;  754  4765 prs
;  755  4769 prs
;  756  4773 prs
;  757  4777 prs
;  758  4781 prs
;  759  4785 printint51
;  760  4796 printint51
;  761  4807 prs
;  762  4811 prs
;  763  4815 prc
;  764  4819 adrofname
;  765  4829 prs
;  766  4833 prc
;  767  4837 prunsign1
;  768  4847 prc
;  769  4851 prunsign1
;  770  4861 prc
;  771  4865 prs
;  772  4869 prc
;  773  4873 pint1
;  774  4879 prs
;  775  4883 prs
;  776  4887 listvar
;  777  4895 listfunc
;  778  4904 listcall
;  779  4913 prs
;  780  4917 prs
;  781  4921 prs
;  782  4925 prs
;  783  4929 prs
;  784  4933 printint51
;  785  4944 prs
;  786  4948 printint51
;  787  4959 prs
;  788  4963 printint51
;  789  4974 prs
;  790  4978 printint51
;  791  4989 prs
;  792  4993 printint51
;  793  5004 prs
;  794  5008 printint51
;  795  5019 prs
;  796  5023 printint51
;  797  5034 prs
;  798  5038 printint51
;  799  5049 prs
;  800  5053 prs
;  801  5057 prs
;  802  5061 printint51
;  803  5072 prs
;  804  5076 printint51
;  805  5087 prs
;  806  5091 prs
;  807  5095 printint51
;  808  5106 prs
;  809  5110 end1
;  810  5115 prs
;  811  5119 from_far
;  812  5128 adrF
;  813  5133 eqstr
;  814  5139 prs
;  815  5143 prs
;  816  5147 prs
;  817  5151 printint51
;  818  5162 error1
;  819  5169 prs
;  820  5173 eqstr
;  821  5179 getlex
;  822  5186 expect
;  823  5193 error1
;  824  5200 strlen
;  825  5207 error1
;  826  5214 adrofname
;  827  5224 strcpy
;  828  5231 expect
;  829  5238 getlex
;  830  5245 istoken
;  831  5253 istoken
;  832  5261 dodefine
;  833  5270 error1
;  834  5277 typeName
;  835  5286 dofunc
;  836  5293 doglob
;  837  5300 fgets1
;  838  5307 cputs
;  839  5313 cputs
;  840  5319 exitR
;  841  5325 toupper
;  842  5333 strcpy
;  843  5340 instr1
;  844  5347 strcat1
;  845  5355 strcpy
;  846  5362 strlen
;  847  5369 openR
;  848  5375 cputs
;  849  5381 cputs
;  850  5387 exitR
;  851  5393 creatR
;  852  5400 cputs
;  853  5406 cputs
;  854  5412 exitR
;  855  5418 prs
;  856  5422 prs
;  857  5426 prs
;  858  5430 prs
;  859  5434 prs
;  860  5438 prs
;  861  5442 prs
;  862  5446 DosInt
;  863  5453 getarg
;  864  5460 setblock
;  865  5469 error1
;  866  5476 allocmem
;  867  5485 error1
;  868  5492 getfirstchar
;  869  5505 parse
;  870  5511 checkcalls
;  871  5522 epilog
;  872  5529 DosInt
;Input: A.C, List: A.S,  Lines: 1297
;Glob. variables:  118 max.:  200
;Functions      :  103 max.:  300
;Calls          :  873 max.: 2000, NameField: 5536
;Const in 'checkreg' :  712 max.: 2000, stacksize: 17987