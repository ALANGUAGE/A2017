
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

;-103 int ireg1;

ireg1 dw 0

;-104 int mod2;

mod2 dw 0

;-105 int ireg2;

ireg2 dw 0

;-106 


;-107 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-108 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }

 ret
ENDP

putch: PROC
;Function : putch, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   108 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
 mov  al, 13
 call writetty
.putch1:
 mov  al, [bp+4]
 call writetty

;-109 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
ENDP

cputs: PROC
;Function : cputs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   109 NULL s = bp+4
;  201 var sign byte   109 NULL c = bp-2;
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

;-110 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC
;Function : mkneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   110 NULL n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-111 


;-112 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-113     __emit__(0xCD,0x21);//inth 0x21;

 db 205,33

;-114     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-115     DOS_ERR++;

 inc  word[DOS_ERR]

;-116 }


;-117 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC
;Function : openR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   117 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-118 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC
;Function : creatR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   118 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-119 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC
;Function : fcloseR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   119 NULL fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-120 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC
;Function : exitR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   120 NULL c = bp+4;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-121 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-122     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}

;Function : readRL, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   121 NULL s = bp+4
;  201 var sign word   121 NULL fd = bp+6
;  202 var sign word   121 NULL len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-123 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC
;Function : fputcR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   123 NULL n = bp+4
;  201 var sign word   123 NULL fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]

;-124   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-125 


;-126   int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-127       if (c=='_') return 1;

;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   126 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-128       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-129       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-130       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-131       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-132       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-133       if (c> 'Z') { if (c< 'a') return 0; }

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

;-134       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-135   }


;-136   int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-137       if(c<'0') return 0;

;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   136 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-138       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-139       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-140   }


;-141   int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-142     if (digit (c)) return 1;

;Function : alnum, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   141 NULL c = bp+4;
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

;-143     if (letter(c)) return 1;

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

;-144     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-145   }


;-146 


;-147 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-148     c=0;

;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   147 NULL s = bp+4
;  201 var sign word   147 NULL c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-149     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-150     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-151 }


;-152 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-153     do { *s=*t; s++; t++; }

;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   152 NULL s = bp+4
;  201 ptr sign byte   152 NULL t = bp+6;
 ENTER  0,0
.strcpy18:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]

;-154     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-155     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-156     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-157 }


;-158 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-159     while(*p) {

;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   158 NULL p = bp+4
;  201 ptr sign byte   158 NULL q = bp+6;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-160         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-161         p++;

.eqstr22:
 inc  word[bp+4]

;-162         q++;

 inc  word[bp+6]

;-163     }


;-164     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-165     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-166 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-167     while (*s != 0) s++;

;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   166 NULL s = bp+4
;  201 ptr sign byte   166 NULL t = bp+6;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-168     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-169 }


;-170 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-171     while(*s) {

;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   170 NULL s = bp+4;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-172         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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

;-173         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-174     }


;-175 }

 jmp .toupper26
.toupper27:

;-176 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-177     while(*s) {

;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   176 NULL s = bp+4
;  201 var sign byte   176 NULL c = bp+6;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-178         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-179         s++;

.instr132:
 inc  word[bp+4]

;-180     }


;-181     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-182 }


;-183 


;-184 


;-185 int eprc(char c)  {

 .retninstr1: LEAVE
 ret
ENDP

eprc: PROC

;-186     *cloc=c;

;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   185 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al

;-187     cloc++;

 inc  word[cloc]

;-188 }


;-189 int eprs(char *s) {
 LEAVE
 ret
ENDP

eprs: PROC

;-190     char c;


;-191     while(*s) {

;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   189 NULL s = bp+4
;  201 var sign byte   190 NULL c = bp-2;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34

;-192         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-193         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2

;-194         s++;

 inc  word[bp+4]

;-195     }


;-196 }

 jmp .eprs33
.eprs34:

;-197 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-198     if (c==10) {

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   197 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc35

;-199         _AX=13;

 mov  ax, 13

;-200         writetty();

 call writetty

;-201     }


;-202     _AL=c;

.prc35:
 mov  al, [bp+4]

;-203     writetty();

 call writetty

;-204     fputcR(c, fdout);

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-205 }


;-206 int prscomment(unsigned char *s) {
 LEAVE
 ret
ENDP

prscomment: PROC

;-207     unsigned char c;


;-208     while(*s){

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   206 NULL s = bp+4
;  201 var unsg byte   207 NULL c = bp-2;
 ENTER  2,0
.prscomment36:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment37

;-209         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-210         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-211         s++;

 inc  word[bp+4]

;-212     }


;-213 }

 jmp .prscomment36
.prscomment37:

;-214 int prs(unsigned char *s) {
 LEAVE
 ret
ENDP

prs: PROC

;-215     unsigned char c; int com;


;-216     com=0;

;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   214 NULL s = bp+4
;  201 var unsg byte   215 NULL c = bp-2
;  202 var sign word   215 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-217     while(*s) {

.prs38:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs39

;-218         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-219         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs40
 mov ax, [bp-4]
 or  al, al
 je .prs41
 mov ax, 0
 mov [bp-4], ax

;-220                    else com=1;

 jmp .prs42
.prs41:
 mov ax, 1
 mov [bp-4], ax

;-221         if (c==92) {

.prs42:
.prs40:
 mov al, [bp-2]
 cmp al, 92
 jne .prs43

;-222             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs44

;-223                 s++;

 inc  word[bp+4]

;-224                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-225                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs45
 mov ax, 10
 mov [bp-2], al

;-226                 if (c=='t') c= 9;

.prs45:
 mov al, [bp-2]
 cmp al, 116
 jne .prs46
 mov ax, 9
 mov [bp-2], al

;-227             }

.prs46:

;-228         }

.prs44:

;-229         prc(c);

.prs43:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-230         s++;

 inc  word[bp+4]

;-231     }


;-232 }

 jmp .prs38
.prs39:

;-233 int prnl() {
 LEAVE
 ret
ENDP

prnl: PROC

;-234     prs("\n ");

 push prnl_0
 call prs
 add  sp, 2

;-235 }


;-236 


;-237 


;-238 int eprnum(int n){//for docall1 procedure

 ret
prnl_0 db "\n ",0
ENDP

eprnum: PROC

;-239     int e;


;-240     if(n<0) {

;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   238 NULL n = bp+4
;  201 var sign word   239 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum47

;-241         eprc('-');

 push 45
 call eprc
 add  sp, 2

;-242         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-243     }


;-244     if (n >= 10) {

.eprnum47:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum48

;-245         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-246         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2

;-247     }


;-248     n=n%10;

.eprnum48:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-249     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax

;-250     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2

;-251 }


;-252 int pint1 (int n){
 LEAVE
 ret
ENDP

pint1: PROC

;-253     int e;


;-254     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   252 NULL n = bp+4
;  201 var sign word   253 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint149
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-255     if (n >= 10) {

.pint149:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint150

;-256         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-257         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2

;-258     }


;-259     n=n%10;

.pint150:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-260     n += '0';

 add  word[bp+4], 48

;-261     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-262 }


;-263 int prunsign1(unsigned int n) {
 LEAVE
 ret
ENDP

prunsign1: PROC

;-264     unsigned int e;


;-265     if (n >= 10) {

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   263 NULL n = bp+4
;  201 var unsg word   264 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign151

;-266         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax

;-267         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-268     }


;-269     n = n % 10; /*unsigned mod*/

.prunsign151:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax

;-270     n += '0';

 add  word[bp+4], 48

;-271     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-272 }


;-273 int printint51(unsigned int j)  {
 LEAVE
 ret
ENDP

printint51: PROC

;-274     if (j<10000) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   273 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint5152
 push 32
 call prc
 add  sp, 2

;-275     if (j<1000) prc(32);

.printint5152:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint5153
 push 32
 call prc
 add  sp, 2

;-276     if (j<100) prc(32);

.printint5153:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint5154
 push 32
 call prc
 add  sp, 2

;-277     if (j<10) prc(32);

.printint5154:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint5155
 push 32
 call prc
 add  sp, 2

;-278     prunsign1(j);

.printint5155:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-279 }


;-280 


;-281 int end1(int n) {
 LEAVE
 ret
ENDP

end1: PROC

;-282     fcloseR(fdin);

;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   281 NULL n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-283     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-284     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-285 }


;-286 


;-287 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-288     lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   287 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-289     prnl();

 call prnl

;-290     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-291     prs(";Line: ");

 push error1_0
 call prs
 add  sp, 2

;-292     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-293     prs(" ************** ERROR: ");

 push error1_1
 call prs
 add  sp, 2

;-294     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-295     prs("  in column: ");

 push error1_2
 call prs
 add  sp, 2

;-296     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-297     prs("\nToken: ");

 push error1_3
 call prs
 add  sp, 2

;-298     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-299     prs(", symbol: ");

 push error1_4
 call prs
 add  sp, 2

;-300     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-301     end1(1);

 push 1
 call end1
 add  sp, 2

;-302 }


;-303 


;-304 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP

ifEOL: PROC

;-305     if (c == 10) return 1;//LF

;Function : ifEOL, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   304 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL56
 mov ax, 1
 jmp .retnifEOL

;-306     if (c == 13) {//CR

.ifEOL56:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL57

;-307         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL58
 call next
 mov [bp+4], al

;-308         return 1;

.ifEOL58:
 mov ax, 1
 jmp .retnifEOL

;-309     }


;-310     return 0;

.ifEOL57:
 mov ax, 0
 jmp .retnifEOL

;-311 }


;-312 int printinputline() {

 .retnifEOL: LEAVE
 ret
ENDP

printinputline: PROC

;-313     int col;


;-314     col=0;

;Function : printinputline, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   313 NULL col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-315     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-316     do {

.printinputline59:

;-317         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-318         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline60
 jmp .retnprintinputline

;-319         *fgetsp=DOS_ByteRead;

.printinputline60:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-320         fgetsp++;

 inc  word[fgetsp]

;-321         col++;

 inc  word[bp-2]

;-322         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline61
 push printinputline_0
 call error1
 add  sp, 2

;-323         }

.printinputline61:

;-324         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline62
 jmp .printinputline59
.printinputline62:

;-325     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-326     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline63

;-327         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-328         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-329         prc(' ');

 push 32
 call prc
 add  sp, 2

;-330         lineno++;

 inc  word[lineno]

;-331         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-332         }


;-333 }

.printinputline63:

;-334 int fgets1() {

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

fgets1: PROC

;-335     char c;


;-336     c=*fgetsp;

;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   335 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-337     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets164

;-338         printinputline();

 call printinputline

;-339         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets165
 mov ax, 0
 jmp .retnfgets1

;-340         fgetsp=&fgetsdest;

.fgets165:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-341         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-342         column=0;

 mov ax, 0
 mov word [column], ax

;-343     }


;-344     fgetsp++;

.fgets164:
 inc  word[fgetsp]

;-345     column++;

 inc  word[column]

;-346     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-347 }


;-348 int next() {

 .retnfgets1: LEAVE
 ret
ENDP

next: PROC

;-349     char r;


;-350     r = thechar;

;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   349 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-351     globC=r;

 mov al, [bp-2]
 mov byte [globC], al

;-352     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-353     return r;

 mov al, [bp-2]
 jmp .retnnext

;-354 }


;-355 


;-356 int getdigit(char c) { int i;

 .retnnext: LEAVE
 ret
ENDP

getdigit: PROC

;-357     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   356 NULL c = bp+4
;  201 var sign word   356 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-358     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit66
 mov ax, 88
 mov byte [thechar], al
.getdigit66:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit67
 call next

;-359       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit68:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit69
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit70
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-360 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit70:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit71
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit71:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-361      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-362     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

 jmp .getdigit68
.getdigit69:
 jmp .getdigit72
.getdigit67:
.getdigit73:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit74
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-363      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit73
.getdigit74:

;-364 }

.getdigit72:

;-365 int getstring(int delim) {
 LEAVE
 ret
ENDP

getstring: PROC

;-366     int c; char *p;


;-367     p=&symbol;

;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   365 NULL delim = bp+4
;  201 var sign word   366 NULL c = bp-2
;  202 ptr sign byte   366 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax

;-368     c=next();

 call next
 mov [bp-2], ax

;-369     while (c != delim) {

.getstring75:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring76

;-370         *p=c;

 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-371         p++;

 inc  word[bp-4]

;-372         c=next();

 call next
 mov [bp-2], ax

;-373     }


;-374     *p=0;

 jmp .getstring75
.getstring76:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-375 }


;-376 


;-377 char symboltemp[80];
 LEAVE
 ret
ENDP
section .bss
absolute 55840
symboltemp resb 80
section .text

;-378 int getlex() { char c; char *p;


getlex: PROC

;-379 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   378 NULL c = bp-2
;  201 ptr sign byte   378 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex77
 mov ax, 0
 jmp .retngetlex
.getlex77:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex78
 jmp .g1

;-380   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex78:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex79
 mov al, [thechar]
 cmp al, 61
 jne .getlex80
 call next
 mov ax, 806
 jmp .retngetlex
.getlex80:

;-381   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex79:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex81
 mov al, [thechar]
 cmp al, 61
 jne .getlex82
 call next
 mov ax, 807
 jmp .retngetlex
.getlex82:

;-382   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex81:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex83
 mov al, [thechar]
 cmp al, 61
 jne .getlex84
 call next
 mov ax, 824
 jmp .retngetlex
.getlex84:

;-383   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex83:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex85
 mov al, [thechar]
 cmp al, 61
 jne .getlex86
 call next
 mov ax, 811
 jmp .retngetlex
.getlex86:

;-384   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex85:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex87
 mov al, [thechar]
 cmp al, 60
 jne .getlex88
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex88:

;-385   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex87:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex89
 mov al, [thechar]
 cmp al, 62
 jne .getlex90
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex90:

;-386   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex89:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex91
 mov al, [thechar]
 cmp al, 43
 jne .getlex92
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex92:

;-387   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex91:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex93
 mov al, [thechar]
 cmp al, 45
 jne .getlex94
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex94:

;-388   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex93:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex95
 mov al, [thechar]
 cmp al, 61
 jne .getlex96
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex96:

;-389   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex95:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex97
 mov al, [thechar]
 cmp al, 61
 jne .getlex98
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex98:

;-390   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex97:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex99
 mov al, [thechar]
 cmp al, 61
 jne .getlex100
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex100:

;-391   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex99:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex101
 mov al, [thechar]
 cmp al, 61
 jne .getlex102
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex102:

;-392   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex101:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex103
 mov al, [thechar]
 cmp al, 61
 jne .getlex104
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex104:

;-393   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex103:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex105
 mov al, [thechar]
 cmp al, 61
 jne .getlex106
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex106:

;-394   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex107
 mov al, [bp-2]
 jmp .retngetlex

;-395   if (c == '/') { if (thechar == '/') {

.getlex107:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex108
 mov al, [thechar]
 cmp al, 47
 jne .getlex109

;-396       do c=next(); while(ifEOL(c)==0) return getlex(); } }

.getlex110:
 call next
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex111
 jmp .getlex110
.getlex111:
 call getlex
 jmp .retngetlex
.getlex109:

;-397   if (c == '/') { if (thechar == '*') {

.getlex108:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex112
 mov al, [thechar]
 cmp al, 42
 jne .getlex113

;-398       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex114
 jmp .g2
.getlex114:
 mov al, [thechar]
 cmp al, 47
 je  .getlex115
 jmp .g2

;-399       c=next(); return getlex(); } else  return '/'; }

.getlex115:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex116
.getlex113:
 mov ax, 47
 jmp .retngetlex
.getlex116:

;-400   if (c == '"') {getstring(c); return T_STRING;}

.getlex112:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex117
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-401   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex117:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex118
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-402   if (c==39) { lexval=next();

.getlex118:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex119
 call next
 mov word [lexval], ax

;-403     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex120
 call next
 mov word [lexval], ax

;-404       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex121
 mov ax, 10
 mov word [lexval], ax
.getlex121:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex122
 mov ax, 9
 mov word [lexval], ax

;-405       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex122:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex123
 mov ax, 0
 mov word [lexval], ax
.getlex123:
.getlex120:
 call next
 mov ax, 257
 jmp .retngetlex

;-406   if (alnum(c)) {

.getlex119:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex124

;-407     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-408     while(alnum(thechar)) {c=next(); *p=c;  p++; }

.getlex125:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex126
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-409       *p=0;

 jmp .getlex125
.getlex126:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-410     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex127
 mov ax, 531
 jmp .retngetlex

;-411     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex127:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex128
 mov ax, 532
 jmp .retngetlex

;-412     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex128:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex129
 mov ax, 529
 jmp .retngetlex

;-413     if (eqstr(symbol,"int"     )) return T_INT;

.getlex129:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 517
 jmp .retngetlex

;-414     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex130:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 533
 jmp .retngetlex

;-415     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex131:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 530
 jmp .retngetlex

;-416     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex132:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 518
 jmp .retngetlex

;-417     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex133:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 519
 jmp .retngetlex

;-418     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex134:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 520
 jmp .retngetlex

;-419     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex135:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 512
 jmp .retngetlex

;-420     if (eqstr(symbol,"if"      )) return T_IF;

.getlex136:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 513
 jmp .retngetlex

;-421     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex137:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 514
 jmp .retngetlex

;-422     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex138:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 515
 jmp .retngetlex

;-423     if (eqstr(symbol,"do"      )) return T_DO;

.getlex139:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 516
 jmp .retngetlex

;-424     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex140:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 521
 jmp .retngetlex

;-425     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex141:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 511
 jmp .retngetlex

;-426     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex142:
 call convertdefine
 or  al, al
 je .getlex143
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-427     return T_NAME; } error1("Input item not recognized"); }

.getlex143:
 mov ax, 256
 jmp .retngetlex
.getlex124:
 push getlex_17
 call error1
 add  sp, 2

;-428 


;-429 


;-430 int istoken(int t) {

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

istoken: PROC

;-431     if (token == t) {

;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   430 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken144

;-432         token=getlex();

 call getlex
 mov word [token], ax

;-433         return 1;

 mov ax, 1
 jmp .retnistoken

;-434     }


;-435     return 0;

.istoken144:
 mov ax, 0
 jmp .retnistoken

;-436 }


;-437 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-438     if (istoken(t)==0) {

;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   437 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect145

;-439         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-440         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-441         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-442         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-443         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-444     }


;-445 }

.expect145:

;-446 


;-447 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

adrF: PROC
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   447 NULL s = bp+4
;  201 var unsg word   447 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-448   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-449 


;-450 int adrofname(unsigned int i) { adrF(GNameField, i); }
 LEAVE
 ret
ENDP

adrofname: PROC
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   450 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-451 


;-452 int printName(unsigned int i) {int j;
 LEAVE
 ret
ENDP

printName: PROC

;-453   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   452 NULL i = bp+4
;  201 var sign word   452 NULL j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName146
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-454   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp .printName147
.printName146:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle .printName148
 push 43
 call prc
 add  sp, 2
.printName148:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-455 }

.printName147:

;-456 


;-457 int a(unsigned int i) { printName(i);//address
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

a: PROC
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   457 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-458 }


;-459 int v(unsigned int i) {//value
 LEAVE
 ret
ENDP

v: PROC

;-460     if (i < LSTART) prc('[');

;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   459 NULL i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v149
 push 91
 call prc
 add  sp, 2

;-461     printName(i);

.v149:
 push word [bp+4]
 call printName
 add  sp, 2

;-462     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v150
 push 93
 call prc
 add  sp, 2

;-463 }

.v150:

;-464 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-465     int i;


;-466     i=strlen(symbol);

;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   465 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-467     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen151
 push checknamelen_0
 call error1
 add  sp, 2

;-468 }

.checknamelen151:

;-469 int convertdefine() { int i; int j;   i=0;
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

convertdefine: PROC
;Function : convertdefine, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   469 NULL i = bp-2
;  201 var sign word   469 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-470   while (i < GTop) {

.convertdefine152:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine153

;-471    j=adrofname(i);

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-472    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine154
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine155
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-473    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine155:

;-474    i++; }

.convertdefine154:
 inc  word[bp-2]

;-475    return 0; }

 jmp .convertdefine152
.convertdefine153:
 mov ax, 0
 jmp .retnconvertdefine

;-476 


;-477 int checkName() { unsigned int i; unsigned int j;

 .retnconvertdefine: LEAVE
 ret
ENDP

checkName: PROC

;-478   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   477 NULL i = bp-2
;  201 var unsg word   477 NULL j = bp-4;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
.checkName156:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName157
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
 je .checkName158
 mov ax, [bp-2]
 jmp .retncheckName
.checkName158:
 inc  word[bp-2]

;-479   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp .checkName156
.checkName157:
 mov ax, 1
 mov [bp-2], ax
.checkName159:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName160
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
 je .checkName161
 mov ax, [bp-2]
 jmp .retncheckName
.checkName161:
 inc  word[bp-2]

;-480   return 0;

 jmp .checkName159
.checkName160:
 mov ax, 0
 jmp .retncheckName

;-481 }


;-482 int searchname() { unsigned int i;

 .retncheckName: LEAVE
 ret
ENDP

searchname: PROC

;-483   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   482 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname162
 push searchname_0
 call error1
 add  sp, 2

;-484   GUsed[i]=GUsed[i] + 1; return i;

.searchname162:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp .retnsearchname

;-485 }


;-486 int name1() {

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC

;-487     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1163
 push name1_0
 call error1
 add  sp, 2

;-488     token=getlex();

.name1163:
 call getlex
 mov word [token], ax

;-489 }


;-490 int typeName() { int m; //0=V,1=*,2=&

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC

;-491     issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   490 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-492     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 83
 mov byte [issign], al

;-493     if(istoken(T_UNSIGNED)) issign='U';

.typeName164:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 85
 mov byte [issign], al

;-494     iswidth=2;

.typeName165:
 mov ax, 2
 mov byte [iswidth], al

;-495     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 0
 mov byte [iswidth], al

;-496     if(istoken(T_CHAR))     iswidth=1;

.typeName166:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 1
 mov byte [iswidth], al

;-497     if(istoken(T_INT))      iswidth=2;

.typeName167:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName168
 mov ax, 2
 mov byte [iswidth], al

;-498     if(istoken(T_LONG))     iswidth=4;

.typeName168:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName169
 mov ax, 4
 mov byte [iswidth], al

;-499     istype='V';

.typeName169:
 mov ax, 86
 mov byte [istype], al

;-500     m=0;

 mov ax, 0
 mov [bp-2], ax

;-501     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName170
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-502     if(istoken('&'))  {istype='&'; m=2;}

.typeName170:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName171
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-503     name1();

.typeName171:
 call name1

;-504     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-505 }


;-506 int gettypes(int i) {int j; char c;

 .retntypeName: LEAVE
 ret
ENDP

gettypes: PROC

;-507   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   506 NULL i = bp+4
;  201 var sign word   506 NULL j = bp-2
;  202 var sign byte   506 NULL c = bp-4;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes172
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes173
.gettypes172:
 mov ax, 0
 mov word [signi], ax

;-508   c=GWidth[i]; widthi=0;wi=0;

.gettypes173:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-509   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes174
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-510   if (c==2) {widthi=2;wi=2;}

.gettypes174:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes175
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-511   if (c==4) {widthi=4;wi=4;}

.gettypes175:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes176
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-512   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes176:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes177
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-513   if (c=='&')  typei=2;

.gettypes177:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes178
 mov ax, 2
 mov word [typei], ax

;-514   return i; }

.gettypes178:
 mov ax, [bp+4]
 jmp .retngettypes

;-515 


;-516 int storeCall1() {//todo

 .retngettypes: LEAVE
 ret
ENDP

storeCall1: PROC

;-517     unsigned int i;


;-518     CTop++;

;Function : storeCall1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   517 NULL i = bp-2;
 ENTER  2,0
 inc  word[CTop]

;-519     if (CTop >= CALLMAX) error1("too many calls");

 mov ax, [CTop]
 cmp ax, 1500 ;unsigned : 1
 jl  .storeCall1179
 push storeCall1_0
 call error1
 add  sp, 2

;-520     i = CNamePtr - &CNameField;

.storeCall1179:
 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-521     if (i >= CNAMEMAX) error1("too many call names");

 mov ax, [bp-2]
 cmp ax, 10000 ;unsigned : 0
 jb  .storeCall1180
 push storeCall1_1
 call error1
 add  sp, 2

;-522     CType[CTop]=0;

.storeCall1180:
 mov ax, 0
 mov bx, [CTop]
 mov [CType+bx], al

;-523     CAdr [CTop]=CNamePtr;

 mov ax, [CNamePtr]
 mov bx, [CTop]
 shl bx, 1
 mov [CAdr+bx], ax

;-524     CNamePtr=strcpy(CNamePtr, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNamePtr]
 call strcpy
 add  sp, 4
 mov word [CNamePtr], ax

;-525     CNamePtr++;

 inc  word[CNamePtr]

;-526 }


;-527 


;-528 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storeCall1_0 db "too many calls",0
storeCall1_1 db "too many call names",0
ENDP

storefunc: PROC
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc181
 push storefunc_0
 call error1
 add  sp, 2

;-529     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc181:
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

;-530     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-531 }


;-532 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal182
 push addlocal_0
 call error1
 add  sp, 2

;-533   if (checkName() != 0) error1("Variable already defined");

.addlocal182:
 call checkName
 cmp ax, 0
 je  .addlocal183
 push addlocal_1
 call error1
 add  sp, 2

;-534   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal183:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-535   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-536   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-537 }


;-538 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   538 NULL i = bp-2
;  201 var unsg word   538 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-539   while (i < FTop) {

.checkFunction184:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction185

;-540     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

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
 je .checkFunction186
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction186:
 inc  word[bp-2]

;-541   return 0; }

 jmp .checkFunction184
.checkFunction185:
 mov ax, 0
 jmp .retncheckFunction

;-542 


;-543 int isvariable() {

 .retncheckFunction: LEAVE
 ret
ENDP

isvariable: PROC

;-544     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable187
 jmp .v1

;-545     if(token==T_UNSIGNED) goto v1;

.isvariable187:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable188
 jmp .v1

;-546     if(token==T_CHAR)     goto v1;

.isvariable188:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable189
 jmp .v1

;-547     if(token==T_INT)      goto v1;

.isvariable189:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable190
 jmp .v1

;-548     if(token==T_LONG)     goto v1;

.isvariable190:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable191
 jmp .v1

;-549     return 0;

.isvariable191:
 mov ax, 0
 jmp .retnisvariable

;-550 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-551 }


;-552 


;-553 int cmpneg(int ids) {

 .retnisvariable:
 ret
ENDP

cmpneg: PROC

;-554        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   553 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg192
 push cmpneg_0
 call prs
 add  sp, 2

;-555   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg193
.cmpneg192:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg194
 push cmpneg_1
 call prs
 add  sp, 2

;-556   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg195
.cmpneg194:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg196
 mov ax, [bp+4]
 or  al, al
 je .cmpneg197
 push cmpneg_2
 call prs
 add  sp, 2

;-557                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg198
.cmpneg197:
 push cmpneg_3
 call prs
 add  sp, 2

;-558   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg198:
 jmp .cmpneg199
.cmpneg196:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg200
 mov ax, [bp+4]
 or  al, al
 je .cmpneg201
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-559                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-560                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg202
.cmpneg201:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-561                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-562   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg202:
 jmp .cmpneg203
.cmpneg200:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg204
 push cmpneg_8
 call prs
 add  sp, 2

;-563   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg205
.cmpneg204:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg206
 push cmpneg_9
 call prs
 add  sp, 2

;-564   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg207
.cmpneg206:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg207:
.cmpneg205:
.cmpneg203:
.cmpneg199:
.cmpneg195:
.cmpneg193:

;-565 


;-566   int isrelational() {
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

isrelational: PROC

;-567     if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational208
 jmp .w
.isrelational208:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational209
 jmp .w

;-568     if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational209:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational210
 jmp .w
.isrelational210:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational211
 jmp .w

;-569     if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational211:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational212
 jmp .w
.isrelational212:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational213
 jmp .w

;-570     return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational213:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-571 


;-572 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC

;-573   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg214
 mov ax, 0
 jmp .retncheckreg

;-574   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg214:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 1
 jmp .retncheckreg
.checkreg215:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 3
 jmp .retncheckreg

;-575   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg216:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 5
 jmp .retncheckreg
.checkreg217:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 7
 jmp .retncheckreg

;-576   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg218:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 9
 jmp .retncheckreg
.checkreg219:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 11
 jmp .retncheckreg

;-577   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg220:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 13
 jmp .retncheckreg
.checkreg221:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 15
 jmp .retncheckreg

;-578   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg222:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 17
 jmp .retncheckreg
.checkreg223:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 19
 jmp .retncheckreg

;-579   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg224:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 21
 jmp .retncheckreg
.checkreg225:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 23
 jmp .retncheckreg

;-580   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg226:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 25
 jmp .retncheckreg
.checkreg227:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 27
 jmp .retncheckreg

;-581   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg228:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 29
 jmp .retncheckreg
.checkreg229:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 31
 jmp .retncheckreg

;-582   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg230:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 33
 jmp .retncheckreg
.checkreg231:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 35
 jmp .retncheckreg

;-583   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg232:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 37
 jmp .retncheckreg
.checkreg233:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 39
 jmp .retncheckreg

;-584   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg234:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg235
 mov ax, 41
 jmp .retncheckreg
.checkreg235:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg236
 mov ax, 43
 jmp .retncheckreg

;-585   // (eqstr(symbol,"ip")) return 45;


;-586   if (strlen(symbol) >   3) return 0;

.checkreg236:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg237
 mov ax, 0
 jmp .retncheckreg

;-587   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg237:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg238
 mov ax, 47
 jmp .retncheckreg
.checkreg238:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg239
 mov ax, 50
 jmp .retncheckreg

;-588   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg239:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg240
 mov ax, 53
 jmp .retncheckreg
.checkreg240:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg241
 mov ax, 56
 jmp .retncheckreg

;-589   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg241:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg242
 mov ax, 59
 jmp .retncheckreg
.checkreg242:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg243
 mov ax, 62
 jmp .retncheckreg

;-590   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg243:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg244
 mov ax, 65
 jmp .retncheckreg
.checkreg244:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg245
 mov ax, 68
 jmp .retncheckreg

;-591   if (eqstr(symbol,"cr0")) return 71;

.checkreg245:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg246
 mov ax, 71
 jmp .retncheckreg

;-592   return 0;   }

.checkreg246:
 mov ax, 0
 jmp .retncheckreg

;-593 


;-594 char printregstr[]

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

;-595 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-596 


;-597 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-598   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   597 NULL i = bp+4
;  201 var unsg word   597 NULL k = bp-2
;  202 var unsg byte   597 NULL c = bp-4;
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

;-599   k = &printregstr + i; c=*k; prc(c);

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

;-600   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg247
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

;-601 }

.printreg247:

;-602 


;-603 int constantexpr() { int mode; int id1;int ids;
 LEAVE
 ret
ENDP

constantexpr: PROC

;-604   token=getlex();   mode=typeName();

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   603 NULL mode = bp-2
;  201 var sign word   603 NULL id1 = bp-4
;  202 var sign word   603 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-605   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-606   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr248
 push constantexpr_0
 call error1
 add  sp, 2

;-607   expect(T_CONST);  prs(" ; constant expression");

.constantexpr248:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-608   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-609   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr249
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr250
.constantexpr249:
 push constantexpr_4
 call prs
 add  sp, 2

;-610   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr250:
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

;-611   expect(')');

 push 41
 call expect
 add  sp, 2

;-612 }


;-613 


;-614 char ops[5];
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
absolute 55920
ops resb 5
section .text

;-615 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-616   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   615 NULL iscmp1 = bp+4
;  201 var sign word   615 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1251
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-617   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1251:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1252
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-618   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1252:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1253
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-619   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1253:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1254
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-620   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1254:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1255
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-621   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1255:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1256
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-622   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1256:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1257
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-623   if (iscmp1 == 1) { token=getlex();

.doreg1257:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1258
 call getlex
 mov word [token], ax

;-624       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1259
 push doreg1_7
 call error1
 add  sp, 2

;-625       strcpy(ops, "cmp"); }

.doreg1259:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-626   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1258:
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

;-627 


;-628   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1260
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-629   mod2=typeName(); ireg2=checkreg();

.doreg1260:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-630   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1261
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-631   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1261:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1262
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1263
.doreg1262:
 push word [bp-2]
 call v
 add  sp, 2

;-632   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1263:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1264
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

;-633 }

.doreg1264:

;-634 


;-635 int compoundass(char *op, int mode, int id1) {
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

compoundass: PROC

;-636   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   635 NULL op = bp+4
;  201 var sign word   635 NULL mode = bp+6
;  202 var sign word   635 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass265
 push compoundass_0
 call error1
 add  sp, 2

;-637   prnl(); prs(op); prs("  ");

.compoundass265:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-638   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass266
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass267
.compoundass266:
 push compoundass_3
 call prs
 add  sp, 2

;-639   v(id1); prs(", ");

.compoundass267:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-640   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-641 }


;-642 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-643   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   642 NULL mode = bp+4
;  201 var sign word   642 NULL op = bp+6
;  202 var sign word   642 NULL ixarr = bp+8
;  203 var sign word   642 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-644   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1268
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

;-645     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1269
 push dovar1_1
 call prs
 add  sp, 2

;-646     if(widthi == 2) prs(" ax, [bx]");

.dovar1269:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1270
 push dovar1_2
 call prs
 add  sp, 2

;-647     return; }

.dovar1270:
 jmp .retndovar1

;-648   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1268:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1271
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

;-649   if (ixarr) {

.dovar1271:
 mov ax, [bp+8]
 or  al, al
 je .dovar1272

;-650     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-651     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1273
 push dovar1_5
 call prs
 add  sp, 2

;-652     prs("\n "); prs(op);

.dovar1273:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-653     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1274
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1275
.dovar1274:
 push dovar1_8
 call prs
 add  sp, 2

;-654 // v(id1); prs(" [bx]");


;-655     prc('['); printName(id1); prs(" + bx]");

.dovar1275:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-656     return; }

 jmp .retndovar1

;-657   prnl();prs(op);

.dovar1272:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-658   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1276
 push dovar1_10
 call prs
 add  sp, 2

;-659   if(wi==2) prs(" ax, ");

.dovar1276:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1277
 push dovar1_11
 call prs
 add  sp, 2

;-660   if(wi==4) prs(" eax, ");

.dovar1277:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1278
 push dovar1_12
 call prs
 add  sp, 2

;-661   v(id1);

.dovar1278:
 push word [bp+10]
 call v
 add  sp, 2

;-662 }


;-663 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-664   if (istoken(T_CONST)) { prnl(); prs(op);

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   663 NULL op = bp+4
;  201 var sign word   663 NULL mode = bp-2
;  202 var sign word   663 NULL opint = bp-4
;  203 var sign word   663 NULL ixarr = bp-6
;  204 var sign word   663 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm279
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-665     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm280
 push rterm_0
 call prs
 add  sp, 2

;-666     if (wi==2) prs(" ax, ");

.rterm280:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm281
 push rterm_1
 call prs
 add  sp, 2

;-667     if (wi==4) prs(" eax, ");

.rterm281:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm282
 push rterm_2
 call prs
 add  sp, 2

;-668     prunsign1(lexval); return;}

.rterm282:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-669   mode=typeName(); id1=searchname(); ixarr=0;

.rterm279:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-670   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm283
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-671     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-672     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm284
 push rterm_3
 call error1
 add  sp, 2
.rterm284:

;-673   if (eqstr(symbol,"_AX")) return;

.rterm283:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm285
 jmp .retnrterm

;-674   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm285:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-675 }


;-676 


;-677 int doreg(char *dr) { int i; expect('=');

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
ENDP

doreg: PROC
;Function : doreg, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   677 NULL dr = bp+4
;  201 var sign word   677 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-678   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-679        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg286
 push word [lexval]
 call prunsign1
 add  sp, 2

;-680   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg287
.doreg286:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg288
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-681   else error1("only number or var allowed");

 jmp .doreg289
.doreg288:
 push doreg_2
 call error1
 add  sp, 2

;-682 }

.doreg289:
.doreg287:

;-683 int isreg() {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

isreg: PROC

;-684   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg290
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-685   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg290:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg291
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-686   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg291:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg292
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-687   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg292:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg293
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-688   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg293:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg294
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-689   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg294:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg295
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-690   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg295:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg296
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-691   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg296:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg297
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-692   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg297:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg298
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-693   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg298:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg299
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-694   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg299:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg300
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-695   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg300:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg301
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-696   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg301:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg302
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-697   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg302:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg303
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-698   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg303:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg304
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-699   return 0;   r1: return 1;

.isreg304:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-700 }


;-701 


;-702 int doassign(int mode, int i, int ixarr, int ixconst) {

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

doassign: PROC

;-703   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   702 NULL mode = bp+4
;  201 var sign word   702 NULL i = bp+6
;  202 var sign word   702 NULL ixarr = bp+8
;  203 var sign word   702 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-704   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign305
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-705     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign306
 push doassign_1
 call prs
 add  sp, 2

;-706     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign307
.doassign306:
 push doassign_2
 call prs
 add  sp, 2
.doassign307:
 jmp .retndoassign

;-707   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign305:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign308
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

;-708   if (ixarr) {  prs("\n mov bx, ");

.doassign308:
 mov ax, [bp+8]
 or  al, al
 je .doassign309
 push doassign_5
 call prs
 add  sp, 2

;-709     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign310
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign311
.doassign310:
 push word [bp+8]
 call v
 add  sp, 2

;-710     if (wi==2) prs("\n shl bx, 1");

.doassign311:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign312
 push doassign_6
 call prs
 add  sp, 2

;-711     prs("\n mov ["); printName(i);

.doassign312:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-712     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign313
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign314
.doassign313:
 push doassign_9
 call prs
 add  sp, 2
.doassign314:
 jmp .retndoassign

;-713   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign309:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign315
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign316
 push doassign_11
 call prs
 add  sp, 2

;-714     } v(i); prs(", al"); return; }

.doassign316:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-715   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign315:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign317
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign318
 push doassign_14
 call prs
 add  sp, 2

;-716     } v(i); prs(", ax"); return; }

.doassign318:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-717   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign317:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign319
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign320
 push doassign_17
 call prs
 add  sp, 2

;-718     } v(i); prs(", eax"); return; }

.doassign320:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-719 }

.doassign319:

;-720 int domul(int ids) {

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

;-721   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   720 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul321
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul322
.domul321:

;-722   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul323

;-723     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-724     }


;-725   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul324
.domul323:
 push domul_3
 call error1
 add  sp, 2
.domul324:
.domul322:

;-726 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-727   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   726 NULL ids = bp+4
;  201 var sign word   726 NULL mode = bp-2
;  202 var sign word   726 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv325

;-728     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-729     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv326
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv327
.doidiv326:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv327:

;-730   else {

 jmp .doidiv328
.doidiv325:

;-731     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-732     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv329
 push doidiv_3
 call error1
 add  sp, 2

;-733     gettypes(id1);

.doidiv329:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-734     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv330
 push doidiv_4
 call error1
 add  sp, 2

;-735     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv330:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv331
 push doidiv_5
 call error1
 add  sp, 2

;-736     prs("\n mov bx, "); v(id1);

.doidiv331:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-737     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv332
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv333
.doidiv332:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv333:

;-738 }

.doidiv328:

;-739 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
;  200 var sign word   739 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-740 


;-741 


;-742 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 55925
docalltype resw 10
section .text
section .bss
absolute 55945
docallvalue resw 10
section .text

;-743 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 55965
procname resb 17
section .text

;-744 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-745   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   744 NULL i = bp-2
;  201 var sign word   744 NULL narg = bp-4
;  202 var sign word   744 NULL t0 = bp-6
;  203 var sign word   744 NULL n0 = bp-8
;  204 var sign word   744 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-746   checknamelen();

 call checknamelen

;-747   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-748   storeCall1();

 call storeCall1

;-749   expect('(');

 push 40
 call expect
 add  sp, 2

;-750 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1334

;-751 	  do { narg++;

.docall1335:
 inc  word[bp-4]

;-752 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1336
 push docall1_0
 call error1
 add  sp, 2
.docall1336:
 mov ax, 0
 mov [bp-6], ax

;-753       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1337
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-754       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1337:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1338
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-755         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-756         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-757       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1338:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1339
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-758       if(istoken(T_NAME))  { n0=checkreg();

.docall1339:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1340
 call checkreg
 mov [bp-8], ax

;-759         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1341
 mov ax, 5
 mov [bp-6], ax

;-760         else {t0=4; n0=searchname();

 jmp .docall1342
.docall1341:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-761           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1343
 mov ax, 3
 mov [bp-6], ax
.docall1343:
.docall1342:

;-762       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1340:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1344
 push docall1_4
 call error1
 add  sp, 2

;-763       docalltype [narg] = t0;

.docall1344:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-764       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-765     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1345
 jmp .docall1335
.docall1345:

;-766 


;-767   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-768     do {

.docall1346:

;-769       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-770       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-771       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1347
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-772       if(t0==2){ prs("\n push ");

.docall1347:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1348
 push docall1_6
 call prs
 add  sp, 2

;-773         prs(fname);prc(95);prunsign1(n0);}

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

;-774       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1348:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1349
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-775         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-776       if(t0==4){ gettypes(n0);

.docall1349:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1350
 push word [bp-8]
 call gettypes
 add  sp, 2

;-777         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1351
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-778         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1352
.docall1351:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-779         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1352:

;-780       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1350:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1353
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1354
 mov ax, [bp-10]
 add ax, 2
.docall1354:

;-781    i--; } while (i > 0);  }

.docall1353:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1355
 jmp .docall1346
.docall1355:

;-782 	 prs("\n call "); prs(&procname);

.docall1334:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-783 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1356
 push docall1_14
 call prs
 add  sp, 2

;-784      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2

;-785  }

.docall1356:

;-786 


;-787  int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
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
evalue dw 0
exprtype dw 10

;-788  int expr(int isRight)


expr: PROC

;-789  { int mode; int id1;     int ixarr; int ixconst;


;-790    int ids;  int isCONST; int i;     unsigned char *p;


;-791    if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   788 NULL isRight = bp+4
;  201 var sign word   789 NULL mode = bp-2
;  202 var sign word   789 NULL id1 = bp-4
;  203 var sign word   789 NULL ixarr = bp-6
;  204 var sign word   789 NULL ixconst = bp-8
;  205 var sign word   790 NULL ids = bp-10
;  206 var sign word   790 NULL isCONST = bp-12
;  207 var sign word   790 NULL i = bp-14
;  208 ptr unsg byte   790 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
 mov ax, [lexval]
 mov word [evalue], ax

;-792      prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-793    mode=typeName(); /*0=V,1=*,2=&*/

.expr357:
 call typeName
 mov [bp-2], ax

;-794    ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-795    if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr358
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-796    if (token=='(')  {docall1(); goto e1; }

.expr358:
 mov ax, [token]
 cmp ax, 40
 jne .expr359
 call docall1
 jmp .e1

;-797    if (isreg()) goto e1;

.expr359:
 call isreg
 or  al, al
 je .expr360
 jmp .e1

;-798 


;-799    id1=searchname(); gettypes(id1); ids=signi;

.expr360:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-800    ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-801      if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr361
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr362

;-802        ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-803      else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr363
.expr362:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-804      gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-805      if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr364
 push expr_1
 call error1
 add  sp, 2
.expr364:
.expr363:

;-806    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

.expr361:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr365
 mov ax, [bp-2]
 or  al, al
 je .expr366
 push expr_2
 call error1
 add  sp, 2

;-807       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr366:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr367
 push expr_4
 call prs
 add  sp, 2
 jmp .expr368
.expr367:
 push expr_5
 call prs
 add  sp, 2

;-808       v(id1); goto e1;}

.expr368:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-809    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

.expr365:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr369
 mov ax, [bp-2]
 or  al, al
 je .expr370
 push expr_6
 call error1
 add  sp, 2

;-810       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr370:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr371
 push expr_8
 call prs
 add  sp, 2
 jmp .expr372
.expr371:
 push expr_9
 call prs
 add  sp, 2

;-811       v(id1); goto e1;}

.expr372:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-812 


;-813    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr369:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr373
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-814    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr373:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr374
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-815    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr374:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr375
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-816    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr375:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr376
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-817    if (istoken(T_MULASS    )) {error1("not implemented");}

.expr376:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr377
 push expr_14
 call error1
 add  sp, 2

;-818    if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr377:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr378
 push expr_15
 call error1
 add  sp, 2

;-819 


;-820    if (istoken('=')) { exprtype= expr(1);

.expr378:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr379
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-821    doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-822    dovar1(mode, "mov", ixarr, id1);

.expr379:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-823 


;-824  e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr380
 push expr_17
 call rterm
 add  sp, 2

;-825    else if (istoken('-')) rterm("sub" );

 jmp .expr381
.expr380:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr382
 push expr_18
 call rterm
 add  sp, 2

;-826    else if (istoken('&')) rterm("and" );

 jmp .expr383
.expr382:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr384
 push expr_19
 call rterm
 add  sp, 2

;-827    else if (istoken('|')) rterm("or" );

 jmp .expr385
.expr384:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr386
 push expr_20
 call rterm
 add  sp, 2

;-828    else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr387
.expr386:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr388
 push expr_21
 call rterm
 add  sp, 2

;-829    else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr389
.expr388:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr390
 push expr_22
 call rterm
 add  sp, 2

;-830    else if (istoken('*')) domul (ids);

 jmp .expr391
.expr390:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr392
 push word [bp-10]
 call domul
 add  sp, 2

;-831    else if (istoken('/')) doidiv(ids);

 jmp .expr393
.expr392:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr394
 push word [bp-10]
 call doidiv
 add  sp, 2

;-832    else if (istoken('%')) domod (ids);

 jmp .expr395
.expr394:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr396
 push word [bp-10]
 call domod
 add  sp, 2

;-833    if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr396:
.expr395:
.expr393:
.expr391:
.expr389:
.expr387:
.expr385:
.expr383:
.expr381:
 call isrelational
 or  al, al
 je .expr397
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-834    return 0;

.expr397:
 mov ax, 0
 jmp .retnexpr

;-835  }


;-836 


;-837  int pexpr() {expect('('); iscmp=0;

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

pexpr: PROC
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-838    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr398
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr399
 call constantexpr
 jmp .retnpexpr

;-839      ireg1=checkreg();

.pexpr399:
 call checkreg
 mov word [ireg1], ax

;-840      if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr400
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr400:

;-841    expr(0);

.pexpr398:
 push 0
 call expr
 add  sp, 2

;-842    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr401
 push pexpr_1
 call prs
 add  sp, 2
.pexpr401:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-843    expect(')');

 push 41
 call expect
 add  sp, 2

;-844  }


;-845 


;-846 /***************************************************************/


;-847 


;-848 int doemit() {prs("\n db ");

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

doemit: PROC
 push doemit_0
 call prs
 add  sp, 2

;-849   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-850     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit402
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit402:
 push 41
 call expect
 add  sp, 2

;-851 


;-852 


;-853 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }

 ret
doemit_0 db "\n db ",0
ENDP

prlabel: PROC
;Function : prlabel, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   853 NULL n = bp+4;
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

;-854 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   854 NULL n = bp+4;
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

;-855 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

doif: PROC
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   855 NULL jdest = bp-2
;  201 var sign word   855 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-856   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-857   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif403
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-858     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-859   else prlabel(jdest); }

 jmp .doif404
.doif403:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif404:

;-860 


;-861 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
ENDP

dodo: PROC

;-862   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   861 NULL jdest = bp-2
;  201 var sign word   861 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-863   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-864   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-865 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
ENDP

dowhile: PROC
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   865 NULL jdest = bp-2
;  201 var sign word   865 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-866   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-867   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-868 


;-869 int stmt() { int c; char cha;
 LEAVE
 ret
ENDP

stmt: PROC

;-870        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   869 NULL c = bp-2
;  201 var sign byte   869 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt405
.stmt406:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt407
 call stmt
 jmp .stmt406
.stmt407:

;-871   else if(istoken(T_IF))    doif();

 jmp .stmt408
.stmt405:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt409
 call doif

;-872   else if(istoken(T_DO))    dodo();

 jmp .stmt410
.stmt409:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt411
 call dodo

;-873   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt412
.stmt411:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt413
 call dowhile

;-874   else if(istoken(T_GOTO))  {

 jmp .stmt414
.stmt413:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt415

;-875     prs("\n jmp .");name1();prs(symbol);expect(';');}

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

;-876   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt416
.stmt415:
 mov ax, [token]
 cmp ax, 518
 jne .stmt417
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-877         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt418:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt419
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt418
.stmt419:
 call getlex
 mov word [token], ax

;-878   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();

 jmp .stmt420
.stmt417:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt421
 mov ax, [token]
 cmp ax, 123
 jne .stmt422
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-879         while(cha!= '}') { prc(cha); cha=next(); }

.stmt423:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt424
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-880         token=getlex(); }

 jmp .stmt423
.stmt424:
 call getlex
 mov word [token], ax

;-881         else error1("Curly open expected");

 jmp .stmt425
.stmt422:
 push stmt_3
 call error1
 add  sp, 2

;-882         }

.stmt425:

;-883   else if(istoken(T_EMIT))   doemit();

 jmp .stmt426
.stmt421:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt427
 call doemit

;-884   else if(istoken(';'))      { }

 jmp .stmt428
.stmt427:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt429

;-885   else if(istoken(T_RETURN)) {

 jmp .stmt430
.stmt429:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt431

;-886         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt432
 push 0
 call expr
 add  sp, 2

;-887         prs("\n jmp .retn");

.stmt432:
 push stmt_4
 call prs
 add  sp, 2

;-888         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-889         nreturn++;

 inc  word[nreturn]

;-890         expect(';');

 push 59
 call expect
 add  sp, 2

;-891         }


;-892   else if(thechar==':')      {

 jmp .stmt433
.stmt431:
 mov al, [thechar]
 cmp al, 58
 jne .stmt434

;-893         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-894         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-895         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-896         expect(':');

 push 58
 call expect
 add  sp, 2

;-897         }


;-898   else  {expr(0);; expect(';'); }

 jmp .stmt435
.stmt434:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-899 }

.stmt435:
.stmt433:
.stmt430:
.stmt428:
.stmt426:
.stmt420:
.stmt416:
.stmt414:
.stmt412:
.stmt410:
.stmt408:

;-900 


;-901 


;-902 int dofunc() { int nloc; int i; int narg;
 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n jmp .retn",0
stmt_5 db "\n.",0
ENDP

dofunc: PROC

;-903   cloc=&co;

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   902 NULL nloc = bp-2
;  201 var sign word   902 NULL i = bp-4
;  202 var sign word   902 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-904   checknamelen();

 call checknamelen

;-905   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-906   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc436
 push dofunc_0
 call error1
 add  sp, 2

;-907   storefunc();

.dofunc436:
 call storefunc

;-908   prs("\n\n"); prs(symbol); prs(": PROC");

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

;-909   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-910   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc437
 mov ax, 2
 mov [bp-6], ax

;-911     do { typeName();  addlocal(); narg+=2;

.dofunc438:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-912          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc439
 add  word[bp-6], 2
.dofunc439:
 inc  word[LTop]

;-913     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc440
 jmp .dofunc438
.dofunc440:
 push 41
 call expect
 add  sp, 2

;-914 


;-915   expect('{'); /*body*/

.dofunc437:
 push 123
 call expect
 add  sp, 2

;-916   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-917   while(isvariable()) {

.dofunc441:
 call isvariable
 or  al, al
 je .dofunc442

;-918     do {typeName();

.dofunc443:
 call typeName

;-919         checknamelen();

 call checknamelen

;-920         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-921         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc444
 sub  word[bp-2], 2

;-922         GData[LTop]=nloc;

.dofunc444:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-923         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc445

;-924             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

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

;-925             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-926             }


;-927         LTop++;

.dofunc445:
 inc  word[LTop]

;-928       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc446
 jmp .dofunc443
.dofunc446:
 push 59
 call expect
 add  sp, 2

;-929   if (LTop>LSTART){prs(";\n ENTER  ");

 jmp .dofunc441
.dofunc442:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc447
 push dofunc_3
 call prs
 add  sp, 2

;-930     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

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

;-931   while(istoken('}')==0)   stmt();

.dofunc447:
.dofunc448:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc449
 call stmt

;-932   if (nreturn) {

 jmp .dofunc448
.dofunc449:
 mov ax, [nreturn]
 or  al, al
 je .dofunc450

;-933         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-934         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-935         prc(':');

 push 58
 call prc
 add  sp, 2

;-936         }


;-937   if (LTop > LSTART) prs(" LEAVE");

.dofunc450:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc451
 push dofunc_6
 call prs
 add  sp, 2

;-938   prs("\n ret");

.dofunc451:
 push dofunc_7
 call prs
 add  sp, 2

;-939   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-940   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-941   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc452
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-942   prs("\nENDP");

.dofunc452:
 push dofunc_8
 call prs
 add  sp, 2

;-943 }


;-944 


;-945 char doglobName[IDLENMAX];
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
section .bss
absolute 55982
doglobName resb 15
section .text

;-946 int doglob() {


doglob: PROC

;-947     int i; int j; int isstrarr; isstrarr=0;

;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   947 NULL i = bp-2
;  201 var sign word   947 NULL j = bp-4
;  202 var sign word   947 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-948   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob453
 push doglob_0
 call error1
 add  sp, 2

;-949   if (iswidth == 0) error1("no VOID as var type");

.doglob453:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob454
 push doglob_1
 call error1
 add  sp, 2

;-950   checknamelen();

.doglob454:
 call checknamelen

;-951   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob455
 push doglob_2
 call error1
 add  sp, 2

;-952   if (istoken('[')) { istype='&';

.doglob455:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob456
 mov ax, 38
 mov byte [istype], al

;-953     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob457

;-954       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-955       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-956       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-957       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob458
 push doglob_5
 call prs
 add  sp, 2

;-958       if (iswidth==2) prs(" resw ");

.doglob458:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob459
 push doglob_6
 call prs
 add  sp, 2

;-959       if (iswidth==4) prs(" resd ");

.doglob459:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob460
 push doglob_7
 call prs
 add  sp, 2

;-960       prunsign1(lexval);

.doglob460:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-961       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-962       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-963       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob461
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-964       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob461:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob462
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-965       GData[GTop]=lexval; expect(']');

.doglob462:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-966     }else { expect(']');

 jmp .doglob463
.doglob457:
 push 93
 call expect
 add  sp, 2

;-967       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob464
 push doglob_9
 call error1
 add  sp, 2

;-968       prs("\n"); prs(symbol); prs(" db ");

.doglob464:
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

;-969       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-970       expect('=');

 push 61
 call expect
 add  sp, 2

;-971       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob465

;-972         prc(34); prscomment(symbol); prc(34); prs(",0");

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

;-973         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-974       else if (istoken('{' )) { i=0;

 jmp .doglob466
.doglob465:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob467
 mov ax, 0
 mov [bp-2], ax

;-975         do { if(i) prc(',');

.doglob468:
 mov ax, [bp-2]
 or  al, al
 je .doglob469
 push 44
 call prc
 add  sp, 2

;-976           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob469:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-977         while (istoken(',')); expect('}'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob470
 jmp .doglob468
.doglob470:
 push 125
 call expect
 add  sp, 2

;-978       else error1("String or number array expected");

 jmp .doglob471
.doglob467:
 push doglob_13
 call error1
 add  sp, 2

;-979       };

.doglob471:
.doglob466:
.doglob463:

;-980   }else { //expect('=');

 jmp .doglob472
.doglob456:

;-981     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob473
 push doglob_15
 call prs
 add  sp, 2

;-982     else {

 jmp .doglob474
.doglob473:

;-983       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob475
 push doglob_16
 call prs
 add  sp, 2

;-984       else if (iswidth==2) prs(" dw ");

 jmp .doglob476
.doglob475:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob477
 push doglob_17
 call prs
 add  sp, 2

;-985       else                 prs(" dd ");

 jmp .doglob478
.doglob477:
 push doglob_18
 call prs
 add  sp, 2

;-986     }

.doglob478:
.doglob476:

;-987     if(istoken('-')) prc('-');

.doglob474:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob479
 push 45
 call prc
 add  sp, 2

;-988     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob479:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob480
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-989     else prunsign1(0); }

 jmp .doglob481
.doglob480:
 push 0
 call prunsign1
 add  sp, 2
.doglob481:

;-990   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob472:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-991   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-992   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-993   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob482
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob483
.doglob482:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-994   GTop++; expect(';'); }

.doglob483:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-995 


;-996 unsigned int MAXUI=65535;
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
MAXUI dw 65535

;-997 int epilog() {


epilog: PROC

;-998     unsigned int i;


;-999     prs("\n;Input: "); prs(&namein);

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   998 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1000     prs(", List: ");   prs(&namelst);

 push epilog_1
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1001     prs(",  Lines:"); printint51(lineno);

 push epilog_2
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-1002     prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_3
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-1003     prs(" max.:"); printint51(LSTART);

 push epilog_4
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-1004     prs("\n;Functions      :"); printint51(FTop);

 push epilog_5
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-1005     prs(" max.:"); printint51(FUNCMAX);

 push epilog_6
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-1006     prs("\n;Calls          :"); printint51(CTop);

 push epilog_7
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-1007     prs(" max.:"); printint51(CALLMAX);

 push epilog_8
 call prs
 add  sp, 2
 push 1500
 call printint51
 add  sp, 2

;-1008     i = CNamePtr - &CNameField;

 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-1009     prs("\n;NameField      :"); printint51(i);

 push epilog_9
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-1010     prs(" max.:"); printint51(CNAMEMAX);

 push epilog_10
 call prs
 add  sp, 2
 push 10000
 call printint51
 add  sp, 2

;-1011     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);

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

;-1012     prs(" max.:"); printint51(COMAX);

 push epilog_13
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-1013     i=COMAX; i=i-maxco;

 mov ax, 2000
 mov [bp-2], ax
 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax

;-1014     if (i <= 1000)prs(" *** Warning *** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog484
 push epilog_14
 call prs
 add  sp, 2

;-1015     prs(", stacksize: ");

.epilog484:
 push epilog_15
 call prs
 add  sp, 2

;-1016     i=MAXUI-orgData; printint51(i);

 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1017     if (i <= 1000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog485
 push epilog_16
 call prs
 add  sp, 2

;-1018   end1(0);}

.epilog485:
 push 0
 call end1
 add  sp, 2

;-1019 


;-1020 int dodefine() {
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

;-1021     int i; int j; int fdtemp;


;-1022     if (eqstr(symbol, "ORGDATA")) {

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1021 NULL i = bp-2
;  201 var sign word  1021 NULL j = bp-4
;  202 var sign word  1021 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine486

;-1023         token=getlex();

 call getlex
 mov word [token], ax

;-1024         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1025         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1026         return;

 jmp .retndodefine

;-1027     }


;-1028     expect(T_NAME);

.dodefine486:
 push 256
 call expect
 add  sp, 2

;-1029     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine487

;-1030         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine488
 push dodefine_1
 call error1
 add  sp, 2

;-1031         i=strlen(symbol);

.dodefine488:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1032         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine489
 push dodefine_2
 call error1
 add  sp, 2

;-1033         GSign [GTop]='U';

.dodefine489:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1034         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1035         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1036         GAdr [GTop]=lineno-1;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax

;-1037         GUsed [GTop]=0;

 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1038         pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-1039         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1040         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1041         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1042         GTop++;

 inc  word[GTop]

;-1043     }


;-1044 }

.dodefine487:

;-1045 


;-1046 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1047     CNamePtr = &CNameField;

 mov ax, CNameField
 mov word [CNamePtr], ax

;-1048     token=getlex();

 call getlex
 mov word [token], ax

;-1049     do {

.parse490:

;-1050         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse491
 mov ax, 1
 jmp .retnparse

;-1051         if (istoken('#')) {

.parse491:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse492

;-1052              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse493
 call dodefine

;-1053              else error1("define expected");

 jmp .parse494
.parse493:
 push parse_0
 call error1
 add  sp, 2

;-1054         }

.parse494:

;-1055     else{

 jmp .parse495
.parse492:

;-1056         typeName();

 call typeName

;-1057         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse496
 call dofunc

;-1058         else doglob(); }

 jmp .parse497
.parse496:
 call doglob
.parse497:

;-1059     } while(1);

.parse495:
 mov ax, 1
 or  al, al
 je .parse498
 jmp .parse490
.parse498:

;-1060 }


;-1061 


;-1062 int getfirstchar() {

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP

getfirstchar: PROC

;-1063     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1064     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1065     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1066     }


;-1067 


;-1068 char *arglen=0x80; char *argv=0x82;

 ret
ENDP
arglen dw 128
argv dw 130

;-1069 int getarg() {


getarg: PROC

;-1070     int arglen1; int i; char *c;


;-1071     arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1070 NULL arglen1 = bp-2
;  201 var sign word  1070 NULL i = bp-4
;  202 ptr sign byte  1070 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1072     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarg499

;-1073         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1074         cputs(" Usage: A.COM in_file[.C]: ");

 push getarg_0
 call cputs
 add  sp, 2

;-1075         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1076         }


;-1077     i=arglen1+129;

.getarg499:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1078     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1079     arglen1--;

 dec  word[bp-2]

;-1080     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1081     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1082     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

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

;-1083     strcpy(namelst, namein);

.getarg500:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1084     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1085     i--;

 dec  word[bp-4]

;-1086     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1087     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1088 


;-1089     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1090     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg501

;-1091         cputs("Source file missing (.C): ");

 push getarg_2
 call cputs
 add  sp, 2

;-1092         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1093         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1094         }


;-1095     fdout=creatR(namelst);

.getarg501:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1096     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg502

;-1097         cputs("list file not creatable: ");

 push getarg_3
 call cputs
 add  sp, 2

;-1098         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1099         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1100         }


;-1101     prs("\n; ");

.getarg502:
 push getarg_4
 call prs
 add  sp, 2

;-1102     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1103     prs(", Source: "); prs(namein);

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1104     prs(", Output asm: "); prs(namelst);

 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1105     prs("\norg  256 \njmp main");

 push getarg_7
 call prs
 add  sp, 2

;-1106 }


;-1107 


;-1108 int main() {
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

;-1109     getarg();

 call getarg

;-1110     CNameTop=0;

 mov ax, 0
 mov word [CNameTop], ax

;-1111     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1112     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1113     getfirstchar();

 call getfirstchar

;-1114     parse();

 call parse

;-1115   epilog();

 call epilog

;-1116 }

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
;   45 arr sign byte    46   95 symbol[128]
;   46 arr sign byte    47   11 fname[67]
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
;   71 arr sign byte    69    7 GType[300]
;   72 arr sign byte    70    4 GSign[300]
;   73 arr sign byte    71    4 GWidth[300]
;   74 arr sign word    72    3 GAdr[300]
;   75 arr sign word    73    5 GUsed[300]
;   76 arr sign word    74    8 GData[300]
;   77 arr sign byte    75    2 GNameField[4800]
;   78 var sign word    76   23 GTop
;   79 var sign word    77   17 LTop
;   80 def unsg byte    78    - FUNCMAX=300
;   81 def unsg byte    79    - FNAMEMAX=4800
;   82 arr sign byte    80    1 FType[300]
;   83 arr sign word    81    1 FAdr[300]
;   84 arr sign word    82    1 FCalls[300]
;   85 arr sign byte    83    2 FNameField[4800]
;   86 var sign word    84    8 FTop
;   87 def unsg byte    85    - CALLMAX=1500
;   88 arr sign byte    86    1 CType[1500]
;   89 arr sign word    87    1 CAdr[1500]
;   90 def unsg byte    88    - CNAMEMAX=10000
;   91 arr sign byte    89    3 CNameField[10016]
;   92 ptr sign byte    90    7 CNamePtr
;   93 ptr unsg byte    91    1 CNameTop
;   94 var sign word    92    5 CTop
;   95 arr sign byte    94    5 fgetsdest[128]
;   96 ptr unsg byte    95   10 fgetsp
;   97 var unsg word    96 NULL segE
;   98 var unsg word    97    9 lineno
;   99 ptr unsg byte    98    9 pt
;  100 ptr unsg byte    99    4 p1
;  101 var sign word   100    3 DOS_ERR
;  102 var sign word   101    3 DOS_NoBytes
;  103 var sign byte   102    3 DOS_ByteRead
;  104 var sign word   103    5 ireg1
;  105 var sign word   104    2 mod2
;  106 var sign word   105    3 ireg2
;  107 arr sign byte   377    2 symboltemp[80]
;  108 arr sign byte   595    3 printregstr[74]
;  109 arr sign byte   614    9 ops[5]
;  110 arr sign word   742    2 docalltype[10]
;  111 arr sign word   742    2 docallvalue[10]
;  112 arr sign byte   743    2 procname[17]
;  113 var sign word   787    1 evalue
;  114 var sign word   787    1 exprtype
;  115 arr sign byte   945    2 doglobName[15]
;  116 var unsg word   996    1 MAXUI
;  117 ptr sign byte  1068    1 arglen
;  118 ptr sign byte  1068    2 argv


;   # Calls Line Width  Name   list of functions

;    0    4  107   writetty
;    1    1  108   putch
;    2    6  109   cputs
;    3    3  110   mkneg
;    4    6  112   DosInt
;    5    1  117   openR
;    6    1  118   creatR
;    7    2  119   fcloseR
;    8    4  120   exitR
;    9    1  121   readRL
;   10    1  123   fputcR
;   11    1  126   letter
;   12    3  136   digit
;   13    3  141   alnum
;   14    7  147   strlen
;   15   23  152   strcpy
;   16   69  158   eqstr
;   17    1  166   strcat1
;   18    1  170   toupper
;   19    2  176   instr1
;   20    6  185   eprc
;   21    5  189   eprs
;   22   29  197   prc
;   23    3  206   prscomment
;   24  179  214   prs
;   25    7  233   prnl
;   26    2  238   eprnum
;   27    6  252   pint1
;   28   29  263   prunsign1
;   29   12  273   printint51
;   30    2  281   end1
;   31   38  287   error1
;   32    1  304   ifEOL
;   33    1  312   printinputline
;   34    2  334   fgets1
;   35   32  348   next
;   36    1  356   getdigit
;   37    1  365   getstring
;   38   13  378   getlex
;   39   75  430   istoken
;   40   36  437   expect
;   41    4  447   adrF
;   42    6  450   adrofname
;   43    4  452   printName
;   44    3  457   a
;   45   18  459   v
;   46    4  464   checknamelen
;   47    1  469   convertdefine
;   48    3  477   checkName
;   49   10  482   searchname
;   50    3  486   name1
;   51    8  490   typeName
;   52   10  506   gettypes
;   53    1  516   storeCall1
;   54    1  528   storefunc
;   55    2  532   addlocal
;   56    1  538   checkFunction
;   57    1  543   isvariable
;   58    3  553   cmpneg
;   59    3  566   isrelational
;   60    4  572   checkreg
;   61    3  597   printreg
;   62    1  603   constantexpr
;   63    2  615   doreg1
;   64    4  635   compoundass
;   65    2  642   dovar1
;   66    8  663   rterm
;   67   15  677   doreg
;   68    1  683   isreg
;   69    1  702   doassign
;   70    1  720   domul
;   71    2  726   doidiv
;   72    1  739   domod
;   73    1  744   docall1
;   74    4  788   expr
;   75    3  837   pexpr
;   76    1  848   doemit
;   77    7  853   prlabel
;   78    3  854   prjump
;   79    1  855   doif
;   80    1  861   dodo
;   81    1  865   dowhile
;   82    6  869   stmt
;   83    1  902   dofunc
;   84    1  946   doglob
;   85    1  997   epilog
;   86    1 1020   dodefine
;   87    1 1046   parse
;   88    1 1062   getfirstchar
;   89    1 1069   getarg
;   90 NULL 1108   main

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
;   12    86 eprc
;   13    91 writetty
;   14   100 writetty
;   15   109 fputcR
;   16   116 prc
;   17   120 prc
;   18   124 prs
;   19   128 eprc
;   20   133 mkneg
;   21   139 eprnum
;   22   146 eprc
;   23   151 prc
;   24   155 mkneg
;   25   161 pint1
;   26   167 prc
;   27   171 prunsign1
;   28   181 prc
;   29   185 prc
;   30   189 prc
;   31   193 prc
;   32   197 prc
;   33   201 prunsign1
;   34   211 fcloseR
;   35   219 fcloseR
;   36   227 exitR
;   37   233 prnl
;   38   238 prscomment
;   39   249 prs
;   40   253 prunsign1
;   41   263 prs
;   42   267 prs
;   43   271 prs
;   44   275 prunsign1
;   45   285 prs
;   46   289 prunsign1
;   47   299 prs
;   48   303 prs
;   49   307 end1
;   50   312 next
;   51   317 readRL
;   52   324 error1
;   53   331 prs
;   54   335 prunsign1
;   55   345 prc
;   56   349 prscomment
;   57   360 printinputline
;   58   375 fgets1
;   59   382 next
;   60   387 alnum
;   61   393 next
;   62   398 digit
;   63   404 next
;   64   409 next
;   65   414 next
;   66   419 next
;   67   424 next
;   68   429 next
;   69   434 next
;   70   439 next
;   71   444 next
;   72   449 next
;   73   454 next
;   74   459 next
;   75   464 next
;   76   469 next
;   77   474 next
;   78   479 next
;   79   484 next
;   80   489 next
;   81   494 instr1
;   82   501 next
;   83   506 ifEOL
;   84   512 getlex
;   85   519 next
;   86   524 next
;   87   529 getlex
;   88   536 getstring
;   89   546 digit
;   90   552 getdigit
;   91   561 next
;   92   566 next
;   93   571 next
;   94   576 alnum
;   95   582 strcpy
;   96   589 alnum
;   97   595 next
;   98   600 eqstr
;   99   606 eqstr
;  100   612 eqstr
;  101   618 eqstr
;  102   624 eqstr
;  103   630 eqstr
;  104   636 eqstr
;  105   642 eqstr
;  106   648 eqstr
;  107   654 eqstr
;  108   660 eqstr
;  109   666 eqstr
;  110   672 eqstr
;  111   678 eqstr
;  112   684 eqstr
;  113   690 eqstr
;  114   696 convertdefine
;  115   710 strcpy
;  116   717 error1
;  117   724 getlex
;  118   731 istoken
;  119   739 prs
;  120   743 prs
;  121   747 pint1
;  122   753 error1
;  123   760 adrF
;  124   765 adrofname
;  125   775 prs
;  126   779 prs
;  127   783 prc
;  128   787 pint1
;  129   793 prc
;  130   797 printName
;  131   807 prc
;  132   811 printName
;  133   821 prc
;  134   825 strlen
;  135   832 error1
;  136   839 adrofname
;  137   849 eqstr
;  138   855 adrofname
;  139   865 eqstr
;  140   871 adrofname
;  141   881 eqstr
;  142   887 checkName
;  143   897 error1
;  144   904 error1
;  145   911 getlex
;  146   918 istoken
;  147   926 istoken
;  148   934 istoken
;  149   942 istoken
;  150   950 istoken
;  151   958 istoken
;  152   966 istoken
;  153   974 istoken
;  154   982 name1
;  155   988 error1
;  156   995 error1
;  157  1002 strcpy
;  158  1009 error1
;  159  1016 adrF
;  160  1021 strcpy
;  161  1028 error1
;  162  1035 checkName
;  163  1045 error1
;  164  1052 adrF
;  165  1057 strcpy
;  166  1064 adrF
;  167  1069 eqstr
;  168  1075 prs
;  169  1079 prs
;  170  1083 prs
;  171  1087 prs
;  172  1091 prs
;  173  1095 prunsign1
;  174  1105 prs
;  175  1109 prs
;  176  1113 prunsign1
;  177  1123 prs
;  178  1127 prs
;  179  1131 prs
;  180  1135 error1
;  181  1142 getlex
;  182  1149 strlen
;  183  1156 eqstr
;  184  1162 eqstr
;  185  1168 eqstr
;  186  1174 eqstr
;  187  1180 eqstr
;  188  1186 eqstr
;  189  1192 eqstr
;  190  1198 eqstr
;  191  1204 eqstr
;  192  1210 eqstr
;  193  1216 eqstr
;  194  1222 eqstr
;  195  1228 eqstr
;  196  1234 eqstr
;  197  1240 eqstr
;  198  1246 eqstr
;  199  1252 eqstr
;  200  1258 eqstr
;  201  1264 eqstr
;  202  1270 eqstr
;  203  1276 eqstr
;  204  1282 eqstr
;  205  1288 strlen
;  206  1295 eqstr
;  207  1301 eqstr
;  208  1307 eqstr
;  209  1313 eqstr
;  210  1319 eqstr
;  211  1325 eqstr
;  212  1331 eqstr
;  213  1337 eqstr
;  214  1343 eqstr
;  215  1349 prc
;  216  1353 prc
;  217  1357 prc
;  218  1361 getlex
;  219  1368 typeName
;  220  1377 searchname
;  221  1388 gettypes
;  222  1397 isrelational
;  223  1410 error1
;  224  1417 expect
;  225  1424 prs
;  226  1428 prs
;  227  1432 gettypes
;  228  1441 prs
;  229  1445 prs
;  230  1449 v
;  231  1451 prs
;  232  1455 prunsign1
;  233  1465 cmpneg
;  234  1472 prs
;  235  1476 expect
;  236  1483 istoken
;  237  1491 strcpy
;  238  1498 istoken
;  239  1506 strcpy
;  240  1513 istoken
;  241  1521 strcpy
;  242  1528 istoken
;  243  1536 strcpy
;  244  1543 istoken
;  245  1551 strcpy
;  246  1558 istoken
;  247  1566 strcpy
;  248  1573 istoken
;  249  1581 strcpy
;  250  1588 getlex
;  251  1595 isrelational
;  252  1608 error1
;  253  1615 strcpy
;  254  1622 prnl
;  255  1627 prs
;  256  1631 prs
;  257  1635 printreg
;  258  1644 prs
;  259  1648 istoken
;  260  1656 prunsign1
;  261  1666 typeName
;  262  1675 checkreg
;  263  1684 printreg
;  264  1693 searchname
;  265  1704 a
;  266  1706 v
;  267  1708 cmpneg
;  268  1715 prs
;  269  1719 expect
;  270  1726 error1
;  271  1733 prnl
;  272  1738 prs
;  273  1742 prs
;  274  1746 gettypes
;  275  1755 prs
;  276  1759 prs
;  277  1763 v
;  278  1765 prs
;  279  1769 expect
;  280  1776 prunsign1
;  281  1786 gettypes
;  282  1795 prs
;  283  1799 v
;  284  1801 prnl
;  285  1806 prs
;  286  1810 prs
;  287  1814 prs
;  288  1818 prnl
;  289  1823 prs
;  290  1827 prs
;  291  1831 a
;  292  1833 prs
;  293  1837 v
;  294  1839 prs
;  295  1843 prs
;  296  1847 prs
;  297  1851 prs
;  298  1855 prs
;  299  1859 prc
;  300  1863 printName
;  301  1873 prs
;  302  1877 prnl
;  303  1882 prs
;  304  1886 prs
;  305  1890 prs
;  306  1894 prs
;  307  1898 v
;  308  1900 istoken
;  309  1908 prnl
;  310  1913 prs
;  311  1917 prs
;  312  1921 prs
;  313  1925 prs
;  314  1929 prunsign1
;  315  1939 typeName
;  316  1948 searchname
;  317  1959 istoken
;  318  1967 searchname
;  319  1978 expect
;  320  1985 expect
;  321  1992 gettypes
;  322  2001 error1
;  323  2008 eqstr
;  324  2014 dovar1
;  325  2021 expect
;  326  2028 prs
;  327  2032 prs
;  328  2036 prs
;  329  2040 istoken
;  330  2048 prunsign1
;  331  2058 istoken
;  332  2066 searchname
;  333  2077 v
;  334  2079 error1
;  335  2086 eqstr
;  336  2092 doreg
;  337  2098 eqstr
;  338  2104 doreg
;  339  2110 eqstr
;  340  2116 doreg
;  341  2122 eqstr
;  342  2128 doreg
;  343  2134 eqstr
;  344  2140 doreg
;  345  2146 eqstr
;  346  2152 doreg
;  347  2158 eqstr
;  348  2164 doreg
;  349  2170 eqstr
;  350  2176 doreg
;  351  2182 eqstr
;  352  2188 doreg
;  353  2194 eqstr
;  354  2200 doreg
;  355  2206 eqstr
;  356  2212 doreg
;  357  2218 eqstr
;  358  2224 doreg
;  359  2230 eqstr
;  360  2236 doreg
;  361  2242 eqstr
;  362  2248 doreg
;  363  2254 eqstr
;  364  2260 doreg
;  365  2266 gettypes
;  366  2275 prs
;  367  2279 v
;  368  2281 prs
;  369  2285 prs
;  370  2289 prs
;  371  2293 a
;  372  2295 prs
;  373  2299 prs
;  374  2303 prunsign1
;  375  2313 v
;  376  2315 prs
;  377  2319 prs
;  378  2323 printName
;  379  2333 prs
;  380  2337 prs
;  381  2341 prs
;  382  2345 prs
;  383  2349 v
;  384  2351 prs
;  385  2355 prs
;  386  2359 prs
;  387  2363 v
;  388  2365 prs
;  389  2369 prs
;  390  2373 prs
;  391  2377 v
;  392  2379 prs
;  393  2383 rterm
;  394  2389 istoken
;  395  2397 prs
;  396  2401 prunsign1
;  397  2411 prs
;  398  2415 error1
;  399  2422 istoken
;  400  2430 prs
;  401  2434 prunsign1
;  402  2444 prs
;  403  2448 prs
;  404  2452 typeName
;  405  2461 searchname
;  406  2472 error1
;  407  2479 gettypes
;  408  2488 error1
;  409  2495 error1
;  410  2502 prs
;  411  2506 v
;  412  2508 prs
;  413  2512 prs
;  414  2516 doidiv
;  415  2523 prs
;  416  2527 checknamelen
;  417  2540 strcpy
;  418  2547 storeCall1
;  419  2558 expect
;  420  2565 istoken
;  421  2573 error1
;  422  2580 istoken
;  423  2588 istoken
;  424  2596 eprs
;  425  2601 eprs
;  426  2606 eprc
;  427  2611 eprnum
;  428  2618 eprs
;  429  2623 eprc
;  430  2628 eprs
;  431  2633 eprc
;  432  2638 eprs
;  433  2643 istoken
;  434  2651 name1
;  435  2657 searchname
;  436  2668 istoken
;  437  2676 checkreg
;  438  2685 searchname
;  439  2696 error1
;  440  2703 istoken
;  441  2711 expect
;  442  2718 prs
;  443  2722 prunsign1
;  444  2732 prs
;  445  2736 prs
;  446  2740 prc
;  447  2744 prunsign1
;  448  2754 prs
;  449  2758 v
;  450  2760 prs
;  451  2764 gettypes
;  452  2773 prs
;  453  2777 v
;  454  2779 prs
;  455  2783 v
;  456  2785 prs
;  457  2789 prs
;  458  2793 printreg
;  459  2802 prs
;  460  2806 prs
;  461  2810 prs
;  462  2814 prunsign1
;  463  2824 istoken
;  464  2832 prs
;  465  2836 prunsign1
;  466  2846 typeName
;  467  2855 checkreg
;  468  2864 doreg1
;  469  2871 docall1
;  470  2879 isreg
;  471  2885 searchname
;  472  2896 gettypes
;  473  2905 istoken
;  474  2913 istoken
;  475  2921 expect
;  476  2928 searchname
;  477  2939 expect
;  478  2946 expect
;  479  2953 gettypes
;  480  2962 error1
;  481  2969 istoken
;  482  2977 error1
;  483  2984 prs
;  484  2988 prs
;  485  2992 prs
;  486  2996 v
;  487  2998 istoken
;  488  3006 error1
;  489  3013 prs
;  490  3017 prs
;  491  3021 prs
;  492  3025 v
;  493  3027 istoken
;  494  3035 compoundass
;  495  3047 istoken
;  496  3055 compoundass
;  497  3067 istoken
;  498  3075 compoundass
;  499  3087 istoken
;  500  3095 compoundass
;  501  3107 istoken
;  502  3115 error1
;  503  3122 istoken
;  504  3130 error1
;  505  3137 istoken
;  506  3145 expr
;  507  3150 doassign
;  508  3159 dovar1
;  509  3166 istoken
;  510  3174 rterm
;  511  3180 istoken
;  512  3188 rterm
;  513  3194 istoken
;  514  3202 rterm
;  515  3208 istoken
;  516  3216 rterm
;  517  3222 istoken
;  518  3230 rterm
;  519  3236 istoken
;  520  3244 rterm
;  521  3250 istoken
;  522  3258 domul
;  523  3264 istoken
;  524  3272 doidiv
;  525  3279 istoken
;  526  3287 domod
;  527  3293 isrelational
;  528  3306 rterm
;  529  3312 cmpneg
;  530  3319 expect
;  531  3326 eqstr
;  532  3332 constantexpr
;  533  3345 checkreg
;  534  3354 doreg1
;  535  3361 expr
;  536  3366 prs
;  537  3370 prs
;  538  3374 expect
;  539  3381 prs
;  540  3385 getlex
;  541  3392 prunsign1
;  542  3402 getlex
;  543  3409 prc
;  544  3413 expect
;  545  3420 prs
;  546  3424 prs
;  547  3428 prunsign1
;  548  3438 prc
;  549  3442 prs
;  550  3446 prs
;  551  3450 prunsign1
;  552  3460 pexpr
;  553  3466 pint1
;  554  3472 stmt
;  555  3477 istoken
;  556  3485 prjump
;  557  3492 prlabel
;  558  3500 stmt
;  559  3505 prlabel
;  560  3513 prlabel
;  561  3521 prlabel
;  562  3529 stmt
;  563  3534 expect
;  564  3541 pexpr
;  565  3547 pint1
;  566  3553 prjump
;  567  3560 prlabel
;  568  3568 prlabel
;  569  3576 pexpr
;  570  3582 pint1
;  571  3588 stmt
;  572  3593 prjump
;  573  3600 prlabel
;  574  3608 istoken
;  575  3616 istoken
;  576  3624 stmt
;  577  3629 istoken
;  578  3637 doif
;  579  3642 istoken
;  580  3650 dodo
;  581  3655 istoken
;  582  3663 dowhile
;  583  3671 istoken
;  584  3679 prs
;  585  3683 name1
;  586  3689 prs
;  587  3693 expect
;  588  3700 prs
;  589  3704 next
;  590  3709 prc
;  591  3713 next
;  592  3718 getlex
;  593  3725 istoken
;  594  3733 prs
;  595  3737 next
;  596  3742 prc
;  597  3746 next
;  598  3751 getlex
;  599  3758 error1
;  600  3765 istoken
;  601  3773 doemit
;  602  3780 istoken
;  603  3788 istoken
;  604  3796 expr
;  605  3801 prs
;  606  3805 prs
;  607  3809 expect
;  608  3816 prs
;  609  3820 prs
;  610  3824 prc
;  611  3828 expect
;  612  3835 expect
;  613  3842 expr
;  614  3847 expect
;  615  3854 checknamelen
;  616  3867 strcpy
;  617  3874 checkFunction
;  618  3888 error1
;  619  3895 storefunc
;  620  3905 prs
;  621  3909 prs
;  622  3913 prs
;  623  3917 expect
;  624  3924 istoken
;  625  3932 typeName
;  626  3941 addlocal
;  627  3950 istoken
;  628  3958 expect
;  629  3965 expect
;  630  3972 isvariable
;  631  3983 typeName
;  632  3992 checknamelen
;  633  4005 addlocal
;  634  4014 istoken
;  635  4022 expect
;  636  4029 expect
;  637  4036 istoken
;  638  4044 expect
;  639  4051 prs
;  640  4055 mkneg
;  641  4061 prunsign1
;  642  4071 prs
;  643  4075 istoken
;  644  4083 stmt
;  645  4088 prs
;  646  4092 prs
;  647  4096 prc
;  648  4100 prs
;  649  4104 prs
;  650  4108 prs
;  651  4112 strlen
;  652  4119 strcpy
;  653  4126 prs
;  654  4130 error1
;  655  4137 error1
;  656  4144 checknamelen
;  657  4157 checkName
;  658  4167 error1
;  659  4174 istoken
;  660  4182 istoken
;  661  4190 prs
;  662  4194 prunsign1
;  663  4204 prs
;  664  4208 prs
;  665  4212 prs
;  666  4216 prs
;  667  4220 prs
;  668  4224 prunsign1
;  669  4234 prs
;  670  4238 expect
;  671  4245 expect
;  672  4252 error1
;  673  4259 prs
;  674  4263 prs
;  675  4267 prs
;  676  4271 strcpy
;  677  4278 expect
;  678  4285 istoken
;  679  4293 prc
;  680  4297 prscomment
;  681  4308 prc
;  682  4312 prs
;  683  4316 strlen
;  684  4323 istoken
;  685  4331 prc
;  686  4335 expect
;  687  4342 prunsign1
;  688  4352 istoken
;  689  4360 expect
;  690  4367 error1
;  691  4374 prs
;  692  4378 prs
;  693  4382 prs
;  694  4386 prs
;  695  4390 prs
;  696  4394 prs
;  697  4398 istoken
;  698  4406 prc
;  699  4410 istoken
;  700  4418 expect
;  701  4425 prunsign1
;  702  4435 prunsign1
;  703  4445 adrofname
;  704  4455 strcpy
;  705  4462 strcpy
;  706  4469 expect
;  707  4476 prs
;  708  4480 prs
;  709  4484 prs
;  710  4488 prs
;  711  4492 prs
;  712  4496 printint51
;  713  4507 prs
;  714  4511 printint51
;  715  4522 prs
;  716  4526 printint51
;  717  4537 prs
;  718  4541 printint51
;  719  4552 prs
;  720  4556 printint51
;  721  4567 prs
;  722  4571 printint51
;  723  4582 prs
;  724  4586 printint51
;  725  4597 prs
;  726  4601 printint51
;  727  4612 prs
;  728  4616 printint51
;  729  4627 prs
;  730  4631 prs
;  731  4635 prs
;  732  4639 printint51
;  733  4650 prs
;  734  4654 printint51
;  735  4665 prs
;  736  4669 prs
;  737  4673 printint51
;  738  4684 prs
;  739  4688 end1
;  740  4693 eqstr
;  741  4699 getlex
;  742  4706 expect
;  743  4713 error1
;  744  4720 strlen
;  745  4727 error1
;  746  4734 adrofname
;  747  4744 strcpy
;  748  4751 expect
;  749  4758 getlex
;  750  4765 istoken
;  751  4773 istoken
;  752  4781 dodefine
;  753  4790 error1
;  754  4797 typeName
;  755  4806 dofunc
;  756  4813 doglob
;  757  4820 fgets1
;  758  4827 cputs
;  759  4833 cputs
;  760  4839 exitR
;  761  4845 toupper
;  762  4853 strcpy
;  763  4860 instr1
;  764  4867 strcat1
;  765  4875 strcpy
;  766  4882 strlen
;  767  4889 openR
;  768  4895 cputs
;  769  4901 cputs
;  770  4907 exitR
;  771  4913 creatR
;  772  4920 cputs
;  773  4926 cputs
;  774  4932 exitR
;  775  4938 prs
;  776  4942 prs
;  777  4946 prs
;  778  4950 prs
;  779  4954 prs
;  780  4958 prs
;  781  4962 prs
;  782  4966 getarg
;  783  4973 getfirstchar
;  784  4986 parse
;  785  4992 epilog
;Input: A.C, List: A.S,  Lines: 1117
;Glob. variables:  118 max.:  200
;Functions      :   91 max.:  300
;Calls          :  786 max.: 2000, NameField: 4999
;Const in 'checkreg' :  712 max.: 3000, stacksize:  9538