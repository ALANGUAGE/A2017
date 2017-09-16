
; A.COM V0.9, Source: A.C, Output asm: A.S
org  256 
jmp main

;-1 //  .ret redefined 2011.04.25 23.644 bytes, Full  Working 2017.09.13


;-2 char Version1[]="A.COM V0.9";

Version1 db "A.COM V0.9",0

;-3 #define LSTART        200


;-4 #define VARMAX        300


;-5 #define GNAMEMAX     4800 // 16*VARMAX


;-6 #define FUNCMAX       300


;-7 #define FNAMEMAX     4800 // 16*FUNCMAX


;-8 #define CALLMAX      2000


;-9 #define IDLENMAX       15


;-10 #define _                 // Konstantvergleich


;-11 #define T_NAME        256


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


;-45 #define COMAX        3000


;-46 #define CMDLENMAX      67


;-47 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;

ORGDATAORIG dw 30000
orgData dw 30000

;-48 char co[COMAX];    int maxco=0;      int maxco1=0;

section .bss
absolute 30000
co resb 3000
section .text
maxco dw 0
maxco1 dw 0

;-49 char coname[CMDLENMAX];              char *cloc=0;

section .bss
absolute 33000
coname resb 67
section .text
cloc dw 0

;-50 int fdin=0;        int fdout=0;      char symbol[128];

fdin dw 0
fdout dw 0
section .bss
absolute 33067
symbol resb 128
section .text

;-51 char fname[CMDLENMAX];               char namein[CMDLENMAX];

section .bss
absolute 33195
fname resb 67
section .text
section .bss
absolute 33262
namein resb 67
section .text

;-52 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];

section .bss
absolute 33329
namelst resb 67
section .text
section .bss
absolute 33396
archivename resb 67
section .text

;-53 int token=0;       char globC=0;     int spalte=0;

token dw 0
globC db 0
spalte dw 0

;-54 char thechar=0;    int iscmp=0;      int nconst=0;

thechar db 0
iscmp dw 0
nconst dw 0

;-55 int nreturn=0;     int nlabel=0;    

nreturn dw 0
nlabel dw 0

;-56 int GTop=1;        int LTop=150;

GTop dw 1
LTop dw 150

;-57 unsigned int lexval=0;

lexval dw 0

;-58 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#

typei dw 0
istype db 0
section .bss
absolute 33463
GType resb 300
section .text

;-59 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S

signi dw 0
issign db 0
section .bss
absolute 33763
GSign resb 300
section .text

;-60 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4

widthi dw 0
iswidth db 0
section .bss
absolute 34063
GWidth resb 300
section .text

;-61              int GAdr[VARMAX]; int  GUsed [VARMAX];

section .bss
absolute 34363
GAdr resw 300
section .text
section .bss
absolute 34963
GUsed resw 300
section .text

;-62 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];

wi dw 0
section .bss
absolute 35563
GData resw 300
section .text
section .bss
absolute 36163
GNameField resb 4800
section .text

;-63 int  FTop=0;                 int  CTop=0;

FTop dw 0
CTop dw 0

;-64 char FType [FUNCMAX];        char CType[CALLMAX];

section .bss
absolute 40963
FType resb 300
section .text
section .bss
absolute 41263
CType resb 2000
section .text

;-65 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];

section .bss
absolute 43263
FAdr resw 300
section .text
section .bss
absolute 43863
CAdr resw 2000
section .text

;-66 int  FCalls[FUNCMAX];

section .bss
absolute 47863
FCalls resw 300
section .text

;-67 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];

section .bss
absolute 48463
FNameField resb 4800
section .text

;-68 char NameA[]="12345678901234567890123456789012"; //must be in low memory

NameA db "12345678901234567890123456789012",0

;-69 char fgetsdest[128];         unsigned char *CNameTop=0;

section .bss
absolute 53263
fgetsdest resb 128
section .text
CNameTop dw 0

;-70 unsigned char *fgetsp=0;     unsigned int segE;

fgetsp dw 0
segE dw 0

;-71 unsigned int lineno=1;       unsigned int linenoinclude=1;

lineno dw 1
linenoinclude dw 1

;-72 unsigned char *pt=0;         unsigned char *p1=0;

pt dw 0
p1 dw 0

;-73 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;

DOS_ERR dw 0
DOS_NoBytes dw 0
DOS_ByteRead db 0

;-74 


;-75 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); } 


writetty:  ; *** PROC ***
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-76 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }

 ret
; ENDP

putch:  ; *** PROC ***
;Function : putch, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte    76 NULL c = bp+4;
 ENTER  0,0 ; constant expression
cmp byte[bp+4], 10
 jne .putch1
 mov  al, 13
 call writetty
.putch1:
 mov  al, [bp+4]
 call writetty

;-77 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
; ENDP

cputs:  ; *** PROC ***
;Function : cputs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    77 NULL s = bp+4
;  201 var sign byte    77 NULL c = bp-2;
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

;-78 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
; ENDP

mkneg:  ; *** PROC ***
;Function : mkneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word    78 NULL n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-79 


;-80 int DosInt() { 
 LEAVE
 ret
; ENDP

DosInt:  ; *** PROC ***

;-81     __emit__(0xCD,0x21);//inth 0x21; 

 db 205,33

;-82     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-83     DOS_ERR++;

 inc  word[DOS_ERR]

;-84 }


;-85 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
; ENDP

openR:  ; *** PROC ***
;Function : openR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    85 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-86 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
; ENDP

creatR:  ; *** PROC ***
;Function : creatR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    86 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-87 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
; ENDP

fcloseR:  ; *** PROC ***
;Function : fcloseR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word    87 NULL fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-88 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
; ENDP

exitR:  ; *** PROC ***
;Function : exitR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte    88 NULL c = bp+4;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-89 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
 LEAVE
 ret
; ENDP

readRL:  ; *** PROC ***
;Function : readRL, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    89 NULL s = bp+4
;  201 var sign word    89 NULL fd = bp+6
;  202 var sign word    89 NULL len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-90 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
; ENDP

fputcR:  ; *** PROC ***
;Function : fputcR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    90 NULL n = bp+4
;  201 var sign word    90 NULL fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]

;-91   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-92 


;-93 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
 LEAVE
 ret
; ENDP

strlen:  ; *** PROC ***
;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    93 NULL s = bp+4
;  201 var sign word    93 NULL c = bp-2;
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

;-94 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }

 .retnstrlen: LEAVE
 ret
; ENDP

strcpy:  ; *** PROC ***
;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    94 NULL s = bp+4
;  201 ptr sign byte    94 NULL t = bp+6;
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

;-95 int eqstr(char *p, char *q) { while(*p) {
 LEAVE
 ret
; ENDP

eqstr:  ; *** PROC ***
;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    95 NULL p = bp+4
;  201 ptr sign byte    95 NULL q = bp+6;
 ENTER  0,0
.eqstr8:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr9

;-96     if (*p != *q) return 0; p++; q++; }

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

;-97     if(*q) return 0; return 1; }

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

;-98 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}

 .retneqstr: LEAVE
 ret
; ENDP

instr1:  ; *** PROC ***
;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    98 NULL s = bp+4
;  201 var sign byte    98 NULL c = bp+6;
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

;-99 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }

 .retninstr1: LEAVE
 ret
; ENDP

strcat1:  ; *** PROC ***
;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    99 NULL s = bp+4
;  201 ptr sign byte    99 NULL t = bp+6;
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

;-100 int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
 LEAVE
 ret
; ENDP

toupper:  ; *** PROC ***
;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   100 NULL s = bp+4;
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

;-101 int pint (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint:  ; *** PROC ***
;Function : pint, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   101 NULL n = bp+4
;  201 var sign word   101 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint21
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-102   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }

.pint21:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint22
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint
 add  sp, 2
.pint22:
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
 call putch
 add  sp, 2

;-103 int digit(char c){ 
 LEAVE
 ret
; ENDP

digit:  ; *** PROC ***

;-104     if(c<'0') return 0; 

;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   103 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit23
 mov ax, 0
 jmp .retndigit

;-105     if(c>'9') return 0; 

.digit23:
 mov al, [bp+4]
 cmp al, 57
 jle .digit24
 mov ax, 0
 jmp .retndigit

;-106     return 1; 

.digit24:
 mov ax, 1
 jmp .retndigit

;-107 }


;-108 int letter(char c) { 

 .retndigit: LEAVE
 ret
; ENDP

letter:  ; *** PROC ***

;-109     if (c=='_') return 1;

;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   108 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter25
 mov ax, 1
 jmp .retnletter

;-110     if (c=='.') return 1;

.letter25:
 mov al, [bp+4]
 cmp al, 46
 jne .letter26
 mov ax, 1
 jmp .retnletter

;-111     if (c=='?') return 1;

.letter26:
 mov al, [bp+4]
 cmp al, 63
 jne .letter27
 mov ax, 1
 jmp .retnletter

;-112     if (c=='$') return 1;

.letter27:
 mov al, [bp+4]
 cmp al, 36
 jne .letter28
 mov ax, 1
 jmp .retnletter

;-113     if (c> 'z') return 0; 

.letter28:
 mov al, [bp+4]
 cmp al, 122
 jle .letter29
 mov ax, 0
 jmp .retnletter

;-114     if (c< '@') return 0;// at included

.letter29:
 mov al, [bp+4]
 cmp al, 64
 jge .letter30
 mov ax, 0
 jmp .retnletter

;-115     if (c> 'Z') { if (c< 'a') return 0; }  

.letter30:
 mov al, [bp+4]
 cmp al, 90
 jle .letter31
 mov al, [bp+4]
 cmp al, 97
 jge .letter32
 mov ax, 0
 jmp .retnletter
.letter32:

;-116     return 1; 

.letter31:
 mov ax, 1
 jmp .retnletter

;-117 }    


;-118 int alnum(char c) {

 .retnletter: LEAVE
 ret
; ENDP

alnum:  ; *** PROC ***

;-119   if (digit (c)) return 1;

;Function : alnum, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   118 NULL c = bp+4;
 ENTER  0,0
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .alnum33
 mov ax, 1
 jmp .retnalnum

;-120   if (letter(c)) return 1;

.alnum33:
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je .alnum34
 mov ax, 1
 jmp .retnalnum

;-121   return 0;

.alnum34:
 mov ax, 0
 jmp .retnalnum

;-122 }       


;-123 int a(unsigned int i) {  printName(i);}//address

 .retnalnum: LEAVE
 ret
; ENDP

a:  ; *** PROC ***
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   123 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-124 int v(unsigned int i) {//value 
 LEAVE
 ret
; ENDP

v:  ; *** PROC ***

;-125     if (i < LSTART) prc('['); 

;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   124 NULL i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v35
 push 91
 call prc
 add  sp, 2

;-126     printName(i);

.v35:
 push word [bp+4]
 call printName
 add  sp, 2

;-127     if (i < LSTART) prc(']');   

 mov ax, [bp+4]
 cmp ax, 200
 jge .v36
 push 93
 call prc
 add  sp, 2

;-128 }

.v36:

;-129 int checknamelen() { int i;    i=strlen(symbol);
 LEAVE
 ret
; ENDP

checknamelen:  ; *** PROC ***
;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   129 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-130   if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen37
 push checknamelen_0
 call error1
 add  sp, 2

;-131 }

.checknamelen37:

;-132 char doglobName[IDLENMAX];
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
; ENDP
section .bss
absolute 53391
doglobName resb 15
section .text

;-133 int doglob() { int i; int j; int isstrarr; isstrarr=0;


doglob:  ; *** PROC ***
;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   133 NULL i = bp-2
;  201 var sign word   133 NULL j = bp-4
;  202 var sign word   133 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-134   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob38
 push doglob_0
 call error1
 add  sp, 2

;-135   if (iswidth == 0) error1("no VOID as var type");

.doglob38:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob39
 push doglob_1
 call error1
 add  sp, 2

;-136   checknamelen();

.doglob39:
 call checknamelen

;-137   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob40
 push doglob_2
 call error1
 add  sp, 2

;-138   if (istoken('[')) { istype='&';

.doglob40:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob41
 mov ax, 38
 mov byte [istype], al

;-139     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob42

;-140       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-141       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-142       prs("\n"); prs(symbol); 

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-143       if (iswidth==1) prs(" resb "); 

 mov al, [iswidth]
 cmp al, 1
 jne .doglob43
 push doglob_5
 call prs
 add  sp, 2

;-144       if (iswidth==2) prs(" resw ");

.doglob43:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob44
 push doglob_6
 call prs
 add  sp, 2

;-145       if (iswidth==4) prs(" resd ");

.doglob44:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob45
 push doglob_7
 call prs
 add  sp, 2

;-146       prunsign1(lexval); 

.doglob45:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-147       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-148       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-149       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob46
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-150       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob46:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob47
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-151       GData[GTop]=lexval; expect(']');

.doglob47:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-152     }else { expect(']');

 jmp .doglob48
.doglob42:
 push 93
 call expect
 add  sp, 2

;-153       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob49
 push doglob_9
 call error1
 add  sp, 2

;-154       prs("\n"); prs(symbol); prs(" db "); 

.doglob49:
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

;-155       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-156       expect('='); 

 push 61
 call expect
 add  sp, 2

;-157       if (istoken(T_STRING)) { 

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob50

;-158         prc(34); prscomment(symbol); prc(34); prs(",0"); 

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

;-159         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-160       else if (istoken('{' )) { i=0;

 jmp .doglob51
.doglob50:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob52
 mov ax, 0
 mov [bp-2], ax

;-161         do { if(i) prc(','); 

.doglob53:
 mov ax, [bp-2]
 or  al, al
 je .doglob54
 push 44
 call prc
 add  sp, 2

;-162           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob54:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-163         while (istoken(',')); expect('}'); }  

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob55
 jmp .doglob53
.doglob55:
 push 125
 call expect
 add  sp, 2

;-164       else error1("String or number array expected");

 jmp .doglob56
.doglob52:
 push doglob_13
 call error1
 add  sp, 2

;-165       }; 

.doglob56:
.doglob51:
.doglob48:

;-166   }else { //expect('=');

 jmp .doglob57
.doglob41:

;-167     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob58
 push doglob_15
 call prs
 add  sp, 2

;-168     else {

 jmp .doglob59
.doglob58:

;-169       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob60
 push doglob_16
 call prs
 add  sp, 2

;-170       else if (iswidth==2) prs(" dw ");

 jmp .doglob61
.doglob60:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob62
 push doglob_17
 call prs
 add  sp, 2

;-171       else                 prs(" dd ");

 jmp .doglob63
.doglob62:
 push doglob_18
 call prs
 add  sp, 2

;-172     }

.doglob63:
.doglob61:

;-173     if(istoken('-')) prc('-');

.doglob59:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob64
 push 45
 call prc
 add  sp, 2

;-174     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob64:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob65
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-175     else prunsign1(0); }

 jmp .doglob66
.doglob65:
 push 0
 call prunsign1
 add  sp, 2
.doglob66:

;-176   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob57:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-177   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-178   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-179   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob67
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob68
.doglob67:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-180   GTop++; expect(';'); }

.doglob68:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-181 


;-182 int gettypes(int i) {int j; char c;
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
; ENDP

gettypes:  ; *** PROC ***

;-183   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   182 NULL i = bp+4
;  201 var sign word   182 NULL j = bp-2
;  202 var sign byte   182 NULL c = bp-4;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes69
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes70
.gettypes69:
 mov ax, 0
 mov word [signi], ax

;-184   c=GWidth[i]; widthi=0;wi=0;

.gettypes70:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-185   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes71
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-186   if (c==2) {widthi=2;wi=2;}

.gettypes71:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes72
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-187   if (c==4) {widthi=4;wi=4;}

.gettypes72:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes73
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-188   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes73:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes74
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-189   if (c=='&')  typei=2;  

.gettypes74:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes75
 mov ax, 2
 mov word [typei], ax

;-190   return i; }  

.gettypes75:
 mov ax, [bp+4]
 jmp .retngettypes

;-191 int adrofname(unsigned int i) { adrF(GNameField, i); }

 .retngettypes: LEAVE
 ret
; ENDP

adrofname:  ; *** PROC ***
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   191 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-192 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
; ENDP

adrF:  ; *** PROC ***
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   192 NULL s = bp+4
;  201 var unsg word   192 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-193   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-194 int printName(unsigned int i) {int j;
 LEAVE
 ret
; ENDP

printName:  ; *** PROC ***

;-195   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   194 NULL i = bp+4
;  201 var sign word   194 NULL j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName76
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-196   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp .printName77
.printName76:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle .printName78
 push 43
 call prc
 add  sp, 2
.printName78:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-197 }

.printName77:

;-198 int searchname() { unsigned int i;
 LEAVE
 ret
printName_0 db "[bp",0
; ENDP

searchname:  ; *** PROC ***

;-199   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   198 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname79
 push searchname_0
 call error1
 add  sp, 2

;-200   GUsed[i]=GUsed[i] + 1; return i;

.searchname79:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp .retnsearchname

;-201 }


;-202 int checkName() { unsigned int i; unsigned int j;

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
; ENDP

checkName:  ; *** PROC ***

;-203   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   202 NULL i = bp-2
;  201 var unsg word   202 NULL j = bp-4;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
.checkName80:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName81
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
 je .checkName82
 mov ax, [bp-2]
 jmp .retncheckName
.checkName82:
 inc  word[bp-2]

;-204   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp .checkName80
.checkName81:
 mov ax, 1
 mov [bp-2], ax
.checkName83:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName84
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
 je .checkName85
 mov ax, [bp-2]
 jmp .retncheckName
.checkName85:
 inc  word[bp-2]

;-205   return 0;

 jmp .checkName83
.checkName84:
 mov ax, 0
 jmp .retncheckName

;-206 }    


;-207 int typeName() { int m; //0=V,1=*,2=&

 .retncheckName: LEAVE
 ret
; ENDP

typeName:  ; *** PROC ***

;-208     issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   207 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-209     if(istoken(T_SIGNED))   issign='S';  

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName86
 mov ax, 83
 mov byte [issign], al

;-210     if(istoken(T_UNSIGNED)) issign='U';

.typeName86:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName87
 mov ax, 85
 mov byte [issign], al

;-211     iswidth=2;                           

.typeName87:
 mov ax, 2
 mov byte [iswidth], al

;-212     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName88
 mov ax, 0
 mov byte [iswidth], al

;-213     if(istoken(T_CHAR))     iswidth=1;   

.typeName88:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName89
 mov ax, 1
 mov byte [iswidth], al

;-214     if(istoken(T_INT))      iswidth=2;

.typeName89:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName90
 mov ax, 2
 mov byte [iswidth], al

;-215     if(istoken(T_LONG))     iswidth=4;

.typeName90:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName91
 mov ax, 4
 mov byte [iswidth], al

;-216     istype='V'; 

.typeName91:
 mov ax, 86
 mov byte [istype], al

;-217     m=0;

 mov ax, 0
 mov [bp-2], ax

;-218     if(istoken('*'))  {istype='*'; m=1;} 

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName92
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-219     if(istoken('&'))  {istype='&'; m=2;}

.typeName92:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName93
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-220     name1(); 

.typeName93:
 call name1

;-221     return m; 

 mov ax, [bp-2]
 jmp .retntypeName

;-222 }


;-223 int name1() {

 .retntypeName: LEAVE
 ret
; ENDP

name1:  ; *** PROC ***

;-224     if (token!=T_NAME) error1("Name expected"); 

 mov ax, [token]
 cmp ax, 256
 je  .name194
 push name1_0
 call error1
 add  sp, 2

;-225     token=getlex(); 

.name194:
 call getlex
 mov word [token], ax

;-226 }


;-227 


;-228 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");

 ret
name1_0 db "Name expected",0
; ENDP

storecall:  ; *** PROC ***
;Function : storecall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   228 NULL i = bp-2;
 ENTER  2,0
 mov ax, [CTop]
 cmp ax, 2000 ;unsigned : 1
 jl  .storecall95
 push storecall_0
 call error1
 add  sp, 2

;-229   if (CNameTop >= 65468) error1("Call name table fuill");

.storecall95:
 mov ax, [CNameTop]
 cmp ax, 65468 ;unsigned : 0
 jb  .storecall96
 push storecall_1
 call error1
 add  sp, 2

;-230     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

.storecall96:
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

;-231     to_far(CNameTop, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNameTop]
 call to_far
 add  sp, 4

;-232     CNameTop=CNameTop+i; CNameTop++; CTop++;

 mov ax, [CNameTop]
 add ax, [bp-2]
 mov word [CNameTop], ax
 inc  word[CNameTop]
 inc  word[CTop]

;-233 }


;-234 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0
; ENDP

storefunc:  ; *** PROC ***
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc97
 push storefunc_0
 call error1
 add  sp, 2

;-235     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc97:
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

;-236     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-237 }


;-238 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
; ENDP

addlocal:  ; *** PROC ***
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal98
 push addlocal_0
 call error1
 add  sp, 2

;-239   if (checkName() != 0) error1("Variable already defined");

.addlocal98:
 call checkName
 cmp ax, 0
 je  .addlocal99
 push addlocal_1
 call error1
 add  sp, 2

;-240   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal99:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-241   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-242   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-243 }


;-244 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
; ENDP

checkFunction:  ; *** PROC ***
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   244 NULL i = bp-2
;  201 var unsg word   244 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-245   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

.checkFunction100:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction101
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
 je .checkFunction102
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction102:
 inc  word[bp-2]

;-246   return 0; }

 jmp .checkFunction100
.checkFunction101:
 mov ax, 0
 jmp .retncheckFunction

;-247 int dofunc() { int nloc; int i; int narg;  

 .retncheckFunction: LEAVE
 ret
; ENDP

dofunc:  ; *** PROC ***

;-248   cloc=&co; 

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   247 NULL nloc = bp-2
;  201 var sign word   247 NULL i = bp-4
;  202 var sign word   247 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-249   checknamelen();

 call checknamelen

;-250   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-251   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc103
 push dofunc_0
 call error1
 add  sp, 2

;-252   storefunc();

.dofunc103:
 call storefunc

;-253   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");

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

;-254   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-255   if (istoken(')')==0) { narg=2; 

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc104
 mov ax, 2
 mov [bp-6], ax

;-256     do { typeName();  addlocal(); narg+=2;

.dofunc105:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-257          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc106
 add  word[bp-6], 2
.dofunc106:
 inc  word[LTop]

;-258     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc107
 jmp .dofunc105
.dofunc107:
 push 41
 call expect
 add  sp, 2

;-259     


;-260   expect('{'); /*body*/

.dofunc104:
 push 123
 call expect
 add  sp, 2

;-261   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-262   while(isvariable()) {

.dofunc108:
 call isvariable
 or  al, al
 je .dofunc109

;-263     do {typeName();

.dofunc110:
 call typeName

;-264         checknamelen();

 call checknamelen

;-265         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-266         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc111
 sub  word[bp-2], 2

;-267         GData[LTop]=nloc;

.dofunc111:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-268         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc112
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

;-269             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-270         LTop++;

.dofunc112:
 inc  word[LTop]

;-271       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc113
 jmp .dofunc110
.dofunc113:
 push 59
 call expect
 add  sp, 2

;-272   listproc(); 

 jmp .dofunc108
.dofunc109:
 call listproc

;-273   if (LTop>LSTART){prs(";\n ENTER  "); 

 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc114
 push dofunc_3
 call prs
 add  sp, 2

;-274     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
 push dofunc_4
 call prs
 add  sp, 2

;-275   while(istoken('}')==0)   stmt();

.dofunc114:
.dofunc115:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc116
 call stmt

;-276   if (nreturn) { 

 jmp .dofunc115
.dofunc116:
 mov ax, [nreturn]
 or  al, al
 je .dofunc117

;-277         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-278         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-279         prc(':');

 push 58
 call prc
 add  sp, 2

;-280         }


;-281   if (LTop > LSTART) prs(" LEAVE");

.dofunc117:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc118
 push dofunc_6
 call prs
 add  sp, 2

;-282   prs("\n ret"); 

.dofunc118:
 push dofunc_7
 call prs
 add  sp, 2

;-283   *cloc=0; prs(co); 

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-284   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-285   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc119
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-286   prs("\n; ENDP"); 

.dofunc119:
 push dofunc_8
 call prs
 add  sp, 2

;-287 }


;-288 int isvariable() {
 LEAVE
 ret
dofunc_0 db "Function already defined",0
dofunc_1 db "\n\n",0
dofunc_2 db ":  ; *** PROC ***",0
dofunc_3 db ";\n ENTER  ",0
dofunc_4 db ",0",0
dofunc_5 db "\n .retn",0
dofunc_6 db " LEAVE",0
dofunc_7 db "\n ret",0
dofunc_8 db "\n; ENDP",0
; ENDP

isvariable:  ; *** PROC ***

;-289     if(token==T_SIGNED)   goto v1;   

 mov ax, [token]
 cmp ax, 531
 jne .isvariable120
 jmp .v1

;-290     if(token==T_UNSIGNED) goto v1;

.isvariable120:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable121
 jmp .v1

;-291     if(token==T_CHAR)     goto v1;   

.isvariable121:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable122
 jmp .v1

;-292     if(token==T_INT)      goto v1;

.isvariable122:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable123
 jmp .v1

;-293     if(token==T_LONG)     goto v1;

.isvariable123:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable124
 jmp .v1

;-294     return 0;  

.isvariable124:
 mov ax, 0
 jmp .retnisvariable

;-295 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-296 }


;-297                   


;-298 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;

 .retnisvariable:
 ret
; ENDP
mod1 dw 0
ireg1 dw 0
idx1 dw 0
ids1 dw 0
idw1 dw 0
idt1 dw 0
val1 dw 0

;-299 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

mod2 dw 0
ireg2 dw 0
idx2 dw 0
ids2 dw 0
idw2 dw 0
idt2 dw 0
val2 dw 0

;-300 


;-301 int pexpr() {expect('('); iscmp=0; 


pexpr:  ; *** PROC ***
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-302   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr125
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr126
 call constantexpr
 jmp .retnpexpr

;-303     ireg1=checkreg();

.pexpr126:
 call checkreg
 mov word [ireg1], ax

;-304     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr127
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr127:

;-305   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

.pexpr125:
 call exprstart
 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr128
 push pexpr_1
 call prs
 add  sp, 2
.pexpr128:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-306   expect(')'); }           /*error1("Vergleich fehlt");*/

 push 41
 call expect
 add  sp, 2

;-307 


;-308 int constantexpr() { int mode; int id1;int ids;

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
; ENDP

constantexpr:  ; *** PROC ***

;-309   token=getlex();   mode=typeName();  

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   308 NULL mode = bp-2
;  201 var sign word   308 NULL id1 = bp-4
;  202 var sign word   308 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-310   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-311   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr129
 push constantexpr_0
 call error1
 add  sp, 2

;-312   expect(T_CONST);  prs(" ; constant expression");

.constantexpr129:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-313   prs("\ncmp "); 

 push constantexpr_2
 call prs
 add  sp, 2

;-314   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr130
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr131
.constantexpr130:
 push constantexpr_4
 call prs
 add  sp, 2

;-315   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr131:
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

;-316   expect(')');

 push 41
 call expect
 add  sp, 2

;-317 }  


;-318 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
 LEAVE
 ret
constantexpr_0 db "Relational expression expected",0
constantexpr_1 db " ; constant expression",0
constantexpr_2 db "\ncmp ",0
constantexpr_3 db "word",0
constantexpr_4 db "byte",0
constantexpr_5 db ", ",0
; ENDP

exprstart:  ; *** PROC ***
 push exprstart_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .exprstart132
 push 0
 call expr2
 add  sp, 2
 jmp .exprstart133
.exprstart132:
 push 0
 call expr
 add  sp, 2
.exprstart133:

;-319 


;-320 int expr2(int kind) {  int i;

 ret
exprstart_0 db "_",0
; ENDP

expr2:  ; *** PROC ***

;-321   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   320 NULL kind = bp+4
;  201 var sign word   320 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  .expr2134
 call getlex
 mov word [token], ax

;-322   mod1=typeName();

.expr2134:
 call typeName
 mov word [mod1], ax

;-323   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je .expr2135
 push expr2_0
 call error1
 add  sp, 2

;-324   ireg1=checkreg();

.expr2135:
 call checkreg
 mov word [ireg1], ax

;-325   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr2136
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr2

;-326   if (ireg1 == 0) { idx1=searchname();

.expr2136:
 mov ax, [ireg1]
 cmp ax, 0
 jne .expr2137
 call searchname
 mov word [idx1], ax

;-327     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-328     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je .expr2138
 push expr2_1
 call error1
 add  sp, 2
.expr2138:

;-329   


;-330   if (isrelational()) { error1("Vergleich noch nicht implementiert");

.expr2137:
 call isrelational
 or  al, al
 je .expr2139
 push expr2_2
 call error1
 add  sp, 2

;-331   }


;-332   if (istoken('=') == 0) error1("Assign expected");

.expr2139:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expr2140
 push expr2_3
 call error1
 add  sp, 2

;-333   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

.expr2140:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr2141
 mov ax, [lexval]
 mov word [val2], ax
 push expr2_4
 call prs
 add  sp, 2

;-334     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-335     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne .expr2142
 push expr2_6
 call prs
 add  sp, 2

;-336     if (idw1 == 2) prs("word ");

.expr2142:
 mov ax, [idw1]
 cmp ax, 2
 jne .expr2143
 push expr2_7
 call prs
 add  sp, 2

;-337     if (idw1 == 4) prs("dword ");

.expr2143:
 mov ax, [idw1]
 cmp ax, 4
 jne .expr2144
 push expr2_8
 call prs
 add  sp, 2

;-338     v(idx1);

.expr2144:
 push word [idx1]
 call v
 add  sp, 2

;-339     prs(", "); prunsign1(val2);

 push expr2_9
 call prs
 add  sp, 2
 push word [val2]
 call prunsign1
 add  sp, 2

;-340     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

 mov ax, [idx1]
 cmp ax, 200 ;unsigned : 1
 jl  .expr2145
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
.expr2145:
 jmp .retnexpr2

;-341   


;-342   mod1=typeName(); ireg2=checkreg();

.expr2141:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-343   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je .expr2146
 push expr2_11
 call prs
 add  sp, 2

;-344     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}

 mov ax, [ireg1]
 or  al, al
 je .expr2147
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp .expr2148
.expr2147:
 push word [idx1]
 call v
 add  sp, 2
.expr2148:
 push expr2_12
 call prs
 add  sp, 2
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .retnexpr2

;-345   else {

 jmp .expr2149
.expr2146:

;-346     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne .expr2150
 push expr2_13
 call error1
 add  sp, 2

;-347     


;-348     idx2=searchname();

.expr2150:
 call searchname
 mov word [idx2], ax

;-349     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-350     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne .expr2151
 push expr2_14
 call error1
 add  sp, 2

;-351     prs("\nmov ");

.expr2151:
 push expr2_15
 call prs
 add  sp, 2

;-352     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");

 mov ax, [ireg1]
 or  al, al
 je .expr2152
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp .expr2153
.expr2152:
 push expr2_16
 call error1
 add  sp, 2

;-353     prs(", ");

.expr2153:
 push expr2_17
 call prs
 add  sp, 2

;-354     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne .expr2154
 push word [idx2]
 call a
 add  sp, 2

;-355     else {

 jmp .expr2155
.expr2154:

;-356       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne .expr2156
 push expr2_18
 call prs
 add  sp, 2

;-357       if (idw2 == 2) prs("word ");

.expr2156:
 mov ax, [idw2]
 cmp ax, 2
 jne .expr2157
 push expr2_19
 call prs
 add  sp, 2

;-358       if (idw2 == 4) prs("dword ");

.expr2157:
 mov ax, [idw2]
 cmp ax, 4
 jne .expr2158
 push expr2_20
 call prs
 add  sp, 2

;-359       v(idx2);

.expr2158:
 push word [idx2]
 call v
 add  sp, 2

;-360       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

 mov ax, [idx2]
 cmp ax, 200 ;unsigned : 1
 jl  .expr2159
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
.expr2159:

;-361     return;

.expr2155:
 jmp .retnexpr2

;-362   } error1("Internal error: only const or reg allowed");

.expr2149:
 push expr2_22
 call error1
 add  sp, 2

;-363 }


;-364 char ops[5];

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
; ENDP
section .bss
absolute 53406
ops resb 5
section .text

;-365 int doreg1(int iscmp1) { int i;


doreg1:  ; *** PROC ***

;-366   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   365 NULL iscmp1 = bp+4
;  201 var sign word   365 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1160
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-367   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1160:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1161
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-368   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1161:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1162
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-369   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1162:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1163
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-370   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1163:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1164
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-371   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1164:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1165
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-372   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1165:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1166
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-373   if (iscmp1 == 1) { token=getlex();

.doreg1166:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1167
 call getlex
 mov word [token], ax

;-374       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1168
 push doreg1_7
 call error1
 add  sp, 2

;-375       strcpy(ops, "cmp"); }

.doreg1168:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-376   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1167:
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

;-377 


;-378   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1169
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-379   mod2=typeName(); ireg2=checkreg();

.doreg1169:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-380   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1170
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-381   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1170:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1171
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1172
.doreg1171:
 push word [bp-2]
 call v
 add  sp, 2

;-382   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1172:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1173
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

;-383 }

.doreg1173:

;-384 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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
; ENDP

checkreg:  ; *** PROC ***

;-385   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg174
 mov ax, 0
 jmp .retncheckreg

;-386   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg174:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg175
 mov ax, 1
 jmp .retncheckreg
.checkreg175:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg176
 mov ax, 3
 jmp .retncheckreg

;-387   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg176:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg177
 mov ax, 5
 jmp .retncheckreg
.checkreg177:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg178
 mov ax, 7
 jmp .retncheckreg

;-388   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg178:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg179
 mov ax, 9
 jmp .retncheckreg
.checkreg179:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg180
 mov ax, 11
 jmp .retncheckreg

;-389   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg180:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg181
 mov ax, 13
 jmp .retncheckreg
.checkreg181:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg182
 mov ax, 15
 jmp .retncheckreg

;-390   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg182:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg183
 mov ax, 17
 jmp .retncheckreg
.checkreg183:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg184
 mov ax, 19
 jmp .retncheckreg

;-391   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg184:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg185
 mov ax, 21
 jmp .retncheckreg
.checkreg185:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg186
 mov ax, 23
 jmp .retncheckreg

;-392   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg186:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg187
 mov ax, 25
 jmp .retncheckreg
.checkreg187:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg188
 mov ax, 27
 jmp .retncheckreg

;-393   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg188:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg189
 mov ax, 29
 jmp .retncheckreg
.checkreg189:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg190
 mov ax, 31
 jmp .retncheckreg

;-394   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg190:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg191
 mov ax, 33
 jmp .retncheckreg
.checkreg191:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg192
 mov ax, 35
 jmp .retncheckreg

;-395   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg192:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg193
 mov ax, 37
 jmp .retncheckreg
.checkreg193:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg194
 mov ax, 39
 jmp .retncheckreg

;-396   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg194:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg195
 mov ax, 41
 jmp .retncheckreg
.checkreg195:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg196
 mov ax, 43
 jmp .retncheckreg

;-397   // (eqstr(symbol,"ip")) return 45;


;-398   if (strlen(symbol) >   3) return 0;

.checkreg196:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg197
 mov ax, 0
 jmp .retncheckreg

;-399   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg197:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 47
 jmp .retncheckreg
.checkreg198:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 50
 jmp .retncheckreg

;-400   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg199:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 53
 jmp .retncheckreg
.checkreg200:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 56
 jmp .retncheckreg

;-401   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg201:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 59
 jmp .retncheckreg
.checkreg202:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 62
 jmp .retncheckreg

;-402   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg203:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 65
 jmp .retncheckreg
.checkreg204:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 68
 jmp .retncheckreg

;-403   if (eqstr(symbol,"cr0")) return 71;

.checkreg205:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 71
 jmp .retncheckreg

;-404   return 0;   }

.checkreg206:
 mov ax, 0
 jmp .retncheckreg

;-405 char printregstr[]

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
; ENDP

;-406 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-407 //          1         2         3         4         5         6         7


;-408 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-409 int printreg(int i) {  unsigned int k; unsigned char c;


printreg:  ; *** PROC ***

;-410   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   409 NULL i = bp+4
;  201 var unsg word   409 NULL k = bp-2
;  202 var unsg byte   409 NULL c = bp-4;
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

;-411   k = &printregstr + i; c=*k; prc(c);

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

;-412   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg207
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

;-413 }

.printreg207:

;-414 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
; ENDP
evalue dw 0
exprtype dw 10

;-415 int expr(int isRight)


expr:  ; *** PROC ***

;-416 { int mode; int id1;     int ixarr; int ixconst;


;-417   int ids;  int isCONST; int i;     unsigned char *p;


;-418   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   415 NULL isRight = bp+4
;  201 var sign word   416 NULL mode = bp-2
;  202 var sign word   416 NULL id1 = bp-4
;  203 var sign word   416 NULL ixarr = bp-6
;  204 var sign word   416 NULL ixconst = bp-8
;  205 var sign word   417 NULL ids = bp-10
;  206 var sign word   417 NULL isCONST = bp-12
;  207 var sign word   417 NULL i = bp-14
;  208 ptr unsg byte   417 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr208
 mov ax, [lexval]
 mov word [evalue], ax

;-419     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-420   mode=typeName(); /*0=V,1=*,2=&*/

.expr208:
 call typeName
 mov [bp-2], ax

;-421   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-422   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr209
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-423   if (token=='(')  {docall1(); goto e1; }

.expr209:
 mov ax, [token]
 cmp ax, 40
 jne .expr210
 call docall1
 jmp .e1

;-424   if (isreg()) goto e1;

.expr210:
 call isreg
 or  al, al
 je .expr211
 jmp .e1

;-425 


;-426   id1=searchname(); gettypes(id1); ids=signi;

.expr211:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-427   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-428     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr212
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr213

;-429       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-430     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr214
.expr213:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-431     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-432     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr215
 push expr_1
 call error1
 add  sp, 2
.expr215:
.expr214:

;-433   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

.expr212:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr216
 mov ax, [bp-2]
 or  al, al
 je .expr217
 push expr_2
 call error1
 add  sp, 2

;-434      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr217:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr218
 push expr_4
 call prs
 add  sp, 2
 jmp .expr219
.expr218:
 push expr_5
 call prs
 add  sp, 2

;-435      v(id1); goto e1;}

.expr219:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-436   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

.expr216:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr220
 mov ax, [bp-2]
 or  al, al
 je .expr221
 push expr_6
 call error1
 add  sp, 2

;-437      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr221:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr222
 push expr_8
 call prs
 add  sp, 2
 jmp .expr223
.expr222:
 push expr_9
 call prs
 add  sp, 2

;-438      v(id1); goto e1;}

.expr223:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-439        


;-440   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr220:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr224
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-441   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr224:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr225
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-442   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr225:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr226
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-443   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    

.expr226:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr227
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-444   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr227:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr228
 push expr_14
 call error1
 add  sp, 2

;-445   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr228:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr229
 push expr_15
 call error1
 add  sp, 2

;-446 


;-447   if (istoken('=')) { exprtype= expr(1); 

.expr229:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr230
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-448   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-449   dovar1(mode, "mov", ixarr, id1);

.expr230:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-450   


;-451 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr231
 push expr_17
 call rterm
 add  sp, 2

;-452   else if (istoken('-')) rterm("sub" );

 jmp .expr232
.expr231:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr233
 push expr_18
 call rterm
 add  sp, 2

;-453   else if (istoken('&')) rterm("and" );

 jmp .expr234
.expr233:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr235
 push expr_19
 call rterm
 add  sp, 2

;-454   else if (istoken('|')) rterm("or" );  

 jmp .expr236
.expr235:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr237
 push expr_20
 call rterm
 add  sp, 2

;-455   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr238
.expr237:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr239
 push expr_21
 call rterm
 add  sp, 2

;-456   else if (istoken(T_GREATGREAT)) rterm("shr");  

 jmp .expr240
.expr239:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr241
 push expr_22
 call rterm
 add  sp, 2

;-457   else if (istoken('*')) domul (ids);

 jmp .expr242
.expr241:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr243
 push word [bp-10]
 call domul
 add  sp, 2

;-458   else if (istoken('/')) doidiv(ids);

 jmp .expr244
.expr243:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr245
 push word [bp-10]
 call doidiv
 add  sp, 2

;-459   else if (istoken('%')) domod (ids);

 jmp .expr246
.expr245:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr247
 push word [bp-10]
 call domod
 add  sp, 2

;-460   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr247:
.expr246:
.expr244:
.expr242:
.expr240:
.expr238:
.expr236:
.expr234:
.expr232:
 call isrelational
 or  al, al
 je .expr248
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-461   return 0;

.expr248:
 mov ax, 0
 jmp .retnexpr

;-462 }


;-463 


;-464 int compoundass(char *op, int mode, int id1) {

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
; ENDP

compoundass:  ; *** PROC ***

;-465   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   464 NULL op = bp+4
;  201 var sign word   464 NULL mode = bp+6
;  202 var sign word   464 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass249
 push compoundass_0
 call error1
 add  sp, 2

;-466   prnl(); prs(op); prs("  "); 

.compoundass249:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-467   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass250
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass251
.compoundass250:
 push compoundass_3
 call prs
 add  sp, 2

;-468   v(id1); prs(", ");

.compoundass251:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-469   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-470 }


;-471 int dovar1(int mode, int op, int ixarr, int id1) { 
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
; ENDP

dovar1:  ; *** PROC ***

;-472   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   471 NULL mode = bp+4
;  201 var sign word   471 NULL op = bp+6
;  202 var sign word   471 NULL ixarr = bp+8
;  203 var sign word   471 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-473   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1252
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

;-474     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1253
 push dovar1_1
 call prs
 add  sp, 2

;-475     if(widthi == 2) prs(" ax, [bx]");

.dovar1253:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_2
 call prs
 add  sp, 2

;-476     return; }

.dovar1254:
 jmp .retndovar1

;-477   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1252:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1255
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

;-478   if (ixarr) {

.dovar1255:
 mov ax, [bp+8]
 or  al, al
 je .dovar1256

;-479     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-480     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1257
 push dovar1_5
 call prs
 add  sp, 2

;-481     prs("\n "); prs(op);

.dovar1257:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-482     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1259
.dovar1258:
 push dovar1_8
 call prs
 add  sp, 2

;-483 // v(id1); prs(" [bx]");


;-484     prc('['); printName(id1); prs(" + bx]"); 

.dovar1259:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-485     return; }

 jmp .retndovar1

;-486   prnl();prs(op);

.dovar1256:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-487   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1260
 push dovar1_10
 call prs
 add  sp, 2

;-488   if(wi==2) prs(" ax, ");

.dovar1260:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1261
 push dovar1_11
 call prs
 add  sp, 2

;-489   if(wi==4) prs(" eax, ");

.dovar1261:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1262
 push dovar1_12
 call prs
 add  sp, 2

;-490   v(id1);

.dovar1262:
 push word [bp+10]
 call v
 add  sp, 2

;-491 }


;-492 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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
; ENDP

rterm:  ; *** PROC ***

;-493   if (istoken(T_CONST)) { prnl(); prs(op); 

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   492 NULL op = bp+4
;  201 var sign word   492 NULL mode = bp-2
;  202 var sign word   492 NULL opint = bp-4
;  203 var sign word   492 NULL ixarr = bp-6
;  204 var sign word   492 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm263
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-494     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm264
 push rterm_0
 call prs
 add  sp, 2

;-495     if (wi==2) prs(" ax, ");

.rterm264:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm265
 push rterm_1
 call prs
 add  sp, 2

;-496     if (wi==4) prs(" eax, ");

.rterm265:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm266
 push rterm_2
 call prs
 add  sp, 2

;-497     prunsign1(lexval); return;}

.rterm266:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-498   mode=typeName(); id1=searchname(); ixarr=0;

.rterm263:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-499   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm267
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-500     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-501     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm268
 push rterm_3
 call error1
 add  sp, 2
.rterm268:

;-502   if (eqstr(symbol,"_AX")) return;

.rterm267:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm269
 jmp .retnrterm

;-503   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm269:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-504 }


;-505 int isreg() {

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
; ENDP

isreg:  ; *** PROC ***

;-506   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg270
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-507   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  

.isreg270:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg271
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-508   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg271:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg272
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-509   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg272:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg273
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-510   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg273:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg274
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-511   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    

.isreg274:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg275
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-512   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg275:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg276
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-513   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg276:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg277
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-514   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    

.isreg277:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg278
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-515   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg278:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg279
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-516   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg279:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg280
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-517   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  

.isreg280:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg281
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-518   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg281:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg282
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-519   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg282:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg283
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-520   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  

.isreg283:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg284
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-521   return 0;   r1: return 1; 

.isreg284:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-522 }


;-523 int doreg(char *dr) { int i; expect('=');

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
; ENDP

doreg:  ; *** PROC ***
;Function : doreg, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   523 NULL dr = bp+4
;  201 var sign word   523 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-524   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-525        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg285
 push word [lexval]
 call prunsign1
 add  sp, 2

;-526   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg286
.doreg285:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg287
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-527   else error1("only number or var allowed"); }

 jmp .doreg288
.doreg287:
 push doreg_2
 call error1
 add  sp, 2
.doreg288:
.doreg286:

;-528 


;-529 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
; ENDP

doassign:  ; *** PROC ***

;-530   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   529 NULL mode = bp+4
;  201 var sign word   529 NULL i = bp+6
;  202 var sign word   529 NULL ixarr = bp+8
;  203 var sign word   529 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-531   if (mode==1) {prs("\n mov  bx, ");v(i);                  

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign289
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-532     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign290
 push doassign_1
 call prs
 add  sp, 2

;-533     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign291
.doassign290:
 push doassign_2
 call prs
 add  sp, 2
.doassign291:
 jmp .retndoassign

;-534   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign289:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign292
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

;-535   if (ixarr) {  prs("\n mov bx, ");

.doassign292:
 mov ax, [bp+8]
 or  al, al
 je .doassign293
 push doassign_5
 call prs
 add  sp, 2

;-536     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign294
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign295
.doassign294:
 push word [bp+8]
 call v
 add  sp, 2

;-537     if (wi==2) prs("\n shl bx, 1");

.doassign295:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign296
 push doassign_6
 call prs
 add  sp, 2

;-538     prs("\n mov ["); printName(i);

.doassign296:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-539     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign297
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign298
.doassign297:
 push doassign_9
 call prs
 add  sp, 2
.doassign298:
 jmp .retndoassign

;-540   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign293:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign299
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign300
 push doassign_11
 call prs
 add  sp, 2

;-541     } v(i); prs(", al"); return; }

.doassign300:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-542   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign299:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign301
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign302
 push doassign_14
 call prs
 add  sp, 2

;-543     } v(i); prs(", ax"); return; }

.doassign302:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-544   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign301:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign303
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign304
 push doassign_17
 call prs
 add  sp, 2

;-545     } v(i); prs(", eax"); return; }

.doassign304:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-546 }

.doassign303:

;-547 int domul(int ids) {

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
; ENDP

domul:  ; *** PROC ***

;-548   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   547 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul305
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul306
.domul305:

;-549   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul307
 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-550   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul308
.domul307:
 push domul_3
 call error1
 add  sp, 2
.domul308:
.domul306:

;-551 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
; ENDP

doidiv:  ; *** PROC ***

;-552   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   551 NULL ids = bp+4
;  201 var sign word   551 NULL mode = bp-2
;  202 var sign word   551 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv309

;-553     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-554     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv310
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv311
.doidiv310:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv311:

;-555   else {

 jmp .doidiv312
.doidiv309:

;-556     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-557     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv313
 push doidiv_3
 call error1
 add  sp, 2

;-558     gettypes(id1);

.doidiv313:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-559     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv314
 push doidiv_4
 call error1
 add  sp, 2

;-560     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv314:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv315
 push doidiv_5
 call error1
 add  sp, 2

;-561     prs("\n mov bx, "); v(id1);

.doidiv315:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-562     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv316
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv317
.doidiv316:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv317:

;-563 }

.doidiv312:

;-564 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
; ENDP

domod:  ; *** PROC ***
;Function : domod, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   564 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-565 


;-566 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
; ENDP
section .bss
absolute 53411
docalltype resw 10
section .text
section .bss
absolute 53431
docallvalue resw 10
section .text

;-567 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 53451
procname resb 17
section .text

;-568 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1:  ; *** PROC ***

;-569   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   568 NULL i = bp-2
;  201 var sign word   568 NULL narg = bp-4
;  202 var sign word   568 NULL t0 = bp-6
;  203 var sign word   568 NULL n0 = bp-8
;  204 var sign word   568 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-570   checknamelen();

 call checknamelen

;-571   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-572   storecall();

 call storecall

;-573   expect('(');

 push 40
 call expect
 add  sp, 2

;-574 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1318

;-575 	  do { narg++;

.docall1319:
 inc  word[bp-4]

;-576 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1320
 push docall1_0
 call error1
 add  sp, 2
.docall1320:
 mov ax, 0
 mov [bp-6], ax

;-577       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1321
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-578       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1321:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1322
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-579         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-580         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-581       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1322:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1323
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-582       if(istoken(T_NAME))  { n0=checkreg();

.docall1323:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1324
 call checkreg
 mov [bp-8], ax

;-583         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1325
 mov ax, 5
 mov [bp-6], ax

;-584         else {t0=4; n0=searchname();

 jmp .docall1326
.docall1325:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-585           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1327
 mov ax, 3
 mov [bp-6], ax
.docall1327:
.docall1326:

;-586       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1324:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1328
 push docall1_4
 call error1
 add  sp, 2

;-587       docalltype [narg] = t0;

.docall1328:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-588       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-589     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1329
 jmp .docall1319
.docall1329:

;-590     


;-591   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-592     do {

.docall1330:

;-593       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-594       n0 = docallvalue[i];     

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-595       if(t0==1){ prs("\n push "); pint1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1331
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-596       if(t0==2){ prs("\n push "); 

.docall1331:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1332
 push docall1_6
 call prs
 add  sp, 2

;-597         prs(fname);prc(95);pint1(n0);}

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push 95
 call prc
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-598       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1332:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1333
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-599         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-600       if(t0==4){ gettypes(n0); 

.docall1333:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1334
 push word [bp-8]
 call gettypes
 add  sp, 2

;-601         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1335
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-602         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1336
.docall1335:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-603         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1336:

;-604       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1334:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1337
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1338
 mov ax, [bp-10]
 add ax, 2
.docall1338:

;-605    i--; } while (i > 0);  }

.docall1337:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1339
 jmp .docall1330
.docall1339:

;-606 	 prs("\n call "); prs(&procname);

.docall1318:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-607 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1340
 push docall1_14
 call prs
 add  sp, 2

;-608      narg=narg+narg; narg=narg+sz32; pint1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2
.docall1340:

;-609 /****************************************************************************/


;-610 int main() {
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
; ENDP

main:  ; *** PROC ***

;-611   getarg();

 call getarg

;-612   setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-613   if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main341
 push main_0
 call error1
 add  sp, 2

;-614   segE=allocmem(4096);

.main341:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-615   if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main342
 push main_1
 call error1
 add  sp, 2

;-616   CNameTop=0;

.main342:
 mov ax, 0
 mov word [CNameTop], ax

;-617   getfirstchar();

 call getfirstchar

;-618   parse();

 call parse

;-619   checkcalls(); epilog();

 call checkcalls
 call epilog

;-620 }


;-621 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }

 ret
main_0 db "SetBlock , AX=",0
main_1 db "alloc memory, AX=",0
; ENDP

getfirstchar:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
 call fgets1
 mov byte [thechar], al

;-622 char *arglen=0x80; char *argv=0x82;

 ret
; ENDP
arglen dw 128
argv dw 130

;-623 int getarg() { int arglen1; int i; char *c;


getarg:  ; *** PROC ***

;-624   arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   623 NULL arglen1 = bp-2
;  201 var sign word   623 NULL i = bp-4
;  202 ptr sign byte   623 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-625   if (arglen1) { i=arglen1+129; *i=0; }

 mov ax, [bp-2]
 or  al, al
 je .getarg343
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-626   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");

 jmp .getarg344
.getarg343:
 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
 push getarg_0
 call cputs
 add  sp, 2

;-627     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }

 push 67
 push 0
 push word [argv]
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
 mov ax, [DOS_NoBytes]
 add ax, 128
 mov [bp-6], ax
 mov ax, 0
 mov  bx, [bp-6]
 mov  [bx], al
 call prnl

;-628   strcpy(namein, argv);

.getarg344:
 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-629   if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarg345
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-630   toupper(namein);

.getarg345:
 lea  ax, [namein]
 push ax
 call toupper
 add  sp, 2

;-631   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';

 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
 dec  word[bp-4]
 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-632  


;-633   fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-634   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg346
 push getarg_2
 call cputs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
 push 1
 call exitR
 add  sp, 2

;-635   fdout=creatR(namelst);

.getarg346:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-636   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg347
 push getarg_3
 call cputs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
 push 2
 call exitR
 add  sp, 2

;-637   prs("\n; ");prs(Version1);

.getarg347:
 push getarg_4
 call prs
 add  sp, 2
 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-638   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-639   prs("\norg  256 \njmp main"); 

 push getarg_7
 call prs
 add  sp, 2

;-640 }


;-641 int parse() { token=getlex(); do {
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
; ENDP

parse:  ; *** PROC ***
 call getlex
 mov word [token], ax
.parse348:

;-642     if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse349
 mov ax, 1
 jmp .retnparse

;-643     if (istoken('#')) {

.parse349:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse350

;-644       if (istoken(T_DEFINE)) dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse351
 call dodefine

;-645       else if (istoken(T_INCLUDE)) doinclude();

 jmp .parse352
.parse351:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je .parse353
 call doinclude

;-646       else error1("define or include expected");  }

 jmp .parse354
.parse353:
 push parse_0
 call error1
 add  sp, 2
.parse354:
.parse352:

;-647     else{ typeName();  if (token=='(') dofunc();  else doglob(); }

 jmp .parse355
.parse350:
 call typeName
 mov ax, [token]
 cmp ax, 40
 jne .parse356
 call dofunc
 jmp .parse357
.parse356:
 call doglob
.parse357:

;-648   } while(1);

.parse355:
 mov ax, 1
 or  al, al
 je .parse358
 jmp .parse348
.parse358:

;-649 }


;-650 int checkcalls() { int i; int j; int k;

 .retnparse:
 ret
parse_0 db "define or include expected",0
; ENDP

checkcalls:  ; *** PROC ***

;-651   prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   650 NULL i = bp-2
;  201 var sign word   650 NULL j = bp-4
;  202 var sign word   650 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-652   i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-653   while (i < CTop) {

.checkcalls359:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .checkcalls360

;-654     pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-655     from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-656     j=0;

 mov ax, 0
 mov [bp-4], ax

;-657     do { p1=adrF(FNameField, j);

.checkcalls361:
 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-658       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkcalls362
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 mov ax, [FTop]
 mov [bp-4], ax

;-659       j++; } while (j < FTop);

.checkcalls362:
 inc  word[bp-4]
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .checkcalls363
 jmp .checkcalls361
.checkcalls363:

;-660     if (j == FTop) { k++; prs("\n; "); prs(NameA); }

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne .checkcalls364
 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-661     i++; }

.checkcalls364:
 inc  word[bp-2]

;-662   prs("\n; Number of unresolved CALLs :"); printint51(k);

 jmp .checkcalls359
.checkcalls360:
 push checkcalls_2
 call prs
 add  sp, 2
 push word [bp-6]
 call printint51
 add  sp, 2

;-663   if (k!=0) error1("At least 1 function is missing! "); 

 mov ax, [bp-6]
 cmp ax, 0
 je  .checkcalls365
 push checkcalls_3
 call error1
 add  sp, 2

;-664     else prs(" All FUNCTIONs in place");

 jmp .checkcalls366
.checkcalls365:
 push checkcalls_4
 call prs
 add  sp, 2

;-665 }

.checkcalls366:

;-666 


;-667 int doinclude() { int fdtemp;
 LEAVE
 ret
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db "\n; Number of unresolved CALLs :",0
checkcalls_3 db "At least 1 function is missing! ",0
checkcalls_4 db " All FUNCTIONs in place",0
; ENDP

doinclude:  ; *** PROC ***

;-668   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   667 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne .doinclude367
 mov ax, [fdin]
 mov [bp-2], ax

;-669   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-670   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-671   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

 mov ax, [DOS_ERR]
 cmp ax, 0
 je  .doinclude368
 push doinclude_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-672     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-673   linenoinclude=lineno; lineno=1;

.doinclude368:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-674   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-675   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-676   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-677 }

.doinclude367:

;-678 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0
; ENDP

dodefine:  ; *** PROC ***

;-679   if (eqstr(symbol, "ORGDATA")) {token=getlex();

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   678 NULL i = bp-2
;  201 var sign word   678 NULL j = bp-4
;  202 var sign word   678 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine369
 call getlex
 mov word [token], ax

;-680     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp .retndodefine

;-681   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

.dodefine369:
 push dodefine_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine370
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 258
 jne .dodefine371

;-682     prs("\n;Use archive file: ");

 push dodefine_2
 call prs
 add  sp, 2

;-683     strcpy(archivename, symbol); prs(archivename);

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

;-684     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp .dodefine372
.dodefine371:
 push dodefine_3
 call error1
 add  sp, 2
.dodefine372:
 call getlex
 mov word [token], ax
 jmp .retndodefine

;-685    expect(T_NAME);

.dodefine370:
 push 256
 call expect
 add  sp, 2

;-686   if (token==T_CONST) { 

 mov ax, [token]
 cmp ax, 257
 jne .dodefine373

;-687     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine374
 push dodefine_4
 call error1
 add  sp, 2

;-688     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

.dodefine374:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine375
 push dodefine_5
 call error1
 add  sp, 2

;-689     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

.dodefine375:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-690     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-691     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

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

;-692     expect(T_CONST); GTop++;  } 

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-693 }

.dodefine373:

;-694 int stmt() { int c; char cha;

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "ARCHIVE",0
dodefine_2 db "\n;Use archive file: ",0
dodefine_3 db "Name of archive file missing",0
dodefine_4 db "global table (define) full",0
dodefine_5 db "Define name longer 15 char",0
; ENDP

stmt:  ; *** PROC ***

;-695        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   694 NULL c = bp-2
;  201 var sign byte   694 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt376
.stmt377:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt378
 call stmt
 jmp .stmt377
.stmt378:

;-696   else if(istoken(T_IF))    doif();

 jmp .stmt379
.stmt376:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt380
 call doif

;-697   else if(istoken(T_DO))    dodo();

 jmp .stmt381
.stmt380:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt382
 call dodo

;-698   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt383
.stmt382:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt384
 call dowhile

;-699   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}

 jmp .stmt385
.stmt384:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt386
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

;-700   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt387
.stmt386:
 mov ax, [token]
 cmp ax, 518
 jne .stmt388
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-701         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt389:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt390
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt389
.stmt390:
 call getlex
 mov word [token], ax

;-702   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  

 jmp .stmt391
.stmt388:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt392
 mov ax, [token]
 cmp ax, 123
 jne .stmt393
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-703         while(cha!= '}') { prc(cha); cha=next(); }

.stmt394:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt395
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-704         token=getlex(); }

 jmp .stmt394
.stmt395:
 call getlex
 mov word [token], ax

;-705         else error1("Curly open expected"); 

 jmp .stmt396
.stmt393:
 push stmt_3
 call error1
 add  sp, 2

;-706         }

.stmt396:

;-707   else if(istoken(T_EMIT))   doemit();

 jmp .stmt397
.stmt392:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt398
 call doemit

;-708   else if(istoken(';'))      { }

 jmp .stmt399
.stmt398:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt400

;-709   else if(istoken(T_RETURN)) {

 jmp .stmt401
.stmt400:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt402

;-710         if (token!=';') exprstart();

 mov ax, [token]
 cmp ax, 59
 je  .stmt403
 call exprstart

;-711         prs("\n jmp .retn"); 

.stmt403:
 push stmt_4
 call prs
 add  sp, 2

;-712         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-713         nreturn++; 

 inc  word[nreturn]

;-714         expect(';');

 push 59
 call expect
 add  sp, 2

;-715         }


;-716   else if(thechar==':')      {

 jmp .stmt404
.stmt402:
 mov al, [thechar]
 cmp al, 58
 jne .stmt405

;-717         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-718         prs(symbol); prc(':');  

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-719         expect(T_NAME); 

 push 256
 call expect
 add  sp, 2

;-720         expect(':'); 

 push 58
 call expect
 add  sp, 2

;-721         }


;-722   else  {exprstart(); expect(';'); } 

 jmp .stmt406
.stmt405:
 call exprstart
 push 59
 call expect
 add  sp, 2

;-723 }

.stmt406:
.stmt404:
.stmt401:
.stmt399:
.stmt397:
.stmt391:
.stmt387:
.stmt385:
.stmt383:
.stmt381:
.stmt379:

;-724 


;-725 int doemit() {prs("\n db ");
 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n jmp .retn",0
stmt_5 db "\n.",0
; ENDP

doemit:  ; *** PROC ***
 push doemit_0
 call prs
 add  sp, 2

;-726   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-727     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit407
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit407:
 push 41
 call expect
 add  sp, 2

;-728 


;-729 int cmpneg(int ids) {

 ret
doemit_0 db "\n db ",0
; ENDP

cmpneg:  ; *** PROC ***

;-730        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   729 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg408
 push cmpneg_0
 call prs
 add  sp, 2

;-731   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg409
.cmpneg408:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg410
 push cmpneg_1
 call prs
 add  sp, 2

;-732   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg411
.cmpneg410:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg412
 mov ax, [bp+4]
 or  al, al
 je .cmpneg413
 push cmpneg_2
 call prs
 add  sp, 2

;-733                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg414
.cmpneg413:
 push cmpneg_3
 call prs
 add  sp, 2

;-734   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg414:
 jmp .cmpneg415
.cmpneg412:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg416
 mov ax, [bp+4]
 or  al, al
 je .cmpneg417
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-735                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-736                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg418
.cmpneg417:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-737                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-738   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg418:
 jmp .cmpneg419
.cmpneg416:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg420
 push cmpneg_8
 call prs
 add  sp, 2

;-739   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg421
.cmpneg420:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg422
 push cmpneg_9
 call prs
 add  sp, 2

;-740   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg423
.cmpneg422:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg423:
.cmpneg421:
.cmpneg419:
.cmpneg415:
.cmpneg411:
.cmpneg409:

;-741 


;-742 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
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
; ENDP

prlabel:  ; *** PROC ***
;Function : prlabel, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   742 NULL n = bp+4;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-743 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
; ENDP

prjump:  ; *** PROC ***
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   743 NULL n = bp+4;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2

;-744 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
; ENDP

doif:  ; *** PROC ***
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   744 NULL jdest = bp-2
;  201 var sign word   744 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-745   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-746   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif424
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-747     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-748   else prlabel(jdest); }

 jmp .doif425
.doif424:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif425:

;-749 


;-750 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
; ENDP

dodo:  ; *** PROC ***

;-751   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   750 NULL jdest = bp-2
;  201 var sign word   750 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-752   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-753   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-754 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

dowhile:  ; *** PROC ***
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   754 NULL jdest = bp-2
;  201 var sign word   754 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-755   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-756   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-757 int isrelational() {
 LEAVE
 ret
; ENDP

isrelational:  ; *** PROC ***

;-758   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational426
 jmp .w
.isrelational426:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational427
 jmp .w

;-759   if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational427:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational428
 jmp .w
.isrelational428:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational429
 jmp .w

;-760   if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational429:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational430
 jmp .w
.isrelational430:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational431
 jmp .w

;-761   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational431:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-762  


;-763 char symboltemp[80];    

 .retnisrelational:
 ret
; ENDP
section .bss
absolute 53468
symboltemp resb 80
section .text

;-764 int getlex() { char c; char *p; 


getlex:  ; *** PROC ***

;-765 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   764 NULL c = bp-2
;  201 ptr sign byte   764 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex432
 mov ax, 0
 jmp .retngetlex
.getlex432:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex433
 jmp .g1

;-766   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex433:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex434
 mov al, [thechar]
 cmp al, 61
 jne .getlex435
 call next
 mov ax, 806
 jmp .retngetlex
.getlex435:

;-767   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex434:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex436
 mov al, [thechar]
 cmp al, 61
 jne .getlex437
 call next
 mov ax, 807
 jmp .retngetlex
.getlex437:

;-768   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex436:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex438
 mov al, [thechar]
 cmp al, 61
 jne .getlex439
 call next
 mov ax, 824
 jmp .retngetlex
.getlex439:

;-769   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex438:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex440
 mov al, [thechar]
 cmp al, 61
 jne .getlex441
 call next
 mov ax, 811
 jmp .retngetlex
.getlex441:

;-770   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex440:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex442
 mov al, [thechar]
 cmp al, 60
 jne .getlex443
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex443:

;-771   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex442:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex444
 mov al, [thechar]
 cmp al, 62
 jne .getlex445
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex445:

;-772   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex444:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex446
 mov al, [thechar]
 cmp al, 43
 jne .getlex447
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex447:

;-773   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex446:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex448
 mov al, [thechar]
 cmp al, 45
 jne .getlex449
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex449:

;-774   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex448:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex450
 mov al, [thechar]
 cmp al, 61
 jne .getlex451
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex451:

;-775   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex450:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex452
 mov al, [thechar]
 cmp al, 61
 jne .getlex453
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex453:

;-776   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex452:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex454
 mov al, [thechar]
 cmp al, 61
 jne .getlex455
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex455:

;-777   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    

.getlex454:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex456
 mov al, [thechar]
 cmp al, 61
 jne .getlex457
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex457:

;-778   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex456:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex458
 mov al, [thechar]
 cmp al, 61
 jne .getlex459
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex459:

;-779   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        

.getlex458:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex460
 mov al, [thechar]
 cmp al, 61
 jne .getlex461
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex461:

;-780   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex460:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex462
 mov al, [bp-2]
 jmp .retngetlex

;-781   if (c == '/') { if (thechar == '/') {

.getlex462:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex463
 mov al, [thechar]
 cmp al, 47
 jne .getlex464

;-782       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }

.getlex465:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 13
 je  .getlex466
 jmp .getlex465
.getlex466:
 call getlex
 jmp .retngetlex
.getlex464:

;-783   if (c == '/') { if (thechar == '*') {

.getlex463:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex467
 mov al, [thechar]
 cmp al, 42
 jne .getlex468

;-784       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex469
 jmp .g2
.getlex469:
 mov al, [thechar]
 cmp al, 47
 je  .getlex470
 jmp .g2

;-785       c=next(); return getlex(); } else  return '/'; }

.getlex470:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex471
.getlex468:
 mov ax, 47
 jmp .retngetlex
.getlex471:

;-786   if (c == '"') {getstring(c); return T_STRING;}

.getlex467:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex472
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-787   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex472:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex473
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-788   if (c==39) { lexval=next();

.getlex473:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex474
 call next
 mov word [lexval], ax

;-789     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex475
 call next
 mov word [lexval], ax

;-790       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex476
 mov ax, 10
 mov word [lexval], ax
.getlex476:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex477
 mov ax, 9
 mov word [lexval], ax

;-791       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex477:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex478
 mov ax, 0
 mov word [lexval], ax
.getlex478:
.getlex475:
 call next
 mov ax, 257
 jmp .retngetlex

;-792   if (alnum(c)) { 

.getlex474:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex479

;-793     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-794     while(alnum(thechar)) {c=next(); *p=c;  p++; } 

.getlex480:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex481
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-795       *p=0;

 jmp .getlex480
.getlex481:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-796     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex482
 mov ax, 531
 jmp .retngetlex

;-797     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex482:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex483
 mov ax, 532
 jmp .retngetlex

;-798     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex483:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex484
 mov ax, 529
 jmp .retngetlex

;-799     if (eqstr(symbol,"int"     )) return T_INT;

.getlex484:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex485
 mov ax, 517
 jmp .retngetlex

;-800     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex485:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex486
 mov ax, 533
 jmp .retngetlex

;-801     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex486:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex487
 mov ax, 530
 jmp .retngetlex

;-802     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex487:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex488
 mov ax, 518
 jmp .retngetlex

;-803     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex488:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex489
 mov ax, 519
 jmp .retngetlex

;-804     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex489:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex490
 mov ax, 520
 jmp .retngetlex

;-805     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex490:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex491
 mov ax, 512
 jmp .retngetlex

;-806     if (eqstr(symbol,"if"      )) return T_IF;

.getlex491:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex492
 mov ax, 513
 jmp .retngetlex

;-807     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex492:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex493
 mov ax, 514
 jmp .retngetlex

;-808     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex493:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex494
 mov ax, 515
 jmp .retngetlex

;-809     if (eqstr(symbol,"do"      )) return T_DO;

.getlex494:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex495
 mov ax, 516
 jmp .retngetlex

;-810     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex495:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex496
 mov ax, 521
 jmp .retngetlex

;-811     if (eqstr(symbol,"define"  )) return T_DEFINE;   

.getlex496:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex497
 mov ax, 511
 jmp .retngetlex

;-812     if (eqstr(symbol,"include" )) return T_INCLUDE;   

.getlex497:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex498
 mov ax, 510
 jmp .retngetlex

;-813     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex498:
 call convertdefine
 or  al, al
 je .getlex499
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-814     return T_NAME; } error1("Input item not recognized"); }

.getlex499:
 mov ax, 256
 jmp .retngetlex
.getlex479:
 push getlex_18
 call error1
 add  sp, 2

;-815 


;-816 int convertdefine() { int i; int j;   i=0;

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
; ENDP

convertdefine:  ; *** PROC ***
;Function : convertdefine, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   816 NULL i = bp-2
;  201 var sign word   816 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-817   while (i < GTop) {

.convertdefine500:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine501

;-818    j=adrofname(i); 

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-819    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine502
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine503
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-820    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine503:

;-821    i++; } 

.convertdefine502:
 inc  word[bp-2]

;-822    return 0; }

 jmp .convertdefine500
.convertdefine501:
 mov ax, 0
 jmp .retnconvertdefine

;-823 int getdigit(char c) { int i;

 .retnconvertdefine: LEAVE
 ret
; ENDP

getdigit:  ; *** PROC ***

;-824     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   823 NULL c = bp+4
;  201 var sign word   823 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-825     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit504
 mov ax, 88
 mov byte [thechar], al
.getdigit504:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit505
 call next

;-826       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit506:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit507
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit508
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-827 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit508:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit509
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit509:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-828      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-829     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 

 jmp .getdigit506
.getdigit507:
 jmp .getdigit510
.getdigit505:
.getdigit511:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit512
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-830      i=0; i=c; lexval=lexval+i; } } 

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit511
.getdigit512:

;-831 }

.getdigit510:

;-832 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
; ENDP

getstring:  ; *** PROC ***
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   832 NULL delim = bp+4
;  201 var sign word   832 NULL c = bp-2
;  202 ptr sign byte   832 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-833   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

.getstring513:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring514
 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]
 call next
 mov [bp-2], ax
 jmp .getstring513
.getstring514:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-834 


;-835 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
 LEAVE
 ret
; ENDP

next:  ; *** PROC ***
;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   835 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
 mov al, [bp-2]
 mov byte [globC], al
 call fgets1
 mov byte [thechar], al
 mov al, [bp-2]
 jmp .retnnext

;-836 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}

 .retnnext: LEAVE
 ret
; ENDP

istoken:  ; *** PROC ***
;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   836 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken515
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnistoken
.istoken515:
 mov ax, 0
 jmp .retnistoken

;-837 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();

 .retnistoken: LEAVE
 ret
; ENDP

expect:  ; *** PROC ***
;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   837 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect516
 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 call listproc

;-838   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

 push expect_0
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push expect_1
 call error1
 add  sp, 2
.expect516:

;-839 


;-840 int eprc(char c)  {*cloc=c; cloc++; }
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
; ENDP

eprc:  ; *** PROC ***
;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   840 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
 inc  word[cloc]

;-841 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
 LEAVE
 ret
; ENDP

eprs:  ; *** PROC ***
;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   841 NULL s = bp+4
;  201 var sign byte   841 NULL c = bp-2;
 ENTER  2,0
.eprs517:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs518
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
 jmp .eprs517
.eprs518:

;-842 int prc(unsigned char c) { 
 LEAVE
 ret
; ENDP

prc:  ; *** PROC ***

;-843   if (c==10) {_AX=13; writetty(); }

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   842 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc519
 mov  ax, 13
 call writetty

;-844   _AL=c; writetty(); 

.prc519:
 mov  al, [bp+4]
 call writetty

;-845   fputcR(c, fdout); 

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-846   }


;-847 int prscomment(unsigned char *s) {unsigned char c;
 LEAVE
 ret
; ENDP

prscomment:  ; *** PROC ***

;-848   while(*s){c=*s;prc(c);s++;} }

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   847 NULL s = bp+4
;  201 var unsg byte   847 NULL c = bp-2;
 ENTER  2,0
.prscomment520:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment521
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
 jmp .prscomment520
.prscomment521:

;-849 int prnl() { prs("\n ");}
 LEAVE
 ret
; ENDP

prnl:  ; *** PROC ***
 push prnl_0
 call prs
 add  sp, 2

;-850 


;-851 int prs(unsigned char *s) {unsigned char c; int com; com=0;

 ret
prnl_0 db "\n ",0
; ENDP

prs:  ; *** PROC ***
;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   851 NULL s = bp+4
;  201 var unsg byte   851 NULL c = bp-2
;  202 var sign word   851 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-852   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;

.prs522:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs523
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 34
 jne .prs524
 mov ax, [bp-4]
 or  al, al
 je .prs525
 mov ax, 0
 mov [bp-4], ax
 jmp .prs526
.prs525:
 mov ax, 1
 mov [bp-4], ax

;-853     if (c==92) { if (com==0) { s++; c=*s;

.prs526:
.prs524:
 mov al, [bp-2]
 cmp al, 92
 jne .prs527
 mov ax, [bp-4]
 cmp ax, 0
 jne .prs528
 inc  word[bp+4]
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-854           if (c=='n') c=10; if (c=='t') c= 9;

 mov al, [bp-2]
 cmp al, 110
 jne .prs529
 mov ax, 10
 mov [bp-2], al
.prs529:
 mov al, [bp-2]
 cmp al, 116
 jne .prs530
 mov ax, 9
 mov [bp-2], al

;-855     } } prc(c); s++;  } }

.prs530:
.prs528:
.prs527:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp .prs522
.prs523:

;-856 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
 LEAVE
 ret
; ENDP

eprnum:  ; *** PROC ***
;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   856 NULL n = bp+4
;  201 var sign word   856 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum531
 push 45
 call eprc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-857   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }

.eprnum531:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum532
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call eprnum
 add  sp, 2
.eprnum532:
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

;-858 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint1:  ; *** PROC ***
;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   858 NULL n = bp+4
;  201 var sign word   858 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint1533
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-859   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }

.pint1533:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint1534
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
.pint1534:
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
 call prc
 add  sp, 2

;-860 int prunsign1(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP

prunsign1:  ; *** PROC ***

;-861   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   860 NULL n = bp+4
;  201 var unsg word   860 NULL e = bp-2;
 ENTER  2,0 ; constant expression
cmp word[bp+4], 10 ;unsigned : 0
 jb  .prunsign1535
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-862     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }

.prunsign1535:
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

;-863 int printint51(unsigned int j)  {
 LEAVE
 ret
; ENDP

printint51:  ; *** PROC ***

;-864   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   863 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint51536
 push 32
 call prc
 add  sp, 2
.printint51536:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint51537
 push 32
 call prc
 add  sp, 2
.printint51537:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint51538
 push 32
 call prc
 add  sp, 2

;-865    if (j<10) prc(32);  prunsign1(j); }

.printint51538:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint51539
 push 32
 call prc
 add  sp, 2
.printint51539:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-866 


;-867 int fgets1() { char c; c=*fgetsp;
 LEAVE
 ret
; ENDP

fgets1:  ; *** PROC ***
;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   867 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-868   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1540
 call printinputline
 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1541
 mov ax, 0
 jmp .retnfgets1

;-869     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }

.fgets1541:
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov ax, 0
 mov word [spalte], ax

;-870   fgetsp++; spalte++;  return c; }

.fgets1540:
 inc  word[fgetsp]
 inc  word[spalte]
 mov al, [bp-2]
 jmp .retnfgets1

;-871 int printinputline() { fgetsp=&fgetsdest;

 .retnfgets1: LEAVE
 ret
; ENDP

printinputline:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-872   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

.printinputline542:
 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-873   if (DOS_NoBytes == 0) return; 

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline543
 jmp .retnprintinputline

;-874     *fgetsp=DOS_ByteRead; fgetsp++;} 

.printinputline543:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
 inc  word[fgetsp]

;-875   while (DOS_ByteRead != 10); *fgetsp=0;

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline544
 jmp .printinputline542
.printinputline544:
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-876     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;

 mov ax, [fdout]
 or  al, al
 je .printinputline545
 push printinputline_0
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2
 push 32
 call prc
 add  sp, 2
 inc  word[lineno]

;-877       prscomment(&fgetsdest);}

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-878 }

.printinputline545:

;-879 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }

 .retnprintinputline:
 ret
printinputline_0 db "\n\n;-",0
; ENDP

end1:  ; *** PROC ***
;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   879 NULL n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
 push word [fdout]
 call fcloseR
 add  sp, 2
 push word [bp+4]
 call exitR
 add  sp, 2

;-880 int error1(char *s) { 
 LEAVE
 ret
; ENDP

error1:  ; *** PROC ***

;-881   lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   880 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-882   prnl(); prscomment(&fgetsdest);

 call prnl
 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-883   prs(";Line: "); prunsign1(lineno);

 push error1_0
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-884   prs(" ************** ERROR: "); prs(s);

 push error1_1
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2

;-885   prs("  in column: "); pint1(spalte);

 push error1_2
 call prs
 add  sp, 2
 push word [spalte]
 call pint1
 add  sp, 2

;-886   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);

 push error1_3
 call prs
 add  sp, 2
 push word [token]
 call prunsign1
 add  sp, 2
 push error1_4
 call prs
 add  sp, 2
 mov al, byte [globC]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-887   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);

 push error1_5
 call prs
 add  sp, 2
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call pint1
 add  sp, 2
 push error1_6
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-888   end1(1); }

 push 1
 call end1
 add  sp, 2

;-889 int listproc() {int i; 
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", globC: ",0
error1_5 db ", thechar: ",0
error1_6 db ", symbol: ",0
; ENDP

listproc:  ; *** PROC ***

;-890   if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   889 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle .listproc546

;-891   prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-892   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);

 push listproc_1
 call prs
 add  sp, 2
 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-893   prs("\n;   # type sign width addr used name   list of local variables");

 push listproc_2
 call prs
 add  sp, 2

;-894     i=LSTART; 

 mov ax, 200
 mov [bp-2], ax

;-895     while (i < LTop) { listvar(i); i++; } } 

.listproc547:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc548
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]
 jmp .listproc547
.listproc548:

;-896 }

.listproc546:

;-897 int listvar(unsigned int i) {unsigned int j; char c;
 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
; ENDP

listvar:  ; *** PROC ***

;-898   prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   897 NULL i = bp+4
;  201 var unsg word   897 NULL j = bp-2
;  202 var sign byte   897 NULL c = bp-4;
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

;-899   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne .listvar549
 push listvar_1
 call prs
 add  sp, 2
.listvar549:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar550
 push listvar_2
 call prs
 add  sp, 2

;-900                if(c=='&')prs("arr ");   if(c=='#')prs("def ");

.listvar550:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar551
 push listvar_3
 call prs
 add  sp, 2
.listvar551:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar552
 push listvar_4
 call prs
 add  sp, 2

;-901   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

.listvar552:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .listvar553
 push listvar_5
 call prs
 add  sp, 2
.listvar553:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar554
 push listvar_6
 call prs
 add  sp, 2

;-902   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

.listvar554:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne .listvar555
 push listvar_7
 call prs
 add  sp, 2
.listvar555:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar556
 push listvar_8
 call prs
 add  sp, 2

;-903                if(c==  4)prs("dwrd " );

.listvar556:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar557
 push listvar_9
 call prs
 add  sp, 2

;-904   j=GAdr[i]; printint51(j);

.listvar557:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-905   j=GUsed[i]; if (j) printint51(j);

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je .listvar558
 push word [bp-2]
 call printint51
 add  sp, 2

;-906   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}

 jmp .listvar559
.listvar558:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar560
 push listvar_10
 call prs
 add  sp, 2
 jmp .listvar561
.listvar560:
 push listvar_11
 call prs
 add  sp, 2
.listvar561:

;-907   prc(32);  pt=adrofname(i); prs(pt);

.listvar559:
 push 32
 call prc
 add  sp, 2
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-908   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar562
 push 61
 call prc
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-909   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}

.listvar562:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar563
 push 91
 call prc
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-910   if (i >= LSTART) { prs(" = bp"); j=GData[i];

.listvar563:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  .listvar564
 push listvar_12
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-911     if (j > 0) prc('+'); pint1(j);  }

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar565
 push 43
 call prc
 add  sp, 2
.listvar565:
 push word [bp-2]
 call pint1
 add  sp, 2

;-912 }

.listvar564:

;-913 int listcall() { int i;
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
; ENDP

listcall:  ; *** PROC ***

;-914   prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   913 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-915   i=0;  while (i< CTop) { calllisting(i); i++; } }

 mov ax, 0
 mov [bp-2], ax
.listcall566:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .listcall567
 push word [bp-2]
 call calllisting
 add  sp, 2
 inc  word[bp-2]
 jmp .listcall566
.listcall567:

;-916 int calllisting(int i) {char c; int j;
 LEAVE
 ret
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
; ENDP

calllisting:  ; *** PROC ***

;-917   prs("\n;"); printint51(i); prc(32);

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   916 NULL i = bp+4
;  201 var sign byte   916 NULL c = bp-2
;  202 var sign word   916 NULL j = bp-4;
 ENTER  4,0
 push calllisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-918   c=CType [i]; if(c==0)prs("unresolved ");

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .calllisting568
 push calllisting_1
 call prs
 add  sp, 2

;-919   j=CAdr[i];            printint51(j); prc(32);

.calllisting568:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov [bp-4], ax
 push word [bp-4]
 call printint51
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-920   from_far(NameA, j);   prs(NameA);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-921 }


;-922 int countcalls(int f) { unsigned int i;
 LEAVE
 ret
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0
; ENDP

countcalls:  ; *** PROC ***

;-923   pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   922 NULL f = bp+4
;  201 var unsg word   922 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-924   i=0;  while (i < CTop) {

 mov ax, 0
 mov [bp-2], ax
.countcalls569:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .countcalls570

;-925     p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-926     from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-927     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je .countcalls571
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-928     i++; }

.countcalls571:
 inc  word[bp-2]

;-929 }

 jmp .countcalls569
.countcalls570:

;-930 int listfunc() { int i;
 LEAVE
 ret
; ENDP

listfunc:  ; *** PROC ***

;-931   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   930 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-932   i=0;  while (i < FTop) { countcalls (i); i++; } 

 mov ax, 0
 mov [bp-2], ax
.listfunc572:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc573
 push word [bp-2]
 call countcalls
 add  sp, 2
 inc  word[bp-2]

;-933   i=0;  while (i < FTop) { funclisting(i); i++; } }

 jmp .listfunc572
.listfunc573:
 mov ax, 0
 mov [bp-2], ax
.listfunc574:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc575
 push word [bp-2]
 call funclisting
 add  sp, 2
 inc  word[bp-2]
 jmp .listfunc574
.listfunc575:

;-934 int funclisting(int i) {int j;  char c;
 LEAVE
 ret
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
; ENDP

funclisting:  ; *** PROC ***

;-935   prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   934 NULL i = bp+4
;  201 var sign word   934 NULL j = bp-2
;  202 var sign byte   934 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-936   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je .funclisting576
 push word [bp-2]
 call printint51
 add  sp, 2
 jmp .funclisting577
.funclisting576:
 push funclisting_1
 call prs
 add  sp, 2

;-937   j = FAdr[i];   printint51(j); prc(32);

.funclisting577:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-938   c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-939   if(c=='V')prs("void " );    if(c=='B')prs("byte " );

 mov al, [bp-4]
 cmp al, 86
 jne .funclisting578
 push funclisting_2
 call prs
 add  sp, 2
.funclisting578:
 mov al, [bp-4]
 cmp al, 66
 jne .funclisting579
 push funclisting_3
 call prs
 add  sp, 2

;-940   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );

.funclisting579:
 mov al, [bp-4]
 cmp al, 87
 jne .funclisting580
 push funclisting_4
 call prs
 add  sp, 2
.funclisting580:
 mov al, [bp-4]
 cmp al, 68
 jne .funclisting581
 push funclisting_5
 call prs
 add  sp, 2

;-941   prc(32); prc(32);

.funclisting581:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-942   pt=adrF(FNameField, i); prs(pt);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-943 }


;-944 unsigned int MAXUI=65535;
 LEAVE
 ret
funclisting_0 db "\n;",0
funclisting_1 db " NULL",0
funclisting_2 db "void ",0
funclisting_3 db "byte ",0
funclisting_4 db "word ",0
funclisting_5 db "dwrd ",0
; ENDP
MAXUI dw 65535

;-945 int epilog() {unsigned int i; 


epilog:  ; *** PROC ***

;-946   strcpy(symbol, "LastFunctionByt");  storefunc();

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   945 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 call storefunc

;-947   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");

 push epilog_1
 call prs
 add  sp, 2

;-948   prs("\n \n;   # type sign width  adr used name   list of global variables\n");

 push epilog_2
 call prs
 add  sp, 2

;-949   i=1;

 mov ax, 1
 mov [bp-2], ax

;-950   while (i< GTop) { listvar(i); i++; }

.epilog582:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .epilog583
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]

;-951   listfunc();   listcall();

 jmp .epilog582
.epilog583:
 call listfunc
 call listcall

;-952 


;-953   prs("\n;Input: "); prs(&namein);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-954   prs(", List: ");   prs(&namelst);

 push epilog_4
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-955   prs(",  Lines:"); printint51(lineno);

 push epilog_5
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-956   prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_6
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-957   prs(" max.:"); printint51(LSTART);

 push epilog_7
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-958   prs("\n;Functions      :"); printint51(FTop);

 push epilog_8
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-959   prs(" max.:"); printint51(FUNCMAX);

 push epilog_9
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-960   prs("\n;Calls          :"); printint51(CTop);

 push epilog_10
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-961   prs(" max.:"); printint51(CALLMAX);

 push epilog_11
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-962   prs(", NameField:"); printint51(CNameTop);

 push epilog_12
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-963   prs(" max.:"); printint51(65535);

 push epilog_13
 call prs
 add  sp, 2
 push -1
 call printint51
 add  sp, 2

;-964 //  prs(", segE:"); printint51(segE);


;-965   __asm{call LastFunctionByt}  _ i=ax;

call LastFunctionByt
mov [bp-2], ax

;-966   prs("\n;Code until     :"); printint51(i);

 push epilog_14
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-967   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");

 push epilog_15
 call prs
 add  sp, 2
 push word [ORGDATAORIG]
 call printint51
 add  sp, 2
 mov ax, [ORGDATAORIG]
 sub ax, [bp-2]
 mov [bp-2], ax
 push epilog_16
 call prs
 add  sp, 2

;-968   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog584
 push epilog_17
 call prs
 add  sp, 2

;-969   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;

.epilog584:
 push epilog_18
 call prs
 add  sp, 2
 push word [orgData]
 call prunsign1
 add  sp, 2
 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax

;-970   prs(", resting stacksize: ");printint51(i);

 push epilog_19
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-971   if (i <= 5000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 5000
 ja  .epilog585
 push epilog_20
 call prs
 add  sp, 2

;-972   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);

.epilog585:
 push epilog_21
 call prs
 add  sp, 2
 lea  ax, [coname]
 push ax
 call prs
 add  sp, 2
 push epilog_22
 call prs
 add  sp, 2
 push word [maxco]
 call printint51
 add  sp, 2

;-973   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");

 push epilog_23
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
 push epilog_24
 call prs
 add  sp, 2

;-974   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog586
 push epilog_25
 call prs
 add  sp, 2

;-975   end1(0);}

.epilog586:
 push 0
 call end1
 add  sp, 2

;-976 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}


;-977 int setblock(unsigned int i) {
 LEAVE
 ret
epilog_0 db "LastFunctionByt",0
epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
epilog_3 db "\n;Input: ",0
epilog_4 db ", List: ",0
epilog_5 db ",  Lines:",0
epilog_6 db "\n;Glob. variables:",0
epilog_7 db " max.:",0
epilog_8 db "\n;Functions      :",0
epilog_9 db " max.:",0
epilog_10 db "\n;Calls          :",0
epilog_11 db " max.:",0
epilog_12 db ", NameField:",0
epilog_13 db " max.:",0
epilog_14 db "\n;Code until     :",0
epilog_15 db " max.: ",0
epilog_16 db ", free:",0
epilog_17 db " *** Warning *** Code area too small",0
epilog_18 db "\n;Data (HeapEnd) :",0
epilog_19 db ", resting stacksize: ",0
epilog_20 db " *** Warning *** Stack too small",0
epilog_21 db "\n;Max. Const in '",0
epilog_22 db "' :",0
epilog_23 db " max.",0
epilog_24 db ", free:",0
epilog_25 db " *** Warning *** constant area too small",0
; ENDP

setblock:  ; *** PROC ***

;-978   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   977 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, cs
 mov  es, ax
 mov  ax, 18944
 call DosInt

;-979 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 LEAVE
 ret
; ENDP

allocmem:  ; *** PROC ***

;-980   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   979 NULL i = bp+4
;  201 var unsg word   979 NULL vAX = bp-2
;  202 var unsg word   979 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, 18432
 call DosInt
mov [bp-2], ax
mov [bp-4], bx

;-981   if(DOS_ERR) return vBX;   return vAX;

 mov ax, [DOS_ERR]
 or  al, al
 je .allocmem587
 mov ax, [bp-4]
 jmp .retnallocmem
.allocmem587:
 mov ax, [bp-2]
 jmp .retnallocmem

;-982 }


;-983 int copyF(char *dest, char *src, unsigned int sz) {

 .retnallocmem: LEAVE
 ret
; ENDP

copyF:  ; *** PROC ***

;-984   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di

;Function : copyF, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   983 NULL dest = bp+4
;  201 ptr sign byte   983 NULL src = bp+6
;  202 var unsg word   983 NULL sz = bp+8;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]
 mov  cx, [bp+8]

;-985   asm cld

 cld

;-986   asm rep movsb

 rep movsb

;-987   asm mov byte [es:di], 0

 mov byte [es:di], 0

;-988 }


;-989 int to_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

to_far:  ; *** PROC ***

;-990   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   989 NULL dest = bp+4
;  201 ptr sign byte   989 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-991   asm cld

 cld

;-992   do{

.to_far588:

;-993   asm lodsb  ; inc si

 lodsb  ; inc si

;-994   asm stosb  ; inc di

 stosb  ; inc di

;-995   } while (al != 0);

 cmp  al, 0
 je  .to_far589
 jmp .to_far588
.to_far589:

;-996 }


;-997 int from_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

from_far:  ; *** PROC ***

;-998   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   997 NULL dest = bp+4
;  201 ptr sign byte   997 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-999   do{

.from_far590:

;-1000   asm mov al, [es:si]

 mov al, [es:si]

;-1001   asm inc si

 inc si

;-1002   asm mov [di], al

 mov [di], al

;-1003   asm inc di

 inc di

;-1004   } while (al != 0);

 cmp  al, 0
 je  .from_far591
 jmp .from_far590
.from_far591:

;-1005 }
 LEAVE
 ret
; ENDP
 
; missing functions: 
; Number of unresolved CALLs :    0 All FUNCTIONs in place
LastFunctionByt:db 0E8h, 0, 0
pop ax
ret
 
;   # type sign width  adr used name   list of global variables

;    1 arr sign byte     2    2 Version1[10]
;    2 def unsg byte     3    - LSTART=200
;    3 def unsg byte     4    - VARMAX=300
;    4 def unsg byte     5    - GNAMEMAX=4800
;    5 def unsg byte     6    - FUNCMAX=300
;    6 def unsg byte     7    - FNAMEMAX=4800
;    7 def unsg byte     8    - CALLMAX=2000
;    8 def unsg byte     9    - IDLENMAX=15
;    9 def unsg byte    11    - T_NAME=256
;   10 def unsg byte    12    - T_CONST=257
;   11 def unsg byte    13    - T_STRING=258
;   12 def unsg byte    14    - T_INCLUDE=510
;   13 def unsg byte    15    - T_DEFINE=511
;   14 def unsg byte    16    - T_RETURN=512
;   15 def unsg byte    17    - T_IF=513
;   16 def unsg byte    18    - T_ELSE=514
;   17 def unsg byte    19    - T_WHILE=515
;   18 def unsg byte    20    - T_DO=516
;   19 def unsg byte    21    - T_INT=517
;   20 def unsg byte    22    - T_ASM=518
;   21 def unsg byte    23    - T_ASMBLOCK=519
;   22 def unsg byte    24    - T_EMIT=520
;   23 def unsg byte    25    - T_GOTO=521
;   24 def unsg byte    26    - T_VOID=529
;   25 def unsg byte    27    - T_CHAR=530
;   26 def unsg byte    28    - T_SIGNED=531
;   27 def unsg byte    29    - T_UNSIGNED=532
;   28 def unsg byte    30    - T_LONG=533
;   29 def unsg byte    31    - T_EQ=806
;   30 def unsg byte    32    - T_NE=807
;   31 def unsg byte    33    - T_GE=811
;   32 def unsg byte    34    - T_LE=824
;   33 def unsg byte    35    - T_PLUSPLUS=1219
;   34 def unsg byte    36    - T_MINUSMINUS=1225
;   35 def unsg byte    37    - T_PLUSASS=1230
;   36 def unsg byte    38    - T_MINUSASS=1231
;   37 def unsg byte    39    - T_MULASS=1232
;   38 def unsg byte    40    - T_DIVASS=1233
;   39 def unsg byte    41    - T_ANDASS=1234
;   40 def unsg byte    42    - T_ORASS=1235
;   41 def unsg byte    43    - T_LESSLESS=1240
;   42 def unsg byte    44    - T_GREATGREAT=1241
;   43 def unsg byte    45    - COMAX=3000
;   44 def unsg byte    46    - CMDLENMAX=67
;   45 var unsg word    47    3 ORGDATAORIG
;   46 var unsg word    47   10 orgData
;   47 arr sign byte    48    4 co[3000]
;   48 var sign word    48    4 maxco
;   49 var sign word    48    3 maxco1
;   50 arr sign byte    49    2 coname[67]
;   51 ptr sign byte    49    5 cloc
;   52 var sign word    50    6 fdin
;   53 var sign word    50    4 fdout
;   54 arr sign byte    50  104 symbol[128]
;   55 arr sign byte    51   12 fname[67]
;   56 arr sign byte    51   10 namein[67]
;   57 arr sign byte    52    7 namelst[67]
;   58 arr sign byte    52    2 archivename[67]
;   59 var sign word    53   41 token
;   60 var sign byte    53    2 globC
;   61 var sign word    53    3 spalte
;   62 var sign byte    54   28 thechar
;   63 var sign word    54    9 iscmp
;   64 var sign word    54    4 nconst
;   65 var sign word    55    3 nreturn
;   66 var sign word    55   12 nlabel
;   67 var sign word    56   24 GTop
;   68 var sign word    56   20 LTop
;   69 var unsg word    57   44 lexval
;   70 var sign word    58    6 typei
;   71 var sign byte    58    8 istype
;   72 arr sign byte    58   11 GType[300]
;   73 var sign word    59    6 signi
;   74 var sign byte    59    5 issign
;   75 arr sign byte    59    5 GSign[300]
;   76 var sign word    60    9 widthi
;   77 var sign byte    60   19 iswidth
;   78 arr sign byte    60    5 GWidth[300]
;   79 arr sign word    61    4 GAdr[300]
;   80 arr sign word    61    6 GUsed[300]
;   81 var sign word    62   26 wi
;   82 arr sign word    62   11 GData[300]
;   83 arr sign byte    62    2 GNameField[4800]
;   84 var sign word    63   13 FTop
;   85 var sign word    63    8 CTop
;   86 arr sign byte    64    2 FType[300]
;   87 arr sign byte    64    3 CType[2000]
;   88 arr sign word    65    2 FAdr[300]
;   89 arr sign word    65    4 CAdr[2000]
;   90 arr sign word    66    4 FCalls[300]
;   91 arr sign byte    67    5 FNameField[4800]
;   92 arr sign byte    68    7 NameA[32]
;   93 arr sign byte    69    5 fgetsdest[128]
;   94 ptr unsg byte    69    8 CNameTop
;   95 ptr unsg byte    70   10 fgetsp
;   96 var unsg word    70    4 segE
;   97 var unsg word    71   12 lineno
;   98 var unsg word    71    2 linenoinclude
;   99 ptr unsg byte    72   17 pt
;  100 ptr unsg byte    72    8 p1
;  101 var sign word    73    9 DOS_ERR
;  102 var sign word    73    5 DOS_NoBytes
;  103 var sign byte    73    3 DOS_ByteRead
;  104 arr sign byte   132    2 doglobName[15]
;  105 var sign word   298    5 mod1
;  106 var sign word   298   12 ireg1
;  107 var sign word   298    6 idx1
;  108 var sign word   298    1 ids1
;  109 var sign word   298    4 idw1
;  110 var sign word   298    2 idt1
;  111 var sign word   298 NULL val1
;  112 var sign word   299    2 mod2
;  113 var sign word   299    6 ireg2
;  114 var sign word   299    6 idx2
;  115 var sign word   299    1 ids2
;  116 var sign word   299    4 idw2
;  117 var sign word   299    2 idt2
;  118 var sign word   299    2 val2
;  119 arr sign byte   364    9 ops[5]
;  120 arr sign byte   406    3 printregstr[74]
;  121 var sign word   414    1 evalue
;  122 var sign word   414    1 exprtype
;  123 arr sign word   566    2 docalltype[10]
;  124 arr sign word   566    2 docallvalue[10]
;  125 arr sign byte   567    2 procname[17]
;  126 ptr sign byte   622    1 arglen
;  127 ptr sign byte   622    2 argv
;  128 arr sign byte   763    2 symboltemp[80]
;  129 var unsg word   944    1 MAXUI


;   # Calls Line Width  Name   list of functions

;    0    4   75   writetty
;    1    2   76   putch
;    2    6   77   cputs
;    3    4   78   mkneg
;    4    8   80   DosInt
;    5    2   85   openR
;    6    1   86   creatR
;    7    2   87   fcloseR
;    8    3   88   exitR
;    9    2   89   readRL
;   10    1   90   fputcR
;   11    8   93   strlen
;   12   24   94   strcpy
;   13   74   95   eqstr
;   14    2   98   instr1
;   15    1   99   strcat1
;   16    1  100   toupper
;   17    1  101   pint
;   18    3  103   digit
;   19    1  108   letter
;   20    3  118   alnum
;   21    4  123   a
;   22   21  124   v
;   23    4  129   checknamelen
;   24    1  133   doglob
;   25   12  182   gettypes
;   26    9  191   adrofname
;   27    7  192   adrF
;   28    4  194   printName
;   29   12  198   searchname
;   30    3  202   checkName
;   31   10  207   typeName
;   32    3  223   name1
;   33    1  228   storecall
;   34    2  234   storefunc
;   35    2  238   addlocal
;   36    1  244   checkFunction
;   37    1  247   dofunc
;   38    1  288   isvariable
;   39    3  301   pexpr
;   40    1  308   constantexpr
;   41    3  318   exprstart
;   42    1  320   expr2
;   43    3  365   doreg1
;   44    6  384   checkreg
;   45    6  409   printreg
;   46    2  415   expr
;   47    4  464   compoundass
;   48    2  471   dovar1
;   49    8  492   rterm
;   50    1  505   isreg
;   51   15  523   doreg
;   52    1  529   doassign
;   53    1  547   domul
;   54    2  551   doidiv
;   55    1  564   domod
;   56    1  568   docall1
;   57 NULL  610   main
;   58    2  621   getfirstchar
;   59    1  623   getarg
;   60    2  641   parse
;   61    1  650   checkcalls
;   62    1  667   doinclude
;   63    1  678   dodefine
;   64    6  694   stmt
;   65    1  725   doemit
;   66    3  729   cmpneg
;   67    7  742   prlabel
;   68    3  743   prjump
;   69    1  744   doif
;   70    1  750   dodo
;   71    1  754   dowhile
;   72    4  757   isrelational
;   73   17  764   getlex
;   74    1  816   convertdefine
;   75    1  823   getdigit
;   76    1  832   getstring
;   77   31  835   next
;   78   78  836   istoken
;   79   36  837   expect
;   80    6  840   eprc
;   81    5  841   eprs
;   82   42  842   prc
;   83    3  847   prscomment
;   84    8  849   prnl
;   85  249  851   prs
;   86    2  856   eprnum
;   87   15  858   pint1
;   88   27  860   prunsign1
;   89   25  863   printint51
;   90    2  867   fgets1
;   91    1  871   printinputline
;   92    2  879   end1
;   93   50  880   error1
;   94    2  889   listproc
;   95    2  897   listvar
;   96    1  913   listcall
;   97    1  916   calllisting
;   98    1  922   countcalls
;   99    1  930   listfunc
;  100    1  934   funclisting
;  101    1  945   epilog
;  102    1  977   setblock
;  103    1  979   allocmem
;  104 NULL  983   copyF
;  105    1  989   to_far
;  106    3  997   from_far
;  107 NULL 1005   LastFunctionByt

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
;   10    73 prc
;   11    77 mkneg
;   12    83 pint
;   13    88 putch
;   14    94 digit
;   15   100 letter
;   16   107 printName
;   17   117 prc
;   18   121 printName
;   19   131 prc
;   20   135 strlen
;   21   142 error1
;   22   149 error1
;   23   156 error1
;   24   163 checknamelen
;   25   176 checkName
;   26   186 error1
;   27   193 istoken
;   28   201 istoken
;   29   209 prs
;   30   213 prunsign1
;   31   223 prs
;   32   227 prs
;   33   231 prs
;   34   235 prs
;   35   239 prs
;   36   243 prunsign1
;   37   253 prs
;   38   257 expect
;   39   264 expect
;   40   271 error1
;   41   278 prs
;   42   282 prs
;   43   286 prs
;   44   290 strcpy
;   45   297 expect
;   46   304 istoken
;   47   312 prc
;   48   316 prscomment
;   49   327 prc
;   50   331 prs
;   51   335 strlen
;   52   342 istoken
;   53   350 prc
;   54   354 expect
;   55   361 prunsign1
;   56   371 istoken
;   57   379 expect
;   58   386 error1
;   59   393 prs
;   60   397 prs
;   61   401 prs
;   62   405 prs
;   63   409 prs
;   64   413 prs
;   65   417 istoken
;   66   425 prc
;   67   429 istoken
;   68   437 expect
;   69   444 prunsign1
;   70   454 prunsign1
;   71   464 adrofname
;   72   474 strcpy
;   73   481 strcpy
;   74   488 expect
;   75   495 adrF
;   76   500 adrofname
;   77   510 prs
;   78   514 prs
;   79   518 prc
;   80   522 pint1
;   81   528 prc
;   82   532 checkName
;   83   542 error1
;   84   549 adrofname
;   85   559 eqstr
;   86   565 adrofname
;   87   575 eqstr
;   88   581 istoken
;   89   589 istoken
;   90   597 istoken
;   91   605 istoken
;   92   613 istoken
;   93   621 istoken
;   94   629 istoken
;   95   637 istoken
;   96   645 name1
;   97   651 error1
;   98   658 getlex
;   99   665 error1
;  100   672 error1
;  101   679 strlen
;  102   686 to_far
;  103   693 error1
;  104   700 adrF
;  105   705 strcpy
;  106   712 error1
;  107   719 checkName
;  108   729 error1
;  109   736 adrF
;  110   741 strcpy
;  111   748 adrF
;  112   753 eqstr
;  113   759 checknamelen
;  114   772 strcpy
;  115   779 checkFunction
;  116   793 error1
;  117   800 storefunc
;  118   810 prs
;  119   814 prs
;  120   818 prs
;  121   822 expect
;  122   829 istoken
;  123   837 typeName
;  124   846 addlocal
;  125   855 istoken
;  126   863 expect
;  127   870 expect
;  128   877 isvariable
;  129   888 typeName
;  130   897 checknamelen
;  131   910 addlocal
;  132   919 istoken
;  133   927 expect
;  134   934 expect
;  135   941 istoken
;  136   949 expect
;  137   956 listproc
;  138   965 prs
;  139   969 mkneg
;  140   975 pint1
;  141   981 prs
;  142   985 istoken
;  143   993 stmt
;  144   998 prs
;  145  1002 prs
;  146  1006 prc
;  147  1010 prs
;  148  1014 prs
;  149  1018 prs
;  150  1022 strlen
;  151  1029 strcpy
;  152  1036 prs
;  153  1040 expect
;  154  1047 eqstr
;  155  1053 constantexpr
;  156  1066 checkreg
;  157  1075 doreg1
;  158  1082 exprstart
;  159  1092 prs
;  160  1096 prs
;  161  1100 expect
;  162  1107 getlex
;  163  1114 typeName
;  164  1123 searchname
;  165  1134 gettypes
;  166  1143 isrelational
;  167  1156 error1
;  168  1163 expect
;  169  1170 prs
;  170  1174 prs
;  171  1178 gettypes
;  172  1187 prs
;  173  1191 prs
;  174  1195 v
;  175  1197 prs
;  176  1201 prunsign1
;  177  1211 cmpneg
;  178  1218 prs
;  179  1222 expect
;  180  1229 eqstr
;  181  1235 expr2
;  182  1241 expr
;  183  1246 getlex
;  184  1253 typeName
;  185  1262 error1
;  186  1269 checkreg
;  187  1278 doreg1
;  188  1285 searchname
;  189  1296 gettypes
;  190  1305 error1
;  191  1312 isrelational
;  192  1325 error1
;  193  1332 istoken
;  194  1340 error1
;  195  1347 istoken
;  196  1355 prs
;  197  1359 prs
;  198  1363 prs
;  199  1367 prs
;  200  1371 prs
;  201  1375 v
;  202  1377 prs
;  203  1381 prunsign1
;  204  1391 adrofname
;  205  1401 prs
;  206  1405 prs
;  207  1409 typeName
;  208  1418 checkreg
;  209  1427 prs
;  210  1431 printreg
;  211  1440 v
;  212  1442 prs
;  213  1446 printreg
;  214  1455 error1
;  215  1462 searchname
;  216  1473 gettypes
;  217  1482 error1
;  218  1489 prs
;  219  1493 printreg
;  220  1502 error1
;  221  1509 prs
;  222  1513 a
;  223  1515 prs
;  224  1519 prs
;  225  1523 prs
;  226  1527 v
;  227  1529 adrofname
;  228  1539 prs
;  229  1543 prs
;  230  1547 error1
;  231  1554 istoken
;  232  1562 strcpy
;  233  1569 istoken
;  234  1577 strcpy
;  235  1584 istoken
;  236  1592 strcpy
;  237  1599 istoken
;  238  1607 strcpy
;  239  1614 istoken
;  240  1622 strcpy
;  241  1629 istoken
;  242  1637 strcpy
;  243  1644 istoken
;  244  1652 strcpy
;  245  1659 getlex
;  246  1666 isrelational
;  247  1679 error1
;  248  1686 strcpy
;  249  1693 prnl
;  250  1698 prs
;  251  1702 prs
;  252  1706 printreg
;  253  1715 prs
;  254  1719 istoken
;  255  1727 prunsign1
;  256  1737 typeName
;  257  1746 checkreg
;  258  1755 printreg
;  259  1764 searchname
;  260  1775 a
;  261  1777 v
;  262  1779 cmpneg
;  263  1786 prs
;  264  1790 expect
;  265  1797 strlen
;  266  1804 eqstr
;  267  1810 eqstr
;  268  1816 eqstr
;  269  1822 eqstr
;  270  1828 eqstr
;  271  1834 eqstr
;  272  1840 eqstr
;  273  1846 eqstr
;  274  1852 eqstr
;  275  1858 eqstr
;  276  1864 eqstr
;  277  1870 eqstr
;  278  1876 eqstr
;  279  1882 eqstr
;  280  1888 eqstr
;  281  1894 eqstr
;  282  1900 eqstr
;  283  1906 eqstr
;  284  1912 eqstr
;  285  1918 eqstr
;  286  1924 eqstr
;  287  1930 eqstr
;  288  1936 strlen
;  289  1943 eqstr
;  290  1949 eqstr
;  291  1955 eqstr
;  292  1961 eqstr
;  293  1967 eqstr
;  294  1973 eqstr
;  295  1979 eqstr
;  296  1985 eqstr
;  297  1991 eqstr
;  298  1997 prc
;  299  2001 prc
;  300  2005 prc
;  301  2009 istoken
;  302  2017 prs
;  303  2021 prunsign1
;  304  2031 typeName
;  305  2040 checkreg
;  306  2049 doreg1
;  307  2056 docall1
;  308  2064 isreg
;  309  2070 searchname
;  310  2081 gettypes
;  311  2090 istoken
;  312  2098 istoken
;  313  2106 expect
;  314  2113 searchname
;  315  2124 expect
;  316  2131 expect
;  317  2138 gettypes
;  318  2147 error1
;  319  2154 istoken
;  320  2162 error1
;  321  2169 prs
;  322  2173 prs
;  323  2177 prs
;  324  2181 v
;  325  2183 istoken
;  326  2191 error1
;  327  2198 prs
;  328  2202 prs
;  329  2206 prs
;  330  2210 v
;  331  2212 istoken
;  332  2220 compoundass
;  333  2232 istoken
;  334  2240 compoundass
;  335  2252 istoken
;  336  2260 compoundass
;  337  2272 istoken
;  338  2280 compoundass
;  339  2292 istoken
;  340  2300 error1
;  341  2307 istoken
;  342  2315 error1
;  343  2322 istoken
;  344  2330 expr
;  345  2335 doassign
;  346  2344 dovar1
;  347  2351 istoken
;  348  2359 rterm
;  349  2365 istoken
;  350  2373 rterm
;  351  2379 istoken
;  352  2387 rterm
;  353  2393 istoken
;  354  2401 rterm
;  355  2407 istoken
;  356  2415 rterm
;  357  2421 istoken
;  358  2429 rterm
;  359  2435 istoken
;  360  2443 domul
;  361  2449 istoken
;  362  2457 doidiv
;  363  2464 istoken
;  364  2472 domod
;  365  2478 isrelational
;  366  2491 rterm
;  367  2497 cmpneg
;  368  2504 error1
;  369  2511 prnl
;  370  2516 prs
;  371  2520 prs
;  372  2524 gettypes
;  373  2533 prs
;  374  2537 prs
;  375  2541 v
;  376  2543 prs
;  377  2547 expect
;  378  2554 prunsign1
;  379  2564 gettypes
;  380  2573 prs
;  381  2577 v
;  382  2579 prnl
;  383  2584 prs
;  384  2588 prs
;  385  2592 prs
;  386  2596 prnl
;  387  2601 prs
;  388  2605 prs
;  389  2609 a
;  390  2611 prs
;  391  2615 v
;  392  2617 prs
;  393  2621 prs
;  394  2625 prs
;  395  2629 prs
;  396  2633 prs
;  397  2637 prc
;  398  2641 printName
;  399  2651 prs
;  400  2655 prnl
;  401  2660 prs
;  402  2664 prs
;  403  2668 prs
;  404  2672 prs
;  405  2676 v
;  406  2678 istoken
;  407  2686 prnl
;  408  2691 prs
;  409  2695 prs
;  410  2699 prs
;  411  2703 prs
;  412  2707 prunsign1
;  413  2717 typeName
;  414  2726 searchname
;  415  2737 istoken
;  416  2745 searchname
;  417  2756 expect
;  418  2763 expect
;  419  2770 gettypes
;  420  2779 error1
;  421  2786 eqstr
;  422  2792 dovar1
;  423  2799 eqstr
;  424  2805 doreg
;  425  2811 eqstr
;  426  2817 doreg
;  427  2823 eqstr
;  428  2829 doreg
;  429  2835 eqstr
;  430  2841 doreg
;  431  2847 eqstr
;  432  2853 doreg
;  433  2859 eqstr
;  434  2865 doreg
;  435  2871 eqstr
;  436  2877 doreg
;  437  2883 eqstr
;  438  2889 doreg
;  439  2895 eqstr
;  440  2901 doreg
;  441  2907 eqstr
;  442  2913 doreg
;  443  2919 eqstr
;  444  2925 doreg
;  445  2931 eqstr
;  446  2937 doreg
;  447  2943 eqstr
;  448  2949 doreg
;  449  2955 eqstr
;  450  2961 doreg
;  451  2967 eqstr
;  452  2973 doreg
;  453  2979 expect
;  454  2986 prs
;  455  2990 prs
;  456  2994 prs
;  457  2998 istoken
;  458  3006 prunsign1
;  459  3016 istoken
;  460  3024 searchname
;  461  3035 v
;  462  3037 error1
;  463  3044 gettypes
;  464  3053 prs
;  465  3057 v
;  466  3059 prs
;  467  3063 prs
;  468  3067 prs
;  469  3071 a
;  470  3073 prs
;  471  3077 prs
;  472  3081 prunsign1
;  473  3091 v
;  474  3093 prs
;  475  3097 prs
;  476  3101 printName
;  477  3111 prs
;  478  3115 prs
;  479  3119 prs
;  480  3123 prs
;  481  3127 v
;  482  3129 prs
;  483  3133 prs
;  484  3137 prs
;  485  3141 v
;  486  3143 prs
;  487  3147 prs
;  488  3151 prs
;  489  3155 v
;  490  3157 prs
;  491  3161 rterm
;  492  3167 istoken
;  493  3175 prs
;  494  3179 prunsign1
;  495  3189 prs
;  496  3193 error1
;  497  3200 istoken
;  498  3208 prs
;  499  3212 prunsign1
;  500  3222 prs
;  501  3226 prs
;  502  3230 typeName
;  503  3239 searchname
;  504  3250 error1
;  505  3257 gettypes
;  506  3266 error1
;  507  3273 error1
;  508  3280 prs
;  509  3284 v
;  510  3286 prs
;  511  3290 prs
;  512  3294 doidiv
;  513  3301 prs
;  514  3305 checknamelen
;  515  3318 strcpy
;  516  3325 storecall
;  517  3335 expect
;  518  3342 istoken
;  519  3350 error1
;  520  3357 istoken
;  521  3365 istoken
;  522  3373 eprs
;  523  3378 eprs
;  524  3383 eprc
;  525  3388 eprnum
;  526  3395 eprs
;  527  3400 eprc
;  528  3405 eprs
;  529  3410 eprc
;  530  3415 eprs
;  531  3420 istoken
;  532  3428 name1
;  533  3434 searchname
;  534  3445 istoken
;  535  3453 checkreg
;  536  3462 searchname
;  537  3473 error1
;  538  3480 istoken
;  539  3488 expect
;  540  3495 prs
;  541  3499 pint1
;  542  3505 prs
;  543  3509 prs
;  544  3513 prc
;  545  3517 pint1
;  546  3523 prs
;  547  3527 v
;  548  3529 prs
;  549  3533 gettypes
;  550  3542 prs
;  551  3546 v
;  552  3548 prs
;  553  3552 v
;  554  3554 prs
;  555  3558 prs
;  556  3562 printreg
;  557  3571 prs
;  558  3575 prs
;  559  3579 prs
;  560  3583 pint1
;  561  3589 getarg
;  562  3596 setblock
;  563  3605 error1
;  564  3612 allocmem
;  565  3621 error1
;  566  3628 getfirstchar
;  567  3641 parse
;  568  3647 checkcalls
;  569  3658 epilog
;  570  3665 fgets1
;  571  3672 cputs
;  572  3678 cputs
;  573  3684 readRL
;  574  3691 prnl
;  575  3696 strcpy
;  576  3703 instr1
;  577  3710 strcat1
;  578  3718 toupper
;  579  3726 strcpy
;  580  3733 strlen
;  581  3740 openR
;  582  3746 cputs
;  583  3752 cputs
;  584  3758 exitR
;  585  3764 creatR
;  586  3771 cputs
;  587  3777 cputs
;  588  3783 exitR
;  589  3789 prs
;  590  3793 prs
;  591  3797 prs
;  592  3801 prs
;  593  3805 prs
;  594  3809 prs
;  595  3813 prs
;  596  3817 getlex
;  597  3824 istoken
;  598  3832 istoken
;  599  3840 dodefine
;  600  3849 istoken
;  601  3857 doinclude
;  602  3867 error1
;  603  3874 typeName
;  604  3883 dofunc
;  605  3890 doglob
;  606  3897 prs
;  607  3901 from_far
;  608  3910 adrF
;  609  3915 eqstr
;  610  3921 prs
;  611  3925 prs
;  612  3929 prs
;  613  3933 printint51
;  614  3944 error1
;  615  3951 prs
;  616  3955 prs
;  617  3959 prs
;  618  3963 openR
;  619  3969 prs
;  620  3973 prs
;  621  3977 error1
;  622  3984 parse
;  623  3990 prs
;  624  3994 prs
;  625  3998 getfirstchar
;  626  4011 getlex
;  627  4018 eqstr
;  628  4024 getlex
;  629  4031 eqstr
;  630  4037 getlex
;  631  4044 prs
;  632  4048 strcpy
;  633  4055 prs
;  634  4059 error1
;  635  4066 getlex
;  636  4073 expect
;  637  4080 error1
;  638  4087 strlen
;  639  4094 error1
;  640  4101 adrofname
;  641  4111 strcpy
;  642  4118 expect
;  643  4125 istoken
;  644  4133 istoken
;  645  4141 stmt
;  646  4146 istoken
;  647  4154 doif
;  648  4159 istoken
;  649  4167 dodo
;  650  4172 istoken
;  651  4180 dowhile
;  652  4188 istoken
;  653  4196 prs
;  654  4200 name1
;  655  4206 prs
;  656  4210 expect
;  657  4217 prs
;  658  4221 next
;  659  4226 prc
;  660  4230 next
;  661  4235 getlex
;  662  4242 istoken
;  663  4250 prs
;  664  4254 next
;  665  4259 prc
;  666  4263 next
;  667  4268 getlex
;  668  4275 error1
;  669  4282 istoken
;  670  4290 doemit
;  671  4297 istoken
;  672  4305 istoken
;  673  4313 exprstart
;  674  4323 prs
;  675  4327 prs
;  676  4331 expect
;  677  4338 prs
;  678  4342 prs
;  679  4346 prc
;  680  4350 expect
;  681  4357 expect
;  682  4364 exprstart
;  683  4374 expect
;  684  4381 prs
;  685  4385 getlex
;  686  4392 prunsign1
;  687  4402 getlex
;  688  4409 prc
;  689  4413 expect
;  690  4420 prs
;  691  4424 prs
;  692  4428 prs
;  693  4432 prs
;  694  4436 prs
;  695  4440 prunsign1
;  696  4450 prs
;  697  4454 prs
;  698  4458 prunsign1
;  699  4468 prs
;  700  4472 prs
;  701  4476 prs
;  702  4480 error1
;  703  4487 prs
;  704  4491 prs
;  705  4495 pint1
;  706  4501 prc
;  707  4505 prs
;  708  4509 prs
;  709  4513 pint1
;  710  4519 pexpr
;  711  4525 pint1
;  712  4531 stmt
;  713  4536 istoken
;  714  4544 prjump
;  715  4551 prlabel
;  716  4559 stmt
;  717  4564 prlabel
;  718  4572 prlabel
;  719  4580 prlabel
;  720  4588 stmt
;  721  4593 expect
;  722  4600 pexpr
;  723  4606 pint1
;  724  4612 prjump
;  725  4619 prlabel
;  726  4627 prlabel
;  727  4635 pexpr
;  728  4641 pint1
;  729  4647 stmt
;  730  4652 prjump
;  731  4659 prlabel
;  732  4667 getlex
;  733  4674 next
;  734  4679 next
;  735  4684 next
;  736  4689 next
;  737  4694 next
;  738  4699 next
;  739  4704 next
;  740  4709 next
;  741  4714 next
;  742  4719 next
;  743  4724 next
;  744  4729 next
;  745  4734 next
;  746  4739 next
;  747  4744 next
;  748  4749 instr1
;  749  4756 next
;  750  4761 getlex
;  751  4768 next
;  752  4773 next
;  753  4778 getlex
;  754  4785 getstring
;  755  4795 digit
;  756  4801 getdigit
;  757  4810 next
;  758  4815 next
;  759  4820 next
;  760  4825 alnum
;  761  4831 strcpy
;  762  4838 alnum
;  763  4844 next
;  764  4849 eqstr
;  765  4855 eqstr
;  766  4861 eqstr
;  767  4867 eqstr
;  768  4873 eqstr
;  769  4879 eqstr
;  770  4885 eqstr
;  771  4891 eqstr
;  772  4897 eqstr
;  773  4903 eqstr
;  774  4909 eqstr
;  775  4915 eqstr
;  776  4921 eqstr
;  777  4927 eqstr
;  778  4933 eqstr
;  779  4939 eqstr
;  780  4945 eqstr
;  781  4951 convertdefine
;  782  4965 strcpy
;  783  4972 error1
;  784  4979 adrofname
;  785  4989 eqstr
;  786  4995 next
;  787  5000 alnum
;  788  5006 next
;  789  5011 digit
;  790  5017 next
;  791  5022 next
;  792  5027 next
;  793  5032 fgets1
;  794  5039 getlex
;  795  5046 istoken
;  796  5054 prs
;  797  5058 listproc
;  798  5067 prs
;  799  5071 pint1
;  800  5077 error1
;  801  5084 eprc
;  802  5089 writetty
;  803  5098 writetty
;  804  5107 fputcR
;  805  5114 prc
;  806  5118 prs
;  807  5122 prc
;  808  5126 eprc
;  809  5131 mkneg
;  810  5137 eprnum
;  811  5144 eprc
;  812  5149 prc
;  813  5153 mkneg
;  814  5159 pint1
;  815  5165 prc
;  816  5169 prunsign1
;  817  5179 prc
;  818  5183 prc
;  819  5187 prc
;  820  5191 prc
;  821  5195 prc
;  822  5199 prunsign1
;  823  5209 printinputline
;  824  5224 readRL
;  825  5231 prs
;  826  5235 prunsign1
;  827  5245 prc
;  828  5249 prscomment
;  829  5260 fcloseR
;  830  5268 fcloseR
;  831  5276 exitR
;  832  5282 prnl
;  833  5287 prscomment
;  834  5298 prs
;  835  5302 prunsign1
;  836  5312 prs
;  837  5316 prs
;  838  5320 prs
;  839  5324 pint1
;  840  5330 prs
;  841  5334 prunsign1
;  842  5344 prs
;  843  5348 prc
;  844  5352 prs
;  845  5356 pint1
;  846  5362 prs
;  847  5366 prs
;  848  5370 end1
;  849  5375 prs
;  850  5379 prs
;  851  5383 prs
;  852  5387 prunsign1
;  853  5397 prs
;  854  5401 listvar
;  855  5409 prs
;  856  5413 printint51
;  857  5424 prc
;  858  5428 prs
;  859  5432 prs
;  860  5436 prs
;  861  5440 prs
;  862  5444 prs
;  863  5448 prs
;  864  5452 prs
;  865  5456 prs
;  866  5460 prs
;  867  5464 printint51
;  868  5475 printint51
;  869  5486 prs
;  870  5490 prs
;  871  5494 prc
;  872  5498 adrofname
;  873  5508 prs
;  874  5512 prc
;  875  5516 prunsign1
;  876  5526 prc
;  877  5530 prunsign1
;  878  5540 prc
;  879  5544 prs
;  880  5548 prc
;  881  5552 pint1
;  882  5558 prs
;  883  5562 calllisting
;  884  5574 prs
;  885  5578 printint51
;  886  5589 prc
;  887  5593 prs
;  888  5597 printint51
;  889  5608 prc
;  890  5612 from_far
;  891  5621 prs
;  892  5625 adrF
;  893  5630 from_far
;  894  5639 eqstr
;  895  5645 prs
;  896  5649 countcalls
;  897  5660 funclisting
;  898  5672 prs
;  899  5676 printint51
;  900  5687 printint51
;  901  5698 prs
;  902  5702 printint51
;  903  5713 prc
;  904  5717 prs
;  905  5721 prs
;  906  5725 prs
;  907  5729 prs
;  908  5733 prc
;  909  5737 prc
;  910  5741 adrF
;  911  5746 prs
;  912  5750 strcpy
;  913  5757 storefunc
;  914  5767 prs
;  915  5771 prs
;  916  5775 listvar
;  917  5783 listfunc
;  918  5792 listcall
;  919  5801 prs
;  920  5805 prs
;  921  5809 prs
;  922  5813 prs
;  923  5817 prs
;  924  5821 printint51
;  925  5832 prs
;  926  5836 printint51
;  927  5847 prs
;  928  5851 printint51
;  929  5862 prs
;  930  5866 printint51
;  931  5877 prs
;  932  5881 printint51
;  933  5892 prs
;  934  5896 printint51
;  935  5907 prs
;  936  5911 printint51
;  937  5922 prs
;  938  5926 printint51
;  939  5937 prs
;  940  5941 printint51
;  941  5952 prs
;  942  5956 printint51
;  943  5967 prs
;  944  5971 printint51
;  945  5982 prs
;  946  5986 printint51
;  947  5997 prs
;  948  6001 prs
;  949  6005 prunsign1
;  950  6015 prs
;  951  6019 printint51
;  952  6030 prs
;  953  6034 prs
;  954  6038 prs
;  955  6042 prs
;  956  6046 printint51
;  957  6057 prs
;  958  6061 printint51
;  959  6072 prs
;  960  6076 printint51
;  961  6087 prs
;  962  6091 end1
;  963  6096 DosInt
;  964  6103 DosInt
;Input: A.C, List: A.S,  Lines: 1006
;Glob. variables:  129 max.:  200
;Functions      :  108 max.:  300
;Calls          :  965 max.: 2000, NameField: 6110 max.:    65535
;Code until     :21711 max.: 30000, free: 8289
;Data (HeapEnd) :53548, resting stacksize: 11987
;Max. Const in 'epilog' :  947 max. 3000, free: 2053