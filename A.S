
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

;-107 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }

 ret
ENDP

putch: PROC
;Function : putch, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   107 NULL c = bp+4;
 ENTER  0,0 ; constant expression
cmp byte[bp+4], 10
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


;-125 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
 LEAVE
 ret
ENDP

strlen: PROC
;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   125 NULL s = bp+4
;  201 var sign word   125 NULL c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
.strlen4:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen5
 inc  word[bp+4]
 inc  word[bp-2]
 jmp .strlen4
.strlen5:
 mov ax, [bp-2]
 jmp .retnstrlen

;-126 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC
;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   126 NULL s = bp+4
;  201 ptr sign byte   126 NULL t = bp+6;
 ENTER  0,0
.strcpy6:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy7
 jmp .strcpy6
.strcpy7:
 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-127 int eqstr(char *p, char *q) { while(*p) {
 LEAVE
 ret
ENDP

eqstr: PROC
;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   127 NULL p = bp+4
;  201 ptr sign byte   127 NULL q = bp+6;
 ENTER  0,0
.eqstr8:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr9

;-128     if (*p != *q) return 0; p++; q++; }

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr10
 mov ax, 0
 jmp .retneqstr
.eqstr10:
 inc  word[bp+4]
 inc  word[bp+6]

;-129     if(*q) return 0; return 1; }

 jmp .eqstr8
.eqstr9:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr11
 mov ax, 0
 jmp .retneqstr
.eqstr11:
 mov ax, 1
 jmp .retneqstr

;-130 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}

 .retneqstr: LEAVE
 ret
ENDP

instr1: PROC
;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   130 NULL s = bp+4
;  201 var sign byte   130 NULL c = bp+6;
 ENTER  0,0
.instr112:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr113
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr114
 mov ax, 1
 jmp .retninstr1
.instr114:
 inc  word[bp+4]
 jmp .instr112
.instr113:
 mov ax, 0
 jmp .retninstr1

;-131 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }

 .retninstr1: LEAVE
 ret
ENDP

strcat1: PROC
;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   131 NULL s = bp+4
;  201 ptr sign byte   131 NULL t = bp+6;
 ENTER  0,0
.strcat115:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat116
 inc  word[bp+4]
 jmp .strcat115
.strcat116:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-132 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-133     while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}

;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   132 NULL s = bp+4;
 ENTER  0,0
.toupper17:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper18
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 97 ;unsigned : 1
 jl  .toupper19
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 122
 jg  .toupper20
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 sub ax, 32
 mov  bx, [bp+4]
 mov  [bx], al
.toupper20:
.toupper19:
 inc  word[bp+4]
 jmp .toupper17
.toupper18:

;-134 


;-135 int digit(char c){
 LEAVE
 ret
ENDP

digit: PROC

;-136     if(c<'0') return 0;

;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   135 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit21
 mov ax, 0
 jmp .retndigit

;-137     if(c>'9') return 0;

.digit21:
 mov al, [bp+4]
 cmp al, 57
 jle .digit22
 mov ax, 0
 jmp .retndigit

;-138     return 1;

.digit22:
 mov ax, 1
 jmp .retndigit

;-139 }


;-140 int letter(char c) {

 .retndigit: LEAVE
 ret
ENDP

letter: PROC

;-141     if (c=='_') return 1;

;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   140 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter23
 mov ax, 1
 jmp .retnletter

;-142     if (c=='.') return 1;

.letter23:
 mov al, [bp+4]
 cmp al, 46
 jne .letter24
 mov ax, 1
 jmp .retnletter

;-143     if (c=='?') return 1;

.letter24:
 mov al, [bp+4]
 cmp al, 63
 jne .letter25
 mov ax, 1
 jmp .retnletter

;-144     if (c=='$') return 1;

.letter25:
 mov al, [bp+4]
 cmp al, 36
 jne .letter26
 mov ax, 1
 jmp .retnletter

;-145     if (c> 'z') return 0;

.letter26:
 mov al, [bp+4]
 cmp al, 122
 jle .letter27
 mov ax, 0
 jmp .retnletter

;-146     if (c< '@') return 0;// at included

.letter27:
 mov al, [bp+4]
 cmp al, 64
 jge .letter28
 mov ax, 0
 jmp .retnletter

;-147     if (c> 'Z') { if (c< 'a') return 0; }

.letter28:
 mov al, [bp+4]
 cmp al, 90
 jle .letter29
 mov al, [bp+4]
 cmp al, 97
 jge .letter30
 mov ax, 0
 jmp .retnletter
.letter30:

;-148     return 1;

.letter29:
 mov ax, 1
 jmp .retnletter

;-149 }


;-150 int alnum(char c) {

 .retnletter: LEAVE
 ret
ENDP

alnum: PROC

;-151   if (digit (c)) return 1;

;Function : alnum, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   150 NULL c = bp+4;
 ENTER  0,0
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .alnum31
 mov ax, 1
 jmp .retnalnum

;-152   if (letter(c)) return 1;

.alnum31:
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je .alnum32
 mov ax, 1
 jmp .retnalnum

;-153   return 0;

.alnum32:
 mov ax, 0
 jmp .retnalnum

;-154 }


;-155 int a(unsigned int i) {  printName(i);}//address

 .retnalnum: LEAVE
 ret
ENDP

a: PROC
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   155 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-156 int v(unsigned int i) {//value
 LEAVE
 ret
ENDP

v: PROC

;-157     if (i < LSTART) prc('[');

;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   156 NULL i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v33
 push 91
 call prc
 add  sp, 2

;-158     printName(i);

.v33:
 push word [bp+4]
 call printName
 add  sp, 2

;-159     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v34
 push 93
 call prc
 add  sp, 2

;-160 }

.v34:

;-161 int checknamelen() { int i;    i=strlen(symbol);
 LEAVE
 ret
ENDP

checknamelen: PROC
;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   161 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-162   if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen35
 push checknamelen_0
 call error1
 add  sp, 2

;-163 }

.checknamelen35:

;-164 char doglobName[IDLENMAX];
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP
section .bss
absolute 48391
doglobName resb 15
section .text

;-165 int doglob() { int i; int j; int isstrarr; isstrarr=0;


doglob: PROC
;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   165 NULL i = bp-2
;  201 var sign word   165 NULL j = bp-4
;  202 var sign word   165 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-166   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob36
 push doglob_0
 call error1
 add  sp, 2

;-167   if (iswidth == 0) error1("no VOID as var type");

.doglob36:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob37
 push doglob_1
 call error1
 add  sp, 2

;-168   checknamelen();

.doglob37:
 call checknamelen

;-169   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob38
 push doglob_2
 call error1
 add  sp, 2

;-170   if (istoken('[')) { istype='&';

.doglob38:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob39
 mov ax, 38
 mov byte [istype], al

;-171     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob40

;-172       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-173       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-174       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-175       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob41
 push doglob_5
 call prs
 add  sp, 2

;-176       if (iswidth==2) prs(" resw ");

.doglob41:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob42
 push doglob_6
 call prs
 add  sp, 2

;-177       if (iswidth==4) prs(" resd ");

.doglob42:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob43
 push doglob_7
 call prs
 add  sp, 2

;-178       prunsign1(lexval);

.doglob43:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-179       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-180       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-181       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob44
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-182       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob44:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob45
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-183       GData[GTop]=lexval; expect(']');

.doglob45:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-184     }else { expect(']');

 jmp .doglob46
.doglob40:
 push 93
 call expect
 add  sp, 2

;-185       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob47
 push doglob_9
 call error1
 add  sp, 2

;-186       prs("\n"); prs(symbol); prs(" db ");

.doglob47:
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

;-187       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-188       expect('=');

 push 61
 call expect
 add  sp, 2

;-189       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob48

;-190         prc(34); prscomment(symbol); prc(34); prs(",0");

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

;-191         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-192       else if (istoken('{' )) { i=0;

 jmp .doglob49
.doglob48:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob50
 mov ax, 0
 mov [bp-2], ax

;-193         do { if(i) prc(',');

.doglob51:
 mov ax, [bp-2]
 or  al, al
 je .doglob52
 push 44
 call prc
 add  sp, 2

;-194           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob52:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-195         while (istoken(',')); expect('}'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob53
 jmp .doglob51
.doglob53:
 push 125
 call expect
 add  sp, 2

;-196       else error1("String or number array expected");

 jmp .doglob54
.doglob50:
 push doglob_13
 call error1
 add  sp, 2

;-197       };

.doglob54:
.doglob49:
.doglob46:

;-198   }else { //expect('=');

 jmp .doglob55
.doglob39:

;-199     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob56
 push doglob_15
 call prs
 add  sp, 2

;-200     else {

 jmp .doglob57
.doglob56:

;-201       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob58
 push doglob_16
 call prs
 add  sp, 2

;-202       else if (iswidth==2) prs(" dw ");

 jmp .doglob59
.doglob58:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob60
 push doglob_17
 call prs
 add  sp, 2

;-203       else                 prs(" dd ");

 jmp .doglob61
.doglob60:
 push doglob_18
 call prs
 add  sp, 2

;-204     }

.doglob61:
.doglob59:

;-205     if(istoken('-')) prc('-');

.doglob57:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob62
 push 45
 call prc
 add  sp, 2

;-206     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob62:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob63
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-207     else prunsign1(0); }

 jmp .doglob64
.doglob63:
 push 0
 call prunsign1
 add  sp, 2
.doglob64:

;-208   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob55:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-209   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-210   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-211   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob65
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob66
.doglob65:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-212   GTop++; expect(';'); }

.doglob66:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-213 


;-214 int gettypes(int i) {int j; char c;
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

;-215   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   214 NULL i = bp+4
;  201 var sign word   214 NULL j = bp-2
;  202 var sign byte   214 NULL c = bp-4;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes67
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes68
.gettypes67:
 mov ax, 0
 mov word [signi], ax

;-216   c=GWidth[i]; widthi=0;wi=0;

.gettypes68:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-217   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes69
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-218   if (c==2) {widthi=2;wi=2;}

.gettypes69:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes70
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-219   if (c==4) {widthi=4;wi=4;}

.gettypes70:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes71
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-220   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes71:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes72
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-221   if (c=='&')  typei=2;

.gettypes72:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes73
 mov ax, 2
 mov word [typei], ax

;-222   return i; }

.gettypes73:
 mov ax, [bp+4]
 jmp .retngettypes

;-223 int adrofname(unsigned int i) { adrF(GNameField, i); }

 .retngettypes: LEAVE
 ret
ENDP

adrofname: PROC
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   223 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-224 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
ENDP

adrF: PROC
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   224 NULL s = bp+4
;  201 var unsg word   224 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-225   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-226 int printName(unsigned int i) {int j;
 LEAVE
 ret
ENDP

printName: PROC

;-227   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   226 NULL i = bp+4
;  201 var sign word   226 NULL j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName74
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-228   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp .printName75
.printName74:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle .printName76
 push 43
 call prc
 add  sp, 2
.printName76:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-229 }

.printName75:

;-230 int searchname() { unsigned int i;
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

searchname: PROC

;-231   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   230 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname77
 push searchname_0
 call error1
 add  sp, 2

;-232   GUsed[i]=GUsed[i] + 1; return i;

.searchname77:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp .retnsearchname

;-233 }


;-234 int checkName() { unsigned int i; unsigned int j;

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

checkName: PROC

;-235   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   234 NULL i = bp-2
;  201 var unsg word   234 NULL j = bp-4;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
.checkName78:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName79
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
 je .checkName80
 mov ax, [bp-2]
 jmp .retncheckName
.checkName80:
 inc  word[bp-2]

;-236   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp .checkName78
.checkName79:
 mov ax, 1
 mov [bp-2], ax
.checkName81:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName82
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
 je .checkName83
 mov ax, [bp-2]
 jmp .retncheckName
.checkName83:
 inc  word[bp-2]

;-237   return 0;

 jmp .checkName81
.checkName82:
 mov ax, 0
 jmp .retncheckName

;-238 }


;-239 int typeName() { int m; //0=V,1=*,2=&

 .retncheckName: LEAVE
 ret
ENDP

typeName: PROC

;-240     issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   239 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-241     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName84
 mov ax, 83
 mov byte [issign], al

;-242     if(istoken(T_UNSIGNED)) issign='U';

.typeName84:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName85
 mov ax, 85
 mov byte [issign], al

;-243     iswidth=2;

.typeName85:
 mov ax, 2
 mov byte [iswidth], al

;-244     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName86
 mov ax, 0
 mov byte [iswidth], al

;-245     if(istoken(T_CHAR))     iswidth=1;

.typeName86:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName87
 mov ax, 1
 mov byte [iswidth], al

;-246     if(istoken(T_INT))      iswidth=2;

.typeName87:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName88
 mov ax, 2
 mov byte [iswidth], al

;-247     if(istoken(T_LONG))     iswidth=4;

.typeName88:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName89
 mov ax, 4
 mov byte [iswidth], al

;-248     istype='V';

.typeName89:
 mov ax, 86
 mov byte [istype], al

;-249     m=0;

 mov ax, 0
 mov [bp-2], ax

;-250     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName90
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-251     if(istoken('&'))  {istype='&'; m=2;}

.typeName90:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName91
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-252     name1();

.typeName91:
 call name1

;-253     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-254 }


;-255 int name1() {

 .retntypeName: LEAVE
 ret
ENDP

name1: PROC

;-256     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name192
 push name1_0
 call error1
 add  sp, 2

;-257     token=getlex();

.name192:
 call getlex
 mov word [token], ax

;-258 }


;-259 


;-260 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");

 ret
name1_0 db "Name expected",0
ENDP

storecall: PROC
;Function : storecall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   260 NULL i = bp-2;
 ENTER  2,0
 mov ax, [CTop]
 cmp ax, 2000 ;unsigned : 1
 jl  .storecall93
 push storecall_0
 call error1
 add  sp, 2

;-261   if (CNameTop >= 65468) error1("Call name table fuill");

.storecall93:
 mov ax, [CNameTop]
 cmp ax, 65468 ;unsigned : 0
 jb  .storecall94
 push storecall_1
 call error1
 add  sp, 2

;-262     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

.storecall94:
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

;-263     to_far(CNameTop, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNameTop]
 call to_far
 add  sp, 4

;-264     CNameTop=CNameTop+i; CNameTop++; CTop++;

 mov ax, [CNameTop]
 add ax, [bp-2]
 mov word [CNameTop], ax
 inc  word[CNameTop]
 inc  word[CTop]

;-265 }


;-266 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0
ENDP

storefunc: PROC
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc95
 push storefunc_0
 call error1
 add  sp, 2

;-267     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc95:
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

;-268     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-269 }


;-270 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal96
 push addlocal_0
 call error1
 add  sp, 2

;-271   if (checkName() != 0) error1("Variable already defined");

.addlocal96:
 call checkName
 cmp ax, 0
 je  .addlocal97
 push addlocal_1
 call error1
 add  sp, 2

;-272   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal97:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-273   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-274   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-275 }


;-276 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   276 NULL i = bp-2
;  201 var unsg word   276 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-277   while (i < FTop) { 

.checkFunction98:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction99

;-278     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

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
 je .checkFunction100
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction100:
 inc  word[bp-2]

;-279   return 0; }

 jmp .checkFunction98
.checkFunction99:
 mov ax, 0
 jmp .retncheckFunction

;-280 int dofunc() { int nloc; int i; int narg;

 .retncheckFunction: LEAVE
 ret
ENDP

dofunc: PROC

;-281   cloc=&co;

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   280 NULL nloc = bp-2
;  201 var sign word   280 NULL i = bp-4
;  202 var sign word   280 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-282   checknamelen();

 call checknamelen

;-283   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-284   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc101
 push dofunc_0
 call error1
 add  sp, 2

;-285   storefunc();

.dofunc101:
 call storefunc

;-286   prs("\n\n"); prs(symbol); prs(": PROC");

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

;-287   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-288   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc102
 mov ax, 2
 mov [bp-6], ax

;-289     do { typeName();  addlocal(); narg+=2;

.dofunc103:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-290          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc104
 add  word[bp-6], 2
.dofunc104:
 inc  word[LTop]

;-291     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc105
 jmp .dofunc103
.dofunc105:
 push 41
 call expect
 add  sp, 2

;-292 


;-293   expect('{'); /*body*/

.dofunc102:
 push 123
 call expect
 add  sp, 2

;-294   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-295   while(isvariable()) {

.dofunc106:
 call isvariable
 or  al, al
 je .dofunc107

;-296     do {typeName();

.dofunc108:
 call typeName

;-297         checknamelen();

 call checknamelen

;-298         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-299         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc109
 sub  word[bp-2], 2

;-300         GData[LTop]=nloc;

.dofunc109:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-301         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc110

;-302             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

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

;-303             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; 

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-304             }


;-305         LTop++;

.dofunc110:
 inc  word[LTop]

;-306       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc111
 jmp .dofunc108
.dofunc111:
 push 59
 call expect
 add  sp, 2

;-307   listproc();

 jmp .dofunc106
.dofunc107:
 call listproc

;-308   if (LTop>LSTART){prs(";\n ENTER  ");

 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc112
 push dofunc_3
 call prs
 add  sp, 2

;-309     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

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

;-310   while(istoken('}')==0)   stmt();

.dofunc112:
.dofunc113:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc114
 call stmt

;-311   if (nreturn) {

 jmp .dofunc113
.dofunc114:
 mov ax, [nreturn]
 or  al, al
 je .dofunc115

;-312         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-313         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-314         prc(':');

 push 58
 call prc
 add  sp, 2

;-315         }


;-316   if (LTop > LSTART) prs(" LEAVE");

.dofunc115:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc116
 push dofunc_6
 call prs
 add  sp, 2

;-317   prs("\n ret");

.dofunc116:
 push dofunc_7
 call prs
 add  sp, 2

;-318   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-319   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-320   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc117
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-321   prs("\nENDP");

.dofunc117:
 push dofunc_8
 call prs
 add  sp, 2

;-322 }


;-323 int isvariable() {
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

;-324     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable118
 jmp .v1

;-325     if(token==T_UNSIGNED) goto v1;

.isvariable118:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable119
 jmp .v1

;-326     if(token==T_CHAR)     goto v1;

.isvariable119:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable120
 jmp .v1

;-327     if(token==T_INT)      goto v1;

.isvariable120:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable121
 jmp .v1

;-328     if(token==T_LONG)     goto v1;

.isvariable121:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable122
 jmp .v1

;-329     return 0;

.isvariable122:
 mov ax, 0
 jmp .retnisvariable

;-330 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-331 }


;-332 


;-333 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;

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

;-334 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

mod2 dw 0
ireg2 dw 0
idx2 dw 0
ids2 dw 0
idw2 dw 0
idt2 dw 0
val2 dw 0

;-335 


;-336 int pexpr() {expect('('); iscmp=0;


pexpr: PROC
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-337   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr123
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr124
 call constantexpr
 jmp .retnpexpr

;-338     ireg1=checkreg();

.pexpr124:
 call checkreg
 mov word [ireg1], ax

;-339     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr125
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr125:

;-340   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

.pexpr123:
 call exprstart
 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr126
 push pexpr_1
 call prs
 add  sp, 2
.pexpr126:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-341   expect(')'); }           /*error1("Vergleich fehlt");*/

 push 41
 call expect
 add  sp, 2

;-342 


;-343 int constantexpr() { int mode; int id1;int ids;

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

constantexpr: PROC

;-344   token=getlex();   mode=typeName();

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   343 NULL mode = bp-2
;  201 var sign word   343 NULL id1 = bp-4
;  202 var sign word   343 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-345   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-346   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr127
 push constantexpr_0
 call error1
 add  sp, 2

;-347   expect(T_CONST);  prs(" ; constant expression");

.constantexpr127:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-348   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-349   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr128
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr129
.constantexpr128:
 push constantexpr_4
 call prs
 add  sp, 2

;-350   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr129:
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

;-351   expect(')');

 push 41
 call expect
 add  sp, 2

;-352 }


;-353 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
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
 je .exprstart130
 push 0
 call expr2
 add  sp, 2
 jmp .exprstart131
.exprstart130:
 push 0
 call expr
 add  sp, 2
.exprstart131:

;-354 


;-355 int expr2(int kind) {  int i;

 ret
exprstart_0 db "_",0
ENDP

expr2: PROC

;-356   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   355 NULL kind = bp+4
;  201 var sign word   355 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  .expr2132
 call getlex
 mov word [token], ax

;-357   mod1=typeName();

.expr2132:
 call typeName
 mov word [mod1], ax

;-358   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je .expr2133
 push expr2_0
 call error1
 add  sp, 2

;-359   ireg1=checkreg();

.expr2133:
 call checkreg
 mov word [ireg1], ax

;-360   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr2134
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr2

;-361   if (ireg1 == 0) { idx1=searchname();

.expr2134:
 mov ax, [ireg1]
 cmp ax, 0
 jne .expr2135
 call searchname
 mov word [idx1], ax

;-362     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-363     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je .expr2136
 push expr2_1
 call error1
 add  sp, 2
.expr2136:

;-364 


;-365   if (isrelational()) { error1("Vergleich noch nicht implementiert");

.expr2135:
 call isrelational
 or  al, al
 je .expr2137
 push expr2_2
 call error1
 add  sp, 2

;-366   }


;-367   if (istoken('=') == 0) error1("Assign expected");

.expr2137:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expr2138
 push expr2_3
 call error1
 add  sp, 2

;-368   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

.expr2138:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr2139
 mov ax, [lexval]
 mov word [val2], ax
 push expr2_4
 call prs
 add  sp, 2

;-369     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-370     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne .expr2140
 push expr2_6
 call prs
 add  sp, 2

;-371     if (idw1 == 2) prs("word ");

.expr2140:
 mov ax, [idw1]
 cmp ax, 2
 jne .expr2141
 push expr2_7
 call prs
 add  sp, 2

;-372     if (idw1 == 4) prs("dword ");

.expr2141:
 mov ax, [idw1]
 cmp ax, 4
 jne .expr2142
 push expr2_8
 call prs
 add  sp, 2

;-373     v(idx1);

.expr2142:
 push word [idx1]
 call v
 add  sp, 2

;-374     prs(", "); prunsign1(val2);

 push expr2_9
 call prs
 add  sp, 2
 push word [val2]
 call prunsign1
 add  sp, 2

;-375     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

 mov ax, [idx1]
 cmp ax, 200 ;unsigned : 1
 jl  .expr2143
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
.expr2143:
 jmp .retnexpr2

;-376 


;-377   mod1=typeName(); ireg2=checkreg();

.expr2139:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-378   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je .expr2144
 push expr2_11
 call prs
 add  sp, 2

;-379     if (ireg1) printreg(ireg1); 

 mov ax, [ireg1]
 or  al, al
 je .expr2145
 push word [ireg1]
 call printreg
 add  sp, 2

;-380         else v(idx1); 

 jmp .expr2146
.expr2145:
 push word [idx1]
 call v
 add  sp, 2

;-381             prs(", "); printreg(ireg2);return;

.expr2146:
 push expr2_12
 call prs
 add  sp, 2
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .retnexpr2

;-382             }


;-383   else {

 jmp .expr2147
.expr2144:

;-384     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne .expr2148
 push expr2_13
 call error1
 add  sp, 2

;-385 


;-386     idx2=searchname();

.expr2148:
 call searchname
 mov word [idx2], ax

;-387     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-388     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne .expr2149
 push expr2_14
 call error1
 add  sp, 2

;-389     prs("\nmov ");

.expr2149:
 push expr2_15
 call prs
 add  sp, 2

;-390     if (ireg1) printreg(ireg1); 

 mov ax, [ireg1]
 or  al, al
 je .expr2150
 push word [ireg1]
 call printreg
 add  sp, 2

;-391         else error1("Mem to Mem not allowed by x86-CPU");

 jmp .expr2151
.expr2150:
 push expr2_16
 call error1
 add  sp, 2

;-392     prs(", ");

.expr2151:
 push expr2_17
 call prs
 add  sp, 2

;-393     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne .expr2152
 push word [idx2]
 call a
 add  sp, 2

;-394     else {

 jmp .expr2153
.expr2152:

;-395       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne .expr2154
 push expr2_18
 call prs
 add  sp, 2

;-396       if (idw2 == 2) prs("word ");

.expr2154:
 mov ax, [idw2]
 cmp ax, 2
 jne .expr2155
 push expr2_19
 call prs
 add  sp, 2

;-397       if (idw2 == 4) prs("dword ");

.expr2155:
 mov ax, [idw2]
 cmp ax, 4
 jne .expr2156
 push expr2_20
 call prs
 add  sp, 2

;-398       v(idx2);

.expr2156:
 push word [idx2]
 call v
 add  sp, 2

;-399       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

 mov ax, [idx2]
 cmp ax, 200 ;unsigned : 1
 jl  .expr2157
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
.expr2157:

;-400     return;

.expr2153:
 jmp .retnexpr2

;-401   } error1("Internal error: only const or reg allowed");

.expr2147:
 push expr2_22
 call error1
 add  sp, 2

;-402 }


;-403 char ops[5];

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

;-404 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-405   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   404 NULL iscmp1 = bp+4
;  201 var sign word   404 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1158
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-406   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1158:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1159
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-407   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1159:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1160
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-408   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1160:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1161
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-409   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1161:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1162
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-410   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1162:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1163
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-411   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1163:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1164
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-412   if (iscmp1 == 1) { token=getlex();

.doreg1164:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1165
 call getlex
 mov word [token], ax

;-413       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1166
 push doreg1_7
 call error1
 add  sp, 2

;-414       strcpy(ops, "cmp"); }

.doreg1166:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-415   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1165:
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

;-416 


;-417   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1167
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-418   mod2=typeName(); ireg2=checkreg();

.doreg1167:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-419   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1168
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-420   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1168:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1169
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1170
.doreg1169:
 push word [bp-2]
 call v
 add  sp, 2

;-421   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1170:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1171
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

;-422 }

.doreg1171:

;-423 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

;-424   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg172
 mov ax, 0
 jmp .retncheckreg

;-425   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg172:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg173
 mov ax, 1
 jmp .retncheckreg
.checkreg173:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg174
 mov ax, 3
 jmp .retncheckreg

;-426   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg174:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg175
 mov ax, 5
 jmp .retncheckreg
.checkreg175:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg176
 mov ax, 7
 jmp .retncheckreg

;-427   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg176:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg177
 mov ax, 9
 jmp .retncheckreg
.checkreg177:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg178
 mov ax, 11
 jmp .retncheckreg

;-428   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg178:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg179
 mov ax, 13
 jmp .retncheckreg
.checkreg179:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg180
 mov ax, 15
 jmp .retncheckreg

;-429   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg180:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg181
 mov ax, 17
 jmp .retncheckreg
.checkreg181:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg182
 mov ax, 19
 jmp .retncheckreg

;-430   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg182:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg183
 mov ax, 21
 jmp .retncheckreg
.checkreg183:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg184
 mov ax, 23
 jmp .retncheckreg

;-431   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg184:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg185
 mov ax, 25
 jmp .retncheckreg
.checkreg185:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg186
 mov ax, 27
 jmp .retncheckreg

;-432   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg186:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg187
 mov ax, 29
 jmp .retncheckreg
.checkreg187:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg188
 mov ax, 31
 jmp .retncheckreg

;-433   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg188:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg189
 mov ax, 33
 jmp .retncheckreg
.checkreg189:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg190
 mov ax, 35
 jmp .retncheckreg

;-434   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg190:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg191
 mov ax, 37
 jmp .retncheckreg
.checkreg191:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg192
 mov ax, 39
 jmp .retncheckreg

;-435   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg192:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg193
 mov ax, 41
 jmp .retncheckreg
.checkreg193:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg194
 mov ax, 43
 jmp .retncheckreg

;-436   // (eqstr(symbol,"ip")) return 45;


;-437   if (strlen(symbol) >   3) return 0;

.checkreg194:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg195
 mov ax, 0
 jmp .retncheckreg

;-438   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg195:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg196
 mov ax, 47
 jmp .retncheckreg
.checkreg196:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg197
 mov ax, 50
 jmp .retncheckreg

;-439   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg197:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 53
 jmp .retncheckreg
.checkreg198:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 56
 jmp .retncheckreg

;-440   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg199:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 59
 jmp .retncheckreg
.checkreg200:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 62
 jmp .retncheckreg

;-441   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg201:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 65
 jmp .retncheckreg
.checkreg202:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 68
 jmp .retncheckreg

;-442   if (eqstr(symbol,"cr0")) return 71;

.checkreg203:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 71
 jmp .retncheckreg

;-443   return 0;   }

.checkreg204:
 mov ax, 0
 jmp .retncheckreg

;-444 char printregstr[]

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

;-445 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-446 //          1         2         3         4         5         6         7


;-447 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-448 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-449   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   448 NULL i = bp+4
;  201 var unsg word   448 NULL k = bp-2
;  202 var unsg byte   448 NULL c = bp-4;
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

;-450   k = &printregstr + i; c=*k; prc(c);

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

;-451   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg205
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

;-452 }

.printreg205:

;-453 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
ENDP
evalue dw 0
exprtype dw 10

;-454 int expr(int isRight)


expr: PROC

;-455 { int mode; int id1;     int ixarr; int ixconst;


;-456   int ids;  int isCONST; int i;     unsigned char *p;


;-457   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   454 NULL isRight = bp+4
;  201 var sign word   455 NULL mode = bp-2
;  202 var sign word   455 NULL id1 = bp-4
;  203 var sign word   455 NULL ixarr = bp-6
;  204 var sign word   455 NULL ixconst = bp-8
;  205 var sign word   456 NULL ids = bp-10
;  206 var sign word   456 NULL isCONST = bp-12
;  207 var sign word   456 NULL i = bp-14
;  208 ptr unsg byte   456 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr206
 mov ax, [lexval]
 mov word [evalue], ax

;-458     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-459   mode=typeName(); /*0=V,1=*,2=&*/

.expr206:
 call typeName
 mov [bp-2], ax

;-460   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-461   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr207
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-462   if (token=='(')  {docall1(); goto e1; }

.expr207:
 mov ax, [token]
 cmp ax, 40
 jne .expr208
 call docall1
 jmp .e1

;-463   if (isreg()) goto e1;

.expr208:
 call isreg
 or  al, al
 je .expr209
 jmp .e1

;-464 


;-465   id1=searchname(); gettypes(id1); ids=signi;

.expr209:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-466   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-467     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr210
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr211

;-468       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-469     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr212
.expr211:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-470     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-471     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr213
 push expr_1
 call error1
 add  sp, 2
.expr213:
.expr212:

;-472   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

.expr210:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr214
 mov ax, [bp-2]
 or  al, al
 je .expr215
 push expr_2
 call error1
 add  sp, 2

;-473      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr215:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr216
 push expr_4
 call prs
 add  sp, 2
 jmp .expr217
.expr216:
 push expr_5
 call prs
 add  sp, 2

;-474      v(id1); goto e1;}

.expr217:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-475   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

.expr214:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr218
 mov ax, [bp-2]
 or  al, al
 je .expr219
 push expr_6
 call error1
 add  sp, 2

;-476      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr219:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr220
 push expr_8
 call prs
 add  sp, 2
 jmp .expr221
.expr220:
 push expr_9
 call prs
 add  sp, 2

;-477      v(id1); goto e1;}

.expr221:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-478 


;-479   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr218:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr222
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-480   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr222:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr223
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-481   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr223:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr224
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-482   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr224:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr225
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-483   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr225:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr226
 push expr_14
 call error1
 add  sp, 2

;-484   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr226:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr227
 push expr_15
 call error1
 add  sp, 2

;-485 


;-486   if (istoken('=')) { exprtype= expr(1);

.expr227:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr228
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-487   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-488   dovar1(mode, "mov", ixarr, id1);

.expr228:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-489 


;-490 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr229
 push expr_17
 call rterm
 add  sp, 2

;-491   else if (istoken('-')) rterm("sub" );

 jmp .expr230
.expr229:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr231
 push expr_18
 call rterm
 add  sp, 2

;-492   else if (istoken('&')) rterm("and" );

 jmp .expr232
.expr231:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr233
 push expr_19
 call rterm
 add  sp, 2

;-493   else if (istoken('|')) rterm("or" );

 jmp .expr234
.expr233:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr235
 push expr_20
 call rterm
 add  sp, 2

;-494   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr236
.expr235:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr237
 push expr_21
 call rterm
 add  sp, 2

;-495   else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr238
.expr237:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr239
 push expr_22
 call rterm
 add  sp, 2

;-496   else if (istoken('*')) domul (ids);

 jmp .expr240
.expr239:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr241
 push word [bp-10]
 call domul
 add  sp, 2

;-497   else if (istoken('/')) doidiv(ids);

 jmp .expr242
.expr241:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr243
 push word [bp-10]
 call doidiv
 add  sp, 2

;-498   else if (istoken('%')) domod (ids);

 jmp .expr244
.expr243:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr245
 push word [bp-10]
 call domod
 add  sp, 2

;-499   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr245:
.expr244:
.expr242:
.expr240:
.expr238:
.expr236:
.expr234:
.expr232:
.expr230:
 call isrelational
 or  al, al
 je .expr246
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-500   return 0;

.expr246:
 mov ax, 0
 jmp .retnexpr

;-501 }


;-502 


;-503 int compoundass(char *op, int mode, int id1) {

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

;-504   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   503 NULL op = bp+4
;  201 var sign word   503 NULL mode = bp+6
;  202 var sign word   503 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass247
 push compoundass_0
 call error1
 add  sp, 2

;-505   prnl(); prs(op); prs("  ");

.compoundass247:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-506   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass248
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass249
.compoundass248:
 push compoundass_3
 call prs
 add  sp, 2

;-507   v(id1); prs(", ");

.compoundass249:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-508   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-509 }


;-510 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-511   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   510 NULL mode = bp+4
;  201 var sign word   510 NULL op = bp+6
;  202 var sign word   510 NULL ixarr = bp+8
;  203 var sign word   510 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-512   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1250
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

;-513     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1251
 push dovar1_1
 call prs
 add  sp, 2

;-514     if(widthi == 2) prs(" ax, [bx]");

.dovar1251:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1252
 push dovar1_2
 call prs
 add  sp, 2

;-515     return; }

.dovar1252:
 jmp .retndovar1

;-516   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1250:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1253
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

;-517   if (ixarr) {

.dovar1253:
 mov ax, [bp+8]
 or  al, al
 je .dovar1254

;-518     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-519     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_5
 call prs
 add  sp, 2

;-520     prs("\n "); prs(op);

.dovar1255:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-521     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1256
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1257
.dovar1256:
 push dovar1_8
 call prs
 add  sp, 2

;-522 // v(id1); prs(" [bx]");


;-523     prc('['); printName(id1); prs(" + bx]");

.dovar1257:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-524     return; }

 jmp .retndovar1

;-525   prnl();prs(op);

.dovar1254:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-526   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1258
 push dovar1_10
 call prs
 add  sp, 2

;-527   if(wi==2) prs(" ax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1259
 push dovar1_11
 call prs
 add  sp, 2

;-528   if(wi==4) prs(" eax, ");

.dovar1259:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1260
 push dovar1_12
 call prs
 add  sp, 2

;-529   v(id1);

.dovar1260:
 push word [bp+10]
 call v
 add  sp, 2

;-530 }


;-531 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-532   if (istoken(T_CONST)) { prnl(); prs(op);

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   531 NULL op = bp+4
;  201 var sign word   531 NULL mode = bp-2
;  202 var sign word   531 NULL opint = bp-4
;  203 var sign word   531 NULL ixarr = bp-6
;  204 var sign word   531 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm261
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-533     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm262
 push rterm_0
 call prs
 add  sp, 2

;-534     if (wi==2) prs(" ax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm263
 push rterm_1
 call prs
 add  sp, 2

;-535     if (wi==4) prs(" eax, ");

.rterm263:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm264
 push rterm_2
 call prs
 add  sp, 2

;-536     prunsign1(lexval); return;}

.rterm264:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-537   mode=typeName(); id1=searchname(); ixarr=0;

.rterm261:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-538   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm265
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-539     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-540     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm266
 push rterm_3
 call error1
 add  sp, 2
.rterm266:

;-541   if (eqstr(symbol,"_AX")) return;

.rterm265:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm267
 jmp .retnrterm

;-542   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm267:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-543 }


;-544 int isreg() {

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
ENDP

isreg: PROC

;-545   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg268
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-546   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg268:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg269
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-547   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg269:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg270
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-548   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg270:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg271
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-549   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg271:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg272
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-550   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg272:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg273
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-551   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg273:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg274
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-552   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg274:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg275
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-553   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg275:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg276
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-554   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg276:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg277
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-555   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg277:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg278
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-556   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg278:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg279
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-557   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg279:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg280
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-558   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg280:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg281
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-559   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg281:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg282
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-560   return 0;   r1: return 1;

.isreg282:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-561 }


;-562 int doreg(char *dr) { int i; expect('=');

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
;  200 ptr sign byte   562 NULL dr = bp+4
;  201 var sign word   562 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-563   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-564        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg283
 push word [lexval]
 call prunsign1
 add  sp, 2

;-565   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg284
.doreg283:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg285
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-566   else error1("only number or var allowed"); }

 jmp .doreg286
.doreg285:
 push doreg_2
 call error1
 add  sp, 2
.doreg286:
.doreg284:

;-567 


;-568 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

doassign: PROC

;-569   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   568 NULL mode = bp+4
;  201 var sign word   568 NULL i = bp+6
;  202 var sign word   568 NULL ixarr = bp+8
;  203 var sign word   568 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-570   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign287
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-571     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign288
 push doassign_1
 call prs
 add  sp, 2

;-572     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign289
.doassign288:
 push doassign_2
 call prs
 add  sp, 2
.doassign289:
 jmp .retndoassign

;-573   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign287:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign290
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

;-574   if (ixarr) {  prs("\n mov bx, ");

.doassign290:
 mov ax, [bp+8]
 or  al, al
 je .doassign291
 push doassign_5
 call prs
 add  sp, 2

;-575     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign292
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign293
.doassign292:
 push word [bp+8]
 call v
 add  sp, 2

;-576     if (wi==2) prs("\n shl bx, 1");

.doassign293:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign294
 push doassign_6
 call prs
 add  sp, 2

;-577     prs("\n mov ["); printName(i);

.doassign294:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-578     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign295
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign296
.doassign295:
 push doassign_9
 call prs
 add  sp, 2
.doassign296:
 jmp .retndoassign

;-579   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign291:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign297
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign298
 push doassign_11
 call prs
 add  sp, 2

;-580     } v(i); prs(", al"); return; }

.doassign298:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-581   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign297:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign299
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign300
 push doassign_14
 call prs
 add  sp, 2

;-582     } v(i); prs(", ax"); return; }

.doassign300:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-583   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign299:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign301
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign302
 push doassign_17
 call prs
 add  sp, 2

;-584     } v(i); prs(", eax"); return; }

.doassign302:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-585 }

.doassign301:

;-586 int domul(int ids) {

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

;-587   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   586 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul303
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul304
.domul303:

;-588   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul305

;-589     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); 

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-590     }


;-591   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul306
.domul305:
 push domul_3
 call error1
 add  sp, 2
.domul306:
.domul304:

;-592 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-593   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   592 NULL ids = bp+4
;  201 var sign word   592 NULL mode = bp-2
;  202 var sign word   592 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv307

;-594     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-595     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv308
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv309
.doidiv308:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv309:

;-596   else {

 jmp .doidiv310
.doidiv307:

;-597     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-598     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv311
 push doidiv_3
 call error1
 add  sp, 2

;-599     gettypes(id1);

.doidiv311:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-600     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv312
 push doidiv_4
 call error1
 add  sp, 2

;-601     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv312:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv313
 push doidiv_5
 call error1
 add  sp, 2

;-602     prs("\n mov bx, "); v(id1);

.doidiv313:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-603     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv314
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv315
.doidiv314:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv315:

;-604 }

.doidiv310:

;-605 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
;  200 var sign word   605 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-606 


;-607 int docalltype[10]; int docallvalue[10];
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

;-608 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 48451
procname resb 17
section .text

;-609 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-610   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   609 NULL i = bp-2
;  201 var sign word   609 NULL narg = bp-4
;  202 var sign word   609 NULL t0 = bp-6
;  203 var sign word   609 NULL n0 = bp-8
;  204 var sign word   609 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-611   checknamelen();

 call checknamelen

;-612   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-613   storecall();

 call storecall

;-614   expect('(');

 push 40
 call expect
 add  sp, 2

;-615 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1316

;-616 	  do { narg++;

.docall1317:
 inc  word[bp-4]

;-617 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1318
 push docall1_0
 call error1
 add  sp, 2
.docall1318:
 mov ax, 0
 mov [bp-6], ax

;-618       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1319
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-619       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1319:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1320
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-620         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-621         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-622       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1320:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1321
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-623       if(istoken(T_NAME))  { n0=checkreg();

.docall1321:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1322
 call checkreg
 mov [bp-8], ax

;-624         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1323
 mov ax, 5
 mov [bp-6], ax

;-625         else {t0=4; n0=searchname();

 jmp .docall1324
.docall1323:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-626           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1325
 mov ax, 3
 mov [bp-6], ax
.docall1325:
.docall1324:

;-627       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1322:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1326
 push docall1_4
 call error1
 add  sp, 2

;-628       docalltype [narg] = t0;

.docall1326:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-629       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-630     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1327
 jmp .docall1317
.docall1327:

;-631 


;-632   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-633     do {

.docall1328:

;-634       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-635       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-636       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1329
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-637       if(t0==2){ prs("\n push ");

.docall1329:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1330
 push docall1_6
 call prs
 add  sp, 2

;-638         prs(fname);prc(95);prunsign1(n0);}

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

;-639       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1330:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1331
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-640         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-641       if(t0==4){ gettypes(n0);

.docall1331:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1332
 push word [bp-8]
 call gettypes
 add  sp, 2

;-642         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1333
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-643         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1334
.docall1333:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-644         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1334:

;-645       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1332:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1335
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1336
 mov ax, [bp-10]
 add ax, 2
.docall1336:

;-646    i--; } while (i > 0);  }

.docall1335:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1337
 jmp .docall1328
.docall1337:

;-647 	 prs("\n call "); prs(&procname);

.docall1316:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-648 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1338
 push docall1_14
 call prs
 add  sp, 2

;-649      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2
.docall1338:

;-650 /***************************************************************/


;-651 


;-652 int doinclude() { int fdtemp;
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

;-653   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   652 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne .doinclude339
 mov ax, [fdin]
 mov [bp-2], ax

;-654   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-655   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-656   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

 mov ax, [DOS_ERR]
 cmp ax, 0
 je  .doinclude340
 push doinclude_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-657     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-658   linenoinclude=lineno; lineno=1;

.doinclude340:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-659   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-660   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-661   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-662 }

.doinclude339:

;-663 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0
ENDP

dodefine: PROC

;-664   if (eqstr(symbol, "ORGDATA")) {token=getlex();

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   663 NULL i = bp-2
;  201 var sign word   663 NULL j = bp-4
;  202 var sign word   663 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine341
 call getlex
 mov word [token], ax

;-665     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp .retndodefine

;-666   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

.dodefine341:
 push dodefine_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine342
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 258
 jne .dodefine343

;-667     prs("\n;Use archive file: ");

 push dodefine_2
 call prs
 add  sp, 2

;-668     strcpy(archivename, symbol); prs(archivename);

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

;-669     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp .dodefine344
.dodefine343:
 push dodefine_3
 call error1
 add  sp, 2
.dodefine344:
 call getlex
 mov word [token], ax
 jmp .retndodefine

;-670    expect(T_NAME);

.dodefine342:
 push 256
 call expect
 add  sp, 2

;-671   if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine345

;-672     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine346
 push dodefine_4
 call error1
 add  sp, 2

;-673     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

.dodefine346:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine347
 push dodefine_5
 call error1
 add  sp, 2

;-674     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

.dodefine347:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-675     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-676     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

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

;-677     expect(T_CONST); GTop++;  }

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-678 }

.dodefine345:

;-679 int stmt() { int c; char cha;

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

;-680        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   679 NULL c = bp-2
;  201 var sign byte   679 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt348
.stmt349:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt350
 call stmt
 jmp .stmt349
.stmt350:

;-681   else if(istoken(T_IF))    doif();

 jmp .stmt351
.stmt348:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt352
 call doif

;-682   else if(istoken(T_DO))    dodo();

 jmp .stmt353
.stmt352:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt354
 call dodo

;-683   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt355
.stmt354:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt356
 call dowhile

;-684   else if(istoken(T_GOTO))  {

 jmp .stmt357
.stmt356:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt358

;-685     prs("\n jmp .");name1();prs(symbol);expect(';');}

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

;-686   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt359
.stmt358:
 mov ax, [token]
 cmp ax, 518
 jne .stmt360
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-687         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt361:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt362
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt361
.stmt362:
 call getlex
 mov word [token], ax

;-688   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();

 jmp .stmt363
.stmt360:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt364
 mov ax, [token]
 cmp ax, 123
 jne .stmt365
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-689         while(cha!= '}') { prc(cha); cha=next(); }

.stmt366:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt367
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-690         token=getlex(); }

 jmp .stmt366
.stmt367:
 call getlex
 mov word [token], ax

;-691         else error1("Curly open expected");

 jmp .stmt368
.stmt365:
 push stmt_3
 call error1
 add  sp, 2

;-692         }

.stmt368:

;-693   else if(istoken(T_EMIT))   doemit();

 jmp .stmt369
.stmt364:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370
 call doemit

;-694   else if(istoken(';'))      { }

 jmp .stmt371
.stmt370:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372

;-695   else if(istoken(T_RETURN)) {

 jmp .stmt373
.stmt372:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt374

;-696         if (token!=';') exprstart();

 mov ax, [token]
 cmp ax, 59
 je  .stmt375
 call exprstart

;-697         prs("\n jmp .retn");

.stmt375:
 push stmt_4
 call prs
 add  sp, 2

;-698         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-699         nreturn++;

 inc  word[nreturn]

;-700         expect(';');

 push 59
 call expect
 add  sp, 2

;-701         }


;-702   else if(thechar==':')      {

 jmp .stmt376
.stmt374:
 mov al, [thechar]
 cmp al, 58
 jne .stmt377

;-703         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-704         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-705         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-706         expect(':');

 push 58
 call expect
 add  sp, 2

;-707         }


;-708   else  {exprstart(); expect(';'); }

 jmp .stmt378
.stmt377:
 call exprstart
 push 59
 call expect
 add  sp, 2

;-709 }

.stmt378:
.stmt376:
.stmt373:
.stmt371:
.stmt369:
.stmt363:
.stmt359:
.stmt357:
.stmt355:
.stmt353:
.stmt351:

;-710 


;-711 int doemit() {prs("\n db ");
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

;-712   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-713     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit379
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit379:
 push 41
 call expect
 add  sp, 2

;-714 


;-715 int cmpneg(int ids) {

 ret
doemit_0 db "\n db ",0
ENDP

cmpneg: PROC

;-716        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   715 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg380
 push cmpneg_0
 call prs
 add  sp, 2

;-717   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg381
.cmpneg380:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg382
 push cmpneg_1
 call prs
 add  sp, 2

;-718   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg383
.cmpneg382:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg384
 mov ax, [bp+4]
 or  al, al
 je .cmpneg385
 push cmpneg_2
 call prs
 add  sp, 2

;-719                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg386
.cmpneg385:
 push cmpneg_3
 call prs
 add  sp, 2

;-720   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg386:
 jmp .cmpneg387
.cmpneg384:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg388
 mov ax, [bp+4]
 or  al, al
 je .cmpneg389
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-721                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-722                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg390
.cmpneg389:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-723                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-724   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg390:
 jmp .cmpneg391
.cmpneg388:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg392
 push cmpneg_8
 call prs
 add  sp, 2

;-725   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg393
.cmpneg392:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg394
 push cmpneg_9
 call prs
 add  sp, 2

;-726   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg395
.cmpneg394:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg395:
.cmpneg393:
.cmpneg391:
.cmpneg387:
.cmpneg383:
.cmpneg381:

;-727 


;-728 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
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
;  200 var sign word   728 NULL n = bp+4;
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

;-729 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   729 NULL n = bp+4;
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

;-730 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

doif: PROC
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   730 NULL jdest = bp-2
;  201 var sign word   730 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-731   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-732   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif396
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-733     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-734   else prlabel(jdest); }

 jmp .doif397
.doif396:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif397:

;-735 


;-736 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
ENDP

dodo: PROC

;-737   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   736 NULL jdest = bp-2
;  201 var sign word   736 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-738   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-739   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-740 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
ENDP

dowhile: PROC
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   740 NULL jdest = bp-2
;  201 var sign word   740 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-741   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-742   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-743 int isrelational() {
 LEAVE
 ret
ENDP

isrelational: PROC

;-744   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational398
 jmp .w
.isrelational398:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational399
 jmp .w

;-745   if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational399:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational400
 jmp .w
.isrelational400:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational401
 jmp .w

;-746   if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational401:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational402
 jmp .w
.isrelational402:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational403
 jmp .w

;-747   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational403:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-748 


;-749 char symboltemp[80];

 .retnisrelational:
 ret
ENDP
section .bss
absolute 48468
symboltemp resb 80
section .text

;-750 int getlex() { char c; char *p;


getlex: PROC

;-751 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   750 NULL c = bp-2
;  201 ptr sign byte   750 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex404
 mov ax, 0
 jmp .retngetlex
.getlex404:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex405
 jmp .g1

;-752   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex405:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex406
 mov al, [thechar]
 cmp al, 61
 jne .getlex407
 call next
 mov ax, 806
 jmp .retngetlex
.getlex407:

;-753   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex406:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex408
 mov al, [thechar]
 cmp al, 61
 jne .getlex409
 call next
 mov ax, 807
 jmp .retngetlex
.getlex409:

;-754   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex408:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex410
 mov al, [thechar]
 cmp al, 61
 jne .getlex411
 call next
 mov ax, 824
 jmp .retngetlex
.getlex411:

;-755   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex410:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex412
 mov al, [thechar]
 cmp al, 61
 jne .getlex413
 call next
 mov ax, 811
 jmp .retngetlex
.getlex413:

;-756   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex412:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex414
 mov al, [thechar]
 cmp al, 60
 jne .getlex415
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex415:

;-757   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex414:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex416
 mov al, [thechar]
 cmp al, 62
 jne .getlex417
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex417:

;-758   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex416:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex418
 mov al, [thechar]
 cmp al, 43
 jne .getlex419
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex419:

;-759   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex418:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex420
 mov al, [thechar]
 cmp al, 45
 jne .getlex421
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex421:

;-760   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex420:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex422
 mov al, [thechar]
 cmp al, 61
 jne .getlex423
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex423:

;-761   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex422:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex424
 mov al, [thechar]
 cmp al, 61
 jne .getlex425
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex425:

;-762   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex424:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex426
 mov al, [thechar]
 cmp al, 61
 jne .getlex427
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex427:

;-763   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex426:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex428
 mov al, [thechar]
 cmp al, 61
 jne .getlex429
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex429:

;-764   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex428:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex430
 mov al, [thechar]
 cmp al, 61
 jne .getlex431
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex431:

;-765   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex430:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex432
 mov al, [thechar]
 cmp al, 61
 jne .getlex433
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex433:

;-766   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex432:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex434
 mov al, [bp-2]
 jmp .retngetlex

;-767   if (c == '/') { if (thechar == '/') {

.getlex434:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex435
 mov al, [thechar]
 cmp al, 47
 jne .getlex436

;-768       do c=next(); while(ifEOL(c)==0) return getlex(); } }

.getlex437:
 call next
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex438
 jmp .getlex437
.getlex438:
 call getlex
 jmp .retngetlex
.getlex436:

;-769   if (c == '/') { if (thechar == '*') {

.getlex435:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex439
 mov al, [thechar]
 cmp al, 42
 jne .getlex440

;-770       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex441
 jmp .g2
.getlex441:
 mov al, [thechar]
 cmp al, 47
 je  .getlex442
 jmp .g2

;-771       c=next(); return getlex(); } else  return '/'; }

.getlex442:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex443
.getlex440:
 mov ax, 47
 jmp .retngetlex
.getlex443:

;-772   if (c == '"') {getstring(c); return T_STRING;}

.getlex439:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex444
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-773   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex444:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex445
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-774   if (c==39) { lexval=next();

.getlex445:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex446
 call next
 mov word [lexval], ax

;-775     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex447
 call next
 mov word [lexval], ax

;-776       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex448
 mov ax, 10
 mov word [lexval], ax
.getlex448:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex449
 mov ax, 9
 mov word [lexval], ax

;-777       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex449:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex450
 mov ax, 0
 mov word [lexval], ax
.getlex450:
.getlex447:
 call next
 mov ax, 257
 jmp .retngetlex

;-778   if (alnum(c)) {

.getlex446:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex451

;-779     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-780     while(alnum(thechar)) {c=next(); *p=c;  p++; }

.getlex452:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex453
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-781       *p=0;

 jmp .getlex452
.getlex453:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-782     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex454
 mov ax, 531
 jmp .retngetlex

;-783     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex454:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex455
 mov ax, 532
 jmp .retngetlex

;-784     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex455:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex456
 mov ax, 529
 jmp .retngetlex

;-785     if (eqstr(symbol,"int"     )) return T_INT;

.getlex456:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex457
 mov ax, 517
 jmp .retngetlex

;-786     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex457:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex458
 mov ax, 533
 jmp .retngetlex

;-787     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex458:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex459
 mov ax, 530
 jmp .retngetlex

;-788     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex459:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex460
 mov ax, 518
 jmp .retngetlex

;-789     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex460:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex461
 mov ax, 519
 jmp .retngetlex

;-790     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex461:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex462
 mov ax, 520
 jmp .retngetlex

;-791     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex462:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex463
 mov ax, 512
 jmp .retngetlex

;-792     if (eqstr(symbol,"if"      )) return T_IF;

.getlex463:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex464
 mov ax, 513
 jmp .retngetlex

;-793     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex464:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex465
 mov ax, 514
 jmp .retngetlex

;-794     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex465:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex466
 mov ax, 515
 jmp .retngetlex

;-795     if (eqstr(symbol,"do"      )) return T_DO;

.getlex466:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex467
 mov ax, 516
 jmp .retngetlex

;-796     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex467:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex468
 mov ax, 521
 jmp .retngetlex

;-797     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex468:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex469
 mov ax, 511
 jmp .retngetlex

;-798     if (eqstr(symbol,"include" )) return T_INCLUDE;

.getlex469:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex470
 mov ax, 510
 jmp .retngetlex

;-799     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex470:
 call convertdefine
 or  al, al
 je .getlex471
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-800     return T_NAME; } error1("Input item not recognized"); }

.getlex471:
 mov ax, 256
 jmp .retngetlex
.getlex451:
 push getlex_18
 call error1
 add  sp, 2

;-801 


;-802 int convertdefine() { int i; int j;   i=0;

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
;  200 var sign word   802 NULL i = bp-2
;  201 var sign word   802 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-803   while (i < GTop) {

.convertdefine472:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine473

;-804    j=adrofname(i);

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-805    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine474
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine475
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-806    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine475:

;-807    i++; }

.convertdefine474:
 inc  word[bp-2]

;-808    return 0; }

 jmp .convertdefine472
.convertdefine473:
 mov ax, 0
 jmp .retnconvertdefine

;-809 int getdigit(char c) { int i;

 .retnconvertdefine: LEAVE
 ret
ENDP

getdigit: PROC

;-810     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   809 NULL c = bp+4
;  201 var sign word   809 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-811     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit476
 mov ax, 88
 mov byte [thechar], al
.getdigit476:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit477
 call next

;-812       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit478:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit479
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit480
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-813 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit480:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit481
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit481:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-814      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-815     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

 jmp .getdigit478
.getdigit479:
 jmp .getdigit482
.getdigit477:
.getdigit483:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit484
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-816      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit483
.getdigit484:

;-817 }

.getdigit482:

;-818 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
ENDP

getstring: PROC
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   818 NULL delim = bp+4
;  201 var sign word   818 NULL c = bp-2
;  202 ptr sign byte   818 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-819   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

.getstring485:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring486
 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]
 call next
 mov [bp-2], ax
 jmp .getstring485
.getstring486:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-820 


;-821 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
 LEAVE
 ret
ENDP

next: PROC
;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   821 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
 mov al, [bp-2]
 mov byte [globC], al
 call fgets1
 mov byte [thechar], al
 mov al, [bp-2]
 jmp .retnnext

;-822 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}

 .retnnext: LEAVE
 ret
ENDP

istoken: PROC
;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   822 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken487
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnistoken
.istoken487:
 mov ax, 0
 jmp .retnistoken

;-823 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC
;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   823 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect488
 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 call listproc

;-824   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

 push expect_0
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push expect_1
 call error1
 add  sp, 2
.expect488:

;-825 


;-826 int eprc(char c)  {*cloc=c; cloc++; }
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

eprc: PROC
;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   826 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
 inc  word[cloc]

;-827 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
 LEAVE
 ret
ENDP

eprs: PROC
;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   827 NULL s = bp+4
;  201 var sign byte   827 NULL c = bp-2;
 ENTER  2,0
.eprs489:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs490
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
 inc  word[bp+4]
 jmp .eprs489
.eprs490:

;-828 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-829   if (c==10) {_AX=13; writetty(); }

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   828 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc491
 mov  ax, 13
 call writetty

;-830   _AL=c; writetty();

.prc491:
 mov  al, [bp+4]
 call writetty

;-831   fputcR(c, fdout);

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-832   }


;-833 int prscomment(unsigned char *s) {unsigned char c;
 LEAVE
 ret
ENDP

prscomment: PROC

;-834   while(*s){c=*s;prc(c);s++;} }

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   833 NULL s = bp+4
;  201 var unsg byte   833 NULL c = bp-2;
 ENTER  2,0
.prscomment492:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment493
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp .prscomment492
.prscomment493:

;-835 int prnl() { prs("\n ");}
 LEAVE
 ret
ENDP

prnl: PROC
 push prnl_0
 call prs
 add  sp, 2

;-836 


;-837 int prs(unsigned char *s) {unsigned char c; int com; com=0;

 ret
prnl_0 db "\n ",0
ENDP

prs: PROC
;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   837 NULL s = bp+4
;  201 var unsg byte   837 NULL c = bp-2
;  202 var sign word   837 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-838   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;

.prs494:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs495
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 34
 jne .prs496
 mov ax, [bp-4]
 or  al, al
 je .prs497
 mov ax, 0
 mov [bp-4], ax
 jmp .prs498
.prs497:
 mov ax, 1
 mov [bp-4], ax

;-839     if (c==92) { if (com==0) { s++; c=*s;

.prs498:
.prs496:
 mov al, [bp-2]
 cmp al, 92
 jne .prs499
 mov ax, [bp-4]
 cmp ax, 0
 jne .prs500
 inc  word[bp+4]
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-840           if (c=='n') c=10; if (c=='t') c= 9;

 mov al, [bp-2]
 cmp al, 110
 jne .prs501
 mov ax, 10
 mov [bp-2], al
.prs501:
 mov al, [bp-2]
 cmp al, 116
 jne .prs502
 mov ax, 9
 mov [bp-2], al

;-841     } } prc(c); s++;  } }

.prs502:
.prs500:
.prs499:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp .prs494
.prs495:

;-842 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
 LEAVE
 ret
ENDP

eprnum: PROC
;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   842 NULL n = bp+4
;  201 var sign word   842 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum503
 push 45
 call eprc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-843   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }

.eprnum503:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum504
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call eprnum
 add  sp, 2
.eprnum504:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
 push word [bp+4]
 call eprc
 add  sp, 2

;-844 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
ENDP

pint1: PROC
;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   844 NULL n = bp+4
;  201 var sign word   844 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint1505
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-845   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n += '0'; prc(n); }

.pint1505:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint1506
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
.pint1506:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
 add  word[bp+4], 48
 push word [bp+4]
 call prc
 add  sp, 2

;-846 int prunsign1(unsigned int n) { unsigned int e;
 LEAVE
 ret
ENDP

prunsign1: PROC

;-847   if ( _ n >= 10) {  e=n/10; prunsign1(e); }

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   846 NULL n = bp+4
;  201 var unsg word   846 NULL e = bp-2;
 ENTER  2,0 ; constant expression
cmp word[bp+4], 10 ;unsigned : 0
 jb  .prunsign1507
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-848     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }

.prunsign1507:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
 add  word[bp+4], 48
 push word [bp+4]
 call prc
 add  sp, 2

;-849 int printint51(unsigned int j)  {
 LEAVE
 ret
ENDP

printint51: PROC

;-850   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   849 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint51508
 push 32
 call prc
 add  sp, 2
.printint51508:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint51509
 push 32
 call prc
 add  sp, 2
.printint51509:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint51510
 push 32
 call prc
 add  sp, 2

;-851    if (j<10) prc(32);  prunsign1(j); }

.printint51510:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint51511
 push 32
 call prc
 add  sp, 2
.printint51511:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-852 


;-853 int fgets1() { char c; c=*fgetsp;
 LEAVE
 ret
ENDP

fgets1: PROC
;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   853 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-854   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1512
 call printinputline
 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1513
 mov ax, 0
 jmp .retnfgets1

;-855     fgetsp=&fgetsdest; c=*fgetsp; column=0; }

.fgets1513:
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov ax, 0
 mov word [column], ax

;-856   fgetsp++; column++;  return c; }

.fgets1512:
 inc  word[fgetsp]
 inc  word[column]
 mov al, [bp-2]
 jmp .retnfgets1

;-857 int printinputline() {

 .retnfgets1: LEAVE
 ret
ENDP

printinputline: PROC

;-858     int col; 


;-859     col=0;

;Function : printinputline, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   858 NULL col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-860     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-861     do {

.printinputline514:

;-862         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-863         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline515
 jmp .retnprintinputline

;-864         *fgetsp=DOS_ByteRead; 

.printinputline515:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-865         fgetsp++; 

 inc  word[fgetsp]

;-866         col++;

 inc  word[bp-2]

;-867         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline516
 push printinputline_0
 call error1
 add  sp, 2

;-868         }

.printinputline516:

;-869         while (DOS_ByteRead != 10); 

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline517
 jmp .printinputline514
.printinputline517:

;-870     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-871     if (fdout) { 

 mov ax, [fdout]
 or  al, al
 je .printinputline518

;-872         prs("\n\n;-"); 

 push printinputline_1
 call prs
 add  sp, 2

;-873         prunsign1(lineno); 

 push word [lineno]
 call prunsign1
 add  sp, 2

;-874         prc(' '); 

 push 32
 call prc
 add  sp, 2

;-875         lineno++;

 inc  word[lineno]

;-876         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-877         }


;-878 }

.printinputline518:

;-879 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

ifEOL: PROC

;-880     if (c == 10) return 1;//LF

;Function : ifEOL, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   879 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL519
 mov ax, 1
 jmp .retnifEOL

;-881     if (c == 13) {//CR

.ifEOL519:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL520

;-882         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL521
 call next
 mov [bp+4], al

;-883         return 1;

.ifEOL521:
 mov ax, 1
 jmp .retnifEOL

;-884     }


;-885     return 0;

.ifEOL520:
 mov ax, 0
 jmp .retnifEOL

;-886 }


;-887 


;-888 


;-889 


;-890 int end1(int n) {

 .retnifEOL: LEAVE
 ret
ENDP

end1: PROC

;-891     fcloseR(fdin); 

;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   890 NULL n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-892     fcloseR(fdout); 

 push word [fdout]
 call fcloseR
 add  sp, 2

;-893     exitR(n); 

 push word [bp+4]
 call exitR
 add  sp, 2

;-894 }


;-895 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-896     lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   895 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-897     prnl(); 

 call prnl

;-898     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-899     prs(";Line: "); 

 push error1_0
 call prs
 add  sp, 2

;-900     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-901     prs(" ************** ERROR: "); 

 push error1_1
 call prs
 add  sp, 2

;-902     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-903     prs("  in column: "); 

 push error1_2
 call prs
 add  sp, 2

;-904     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-905     prs("\nToken: "); 

 push error1_3
 call prs
 add  sp, 2

;-906     prunsign1(token); 

 push word [token]
 call prunsign1
 add  sp, 2

;-907 //    prs(", globC: "); 


;-908 //    prc(globC);


;-909 //    prs(", thechar: "); 


;-910 //    prunsign1(thechar); 


;-911     prs(", symbol: "); 

 push error1_4
 call prs
 add  sp, 2

;-912     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-913     end1(1); 

 push 1
 call end1
 add  sp, 2

;-914 }


;-915 int listproc() {
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP

listproc: PROC

;-916     int i;


;-917     if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   916 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle .listproc522

;-918         prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-919         prs(", Number of local variables: "); 

 push listproc_1
 call prs
 add  sp, 2

;-920         i=LTop - LSTART; 

 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax

;-921         prunsign1(i);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-922         prs("\n;   # type sign width addr used name");

 push listproc_2
 call prs
 add  sp, 2

;-923         prs("   list of local variables");

 push listproc_3
 call prs
 add  sp, 2

;-924         i=LSTART;

 mov ax, 200
 mov [bp-2], ax

;-925         while (i < LTop) { 

.listproc523:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc524

;-926             listvar(i); 

 push word [bp-2]
 call listvar
 add  sp, 2

;-927             i++; 

 inc  word[bp-2]

;-928             } 


;-929         }

 jmp .listproc523
.listproc524:

;-930 }

.listproc522:

;-931 int listcall() { 
 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name",0
listproc_3 db "   list of local variables",0
ENDP

listcall: PROC

;-932     int i;


;-933     prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   932 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-934     i=0;  

 mov ax, 0
 mov [bp-2], ax

;-935     while (i< CTop) { 

.listcall525:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .listcall526

;-936         calllisting(i); 

 push word [bp-2]
 call calllisting
 add  sp, 2

;-937         i++; 

 inc  word[bp-2]

;-938         } 


;-939 }

 jmp .listcall525
.listcall526:

;-940 int calllisting(int i) {
 LEAVE
 ret
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
ENDP

calllisting: PROC

;-941     char c; int j;


;-942     prs("\n;"); 

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   940 NULL i = bp+4
;  201 var sign byte   941 NULL c = bp-2
;  202 var sign word   941 NULL j = bp-4;
 ENTER  4,0
 push calllisting_0
 call prs
 add  sp, 2

;-943     printint51(i); 

 push word [bp+4]
 call printint51
 add  sp, 2

;-944     prc(32);

 push 32
 call prc
 add  sp, 2

;-945     c=CType [i]; 

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al

;-946     if(c==0)prs("unresolved ");

 mov al, [bp-2]
 cmp al, 0
 jne .calllisting527
 push calllisting_1
 call prs
 add  sp, 2

;-947     j=CAdr[i];            

.calllisting527:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov [bp-4], ax

;-948     printint51(j); 

 push word [bp-4]
 call printint51
 add  sp, 2

;-949     prc(32);

 push 32
 call prc
 add  sp, 2

;-950     from_far(NameA, j);   

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-951     prs(NameA);

 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-952 }


;-953 int countcalls(int f) { 
 LEAVE
 ret
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0
ENDP

countcalls: PROC

;-954     unsigned int i;


;-955     pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   953 NULL f = bp+4
;  201 var unsg word   954 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-956     i=0;  

 mov ax, 0
 mov [bp-2], ax

;-957     while (i < CTop) {

.countcalls528:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .countcalls529

;-958         p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-959         from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-960         if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

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

;-961         i++; 

.countcalls530:
 inc  word[bp-2]

;-962         }


;-963 }

 jmp .countcalls528
.countcalls529:

;-964 int listfunc() { 
 LEAVE
 ret
ENDP

listfunc: PROC

;-965     int i;


;-966     prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   965 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-967     i=0;  

 mov ax, 0
 mov [bp-2], ax

;-968     while (i < FTop) { 

.listfunc531:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc532

;-969         countcalls (i); 

 push word [bp-2]
 call countcalls
 add  sp, 2

;-970         i++; 

 inc  word[bp-2]

;-971         }


;-972     i=0;  

 jmp .listfunc531
.listfunc532:
 mov ax, 0
 mov [bp-2], ax

;-973     while (i < FTop) { 

.listfunc533:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc534

;-974         funclisting(i); 

 push word [bp-2]
 call funclisting
 add  sp, 2

;-975         i++; 

 inc  word[bp-2]

;-976         } 


;-977 }

 jmp .listfunc533
.listfunc534:

;-978 int funclisting(int i) {
 LEAVE
 ret
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
ENDP

funclisting: PROC

;-979     int j;  char c;


;-980     prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   978 NULL i = bp+4
;  201 var sign word   979 NULL j = bp-2
;  202 var sign byte   979 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-981     j = FCalls[i]; 

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax

;-982     if (j) printint51(j); 

 mov ax, [bp-2]
 or  al, al
 je .funclisting535
 push word [bp-2]
 call printint51
 add  sp, 2

;-983         else prs(" NULL");

 jmp .funclisting536
.funclisting535:
 push funclisting_1
 call prs
 add  sp, 2

;-984     j = FAdr[i];   

.funclisting536:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FAdr + bx]
 mov [bp-2], ax

;-985     printint51(j); 

 push word [bp-2]
 call printint51
 add  sp, 2

;-986     prc(32);

 push 32
 call prc
 add  sp, 2

;-987     c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-988     if(c=='V')prs("void " );    

 mov al, [bp-4]
 cmp al, 86
 jne .funclisting537
 push funclisting_2
 call prs
 add  sp, 2

;-989     if(c=='B')prs("byte " );

.funclisting537:
 mov al, [bp-4]
 cmp al, 66
 jne .funclisting538
 push funclisting_3
 call prs
 add  sp, 2

;-990     if(c=='W')prs("word " );    

.funclisting538:
 mov al, [bp-4]
 cmp al, 87
 jne .funclisting539
 push funclisting_4
 call prs
 add  sp, 2

;-991     if(c=='D')prs("dwrd " );

.funclisting539:
 mov al, [bp-4]
 cmp al, 68
 jne .funclisting540
 push funclisting_5
 call prs
 add  sp, 2

;-992     prc(32); prc(32);

.funclisting540:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-993     pt=adrF(FNameField, i); 

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-994     prs(pt);

 push word [pt]
 call prs
 add  sp, 2

;-995 }


;-996 


;-997 int listvar(unsigned int i) {
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

;-998     unsigned int j; char c;


;-999     prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   997 NULL i = bp+4
;  201 var unsg word   998 NULL j = bp-2
;  202 var sign byte   998 NULL c = bp-4;
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

;-1000     c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

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

;-1001                  if(c=='&')prs("arr ");   if(c=='#')prs("def ");

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

;-1002     c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

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

;-1003     c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

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

;-1004                  if(c==  4)prs("dwrd " );

.listvar548:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar549
 push listvar_9
 call prs
 add  sp, 2

;-1005     j=GAdr[i]; printint51(j);

.listvar549:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1006     j=GUsed[i]; 

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax

;-1007     if (j) printint51(j);

 mov ax, [bp-2]
 or  al, al
 je .listvar550
 push word [bp-2]
 call printint51
 add  sp, 2

;-1008     else {

 jmp .listvar551
.listvar550:

;-1009         if(GType[i]=='#') prs("    -"); 

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar552
 push listvar_10
 call prs
 add  sp, 2

;-1010         else prs(" NULL");

 jmp .listvar553
.listvar552:
 push listvar_11
 call prs
 add  sp, 2

;-1011          }

.listvar553:

;-1012     prc(32);  

.listvar551:
 push 32
 call prc
 add  sp, 2

;-1013     pt=adrofname(i); prs(pt);

 push word [bp+4]
 call adrofname
 add  sp, 2
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-1014     if(GType[i]=='#') { 

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar554

;-1015         prc('='); 

 push 61
 call prc
 add  sp, 2

;-1016         j=GData[i]; 

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1017         prunsign1(j); 

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1018         }


;-1019     if(GType[i]=='&') { 

.listvar554:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar555

;-1020         prc('['); 

 push 91
 call prc
 add  sp, 2

;-1021         j=GData[i]; 

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1022         prunsign1(j); 

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1023         prc(']');

 push 93
 call prc
 add  sp, 2

;-1024         }


;-1025     if (i >= LSTART) { 

.listvar555:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  .listvar556

;-1026         prs(" = bp"); 

 push listvar_12
 call prs
 add  sp, 2

;-1027         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-1028         if (j > 0) prc('+'); 

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar557
 push 43
 call prc
 add  sp, 2

;-1029         pint1(j);  

.listvar557:
 push word [bp-2]
 call pint1
 add  sp, 2

;-1030     }


;-1031 }

.listvar556:

;-1032 


;-1033 unsigned int MAXUI=65535;
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

;-1034 int epilog() {


epilog: PROC

;-1035     unsigned int i;


;-1036     prs("\n \n;   # type sign width  adr used name");

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1035 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 call prs
 add  sp, 2

;-1037     prs("   list of global variables\n");

 push epilog_1
 call prs
 add  sp, 2

;-1038     i=1;

 mov ax, 1
 mov [bp-2], ax

;-1039     while (i< GTop) { 

.epilog558:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .epilog559

;-1040         listvar(i); 

 push word [bp-2]
 call listvar
 add  sp, 2

;-1041         i++; 

 inc  word[bp-2]

;-1042         }


;-1043     listfunc();   

 jmp .epilog558
.epilog559:
 call listfunc

;-1044     listcall();

 call listcall

;-1045     prs("\n;Input: "); prs(&namein);

 push epilog_2
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1046     prs(", List: ");   prs(&namelst);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1047     prs(",  Lines:"); printint51(lineno);

 push epilog_4
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-1048     prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_5
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-1049     prs(" max.:"); printint51(LSTART);

 push epilog_6
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-1050     prs("\n;Functions      :"); printint51(FTop);

 push epilog_7
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-1051     prs(" max.:"); printint51(FUNCMAX);

 push epilog_8
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-1052     prs("\n;Calls          :"); printint51(CTop);

 push epilog_9
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-1053     prs(" max.:"); printint51(CALLMAX);

 push epilog_10
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-1054     prs(", NameField:"); printint51(CNameTop);

 push epilog_11
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-1055 //    prs(" max.:"); 


;-1056     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);

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

;-1057     prs(" max.:"); printint51(COMAX); i=COMAX; i=i-maxco; 

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

;-1058     if (i <= 1000)prs(" *** Warning *** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog560
 push epilog_15
 call prs
 add  sp, 2

;-1059     prs(", stacksize: ");  

.epilog560:
 push epilog_16
 call prs
 add  sp, 2

;-1060     i=MAXUI-orgData; printint51(i);

 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1061     if (i <= 1000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog561
 push epilog_17
 call prs
 add  sp, 2

;-1062   end1(0);}

.epilog561:
 push 0
 call end1
 add  sp, 2

;-1063 


;-1064 int checkcalls() { 
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

;-1065     int i; int j; int k;


;-1066     prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1065 NULL i = bp-2
;  201 var sign word  1065 NULL j = bp-4
;  202 var sign word  1065 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-1067     i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-1068     while (i < CTop) {

.checkcalls562:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .checkcalls563

;-1069         pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-1070         from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-1071         j=0;

 mov ax, 0
 mov [bp-4], ax

;-1072         do { 

.checkcalls564:

;-1073             p1=adrF(FNameField, j);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-1074             if (eqstr(NameA, p1)){ 

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkcalls565

;-1075                 CType[i]=1; 

 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al

;-1076                 j=FTop; 

 mov ax, [FTop]
 mov [bp-4], ax

;-1077                 }


;-1078             j++; 

.checkcalls565:
 inc  word[bp-4]

;-1079             } while (j < FTop);

 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .checkcalls566
 jmp .checkcalls564
.checkcalls566:

;-1080         if (j == FTop) { 

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne .checkcalls567

;-1081             k++; prs("\n; "); 

 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2

;-1082             prs(NameA); 

 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-1083         }


;-1084         i++; 

.checkcalls567:
 inc  word[bp-2]

;-1085     }


;-1086     prs("\n; Number of unresolved CALLs :"); printint51(k);

 jmp .checkcalls562
.checkcalls563:
 push checkcalls_2
 call prs
 add  sp, 2
 push word [bp-6]
 call printint51
 add  sp, 2

;-1087     if (k!=0) error1("At least 1 function is missing! ");

 mov ax, [bp-6]
 cmp ax, 0
 je  .checkcalls568
 push checkcalls_3
 call error1
 add  sp, 2

;-1088     else prs(" All FUNCTIONs in place");

 jmp .checkcalls569
.checkcalls568:
 push checkcalls_4
 call prs
 add  sp, 2

;-1089 }

.checkcalls569:

;-1090 


;-1091 int parse() { 
 LEAVE
 ret
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db "\n; Number of unresolved CALLs :",0
checkcalls_3 db "At least 1 function is missing! ",0
checkcalls_4 db " All FUNCTIONs in place",0
ENDP

parse: PROC

;-1092     token=getlex(); 

 call getlex
 mov word [token], ax

;-1093     do {

.parse570:

;-1094         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse571
 mov ax, 1
 jmp .retnparse

;-1095         if (istoken('#')) {

.parse571:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse572

;-1096              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse573
 call dodefine

;-1097         else if (istoken(T_INCLUDE)) doinclude();

 jmp .parse574
.parse573:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je .parse575
 call doinclude

;-1098         else error1("define or include expected");  

 jmp .parse576
.parse575:
 push parse_0
 call error1
 add  sp, 2

;-1099         }

.parse576:
.parse574:

;-1100     else{ 

 jmp .parse577
.parse572:

;-1101         typeName();  

 call typeName

;-1102         if (token=='(') dofunc();  

 mov ax, [token]
 cmp ax, 40
 jne .parse578
 call dofunc

;-1103         else doglob(); }

 jmp .parse579
.parse578:
 call doglob
.parse579:

;-1104     } while(1);

.parse577:
 mov ax, 1
 or  al, al
 je .parse580
 jmp .parse570
.parse580:

;-1105 }


;-1106 


;-1107 int getfirstchar() { 

 .retnparse:
 ret
parse_0 db "define or include expected",0
ENDP

getfirstchar: PROC

;-1108     fgetsp=&fgetsdest; 

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1109     *fgetsp=0; 

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1110     thechar=fgets1(); 

 call fgets1
 mov byte [thechar], al

;-1111     }


;-1112 


;-1113 char *arglen=0x80; char *argv=0x82;

 ret
ENDP
arglen dw 128
argv dw 130

;-1114 int getarg() { 


getarg: PROC

;-1115     int arglen1; int i; char *c;


;-1116     arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word  1115 NULL arglen1 = bp-2
;  201 var sign word  1115 NULL i = bp-4
;  202 ptr sign byte  1115 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1117     if (arglen1 == 0) { 

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarg581

;-1118         cputs(Version1); 

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1119         cputs(" Usage: A.COM in_file[.C]: "); 

 push getarg_0
 call cputs
 add  sp, 2

;-1120         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1121         }


;-1122     i=arglen1+129; 

.getarg581:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1123     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1124     arglen1--;

 dec  word[bp-2]

;-1125     toupper(argv);     

 push word [argv]
 call toupper
 add  sp, 2

;-1126     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1127     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

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

;-1128     strcpy(namelst, namein); 

.getarg582:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1129     i=strlen(namelst); 

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1130     i--; 

 dec  word[bp-4]

;-1131     c=&namelst+i; 

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1132     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1133 


;-1134     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1135     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg583

;-1136         cputs("Source file missing (.C): "); 

 push getarg_2
 call cputs
 add  sp, 2

;-1137         cputs(namein); 

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1138         exitR(1); 

 push 1
 call exitR
 add  sp, 2

;-1139         }


;-1140     fdout=creatR(namelst);

.getarg583:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1141     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg584

;-1142         cputs("list file not creatable: ");

 push getarg_3
 call cputs
 add  sp, 2

;-1143         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1144         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1145         }


;-1146     prs("\n; ");

.getarg584:
 push getarg_4
 call prs
 add  sp, 2

;-1147     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1148     prs(", Source: "); prs(namein);  

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1149     prs(", Output asm: "); prs(namelst);

 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1150     prs("\norg  256 \njmp main");

 push getarg_7
 call prs
 add  sp, 2

;-1151 }


;-1152 


;-1153 int setblock(unsigned int i) {
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

;-1154     DOS_ERR=0; 

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1153 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax

;-1155     _BX=i; 

 mov  bx, [bp+4]

;-1156     _ ax=cs; 

 mov  ax, cs

;-1157     _ es=ax; 

 mov  es, ax

;-1158     _AX=0x4A00; 

 mov  ax, 18944

;-1159     DosInt();                                                             

 call DosInt

;-1160 }


;-1161 int main() {
 LEAVE
 ret
ENDP

main: PROC

;-1162     getarg();

 call getarg

;-1163 setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-1164 if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main585
 push main_0
 call error1
 add  sp, 2

;-1165 segE=allocmem(4096);

.main585:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-1166 if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main586
 push main_1
 call error1
 add  sp, 2

;-1167     CNameTop=0;

.main586:
 mov ax, 0
 mov word [CNameTop], ax

;-1168     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1169     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1170     getfirstchar();

 call getfirstchar

;-1171     parse();

 call parse

;-1172   checkcalls(); 

 call checkcalls

;-1173   epilog();

 call epilog

;-1174 }


;-1175 


;-1176 


;-1177 


;-1178 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;

 ret
main_0 db "SetBlock , AX=",0
main_1 db "alloc memory, AX=",0
ENDP

allocmem: PROC

;-1179   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word  1178 NULL i = bp+4
;  201 var unsg word  1178 NULL vAX = bp-2
;  202 var unsg word  1178 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, 18432
 call DosInt
mov [bp-2], ax
mov [bp-4], bx

;-1180   if(DOS_ERR) return vBX;   return vAX;

 mov ax, [DOS_ERR]
 or  al, al
 je .allocmem587
 mov ax, [bp-4]
 jmp .retnallocmem
.allocmem587:
 mov ax, [bp-2]
 jmp .retnallocmem

;-1181 }


;-1182 int to_far(char *dest, char *src) {

 .retnallocmem: LEAVE
 ret
ENDP

to_far: PROC

;-1183   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1182 NULL dest = bp+4
;  201 ptr sign byte  1182 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-1184   asm cld

 cld

;-1185   do{

.to_far588:

;-1186   asm lodsb  ; inc si

 lodsb  ; inc si

;-1187   asm stosb  ; inc di

 stosb  ; inc di

;-1188   } while (al != 0);

 cmp  al, 0
 je  .to_far589
 jmp .to_far588
.to_far589:

;-1189 }


;-1190 int from_far(char *dest, char *src) {
 LEAVE
 ret
ENDP

from_far: PROC

;-1191   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1190 NULL dest = bp+4
;  201 ptr sign byte  1190 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-1192   do{

.from_far590:

;-1193   asm mov al, [es:si]

 mov al, [es:si]

;-1194   asm inc si

 inc si

;-1195   asm mov [di], al

 mov [di], al

;-1196   asm inc di

 inc di

;-1197   } while (al != 0);

 cmp  al, 0
 je  .from_far591
 jmp .from_far590
.from_far591:

;-1198 }


;-1199 
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
;  105 arr sign byte   164    2 doglobName[15]
;  106 var sign word   333    5 mod1
;  107 var sign word   333   12 ireg1
;  108 var sign word   333    6 idx1
;  109 var sign word   333    1 ids1
;  110 var sign word   333    4 idw1
;  111 var sign word   333    2 idt1
;  112 var sign word   333 NULL val1
;  113 var sign word   334    2 mod2
;  114 var sign word   334    6 ireg2
;  115 var sign word   334    6 idx2
;  116 var sign word   334    1 ids2
;  117 var sign word   334    4 idw2
;  118 var sign word   334    2 idt2
;  119 var sign word   334    2 val2
;  120 arr sign byte   403    9 ops[5]
;  121 arr sign byte   445    3 printregstr[74]
;  122 var sign word   453    1 evalue
;  123 var sign word   453    1 exprtype
;  124 arr sign word   607    2 docalltype[10]
;  125 arr sign word   607    2 docallvalue[10]
;  126 arr sign byte   608    2 procname[17]
;  127 arr sign byte   749    2 symboltemp[80]
;  128 var unsg word  1033    1 MAXUI
;  129 ptr sign byte  1113    1 arglen
;  130 ptr sign byte  1113    2 argv


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
;   11    8  125   strlen
;   12   23  126   strcpy
;   13   74  127   eqstr
;   14    2  130   instr1
;   15    1  131   strcat1
;   16    1  132   toupper
;   17    3  135   digit
;   18    1  140   letter
;   19    3  150   alnum
;   20    4  155   a
;   21   21  156   v
;   22    4  161   checknamelen
;   23    1  165   doglob
;   24   12  214   gettypes
;   25    9  223   adrofname
;   26    7  224   adrF
;   27    4  226   printName
;   28   12  230   searchname
;   29    3  234   checkName
;   30   10  239   typeName
;   31    3  255   name1
;   32    1  260   storecall
;   33    1  266   storefunc
;   34    2  270   addlocal
;   35    1  276   checkFunction
;   36    1  280   dofunc
;   37    1  323   isvariable
;   38    3  336   pexpr
;   39    1  343   constantexpr
;   40    3  353   exprstart
;   41    1  355   expr2
;   42    3  404   doreg1
;   43    6  423   checkreg
;   44    6  448   printreg
;   45    2  454   expr
;   46    4  503   compoundass
;   47    2  510   dovar1
;   48    8  531   rterm
;   49    1  544   isreg
;   50   15  562   doreg
;   51    1  568   doassign
;   52    1  586   domul
;   53    2  592   doidiv
;   54    1  605   domod
;   55    1  609   docall1
;   56    1  652   doinclude
;   57    1  663   dodefine
;   58    6  679   stmt
;   59    1  711   doemit
;   60    3  715   cmpneg
;   61    7  728   prlabel
;   62    3  729   prjump
;   63    1  730   doif
;   64    1  736   dodo
;   65    1  740   dowhile
;   66    4  743   isrelational
;   67   17  750   getlex
;   68    1  802   convertdefine
;   69    1  809   getdigit
;   70    1  818   getstring
;   71   32  821   next
;   72   78  822   istoken
;   73   36  823   expect
;   74    6  826   eprc
;   75    5  827   eprs
;   76   40  828   prc
;   77    3  833   prscomment
;   78    7  835   prnl
;   79  241  837   prs
;   80    2  842   eprnum
;   81    7  844   pint1
;   82   33  846   prunsign1
;   83   20  849   printint51
;   84    2  853   fgets1
;   85    1  857   printinputline
;   86    1  879   ifEOL
;   87    2  890   end1
;   88   51  895   error1
;   89    2  915   listproc
;   90    1  931   listcall
;   91    1  940   calllisting
;   92    1  953   countcalls
;   93    1  964   listfunc
;   94    1  978   funclisting
;   95    2  997   listvar
;   96    1 1034   epilog
;   97    1 1064   checkcalls
;   98    2 1091   parse
;   99    2 1107   getfirstchar
;  100    1 1114   getarg
;  101    1 1153   setblock
;  102 NULL 1161   main
;  103    1 1178   allocmem
;  104    1 1182   to_far
;  105    3 1190   from_far

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
;    9    66 strcpy
;   10    73 digit
;   11    79 letter
;   12    86 printName
;   13    96 prc
;   14   100 printName
;   15   110 prc
;   16   114 strlen
;   17   121 error1
;   18   128 error1
;   19   135 error1
;   20   142 checknamelen
;   21   155 checkName
;   22   165 error1
;   23   172 istoken
;   24   180 istoken
;   25   188 prs
;   26   192 prunsign1
;   27   202 prs
;   28   206 prs
;   29   210 prs
;   30   214 prs
;   31   218 prs
;   32   222 prunsign1
;   33   232 prs
;   34   236 expect
;   35   243 expect
;   36   250 error1
;   37   257 prs
;   38   261 prs
;   39   265 prs
;   40   269 strcpy
;   41   276 expect
;   42   283 istoken
;   43   291 prc
;   44   295 prscomment
;   45   306 prc
;   46   310 prs
;   47   314 strlen
;   48   321 istoken
;   49   329 prc
;   50   333 expect
;   51   340 prunsign1
;   52   350 istoken
;   53   358 expect
;   54   365 error1
;   55   372 prs
;   56   376 prs
;   57   380 prs
;   58   384 prs
;   59   388 prs
;   60   392 prs
;   61   396 istoken
;   62   404 prc
;   63   408 istoken
;   64   416 expect
;   65   423 prunsign1
;   66   433 prunsign1
;   67   443 adrofname
;   68   453 strcpy
;   69   460 strcpy
;   70   467 expect
;   71   474 adrF
;   72   479 adrofname
;   73   489 prs
;   74   493 prs
;   75   497 prc
;   76   501 pint1
;   77   507 prc
;   78   511 checkName
;   79   521 error1
;   80   528 adrofname
;   81   538 eqstr
;   82   544 adrofname
;   83   554 eqstr
;   84   560 istoken
;   85   568 istoken
;   86   576 istoken
;   87   584 istoken
;   88   592 istoken
;   89   600 istoken
;   90   608 istoken
;   91   616 istoken
;   92   624 name1
;   93   630 error1
;   94   637 getlex
;   95   644 error1
;   96   651 error1
;   97   658 strlen
;   98   665 to_far
;   99   672 error1
;  100   679 adrF
;  101   684 strcpy
;  102   691 error1
;  103   698 checkName
;  104   708 error1
;  105   715 adrF
;  106   720 strcpy
;  107   727 adrF
;  108   732 eqstr
;  109   738 checknamelen
;  110   751 strcpy
;  111   758 checkFunction
;  112   772 error1
;  113   779 storefunc
;  114   789 prs
;  115   793 prs
;  116   797 prs
;  117   801 expect
;  118   808 istoken
;  119   816 typeName
;  120   825 addlocal
;  121   834 istoken
;  122   842 expect
;  123   849 expect
;  124   856 isvariable
;  125   867 typeName
;  126   876 checknamelen
;  127   889 addlocal
;  128   898 istoken
;  129   906 expect
;  130   913 expect
;  131   920 istoken
;  132   928 expect
;  133   935 listproc
;  134   944 prs
;  135   948 mkneg
;  136   954 prunsign1
;  137   964 prs
;  138   968 istoken
;  139   976 stmt
;  140   981 prs
;  141   985 prs
;  142   989 prc
;  143   993 prs
;  144   997 prs
;  145  1001 prs
;  146  1005 strlen
;  147  1012 strcpy
;  148  1019 prs
;  149  1023 expect
;  150  1030 eqstr
;  151  1036 constantexpr
;  152  1049 checkreg
;  153  1058 doreg1
;  154  1065 exprstart
;  155  1075 prs
;  156  1079 prs
;  157  1083 expect
;  158  1090 getlex
;  159  1097 typeName
;  160  1106 searchname
;  161  1117 gettypes
;  162  1126 isrelational
;  163  1139 error1
;  164  1146 expect
;  165  1153 prs
;  166  1157 prs
;  167  1161 gettypes
;  168  1170 prs
;  169  1174 prs
;  170  1178 v
;  171  1180 prs
;  172  1184 prunsign1
;  173  1194 cmpneg
;  174  1201 prs
;  175  1205 expect
;  176  1212 eqstr
;  177  1218 expr2
;  178  1224 expr
;  179  1229 getlex
;  180  1236 typeName
;  181  1245 error1
;  182  1252 checkreg
;  183  1261 doreg1
;  184  1268 searchname
;  185  1279 gettypes
;  186  1288 error1
;  187  1295 isrelational
;  188  1308 error1
;  189  1315 istoken
;  190  1323 error1
;  191  1330 istoken
;  192  1338 prs
;  193  1342 prs
;  194  1346 prs
;  195  1350 prs
;  196  1354 prs
;  197  1358 v
;  198  1360 prs
;  199  1364 prunsign1
;  200  1374 adrofname
;  201  1384 prs
;  202  1388 prs
;  203  1392 typeName
;  204  1401 checkreg
;  205  1410 prs
;  206  1414 printreg
;  207  1423 v
;  208  1425 prs
;  209  1429 printreg
;  210  1438 error1
;  211  1445 searchname
;  212  1456 gettypes
;  213  1465 error1
;  214  1472 prs
;  215  1476 printreg
;  216  1485 error1
;  217  1492 prs
;  218  1496 a
;  219  1498 prs
;  220  1502 prs
;  221  1506 prs
;  222  1510 v
;  223  1512 adrofname
;  224  1522 prs
;  225  1526 prs
;  226  1530 error1
;  227  1537 istoken
;  228  1545 strcpy
;  229  1552 istoken
;  230  1560 strcpy
;  231  1567 istoken
;  232  1575 strcpy
;  233  1582 istoken
;  234  1590 strcpy
;  235  1597 istoken
;  236  1605 strcpy
;  237  1612 istoken
;  238  1620 strcpy
;  239  1627 istoken
;  240  1635 strcpy
;  241  1642 getlex
;  242  1649 isrelational
;  243  1662 error1
;  244  1669 strcpy
;  245  1676 prnl
;  246  1681 prs
;  247  1685 prs
;  248  1689 printreg
;  249  1698 prs
;  250  1702 istoken
;  251  1710 prunsign1
;  252  1720 typeName
;  253  1729 checkreg
;  254  1738 printreg
;  255  1747 searchname
;  256  1758 a
;  257  1760 v
;  258  1762 cmpneg
;  259  1769 prs
;  260  1773 expect
;  261  1780 strlen
;  262  1787 eqstr
;  263  1793 eqstr
;  264  1799 eqstr
;  265  1805 eqstr
;  266  1811 eqstr
;  267  1817 eqstr
;  268  1823 eqstr
;  269  1829 eqstr
;  270  1835 eqstr
;  271  1841 eqstr
;  272  1847 eqstr
;  273  1853 eqstr
;  274  1859 eqstr
;  275  1865 eqstr
;  276  1871 eqstr
;  277  1877 eqstr
;  278  1883 eqstr
;  279  1889 eqstr
;  280  1895 eqstr
;  281  1901 eqstr
;  282  1907 eqstr
;  283  1913 eqstr
;  284  1919 strlen
;  285  1926 eqstr
;  286  1932 eqstr
;  287  1938 eqstr
;  288  1944 eqstr
;  289  1950 eqstr
;  290  1956 eqstr
;  291  1962 eqstr
;  292  1968 eqstr
;  293  1974 eqstr
;  294  1980 prc
;  295  1984 prc
;  296  1988 prc
;  297  1992 istoken
;  298  2000 prs
;  299  2004 prunsign1
;  300  2014 typeName
;  301  2023 checkreg
;  302  2032 doreg1
;  303  2039 docall1
;  304  2047 isreg
;  305  2053 searchname
;  306  2064 gettypes
;  307  2073 istoken
;  308  2081 istoken
;  309  2089 expect
;  310  2096 searchname
;  311  2107 expect
;  312  2114 expect
;  313  2121 gettypes
;  314  2130 error1
;  315  2137 istoken
;  316  2145 error1
;  317  2152 prs
;  318  2156 prs
;  319  2160 prs
;  320  2164 v
;  321  2166 istoken
;  322  2174 error1
;  323  2181 prs
;  324  2185 prs
;  325  2189 prs
;  326  2193 v
;  327  2195 istoken
;  328  2203 compoundass
;  329  2215 istoken
;  330  2223 compoundass
;  331  2235 istoken
;  332  2243 compoundass
;  333  2255 istoken
;  334  2263 compoundass
;  335  2275 istoken
;  336  2283 error1
;  337  2290 istoken
;  338  2298 error1
;  339  2305 istoken
;  340  2313 expr
;  341  2318 doassign
;  342  2327 dovar1
;  343  2334 istoken
;  344  2342 rterm
;  345  2348 istoken
;  346  2356 rterm
;  347  2362 istoken
;  348  2370 rterm
;  349  2376 istoken
;  350  2384 rterm
;  351  2390 istoken
;  352  2398 rterm
;  353  2404 istoken
;  354  2412 rterm
;  355  2418 istoken
;  356  2426 domul
;  357  2432 istoken
;  358  2440 doidiv
;  359  2447 istoken
;  360  2455 domod
;  361  2461 isrelational
;  362  2474 rterm
;  363  2480 cmpneg
;  364  2487 error1
;  365  2494 prnl
;  366  2499 prs
;  367  2503 prs
;  368  2507 gettypes
;  369  2516 prs
;  370  2520 prs
;  371  2524 v
;  372  2526 prs
;  373  2530 expect
;  374  2537 prunsign1
;  375  2547 gettypes
;  376  2556 prs
;  377  2560 v
;  378  2562 prnl
;  379  2567 prs
;  380  2571 prs
;  381  2575 prs
;  382  2579 prnl
;  383  2584 prs
;  384  2588 prs
;  385  2592 a
;  386  2594 prs
;  387  2598 v
;  388  2600 prs
;  389  2604 prs
;  390  2608 prs
;  391  2612 prs
;  392  2616 prs
;  393  2620 prc
;  394  2624 printName
;  395  2634 prs
;  396  2638 prnl
;  397  2643 prs
;  398  2647 prs
;  399  2651 prs
;  400  2655 prs
;  401  2659 v
;  402  2661 istoken
;  403  2669 prnl
;  404  2674 prs
;  405  2678 prs
;  406  2682 prs
;  407  2686 prs
;  408  2690 prunsign1
;  409  2700 typeName
;  410  2709 searchname
;  411  2720 istoken
;  412  2728 searchname
;  413  2739 expect
;  414  2746 expect
;  415  2753 gettypes
;  416  2762 error1
;  417  2769 eqstr
;  418  2775 dovar1
;  419  2782 eqstr
;  420  2788 doreg
;  421  2794 eqstr
;  422  2800 doreg
;  423  2806 eqstr
;  424  2812 doreg
;  425  2818 eqstr
;  426  2824 doreg
;  427  2830 eqstr
;  428  2836 doreg
;  429  2842 eqstr
;  430  2848 doreg
;  431  2854 eqstr
;  432  2860 doreg
;  433  2866 eqstr
;  434  2872 doreg
;  435  2878 eqstr
;  436  2884 doreg
;  437  2890 eqstr
;  438  2896 doreg
;  439  2902 eqstr
;  440  2908 doreg
;  441  2914 eqstr
;  442  2920 doreg
;  443  2926 eqstr
;  444  2932 doreg
;  445  2938 eqstr
;  446  2944 doreg
;  447  2950 eqstr
;  448  2956 doreg
;  449  2962 expect
;  450  2969 prs
;  451  2973 prs
;  452  2977 prs
;  453  2981 istoken
;  454  2989 prunsign1
;  455  2999 istoken
;  456  3007 searchname
;  457  3018 v
;  458  3020 error1
;  459  3027 gettypes
;  460  3036 prs
;  461  3040 v
;  462  3042 prs
;  463  3046 prs
;  464  3050 prs
;  465  3054 a
;  466  3056 prs
;  467  3060 prs
;  468  3064 prunsign1
;  469  3074 v
;  470  3076 prs
;  471  3080 prs
;  472  3084 printName
;  473  3094 prs
;  474  3098 prs
;  475  3102 prs
;  476  3106 prs
;  477  3110 v
;  478  3112 prs
;  479  3116 prs
;  480  3120 prs
;  481  3124 v
;  482  3126 prs
;  483  3130 prs
;  484  3134 prs
;  485  3138 v
;  486  3140 prs
;  487  3144 rterm
;  488  3150 istoken
;  489  3158 prs
;  490  3162 prunsign1
;  491  3172 prs
;  492  3176 error1
;  493  3183 istoken
;  494  3191 prs
;  495  3195 prunsign1
;  496  3205 prs
;  497  3209 prs
;  498  3213 typeName
;  499  3222 searchname
;  500  3233 error1
;  501  3240 gettypes
;  502  3249 error1
;  503  3256 error1
;  504  3263 prs
;  505  3267 v
;  506  3269 prs
;  507  3273 prs
;  508  3277 doidiv
;  509  3284 prs
;  510  3288 checknamelen
;  511  3301 strcpy
;  512  3308 storecall
;  513  3318 expect
;  514  3325 istoken
;  515  3333 error1
;  516  3340 istoken
;  517  3348 istoken
;  518  3356 eprs
;  519  3361 eprs
;  520  3366 eprc
;  521  3371 eprnum
;  522  3378 eprs
;  523  3383 eprc
;  524  3388 eprs
;  525  3393 eprc
;  526  3398 eprs
;  527  3403 istoken
;  528  3411 name1
;  529  3417 searchname
;  530  3428 istoken
;  531  3436 checkreg
;  532  3445 searchname
;  533  3456 error1
;  534  3463 istoken
;  535  3471 expect
;  536  3478 prs
;  537  3482 prunsign1
;  538  3492 prs
;  539  3496 prs
;  540  3500 prc
;  541  3504 prunsign1
;  542  3514 prs
;  543  3518 v
;  544  3520 prs
;  545  3524 gettypes
;  546  3533 prs
;  547  3537 v
;  548  3539 prs
;  549  3543 v
;  550  3545 prs
;  551  3549 prs
;  552  3553 printreg
;  553  3562 prs
;  554  3566 prs
;  555  3570 prs
;  556  3574 prunsign1
;  557  3584 prs
;  558  3588 prs
;  559  3592 openR
;  560  3598 prs
;  561  3602 prs
;  562  3606 error1
;  563  3613 parse
;  564  3619 prs
;  565  3623 prs
;  566  3627 getfirstchar
;  567  3640 getlex
;  568  3647 eqstr
;  569  3653 getlex
;  570  3660 eqstr
;  571  3666 getlex
;  572  3673 prs
;  573  3677 strcpy
;  574  3684 prs
;  575  3688 error1
;  576  3695 getlex
;  577  3702 expect
;  578  3709 error1
;  579  3716 strlen
;  580  3723 error1
;  581  3730 adrofname
;  582  3740 strcpy
;  583  3747 expect
;  584  3754 istoken
;  585  3762 istoken
;  586  3770 stmt
;  587  3775 istoken
;  588  3783 doif
;  589  3788 istoken
;  590  3796 dodo
;  591  3801 istoken
;  592  3809 dowhile
;  593  3817 istoken
;  594  3825 prs
;  595  3829 name1
;  596  3835 prs
;  597  3839 expect
;  598  3846 prs
;  599  3850 next
;  600  3855 prc
;  601  3859 next
;  602  3864 getlex
;  603  3871 istoken
;  604  3879 prs
;  605  3883 next
;  606  3888 prc
;  607  3892 next
;  608  3897 getlex
;  609  3904 error1
;  610  3911 istoken
;  611  3919 doemit
;  612  3926 istoken
;  613  3934 istoken
;  614  3942 exprstart
;  615  3952 prs
;  616  3956 prs
;  617  3960 expect
;  618  3967 prs
;  619  3971 prs
;  620  3975 prc
;  621  3979 expect
;  622  3986 expect
;  623  3993 exprstart
;  624  4003 expect
;  625  4010 prs
;  626  4014 getlex
;  627  4021 prunsign1
;  628  4031 getlex
;  629  4038 prc
;  630  4042 expect
;  631  4049 prs
;  632  4053 prs
;  633  4057 prs
;  634  4061 prs
;  635  4065 prs
;  636  4069 prunsign1
;  637  4079 prs
;  638  4083 prs
;  639  4087 prunsign1
;  640  4097 prs
;  641  4101 prs
;  642  4105 prs
;  643  4109 error1
;  644  4116 prs
;  645  4120 prs
;  646  4124 prunsign1
;  647  4134 prc
;  648  4138 prs
;  649  4142 prs
;  650  4146 prunsign1
;  651  4156 pexpr
;  652  4162 pint1
;  653  4168 stmt
;  654  4173 istoken
;  655  4181 prjump
;  656  4188 prlabel
;  657  4196 stmt
;  658  4201 prlabel
;  659  4209 prlabel
;  660  4217 prlabel
;  661  4225 stmt
;  662  4230 expect
;  663  4237 pexpr
;  664  4243 pint1
;  665  4249 prjump
;  666  4256 prlabel
;  667  4264 prlabel
;  668  4272 pexpr
;  669  4278 pint1
;  670  4284 stmt
;  671  4289 prjump
;  672  4296 prlabel
;  673  4304 getlex
;  674  4311 next
;  675  4316 next
;  676  4321 next
;  677  4326 next
;  678  4331 next
;  679  4336 next
;  680  4341 next
;  681  4346 next
;  682  4351 next
;  683  4356 next
;  684  4361 next
;  685  4366 next
;  686  4371 next
;  687  4376 next
;  688  4381 next
;  689  4386 instr1
;  690  4393 next
;  691  4398 ifEOL
;  692  4404 getlex
;  693  4411 next
;  694  4416 next
;  695  4421 getlex
;  696  4428 getstring
;  697  4438 digit
;  698  4444 getdigit
;  699  4453 next
;  700  4458 next
;  701  4463 next
;  702  4468 alnum
;  703  4474 strcpy
;  704  4481 alnum
;  705  4487 next
;  706  4492 eqstr
;  707  4498 eqstr
;  708  4504 eqstr
;  709  4510 eqstr
;  710  4516 eqstr
;  711  4522 eqstr
;  712  4528 eqstr
;  713  4534 eqstr
;  714  4540 eqstr
;  715  4546 eqstr
;  716  4552 eqstr
;  717  4558 eqstr
;  718  4564 eqstr
;  719  4570 eqstr
;  720  4576 eqstr
;  721  4582 eqstr
;  722  4588 eqstr
;  723  4594 convertdefine
;  724  4608 strcpy
;  725  4615 error1
;  726  4622 adrofname
;  727  4632 eqstr
;  728  4638 next
;  729  4643 alnum
;  730  4649 next
;  731  4654 digit
;  732  4660 next
;  733  4665 next
;  734  4670 next
;  735  4675 fgets1
;  736  4682 getlex
;  737  4689 istoken
;  738  4697 prs
;  739  4701 listproc
;  740  4710 prs
;  741  4714 pint1
;  742  4720 error1
;  743  4727 eprc
;  744  4732 writetty
;  745  4741 writetty
;  746  4750 fputcR
;  747  4757 prc
;  748  4761 prs
;  749  4765 prc
;  750  4769 eprc
;  751  4774 mkneg
;  752  4780 eprnum
;  753  4787 eprc
;  754  4792 prc
;  755  4796 mkneg
;  756  4802 pint1
;  757  4808 prc
;  758  4812 prunsign1
;  759  4822 prc
;  760  4826 prc
;  761  4830 prc
;  762  4834 prc
;  763  4838 prc
;  764  4842 prunsign1
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
;Input: A.C, List: A.S,  Lines: 1200
;Glob. variables:  130 max.:  200
;Functions      :  106 max.:  300
;Calls          :  945 max.: 2000, NameField: 6005
;Const in 'expr2' :  754 max.: 3000, stacksize: 16987