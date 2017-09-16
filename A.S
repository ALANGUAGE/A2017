
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
 jmp .retn

;-94 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }

 .retn: LEAVE
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
 jmp .retn
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
 jmp .retn
.eqstr11:
 mov ax, 1
 jmp .retn

;-98 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}

 .retn: LEAVE
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
 jmp .retn
.instr114:
 inc  word[bp+4]
 jmp .instr112
.instr113:
 mov ax, 0
 jmp .retn

;-99 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }

 .retn: LEAVE
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
 jmp .retn

;-105     if(c>'9') return 0; 

.digit23:
 mov al, [bp+4]
 cmp al, 57
 jle .digit24
 mov ax, 0
 jmp .retn

;-106     return 1; 

.digit24:
 mov ax, 1
 jmp .retn

;-107 }


;-108 int letter(char c) { 

 .retn: LEAVE
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
 jmp .retn

;-110     if (c=='.') return 1;

.letter25:
 mov al, [bp+4]
 cmp al, 46
 jne .letter26
 mov ax, 1
 jmp .retn

;-111     if (c=='?') return 1;

.letter26:
 mov al, [bp+4]
 cmp al, 63
 jne .letter27
 mov ax, 1
 jmp .retn

;-112     if (c=='$') return 1;

.letter27:
 mov al, [bp+4]
 cmp al, 36
 jne .letter28
 mov ax, 1
 jmp .retn

;-113     if (c> 'z') return 0; 

.letter28:
 mov al, [bp+4]
 cmp al, 122
 jle .letter29
 mov ax, 0
 jmp .retn

;-114     if (c< '@') return 0;// at included

.letter29:
 mov al, [bp+4]
 cmp al, 64
 jge .letter30
 mov ax, 0
 jmp .retn

;-115     if (c> 'Z') { if (c< 'a') return 0; }  

.letter30:
 mov al, [bp+4]
 cmp al, 90
 jle .letter31
 mov al, [bp+4]
 cmp al, 97
 jge .letter32
 mov ax, 0
 jmp .retn
.letter32:

;-116     return 1; 

.letter31:
 mov ax, 1
 jmp .retn

;-117 }    


;-118 int alnum(char c) {

 .retn: LEAVE
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
 jmp .retn

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
 jmp .retn

;-121   return 0;

.alnum34:
 mov ax, 0
 jmp .retn

;-122 }       


;-123 int a(unsigned int i) {  printName(i);}//address

 .retn: LEAVE
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
; ENDP
checknamelen_0 db "Item name is too long in characters)",0
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
; ENDP
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
 jmp .retn

;-191 int adrofname(unsigned int i) { adrF(GNameField, i); }

 .retn: LEAVE
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
; ENDP
printName_0 db "[bp",0

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
 jmp .retn

;-201 }


;-202 int checkName() { unsigned int i; unsigned int j;

 .retn: LEAVE
 ret
; ENDP
searchname_0 db "Variable unknown",0

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
 jmp .retn
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
 jmp .retn
.checkName85:
 inc  word[bp-2]

;-205   return 0;

 jmp .checkName83
.checkName84:
 mov ax, 0
 jmp .retn

;-206 }    


;-207 int typeName() { int m; //0=V,1=*,2=&

 .retn: LEAVE
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
 jmp .retn

;-222 }


;-223 int name1() {

 .retn: LEAVE
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
; ENDP
name1_0 db "Name expected",0

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
; ENDP
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0

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
; ENDP
storefunc_0 db "Function table full",0

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
; ENDP
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0

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
 jmp .retn
.checkFunction102:
 inc  word[bp-2]

;-246   return 0; }

 jmp .checkFunction100
.checkFunction101:
 mov ax, 0
 jmp .retn

;-247 int dofunc() { int nloc; int i; int narg;  

 .retn: LEAVE
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

;-276   if (nreturn) { prs("\n .retn:");}

 jmp .dofunc115
.dofunc116:
 mov ax, [nreturn]
 or  al, al
 je .dofunc117
 push dofunc_5
 call prs
 add  sp, 2

;-277   if (LTop > LSTART) prs(" LEAVE");

.dofunc117:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc118
 push dofunc_6
 call prs
 add  sp, 2

;-278   prs("\n ret"); prs("\n; ENDP"); 

.dofunc118:
 push dofunc_7
 call prs
 add  sp, 2
 push dofunc_8
 call prs
 add  sp, 2

;-279   *cloc=0; prs(co); maxco1=strlen(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-280   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

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

;-281 }

.dofunc119:

;-282 int isvariable() {
 LEAVE
 ret
; ENDP
dofunc_0 db "Function already defined",0
dofunc_1 db "\n\n",0
dofunc_2 db ":  ; *** PROC ***",0
dofunc_3 db ";\n ENTER  ",0
dofunc_4 db ",0",0
dofunc_5 db "\n .retn:",0
dofunc_6 db " LEAVE",0
dofunc_7 db "\n ret",0
dofunc_8 db "\n; ENDP",0

isvariable:  ; *** PROC ***

;-283     if(token==T_SIGNED)   goto v1;   

 mov ax, [token]
 cmp ax, 531
 jne .isvariable120
 jmp .v1

;-284     if(token==T_UNSIGNED) goto v1;

.isvariable120:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable121
 jmp .v1

;-285     if(token==T_CHAR)     goto v1;   

.isvariable121:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable122
 jmp .v1

;-286     if(token==T_INT)      goto v1;

.isvariable122:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable123
 jmp .v1

;-287     if(token==T_LONG)     goto v1;

.isvariable123:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable124
 jmp .v1

;-288     return 0;  

.isvariable124:
 mov ax, 0
 jmp .retn

;-289 v1: return 1;

.v1:
 mov ax, 1
 jmp .retn

;-290 }


;-291                   


;-292 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;

 .retn:
 ret
; ENDP
mod1 dw 0
ireg1 dw 0
idx1 dw 0
ids1 dw 0
idw1 dw 0
idt1 dw 0
val1 dw 0

;-293 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

mod2 dw 0
ireg2 dw 0
idx2 dw 0
ids2 dw 0
idw2 dw 0
idt2 dw 0
val2 dw 0

;-294 


;-295 int pexpr() {expect('('); iscmp=0; 


pexpr:  ; *** PROC ***
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-296   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

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
 jmp .retn

;-297     ireg1=checkreg();

.pexpr126:
 call checkreg
 mov word [ireg1], ax

;-298     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr127
 push 1
 call doreg1
 add  sp, 2
 jmp .retn
.pexpr127:

;-299   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

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

;-300   expect(')'); }           /*error1("Vergleich fehlt");*/

 push 41
 call expect
 add  sp, 2

;-301 


;-302 int constantexpr() { int mode; int id1;int ids;

 .retn:
 ret
; ENDP
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0

constantexpr:  ; *** PROC ***

;-303   token=getlex();   mode=typeName();  

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   302 NULL mode = bp-2
;  201 var sign word   302 NULL id1 = bp-4
;  202 var sign word   302 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-304   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-305   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr129
 push constantexpr_0
 call error1
 add  sp, 2

;-306   expect(T_CONST);  prs(" ; constant expression");

.constantexpr129:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-307   prs("\ncmp "); 

 push constantexpr_2
 call prs
 add  sp, 2

;-308   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

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

;-309   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

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

;-310   expect(')');

 push 41
 call expect
 add  sp, 2

;-311 }  


;-312 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
 LEAVE
 ret
; ENDP
constantexpr_0 db "Relational expression expected",0
constantexpr_1 db " ; constant expression",0
constantexpr_2 db "\ncmp ",0
constantexpr_3 db "word",0
constantexpr_4 db "byte",0
constantexpr_5 db ", ",0

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

;-313 


;-314 int expr2(int kind) {  int i;

 ret
; ENDP
exprstart_0 db "_",0

expr2:  ; *** PROC ***

;-315   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   314 NULL kind = bp+4
;  201 var sign word   314 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  .expr2134
 call getlex
 mov word [token], ax

;-316   mod1=typeName();

.expr2134:
 call typeName
 mov word [mod1], ax

;-317   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je .expr2135
 push expr2_0
 call error1
 add  sp, 2

;-318   ireg1=checkreg();

.expr2135:
 call checkreg
 mov word [ireg1], ax

;-319   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr2136
 push 0
 call doreg1
 add  sp, 2
 jmp .retn

;-320   if (ireg1 == 0) { idx1=searchname();

.expr2136:
 mov ax, [ireg1]
 cmp ax, 0
 jne .expr2137
 call searchname
 mov word [idx1], ax

;-321     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-322     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je .expr2138
 push expr2_1
 call error1
 add  sp, 2
.expr2138:

;-323   


;-324   if (isrelational()) { error1("Vergleich noch nicht implementiert");

.expr2137:
 call isrelational
 or  al, al
 je .expr2139
 push expr2_2
 call error1
 add  sp, 2

;-325   }


;-326   if (istoken('=') == 0) error1("Assign expected");

.expr2139:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expr2140
 push expr2_3
 call error1
 add  sp, 2

;-327   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

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

;-328     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-329     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne .expr2142
 push expr2_6
 call prs
 add  sp, 2

;-330     if (idw1 == 2) prs("word ");

.expr2142:
 mov ax, [idw1]
 cmp ax, 2
 jne .expr2143
 push expr2_7
 call prs
 add  sp, 2

;-331     if (idw1 == 4) prs("dword ");

.expr2143:
 mov ax, [idw1]
 cmp ax, 4
 jne .expr2144
 push expr2_8
 call prs
 add  sp, 2

;-332     v(idx1);

.expr2144:
 push word [idx1]
 call v
 add  sp, 2

;-333     prs(", "); prunsign1(val2);

 push expr2_9
 call prs
 add  sp, 2
 push word [val2]
 call prunsign1
 add  sp, 2

;-334     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

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
 jmp .retn

;-335   


;-336   mod1=typeName(); ireg2=checkreg();

.expr2141:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-337   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je .expr2146
 push expr2_11
 call prs
 add  sp, 2

;-338     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}

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
 jmp .retn

;-339   else {

 jmp .expr2149
.expr2146:

;-340     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne .expr2150
 push expr2_13
 call error1
 add  sp, 2

;-341     


;-342     idx2=searchname();

.expr2150:
 call searchname
 mov word [idx2], ax

;-343     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-344     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne .expr2151
 push expr2_14
 call error1
 add  sp, 2

;-345     prs("\nmov ");

.expr2151:
 push expr2_15
 call prs
 add  sp, 2

;-346     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");

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

;-347     prs(", ");

.expr2153:
 push expr2_17
 call prs
 add  sp, 2

;-348     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne .expr2154
 push word [idx2]
 call a
 add  sp, 2

;-349     else {

 jmp .expr2155
.expr2154:

;-350       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne .expr2156
 push expr2_18
 call prs
 add  sp, 2

;-351       if (idw2 == 2) prs("word ");

.expr2156:
 mov ax, [idw2]
 cmp ax, 2
 jne .expr2157
 push expr2_19
 call prs
 add  sp, 2

;-352       if (idw2 == 4) prs("dword ");

.expr2157:
 mov ax, [idw2]
 cmp ax, 4
 jne .expr2158
 push expr2_20
 call prs
 add  sp, 2

;-353       v(idx2);

.expr2158:
 push word [idx2]
 call v
 add  sp, 2

;-354       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

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

;-355     return;

.expr2155:
 jmp .retn

;-356   } error1("Internal error: only const or reg allowed");

.expr2149:
 push expr2_22
 call error1
 add  sp, 2

;-357 }


;-358 char ops[5];

 .retn: LEAVE
 ret
; ENDP
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
section .bss
absolute 53406
ops resb 5
section .text

;-359 int doreg1(int iscmp1) { int i;


doreg1:  ; *** PROC ***

;-360   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   359 NULL iscmp1 = bp+4
;  201 var sign word   359 NULL i = bp-2;
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

;-361   if (istoken(T_PLUSASS))    strcpy(ops, "add");

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

;-362   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

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

;-363   if (istoken(T_ANDASS))     strcpy(ops, "and");

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

;-364   if (istoken(T_ORASS))      strcpy(ops, "or" );

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

;-365   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

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

;-366   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

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

;-367   if (iscmp1 == 1) { token=getlex();

.doreg1166:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1167
 call getlex
 mov word [token], ax

;-368       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1168
 push doreg1_7
 call error1
 add  sp, 2

;-369       strcpy(ops, "cmp"); }

.doreg1168:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-370   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

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

;-371 


;-372   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1169
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-373   mod2=typeName(); ireg2=checkreg();

.doreg1169:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-374   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1170
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-375   i=searchname();  if (mod2 == 2) a(i); else v(i);

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

;-376   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

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

;-377 }

.doreg1173:

;-378 int checkreg() { // >=17 = 16bit, >=47 = 32bit
 LEAVE
 ret
; ENDP
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

checkreg:  ; *** PROC ***

;-379   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg174
 mov ax, 0
 jmp .retn

;-380   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg174:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg175
 mov ax, 1
 jmp .retn
.checkreg175:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg176
 mov ax, 3
 jmp .retn

;-381   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg176:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg177
 mov ax, 5
 jmp .retn
.checkreg177:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg178
 mov ax, 7
 jmp .retn

;-382   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg178:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg179
 mov ax, 9
 jmp .retn
.checkreg179:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg180
 mov ax, 11
 jmp .retn

;-383   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg180:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg181
 mov ax, 13
 jmp .retn
.checkreg181:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg182
 mov ax, 15
 jmp .retn

;-384   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg182:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg183
 mov ax, 17
 jmp .retn
.checkreg183:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg184
 mov ax, 19
 jmp .retn

;-385   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg184:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg185
 mov ax, 21
 jmp .retn
.checkreg185:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg186
 mov ax, 23
 jmp .retn

;-386   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg186:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg187
 mov ax, 25
 jmp .retn
.checkreg187:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg188
 mov ax, 27
 jmp .retn

;-387   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg188:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg189
 mov ax, 29
 jmp .retn
.checkreg189:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg190
 mov ax, 31
 jmp .retn

;-388   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg190:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg191
 mov ax, 33
 jmp .retn
.checkreg191:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg192
 mov ax, 35
 jmp .retn

;-389   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg192:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg193
 mov ax, 37
 jmp .retn
.checkreg193:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg194
 mov ax, 39
 jmp .retn

;-390   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg194:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg195
 mov ax, 41
 jmp .retn
.checkreg195:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg196
 mov ax, 43
 jmp .retn

;-391   // (eqstr(symbol,"ip")) return 45;


;-392   if (strlen(symbol) >   3) return 0;

.checkreg196:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg197
 mov ax, 0
 jmp .retn

;-393   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg197:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 47
 jmp .retn
.checkreg198:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 50
 jmp .retn

;-394   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg199:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 53
 jmp .retn
.checkreg200:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 56
 jmp .retn

;-395   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg201:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 59
 jmp .retn
.checkreg202:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 62
 jmp .retn

;-396   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg203:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 65
 jmp .retn
.checkreg204:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 68
 jmp .retn

;-397   if (eqstr(symbol,"cr0")) return 71;

.checkreg205:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 71
 jmp .retn

;-398   return 0;   }

.checkreg206:
 mov ax, 0
 jmp .retn

;-399 char printregstr[]

 .retn:
 ret
; ENDP
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

;-400 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-401 //          1         2         3         4         5         6         7


;-402 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-403 int printreg(int i) {  unsigned int k; unsigned char c;


printreg:  ; *** PROC ***

;-404   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   403 NULL i = bp+4
;  201 var unsg word   403 NULL k = bp-2
;  202 var unsg byte   403 NULL c = bp-4;
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

;-405   k = &printregstr + i; c=*k; prc(c);

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

;-406   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

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

;-407 }

.printreg207:

;-408 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
; ENDP
evalue dw 0
exprtype dw 10

;-409 int expr(int isRight)


expr:  ; *** PROC ***

;-410 { int mode; int id1;     int ixarr; int ixconst;


;-411   int ids;  int isCONST; int i;     unsigned char *p;


;-412   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   409 NULL isRight = bp+4
;  201 var sign word   410 NULL mode = bp-2
;  202 var sign word   410 NULL id1 = bp-4
;  203 var sign word   410 NULL ixarr = bp-6
;  204 var sign word   410 NULL ixconst = bp-8
;  205 var sign word   411 NULL ids = bp-10
;  206 var sign word   411 NULL isCONST = bp-12
;  207 var sign word   411 NULL i = bp-14
;  208 ptr unsg byte   411 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr208
 mov ax, [lexval]
 mov word [evalue], ax

;-413     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retn

;-414   mode=typeName(); /*0=V,1=*,2=&*/

.expr208:
 call typeName
 mov [bp-2], ax

;-415   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-416   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr209
 push 0
 call doreg1
 add  sp, 2
 jmp .retn

;-417   if (token=='(')  {docall1(); goto e1; }

.expr209:
 mov ax, [token]
 cmp ax, 40
 jne .expr210
 call docall1
 jmp .e1

;-418   if (isreg()) goto e1;

.expr210:
 call isreg
 or  al, al
 je .expr211
 jmp .e1

;-419 


;-420   id1=searchname(); gettypes(id1); ids=signi;

.expr211:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-421   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-422     if (istoken('[')) { if (istoken(T_CONST)) {

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

;-423       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-424     else {ixarr=searchname(); expect(T_NAME); expect(']');

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

;-425     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-426     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr215
 push expr_1
 call error1
 add  sp, 2
.expr215:
.expr214:

;-427   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

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

;-428      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

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

;-429      v(id1); goto e1;}

.expr219:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-430   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

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

;-431      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

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

;-432      v(id1); goto e1;}

.expr223:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-433        


;-434   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

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

;-435   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

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

;-436   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

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

;-437   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    

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

;-438   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr227:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr228
 push expr_14
 call error1
 add  sp, 2

;-439   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr228:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr229
 push expr_15
 call error1
 add  sp, 2

;-440 


;-441   if (istoken('=')) { exprtype= expr(1); 

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

;-442   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-443   dovar1(mode, "mov", ixarr, id1);

.expr230:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-444   


;-445 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr231
 push expr_17
 call rterm
 add  sp, 2

;-446   else if (istoken('-')) rterm("sub" );

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

;-447   else if (istoken('&')) rterm("and" );

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

;-448   else if (istoken('|')) rterm("or" );  

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

;-449   else if (istoken(T_LESSLESS)) rterm("shl");

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

;-450   else if (istoken(T_GREATGREAT)) rterm("shr");  

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

;-451   else if (istoken('*')) domul (ids);

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

;-452   else if (istoken('/')) doidiv(ids);

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

;-453   else if (istoken('%')) domod (ids);

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

;-454   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

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

;-455   return 0;

.expr248:
 mov ax, 0
 jmp .retn

;-456 }


;-457 


;-458 int compoundass(char *op, int mode, int id1) {

 .retn: LEAVE
 ret
; ENDP
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

compoundass:  ; *** PROC ***

;-459   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   458 NULL op = bp+4
;  201 var sign word   458 NULL mode = bp+6
;  202 var sign word   458 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass249
 push compoundass_0
 call error1
 add  sp, 2

;-460   prnl(); prs(op); prs("  "); 

.compoundass249:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-461   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

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

;-462   v(id1); prs(", ");

.compoundass251:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-463   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-464 }


;-465 int dovar1(int mode, int op, int ixarr, int id1) { 
 LEAVE
 ret
; ENDP
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0

dovar1:  ; *** PROC ***

;-466   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   465 NULL mode = bp+4
;  201 var sign word   465 NULL op = bp+6
;  202 var sign word   465 NULL ixarr = bp+8
;  203 var sign word   465 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-467   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

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

;-468     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1253
 push dovar1_1
 call prs
 add  sp, 2

;-469     if(widthi == 2) prs(" ax, [bx]");

.dovar1253:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_2
 call prs
 add  sp, 2

;-470     return; }

.dovar1254:
 jmp .retn

;-471   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

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
 jmp .retn

;-472   if (ixarr) {

.dovar1255:
 mov ax, [bp+8]
 or  al, al
 je .dovar1256

;-473     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-474     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1257
 push dovar1_5
 call prs
 add  sp, 2

;-475     prs("\n "); prs(op);

.dovar1257:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-476     if (wi==2) prs(" ax, "); else prs(" al, ");

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

;-477 // v(id1); prs(" [bx]");


;-478     prc('['); printName(id1); prs(" + bx]"); 

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

;-479     return; }

 jmp .retn

;-480   prnl();prs(op);

.dovar1256:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-481   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1260
 push dovar1_10
 call prs
 add  sp, 2

;-482   if(wi==2) prs(" ax, ");

.dovar1260:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1261
 push dovar1_11
 call prs
 add  sp, 2

;-483   if(wi==4) prs(" eax, ");

.dovar1261:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1262
 push dovar1_12
 call prs
 add  sp, 2

;-484   v(id1);

.dovar1262:
 push word [bp+10]
 call v
 add  sp, 2

;-485 }


;-486 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

 .retn: LEAVE
 ret
; ENDP
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

rterm:  ; *** PROC ***

;-487   if (istoken(T_CONST)) { prnl(); prs(op); 

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   486 NULL op = bp+4
;  201 var sign word   486 NULL mode = bp-2
;  202 var sign word   486 NULL opint = bp-4
;  203 var sign word   486 NULL ixarr = bp-6
;  204 var sign word   486 NULL id1 = bp-8;
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

;-488     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm264
 push rterm_0
 call prs
 add  sp, 2

;-489     if (wi==2) prs(" ax, ");

.rterm264:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm265
 push rterm_1
 call prs
 add  sp, 2

;-490     if (wi==4) prs(" eax, ");

.rterm265:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm266
 push rterm_2
 call prs
 add  sp, 2

;-491     prunsign1(lexval); return;}

.rterm266:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retn

;-492   mode=typeName(); id1=searchname(); ixarr=0;

.rterm263:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-493   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  

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

;-494     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-495     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm268
 push rterm_3
 call error1
 add  sp, 2
.rterm268:

;-496   if (eqstr(symbol,"_AX")) return;

.rterm267:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm269
 jmp .retn

;-497   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm269:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-498 }


;-499 int isreg() {

 .retn: LEAVE
 ret
; ENDP
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0

isreg:  ; *** PROC ***

;-500   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

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

;-501   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  

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

;-502   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

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

;-503   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

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

;-504   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

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

;-505   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    

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

;-506   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

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

;-507   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

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

;-508   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    

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

;-509   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

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

;-510   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

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

;-511   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  

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

;-512   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

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

;-513   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

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

;-514   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  

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

;-515   return 0;   r1: return 1; 

.isreg284:
 mov ax, 0
 jmp .retn
.r1:
 mov ax, 1
 jmp .retn

;-516 }


;-517 int doreg(char *dr) { int i; expect('=');

 .retn:
 ret
; ENDP
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

doreg:  ; *** PROC ***
;Function : doreg, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   517 NULL dr = bp+4
;  201 var sign word   517 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-518   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-519        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg285
 push word [lexval]
 call prunsign1
 add  sp, 2

;-520   else if (istoken(T_NAME )) { i=searchname(); v(i); }

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

;-521   else error1("only number or var allowed"); }

 jmp .doreg288
.doreg287:
 push doreg_2
 call error1
 add  sp, 2
.doreg288:
.doreg286:

;-522 


;-523 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
; ENDP
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0

doassign:  ; *** PROC ***

;-524   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   523 NULL mode = bp+4
;  201 var sign word   523 NULL i = bp+6
;  202 var sign word   523 NULL ixarr = bp+8
;  203 var sign word   523 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-525   if (mode==1) {prs("\n mov  bx, ");v(i);                  

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign289
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-526     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign290
 push doassign_1
 call prs
 add  sp, 2

;-527     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign291
.doassign290:
 push doassign_2
 call prs
 add  sp, 2
.doassign291:
 jmp .retn

;-528   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

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
 jmp .retn

;-529   if (ixarr) {  prs("\n mov bx, ");

.doassign292:
 mov ax, [bp+8]
 or  al, al
 je .doassign293
 push doassign_5
 call prs
 add  sp, 2

;-530     if(ixconst) prunsign1(ixarr); else v(ixarr);

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

;-531     if (wi==2) prs("\n shl bx, 1");

.doassign295:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign296
 push doassign_6
 call prs
 add  sp, 2

;-532     prs("\n mov ["); printName(i);

.doassign296:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-533     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

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
 jmp .retn

;-534   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

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

;-535     } v(i); prs(", al"); return; }

.doassign300:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retn

;-536   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

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

;-537     } v(i); prs(", ax"); return; }

.doassign302:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retn

;-538   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

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

;-539     } v(i); prs(", eax"); return; }

.doassign304:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retn

;-540 }

.doassign303:

;-541 int domul(int ids) {

 .retn: LEAVE
 ret
; ENDP
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

domul:  ; *** PROC ***

;-542   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   541 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul305
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul306
.domul305:

;-543   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }

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

;-544   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul308
.domul307:
 push domul_3
 call error1
 add  sp, 2
.domul308:
.domul306:

;-545 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
; ENDP
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0

doidiv:  ; *** PROC ***

;-546   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   545 NULL ids = bp+4
;  201 var sign word   545 NULL mode = bp-2
;  202 var sign word   545 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv309

;-547     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-548     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

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

;-549   else {

 jmp .doidiv312
.doidiv309:

;-550     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-551     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv313
 push doidiv_3
 call error1
 add  sp, 2

;-552     gettypes(id1);

.doidiv313:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-553     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv314
 push doidiv_4
 call error1
 add  sp, 2

;-554     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv314:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv315
 push doidiv_5
 call error1
 add  sp, 2

;-555     prs("\n mov bx, "); v(id1);

.doidiv315:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-556     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

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

;-557 }

.doidiv312:

;-558 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
 LEAVE
 ret
; ENDP
doidiv_0 db "\n mov bx, ",0
doidiv_1 db "\n cwd\n idiv bx",0
doidiv_2 db "\n mov dx, 0\n div bx",0
doidiv_3 db "only const number or int as divisor allowed",0
doidiv_4 db "only int as simple var divisor allowed",0
doidiv_5 db "only int, no byte as divisor allowed",0
doidiv_6 db "\n mov bx, ",0
doidiv_7 db "\n cwd\n idiv bx",0
doidiv_8 db "\n mov dx, 0\n div bx",0

domod:  ; *** PROC ***
;Function : domod, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   558 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-559 


;-560 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
; ENDP
domod_0 db "\n mov ax, dx",0
section .bss
absolute 53411
docalltype resw 10
section .text
section .bss
absolute 53431
docallvalue resw 10
section .text

;-561 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 53451
procname resb 17
section .text

;-562 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1:  ; *** PROC ***

;-563   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   562 NULL i = bp-2
;  201 var sign word   562 NULL narg = bp-4
;  202 var sign word   562 NULL t0 = bp-6
;  203 var sign word   562 NULL n0 = bp-8
;  204 var sign word   562 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-564   checknamelen();

 call checknamelen

;-565   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-566   storecall();

 call storecall

;-567   expect('(');

 push 40
 call expect
 add  sp, 2

;-568 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1318

;-569 	  do { narg++;

.docall1319:
 inc  word[bp-4]

;-570 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1320
 push docall1_0
 call error1
 add  sp, 2
.docall1320:
 mov ax, 0
 mov [bp-6], ax

;-571       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1321
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-572       if(istoken(T_STRING)){t0=2; n0=nconst;

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

;-573         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-574         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-575       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

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

;-576       if(istoken(T_NAME))  { n0=checkreg();

.docall1323:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1324
 call checkreg
 mov [bp-8], ax

;-577         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1325
 mov ax, 5
 mov [bp-6], ax

;-578         else {t0=4; n0=searchname();

 jmp .docall1326
.docall1325:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-579           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

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

;-580       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1324:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1328
 push docall1_4
 call error1
 add  sp, 2

;-581       docalltype [narg] = t0;

.docall1328:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-582       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-583     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1329
 jmp .docall1319
.docall1329:

;-584     


;-585   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-586     do {

.docall1330:

;-587       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-588       n0 = docallvalue[i];     

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-589       if(t0==1){ prs("\n push "); pint1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1331
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-590       if(t0==2){ prs("\n push "); 

.docall1331:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1332
 push docall1_6
 call prs
 add  sp, 2

;-591         prs(fname);prc(95);pint1(n0);}

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

;-592       if(t0==3){ prs("\n lea  ax, ");   v(n0);

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

;-593         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-594       if(t0==4){ gettypes(n0); 

.docall1333:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1334
 push word [bp-8]
 call gettypes
 add  sp, 2

;-595         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1335
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-596         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1336
.docall1335:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-597         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1336:

;-598       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

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

;-599    i--; } while (i > 0);  }

.docall1337:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1339
 jmp .docall1330
.docall1339:

;-600 	 prs("\n call "); prs(&procname);

.docall1318:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-601 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1340
 push docall1_14
 call prs
 add  sp, 2

;-602      narg=narg+narg; narg=narg+sz32; pint1(narg); } }

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

;-603 /****************************************************************************/


;-604 int main() {
 LEAVE
 ret
; ENDP
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

main:  ; *** PROC ***

;-605   getarg();

 call getarg

;-606   setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-607   if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main341
 push main_0
 call error1
 add  sp, 2

;-608   segE=allocmem(4096);

.main341:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-609   if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main342
 push main_1
 call error1
 add  sp, 2

;-610   CNameTop=0;

.main342:
 mov ax, 0
 mov word [CNameTop], ax

;-611   getfirstchar();

 call getfirstchar

;-612   parse();

 call parse

;-613   checkcalls(); epilog();

 call checkcalls
 call epilog

;-614 }


;-615 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }

 ret
; ENDP
main_0 db "SetBlock , AX=",0
main_1 db "alloc memory, AX=",0

getfirstchar:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
 call fgets1
 mov byte [thechar], al

;-616 char *arglen=0x80; char *argv=0x82;

 ret
; ENDP
arglen dw 128
argv dw 130

;-617 int getarg() { int arglen1; int i; char *c;


getarg:  ; *** PROC ***

;-618   arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   617 NULL arglen1 = bp-2
;  201 var sign word   617 NULL i = bp-4
;  202 ptr sign byte   617 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-619   if (arglen1) { i=arglen1+129; *i=0; }

 mov ax, [bp-2]
 or  al, al
 je .getarg343
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-620   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");

 jmp .getarg344
.getarg343:
 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
 push getarg_0
 call cputs
 add  sp, 2

;-621     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }

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

;-622   strcpy(namein, argv);

.getarg344:
 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-623   if (instr1(namein, '.') == 0) strcat1(namein, ".C");

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

;-624   toupper(namein);

.getarg345:
 lea  ax, [namein]
 push ax
 call toupper
 add  sp, 2

;-625   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';

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

;-626  


;-627   fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-628   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }

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

;-629   fdout=creatR(namelst);

.getarg346:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-630   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}

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

;-631   prs("\n; ");prs(Version1);

.getarg347:
 push getarg_4
 call prs
 add  sp, 2
 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-632   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);

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

;-633   prs("\norg  256 \njmp main"); 

 push getarg_7
 call prs
 add  sp, 2

;-634 }


;-635 int parse() { token=getlex(); do {
 LEAVE
 ret
; ENDP
getarg_0 db " Usage: A.COM in_file[.C]: ",0
getarg_1 db ".C",0
getarg_2 db "Source file missing (.C): ",0
getarg_3 db "list file not creatable: ",0
getarg_4 db "\n; ",0
getarg_5 db ", Source: ",0
getarg_6 db ", Output asm: ",0
getarg_7 db "\norg  256 \njmp main",0

parse:  ; *** PROC ***
 call getlex
 mov word [token], ax
.parse348:

;-636     if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse349
 mov ax, 1
 jmp .retn

;-637     if (istoken('#')) {

.parse349:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse350

;-638       if (istoken(T_DEFINE)) dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse351
 call dodefine

;-639       else if (istoken(T_INCLUDE)) doinclude();

 jmp .parse352
.parse351:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je .parse353
 call doinclude

;-640       else error1("define or include expected");  }

 jmp .parse354
.parse353:
 push parse_0
 call error1
 add  sp, 2
.parse354:
.parse352:

;-641     else{ typeName();  if (token=='(') dofunc();  else doglob(); }

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

;-642   } while(1);

.parse355:
 mov ax, 1
 or  al, al
 je .parse358
 jmp .parse348
.parse358:

;-643 }


;-644 int checkcalls() { int i; int j; int k;

 .retn:
 ret
; ENDP
parse_0 db "define or include expected",0

checkcalls:  ; *** PROC ***

;-645   prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   644 NULL i = bp-2
;  201 var sign word   644 NULL j = bp-4
;  202 var sign word   644 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-646   i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-647   while (i < CTop) {

.checkcalls359:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .checkcalls360

;-648     pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-649     from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-650     j=0;

 mov ax, 0
 mov [bp-4], ax

;-651     do { p1=adrF(FNameField, j);

.checkcalls361:
 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-652       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }

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

;-653       j++; } while (j < FTop);

.checkcalls362:
 inc  word[bp-4]
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .checkcalls363
 jmp .checkcalls361
.checkcalls363:

;-654     if (j == FTop) { k++; prs("\n; "); prs(NameA); }

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

;-655     i++; }

.checkcalls364:
 inc  word[bp-2]

;-656   prs("\n; Number of unresolved CALLs :"); printint51(k);

 jmp .checkcalls359
.checkcalls360:
 push checkcalls_2
 call prs
 add  sp, 2
 push word [bp-6]
 call printint51
 add  sp, 2

;-657   if (k!=0) error1("At least 1 function is missing! "); 

 mov ax, [bp-6]
 cmp ax, 0
 je  .checkcalls365
 push checkcalls_3
 call error1
 add  sp, 2

;-658     else prs(" All FUNCTIONs in place");

 jmp .checkcalls366
.checkcalls365:
 push checkcalls_4
 call prs
 add  sp, 2

;-659 }

.checkcalls366:

;-660 


;-661 int doinclude() { int fdtemp;
 LEAVE
 ret
; ENDP
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db "\n; Number of unresolved CALLs :",0
checkcalls_3 db "At least 1 function is missing! ",0
checkcalls_4 db " All FUNCTIONs in place",0

doinclude:  ; *** PROC ***

;-662   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   661 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne .doinclude367
 mov ax, [fdin]
 mov [bp-2], ax

;-663   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-664   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-665   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

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

;-666     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-667   linenoinclude=lineno; lineno=1;

.doinclude368:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-668   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-669   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-670   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-671 }

.doinclude367:

;-672 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
; ENDP
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0

dodefine:  ; *** PROC ***

;-673   if (eqstr(symbol, "ORGDATA")) {token=getlex();

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   672 NULL i = bp-2
;  201 var sign word   672 NULL j = bp-4
;  202 var sign word   672 NULL fdtemp = bp-6;
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

;-674     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp .retn

;-675   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

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

;-676     prs("\n;Use archive file: ");

 push dodefine_2
 call prs
 add  sp, 2

;-677     strcpy(archivename, symbol); prs(archivename);

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

;-678     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp .dodefine372
.dodefine371:
 push dodefine_3
 call error1
 add  sp, 2
.dodefine372:
 call getlex
 mov word [token], ax
 jmp .retn

;-679    expect(T_NAME);

.dodefine370:
 push 256
 call expect
 add  sp, 2

;-680   if (token==T_CONST) { 

 mov ax, [token]
 cmp ax, 257
 jne .dodefine373

;-681     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine374
 push dodefine_4
 call error1
 add  sp, 2

;-682     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

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

;-683     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

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

;-684     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-685     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

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

;-686     expect(T_CONST); GTop++;  } 

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-687 }

.dodefine373:

;-688 int stmt() { int c; char cha;

 .retn: LEAVE
 ret
; ENDP
dodefine_0 db "ORGDATA",0
dodefine_1 db "ARCHIVE",0
dodefine_2 db "\n;Use archive file: ",0
dodefine_3 db "Name of archive file missing",0
dodefine_4 db "global table (define) full",0
dodefine_5 db "Define name longer 15 char",0

stmt:  ; *** PROC ***

;-689        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   688 NULL c = bp-2
;  201 var sign byte   688 NULL cha = bp-4;
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

;-690   else if(istoken(T_IF))    doif();

 jmp .stmt379
.stmt376:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt380
 call doif

;-691   else if(istoken(T_DO))    dodo();

 jmp .stmt381
.stmt380:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt382
 call dodo

;-692   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt383
.stmt382:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt384
 call dowhile

;-693   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}

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

;-694   else if(token==T_ASM)     {prs("\n"); c=next();

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

;-695         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

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

;-696   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  

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

;-697         while(cha!= '}') { prc(cha); cha=next(); }

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

;-698         token=getlex(); }

 jmp .stmt394
.stmt395:
 call getlex
 mov word [token], ax

;-699         else error1("Curly open expected"); 

 jmp .stmt396
.stmt393:
 push stmt_3
 call error1
 add  sp, 2

;-700         }

.stmt396:

;-701   else if(istoken(T_EMIT))   doemit();

 jmp .stmt397
.stmt392:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt398
 call doemit

;-702   else if(istoken(';'))      { }

 jmp .stmt399
.stmt398:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt400

;-703   else if(istoken(T_RETURN)) {

 jmp .stmt401
.stmt400:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt402

;-704         if (token!=';') exprstart();

 mov ax, [token]
 cmp ax, 59
 je  .stmt403
 call exprstart

;-705         prs("\n jmp .retn"); 

.stmt403:
 push stmt_4
 call prs
 add  sp, 2

;-706         nreturn++; 

 inc  word[nreturn]

;-707         expect(';');

 push 59
 call expect
 add  sp, 2

;-708         }


;-709   else if(thechar==':')      {

 jmp .stmt404
.stmt402:
 mov al, [thechar]
 cmp al, 58
 jne .stmt405

;-710         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-711         prs(symbol); prc(':');  

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-712         expect(T_NAME); 

 push 256
 call expect
 add  sp, 2

;-713         expect(':'); 

 push 58
 call expect
 add  sp, 2

;-714         }


;-715   else  {exprstart(); expect(';'); } 

 jmp .stmt406
.stmt405:
 call exprstart
 push 59
 call expect
 add  sp, 2

;-716 }

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

;-717 


;-718 int doemit() {prs("\n db ");
 LEAVE
 ret
; ENDP
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n jmp .retn",0
stmt_5 db "\n.",0

doemit:  ; *** PROC ***
 push doemit_0
 call prs
 add  sp, 2

;-719   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-720     if (token== ',') {prc(','); goto L1;} expect(')'); }

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

;-721 


;-722 int cmpneg(int ids) {

 ret
; ENDP
doemit_0 db "\n db ",0

cmpneg:  ; *** PROC ***

;-723        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   722 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg408
 push cmpneg_0
 call prs
 add  sp, 2

;-724   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg409
.cmpneg408:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg410
 push cmpneg_1
 call prs
 add  sp, 2

;-725   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

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

;-726                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg414
.cmpneg413:
 push cmpneg_3
 call prs
 add  sp, 2

;-727   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

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

;-728                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-729                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg418
.cmpneg417:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-730                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-731   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg418:
 jmp .cmpneg419
.cmpneg416:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg420
 push cmpneg_8
 call prs
 add  sp, 2

;-732   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg421
.cmpneg420:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg422
 push cmpneg_9
 call prs
 add  sp, 2

;-733   else error1("Vergleich unbekannt in CMPNEG()");  }

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

;-734 


;-735 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
 LEAVE
 ret
; ENDP
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
cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0

prlabel:  ; *** PROC ***
;Function : prlabel, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   735 NULL n = bp+4;
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

;-736 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
 LEAVE
 ret
; ENDP
prlabel_0 db "\n.",0

prjump:  ; *** PROC ***
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   736 NULL n = bp+4;
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

;-737 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP
prjump_0 db "\n jmp .",0

doif:  ; *** PROC ***
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   737 NULL jdest = bp-2
;  201 var sign word   737 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-738   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-739   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif424
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-740     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-741   else prlabel(jdest); }

 jmp .doif425
.doif424:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif425:

;-742 


;-743 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
; ENDP

dodo:  ; *** PROC ***

;-744   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   743 NULL jdest = bp-2
;  201 var sign word   743 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-745   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-746   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-747 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

dowhile:  ; *** PROC ***
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   747 NULL jdest = bp-2
;  201 var sign word   747 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-748   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-749   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-750 int isrelational() {
 LEAVE
 ret
; ENDP

isrelational:  ; *** PROC ***

;-751   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational426
 jmp .w
.isrelational426:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational427
 jmp .w

;-752   if (token==T_LE) goto w; if (token==T_GE) goto w;

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

;-753   if (token=='<' ) goto w; if (token=='>' ) goto w;

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

;-754   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational431:
 mov ax, 0
 jmp .retn
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retn

;-755  


;-756 char symboltemp[80];    

 .retn:
 ret
; ENDP
section .bss
absolute 53468
symboltemp resb 80
section .text

;-757 int getlex() { char c; char *p; 


getlex:  ; *** PROC ***

;-758 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   757 NULL c = bp-2
;  201 ptr sign byte   757 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex432
 mov ax, 0
 jmp .retn
.getlex432:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex433
 jmp .g1

;-759   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex433:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex434
 mov al, [thechar]
 cmp al, 61
 jne .getlex435
 call next
 mov ax, 806
 jmp .retn
.getlex435:

;-760   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex434:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex436
 mov al, [thechar]
 cmp al, 61
 jne .getlex437
 call next
 mov ax, 807
 jmp .retn
.getlex437:

;-761   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex436:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex438
 mov al, [thechar]
 cmp al, 61
 jne .getlex439
 call next
 mov ax, 824
 jmp .retn
.getlex439:

;-762   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex438:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex440
 mov al, [thechar]
 cmp al, 61
 jne .getlex441
 call next
 mov ax, 811
 jmp .retn
.getlex441:

;-763   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex440:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex442
 mov al, [thechar]
 cmp al, 60
 jne .getlex443
 call next
 mov ax, 1240
 jmp .retn
.getlex443:

;-764   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex442:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex444
 mov al, [thechar]
 cmp al, 62
 jne .getlex445
 call next
 mov ax, 1241
 jmp .retn
.getlex445:

;-765   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex444:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex446
 mov al, [thechar]
 cmp al, 43
 jne .getlex447
 call next
 mov ax, 1219
 jmp .retn
.getlex447:

;-766   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex446:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex448
 mov al, [thechar]
 cmp al, 45
 jne .getlex449
 call next
 mov ax, 1225
 jmp .retn
.getlex449:

;-767   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex448:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex450
 mov al, [thechar]
 cmp al, 61
 jne .getlex451
 call next
 mov ax, 1230
 jmp .retn
.getlex451:

;-768   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex450:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex452
 mov al, [thechar]
 cmp al, 61
 jne .getlex453
 call next
 mov ax, 1231
 jmp .retn
.getlex453:

;-769   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex452:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex454
 mov al, [thechar]
 cmp al, 61
 jne .getlex455
 call next
 mov ax, 1234
 jmp .retn
.getlex455:

;-770   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    

.getlex454:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex456
 mov al, [thechar]
 cmp al, 61
 jne .getlex457
 call next
 mov ax, 1235
 jmp .retn
.getlex457:

;-771   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex456:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex458
 mov al, [thechar]
 cmp al, 61
 jne .getlex459
 call next
 mov ax, 1232
 jmp .retn
.getlex459:

;-772   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        

.getlex458:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex460
 mov al, [thechar]
 cmp al, 61
 jne .getlex461
 call next
 mov ax, 1233
 jmp .retn
.getlex461:

;-773   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
 jmp .retn

;-774   if (c == '/') { if (thechar == '/') {

.getlex462:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex463
 mov al, [thechar]
 cmp al, 47
 jne .getlex464

;-775       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }

.getlex465:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 13
 je  .getlex466
 jmp .getlex465
.getlex466:
 call getlex
 jmp .retn
.getlex464:

;-776   if (c == '/') { if (thechar == '*') {

.getlex463:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex467
 mov al, [thechar]
 cmp al, 42
 jne .getlex468

;-777       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

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

;-778       c=next(); return getlex(); } else  return '/'; }

.getlex470:
 call next
 mov [bp-2], al
 call getlex
 jmp .retn
 jmp .getlex471
.getlex468:
 mov ax, 47
 jmp .retn
.getlex471:

;-779   if (c == '"') {getstring(c); return T_STRING;}

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
 jmp .retn

;-780   if (digit(c)) { getdigit(c); return T_CONST; }

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
 jmp .retn

;-781   if (c==39) { lexval=next();

.getlex473:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex474
 call next
 mov word [lexval], ax

;-782     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex475
 call next
 mov word [lexval], ax

;-783       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

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

;-784       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

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
 jmp .retn

;-785   if (alnum(c)) { 

.getlex474:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex479

;-786     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-787     while(alnum(thechar)) {c=next(); *p=c;  p++; } 

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

;-788       *p=0;

 jmp .getlex480
.getlex481:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-789     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex482
 mov ax, 531
 jmp .retn

;-790     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex482:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex483
 mov ax, 532
 jmp .retn

;-791     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex483:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex484
 mov ax, 529
 jmp .retn

;-792     if (eqstr(symbol,"int"     )) return T_INT;

.getlex484:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex485
 mov ax, 517
 jmp .retn

;-793     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex485:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex486
 mov ax, 533
 jmp .retn

;-794     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex486:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex487
 mov ax, 530
 jmp .retn

;-795     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex487:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex488
 mov ax, 518
 jmp .retn

;-796     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex488:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex489
 mov ax, 519
 jmp .retn

;-797     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex489:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex490
 mov ax, 520
 jmp .retn

;-798     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex490:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex491
 mov ax, 512
 jmp .retn

;-799     if (eqstr(symbol,"if"      )) return T_IF;

.getlex491:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex492
 mov ax, 513
 jmp .retn

;-800     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex492:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex493
 mov ax, 514
 jmp .retn

;-801     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex493:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex494
 mov ax, 515
 jmp .retn

;-802     if (eqstr(symbol,"do"      )) return T_DO;

.getlex494:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex495
 mov ax, 516
 jmp .retn

;-803     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex495:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex496
 mov ax, 521
 jmp .retn

;-804     if (eqstr(symbol,"define"  )) return T_DEFINE;   

.getlex496:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex497
 mov ax, 511
 jmp .retn

;-805     if (eqstr(symbol,"include" )) return T_INCLUDE;   

.getlex497:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex498
 mov ax, 510
 jmp .retn

;-806     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

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
 jmp .retn

;-807     return T_NAME; } error1("Input item not recognized"); }

.getlex499:
 mov ax, 256
 jmp .retn
.getlex479:
 push getlex_18
 call error1
 add  sp, 2

;-808 


;-809 int convertdefine() { int i; int j;   i=0;

 .retn: LEAVE
 ret
; ENDP
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

convertdefine:  ; *** PROC ***
;Function : convertdefine, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   809 NULL i = bp-2
;  201 var sign word   809 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-810   while (i < GTop) {

.convertdefine500:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine501

;-811    j=adrofname(i); 

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-812    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

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

;-813    return T_CONST; } }

 mov ax, 257
 jmp .retn
.convertdefine503:

;-814    i++; } 

.convertdefine502:
 inc  word[bp-2]

;-815    return 0; }

 jmp .convertdefine500
.convertdefine501:
 mov ax, 0
 jmp .retn

;-816 int getdigit(char c) { int i;

 .retn: LEAVE
 ret
; ENDP

getdigit:  ; *** PROC ***

;-817     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   816 NULL c = bp+4
;  201 var sign word   816 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-818     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

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

;-819       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

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

;-820 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

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

;-821      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-822     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 

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

;-823      i=0; i=c; lexval=lexval+i; } } 

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit511
.getdigit512:

;-824 }

.getdigit510:

;-825 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
; ENDP

getstring:  ; *** PROC ***
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   825 NULL delim = bp+4
;  201 var sign word   825 NULL c = bp-2
;  202 ptr sign byte   825 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-826   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

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

;-827 


;-828 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
 LEAVE
 ret
; ENDP

next:  ; *** PROC ***
;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   828 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
 mov al, [bp-2]
 mov byte [globC], al
 call fgets1
 mov byte [thechar], al
 mov al, [bp-2]
 jmp .retn

;-829 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}

 .retn: LEAVE
 ret
; ENDP

istoken:  ; *** PROC ***
;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   829 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken515
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retn
.istoken515:
 mov ax, 0
 jmp .retn

;-830 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();

 .retn: LEAVE
 ret
; ENDP

expect:  ; *** PROC ***
;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   830 NULL t = bp+4;
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

;-831   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

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

;-832 


;-833 int eprc(char c)  {*cloc=c; cloc++; }
 LEAVE
 ret
; ENDP
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0

eprc:  ; *** PROC ***
;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   833 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
 inc  word[cloc]

;-834 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
 LEAVE
 ret
; ENDP

eprs:  ; *** PROC ***
;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   834 NULL s = bp+4
;  201 var sign byte   834 NULL c = bp-2;
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

;-835 int prc(unsigned char c) { 
 LEAVE
 ret
; ENDP

prc:  ; *** PROC ***

;-836   if (c==10) {_AX=13; writetty(); }

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   835 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc519
 mov  ax, 13
 call writetty

;-837   _AL=c; writetty(); 

.prc519:
 mov  al, [bp+4]
 call writetty

;-838   fputcR(c, fdout); 

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-839   }


;-840 int prscomment(unsigned char *s) {unsigned char c;
 LEAVE
 ret
; ENDP

prscomment:  ; *** PROC ***

;-841   while(*s){c=*s;prc(c);s++;} }

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   840 NULL s = bp+4
;  201 var unsg byte   840 NULL c = bp-2;
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

;-842 int prnl() { prs("\n ");}
 LEAVE
 ret
; ENDP

prnl:  ; *** PROC ***
 push prnl_0
 call prs
 add  sp, 2

;-843 


;-844 int prs(unsigned char *s) {unsigned char c; int com; com=0;

 ret
; ENDP
prnl_0 db "\n ",0

prs:  ; *** PROC ***
;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   844 NULL s = bp+4
;  201 var unsg byte   844 NULL c = bp-2
;  202 var sign word   844 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-845   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;

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

;-846     if (c==92) { if (com==0) { s++; c=*s;

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

;-847           if (c=='n') c=10; if (c=='t') c= 9;

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

;-848     } } prc(c); s++;  } }

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

;-849 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
 LEAVE
 ret
; ENDP

eprnum:  ; *** PROC ***
;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   849 NULL n = bp+4
;  201 var sign word   849 NULL e = bp-2;
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

;-850   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }

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

;-851 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint1:  ; *** PROC ***
;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   851 NULL n = bp+4
;  201 var sign word   851 NULL e = bp-2;
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

;-852   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }

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

;-853 int prunsign1(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP

prunsign1:  ; *** PROC ***

;-854   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   853 NULL n = bp+4
;  201 var unsg word   853 NULL e = bp-2;
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

;-855     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }

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

;-856 int printint51(unsigned int j)  {
 LEAVE
 ret
; ENDP

printint51:  ; *** PROC ***

;-857   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   856 NULL j = bp+4;
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

;-858    if (j<10) prc(32);  prunsign1(j); }

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

;-859 


;-860 int fgets1() { char c; c=*fgetsp;
 LEAVE
 ret
; ENDP

fgets1:  ; *** PROC ***
;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   860 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-861   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1540
 call printinputline
 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1541
 mov ax, 0
 jmp .retn

;-862     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }

.fgets1541:
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov ax, 0
 mov word [spalte], ax

;-863   fgetsp++; spalte++;  return c; }

.fgets1540:
 inc  word[fgetsp]
 inc  word[spalte]
 mov al, [bp-2]
 jmp .retn

;-864 int printinputline() { fgetsp=&fgetsdest;

 .retn: LEAVE
 ret
; ENDP

printinputline:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-865   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

.printinputline542:
 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-866   if (DOS_NoBytes == 0) return; 

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline543
 jmp .retn

;-867     *fgetsp=DOS_ByteRead; fgetsp++;} 

.printinputline543:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
 inc  word[fgetsp]

;-868   while (DOS_ByteRead != 10); *fgetsp=0;

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline544
 jmp .printinputline542
.printinputline544:
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-869     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;

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

;-870       prscomment(&fgetsdest);}

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-871 }

.printinputline545:

;-872 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }

 .retn:
 ret
; ENDP
printinputline_0 db "\n\n;-",0

end1:  ; *** PROC ***
;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   872 NULL n = bp+4;
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

;-873 int error1(char *s) { 
 LEAVE
 ret
; ENDP

error1:  ; *** PROC ***

;-874   lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   873 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-875   prnl(); prscomment(&fgetsdest);

 call prnl
 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-876   prs(";Line: "); prunsign1(lineno);

 push error1_0
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-877   prs(" ************** ERROR: "); prs(s);

 push error1_1
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2

;-878   prs("  in column: "); pint1(spalte);

 push error1_2
 call prs
 add  sp, 2
 push word [spalte]
 call pint1
 add  sp, 2

;-879   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);

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

;-880   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);

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

;-881   end1(1); }

 push 1
 call end1
 add  sp, 2

;-882 int listproc() {int i; 
 LEAVE
 ret
; ENDP
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", globC: ",0
error1_5 db ", thechar: ",0
error1_6 db ", symbol: ",0

listproc:  ; *** PROC ***

;-883   if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   882 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle .listproc546

;-884   prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-885   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);

 push listproc_1
 call prs
 add  sp, 2
 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-886   prs("\n;   # type sign width addr used name   list of local variables");

 push listproc_2
 call prs
 add  sp, 2

;-887     i=LSTART; 

 mov ax, 200
 mov [bp-2], ax

;-888     while (i < LTop) { listvar(i); i++; } } 

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

;-889 }

.listproc546:

;-890 int listvar(unsigned int i) {unsigned int j; char c;
 LEAVE
 ret
; ENDP
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name   list of local variables",0

listvar:  ; *** PROC ***

;-891   prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   890 NULL i = bp+4
;  201 var unsg word   890 NULL j = bp-2
;  202 var sign byte   890 NULL c = bp-4;
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

;-892   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

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

;-893                if(c=='&')prs("arr ");   if(c=='#')prs("def ");

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

;-894   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

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

;-895   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

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

;-896                if(c==  4)prs("dwrd " );

.listvar556:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar557
 push listvar_9
 call prs
 add  sp, 2

;-897   j=GAdr[i]; printint51(j);

.listvar557:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-898   j=GUsed[i]; if (j) printint51(j);

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

;-899   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}

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

;-900   prc(32);  pt=adrofname(i); prs(pt);

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

;-901   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }

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

;-902   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}

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

;-903   if (i >= LSTART) { prs(" = bp"); j=GData[i];

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

;-904     if (j > 0) prc('+'); pint1(j);  }

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

;-905 }

.listvar564:

;-906 int listcall() { int i;
 LEAVE
 ret
; ENDP
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

listcall:  ; *** PROC ***

;-907   prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   906 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-908   i=0;  while (i< CTop) { calllisting(i); i++; } }

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

;-909 int calllisting(int i) {char c; int j;
 LEAVE
 ret
; ENDP
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0

calllisting:  ; *** PROC ***

;-910   prs("\n;"); printint51(i); prc(32);

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   909 NULL i = bp+4
;  201 var sign byte   909 NULL c = bp-2
;  202 var sign word   909 NULL j = bp-4;
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

;-911   c=CType [i]; if(c==0)prs("unresolved ");

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .calllisting568
 push calllisting_1
 call prs
 add  sp, 2

;-912   j=CAdr[i];            printint51(j); prc(32);

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

;-913   from_far(NameA, j);   prs(NameA);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-914 }


;-915 int countcalls(int f) { unsigned int i;
 LEAVE
 ret
; ENDP
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0

countcalls:  ; *** PROC ***

;-916   pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   915 NULL f = bp+4
;  201 var unsg word   915 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-917   i=0;  while (i < CTop) {

 mov ax, 0
 mov [bp-2], ax
.countcalls569:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .countcalls570

;-918     p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-919     from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-920     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

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

;-921     i++; }

.countcalls571:
 inc  word[bp-2]

;-922 }

 jmp .countcalls569
.countcalls570:

;-923 int listfunc() { int i;
 LEAVE
 ret
; ENDP

listfunc:  ; *** PROC ***

;-924   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   923 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-925   i=0;  while (i < FTop) { countcalls (i); i++; } 

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

;-926   i=0;  while (i < FTop) { funclisting(i); i++; } }

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

;-927 int funclisting(int i) {int j;  char c;
 LEAVE
 ret
; ENDP
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0

funclisting:  ; *** PROC ***

;-928   prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   927 NULL i = bp+4
;  201 var sign word   927 NULL j = bp-2
;  202 var sign byte   927 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-929   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");

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

;-930   j = FAdr[i];   printint51(j); prc(32);

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

;-931   c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-932   if(c=='V')prs("void " );    if(c=='B')prs("byte " );

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

;-933   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );

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

;-934   prc(32); prc(32);

.funclisting581:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-935   pt=adrF(FNameField, i); prs(pt);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-936 }


;-937 unsigned int MAXUI=65535;
 LEAVE
 ret
; ENDP
funclisting_0 db "\n;",0
funclisting_1 db " NULL",0
funclisting_2 db "void ",0
funclisting_3 db "byte ",0
funclisting_4 db "word ",0
funclisting_5 db "dwrd ",0
MAXUI dw 65535

;-938 int epilog() {unsigned int i; 


epilog:  ; *** PROC ***

;-939   strcpy(symbol, "LastFunctionByt");  storefunc();

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   938 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 call storefunc

;-940   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");

 push epilog_1
 call prs
 add  sp, 2

;-941   prs("\n \n;   # type sign width  adr used name   list of global variables\n");

 push epilog_2
 call prs
 add  sp, 2

;-942   i=1;

 mov ax, 1
 mov [bp-2], ax

;-943   while (i< GTop) { listvar(i); i++; }

.epilog582:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .epilog583
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]

;-944   listfunc();   listcall();

 jmp .epilog582
.epilog583:
 call listfunc
 call listcall

;-945 


;-946   prs("\n;Input: "); prs(&namein);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-947   prs(", List: ");   prs(&namelst);

 push epilog_4
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-948   prs(",  Lines:"); printint51(lineno);

 push epilog_5
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-949   prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_6
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-950   prs(" max.:"); printint51(LSTART);

 push epilog_7
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-951   prs("\n;Functions      :"); printint51(FTop);

 push epilog_8
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-952   prs(" max.:"); printint51(FUNCMAX);

 push epilog_9
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-953   prs("\n;Calls          :"); printint51(CTop);

 push epilog_10
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-954   prs(" max.:"); printint51(CALLMAX);

 push epilog_11
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-955   prs(", NameField:"); printint51(CNameTop);

 push epilog_12
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-956   prs(" max.:"); printint51(65535);

 push epilog_13
 call prs
 add  sp, 2
 push -1
 call printint51
 add  sp, 2

;-957 //  prs(", segE:"); printint51(segE);


;-958   __asm{call LastFunctionByt}  _ i=ax;

call LastFunctionByt
mov [bp-2], ax

;-959   prs("\n;Code until     :"); printint51(i);

 push epilog_14
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-960   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");

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

;-961   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog584
 push epilog_17
 call prs
 add  sp, 2

;-962   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;

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

;-963   prs(", resting stacksize: ");printint51(i);

 push epilog_19
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-964   if (i <= 5000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 5000
 ja  .epilog585
 push epilog_20
 call prs
 add  sp, 2

;-965   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);

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

;-966   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");

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

;-967   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog586
 push epilog_25
 call prs
 add  sp, 2

;-968   end1(0);}

.epilog586:
 push 0
 call end1
 add  sp, 2

;-969 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}


;-970 int setblock(unsigned int i) {
 LEAVE
 ret
; ENDP
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

setblock:  ; *** PROC ***

;-971   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   970 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, cs
 mov  es, ax
 mov  ax, 18944
 call DosInt

;-972 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 LEAVE
 ret
; ENDP

allocmem:  ; *** PROC ***

;-973   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   972 NULL i = bp+4
;  201 var unsg word   972 NULL vAX = bp-2
;  202 var unsg word   972 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, 18432
 call DosInt
mov [bp-2], ax
mov [bp-4], bx

;-974   if(DOS_ERR) return vBX;   return vAX;

 mov ax, [DOS_ERR]
 or  al, al
 je .allocmem587
 mov ax, [bp-4]
 jmp .retn
.allocmem587:
 mov ax, [bp-2]
 jmp .retn

;-975 }


;-976 int copyF(char *dest, char *src, unsigned int sz) {

 .retn: LEAVE
 ret
; ENDP

copyF:  ; *** PROC ***

;-977   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di

;Function : copyF, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   976 NULL dest = bp+4
;  201 ptr sign byte   976 NULL src = bp+6
;  202 var unsg word   976 NULL sz = bp+8;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]
 mov  cx, [bp+8]

;-978   asm cld

 cld

;-979   asm rep movsb

 rep movsb

;-980   asm mov byte [es:di], 0

 mov byte [es:di], 0

;-981 }


;-982 int to_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

to_far:  ; *** PROC ***

;-983   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   982 NULL dest = bp+4
;  201 ptr sign byte   982 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-984   asm cld

 cld

;-985   do{

.to_far588:

;-986   asm lodsb  ; inc si

 lodsb  ; inc si

;-987   asm stosb  ; inc di

 stosb  ; inc di

;-988   } while (al != 0);

 cmp  al, 0
 je  .to_far589
 jmp .to_far588
.to_far589:

;-989 }


;-990 int from_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

from_far:  ; *** PROC ***

;-991   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   990 NULL dest = bp+4
;  201 ptr sign byte   990 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-992   do{

.from_far590:

;-993   asm mov al, [es:si]

 mov al, [es:si]

;-994   asm inc si

 inc si

;-995   asm mov [di], al

 mov [di], al

;-996   asm inc di

 inc di

;-997   } while (al != 0);

 cmp  al, 0
 je  .from_far591
 jmp .from_far590
.from_far591:

;-998 }
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
;   55 arr sign byte    51   10 fname[67]
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
;  105 var sign word   292    5 mod1
;  106 var sign word   292   12 ireg1
;  107 var sign word   292    6 idx1
;  108 var sign word   292    1 ids1
;  109 var sign word   292    4 idw1
;  110 var sign word   292    2 idt1
;  111 var sign word   292 NULL val1
;  112 var sign word   293    2 mod2
;  113 var sign word   293    6 ireg2
;  114 var sign word   293    6 idx2
;  115 var sign word   293    1 ids2
;  116 var sign word   293    4 idw2
;  117 var sign word   293    2 idt2
;  118 var sign word   293    2 val2
;  119 arr sign byte   358    9 ops[5]
;  120 arr sign byte   400    3 printregstr[74]
;  121 var sign word   408    1 evalue
;  122 var sign word   408    1 exprtype
;  123 arr sign word   560    2 docalltype[10]
;  124 arr sign word   560    2 docallvalue[10]
;  125 arr sign byte   561    2 procname[17]
;  126 ptr sign byte   616    1 arglen
;  127 ptr sign byte   616    2 argv
;  128 arr sign byte   756    2 symboltemp[80]
;  129 var unsg word   937    1 MAXUI


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
;   38    1  282   isvariable
;   39    3  295   pexpr
;   40    1  302   constantexpr
;   41    3  312   exprstart
;   42    1  314   expr2
;   43    3  359   doreg1
;   44    6  378   checkreg
;   45    6  403   printreg
;   46    2  409   expr
;   47    4  458   compoundass
;   48    2  465   dovar1
;   49    8  486   rterm
;   50    1  499   isreg
;   51   15  517   doreg
;   52    1  523   doassign
;   53    1  541   domul
;   54    2  545   doidiv
;   55    1  558   domod
;   56    1  562   docall1
;   57 NULL  604   main
;   58    2  615   getfirstchar
;   59    1  617   getarg
;   60    2  635   parse
;   61    1  644   checkcalls
;   62    1  661   doinclude
;   63    1  672   dodefine
;   64    6  688   stmt
;   65    1  718   doemit
;   66    3  722   cmpneg
;   67    7  735   prlabel
;   68    3  736   prjump
;   69    1  737   doif
;   70    1  743   dodo
;   71    1  747   dowhile
;   72    4  750   isrelational
;   73   17  757   getlex
;   74    1  809   convertdefine
;   75    1  816   getdigit
;   76    1  825   getstring
;   77   31  828   next
;   78   78  829   istoken
;   79   36  830   expect
;   80    6  833   eprc
;   81    5  834   eprs
;   82   41  835   prc
;   83    3  840   prscomment
;   84    8  842   prnl
;   85  247  844   prs
;   86    2  849   eprnum
;   87   15  851   pint1
;   88   27  853   prunsign1
;   89   25  856   printint51
;   90    2  860   fgets1
;   91    1  864   printinputline
;   92    2  872   end1
;   93   50  873   error1
;   94    2  882   listproc
;   95    2  890   listvar
;   96    1  906   listcall
;   97    1  909   calllisting
;   98    1  915   countcalls
;   99    1  923   listfunc
;  100    1  927   funclisting
;  101    1  938   epilog
;  102    1  970   setblock
;  103    1  972   allocmem
;  104 NULL  976   copyF
;  105    1  982   to_far
;  106    3  990   from_far
;  107 NULL  998   LastFunctionByt

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
;  146  1006 prs
;  147  1010 prs
;  148  1014 prs
;  149  1018 strlen
;  150  1025 strcpy
;  151  1032 expect
;  152  1039 eqstr
;  153  1045 constantexpr
;  154  1058 checkreg
;  155  1067 doreg1
;  156  1074 exprstart
;  157  1084 prs
;  158  1088 prs
;  159  1092 expect
;  160  1099 getlex
;  161  1106 typeName
;  162  1115 searchname
;  163  1126 gettypes
;  164  1135 isrelational
;  165  1148 error1
;  166  1155 expect
;  167  1162 prs
;  168  1166 prs
;  169  1170 gettypes
;  170  1179 prs
;  171  1183 prs
;  172  1187 v
;  173  1189 prs
;  174  1193 prunsign1
;  175  1203 cmpneg
;  176  1210 prs
;  177  1214 expect
;  178  1221 eqstr
;  179  1227 expr2
;  180  1233 expr
;  181  1238 getlex
;  182  1245 typeName
;  183  1254 error1
;  184  1261 checkreg
;  185  1270 doreg1
;  186  1277 searchname
;  187  1288 gettypes
;  188  1297 error1
;  189  1304 isrelational
;  190  1317 error1
;  191  1324 istoken
;  192  1332 error1
;  193  1339 istoken
;  194  1347 prs
;  195  1351 prs
;  196  1355 prs
;  197  1359 prs
;  198  1363 prs
;  199  1367 v
;  200  1369 prs
;  201  1373 prunsign1
;  202  1383 adrofname
;  203  1393 prs
;  204  1397 prs
;  205  1401 typeName
;  206  1410 checkreg
;  207  1419 prs
;  208  1423 printreg
;  209  1432 v
;  210  1434 prs
;  211  1438 printreg
;  212  1447 error1
;  213  1454 searchname
;  214  1465 gettypes
;  215  1474 error1
;  216  1481 prs
;  217  1485 printreg
;  218  1494 error1
;  219  1501 prs
;  220  1505 a
;  221  1507 prs
;  222  1511 prs
;  223  1515 prs
;  224  1519 v
;  225  1521 adrofname
;  226  1531 prs
;  227  1535 prs
;  228  1539 error1
;  229  1546 istoken
;  230  1554 strcpy
;  231  1561 istoken
;  232  1569 strcpy
;  233  1576 istoken
;  234  1584 strcpy
;  235  1591 istoken
;  236  1599 strcpy
;  237  1606 istoken
;  238  1614 strcpy
;  239  1621 istoken
;  240  1629 strcpy
;  241  1636 istoken
;  242  1644 strcpy
;  243  1651 getlex
;  244  1658 isrelational
;  245  1671 error1
;  246  1678 strcpy
;  247  1685 prnl
;  248  1690 prs
;  249  1694 prs
;  250  1698 printreg
;  251  1707 prs
;  252  1711 istoken
;  253  1719 prunsign1
;  254  1729 typeName
;  255  1738 checkreg
;  256  1747 printreg
;  257  1756 searchname
;  258  1767 a
;  259  1769 v
;  260  1771 cmpneg
;  261  1778 prs
;  262  1782 expect
;  263  1789 strlen
;  264  1796 eqstr
;  265  1802 eqstr
;  266  1808 eqstr
;  267  1814 eqstr
;  268  1820 eqstr
;  269  1826 eqstr
;  270  1832 eqstr
;  271  1838 eqstr
;  272  1844 eqstr
;  273  1850 eqstr
;  274  1856 eqstr
;  275  1862 eqstr
;  276  1868 eqstr
;  277  1874 eqstr
;  278  1880 eqstr
;  279  1886 eqstr
;  280  1892 eqstr
;  281  1898 eqstr
;  282  1904 eqstr
;  283  1910 eqstr
;  284  1916 eqstr
;  285  1922 eqstr
;  286  1928 strlen
;  287  1935 eqstr
;  288  1941 eqstr
;  289  1947 eqstr
;  290  1953 eqstr
;  291  1959 eqstr
;  292  1965 eqstr
;  293  1971 eqstr
;  294  1977 eqstr
;  295  1983 eqstr
;  296  1989 prc
;  297  1993 prc
;  298  1997 prc
;  299  2001 istoken
;  300  2009 prs
;  301  2013 prunsign1
;  302  2023 typeName
;  303  2032 checkreg
;  304  2041 doreg1
;  305  2048 docall1
;  306  2056 isreg
;  307  2062 searchname
;  308  2073 gettypes
;  309  2082 istoken
;  310  2090 istoken
;  311  2098 expect
;  312  2105 searchname
;  313  2116 expect
;  314  2123 expect
;  315  2130 gettypes
;  316  2139 error1
;  317  2146 istoken
;  318  2154 error1
;  319  2161 prs
;  320  2165 prs
;  321  2169 prs
;  322  2173 v
;  323  2175 istoken
;  324  2183 error1
;  325  2190 prs
;  326  2194 prs
;  327  2198 prs
;  328  2202 v
;  329  2204 istoken
;  330  2212 compoundass
;  331  2224 istoken
;  332  2232 compoundass
;  333  2244 istoken
;  334  2252 compoundass
;  335  2264 istoken
;  336  2272 compoundass
;  337  2284 istoken
;  338  2292 error1
;  339  2299 istoken
;  340  2307 error1
;  341  2314 istoken
;  342  2322 expr
;  343  2327 doassign
;  344  2336 dovar1
;  345  2343 istoken
;  346  2351 rterm
;  347  2357 istoken
;  348  2365 rterm
;  349  2371 istoken
;  350  2379 rterm
;  351  2385 istoken
;  352  2393 rterm
;  353  2399 istoken
;  354  2407 rterm
;  355  2413 istoken
;  356  2421 rterm
;  357  2427 istoken
;  358  2435 domul
;  359  2441 istoken
;  360  2449 doidiv
;  361  2456 istoken
;  362  2464 domod
;  363  2470 isrelational
;  364  2483 rterm
;  365  2489 cmpneg
;  366  2496 error1
;  367  2503 prnl
;  368  2508 prs
;  369  2512 prs
;  370  2516 gettypes
;  371  2525 prs
;  372  2529 prs
;  373  2533 v
;  374  2535 prs
;  375  2539 expect
;  376  2546 prunsign1
;  377  2556 gettypes
;  378  2565 prs
;  379  2569 v
;  380  2571 prnl
;  381  2576 prs
;  382  2580 prs
;  383  2584 prs
;  384  2588 prnl
;  385  2593 prs
;  386  2597 prs
;  387  2601 a
;  388  2603 prs
;  389  2607 v
;  390  2609 prs
;  391  2613 prs
;  392  2617 prs
;  393  2621 prs
;  394  2625 prs
;  395  2629 prc
;  396  2633 printName
;  397  2643 prs
;  398  2647 prnl
;  399  2652 prs
;  400  2656 prs
;  401  2660 prs
;  402  2664 prs
;  403  2668 v
;  404  2670 istoken
;  405  2678 prnl
;  406  2683 prs
;  407  2687 prs
;  408  2691 prs
;  409  2695 prs
;  410  2699 prunsign1
;  411  2709 typeName
;  412  2718 searchname
;  413  2729 istoken
;  414  2737 searchname
;  415  2748 expect
;  416  2755 expect
;  417  2762 gettypes
;  418  2771 error1
;  419  2778 eqstr
;  420  2784 dovar1
;  421  2791 eqstr
;  422  2797 doreg
;  423  2803 eqstr
;  424  2809 doreg
;  425  2815 eqstr
;  426  2821 doreg
;  427  2827 eqstr
;  428  2833 doreg
;  429  2839 eqstr
;  430  2845 doreg
;  431  2851 eqstr
;  432  2857 doreg
;  433  2863 eqstr
;  434  2869 doreg
;  435  2875 eqstr
;  436  2881 doreg
;  437  2887 eqstr
;  438  2893 doreg
;  439  2899 eqstr
;  440  2905 doreg
;  441  2911 eqstr
;  442  2917 doreg
;  443  2923 eqstr
;  444  2929 doreg
;  445  2935 eqstr
;  446  2941 doreg
;  447  2947 eqstr
;  448  2953 doreg
;  449  2959 eqstr
;  450  2965 doreg
;  451  2971 expect
;  452  2978 prs
;  453  2982 prs
;  454  2986 prs
;  455  2990 istoken
;  456  2998 prunsign1
;  457  3008 istoken
;  458  3016 searchname
;  459  3027 v
;  460  3029 error1
;  461  3036 gettypes
;  462  3045 prs
;  463  3049 v
;  464  3051 prs
;  465  3055 prs
;  466  3059 prs
;  467  3063 a
;  468  3065 prs
;  469  3069 prs
;  470  3073 prunsign1
;  471  3083 v
;  472  3085 prs
;  473  3089 prs
;  474  3093 printName
;  475  3103 prs
;  476  3107 prs
;  477  3111 prs
;  478  3115 prs
;  479  3119 v
;  480  3121 prs
;  481  3125 prs
;  482  3129 prs
;  483  3133 v
;  484  3135 prs
;  485  3139 prs
;  486  3143 prs
;  487  3147 v
;  488  3149 prs
;  489  3153 rterm
;  490  3159 istoken
;  491  3167 prs
;  492  3171 prunsign1
;  493  3181 prs
;  494  3185 error1
;  495  3192 istoken
;  496  3200 prs
;  497  3204 prunsign1
;  498  3214 prs
;  499  3218 prs
;  500  3222 typeName
;  501  3231 searchname
;  502  3242 error1
;  503  3249 gettypes
;  504  3258 error1
;  505  3265 error1
;  506  3272 prs
;  507  3276 v
;  508  3278 prs
;  509  3282 prs
;  510  3286 doidiv
;  511  3293 prs
;  512  3297 checknamelen
;  513  3310 strcpy
;  514  3317 storecall
;  515  3327 expect
;  516  3334 istoken
;  517  3342 error1
;  518  3349 istoken
;  519  3357 istoken
;  520  3365 eprs
;  521  3370 eprs
;  522  3375 eprc
;  523  3380 eprnum
;  524  3387 eprs
;  525  3392 eprc
;  526  3397 eprs
;  527  3402 eprc
;  528  3407 eprs
;  529  3412 istoken
;  530  3420 name1
;  531  3426 searchname
;  532  3437 istoken
;  533  3445 checkreg
;  534  3454 searchname
;  535  3465 error1
;  536  3472 istoken
;  537  3480 expect
;  538  3487 prs
;  539  3491 pint1
;  540  3497 prs
;  541  3501 prs
;  542  3505 prc
;  543  3509 pint1
;  544  3515 prs
;  545  3519 v
;  546  3521 prs
;  547  3525 gettypes
;  548  3534 prs
;  549  3538 v
;  550  3540 prs
;  551  3544 v
;  552  3546 prs
;  553  3550 prs
;  554  3554 printreg
;  555  3563 prs
;  556  3567 prs
;  557  3571 prs
;  558  3575 pint1
;  559  3581 getarg
;  560  3588 setblock
;  561  3597 error1
;  562  3604 allocmem
;  563  3613 error1
;  564  3620 getfirstchar
;  565  3633 parse
;  566  3639 checkcalls
;  567  3650 epilog
;  568  3657 fgets1
;  569  3664 cputs
;  570  3670 cputs
;  571  3676 readRL
;  572  3683 prnl
;  573  3688 strcpy
;  574  3695 instr1
;  575  3702 strcat1
;  576  3710 toupper
;  577  3718 strcpy
;  578  3725 strlen
;  579  3732 openR
;  580  3738 cputs
;  581  3744 cputs
;  582  3750 exitR
;  583  3756 creatR
;  584  3763 cputs
;  585  3769 cputs
;  586  3775 exitR
;  587  3781 prs
;  588  3785 prs
;  589  3789 prs
;  590  3793 prs
;  591  3797 prs
;  592  3801 prs
;  593  3805 prs
;  594  3809 getlex
;  595  3816 istoken
;  596  3824 istoken
;  597  3832 dodefine
;  598  3841 istoken
;  599  3849 doinclude
;  600  3859 error1
;  601  3866 typeName
;  602  3875 dofunc
;  603  3882 doglob
;  604  3889 prs
;  605  3893 from_far
;  606  3902 adrF
;  607  3907 eqstr
;  608  3913 prs
;  609  3917 prs
;  610  3921 prs
;  611  3925 printint51
;  612  3936 error1
;  613  3943 prs
;  614  3947 prs
;  615  3951 prs
;  616  3955 openR
;  617  3961 prs
;  618  3965 prs
;  619  3969 error1
;  620  3976 parse
;  621  3982 prs
;  622  3986 prs
;  623  3990 getfirstchar
;  624  4003 getlex
;  625  4010 eqstr
;  626  4016 getlex
;  627  4023 eqstr
;  628  4029 getlex
;  629  4036 prs
;  630  4040 strcpy
;  631  4047 prs
;  632  4051 error1
;  633  4058 getlex
;  634  4065 expect
;  635  4072 error1
;  636  4079 strlen
;  637  4086 error1
;  638  4093 adrofname
;  639  4103 strcpy
;  640  4110 expect
;  641  4117 istoken
;  642  4125 istoken
;  643  4133 stmt
;  644  4138 istoken
;  645  4146 doif
;  646  4151 istoken
;  647  4159 dodo
;  648  4164 istoken
;  649  4172 dowhile
;  650  4180 istoken
;  651  4188 prs
;  652  4192 name1
;  653  4198 prs
;  654  4202 expect
;  655  4209 prs
;  656  4213 next
;  657  4218 prc
;  658  4222 next
;  659  4227 getlex
;  660  4234 istoken
;  661  4242 prs
;  662  4246 next
;  663  4251 prc
;  664  4255 next
;  665  4260 getlex
;  666  4267 error1
;  667  4274 istoken
;  668  4282 doemit
;  669  4289 istoken
;  670  4297 istoken
;  671  4305 exprstart
;  672  4315 prs
;  673  4319 expect
;  674  4326 prs
;  675  4330 prs
;  676  4334 prc
;  677  4338 expect
;  678  4345 expect
;  679  4352 exprstart
;  680  4362 expect
;  681  4369 prs
;  682  4373 getlex
;  683  4380 prunsign1
;  684  4390 getlex
;  685  4397 prc
;  686  4401 expect
;  687  4408 prs
;  688  4412 prs
;  689  4416 prs
;  690  4420 prs
;  691  4424 prs
;  692  4428 prunsign1
;  693  4438 prs
;  694  4442 prs
;  695  4446 prunsign1
;  696  4456 prs
;  697  4460 prs
;  698  4464 prs
;  699  4468 error1
;  700  4475 prs
;  701  4479 prs
;  702  4483 pint1
;  703  4489 prc
;  704  4493 prs
;  705  4497 prs
;  706  4501 pint1
;  707  4507 pexpr
;  708  4513 pint1
;  709  4519 stmt
;  710  4524 istoken
;  711  4532 prjump
;  712  4539 prlabel
;  713  4547 stmt
;  714  4552 prlabel
;  715  4560 prlabel
;  716  4568 prlabel
;  717  4576 stmt
;  718  4581 expect
;  719  4588 pexpr
;  720  4594 pint1
;  721  4600 prjump
;  722  4607 prlabel
;  723  4615 prlabel
;  724  4623 pexpr
;  725  4629 pint1
;  726  4635 stmt
;  727  4640 prjump
;  728  4647 prlabel
;  729  4655 getlex
;  730  4662 next
;  731  4667 next
;  732  4672 next
;  733  4677 next
;  734  4682 next
;  735  4687 next
;  736  4692 next
;  737  4697 next
;  738  4702 next
;  739  4707 next
;  740  4712 next
;  741  4717 next
;  742  4722 next
;  743  4727 next
;  744  4732 next
;  745  4737 instr1
;  746  4744 next
;  747  4749 getlex
;  748  4756 next
;  749  4761 next
;  750  4766 getlex
;  751  4773 getstring
;  752  4783 digit
;  753  4789 getdigit
;  754  4798 next
;  755  4803 next
;  756  4808 next
;  757  4813 alnum
;  758  4819 strcpy
;  759  4826 alnum
;  760  4832 next
;  761  4837 eqstr
;  762  4843 eqstr
;  763  4849 eqstr
;  764  4855 eqstr
;  765  4861 eqstr
;  766  4867 eqstr
;  767  4873 eqstr
;  768  4879 eqstr
;  769  4885 eqstr
;  770  4891 eqstr
;  771  4897 eqstr
;  772  4903 eqstr
;  773  4909 eqstr
;  774  4915 eqstr
;  775  4921 eqstr
;  776  4927 eqstr
;  777  4933 eqstr
;  778  4939 convertdefine
;  779  4953 strcpy
;  780  4960 error1
;  781  4967 adrofname
;  782  4977 eqstr
;  783  4983 next
;  784  4988 alnum
;  785  4994 next
;  786  4999 digit
;  787  5005 next
;  788  5010 next
;  789  5015 next
;  790  5020 fgets1
;  791  5027 getlex
;  792  5034 istoken
;  793  5042 prs
;  794  5046 listproc
;  795  5055 prs
;  796  5059 pint1
;  797  5065 error1
;  798  5072 eprc
;  799  5077 writetty
;  800  5086 writetty
;  801  5095 fputcR
;  802  5102 prc
;  803  5106 prs
;  804  5110 prc
;  805  5114 eprc
;  806  5119 mkneg
;  807  5125 eprnum
;  808  5132 eprc
;  809  5137 prc
;  810  5141 mkneg
;  811  5147 pint1
;  812  5153 prc
;  813  5157 prunsign1
;  814  5167 prc
;  815  5171 prc
;  816  5175 prc
;  817  5179 prc
;  818  5183 prc
;  819  5187 prunsign1
;  820  5197 printinputline
;  821  5212 readRL
;  822  5219 prs
;  823  5223 prunsign1
;  824  5233 prc
;  825  5237 prscomment
;  826  5248 fcloseR
;  827  5256 fcloseR
;  828  5264 exitR
;  829  5270 prnl
;  830  5275 prscomment
;  831  5286 prs
;  832  5290 prunsign1
;  833  5300 prs
;  834  5304 prs
;  835  5308 prs
;  836  5312 pint1
;  837  5318 prs
;  838  5322 prunsign1
;  839  5332 prs
;  840  5336 prc
;  841  5340 prs
;  842  5344 pint1
;  843  5350 prs
;  844  5354 prs
;  845  5358 end1
;  846  5363 prs
;  847  5367 prs
;  848  5371 prs
;  849  5375 prunsign1
;  850  5385 prs
;  851  5389 listvar
;  852  5397 prs
;  853  5401 printint51
;  854  5412 prc
;  855  5416 prs
;  856  5420 prs
;  857  5424 prs
;  858  5428 prs
;  859  5432 prs
;  860  5436 prs
;  861  5440 prs
;  862  5444 prs
;  863  5448 prs
;  864  5452 printint51
;  865  5463 printint51
;  866  5474 prs
;  867  5478 prs
;  868  5482 prc
;  869  5486 adrofname
;  870  5496 prs
;  871  5500 prc
;  872  5504 prunsign1
;  873  5514 prc
;  874  5518 prunsign1
;  875  5528 prc
;  876  5532 prs
;  877  5536 prc
;  878  5540 pint1
;  879  5546 prs
;  880  5550 calllisting
;  881  5562 prs
;  882  5566 printint51
;  883  5577 prc
;  884  5581 prs
;  885  5585 printint51
;  886  5596 prc
;  887  5600 from_far
;  888  5609 prs
;  889  5613 adrF
;  890  5618 from_far
;  891  5627 eqstr
;  892  5633 prs
;  893  5637 countcalls
;  894  5648 funclisting
;  895  5660 prs
;  896  5664 printint51
;  897  5675 printint51
;  898  5686 prs
;  899  5690 printint51
;  900  5701 prc
;  901  5705 prs
;  902  5709 prs
;  903  5713 prs
;  904  5717 prs
;  905  5721 prc
;  906  5725 prc
;  907  5729 adrF
;  908  5734 prs
;  909  5738 strcpy
;  910  5745 storefunc
;  911  5755 prs
;  912  5759 prs
;  913  5763 listvar
;  914  5771 listfunc
;  915  5780 listcall
;  916  5789 prs
;  917  5793 prs
;  918  5797 prs
;  919  5801 prs
;  920  5805 prs
;  921  5809 printint51
;  922  5820 prs
;  923  5824 printint51
;  924  5835 prs
;  925  5839 printint51
;  926  5850 prs
;  927  5854 printint51
;  928  5865 prs
;  929  5869 printint51
;  930  5880 prs
;  931  5884 printint51
;  932  5895 prs
;  933  5899 printint51
;  934  5910 prs
;  935  5914 printint51
;  936  5925 prs
;  937  5929 printint51
;  938  5940 prs
;  939  5944 printint51
;  940  5955 prs
;  941  5959 printint51
;  942  5970 prs
;  943  5974 printint51
;  944  5985 prs
;  945  5989 prs
;  946  5993 prunsign1
;  947  6003 prs
;  948  6007 printint51
;  949  6018 prs
;  950  6022 prs
;  951  6026 prs
;  952  6030 prs
;  953  6034 printint51
;  954  6045 prs
;  955  6049 printint51
;  956  6060 prs
;  957  6064 printint51
;  958  6075 prs
;  959  6079 end1
;  960  6084 DosInt
;  961  6091 DosInt
;Input: A.C, List: A.S,  Lines:  999
;Glob. variables:  129 max.:  200
;Functions      :  108 max.:  300
;Calls          :  962 max.: 2000, NameField: 6098 max.:    65535
;Code until     :21671 max.: 30000, free: 8329
;Data (HeapEnd) :53548, resting stacksize: 11987
;Max. Const in 'epilog' :  947 max. 3000, free: 2053