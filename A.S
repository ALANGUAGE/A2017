
; A.COM V0.9.2, Source: A.C, Output asm: A.S
org  256 
jmp main

;-1 char Version1[]="A.COM V0.9.2";//todo: 2. op=reg not recognized

Version1 db "A.COM V0.9.2",0

;-2 #define IDLENMAX       15//max length of names


;-3 #define COLUMNMAX     128//output, input is 80


;-4 #define T_NAME        256//the following defines for better clearity


;-5 #define T_CONST       257


;-6 #define T_STRING      258


;-7 #define T_DEFINE      511


;-8 #define T_RETURN      512


;-9 #define T_IF          513


;-10 #define T_ELSE        514


;-11 #define T_WHILE       515


;-12 #define T_DO          516


;-13 #define T_INT         517


;-14 #define T_ASM         518


;-15 #define T_ASMBLOCK    519


;-16 #define T_EMIT        520


;-17 #define T_GOTO        521


;-18 #define T_VOID        529


;-19 #define T_CHAR        530


;-20 #define T_SIGNED      531


;-21 #define T_UNSIGNED    532


;-22 #define T_LONG        533


;-23 #define T_EQ          806


;-24 #define T_NE          807


;-25 #define T_GE          811


;-26 #define T_LE          824


;-27 #define T_PLUSPLUS   1219


;-28 #define T_MINUSMINUS 1225


;-29 #define T_PLUSASS    1230


;-30 #define T_MINUSASS   1231


;-31 #define T_MULASS     1232


;-32 #define T_DIVASS     1233


;-33 #define T_ANDASS     1234


;-34 #define T_ORASS      1235


;-35 #define T_LESSLESS   1240


;-36 #define T_GREATGREAT 1241


;-37 


;-38 unsigned int ORGDATAORIG=25000;//start of arrays

ORGDATAORIG dw 25000

;-39 unsigned int orgData;//actual max of array, must be less than stack

orgData dw 0

;-40 #define COMAX        2000


;-41 char co[COMAX];//constant storage

section .bss
absolute 25000
co resb 2000
section .text

;-42 int maxco=0;

maxco dw 0

;-43 int maxco1=0;

maxco1 dw 0

;-44 #define CMDLENMAX      67


;-45 char coname[CMDLENMAX];

section .bss
absolute 27000
coname resb 67
section .text

;-46 char symbol[COLUMNMAX];

section .bss
absolute 27067
symbol resb 128
section .text

;-47 char fname[CMDLENMAX];

section .bss
absolute 27195
fname resb 67
section .text

;-48 char namein[CMDLENMAX];

section .bss
absolute 27262
namein resb 67
section .text

;-49 char namelst[CMDLENMAX];

section .bss
absolute 27329
namelst resb 67
section .text

;-50 char *cloc=0;

cloc dw 0

;-51 int fdin=0;

fdin dw 0

;-52 int fdout=0;

fdout dw 0

;-53 int token=0;

token dw 0

;-54 char globC=0;

globC db 0

;-55 int column=0;

column dw 0

;-56 char thechar=0;   //reads one char forward

thechar db 0

;-57 int iscmp=0;

iscmp dw 0

;-58 int nconst=0;

nconst dw 0

;-59 int nreturn=0;

nreturn dw 0

;-60 int nlabel=0;

nlabel dw 0

;-61 unsigned int lexval=0;

lexval dw 0

;-62 int typei;       char istype;

typei dw 0
istype db 0

;-63 int signi;       char issign;

signi dw 0
issign db 0

;-64 int widthi;      char iswidth;

widthi dw 0
iswidth db 0

;-65 int wi=0;

wi dw 0

;-66 #define VARMAX        300//max global and local var


;-67 #define LSTART        200//max global var


;-68 #define GNAMEMAX     4800// 16*VARMAX


;-69 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 27396
GType resb 300
section .text

;-70 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 27696
GSign resb 300
section .text

;-71 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 27996
GWidth resb 300
section .text

;-72 int GAdr  [VARMAX];

section .bss
absolute 28296
GAdr resw 300
section .text

;-73 int GUsed [VARMAX];

section .bss
absolute 28896
GUsed resw 300
section .text

;-74 int GData [VARMAX];

section .bss
absolute 29496
GData resw 300
section .text

;-75 char GNameField[GNAMEMAX];

section .bss
absolute 30096
GNameField resb 4800
section .text

;-76 int GTop=1;

GTop dw 1

;-77 int LTop=LSTART;

LTop dw 200

;-78 #define FUNCMAX       300//max functions


;-79 #define FNAMEMAX     4800// 16*FUNCMAX


;-80 char FType [FUNCMAX];

section .bss
absolute 34896
FType resb 300
section .text

;-81 int  FAdr  [FUNCMAX];

section .bss
absolute 35196
FAdr resw 300
section .text

;-82 int  FCalls[FUNCMAX];

section .bss
absolute 35796
FCalls resw 300
section .text

;-83 char FNameField[FNAMEMAX];

section .bss
absolute 36396
FNameField resb 4800
section .text

;-84 int  FTop=0;

FTop dw 0

;-85 #define CALLMAX      1500//max call


;-86 char CType[CALLMAX];

section .bss
absolute 41196
CType resb 1500
section .text

;-87 int  CAdr [CALLMAX];

section .bss
absolute 42696
CAdr resw 1500
section .text

;-88 #define CNAMEMAX    10000//space for call names


;-89 char CNameField[10016];//CNAMEMAX+IDLENMAX+1

section .bss
absolute 45696
CNameField resb 10016
section .text

;-90 char *CNamePtr;     //first free position in CNameField

CNamePtr dw 0

;-91 unsigned char *CNameTop=0;

CNameTop dw 0

;-92 int  CTop=0;

CTop dw 0

;-93 


;-94 


;-95 char NameA[]="12345678901234567890123456789012"; //must be in low memory

NameA db "12345678901234567890123456789012",0

;-96 char fgetsdest[COLUMNMAX];

section .bss
absolute 55712
fgetsdest resb 128
section .text

;-97 unsigned char *fgetsp=0;

fgetsp dw 0

;-98 unsigned int segE;

segE dw 0

;-99 unsigned int lineno=1;

lineno dw 1

;-100 unsigned int linenoinclude=1;

linenoinclude dw 1

;-101 unsigned char *pt=0;

pt dw 0

;-102 unsigned char *p1=0;

p1 dw 0

;-103 int DOS_ERR=0;

DOS_ERR dw 0

;-104 int DOS_NoBytes=0;

DOS_NoBytes dw 0

;-105 char DOS_ByteRead=0;

DOS_ByteRead db 0

;-106 


;-107 


;-108 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-109 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }

 ret
ENDP

putch: PROC
;Function : putch, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   109 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
 mov  al, 13
 call writetty
.putch1:
 mov  al, [bp+4]
 call writetty

;-110 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
ENDP

cputs: PROC
;Function : cputs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   110 NULL s = bp+4
;  201 var sign byte   110 NULL c = bp-2;
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

;-111 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC
;Function : mkneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   111 NULL n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-112 


;-113 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-114     __emit__(0xCD,0x21);//inth 0x21;

 db 205,33

;-115     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-116     DOS_ERR++;

 inc  word[DOS_ERR]

;-117 }


;-118 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC
;Function : openR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   118 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-119 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC
;Function : creatR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   119 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-120 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC
;Function : fcloseR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   120 NULL fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-121 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC
;Function : exitR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   121 NULL c = bp+4;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-122 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-123     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}

;Function : readRL, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   122 NULL s = bp+4
;  201 var sign word   122 NULL fd = bp+6
;  202 var sign word   122 NULL len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-124 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC
;Function : fputcR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   124 NULL n = bp+4
;  201 var sign word   124 NULL fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]

;-125   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-126 


;-127   int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-128       if (c=='_') return 1;

;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   127 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-129       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-130       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-131       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-132       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-133       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-134       if (c> 'Z') { if (c< 'a') return 0; }

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

;-135       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-136   }


;-137   int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-138       if(c<'0') return 0;

;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   137 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-139       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-140       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-141   }


;-142   int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-143     if (digit (c)) return 1;

;Function : alnum, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   142 NULL c = bp+4;
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

;-144     if (letter(c)) return 1;

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

;-145     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-146   }


;-147 


;-148 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-149     c=0;

;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   148 NULL s = bp+4
;  201 var sign word   148 NULL c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-150     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-151     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-152 }


;-153 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-154     do { *s=*t; s++; t++; }

;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   153 NULL s = bp+4
;  201 ptr sign byte   153 NULL t = bp+6;
 ENTER  0,0
.strcpy18:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]

;-155     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-156     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-157     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-158 }


;-159 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-160     while(*p) {

;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   159 NULL p = bp+4
;  201 ptr sign byte   159 NULL q = bp+6;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-161         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-162         p++;

.eqstr22:
 inc  word[bp+4]

;-163         q++;

 inc  word[bp+6]

;-164     }


;-165     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-166     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-167 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-168     while (*s != 0) s++;

;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   167 NULL s = bp+4
;  201 ptr sign byte   167 NULL t = bp+6;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-169     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-170 }


;-171 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-172     while(*s) {

;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   171 NULL s = bp+4;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-173         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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

;-174         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-175     }


;-176 }

 jmp .toupper26
.toupper27:

;-177 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-178     while(*s) {

;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   177 NULL s = bp+4
;  201 var sign byte   177 NULL c = bp+6;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-179         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-180         s++;

.instr132:
 inc  word[bp+4]

;-181     }


;-182     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-183 }


;-184 


;-185 


;-186 int a(unsigned int i) { printName(i);//address

 .retninstr1: LEAVE
 ret
ENDP

a: PROC
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   186 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-187 }


;-188 int v(unsigned int i) {//value
 LEAVE
 ret
ENDP

v: PROC

;-189     if (i < LSTART) prc('[');

;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   188 NULL i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v33
 push 91
 call prc
 add  sp, 2

;-190     printName(i);

.v33:
 push word [bp+4]
 call printName
 add  sp, 2

;-191     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v34
 push 93
 call prc
 add  sp, 2

;-192 }

.v34:

;-193 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-194     int i;


;-195     i=strlen(symbol);

;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   194 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-196     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen35
 push checknamelen_0
 call error1
 add  sp, 2

;-197 }

.checknamelen35:

;-198 


;-199 int next() {
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

next: PROC

;-200     char r;


;-201     r = thechar;

;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   200 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-202     globC=r;

 mov al, [bp-2]
 mov byte [globC], al

;-203     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-204     return r;

 mov al, [bp-2]
 jmp .retnnext

;-205 }


;-206 int istoken(int t) {

 .retnnext: LEAVE
 ret
ENDP

istoken: PROC

;-207     if (token == t) {

;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   206 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken36

;-208         token=getlex();

 call getlex
 mov word [token], ax

;-209         return 1;

 mov ax, 1
 jmp .retnistoken

;-210     }


;-211     return 0;

.istoken36:
 mov ax, 0
 jmp .retnistoken

;-212 }


;-213 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-214     if (istoken(t)==0) {

;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   213 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect37

;-215         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-216         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-217         listproc();

 call listproc

;-218         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-219         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-220         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-221     }


;-222 }

.expect37:

;-223 


;-224 int eprc(char c)  {
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

eprc: PROC

;-225     *cloc=c;

;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   224 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al

;-226     cloc++;

 inc  word[cloc]

;-227 }


;-228 int eprs(char *s) {
 LEAVE
 ret
ENDP

eprs: PROC

;-229     char c;


;-230     while(*s) {

;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   228 NULL s = bp+4
;  201 var sign byte   229 NULL c = bp-2;
 ENTER  2,0
.eprs38:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs39

;-231         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-232         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2

;-233         s++;

 inc  word[bp+4]

;-234     }


;-235 }

 jmp .eprs38
.eprs39:

;-236 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-237     if (c==10) {

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   236 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc40

;-238         _AX=13;

 mov  ax, 13

;-239         writetty();

 call writetty

;-240     }


;-241     _AL=c;

.prc40:
 mov  al, [bp+4]

;-242     writetty();

 call writetty

;-243     fputcR(c, fdout);

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-244 }


;-245 int prscomment(unsigned char *s) {
 LEAVE
 ret
ENDP

prscomment: PROC

;-246     unsigned char c;


;-247     while(*s){

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   245 NULL s = bp+4
;  201 var unsg byte   246 NULL c = bp-2;
 ENTER  2,0
.prscomment41:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment42

;-248         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-249         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-250         s++;

 inc  word[bp+4]

;-251     }


;-252 }

 jmp .prscomment41
.prscomment42:

;-253 int prnl() {
 LEAVE
 ret
ENDP

prnl: PROC

;-254     prs("\n ");

 push prnl_0
 call prs
 add  sp, 2

;-255 }


;-256 


;-257 int prs(unsigned char *s) {

 ret
prnl_0 db "\n ",0
ENDP

prs: PROC

;-258     unsigned char c; int com;


;-259     com=0;

;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   257 NULL s = bp+4
;  201 var unsg byte   258 NULL c = bp-2
;  202 var sign word   258 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-260     while(*s) {

.prs43:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs44

;-261         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-262         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs45
 mov ax, [bp-4]
 or  al, al
 je .prs46
 mov ax, 0
 mov [bp-4], ax

;-263                    else com=1;

 jmp .prs47
.prs46:
 mov ax, 1
 mov [bp-4], ax

;-264         if (c==92) {

.prs47:
.prs45:
 mov al, [bp-2]
 cmp al, 92
 jne .prs48

;-265             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs49

;-266                 s++;

 inc  word[bp+4]

;-267                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-268                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs50
 mov ax, 10
 mov [bp-2], al

;-269                 if (c=='t') c= 9;

.prs50:
 mov al, [bp-2]
 cmp al, 116
 jne .prs51
 mov ax, 9
 mov [bp-2], al

;-270             }

.prs51:

;-271         }

.prs49:

;-272         prc(c);

.prs48:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-273         s++;

 inc  word[bp+4]

;-274     }


;-275 }

 jmp .prs43
.prs44:

;-276 int eprnum(int n){//for docall1 procedure
 LEAVE
 ret
ENDP

eprnum: PROC

;-277     int e;


;-278     if(n<0) {

;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   276 NULL n = bp+4
;  201 var sign word   277 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum52

;-279         eprc('-');

 push 45
 call eprc
 add  sp, 2

;-280         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-281     }


;-282     if (n >= 10) {

.eprnum52:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum53

;-283         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-284         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2

;-285     }


;-286     n=n%10;

.eprnum53:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-287     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax

;-288     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2

;-289 }


;-290 int pint1 (int n){
 LEAVE
 ret
ENDP

pint1: PROC

;-291     int e;


;-292     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   290 NULL n = bp+4
;  201 var sign word   291 NULL e = bp-2;
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

;-293     if (n >= 10) {

.pint154:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint155

;-294         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-295         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2

;-296     }


;-297     n=n%10;

.pint155:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-298     n += '0';

 add  word[bp+4], 48

;-299     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-300 }


;-301 int prunsign1(unsigned int n) {
 LEAVE
 ret
ENDP

prunsign1: PROC

;-302     unsigned int e;


;-303     if (n >= 10) {

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   301 NULL n = bp+4
;  201 var unsg word   302 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign156

;-304         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax

;-305         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-306     }


;-307     n = n % 10; /*unsigned mod*/

.prunsign156:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax

;-308     n += '0';

 add  word[bp+4], 48

;-309     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-310 }


;-311 int printint51(unsigned int j)  {
 LEAVE
 ret
ENDP

printint51: PROC

;-312     if (j<10000) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   311 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint5157
 push 32
 call prc
 add  sp, 2

;-313     if (j<1000) prc(32);

.printint5157:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint5158
 push 32
 call prc
 add  sp, 2

;-314     if (j<100) prc(32);

.printint5158:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint5159
 push 32
 call prc
 add  sp, 2

;-315     if (j<10) prc(32);

.printint5159:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint5160
 push 32
 call prc
 add  sp, 2

;-316     prunsign1(j);

.printint5160:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-317 }


;-318 


;-319 


;-320 char doglobName[IDLENMAX];
 LEAVE
 ret
ENDP
section .bss
absolute 55840
doglobName resb 15
section .text

;-321 int doglob() {


doglob: PROC

;-322     int i; int j; int isstrarr; isstrarr=0;

;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   322 NULL i = bp-2
;  201 var sign word   322 NULL j = bp-4
;  202 var sign word   322 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-323   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob61
 push doglob_0
 call error1
 add  sp, 2

;-324   if (iswidth == 0) error1("no VOID as var type");

.doglob61:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob62
 push doglob_1
 call error1
 add  sp, 2

;-325   checknamelen();

.doglob62:
 call checknamelen

;-326   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob63
 push doglob_2
 call error1
 add  sp, 2

;-327   if (istoken('[')) { istype='&';

.doglob63:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob64
 mov ax, 38
 mov byte [istype], al

;-328     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob65

;-329       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-330       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-331       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-332       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob66
 push doglob_5
 call prs
 add  sp, 2

;-333       if (iswidth==2) prs(" resw ");

.doglob66:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob67
 push doglob_6
 call prs
 add  sp, 2

;-334       if (iswidth==4) prs(" resd ");

.doglob67:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob68
 push doglob_7
 call prs
 add  sp, 2

;-335       prunsign1(lexval);

.doglob68:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-336       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-337       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-338       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob69
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-339       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

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

;-340       GData[GTop]=lexval; expect(']');

.doglob70:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-341     }else { expect(']');

 jmp .doglob71
.doglob65:
 push 93
 call expect
 add  sp, 2

;-342       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob72
 push doglob_9
 call error1
 add  sp, 2

;-343       prs("\n"); prs(symbol); prs(" db ");

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

;-344       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-345       expect('=');

 push 61
 call expect
 add  sp, 2

;-346       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob73

;-347         prc(34); prscomment(symbol); prc(34); prs(",0");

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

;-348         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-349       else if (istoken('{' )) { i=0;

 jmp .doglob74
.doglob73:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob75
 mov ax, 0
 mov [bp-2], ax

;-350         do { if(i) prc(',');

.doglob76:
 mov ax, [bp-2]
 or  al, al
 je .doglob77
 push 44
 call prc
 add  sp, 2

;-351           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob77:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-352         while (istoken(',')); expect('}'); }

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

;-353       else error1("String or number array expected");

 jmp .doglob79
.doglob75:
 push doglob_13
 call error1
 add  sp, 2

;-354       };

.doglob79:
.doglob74:
.doglob71:

;-355   }else { //expect('=');

 jmp .doglob80
.doglob64:

;-356     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

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

;-357     else {

 jmp .doglob82
.doglob81:

;-358       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob83
 push doglob_16
 call prs
 add  sp, 2

;-359       else if (iswidth==2) prs(" dw ");

 jmp .doglob84
.doglob83:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob85
 push doglob_17
 call prs
 add  sp, 2

;-360       else                 prs(" dd ");

 jmp .doglob86
.doglob85:
 push doglob_18
 call prs
 add  sp, 2

;-361     }

.doglob86:
.doglob84:

;-362     if(istoken('-')) prc('-');

.doglob82:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob87
 push 45
 call prc
 add  sp, 2

;-363     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

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

;-364     else prunsign1(0); }

 jmp .doglob89
.doglob88:
 push 0
 call prunsign1
 add  sp, 2
.doglob89:

;-365   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

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

;-366   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-367   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-368   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

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

;-369   GTop++; expect(';'); }

.doglob91:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-370 


;-371 int gettypes(int i) {int j; char c;
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

;-372   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   371 NULL i = bp+4
;  201 var sign word   371 NULL j = bp-2
;  202 var sign byte   371 NULL c = bp-4;
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

;-373   c=GWidth[i]; widthi=0;wi=0;

.gettypes93:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-374   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes94
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-375   if (c==2) {widthi=2;wi=2;}

.gettypes94:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes95
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-376   if (c==4) {widthi=4;wi=4;}

.gettypes95:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes96
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-377   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

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

;-378   if (c=='&')  typei=2;

.gettypes97:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes98
 mov ax, 2
 mov word [typei], ax

;-379   return i; }

.gettypes98:
 mov ax, [bp+4]
 jmp .retngettypes

;-380 int adrofname(unsigned int i) { adrF(GNameField, i); }

 .retngettypes: LEAVE
 ret
ENDP

adrofname: PROC
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   380 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-381 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
ENDP

adrF: PROC
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   381 NULL s = bp+4
;  201 var unsg word   381 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-382   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-383 int printName(unsigned int i) {int j;
 LEAVE
 ret
ENDP

printName: PROC

;-384   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   383 NULL i = bp+4
;  201 var sign word   383 NULL j = bp-2;
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

;-385   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

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

;-386 }

.printName100:

;-387 int searchname() { unsigned int i;
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

searchname: PROC

;-388   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   387 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname102
 push searchname_0
 call error1
 add  sp, 2

;-389   GUsed[i]=GUsed[i] + 1; return i;

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

;-390 }


;-391 int checkName() { unsigned int i; unsigned int j;

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

checkName: PROC

;-392   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   391 NULL i = bp-2
;  201 var unsg word   391 NULL j = bp-4;
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

;-393   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

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

;-394   return 0;

 jmp .checkName106
.checkName107:
 mov ax, 0
 jmp .retncheckName

;-395 }


;-396 int typeName() { int m; //0=V,1=*,2=&

 .retncheckName: LEAVE
 ret
ENDP

typeName: PROC

;-397     issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   396 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-398     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName109
 mov ax, 83
 mov byte [issign], al

;-399     if(istoken(T_UNSIGNED)) issign='U';

.typeName109:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName110
 mov ax, 85
 mov byte [issign], al

;-400     iswidth=2;

.typeName110:
 mov ax, 2
 mov byte [iswidth], al

;-401     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName111
 mov ax, 0
 mov byte [iswidth], al

;-402     if(istoken(T_CHAR))     iswidth=1;

.typeName111:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName112
 mov ax, 1
 mov byte [iswidth], al

;-403     if(istoken(T_INT))      iswidth=2;

.typeName112:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName113
 mov ax, 2
 mov byte [iswidth], al

;-404     if(istoken(T_LONG))     iswidth=4;

.typeName113:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName114
 mov ax, 4
 mov byte [iswidth], al

;-405     istype='V';

.typeName114:
 mov ax, 86
 mov byte [istype], al

;-406     m=0;

 mov ax, 0
 mov [bp-2], ax

;-407     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName115
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-408     if(istoken('&'))  {istype='&'; m=2;}

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

;-409     name1();

.typeName116:
 call name1

;-410     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-411 }


;-412 int name1() {

 .retntypeName: LEAVE
 ret
ENDP

name1: PROC

;-413     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1117
 push name1_0
 call error1
 add  sp, 2

;-414     token=getlex();

.name1117:
 call getlex
 mov word [token], ax

;-415 }


;-416 


;-417 int storeCall1() {//todo

 ret
name1_0 db "Name expected",0
ENDP

storeCall1: PROC

;-418     unsigned int i;


;-419     CTop++;

;Function : storeCall1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   418 NULL i = bp-2;
 ENTER  2,0
 inc  word[CTop]

;-420     if (CTop >= CALLMAX) error1("too many calls");

 mov ax, [CTop]
 cmp ax, 1500 ;unsigned : 1
 jl  .storeCall1118
 push storeCall1_0
 call error1
 add  sp, 2

;-421     i = CNamePtr - &CNameField;

.storeCall1118:
 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-422     if (i >= CNAMEMAX) error1("too many call names");

 mov ax, [bp-2]
 cmp ax, 10000 ;unsigned : 0
 jb  .storeCall1119
 push storeCall1_1
 call error1
 add  sp, 2

;-423     CType[CTop]=0;

.storeCall1119:
 mov ax, 0
 mov bx, [CTop]
 mov [CType+bx], al

;-424     CAdr [CTop]=CNamePtr;

 mov ax, [CNamePtr]
 mov bx, [CTop]
 shl bx, 1
 mov [CAdr+bx], ax

;-425     CNamePtr=strcpy(CNamePtr, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNamePtr]
 call strcpy
 add  sp, 4
 mov word [CNamePtr], ax

;-426     CNamePtr++;

 inc  word[CNamePtr]

;-427     CNameTop++;

 inc  word[CNameTop]

;-428     CTop++;

 inc  word[CTop]

;-429 }


;-430 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
 LEAVE
 ret
storeCall1_0 db "too many calls",0
storeCall1_1 db "too many call names",0
ENDP

storecall: PROC
;Function : storecall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   430 NULL i = bp-2;
 ENTER  2,0
 mov ax, [CTop]
 cmp ax, 1500 ;unsigned : 1
 jl  .storecall120
 push storecall_0
 call error1
 add  sp, 2

;-431   if (CNameTop >= 65468) error1("Call name table fuill");

.storecall120:
 mov ax, [CNameTop]
 cmp ax, 65468 ;unsigned : 0
 jb  .storecall121
 push storecall_1
 call error1
 add  sp, 2

;-432     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

.storecall121:
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

;-433     to_far(CNameTop, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNameTop]
 call to_far
 add  sp, 4

;-434     CNameTop=CNameTop+i; CNameTop++; CTop++;

 mov ax, [CNameTop]
 add ax, [bp-2]
 mov word [CNameTop], ax
 inc  word[CNameTop]
 inc  word[CTop]

;-435 }


;-436 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0
ENDP

storefunc: PROC
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc122
 push storefunc_0
 call error1
 add  sp, 2

;-437     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc122:
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

;-438     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-439 }


;-440 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal123
 push addlocal_0
 call error1
 add  sp, 2

;-441   if (checkName() != 0) error1("Variable already defined");

.addlocal123:
 call checkName
 cmp ax, 0
 je  .addlocal124
 push addlocal_1
 call error1
 add  sp, 2

;-442   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal124:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-443   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-444   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-445 }


;-446 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   446 NULL i = bp-2
;  201 var unsg word   446 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-447   while (i < FTop) {

.checkFunction125:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction126

;-448     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

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
 je .checkFunction127
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction127:
 inc  word[bp-2]

;-449   return 0; }

 jmp .checkFunction125
.checkFunction126:
 mov ax, 0
 jmp .retncheckFunction

;-450 int dofunc() { int nloc; int i; int narg;

 .retncheckFunction: LEAVE
 ret
ENDP

dofunc: PROC

;-451   cloc=&co;

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   450 NULL nloc = bp-2
;  201 var sign word   450 NULL i = bp-4
;  202 var sign word   450 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-452   checknamelen();

 call checknamelen

;-453   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-454   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc128
 push dofunc_0
 call error1
 add  sp, 2

;-455   storefunc();

.dofunc128:
 call storefunc

;-456   prs("\n\n"); prs(symbol); prs(": PROC");

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

;-457   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-458   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc129
 mov ax, 2
 mov [bp-6], ax

;-459     do { typeName();  addlocal(); narg+=2;

.dofunc130:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-460          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc131
 add  word[bp-6], 2
.dofunc131:
 inc  word[LTop]

;-461     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc132
 jmp .dofunc130
.dofunc132:
 push 41
 call expect
 add  sp, 2

;-462 


;-463   expect('{'); /*body*/

.dofunc129:
 push 123
 call expect
 add  sp, 2

;-464   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-465   while(isvariable()) {

.dofunc133:
 call isvariable
 or  al, al
 je .dofunc134

;-466     do {typeName();

.dofunc135:
 call typeName

;-467         checknamelen();

 call checknamelen

;-468         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-469         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc136
 sub  word[bp-2], 2

;-470         GData[LTop]=nloc;

.dofunc136:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-471         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc137

;-472             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

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

;-473             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-474             }


;-475         LTop++;

.dofunc137:
 inc  word[LTop]

;-476       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc138
 jmp .dofunc135
.dofunc138:
 push 59
 call expect
 add  sp, 2

;-477   listproc();

 jmp .dofunc133
.dofunc134:
 call listproc

;-478   if (LTop>LSTART){prs(";\n ENTER  ");

 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc139
 push dofunc_3
 call prs
 add  sp, 2

;-479     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

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

;-480   while(istoken('}')==0)   stmt();

.dofunc139:
.dofunc140:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc141
 call stmt

;-481   if (nreturn) {

 jmp .dofunc140
.dofunc141:
 mov ax, [nreturn]
 or  al, al
 je .dofunc142

;-482         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-483         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-484         prc(':');

 push 58
 call prc
 add  sp, 2

;-485         }


;-486   if (LTop > LSTART) prs(" LEAVE");

.dofunc142:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc143
 push dofunc_6
 call prs
 add  sp, 2

;-487   prs("\n ret");

.dofunc143:
 push dofunc_7
 call prs
 add  sp, 2

;-488   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-489   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-490   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc144
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-491   prs("\nENDP");

.dofunc144:
 push dofunc_8
 call prs
 add  sp, 2

;-492 }


;-493 int isvariable() {
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

;-494     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable145
 jmp .v1

;-495     if(token==T_UNSIGNED) goto v1;

.isvariable145:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable146
 jmp .v1

;-496     if(token==T_CHAR)     goto v1;

.isvariable146:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable147
 jmp .v1

;-497     if(token==T_INT)      goto v1;

.isvariable147:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable148
 jmp .v1

;-498     if(token==T_LONG)     goto v1;

.isvariable148:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable149
 jmp .v1

;-499     return 0;

.isvariable149:
 mov ax, 0
 jmp .retnisvariable

;-500 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-501 }


;-502 


;-503 int ireg1;

 .retnisvariable:
 ret
ENDP
ireg1 dw 0

;-504 int mod2; int ireg2;

mod2 dw 0
ireg2 dw 0

;-505 


;-506 int pexpr() {expect('('); iscmp=0;


pexpr: PROC
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-507   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr150
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr151
 call constantexpr
 jmp .retnpexpr

;-508     ireg1=checkreg();

.pexpr151:
 call checkreg
 mov word [ireg1], ax

;-509     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr152
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr152:

;-510   expr(0);

.pexpr150:
 push 0
 call expr
 add  sp, 2

;-511   if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr153
 push pexpr_1
 call prs
 add  sp, 2
.pexpr153:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-512   expect(')'); }

 push 41
 call expect
 add  sp, 2

;-513 


;-514 int constantexpr() { int mode; int id1;int ids;

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

constantexpr: PROC

;-515   token=getlex();   mode=typeName();

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   514 NULL mode = bp-2
;  201 var sign word   514 NULL id1 = bp-4
;  202 var sign word   514 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-516   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-517   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr154
 push constantexpr_0
 call error1
 add  sp, 2

;-518   expect(T_CONST);  prs(" ; constant expression");

.constantexpr154:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-519   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-520   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr155
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr156
.constantexpr155:
 push constantexpr_4
 call prs
 add  sp, 2

;-521   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr156:
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

;-522   expect(')');

 push 41
 call expect
 add  sp, 2

;-523 }


;-524 


;-525 char ops[5];
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
absolute 55855
ops resb 5
section .text

;-526 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-527   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   526 NULL iscmp1 = bp+4
;  201 var sign word   526 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1157
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-528   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1157:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1158
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-529   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1158:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1159
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-530   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1159:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1160
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-531   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1160:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1161
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-532   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1161:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1162
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-533   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1162:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1163
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-534   if (iscmp1 == 1) { token=getlex();

.doreg1163:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1164
 call getlex
 mov word [token], ax

;-535       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1165
 push doreg1_7
 call error1
 add  sp, 2

;-536       strcpy(ops, "cmp"); }

.doreg1165:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-537   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1164:
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

;-538 


;-539   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1166
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-540   mod2=typeName(); ireg2=checkreg();

.doreg1166:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-541   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1167
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-542   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1167:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1168
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1169
.doreg1168:
 push word [bp-2]
 call v
 add  sp, 2

;-543   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1169:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1170
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

;-544 }

.doreg1170:

;-545 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

;-546   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg171
 mov ax, 0
 jmp .retncheckreg

;-547   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg171:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg172
 mov ax, 1
 jmp .retncheckreg
.checkreg172:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg173
 mov ax, 3
 jmp .retncheckreg

;-548   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg173:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg174
 mov ax, 5
 jmp .retncheckreg
.checkreg174:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg175
 mov ax, 7
 jmp .retncheckreg

;-549   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg175:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg176
 mov ax, 9
 jmp .retncheckreg
.checkreg176:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg177
 mov ax, 11
 jmp .retncheckreg

;-550   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg177:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg178
 mov ax, 13
 jmp .retncheckreg
.checkreg178:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg179
 mov ax, 15
 jmp .retncheckreg

;-551   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg179:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg180
 mov ax, 17
 jmp .retncheckreg
.checkreg180:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg181
 mov ax, 19
 jmp .retncheckreg

;-552   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg181:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg182
 mov ax, 21
 jmp .retncheckreg
.checkreg182:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg183
 mov ax, 23
 jmp .retncheckreg

;-553   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg183:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg184
 mov ax, 25
 jmp .retncheckreg
.checkreg184:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg185
 mov ax, 27
 jmp .retncheckreg

;-554   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg185:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg186
 mov ax, 29
 jmp .retncheckreg
.checkreg186:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg187
 mov ax, 31
 jmp .retncheckreg

;-555   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg187:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg188
 mov ax, 33
 jmp .retncheckreg
.checkreg188:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg189
 mov ax, 35
 jmp .retncheckreg

;-556   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg189:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg190
 mov ax, 37
 jmp .retncheckreg
.checkreg190:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg191
 mov ax, 39
 jmp .retncheckreg

;-557   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg191:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg192
 mov ax, 41
 jmp .retncheckreg
.checkreg192:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg193
 mov ax, 43
 jmp .retncheckreg

;-558   // (eqstr(symbol,"ip")) return 45;


;-559   if (strlen(symbol) >   3) return 0;

.checkreg193:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg194
 mov ax, 0
 jmp .retncheckreg

;-560   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg194:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg195
 mov ax, 47
 jmp .retncheckreg
.checkreg195:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg196
 mov ax, 50
 jmp .retncheckreg

;-561   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg196:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg197
 mov ax, 53
 jmp .retncheckreg
.checkreg197:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 56
 jmp .retncheckreg

;-562   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg198:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 59
 jmp .retncheckreg
.checkreg199:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 62
 jmp .retncheckreg

;-563   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg200:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 65
 jmp .retncheckreg
.checkreg201:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 68
 jmp .retncheckreg

;-564   if (eqstr(symbol,"cr0")) return 71;

.checkreg202:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 71
 jmp .retncheckreg

;-565   return 0;   }

.checkreg203:
 mov ax, 0
 jmp .retncheckreg

;-566 


;-567 char printregstr[]

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

;-568 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-569 


;-570 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-571   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   570 NULL i = bp+4
;  201 var unsg word   570 NULL k = bp-2
;  202 var unsg byte   570 NULL c = bp-4;
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

;-572   k = &printregstr + i; c=*k; prc(c);

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

;-573   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg204
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

;-574 }

.printreg204:

;-575 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
ENDP
evalue dw 0
exprtype dw 10

;-576 int expr(int isRight)


expr: PROC

;-577 { int mode; int id1;     int ixarr; int ixconst;


;-578   int ids;  int isCONST; int i;     unsigned char *p;


;-579   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   576 NULL isRight = bp+4
;  201 var sign word   577 NULL mode = bp-2
;  202 var sign word   577 NULL id1 = bp-4
;  203 var sign word   577 NULL ixarr = bp-6
;  204 var sign word   577 NULL ixconst = bp-8
;  205 var sign word   578 NULL ids = bp-10
;  206 var sign word   578 NULL isCONST = bp-12
;  207 var sign word   578 NULL i = bp-14
;  208 ptr unsg byte   578 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr205
 mov ax, [lexval]
 mov word [evalue], ax

;-580     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-581   mode=typeName(); /*0=V,1=*,2=&*/

.expr205:
 call typeName
 mov [bp-2], ax

;-582   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-583   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr206
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-584   if (token=='(')  {docall1(); goto e1; }

.expr206:
 mov ax, [token]
 cmp ax, 40
 jne .expr207
 call docall1
 jmp .e1

;-585   if (isreg()) goto e1;

.expr207:
 call isreg
 or  al, al
 je .expr208
 jmp .e1

;-586 


;-587   id1=searchname(); gettypes(id1); ids=signi;

.expr208:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-588   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-589     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr209
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr210

;-590       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-591     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr211
.expr210:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-592     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-593     if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr212
 push expr_1
 call error1
 add  sp, 2
.expr212:
.expr211:

;-594   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

.expr209:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr213
 mov ax, [bp-2]
 or  al, al
 je .expr214
 push expr_2
 call error1
 add  sp, 2

;-595      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr214:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr215
 push expr_4
 call prs
 add  sp, 2
 jmp .expr216
.expr215:
 push expr_5
 call prs
 add  sp, 2

;-596      v(id1); goto e1;}

.expr216:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-597   if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

.expr213:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr217
 mov ax, [bp-2]
 or  al, al
 je .expr218
 push expr_6
 call error1
 add  sp, 2

;-598      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr218:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr219
 push expr_8
 call prs
 add  sp, 2
 jmp .expr220
.expr219:
 push expr_9
 call prs
 add  sp, 2

;-599      v(id1); goto e1;}

.expr220:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-600 


;-601   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr217:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr221
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-602   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr221:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr222
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-603   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr222:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr223
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-604   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr223:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr224
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-605   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr224:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr225
 push expr_14
 call error1
 add  sp, 2

;-606   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr225:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr226
 push expr_15
 call error1
 add  sp, 2

;-607 


;-608   if (istoken('=')) { exprtype= expr(1);

.expr226:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr227
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-609   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-610   dovar1(mode, "mov", ixarr, id1);

.expr227:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-611 


;-612 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr228
 push expr_17
 call rterm
 add  sp, 2

;-613   else if (istoken('-')) rterm("sub" );

 jmp .expr229
.expr228:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr230
 push expr_18
 call rterm
 add  sp, 2

;-614   else if (istoken('&')) rterm("and" );

 jmp .expr231
.expr230:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr232
 push expr_19
 call rterm
 add  sp, 2

;-615   else if (istoken('|')) rterm("or" );

 jmp .expr233
.expr232:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr234
 push expr_20
 call rterm
 add  sp, 2

;-616   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr235
.expr234:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr236
 push expr_21
 call rterm
 add  sp, 2

;-617   else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr237
.expr236:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr238
 push expr_22
 call rterm
 add  sp, 2

;-618   else if (istoken('*')) domul (ids);

 jmp .expr239
.expr238:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr240
 push word [bp-10]
 call domul
 add  sp, 2

;-619   else if (istoken('/')) doidiv(ids);

 jmp .expr241
.expr240:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr242
 push word [bp-10]
 call doidiv
 add  sp, 2

;-620   else if (istoken('%')) domod (ids);

 jmp .expr243
.expr242:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr244
 push word [bp-10]
 call domod
 add  sp, 2

;-621   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr244:
.expr243:
.expr241:
.expr239:
.expr237:
.expr235:
.expr233:
.expr231:
.expr229:
 call isrelational
 or  al, al
 je .expr245
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-622   return 0;

.expr245:
 mov ax, 0
 jmp .retnexpr

;-623 }


;-624 


;-625 int compoundass(char *op, int mode, int id1) {

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

;-626   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   625 NULL op = bp+4
;  201 var sign word   625 NULL mode = bp+6
;  202 var sign word   625 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass246
 push compoundass_0
 call error1
 add  sp, 2

;-627   prnl(); prs(op); prs("  ");

.compoundass246:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-628   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass247
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass248
.compoundass247:
 push compoundass_3
 call prs
 add  sp, 2

;-629   v(id1); prs(", ");

.compoundass248:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-630   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-631 }


;-632 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-633   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   632 NULL mode = bp+4
;  201 var sign word   632 NULL op = bp+6
;  202 var sign word   632 NULL ixarr = bp+8
;  203 var sign word   632 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-634   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1249
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

;-635     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1250
 push dovar1_1
 call prs
 add  sp, 2

;-636     if(widthi == 2) prs(" ax, [bx]");

.dovar1250:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1251
 push dovar1_2
 call prs
 add  sp, 2

;-637     return; }

.dovar1251:
 jmp .retndovar1

;-638   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1249:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1252
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

;-639   if (ixarr) {

.dovar1252:
 mov ax, [bp+8]
 or  al, al
 je .dovar1253

;-640     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-641     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_5
 call prs
 add  sp, 2

;-642     prs("\n "); prs(op);

.dovar1254:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-643     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1256
.dovar1255:
 push dovar1_8
 call prs
 add  sp, 2

;-644 // v(id1); prs(" [bx]");


;-645     prc('['); printName(id1); prs(" + bx]");

.dovar1256:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-646     return; }

 jmp .retndovar1

;-647   prnl();prs(op);

.dovar1253:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-648   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1257
 push dovar1_10
 call prs
 add  sp, 2

;-649   if(wi==2) prs(" ax, ");

.dovar1257:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_11
 call prs
 add  sp, 2

;-650   if(wi==4) prs(" eax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1259
 push dovar1_12
 call prs
 add  sp, 2

;-651   v(id1);

.dovar1259:
 push word [bp+10]
 call v
 add  sp, 2

;-652 }


;-653 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-654   if (istoken(T_CONST)) { prnl(); prs(op);

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   653 NULL op = bp+4
;  201 var sign word   653 NULL mode = bp-2
;  202 var sign word   653 NULL opint = bp-4
;  203 var sign word   653 NULL ixarr = bp-6
;  204 var sign word   653 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm260
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-655     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm261
 push rterm_0
 call prs
 add  sp, 2

;-656     if (wi==2) prs(" ax, ");

.rterm261:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm262
 push rterm_1
 call prs
 add  sp, 2

;-657     if (wi==4) prs(" eax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm263
 push rterm_2
 call prs
 add  sp, 2

;-658     prunsign1(lexval); return;}

.rterm263:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-659   mode=typeName(); id1=searchname(); ixarr=0;

.rterm260:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-660   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm264
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-661     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-662     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm265
 push rterm_3
 call error1
 add  sp, 2
.rterm265:

;-663   if (eqstr(symbol,"_AX")) return;

.rterm264:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm266
 jmp .retnrterm

;-664   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm266:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-665 }


;-666 int isreg() {

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
ENDP

isreg: PROC

;-667   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg267
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-668   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg267:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg268
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-669   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg268:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg269
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-670   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg269:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg270
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-671   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg270:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg271
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-672   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg271:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg272
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-673   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg272:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg273
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-674   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg273:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg274
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-675   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg274:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg275
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-676   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg275:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg276
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-677   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg276:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg277
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-678   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg277:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg278
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-679   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg278:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg279
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-680   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg279:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg280
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-681   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg280:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg281
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-682   return 0;   r1: return 1;

.isreg281:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-683 }


;-684 int doreg(char *dr) { int i; expect('=');

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
;  200 ptr sign byte   684 NULL dr = bp+4
;  201 var sign word   684 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-685   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-686        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg282
 push word [lexval]
 call prunsign1
 add  sp, 2

;-687   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg283
.doreg282:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg284
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-688   else error1("only number or var allowed"); }

 jmp .doreg285
.doreg284:
 push doreg_2
 call error1
 add  sp, 2
.doreg285:
.doreg283:

;-689 


;-690 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

doassign: PROC

;-691   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   690 NULL mode = bp+4
;  201 var sign word   690 NULL i = bp+6
;  202 var sign word   690 NULL ixarr = bp+8
;  203 var sign word   690 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-692   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign286
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-693     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign287
 push doassign_1
 call prs
 add  sp, 2

;-694     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign288
.doassign287:
 push doassign_2
 call prs
 add  sp, 2
.doassign288:
 jmp .retndoassign

;-695   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign286:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign289
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

;-696   if (ixarr) {  prs("\n mov bx, ");

.doassign289:
 mov ax, [bp+8]
 or  al, al
 je .doassign290
 push doassign_5
 call prs
 add  sp, 2

;-697     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign291
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign292
.doassign291:
 push word [bp+8]
 call v
 add  sp, 2

;-698     if (wi==2) prs("\n shl bx, 1");

.doassign292:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign293
 push doassign_6
 call prs
 add  sp, 2

;-699     prs("\n mov ["); printName(i);

.doassign293:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-700     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign294
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign295
.doassign294:
 push doassign_9
 call prs
 add  sp, 2
.doassign295:
 jmp .retndoassign

;-701   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign290:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign296
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign297
 push doassign_11
 call prs
 add  sp, 2

;-702     } v(i); prs(", al"); return; }

.doassign297:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-703   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign296:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign298
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign299
 push doassign_14
 call prs
 add  sp, 2

;-704     } v(i); prs(", ax"); return; }

.doassign299:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-705   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign298:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign300
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign301
 push doassign_17
 call prs
 add  sp, 2

;-706     } v(i); prs(", eax"); return; }

.doassign301:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-707 }

.doassign300:

;-708 int domul(int ids) {

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

;-709   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   708 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul302
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul303
.domul302:

;-710   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul304

;-711     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-712     }


;-713   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul305
.domul304:
 push domul_3
 call error1
 add  sp, 2
.domul305:
.domul303:

;-714 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-715   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   714 NULL ids = bp+4
;  201 var sign word   714 NULL mode = bp-2
;  202 var sign word   714 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv306

;-716     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-717     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv307
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv308
.doidiv307:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv308:

;-718   else {

 jmp .doidiv309
.doidiv306:

;-719     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-720     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv310
 push doidiv_3
 call error1
 add  sp, 2

;-721     gettypes(id1);

.doidiv310:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-722     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv311
 push doidiv_4
 call error1
 add  sp, 2

;-723     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv311:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv312
 push doidiv_5
 call error1
 add  sp, 2

;-724     prs("\n mov bx, "); v(id1);

.doidiv312:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-725     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv313
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv314
.doidiv313:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv314:

;-726 }

.doidiv309:

;-727 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
;  200 var sign word   727 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-728 


;-729 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 55860
docalltype resw 10
section .text
section .bss
absolute 55880
docallvalue resw 10
section .text

;-730 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 55900
procname resb 17
section .text

;-731 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-732   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   731 NULL i = bp-2
;  201 var sign word   731 NULL narg = bp-4
;  202 var sign word   731 NULL t0 = bp-6
;  203 var sign word   731 NULL n0 = bp-8
;  204 var sign word   731 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-733   checknamelen();

 call checknamelen

;-734   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-735   storecall();

 call storecall

;-736   expect('(');

 push 40
 call expect
 add  sp, 2

;-737 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1315

;-738 	  do { narg++;

.docall1316:
 inc  word[bp-4]

;-739 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1317
 push docall1_0
 call error1
 add  sp, 2
.docall1317:
 mov ax, 0
 mov [bp-6], ax

;-740       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1318
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-741       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1318:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1319
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-742         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-743         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-744       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1319:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1320
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-745       if(istoken(T_NAME))  { n0=checkreg();

.docall1320:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1321
 call checkreg
 mov [bp-8], ax

;-746         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1322
 mov ax, 5
 mov [bp-6], ax

;-747         else {t0=4; n0=searchname();

 jmp .docall1323
.docall1322:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-748           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1324
 mov ax, 3
 mov [bp-6], ax
.docall1324:
.docall1323:

;-749       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1321:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1325
 push docall1_4
 call error1
 add  sp, 2

;-750       docalltype [narg] = t0;

.docall1325:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-751       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-752     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1326
 jmp .docall1316
.docall1326:

;-753 


;-754   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-755     do {

.docall1327:

;-756       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-757       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-758       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1328
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-759       if(t0==2){ prs("\n push ");

.docall1328:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1329
 push docall1_6
 call prs
 add  sp, 2

;-760         prs(fname);prc(95);prunsign1(n0);}

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

;-761       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1329:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1330
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-762         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-763       if(t0==4){ gettypes(n0);

.docall1330:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1331
 push word [bp-8]
 call gettypes
 add  sp, 2

;-764         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1332
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-765         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1333
.docall1332:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-766         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1333:

;-767       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1331:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1334
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1335
 mov ax, [bp-10]
 add ax, 2
.docall1335:

;-768    i--; } while (i > 0);  }

.docall1334:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1336
 jmp .docall1327
.docall1336:

;-769 	 prs("\n call "); prs(&procname);

.docall1315:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-770 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1337
 push docall1_14
 call prs
 add  sp, 2

;-771      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2
.docall1337:

;-772 /***************************************************************/


;-773 


;-774 int doemit() {prs("\n db ");
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

;-775   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-776     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit338
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit338:
 push 41
 call expect
 add  sp, 2

;-777 


;-778 int cmpneg(int ids) {

 ret
doemit_0 db "\n db ",0
ENDP

cmpneg: PROC

;-779        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   778 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg339
 push cmpneg_0
 call prs
 add  sp, 2

;-780   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg340
.cmpneg339:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg341
 push cmpneg_1
 call prs
 add  sp, 2

;-781   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg342
.cmpneg341:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg343
 mov ax, [bp+4]
 or  al, al
 je .cmpneg344
 push cmpneg_2
 call prs
 add  sp, 2

;-782                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg345
.cmpneg344:
 push cmpneg_3
 call prs
 add  sp, 2

;-783   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg345:
 jmp .cmpneg346
.cmpneg343:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg347
 mov ax, [bp+4]
 or  al, al
 je .cmpneg348
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-784                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-785                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg349
.cmpneg348:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-786                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-787   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg349:
 jmp .cmpneg350
.cmpneg347:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg351
 push cmpneg_8
 call prs
 add  sp, 2

;-788   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg352
.cmpneg351:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg353
 push cmpneg_9
 call prs
 add  sp, 2

;-789   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg354
.cmpneg353:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg354:
.cmpneg352:
.cmpneg350:
.cmpneg346:
.cmpneg342:
.cmpneg340:

;-790 


;-791 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
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
;  200 var sign word   791 NULL n = bp+4;
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

;-792 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   792 NULL n = bp+4;
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

;-793 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

doif: PROC
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   793 NULL jdest = bp-2
;  201 var sign word   793 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-794   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-795   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif355
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-796     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-797   else prlabel(jdest); }

 jmp .doif356
.doif355:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif356:

;-798 


;-799 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
ENDP

dodo: PROC

;-800   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   799 NULL jdest = bp-2
;  201 var sign word   799 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-801   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-802   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-803 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
ENDP

dowhile: PROC
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   803 NULL jdest = bp-2
;  201 var sign word   803 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-804   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-805   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-806 int isrelational() {
 LEAVE
 ret
ENDP

isrelational: PROC

;-807   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational357
 jmp .w
.isrelational357:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational358
 jmp .w

;-808   if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational358:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational359
 jmp .w
.isrelational359:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational360
 jmp .w

;-809   if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational360:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational361
 jmp .w
.isrelational361:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational362
 jmp .w

;-810   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational362:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-811 


;-812 char symboltemp[80];

 .retnisrelational:
 ret
ENDP
section .bss
absolute 55917
symboltemp resb 80
section .text

;-813 int getlex() { char c; char *p;


getlex: PROC

;-814 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   813 NULL c = bp-2
;  201 ptr sign byte   813 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex363
 mov ax, 0
 jmp .retngetlex
.getlex363:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex364
 jmp .g1

;-815   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex364:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex365
 mov al, [thechar]
 cmp al, 61
 jne .getlex366
 call next
 mov ax, 806
 jmp .retngetlex
.getlex366:

;-816   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex365:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex367
 mov al, [thechar]
 cmp al, 61
 jne .getlex368
 call next
 mov ax, 807
 jmp .retngetlex
.getlex368:

;-817   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex367:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex369
 mov al, [thechar]
 cmp al, 61
 jne .getlex370
 call next
 mov ax, 824
 jmp .retngetlex
.getlex370:

;-818   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex369:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex371
 mov al, [thechar]
 cmp al, 61
 jne .getlex372
 call next
 mov ax, 811
 jmp .retngetlex
.getlex372:

;-819   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex371:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex373
 mov al, [thechar]
 cmp al, 60
 jne .getlex374
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex374:

;-820   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex373:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex375
 mov al, [thechar]
 cmp al, 62
 jne .getlex376
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex376:

;-821   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex375:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex377
 mov al, [thechar]
 cmp al, 43
 jne .getlex378
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex378:

;-822   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex377:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex379
 mov al, [thechar]
 cmp al, 45
 jne .getlex380
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex380:

;-823   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex379:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex381
 mov al, [thechar]
 cmp al, 61
 jne .getlex382
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex382:

;-824   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex381:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex383
 mov al, [thechar]
 cmp al, 61
 jne .getlex384
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex384:

;-825   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex383:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex385
 mov al, [thechar]
 cmp al, 61
 jne .getlex386
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex386:

;-826   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex385:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex387
 mov al, [thechar]
 cmp al, 61
 jne .getlex388
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex388:

;-827   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex387:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex389
 mov al, [thechar]
 cmp al, 61
 jne .getlex390
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex390:

;-828   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex389:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex391
 mov al, [thechar]
 cmp al, 61
 jne .getlex392
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex392:

;-829   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex391:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex393
 mov al, [bp-2]
 jmp .retngetlex

;-830   if (c == '/') { if (thechar == '/') {

.getlex393:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex394
 mov al, [thechar]
 cmp al, 47
 jne .getlex395

;-831       do c=next(); while(ifEOL(c)==0) return getlex(); } }

.getlex396:
 call next
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex397
 jmp .getlex396
.getlex397:
 call getlex
 jmp .retngetlex
.getlex395:

;-832   if (c == '/') { if (thechar == '*') {

.getlex394:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex398
 mov al, [thechar]
 cmp al, 42
 jne .getlex399

;-833       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex400
 jmp .g2
.getlex400:
 mov al, [thechar]
 cmp al, 47
 je  .getlex401
 jmp .g2

;-834       c=next(); return getlex(); } else  return '/'; }

.getlex401:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex402
.getlex399:
 mov ax, 47
 jmp .retngetlex
.getlex402:

;-835   if (c == '"') {getstring(c); return T_STRING;}

.getlex398:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex403
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-836   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex403:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex404
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-837   if (c==39) { lexval=next();

.getlex404:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex405
 call next
 mov word [lexval], ax

;-838     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex406
 call next
 mov word [lexval], ax

;-839       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex407
 mov ax, 10
 mov word [lexval], ax
.getlex407:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex408
 mov ax, 9
 mov word [lexval], ax

;-840       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex408:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex409
 mov ax, 0
 mov word [lexval], ax
.getlex409:
.getlex406:
 call next
 mov ax, 257
 jmp .retngetlex

;-841   if (alnum(c)) {

.getlex405:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex410

;-842     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-843     while(alnum(thechar)) {c=next(); *p=c;  p++; }

.getlex411:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex412
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-844       *p=0;

 jmp .getlex411
.getlex412:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-845     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex413
 mov ax, 531
 jmp .retngetlex

;-846     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex413:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex414
 mov ax, 532
 jmp .retngetlex

;-847     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex414:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex415
 mov ax, 529
 jmp .retngetlex

;-848     if (eqstr(symbol,"int"     )) return T_INT;

.getlex415:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex416
 mov ax, 517
 jmp .retngetlex

;-849     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex416:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex417
 mov ax, 533
 jmp .retngetlex

;-850     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex417:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex418
 mov ax, 530
 jmp .retngetlex

;-851     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex418:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex419
 mov ax, 518
 jmp .retngetlex

;-852     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex419:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex420
 mov ax, 519
 jmp .retngetlex

;-853     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex420:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex421
 mov ax, 520
 jmp .retngetlex

;-854     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex421:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex422
 mov ax, 512
 jmp .retngetlex

;-855     if (eqstr(symbol,"if"      )) return T_IF;

.getlex422:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex423
 mov ax, 513
 jmp .retngetlex

;-856     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex423:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex424
 mov ax, 514
 jmp .retngetlex

;-857     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex424:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex425
 mov ax, 515
 jmp .retngetlex

;-858     if (eqstr(symbol,"do"      )) return T_DO;

.getlex425:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex426
 mov ax, 516
 jmp .retngetlex

;-859     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex426:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex427
 mov ax, 521
 jmp .retngetlex

;-860     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex427:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex428
 mov ax, 511
 jmp .retngetlex

;-861     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex428:
 call convertdefine
 or  al, al
 je .getlex429
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-862     return T_NAME; } error1("Input item not recognized"); }

.getlex429:
 mov ax, 256
 jmp .retngetlex
.getlex410:
 push getlex_17
 call error1
 add  sp, 2

;-863 


;-864 int convertdefine() { int i; int j;   i=0;

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
;  200 var sign word   864 NULL i = bp-2
;  201 var sign word   864 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-865   while (i < GTop) {

.convertdefine430:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine431

;-866    j=adrofname(i);

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-867    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine432
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine433
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-868    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine433:

;-869    i++; }

.convertdefine432:
 inc  word[bp-2]

;-870    return 0; }

 jmp .convertdefine430
.convertdefine431:
 mov ax, 0
 jmp .retnconvertdefine

;-871 


;-872 int getdigit(char c) { int i;

 .retnconvertdefine: LEAVE
 ret
ENDP

getdigit: PROC

;-873     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   872 NULL c = bp+4
;  201 var sign word   872 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-874     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit434
 mov ax, 88
 mov byte [thechar], al
.getdigit434:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit435
 call next

;-875       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit436:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit437
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit438
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-876 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit438:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit439
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit439:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-877      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-878     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

 jmp .getdigit436
.getdigit437:
 jmp .getdigit440
.getdigit435:
.getdigit441:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit442
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-879      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit441
.getdigit442:

;-880 }

.getdigit440:

;-881 


;-882 int stmt() { int c; char cha;
 LEAVE
 ret
ENDP

stmt: PROC

;-883        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   882 NULL c = bp-2
;  201 var sign byte   882 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt443
.stmt444:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt445
 call stmt
 jmp .stmt444
.stmt445:

;-884   else if(istoken(T_IF))    doif();

 jmp .stmt446
.stmt443:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt447
 call doif

;-885   else if(istoken(T_DO))    dodo();

 jmp .stmt448
.stmt447:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt449
 call dodo

;-886   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt450
.stmt449:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt451
 call dowhile

;-887   else if(istoken(T_GOTO))  {

 jmp .stmt452
.stmt451:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt453

;-888     prs("\n jmp .");name1();prs(symbol);expect(';');}

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

;-889   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt454
.stmt453:
 mov ax, [token]
 cmp ax, 518
 jne .stmt455
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-890         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt456:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt457
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt456
.stmt457:
 call getlex
 mov word [token], ax

;-891   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();

 jmp .stmt458
.stmt455:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt459
 mov ax, [token]
 cmp ax, 123
 jne .stmt460
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-892         while(cha!= '}') { prc(cha); cha=next(); }

.stmt461:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt462
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-893         token=getlex(); }

 jmp .stmt461
.stmt462:
 call getlex
 mov word [token], ax

;-894         else error1("Curly open expected");

 jmp .stmt463
.stmt460:
 push stmt_3
 call error1
 add  sp, 2

;-895         }

.stmt463:

;-896   else if(istoken(T_EMIT))   doemit();

 jmp .stmt464
.stmt459:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt465
 call doemit

;-897   else if(istoken(';'))      { }

 jmp .stmt466
.stmt465:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt467

;-898   else if(istoken(T_RETURN)) {

 jmp .stmt468
.stmt467:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt469

;-899         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt470
 push 0
 call expr
 add  sp, 2

;-900         prs("\n jmp .retn");

.stmt470:
 push stmt_4
 call prs
 add  sp, 2

;-901         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-902         nreturn++;

 inc  word[nreturn]

;-903         expect(';');

 push 59
 call expect
 add  sp, 2

;-904         }


;-905   else if(thechar==':')      {

 jmp .stmt471
.stmt469:
 mov al, [thechar]
 cmp al, 58
 jne .stmt472

;-906         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-907         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-908         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-909         expect(':');

 push 58
 call expect
 add  sp, 2

;-910         }


;-911   else  {expr(0);; expect(';'); }

 jmp .stmt473
.stmt472:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-912 }

.stmt473:
.stmt471:
.stmt468:
.stmt466:
.stmt464:
.stmt458:
.stmt454:
.stmt452:
.stmt450:
.stmt448:
.stmt446:

;-913 


;-914 int getstring(int delim) {
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

;-915     int c; char *p;


;-916     p=&symbol;

;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   914 NULL delim = bp+4
;  201 var sign word   915 NULL c = bp-2
;  202 ptr sign byte   915 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax

;-917     c=next();

 call next
 mov [bp-2], ax

;-918     while (c != delim) {

.getstring474:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring475

;-919         *p=c;

 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-920         p++;

 inc  word[bp-4]

;-921         c=next();

 call next
 mov [bp-2], ax

;-922     }


;-923     *p=0;

 jmp .getstring474
.getstring475:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-924 }


;-925 


;-926 int fgets1() {
 LEAVE
 ret
ENDP

fgets1: PROC

;-927     char c;


;-928     c=*fgetsp;

;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   927 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-929     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1476

;-930         printinputline();

 call printinputline

;-931         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1477
 mov ax, 0
 jmp .retnfgets1

;-932         fgetsp=&fgetsdest;

.fgets1477:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-933         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-934         column=0;

 mov ax, 0
 mov word [column], ax

;-935     }


;-936     fgetsp++;

.fgets1476:
 inc  word[fgetsp]

;-937     column++;

 inc  word[column]

;-938     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-939 }


;-940 int printinputline() {

 .retnfgets1: LEAVE
 ret
ENDP

printinputline: PROC

;-941     int col;


;-942     col=0;

;Function : printinputline, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   941 NULL col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-943     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-944     do {

.printinputline478:

;-945         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-946         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline479
 jmp .retnprintinputline

;-947         *fgetsp=DOS_ByteRead;

.printinputline479:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-948         fgetsp++;

 inc  word[fgetsp]

;-949         col++;

 inc  word[bp-2]

;-950         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline480
 push printinputline_0
 call error1
 add  sp, 2

;-951         }

.printinputline480:

;-952         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline481
 jmp .printinputline478
.printinputline481:

;-953     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-954     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline482

;-955         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-956         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-957         prc(' ');

 push 32
 call prc
 add  sp, 2

;-958         lineno++;

 inc  word[lineno]

;-959         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-960         }


;-961 }

.printinputline482:

;-962 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

ifEOL: PROC

;-963     if (c == 10) return 1;//LF

;Function : ifEOL, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   962 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL483
 mov ax, 1
 jmp .retnifEOL

;-964     if (c == 13) {//CR

.ifEOL483:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL484

;-965         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL485
 call next
 mov [bp+4], al

;-966         return 1;

.ifEOL485:
 mov ax, 1
 jmp .retnifEOL

;-967     }


;-968     return 0;

.ifEOL484:
 mov ax, 0
 jmp .retnifEOL

;-969 }


;-970 


;-971 int end1(int n) {

 .retnifEOL: LEAVE
 ret
ENDP

end1: PROC

;-972     fcloseR(fdin);

;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   971 NULL n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-973     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-974     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-975 }


;-976 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-977     lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   976 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-978     prnl();

 call prnl

;-979     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-980     prs(";Line: ");

 push error1_0
 call prs
 add  sp, 2

;-981     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-982     prs(" ************** ERROR: ");

 push error1_1
 call prs
 add  sp, 2

;-983     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-984     prs("  in column: ");

 push error1_2
 call prs
 add  sp, 2

;-985     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-986     prs("\nToken: ");

 push error1_3
 call prs
 add  sp, 2

;-987     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-988 //    prs(", globC: ");


;-989 //    prc(globC);


;-990 //    prs(", thechar: ");


;-991 //    prunsign1(thechar);


;-992     prs(", symbol: ");

 push error1_4
 call prs
 add  sp, 2

;-993     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-994     end1(1);

 push 1
 call end1
 add  sp, 2

;-995 }


;-996 int listproc() {
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP

listproc: PROC

;-997     int i;


;-998     if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   997 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle .listproc486

;-999         prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-1000         prs(", Number of local variables: ");

 push listproc_1
 call prs
 add  sp, 2

;-1001         i=LTop - LSTART;

 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax

;-1002         prunsign1(i);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1003         prs("\n;   # type sign width addr used name");

 push listproc_2
 call prs
 add  sp, 2

;-1004         prs("   list of local variables");

 push listproc_3
 call prs
 add  sp, 2

;-1005         i=LSTART;

 mov ax, 200
 mov [bp-2], ax

;-1006         while (i < LTop) {

.listproc487:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc488

;-1007             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2

;-1008             i++;

 inc  word[bp-2]

;-1009             }


;-1010         }

 jmp .listproc487
.listproc488:

;-1011 }

.listproc486:

;-1012 int listcall() {
 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name",0
listproc_3 db "   list of local variables",0
ENDP

listcall: PROC

;-1013     int i;


;-1014     prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1013 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-1015     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1016     while (i< CTop) {

.listcall489:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .listcall490

;-1017         calllisting(i);

 push word [bp-2]
 call calllisting
 add  sp, 2

;-1018         i++;

 inc  word[bp-2]

;-1019         }


;-1020 }

 jmp .listcall489
.listcall490:

;-1021 int calllisting(int i) {
 LEAVE
 ret
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
ENDP

calllisting: PROC

;-1022     char c; int j;


;-1023     prs("\n;");

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1021 NULL i = bp+4
;  201 var sign byte  1022 NULL c = bp-2
;  202 var sign word  1022 NULL j = bp-4;
 ENTER  4,0
 push calllisting_0
 call prs
 add  sp, 2

;-1024     printint51(i);

 push word [bp+4]
 call printint51
 add  sp, 2

;-1025     prc(32);

 push 32
 call prc
 add  sp, 2

;-1026     c=CType [i];

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al

;-1027     if(c==0)prs("unresolved ");

 mov al, [bp-2]
 cmp al, 0
 jne .calllisting491
 push calllisting_1
 call prs
 add  sp, 2

;-1028     j=CAdr[i];

.calllisting491:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov [bp-4], ax

;-1029     printint51(j);

 push word [bp-4]
 call printint51
 add  sp, 2

;-1030     prc(32);

 push 32
 call prc
 add  sp, 2

;-1031     from_far(NameA, j);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1032     prs(NameA);

 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-1033 }


;-1034 int countcalls(int f) {
 LEAVE
 ret
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0
ENDP

countcalls: PROC

;-1035     unsigned int i;


;-1036     pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word  1034 NULL f = bp+4
;  201 var unsg word  1035 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1037     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1038     while (i < CTop) {

.countcalls492:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .countcalls493

;-1039         p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-1040         from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1041         if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je .countcalls494
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-1042         i++;

.countcalls494:
 inc  word[bp-2]

;-1043         }


;-1044 }

 jmp .countcalls492
.countcalls493:

;-1045 int listfunc() {
 LEAVE
 ret
ENDP

listfunc: PROC

;-1046     int i;


;-1047     prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1046 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-1048     i=0;

 mov ax, 0
 mov [bp-2], ax

;-1049     while (i < FTop) {

.listfunc495:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc496

;-1050         countcalls (i);

 push word [bp-2]
 call countcalls
 add  sp, 2

;-1051         i++;

 inc  word[bp-2]

;-1052         }


;-1053     i=0;

 jmp .listfunc495
.listfunc496:
 mov ax, 0
 mov [bp-2], ax

;-1054     while (i < FTop) {

.listfunc497:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc498

;-1055         funclisting(i);

 push word [bp-2]
 call funclisting
 add  sp, 2

;-1056         i++;

 inc  word[bp-2]

;-1057         }


;-1058 }

 jmp .listfunc497
.listfunc498:

;-1059 int funclisting(int i) {
 LEAVE
 ret
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
ENDP

funclisting: PROC

;-1060     int j;  char c;


;-1061     prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1059 NULL i = bp+4
;  201 var sign word  1060 NULL j = bp-2
;  202 var sign byte  1060 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-1062     j = FCalls[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax

;-1063     if (j) printint51(j);

 mov ax, [bp-2]
 or  al, al
 je .funclisting499
 push word [bp-2]
 call printint51
 add  sp, 2

;-1064         else prs(" NULL");

 jmp .funclisting500
.funclisting499:
 push funclisting_1
 call prs
 add  sp, 2

;-1065     j = FAdr[i];

.funclisting500:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FAdr + bx]
 mov [bp-2], ax

;-1066     printint51(j);

 push word [bp-2]
 call printint51
 add  sp, 2

;-1067     prc(32);

 push 32
 call prc
 add  sp, 2

;-1068     c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-1069     if(c=='V')prs("void " );

 mov al, [bp-4]
 cmp al, 86
 jne .funclisting501
 push funclisting_2
 call prs
 add  sp, 2

;-1070     if(c=='B')prs("byte " );

.funclisting501:
 mov al, [bp-4]
 cmp al, 66
 jne .funclisting502
 push funclisting_3
 call prs
 add  sp, 2

;-1071     if(c=='W')prs("word " );

.funclisting502:
 mov al, [bp-4]
 cmp al, 87
 jne .funclisting503
 push funclisting_4
 call prs
 add  sp, 2

;-1072     if(c=='D')prs("dwrd " );

.funclisting503:
 mov al, [bp-4]
 cmp al, 68
 jne .funclisting504
 push funclisting_5
 call prs
 add  sp, 2

;-1073     prc(32); prc(32);

.funclisting504:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-1074     pt=adrF(FNameField, i);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1075     prs(pt);

 push word [pt]
 call prs
 add  sp, 2

;-1076 }


;-1077 


;-1078 int listvar(unsigned int i) {
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

;-1079     unsigned int j; char c;


;-1080     prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1078 NULL i = bp+4
;  201 var unsg word  1079 NULL j = bp-2
;  202 var sign byte  1079 NULL c = bp-4;
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

;-1081     c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne .listvar505
 push listvar_1
 call prs
 add  sp, 2
.listvar505:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar506
 push listvar_2
 call prs
 add  sp, 2

;-1082                  if(c=='&')prs("arr ");   if(c=='#')prs("def ");

.listvar506:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar507
 push listvar_3
 call prs
 add  sp, 2
.listvar507:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar508
 push listvar_4
 call prs
 add  sp, 2

;-1083     c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

.listvar508:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .listvar509
 push listvar_5
 call prs
 add  sp, 2
.listvar509:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar510
 push listvar_6
 call prs
 add  sp, 2

;-1084     c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

.listvar510:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne .listvar511
 push listvar_7
 call prs
 add  sp, 2
.listvar511:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar512
 push listvar_8
 call prs
 add  sp, 2

;-1085                  if(c==  4)prs("dwrd " );

.listvar512:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar513
 push listvar_9
 call prs
 add  sp, 2

;-1086     j=GAdr[i]; printint51(j);

.listvar513:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1087     j=GUsed[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax

;-1088     if (j) printint51(j);

 mov ax, [bp-2]
 or  al, al
 je .listvar514
 push word [bp-2]
 call printint51
 add  sp, 2

;-1089     else {

 jmp .listvar515
.listvar514:

;-1090         if(GType[i]=='#') prs("    -");

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar516
 push listvar_10
 call prs
 add  sp, 2

;-1091         else prs(" NULL");

 jmp .listvar517
.listvar516:
 push listvar_11
 call prs
 add  sp, 2

;-1092          }

.listvar517:

;-1093     prc(32);

.listvar515:
 push 32
 call prc
 add  sp, 2

;-1094     pt=adrofname(i); prs(pt);

 push word [bp+4]
 call adrofname
 add  sp, 2
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-1095     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar518

;-1096         prc('=');

 push 61
 call prc
 add  sp, 2

;-1097         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1098         prunsign1(j);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1099         }


;-1100     if(GType[i]=='&') {

.listvar518:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar519

;-1101         prc('[');

 push 91
 call prc
 add  sp, 2

;-1102         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1103         prunsign1(j);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1104         prc(']');

 push 93
 call prc
 add  sp, 2

;-1105         }


;-1106     if (i >= LSTART) {

.listvar519:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  .listvar520

;-1107         prs(" = bp");

 push listvar_12
 call prs
 add  sp, 2

;-1108         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1109         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar521
 push 43
 call prc
 add  sp, 2

;-1110         pint1(j);

.listvar521:
 push word [bp-2]
 call pint1
 add  sp, 2

;-1111     }


;-1112 }

.listvar520:

;-1113 


;-1114 unsigned int MAXUI=65535;
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

;-1115 int epilog() {


epilog: PROC

;-1116     unsigned int i;


;-1117     prs("\n \n;   # type sign width  adr used name");

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1116 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 call prs
 add  sp, 2

;-1118     prs("   list of global variables\n");

 push epilog_1
 call prs
 add  sp, 2

;-1119     i=1;

 mov ax, 1
 mov [bp-2], ax

;-1120     while (i< GTop) {

.epilog522:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .epilog523

;-1121         listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2

;-1122         i++;

 inc  word[bp-2]

;-1123         }


;-1124     listfunc();

 jmp .epilog522
.epilog523:
 call listfunc

;-1125     listcall();

 call listcall

;-1126     prs("\n;Input: "); prs(&namein);

 push epilog_2
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1127     prs(", List: ");   prs(&namelst);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1128     prs(",  Lines:"); printint51(lineno);

 push epilog_4
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-1129     prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_5
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-1130     prs(" max.:"); printint51(LSTART);

 push epilog_6
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-1131     prs("\n;Functions      :"); printint51(FTop);

 push epilog_7
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-1132     prs(" max.:"); printint51(FUNCMAX);

 push epilog_8
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-1133     prs("\n;Calls          :"); printint51(CTop);

 push epilog_9
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-1134     prs(" max.:"); printint51(CALLMAX);

 push epilog_10
 call prs
 add  sp, 2
 push 1500
 call printint51
 add  sp, 2

;-1135     prs(", NameField:"); printint51(CNameTop);

 push epilog_11
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-1136 //    prs(" max.:");


;-1137     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);

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

;-1138     prs(" max.:"); printint51(COMAX); i=COMAX; i=i-maxco;

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

;-1139     if (i <= 1000)prs(" *** Warning *** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog524
 push epilog_15
 call prs
 add  sp, 2

;-1140     prs(", stacksize: ");

.epilog524:
 push epilog_16
 call prs
 add  sp, 2

;-1141     i=MAXUI-orgData; printint51(i);

 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1142     if (i <= 1000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog525
 push epilog_17
 call prs
 add  sp, 2

;-1143   end1(0);}

.epilog525:
 push 0
 call end1
 add  sp, 2

;-1144 


;-1145 int checkcalls() {
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

;-1146     int i; int j; int k;


;-1147     prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1146 NULL i = bp-2
;  201 var sign word  1146 NULL j = bp-4
;  202 var sign word  1146 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-1148     i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-1149     while (i < CTop) {

.checkcalls526:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .checkcalls527

;-1150         pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-1151         from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1152         j=0;

 mov ax, 0
 mov [bp-4], ax

;-1153         do {

.checkcalls528:

;-1154             p1=adrF(FNameField, j);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-1155             if (eqstr(NameA, p1)){

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkcalls529

;-1156                 CType[i]=1;

 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al

;-1157                 j=FTop;

 mov ax, [FTop]
 mov [bp-4], ax

;-1158                 }


;-1159             j++;

.checkcalls529:
 inc  word[bp-4]

;-1160             } while (j < FTop);

 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .checkcalls530
 jmp .checkcalls528
.checkcalls530:

;-1161         if (j == FTop) {

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne .checkcalls531

;-1162             k++; prs("\n; ");

 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2

;-1163             prs(NameA);

 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-1164         }


;-1165         i++;

.checkcalls531:
 inc  word[bp-2]

;-1166     }


;-1167     prs("\n; Number of unresolved CALLs :"); printint51(k);

 jmp .checkcalls526
.checkcalls527:
 push checkcalls_2
 call prs
 add  sp, 2
 push word [bp-6]
 call printint51
 add  sp, 2

;-1168     if (k!=0) error1("At least 1 function is missing! ");

 mov ax, [bp-6]
 cmp ax, 0
 je  .checkcalls532
 push checkcalls_3
 call error1
 add  sp, 2

;-1169     else prs(" All FUNCTIONs in place");

 jmp .checkcalls533
.checkcalls532:
 push checkcalls_4
 call prs
 add  sp, 2

;-1170 }

.checkcalls533:

;-1171 


;-1172 int dodefine() {
 LEAVE
 ret
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db "\n; Number of unresolved CALLs :",0
checkcalls_3 db "At least 1 function is missing! ",0
checkcalls_4 db " All FUNCTIONs in place",0
ENDP

dodefine: PROC

;-1173     int i; int j; int fdtemp;


;-1174     if (eqstr(symbol, "ORGDATA")) {

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1173 NULL i = bp-2
;  201 var sign word  1173 NULL j = bp-4
;  202 var sign word  1173 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine534

;-1175         token=getlex();

 call getlex
 mov word [token], ax

;-1176         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1177         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1178         return;

 jmp .retndodefine

;-1179     }


;-1180     expect(T_NAME);

.dodefine534:
 push 256
 call expect
 add  sp, 2

;-1181     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine535

;-1182         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine536
 push dodefine_1
 call error1
 add  sp, 2

;-1183         i=strlen(symbol);

.dodefine536:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1184         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine537
 push dodefine_2
 call error1
 add  sp, 2

;-1185         GSign [GTop]='U';

.dodefine537:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1186         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1187         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1188         GAdr [GTop]=lineno-1;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax

;-1189         GUsed [GTop]=0;

 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1190         pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-1191         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1192         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1193         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1194         GTop++;

 inc  word[GTop]

;-1195     }


;-1196 }

.dodefine535:

;-1197 


;-1198 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1199     CNamePtr = &CNameField;

 mov ax, CNameField
 mov word [CNamePtr], ax

;-1200     token=getlex();

 call getlex
 mov word [token], ax

;-1201     do {

.parse538:

;-1202         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse539
 mov ax, 1
 jmp .retnparse

;-1203         if (istoken('#')) {

.parse539:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse540

;-1204              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse541
 call dodefine

;-1205              else error1("define expected");

 jmp .parse542
.parse541:
 push parse_0
 call error1
 add  sp, 2

;-1206         }

.parse542:

;-1207     else{

 jmp .parse543
.parse540:

;-1208         typeName();

 call typeName

;-1209         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse544
 call dofunc

;-1210         else doglob(); }

 jmp .parse545
.parse544:
 call doglob
.parse545:

;-1211     } while(1);

.parse543:
 mov ax, 1
 or  al, al
 je .parse546
 jmp .parse538
.parse546:

;-1212 }


;-1213 


;-1214 int getfirstchar() {

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP

getfirstchar: PROC

;-1215     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1216     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1217     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1218     }


;-1219 


;-1220 char *arglen=0x80; char *argv=0x82;

 ret
ENDP
arglen dw 128
argv dw 130

;-1221 int getarg() {


getarg: PROC

;-1222     int arglen1; int i; char *c;


;-1223     arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1222 NULL arglen1 = bp-2
;  201 var sign word  1222 NULL i = bp-4
;  202 ptr sign byte  1222 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1224     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarg547

;-1225         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1226         cputs(" Usage: A.COM in_file[.C]: ");

 push getarg_0
 call cputs
 add  sp, 2

;-1227         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1228         }


;-1229     i=arglen1+129;

.getarg547:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1230     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1231     arglen1--;

 dec  word[bp-2]

;-1232     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1233     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1234     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarg548
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-1235     strcpy(namelst, namein);

.getarg548:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1236     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1237     i--;

 dec  word[bp-4]

;-1238     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1239     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1240 


;-1241     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1242     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg549

;-1243         cputs("Source file missing (.C): ");

 push getarg_2
 call cputs
 add  sp, 2

;-1244         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1245         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1246         }


;-1247     fdout=creatR(namelst);

.getarg549:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1248     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg550

;-1249         cputs("list file not creatable: ");

 push getarg_3
 call cputs
 add  sp, 2

;-1250         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1251         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1252         }


;-1253     prs("\n; ");

.getarg550:
 push getarg_4
 call prs
 add  sp, 2

;-1254     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1255     prs(", Source: "); prs(namein);

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1256     prs(", Output asm: "); prs(namelst);

 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1257     prs("\norg  256 \njmp main");

 push getarg_7
 call prs
 add  sp, 2

;-1258 }


;-1259 


;-1260 int setblock(unsigned int i) {
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

;-1261     DOS_ERR=0;

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1260 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax

;-1262     bx=i;

 mov  bx, [bp+4]

;-1263     ax=cs;

 mov  ax, cs

;-1264     es=ax;

 mov  es, ax

;-1265     ax=0x4A00;

 mov  ax, 18944

;-1266     DosInt();

 call DosInt

;-1267 }


;-1268 int main() {
 LEAVE
 ret
ENDP

main: PROC

;-1269     getarg();

 call getarg

;-1270 setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-1271 if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main551
 push main_0
 call error1
 add  sp, 2

;-1272 segE=allocmem(4096);

.main551:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-1273 if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main552
 push main_1
 call error1
 add  sp, 2

;-1274     CNameTop=0;

.main552:
 mov ax, 0
 mov word [CNameTop], ax

;-1275     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1276     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1277     getfirstchar();

 call getfirstchar

;-1278     parse();

 call parse

;-1279   checkcalls();

 call checkcalls

;-1280   epilog();

 call epilog

;-1281 }


;-1282 


;-1283 


;-1284 


;-1285 int allocmem(unsigned int i) {

 ret
main_0 db "SetBlock , AX=",0
main_1 db "alloc memory, AX=",0
ENDP

allocmem: PROC

;-1286     unsigned int vAX; unsigned int vBX;


;-1287     DOS_ERR=0;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1285 NULL i = bp+4
;  201 var unsg word  1286 NULL vAX = bp-2
;  202 var unsg word  1286 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax

;-1288     bx=i;

 mov  bx, [bp+4]

;-1289     ax=0x4800;

 mov  ax, 18432

;-1290     DosInt();

 call DosInt

;-1291     asm mov [bp-2], ax; _ vAX=ax;

 mov [bp-2], ax; _ vAX=ax;

;-1292     asm mov [bp-4], bx; _ vBX=bx;

 mov [bp-4], bx; _ vBX=bx;

;-1293     if(DOS_ERR) return vBX;

 mov ax, [DOS_ERR]
 or  al, al
 je .allocmem553
 mov ax, [bp-4]
 jmp .retnallocmem

;-1294     return vAX;

.allocmem553:
 mov ax, [bp-2]
 jmp .retnallocmem

;-1295 }


;-1296 int to_far(char *dest, char *src) {

 .retnallocmem: LEAVE
 ret
ENDP

to_far: PROC

;-1297   segE;  es=ax;  si=src;  di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1296 NULL dest = bp+4
;  201 ptr sign byte  1296 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-1298   asm cld

 cld

;-1299   do{

.to_far554:

;-1300   asm lodsb  ; inc si

 lodsb  ; inc si

;-1301   asm stosb  ; inc di

 stosb  ; inc di

;-1302   } while (al != 0);

 cmp  al, 0
 je  .to_far555
 jmp .to_far554
.to_far555:

;-1303 }


;-1304 int from_far(char *dest, char *src) {
 LEAVE
 ret
ENDP

from_far: PROC

;-1305   segE;   es=ax;   si=src;   di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1304 NULL dest = bp+4
;  201 ptr sign byte  1304 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-1306   do{

.from_far556:

;-1307   asm mov al, [es:si]

 mov al, [es:si]

;-1308   asm inc si

 inc si

;-1309   asm mov [di], al

 mov [di], al

;-1310   asm inc di

 inc di

;-1311   } while (al != 0);

 cmp  al, 0
 je  .from_far557
 jmp .from_far556
.from_far557:

;-1312 }
 LEAVE
 ret
ENDP
 
; missing functions: 
; Number of unresolved CALLs :    0 All FUNCTIONs in place
 
;   # type sign width  adr used name   list of global variables

;    1 arr sign byte     1    2 Version1[12]
;    2 def unsg byte     2    - IDLENMAX=15
;    3 def unsg byte     3    - COLUMNMAX=128
;    4 def unsg byte     4    - T_NAME=256
;    5 def unsg byte     5    - T_CONST=257
;    6 def unsg byte     6    - T_STRING=258
;    7 def unsg byte     7    - T_DEFINE=511
;    8 def unsg byte     8    - T_RETURN=512
;    9 def unsg byte     9    - T_IF=513
;   10 def unsg byte    10    - T_ELSE=514
;   11 def unsg byte    11    - T_WHILE=515
;   12 def unsg byte    12    - T_DO=516
;   13 def unsg byte    13    - T_INT=517
;   14 def unsg byte    14    - T_ASM=518
;   15 def unsg byte    15    - T_ASMBLOCK=519
;   16 def unsg byte    16    - T_EMIT=520
;   17 def unsg byte    17    - T_GOTO=521
;   18 def unsg byte    18    - T_VOID=529
;   19 def unsg byte    19    - T_CHAR=530
;   20 def unsg byte    20    - T_SIGNED=531
;   21 def unsg byte    21    - T_UNSIGNED=532
;   22 def unsg byte    22    - T_LONG=533
;   23 def unsg byte    23    - T_EQ=806
;   24 def unsg byte    24    - T_NE=807
;   25 def unsg byte    25    - T_GE=811
;   26 def unsg byte    26    - T_LE=824
;   27 def unsg byte    27    - T_PLUSPLUS=1219
;   28 def unsg byte    28    - T_MINUSMINUS=1225
;   29 def unsg byte    29    - T_PLUSASS=1230
;   30 def unsg byte    30    - T_MINUSASS=1231
;   31 def unsg byte    31    - T_MULASS=1232
;   32 def unsg byte    32    - T_DIVASS=1233
;   33 def unsg byte    33    - T_ANDASS=1234
;   34 def unsg byte    34    - T_ORASS=1235
;   35 def unsg byte    35    - T_LESSLESS=1240
;   36 def unsg byte    36    - T_GREATGREAT=1241
;   37 var unsg word    38    2 ORGDATAORIG
;   38 var unsg word    39   10 orgData
;   39 def unsg byte    40    - COMAX=2000
;   40 arr sign byte    41    4 co[2000]
;   41 var sign word    42    4 maxco
;   42 var sign word    43    3 maxco1
;   43 def unsg byte    44    - CMDLENMAX=67
;   44 arr sign byte    45    3 coname[67]
;   45 arr sign byte    46   97 symbol[128]
;   46 arr sign byte    47   12 fname[67]
;   47 arr sign byte    48    8 namein[67]
;   48 arr sign byte    49    7 namelst[67]
;   49 ptr sign byte    50    5 cloc
;   50 var sign word    51    3 fdin
;   51 var sign word    52    4 fdout
;   52 var sign word    53   35 token
;   53 var sign byte    54    1 globC
;   54 var sign word    55    3 column
;   55 var sign byte    56   28 thechar
;   56 var sign word    57    9 iscmp
;   57 var sign word    58    4 nconst
;   58 var sign word    59    3 nreturn
;   59 var sign word    60   12 nlabel
;   60 var unsg word    61   43 lexval
;   61 var sign word    62    4 typei
;   62 var sign byte    62    8 istype
;   63 var sign word    63    4 signi
;   64 var sign byte    63    5 issign
;   65 var sign word    64    9 widthi
;   66 var sign byte    64   19 iswidth
;   67 var sign word    65   24 wi
;   68 def unsg byte    66    - VARMAX=300
;   69 def unsg byte    67    - LSTART=200
;   70 def unsg byte    68    - GNAMEMAX=4800
;   71 arr sign byte    69   11 GType[300]
;   72 arr sign byte    70    5 GSign[300]
;   73 arr sign byte    71    5 GWidth[300]
;   74 arr sign word    72    4 GAdr[300]
;   75 arr sign word    73    6 GUsed[300]
;   76 arr sign word    74   11 GData[300]
;   77 arr sign byte    75    2 GNameField[4800]
;   78 var sign word    76   24 GTop
;   79 var sign word    77   20 LTop
;   80 def unsg byte    78    - FUNCMAX=300
;   81 def unsg byte    79    - FNAMEMAX=4800
;   82 arr sign byte    80    2 FType[300]
;   83 arr sign word    81    2 FAdr[300]
;   84 arr sign word    82    4 FCalls[300]
;   85 arr sign byte    83    5 FNameField[4800]
;   86 var sign word    84   13 FTop
;   87 def unsg byte    85    - CALLMAX=1500
;   88 arr sign byte    86    4 CType[1500]
;   89 arr sign word    87    5 CAdr[1500]
;   90 def unsg byte    88    - CNAMEMAX=10000
;   91 arr sign byte    89    2 CNameField[10016]
;   92 ptr sign byte    90    6 CNamePtr
;   93 ptr unsg byte    91    9 CNameTop
;   94 var sign word    92   13 CTop
;   95 arr sign byte    95    7 NameA[32]
;   96 arr sign byte    96    5 fgetsdest[128]
;   97 ptr unsg byte    97   10 fgetsp
;   98 var unsg word    98    3 segE
;   99 var unsg word    99    9 lineno
;  100 var unsg word   100 NULL linenoinclude
;  101 ptr unsg byte   101   17 pt
;  102 ptr unsg byte   102    8 p1
;  103 var sign word   103    8 DOS_ERR
;  104 var sign word   104    3 DOS_NoBytes
;  105 var sign byte   105    3 DOS_ByteRead
;  106 arr sign byte   320    2 doglobName[15]
;  107 var sign word   503    5 ireg1
;  108 var sign word   504    2 mod2
;  109 var sign word   504    3 ireg2
;  110 arr sign byte   525    9 ops[5]
;  111 arr sign byte   568    3 printregstr[74]
;  112 var sign word   575    1 evalue
;  113 var sign word   575    1 exprtype
;  114 arr sign word   729    2 docalltype[10]
;  115 arr sign word   729    2 docallvalue[10]
;  116 arr sign byte   730    2 procname[17]
;  117 arr sign byte   812    2 symboltemp[80]
;  118 var unsg word  1114    1 MAXUI
;  119 ptr sign byte  1220    1 arglen
;  120 ptr sign byte  1220    2 argv


;   # Calls Line Width  Name   list of functions

;    0    4  108   writetty
;    1    1  109   putch
;    2    6  110   cputs
;    3    3  111   mkneg
;    4    8  113   DosInt
;    5    1  118   openR
;    6    1  119   creatR
;    7    2  120   fcloseR
;    8    4  121   exitR
;    9    1  122   readRL
;   10    1  124   fputcR
;   11    1  127   letter
;   12    3  137   digit
;   13    3  142   alnum
;   14    8  148   strlen
;   15   23  153   strcpy
;   16   71  159   eqstr
;   17    1  167   strcat1
;   18    1  171   toupper
;   19    2  177   instr1
;   20    3  186   a
;   21   18  188   v
;   22    4  193   checknamelen
;   23   32  199   next
;   24   75  206   istoken
;   25   36  213   expect
;   26    6  224   eprc
;   27    5  228   eprs
;   28   40  236   prc
;   29    3  245   prscomment
;   30    7  253   prnl
;   31  216  257   prs
;   32    2  276   eprnum
;   33    7  290   pint1
;   34   32  301   prunsign1
;   35   20  311   printint51
;   36    1  321   doglob
;   37   10  371   gettypes
;   38    7  380   adrofname
;   39    7  381   adrF
;   40    4  383   printName
;   41   10  387   searchname
;   42    3  391   checkName
;   43    8  396   typeName
;   44    3  412   name1
;   45 NULL  417   storeCall1
;   46    1  430   storecall
;   47    1  436   storefunc
;   48    2  440   addlocal
;   49    1  446   checkFunction
;   50    1  450   dofunc
;   51    1  493   isvariable
;   52    3  506   pexpr
;   53    1  514   constantexpr
;   54    2  526   doreg1
;   55    4  545   checkreg
;   56    3  570   printreg
;   57    4  576   expr
;   58    4  625   compoundass
;   59    2  632   dovar1
;   60    8  653   rterm
;   61    1  666   isreg
;   62   15  684   doreg
;   63    1  690   doassign
;   64    1  708   domul
;   65    2  714   doidiv
;   66    1  727   domod
;   67    1  731   docall1
;   68    1  774   doemit
;   69    3  778   cmpneg
;   70    7  791   prlabel
;   71    3  792   prjump
;   72    1  793   doif
;   73    1  799   dodo
;   74    1  803   dowhile
;   75    3  806   isrelational
;   76   13  813   getlex
;   77    1  864   convertdefine
;   78    1  872   getdigit
;   79    6  882   stmt
;   80    1  914   getstring
;   81    2  926   fgets1
;   82    1  940   printinputline
;   83    1  962   ifEOL
;   84    2  971   end1
;   85   43  976   error1
;   86    2  996   listproc
;   87    1 1012   listcall
;   88    1 1021   calllisting
;   89    1 1034   countcalls
;   90    1 1045   listfunc
;   91    1 1059   funclisting
;   92    2 1078   listvar
;   93    1 1115   epilog
;   94    1 1145   checkcalls
;   95    1 1172   dodefine
;   96    1 1198   parse
;   97    1 1214   getfirstchar
;   98    1 1221   getarg
;   99    1 1260   setblock
;  100 NULL 1268   main
;  101    1 1285   allocmem
;  102    1 1296   to_far
;  103    3 1304   from_far

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
;  127   835 strcpy
;  128   842 error1
;  129   849 error1
;  130   856 strlen
;  131   863 to_far
;  132   870 error1
;  133   877 adrF
;  134   882 strcpy
;  135   889 error1
;  136   896 checkName
;  137   906 error1
;  138   913 adrF
;  139   918 strcpy
;  140   925 adrF
;  141   930 eqstr
;  142   936 checknamelen
;  143   949 strcpy
;  144   956 checkFunction
;  145   970 error1
;  146   977 storefunc
;  147   987 prs
;  148   991 prs
;  149   995 prs
;  150   999 expect
;  151  1006 istoken
;  152  1014 typeName
;  153  1023 addlocal
;  154  1032 istoken
;  155  1040 expect
;  156  1047 expect
;  157  1054 isvariable
;  158  1065 typeName
;  159  1074 checknamelen
;  160  1087 addlocal
;  161  1096 istoken
;  162  1104 expect
;  163  1111 expect
;  164  1118 istoken
;  165  1126 expect
;  166  1133 listproc
;  167  1142 prs
;  168  1146 mkneg
;  169  1152 prunsign1
;  170  1162 prs
;  171  1166 istoken
;  172  1174 stmt
;  173  1179 prs
;  174  1183 prs
;  175  1187 prc
;  176  1191 prs
;  177  1195 prs
;  178  1199 prs
;  179  1203 strlen
;  180  1210 strcpy
;  181  1217 prs
;  182  1221 expect
;  183  1228 eqstr
;  184  1234 constantexpr
;  185  1247 checkreg
;  186  1256 doreg1
;  187  1263 expr
;  188  1268 prs
;  189  1272 prs
;  190  1276 expect
;  191  1283 getlex
;  192  1290 typeName
;  193  1299 searchname
;  194  1310 gettypes
;  195  1319 isrelational
;  196  1332 error1
;  197  1339 expect
;  198  1346 prs
;  199  1350 prs
;  200  1354 gettypes
;  201  1363 prs
;  202  1367 prs
;  203  1371 v
;  204  1373 prs
;  205  1377 prunsign1
;  206  1387 cmpneg
;  207  1394 prs
;  208  1398 expect
;  209  1405 istoken
;  210  1413 strcpy
;  211  1420 istoken
;  212  1428 strcpy
;  213  1435 istoken
;  214  1443 strcpy
;  215  1450 istoken
;  216  1458 strcpy
;  217  1465 istoken
;  218  1473 strcpy
;  219  1480 istoken
;  220  1488 strcpy
;  221  1495 istoken
;  222  1503 strcpy
;  223  1510 getlex
;  224  1517 isrelational
;  225  1530 error1
;  226  1537 strcpy
;  227  1544 prnl
;  228  1549 prs
;  229  1553 prs
;  230  1557 printreg
;  231  1566 prs
;  232  1570 istoken
;  233  1578 prunsign1
;  234  1588 typeName
;  235  1597 checkreg
;  236  1606 printreg
;  237  1615 searchname
;  238  1626 a
;  239  1628 v
;  240  1630 cmpneg
;  241  1637 prs
;  242  1641 expect
;  243  1648 strlen
;  244  1655 eqstr
;  245  1661 eqstr
;  246  1667 eqstr
;  247  1673 eqstr
;  248  1679 eqstr
;  249  1685 eqstr
;  250  1691 eqstr
;  251  1697 eqstr
;  252  1703 eqstr
;  253  1709 eqstr
;  254  1715 eqstr
;  255  1721 eqstr
;  256  1727 eqstr
;  257  1733 eqstr
;  258  1739 eqstr
;  259  1745 eqstr
;  260  1751 eqstr
;  261  1757 eqstr
;  262  1763 eqstr
;  263  1769 eqstr
;  264  1775 eqstr
;  265  1781 eqstr
;  266  1787 strlen
;  267  1794 eqstr
;  268  1800 eqstr
;  269  1806 eqstr
;  270  1812 eqstr
;  271  1818 eqstr
;  272  1824 eqstr
;  273  1830 eqstr
;  274  1836 eqstr
;  275  1842 eqstr
;  276  1848 prc
;  277  1852 prc
;  278  1856 prc
;  279  1860 istoken
;  280  1868 prs
;  281  1872 prunsign1
;  282  1882 typeName
;  283  1891 checkreg
;  284  1900 doreg1
;  285  1907 docall1
;  286  1915 isreg
;  287  1921 searchname
;  288  1932 gettypes
;  289  1941 istoken
;  290  1949 istoken
;  291  1957 expect
;  292  1964 searchname
;  293  1975 expect
;  294  1982 expect
;  295  1989 gettypes
;  296  1998 error1
;  297  2005 istoken
;  298  2013 error1
;  299  2020 prs
;  300  2024 prs
;  301  2028 prs
;  302  2032 v
;  303  2034 istoken
;  304  2042 error1
;  305  2049 prs
;  306  2053 prs
;  307  2057 prs
;  308  2061 v
;  309  2063 istoken
;  310  2071 compoundass
;  311  2083 istoken
;  312  2091 compoundass
;  313  2103 istoken
;  314  2111 compoundass
;  315  2123 istoken
;  316  2131 compoundass
;  317  2143 istoken
;  318  2151 error1
;  319  2158 istoken
;  320  2166 error1
;  321  2173 istoken
;  322  2181 expr
;  323  2186 doassign
;  324  2195 dovar1
;  325  2202 istoken
;  326  2210 rterm
;  327  2216 istoken
;  328  2224 rterm
;  329  2230 istoken
;  330  2238 rterm
;  331  2244 istoken
;  332  2252 rterm
;  333  2258 istoken
;  334  2266 rterm
;  335  2272 istoken
;  336  2280 rterm
;  337  2286 istoken
;  338  2294 domul
;  339  2300 istoken
;  340  2308 doidiv
;  341  2315 istoken
;  342  2323 domod
;  343  2329 isrelational
;  344  2342 rterm
;  345  2348 cmpneg
;  346  2355 error1
;  347  2362 prnl
;  348  2367 prs
;  349  2371 prs
;  350  2375 gettypes
;  351  2384 prs
;  352  2388 prs
;  353  2392 v
;  354  2394 prs
;  355  2398 expect
;  356  2405 prunsign1
;  357  2415 gettypes
;  358  2424 prs
;  359  2428 v
;  360  2430 prnl
;  361  2435 prs
;  362  2439 prs
;  363  2443 prs
;  364  2447 prnl
;  365  2452 prs
;  366  2456 prs
;  367  2460 a
;  368  2462 prs
;  369  2466 v
;  370  2468 prs
;  371  2472 prs
;  372  2476 prs
;  373  2480 prs
;  374  2484 prs
;  375  2488 prc
;  376  2492 printName
;  377  2502 prs
;  378  2506 prnl
;  379  2511 prs
;  380  2515 prs
;  381  2519 prs
;  382  2523 prs
;  383  2527 v
;  384  2529 istoken
;  385  2537 prnl
;  386  2542 prs
;  387  2546 prs
;  388  2550 prs
;  389  2554 prs
;  390  2558 prunsign1
;  391  2568 typeName
;  392  2577 searchname
;  393  2588 istoken
;  394  2596 searchname
;  395  2607 expect
;  396  2614 expect
;  397  2621 gettypes
;  398  2630 error1
;  399  2637 eqstr
;  400  2643 dovar1
;  401  2650 eqstr
;  402  2656 doreg
;  403  2662 eqstr
;  404  2668 doreg
;  405  2674 eqstr
;  406  2680 doreg
;  407  2686 eqstr
;  408  2692 doreg
;  409  2698 eqstr
;  410  2704 doreg
;  411  2710 eqstr
;  412  2716 doreg
;  413  2722 eqstr
;  414  2728 doreg
;  415  2734 eqstr
;  416  2740 doreg
;  417  2746 eqstr
;  418  2752 doreg
;  419  2758 eqstr
;  420  2764 doreg
;  421  2770 eqstr
;  422  2776 doreg
;  423  2782 eqstr
;  424  2788 doreg
;  425  2794 eqstr
;  426  2800 doreg
;  427  2806 eqstr
;  428  2812 doreg
;  429  2818 eqstr
;  430  2824 doreg
;  431  2830 expect
;  432  2837 prs
;  433  2841 prs
;  434  2845 prs
;  435  2849 istoken
;  436  2857 prunsign1
;  437  2867 istoken
;  438  2875 searchname
;  439  2886 v
;  440  2888 error1
;  441  2895 gettypes
;  442  2904 prs
;  443  2908 v
;  444  2910 prs
;  445  2914 prs
;  446  2918 prs
;  447  2922 a
;  448  2924 prs
;  449  2928 prs
;  450  2932 prunsign1
;  451  2942 v
;  452  2944 prs
;  453  2948 prs
;  454  2952 printName
;  455  2962 prs
;  456  2966 prs
;  457  2970 prs
;  458  2974 prs
;  459  2978 v
;  460  2980 prs
;  461  2984 prs
;  462  2988 prs
;  463  2992 v
;  464  2994 prs
;  465  2998 prs
;  466  3002 prs
;  467  3006 v
;  468  3008 prs
;  469  3012 rterm
;  470  3018 istoken
;  471  3026 prs
;  472  3030 prunsign1
;  473  3040 prs
;  474  3044 error1
;  475  3051 istoken
;  476  3059 prs
;  477  3063 prunsign1
;  478  3073 prs
;  479  3077 prs
;  480  3081 typeName
;  481  3090 searchname
;  482  3101 error1
;  483  3108 gettypes
;  484  3117 error1
;  485  3124 error1
;  486  3131 prs
;  487  3135 v
;  488  3137 prs
;  489  3141 prs
;  490  3145 doidiv
;  491  3152 prs
;  492  3156 checknamelen
;  493  3169 strcpy
;  494  3176 storecall
;  495  3186 expect
;  496  3193 istoken
;  497  3201 error1
;  498  3208 istoken
;  499  3216 istoken
;  500  3224 eprs
;  501  3229 eprs
;  502  3234 eprc
;  503  3239 eprnum
;  504  3246 eprs
;  505  3251 eprc
;  506  3256 eprs
;  507  3261 eprc
;  508  3266 eprs
;  509  3271 istoken
;  510  3279 name1
;  511  3285 searchname
;  512  3296 istoken
;  513  3304 checkreg
;  514  3313 searchname
;  515  3324 error1
;  516  3331 istoken
;  517  3339 expect
;  518  3346 prs
;  519  3350 prunsign1
;  520  3360 prs
;  521  3364 prs
;  522  3368 prc
;  523  3372 prunsign1
;  524  3382 prs
;  525  3386 v
;  526  3388 prs
;  527  3392 gettypes
;  528  3401 prs
;  529  3405 v
;  530  3407 prs
;  531  3411 v
;  532  3413 prs
;  533  3417 prs
;  534  3421 printreg
;  535  3430 prs
;  536  3434 prs
;  537  3438 prs
;  538  3442 prunsign1
;  539  3452 prs
;  540  3456 getlex
;  541  3463 prunsign1
;  542  3473 getlex
;  543  3480 prc
;  544  3484 expect
;  545  3491 prs
;  546  3495 prs
;  547  3499 prs
;  548  3503 prs
;  549  3507 prs
;  550  3511 prunsign1
;  551  3521 prs
;  552  3525 prs
;  553  3529 prunsign1
;  554  3539 prs
;  555  3543 prs
;  556  3547 prs
;  557  3551 error1
;  558  3558 prs
;  559  3562 prs
;  560  3566 prunsign1
;  561  3576 prc
;  562  3580 prs
;  563  3584 prs
;  564  3588 prunsign1
;  565  3598 pexpr
;  566  3604 pint1
;  567  3610 stmt
;  568  3615 istoken
;  569  3623 prjump
;  570  3630 prlabel
;  571  3638 stmt
;  572  3643 prlabel
;  573  3651 prlabel
;  574  3659 prlabel
;  575  3667 stmt
;  576  3672 expect
;  577  3679 pexpr
;  578  3685 pint1
;  579  3691 prjump
;  580  3698 prlabel
;  581  3706 prlabel
;  582  3714 pexpr
;  583  3720 pint1
;  584  3726 stmt
;  585  3731 prjump
;  586  3738 prlabel
;  587  3746 getlex
;  588  3753 next
;  589  3758 next
;  590  3763 next
;  591  3768 next
;  592  3773 next
;  593  3778 next
;  594  3783 next
;  595  3788 next
;  596  3793 next
;  597  3798 next
;  598  3803 next
;  599  3808 next
;  600  3813 next
;  601  3818 next
;  602  3823 next
;  603  3828 instr1
;  604  3835 next
;  605  3840 ifEOL
;  606  3846 getlex
;  607  3853 next
;  608  3858 next
;  609  3863 getlex
;  610  3870 getstring
;  611  3880 digit
;  612  3886 getdigit
;  613  3895 next
;  614  3900 next
;  615  3905 next
;  616  3910 alnum
;  617  3916 strcpy
;  618  3923 alnum
;  619  3929 next
;  620  3934 eqstr
;  621  3940 eqstr
;  622  3946 eqstr
;  623  3952 eqstr
;  624  3958 eqstr
;  625  3964 eqstr
;  626  3970 eqstr
;  627  3976 eqstr
;  628  3982 eqstr
;  629  3988 eqstr
;  630  3994 eqstr
;  631  4000 eqstr
;  632  4006 eqstr
;  633  4012 eqstr
;  634  4018 eqstr
;  635  4024 eqstr
;  636  4030 convertdefine
;  637  4044 strcpy
;  638  4051 error1
;  639  4058 adrofname
;  640  4068 eqstr
;  641  4074 next
;  642  4079 alnum
;  643  4085 next
;  644  4090 digit
;  645  4096 next
;  646  4101 istoken
;  647  4109 istoken
;  648  4117 stmt
;  649  4122 istoken
;  650  4130 doif
;  651  4135 istoken
;  652  4143 dodo
;  653  4148 istoken
;  654  4156 dowhile
;  655  4164 istoken
;  656  4172 prs
;  657  4176 name1
;  658  4182 prs
;  659  4186 expect
;  660  4193 prs
;  661  4197 next
;  662  4202 prc
;  663  4206 next
;  664  4211 getlex
;  665  4218 istoken
;  666  4226 prs
;  667  4230 next
;  668  4235 prc
;  669  4239 next
;  670  4244 getlex
;  671  4251 error1
;  672  4258 istoken
;  673  4266 doemit
;  674  4273 istoken
;  675  4281 istoken
;  676  4289 expr
;  677  4294 prs
;  678  4298 prs
;  679  4302 expect
;  680  4309 prs
;  681  4313 prs
;  682  4317 prc
;  683  4321 expect
;  684  4328 expect
;  685  4335 expr
;  686  4340 expect
;  687  4347 next
;  688  4352 next
;  689  4357 printinputline
;  690  4372 readRL
;  691  4379 error1
;  692  4386 prs
;  693  4390 prunsign1
;  694  4400 prc
;  695  4404 prscomment
;  696  4415 next
;  697  4420 fcloseR
;  698  4428 fcloseR
;  699  4436 exitR
;  700  4442 prnl
;  701  4447 prscomment
;  702  4458 prs
;  703  4462 prunsign1
;  704  4472 prs
;  705  4476 prs
;  706  4480 prs
;  707  4484 prunsign1
;  708  4494 prs
;  709  4498 prunsign1
;  710  4508 prs
;  711  4512 prs
;  712  4516 end1
;  713  4521 prs
;  714  4525 prs
;  715  4529 prs
;  716  4533 prunsign1
;  717  4543 prs
;  718  4547 prs
;  719  4551 listvar
;  720  4559 prs
;  721  4563 calllisting
;  722  4575 prs
;  723  4579 printint51
;  724  4590 prc
;  725  4594 prs
;  726  4598 printint51
;  727  4609 prc
;  728  4613 from_far
;  729  4622 prs
;  730  4626 adrF
;  731  4631 from_far
;  732  4640 eqstr
;  733  4646 prs
;  734  4650 countcalls
;  735  4661 funclisting
;  736  4673 prs
;  737  4677 printint51
;  738  4688 printint51
;  739  4699 prs
;  740  4703 printint51
;  741  4714 prc
;  742  4718 prs
;  743  4722 prs
;  744  4726 prs
;  745  4730 prs
;  746  4734 prc
;  747  4738 prc
;  748  4742 adrF
;  749  4747 prs
;  750  4751 prs
;  751  4755 printint51
;  752  4766 prc
;  753  4770 prs
;  754  4774 prs
;  755  4778 prs
;  756  4782 prs
;  757  4786 prs
;  758  4790 prs
;  759  4794 prs
;  760  4798 prs
;  761  4802 prs
;  762  4806 printint51
;  763  4817 printint51
;  764  4828 prs
;  765  4832 prs
;  766  4836 prc
;  767  4840 adrofname
;  768  4850 prs
;  769  4854 prc
;  770  4858 prunsign1
;  771  4868 prc
;  772  4872 prunsign1
;  773  4882 prc
;  774  4886 prs
;  775  4890 prc
;  776  4894 pint1
;  777  4900 prs
;  778  4904 prs
;  779  4908 listvar
;  780  4916 listfunc
;  781  4925 listcall
;  782  4934 prs
;  783  4938 prs
;  784  4942 prs
;  785  4946 prs
;  786  4950 prs
;  787  4954 printint51
;  788  4965 prs
;  789  4969 printint51
;  790  4980 prs
;  791  4984 printint51
;  792  4995 prs
;  793  4999 printint51
;  794  5010 prs
;  795  5014 printint51
;  796  5025 prs
;  797  5029 printint51
;  798  5040 prs
;  799  5044 printint51
;  800  5055 prs
;  801  5059 printint51
;  802  5070 prs
;  803  5074 prs
;  804  5078 prs
;  805  5082 printint51
;  806  5093 prs
;  807  5097 printint51
;  808  5108 prs
;  809  5112 prs
;  810  5116 printint51
;  811  5127 prs
;  812  5131 end1
;  813  5136 prs
;  814  5140 from_far
;  815  5149 adrF
;  816  5154 eqstr
;  817  5160 prs
;  818  5164 prs
;  819  5168 prs
;  820  5172 printint51
;  821  5183 error1
;  822  5190 prs
;  823  5194 eqstr
;  824  5200 getlex
;  825  5207 expect
;  826  5214 error1
;  827  5221 strlen
;  828  5228 error1
;  829  5235 adrofname
;  830  5245 strcpy
;  831  5252 expect
;  832  5259 getlex
;  833  5266 istoken
;  834  5274 istoken
;  835  5282 dodefine
;  836  5291 error1
;  837  5298 typeName
;  838  5307 dofunc
;  839  5314 doglob
;  840  5321 fgets1
;  841  5328 cputs
;  842  5334 cputs
;  843  5340 exitR
;  844  5346 toupper
;  845  5354 strcpy
;  846  5361 instr1
;  847  5368 strcat1
;  848  5376 strcpy
;  849  5383 strlen
;  850  5390 openR
;  851  5396 cputs
;  852  5402 cputs
;  853  5408 exitR
;  854  5414 creatR
;  855  5421 cputs
;  856  5427 cputs
;  857  5433 exitR
;  858  5439 prs
;  859  5443 prs
;  860  5447 prs
;  861  5451 prs
;  862  5455 prs
;  863  5459 prs
;  864  5463 prs
;  865  5467 DosInt
;  866  5474 getarg
;  867  5481 setblock
;  868  5490 error1
;  869  5497 allocmem
;  870  5506 error1
;  871  5513 getfirstchar
;  872  5526 parse
;  873  5532 checkcalls
;  874  5543 epilog
;  875  5550 DosInt
;Input: A.C, List: A.S,  Lines: 1313
;Glob. variables:  120 max.:  200
;Functions      :  104 max.:  300
;Calls          :  876 max.: 1500, NameField: 5557
;Const in 'checkreg' :  712 max.: 2000, stacksize:  9538