
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
absolute -32536
coname resb 67
section .text
cloc dw 0

;-50 int fdin=0;        int fdout=0;      char symbol[128];

fdin dw 0
fdout dw 0
section .bss
absolute -32469
symbol resb 128
section .text

;-51 char fname[CMDLENMAX];               char namein[CMDLENMAX];

section .bss
absolute -32341
fname resb 67
section .text
section .bss
absolute -32274
namein resb 67
section .text

;-52 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];

section .bss
absolute -32207
namelst resb 67
section .text
section .bss
absolute -32140
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
absolute -32073
GType resb 300
section .text

;-59 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S

signi dw 0
issign db 0
section .bss
absolute -31773
GSign resb 300
section .text

;-60 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4

widthi dw 0
iswidth db 0
section .bss
absolute -31473
GWidth resb 300
section .text

;-61              int GAdr[VARMAX]; int  GUsed [VARMAX];

section .bss
absolute -31173
GAdr resw 300
section .text
section .bss
absolute -30573
GUsed resw 300
section .text

;-62 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];

wi dw 0
section .bss
absolute -29973
GData resw 300
section .text
section .bss
absolute -29373
GNameField resb 4800
section .text

;-63 int  FTop=0;                 int  CTop=0;

FTop dw 0
CTop dw 0

;-64 char FType [FUNCMAX];        char CType[CALLMAX];

section .bss
absolute -24573
FType resb 300
section .text
section .bss
absolute -24273
CType resb 2000
section .text

;-65 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];

section .bss
absolute -22273
FAdr resw 300
section .text
section .bss
absolute -21673
CAdr resw 2000
section .text

;-66 int  FCalls[FUNCMAX];

section .bss
absolute -17673
FCalls resw 300
section .text

;-67 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];

section .bss
absolute -17073
FNameField resb 4800
section .text

;-68 char NameA[]="12345678901234567890123456789012"; //must be in low memory

NameA db "12345678901234567890123456789012",0

;-69 char fgetsdest[128];         unsigned char *CNameTop=0;

section .bss
absolute -12273
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

;-101 


;-102 int digit(char c){ 
 LEAVE
 ret
; ENDP

digit:  ; *** PROC ***

;-103     if(c<'0') return 0; 

;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   102 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit21
 mov ax, 0
 jmp .retndigit

;-104     if(c>'9') return 0; 

.digit21:
 mov al, [bp+4]
 cmp al, 57
 jle .digit22
 mov ax, 0
 jmp .retndigit

;-105     return 1; 

.digit22:
 mov ax, 1
 jmp .retndigit

;-106 }


;-107 int letter(char c) { 

 .retndigit: LEAVE
 ret
; ENDP

letter:  ; *** PROC ***

;-108     if (c=='_') return 1;

;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   107 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter23
 mov ax, 1
 jmp .retnletter

;-109     if (c=='.') return 1;

.letter23:
 mov al, [bp+4]
 cmp al, 46
 jne .letter24
 mov ax, 1
 jmp .retnletter

;-110     if (c=='?') return 1;

.letter24:
 mov al, [bp+4]
 cmp al, 63
 jne .letter25
 mov ax, 1
 jmp .retnletter

;-111     if (c=='$') return 1;

.letter25:
 mov al, [bp+4]
 cmp al, 36
 jne .letter26
 mov ax, 1
 jmp .retnletter

;-112     if (c> 'z') return 0; 

.letter26:
 mov al, [bp+4]
 cmp al, 122
 jle .letter27
 mov ax, 0
 jmp .retnletter

;-113     if (c< '@') return 0;// at included

.letter27:
 mov al, [bp+4]
 cmp al, 64
 jge .letter28
 mov ax, 0
 jmp .retnletter

;-114     if (c> 'Z') { if (c< 'a') return 0; }  

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

;-115     return 1; 

.letter29:
 mov ax, 1
 jmp .retnletter

;-116 }    


;-117 int alnum(char c) {

 .retnletter: LEAVE
 ret
; ENDP

alnum:  ; *** PROC ***

;-118   if (digit (c)) return 1;

;Function : alnum, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   117 NULL c = bp+4;
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

;-119   if (letter(c)) return 1;

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

;-120   return 0;

.alnum32:
 mov ax, 0
 jmp .retnalnum

;-121 }       


;-122 int a(unsigned int i) {  printName(i);}//address

 .retnalnum: LEAVE
 ret
; ENDP

a:  ; *** PROC ***
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   122 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-123 int v(unsigned int i) {//value 
 LEAVE
 ret
; ENDP

v:  ; *** PROC ***

;-124     if (i < LSTART) prc('['); 

;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   123 NULL i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v33
 push 91
 call prc
 add  sp, 2

;-125     printName(i);

.v33:
 push word [bp+4]
 call printName
 add  sp, 2

;-126     if (i < LSTART) prc(']');   

 mov ax, [bp+4]
 cmp ax, 200
 jge .v34
 push 93
 call prc
 add  sp, 2

;-127 }

.v34:

;-128 int checknamelen() { int i;    i=strlen(symbol);
 LEAVE
 ret
; ENDP

checknamelen:  ; *** PROC ***
;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   128 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-129   if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen35
 push checknamelen_0
 call error1
 add  sp, 2

;-130 }

.checknamelen35:

;-131 char doglobName[IDLENMAX];
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
; ENDP
section .bss
absolute -12145
doglobName resb 15
section .text

;-132 int doglob() { int i; int j; int isstrarr; isstrarr=0;


doglob:  ; *** PROC ***
;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   132 NULL i = bp-2
;  201 var sign word   132 NULL j = bp-4
;  202 var sign word   132 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-133   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob36
 push doglob_0
 call error1
 add  sp, 2

;-134   if (iswidth == 0) error1("no VOID as var type");

.doglob36:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob37
 push doglob_1
 call error1
 add  sp, 2

;-135   checknamelen();

.doglob37:
 call checknamelen

;-136   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob38
 push doglob_2
 call error1
 add  sp, 2

;-137   if (istoken('[')) { istype='&';

.doglob38:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob39
 mov ax, 38
 mov byte [istype], al

;-138     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob40

;-139       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-140       pint1(orgData);

 push word [orgData]
 call pint1
 add  sp, 2

;-141       prs("\n"); prs(symbol); 

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-142       if (iswidth==1) prs(" resb "); 

 mov al, [iswidth]
 cmp al, 1
 jne .doglob41
 push doglob_5
 call prs
 add  sp, 2

;-143       if (iswidth==2) prs(" resw ");

.doglob41:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob42
 push doglob_6
 call prs
 add  sp, 2

;-144       if (iswidth==4) prs(" resd ");

.doglob42:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob43
 push doglob_7
 call prs
 add  sp, 2

;-145       pint1(lexval); 

.doglob43:
 push word [lexval]
 call pint1
 add  sp, 2

;-146       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-147       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-148       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob44
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-149       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

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

;-150       GData[GTop]=lexval; expect(']');

.doglob45:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-151     }else { expect(']');

 jmp .doglob46
.doglob40:
 push 93
 call expect
 add  sp, 2

;-152       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob47
 push doglob_9
 call error1
 add  sp, 2

;-153       prs("\n"); prs(symbol); prs(" db "); 

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

;-154       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-155       expect('='); 

 push 61
 call expect
 add  sp, 2

;-156       if (istoken(T_STRING)) { 

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob48

;-157         prc(34); prscomment(symbol); prc(34); prs(",0"); 

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

;-158         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-159       else if (istoken('{' )) { i=0;

 jmp .doglob49
.doglob48:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob50
 mov ax, 0
 mov [bp-2], ax

;-160         do { if(i) prc(','); 

.doglob51:
 mov ax, [bp-2]
 or  al, al
 je .doglob52
 push 44
 call prc
 add  sp, 2

;-161           expect(T_CONST); pint1(lexval); i=1; }

.doglob52:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call pint1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-162         while (istoken(',')); expect('}'); }  

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

;-163       else error1("String or number array expected");

 jmp .doglob54
.doglob50:
 push doglob_13
 call error1
 add  sp, 2

;-164       }; 

.doglob54:
.doglob49:
.doglob46:

;-165   }else { //expect('=');

 jmp .doglob55
.doglob39:

;-166     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

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

;-167     else {

 jmp .doglob57
.doglob56:

;-168       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob58
 push doglob_16
 call prs
 add  sp, 2

;-169       else if (iswidth==2) prs(" dw ");

 jmp .doglob59
.doglob58:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob60
 push doglob_17
 call prs
 add  sp, 2

;-170       else                 prs(" dd ");

 jmp .doglob61
.doglob60:
 push doglob_18
 call prs
 add  sp, 2

;-171     }

.doglob61:
.doglob59:

;-172     if(istoken('-')) prc('-');

.doglob57:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob62
 push 45
 call prc
 add  sp, 2

;-173     if (istoken('=')) {expect(T_CONST); pint1(lexval); }

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
 call pint1
 add  sp, 2

;-174     else pint1(0); }

 jmp .doglob64
.doglob63:
 push 0
 call pint1
 add  sp, 2
.doglob64:

;-175   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

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

;-176   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-177   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-178   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

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

;-179   GTop++; expect(';'); }

.doglob66:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-180 


;-181 int gettypes(int i) {int j; char c;
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

;-182   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   181 NULL i = bp+4
;  201 var sign word   181 NULL j = bp-2
;  202 var sign byte   181 NULL c = bp-4;
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

;-183   c=GWidth[i]; widthi=0;wi=0;

.gettypes68:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-184   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes69
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-185   if (c==2) {widthi=2;wi=2;}

.gettypes69:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes70
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-186   if (c==4) {widthi=4;wi=4;}

.gettypes70:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes71
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-187   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

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

;-188   if (c=='&')  typei=2;  

.gettypes72:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes73
 mov ax, 2
 mov word [typei], ax

;-189   return i; }  

.gettypes73:
 mov ax, [bp+4]
 jmp .retngettypes

;-190 int adrofname(unsigned int i) { adrF(GNameField, i); }

 .retngettypes: LEAVE
 ret
; ENDP

adrofname:  ; *** PROC ***
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   190 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-191 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
; ENDP

adrF:  ; *** PROC ***
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   191 NULL s = bp+4
;  201 var unsg word   191 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-192   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-193 int printName(unsigned int i) {int j;
 LEAVE
 ret
; ENDP

printName:  ; *** PROC ***

;-194   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   193 NULL i = bp+4
;  201 var sign word   193 NULL j = bp-2;
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

;-195   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

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

;-196 }

.printName75:

;-197 int searchname() { unsigned int i;
 LEAVE
 ret
printName_0 db "[bp",0
; ENDP

searchname:  ; *** PROC ***

;-198   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   197 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname77
 push searchname_0
 call error1
 add  sp, 2

;-199   GUsed[i]=GUsed[i] + 1; return i;

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

;-200 }


;-201 int checkName() { unsigned int i; unsigned int j;

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
; ENDP

checkName:  ; *** PROC ***

;-202   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   201 NULL i = bp-2
;  201 var unsg word   201 NULL j = bp-4;
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

;-203   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

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

;-204   return 0;

 jmp .checkName81
.checkName82:
 mov ax, 0
 jmp .retncheckName

;-205 }    


;-206 int typeName() { int m; //0=V,1=*,2=&

 .retncheckName: LEAVE
 ret
; ENDP

typeName:  ; *** PROC ***

;-207     issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   206 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-208     if(istoken(T_SIGNED))   issign='S';  

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName84
 mov ax, 83
 mov byte [issign], al

;-209     if(istoken(T_UNSIGNED)) issign='U';

.typeName84:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName85
 mov ax, 85
 mov byte [issign], al

;-210     iswidth=2;                           

.typeName85:
 mov ax, 2
 mov byte [iswidth], al

;-211     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName86
 mov ax, 0
 mov byte [iswidth], al

;-212     if(istoken(T_CHAR))     iswidth=1;   

.typeName86:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName87
 mov ax, 1
 mov byte [iswidth], al

;-213     if(istoken(T_INT))      iswidth=2;

.typeName87:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName88
 mov ax, 2
 mov byte [iswidth], al

;-214     if(istoken(T_LONG))     iswidth=4;

.typeName88:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName89
 mov ax, 4
 mov byte [iswidth], al

;-215     istype='V'; 

.typeName89:
 mov ax, 86
 mov byte [istype], al

;-216     m=0;

 mov ax, 0
 mov [bp-2], ax

;-217     if(istoken('*'))  {istype='*'; m=1;} 

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName90
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-218     if(istoken('&'))  {istype='&'; m=2;}

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

;-219     name1(); 

.typeName91:
 call name1

;-220     return m; 

 mov ax, [bp-2]
 jmp .retntypeName

;-221 }


;-222 int name1() {

 .retntypeName: LEAVE
 ret
; ENDP

name1:  ; *** PROC ***

;-223     if (token!=T_NAME) error1("Name expected"); 

 mov ax, [token]
 cmp ax, 256
 je  .name192
 push name1_0
 call error1
 add  sp, 2

;-224     token=getlex(); 

.name192:
 call getlex
 mov word [token], ax

;-225 }


;-226 


;-227 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");

 ret
name1_0 db "Name expected",0
; ENDP

storecall:  ; *** PROC ***
;Function : storecall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   227 NULL i = bp-2;
 ENTER  2,0
 mov ax, [CTop]
 cmp ax, 2000 ;unsigned : 1
 jl  .storecall93
 push storecall_0
 call error1
 add  sp, 2

;-228   if (CNameTop >= 65468) error1("Call name table fuill");

.storecall93:
 mov ax, [CNameTop]
 cmp ax, -68 ;unsigned : 0
 jb  .storecall94
 push storecall_1
 call error1
 add  sp, 2

;-229     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

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

;-230     to_far(CNameTop, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNameTop]
 call to_far
 add  sp, 4

;-231     CNameTop=CNameTop+i; CNameTop++; CTop++;

 mov ax, [CNameTop]
 add ax, [bp-2]
 mov word [CNameTop], ax
 inc  word[CNameTop]
 inc  word[CTop]

;-232 }


;-233 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0
; ENDP

storefunc:  ; *** PROC ***
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc95
 push storefunc_0
 call error1
 add  sp, 2

;-234     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

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

;-235     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-236 }


;-237 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
; ENDP

addlocal:  ; *** PROC ***
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal96
 push addlocal_0
 call error1
 add  sp, 2

;-238   if (checkName() != 0) error1("Variable already defined");

.addlocal96:
 call checkName
 cmp ax, 0
 je  .addlocal97
 push addlocal_1
 call error1
 add  sp, 2

;-239   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

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

;-240   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-241   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-242 }


;-243 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
; ENDP

checkFunction:  ; *** PROC ***
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   243 NULL i = bp-2
;  201 var unsg word   243 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-244   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

.checkFunction98:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction99
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

;-245   return 0; }

 jmp .checkFunction98
.checkFunction99:
 mov ax, 0
 jmp .retncheckFunction

;-246 int dofunc() { int nloc; int i; int narg;  

 .retncheckFunction: LEAVE
 ret
; ENDP

dofunc:  ; *** PROC ***

;-247   cloc=&co; 

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   246 NULL nloc = bp-2
;  201 var sign word   246 NULL i = bp-4
;  202 var sign word   246 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-248   checknamelen();

 call checknamelen

;-249   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-250   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc101
 push dofunc_0
 call error1
 add  sp, 2

;-251   storefunc();

.dofunc101:
 call storefunc

;-252   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");

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

;-253   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-254   if (istoken(')')==0) { narg=2; 

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc102
 mov ax, 2
 mov [bp-6], ax

;-255     do { typeName();  addlocal(); narg+=2;

.dofunc103:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-256          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

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

;-257     while (istoken(','));  expect(')'); }

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

;-258     


;-259   expect('{'); /*body*/

.dofunc102:
 push 123
 call expect
 add  sp, 2

;-260   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-261   while(isvariable()) {

.dofunc106:
 call isvariable
 or  al, al
 je .dofunc107

;-262     do {typeName();

.dofunc108:
 call typeName

;-263         checknamelen();

 call checknamelen

;-264         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-265         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc109
 sub  word[bp-2], 2

;-266         GData[LTop]=nloc;

.dofunc109:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-267         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc110
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

;-268             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-269         LTop++;

.dofunc110:
 inc  word[LTop]

;-270       } while (istoken(',')); expect(';'); }

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

;-271   listproc(); 

 jmp .dofunc106
.dofunc107:
 call listproc

;-272   if (LTop>LSTART){prs(";\n ENTER  "); 

 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc112
 push dofunc_3
 call prs
 add  sp, 2

;-273     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }

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

;-274   while(istoken('}')==0)   stmt();

.dofunc112:
.dofunc113:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc114
 call stmt

;-275   if (nreturn) { 

 jmp .dofunc113
.dofunc114:
 mov ax, [nreturn]
 or  al, al
 je .dofunc115

;-276         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-277         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-278         prc(':');

 push 58
 call prc
 add  sp, 2

;-279         }


;-280   if (LTop > LSTART) prs(" LEAVE");

.dofunc115:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc116
 push dofunc_6
 call prs
 add  sp, 2

;-281   prs("\n ret"); 

.dofunc116:
 push dofunc_7
 call prs
 add  sp, 2

;-282   *cloc=0; prs(co); 

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-283   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-284   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

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

;-285   prs("\n; ENDP"); 

.dofunc117:
 push dofunc_8
 call prs
 add  sp, 2

;-286 }


;-287 int isvariable() {
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

;-288     if(token==T_SIGNED)   goto v1;   

 mov ax, [token]
 cmp ax, 531
 jne .isvariable118
 jmp .v1

;-289     if(token==T_UNSIGNED) goto v1;

.isvariable118:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable119
 jmp .v1

;-290     if(token==T_CHAR)     goto v1;   

.isvariable119:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable120
 jmp .v1

;-291     if(token==T_INT)      goto v1;

.isvariable120:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable121
 jmp .v1

;-292     if(token==T_LONG)     goto v1;

.isvariable121:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable122
 jmp .v1

;-293     return 0;  

.isvariable122:
 mov ax, 0
 jmp .retnisvariable

;-294 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-295 }


;-296                   


;-297 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;

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

;-298 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

mod2 dw 0
ireg2 dw 0
idx2 dw 0
ids2 dw 0
idw2 dw 0
idt2 dw 0
val2 dw 0

;-299 


;-300 int pexpr() {expect('('); iscmp=0; 


pexpr:  ; *** PROC ***
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-301   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

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

;-302     ireg1=checkreg();

.pexpr124:
 call checkreg
 mov word [ireg1], ax

;-303     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr125
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr125:

;-304   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

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

;-305   expect(')'); }           /*error1("Vergleich fehlt");*/

 push 41
 call expect
 add  sp, 2

;-306 


;-307 int constantexpr() { int mode; int id1;int ids;

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
; ENDP

constantexpr:  ; *** PROC ***

;-308   token=getlex();   mode=typeName();  

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   307 NULL mode = bp-2
;  201 var sign word   307 NULL id1 = bp-4
;  202 var sign word   307 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-309   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-310   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr127
 push constantexpr_0
 call error1
 add  sp, 2

;-311   expect(T_CONST);  prs(" ; constant expression");

.constantexpr127:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-312   prs("\ncmp "); 

 push constantexpr_2
 call prs
 add  sp, 2

;-313   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

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

;-314   v(id1); prs(", "); pint1(lexval); cmpneg(ids);   prs(fname);

.constantexpr129:
 push word [bp-4]
 call v
 add  sp, 2
 push constantexpr_5
 call prs
 add  sp, 2
 push word [lexval]
 call pint1
 add  sp, 2
 push word [bp-6]
 call cmpneg
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-315   expect(')');

 push 41
 call expect
 add  sp, 2

;-316 }  


;-317 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
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

;-318 


;-319 int expr2(int kind) {  int i;

 ret
exprstart_0 db "_",0
; ENDP

expr2:  ; *** PROC ***

;-320   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   319 NULL kind = bp+4
;  201 var sign word   319 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  .expr2132
 call getlex
 mov word [token], ax

;-321   mod1=typeName();

.expr2132:
 call typeName
 mov word [mod1], ax

;-322   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je .expr2133
 push expr2_0
 call error1
 add  sp, 2

;-323   ireg1=checkreg();

.expr2133:
 call checkreg
 mov word [ireg1], ax

;-324   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr2134
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr2

;-325   if (ireg1 == 0) { idx1=searchname();

.expr2134:
 mov ax, [ireg1]
 cmp ax, 0
 jne .expr2135
 call searchname
 mov word [idx1], ax

;-326     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-327     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je .expr2136
 push expr2_1
 call error1
 add  sp, 2
.expr2136:

;-328   


;-329   if (isrelational()) { error1("Vergleich noch nicht implementiert");

.expr2135:
 call isrelational
 or  al, al
 je .expr2137
 push expr2_2
 call error1
 add  sp, 2

;-330   }


;-331   if (istoken('=') == 0) error1("Assign expected");

.expr2137:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expr2138
 push expr2_3
 call error1
 add  sp, 2

;-332   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

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

;-333     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-334     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne .expr2140
 push expr2_6
 call prs
 add  sp, 2

;-335     if (idw1 == 2) prs("word ");

.expr2140:
 mov ax, [idw1]
 cmp ax, 2
 jne .expr2141
 push expr2_7
 call prs
 add  sp, 2

;-336     if (idw1 == 4) prs("dword ");

.expr2141:
 mov ax, [idw1]
 cmp ax, 4
 jne .expr2142
 push expr2_8
 call prs
 add  sp, 2

;-337     v(idx1);

.expr2142:
 push word [idx1]
 call v
 add  sp, 2

;-338     prs(", "); pint1(val2);

 push expr2_9
 call prs
 add  sp, 2
 push word [val2]
 call pint1
 add  sp, 2

;-339     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

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

;-340   


;-341   mod1=typeName(); ireg2=checkreg();

.expr2139:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-342   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je .expr2144
 push expr2_11
 call prs
 add  sp, 2

;-343     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}

 mov ax, [ireg1]
 or  al, al
 je .expr2145
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp .expr2146
.expr2145:
 push word [idx1]
 call v
 add  sp, 2
.expr2146:
 push expr2_12
 call prs
 add  sp, 2
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .retnexpr2

;-344   else {

 jmp .expr2147
.expr2144:

;-345     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne .expr2148
 push expr2_13
 call error1
 add  sp, 2

;-346     


;-347     idx2=searchname();

.expr2148:
 call searchname
 mov word [idx2], ax

;-348     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-349     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne .expr2149
 push expr2_14
 call error1
 add  sp, 2

;-350     prs("\nmov ");

.expr2149:
 push expr2_15
 call prs
 add  sp, 2

;-351     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");

 mov ax, [ireg1]
 or  al, al
 je .expr2150
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp .expr2151
.expr2150:
 push expr2_16
 call error1
 add  sp, 2

;-352     prs(", ");

.expr2151:
 push expr2_17
 call prs
 add  sp, 2

;-353     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne .expr2152
 push word [idx2]
 call a
 add  sp, 2

;-354     else {

 jmp .expr2153
.expr2152:

;-355       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne .expr2154
 push expr2_18
 call prs
 add  sp, 2

;-356       if (idw2 == 2) prs("word ");

.expr2154:
 mov ax, [idw2]
 cmp ax, 2
 jne .expr2155
 push expr2_19
 call prs
 add  sp, 2

;-357       if (idw2 == 4) prs("dword ");

.expr2155:
 mov ax, [idw2]
 cmp ax, 4
 jne .expr2156
 push expr2_20
 call prs
 add  sp, 2

;-358       v(idx2);

.expr2156:
 push word [idx2]
 call v
 add  sp, 2

;-359       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

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

;-360     return;

.expr2153:
 jmp .retnexpr2

;-361   } error1("Internal error: only const or reg allowed");

.expr2147:
 push expr2_22
 call error1
 add  sp, 2

;-362 }


;-363 char ops[5];

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
absolute -12130
ops resb 5
section .text

;-364 int doreg1(int iscmp1) { int i;


doreg1:  ; *** PROC ***

;-365   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   364 NULL iscmp1 = bp+4
;  201 var sign word   364 NULL i = bp-2;
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

;-366   if (istoken(T_PLUSASS))    strcpy(ops, "add");

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

;-367   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

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

;-368   if (istoken(T_ANDASS))     strcpy(ops, "and");

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

;-369   if (istoken(T_ORASS))      strcpy(ops, "or" );

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

;-370   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

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

;-371   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

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

;-372   if (iscmp1 == 1) { token=getlex();

.doreg1164:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1165
 call getlex
 mov word [token], ax

;-373       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1166
 push doreg1_7
 call error1
 add  sp, 2

;-374       strcpy(ops, "cmp"); }

.doreg1166:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-375   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

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

;-376 


;-377   if (istoken(T_CONST)) {pint1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1167
 push word [lexval]
 call pint1
 add  sp, 2
 jmp .reg1

;-378   mod2=typeName(); ireg2=checkreg();

.doreg1167:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-379   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1168
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-380   i=searchname();  if (mod2 == 2) a(i); else v(i);

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

;-381   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

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

;-382 }

.doreg1171:

;-383 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

;-384   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg172
 mov ax, 0
 jmp .retncheckreg

;-385   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

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

;-386   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

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

;-387   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

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

;-388   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

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

;-389   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

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

;-390   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

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

;-391   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

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

;-392   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

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

;-393   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

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

;-394   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

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

;-395   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

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

;-396   // (eqstr(symbol,"ip")) return 45;


;-397   if (strlen(symbol) >   3) return 0;

.checkreg194:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg195
 mov ax, 0
 jmp .retncheckreg

;-398   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

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

;-399   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

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

;-400   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

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

;-401   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

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

;-402   if (eqstr(symbol,"cr0")) return 71;

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

;-403   return 0;   }

.checkreg204:
 mov ax, 0
 jmp .retncheckreg

;-404 char printregstr[]

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

;-405 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-406 //          1         2         3         4         5         6         7


;-407 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-408 int printreg(int i) {  unsigned int k; unsigned char c;


printreg:  ; *** PROC ***

;-409   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   408 NULL i = bp+4
;  201 var unsg word   408 NULL k = bp-2
;  202 var unsg byte   408 NULL c = bp-4;
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

;-410   k = &printregstr + i; c=*k; prc(c);

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

;-411   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

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

;-412 }

.printreg205:

;-413 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
; ENDP
evalue dw 0
exprtype dw 10

;-414 int expr(int isRight)


expr:  ; *** PROC ***

;-415 { int mode; int id1;     int ixarr; int ixconst;


;-416   int ids;  int isCONST; int i;     unsigned char *p;


;-417   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   414 NULL isRight = bp+4
;  201 var sign word   415 NULL mode = bp-2
;  202 var sign word   415 NULL id1 = bp-4
;  203 var sign word   415 NULL ixarr = bp-6
;  204 var sign word   415 NULL ixconst = bp-8
;  205 var sign word   416 NULL ids = bp-10
;  206 var sign word   416 NULL isCONST = bp-12
;  207 var sign word   416 NULL i = bp-14
;  208 ptr unsg byte   416 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr206
 mov ax, [lexval]
 mov word [evalue], ax

;-418     prs("\n mov ax, "); pint1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call pint1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-419   mode=typeName(); /*0=V,1=*,2=&*/

.expr206:
 call typeName
 mov [bp-2], ax

;-420   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-421   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr207
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-422   if (token=='(')  {docall1(); goto e1; }

.expr207:
 mov ax, [token]
 cmp ax, 40
 jne .expr208
 call docall1
 jmp .e1

;-423   if (isreg()) goto e1;

.expr208:
 call isreg
 or  al, al
 je .expr209
 jmp .e1

;-424 


;-425   id1=searchname(); gettypes(id1); ids=signi;

.expr209:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-426   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-427     if (istoken('[')) { if (istoken(T_CONST)) {

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

;-428       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-429     else {ixarr=searchname(); expect(T_NAME); expect(']');

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

;-430     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-431     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr213
 push expr_1
 call error1
 add  sp, 2
.expr213:
.expr212:

;-432   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

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

;-433      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

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

;-434      v(id1); goto e1;}

.expr217:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-435   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

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

;-436      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

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

;-437      v(id1); goto e1;}

.expr221:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-438        


;-439   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

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

;-440   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

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

;-441   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

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

;-442   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    

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

;-443   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr225:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr226
 push expr_14
 call error1
 add  sp, 2

;-444   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr226:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr227
 push expr_15
 call error1
 add  sp, 2

;-445 


;-446   if (istoken('=')) { exprtype= expr(1); 

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

;-447   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-448   dovar1(mode, "mov", ixarr, id1);

.expr228:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-449   


;-450 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr229
 push expr_17
 call rterm
 add  sp, 2

;-451   else if (istoken('-')) rterm("sub" );

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

;-452   else if (istoken('&')) rterm("and" );

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

;-453   else if (istoken('|')) rterm("or" );  

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

;-454   else if (istoken(T_LESSLESS)) rterm("shl");

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

;-455   else if (istoken(T_GREATGREAT)) rterm("shr");  

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

;-456   else if (istoken('*')) domul (ids);

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

;-457   else if (istoken('/')) doidiv(ids);

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

;-458   else if (istoken('%')) domod (ids);

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

;-459   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

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

;-460   return 0;

.expr246:
 mov ax, 0
 jmp .retnexpr

;-461 }


;-462 


;-463 int compoundass(char *op, int mode, int id1) {

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

;-464   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   463 NULL op = bp+4
;  201 var sign word   463 NULL mode = bp+6
;  202 var sign word   463 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass247
 push compoundass_0
 call error1
 add  sp, 2

;-465   prnl(); prs(op); prs("  "); 

.compoundass247:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-466   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

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

;-467   v(id1); prs(", ");

.compoundass249:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-468   expect(T_CONST); pint1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call pint1
 add  sp, 2

;-469 }


;-470 int dovar1(int mode, int op, int ixarr, int id1) { 
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
; ENDP

dovar1:  ; *** PROC ***

;-471   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   470 NULL mode = bp+4
;  201 var sign word   470 NULL op = bp+6
;  202 var sign word   470 NULL ixarr = bp+8
;  203 var sign word   470 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-472   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

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

;-473     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1251
 push dovar1_1
 call prs
 add  sp, 2

;-474     if(widthi == 2) prs(" ax, [bx]");

.dovar1251:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1252
 push dovar1_2
 call prs
 add  sp, 2

;-475     return; }

.dovar1252:
 jmp .retndovar1

;-476   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

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

;-477   if (ixarr) {

.dovar1253:
 mov ax, [bp+8]
 or  al, al
 je .dovar1254

;-478     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-479     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_5
 call prs
 add  sp, 2

;-480     prs("\n "); prs(op);

.dovar1255:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-481     if (wi==2) prs(" ax, "); else prs(" al, ");

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

;-482 // v(id1); prs(" [bx]");


;-483     prc('['); printName(id1); prs(" + bx]"); 

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

;-484     return; }

 jmp .retndovar1

;-485   prnl();prs(op);

.dovar1254:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-486   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1258
 push dovar1_10
 call prs
 add  sp, 2

;-487   if(wi==2) prs(" ax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1259
 push dovar1_11
 call prs
 add  sp, 2

;-488   if(wi==4) prs(" eax, ");

.dovar1259:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1260
 push dovar1_12
 call prs
 add  sp, 2

;-489   v(id1);

.dovar1260:
 push word [bp+10]
 call v
 add  sp, 2

;-490 }


;-491 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-492   if (istoken(T_CONST)) { prnl(); prs(op); 

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   491 NULL op = bp+4
;  201 var sign word   491 NULL mode = bp-2
;  202 var sign word   491 NULL opint = bp-4
;  203 var sign word   491 NULL ixarr = bp-6
;  204 var sign word   491 NULL id1 = bp-8;
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

;-493     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm262
 push rterm_0
 call prs
 add  sp, 2

;-494     if (wi==2) prs(" ax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm263
 push rterm_1
 call prs
 add  sp, 2

;-495     if (wi==4) prs(" eax, ");

.rterm263:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm264
 push rterm_2
 call prs
 add  sp, 2

;-496     pint1(lexval); return;}

.rterm264:
 push word [lexval]
 call pint1
 add  sp, 2
 jmp .retnrterm

;-497   mode=typeName(); id1=searchname(); ixarr=0;

.rterm261:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-498   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  

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

;-499     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-500     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm266
 push rterm_3
 call error1
 add  sp, 2
.rterm266:

;-501   if (eqstr(symbol,"_AX")) return;

.rterm265:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm267
 jmp .retnrterm

;-502   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm267:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-503 }


;-504 int isreg() {

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
; ENDP

isreg:  ; *** PROC ***

;-505   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

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

;-506   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  

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

;-507   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

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

;-508   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

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

;-509   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

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

;-510   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    

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

;-511   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

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

;-512   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

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

;-513   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    

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

;-514   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

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

;-515   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

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

;-516   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  

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

;-517   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

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

;-518   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

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

;-519   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  

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

;-520   return 0;   r1: return 1; 

.isreg282:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-521 }


;-522 int doreg(char *dr) { int i; expect('=');

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
;  200 ptr sign byte   522 NULL dr = bp+4
;  201 var sign word   522 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-523   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-524        if (istoken(T_CONST)) pint1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg283
 push word [lexval]
 call pint1
 add  sp, 2

;-525   else if (istoken(T_NAME )) { i=searchname(); v(i); }

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

;-526   else error1("only number or var allowed"); }

 jmp .doreg286
.doreg285:
 push doreg_2
 call error1
 add  sp, 2
.doreg286:
.doreg284:

;-527 


;-528 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
; ENDP

doassign:  ; *** PROC ***

;-529   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   528 NULL mode = bp+4
;  201 var sign word   528 NULL i = bp+6
;  202 var sign word   528 NULL ixarr = bp+8
;  203 var sign word   528 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-530   if (mode==1) {prs("\n mov  bx, ");v(i);                  

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign287
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-531     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign288
 push doassign_1
 call prs
 add  sp, 2

;-532     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign289
.doassign288:
 push doassign_2
 call prs
 add  sp, 2
.doassign289:
 jmp .retndoassign

;-533   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

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

;-534   if (ixarr) {  prs("\n mov bx, ");

.doassign290:
 mov ax, [bp+8]
 or  al, al
 je .doassign291
 push doassign_5
 call prs
 add  sp, 2

;-535     if(ixconst) pint1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign292
 push word [bp+8]
 call pint1
 add  sp, 2
 jmp .doassign293
.doassign292:
 push word [bp+8]
 call v
 add  sp, 2

;-536     if (wi==2) prs("\n shl bx, 1");

.doassign293:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign294
 push doassign_6
 call prs
 add  sp, 2

;-537     prs("\n mov ["); printName(i);

.doassign294:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-538     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

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

;-539   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

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

;-540     } v(i); prs(", al"); return; }

.doassign298:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-541   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

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

;-542     } v(i); prs(", ax"); return; }

.doassign300:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-543   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

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

;-544     } v(i); prs(", eax"); return; }

.doassign302:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-545 }

.doassign301:

;-546 int domul(int ids) {

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

;-547   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   546 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul303
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul304
.domul303:

;-548   if (istoken(T_CONST)) {prs("\n mov bx, "); pint1(lexval); prs("\n mul bx"); }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul305
 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call pint1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-549   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul306
.domul305:
 push domul_3
 call error1
 add  sp, 2
.domul306:
.domul304:

;-550 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
; ENDP

doidiv:  ; *** PROC ***

;-551   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   550 NULL ids = bp+4
;  201 var sign word   550 NULL mode = bp-2
;  202 var sign word   550 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv307

;-552     prs("\n mov bx, "); pint1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call pint1
 add  sp, 2

;-553     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

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

;-554   else {

 jmp .doidiv310
.doidiv307:

;-555     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-556     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv311
 push doidiv_3
 call error1
 add  sp, 2

;-557     gettypes(id1);

.doidiv311:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-558     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv312
 push doidiv_4
 call error1
 add  sp, 2

;-559     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv312:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv313
 push doidiv_5
 call error1
 add  sp, 2

;-560     prs("\n mov bx, "); v(id1);

.doidiv313:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-561     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

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

;-562 }

.doidiv310:

;-563 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
;  200 var sign word   563 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-564 


;-565 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
; ENDP
section .bss
absolute -12125
docalltype resw 10
section .text
section .bss
absolute -12105
docallvalue resw 10
section .text

;-566 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute -12085
procname resb 17
section .text

;-567 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1:  ; *** PROC ***

;-568   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   567 NULL i = bp-2
;  201 var sign word   567 NULL narg = bp-4
;  202 var sign word   567 NULL t0 = bp-6
;  203 var sign word   567 NULL n0 = bp-8
;  204 var sign word   567 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-569   checknamelen();

 call checknamelen

;-570   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-571   storecall();

 call storecall

;-572   expect('(');

 push 40
 call expect
 add  sp, 2

;-573 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1316

;-574 	  do { narg++;

.docall1317:
 inc  word[bp-4]

;-575 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1318
 push docall1_0
 call error1
 add  sp, 2
.docall1318:
 mov ax, 0
 mov [bp-6], ax

;-576       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1319
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-577       if(istoken(T_STRING)){t0=2; n0=nconst;

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

;-578         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-579         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-580       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

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

;-581       if(istoken(T_NAME))  { n0=checkreg();

.docall1321:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1322
 call checkreg
 mov [bp-8], ax

;-582         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1323
 mov ax, 5
 mov [bp-6], ax

;-583         else {t0=4; n0=searchname();

 jmp .docall1324
.docall1323:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-584           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

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

;-585       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1322:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1326
 push docall1_4
 call error1
 add  sp, 2

;-586       docalltype [narg] = t0;

.docall1326:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-587       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-588     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1327
 jmp .docall1317
.docall1327:

;-589     


;-590   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-591     do {

.docall1328:

;-592       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-593       n0 = docallvalue[i];     

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-594       if(t0==1){ prs("\n push "); pint1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1329
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-595       if(t0==2){ prs("\n push "); 

.docall1329:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1330
 push docall1_6
 call prs
 add  sp, 2

;-596         prs(fname);prc(95);pint1(n0);}

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

;-597       if(t0==3){ prs("\n lea  ax, ");   v(n0);

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

;-598         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-599       if(t0==4){ gettypes(n0); 

.docall1331:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1332
 push word [bp-8]
 call gettypes
 add  sp, 2

;-600         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1333
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-601         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1334
.docall1333:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-602         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1334:

;-603       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

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

;-604    i--; } while (i > 0);  }

.docall1335:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1337
 jmp .docall1328
.docall1337:

;-605 	 prs("\n call "); prs(&procname);

.docall1316:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-606 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1338
 push docall1_14
 call prs
 add  sp, 2

;-607      narg=narg+narg; narg=narg+sz32; pint1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2
.docall1338:

;-608 /****************************************************************************/


;-609 int main() {
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

;-610   getarg();

 call getarg

;-611   setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-612   if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main339
 push main_0
 call error1
 add  sp, 2

;-613   segE=allocmem(4096);

.main339:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-614   if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main340
 push main_1
 call error1
 add  sp, 2

;-615   CNameTop=0;

.main340:
 mov ax, 0
 mov word [CNameTop], ax

;-616   getfirstchar();

 call getfirstchar

;-617   parse();

 call parse

;-618   checkcalls(); epilog();

 call checkcalls
 call epilog

;-619 }


;-620 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }

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

;-621 char *arglen=0x80; char *argv=0x82;

 ret
; ENDP
arglen dw 128
argv dw 130

;-622 int getarg() { int arglen1; int i; char *c;


getarg:  ; *** PROC ***

;-623   arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   622 NULL arglen1 = bp-2
;  201 var sign word   622 NULL i = bp-4
;  202 ptr sign byte   622 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-624   if (arglen1) { i=arglen1+129; *i=0; }

 mov ax, [bp-2]
 or  al, al
 je .getarg341
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-625   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");

 jmp .getarg342
.getarg341:
 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
 push getarg_0
 call cputs
 add  sp, 2

;-626     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }

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

;-627   strcpy(namein, argv);

.getarg342:
 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-628   if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarg343
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-629   toupper(namein);

.getarg343:
 lea  ax, [namein]
 push ax
 call toupper
 add  sp, 2

;-630   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';

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

;-631  


;-632   fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-633   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg344
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

;-634   fdout=creatR(namelst);

.getarg344:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-635   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg345
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

;-636   prs("\n; ");prs(Version1);

.getarg345:
 push getarg_4
 call prs
 add  sp, 2
 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-637   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);

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

;-638   prs("\norg  256 \njmp main"); 

 push getarg_7
 call prs
 add  sp, 2

;-639 }


;-640 int parse() { token=getlex(); do {
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
.parse346:

;-641     if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse347
 mov ax, 1
 jmp .retnparse

;-642     if (istoken('#')) {

.parse347:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse348

;-643       if (istoken(T_DEFINE)) dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse349
 call dodefine

;-644       else if (istoken(T_INCLUDE)) doinclude();

 jmp .parse350
.parse349:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je .parse351
 call doinclude

;-645       else error1("define or include expected");  }

 jmp .parse352
.parse351:
 push parse_0
 call error1
 add  sp, 2
.parse352:
.parse350:

;-646     else{ typeName();  if (token=='(') dofunc();  else doglob(); }

 jmp .parse353
.parse348:
 call typeName
 mov ax, [token]
 cmp ax, 40
 jne .parse354
 call dofunc
 jmp .parse355
.parse354:
 call doglob
.parse355:

;-647   } while(1);

.parse353:
 mov ax, 1
 or  al, al
 je .parse356
 jmp .parse346
.parse356:

;-648 }


;-649 int checkcalls() { int i; int j; int k;

 .retnparse:
 ret
parse_0 db "define or include expected",0
; ENDP

checkcalls:  ; *** PROC ***

;-650   prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   649 NULL i = bp-2
;  201 var sign word   649 NULL j = bp-4
;  202 var sign word   649 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-651   i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-652   while (i < CTop) {

.checkcalls357:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .checkcalls358

;-653     pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-654     from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-655     j=0;

 mov ax, 0
 mov [bp-4], ax

;-656     do { p1=adrF(FNameField, j);

.checkcalls359:
 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-657       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkcalls360
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 mov ax, [FTop]
 mov [bp-4], ax

;-658       j++; } while (j < FTop);

.checkcalls360:
 inc  word[bp-4]
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .checkcalls361
 jmp .checkcalls359
.checkcalls361:

;-659     if (j == FTop) { k++; prs("\n; "); prs(NameA); }

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne .checkcalls362
 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-660     i++; }

.checkcalls362:
 inc  word[bp-2]

;-661   prs("\n; Number of unresolved CALLs :"); printint51(k);

 jmp .checkcalls357
.checkcalls358:
 push checkcalls_2
 call prs
 add  sp, 2
 push word [bp-6]
 call printint51
 add  sp, 2

;-662   if (k!=0) error1("At least 1 function is missing! "); 

 mov ax, [bp-6]
 cmp ax, 0
 je  .checkcalls363
 push checkcalls_3
 call error1
 add  sp, 2

;-663     else prs(" All FUNCTIONs in place");

 jmp .checkcalls364
.checkcalls363:
 push checkcalls_4
 call prs
 add  sp, 2

;-664 }

.checkcalls364:

;-665 


;-666 int doinclude() { int fdtemp;
 LEAVE
 ret
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db "\n; Number of unresolved CALLs :",0
checkcalls_3 db "At least 1 function is missing! ",0
checkcalls_4 db " All FUNCTIONs in place",0
; ENDP

doinclude:  ; *** PROC ***

;-667   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   666 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne .doinclude365
 mov ax, [fdin]
 mov [bp-2], ax

;-668   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-669   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-670   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

 mov ax, [DOS_ERR]
 cmp ax, 0
 je  .doinclude366
 push doinclude_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-671     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-672   linenoinclude=lineno; lineno=1;

.doinclude366:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-673   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-674   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-675   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-676 }

.doinclude365:

;-677 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0
; ENDP

dodefine:  ; *** PROC ***

;-678   if (eqstr(symbol, "ORGDATA")) {token=getlex();

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   677 NULL i = bp-2
;  201 var sign word   677 NULL j = bp-4
;  202 var sign word   677 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine367
 call getlex
 mov word [token], ax

;-679     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp .retndodefine

;-680   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

.dodefine367:
 push dodefine_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine368
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 258
 jne .dodefine369

;-681     prs("\n;Use archive file: ");

 push dodefine_2
 call prs
 add  sp, 2

;-682     strcpy(archivename, symbol); prs(archivename);

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

;-683     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp .dodefine370
.dodefine369:
 push dodefine_3
 call error1
 add  sp, 2
.dodefine370:
 call getlex
 mov word [token], ax
 jmp .retndodefine

;-684    expect(T_NAME);

.dodefine368:
 push 256
 call expect
 add  sp, 2

;-685   if (token==T_CONST) { 

 mov ax, [token]
 cmp ax, 257
 jne .dodefine371

;-686     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine372
 push dodefine_4
 call error1
 add  sp, 2

;-687     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

.dodefine372:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine373
 push dodefine_5
 call error1
 add  sp, 2

;-688     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

.dodefine373:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-689     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-690     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

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

;-691     expect(T_CONST); GTop++;  } 

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-692 }

.dodefine371:

;-693 int stmt() { int c; char cha;

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

;-694        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   693 NULL c = bp-2
;  201 var sign byte   693 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt374
.stmt375:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt376
 call stmt
 jmp .stmt375
.stmt376:

;-695   else if(istoken(T_IF))    doif();

 jmp .stmt377
.stmt374:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt378
 call doif

;-696   else if(istoken(T_DO))    dodo();

 jmp .stmt379
.stmt378:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt380
 call dodo

;-697   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt381
.stmt380:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt382
 call dowhile

;-698   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}

 jmp .stmt383
.stmt382:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt384
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

;-699   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt385
.stmt384:
 mov ax, [token]
 cmp ax, 518
 jne .stmt386
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-700         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt387:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt388
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt387
.stmt388:
 call getlex
 mov word [token], ax

;-701   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  

 jmp .stmt389
.stmt386:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt390
 mov ax, [token]
 cmp ax, 123
 jne .stmt391
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-702         while(cha!= '}') { prc(cha); cha=next(); }

.stmt392:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt393
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-703         token=getlex(); }

 jmp .stmt392
.stmt393:
 call getlex
 mov word [token], ax

;-704         else error1("Curly open expected"); 

 jmp .stmt394
.stmt391:
 push stmt_3
 call error1
 add  sp, 2

;-705         }

.stmt394:

;-706   else if(istoken(T_EMIT))   doemit();

 jmp .stmt395
.stmt390:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt396
 call doemit

;-707   else if(istoken(';'))      { }

 jmp .stmt397
.stmt396:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt398

;-708   else if(istoken(T_RETURN)) {

 jmp .stmt399
.stmt398:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt400

;-709         if (token!=';') exprstart();

 mov ax, [token]
 cmp ax, 59
 je  .stmt401
 call exprstart

;-710         prs("\n jmp .retn"); 

.stmt401:
 push stmt_4
 call prs
 add  sp, 2

;-711         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-712         nreturn++; 

 inc  word[nreturn]

;-713         expect(';');

 push 59
 call expect
 add  sp, 2

;-714         }


;-715   else if(thechar==':')      {

 jmp .stmt402
.stmt400:
 mov al, [thechar]
 cmp al, 58
 jne .stmt403

;-716         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-717         prs(symbol); prc(':');  

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-718         expect(T_NAME); 

 push 256
 call expect
 add  sp, 2

;-719         expect(':'); 

 push 58
 call expect
 add  sp, 2

;-720         }


;-721   else  {exprstart(); expect(';'); } 

 jmp .stmt404
.stmt403:
 call exprstart
 push 59
 call expect
 add  sp, 2

;-722 }

.stmt404:
.stmt402:
.stmt399:
.stmt397:
.stmt395:
.stmt389:
.stmt385:
.stmt383:
.stmt381:
.stmt379:
.stmt377:

;-723 


;-724 int doemit() {prs("\n db ");
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

;-725   L1: token=getlex(); pint1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call pint1
 add  sp, 2
 call getlex
 mov word [token], ax

;-726     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit405
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit405:
 push 41
 call expect
 add  sp, 2

;-727 


;-728 int cmpneg(int ids) {

 ret
doemit_0 db "\n db ",0
; ENDP

cmpneg:  ; *** PROC ***

;-729        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   728 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg406
 push cmpneg_0
 call prs
 add  sp, 2

;-730   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg407
.cmpneg406:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg408
 push cmpneg_1
 call prs
 add  sp, 2

;-731   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg409
.cmpneg408:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg410
 mov ax, [bp+4]
 or  al, al
 je .cmpneg411
 push cmpneg_2
 call prs
 add  sp, 2

;-732                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg412
.cmpneg411:
 push cmpneg_3
 call prs
 add  sp, 2

;-733   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); pint1(ids);

.cmpneg412:
 jmp .cmpneg413
.cmpneg410:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg414
 mov ax, [bp+4]
 or  al, al
 je .cmpneg415
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2

;-734                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-735                            else{prs(" ;unsigned : "); pint1(ids);

 jmp .cmpneg416
.cmpneg415:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2

;-736                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-737   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg416:
 jmp .cmpneg417
.cmpneg414:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg418
 push cmpneg_8
 call prs
 add  sp, 2

;-738   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg419
.cmpneg418:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg420
 push cmpneg_9
 call prs
 add  sp, 2

;-739   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg421
.cmpneg420:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg421:
.cmpneg419:
.cmpneg417:
.cmpneg413:
.cmpneg409:
.cmpneg407:

;-740 


;-741 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
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
;  200 var sign word   741 NULL n = bp+4;
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

;-742 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
; ENDP

prjump:  ; *** PROC ***
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   742 NULL n = bp+4;
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

;-743 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
; ENDP

doif:  ; *** PROC ***
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   743 NULL jdest = bp-2
;  201 var sign word   743 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-744   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-745   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif422
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-746     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-747   else prlabel(jdest); }

 jmp .doif423
.doif422:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif423:

;-748 


;-749 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
; ENDP

dodo:  ; *** PROC ***

;-750   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   749 NULL jdest = bp-2
;  201 var sign word   749 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-751   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-752   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-753 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

dowhile:  ; *** PROC ***
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   753 NULL jdest = bp-2
;  201 var sign word   753 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-754   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-755   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-756 int isrelational() {
 LEAVE
 ret
; ENDP

isrelational:  ; *** PROC ***

;-757   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational424
 jmp .w
.isrelational424:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational425
 jmp .w

;-758   if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational425:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational426
 jmp .w
.isrelational426:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational427
 jmp .w

;-759   if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational427:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational428
 jmp .w
.isrelational428:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational429
 jmp .w

;-760   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational429:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-761  


;-762 char symboltemp[80];    

 .retnisrelational:
 ret
; ENDP
section .bss
absolute -12068
symboltemp resb 80
section .text

;-763 int getlex() { char c; char *p; 


getlex:  ; *** PROC ***

;-764 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   763 NULL c = bp-2
;  201 ptr sign byte   763 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex430
 mov ax, 0
 jmp .retngetlex
.getlex430:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex431
 jmp .g1

;-765   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex431:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex432
 mov al, [thechar]
 cmp al, 61
 jne .getlex433
 call next
 mov ax, 806
 jmp .retngetlex
.getlex433:

;-766   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex432:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex434
 mov al, [thechar]
 cmp al, 61
 jne .getlex435
 call next
 mov ax, 807
 jmp .retngetlex
.getlex435:

;-767   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex434:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex436
 mov al, [thechar]
 cmp al, 61
 jne .getlex437
 call next
 mov ax, 824
 jmp .retngetlex
.getlex437:

;-768   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex436:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex438
 mov al, [thechar]
 cmp al, 61
 jne .getlex439
 call next
 mov ax, 811
 jmp .retngetlex
.getlex439:

;-769   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex438:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex440
 mov al, [thechar]
 cmp al, 60
 jne .getlex441
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex441:

;-770   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex440:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex442
 mov al, [thechar]
 cmp al, 62
 jne .getlex443
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex443:

;-771   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex442:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex444
 mov al, [thechar]
 cmp al, 43
 jne .getlex445
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex445:

;-772   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex444:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex446
 mov al, [thechar]
 cmp al, 45
 jne .getlex447
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex447:

;-773   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex446:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex448
 mov al, [thechar]
 cmp al, 61
 jne .getlex449
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex449:

;-774   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex448:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex450
 mov al, [thechar]
 cmp al, 61
 jne .getlex451
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex451:

;-775   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex450:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex452
 mov al, [thechar]
 cmp al, 61
 jne .getlex453
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex453:

;-776   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    

.getlex452:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex454
 mov al, [thechar]
 cmp al, 61
 jne .getlex455
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex455:

;-777   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex454:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex456
 mov al, [thechar]
 cmp al, 61
 jne .getlex457
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex457:

;-778   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        

.getlex456:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex458
 mov al, [thechar]
 cmp al, 61
 jne .getlex459
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex459:

;-779   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex458:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex460
 mov al, [bp-2]
 jmp .retngetlex

;-780   if (c == '/') { if (thechar == '/') {

.getlex460:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex461
 mov al, [thechar]
 cmp al, 47
 jne .getlex462

;-781       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }

.getlex463:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 13
 je  .getlex464
 jmp .getlex463
.getlex464:
 call getlex
 jmp .retngetlex
.getlex462:

;-782   if (c == '/') { if (thechar == '*') {

.getlex461:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex465
 mov al, [thechar]
 cmp al, 42
 jne .getlex466

;-783       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex467
 jmp .g2
.getlex467:
 mov al, [thechar]
 cmp al, 47
 je  .getlex468
 jmp .g2

;-784       c=next(); return getlex(); } else  return '/'; }

.getlex468:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex469
.getlex466:
 mov ax, 47
 jmp .retngetlex
.getlex469:

;-785   if (c == '"') {getstring(c); return T_STRING;}

.getlex465:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex470
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-786   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex470:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex471
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-787   if (c==39) { lexval=next();

.getlex471:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex472
 call next
 mov word [lexval], ax

;-788     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex473
 call next
 mov word [lexval], ax

;-789       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex474
 mov ax, 10
 mov word [lexval], ax
.getlex474:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex475
 mov ax, 9
 mov word [lexval], ax

;-790       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex475:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex476
 mov ax, 0
 mov word [lexval], ax
.getlex476:
.getlex473:
 call next
 mov ax, 257
 jmp .retngetlex

;-791   if (alnum(c)) { 

.getlex472:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex477

;-792     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-793     while(alnum(thechar)) {c=next(); *p=c;  p++; } 

.getlex478:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex479
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-794       *p=0;

 jmp .getlex478
.getlex479:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-795     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex480
 mov ax, 531
 jmp .retngetlex

;-796     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex480:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex481
 mov ax, 532
 jmp .retngetlex

;-797     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex481:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex482
 mov ax, 529
 jmp .retngetlex

;-798     if (eqstr(symbol,"int"     )) return T_INT;

.getlex482:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex483
 mov ax, 517
 jmp .retngetlex

;-799     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex483:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex484
 mov ax, 533
 jmp .retngetlex

;-800     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex484:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex485
 mov ax, 530
 jmp .retngetlex

;-801     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex485:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex486
 mov ax, 518
 jmp .retngetlex

;-802     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex486:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex487
 mov ax, 519
 jmp .retngetlex

;-803     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex487:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex488
 mov ax, 520
 jmp .retngetlex

;-804     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex488:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex489
 mov ax, 512
 jmp .retngetlex

;-805     if (eqstr(symbol,"if"      )) return T_IF;

.getlex489:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex490
 mov ax, 513
 jmp .retngetlex

;-806     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex490:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex491
 mov ax, 514
 jmp .retngetlex

;-807     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex491:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex492
 mov ax, 515
 jmp .retngetlex

;-808     if (eqstr(symbol,"do"      )) return T_DO;

.getlex492:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex493
 mov ax, 516
 jmp .retngetlex

;-809     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex493:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex494
 mov ax, 521
 jmp .retngetlex

;-810     if (eqstr(symbol,"define"  )) return T_DEFINE;   

.getlex494:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex495
 mov ax, 511
 jmp .retngetlex

;-811     if (eqstr(symbol,"include" )) return T_INCLUDE;   

.getlex495:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex496
 mov ax, 510
 jmp .retngetlex

;-812     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex496:
 call convertdefine
 or  al, al
 je .getlex497
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-813     return T_NAME; } error1("Input item not recognized"); }

.getlex497:
 mov ax, 256
 jmp .retngetlex
.getlex477:
 push getlex_18
 call error1
 add  sp, 2

;-814 


;-815 int convertdefine() { int i; int j;   i=0;

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
;  200 var sign word   815 NULL i = bp-2
;  201 var sign word   815 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-816   while (i < GTop) {

.convertdefine498:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine499

;-817    j=adrofname(i); 

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-818    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine500
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine501
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-819    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine501:

;-820    i++; } 

.convertdefine500:
 inc  word[bp-2]

;-821    return 0; }

 jmp .convertdefine498
.convertdefine499:
 mov ax, 0
 jmp .retnconvertdefine

;-822 int getdigit(char c) { int i;

 .retnconvertdefine: LEAVE
 ret
; ENDP

getdigit:  ; *** PROC ***

;-823     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   822 NULL c = bp+4
;  201 var sign word   822 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-824     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit502
 mov ax, 88
 mov byte [thechar], al
.getdigit502:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit503
 call next

;-825       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit504:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit505
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit506
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-826 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit506:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit507
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit507:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-827      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-828     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 

 jmp .getdigit504
.getdigit505:
 jmp .getdigit508
.getdigit503:
.getdigit509:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit510
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-829      i=0; i=c; lexval=lexval+i; } } 

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit509
.getdigit510:

;-830 }

.getdigit508:

;-831 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
; ENDP

getstring:  ; *** PROC ***
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   831 NULL delim = bp+4
;  201 var sign word   831 NULL c = bp-2
;  202 ptr sign byte   831 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-832   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

.getstring511:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring512
 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]
 call next
 mov [bp-2], ax
 jmp .getstring511
.getstring512:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-833 


;-834 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
 LEAVE
 ret
; ENDP

next:  ; *** PROC ***
;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   834 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
 mov al, [bp-2]
 mov byte [globC], al
 call fgets1
 mov byte [thechar], al
 mov al, [bp-2]
 jmp .retnnext

;-835 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}

 .retnnext: LEAVE
 ret
; ENDP

istoken:  ; *** PROC ***
;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   835 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken513
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnistoken
.istoken513:
 mov ax, 0
 jmp .retnistoken

;-836 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();

 .retnistoken: LEAVE
 ret
; ENDP

expect:  ; *** PROC ***
;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   836 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect514
 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 call listproc

;-837   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

 push expect_0
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push expect_1
 call error1
 add  sp, 2
.expect514:

;-838 


;-839 int eprc(char c)  {*cloc=c; cloc++; }
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
; ENDP

eprc:  ; *** PROC ***
;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   839 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
 inc  word[cloc]

;-840 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
 LEAVE
 ret
; ENDP

eprs:  ; *** PROC ***
;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   840 NULL s = bp+4
;  201 var sign byte   840 NULL c = bp-2;
 ENTER  2,0
.eprs515:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs516
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
 jmp .eprs515
.eprs516:

;-841 int prc(unsigned char c) { 
 LEAVE
 ret
; ENDP

prc:  ; *** PROC ***

;-842   if (c==10) {_AX=13; writetty(); }

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   841 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc517
 mov  ax, 13
 call writetty

;-843   _AL=c; writetty(); 

.prc517:
 mov  al, [bp+4]
 call writetty

;-844   fputcR(c, fdout); 

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-845   }


;-846 int prscomment(unsigned char *s) {unsigned char c;
 LEAVE
 ret
; ENDP

prscomment:  ; *** PROC ***

;-847   while(*s){c=*s;prc(c);s++;} }

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   846 NULL s = bp+4
;  201 var unsg byte   846 NULL c = bp-2;
 ENTER  2,0
.prscomment518:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment519
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
 jmp .prscomment518
.prscomment519:

;-848 int prnl() { prs("\n ");}
 LEAVE
 ret
; ENDP

prnl:  ; *** PROC ***
 push prnl_0
 call prs
 add  sp, 2

;-849 


;-850 int prs(unsigned char *s) {unsigned char c; int com; com=0;

 ret
prnl_0 db "\n ",0
; ENDP

prs:  ; *** PROC ***
;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   850 NULL s = bp+4
;  201 var unsg byte   850 NULL c = bp-2
;  202 var sign word   850 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-851   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;

.prs520:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs521
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 34
 jne .prs522
 mov ax, [bp-4]
 or  al, al
 je .prs523
 mov ax, 0
 mov [bp-4], ax
 jmp .prs524
.prs523:
 mov ax, 1
 mov [bp-4], ax

;-852     if (c==92) { if (com==0) { s++; c=*s;

.prs524:
.prs522:
 mov al, [bp-2]
 cmp al, 92
 jne .prs525
 mov ax, [bp-4]
 cmp ax, 0
 jne .prs526
 inc  word[bp+4]
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-853           if (c=='n') c=10; if (c=='t') c= 9;

 mov al, [bp-2]
 cmp al, 110
 jne .prs527
 mov ax, 10
 mov [bp-2], al
.prs527:
 mov al, [bp-2]
 cmp al, 116
 jne .prs528
 mov ax, 9
 mov [bp-2], al

;-854     } } prc(c); s++;  } }

.prs528:
.prs526:
.prs525:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp .prs520
.prs521:

;-855 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
 LEAVE
 ret
; ENDP

eprnum:  ; *** PROC ***
;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   855 NULL n = bp+4
;  201 var sign word   855 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum529
 push 45
 call eprc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-856   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }

.eprnum529:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum530
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call eprnum
 add  sp, 2
.eprnum530:
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

;-857 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint1:  ; *** PROC ***
;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   857 NULL n = bp+4
;  201 var sign word   857 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint1531
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-858   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n += '0'; prc(n); }

.pint1531:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint1532
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
.pint1532:
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

;-859 int printint51(unsigned int j)  {
 LEAVE
 ret
; ENDP

printint51:  ; *** PROC ***

;-860   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   859 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint51533
 push 32
 call prc
 add  sp, 2
.printint51533:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint51534
 push 32
 call prc
 add  sp, 2
.printint51534:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint51535
 push 32
 call prc
 add  sp, 2

;-861    if (j<10) prc(32);  pint1(j); }

.printint51535:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint51536
 push 32
 call prc
 add  sp, 2
.printint51536:
 push word [bp+4]
 call pint1
 add  sp, 2

;-862 


;-863 int fgets1() { char c; c=*fgetsp;
 LEAVE
 ret
; ENDP

fgets1:  ; *** PROC ***
;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   863 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-864   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1537
 call printinputline
 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1538
 mov ax, 0
 jmp .retnfgets1

;-865     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }

.fgets1538:
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov ax, 0
 mov word [spalte], ax

;-866   fgetsp++; spalte++;  return c; }

.fgets1537:
 inc  word[fgetsp]
 inc  word[spalte]
 mov al, [bp-2]
 jmp .retnfgets1

;-867 int printinputline() { fgetsp=&fgetsdest;

 .retnfgets1: LEAVE
 ret
; ENDP

printinputline:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-868   do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

.printinputline539:
 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-869   if (DOS_NoBytes == 0) return; 

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline540
 jmp .retnprintinputline

;-870     *fgetsp=DOS_ByteRead; fgetsp++;} 

.printinputline540:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
 inc  word[fgetsp]

;-871   while (DOS_ByteRead != 10); *fgetsp=0;

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline541
 jmp .printinputline539
.printinputline541:
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-872     if (fdout) { prs("\n\n;-"); pint1(lineno); prc(' '); lineno++;

 mov ax, [fdout]
 or  al, al
 je .printinputline542
 push printinputline_0
 call prs
 add  sp, 2
 push word [lineno]
 call pint1
 add  sp, 2
 push 32
 call prc
 add  sp, 2
 inc  word[lineno]

;-873       prscomment(&fgetsdest);}

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-874 }

.printinputline542:

;-875 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }

 .retnprintinputline:
 ret
printinputline_0 db "\n\n;-",0
; ENDP

end1:  ; *** PROC ***
;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   875 NULL n = bp+4;
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

;-876 int error1(char *s) { 
 LEAVE
 ret
; ENDP

error1:  ; *** PROC ***

;-877   lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   876 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-878   prnl(); prscomment(&fgetsdest);

 call prnl
 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-879   prs(";Line: "); pint1(lineno);

 push error1_0
 call prs
 add  sp, 2
 push word [lineno]
 call pint1
 add  sp, 2

;-880   prs(" ************** ERROR: "); prs(s);

 push error1_1
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2

;-881   prs("  in column: "); pint1(spalte);

 push error1_2
 call prs
 add  sp, 2
 push word [spalte]
 call pint1
 add  sp, 2

;-882   prs("\nToken: "); pint1(token); prs(", globC: "); prc(globC);

 push error1_3
 call prs
 add  sp, 2
 push word [token]
 call pint1
 add  sp, 2
 push error1_4
 call prs
 add  sp, 2
 mov al, byte [globC]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-883   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);

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

;-884   end1(1); }

 push 1
 call end1
 add  sp, 2

;-885 int listproc() {int i; 
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

;-886   if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   885 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle .listproc543

;-887   prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-888   prs(", Number of local variables: "); i=LTop - LSTART; pint1(i);

 push listproc_1
 call prs
 add  sp, 2
 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2

;-889   prs("\n;   # type sign width addr used name   list of local variables");

 push listproc_2
 call prs
 add  sp, 2

;-890     i=LSTART; 

 mov ax, 200
 mov [bp-2], ax

;-891     while (i < LTop) { listvar(i); i++; } } 

.listproc544:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc545
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]
 jmp .listproc544
.listproc545:

;-892 }

.listproc543:

;-893 int listvar(unsigned int i) {unsigned int j; char c;
 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name   list of local variables",0
; ENDP

listvar:  ; *** PROC ***

;-894   prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   893 NULL i = bp+4
;  201 var unsg word   893 NULL j = bp-2
;  202 var sign byte   893 NULL c = bp-4;
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

;-895   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne .listvar546
 push listvar_1
 call prs
 add  sp, 2
.listvar546:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar547
 push listvar_2
 call prs
 add  sp, 2

;-896                if(c=='&')prs("arr ");   if(c=='#')prs("def ");

.listvar547:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar548
 push listvar_3
 call prs
 add  sp, 2
.listvar548:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar549
 push listvar_4
 call prs
 add  sp, 2

;-897   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

.listvar549:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .listvar550
 push listvar_5
 call prs
 add  sp, 2
.listvar550:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar551
 push listvar_6
 call prs
 add  sp, 2

;-898   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

.listvar551:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne .listvar552
 push listvar_7
 call prs
 add  sp, 2
.listvar552:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar553
 push listvar_8
 call prs
 add  sp, 2

;-899                if(c==  4)prs("dwrd " );

.listvar553:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar554
 push listvar_9
 call prs
 add  sp, 2

;-900   j=GAdr[i]; printint51(j);

.listvar554:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-901   j=GUsed[i]; if (j) printint51(j);

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je .listvar555
 push word [bp-2]
 call printint51
 add  sp, 2

;-902   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}

 jmp .listvar556
.listvar555:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar557
 push listvar_10
 call prs
 add  sp, 2
 jmp .listvar558
.listvar557:
 push listvar_11
 call prs
 add  sp, 2
.listvar558:

;-903   prc(32);  pt=adrofname(i); prs(pt);

.listvar556:
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

;-904   if(GType[i]=='#') { prc('='); j=GData[i]; pint1(j); }

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar559
 push 61
 call prc
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2

;-905   if(GType[i]=='&') { prc('['); j=GData[i]; pint1(j); prc(']');}

.listvar559:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar560
 push 91
 call prc
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-906   if (i >= LSTART) { prs(" = bp"); j=GData[i];

.listvar560:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  .listvar561
 push listvar_12
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-907     if (j > 0) prc('+'); pint1(j);  }

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar562
 push 43
 call prc
 add  sp, 2
.listvar562:
 push word [bp-2]
 call pint1
 add  sp, 2

;-908 }

.listvar561:

;-909 int listcall() { int i;
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

;-910   prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   909 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-911   i=0;  while (i< CTop) { calllisting(i); i++; } }

 mov ax, 0
 mov [bp-2], ax
.listcall563:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .listcall564
 push word [bp-2]
 call calllisting
 add  sp, 2
 inc  word[bp-2]
 jmp .listcall563
.listcall564:

;-912 int calllisting(int i) {char c; int j;
 LEAVE
 ret
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0
; ENDP

calllisting:  ; *** PROC ***

;-913   prs("\n;"); printint51(i); prc(32);

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   912 NULL i = bp+4
;  201 var sign byte   912 NULL c = bp-2
;  202 var sign word   912 NULL j = bp-4;
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

;-914   c=CType [i]; if(c==0)prs("unresolved ");

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .calllisting565
 push calllisting_1
 call prs
 add  sp, 2

;-915   j=CAdr[i];            printint51(j); prc(32);

.calllisting565:
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

;-916   from_far(NameA, j);   prs(NameA);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-917 }


;-918 int countcalls(int f) { unsigned int i;
 LEAVE
 ret
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0
; ENDP

countcalls:  ; *** PROC ***

;-919   pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   918 NULL f = bp+4
;  201 var unsg word   918 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-920   i=0;  while (i < CTop) {

 mov ax, 0
 mov [bp-2], ax
.countcalls566:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .countcalls567

;-921     p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-922     from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-923     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je .countcalls568
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-924     i++; }

.countcalls568:
 inc  word[bp-2]

;-925 }

 jmp .countcalls566
.countcalls567:

;-926 int listfunc() { int i;
 LEAVE
 ret
; ENDP

listfunc:  ; *** PROC ***

;-927   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   926 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-928   i=0;  while (i < FTop) { countcalls (i); i++; } 

 mov ax, 0
 mov [bp-2], ax
.listfunc569:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc570
 push word [bp-2]
 call countcalls
 add  sp, 2
 inc  word[bp-2]

;-929   i=0;  while (i < FTop) { funclisting(i); i++; } }

 jmp .listfunc569
.listfunc570:
 mov ax, 0
 mov [bp-2], ax
.listfunc571:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc572
 push word [bp-2]
 call funclisting
 add  sp, 2
 inc  word[bp-2]
 jmp .listfunc571
.listfunc572:

;-930 int funclisting(int i) {int j;  char c;
 LEAVE
 ret
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0
; ENDP

funclisting:  ; *** PROC ***

;-931   prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   930 NULL i = bp+4
;  201 var sign word   930 NULL j = bp-2
;  202 var sign byte   930 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-932   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je .funclisting573
 push word [bp-2]
 call printint51
 add  sp, 2
 jmp .funclisting574
.funclisting573:
 push funclisting_1
 call prs
 add  sp, 2

;-933   j = FAdr[i];   printint51(j); prc(32);

.funclisting574:
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

;-934   c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-935   if(c=='V')prs("void " );    if(c=='B')prs("byte " );

 mov al, [bp-4]
 cmp al, 86
 jne .funclisting575
 push funclisting_2
 call prs
 add  sp, 2
.funclisting575:
 mov al, [bp-4]
 cmp al, 66
 jne .funclisting576
 push funclisting_3
 call prs
 add  sp, 2

;-936   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );

.funclisting576:
 mov al, [bp-4]
 cmp al, 87
 jne .funclisting577
 push funclisting_4
 call prs
 add  sp, 2
.funclisting577:
 mov al, [bp-4]
 cmp al, 68
 jne .funclisting578
 push funclisting_5
 call prs
 add  sp, 2

;-937   prc(32); prc(32);

.funclisting578:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-938   pt=adrF(FNameField, i); prs(pt);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-939 }


;-940 unsigned int MAXUI=65535;
 LEAVE
 ret
funclisting_0 db "\n;",0
funclisting_1 db " NULL",0
funclisting_2 db "void ",0
funclisting_3 db "byte ",0
funclisting_4 db "word ",0
funclisting_5 db "dwrd ",0
; ENDP
MAXUI dw -1

;-941 int epilog() {unsigned int i; 


epilog:  ; *** PROC ***

;-942   strcpy(symbol, "LastFunctionByt");  storefunc();

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   941 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 call storefunc

;-943   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");

 push epilog_1
 call prs
 add  sp, 2

;-944   prs("\n \n;   # type sign width  adr used name   list of global variables\n");

 push epilog_2
 call prs
 add  sp, 2

;-945   i=1;

 mov ax, 1
 mov [bp-2], ax

;-946   while (i< GTop) { listvar(i); i++; }

.epilog579:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .epilog580
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]

;-947   listfunc();   listcall();

 jmp .epilog579
.epilog580:
 call listfunc
 call listcall

;-948 


;-949   prs("\n;Input: "); prs(&namein);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-950   prs(", List: ");   prs(&namelst);

 push epilog_4
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-951   prs(",  Lines:"); printint51(lineno);

 push epilog_5
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-952   prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_6
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-953   prs(" max.:"); printint51(LSTART);

 push epilog_7
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-954   prs("\n;Functions      :"); printint51(FTop);

 push epilog_8
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-955   prs(" max.:"); printint51(FUNCMAX);

 push epilog_9
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-956   prs("\n;Calls          :"); printint51(CTop);

 push epilog_10
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-957   prs(" max.:"); printint51(CALLMAX);

 push epilog_11
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-958   prs(", NameField:"); printint51(CNameTop);

 push epilog_12
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-959   prs(" max.:"); printint51(65535);

 push epilog_13
 call prs
 add  sp, 2
 push -1
 call printint51
 add  sp, 2

;-960 //  prs(", segE:"); printint51(segE);


;-961   __asm{call LastFunctionByt}  _ i=ax;

call LastFunctionByt
mov [bp-2], ax

;-962   prs("\n;Code until     :"); printint51(i);

 push epilog_14
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-963   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");

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

;-964   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog581
 push epilog_17
 call prs
 add  sp, 2

;-965   prs("\n;Data (HeapEnd) :"); pint1(orgData); i=MAXUI-orgData;

.epilog581:
 push epilog_18
 call prs
 add  sp, 2
 push word [orgData]
 call pint1
 add  sp, 2
 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax

;-966   prs(", resting stacksize: ");printint51(i);

 push epilog_19
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-967   if (i <= 5000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 5000
 ja  .epilog582
 push epilog_20
 call prs
 add  sp, 2

;-968   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);

.epilog582:
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

;-969   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");

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

;-970   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog583
 push epilog_25
 call prs
 add  sp, 2

;-971   end1(0);}

.epilog583:
 push 0
 call end1
 add  sp, 2

;-972 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}


;-973 int setblock(unsigned int i) {
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

;-974   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   973 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, cs
 mov  es, ax
 mov  ax, 18944
 call DosInt

;-975 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 LEAVE
 ret
; ENDP

allocmem:  ; *** PROC ***

;-976   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   975 NULL i = bp+4
;  201 var unsg word   975 NULL vAX = bp-2
;  202 var unsg word   975 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, 18432
 call DosInt
mov [bp-2], ax
mov [bp-4], bx

;-977   if(DOS_ERR) return vBX;   return vAX;

 mov ax, [DOS_ERR]
 or  al, al
 je .allocmem584
 mov ax, [bp-4]
 jmp .retnallocmem
.allocmem584:
 mov ax, [bp-2]
 jmp .retnallocmem

;-978 }


;-979 int copyF(char *dest, char *src, unsigned int sz) {

 .retnallocmem: LEAVE
 ret
; ENDP

copyF:  ; *** PROC ***

;-980   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di

;Function : copyF, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   979 NULL dest = bp+4
;  201 ptr sign byte   979 NULL src = bp+6
;  202 var unsg word   979 NULL sz = bp+8;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]
 mov  cx, [bp+8]

;-981   asm cld

 cld

;-982   asm rep movsb

 rep movsb

;-983   asm mov byte [es:di], 0

 mov byte [es:di], 0

;-984 }


;-985 int to_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

to_far:  ; *** PROC ***

;-986   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   985 NULL dest = bp+4
;  201 ptr sign byte   985 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-987   asm cld

 cld

;-988   do{

.to_far585:

;-989   asm lodsb  ; inc si

 lodsb  ; inc si

;-990   asm stosb  ; inc di

 stosb  ; inc di

;-991   } while (al != 0);

 cmp  al, 0
 je  .to_far586
 jmp .to_far585
.to_far586:

;-992 }


;-993 int from_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

from_far:  ; *** PROC ***

;-994   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   993 NULL dest = bp+4
;  201 ptr sign byte   993 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-995   do{

.from_far587:

;-996   asm mov al, [es:si]

 mov al, [es:si]

;-997   asm inc si

 inc si

;-998   asm mov [di], al

 mov [di], al

;-999   asm inc di

 inc di

;-1000   } while (al != 0);

 cmp  al, 0
 je  .from_far588
 jmp .from_far587
.from_far588:

;-1001 }
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
;  104 arr sign byte   131    2 doglobName[15]
;  105 var sign word   297    5 mod1
;  106 var sign word   297   12 ireg1
;  107 var sign word   297    6 idx1
;  108 var sign word   297    1 ids1
;  109 var sign word   297    4 idw1
;  110 var sign word   297    2 idt1
;  111 var sign word   297 NULL val1
;  112 var sign word   298    2 mod2
;  113 var sign word   298    6 ireg2
;  114 var sign word   298    6 idx2
;  115 var sign word   298    1 ids2
;  116 var sign word   298    4 idw2
;  117 var sign word   298    2 idt2
;  118 var sign word   298    2 val2
;  119 arr sign byte   363    9 ops[5]
;  120 arr sign byte   405    3 printregstr[74]
;  121 var sign word   413    1 evalue
;  122 var sign word   413    1 exprtype
;  123 arr sign word   565    2 docalltype[10]
;  124 arr sign word   565    2 docallvalue[10]
;  125 arr sign byte   566    2 procname[17]
;  126 ptr sign byte   621    1 arglen
;  127 ptr sign byte   621    2 argv
;  128 arr sign byte   762    2 symboltemp[80]
;  129 var unsg word   940    1 MAXUI


;   # Calls Line Width  Name   list of functions

;    0    4   75   writetty
;    1    1   76   putch
;    2    6   77   cputs
;    3    3   78   mkneg
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
;   17    3  102   digit
;   18    1  107   letter
;   19    3  117   alnum
;   20    4  122   a
;   21   21  123   v
;   22    4  128   checknamelen
;   23    1  132   doglob
;   24   12  181   gettypes
;   25    9  190   adrofname
;   26    7  191   adrF
;   27    4  193   printName
;   28   12  197   searchname
;   29    3  201   checkName
;   30   10  206   typeName
;   31    3  222   name1
;   32    1  227   storecall
;   33    2  233   storefunc
;   34    2  237   addlocal
;   35    1  243   checkFunction
;   36    1  246   dofunc
;   37    1  287   isvariable
;   38    3  300   pexpr
;   39    1  307   constantexpr
;   40    3  317   exprstart
;   41    1  319   expr2
;   42    3  364   doreg1
;   43    6  383   checkreg
;   44    6  408   printreg
;   45    2  414   expr
;   46    4  463   compoundass
;   47    2  470   dovar1
;   48    8  491   rterm
;   49    1  504   isreg
;   50   15  522   doreg
;   51    1  528   doassign
;   52    1  546   domul
;   53    2  550   doidiv
;   54    1  563   domod
;   55    1  567   docall1
;   56 NULL  609   main
;   57    2  620   getfirstchar
;   58    1  622   getarg
;   59    2  640   parse
;   60    1  649   checkcalls
;   61    1  666   doinclude
;   62    1  677   dodefine
;   63    6  693   stmt
;   64    1  724   doemit
;   65    3  728   cmpneg
;   66    7  741   prlabel
;   67    3  742   prjump
;   68    1  743   doif
;   69    1  749   dodo
;   70    1  753   dowhile
;   71    4  756   isrelational
;   72   17  763   getlex
;   73    1  815   convertdefine
;   74    1  822   getdigit
;   75    1  831   getstring
;   76   31  834   next
;   77   78  835   istoken
;   78   36  836   expect
;   79    6  839   eprc
;   80    5  840   eprs
;   81   40  841   prc
;   82    3  846   prscomment
;   83    8  848   prnl
;   84  249  850   prs
;   85    2  855   eprnum
;   86   41  857   pint1
;   87   25  859   printint51
;   88    2  863   fgets1
;   89    1  867   printinputline
;   90    2  875   end1
;   91   50  876   error1
;   92    2  885   listproc
;   93    2  893   listvar
;   94    1  909   listcall
;   95    1  912   calllisting
;   96    1  918   countcalls
;   97    1  926   listfunc
;   98    1  930   funclisting
;   99    1  941   epilog
;  100    1  973   setblock
;  101    1  975   allocmem
;  102 NULL  979   copyF
;  103    1  985   to_far
;  104    3  993   from_far
;  105 NULL 1001   LastFunctionByt

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
;   26   192 pint1
;   27   198 prs
;   28   202 prs
;   29   206 prs
;   30   210 prs
;   31   214 prs
;   32   218 pint1
;   33   224 prs
;   34   228 expect
;   35   235 expect
;   36   242 error1
;   37   249 prs
;   38   253 prs
;   39   257 prs
;   40   261 strcpy
;   41   268 expect
;   42   275 istoken
;   43   283 prc
;   44   287 prscomment
;   45   298 prc
;   46   302 prs
;   47   306 strlen
;   48   313 istoken
;   49   321 prc
;   50   325 expect
;   51   332 pint1
;   52   338 istoken
;   53   346 expect
;   54   353 error1
;   55   360 prs
;   56   364 prs
;   57   368 prs
;   58   372 prs
;   59   376 prs
;   60   380 prs
;   61   384 istoken
;   62   392 prc
;   63   396 istoken
;   64   404 expect
;   65   411 pint1
;   66   417 pint1
;   67   423 adrofname
;   68   433 strcpy
;   69   440 strcpy
;   70   447 expect
;   71   454 adrF
;   72   459 adrofname
;   73   469 prs
;   74   473 prs
;   75   477 prc
;   76   481 pint1
;   77   487 prc
;   78   491 checkName
;   79   501 error1
;   80   508 adrofname
;   81   518 eqstr
;   82   524 adrofname
;   83   534 eqstr
;   84   540 istoken
;   85   548 istoken
;   86   556 istoken
;   87   564 istoken
;   88   572 istoken
;   89   580 istoken
;   90   588 istoken
;   91   596 istoken
;   92   604 name1
;   93   610 error1
;   94   617 getlex
;   95   624 error1
;   96   631 error1
;   97   638 strlen
;   98   645 to_far
;   99   652 error1
;  100   659 adrF
;  101   664 strcpy
;  102   671 error1
;  103   678 checkName
;  104   688 error1
;  105   695 adrF
;  106   700 strcpy
;  107   707 adrF
;  108   712 eqstr
;  109   718 checknamelen
;  110   731 strcpy
;  111   738 checkFunction
;  112   752 error1
;  113   759 storefunc
;  114   769 prs
;  115   773 prs
;  116   777 prs
;  117   781 expect
;  118   788 istoken
;  119   796 typeName
;  120   805 addlocal
;  121   814 istoken
;  122   822 expect
;  123   829 expect
;  124   836 isvariable
;  125   847 typeName
;  126   856 checknamelen
;  127   869 addlocal
;  128   878 istoken
;  129   886 expect
;  130   893 expect
;  131   900 istoken
;  132   908 expect
;  133   915 listproc
;  134   924 prs
;  135   928 mkneg
;  136   934 pint1
;  137   940 prs
;  138   944 istoken
;  139   952 stmt
;  140   957 prs
;  141   961 prs
;  142   965 prc
;  143   969 prs
;  144   973 prs
;  145   977 prs
;  146   981 strlen
;  147   988 strcpy
;  148   995 prs
;  149   999 expect
;  150  1006 eqstr
;  151  1012 constantexpr
;  152  1025 checkreg
;  153  1034 doreg1
;  154  1041 exprstart
;  155  1051 prs
;  156  1055 prs
;  157  1059 expect
;  158  1066 getlex
;  159  1073 typeName
;  160  1082 searchname
;  161  1093 gettypes
;  162  1102 isrelational
;  163  1115 error1
;  164  1122 expect
;  165  1129 prs
;  166  1133 prs
;  167  1137 gettypes
;  168  1146 prs
;  169  1150 prs
;  170  1154 v
;  171  1156 prs
;  172  1160 pint1
;  173  1166 cmpneg
;  174  1173 prs
;  175  1177 expect
;  176  1184 eqstr
;  177  1190 expr2
;  178  1196 expr
;  179  1201 getlex
;  180  1208 typeName
;  181  1217 error1
;  182  1224 checkreg
;  183  1233 doreg1
;  184  1240 searchname
;  185  1251 gettypes
;  186  1260 error1
;  187  1267 isrelational
;  188  1280 error1
;  189  1287 istoken
;  190  1295 error1
;  191  1302 istoken
;  192  1310 prs
;  193  1314 prs
;  194  1318 prs
;  195  1322 prs
;  196  1326 prs
;  197  1330 v
;  198  1332 prs
;  199  1336 pint1
;  200  1342 adrofname
;  201  1352 prs
;  202  1356 prs
;  203  1360 typeName
;  204  1369 checkreg
;  205  1378 prs
;  206  1382 printreg
;  207  1391 v
;  208  1393 prs
;  209  1397 printreg
;  210  1406 error1
;  211  1413 searchname
;  212  1424 gettypes
;  213  1433 error1
;  214  1440 prs
;  215  1444 printreg
;  216  1453 error1
;  217  1460 prs
;  218  1464 a
;  219  1466 prs
;  220  1470 prs
;  221  1474 prs
;  222  1478 v
;  223  1480 adrofname
;  224  1490 prs
;  225  1494 prs
;  226  1498 error1
;  227  1505 istoken
;  228  1513 strcpy
;  229  1520 istoken
;  230  1528 strcpy
;  231  1535 istoken
;  232  1543 strcpy
;  233  1550 istoken
;  234  1558 strcpy
;  235  1565 istoken
;  236  1573 strcpy
;  237  1580 istoken
;  238  1588 strcpy
;  239  1595 istoken
;  240  1603 strcpy
;  241  1610 getlex
;  242  1617 isrelational
;  243  1630 error1
;  244  1637 strcpy
;  245  1644 prnl
;  246  1649 prs
;  247  1653 prs
;  248  1657 printreg
;  249  1666 prs
;  250  1670 istoken
;  251  1678 pint1
;  252  1684 typeName
;  253  1693 checkreg
;  254  1702 printreg
;  255  1711 searchname
;  256  1722 a
;  257  1724 v
;  258  1726 cmpneg
;  259  1733 prs
;  260  1737 expect
;  261  1744 strlen
;  262  1751 eqstr
;  263  1757 eqstr
;  264  1763 eqstr
;  265  1769 eqstr
;  266  1775 eqstr
;  267  1781 eqstr
;  268  1787 eqstr
;  269  1793 eqstr
;  270  1799 eqstr
;  271  1805 eqstr
;  272  1811 eqstr
;  273  1817 eqstr
;  274  1823 eqstr
;  275  1829 eqstr
;  276  1835 eqstr
;  277  1841 eqstr
;  278  1847 eqstr
;  279  1853 eqstr
;  280  1859 eqstr
;  281  1865 eqstr
;  282  1871 eqstr
;  283  1877 eqstr
;  284  1883 strlen
;  285  1890 eqstr
;  286  1896 eqstr
;  287  1902 eqstr
;  288  1908 eqstr
;  289  1914 eqstr
;  290  1920 eqstr
;  291  1926 eqstr
;  292  1932 eqstr
;  293  1938 eqstr
;  294  1944 prc
;  295  1948 prc
;  296  1952 prc
;  297  1956 istoken
;  298  1964 prs
;  299  1968 pint1
;  300  1974 typeName
;  301  1983 checkreg
;  302  1992 doreg1
;  303  1999 docall1
;  304  2007 isreg
;  305  2013 searchname
;  306  2024 gettypes
;  307  2033 istoken
;  308  2041 istoken
;  309  2049 expect
;  310  2056 searchname
;  311  2067 expect
;  312  2074 expect
;  313  2081 gettypes
;  314  2090 error1
;  315  2097 istoken
;  316  2105 error1
;  317  2112 prs
;  318  2116 prs
;  319  2120 prs
;  320  2124 v
;  321  2126 istoken
;  322  2134 error1
;  323  2141 prs
;  324  2145 prs
;  325  2149 prs
;  326  2153 v
;  327  2155 istoken
;  328  2163 compoundass
;  329  2175 istoken
;  330  2183 compoundass
;  331  2195 istoken
;  332  2203 compoundass
;  333  2215 istoken
;  334  2223 compoundass
;  335  2235 istoken
;  336  2243 error1
;  337  2250 istoken
;  338  2258 error1
;  339  2265 istoken
;  340  2273 expr
;  341  2278 doassign
;  342  2287 dovar1
;  343  2294 istoken
;  344  2302 rterm
;  345  2308 istoken
;  346  2316 rterm
;  347  2322 istoken
;  348  2330 rterm
;  349  2336 istoken
;  350  2344 rterm
;  351  2350 istoken
;  352  2358 rterm
;  353  2364 istoken
;  354  2372 rterm
;  355  2378 istoken
;  356  2386 domul
;  357  2392 istoken
;  358  2400 doidiv
;  359  2407 istoken
;  360  2415 domod
;  361  2421 isrelational
;  362  2434 rterm
;  363  2440 cmpneg
;  364  2447 error1
;  365  2454 prnl
;  366  2459 prs
;  367  2463 prs
;  368  2467 gettypes
;  369  2476 prs
;  370  2480 prs
;  371  2484 v
;  372  2486 prs
;  373  2490 expect
;  374  2497 pint1
;  375  2503 gettypes
;  376  2512 prs
;  377  2516 v
;  378  2518 prnl
;  379  2523 prs
;  380  2527 prs
;  381  2531 prs
;  382  2535 prnl
;  383  2540 prs
;  384  2544 prs
;  385  2548 a
;  386  2550 prs
;  387  2554 v
;  388  2556 prs
;  389  2560 prs
;  390  2564 prs
;  391  2568 prs
;  392  2572 prs
;  393  2576 prc
;  394  2580 printName
;  395  2590 prs
;  396  2594 prnl
;  397  2599 prs
;  398  2603 prs
;  399  2607 prs
;  400  2611 prs
;  401  2615 v
;  402  2617 istoken
;  403  2625 prnl
;  404  2630 prs
;  405  2634 prs
;  406  2638 prs
;  407  2642 prs
;  408  2646 pint1
;  409  2652 typeName
;  410  2661 searchname
;  411  2672 istoken
;  412  2680 searchname
;  413  2691 expect
;  414  2698 expect
;  415  2705 gettypes
;  416  2714 error1
;  417  2721 eqstr
;  418  2727 dovar1
;  419  2734 eqstr
;  420  2740 doreg
;  421  2746 eqstr
;  422  2752 doreg
;  423  2758 eqstr
;  424  2764 doreg
;  425  2770 eqstr
;  426  2776 doreg
;  427  2782 eqstr
;  428  2788 doreg
;  429  2794 eqstr
;  430  2800 doreg
;  431  2806 eqstr
;  432  2812 doreg
;  433  2818 eqstr
;  434  2824 doreg
;  435  2830 eqstr
;  436  2836 doreg
;  437  2842 eqstr
;  438  2848 doreg
;  439  2854 eqstr
;  440  2860 doreg
;  441  2866 eqstr
;  442  2872 doreg
;  443  2878 eqstr
;  444  2884 doreg
;  445  2890 eqstr
;  446  2896 doreg
;  447  2902 eqstr
;  448  2908 doreg
;  449  2914 expect
;  450  2921 prs
;  451  2925 prs
;  452  2929 prs
;  453  2933 istoken
;  454  2941 pint1
;  455  2947 istoken
;  456  2955 searchname
;  457  2966 v
;  458  2968 error1
;  459  2975 gettypes
;  460  2984 prs
;  461  2988 v
;  462  2990 prs
;  463  2994 prs
;  464  2998 prs
;  465  3002 a
;  466  3004 prs
;  467  3008 prs
;  468  3012 pint1
;  469  3018 v
;  470  3020 prs
;  471  3024 prs
;  472  3028 printName
;  473  3038 prs
;  474  3042 prs
;  475  3046 prs
;  476  3050 prs
;  477  3054 v
;  478  3056 prs
;  479  3060 prs
;  480  3064 prs
;  481  3068 v
;  482  3070 prs
;  483  3074 prs
;  484  3078 prs
;  485  3082 v
;  486  3084 prs
;  487  3088 rterm
;  488  3094 istoken
;  489  3102 prs
;  490  3106 pint1
;  491  3112 prs
;  492  3116 error1
;  493  3123 istoken
;  494  3131 prs
;  495  3135 pint1
;  496  3141 prs
;  497  3145 prs
;  498  3149 typeName
;  499  3158 searchname
;  500  3169 error1
;  501  3176 gettypes
;  502  3185 error1
;  503  3192 error1
;  504  3199 prs
;  505  3203 v
;  506  3205 prs
;  507  3209 prs
;  508  3213 doidiv
;  509  3220 prs
;  510  3224 checknamelen
;  511  3237 strcpy
;  512  3244 storecall
;  513  3254 expect
;  514  3261 istoken
;  515  3269 error1
;  516  3276 istoken
;  517  3284 istoken
;  518  3292 eprs
;  519  3297 eprs
;  520  3302 eprc
;  521  3307 eprnum
;  522  3314 eprs
;  523  3319 eprc
;  524  3324 eprs
;  525  3329 eprc
;  526  3334 eprs
;  527  3339 istoken
;  528  3347 name1
;  529  3353 searchname
;  530  3364 istoken
;  531  3372 checkreg
;  532  3381 searchname
;  533  3392 error1
;  534  3399 istoken
;  535  3407 expect
;  536  3414 prs
;  537  3418 pint1
;  538  3424 prs
;  539  3428 prs
;  540  3432 prc
;  541  3436 pint1
;  542  3442 prs
;  543  3446 v
;  544  3448 prs
;  545  3452 gettypes
;  546  3461 prs
;  547  3465 v
;  548  3467 prs
;  549  3471 v
;  550  3473 prs
;  551  3477 prs
;  552  3481 printreg
;  553  3490 prs
;  554  3494 prs
;  555  3498 prs
;  556  3502 pint1
;  557  3508 getarg
;  558  3515 setblock
;  559  3524 error1
;  560  3531 allocmem
;  561  3540 error1
;  562  3547 getfirstchar
;  563  3560 parse
;  564  3566 checkcalls
;  565  3577 epilog
;  566  3584 fgets1
;  567  3591 cputs
;  568  3597 cputs
;  569  3603 readRL
;  570  3610 prnl
;  571  3615 strcpy
;  572  3622 instr1
;  573  3629 strcat1
;  574  3637 toupper
;  575  3645 strcpy
;  576  3652 strlen
;  577  3659 openR
;  578  3665 cputs
;  579  3671 cputs
;  580  3677 exitR
;  581  3683 creatR
;  582  3690 cputs
;  583  3696 cputs
;  584  3702 exitR
;  585  3708 prs
;  586  3712 prs
;  587  3716 prs
;  588  3720 prs
;  589  3724 prs
;  590  3728 prs
;  591  3732 prs
;  592  3736 getlex
;  593  3743 istoken
;  594  3751 istoken
;  595  3759 dodefine
;  596  3768 istoken
;  597  3776 doinclude
;  598  3786 error1
;  599  3793 typeName
;  600  3802 dofunc
;  601  3809 doglob
;  602  3816 prs
;  603  3820 from_far
;  604  3829 adrF
;  605  3834 eqstr
;  606  3840 prs
;  607  3844 prs
;  608  3848 prs
;  609  3852 printint51
;  610  3863 error1
;  611  3870 prs
;  612  3874 prs
;  613  3878 prs
;  614  3882 openR
;  615  3888 prs
;  616  3892 prs
;  617  3896 error1
;  618  3903 parse
;  619  3909 prs
;  620  3913 prs
;  621  3917 getfirstchar
;  622  3930 getlex
;  623  3937 eqstr
;  624  3943 getlex
;  625  3950 eqstr
;  626  3956 getlex
;  627  3963 prs
;  628  3967 strcpy
;  629  3974 prs
;  630  3978 error1
;  631  3985 getlex
;  632  3992 expect
;  633  3999 error1
;  634  4006 strlen
;  635  4013 error1
;  636  4020 adrofname
;  637  4030 strcpy
;  638  4037 expect
;  639  4044 istoken
;  640  4052 istoken
;  641  4060 stmt
;  642  4065 istoken
;  643  4073 doif
;  644  4078 istoken
;  645  4086 dodo
;  646  4091 istoken
;  647  4099 dowhile
;  648  4107 istoken
;  649  4115 prs
;  650  4119 name1
;  651  4125 prs
;  652  4129 expect
;  653  4136 prs
;  654  4140 next
;  655  4145 prc
;  656  4149 next
;  657  4154 getlex
;  658  4161 istoken
;  659  4169 prs
;  660  4173 next
;  661  4178 prc
;  662  4182 next
;  663  4187 getlex
;  664  4194 error1
;  665  4201 istoken
;  666  4209 doemit
;  667  4216 istoken
;  668  4224 istoken
;  669  4232 exprstart
;  670  4242 prs
;  671  4246 prs
;  672  4250 expect
;  673  4257 prs
;  674  4261 prs
;  675  4265 prc
;  676  4269 expect
;  677  4276 expect
;  678  4283 exprstart
;  679  4293 expect
;  680  4300 prs
;  681  4304 getlex
;  682  4311 pint1
;  683  4317 getlex
;  684  4324 prc
;  685  4328 expect
;  686  4335 prs
;  687  4339 prs
;  688  4343 prs
;  689  4347 prs
;  690  4351 prs
;  691  4355 pint1
;  692  4361 prs
;  693  4365 prs
;  694  4369 pint1
;  695  4375 prs
;  696  4379 prs
;  697  4383 prs
;  698  4387 error1
;  699  4394 prs
;  700  4398 prs
;  701  4402 pint1
;  702  4408 prc
;  703  4412 prs
;  704  4416 prs
;  705  4420 pint1
;  706  4426 pexpr
;  707  4432 pint1
;  708  4438 stmt
;  709  4443 istoken
;  710  4451 prjump
;  711  4458 prlabel
;  712  4466 stmt
;  713  4471 prlabel
;  714  4479 prlabel
;  715  4487 prlabel
;  716  4495 stmt
;  717  4500 expect
;  718  4507 pexpr
;  719  4513 pint1
;  720  4519 prjump
;  721  4526 prlabel
;  722  4534 prlabel
;  723  4542 pexpr
;  724  4548 pint1
;  725  4554 stmt
;  726  4559 prjump
;  727  4566 prlabel
;  728  4574 getlex
;  729  4581 next
;  730  4586 next
;  731  4591 next
;  732  4596 next
;  733  4601 next
;  734  4606 next
;  735  4611 next
;  736  4616 next
;  737  4621 next
;  738  4626 next
;  739  4631 next
;  740  4636 next
;  741  4641 next
;  742  4646 next
;  743  4651 next
;  744  4656 instr1
;  745  4663 next
;  746  4668 getlex
;  747  4675 next
;  748  4680 next
;  749  4685 getlex
;  750  4692 getstring
;  751  4702 digit
;  752  4708 getdigit
;  753  4717 next
;  754  4722 next
;  755  4727 next
;  756  4732 alnum
;  757  4738 strcpy
;  758  4745 alnum
;  759  4751 next
;  760  4756 eqstr
;  761  4762 eqstr
;  762  4768 eqstr
;  763  4774 eqstr
;  764  4780 eqstr
;  765  4786 eqstr
;  766  4792 eqstr
;  767  4798 eqstr
;  768  4804 eqstr
;  769  4810 eqstr
;  770  4816 eqstr
;  771  4822 eqstr
;  772  4828 eqstr
;  773  4834 eqstr
;  774  4840 eqstr
;  775  4846 eqstr
;  776  4852 eqstr
;  777  4858 convertdefine
;  778  4872 strcpy
;  779  4879 error1
;  780  4886 adrofname
;  781  4896 eqstr
;  782  4902 next
;  783  4907 alnum
;  784  4913 next
;  785  4918 digit
;  786  4924 next
;  787  4929 next
;  788  4934 next
;  789  4939 fgets1
;  790  4946 getlex
;  791  4953 istoken
;  792  4961 prs
;  793  4965 listproc
;  794  4974 prs
;  795  4978 pint1
;  796  4984 error1
;  797  4991 eprc
;  798  4996 writetty
;  799  5005 writetty
;  800  5014 fputcR
;  801  5021 prc
;  802  5025 prs
;  803  5029 prc
;  804  5033 eprc
;  805  5038 mkneg
;  806  5044 eprnum
;  807  5051 eprc
;  808  5056 prc
;  809  5060 mkneg
;  810  5066 pint1
;  811  5072 prc
;  812  5076 prc
;  813  5080 prc
;  814  5084 prc
;  815  5088 prc
;  816  5092 pint1
;  817  5098 printinputline
;  818  5113 readRL
;  819  5120 prs
;  820  5124 pint1
;  821  5130 prc
;  822  5134 prscomment
;  823  5145 fcloseR
;  824  5153 fcloseR
;  825  5161 exitR
;  826  5167 prnl
;  827  5172 prscomment
;  828  5183 prs
;  829  5187 pint1
;  830  5193 prs
;  831  5197 prs
;  832  5201 prs
;  833  5205 pint1
;  834  5211 prs
;  835  5215 pint1
;  836  5221 prs
;  837  5225 prc
;  838  5229 prs
;  839  5233 pint1
;  840  5239 prs
;  841  5243 prs
;  842  5247 end1
;  843  5252 prs
;  844  5256 prs
;  845  5260 prs
;  846  5264 pint1
;  847  5270 prs
;  848  5274 listvar
;  849  5282 prs
;  850  5286 printint51
;  851  5297 prc
;  852  5301 prs
;  853  5305 prs
;  854  5309 prs
;  855  5313 prs
;  856  5317 prs
;  857  5321 prs
;  858  5325 prs
;  859  5329 prs
;  860  5333 prs
;  861  5337 printint51
;  862  5348 printint51
;  863  5359 prs
;  864  5363 prs
;  865  5367 prc
;  866  5371 adrofname
;  867  5381 prs
;  868  5385 prc
;  869  5389 pint1
;  870  5395 prc
;  871  5399 pint1
;  872  5405 prc
;  873  5409 prs
;  874  5413 prc
;  875  5417 pint1
;  876  5423 prs
;  877  5427 calllisting
;  878  5439 prs
;  879  5443 printint51
;  880  5454 prc
;  881  5458 prs
;  882  5462 printint51
;  883  5473 prc
;  884  5477 from_far
;  885  5486 prs
;  886  5490 adrF
;  887  5495 from_far
;  888  5504 eqstr
;  889  5510 prs
;  890  5514 countcalls
;  891  5525 funclisting
;  892  5537 prs
;  893  5541 printint51
;  894  5552 printint51
;  895  5563 prs
;  896  5567 printint51
;  897  5578 prc
;  898  5582 prs
;  899  5586 prs
;  900  5590 prs
;  901  5594 prs
;  902  5598 prc
;  903  5602 prc
;  904  5606 adrF
;  905  5611 prs
;  906  5615 strcpy
;  907  5622 storefunc
;  908  5632 prs
;  909  5636 prs
;  910  5640 listvar
;  911  5648 listfunc
;  912  5657 listcall
;  913  5666 prs
;  914  5670 prs
;  915  5674 prs
;  916  5678 prs
;  917  5682 prs
;  918  5686 printint51
;  919  5697 prs
;  920  5701 printint51
;  921  5712 prs
;  922  5716 printint51
;  923  5727 prs
;  924  5731 printint51
;  925  5742 prs
;  926  5746 printint51
;  927  5757 prs
;  928  5761 printint51
;  929  5772 prs
;  930  5776 printint51
;  931  5787 prs
;  932  5791 printint51
;  933  5802 prs
;  934  5806 printint51
;  935  5817 prs
;  936  5821 printint51
;  937  5832 prs
;  938  5836 printint51
;  939  5847 prs
;  940  5851 printint51
;  941  5862 prs
;  942  5866 prs
;  943  5870 pint1
;  944  5876 prs
;  945  5880 printint51
;  946  5891 prs
;  947  5895 prs
;  948  5899 prs
;  949  5903 prs
;  950  5907 printint51
;  951  5918 prs
;  952  5922 printint51
;  953  5933 prs
;  954  5937 printint51
;  955  5948 prs
;  956  5952 end1
;  957  5957 DosInt
;  958  5964 DosInt
;Input: A.C, List: A.S,  Lines: 1002
;Glob. variables:  129 max.:  200
;Functions      :  106 max.:  300
;Calls          :  959 max.: 2000, NameField: 5971 max.:    -1
;Code until     :21541 max.: 30000, free: 8459
;Data (HeapEnd) :-11988, resting stacksize: 11987
;Max. Const in 'epilog' :  947 max. 3000, free: 2053