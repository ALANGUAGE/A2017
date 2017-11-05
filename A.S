
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


;-86 char CType[CALLMAX]; //0=unresolved,  1=resolved

section .bss
absolute 41196
CType resb 1500
section .text

;-87 int  CAdr [CALLMAX]; //start of nameof address in CNameField

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


;-94 char fgetsdest[COLUMNMAX];

section .bss
absolute 55712
fgetsdest resb 128
section .text

;-95 unsigned char *fgetsp=0;

fgetsp dw 0

;-96 unsigned int segE;

segE dw 0

;-97 unsigned int lineno=1;

lineno dw 1

;-98 unsigned char *pt=0;

pt dw 0

;-99 unsigned char *p1=0;

p1 dw 0

;-100 int DOS_ERR=0;

DOS_ERR dw 0

;-101 int DOS_NoBytes=0;

DOS_NoBytes dw 0

;-102 char DOS_ByteRead=0;

DOS_ByteRead db 0

;-103 


;-104 


;-105 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-106 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }

 ret
ENDP

putch: PROC;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
 mov  al, 13
 call writetty
.putch1:
 mov  al, [bp+4]
 call writetty

;-107 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
ENDP

cputs: PROC;
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

;-108 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-109 


;-110 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-111     asm int 0x21

 int 0x21

;-112     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-113     DOS_ERR++;

 inc  word[DOS_ERR]

;-114 }


;-115 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-116 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-117 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-118 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-119 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-120     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-121 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC;
 ENTER  0,0
lea dx, [bp+4]

;-122   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-123 


;-124   int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-125       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-126       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-127       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-128       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-129       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-130       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-131       if (c> 'Z') { if (c< 'a') return 0; }

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

;-132       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-133   }


;-134   int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-135       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-136       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-137       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-138   }


;-139   int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-140     if (digit (c)) return 1;
;
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

;-141     if (letter(c)) return 1;

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

;-142     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-143   }


;-144 


;-145 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-146     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-147     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-148     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-149 }


;-150 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-151     do { *s=*t; s++; t++; }
;
 ENTER  0,0
.strcpy18:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]

;-152     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-153     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-154     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-155 }


;-156 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-157     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-158         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-159         p++;

.eqstr22:
 inc  word[bp+4]

;-160         q++;

 inc  word[bp+6]

;-161     }


;-162     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-163     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-164 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-165     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-166     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-167 }


;-168 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-169     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-170         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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

;-171         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-172     }


;-173 }

 jmp .toupper26
.toupper27:

;-174 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-175     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-176         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-177         s++;

.instr132:
 inc  word[bp+4]

;-178     }


;-179     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-180 }


;-181 


;-182 


;-183 int a(unsigned int i) { printName(i);//address

 .retninstr1: LEAVE
 ret
ENDP

a: PROC;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-184 }


;-185 int v(unsigned int i) {//value
 LEAVE
 ret
ENDP

v: PROC

;-186     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v33
 push 91
 call prc
 add  sp, 2

;-187     printName(i);

.v33:
 push word [bp+4]
 call printName
 add  sp, 2

;-188     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v34
 push 93
 call prc
 add  sp, 2

;-189 }

.v34:

;-190 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-191     int i;


;-192     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-193     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen35
 push checknamelen_0
 call error1
 add  sp, 2

;-194 }

.checknamelen35:

;-195 


;-196 int next() {
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

next: PROC

;-197     char r;


;-198     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-199     globC=r;

 mov al, [bp-2]
 mov byte [globC], al

;-200     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-201     return r;

 mov al, [bp-2]
 jmp .retnnext

;-202 }


;-203 int istoken(int t) {

 .retnnext: LEAVE
 ret
ENDP

istoken: PROC

;-204     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken36

;-205         token=getlex();

 call getlex
 mov word [token], ax

;-206         return 1;

 mov ax, 1
 jmp .retnistoken

;-207     }


;-208     return 0;

.istoken36:
 mov ax, 0
 jmp .retnistoken

;-209 }


;-210 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-211     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect37

;-212         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-213         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-214         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-215         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-216         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-217     }


;-218 }

.expect37:

;-219 


;-220 int eprc(char c)  {
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

eprc: PROC

;-221     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al

;-222     cloc++;

 inc  word[cloc]

;-223 }


;-224 int eprs(char *s) {
 LEAVE
 ret
ENDP

eprs: PROC

;-225     char c;


;-226     while(*s) {
;
 ENTER  2,0
.eprs38:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs39

;-227         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-228         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2

;-229         s++;

 inc  word[bp+4]

;-230     }


;-231 }

 jmp .eprs38
.eprs39:

;-232 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-233     if (c==10) {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc40

;-234         _AX=13;

 mov  ax, 13

;-235         writetty();

 call writetty

;-236     }


;-237     _AL=c;

.prc40:
 mov  al, [bp+4]

;-238     writetty();

 call writetty

;-239     fputcR(c, fdout);

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-240 }


;-241 int prscomment(unsigned char *s) {
 LEAVE
 ret
ENDP

prscomment: PROC

;-242     unsigned char c;


;-243     while(*s){
;
 ENTER  2,0
.prscomment41:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment42

;-244         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-245         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-246         s++;

 inc  word[bp+4]

;-247     }


;-248 }

 jmp .prscomment41
.prscomment42:

;-249 int prnl() {
 LEAVE
 ret
ENDP

prnl: PROC

;-250     prs("\n ");

 push prnl_0
 call prs
 add  sp, 2

;-251 }


;-252 


;-253 int prs(unsigned char *s) {

 ret
prnl_0 db "\n ",0
ENDP

prs: PROC

;-254     unsigned char c; int com;


;-255     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-256     while(*s) {

.prs43:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs44

;-257         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-258         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs45
 mov ax, [bp-4]
 or  al, al
 je .prs46
 mov ax, 0
 mov [bp-4], ax

;-259                    else com=1;

 jmp .prs47
.prs46:
 mov ax, 1
 mov [bp-4], ax

;-260         if (c==92) {

.prs47:
.prs45:
 mov al, [bp-2]
 cmp al, 92
 jne .prs48

;-261             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs49

;-262                 s++;

 inc  word[bp+4]

;-263                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-264                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs50
 mov ax, 10
 mov [bp-2], al

;-265                 if (c=='t') c= 9;

.prs50:
 mov al, [bp-2]
 cmp al, 116
 jne .prs51
 mov ax, 9
 mov [bp-2], al

;-266             }

.prs51:

;-267         }

.prs49:

;-268         prc(c);

.prs48:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-269         s++;

 inc  word[bp+4]

;-270     }


;-271 }

 jmp .prs43
.prs44:

;-272 int eprnum(int n){//for docall1 procedure
 LEAVE
 ret
ENDP

eprnum: PROC

;-273     int e;


;-274     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum52

;-275         eprc('-');

 push 45
 call eprc
 add  sp, 2

;-276         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-277     }


;-278     if (n >= 10) {

.eprnum52:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum53

;-279         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-280         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2

;-281     }


;-282     n=n%10;

.eprnum53:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-283     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax

;-284     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2

;-285 }


;-286 int pint1 (int n){
 LEAVE
 ret
ENDP

pint1: PROC

;-287     int e;


;-288     if(n<0) {  prc('-');  n=mkneg(n); }
;
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

;-289     if (n >= 10) {

.pint154:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint155

;-290         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-291         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2

;-292     }


;-293     n=n%10;

.pint155:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-294     n += '0';

 add  word[bp+4], 48

;-295     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-296 }


;-297 int prunsign1(unsigned int n) {
 LEAVE
 ret
ENDP

prunsign1: PROC

;-298     unsigned int e;


;-299     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign156

;-300         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax

;-301         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-302     }


;-303     n = n % 10; /*unsigned mod*/

.prunsign156:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax

;-304     n += '0';

 add  word[bp+4], 48

;-305     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-306 }


;-307 int printint51(unsigned int j)  {
 LEAVE
 ret
ENDP

printint51: PROC

;-308     if (j<10000) prc(32);
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint5157
 push 32
 call prc
 add  sp, 2

;-309     if (j<1000) prc(32);

.printint5157:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint5158
 push 32
 call prc
 add  sp, 2

;-310     if (j<100) prc(32);

.printint5158:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint5159
 push 32
 call prc
 add  sp, 2

;-311     if (j<10) prc(32);

.printint5159:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint5160
 push 32
 call prc
 add  sp, 2

;-312     prunsign1(j);

.printint5160:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-313 }


;-314 


;-315 


;-316 char doglobName[IDLENMAX];
 LEAVE
 ret
ENDP
section .bss
absolute 55840
doglobName resb 15
section .text

;-317 int doglob() {


doglob: PROC

;-318     int i; int j; int isstrarr; isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-319   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob61
 push doglob_0
 call error1
 add  sp, 2

;-320   if (iswidth == 0) error1("no VOID as var type");

.doglob61:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob62
 push doglob_1
 call error1
 add  sp, 2

;-321   checknamelen();

.doglob62:
 call checknamelen

;-322   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob63
 push doglob_2
 call error1
 add  sp, 2

;-323   if (istoken('[')) { istype='&';

.doglob63:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob64
 mov ax, 38
 mov byte [istype], al

;-324     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob65

;-325       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-326       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-327       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-328       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob66
 push doglob_5
 call prs
 add  sp, 2

;-329       if (iswidth==2) prs(" resw ");

.doglob66:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob67
 push doglob_6
 call prs
 add  sp, 2

;-330       if (iswidth==4) prs(" resd ");

.doglob67:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob68
 push doglob_7
 call prs
 add  sp, 2

;-331       prunsign1(lexval);

.doglob68:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-332       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-333       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-334       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob69
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-335       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

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

;-336       GData[GTop]=lexval; expect(']');

.doglob70:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-337     }else { expect(']');

 jmp .doglob71
.doglob65:
 push 93
 call expect
 add  sp, 2

;-338       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob72
 push doglob_9
 call error1
 add  sp, 2

;-339       prs("\n"); prs(symbol); prs(" db ");

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

;-340       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-341       expect('=');

 push 61
 call expect
 add  sp, 2

;-342       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob73

;-343         prc(34); prscomment(symbol); prc(34); prs(",0");

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

;-344         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-345       else if (istoken('{' )) { i=0;

 jmp .doglob74
.doglob73:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob75
 mov ax, 0
 mov [bp-2], ax

;-346         do { if(i) prc(',');

.doglob76:
 mov ax, [bp-2]
 or  al, al
 je .doglob77
 push 44
 call prc
 add  sp, 2

;-347           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob77:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-348         while (istoken(',')); expect('}'); }

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

;-349       else error1("String or number array expected");

 jmp .doglob79
.doglob75:
 push doglob_13
 call error1
 add  sp, 2

;-350       };

.doglob79:
.doglob74:
.doglob71:

;-351   }else { //expect('=');

 jmp .doglob80
.doglob64:

;-352     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

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

;-353     else {

 jmp .doglob82
.doglob81:

;-354       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob83
 push doglob_16
 call prs
 add  sp, 2

;-355       else if (iswidth==2) prs(" dw ");

 jmp .doglob84
.doglob83:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob85
 push doglob_17
 call prs
 add  sp, 2

;-356       else                 prs(" dd ");

 jmp .doglob86
.doglob85:
 push doglob_18
 call prs
 add  sp, 2

;-357     }

.doglob86:
.doglob84:

;-358     if(istoken('-')) prc('-');

.doglob82:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob87
 push 45
 call prc
 add  sp, 2

;-359     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

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

;-360     else prunsign1(0); }

 jmp .doglob89
.doglob88:
 push 0
 call prunsign1
 add  sp, 2
.doglob89:

;-361   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

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

;-362   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-363   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-364   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

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

;-365   GTop++; expect(';'); }

.doglob91:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-366 


;-367 int gettypes(int i) {int j; char c;
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

;-368   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
;
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

;-369   c=GWidth[i]; widthi=0;wi=0;

.gettypes93:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-370   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes94
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-371   if (c==2) {widthi=2;wi=2;}

.gettypes94:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes95
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-372   if (c==4) {widthi=4;wi=4;}

.gettypes95:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes96
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-373   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

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

;-374   if (c=='&')  typei=2;

.gettypes97:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes98
 mov ax, 2
 mov word [typei], ax

;-375   return i; }

.gettypes98:
 mov ax, [bp+4]
 jmp .retngettypes

;-376 int adrofname(unsigned int i) { adrF(GNameField, i); }

 .retngettypes: LEAVE
 ret
ENDP

adrofname: PROC;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-377 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
ENDP

adrF: PROC;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-378   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-379 int printName(unsigned int i) {int j;
 LEAVE
 ret
ENDP

printName: PROC

;-380   if (i < LSTART) { i=adrofname(i); prs(i); }
;
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

;-381   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

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

;-382 }

.printName100:

;-383 int searchname() { unsigned int i;
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

searchname: PROC

;-384   i=checkName(); if (i == 0) error1("Variable unknown");
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname102
 push searchname_0
 call error1
 add  sp, 2

;-385   GUsed[i]=GUsed[i] + 1; return i;

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

;-386 }


;-387 int checkName() { unsigned int i; unsigned int j;

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

checkName: PROC

;-388   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
;
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

;-389   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

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

;-390   return 0;

 jmp .checkName106
.checkName107:
 mov ax, 0
 jmp .retncheckName

;-391 }


;-392 int typeName() { int m; //0=V,1=*,2=&

 .retncheckName: LEAVE
 ret
ENDP

typeName: PROC

;-393     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-394     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName109
 mov ax, 83
 mov byte [issign], al

;-395     if(istoken(T_UNSIGNED)) issign='U';

.typeName109:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName110
 mov ax, 85
 mov byte [issign], al

;-396     iswidth=2;

.typeName110:
 mov ax, 2
 mov byte [iswidth], al

;-397     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName111
 mov ax, 0
 mov byte [iswidth], al

;-398     if(istoken(T_CHAR))     iswidth=1;

.typeName111:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName112
 mov ax, 1
 mov byte [iswidth], al

;-399     if(istoken(T_INT))      iswidth=2;

.typeName112:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName113
 mov ax, 2
 mov byte [iswidth], al

;-400     if(istoken(T_LONG))     iswidth=4;

.typeName113:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName114
 mov ax, 4
 mov byte [iswidth], al

;-401     istype='V';

.typeName114:
 mov ax, 86
 mov byte [istype], al

;-402     m=0;

 mov ax, 0
 mov [bp-2], ax

;-403     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName115
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-404     if(istoken('&'))  {istype='&'; m=2;}

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

;-405     name1();

.typeName116:
 call name1

;-406     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-407 }


;-408 int name1() {

 .retntypeName: LEAVE
 ret
ENDP

name1: PROC

;-409     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1117
 push name1_0
 call error1
 add  sp, 2

;-410     token=getlex();

.name1117:
 call getlex
 mov word [token], ax

;-411 }


;-412 


;-413 int storeCall1() {//todo

 ret
name1_0 db "Name expected",0
ENDP

storeCall1: PROC

;-414     unsigned int i;


;-415     CTop++;
;
 ENTER  2,0
 inc  word[CTop]

;-416     if (CTop >= CALLMAX) error1("too many calls");

 mov ax, [CTop]
 cmp ax, 1500 ;unsigned : 1
 jl  .storeCall1118
 push storeCall1_0
 call error1
 add  sp, 2

;-417     i = CNamePtr - &CNameField;

.storeCall1118:
 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-418     if (i >= CNAMEMAX) error1("too many call names");

 mov ax, [bp-2]
 cmp ax, 10000 ;unsigned : 0
 jb  .storeCall1119
 push storeCall1_1
 call error1
 add  sp, 2

;-419     CType[CTop]=0;

.storeCall1119:
 mov ax, 0
 mov bx, [CTop]
 mov [CType+bx], al

;-420     CAdr [CTop]=CNamePtr;

 mov ax, [CNamePtr]
 mov bx, [CTop]
 shl bx, 1
 mov [CAdr+bx], ax

;-421     CNamePtr=strcpy(CNamePtr, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNamePtr]
 call strcpy
 add  sp, 4
 mov word [CNamePtr], ax

;-422     CNamePtr++;

 inc  word[CNamePtr]

;-423 }


;-424 


;-425 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storeCall1_0 db "too many calls",0
storeCall1_1 db "too many call names",0
ENDP

storefunc: PROC
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc120
 push storefunc_0
 call error1
 add  sp, 2

;-426     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

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

;-427     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-428 }


;-429 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

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

;-430   if (checkName() != 0) error1("Variable already defined");

.addlocal121:
 call checkName
 cmp ax, 0
 je  .addlocal122
 push addlocal_1
 call error1
 add  sp, 2

;-431   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

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

;-432   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-433   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-434 }


;-435 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-436   while (i < FTop) {

.checkFunction123:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction124

;-437     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

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

;-438   return 0; }

 jmp .checkFunction123
.checkFunction124:
 mov ax, 0
 jmp .retncheckFunction

;-439 int dofunc() { int nloc; int i; int narg;

 .retncheckFunction: LEAVE
 ret
ENDP

dofunc: PROC

;-440   cloc=&co;
;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-441   checknamelen();

 call checknamelen

;-442   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-443   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc126
 push dofunc_0
 call error1
 add  sp, 2

;-444   storefunc();

.dofunc126:
 call storefunc

;-445   prs("\n\n"); prs(symbol); prs(": PROC");

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

;-446   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-447   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc127
 mov ax, 2
 mov [bp-6], ax

;-448     do { typeName();  addlocal(); narg+=2;

.dofunc128:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-449          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

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

;-450     while (istoken(','));  expect(')'); }

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

;-451 


;-452   expect('{'); /*body*/

.dofunc127:
 push 123
 call expect
 add  sp, 2

;-453   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-454   while(isvariable()) {

.dofunc131:
 call isvariable
 or  al, al
 je .dofunc132

;-455     do {typeName();

.dofunc133:
 call typeName

;-456         checknamelen();

 call checknamelen

;-457         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-458         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc134
 sub  word[bp-2], 2

;-459         GData[LTop]=nloc;

.dofunc134:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-460         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc135

;-461             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

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

;-462             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-463             }


;-464         LTop++;

.dofunc135:
 inc  word[LTop]

;-465       } while (istoken(',')); expect(';'); }

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

;-466   if (LTop>LSTART){prs(";\n ENTER  ");

 jmp .dofunc131
.dofunc132:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc137
 push dofunc_3
 call prs
 add  sp, 2

;-467     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

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

;-468   while(istoken('}')==0)   stmt();

.dofunc137:
.dofunc138:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc139
 call stmt

;-469   if (nreturn) {

 jmp .dofunc138
.dofunc139:
 mov ax, [nreturn]
 or  al, al
 je .dofunc140

;-470         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-471         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-472         prc(':');

 push 58
 call prc
 add  sp, 2

;-473         }


;-474   if (LTop > LSTART) prs(" LEAVE");

.dofunc140:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc141
 push dofunc_6
 call prs
 add  sp, 2

;-475   prs("\n ret");

.dofunc141:
 push dofunc_7
 call prs
 add  sp, 2

;-476   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-477   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-478   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

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

;-479   prs("\nENDP");

.dofunc142:
 push dofunc_8
 call prs
 add  sp, 2

;-480 }


;-481 int isvariable() {
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

;-482     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable143
 jmp .v1

;-483     if(token==T_UNSIGNED) goto v1;

.isvariable143:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable144
 jmp .v1

;-484     if(token==T_CHAR)     goto v1;

.isvariable144:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable145
 jmp .v1

;-485     if(token==T_INT)      goto v1;

.isvariable145:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable146
 jmp .v1

;-486     if(token==T_LONG)     goto v1;

.isvariable146:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable147
 jmp .v1

;-487     return 0;

.isvariable147:
 mov ax, 0
 jmp .retnisvariable

;-488 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-489 }


;-490 


;-491 int ireg1;

 .retnisvariable:
 ret
ENDP
ireg1 dw 0

;-492 int mod2; int ireg2;

mod2 dw 0
ireg2 dw 0

;-493 


;-494 int pexpr() {expect('('); iscmp=0;


pexpr: PROC
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-495   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

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

;-496     ireg1=checkreg();

.pexpr149:
 call checkreg
 mov word [ireg1], ax

;-497     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr150
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr150:

;-498   expr(0);

.pexpr148:
 push 0
 call expr
 add  sp, 2

;-499   if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

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

;-500   expect(')'); }

 push 41
 call expect
 add  sp, 2

;-501 


;-502 int constantexpr() { int mode; int id1;int ids;

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

constantexpr: PROC

;-503   token=getlex();   mode=typeName();
;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-504   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-505   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr152
 push constantexpr_0
 call error1
 add  sp, 2

;-506   expect(T_CONST);  prs(" ; constant expression");

.constantexpr152:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-507   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-508   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

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

;-509   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

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

;-510   expect(')');

 push 41
 call expect
 add  sp, 2

;-511 }


;-512 


;-513 char ops[5];
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

;-514 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-515   if (istoken('='))          strcpy(ops, "mov");
;
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

;-516   if (istoken(T_PLUSASS))    strcpy(ops, "add");

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

;-517   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

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

;-518   if (istoken(T_ANDASS))     strcpy(ops, "and");

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

;-519   if (istoken(T_ORASS))      strcpy(ops, "or" );

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

;-520   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

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

;-521   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

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

;-522   if (iscmp1 == 1) { token=getlex();

.doreg1161:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1162
 call getlex
 mov word [token], ax

;-523       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1163
 push doreg1_7
 call error1
 add  sp, 2

;-524       strcpy(ops, "cmp"); }

.doreg1163:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-525   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

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

;-526 


;-527   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1164
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-528   mod2=typeName(); ireg2=checkreg();

.doreg1164:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-529   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1165
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-530   i=searchname();  if (mod2 == 2) a(i); else v(i);

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

;-531   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

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

;-532 }

.doreg1168:

;-533 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

;-534   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg169
 mov ax, 0
 jmp .retncheckreg

;-535   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

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

;-536   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

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

;-537   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

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

;-538   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

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

;-539   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

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

;-540   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

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

;-541   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

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

;-542   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

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

;-543   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

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

;-544   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

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

;-545   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

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

;-546   // (eqstr(symbol,"ip")) return 45;


;-547   if (strlen(symbol) >   3) return 0;

.checkreg191:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg192
 mov ax, 0
 jmp .retncheckreg

;-548   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

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

;-549   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

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

;-550   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

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

;-551   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

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

;-552   if (eqstr(symbol,"cr0")) return 71;

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

;-553   return 0;   }

.checkreg201:
 mov ax, 0
 jmp .retncheckreg

;-554 


;-555 char printregstr[]

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

;-556 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-557 


;-558 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-559   k = &printregstr + i; c=*k; prc(c); i++;
;
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

;-560   k = &printregstr + i; c=*k; prc(c);

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

;-561   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

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

;-562 }

.printreg202:

;-563 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
ENDP
evalue dw 0
exprtype dw 10

;-564 int expr(int isRight)


expr: PROC

;-565 { int mode; int id1;     int ixarr; int ixconst;


;-566   int ids;  int isCONST; int i;     unsigned char *p;


;-567   if (istoken(T_CONST)) { evalue=lexval;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr203
 mov ax, [lexval]
 mov word [evalue], ax

;-568     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-569   mode=typeName(); /*0=V,1=*,2=&*/

.expr203:
 call typeName
 mov [bp-2], ax

;-570   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-571   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr204
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-572   if (token=='(')  {docall1(); goto e1; }

.expr204:
 mov ax, [token]
 cmp ax, 40
 jne .expr205
 call docall1
 jmp .e1

;-573   if (isreg()) goto e1;

.expr205:
 call isreg
 or  al, al
 je .expr206
 jmp .e1

;-574 


;-575   id1=searchname(); gettypes(id1); ids=signi;

.expr206:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-576   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-577     if (istoken('[')) { if (istoken(T_CONST)) {

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

;-578       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-579     else {ixarr=searchname(); expect(T_NAME); expect(']');

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

;-580     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-581     if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr210
 push expr_1
 call error1
 add  sp, 2
.expr210:
.expr209:

;-582   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

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

;-583      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

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

;-584      v(id1); goto e1;}

.expr214:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-585   if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

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

;-586      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

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

;-587      v(id1); goto e1;}

.expr218:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-588 


;-589   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

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

;-590   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

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

;-591   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

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

;-592   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

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

;-593   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr222:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr223
 push expr_14
 call error1
 add  sp, 2

;-594   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr223:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr224
 push expr_15
 call error1
 add  sp, 2

;-595 


;-596   if (istoken('=')) { exprtype= expr(1);

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

;-597   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-598   dovar1(mode, "mov", ixarr, id1);

.expr225:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-599 


;-600 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr226
 push expr_17
 call rterm
 add  sp, 2

;-601   else if (istoken('-')) rterm("sub" );

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

;-602   else if (istoken('&')) rterm("and" );

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

;-603   else if (istoken('|')) rterm("or" );

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

;-604   else if (istoken(T_LESSLESS)) rterm("shl");

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

;-605   else if (istoken(T_GREATGREAT)) rterm("shr");

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

;-606   else if (istoken('*')) domul (ids);

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

;-607   else if (istoken('/')) doidiv(ids);

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

;-608   else if (istoken('%')) domod (ids);

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

;-609   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

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

;-610   return 0;

.expr243:
 mov ax, 0
 jmp .retnexpr

;-611 }


;-612 


;-613 int compoundass(char *op, int mode, int id1) {

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

;-614   if(mode) error1("only scalar Var allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass244
 push compoundass_0
 call error1
 add  sp, 2

;-615   prnl(); prs(op); prs("  ");

.compoundass244:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-616   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

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

;-617   v(id1); prs(", ");

.compoundass246:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-618   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-619 }


;-620 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-621   gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-622   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

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

;-623     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1248
 push dovar1_1
 call prs
 add  sp, 2

;-624     if(widthi == 2) prs(" ax, [bx]");

.dovar1248:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1249
 push dovar1_2
 call prs
 add  sp, 2

;-625     return; }

.dovar1249:
 jmp .retndovar1

;-626   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

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

;-627   if (ixarr) {

.dovar1250:
 mov ax, [bp+8]
 or  al, al
 je .dovar1251

;-628     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-629     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1252
 push dovar1_5
 call prs
 add  sp, 2

;-630     prs("\n "); prs(op);

.dovar1252:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-631     if (wi==2) prs(" ax, "); else prs(" al, ");

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

;-632 // v(id1); prs(" [bx]");


;-633     prc('['); printName(id1); prs(" + bx]");

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

;-634     return; }

 jmp .retndovar1

;-635   prnl();prs(op);

.dovar1251:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-636   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1255
 push dovar1_10
 call prs
 add  sp, 2

;-637   if(wi==2) prs(" ax, ");

.dovar1255:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1256
 push dovar1_11
 call prs
 add  sp, 2

;-638   if(wi==4) prs(" eax, ");

.dovar1256:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1257
 push dovar1_12
 call prs
 add  sp, 2

;-639   v(id1);

.dovar1257:
 push word [bp+10]
 call v
 add  sp, 2

;-640 }


;-641 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-642   if (istoken(T_CONST)) { prnl(); prs(op);
;
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

;-643     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm259
 push rterm_0
 call prs
 add  sp, 2

;-644     if (wi==2) prs(" ax, ");

.rterm259:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm260
 push rterm_1
 call prs
 add  sp, 2

;-645     if (wi==4) prs(" eax, ");

.rterm260:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm261
 push rterm_2
 call prs
 add  sp, 2

;-646     prunsign1(lexval); return;}

.rterm261:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-647   mode=typeName(); id1=searchname(); ixarr=0;

.rterm258:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-648   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

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

;-649     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-650     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm263
 push rterm_3
 call error1
 add  sp, 2
.rterm263:

;-651   if (eqstr(symbol,"_AX")) return;

.rterm262:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm264
 jmp .retnrterm

;-652   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm264:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-653 }


;-654 int isreg() {

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
ENDP

isreg: PROC

;-655   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

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

;-656   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

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

;-657   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

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

;-658   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

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

;-659   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

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

;-660   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

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

;-661   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

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

;-662   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

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

;-663   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

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

;-664   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

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

;-665   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

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

;-666   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

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

;-667   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

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

;-668   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

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

;-669   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

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

;-670   return 0;   r1: return 1;

.isreg279:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-671 }


;-672 int doreg(char *dr) { int i; expect('=');

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

doreg: PROC;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-673   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-674        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg280
 push word [lexval]
 call prunsign1
 add  sp, 2

;-675   else if (istoken(T_NAME )) { i=searchname(); v(i); }

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

;-676   else error1("only number or var allowed"); }

 jmp .doreg283
.doreg282:
 push doreg_2
 call error1
 add  sp, 2
.doreg283:
.doreg281:

;-677 


;-678 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

doassign: PROC

;-679   gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-680   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign284
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-681     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign285
 push doassign_1
 call prs
 add  sp, 2

;-682     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign286
.doassign285:
 push doassign_2
 call prs
 add  sp, 2
.doassign286:
 jmp .retndoassign

;-683   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

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

;-684   if (ixarr) {  prs("\n mov bx, ");

.doassign287:
 mov ax, [bp+8]
 or  al, al
 je .doassign288
 push doassign_5
 call prs
 add  sp, 2

;-685     if(ixconst) prunsign1(ixarr); else v(ixarr);

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

;-686     if (wi==2) prs("\n shl bx, 1");

.doassign290:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign291
 push doassign_6
 call prs
 add  sp, 2

;-687     prs("\n mov ["); printName(i);

.doassign291:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-688     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

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

;-689   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

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

;-690     } v(i); prs(", al"); return; }

.doassign295:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-691   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

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

;-692     } v(i); prs(", ax"); return; }

.doassign297:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-693   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

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

;-694     } v(i); prs(", eax"); return; }

.doassign299:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-695 }

.doassign298:

;-696 int domul(int ids) {

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

;-697   if (ids) rterm("imul"); else {
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul300
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul301
.domul300:

;-698   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul302

;-699     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-700     }


;-701   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul303
.domul302:
 push domul_3
 call error1
 add  sp, 2
.domul303:
.domul301:

;-702 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-703   if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv304

;-704     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-705     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

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

;-706   else {

 jmp .doidiv307
.doidiv304:

;-707     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-708     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv308
 push doidiv_3
 call error1
 add  sp, 2

;-709     gettypes(id1);

.doidiv308:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-710     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv309
 push doidiv_4
 call error1
 add  sp, 2

;-711     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv309:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv310
 push doidiv_5
 call error1
 add  sp, 2

;-712     prs("\n mov bx, "); v(id1);

.doidiv310:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-713     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

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

;-714 }

.doidiv307:

;-715 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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

domod: PROC;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-716 


;-717 int docalltype[10]; int docallvalue[10];
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

;-718 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 55900
procname resb 17
section .text

;-719 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-720   narg=0;  sz32=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-721   checknamelen();

 call checknamelen

;-722   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-723   storeCall1();

 call storeCall1

;-724   expect('(');

 push 40
 call expect
 add  sp, 2

;-725 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1313

;-726 	  do { narg++;

.docall1314:
 inc  word[bp-4]

;-727 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1315
 push docall1_0
 call error1
 add  sp, 2
.docall1315:
 mov ax, 0
 mov [bp-6], ax

;-728       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1316
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-729       if(istoken(T_STRING)){t0=2; n0=nconst;

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

;-730         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-731         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-732       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

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

;-733       if(istoken(T_NAME))  { n0=checkreg();

.docall1318:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1319
 call checkreg
 mov [bp-8], ax

;-734         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1320
 mov ax, 5
 mov [bp-6], ax

;-735         else {t0=4; n0=searchname();

 jmp .docall1321
.docall1320:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-736           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

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

;-737       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1319:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1323
 push docall1_4
 call error1
 add  sp, 2

;-738       docalltype [narg] = t0;

.docall1323:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-739       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-740     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1324
 jmp .docall1314
.docall1324:

;-741 


;-742   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-743     do {

.docall1325:

;-744       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-745       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-746       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1326
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-747       if(t0==2){ prs("\n push ");

.docall1326:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1327
 push docall1_6
 call prs
 add  sp, 2

;-748         prs(fname);prc(95);prunsign1(n0);}

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

;-749       if(t0==3){ prs("\n lea  ax, ");   v(n0);

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

;-750         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-751       if(t0==4){ gettypes(n0);

.docall1328:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1329
 push word [bp-8]
 call gettypes
 add  sp, 2

;-752         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1330
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-753         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1331
.docall1330:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-754         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1331:

;-755       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

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

;-756    i--; } while (i > 0);  }

.docall1332:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1334
 jmp .docall1325
.docall1334:

;-757 	 prs("\n call "); prs(&procname);

.docall1313:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-758 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1335
 push docall1_14
 call prs
 add  sp, 2

;-759      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }

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

;-760 /***************************************************************/


;-761 


;-762 int doemit() {prs("\n db ");
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

;-763   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-764     if (token== ',') {prc(','); goto L1;} expect(')'); }

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

;-765 


;-766 int cmpneg(int ids) {

 ret
doemit_0 db "\n db ",0
ENDP

cmpneg: PROC

;-767        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg337
 push cmpneg_0
 call prs
 add  sp, 2

;-768   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg338
.cmpneg337:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg339
 push cmpneg_1
 call prs
 add  sp, 2

;-769   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

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

;-770                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg343
.cmpneg342:
 push cmpneg_3
 call prs
 add  sp, 2

;-771   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

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

;-772                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-773                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg347
.cmpneg346:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-774                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-775   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg347:
 jmp .cmpneg348
.cmpneg345:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg349
 push cmpneg_8
 call prs
 add  sp, 2

;-776   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg350
.cmpneg349:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg351
 push cmpneg_9
 call prs
 add  sp, 2

;-777   else error1("internal error compare unknown in CMPNEG()");  }

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

;-778 


;-779 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
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

prlabel: PROC;
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

;-780 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC;
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

;-781 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

doif: PROC;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-782   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-783   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif353
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-784     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-785   else prlabel(jdest); }

 jmp .doif354
.doif353:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif354:

;-786 


;-787 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
ENDP

dodo: PROC

;-788   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-789   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-790   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-791 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
ENDP

dowhile: PROC;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-792   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-793   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-794 int isrelational() {
 LEAVE
 ret
ENDP

isrelational: PROC

;-795   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational355
 jmp .w
.isrelational355:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational356
 jmp .w

;-796   if (token==T_LE) goto w; if (token==T_GE) goto w;

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

;-797   if (token=='<' ) goto w; if (token=='>' ) goto w;

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

;-798   return 0;  w: iscmp=token; token=getlex(); return 1;}

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

;-799 


;-800 char symboltemp[80];

 .retnisrelational:
 ret
ENDP
section .bss
absolute 55917
symboltemp resb 80
section .text

;-801 int getlex() { char c; char *p;


getlex: PROC

;-802 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
;
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

;-803   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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

;-804   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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

;-805   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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

;-806   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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

;-807   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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

;-808   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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

;-809   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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

;-810   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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

;-811   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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

;-812   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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

;-813   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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

;-814   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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

;-815   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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

;-816   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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

;-817   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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

;-818   if (c == '/') { if (thechar == '/') {

.getlex391:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex392
 mov al, [thechar]
 cmp al, 47
 jne .getlex393

;-819       do c=next(); while(ifEOL(c)==0) return getlex(); } }

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

;-820   if (c == '/') { if (thechar == '*') {

.getlex392:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex396
 mov al, [thechar]
 cmp al, 42
 jne .getlex397

;-821       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

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

;-822       c=next(); return getlex(); } else  return '/'; }

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

;-823   if (c == '"') {getstring(c); return T_STRING;}

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

;-824   if (digit(c)) { getdigit(c); return T_CONST; }

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

;-825   if (c==39) { lexval=next();

.getlex402:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex403
 call next
 mov word [lexval], ax

;-826     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex404
 call next
 mov word [lexval], ax

;-827       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

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

;-828       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

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

;-829   if (alnum(c)) {

.getlex403:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex408

;-830     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-831     while(alnum(thechar)) {c=next(); *p=c;  p++; }

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

;-832       *p=0;

 jmp .getlex409
.getlex410:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-833     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex411
 mov ax, 531
 jmp .retngetlex

;-834     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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

;-835     if (eqstr(symbol,"void"    )) return T_VOID;

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

;-836     if (eqstr(symbol,"int"     )) return T_INT;

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

;-837     if (eqstr(symbol,"long"    )) return T_LONG;

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

;-838     if (eqstr(symbol,"char"    )) return T_CHAR;

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

;-839     if (eqstr(symbol,"asm"     )) return T_ASM;

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

;-840     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

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

;-841     if (eqstr(symbol,"__emit__")) return T_EMIT;

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

;-842     if (eqstr(symbol,"return"  )) return T_RETURN;

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

;-843     if (eqstr(symbol,"if"      )) return T_IF;

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

;-844     if (eqstr(symbol,"else"    )) return T_ELSE;

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

;-845     if (eqstr(symbol,"while"   )) return T_WHILE;

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

;-846     if (eqstr(symbol,"do"      )) return T_DO;

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

;-847     if (eqstr(symbol,"goto"    )) return T_GOTO;

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

;-848     if (eqstr(symbol,"define"  )) return T_DEFINE;

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

;-849     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

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

;-850     return T_NAME; } error1("Input item not recognized"); }

.getlex427:
 mov ax, 256
 jmp .retngetlex
.getlex408:
 push getlex_17
 call error1
 add  sp, 2

;-851 


;-852 int convertdefine() { int i; int j;   i=0;

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

convertdefine: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-853   while (i < GTop) {

.convertdefine428:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine429

;-854    j=adrofname(i);

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-855    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

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

;-856    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine431:

;-857    i++; }

.convertdefine430:
 inc  word[bp-2]

;-858    return 0; }

 jmp .convertdefine428
.convertdefine429:
 mov ax, 0
 jmp .retnconvertdefine

;-859 


;-860 int getdigit(char c) { int i;

 .retnconvertdefine: LEAVE
 ret
ENDP

getdigit: PROC

;-861     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-862     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

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

;-863       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

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

;-864 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

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

;-865      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-866     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

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

;-867      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit439
.getdigit440:

;-868 }

.getdigit438:

;-869 


;-870 int stmt() { int c; char cha;
 LEAVE
 ret
ENDP

stmt: PROC

;-871        if(istoken('{'))     {while(istoken('}')==0) stmt();}
;
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

;-872   else if(istoken(T_IF))    doif();

 jmp .stmt444
.stmt441:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt445
 call doif

;-873   else if(istoken(T_DO))    dodo();

 jmp .stmt446
.stmt445:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt447
 call dodo

;-874   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt448
.stmt447:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt449
 call dowhile

;-875   else if(istoken(T_GOTO))  {

 jmp .stmt450
.stmt449:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt451

;-876     prs("\n jmp .");name1();prs(symbol);expect(';');}

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

;-877   else if(token==T_ASM)     {prs("\n"); c=next();

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

;-878         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

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

;-879   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();

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

;-880         while(cha!= '}') { prc(cha); cha=next(); }

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

;-881         token=getlex(); }

 jmp .stmt459
.stmt460:
 call getlex
 mov word [token], ax

;-882         else error1("Curly open expected");

 jmp .stmt461
.stmt458:
 push stmt_3
 call error1
 add  sp, 2

;-883         }

.stmt461:

;-884   else if(istoken(T_EMIT))   doemit();

 jmp .stmt462
.stmt457:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt463
 call doemit

;-885   else if(istoken(';'))      { }

 jmp .stmt464
.stmt463:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt465

;-886   else if(istoken(T_RETURN)) {

 jmp .stmt466
.stmt465:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt467

;-887         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt468
 push 0
 call expr
 add  sp, 2

;-888         prs("\n jmp .retn");

.stmt468:
 push stmt_4
 call prs
 add  sp, 2

;-889         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-890         nreturn++;

 inc  word[nreturn]

;-891         expect(';');

 push 59
 call expect
 add  sp, 2

;-892         }


;-893   else if(thechar==':')      {

 jmp .stmt469
.stmt467:
 mov al, [thechar]
 cmp al, 58
 jne .stmt470

;-894         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-895         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-896         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-897         expect(':');

 push 58
 call expect
 add  sp, 2

;-898         }


;-899   else  {expr(0);; expect(';'); }

 jmp .stmt471
.stmt470:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-900 }

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

;-901 


;-902 int getstring(int delim) {
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

;-903     int c; char *p;


;-904     p=&symbol;
;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax

;-905     c=next();

 call next
 mov [bp-2], ax

;-906     while (c != delim) {

.getstring472:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring473

;-907         *p=c;

 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-908         p++;

 inc  word[bp-4]

;-909         c=next();

 call next
 mov [bp-2], ax

;-910     }


;-911     *p=0;

 jmp .getstring472
.getstring473:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-912 }


;-913 


;-914 int fgets1() {
 LEAVE
 ret
ENDP

fgets1: PROC

;-915     char c;


;-916     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-917     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1474

;-918         printinputline();

 call printinputline

;-919         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1475
 mov ax, 0
 jmp .retnfgets1

;-920         fgetsp=&fgetsdest;

.fgets1475:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-921         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-922         column=0;

 mov ax, 0
 mov word [column], ax

;-923     }


;-924     fgetsp++;

.fgets1474:
 inc  word[fgetsp]

;-925     column++;

 inc  word[column]

;-926     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-927 }


;-928 int printinputline() {

 .retnfgets1: LEAVE
 ret
ENDP

printinputline: PROC

;-929     int col;


;-930     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-931     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-932     do {

.printinputline476:

;-933         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-934         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline477
 jmp .retnprintinputline

;-935         *fgetsp=DOS_ByteRead;

.printinputline477:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-936         fgetsp++;

 inc  word[fgetsp]

;-937         col++;

 inc  word[bp-2]

;-938         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline478
 push printinputline_0
 call error1
 add  sp, 2

;-939         }

.printinputline478:

;-940         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline479
 jmp .printinputline476
.printinputline479:

;-941     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-942     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline480

;-943         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-944         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-945         prc(' ');

 push 32
 call prc
 add  sp, 2

;-946         lineno++;

 inc  word[lineno]

;-947         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-948         }


;-949 }

.printinputline480:

;-950 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

ifEOL: PROC

;-951     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL481
 mov ax, 1
 jmp .retnifEOL

;-952     if (c == 13) {//CR

.ifEOL481:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL482

;-953         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL483
 call next
 mov [bp+4], al

;-954         return 1;

.ifEOL483:
 mov ax, 1
 jmp .retnifEOL

;-955     }


;-956     return 0;

.ifEOL482:
 mov ax, 0
 jmp .retnifEOL

;-957 }


;-958 


;-959 int end1(int n) {

 .retnifEOL: LEAVE
 ret
ENDP

end1: PROC

;-960     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-961     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-962     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-963 }


;-964 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-965     lineno--;
;
 ENTER  0,0
 dec  word[lineno]

;-966     prnl();

 call prnl

;-967     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-968     prs(";Line: ");

 push error1_0
 call prs
 add  sp, 2

;-969     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-970     prs(" ************** ERROR: ");

 push error1_1
 call prs
 add  sp, 2

;-971     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-972     prs("  in column: ");

 push error1_2
 call prs
 add  sp, 2

;-973     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-974     prs("\nToken: ");

 push error1_3
 call prs
 add  sp, 2

;-975     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-976 //    prs(", globC: ");


;-977 //    prc(globC);


;-978 //    prs(", thechar: ");


;-979 //    prunsign1(thechar);


;-980     prs(", symbol: ");

 push error1_4
 call prs
 add  sp, 2

;-981     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-982     end1(1);

 push 1
 call end1
 add  sp, 2

;-983 }


;-984 


;-985 unsigned int MAXUI=65535;
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP
MAXUI dw 65535

;-986 int epilog() {


epilog: PROC

;-987     unsigned int i;


;-988     prs("\n;Input: "); prs(&namein);
;
 ENTER  2,0
 push epilog_0
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-989     prs(", List: ");   prs(&namelst);

 push epilog_1
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-990     prs(",  Lines:"); printint51(lineno);

 push epilog_2
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-991     prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_3
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-992     prs(" max.:"); printint51(LSTART);

 push epilog_4
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-993     prs("\n;Functions      :"); printint51(FTop);

 push epilog_5
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-994     prs(" max.:"); printint51(FUNCMAX);

 push epilog_6
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-995     prs("\n;Calls          :"); printint51(CTop);

 push epilog_7
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-996     prs(" max.:"); printint51(CALLMAX);

 push epilog_8
 call prs
 add  sp, 2
 push 1500
 call printint51
 add  sp, 2

;-997     i = CNamePtr - &CNameField;

 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-998     prs("\n;NameField      :"); printint51(i);

 push epilog_9
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-999     prs(" max.:"); printint51(CNAMEMAX);

 push epilog_10
 call prs
 add  sp, 2
 push 10000
 call printint51
 add  sp, 2

;-1000     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);

 push epilog_11
 call prs
 add  sp, 2
 lea  ax, [coname]
 push ax
 call prs
 add  sp, 2
 push epilog_12
 call prs
 add  sp, 2
 push word [maxco]
 call printint51
 add  sp, 2

;-1001     prs(" max.:"); printint51(COMAX);

 push epilog_13
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-1002     i=COMAX; i=i-maxco;

 mov ax, 2000
 mov [bp-2], ax
 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax

;-1003     if (i <= 1000)prs(" *** Warning *** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog484
 push epilog_14
 call prs
 add  sp, 2

;-1004     prs(", stacksize: ");

.epilog484:
 push epilog_15
 call prs
 add  sp, 2

;-1005     i=MAXUI-orgData; printint51(i);

 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1006     if (i <= 1000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog485
 push epilog_16
 call prs
 add  sp, 2

;-1007   end1(0);}

.epilog485:
 push 0
 call end1
 add  sp, 2

;-1008 


;-1009 int dodefine() {
 LEAVE
 ret
epilog_0 db "\n;Input: ",0
epilog_1 db ", List: ",0
epilog_2 db ",  Lines:",0
epilog_3 db "\n;Glob. variables:",0
epilog_4 db " max.:",0
epilog_5 db "\n;Functions      :",0
epilog_6 db " max.:",0
epilog_7 db "\n;Calls          :",0
epilog_8 db " max.:",0
epilog_9 db "\n;NameField      :",0
epilog_10 db " max.:",0
epilog_11 db "\n;Const in '",0
epilog_12 db "' :",0
epilog_13 db " max.:",0
epilog_14 db " *** Warning *** constant area too small",0
epilog_15 db ", stacksize: ",0
epilog_16 db " *** Warning *** Stack too small",0
ENDP

dodefine: PROC

;-1010     int i; int j; int fdtemp;


;-1011     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine486

;-1012         token=getlex();

 call getlex
 mov word [token], ax

;-1013         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1014         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1015         return;

 jmp .retndodefine

;-1016     }


;-1017     expect(T_NAME);

.dodefine486:
 push 256
 call expect
 add  sp, 2

;-1018     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine487

;-1019         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine488
 push dodefine_1
 call error1
 add  sp, 2

;-1020         i=strlen(symbol);

.dodefine488:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1021         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine489
 push dodefine_2
 call error1
 add  sp, 2

;-1022         GSign [GTop]='U';

.dodefine489:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1023         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1024         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1025         GAdr [GTop]=lineno-1;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax

;-1026         GUsed [GTop]=0;

 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1027         pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-1028         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1029         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1030         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1031         GTop++;

 inc  word[GTop]

;-1032     }


;-1033 }

.dodefine487:

;-1034 


;-1035 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1036     CNamePtr = &CNameField;

 mov ax, CNameField
 mov word [CNamePtr], ax

;-1037     token=getlex();

 call getlex
 mov word [token], ax

;-1038     do {

.parse490:

;-1039         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse491
 mov ax, 1
 jmp .retnparse

;-1040         if (istoken('#')) {

.parse491:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse492

;-1041              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse493
 call dodefine

;-1042              else error1("define expected");

 jmp .parse494
.parse493:
 push parse_0
 call error1
 add  sp, 2

;-1043         }

.parse494:

;-1044     else{

 jmp .parse495
.parse492:

;-1045         typeName();

 call typeName

;-1046         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse496
 call dofunc

;-1047         else doglob(); }

 jmp .parse497
.parse496:
 call doglob
.parse497:

;-1048     } while(1);

.parse495:
 mov ax, 1
 or  al, al
 je .parse498
 jmp .parse490
.parse498:

;-1049 }


;-1050 


;-1051 int getfirstchar() {

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP

getfirstchar: PROC

;-1052     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1053     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1054     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1055     }


;-1056 


;-1057 char *arglen=0x80; char *argv=0x82;

 ret
ENDP
arglen dw 128
argv dw 130

;-1058 int getarg() {


getarg: PROC

;-1059     int arglen1; int i; char *c;


;-1060     arglen1=*arglen;
;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1061     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarg499

;-1062         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1063         cputs(" Usage: A.COM in_file[.C]: ");

 push getarg_0
 call cputs
 add  sp, 2

;-1064         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1065         }


;-1066     i=arglen1+129;

.getarg499:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1067     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1068     arglen1--;

 dec  word[bp-2]

;-1069     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1070     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1071     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarg500
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-1072     strcpy(namelst, namein);

.getarg500:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1073     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1074     i--;

 dec  word[bp-4]

;-1075     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1076     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1077 


;-1078     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1079     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg501

;-1080         cputs("Source file missing (.C): ");

 push getarg_2
 call cputs
 add  sp, 2

;-1081         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1082         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1083         }


;-1084     fdout=creatR(namelst);

.getarg501:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1085     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg502

;-1086         cputs("list file not creatable: ");

 push getarg_3
 call cputs
 add  sp, 2

;-1087         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1088         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1089         }


;-1090     prs("\n; ");

.getarg502:
 push getarg_4
 call prs
 add  sp, 2

;-1091     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1092     prs(", Source: "); prs(namein);

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1093     prs(", Output asm: "); prs(namelst);

 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1094     prs("\norg  256 \njmp main");

 push getarg_7
 call prs
 add  sp, 2

;-1095 }


;-1096 


;-1097 int main() {
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

main: PROC

;-1098     getarg();

 call getarg

;-1099     CNameTop=0;

 mov ax, 0
 mov word [CNameTop], ax

;-1100     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1101     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1102     getfirstchar();

 call getfirstchar

;-1103     parse();

 call parse

;-1104   epilog();

 call epilog

;-1105 }

 ret
ENDP
;Input: A.C, List: A.S,  Lines: 1106
;Glob. variables:  118 max.:  200
;Functions      :   91 max.:  300
;Calls          :  786 max.: 1500
;NameField      : 4999 max.:10000
;Const in 'checkreg' :  712 max.: 2000, stacksize:  9538