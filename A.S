
; A.COM V0.9.2, Source: A.C, Output asm: A.S
org  256 
jmp main

;-1 char Version1[]="A.COM V0.9.2";

Version1 db "A.COM V0.9.2",0

;-2 #define LSTART        200//max global var


;-3 #define VARMAX        300//max global and local var


;-4 #define GNAMEMAX     4800// 16*VARMAX


;-5 #define FUNCMAX       300//max functions


;-6 #define FNAMEMAX     4800// 16*FUNCMAX


;-7 #define CALLMAX      2000//max call


;-8 #define IDLENMAX       15//max length of names


;-9 #define COLUMNMAX     128


;-10 #define _                // compare constants


;-11 #define T_NAME        256//the following defines for better clearity


;-12 #define T_CONST       257


;-13 #define T_STRING      258


;-14 #define T_INCLUDE     510


;-15 #define T_DEFINE      511


;-16 #define T_RETURN      512


;-17 #define T_IF          513


;-18 #define T_ELSE        514


;-19 #define T_WHILE       515


;-20 #define T_DO          516


;-21 #define T_INT         517


;-22 #define T_ASM         518


;-23 #define T_ASMBLOCK    519


;-24 #define T_EMIT        520


;-25 #define T_GOTO        521


;-26 #define T_VOID        529


;-27 #define T_CHAR        530


;-28 #define T_SIGNED      531


;-29 #define T_UNSIGNED    532


;-30 #define T_LONG        533


;-31 #define T_EQ          806


;-32 #define T_NE          807


;-33 #define T_GE          811


;-34 #define T_LE          824


;-35 #define T_PLUSPLUS   1219


;-36 #define T_MINUSMINUS 1225


;-37 #define T_PLUSASS    1230


;-38 #define T_MINUSASS   1231


;-39 #define T_MULASS     1232


;-40 #define T_DIVASS     1233


;-41 #define T_ANDASS     1234


;-42 #define T_ORASS      1235


;-43 #define T_LESSLESS   1240


;-44 #define T_GREATGREAT 1241


;-45 


;-46 unsigned int ORGDATAORIG=25000;//start of arrays

ORGDATAORIG dw 25000

;-47 unsigned int orgData;//actual max of array, must be less than stack

orgData dw 0

;-48 #define COMAX        3000


;-49 char co[COMAX];//constant storage

section .bss
absolute 25000
co resb 3000
section .text

;-50 int maxco=0;

maxco dw 0

;-51 int maxco1=0;

maxco1 dw 0

;-52 #define CMDLENMAX      67


;-53 char coname[CMDLENMAX];

section .bss
absolute 28000
coname resb 67
section .text

;-54 char symbol[COLUMNMAX];

section .bss
absolute 28067
symbol resb 128
section .text

;-55 char fname[CMDLENMAX];

section .bss
absolute 28195
fname resb 67
section .text

;-56 char namein[CMDLENMAX];

section .bss
absolute 28262
namein resb 67
section .text

;-57 char namelst[CMDLENMAX];

section .bss
absolute 28329
namelst resb 67
section .text

;-58 char archivename[CMDLENMAX];

section .bss
absolute 28396
archivename resb 67
section .text

;-59 char *cloc=0;

cloc dw 0

;-60 int fdin=0;

fdin dw 0

;-61 int fdout=0;

fdout dw 0

;-62 int token=0;

token dw 0

;-63 char globC=0;

globC db 0

;-64 int column=0;

column dw 0

;-65 char thechar=0;   //reads one char forward

thechar db 0

;-66 int iscmp=0;

iscmp dw 0

;-67 int nconst=0;

nconst dw 0

;-68 int nreturn=0;

nreturn dw 0

;-69 int nlabel=0;

nlabel dw 0

;-70 int GTop=1;

GTop dw 1

;-71 int LTop=LSTART;

LTop dw 200

;-72 unsigned int lexval=0;

lexval dw 0

;-73 int typei;       char istype;

typei dw 0
istype db 0

;-74 int signi;       char issign;

signi dw 0
issign db 0

;-75 int widthi;      char iswidth;

widthi dw 0
iswidth db 0

;-76 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 28463
GType resb 300
section .text

;-77 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 28763
GSign resb 300
section .text

;-78 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 29063
GWidth resb 300
section .text

;-79 int GAdr [VARMAX];

section .bss
absolute 29363
GAdr resw 300
section .text

;-80 int GUsed[VARMAX];

section .bss
absolute 29963
GUsed resw 300
section .text

;-81 int GData[VARMAX];

section .bss
absolute 30563
GData resw 300
section .text

;-82 char GNameField[GNAMEMAX];

section .bss
absolute 31163
GNameField resb 4800
section .text

;-83 int wi=0;

wi dw 0

;-84 int  FTop=0;

FTop dw 0

;-85 int  CTop=0;

CTop dw 0

;-86 char FType [FUNCMAX];

section .bss
absolute 35963
FType resb 300
section .text

;-87 char CType[CALLMAX];

section .bss
absolute 36263
CType resb 2000
section .text

;-88 int  FAdr  [FUNCMAX];

section .bss
absolute 38263
FAdr resw 300
section .text

;-89 int  CAdr [CALLMAX];

section .bss
absolute 38863
CAdr resw 2000
section .text

;-90 int  FCalls[FUNCMAX];

section .bss
absolute 42863
FCalls resw 300
section .text

;-91 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];

section .bss
absolute 43463
FNameField resb 4800
section .text

;-92 char NameA[]="12345678901234567890123456789012"; //must be in low memory

NameA db "12345678901234567890123456789012",0

;-93 char fgetsdest[COLUMNMAX];

section .bss
absolute 48263
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
absolute 48391
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


;-488 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;

 .retnisvariable:
 ret
ENDP
mod1 dw 0
ireg1 dw 0
idx1 dw 0
ids1 dw 0
idw1 dw 0
idt1 dw 0
val1 dw 0

;-489 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

mod2 dw 0
ireg2 dw 0
idx2 dw 0
ids2 dw 0
idw2 dw 0
idt2 dw 0
val2 dw 0

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

;-495   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

.pexpr148:
 call exprstart
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

;-496   expect(')'); }           /*error1("Vergleich fehlt");*/

 push 41
 call expect
 add  sp, 2

;-497 


;-498 int constantexpr() { int mode; int id1;int ids;

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

constantexpr: PROC

;-499   token=getlex();   mode=typeName();

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   498 NULL mode = bp-2
;  201 var sign word   498 NULL id1 = bp-4
;  202 var sign word   498 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-500   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-501   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr152
 push constantexpr_0
 call error1
 add  sp, 2

;-502   expect(T_CONST);  prs(" ; constant expression");

.constantexpr152:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-503   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-504   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

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

;-505   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

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

;-506   expect(')');

 push 41
 call expect
 add  sp, 2

;-507 }


;-508 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
 LEAVE
 ret
constantexpr_0 db "Relational expression expected",0
constantexpr_1 db " ; constant expression",0
constantexpr_2 db "\ncmp ",0
constantexpr_3 db "word",0
constantexpr_4 db "byte",0
constantexpr_5 db ", ",0
ENDP

exprstart: PROC
 push exprstart_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .exprstart155
 push 0
 call expr2
 add  sp, 2
 jmp .exprstart156
.exprstart155:
 push 0
 call expr
 add  sp, 2
.exprstart156:

;-509 


;-510 int expr2(int kind) {  int i;

 ret
exprstart_0 db "_",0
ENDP

expr2: PROC

;-511   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   510 NULL kind = bp+4
;  201 var sign word   510 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  .expr2157
 call getlex
 mov word [token], ax

;-512   mod1=typeName();

.expr2157:
 call typeName
 mov word [mod1], ax

;-513   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je .expr2158
 push expr2_0
 call error1
 add  sp, 2

;-514   ireg1=checkreg();

.expr2158:
 call checkreg
 mov word [ireg1], ax

;-515   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr2159
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr2

;-516   if (ireg1 == 0) { idx1=searchname();

.expr2159:
 mov ax, [ireg1]
 cmp ax, 0
 jne .expr2160
 call searchname
 mov word [idx1], ax

;-517     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-518     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je .expr2161
 push expr2_1
 call error1
 add  sp, 2
.expr2161:

;-519 


;-520   if (isrelational()) { error1("Vergleich noch nicht implementiert");

.expr2160:
 call isrelational
 or  al, al
 je .expr2162
 push expr2_2
 call error1
 add  sp, 2

;-521   }


;-522   if (istoken('=') == 0) error1("Assign expected");

.expr2162:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expr2163
 push expr2_3
 call error1
 add  sp, 2

;-523   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

.expr2163:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr2164
 mov ax, [lexval]
 mov word [val2], ax
 push expr2_4
 call prs
 add  sp, 2

;-524     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-525     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne .expr2165
 push expr2_6
 call prs
 add  sp, 2

;-526     if (idw1 == 2) prs("word ");

.expr2165:
 mov ax, [idw1]
 cmp ax, 2
 jne .expr2166
 push expr2_7
 call prs
 add  sp, 2

;-527     if (idw1 == 4) prs("dword ");

.expr2166:
 mov ax, [idw1]
 cmp ax, 4
 jne .expr2167
 push expr2_8
 call prs
 add  sp, 2

;-528     v(idx1);

.expr2167:
 push word [idx1]
 call v
 add  sp, 2

;-529     prs(", "); prunsign1(val2);

 push expr2_9
 call prs
 add  sp, 2
 push word [val2]
 call prunsign1
 add  sp, 2

;-530     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

 mov ax, [idx1]
 cmp ax, 200 ;unsigned : 1
 jl  .expr2168
 push word [idx1]
 call adrofname
 add  sp, 2
 mov [bp-2], ax
 push expr2_10
 call prs
 add  sp, 2
 push word [bp-2]
 call prs
 add  sp, 2
.expr2168:
 jmp .retnexpr2

;-531 


;-532   mod1=typeName(); ireg2=checkreg();

.expr2164:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-533   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je .expr2169
 push expr2_11
 call prs
 add  sp, 2

;-534     if (ireg1) printreg(ireg1);

 mov ax, [ireg1]
 or  al, al
 je .expr2170
 push word [ireg1]
 call printreg
 add  sp, 2

;-535         else v(idx1);

 jmp .expr2171
.expr2170:
 push word [idx1]
 call v
 add  sp, 2

;-536             prs(", "); printreg(ireg2);return;

.expr2171:
 push expr2_12
 call prs
 add  sp, 2
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .retnexpr2

;-537             }


;-538   else {

 jmp .expr2172
.expr2169:

;-539     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne .expr2173
 push expr2_13
 call error1
 add  sp, 2

;-540 


;-541     idx2=searchname();

.expr2173:
 call searchname
 mov word [idx2], ax

;-542     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-543     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne .expr2174
 push expr2_14
 call error1
 add  sp, 2

;-544     prs("\nmov ");

.expr2174:
 push expr2_15
 call prs
 add  sp, 2

;-545     if (ireg1) printreg(ireg1);

 mov ax, [ireg1]
 or  al, al
 je .expr2175
 push word [ireg1]
 call printreg
 add  sp, 2

;-546         else error1("Mem to Mem not allowed by x86-CPU");

 jmp .expr2176
.expr2175:
 push expr2_16
 call error1
 add  sp, 2

;-547     prs(", ");

.expr2176:
 push expr2_17
 call prs
 add  sp, 2

;-548     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne .expr2177
 push word [idx2]
 call a
 add  sp, 2

;-549     else {

 jmp .expr2178
.expr2177:

;-550       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne .expr2179
 push expr2_18
 call prs
 add  sp, 2

;-551       if (idw2 == 2) prs("word ");

.expr2179:
 mov ax, [idw2]
 cmp ax, 2
 jne .expr2180
 push expr2_19
 call prs
 add  sp, 2

;-552       if (idw2 == 4) prs("dword ");

.expr2180:
 mov ax, [idw2]
 cmp ax, 4
 jne .expr2181
 push expr2_20
 call prs
 add  sp, 2

;-553       v(idx2);

.expr2181:
 push word [idx2]
 call v
 add  sp, 2

;-554       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

 mov ax, [idx2]
 cmp ax, 200 ;unsigned : 1
 jl  .expr2182
 push word [idx2]
 call adrofname
 add  sp, 2
 mov [bp-2], ax
 push expr2_21
 call prs
 add  sp, 2
 push word [bp-2]
 call prs
 add  sp, 2
.expr2182:

;-555     return;

.expr2178:
 jmp .retnexpr2

;-556   } error1("Internal error: only const or reg allowed");

.expr2172:
 push expr2_22
 call error1
 add  sp, 2

;-557 }


;-558 char ops[5];

 .retnexpr2: LEAVE
 ret
expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
expr2_2 db "Vergleich noch nicht implementiert",0
expr2_3 db "Assign expected",0
expr2_4 db " ; constant expression",0
expr2_5 db "\nmov ",0
expr2_6 db "byte ",0
expr2_7 db "word ",0
expr2_8 db "dword ",0
expr2_9 db ", ",0
expr2_10 db "; ",0
expr2_11 db "\nmov ",0
expr2_12 db ", ",0
expr2_13 db "Noch kein * im Text erlaubt",0
expr2_14 db "Noch kein Array rechts erlaubt",0
expr2_15 db "\nmov ",0
expr2_16 db "Mem to Mem not allowed by x86-CPU",0
expr2_17 db ", ",0
expr2_18 db "byte ",0
expr2_19 db "word ",0
expr2_20 db "dword ",0
expr2_21 db "; ",0
expr2_22 db "Internal error: only const or reg allowed",0
ENDP
section .bss
absolute 48406
ops resb 5
section .text

;-559 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-560   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   559 NULL iscmp1 = bp+4
;  201 var sign word   559 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1183
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-561   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1183:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1184
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-562   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1184:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1185
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-563   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1185:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1186
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-564   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1186:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1187
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-565   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1187:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1188
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-566   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1188:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1189
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-567   if (iscmp1 == 1) { token=getlex();

.doreg1189:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1190
 call getlex
 mov word [token], ax

;-568       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1191
 push doreg1_7
 call error1
 add  sp, 2

;-569       strcpy(ops, "cmp"); }

.doreg1191:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-570   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1190:
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

;-571 


;-572   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1192
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-573   mod2=typeName(); ireg2=checkreg();

.doreg1192:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-574   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1193
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-575   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1193:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1194
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1195
.doreg1194:
 push word [bp-2]
 call v
 add  sp, 2

;-576   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1195:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1196
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

;-577 }

.doreg1196:

;-578 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

;-579   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg197
 mov ax, 0
 jmp .retncheckreg

;-580   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg197:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 1
 jmp .retncheckreg
.checkreg198:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 3
 jmp .retncheckreg

;-581   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg199:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 5
 jmp .retncheckreg
.checkreg200:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 7
 jmp .retncheckreg

;-582   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg201:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 9
 jmp .retncheckreg
.checkreg202:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 11
 jmp .retncheckreg

;-583   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg203:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 13
 jmp .retncheckreg
.checkreg204:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 15
 jmp .retncheckreg

;-584   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg205:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 17
 jmp .retncheckreg
.checkreg206:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 19
 jmp .retncheckreg

;-585   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg207:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 21
 jmp .retncheckreg
.checkreg208:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 23
 jmp .retncheckreg

;-586   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg209:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 25
 jmp .retncheckreg
.checkreg210:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 27
 jmp .retncheckreg

;-587   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg211:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 29
 jmp .retncheckreg
.checkreg212:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 31
 jmp .retncheckreg

;-588   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg213:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 33
 jmp .retncheckreg
.checkreg214:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 35
 jmp .retncheckreg

;-589   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg215:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 37
 jmp .retncheckreg
.checkreg216:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 39
 jmp .retncheckreg

;-590   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg217:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 41
 jmp .retncheckreg
.checkreg218:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 43
 jmp .retncheckreg

;-591   // (eqstr(symbol,"ip")) return 45;


;-592   if (strlen(symbol) >   3) return 0;

.checkreg219:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg220
 mov ax, 0
 jmp .retncheckreg

;-593   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg220:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 47
 jmp .retncheckreg
.checkreg221:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 50
 jmp .retncheckreg

;-594   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg222:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 53
 jmp .retncheckreg
.checkreg223:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 56
 jmp .retncheckreg

;-595   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg224:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 59
 jmp .retncheckreg
.checkreg225:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 62
 jmp .retncheckreg

;-596   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg226:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 65
 jmp .retncheckreg
.checkreg227:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 68
 jmp .retncheckreg

;-597   if (eqstr(symbol,"cr0")) return 71;

.checkreg228:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 71
 jmp .retncheckreg

;-598   return 0;   }

.checkreg229:
 mov ax, 0
 jmp .retncheckreg

;-599 char printregstr[]

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

;-600 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-601 //          1         2         3         4         5         6         7


;-602 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-603 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-604   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   603 NULL i = bp+4
;  201 var unsg word   603 NULL k = bp-2
;  202 var unsg byte   603 NULL c = bp-4;
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

;-605   k = &printregstr + i; c=*k; prc(c);

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

;-606   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg230
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

;-607 }

.printreg230:

;-608 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
ENDP
evalue dw 0
exprtype dw 10

;-609 int expr(int isRight)


expr: PROC

;-610 { int mode; int id1;     int ixarr; int ixconst;


;-611   int ids;  int isCONST; int i;     unsigned char *p;


;-612   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   609 NULL isRight = bp+4
;  201 var sign word   610 NULL mode = bp-2
;  202 var sign word   610 NULL id1 = bp-4
;  203 var sign word   610 NULL ixarr = bp-6
;  204 var sign word   610 NULL ixconst = bp-8
;  205 var sign word   611 NULL ids = bp-10
;  206 var sign word   611 NULL isCONST = bp-12
;  207 var sign word   611 NULL i = bp-14
;  208 ptr unsg byte   611 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr231
 mov ax, [lexval]
 mov word [evalue], ax

;-613     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-614   mode=typeName(); /*0=V,1=*,2=&*/

.expr231:
 call typeName
 mov [bp-2], ax

;-615   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-616   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr232
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-617   if (token=='(')  {docall1(); goto e1; }

.expr232:
 mov ax, [token]
 cmp ax, 40
 jne .expr233
 call docall1
 jmp .e1

;-618   if (isreg()) goto e1;

.expr233:
 call isreg
 or  al, al
 je .expr234
 jmp .e1

;-619 


;-620   id1=searchname(); gettypes(id1); ids=signi;

.expr234:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-621   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-622     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr235
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr236

;-623       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-624     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr237
.expr236:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-625     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-626     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr238
 push expr_1
 call error1
 add  sp, 2
.expr238:
.expr237:

;-627   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

.expr235:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr239
 mov ax, [bp-2]
 or  al, al
 je .expr240
 push expr_2
 call error1
 add  sp, 2

;-628      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr240:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr241
 push expr_4
 call prs
 add  sp, 2
 jmp .expr242
.expr241:
 push expr_5
 call prs
 add  sp, 2

;-629      v(id1); goto e1;}

.expr242:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-630   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

.expr239:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr243
 mov ax, [bp-2]
 or  al, al
 je .expr244
 push expr_6
 call error1
 add  sp, 2

;-631      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr244:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr245
 push expr_8
 call prs
 add  sp, 2
 jmp .expr246
.expr245:
 push expr_9
 call prs
 add  sp, 2

;-632      v(id1); goto e1;}

.expr246:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-633 


;-634   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr243:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr247
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-635   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr247:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr248
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-636   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr248:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr249
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-637   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr249:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr250
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-638   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr250:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr251
 push expr_14
 call error1
 add  sp, 2

;-639   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr251:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr252
 push expr_15
 call error1
 add  sp, 2

;-640 


;-641   if (istoken('=')) { exprtype= expr(1);

.expr252:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr253
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-642   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-643   dovar1(mode, "mov", ixarr, id1);

.expr253:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-644 


;-645 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr254
 push expr_17
 call rterm
 add  sp, 2

;-646   else if (istoken('-')) rterm("sub" );

 jmp .expr255
.expr254:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr256
 push expr_18
 call rterm
 add  sp, 2

;-647   else if (istoken('&')) rterm("and" );

 jmp .expr257
.expr256:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr258
 push expr_19
 call rterm
 add  sp, 2

;-648   else if (istoken('|')) rterm("or" );

 jmp .expr259
.expr258:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr260
 push expr_20
 call rterm
 add  sp, 2

;-649   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr261
.expr260:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr262
 push expr_21
 call rterm
 add  sp, 2

;-650   else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr263
.expr262:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr264
 push expr_22
 call rterm
 add  sp, 2

;-651   else if (istoken('*')) domul (ids);

 jmp .expr265
.expr264:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr266
 push word [bp-10]
 call domul
 add  sp, 2

;-652   else if (istoken('/')) doidiv(ids);

 jmp .expr267
.expr266:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr268
 push word [bp-10]
 call doidiv
 add  sp, 2

;-653   else if (istoken('%')) domod (ids);

 jmp .expr269
.expr268:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr270
 push word [bp-10]
 call domod
 add  sp, 2

;-654   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr270:
.expr269:
.expr267:
.expr265:
.expr263:
.expr261:
.expr259:
.expr257:
.expr255:
 call isrelational
 or  al, al
 je .expr271
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-655   return 0;

.expr271:
 mov ax, 0
 jmp .retnexpr

;-656 }


;-657 


;-658 int compoundass(char *op, int mode, int id1) {

 .retnexpr: LEAVE
 ret
expr_0 db "\n mov ax, ",0
expr_1 db "Arrayindex muss Zahl oder int sein",0
expr_2 db "Nur var erlaubt",0
expr_3 db "\n inc  ",0
expr_4 db "word",0
expr_5 db "byte",0
expr_6 db "Nur var erlaubt",0
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

;-659   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   658 NULL op = bp+4
;  201 var sign word   658 NULL mode = bp+6
;  202 var sign word   658 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass272
 push compoundass_0
 call error1
 add  sp, 2

;-660   prnl(); prs(op); prs("  ");

.compoundass272:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-661   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass273
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass274
.compoundass273:
 push compoundass_3
 call prs
 add  sp, 2

;-662   v(id1); prs(", ");

.compoundass274:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-663   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-664 }


;-665 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-666   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   665 NULL mode = bp+4
;  201 var sign word   665 NULL op = bp+6
;  202 var sign word   665 NULL ixarr = bp+8
;  203 var sign word   665 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-667   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1275
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

;-668     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1276
 push dovar1_1
 call prs
 add  sp, 2

;-669     if(widthi == 2) prs(" ax, [bx]");

.dovar1276:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1277
 push dovar1_2
 call prs
 add  sp, 2

;-670     return; }

.dovar1277:
 jmp .retndovar1

;-671   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1275:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1278
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

;-672   if (ixarr) {

.dovar1278:
 mov ax, [bp+8]
 or  al, al
 je .dovar1279

;-673     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-674     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1280
 push dovar1_5
 call prs
 add  sp, 2

;-675     prs("\n "); prs(op);

.dovar1280:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-676     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1281
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1282
.dovar1281:
 push dovar1_8
 call prs
 add  sp, 2

;-677 // v(id1); prs(" [bx]");


;-678     prc('['); printName(id1); prs(" + bx]");

.dovar1282:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-679     return; }

 jmp .retndovar1

;-680   prnl();prs(op);

.dovar1279:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-681   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1283
 push dovar1_10
 call prs
 add  sp, 2

;-682   if(wi==2) prs(" ax, ");

.dovar1283:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1284
 push dovar1_11
 call prs
 add  sp, 2

;-683   if(wi==4) prs(" eax, ");

.dovar1284:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1285
 push dovar1_12
 call prs
 add  sp, 2

;-684   v(id1);

.dovar1285:
 push word [bp+10]
 call v
 add  sp, 2

;-685 }


;-686 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-687   if (istoken(T_CONST)) { prnl(); prs(op);

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   686 NULL op = bp+4
;  201 var sign word   686 NULL mode = bp-2
;  202 var sign word   686 NULL opint = bp-4
;  203 var sign word   686 NULL ixarr = bp-6
;  204 var sign word   686 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm286
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-688     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm287
 push rterm_0
 call prs
 add  sp, 2

;-689     if (wi==2) prs(" ax, ");

.rterm287:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm288
 push rterm_1
 call prs
 add  sp, 2

;-690     if (wi==4) prs(" eax, ");

.rterm288:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm289
 push rterm_2
 call prs
 add  sp, 2

;-691     prunsign1(lexval); return;}

.rterm289:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-692   mode=typeName(); id1=searchname(); ixarr=0;

.rterm286:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-693   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm290
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-694     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-695     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm291
 push rterm_3
 call error1
 add  sp, 2
.rterm291:

;-696   if (eqstr(symbol,"_AX")) return;

.rterm290:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm292
 jmp .retnrterm

;-697   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm292:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-698 }


;-699 int isreg() {

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
ENDP

isreg: PROC

;-700   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg293
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-701   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg293:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg294
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-702   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg294:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg295
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-703   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg295:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg296
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-704   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg296:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg297
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-705   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg297:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg298
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-706   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg298:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg299
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-707   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg299:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg300
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-708   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg300:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg301
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-709   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg301:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg302
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-710   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg302:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg303
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-711   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg303:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg304
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-712   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg304:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg305
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-713   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg305:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg306
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-714   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg306:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg307
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-715   return 0;   r1: return 1;

.isreg307:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-716 }


;-717 int doreg(char *dr) { int i; expect('=');

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
;  200 ptr sign byte   717 NULL dr = bp+4
;  201 var sign word   717 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-718   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-719        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg308
 push word [lexval]
 call prunsign1
 add  sp, 2

;-720   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg309
.doreg308:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg310
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-721   else error1("only number or var allowed"); }

 jmp .doreg311
.doreg310:
 push doreg_2
 call error1
 add  sp, 2
.doreg311:
.doreg309:

;-722 


;-723 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

doassign: PROC

;-724   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   723 NULL mode = bp+4
;  201 var sign word   723 NULL i = bp+6
;  202 var sign word   723 NULL ixarr = bp+8
;  203 var sign word   723 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-725   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign312
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-726     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign313
 push doassign_1
 call prs
 add  sp, 2

;-727     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign314
.doassign313:
 push doassign_2
 call prs
 add  sp, 2
.doassign314:
 jmp .retndoassign

;-728   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign312:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign315
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

;-729   if (ixarr) {  prs("\n mov bx, ");

.doassign315:
 mov ax, [bp+8]
 or  al, al
 je .doassign316
 push doassign_5
 call prs
 add  sp, 2

;-730     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign317
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign318
.doassign317:
 push word [bp+8]
 call v
 add  sp, 2

;-731     if (wi==2) prs("\n shl bx, 1");

.doassign318:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign319
 push doassign_6
 call prs
 add  sp, 2

;-732     prs("\n mov ["); printName(i);

.doassign319:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-733     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign320
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign321
.doassign320:
 push doassign_9
 call prs
 add  sp, 2
.doassign321:
 jmp .retndoassign

;-734   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign316:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign322
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign323
 push doassign_11
 call prs
 add  sp, 2

;-735     } v(i); prs(", al"); return; }

.doassign323:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-736   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign322:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign324
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign325
 push doassign_14
 call prs
 add  sp, 2

;-737     } v(i); prs(", ax"); return; }

.doassign325:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-738   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign324:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign326
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign327
 push doassign_17
 call prs
 add  sp, 2

;-739     } v(i); prs(", eax"); return; }

.doassign327:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-740 }

.doassign326:

;-741 int domul(int ids) {

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

;-742   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   741 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul328
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul329
.domul328:

;-743   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul330

;-744     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-745     }


;-746   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul331
.domul330:
 push domul_3
 call error1
 add  sp, 2
.domul331:
.domul329:

;-747 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-748   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   747 NULL ids = bp+4
;  201 var sign word   747 NULL mode = bp-2
;  202 var sign word   747 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv332

;-749     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-750     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv333
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv334
.doidiv333:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv334:

;-751   else {

 jmp .doidiv335
.doidiv332:

;-752     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-753     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv336
 push doidiv_3
 call error1
 add  sp, 2

;-754     gettypes(id1);

.doidiv336:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-755     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv337
 push doidiv_4
 call error1
 add  sp, 2

;-756     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv337:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv338
 push doidiv_5
 call error1
 add  sp, 2

;-757     prs("\n mov bx, "); v(id1);

.doidiv338:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-758     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv339
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv340
.doidiv339:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv340:

;-759 }

.doidiv335:

;-760 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
;  200 var sign word   760 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-761 


;-762 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 48411
docalltype resw 10
section .text
section .bss
absolute 48431
docallvalue resw 10
section .text

;-763 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 48451
procname resb 17
section .text

;-764 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-765   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   764 NULL i = bp-2
;  201 var sign word   764 NULL narg = bp-4
;  202 var sign word   764 NULL t0 = bp-6
;  203 var sign word   764 NULL n0 = bp-8
;  204 var sign word   764 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-766   checknamelen();

 call checknamelen

;-767   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-768   storecall();

 call storecall

;-769   expect('(');

 push 40
 call expect
 add  sp, 2

;-770 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1341

;-771 	  do { narg++;

.docall1342:
 inc  word[bp-4]

;-772 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1343
 push docall1_0
 call error1
 add  sp, 2
.docall1343:
 mov ax, 0
 mov [bp-6], ax

;-773       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1344
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-774       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1344:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1345
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-775         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-776         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-777       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1345:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1346
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-778       if(istoken(T_NAME))  { n0=checkreg();

.docall1346:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1347
 call checkreg
 mov [bp-8], ax

;-779         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1348
 mov ax, 5
 mov [bp-6], ax

;-780         else {t0=4; n0=searchname();

 jmp .docall1349
.docall1348:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-781           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1350
 mov ax, 3
 mov [bp-6], ax
.docall1350:
.docall1349:

;-782       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1347:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1351
 push docall1_4
 call error1
 add  sp, 2

;-783       docalltype [narg] = t0;

.docall1351:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-784       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-785     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1352
 jmp .docall1342
.docall1352:

;-786 


;-787   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-788     do {

.docall1353:

;-789       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-790       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-791       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1354
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-792       if(t0==2){ prs("\n push ");

.docall1354:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1355
 push docall1_6
 call prs
 add  sp, 2

;-793         prs(fname);prc(95);prunsign1(n0);}

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

;-794       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1355:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1356
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-795         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-796       if(t0==4){ gettypes(n0);

.docall1356:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1357
 push word [bp-8]
 call gettypes
 add  sp, 2

;-797         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1358
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-798         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1359
.docall1358:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-799         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1359:

;-800       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1357:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1360
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1361
 mov ax, [bp-10]
 add ax, 2
.docall1361:

;-801    i--; } while (i > 0);  }

.docall1360:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1362
 jmp .docall1353
.docall1362:

;-802 	 prs("\n call "); prs(&procname);

.docall1341:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-803 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1363
 push docall1_14
 call prs
 add  sp, 2

;-804      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2
.docall1363:

;-805 /***************************************************************/


;-806 


;-807 int doinclude() { int fdtemp;
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

doinclude: PROC

;-808   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   807 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne .doinclude364
 mov ax, [fdin]
 mov [bp-2], ax

;-809   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-810   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-811   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

 mov ax, [DOS_ERR]
 cmp ax, 0
 je  .doinclude365
 push doinclude_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-812     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-813   linenoinclude=lineno; lineno=1;

.doinclude365:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-814   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-815   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-816   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-817 }

.doinclude364:

;-818 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0
ENDP

dodefine: PROC

;-819   if (eqstr(symbol, "ORGDATA")) {token=getlex();

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   818 NULL i = bp-2
;  201 var sign word   818 NULL j = bp-4
;  202 var sign word   818 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine366
 call getlex
 mov word [token], ax

;-820     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp .retndodefine

;-821   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

.dodefine366:
 push dodefine_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine367
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 258
 jne .dodefine368

;-822     prs("\n;Use archive file: ");

 push dodefine_2
 call prs
 add  sp, 2

;-823     strcpy(archivename, symbol); prs(archivename);

 lea  ax, [symbol]
 push ax
 lea  ax, [archivename]
 push ax
 call strcpy
 add  sp, 4
 lea  ax, [archivename]
 push ax
 call prs
 add  sp, 2

;-824     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp .dodefine369
.dodefine368:
 push dodefine_3
 call error1
 add  sp, 2
.dodefine369:
 call getlex
 mov word [token], ax
 jmp .retndodefine

;-825    expect(T_NAME);

.dodefine367:
 push 256
 call expect
 add  sp, 2

;-826   if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine370

;-827     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine371
 push dodefine_4
 call error1
 add  sp, 2

;-828     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

.dodefine371:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine372
 push dodefine_5
 call error1
 add  sp, 2

;-829     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

.dodefine372:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-830     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-831     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-832     expect(T_CONST); GTop++;  }

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-833 }

.dodefine370:

;-834 int stmt() { int c; char cha;

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "ARCHIVE",0
dodefine_2 db "\n;Use archive file: ",0
dodefine_3 db "Name of archive file missing",0
dodefine_4 db "global table (define) full",0
dodefine_5 db "Define name longer 15 char",0
ENDP

stmt: PROC

;-835        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   834 NULL c = bp-2
;  201 var sign byte   834 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt373
.stmt374:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt375
 call stmt
 jmp .stmt374
.stmt375:

;-836   else if(istoken(T_IF))    doif();

 jmp .stmt376
.stmt373:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt377
 call doif

;-837   else if(istoken(T_DO))    dodo();

 jmp .stmt378
.stmt377:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt379
 call dodo

;-838   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt380
.stmt379:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt381
 call dowhile

;-839   else if(istoken(T_GOTO))  {

 jmp .stmt382
.stmt381:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt383

;-840     prs("\n jmp .");name1();prs(symbol);expect(';');}

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

;-841   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt384
.stmt383:
 mov ax, [token]
 cmp ax, 518
 jne .stmt385
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-842         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt386:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt387
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt386
.stmt387:
 call getlex
 mov word [token], ax

;-843   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();

 jmp .stmt388
.stmt385:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt389
 mov ax, [token]
 cmp ax, 123
 jne .stmt390
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-844         while(cha!= '}') { prc(cha); cha=next(); }

.stmt391:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt392
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-845         token=getlex(); }

 jmp .stmt391
.stmt392:
 call getlex
 mov word [token], ax

;-846         else error1("Curly open expected");

 jmp .stmt393
.stmt390:
 push stmt_3
 call error1
 add  sp, 2

;-847         }

.stmt393:

;-848   else if(istoken(T_EMIT))   doemit();

 jmp .stmt394
.stmt389:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt395
 call doemit

;-849   else if(istoken(';'))      { }

 jmp .stmt396
.stmt395:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt397

;-850   else if(istoken(T_RETURN)) {

 jmp .stmt398
.stmt397:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt399

;-851         if (token!=';') exprstart();

 mov ax, [token]
 cmp ax, 59
 je  .stmt400
 call exprstart

;-852         prs("\n jmp .retn");

.stmt400:
 push stmt_4
 call prs
 add  sp, 2

;-853         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-854         nreturn++;

 inc  word[nreturn]

;-855         expect(';');

 push 59
 call expect
 add  sp, 2

;-856         }


;-857   else if(thechar==':')      {

 jmp .stmt401
.stmt399:
 mov al, [thechar]
 cmp al, 58
 jne .stmt402

;-858         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-859         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-860         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-861         expect(':');

 push 58
 call expect
 add  sp, 2

;-862         }


;-863   else  {exprstart(); expect(';'); }

 jmp .stmt403
.stmt402:
 call exprstart
 push 59
 call expect
 add  sp, 2

;-864 }

.stmt403:
.stmt401:
.stmt398:
.stmt396:
.stmt394:
.stmt388:
.stmt384:
.stmt382:
.stmt380:
.stmt378:
.stmt376:

;-865 


;-866 int doemit() {prs("\n db ");
 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n jmp .retn",0
stmt_5 db "\n.",0
ENDP

doemit: PROC
 push doemit_0
 call prs
 add  sp, 2

;-867   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-868     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit404
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit404:
 push 41
 call expect
 add  sp, 2

;-869 


;-870 int cmpneg(int ids) {

 ret
doemit_0 db "\n db ",0
ENDP

cmpneg: PROC

;-871        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   870 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg405
 push cmpneg_0
 call prs
 add  sp, 2

;-872   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg406
.cmpneg405:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg407
 push cmpneg_1
 call prs
 add  sp, 2

;-873   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg408
.cmpneg407:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg409
 mov ax, [bp+4]
 or  al, al
 je .cmpneg410
 push cmpneg_2
 call prs
 add  sp, 2

;-874                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg411
.cmpneg410:
 push cmpneg_3
 call prs
 add  sp, 2

;-875   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg411:
 jmp .cmpneg412
.cmpneg409:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg413
 mov ax, [bp+4]
 or  al, al
 je .cmpneg414
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-876                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-877                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg415
.cmpneg414:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-878                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-879   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg415:
 jmp .cmpneg416
.cmpneg413:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg417
 push cmpneg_8
 call prs
 add  sp, 2

;-880   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg418
.cmpneg417:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg419
 push cmpneg_9
 call prs
 add  sp, 2

;-881   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg420
.cmpneg419:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg420:
.cmpneg418:
.cmpneg416:
.cmpneg412:
.cmpneg408:
.cmpneg406:

;-882 


;-883 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
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
;  200 var sign word   883 NULL n = bp+4;
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

;-884 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   884 NULL n = bp+4;
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

;-885 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

doif: PROC
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   885 NULL jdest = bp-2
;  201 var sign word   885 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-886   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-887   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif421
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-888     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-889   else prlabel(jdest); }

 jmp .doif422
.doif421:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif422:

;-890 


;-891 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
ENDP

dodo: PROC

;-892   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   891 NULL jdest = bp-2
;  201 var sign word   891 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-893   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-894   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-895 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
ENDP

dowhile: PROC
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   895 NULL jdest = bp-2
;  201 var sign word   895 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-896   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-897   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-898 int isrelational() {
 LEAVE
 ret
ENDP

isrelational: PROC

;-899   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational423
 jmp .w
.isrelational423:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational424
 jmp .w

;-900   if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational424:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational425
 jmp .w
.isrelational425:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational426
 jmp .w

;-901   if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational426:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational427
 jmp .w
.isrelational427:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational428
 jmp .w

;-902   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational428:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-903 


;-904 char symboltemp[80];

 .retnisrelational:
 ret
ENDP
section .bss
absolute 48468
symboltemp resb 80
section .text

;-905 int getlex() { char c; char *p;


getlex: PROC

;-906 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   905 NULL c = bp-2
;  201 ptr sign byte   905 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex429
 mov ax, 0
 jmp .retngetlex
.getlex429:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex430
 jmp .g1

;-907   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex430:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex431
 mov al, [thechar]
 cmp al, 61
 jne .getlex432
 call next
 mov ax, 806
 jmp .retngetlex
.getlex432:

;-908   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex431:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex433
 mov al, [thechar]
 cmp al, 61
 jne .getlex434
 call next
 mov ax, 807
 jmp .retngetlex
.getlex434:

;-909   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex433:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex435
 mov al, [thechar]
 cmp al, 61
 jne .getlex436
 call next
 mov ax, 824
 jmp .retngetlex
.getlex436:

;-910   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex435:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex437
 mov al, [thechar]
 cmp al, 61
 jne .getlex438
 call next
 mov ax, 811
 jmp .retngetlex
.getlex438:

;-911   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex437:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex439
 mov al, [thechar]
 cmp al, 60
 jne .getlex440
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex440:

;-912   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex439:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex441
 mov al, [thechar]
 cmp al, 62
 jne .getlex442
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex442:

;-913   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex441:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex443
 mov al, [thechar]
 cmp al, 43
 jne .getlex444
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex444:

;-914   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex443:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex445
 mov al, [thechar]
 cmp al, 45
 jne .getlex446
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex446:

;-915   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex445:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex447
 mov al, [thechar]
 cmp al, 61
 jne .getlex448
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex448:

;-916   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex447:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex449
 mov al, [thechar]
 cmp al, 61
 jne .getlex450
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex450:

;-917   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex449:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex451
 mov al, [thechar]
 cmp al, 61
 jne .getlex452
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex452:

;-918   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex451:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex453
 mov al, [thechar]
 cmp al, 61
 jne .getlex454
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex454:

;-919   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex453:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex455
 mov al, [thechar]
 cmp al, 61
 jne .getlex456
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex456:

;-920   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex455:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex457
 mov al, [thechar]
 cmp al, 61
 jne .getlex458
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex458:

;-921   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex457:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex459
 mov al, [bp-2]
 jmp .retngetlex

;-922   if (c == '/') { if (thechar == '/') {

.getlex459:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex460
 mov al, [thechar]
 cmp al, 47
 jne .getlex461

;-923       do c=next(); while(ifEOL(c)==0) return getlex(); } }

.getlex462:
 call next
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex463
 jmp .getlex462
.getlex463:
 call getlex
 jmp .retngetlex
.getlex461:

;-924   if (c == '/') { if (thechar == '*') {

.getlex460:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex464
 mov al, [thechar]
 cmp al, 42
 jne .getlex465

;-925       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex466
 jmp .g2
.getlex466:
 mov al, [thechar]
 cmp al, 47
 je  .getlex467
 jmp .g2

;-926       c=next(); return getlex(); } else  return '/'; }

.getlex467:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex468
.getlex465:
 mov ax, 47
 jmp .retngetlex
.getlex468:

;-927   if (c == '"') {getstring(c); return T_STRING;}

.getlex464:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex469
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-928   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex469:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex470
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-929   if (c==39) { lexval=next();

.getlex470:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex471
 call next
 mov word [lexval], ax

;-930     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex472
 call next
 mov word [lexval], ax

;-931       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex473
 mov ax, 10
 mov word [lexval], ax
.getlex473:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex474
 mov ax, 9
 mov word [lexval], ax

;-932       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex474:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex475
 mov ax, 0
 mov word [lexval], ax
.getlex475:
.getlex472:
 call next
 mov ax, 257
 jmp .retngetlex

;-933   if (alnum(c)) {

.getlex471:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex476

;-934     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-935     while(alnum(thechar)) {c=next(); *p=c;  p++; }

.getlex477:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex478
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-936       *p=0;

 jmp .getlex477
.getlex478:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-937     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex479
 mov ax, 531
 jmp .retngetlex

;-938     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex479:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex480
 mov ax, 532
 jmp .retngetlex

;-939     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex480:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex481
 mov ax, 529
 jmp .retngetlex

;-940     if (eqstr(symbol,"int"     )) return T_INT;

.getlex481:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex482
 mov ax, 517
 jmp .retngetlex

;-941     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex482:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex483
 mov ax, 533
 jmp .retngetlex

;-942     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex483:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex484
 mov ax, 530
 jmp .retngetlex

;-943     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex484:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex485
 mov ax, 518
 jmp .retngetlex

;-944     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex485:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex486
 mov ax, 519
 jmp .retngetlex

;-945     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex486:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex487
 mov ax, 520
 jmp .retngetlex

;-946     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex487:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex488
 mov ax, 512
 jmp .retngetlex

;-947     if (eqstr(symbol,"if"      )) return T_IF;

.getlex488:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex489
 mov ax, 513
 jmp .retngetlex

;-948     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex489:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex490
 mov ax, 514
 jmp .retngetlex

;-949     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex490:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex491
 mov ax, 515
 jmp .retngetlex

;-950     if (eqstr(symbol,"do"      )) return T_DO;

.getlex491:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex492
 mov ax, 516
 jmp .retngetlex

;-951     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex492:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex493
 mov ax, 521
 jmp .retngetlex

;-952     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex493:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex494
 mov ax, 511
 jmp .retngetlex

;-953     if (eqstr(symbol,"include" )) return T_INCLUDE;

.getlex494:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex495
 mov ax, 510
 jmp .retngetlex

;-954     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex495:
 call convertdefine
 or  al, al
 je .getlex496
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-955     return T_NAME; } error1("Input item not recognized"); }

.getlex496:
 mov ax, 256
 jmp .retngetlex
.getlex476:
 push getlex_18
 call error1
 add  sp, 2

;-956 


;-957 int convertdefine() { int i; int j;   i=0;

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
getlex_17 db "include",0
getlex_18 db "Input item not recognized",0
ENDP

convertdefine: PROC
;Function : convertdefine, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   957 NULL i = bp-2
;  201 var sign word   957 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-958   while (i < GTop) {

.convertdefine497:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine498

;-959    j=adrofname(i);

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-960    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine499
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine500
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-961    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine500:

;-962    i++; }

.convertdefine499:
 inc  word[bp-2]

;-963    return 0; }

 jmp .convertdefine497
.convertdefine498:
 mov ax, 0
 jmp .retnconvertdefine

;-964 int getdigit(char c) { int i;

 .retnconvertdefine: LEAVE
 ret
ENDP

getdigit: PROC

;-965     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   964 NULL c = bp+4
;  201 var sign word   964 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-966     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit501
 mov ax, 88
 mov byte [thechar], al
.getdigit501:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit502
 call next

;-967       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit503:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit504
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit505
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-968 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit505:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit506
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit506:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-969      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-970     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

 jmp .getdigit503
.getdigit504:
 jmp .getdigit507
.getdigit502:
.getdigit508:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit509
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-971      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit508
.getdigit509:

;-972 }

.getdigit507:

;-973 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
ENDP

getstring: PROC
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   973 NULL delim = bp+4
;  201 var sign word   973 NULL c = bp-2
;  202 ptr sign byte   973 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-974   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

.getstring510:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring511
 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]
 call next
 mov [bp-2], ax
 jmp .getstring510
.getstring511:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-975 


;-976 


;-977 int fgets1() {
 LEAVE
 ret
ENDP

fgets1: PROC

;-978     char c;


;-979     c=*fgetsp;

;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   978 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-980     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1512

;-981         printinputline();

 call printinputline

;-982         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1513
 mov ax, 0
 jmp .retnfgets1

;-983         fgetsp=&fgetsdest;

.fgets1513:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-984         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-985         column=0;

 mov ax, 0
 mov word [column], ax

;-986     }


;-987     fgetsp++;

.fgets1512:
 inc  word[fgetsp]

;-988     column++;

 inc  word[column]

;-989     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-990 }


;-991 int printinputline() {

 .retnfgets1: LEAVE
 ret
ENDP

printinputline: PROC

;-992     int col;


;-993     col=0;

;Function : printinputline, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   992 NULL col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-994     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-995     do {

.printinputline514:

;-996         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-997         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline515
 jmp .retnprintinputline

;-998         *fgetsp=DOS_ByteRead;

.printinputline515:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-999         fgetsp++;

 inc  word[fgetsp]

;-1000         col++;

 inc  word[bp-2]

;-1001         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline516
 push printinputline_0
 call error1
 add  sp, 2

;-1002         }

.printinputline516:

;-1003         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline517
 jmp .printinputline514
.printinputline517:

;-1004     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1005     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline518

;-1006         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-1007         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-1008         prc(' ');

 push 32
 call prc
 add  sp, 2

;-1009         lineno++;

 inc  word[lineno]

;-1010         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-1011         }


;-1012 }

.printinputline518:

;-1013 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

ifEOL: PROC

;-1014     if (c == 10) return 1;//LF

;Function : ifEOL, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1013 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL519
 mov ax, 1
 jmp .retnifEOL

;-1015     if (c == 13) {//CR

.ifEOL519:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL520

;-1016         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL521
 call next
 mov [bp+4], al

;-1017         return 1;

.ifEOL521:
 mov ax, 1
 jmp .retnifEOL

;-1018     }


;-1019     return 0;

.ifEOL520:
 mov ax, 0
 jmp .retnifEOL

;-1020 }


;-1021 


;-1022 


;-1023 


;-1024 int end1(int n) {

 .retnifEOL: LEAVE
 ret
ENDP

end1: PROC

;-1025     fcloseR(fdin);

;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1024 NULL n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-1026     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-1027     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-1028 }


;-1029 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-1030     lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1029 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-1031     prnl();

 call prnl

;-1032     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-1033     prs(";Line: ");

 push error1_0
 call prs
 add  sp, 2

;-1034     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-1035     prs(" ************** ERROR: ");

 push error1_1
 call prs
 add  sp, 2

;-1036     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-1037     prs("  in column: ");

 push error1_2
 call prs
 add  sp, 2

;-1038     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-1039     prs("\nToken: ");

 push error1_3
 call prs
 add  sp, 2

;-1040     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-1041 //    prs(", globC: ");


;-1042 //    prc(globC);


;-1043 //    prs(", thechar: ");


;-1044 //    prunsign1(thechar);


;-1045     prs(", symbol: ");

 push error1_4
 call prs
 add  sp, 2

;-1046     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-1047     end1(1);

 push 1
 call end1
 add  sp, 2

;-1048 }


;-1049 int listproc() {
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP

listproc: PROC

;-1050     int i;


;-1051     if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1050 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle .listproc522

;-1052         prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-1053         prs(", Number of local variables: ");

 push listproc_1
 call prs
 add  sp, 2

;-1054         i=LTop - LSTART;

 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax

;-1055         prunsign1(i);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1056         prs("\n;   # type sign width addr used name");

 push listproc_2
 call prs
 add  sp, 2

;-1057         prs("   list of local variables");

 push listproc_3
 call prs
 add  sp, 2

;-1058         i=LSTART;

 mov ax, 200
 mov [bp-2], ax

;-1059         while (i < LTop) {

.listproc523:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc524

;-1060             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2

;-1061             i++;

 inc  word[bp-2]

;-1062             }


;-1063         }

 jmp .listproc523
.listproc524:

;-1064 }

.listproc522:

;-1065 int listcall() {
 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name",0
listproc_3 db "   list of local variables",0
ENDP

listcall: PROC

;-1066     int i;


;-1067     prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1066 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-1068     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1069     while (i< CTop) {

.listcall525:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .listcall526

;-1070         calllisting(i);

 push word [bp-2]
 call calllisting
 add  sp, 2

;-1071         i++;

 inc  word[bp-2]

;-1072         }


;-1073 }

 jmp .listcall525
.listcall526:

;-1074 int calllisting(int i) {
 LEAVE
 ret
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
ENDP

calllisting: PROC

;-1075     char c; int j;


;-1076     prs("\n;");

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1074 NULL i = bp+4
;  201 var sign byte  1075 NULL c = bp-2
;  202 var sign word  1075 NULL j = bp-4;
 ENTER  4,0
 push calllisting_0
 call prs
 add  sp, 2

;-1077     printint51(i);

 push word [bp+4]
 call printint51
 add  sp, 2

;-1078     prc(32);

 push 32
 call prc
 add  sp, 2

;-1079     c=CType [i];

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al

;-1080     if(c==0)prs("unresolved ");

 mov al, [bp-2]
 cmp al, 0
 jne .calllisting527
 push calllisting_1
 call prs
 add  sp, 2

;-1081     j=CAdr[i];

.calllisting527:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov [bp-4], ax

;-1082     printint51(j);

 push word [bp-4]
 call printint51
 add  sp, 2

;-1083     prc(32);

 push 32
 call prc
 add  sp, 2

;-1084     from_far(NameA, j);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1085     prs(NameA);

 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-1086 }


;-1087 int countcalls(int f) {
 LEAVE
 ret
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0
ENDP

countcalls: PROC

;-1088     unsigned int i;


;-1089     pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word  1087 NULL f = bp+4
;  201 var unsg word  1088 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1090     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1091     while (i < CTop) {

.countcalls528:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .countcalls529

;-1092         p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-1093         from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1094         if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je .countcalls530
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-1095         i++;

.countcalls530:
 inc  word[bp-2]

;-1096         }


;-1097 }

 jmp .countcalls528
.countcalls529:

;-1098 int listfunc() {
 LEAVE
 ret
ENDP

listfunc: PROC

;-1099     int i;


;-1100     prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1099 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-1101     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1102     while (i < FTop) {

.listfunc531:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc532

;-1103         countcalls (i);

 push word [bp-2]
 call countcalls
 add  sp, 2

;-1104         i++;

 inc  word[bp-2]

;-1105         }


;-1106     i=0;

 jmp .listfunc531
.listfunc532:
 mov ax, 0
 mov [bp-2], ax

;-1107     while (i < FTop) {

.listfunc533:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc534

;-1108         funclisting(i);

 push word [bp-2]
 call funclisting
 add  sp, 2

;-1109         i++;

 inc  word[bp-2]

;-1110         }


;-1111 }

 jmp .listfunc533
.listfunc534:

;-1112 int funclisting(int i) {
 LEAVE
 ret
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
ENDP

funclisting: PROC

;-1113     int j;  char c;


;-1114     prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1112 NULL i = bp+4
;  201 var sign word  1113 NULL j = bp-2
;  202 var sign byte  1113 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-1115     j = FCalls[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax

;-1116     if (j) printint51(j);

 mov ax, [bp-2]
 or  al, al
 je .funclisting535
 push word [bp-2]
 call printint51
 add  sp, 2

;-1117         else prs(" NULL");

 jmp .funclisting536
.funclisting535:
 push funclisting_1
 call prs
 add  sp, 2

;-1118     j = FAdr[i];

.funclisting536:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FAdr + bx]
 mov [bp-2], ax

;-1119     printint51(j);

 push word [bp-2]
 call printint51
 add  sp, 2

;-1120     prc(32);

 push 32
 call prc
 add  sp, 2

;-1121     c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-1122     if(c=='V')prs("void " );

 mov al, [bp-4]
 cmp al, 86
 jne .funclisting537
 push funclisting_2
 call prs
 add  sp, 2

;-1123     if(c=='B')prs("byte " );

.funclisting537:
 mov al, [bp-4]
 cmp al, 66
 jne .funclisting538
 push funclisting_3
 call prs
 add  sp, 2

;-1124     if(c=='W')prs("word " );

.funclisting538:
 mov al, [bp-4]
 cmp al, 87
 jne .funclisting539
 push funclisting_4
 call prs
 add  sp, 2

;-1125     if(c=='D')prs("dwrd " );

.funclisting539:
 mov al, [bp-4]
 cmp al, 68
 jne .funclisting540
 push funclisting_5
 call prs
 add  sp, 2

;-1126     prc(32); prc(32);

.funclisting540:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-1127     pt=adrF(FNameField, i);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1128     prs(pt);

 push word [pt]
 call prs
 add  sp, 2

;-1129 }


;-1130 


;-1131 int listvar(unsigned int i) {
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

;-1132     unsigned int j; char c;


;-1133     prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1131 NULL i = bp+4
;  201 var unsg word  1132 NULL j = bp-2
;  202 var sign byte  1132 NULL c = bp-4;
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

;-1134     c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne .listvar541
 push listvar_1
 call prs
 add  sp, 2
.listvar541:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar542
 push listvar_2
 call prs
 add  sp, 2

;-1135                  if(c=='&')prs("arr ");   if(c=='#')prs("def ");

.listvar542:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar543
 push listvar_3
 call prs
 add  sp, 2
.listvar543:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar544
 push listvar_4
 call prs
 add  sp, 2

;-1136     c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

.listvar544:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .listvar545
 push listvar_5
 call prs
 add  sp, 2
.listvar545:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar546
 push listvar_6
 call prs
 add  sp, 2

;-1137     c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

.listvar546:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne .listvar547
 push listvar_7
 call prs
 add  sp, 2
.listvar547:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar548
 push listvar_8
 call prs
 add  sp, 2

;-1138                  if(c==  4)prs("dwrd " );

.listvar548:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar549
 push listvar_9
 call prs
 add  sp, 2

;-1139     j=GAdr[i]; printint51(j);

.listvar549:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1140     j=GUsed[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax

;-1141     if (j) printint51(j);

 mov ax, [bp-2]
 or  al, al
 je .listvar550
 push word [bp-2]
 call printint51
 add  sp, 2

;-1142     else {

 jmp .listvar551
.listvar550:

;-1143         if(GType[i]=='#') prs("    -");

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar552
 push listvar_10
 call prs
 add  sp, 2

;-1144         else prs(" NULL");

 jmp .listvar553
.listvar552:
 push listvar_11
 call prs
 add  sp, 2

;-1145          }

.listvar553:

;-1146     prc(32);

.listvar551:
 push 32
 call prc
 add  sp, 2

;-1147     pt=adrofname(i); prs(pt);

 push word [bp+4]
 call adrofname
 add  sp, 2
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-1148     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar554

;-1149         prc('=');

 push 61
 call prc
 add  sp, 2

;-1150         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1151         prunsign1(j);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1152         }


;-1153     if(GType[i]=='&') {

.listvar554:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar555

;-1154         prc('[');

 push 91
 call prc
 add  sp, 2

;-1155         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1156         prunsign1(j);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1157         prc(']');

 push 93
 call prc
 add  sp, 2

;-1158         }


;-1159     if (i >= LSTART) {

.listvar555:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  .listvar556

;-1160         prs(" = bp");

 push listvar_12
 call prs
 add  sp, 2

;-1161         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1162         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar557
 push 43
 call prc
 add  sp, 2

;-1163         pint1(j);

.listvar557:
 push word [bp-2]
 call pint1
 add  sp, 2

;-1164     }


;-1165 }

.listvar556:

;-1166 


;-1167 unsigned int MAXUI=65535;
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

;-1168 int epilog() {


epilog: PROC

;-1169     unsigned int i;


;-1170     prs("\n \n;   # type sign width  adr used name");

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1169 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 call prs
 add  sp, 2

;-1171     prs("   list of global variables\n");

 push epilog_1
 call prs
 add  sp, 2

;-1172     i=1;

 mov ax, 1
 mov [bp-2], ax

;-1173     while (i< GTop) {

.epilog558:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .epilog559

;-1174         listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2

;-1175         i++;

 inc  word[bp-2]

;-1176         }


;-1177     listfunc();

 jmp .epilog558
.epilog559:
 call listfunc

;-1178     listcall();

 call listcall

;-1179     prs("\n;Input: "); prs(&namein);

 push epilog_2
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1180     prs(", List: ");   prs(&namelst);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1181     prs(",  Lines:"); printint51(lineno);

 push epilog_4
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-1182     prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_5
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-1183     prs(" max.:"); printint51(LSTART);

 push epilog_6
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-1184     prs("\n;Functions      :"); printint51(FTop);

 push epilog_7
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-1185     prs(" max.:"); printint51(FUNCMAX);

 push epilog_8
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-1186     prs("\n;Calls          :"); printint51(CTop);

 push epilog_9
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-1187     prs(" max.:"); printint51(CALLMAX);

 push epilog_10
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-1188     prs(", NameField:"); printint51(CNameTop);

 push epilog_11
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-1189 //    prs(" max.:");


;-1190     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);

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

;-1191     prs(" max.:"); printint51(COMAX); i=COMAX; i=i-maxco;

 push epilog_14
 call prs
 add  sp, 2
 push 3000
 call printint51
 add  sp, 2
 mov ax, 3000
 mov [bp-2], ax
 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax

;-1192     if (i <= 1000)prs(" *** Warning *** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog560
 push epilog_15
 call prs
 add  sp, 2

;-1193     prs(", stacksize: ");

.epilog560:
 push epilog_16
 call prs
 add  sp, 2

;-1194     i=MAXUI-orgData; printint51(i);

 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1195     if (i <= 1000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog561
 push epilog_17
 call prs
 add  sp, 2

;-1196   end1(0);}

.epilog561:
 push 0
 call end1
 add  sp, 2

;-1197 


;-1198 int checkcalls() {
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

;-1199     int i; int j; int k;


;-1200     prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1199 NULL i = bp-2
;  201 var sign word  1199 NULL j = bp-4
;  202 var sign word  1199 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-1201     i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-1202     while (i < CTop) {

.checkcalls562:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .checkcalls563

;-1203         pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-1204         from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1205         j=0;

 mov ax, 0
 mov [bp-4], ax

;-1206         do {

.checkcalls564:

;-1207             p1=adrF(FNameField, j);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-1208             if (eqstr(NameA, p1)){

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkcalls565

;-1209                 CType[i]=1;

 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al

;-1210                 j=FTop;

 mov ax, [FTop]
 mov [bp-4], ax

;-1211                 }


;-1212             j++;

.checkcalls565:
 inc  word[bp-4]

;-1213             } while (j < FTop);

 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .checkcalls566
 jmp .checkcalls564
.checkcalls566:

;-1214         if (j == FTop) {

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne .checkcalls567

;-1215             k++; prs("\n; ");

 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2

;-1216             prs(NameA);

 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-1217         }


;-1218         i++;

.checkcalls567:
 inc  word[bp-2]

;-1219     }


;-1220     prs("\n; Number of unresolved CALLs :"); printint51(k);

 jmp .checkcalls562
.checkcalls563:
 push checkcalls_2
 call prs
 add  sp, 2
 push word [bp-6]
 call printint51
 add  sp, 2

;-1221     if (k!=0) error1("At least 1 function is missing! ");

 mov ax, [bp-6]
 cmp ax, 0
 je  .checkcalls568
 push checkcalls_3
 call error1
 add  sp, 2

;-1222     else prs(" All FUNCTIONs in place");

 jmp .checkcalls569
.checkcalls568:
 push checkcalls_4
 call prs
 add  sp, 2

;-1223 }

.checkcalls569:

;-1224 


;-1225 int parse() {
 LEAVE
 ret
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db "\n; Number of unresolved CALLs :",0
checkcalls_3 db "At least 1 function is missing! ",0
checkcalls_4 db " All FUNCTIONs in place",0
ENDP

parse: PROC

;-1226     token=getlex();

 call getlex
 mov word [token], ax

;-1227     do {

.parse570:

;-1228         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse571
 mov ax, 1
 jmp .retnparse

;-1229         if (istoken('#')) {

.parse571:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse572

;-1230              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse573
 call dodefine

;-1231         else if (istoken(T_INCLUDE)) doinclude();

 jmp .parse574
.parse573:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je .parse575
 call doinclude

;-1232         else error1("define or include expected");

 jmp .parse576
.parse575:
 push parse_0
 call error1
 add  sp, 2

;-1233         }

.parse576:
.parse574:

;-1234     else{

 jmp .parse577
.parse572:

;-1235         typeName();

 call typeName

;-1236         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse578
 call dofunc

;-1237         else doglob(); }

 jmp .parse579
.parse578:
 call doglob
.parse579:

;-1238     } while(1);

.parse577:
 mov ax, 1
 or  al, al
 je .parse580
 jmp .parse570
.parse580:

;-1239 }


;-1240 


;-1241 int getfirstchar() {

 .retnparse:
 ret
parse_0 db "define or include expected",0
ENDP

getfirstchar: PROC

;-1242     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1243     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1244     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1245     }


;-1246 


;-1247 char *arglen=0x80; char *argv=0x82;

 ret
ENDP
arglen dw 128
argv dw 130

;-1248 int getarg() {


getarg: PROC

;-1249     int arglen1; int i; char *c;


;-1250     arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1249 NULL arglen1 = bp-2
;  201 var sign word  1249 NULL i = bp-4
;  202 ptr sign byte  1249 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1251     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarg581

;-1252         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1253         cputs(" Usage: A.COM in_file[.C]: ");

 push getarg_0
 call cputs
 add  sp, 2

;-1254         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1255         }


;-1256     i=arglen1+129;

.getarg581:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1257     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1258     arglen1--;

 dec  word[bp-2]

;-1259     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1260     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1261     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarg582
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-1262     strcpy(namelst, namein);

.getarg582:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1263     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1264     i--;

 dec  word[bp-4]

;-1265     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1266     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1267 


;-1268     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1269     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg583

;-1270         cputs("Source file missing (.C): ");

 push getarg_2
 call cputs
 add  sp, 2

;-1271         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1272         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1273         }


;-1274     fdout=creatR(namelst);

.getarg583:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1275     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg584

;-1276         cputs("list file not creatable: ");

 push getarg_3
 call cputs
 add  sp, 2

;-1277         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1278         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1279         }


;-1280     prs("\n; ");

.getarg584:
 push getarg_4
 call prs
 add  sp, 2

;-1281     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1282     prs(", Source: "); prs(namein);

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1283     prs(", Output asm: "); prs(namelst);

 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1284     prs("\norg  256 \njmp main");

 push getarg_7
 call prs
 add  sp, 2

;-1285 }


;-1286 


;-1287 int setblock(unsigned int i) {
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

;-1288     DOS_ERR=0;

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1287 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax

;-1289     bx=i;

 mov  bx, [bp+4]

;-1290     ax=cs;

 mov  ax, cs

;-1291     es=ax;

 mov  es, ax

;-1292     ax=0x4A00;

 mov  ax, 18944

;-1293     DosInt();

 call DosInt

;-1294 }


;-1295 int main() {
 LEAVE
 ret
ENDP

main: PROC

;-1296     getarg();

 call getarg

;-1297 setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-1298 if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main585
 push main_0
 call error1
 add  sp, 2

;-1299 segE=allocmem(4096);

.main585:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-1300 if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main586
 push main_1
 call error1
 add  sp, 2

;-1301     CNameTop=0;

.main586:
 mov ax, 0
 mov word [CNameTop], ax

;-1302     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1303     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1304     getfirstchar();

 call getfirstchar

;-1305     parse();

 call parse

;-1306   checkcalls();

 call checkcalls

;-1307   epilog();

 call epilog

;-1308 }


;-1309 


;-1310 


;-1311 


;-1312 int allocmem(unsigned int i) {

 ret
main_0 db "SetBlock , AX=",0
main_1 db "alloc memory, AX=",0
ENDP

allocmem: PROC

;-1313     unsigned int vAX; unsigned int vBX;


;-1314     DOS_ERR=0;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1312 NULL i = bp+4
;  201 var unsg word  1313 NULL vAX = bp-2
;  202 var unsg word  1313 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax

;-1315     bx=i;

 mov  bx, [bp+4]

;-1316     ax=0x4800;

 mov  ax, 18432

;-1317     DosInt();

 call DosInt

;-1318     asm mov [bp-2], ax; _ vAX=ax;

 mov [bp-2], ax; _ vAX=ax;

;-1319     asm mov [bp-4], bx; _ vBX=bx;

 mov [bp-4], bx; _ vBX=bx;

;-1320     if(DOS_ERR) return vBX;

 mov ax, [DOS_ERR]
 or  al, al
 je .allocmem587
 mov ax, [bp-4]
 jmp .retnallocmem

;-1321     return vAX;

.allocmem587:
 mov ax, [bp-2]
 jmp .retnallocmem

;-1322 }


;-1323 int to_far(char *dest, char *src) {

 .retnallocmem: LEAVE
 ret
ENDP

to_far: PROC

;-1324   segE;  es=ax;  si=src;  di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1323 NULL dest = bp+4
;  201 ptr sign byte  1323 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-1325   asm cld

 cld

;-1326   do{

.to_far588:

;-1327   asm lodsb  ; inc si

 lodsb  ; inc si

;-1328   asm stosb  ; inc di

 stosb  ; inc di

;-1329   } while (al != 0);

 cmp  al, 0
 je  .to_far589
 jmp .to_far588
.to_far589:

;-1330 }


;-1331 int from_far(char *dest, char *src) {
 LEAVE
 ret
ENDP

from_far: PROC

;-1332   segE;   es=ax;   si=src;   di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1331 NULL dest = bp+4
;  201 ptr sign byte  1331 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-1333   do{

.from_far590:

;-1334   asm mov al, [es:si]

 mov al, [es:si]

;-1335   asm inc si

 inc si

;-1336   asm mov [di], al

 mov [di], al

;-1337   asm inc di

 inc di

;-1338   } while (al != 0);

 cmp  al, 0
 je  .from_far591
 jmp .from_far590
.from_far591:

;-1339 }
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
;   10 def unsg byte    11    - T_NAME=256
;   11 def unsg byte    12    - T_CONST=257
;   12 def unsg byte    13    - T_STRING=258
;   13 def unsg byte    14    - T_INCLUDE=510
;   14 def unsg byte    15    - T_DEFINE=511
;   15 def unsg byte    16    - T_RETURN=512
;   16 def unsg byte    17    - T_IF=513
;   17 def unsg byte    18    - T_ELSE=514
;   18 def unsg byte    19    - T_WHILE=515
;   19 def unsg byte    20    - T_DO=516
;   20 def unsg byte    21    - T_INT=517
;   21 def unsg byte    22    - T_ASM=518
;   22 def unsg byte    23    - T_ASMBLOCK=519
;   23 def unsg byte    24    - T_EMIT=520
;   24 def unsg byte    25    - T_GOTO=521
;   25 def unsg byte    26    - T_VOID=529
;   26 def unsg byte    27    - T_CHAR=530
;   27 def unsg byte    28    - T_SIGNED=531
;   28 def unsg byte    29    - T_UNSIGNED=532
;   29 def unsg byte    30    - T_LONG=533
;   30 def unsg byte    31    - T_EQ=806
;   31 def unsg byte    32    - T_NE=807
;   32 def unsg byte    33    - T_GE=811
;   33 def unsg byte    34    - T_LE=824
;   34 def unsg byte    35    - T_PLUSPLUS=1219
;   35 def unsg byte    36    - T_MINUSMINUS=1225
;   36 def unsg byte    37    - T_PLUSASS=1230
;   37 def unsg byte    38    - T_MINUSASS=1231
;   38 def unsg byte    39    - T_MULASS=1232
;   39 def unsg byte    40    - T_DIVASS=1233
;   40 def unsg byte    41    - T_ANDASS=1234
;   41 def unsg byte    42    - T_ORASS=1235
;   42 def unsg byte    43    - T_LESSLESS=1240
;   43 def unsg byte    44    - T_GREATGREAT=1241
;   44 var unsg word    46    2 ORGDATAORIG
;   45 var unsg word    47   10 orgData
;   46 def unsg byte    48    - COMAX=3000
;   47 arr sign byte    49    4 co[3000]
;   48 var sign word    50    4 maxco
;   49 var sign word    51    3 maxco1
;   50 def unsg byte    52    - CMDLENMAX=67
;   51 arr sign byte    53    3 coname[67]
;   52 arr sign byte    54  103 symbol[128]
;   53 arr sign byte    55   12 fname[67]
;   54 arr sign byte    56    9 namein[67]
;   55 arr sign byte    57    7 namelst[67]
;   56 arr sign byte    58    2 archivename[67]
;   57 ptr sign byte    59    5 cloc
;   58 var sign word    60    6 fdin
;   59 var sign word    61    4 fdout
;   60 var sign word    62   41 token
;   61 var sign byte    63    1 globC
;   62 var sign word    64    3 column
;   63 var sign byte    65   28 thechar
;   64 var sign word    66    9 iscmp
;   65 var sign word    67    4 nconst
;   66 var sign word    68    3 nreturn
;   67 var sign word    69   12 nlabel
;   68 var sign word    70   24 GTop
;   69 var sign word    71   20 LTop
;   70 var unsg word    72   44 lexval
;   71 var sign word    73    6 typei
;   72 var sign byte    73    8 istype
;   73 var sign word    74    6 signi
;   74 var sign byte    74    5 issign
;   75 var sign word    75    9 widthi
;   76 var sign byte    75   19 iswidth
;   77 arr sign byte    76   11 GType[300]
;   78 arr sign byte    77    5 GSign[300]
;   79 arr sign byte    78    5 GWidth[300]
;   80 arr sign word    79    4 GAdr[300]
;   81 arr sign word    80    6 GUsed[300]
;   82 arr sign word    81   11 GData[300]
;   83 arr sign byte    82    2 GNameField[4800]
;   84 var sign word    83   26 wi
;   85 var sign word    84   13 FTop
;   86 var sign word    85    8 CTop
;   87 arr sign byte    86    2 FType[300]
;   88 arr sign byte    87    3 CType[2000]
;   89 arr sign word    88    2 FAdr[300]
;   90 arr sign word    89    4 CAdr[2000]
;   91 arr sign word    90    4 FCalls[300]
;   92 arr sign byte    91    5 FNameField[4800]
;   93 arr sign byte    92    7 NameA[32]
;   94 arr sign byte    93    5 fgetsdest[128]
;   95 ptr unsg byte    94    8 CNameTop
;   96 ptr unsg byte    95   10 fgetsp
;   97 var unsg word    96    3 segE
;   98 var unsg word    97   12 lineno
;   99 var unsg word    98    2 linenoinclude
;  100 ptr unsg byte    99   17 pt
;  101 ptr unsg byte   100    8 p1
;  102 var sign word   101    9 DOS_ERR
;  103 var sign word   102    3 DOS_NoBytes
;  104 var sign byte   103    3 DOS_ByteRead
;  105 arr sign byte   318    2 doglobName[15]
;  106 var sign word   488    5 mod1
;  107 var sign word   488   12 ireg1
;  108 var sign word   488    6 idx1
;  109 var sign word   488    1 ids1
;  110 var sign word   488    4 idw1
;  111 var sign word   488    2 idt1
;  112 var sign word   488 NULL val1
;  113 var sign word   489    2 mod2
;  114 var sign word   489    6 ireg2
;  115 var sign word   489    6 idx2
;  116 var sign word   489    1 ids2
;  117 var sign word   489    4 idw2
;  118 var sign word   489    2 idt2
;  119 var sign word   489    2 val2
;  120 arr sign byte   558    9 ops[5]
;  121 arr sign byte   600    3 printregstr[74]
;  122 var sign word   608    1 evalue
;  123 var sign word   608    1 exprtype
;  124 arr sign word   762    2 docalltype[10]
;  125 arr sign word   762    2 docallvalue[10]
;  126 arr sign byte   763    2 procname[17]
;  127 arr sign byte   904    2 symboltemp[80]
;  128 var unsg word  1167    1 MAXUI
;  129 ptr sign byte  1247    1 arglen
;  130 ptr sign byte  1247    2 argv


;   # Calls Line Width  Name   list of functions

;    0    4  106   writetty
;    1    1  107   putch
;    2    6  108   cputs
;    3    3  109   mkneg
;    4    8  111   DosInt
;    5    2  116   openR
;    6    1  117   creatR
;    7    2  118   fcloseR
;    8    4  119   exitR
;    9    1  120   readRL
;   10    1  122   fputcR
;   11    1  125   letter
;   12    3  135   digit
;   13    3  140   alnum
;   14    8  146   strlen
;   15   23  151   strcpy
;   16   74  157   eqstr
;   17    1  165   strcat1
;   18    1  169   toupper
;   19    2  175   instr1
;   20    4  184   a
;   21   21  186   v
;   22    4  191   checknamelen
;   23   32  197   next
;   24   78  204   istoken
;   25   36  211   expect
;   26    6  222   eprc
;   27    5  226   eprs
;   28   40  234   prc
;   29    3  243   prscomment
;   30    7  251   prnl
;   31  241  255   prs
;   32    2  274   eprnum
;   33    7  288   pint1
;   34   33  299   prunsign1
;   35   20  309   printint51
;   36    1  319   doglob
;   37   12  369   gettypes
;   38    9  378   adrofname
;   39    7  379   adrF
;   40    4  381   printName
;   41   12  385   searchname
;   42    3  389   checkName
;   43   10  394   typeName
;   44    3  410   name1
;   45    1  415   storecall
;   46    1  421   storefunc
;   47    2  425   addlocal
;   48    1  431   checkFunction
;   49    1  435   dofunc
;   50    1  478   isvariable
;   51    3  491   pexpr
;   52    1  498   constantexpr
;   53    3  508   exprstart
;   54    1  510   expr2
;   55    3  559   doreg1
;   56    6  578   checkreg
;   57    6  603   printreg
;   58    2  609   expr
;   59    4  658   compoundass
;   60    2  665   dovar1
;   61    8  686   rterm
;   62    1  699   isreg
;   63   15  717   doreg
;   64    1  723   doassign
;   65    1  741   domul
;   66    2  747   doidiv
;   67    1  760   domod
;   68    1  764   docall1
;   69    1  807   doinclude
;   70    1  818   dodefine
;   71    6  834   stmt
;   72    1  866   doemit
;   73    3  870   cmpneg
;   74    7  883   prlabel
;   75    3  884   prjump
;   76    1  885   doif
;   77    1  891   dodo
;   78    1  895   dowhile
;   79    4  898   isrelational
;   80   17  905   getlex
;   81    1  957   convertdefine
;   82    1  964   getdigit
;   83    1  973   getstring
;   84    2  977   fgets1
;   85    1  991   printinputline
;   86    1 1013   ifEOL
;   87    2 1024   end1
;   88   51 1029   error1
;   89    2 1049   listproc
;   90    1 1065   listcall
;   91    1 1074   calllisting
;   92    1 1087   countcalls
;   93    1 1098   listfunc
;   94    1 1112   funclisting
;   95    2 1131   listvar
;   96    1 1168   epilog
;   97    1 1198   checkcalls
;   98    2 1225   parse
;   99    2 1241   getfirstchar
;  100    1 1248   getarg
;  101    1 1287   setblock
;  102 NULL 1295   main
;  103    1 1312   allocmem
;  104    1 1323   to_far
;  105    3 1331   from_far

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
;  184  1242 exprstart
;  185  1252 prs
;  186  1256 prs
;  187  1260 expect
;  188  1267 getlex
;  189  1274 typeName
;  190  1283 searchname
;  191  1294 gettypes
;  192  1303 isrelational
;  193  1316 error1
;  194  1323 expect
;  195  1330 prs
;  196  1334 prs
;  197  1338 gettypes
;  198  1347 prs
;  199  1351 prs
;  200  1355 v
;  201  1357 prs
;  202  1361 prunsign1
;  203  1371 cmpneg
;  204  1378 prs
;  205  1382 expect
;  206  1389 eqstr
;  207  1395 expr2
;  208  1401 expr
;  209  1406 getlex
;  210  1413 typeName
;  211  1422 error1
;  212  1429 checkreg
;  213  1438 doreg1
;  214  1445 searchname
;  215  1456 gettypes
;  216  1465 error1
;  217  1472 isrelational
;  218  1485 error1
;  219  1492 istoken
;  220  1500 error1
;  221  1507 istoken
;  222  1515 prs
;  223  1519 prs
;  224  1523 prs
;  225  1527 prs
;  226  1531 prs
;  227  1535 v
;  228  1537 prs
;  229  1541 prunsign1
;  230  1551 adrofname
;  231  1561 prs
;  232  1565 prs
;  233  1569 typeName
;  234  1578 checkreg
;  235  1587 prs
;  236  1591 printreg
;  237  1600 v
;  238  1602 prs
;  239  1606 printreg
;  240  1615 error1
;  241  1622 searchname
;  242  1633 gettypes
;  243  1642 error1
;  244  1649 prs
;  245  1653 printreg
;  246  1662 error1
;  247  1669 prs
;  248  1673 a
;  249  1675 prs
;  250  1679 prs
;  251  1683 prs
;  252  1687 v
;  253  1689 adrofname
;  254  1699 prs
;  255  1703 prs
;  256  1707 error1
;  257  1714 istoken
;  258  1722 strcpy
;  259  1729 istoken
;  260  1737 strcpy
;  261  1744 istoken
;  262  1752 strcpy
;  263  1759 istoken
;  264  1767 strcpy
;  265  1774 istoken
;  266  1782 strcpy
;  267  1789 istoken
;  268  1797 strcpy
;  269  1804 istoken
;  270  1812 strcpy
;  271  1819 getlex
;  272  1826 isrelational
;  273  1839 error1
;  274  1846 strcpy
;  275  1853 prnl
;  276  1858 prs
;  277  1862 prs
;  278  1866 printreg
;  279  1875 prs
;  280  1879 istoken
;  281  1887 prunsign1
;  282  1897 typeName
;  283  1906 checkreg
;  284  1915 printreg
;  285  1924 searchname
;  286  1935 a
;  287  1937 v
;  288  1939 cmpneg
;  289  1946 prs
;  290  1950 expect
;  291  1957 strlen
;  292  1964 eqstr
;  293  1970 eqstr
;  294  1976 eqstr
;  295  1982 eqstr
;  296  1988 eqstr
;  297  1994 eqstr
;  298  2000 eqstr
;  299  2006 eqstr
;  300  2012 eqstr
;  301  2018 eqstr
;  302  2024 eqstr
;  303  2030 eqstr
;  304  2036 eqstr
;  305  2042 eqstr
;  306  2048 eqstr
;  307  2054 eqstr
;  308  2060 eqstr
;  309  2066 eqstr
;  310  2072 eqstr
;  311  2078 eqstr
;  312  2084 eqstr
;  313  2090 eqstr
;  314  2096 strlen
;  315  2103 eqstr
;  316  2109 eqstr
;  317  2115 eqstr
;  318  2121 eqstr
;  319  2127 eqstr
;  320  2133 eqstr
;  321  2139 eqstr
;  322  2145 eqstr
;  323  2151 eqstr
;  324  2157 prc
;  325  2161 prc
;  326  2165 prc
;  327  2169 istoken
;  328  2177 prs
;  329  2181 prunsign1
;  330  2191 typeName
;  331  2200 checkreg
;  332  2209 doreg1
;  333  2216 docall1
;  334  2224 isreg
;  335  2230 searchname
;  336  2241 gettypes
;  337  2250 istoken
;  338  2258 istoken
;  339  2266 expect
;  340  2273 searchname
;  341  2284 expect
;  342  2291 expect
;  343  2298 gettypes
;  344  2307 error1
;  345  2314 istoken
;  346  2322 error1
;  347  2329 prs
;  348  2333 prs
;  349  2337 prs
;  350  2341 v
;  351  2343 istoken
;  352  2351 error1
;  353  2358 prs
;  354  2362 prs
;  355  2366 prs
;  356  2370 v
;  357  2372 istoken
;  358  2380 compoundass
;  359  2392 istoken
;  360  2400 compoundass
;  361  2412 istoken
;  362  2420 compoundass
;  363  2432 istoken
;  364  2440 compoundass
;  365  2452 istoken
;  366  2460 error1
;  367  2467 istoken
;  368  2475 error1
;  369  2482 istoken
;  370  2490 expr
;  371  2495 doassign
;  372  2504 dovar1
;  373  2511 istoken
;  374  2519 rterm
;  375  2525 istoken
;  376  2533 rterm
;  377  2539 istoken
;  378  2547 rterm
;  379  2553 istoken
;  380  2561 rterm
;  381  2567 istoken
;  382  2575 rterm
;  383  2581 istoken
;  384  2589 rterm
;  385  2595 istoken
;  386  2603 domul
;  387  2609 istoken
;  388  2617 doidiv
;  389  2624 istoken
;  390  2632 domod
;  391  2638 isrelational
;  392  2651 rterm
;  393  2657 cmpneg
;  394  2664 error1
;  395  2671 prnl
;  396  2676 prs
;  397  2680 prs
;  398  2684 gettypes
;  399  2693 prs
;  400  2697 prs
;  401  2701 v
;  402  2703 prs
;  403  2707 expect
;  404  2714 prunsign1
;  405  2724 gettypes
;  406  2733 prs
;  407  2737 v
;  408  2739 prnl
;  409  2744 prs
;  410  2748 prs
;  411  2752 prs
;  412  2756 prnl
;  413  2761 prs
;  414  2765 prs
;  415  2769 a
;  416  2771 prs
;  417  2775 v
;  418  2777 prs
;  419  2781 prs
;  420  2785 prs
;  421  2789 prs
;  422  2793 prs
;  423  2797 prc
;  424  2801 printName
;  425  2811 prs
;  426  2815 prnl
;  427  2820 prs
;  428  2824 prs
;  429  2828 prs
;  430  2832 prs
;  431  2836 v
;  432  2838 istoken
;  433  2846 prnl
;  434  2851 prs
;  435  2855 prs
;  436  2859 prs
;  437  2863 prs
;  438  2867 prunsign1
;  439  2877 typeName
;  440  2886 searchname
;  441  2897 istoken
;  442  2905 searchname
;  443  2916 expect
;  444  2923 expect
;  445  2930 gettypes
;  446  2939 error1
;  447  2946 eqstr
;  448  2952 dovar1
;  449  2959 eqstr
;  450  2965 doreg
;  451  2971 eqstr
;  452  2977 doreg
;  453  2983 eqstr
;  454  2989 doreg
;  455  2995 eqstr
;  456  3001 doreg
;  457  3007 eqstr
;  458  3013 doreg
;  459  3019 eqstr
;  460  3025 doreg
;  461  3031 eqstr
;  462  3037 doreg
;  463  3043 eqstr
;  464  3049 doreg
;  465  3055 eqstr
;  466  3061 doreg
;  467  3067 eqstr
;  468  3073 doreg
;  469  3079 eqstr
;  470  3085 doreg
;  471  3091 eqstr
;  472  3097 doreg
;  473  3103 eqstr
;  474  3109 doreg
;  475  3115 eqstr
;  476  3121 doreg
;  477  3127 eqstr
;  478  3133 doreg
;  479  3139 expect
;  480  3146 prs
;  481  3150 prs
;  482  3154 prs
;  483  3158 istoken
;  484  3166 prunsign1
;  485  3176 istoken
;  486  3184 searchname
;  487  3195 v
;  488  3197 error1
;  489  3204 gettypes
;  490  3213 prs
;  491  3217 v
;  492  3219 prs
;  493  3223 prs
;  494  3227 prs
;  495  3231 a
;  496  3233 prs
;  497  3237 prs
;  498  3241 prunsign1
;  499  3251 v
;  500  3253 prs
;  501  3257 prs
;  502  3261 printName
;  503  3271 prs
;  504  3275 prs
;  505  3279 prs
;  506  3283 prs
;  507  3287 v
;  508  3289 prs
;  509  3293 prs
;  510  3297 prs
;  511  3301 v
;  512  3303 prs
;  513  3307 prs
;  514  3311 prs
;  515  3315 v
;  516  3317 prs
;  517  3321 rterm
;  518  3327 istoken
;  519  3335 prs
;  520  3339 prunsign1
;  521  3349 prs
;  522  3353 error1
;  523  3360 istoken
;  524  3368 prs
;  525  3372 prunsign1
;  526  3382 prs
;  527  3386 prs
;  528  3390 typeName
;  529  3399 searchname
;  530  3410 error1
;  531  3417 gettypes
;  532  3426 error1
;  533  3433 error1
;  534  3440 prs
;  535  3444 v
;  536  3446 prs
;  537  3450 prs
;  538  3454 doidiv
;  539  3461 prs
;  540  3465 checknamelen
;  541  3478 strcpy
;  542  3485 storecall
;  543  3495 expect
;  544  3502 istoken
;  545  3510 error1
;  546  3517 istoken
;  547  3525 istoken
;  548  3533 eprs
;  549  3538 eprs
;  550  3543 eprc
;  551  3548 eprnum
;  552  3555 eprs
;  553  3560 eprc
;  554  3565 eprs
;  555  3570 eprc
;  556  3575 eprs
;  557  3580 istoken
;  558  3588 name1
;  559  3594 searchname
;  560  3605 istoken
;  561  3613 checkreg
;  562  3622 searchname
;  563  3633 error1
;  564  3640 istoken
;  565  3648 expect
;  566  3655 prs
;  567  3659 prunsign1
;  568  3669 prs
;  569  3673 prs
;  570  3677 prc
;  571  3681 prunsign1
;  572  3691 prs
;  573  3695 v
;  574  3697 prs
;  575  3701 gettypes
;  576  3710 prs
;  577  3714 v
;  578  3716 prs
;  579  3720 v
;  580  3722 prs
;  581  3726 prs
;  582  3730 printreg
;  583  3739 prs
;  584  3743 prs
;  585  3747 prs
;  586  3751 prunsign1
;  587  3761 prs
;  588  3765 prs
;  589  3769 openR
;  590  3775 prs
;  591  3779 prs
;  592  3783 error1
;  593  3790 parse
;  594  3796 prs
;  595  3800 prs
;  596  3804 getfirstchar
;  597  3817 getlex
;  598  3824 eqstr
;  599  3830 getlex
;  600  3837 eqstr
;  601  3843 getlex
;  602  3850 prs
;  603  3854 strcpy
;  604  3861 prs
;  605  3865 error1
;  606  3872 getlex
;  607  3879 expect
;  608  3886 error1
;  609  3893 strlen
;  610  3900 error1
;  611  3907 adrofname
;  612  3917 strcpy
;  613  3924 expect
;  614  3931 istoken
;  615  3939 istoken
;  616  3947 stmt
;  617  3952 istoken
;  618  3960 doif
;  619  3965 istoken
;  620  3973 dodo
;  621  3978 istoken
;  622  3986 dowhile
;  623  3994 istoken
;  624  4002 prs
;  625  4006 name1
;  626  4012 prs
;  627  4016 expect
;  628  4023 prs
;  629  4027 next
;  630  4032 prc
;  631  4036 next
;  632  4041 getlex
;  633  4048 istoken
;  634  4056 prs
;  635  4060 next
;  636  4065 prc
;  637  4069 next
;  638  4074 getlex
;  639  4081 error1
;  640  4088 istoken
;  641  4096 doemit
;  642  4103 istoken
;  643  4111 istoken
;  644  4119 exprstart
;  645  4129 prs
;  646  4133 prs
;  647  4137 expect
;  648  4144 prs
;  649  4148 prs
;  650  4152 prc
;  651  4156 expect
;  652  4163 expect
;  653  4170 exprstart
;  654  4180 expect
;  655  4187 prs
;  656  4191 getlex
;  657  4198 prunsign1
;  658  4208 getlex
;  659  4215 prc
;  660  4219 expect
;  661  4226 prs
;  662  4230 prs
;  663  4234 prs
;  664  4238 prs
;  665  4242 prs
;  666  4246 prunsign1
;  667  4256 prs
;  668  4260 prs
;  669  4264 prunsign1
;  670  4274 prs
;  671  4278 prs
;  672  4282 prs
;  673  4286 error1
;  674  4293 prs
;  675  4297 prs
;  676  4301 prunsign1
;  677  4311 prc
;  678  4315 prs
;  679  4319 prs
;  680  4323 prunsign1
;  681  4333 pexpr
;  682  4339 pint1
;  683  4345 stmt
;  684  4350 istoken
;  685  4358 prjump
;  686  4365 prlabel
;  687  4373 stmt
;  688  4378 prlabel
;  689  4386 prlabel
;  690  4394 prlabel
;  691  4402 stmt
;  692  4407 expect
;  693  4414 pexpr
;  694  4420 pint1
;  695  4426 prjump
;  696  4433 prlabel
;  697  4441 prlabel
;  698  4449 pexpr
;  699  4455 pint1
;  700  4461 stmt
;  701  4466 prjump
;  702  4473 prlabel
;  703  4481 getlex
;  704  4488 next
;  705  4493 next
;  706  4498 next
;  707  4503 next
;  708  4508 next
;  709  4513 next
;  710  4518 next
;  711  4523 next
;  712  4528 next
;  713  4533 next
;  714  4538 next
;  715  4543 next
;  716  4548 next
;  717  4553 next
;  718  4558 next
;  719  4563 instr1
;  720  4570 next
;  721  4575 ifEOL
;  722  4581 getlex
;  723  4588 next
;  724  4593 next
;  725  4598 getlex
;  726  4605 getstring
;  727  4615 digit
;  728  4621 getdigit
;  729  4630 next
;  730  4635 next
;  731  4640 next
;  732  4645 alnum
;  733  4651 strcpy
;  734  4658 alnum
;  735  4664 next
;  736  4669 eqstr
;  737  4675 eqstr
;  738  4681 eqstr
;  739  4687 eqstr
;  740  4693 eqstr
;  741  4699 eqstr
;  742  4705 eqstr
;  743  4711 eqstr
;  744  4717 eqstr
;  745  4723 eqstr
;  746  4729 eqstr
;  747  4735 eqstr
;  748  4741 eqstr
;  749  4747 eqstr
;  750  4753 eqstr
;  751  4759 eqstr
;  752  4765 eqstr
;  753  4771 convertdefine
;  754  4785 strcpy
;  755  4792 error1
;  756  4799 adrofname
;  757  4809 eqstr
;  758  4815 next
;  759  4820 alnum
;  760  4826 next
;  761  4831 digit
;  762  4837 next
;  763  4842 next
;  764  4847 next
;  765  4852 printinputline
;  766  4867 readRL
;  767  4874 error1
;  768  4881 prs
;  769  4885 prunsign1
;  770  4895 prc
;  771  4899 prscomment
;  772  4910 next
;  773  4915 fcloseR
;  774  4923 fcloseR
;  775  4931 exitR
;  776  4937 prnl
;  777  4942 prscomment
;  778  4953 prs
;  779  4957 prunsign1
;  780  4967 prs
;  781  4971 prs
;  782  4975 prs
;  783  4979 prunsign1
;  784  4989 prs
;  785  4993 prunsign1
;  786  5003 prs
;  787  5007 prs
;  788  5011 end1
;  789  5016 prs
;  790  5020 prs
;  791  5024 prs
;  792  5028 prunsign1
;  793  5038 prs
;  794  5042 prs
;  795  5046 listvar
;  796  5054 prs
;  797  5058 calllisting
;  798  5070 prs
;  799  5074 printint51
;  800  5085 prc
;  801  5089 prs
;  802  5093 printint51
;  803  5104 prc
;  804  5108 from_far
;  805  5117 prs
;  806  5121 adrF
;  807  5126 from_far
;  808  5135 eqstr
;  809  5141 prs
;  810  5145 countcalls
;  811  5156 funclisting
;  812  5168 prs
;  813  5172 printint51
;  814  5183 printint51
;  815  5194 prs
;  816  5198 printint51
;  817  5209 prc
;  818  5213 prs
;  819  5217 prs
;  820  5221 prs
;  821  5225 prs
;  822  5229 prc
;  823  5233 prc
;  824  5237 adrF
;  825  5242 prs
;  826  5246 prs
;  827  5250 printint51
;  828  5261 prc
;  829  5265 prs
;  830  5269 prs
;  831  5273 prs
;  832  5277 prs
;  833  5281 prs
;  834  5285 prs
;  835  5289 prs
;  836  5293 prs
;  837  5297 prs
;  838  5301 printint51
;  839  5312 printint51
;  840  5323 prs
;  841  5327 prs
;  842  5331 prc
;  843  5335 adrofname
;  844  5345 prs
;  845  5349 prc
;  846  5353 prunsign1
;  847  5363 prc
;  848  5367 prunsign1
;  849  5377 prc
;  850  5381 prs
;  851  5385 prc
;  852  5389 pint1
;  853  5395 prs
;  854  5399 prs
;  855  5403 listvar
;  856  5411 listfunc
;  857  5420 listcall
;  858  5429 prs
;  859  5433 prs
;  860  5437 prs
;  861  5441 prs
;  862  5445 prs
;  863  5449 printint51
;  864  5460 prs
;  865  5464 printint51
;  866  5475 prs
;  867  5479 printint51
;  868  5490 prs
;  869  5494 printint51
;  870  5505 prs
;  871  5509 printint51
;  872  5520 prs
;  873  5524 printint51
;  874  5535 prs
;  875  5539 printint51
;  876  5550 prs
;  877  5554 printint51
;  878  5565 prs
;  879  5569 prs
;  880  5573 prs
;  881  5577 printint51
;  882  5588 prs
;  883  5592 printint51
;  884  5603 prs
;  885  5607 prs
;  886  5611 printint51
;  887  5622 prs
;  888  5626 end1
;  889  5631 prs
;  890  5635 from_far
;  891  5644 adrF
;  892  5649 eqstr
;  893  5655 prs
;  894  5659 prs
;  895  5663 prs
;  896  5667 printint51
;  897  5678 error1
;  898  5685 prs
;  899  5689 getlex
;  900  5696 istoken
;  901  5704 istoken
;  902  5712 dodefine
;  903  5721 istoken
;  904  5729 doinclude
;  905  5739 error1
;  906  5746 typeName
;  907  5755 dofunc
;  908  5762 doglob
;  909  5769 fgets1
;  910  5776 cputs
;  911  5782 cputs
;  912  5788 exitR
;  913  5794 toupper
;  914  5802 strcpy
;  915  5809 instr1
;  916  5816 strcat1
;  917  5824 strcpy
;  918  5831 strlen
;  919  5838 openR
;  920  5844 cputs
;  921  5850 cputs
;  922  5856 exitR
;  923  5862 creatR
;  924  5869 cputs
;  925  5875 cputs
;  926  5881 exitR
;  927  5887 prs
;  928  5891 prs
;  929  5895 prs
;  930  5899 prs
;  931  5903 prs
;  932  5907 prs
;  933  5911 prs
;  934  5915 DosInt
;  935  5922 getarg
;  936  5929 setblock
;  937  5938 error1
;  938  5945 allocmem
;  939  5954 error1
;  940  5961 getfirstchar
;  941  5974 parse
;  942  5980 checkcalls
;  943  5991 epilog
;  944  5998 DosInt
;Input: A.C, List: A.S,  Lines: 1340
;Glob. variables:  130 max.:  200
;Functions      :  106 max.:  300
;Calls          :  945 max.: 2000, NameField: 6005
;Const in 'expr2' :  754 max.: 3000, stacksize: 16987