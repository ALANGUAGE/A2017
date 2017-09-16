
; A.COM V0.9, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
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

;-89 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
 LEAVE
 ret
; ENDP

readR:  ; *** PROC ***
;Function : readR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    89 NULL s = bp+4
;  201 var sign word    89 NULL fd = bp+6;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-90 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
 LEAVE
 ret
; ENDP

readRL:  ; *** PROC ***
;Function : readRL, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    90 NULL s = bp+4
;  201 var sign word    90 NULL fd = bp+6
;  202 var sign word    90 NULL len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-91 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
; ENDP

fputcR:  ; *** PROC ***
;Function : fputcR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    91 NULL n = bp+4
;  201 var sign word    91 NULL fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]

;-92   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-93 


;-94 int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
 LEAVE
 ret
; ENDP

strlen:  ; *** PROC ***
;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    94 NULL s = bp+4
;  201 var sign word    94 NULL c = bp-2;
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

;-95 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }

 .retn: LEAVE
 ret
; ENDP

strcpy:  ; *** PROC ***
;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    95 NULL s = bp+4
;  201 ptr sign byte    95 NULL t = bp+6;
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

;-96 int eqstr(char *p, char *q) { while(*p) {
 LEAVE
 ret
; ENDP

eqstr:  ; *** PROC ***
;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    96 NULL p = bp+4
;  201 ptr sign byte    96 NULL q = bp+6;
 ENTER  0,0
.eqstr8:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr9

;-97     if (*p != *q) return 0; p++; q++; }

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

;-98     if(*q) return 0; return 1; }

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

;-99 int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}

 .retn: LEAVE
 ret
; ENDP

instr1:  ; *** PROC ***
;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte    99 NULL s = bp+4
;  201 var sign byte    99 NULL c = bp+6;
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

;-100 int instr2(char *s, char c) { while(*s) {if (*s==c)return &s; s++;}return 0;}

 .retn: LEAVE
 ret
; ENDP

instr2:  ; *** PROC ***
;Function : instr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   100 NULL s = bp+4
;  201 var sign byte   100 NULL c = bp+6;
 ENTER  0,0
.instr215:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr216
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr217
 mov ax, [bp+4]
 jmp .retn
.instr217:
 inc  word[bp+4]
 jmp .instr215
.instr216:
 mov ax, 0
 jmp .retn

;-101 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }

 .retn: LEAVE
 ret
; ENDP

strcat1:  ; *** PROC ***
;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   101 NULL s = bp+4
;  201 ptr sign byte   101 NULL t = bp+6;
 ENTER  0,0
.strcat118:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat119
 inc  word[bp+4]
 jmp .strcat118
.strcat119:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-102 int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}
 LEAVE
 ret
; ENDP

toupper:  ; *** PROC ***
;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   102 NULL s = bp+4;
 ENTER  0,0
.toupper20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper21
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 97 ;unsigned : 1
 jl  .toupper22
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 122
 jg  .toupper23
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 sub ax, 32
 mov  bx, [bp+4]
 mov  [bx], al
.toupper23:
.toupper22:
 inc  word[bp+4]
 jmp .toupper20
.toupper21:

;-103 int pint (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint:  ; *** PROC ***
;Function : pint, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   103 NULL n = bp+4
;  201 var sign word   103 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint24
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-104   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }

.pint24:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint25
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint
 add  sp, 2
.pint25:
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

;-105 int digit(char c){ 
 LEAVE
 ret
; ENDP

digit:  ; *** PROC ***

;-106     if(c<'0') return 0; 

;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   105 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit26
 mov ax, 0
 jmp .retn

;-107     if(c>'9') return 0; 

.digit26:
 mov al, [bp+4]
 cmp al, 57
 jle .digit27
 mov ax, 0
 jmp .retn

;-108     return 1; 

.digit27:
 mov ax, 1
 jmp .retn

;-109 }


;-110 int letter(char c) { 

 .retn: LEAVE
 ret
; ENDP

letter:  ; *** PROC ***

;-111     if (digit(c)) return 1;   ////////

;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   110 NULL c = bp+4;
 ENTER  0,0
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .letter28
 mov ax, 1
 jmp .retn

;-112     if (c=='_') return 1;

.letter28:
 mov al, [bp+4]
 cmp al, 95
 jne .letter29
 mov ax, 1
 jmp .retn

;-113     if (c=='.') return 1;

.letter29:
 mov al, [bp+4]
 cmp al, 46
 jne .letter30
 mov ax, 1
 jmp .retn

;-114     if (c=='?') return 1;

.letter30:
 mov al, [bp+4]
 cmp al, 63
 jne .letter31
 mov ax, 1
 jmp .retn

;-115     if (c=='$') return 1;

.letter31:
 mov al, [bp+4]
 cmp al, 36
 jne .letter32
 mov ax, 1
 jmp .retn

;-116     if (c> 'z') return 0; 

.letter32:
 mov al, [bp+4]
 cmp al, 122
 jle .letter33
 mov ax, 0
 jmp .retn

;-117     if (c< '@') return 0;// at included

.letter33:
 mov al, [bp+4]
 cmp al, 64
 jge .letter34
 mov ax, 0
 jmp .retn

;-118     if (c> 'Z') { if (c< 'a') return 0; }  

.letter34:
 mov al, [bp+4]
 cmp al, 90
 jle .letter35
 mov al, [bp+4]
 cmp al, 97
 jge .letter36
 mov ax, 0
 jmp .retn
.letter36:

;-119     return 1; 

.letter35:
 mov ax, 1
 jmp .retn

;-120 }    


;-121 int alnum(char c) {

 .retn: LEAVE
 ret
; ENDP

alnum:  ; *** PROC ***

;-122   if (digit (c)) return 1;

;Function : alnum, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   121 NULL c = bp+4;
 ENTER  0,0
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .alnum37
 mov ax, 1
 jmp .retn

;-123   if (letter(c)) return 1;

.alnum37:
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je .alnum38
 mov ax, 1
 jmp .retn

;-124   return 0;

.alnum38:
 mov ax, 0
 jmp .retn

;-125 }       


;-126 int a(unsigned int i) {  printName(i);}//address

 .retn: LEAVE
 ret
; ENDP

a:  ; *** PROC ***
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   126 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-127 int v(unsigned int i) {//value 
 LEAVE
 ret
; ENDP

v:  ; *** PROC ***

;-128     if (i < LSTART) prc('['); 

;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   127 NULL i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v39
 push 91
 call prc
 add  sp, 2

;-129     printName(i);

.v39:
 push word [bp+4]
 call printName
 add  sp, 2

;-130     if (i < LSTART) prc(']');   

 mov ax, [bp+4]
 cmp ax, 200
 jge .v40
 push 93
 call prc
 add  sp, 2

;-131 }

.v40:

;-132 int checknamelen() { int i;    i=strlen(symbol);
 LEAVE
 ret
; ENDP

checknamelen:  ; *** PROC ***
;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   132 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-133   if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen41
 push checknamelen_0
 call error1
 add  sp, 2

;-134 }

.checknamelen41:

;-135 char doglobName[IDLENMAX];
 LEAVE
 ret
; ENDP
checknamelen_0 db "Item name is too long in characters)",0
section .bss
absolute 53391
doglobName resb 15
section .text

;-136 int doglob() { int i; int j; int isstrarr; isstrarr=0;


doglob:  ; *** PROC ***
;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   136 NULL i = bp-2
;  201 var sign word   136 NULL j = bp-4
;  202 var sign word   136 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-137   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob42
 push doglob_0
 call error1
 add  sp, 2

;-138   if (iswidth == 0) error1("no VOID as var type");

.doglob42:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob43
 push doglob_1
 call error1
 add  sp, 2

;-139   checknamelen();

.doglob43:
 call checknamelen

;-140   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob44
 push doglob_2
 call error1
 add  sp, 2

;-141   if (istoken('[')) { istype='&';

.doglob44:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob45
 mov ax, 38
 mov byte [istype], al

;-142     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob46

;-143       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-144       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-145       prs("\n"); prs(symbol); 

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-146       if (iswidth==1) prs(" resb "); 

 mov al, [iswidth]
 cmp al, 1
 jne .doglob47
 push doglob_5
 call prs
 add  sp, 2

;-147       if (iswidth==2) prs(" resw ");

.doglob47:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob48
 push doglob_6
 call prs
 add  sp, 2

;-148       if (iswidth==4) prs(" resd ");

.doglob48:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob49
 push doglob_7
 call prs
 add  sp, 2

;-149       prunsign1(lexval); 

.doglob49:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-150       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-151       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-152       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob50
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-153       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob50:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob51
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-154       GData[GTop]=lexval; expect(']');

.doglob51:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-155     }else { expect(']');

 jmp .doglob52
.doglob46:
 push 93
 call expect
 add  sp, 2

;-156       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob53
 push doglob_9
 call error1
 add  sp, 2

;-157       prs("\n"); prs(symbol); prs(" db "); 

.doglob53:
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

;-158       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-159       expect('='); 

 push 61
 call expect
 add  sp, 2

;-160       if (istoken(T_STRING)) { 

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob54

;-161         prc(34); prscomment(symbol); prc(34); prs(",0"); 

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

;-162         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-163       else if (istoken('{' )) { i=0;

 jmp .doglob55
.doglob54:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob56
 mov ax, 0
 mov [bp-2], ax

;-164         do { if(i) prc(','); 

.doglob57:
 mov ax, [bp-2]
 or  al, al
 je .doglob58
 push 44
 call prc
 add  sp, 2

;-165           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob58:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-166         while (istoken(',')); expect('}'); }  

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob59
 jmp .doglob57
.doglob59:
 push 125
 call expect
 add  sp, 2

;-167       else error1("String or number array expected");

 jmp .doglob60
.doglob56:
 push doglob_13
 call error1
 add  sp, 2

;-168       }; 

.doglob60:
.doglob55:
.doglob52:

;-169   }else { //expect('=');

 jmp .doglob61
.doglob45:

;-170     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob62
 push doglob_15
 call prs
 add  sp, 2

;-171     else {

 jmp .doglob63
.doglob62:

;-172       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob64
 push doglob_16
 call prs
 add  sp, 2

;-173       else if (iswidth==2) prs(" dw ");

 jmp .doglob65
.doglob64:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob66
 push doglob_17
 call prs
 add  sp, 2

;-174       else                 prs(" dd ");

 jmp .doglob67
.doglob66:
 push doglob_18
 call prs
 add  sp, 2

;-175     }

.doglob67:
.doglob65:

;-176     if(istoken('-')) prc('-');

.doglob63:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob68
 push 45
 call prc
 add  sp, 2

;-177     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob68:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob69
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-178     else prunsign1(0); }

 jmp .doglob70
.doglob69:
 push 0
 call prunsign1
 add  sp, 2
.doglob70:

;-179   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob61:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-180   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-181   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-182   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob71
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob72
.doglob71:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-183   GTop++; expect(';'); }

.doglob72:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-184 


;-185 int gettypes(int i) {int j; char c;
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

;-186   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   185 NULL i = bp+4
;  201 var sign word   185 NULL j = bp-2
;  202 var sign byte   185 NULL c = bp-4;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes73
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes74
.gettypes73:
 mov ax, 0
 mov word [signi], ax

;-187   c=GWidth[i]; widthi=0;wi=0;

.gettypes74:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-188   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes75
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-189   if (c==2) {widthi=2;wi=2;}

.gettypes75:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes76
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-190   if (c==4) {widthi=4;wi=4;}

.gettypes76:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes77
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-191   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes77:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes78
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-192   if (c=='&')  typei=2;  

.gettypes78:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes79
 mov ax, 2
 mov word [typei], ax

;-193   return i; }  

.gettypes79:
 mov ax, [bp+4]
 jmp .retn

;-194 int adrofname(unsigned int i) { adrF(GNameField, i); }

 .retn: LEAVE
 ret
; ENDP

adrofname:  ; *** PROC ***
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   194 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-195 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
; ENDP

adrF:  ; *** PROC ***
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   195 NULL s = bp+4
;  201 var unsg word   195 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-196   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-197 int printName(unsigned int i) {int j;
 LEAVE
 ret
; ENDP

printName:  ; *** PROC ***

;-198   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   197 NULL i = bp+4
;  201 var sign word   197 NULL j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName80
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-199   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp .printName81
.printName80:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle .printName82
 push 43
 call prc
 add  sp, 2
.printName82:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-200 }

.printName81:

;-201 int searchname() { unsigned int i;
 LEAVE
 ret
; ENDP
printName_0 db "[bp",0

searchname:  ; *** PROC ***

;-202   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   201 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname83
 push searchname_0
 call error1
 add  sp, 2

;-203   GUsed[i]=GUsed[i] + 1; return i;

.searchname83:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp .retn

;-204 }


;-205 int checkName() { unsigned int i; unsigned int j;

 .retn: LEAVE
 ret
; ENDP
searchname_0 db "Variable unknown",0

checkName:  ; *** PROC ***

;-206   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   205 NULL i = bp-2
;  201 var unsg word   205 NULL j = bp-4;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
.checkName84:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName85
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
 je .checkName86
 mov ax, [bp-2]
 jmp .retn
.checkName86:
 inc  word[bp-2]

;-207   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp .checkName84
.checkName85:
 mov ax, 1
 mov [bp-2], ax
.checkName87:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName88
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
 je .checkName89
 mov ax, [bp-2]
 jmp .retn
.checkName89:
 inc  word[bp-2]

;-208   return 0;

 jmp .checkName87
.checkName88:
 mov ax, 0
 jmp .retn

;-209 }    


;-210 int typeName() { int m; //0=V,1=*,2=&

 .retn: LEAVE
 ret
; ENDP

typeName:  ; *** PROC ***

;-211     issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   210 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-212     if(istoken(T_SIGNED))   issign='S';  

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName90
 mov ax, 83
 mov byte [issign], al

;-213     if(istoken(T_UNSIGNED)) issign='U';

.typeName90:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName91
 mov ax, 85
 mov byte [issign], al

;-214     iswidth=2;                           

.typeName91:
 mov ax, 2
 mov byte [iswidth], al

;-215     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName92
 mov ax, 0
 mov byte [iswidth], al

;-216     if(istoken(T_CHAR))     iswidth=1;   

.typeName92:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName93
 mov ax, 1
 mov byte [iswidth], al

;-217     if(istoken(T_INT))      iswidth=2;

.typeName93:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName94
 mov ax, 2
 mov byte [iswidth], al

;-218     if(istoken(T_LONG))     iswidth=4;

.typeName94:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName95
 mov ax, 4
 mov byte [iswidth], al

;-219     istype='V'; 

.typeName95:
 mov ax, 86
 mov byte [istype], al

;-220     m=0;

 mov ax, 0
 mov [bp-2], ax

;-221     if(istoken('*'))  {istype='*'; m=1;} 

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName96
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-222     if(istoken('&'))  {istype='&'; m=2;}

.typeName96:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName97
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-223     name1(); 

.typeName97:
 call name1

;-224     return m; 

 mov ax, [bp-2]
 jmp .retn

;-225 }


;-226 int name1() {

 .retn: LEAVE
 ret
; ENDP

name1:  ; *** PROC ***

;-227     if (token!=T_NAME) error1("Name expected"); 

 mov ax, [token]
 cmp ax, 256
 je  .name198
 push name1_0
 call error1
 add  sp, 2

;-228     token=getlex(); 

.name198:
 call getlex
 mov word [token], ax

;-229 }


;-230 


;-231 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");

 ret
; ENDP
name1_0 db "Name expected",0

storecall:  ; *** PROC ***
;Function : storecall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   231 NULL i = bp-2;
 ENTER  2,0
 mov ax, [CTop]
 cmp ax, 2000 ;unsigned : 1
 jl  .storecall99
 push storecall_0
 call error1
 add  sp, 2

;-232   if (CNameTop >= 65468) error1("Call name table fuill");

.storecall99:
 mov ax, [CNameTop]
 cmp ax, 65468 ;unsigned : 0
 jb  .storecall100
 push storecall_1
 call error1
 add  sp, 2

;-233     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

.storecall100:
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

;-234     to_far(CNameTop, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNameTop]
 call to_far
 add  sp, 4

;-235     CNameTop=CNameTop+i; CNameTop++; CTop++;

 mov ax, [CNameTop]
 add ax, [bp-2]
 mov word [CNameTop], ax
 inc  word[CNameTop]
 inc  word[CTop]

;-236 }


;-237 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
; ENDP
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0

storefunc:  ; *** PROC ***
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc101
 push storefunc_0
 call error1
 add  sp, 2

;-238     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc101:
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

;-239     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-240 }


;-241 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
; ENDP
storefunc_0 db "Function table full",0

addlocal:  ; *** PROC ***
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal102
 push addlocal_0
 call error1
 add  sp, 2

;-242   if (checkName() != 0) error1("Variable already defined");

.addlocal102:
 call checkName
 cmp ax, 0
 je  .addlocal103
 push addlocal_1
 call error1
 add  sp, 2

;-243   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal103:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-244   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-245   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-246 }


;-247 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
; ENDP
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0

checkFunction:  ; *** PROC ***
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   247 NULL i = bp-2
;  201 var unsg word   247 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-248   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

.checkFunction104:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction105
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
 je .checkFunction106
 mov ax, [bp-2]
 jmp .retn
.checkFunction106:
 inc  word[bp-2]

;-249   return 0; }

 jmp .checkFunction104
.checkFunction105:
 mov ax, 0
 jmp .retn

;-250 int dofunc() { int nloc; int i; int narg;  

 .retn: LEAVE
 ret
; ENDP

dofunc:  ; *** PROC ***

;-251   cloc=&co; 

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   250 NULL nloc = bp-2
;  201 var sign word   250 NULL i = bp-4
;  202 var sign word   250 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-252   checknamelen();

 call checknamelen

;-253   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-254   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc107
 push dofunc_0
 call error1
 add  sp, 2

;-255   storefunc();

.dofunc107:
 call storefunc

;-256   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");

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

;-257   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-258   if (istoken(')')==0) { narg=2; 

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc108
 mov ax, 2
 mov [bp-6], ax

;-259     do { typeName();  addlocal(); narg+=2;

.dofunc109:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-260          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc110
 add  word[bp-6], 2
.dofunc110:
 inc  word[LTop]

;-261     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc111
 jmp .dofunc109
.dofunc111:
 push 41
 call expect
 add  sp, 2

;-262     


;-263   expect('{'); /*body*/

.dofunc108:
 push 123
 call expect
 add  sp, 2

;-264   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-265   while(isvariable()) {

.dofunc112:
 call isvariable
 or  al, al
 je .dofunc113

;-266     do {typeName();

.dofunc114:
 call typeName

;-267         checknamelen();

 call checknamelen

;-268         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-269         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc115
 sub  word[bp-2], 2

;-270         GData[LTop]=nloc;

.dofunc115:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-271         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc116
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

;-272             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-273         LTop++;

.dofunc116:
 inc  word[LTop]

;-274       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc117
 jmp .dofunc114
.dofunc117:
 push 59
 call expect
 add  sp, 2

;-275   listproc(); 

 jmp .dofunc112
.dofunc113:
 call listproc

;-276   if (LTop>LSTART){prs(";\n ENTER  "); 

 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc118
 push dofunc_3
 call prs
 add  sp, 2

;-277     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }

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

;-278   while(istoken('}')==0)   stmt();

.dofunc118:
.dofunc119:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc120
 call stmt

;-279   if (nreturn) { prs("\n .retn:");}

 jmp .dofunc119
.dofunc120:
 mov ax, [nreturn]
 or  al, al
 je .dofunc121
 push dofunc_5
 call prs
 add  sp, 2

;-280   if (LTop > LSTART) prs(" LEAVE");

.dofunc121:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc122
 push dofunc_6
 call prs
 add  sp, 2

;-281   prs("\n ret"); prs("\n; ENDP"); 

.dofunc122:
 push dofunc_7
 call prs
 add  sp, 2
 push dofunc_8
 call prs
 add  sp, 2

;-282   *cloc=0; prs(co); maxco1=strlen(co);

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

;-283   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc123
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-284 }

.dofunc123:

;-285 int isvariable() {
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

;-286     if(token==T_SIGNED)   goto v1;   

 mov ax, [token]
 cmp ax, 531
 jne .isvariable124
 jmp .v1

;-287     if(token==T_UNSIGNED) goto v1;

.isvariable124:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable125
 jmp .v1

;-288     if(token==T_CHAR)     goto v1;   

.isvariable125:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable126
 jmp .v1

;-289     if(token==T_INT)      goto v1;

.isvariable126:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable127
 jmp .v1

;-290     if(token==T_LONG)     goto v1;

.isvariable127:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable128
 jmp .v1

;-291     return 0;  

.isvariable128:
 mov ax, 0
 jmp .retn

;-292 v1: return 1;

.v1:
 mov ax, 1
 jmp .retn

;-293 }


;-294                   


;-295 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;

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

;-296 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

mod2 dw 0
ireg2 dw 0
idx2 dw 0
ids2 dw 0
idw2 dw 0
idt2 dw 0
val2 dw 0

;-297 


;-298 int pexpr() {expect('('); iscmp=0; 


pexpr:  ; *** PROC ***
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-299   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr129
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr130
 call constantexpr
 jmp .retn

;-300     ireg1=checkreg();

.pexpr130:
 call checkreg
 mov word [ireg1], ax

;-301     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr131
 push 1
 call doreg1
 add  sp, 2
 jmp .retn
.pexpr131:

;-302   exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

.pexpr129:
 call exprstart
 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr132
 push pexpr_1
 call prs
 add  sp, 2
.pexpr132:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-303   expect(')'); }           /*error1("Vergleich fehlt");*/

 push 41
 call expect
 add  sp, 2

;-304 


;-305 int constantexpr() { int mode; int id1;int ids;

 .retn:
 ret
; ENDP
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0

constantexpr:  ; *** PROC ***

;-306   token=getlex();   mode=typeName();  

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   305 NULL mode = bp-2
;  201 var sign word   305 NULL id1 = bp-4
;  202 var sign word   305 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-307   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-308   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr133
 push constantexpr_0
 call error1
 add  sp, 2

;-309   expect(T_CONST);  prs(" ; constant expression");

.constantexpr133:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-310   prs("\ncmp "); 

 push constantexpr_2
 call prs
 add  sp, 2

;-311   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr134
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr135
.constantexpr134:
 push constantexpr_4
 call prs
 add  sp, 2

;-312   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr135:
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

;-313   expect(')');

 push 41
 call expect
 add  sp, 2

;-314 }  


;-315 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
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
 je .exprstart136
 push 0
 call expr2
 add  sp, 2
 jmp .exprstart137
.exprstart136:
 push 0
 call expr
 add  sp, 2
.exprstart137:

;-316 


;-317 int expr2(int kind) {  int i;

 ret
; ENDP
exprstart_0 db "_",0

expr2:  ; *** PROC ***

;-318   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   317 NULL kind = bp+4
;  201 var sign word   317 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  .expr2138
 call getlex
 mov word [token], ax

;-319   mod1=typeName();

.expr2138:
 call typeName
 mov word [mod1], ax

;-320   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je .expr2139
 push expr2_0
 call error1
 add  sp, 2

;-321   ireg1=checkreg();

.expr2139:
 call checkreg
 mov word [ireg1], ax

;-322   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr2140
 push 0
 call doreg1
 add  sp, 2
 jmp .retn

;-323   if (ireg1 == 0) { idx1=searchname();

.expr2140:
 mov ax, [ireg1]
 cmp ax, 0
 jne .expr2141
 call searchname
 mov word [idx1], ax

;-324     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-325     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je .expr2142
 push expr2_1
 call error1
 add  sp, 2
.expr2142:

;-326   


;-327   if (isrelational()) { error1("Vergleich noch nicht implementiert");

.expr2141:
 call isrelational
 or  al, al
 je .expr2143
 push expr2_2
 call error1
 add  sp, 2

;-328   }


;-329   if (istoken('=') == 0) error1("Assign expected");

.expr2143:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expr2144
 push expr2_3
 call error1
 add  sp, 2

;-330   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

.expr2144:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr2145
 mov ax, [lexval]
 mov word [val2], ax
 push expr2_4
 call prs
 add  sp, 2

;-331     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-332     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne .expr2146
 push expr2_6
 call prs
 add  sp, 2

;-333     if (idw1 == 2) prs("word ");

.expr2146:
 mov ax, [idw1]
 cmp ax, 2
 jne .expr2147
 push expr2_7
 call prs
 add  sp, 2

;-334     if (idw1 == 4) prs("dword ");

.expr2147:
 mov ax, [idw1]
 cmp ax, 4
 jne .expr2148
 push expr2_8
 call prs
 add  sp, 2

;-335     v(idx1);

.expr2148:
 push word [idx1]
 call v
 add  sp, 2

;-336     prs(", "); prunsign1(val2);

 push expr2_9
 call prs
 add  sp, 2
 push word [val2]
 call prunsign1
 add  sp, 2

;-337     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

 mov ax, [idx1]
 cmp ax, 200 ;unsigned : 1
 jl  .expr2149
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
.expr2149:
 jmp .retn

;-338   


;-339   mod1=typeName(); ireg2=checkreg();

.expr2145:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-340   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je .expr2150
 push expr2_11
 call prs
 add  sp, 2

;-341     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}

 mov ax, [ireg1]
 or  al, al
 je .expr2151
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp .expr2152
.expr2151:
 push word [idx1]
 call v
 add  sp, 2
.expr2152:
 push expr2_12
 call prs
 add  sp, 2
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .retn

;-342   else {

 jmp .expr2153
.expr2150:

;-343     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne .expr2154
 push expr2_13
 call error1
 add  sp, 2

;-344     


;-345     idx2=searchname();

.expr2154:
 call searchname
 mov word [idx2], ax

;-346     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-347     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne .expr2155
 push expr2_14
 call error1
 add  sp, 2

;-348     prs("\nmov ");

.expr2155:
 push expr2_15
 call prs
 add  sp, 2

;-349     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");

 mov ax, [ireg1]
 or  al, al
 je .expr2156
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp .expr2157
.expr2156:
 push expr2_16
 call error1
 add  sp, 2

;-350     prs(", ");

.expr2157:
 push expr2_17
 call prs
 add  sp, 2

;-351     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne .expr2158
 push word [idx2]
 call a
 add  sp, 2

;-352     else {

 jmp .expr2159
.expr2158:

;-353       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne .expr2160
 push expr2_18
 call prs
 add  sp, 2

;-354       if (idw2 == 2) prs("word ");

.expr2160:
 mov ax, [idw2]
 cmp ax, 2
 jne .expr2161
 push expr2_19
 call prs
 add  sp, 2

;-355       if (idw2 == 4) prs("dword ");

.expr2161:
 mov ax, [idw2]
 cmp ax, 4
 jne .expr2162
 push expr2_20
 call prs
 add  sp, 2

;-356       v(idx2);

.expr2162:
 push word [idx2]
 call v
 add  sp, 2

;-357       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

 mov ax, [idx2]
 cmp ax, 200 ;unsigned : 1
 jl  .expr2163
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
.expr2163:

;-358     return;

.expr2159:
 jmp .retn

;-359   } error1("Internal error: only const or reg allowed");

.expr2153:
 push expr2_22
 call error1
 add  sp, 2

;-360 }


;-361 char ops[5];

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

;-362 int doreg1(int iscmp1) { int i;


doreg1:  ; *** PROC ***

;-363   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   362 NULL iscmp1 = bp+4
;  201 var sign word   362 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1164
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-364   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1164:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1165
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-365   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1165:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1166
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-366   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1166:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1167
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-367   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1167:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1168
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-368   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1168:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1169
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-369   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1169:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1170
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-370   if (iscmp1 == 1) { token=getlex();

.doreg1170:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1171
 call getlex
 mov word [token], ax

;-371       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1172
 push doreg1_7
 call error1
 add  sp, 2

;-372       strcpy(ops, "cmp"); }

.doreg1172:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-373   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1171:
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

;-374 


;-375   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1173
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-376   mod2=typeName(); ireg2=checkreg();

.doreg1173:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-377   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1174
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-378   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1174:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1175
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1176
.doreg1175:
 push word [bp-2]
 call v
 add  sp, 2

;-379   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1176:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1177
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

;-380 }

.doreg1177:

;-381 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

;-382   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg178
 mov ax, 0
 jmp .retn

;-383   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg178:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg179
 mov ax, 1
 jmp .retn
.checkreg179:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg180
 mov ax, 3
 jmp .retn

;-384   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg180:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg181
 mov ax, 5
 jmp .retn
.checkreg181:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg182
 mov ax, 7
 jmp .retn

;-385   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg182:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg183
 mov ax, 9
 jmp .retn
.checkreg183:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg184
 mov ax, 11
 jmp .retn

;-386   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg184:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg185
 mov ax, 13
 jmp .retn
.checkreg185:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg186
 mov ax, 15
 jmp .retn

;-387   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg186:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg187
 mov ax, 17
 jmp .retn
.checkreg187:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg188
 mov ax, 19
 jmp .retn

;-388   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg188:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg189
 mov ax, 21
 jmp .retn
.checkreg189:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg190
 mov ax, 23
 jmp .retn

;-389   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg190:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg191
 mov ax, 25
 jmp .retn
.checkreg191:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg192
 mov ax, 27
 jmp .retn

;-390   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg192:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg193
 mov ax, 29
 jmp .retn
.checkreg193:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg194
 mov ax, 31
 jmp .retn

;-391   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg194:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg195
 mov ax, 33
 jmp .retn
.checkreg195:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg196
 mov ax, 35
 jmp .retn

;-392   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg196:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg197
 mov ax, 37
 jmp .retn
.checkreg197:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 39
 jmp .retn

;-393   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg198:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 41
 jmp .retn
.checkreg199:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 43
 jmp .retn

;-394   // (eqstr(symbol,"ip")) return 45;


;-395   if (strlen(symbol) >   3) return 0;

.checkreg200:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg201
 mov ax, 0
 jmp .retn

;-396   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg201:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 47
 jmp .retn
.checkreg202:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 50
 jmp .retn

;-397   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg203:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 53
 jmp .retn
.checkreg204:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 56
 jmp .retn

;-398   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg205:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 59
 jmp .retn
.checkreg206:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 62
 jmp .retn

;-399   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg207:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 65
 jmp .retn
.checkreg208:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 68
 jmp .retn

;-400   if (eqstr(symbol,"cr0")) return 71;

.checkreg209:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 71
 jmp .retn

;-401   return 0;   }

.checkreg210:
 mov ax, 0
 jmp .retn

;-402 char printregstr[]

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

;-403 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-404 //          1         2         3         4         5         6         7


;-405 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-406 int printreg(int i) {  unsigned int k; unsigned char c;


printreg:  ; *** PROC ***

;-407   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   406 NULL i = bp+4
;  201 var unsg word   406 NULL k = bp-2
;  202 var unsg byte   406 NULL c = bp-4;
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

;-408   k = &printregstr + i; c=*k; prc(c);

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

;-409   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg211
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

;-410 }

.printreg211:

;-411 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
; ENDP
evalue dw 0
exprtype dw 10

;-412 int expr(int isRight)


expr:  ; *** PROC ***

;-413 { int mode; int id1;     int ixarr; int ixconst;


;-414   int ids;  int isCONST; int i;     unsigned char *p;


;-415   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   412 NULL isRight = bp+4
;  201 var sign word   413 NULL mode = bp-2
;  202 var sign word   413 NULL id1 = bp-4
;  203 var sign word   413 NULL ixarr = bp-6
;  204 var sign word   413 NULL ixconst = bp-8
;  205 var sign word   414 NULL ids = bp-10
;  206 var sign word   414 NULL isCONST = bp-12
;  207 var sign word   414 NULL i = bp-14
;  208 ptr unsg byte   414 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr212
 mov ax, [lexval]
 mov word [evalue], ax

;-416     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retn

;-417   mode=typeName(); /*0=V,1=*,2=&*/

.expr212:
 call typeName
 mov [bp-2], ax

;-418   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-419   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr213
 push 0
 call doreg1
 add  sp, 2
 jmp .retn

;-420   if (token=='(')  {docall1(); goto e1; }

.expr213:
 mov ax, [token]
 cmp ax, 40
 jne .expr214
 call docall1
 jmp .e1

;-421   if (isreg()) goto e1;

.expr214:
 call isreg
 or  al, al
 je .expr215
 jmp .e1

;-422 


;-423   id1=searchname(); gettypes(id1); ids=signi;

.expr215:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-424   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-425     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr216
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr217

;-426       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-427     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr218
.expr217:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-428     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-429     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr219
 push expr_1
 call error1
 add  sp, 2
.expr219:
.expr218:

;-430   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

.expr216:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr220
 mov ax, [bp-2]
 or  al, al
 je .expr221
 push expr_2
 call error1
 add  sp, 2

;-431      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr221:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr222
 push expr_4
 call prs
 add  sp, 2
 jmp .expr223
.expr222:
 push expr_5
 call prs
 add  sp, 2

;-432      v(id1); goto e1;}

.expr223:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-433   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

.expr220:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr224
 mov ax, [bp-2]
 or  al, al
 je .expr225
 push expr_6
 call error1
 add  sp, 2

;-434      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr225:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr226
 push expr_8
 call prs
 add  sp, 2
 jmp .expr227
.expr226:
 push expr_9
 call prs
 add  sp, 2

;-435      v(id1); goto e1;}

.expr227:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-436        


;-437   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr224:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr228
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-438   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr228:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr229
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-439   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr229:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr230
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-440   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    

.expr230:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr231
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-441   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr231:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr232
 push expr_14
 call error1
 add  sp, 2

;-442   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr232:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr233
 push expr_15
 call error1
 add  sp, 2

;-443 


;-444   if (istoken('=')) { exprtype= expr(1); 

.expr233:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr234
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-445   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-446   dovar1(mode, "mov", ixarr, id1);

.expr234:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-447   


;-448 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr235
 push expr_17
 call rterm
 add  sp, 2

;-449   else if (istoken('-')) rterm("sub" );

 jmp .expr236
.expr235:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr237
 push expr_18
 call rterm
 add  sp, 2

;-450   else if (istoken('&')) rterm("and" );

 jmp .expr238
.expr237:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr239
 push expr_19
 call rterm
 add  sp, 2

;-451   else if (istoken('|')) rterm("or" );  

 jmp .expr240
.expr239:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr241
 push expr_20
 call rterm
 add  sp, 2

;-452   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr242
.expr241:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr243
 push expr_21
 call rterm
 add  sp, 2

;-453   else if (istoken(T_GREATGREAT)) rterm("shr");  

 jmp .expr244
.expr243:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr245
 push expr_22
 call rterm
 add  sp, 2

;-454   else if (istoken('*')) domul (ids);

 jmp .expr246
.expr245:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr247
 push word [bp-10]
 call domul
 add  sp, 2

;-455   else if (istoken('/')) doidiv(ids);

 jmp .expr248
.expr247:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr249
 push word [bp-10]
 call doidiv
 add  sp, 2

;-456   else if (istoken('%')) domod (ids);

 jmp .expr250
.expr249:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr251
 push word [bp-10]
 call domod
 add  sp, 2

;-457   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr251:
.expr250:
.expr248:
.expr246:
.expr244:
.expr242:
.expr240:
.expr238:
.expr236:
 call isrelational
 or  al, al
 je .expr252
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-458   return 0;

.expr252:
 mov ax, 0
 jmp .retn

;-459 }


;-460 


;-461 int compoundass(char *op, int mode, int id1) {

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

;-462   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   461 NULL op = bp+4
;  201 var sign word   461 NULL mode = bp+6
;  202 var sign word   461 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass253
 push compoundass_0
 call error1
 add  sp, 2

;-463   prnl(); prs(op); prs("  "); 

.compoundass253:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-464   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass254
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass255
.compoundass254:
 push compoundass_3
 call prs
 add  sp, 2

;-465   v(id1); prs(", ");

.compoundass255:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-466   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-467 }


;-468 int dovar1(int mode, int op, int ixarr, int id1) { 
 LEAVE
 ret
; ENDP
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0

dovar1:  ; *** PROC ***

;-469   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   468 NULL mode = bp+4
;  201 var sign word   468 NULL op = bp+6
;  202 var sign word   468 NULL ixarr = bp+8
;  203 var sign word   468 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-470   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1256
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

;-471     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1257
 push dovar1_1
 call prs
 add  sp, 2

;-472     if(widthi == 2) prs(" ax, [bx]");

.dovar1257:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_2
 call prs
 add  sp, 2

;-473     return; }

.dovar1258:
 jmp .retn

;-474   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1256:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1259
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

;-475   if (ixarr) {

.dovar1259:
 mov ax, [bp+8]
 or  al, al
 je .dovar1260

;-476     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-477     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1261
 push dovar1_5
 call prs
 add  sp, 2

;-478     prs("\n "); prs(op);

.dovar1261:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-479     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1262
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1263
.dovar1262:
 push dovar1_8
 call prs
 add  sp, 2

;-480 // v(id1); prs(" [bx]");


;-481     prc('['); printName(id1); prs(" + bx]"); 

.dovar1263:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-482     return; }

 jmp .retn

;-483   prnl();prs(op);

.dovar1260:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-484   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1264
 push dovar1_10
 call prs
 add  sp, 2

;-485   if(wi==2) prs(" ax, ");

.dovar1264:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1265
 push dovar1_11
 call prs
 add  sp, 2

;-486   if(wi==4) prs(" eax, ");

.dovar1265:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1266
 push dovar1_12
 call prs
 add  sp, 2

;-487   v(id1);

.dovar1266:
 push word [bp+10]
 call v
 add  sp, 2

;-488 }


;-489 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-490   if (istoken(T_CONST)) { prnl(); prs(op); 

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   489 NULL op = bp+4
;  201 var sign word   489 NULL mode = bp-2
;  202 var sign word   489 NULL opint = bp-4
;  203 var sign word   489 NULL ixarr = bp-6
;  204 var sign word   489 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm267
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-491     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm268
 push rterm_0
 call prs
 add  sp, 2

;-492     if (wi==2) prs(" ax, ");

.rterm268:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm269
 push rterm_1
 call prs
 add  sp, 2

;-493     if (wi==4) prs(" eax, ");

.rterm269:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm270
 push rterm_2
 call prs
 add  sp, 2

;-494     prunsign1(lexval); return;}

.rterm270:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retn

;-495   mode=typeName(); id1=searchname(); ixarr=0;

.rterm267:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-496   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm271
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-497     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-498     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm272
 push rterm_3
 call error1
 add  sp, 2
.rterm272:

;-499   if (eqstr(symbol,"_AX")) return;

.rterm271:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm273
 jmp .retn

;-500   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm273:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-501 }


;-502 int isreg() {

 .retn: LEAVE
 ret
; ENDP
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0

isreg:  ; *** PROC ***

;-503   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg274
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-504   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  

.isreg274:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg275
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-505   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg275:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg276
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-506   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg276:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg277
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-507   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg277:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg278
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-508   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    

.isreg278:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg279
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-509   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg279:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg280
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-510   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg280:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg281
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-511   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    

.isreg281:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg282
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-512   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg282:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg283
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-513   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg283:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg284
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-514   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  

.isreg284:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg285
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-515   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg285:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg286
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-516   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg286:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg287
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-517   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  

.isreg287:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg288
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-518   return 0;   r1: return 1; 

.isreg288:
 mov ax, 0
 jmp .retn
.r1:
 mov ax, 1
 jmp .retn

;-519 }


;-520 int doreg(char *dr) { int i; expect('=');

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
;  200 ptr sign byte   520 NULL dr = bp+4
;  201 var sign word   520 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-521   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-522        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg289
 push word [lexval]
 call prunsign1
 add  sp, 2

;-523   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg290
.doreg289:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg291
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-524   else error1("only number or var allowed"); }

 jmp .doreg292
.doreg291:
 push doreg_2
 call error1
 add  sp, 2
.doreg292:
.doreg290:

;-525 


;-526 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
; ENDP
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0

doassign:  ; *** PROC ***

;-527   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   526 NULL mode = bp+4
;  201 var sign word   526 NULL i = bp+6
;  202 var sign word   526 NULL ixarr = bp+8
;  203 var sign word   526 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-528   if (mode==1) {prs("\n mov  bx, ");v(i);                  

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign293
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-529     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign294
 push doassign_1
 call prs
 add  sp, 2

;-530     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign295
.doassign294:
 push doassign_2
 call prs
 add  sp, 2
.doassign295:
 jmp .retn

;-531   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign293:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign296
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

;-532   if (ixarr) {  prs("\n mov bx, ");

.doassign296:
 mov ax, [bp+8]
 or  al, al
 je .doassign297
 push doassign_5
 call prs
 add  sp, 2

;-533     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign298
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign299
.doassign298:
 push word [bp+8]
 call v
 add  sp, 2

;-534     if (wi==2) prs("\n shl bx, 1");

.doassign299:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign300
 push doassign_6
 call prs
 add  sp, 2

;-535     prs("\n mov ["); printName(i);

.doassign300:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-536     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign301
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign302
.doassign301:
 push doassign_9
 call prs
 add  sp, 2
.doassign302:
 jmp .retn

;-537   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign297:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign303
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign304
 push doassign_11
 call prs
 add  sp, 2

;-538     } v(i); prs(", al"); return; }

.doassign304:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retn

;-539   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign303:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign305
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign306
 push doassign_14
 call prs
 add  sp, 2

;-540     } v(i); prs(", ax"); return; }

.doassign306:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retn

;-541   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign305:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign307
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign308
 push doassign_17
 call prs
 add  sp, 2

;-542     } v(i); prs(", eax"); return; }

.doassign308:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retn

;-543 }

.doassign307:

;-544 int domul(int ids) {

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

;-545   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   544 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul309
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul310
.domul309:

;-546   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul311
 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-547   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul312
.domul311:
 push domul_3
 call error1
 add  sp, 2
.domul312:
.domul310:

;-548 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
; ENDP
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0

doidiv:  ; *** PROC ***

;-549   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   548 NULL ids = bp+4
;  201 var sign word   548 NULL mode = bp-2
;  202 var sign word   548 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv313

;-550     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-551     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv314
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv315
.doidiv314:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv315:

;-552   else {

 jmp .doidiv316
.doidiv313:

;-553     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-554     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv317
 push doidiv_3
 call error1
 add  sp, 2

;-555     gettypes(id1);

.doidiv317:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-556     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv318
 push doidiv_4
 call error1
 add  sp, 2

;-557     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv318:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv319
 push doidiv_5
 call error1
 add  sp, 2

;-558     prs("\n mov bx, "); v(id1);

.doidiv319:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-559     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv320
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv321
.doidiv320:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv321:

;-560 }

.doidiv316:

;-561 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
;  200 var sign word   561 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-562 


;-563 int docalltype[10]; int docallvalue[10];
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

;-564 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 53451
procname resb 17
section .text

;-565 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1:  ; *** PROC ***

;-566   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   565 NULL i = bp-2
;  201 var sign word   565 NULL narg = bp-4
;  202 var sign word   565 NULL t0 = bp-6
;  203 var sign word   565 NULL n0 = bp-8
;  204 var sign word   565 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-567   checknamelen();

 call checknamelen

;-568   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-569   storecall();

 call storecall

;-570   expect('(');

 push 40
 call expect
 add  sp, 2

;-571 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1322

;-572 	  do { narg++;

.docall1323:
 inc  word[bp-4]

;-573 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1324
 push docall1_0
 call error1
 add  sp, 2
.docall1324:
 mov ax, 0
 mov [bp-6], ax

;-574       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1325
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-575       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1325:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1326
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-576         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-577         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-578       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1326:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1327
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-579       if(istoken(T_NAME))  { n0=checkreg();

.docall1327:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1328
 call checkreg
 mov [bp-8], ax

;-580         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1329
 mov ax, 5
 mov [bp-6], ax

;-581         else {t0=4; n0=searchname();

 jmp .docall1330
.docall1329:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-582           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1331
 mov ax, 3
 mov [bp-6], ax
.docall1331:
.docall1330:

;-583       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1328:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1332
 push docall1_4
 call error1
 add  sp, 2

;-584       docalltype [narg] = t0;

.docall1332:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-585       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-586     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1333
 jmp .docall1323
.docall1333:

;-587     


;-588   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-589     do {

.docall1334:

;-590       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-591       n0 = docallvalue[i];     

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-592       if(t0==1){ prs("\n push "); pint1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1335
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-593       if(t0==2){ prs("\n push "); 

.docall1335:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1336
 push docall1_6
 call prs
 add  sp, 2

;-594         prs(fname);prc(95);pint1(n0);}

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

;-595       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1336:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1337
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-596         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-597       if(t0==4){ gettypes(n0); 

.docall1337:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1338
 push word [bp-8]
 call gettypes
 add  sp, 2

;-598         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1339
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-599         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1340
.docall1339:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-600         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1340:

;-601       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1338:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1341
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1342
 mov ax, [bp-10]
 add ax, 2
.docall1342:

;-602    i--; } while (i > 0);  }

.docall1341:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1343
 jmp .docall1334
.docall1343:

;-603 	 prs("\n call "); prs(&procname);

.docall1322:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-604 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1344
 push docall1_14
 call prs
 add  sp, 2

;-605      narg=narg+narg; narg=narg+sz32; pint1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2
.docall1344:

;-606 /****************************************************************************/


;-607 int main() {
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

;-608   getarg();

 call getarg

;-609   setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-610   if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main345
 push main_0
 call error1
 add  sp, 2

;-611   segE=allocmem(4096);

.main345:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-612   if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je .main346
 push main_1
 call error1
 add  sp, 2

;-613   CNameTop=0;

.main346:
 mov ax, 0
 mov word [CNameTop], ax

;-614   getfirstchar();

 call getfirstchar

;-615   parse();

 call parse

;-616   checkcalls(); epilog();

 call checkcalls
 call epilog

;-617 }


;-618 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }

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

;-619 char *arglen=0x80; char *argv=0x82;

 ret
; ENDP
arglen dw 128
argv dw 130

;-620 int getarg() { int arglen1; int i; char *c;


getarg:  ; *** PROC ***

;-621   arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   620 NULL arglen1 = bp-2
;  201 var sign word   620 NULL i = bp-4
;  202 ptr sign byte   620 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-622   if (arglen1) { i=arglen1+129; *i=0; }

 mov ax, [bp-2]
 or  al, al
 je .getarg347
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-623   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");

 jmp .getarg348
.getarg347:
 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
 push getarg_0
 call cputs
 add  sp, 2

;-624     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }

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

;-625   strcpy(namein, argv);

.getarg348:
 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-626   if (instr2(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr2
 add  sp, 4
 cmp ax, 0
 jne .getarg349
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-627   toupper(namein);

.getarg349:
 lea  ax, [namein]
 push ax
 call toupper
 add  sp, 2

;-628   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';

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

;-629  


;-630   fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-631   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg350
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

;-632   fdout=creatR(namelst);

.getarg350:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-633   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg351
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

;-634   prs("\n; ");prs(Version1);

.getarg351:
 push getarg_4
 call prs
 add  sp, 2
 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-635   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}

 push getarg_5
 call prs
 add  sp, 2
 push word [bp-2]
 call pint1
 add  sp, 2
 mov ax, [bp-2]
 or  al, al
 je .getarg352
 push getarg_6
 call prs
 add  sp, 2
 push word [argv]
 call prs
 add  sp, 2

;-636   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);

.getarg352:
 push getarg_7
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
 push getarg_8
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-637   prs("\norg  256 \njmp main"); 

 push getarg_9
 call prs
 add  sp, 2

;-638 }


;-639 int parse() { token=getlex(); do {
 LEAVE
 ret
; ENDP
getarg_0 db " Usage: A.COM in_file[.C]: ",0
getarg_1 db ".C",0
getarg_2 db "Source file missing (.C): ",0
getarg_3 db "list file not creatable: ",0
getarg_4 db "\n; ",0
getarg_5 db ", Arglen: ",0
getarg_6 db ", Argv: ",0
getarg_7 db ", Source: ",0
getarg_8 db ", Output asm: ",0
getarg_9 db "\norg  256 \njmp main",0

parse:  ; *** PROC ***
 call getlex
 mov word [token], ax
.parse353:

;-640     if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse354
 mov ax, 1
 jmp .retn

;-641     if (istoken('#')) {

.parse354:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse355

;-642       if (istoken(T_DEFINE)) dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse356
 call dodefine

;-643       else if (istoken(T_INCLUDE)) doinclude();

 jmp .parse357
.parse356:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je .parse358
 call doinclude

;-644       else error1("define or include expected");  }

 jmp .parse359
.parse358:
 push parse_0
 call error1
 add  sp, 2
.parse359:
.parse357:

;-645     else{ typeName();  if (token=='(') dofunc();  else doglob(); }

 jmp .parse360
.parse355:
 call typeName
 mov ax, [token]
 cmp ax, 40
 jne .parse361
 call dofunc
 jmp .parse362
.parse361:
 call doglob
.parse362:

;-646   } while(1);

.parse360:
 mov ax, 1
 or  al, al
 je .parse363
 jmp .parse353
.parse363:

;-647 }


;-648 int checkcalls() { int i; int j; int k;

 .retn:
 ret
; ENDP
parse_0 db "define or include expected",0

checkcalls:  ; *** PROC ***

;-649   prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   648 NULL i = bp-2
;  201 var sign word   648 NULL j = bp-4
;  202 var sign word   648 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-650   i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-651   while (i < CTop) {

.checkcalls364:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .checkcalls365

;-652     pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-653     from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-654     j=0;

 mov ax, 0
 mov [bp-4], ax

;-655     do { p1=adrF(FNameField, j);

.checkcalls366:
 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-656       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkcalls367
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 mov ax, [FTop]
 mov [bp-4], ax

;-657       j++; } while (j < FTop);

.checkcalls367:
 inc  word[bp-4]
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .checkcalls368
 jmp .checkcalls366
.checkcalls368:

;-658     if (j == FTop) { k++; prs("\n; "); prs(NameA); }

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne .checkcalls369
 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-659     i++; }

.checkcalls369:
 inc  word[bp-2]

;-660   prs("\n; Number of unresolved CALLs :"); printint51(k);

 jmp .checkcalls364
.checkcalls365:
 push checkcalls_2
 call prs
 add  sp, 2
 push word [bp-6]
 call printint51
 add  sp, 2

;-661   if (k!=0) error1("At least 1 function is missing! "); 

 mov ax, [bp-6]
 cmp ax, 0
 je  .checkcalls370
 push checkcalls_3
 call error1
 add  sp, 2

;-662     else prs(" All FUNCTIONs in place");

 jmp .checkcalls371
.checkcalls370:
 push checkcalls_4
 call prs
 add  sp, 2

;-663 }

.checkcalls371:

;-664 


;-665 int doinclude() { int fdtemp;
 LEAVE
 ret
; ENDP
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db "\n; Number of unresolved CALLs :",0
checkcalls_3 db "At least 1 function is missing! ",0
checkcalls_4 db " All FUNCTIONs in place",0

doinclude:  ; *** PROC ***

;-666   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   665 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne .doinclude372
 mov ax, [fdin]
 mov [bp-2], ax

;-667   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-668   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-669   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

 mov ax, [DOS_ERR]
 cmp ax, 0
 je  .doinclude373
 push doinclude_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-670     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-671   linenoinclude=lineno; lineno=1;

.doinclude373:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-672   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-673   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-674   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-675 }

.doinclude372:

;-676 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
; ENDP
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0

dodefine:  ; *** PROC ***

;-677   if (eqstr(symbol, "ORGDATA")) {token=getlex();

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   676 NULL i = bp-2
;  201 var sign word   676 NULL j = bp-4
;  202 var sign word   676 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine374
 call getlex
 mov word [token], ax

;-678     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp .retn

;-679   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

.dodefine374:
 push dodefine_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine375
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 258
 jne .dodefine376

;-680     prs("\n;Use archive file: ");

 push dodefine_2
 call prs
 add  sp, 2

;-681     strcpy(archivename, symbol); prs(archivename);

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

;-682     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp .dodefine377
.dodefine376:
 push dodefine_3
 call error1
 add  sp, 2
.dodefine377:
 call getlex
 mov word [token], ax
 jmp .retn

;-683    expect(T_NAME);

.dodefine375:
 push 256
 call expect
 add  sp, 2

;-684   if (token==T_CONST) { 

 mov ax, [token]
 cmp ax, 257
 jne .dodefine378

;-685     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine379
 push dodefine_4
 call error1
 add  sp, 2

;-686     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

.dodefine379:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine380
 push dodefine_5
 call error1
 add  sp, 2

;-687     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

.dodefine380:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-688     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-689     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

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

;-690     expect(T_CONST); GTop++;  } 

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-691 }

.dodefine378:

;-692 int stmt() { int c; char cha;

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

;-693        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   692 NULL c = bp-2
;  201 var sign byte   692 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt381
.stmt382:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt383
 call stmt
 jmp .stmt382
.stmt383:

;-694   else if(istoken(T_IF))    doif();

 jmp .stmt384
.stmt381:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt385
 call doif

;-695   else if(istoken(T_DO))    dodo();

 jmp .stmt386
.stmt385:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt387
 call dodo

;-696   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt388
.stmt387:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt389
 call dowhile

;-697   else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}

 jmp .stmt390
.stmt389:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt391
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

;-698   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt392
.stmt391:
 mov ax, [token]
 cmp ax, 518
 jne .stmt393
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-699         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt394:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt395
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt394
.stmt395:
 call getlex
 mov word [token], ax

;-700   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  

 jmp .stmt396
.stmt393:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt397
 mov ax, [token]
 cmp ax, 123
 jne .stmt398
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-701         while(cha!= '}') { prc(cha); cha=next(); }

.stmt399:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt400
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-702         token=getlex(); }

 jmp .stmt399
.stmt400:
 call getlex
 mov word [token], ax

;-703         else error1("Curly open expected"); 

 jmp .stmt401
.stmt398:
 push stmt_3
 call error1
 add  sp, 2

;-704         }

.stmt401:

;-705   else if(istoken(T_EMIT))   doemit();

 jmp .stmt402
.stmt397:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt403
 call doemit

;-706   else if(istoken(';'))      { }

 jmp .stmt404
.stmt403:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt405

;-707   else if(istoken(T_RETURN)) {

 jmp .stmt406
.stmt405:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt407

;-708         if (token!=';') exprstart();

 mov ax, [token]
 cmp ax, 59
 je  .stmt408
 call exprstart

;-709         prs("\n jmp .retn"); 

.stmt408:
 push stmt_4
 call prs
 add  sp, 2

;-710         nreturn++; 

 inc  word[nreturn]

;-711         expect(';');

 push 59
 call expect
 add  sp, 2

;-712         }


;-713   else if(thechar==':')      {

 jmp .stmt409
.stmt407:
 mov al, [thechar]
 cmp al, 58
 jne .stmt410

;-714         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-715         prs(symbol); prc(':');  

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-716         expect(T_NAME); 

 push 256
 call expect
 add  sp, 2

;-717         expect(':'); 

 push 58
 call expect
 add  sp, 2

;-718         }


;-719   else  {exprstart(); expect(';'); } 

 jmp .stmt411
.stmt410:
 call exprstart
 push 59
 call expect
 add  sp, 2

;-720 }

.stmt411:
.stmt409:
.stmt406:
.stmt404:
.stmt402:
.stmt396:
.stmt392:
.stmt390:
.stmt388:
.stmt386:
.stmt384:

;-721 


;-722 int doemit() {prs("\n db ");
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

;-723   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-724     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit412
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit412:
 push 41
 call expect
 add  sp, 2

;-725 


;-726 int cmpneg(int ids) {

 ret
; ENDP
doemit_0 db "\n db ",0

cmpneg:  ; *** PROC ***

;-727        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   726 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg413
 push cmpneg_0
 call prs
 add  sp, 2

;-728   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg414
.cmpneg413:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg415
 push cmpneg_1
 call prs
 add  sp, 2

;-729   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg416
.cmpneg415:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg417
 mov ax, [bp+4]
 or  al, al
 je .cmpneg418
 push cmpneg_2
 call prs
 add  sp, 2

;-730                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg419
.cmpneg418:
 push cmpneg_3
 call prs
 add  sp, 2

;-731   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg419:
 jmp .cmpneg420
.cmpneg417:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg421
 mov ax, [bp+4]
 or  al, al
 je .cmpneg422
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-732                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-733                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg423
.cmpneg422:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-734                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-735   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg423:
 jmp .cmpneg424
.cmpneg421:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg425
 push cmpneg_8
 call prs
 add  sp, 2

;-736   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg426
.cmpneg425:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg427
 push cmpneg_9
 call prs
 add  sp, 2

;-737   else error1("Vergleich unbekannt in CMPNEG()");  }

 jmp .cmpneg428
.cmpneg427:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg428:
.cmpneg426:
.cmpneg424:
.cmpneg420:
.cmpneg416:
.cmpneg414:

;-738 


;-739 int prlabel(int n) {prs("\n."); prs(fname); pint1(n); prc(':'); }
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
;  200 var sign word   739 NULL n = bp+4;
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

;-740 int prjump (int n) {prs("\n jmp ."); prs(fname); pint1(n); }
 LEAVE
 ret
; ENDP
prlabel_0 db "\n.",0

prjump:  ; *** PROC ***
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   740 NULL n = bp+4;
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

;-741 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP
prjump_0 db "\n jmp .",0

doif:  ; *** PROC ***
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   741 NULL jdest = bp-2
;  201 var sign word   741 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-742   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-743   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif429
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-744     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-745   else prlabel(jdest); }

 jmp .doif430
.doif429:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif430:

;-746 


;-747 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
; ENDP

dodo:  ; *** PROC ***

;-748   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   747 NULL jdest = bp-2
;  201 var sign word   747 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-749   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-750   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-751 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

dowhile:  ; *** PROC ***
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   751 NULL jdest = bp-2
;  201 var sign word   751 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-752   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-753   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-754 int isrelational() {
 LEAVE
 ret
; ENDP

isrelational:  ; *** PROC ***

;-755   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational431
 jmp .w
.isrelational431:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational432
 jmp .w

;-756   if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational432:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational433
 jmp .w
.isrelational433:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational434
 jmp .w

;-757   if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational434:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational435
 jmp .w
.isrelational435:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational436
 jmp .w

;-758   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational436:
 mov ax, 0
 jmp .retn
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retn

;-759  


;-760 char symboltemp[80];    

 .retn:
 ret
; ENDP
section .bss
absolute 53468
symboltemp resb 80
section .text

;-761 int getlex() { char c; char *p; 


getlex:  ; *** PROC ***

;-762 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   761 NULL c = bp-2
;  201 ptr sign byte   761 NULL p = bp-4;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex437
 mov ax, 0
 jmp .retn
.getlex437:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex438
 jmp .g1

;-763   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex438:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex439
 mov al, [thechar]
 cmp al, 61
 jne .getlex440
 call next
 mov ax, 806
 jmp .retn
.getlex440:

;-764   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex439:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex441
 mov al, [thechar]
 cmp al, 61
 jne .getlex442
 call next
 mov ax, 807
 jmp .retn
.getlex442:

;-765   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex441:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex443
 mov al, [thechar]
 cmp al, 61
 jne .getlex444
 call next
 mov ax, 824
 jmp .retn
.getlex444:

;-766   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex443:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex445
 mov al, [thechar]
 cmp al, 61
 jne .getlex446
 call next
 mov ax, 811
 jmp .retn
.getlex446:

;-767   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex445:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex447
 mov al, [thechar]
 cmp al, 60
 jne .getlex448
 call next
 mov ax, 1240
 jmp .retn
.getlex448:

;-768   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex447:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex449
 mov al, [thechar]
 cmp al, 62
 jne .getlex450
 call next
 mov ax, 1241
 jmp .retn
.getlex450:

;-769   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex449:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex451
 mov al, [thechar]
 cmp al, 43
 jne .getlex452
 call next
 mov ax, 1219
 jmp .retn
.getlex452:

;-770   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex451:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex453
 mov al, [thechar]
 cmp al, 45
 jne .getlex454
 call next
 mov ax, 1225
 jmp .retn
.getlex454:

;-771   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex453:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex455
 mov al, [thechar]
 cmp al, 61
 jne .getlex456
 call next
 mov ax, 1230
 jmp .retn
.getlex456:

;-772   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex455:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex457
 mov al, [thechar]
 cmp al, 61
 jne .getlex458
 call next
 mov ax, 1231
 jmp .retn
.getlex458:

;-773   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex457:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex459
 mov al, [thechar]
 cmp al, 61
 jne .getlex460
 call next
 mov ax, 1234
 jmp .retn
.getlex460:

;-774   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    

.getlex459:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex461
 mov al, [thechar]
 cmp al, 61
 jne .getlex462
 call next
 mov ax, 1235
 jmp .retn
.getlex462:

;-775   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex461:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex463
 mov al, [thechar]
 cmp al, 61
 jne .getlex464
 call next
 mov ax, 1232
 jmp .retn
.getlex464:

;-776   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        

.getlex463:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex465
 mov al, [thechar]
 cmp al, 61
 jne .getlex466
 call next
 mov ax, 1233
 jmp .retn
.getlex466:

;-777   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex465:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex467
 mov al, [bp-2]
 jmp .retn

;-778   if (c == '/') { if (thechar == '/') {

.getlex467:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex468
 mov al, [thechar]
 cmp al, 47
 jne .getlex469

;-779       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }

.getlex470:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 13
 je  .getlex471
 jmp .getlex470
.getlex471:
 call getlex
 jmp .retn
.getlex469:

;-780   if (c == '/') { if (thechar == '*') {

.getlex468:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex472
 mov al, [thechar]
 cmp al, 42
 jne .getlex473

;-781       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex474
 jmp .g2
.getlex474:
 mov al, [thechar]
 cmp al, 47
 je  .getlex475
 jmp .g2

;-782       c=next(); return getlex(); } else  return '/'; }

.getlex475:
 call next
 mov [bp-2], al
 call getlex
 jmp .retn
 jmp .getlex476
.getlex473:
 mov ax, 47
 jmp .retn
.getlex476:

;-783   if (c == '"') {getstring(c); return T_STRING;}

.getlex472:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex477
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retn

;-784   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex477:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex478
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retn

;-785   if (c==39) { lexval=next();

.getlex478:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex479
 call next
 mov word [lexval], ax

;-786     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex480
 call next
 mov word [lexval], ax

;-787       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex481
 mov ax, 10
 mov word [lexval], ax
.getlex481:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex482
 mov ax, 9
 mov word [lexval], ax

;-788       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex482:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex483
 mov ax, 0
 mov word [lexval], ax
.getlex483:
.getlex480:
 call next
 mov ax, 257
 jmp .retn

;-789   if (letter(c)) { 

.getlex479:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je .getlex484

;-790     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-791     while(letter(thechar)) {c=next(); *p=c;  p++; } 

.getlex485:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je .getlex486
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-792       *p=0;

 jmp .getlex485
.getlex486:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-793     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex487
 mov ax, 531
 jmp .retn

;-794     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex487:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex488
 mov ax, 532
 jmp .retn

;-795     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex488:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex489
 mov ax, 529
 jmp .retn

;-796     if (eqstr(symbol,"int"     )) return T_INT;

.getlex489:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex490
 mov ax, 517
 jmp .retn

;-797     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex490:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex491
 mov ax, 533
 jmp .retn

;-798     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex491:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex492
 mov ax, 530
 jmp .retn

;-799     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex492:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex493
 mov ax, 518
 jmp .retn

;-800     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex493:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex494
 mov ax, 519
 jmp .retn

;-801     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex494:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex495
 mov ax, 520
 jmp .retn

;-802     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex495:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex496
 mov ax, 512
 jmp .retn

;-803     if (eqstr(symbol,"if"      )) return T_IF;

.getlex496:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex497
 mov ax, 513
 jmp .retn

;-804     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex497:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex498
 mov ax, 514
 jmp .retn

;-805     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex498:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex499
 mov ax, 515
 jmp .retn

;-806     if (eqstr(symbol,"do"      )) return T_DO;

.getlex499:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex500
 mov ax, 516
 jmp .retn

;-807     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex500:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex501
 mov ax, 521
 jmp .retn

;-808     if (eqstr(symbol,"define"  )) return T_DEFINE;   

.getlex501:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex502
 mov ax, 511
 jmp .retn

;-809     if (eqstr(symbol,"include" )) return T_INCLUDE;   

.getlex502:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex503
 mov ax, 510
 jmp .retn

;-810     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex503:
 call convertdefine
 or  al, al
 je .getlex504
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retn

;-811     return T_NAME; } error1("Input item not recognized"); }

.getlex504:
 mov ax, 256
 jmp .retn
.getlex484:
 push getlex_18
 call error1
 add  sp, 2

;-812 


;-813 int convertdefine() { int i; int j;   i=0;

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
;  200 var sign word   813 NULL i = bp-2
;  201 var sign word   813 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-814   while (i < GTop) {

.convertdefine505:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine506

;-815    j=adrofname(i); 

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-816    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine507
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine508
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-817    return T_CONST; } }

 mov ax, 257
 jmp .retn
.convertdefine508:

;-818    i++; } 

.convertdefine507:
 inc  word[bp-2]

;-819    return 0; }

 jmp .convertdefine505
.convertdefine506:
 mov ax, 0
 jmp .retn

;-820 int getdigit(char c) { int i;

 .retn: LEAVE
 ret
; ENDP

getdigit:  ; *** PROC ***

;-821     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   820 NULL c = bp+4
;  201 var sign word   820 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-822     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit509
 mov ax, 88
 mov byte [thechar], al
.getdigit509:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit510
 call next

;-823       while(letter(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit511:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je .getdigit512
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit513
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-824 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit513:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit514
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit514:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-825      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-826     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 

 jmp .getdigit511
.getdigit512:
 jmp .getdigit515
.getdigit510:
.getdigit516:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit517
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-827      i=0; i=c; lexval=lexval+i; } } 

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit516
.getdigit517:

;-828 }

.getdigit515:

;-829 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
; ENDP

getstring:  ; *** PROC ***
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   829 NULL delim = bp+4
;  201 var sign word   829 NULL c = bp-2
;  202 ptr sign byte   829 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-830   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

.getstring518:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring519
 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]
 call next
 mov [bp-2], ax
 jmp .getstring518
.getstring519:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-831 


;-832 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
 LEAVE
 ret
; ENDP

next:  ; *** PROC ***
;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   832 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
 mov al, [bp-2]
 mov byte [globC], al
 call fgets1
 mov byte [thechar], al
 mov al, [bp-2]
 jmp .retn

;-833 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}

 .retn: LEAVE
 ret
; ENDP

istoken:  ; *** PROC ***
;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   833 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken520
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retn
.istoken520:
 mov ax, 0
 jmp .retn

;-834 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();

 .retn: LEAVE
 ret
; ENDP

expect:  ; *** PROC ***
;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   834 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect521
 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 call listproc

;-835   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

 push expect_0
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push expect_1
 call error1
 add  sp, 2
.expect521:

;-836 


;-837 int eprc(char c)  {*cloc=c; cloc++; }
 LEAVE
 ret
; ENDP
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0

eprc:  ; *** PROC ***
;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   837 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
 inc  word[cloc]

;-838 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
 LEAVE
 ret
; ENDP

eprs:  ; *** PROC ***
;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   838 NULL s = bp+4
;  201 var sign byte   838 NULL c = bp-2;
 ENTER  2,0
.eprs522:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs523
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
 jmp .eprs522
.eprs523:

;-839 int prc(unsigned char c) { 
 LEAVE
 ret
; ENDP

prc:  ; *** PROC ***

;-840   if (c==10) {_AX=13; writetty(); }

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   839 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc524
 mov  ax, 13
 call writetty

;-841   _AL=c; writetty(); 

.prc524:
 mov  al, [bp+4]
 call writetty

;-842   fputcR(c, fdout); 

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-843   }


;-844 int prscomment(unsigned char *s) {unsigned char c;
 LEAVE
 ret
; ENDP

prscomment:  ; *** PROC ***

;-845   while(*s){c=*s;prc(c);s++;} }

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   844 NULL s = bp+4
;  201 var unsg byte   844 NULL c = bp-2;
 ENTER  2,0
.prscomment525:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment526
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
 jmp .prscomment525
.prscomment526:

;-846 int prnl() { prs("\n ");}
 LEAVE
 ret
; ENDP

prnl:  ; *** PROC ***
 push prnl_0
 call prs
 add  sp, 2

;-847 


;-848 int prs(unsigned char *s) {unsigned char c; int com; com=0;

 ret
; ENDP
prnl_0 db "\n ",0

prs:  ; *** PROC ***
;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   848 NULL s = bp+4
;  201 var unsg byte   848 NULL c = bp-2
;  202 var sign word   848 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-849   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;

.prs527:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs528
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 34
 jne .prs529
 mov ax, [bp-4]
 or  al, al
 je .prs530
 mov ax, 0
 mov [bp-4], ax
 jmp .prs531
.prs530:
 mov ax, 1
 mov [bp-4], ax

;-850     if (c==92) { if (com==0) { s++; c=*s;

.prs531:
.prs529:
 mov al, [bp-2]
 cmp al, 92
 jne .prs532
 mov ax, [bp-4]
 cmp ax, 0
 jne .prs533
 inc  word[bp+4]
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-851           if (c=='n') c=10; if (c=='t') c= 9;

 mov al, [bp-2]
 cmp al, 110
 jne .prs534
 mov ax, 10
 mov [bp-2], al
.prs534:
 mov al, [bp-2]
 cmp al, 116
 jne .prs535
 mov ax, 9
 mov [bp-2], al

;-852     } } prc(c); s++;  } }

.prs535:
.prs533:
.prs532:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp .prs527
.prs528:

;-853 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
 LEAVE
 ret
; ENDP

eprnum:  ; *** PROC ***
;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   853 NULL n = bp+4
;  201 var sign word   853 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum536
 push 45
 call eprc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-854   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }

.eprnum536:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum537
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call eprnum
 add  sp, 2
.eprnum537:
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

;-855 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint1:  ; *** PROC ***
;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   855 NULL n = bp+4
;  201 var sign word   855 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint1538
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-856   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }

.pint1538:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint1539
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
.pint1539:
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

;-857 int prunsign1(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP

prunsign1:  ; *** PROC ***

;-858   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   857 NULL n = bp+4
;  201 var unsg word   857 NULL e = bp-2;
 ENTER  2,0 ; constant expression
cmp word[bp+4], 10 ;unsigned : 0
 jb  .prunsign1540
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-859     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }

.prunsign1540:
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

;-860 int printint51(unsigned int j)  {
 LEAVE
 ret
; ENDP

printint51:  ; *** PROC ***

;-861   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   860 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint51541
 push 32
 call prc
 add  sp, 2
.printint51541:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint51542
 push 32
 call prc
 add  sp, 2
.printint51542:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint51543
 push 32
 call prc
 add  sp, 2

;-862    if (j<10) prc(32);  prunsign1(j); }

.printint51543:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint51544
 push 32
 call prc
 add  sp, 2
.printint51544:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-863 


;-864 int fgets1() { char c; c=*fgetsp;
 LEAVE
 ret
; ENDP

fgets1:  ; *** PROC ***
;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   864 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-865   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .fgets1545
 call printinputline
 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets1546
 mov ax, 0
 jmp .retn

;-866     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }

.fgets1546:
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov ax, 0
 mov word [spalte], ax

;-867   fgetsp++; spalte++;  return c; }

.fgets1545:
 inc  word[fgetsp]
 inc  word[spalte]
 mov al, [bp-2]
 jmp .retn

;-868 int printinputline() { fgetsp=&fgetsdest;

 .retn: LEAVE
 ret
; ENDP

printinputline:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-869   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);

.printinputline547:
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readR
 add  sp, 4
 mov word [DOS_NoBytes], ax

;-870   if (DOS_NoBytes == 0) return; 

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline548
 jmp .retn

;-871     *fgetsp=DOS_ByteRead; fgetsp++;} 

.printinputline548:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
 inc  word[fgetsp]

;-872   while (DOS_ByteRead != 10); *fgetsp=0;

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline549
 jmp .printinputline547
.printinputline549:
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-873     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;

 mov ax, [fdout]
 or  al, al
 je .printinputline550
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

;-874       prscomment(&fgetsdest);}

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-875 }

.printinputline550:

;-876 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }

 .retn:
 ret
; ENDP
printinputline_0 db "\n\n;-",0

end1:  ; *** PROC ***
;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   876 NULL n = bp+4;
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

;-877 int error1(char *s) { 
 LEAVE
 ret
; ENDP

error1:  ; *** PROC ***

;-878   lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   877 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-879   prnl(); prscomment(&fgetsdest);

 call prnl
 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-880   prs(";Line: "); prunsign1(lineno);

 push error1_0
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-881   prs(" ************** ERROR: "); prs(s);

 push error1_1
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2

;-882   prs("  in column: "); pint1(spalte);

 push error1_2
 call prs
 add  sp, 2
 push word [spalte]
 call pint1
 add  sp, 2

;-883   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);

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

;-884   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);

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

;-885   end1(1); }

 push 1
 call end1
 add  sp, 2

;-886 int listproc() {int i; 
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

;-887   if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   886 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle .listproc551

;-888   prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-889   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);

 push listproc_1
 call prs
 add  sp, 2
 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-890   prs("\n;   # type sign width addr used name   list of local variables");

 push listproc_2
 call prs
 add  sp, 2

;-891     i=LSTART; 

 mov ax, 200
 mov [bp-2], ax

;-892     while (i < LTop) { listvar(i); i++; } } 

.listproc552:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc553
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]
 jmp .listproc552
.listproc553:

;-893 }

.listproc551:

;-894 int listvar(unsigned int i) {unsigned int j; char c;
 LEAVE
 ret
; ENDP
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name   list of local variables",0

listvar:  ; *** PROC ***

;-895   prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   894 NULL i = bp+4
;  201 var unsg word   894 NULL j = bp-2
;  202 var sign byte   894 NULL c = bp-4;
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

;-896   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne .listvar554
 push listvar_1
 call prs
 add  sp, 2
.listvar554:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar555
 push listvar_2
 call prs
 add  sp, 2

;-897                if(c=='&')prs("arr ");   if(c=='#')prs("def ");

.listvar555:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar556
 push listvar_3
 call prs
 add  sp, 2
.listvar556:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar557
 push listvar_4
 call prs
 add  sp, 2

;-898   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

.listvar557:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .listvar558
 push listvar_5
 call prs
 add  sp, 2
.listvar558:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar559
 push listvar_6
 call prs
 add  sp, 2

;-899   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

.listvar559:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne .listvar560
 push listvar_7
 call prs
 add  sp, 2
.listvar560:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar561
 push listvar_8
 call prs
 add  sp, 2

;-900                if(c==  4)prs("dwrd " );

.listvar561:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar562
 push listvar_9
 call prs
 add  sp, 2

;-901   j=GAdr[i]; printint51(j);

.listvar562:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-902   j=GUsed[i]; if (j) printint51(j);

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je .listvar563
 push word [bp-2]
 call printint51
 add  sp, 2

;-903   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}

 jmp .listvar564
.listvar563:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar565
 push listvar_10
 call prs
 add  sp, 2
 jmp .listvar566
.listvar565:
 push listvar_11
 call prs
 add  sp, 2
.listvar566:

;-904   prc(32);  pt=adrofname(i); prs(pt);

.listvar564:
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

;-905   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar567
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

;-906   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}

.listvar567:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar568
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

;-907   if (i >= LSTART) { prs(" = bp"); j=GData[i];

.listvar568:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  .listvar569
 push listvar_12
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-908     if (j > 0) prc('+'); pint1(j);  }

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar570
 push 43
 call prc
 add  sp, 2
.listvar570:
 push word [bp-2]
 call pint1
 add  sp, 2

;-909 }

.listvar569:

;-910 int listcall() { int i;
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

;-911   prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   910 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-912   i=0;  while (i< CTop) { calllisting(i); i++; } }

 mov ax, 0
 mov [bp-2], ax
.listcall571:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .listcall572
 push word [bp-2]
 call calllisting
 add  sp, 2
 inc  word[bp-2]
 jmp .listcall571
.listcall572:

;-913 int calllisting(int i) {char c; int j;
 LEAVE
 ret
; ENDP
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0

calllisting:  ; *** PROC ***

;-914   prs("\n;"); printint51(i); prc(32);

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   913 NULL i = bp+4
;  201 var sign byte   913 NULL c = bp-2
;  202 var sign word   913 NULL j = bp-4;
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

;-915   c=CType [i]; if(c==0)prs("unresolved ");

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .calllisting573
 push calllisting_1
 call prs
 add  sp, 2

;-916   j=CAdr[i];            printint51(j); prc(32);

.calllisting573:
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

;-917   from_far(NameA, j);   prs(NameA);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-918 }


;-919 int countcalls(int f) { unsigned int i;
 LEAVE
 ret
; ENDP
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0

countcalls:  ; *** PROC ***

;-920   pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   919 NULL f = bp+4
;  201 var unsg word   919 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-921   i=0;  while (i < CTop) {

 mov ax, 0
 mov [bp-2], ax
.countcalls574:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge .countcalls575

;-922     p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-923     from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-924     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je .countcalls576
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-925     i++; }

.countcalls576:
 inc  word[bp-2]

;-926 }

 jmp .countcalls574
.countcalls575:

;-927 int listfunc() { int i;
 LEAVE
 ret
; ENDP

listfunc:  ; *** PROC ***

;-928   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   927 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-929   i=0;  while (i < FTop) { countcalls (i); i++; } 

 mov ax, 0
 mov [bp-2], ax
.listfunc577:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc578
 push word [bp-2]
 call countcalls
 add  sp, 2
 inc  word[bp-2]

;-930   i=0;  while (i < FTop) { funclisting(i); i++; } }

 jmp .listfunc577
.listfunc578:
 mov ax, 0
 mov [bp-2], ax
.listfunc579:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .listfunc580
 push word [bp-2]
 call funclisting
 add  sp, 2
 inc  word[bp-2]
 jmp .listfunc579
.listfunc580:

;-931 int funclisting(int i) {int j;  char c;
 LEAVE
 ret
; ENDP
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0

funclisting:  ; *** PROC ***

;-932   prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   931 NULL i = bp+4
;  201 var sign word   931 NULL j = bp-2
;  202 var sign byte   931 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-933   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je .funclisting581
 push word [bp-2]
 call printint51
 add  sp, 2
 jmp .funclisting582
.funclisting581:
 push funclisting_1
 call prs
 add  sp, 2

;-934   j = FAdr[i];   printint51(j); prc(32);

.funclisting582:
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

;-935   c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-936   if(c=='V')prs("void " );    if(c=='B')prs("byte " );

 mov al, [bp-4]
 cmp al, 86
 jne .funclisting583
 push funclisting_2
 call prs
 add  sp, 2
.funclisting583:
 mov al, [bp-4]
 cmp al, 66
 jne .funclisting584
 push funclisting_3
 call prs
 add  sp, 2

;-937   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );

.funclisting584:
 mov al, [bp-4]
 cmp al, 87
 jne .funclisting585
 push funclisting_4
 call prs
 add  sp, 2
.funclisting585:
 mov al, [bp-4]
 cmp al, 68
 jne .funclisting586
 push funclisting_5
 call prs
 add  sp, 2

;-938   prc(32); prc(32);

.funclisting586:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-939   pt=adrF(FNameField, i); prs(pt);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-940 }


;-941 unsigned int MAXUI=65535;
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

;-942 int epilog() {unsigned int i; 


epilog:  ; *** PROC ***

;-943   strcpy(symbol, "LastFunctionByt");  storefunc();

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   942 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 call storefunc

;-944   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");

 push epilog_1
 call prs
 add  sp, 2

;-945   prs("\n \n;   # type sign width  adr used name   list of global variables\n");

 push epilog_2
 call prs
 add  sp, 2

;-946   i=1;

 mov ax, 1
 mov [bp-2], ax

;-947   while (i< GTop) { listvar(i); i++; }

.epilog587:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .epilog588
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]

;-948   listfunc();   listcall();

 jmp .epilog587
.epilog588:
 call listfunc
 call listcall

;-949 


;-950   prs("\n;Input: "); prs(&namein);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-951   prs(", List: ");   prs(&namelst);

 push epilog_4
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-952   prs(",  Lines:"); printint51(lineno);

 push epilog_5
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-953   prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_6
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-954   prs(" max.:"); printint51(LSTART);

 push epilog_7
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-955   prs("\n;Functions      :"); printint51(FTop);

 push epilog_8
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-956   prs(" max.:"); printint51(FUNCMAX);

 push epilog_9
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-957   prs("\n;Calls          :"); printint51(CTop);

 push epilog_10
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-958   prs(" max.:"); printint51(CALLMAX);

 push epilog_11
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-959   prs(", NameField:"); printint51(CNameTop);

 push epilog_12
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-960   prs(" max.:"); printint51(65535);

 push epilog_13
 call prs
 add  sp, 2
 push -1
 call printint51
 add  sp, 2

;-961 //  prs(", segE:"); printint51(segE);


;-962   __asm{call LastFunctionByt}  _ i=ax;

call LastFunctionByt
mov [bp-2], ax

;-963   prs("\n;Code until     :"); printint51(i);

 push epilog_14
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-964   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");

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

;-965   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog589
 push epilog_17
 call prs
 add  sp, 2

;-966   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;

.epilog589:
 push epilog_18
 call prs
 add  sp, 2
 push word [orgData]
 call prunsign1
 add  sp, 2
 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax

;-967   prs(", resting stacksize: ");printint51(i);

 push epilog_19
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-968   if (i <= 5000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 5000
 ja  .epilog590
 push epilog_20
 call prs
 add  sp, 2

;-969   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);

.epilog590:
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

;-970   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");

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

;-971   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog591
 push epilog_25
 call prs
 add  sp, 2

;-972   end1(0);}

.epilog591:
 push 0
 call end1
 add  sp, 2

;-973 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}


;-974 int setblock(unsigned int i) {
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

;-975   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   974 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, cs
 mov  es, ax
 mov  ax, 18944
 call DosInt

;-976 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 LEAVE
 ret
; ENDP

allocmem:  ; *** PROC ***

;-977   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   976 NULL i = bp+4
;  201 var unsg word   976 NULL vAX = bp-2
;  202 var unsg word   976 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, 18432
 call DosInt
mov [bp-2], ax
mov [bp-4], bx

;-978   if(DOS_ERR) return vBX;   return vAX;

 mov ax, [DOS_ERR]
 or  al, al
 je .allocmem592
 mov ax, [bp-4]
 jmp .retn
.allocmem592:
 mov ax, [bp-2]
 jmp .retn

;-979 }


;-980 int copyF(char *dest, char *src, unsigned int sz) {

 .retn: LEAVE
 ret
; ENDP

copyF:  ; *** PROC ***

;-981   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di

;Function : copyF, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   980 NULL dest = bp+4
;  201 ptr sign byte   980 NULL src = bp+6
;  202 var unsg word   980 NULL sz = bp+8;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]
 mov  cx, [bp+8]

;-982   asm cld

 cld

;-983   asm rep movsb

 rep movsb

;-984   asm mov byte [es:di], 0

 mov byte [es:di], 0

;-985 }


;-986 int to_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

to_far:  ; *** PROC ***

;-987   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   986 NULL dest = bp+4
;  201 ptr sign byte   986 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-988   asm cld

 cld

;-989   do{

.to_far593:

;-990   asm lodsb  ; inc si

 lodsb  ; inc si

;-991   asm stosb  ; inc di

 stosb  ; inc di

;-992   } while (al != 0);

 cmp  al, 0
 je  .to_far594
 jmp .to_far593
.to_far594:

;-993 }


;-994 int from_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

from_far:  ; *** PROC ***

;-995   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   994 NULL dest = bp+4
;  201 ptr sign byte   994 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-996   do{

.from_far595:

;-997   asm mov al, [es:si]

 mov al, [es:si]

;-998   asm inc si

 inc si

;-999   asm mov [di], al

 mov [di], al

;-1000   asm inc di

 inc di

;-1001   } while (al != 0);

 cmp  al, 0
 je  .from_far596
 jmp .from_far595
.from_far596:

;-1002 }
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
;  104 arr sign byte   135    2 doglobName[15]
;  105 var sign word   295    5 mod1
;  106 var sign word   295   12 ireg1
;  107 var sign word   295    6 idx1
;  108 var sign word   295    1 ids1
;  109 var sign word   295    4 idw1
;  110 var sign word   295    2 idt1
;  111 var sign word   295 NULL val1
;  112 var sign word   296    2 mod2
;  113 var sign word   296    6 ireg2
;  114 var sign word   296    6 idx2
;  115 var sign word   296    1 ids2
;  116 var sign word   296    4 idw2
;  117 var sign word   296    2 idt2
;  118 var sign word   296    2 val2
;  119 arr sign byte   361    9 ops[5]
;  120 arr sign byte   403    3 printregstr[74]
;  121 var sign word   411    1 evalue
;  122 var sign word   411    1 exprtype
;  123 arr sign word   563    2 docalltype[10]
;  124 arr sign word   563    2 docallvalue[10]
;  125 arr sign byte   564    2 procname[17]
;  126 ptr sign byte   619    1 arglen
;  127 ptr sign byte   619    3 argv
;  128 arr sign byte   760    2 symboltemp[80]
;  129 var unsg word   941    1 MAXUI


;   # Calls Line Width  Name   list of functions

;    0    4   75   writetty
;    1    2   76   putch
;    2    6   77   cputs
;    3    4   78   mkneg
;    4    9   80   DosInt
;    5    2   85   openR
;    6    1   86   creatR
;    7    2   87   fcloseR
;    8    3   88   exitR
;    9    1   89   readR
;   10    1   90   readRL
;   11    1   91   fputcR
;   12    8   94   strlen
;   13   24   95   strcpy
;   14   74   96   eqstr
;   15    1   99   instr1
;   16    1  100   instr2
;   17    1  101   strcat1
;   18    1  102   toupper
;   19    1  103   pint
;   20    4  105   digit
;   21    4  110   letter
;   22 NULL  121   alnum
;   23    4  126   a
;   24   21  127   v
;   25    4  132   checknamelen
;   26    1  136   doglob
;   27   12  185   gettypes
;   28    9  194   adrofname
;   29    7  195   adrF
;   30    4  197   printName
;   31   12  201   searchname
;   32    3  205   checkName
;   33   10  210   typeName
;   34    3  226   name1
;   35    1  231   storecall
;   36    2  237   storefunc
;   37    2  241   addlocal
;   38    1  247   checkFunction
;   39    1  250   dofunc
;   40    1  285   isvariable
;   41    3  298   pexpr
;   42    1  305   constantexpr
;   43    3  315   exprstart
;   44    1  317   expr2
;   45    3  362   doreg1
;   46    6  381   checkreg
;   47    6  406   printreg
;   48    2  412   expr
;   49    4  461   compoundass
;   50    2  468   dovar1
;   51    8  489   rterm
;   52    1  502   isreg
;   53   15  520   doreg
;   54    1  526   doassign
;   55    1  544   domul
;   56    2  548   doidiv
;   57    1  561   domod
;   58    1  565   docall1
;   59 NULL  607   main
;   60    2  618   getfirstchar
;   61    1  620   getarg
;   62    2  639   parse
;   63    1  648   checkcalls
;   64    1  665   doinclude
;   65    1  676   dodefine
;   66    6  692   stmt
;   67    1  722   doemit
;   68    3  726   cmpneg
;   69    7  739   prlabel
;   70    3  740   prjump
;   71    1  741   doif
;   72    1  747   dodo
;   73    1  751   dowhile
;   74    4  754   isrelational
;   75   17  761   getlex
;   76    1  813   convertdefine
;   77    1  820   getdigit
;   78    1  829   getstring
;   79   31  832   next
;   80   78  833   istoken
;   81   36  834   expect
;   82    6  837   eprc
;   83    5  838   eprs
;   84   41  839   prc
;   85    3  844   prscomment
;   86    8  846   prnl
;   87  250  848   prs
;   88    2  853   eprnum
;   89   16  855   pint1
;   90   27  857   prunsign1
;   91   25  860   printint51
;   92    2  864   fgets1
;   93    1  868   printinputline
;   94    2  876   end1
;   95   50  877   error1
;   96    2  886   listproc
;   97    2  894   listvar
;   98    1  910   listcall
;   99    1  913   calllisting
;  100    1  919   countcalls
;  101    1  927   listfunc
;  102    1  931   funclisting
;  103    1  942   epilog
;  104    1  974   setblock
;  105    1  976   allocmem
;  106 NULL  980   copyF
;  107    1  986   to_far
;  108    3  994   from_far
;  109 NULL 1002   LastFunctionByt

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
;    9    66 DosInt
;   10    73 strcpy
;   11    80 prc
;   12    84 mkneg
;   13    90 pint
;   14    95 putch
;   15   101 digit
;   16   107 digit
;   17   113 letter
;   18   120 printName
;   19   130 prc
;   20   134 printName
;   21   144 prc
;   22   148 strlen
;   23   155 error1
;   24   162 error1
;   25   169 error1
;   26   176 checknamelen
;   27   189 checkName
;   28   199 error1
;   29   206 istoken
;   30   214 istoken
;   31   222 prs
;   32   226 prunsign1
;   33   236 prs
;   34   240 prs
;   35   244 prs
;   36   248 prs
;   37   252 prs
;   38   256 prunsign1
;   39   266 prs
;   40   270 expect
;   41   277 expect
;   42   284 error1
;   43   291 prs
;   44   295 prs
;   45   299 prs
;   46   303 strcpy
;   47   310 expect
;   48   317 istoken
;   49   325 prc
;   50   329 prscomment
;   51   340 prc
;   52   344 prs
;   53   348 strlen
;   54   355 istoken
;   55   363 prc
;   56   367 expect
;   57   374 prunsign1
;   58   384 istoken
;   59   392 expect
;   60   399 error1
;   61   406 prs
;   62   410 prs
;   63   414 prs
;   64   418 prs
;   65   422 prs
;   66   426 prs
;   67   430 istoken
;   68   438 prc
;   69   442 istoken
;   70   450 expect
;   71   457 prunsign1
;   72   467 prunsign1
;   73   477 adrofname
;   74   487 strcpy
;   75   494 strcpy
;   76   501 expect
;   77   508 adrF
;   78   513 adrofname
;   79   523 prs
;   80   527 prs
;   81   531 prc
;   82   535 pint1
;   83   541 prc
;   84   545 checkName
;   85   555 error1
;   86   562 adrofname
;   87   572 eqstr
;   88   578 adrofname
;   89   588 eqstr
;   90   594 istoken
;   91   602 istoken
;   92   610 istoken
;   93   618 istoken
;   94   626 istoken
;   95   634 istoken
;   96   642 istoken
;   97   650 istoken
;   98   658 name1
;   99   664 error1
;  100   671 getlex
;  101   678 error1
;  102   685 error1
;  103   692 strlen
;  104   699 to_far
;  105   706 error1
;  106   713 adrF
;  107   718 strcpy
;  108   725 error1
;  109   732 checkName
;  110   742 error1
;  111   749 adrF
;  112   754 strcpy
;  113   761 adrF
;  114   766 eqstr
;  115   772 checknamelen
;  116   785 strcpy
;  117   792 checkFunction
;  118   806 error1
;  119   813 storefunc
;  120   823 prs
;  121   827 prs
;  122   831 prs
;  123   835 expect
;  124   842 istoken
;  125   850 typeName
;  126   859 addlocal
;  127   868 istoken
;  128   876 expect
;  129   883 expect
;  130   890 isvariable
;  131   901 typeName
;  132   910 checknamelen
;  133   923 addlocal
;  134   932 istoken
;  135   940 expect
;  136   947 expect
;  137   954 istoken
;  138   962 expect
;  139   969 listproc
;  140   978 prs
;  141   982 mkneg
;  142   988 pint1
;  143   994 prs
;  144   998 istoken
;  145  1006 stmt
;  146  1011 prs
;  147  1015 prs
;  148  1019 prs
;  149  1023 prs
;  150  1027 prs
;  151  1031 strlen
;  152  1038 strcpy
;  153  1045 expect
;  154  1052 eqstr
;  155  1058 constantexpr
;  156  1071 checkreg
;  157  1080 doreg1
;  158  1087 exprstart
;  159  1097 prs
;  160  1101 prs
;  161  1105 expect
;  162  1112 getlex
;  163  1119 typeName
;  164  1128 searchname
;  165  1139 gettypes
;  166  1148 isrelational
;  167  1161 error1
;  168  1168 expect
;  169  1175 prs
;  170  1179 prs
;  171  1183 gettypes
;  172  1192 prs
;  173  1196 prs
;  174  1200 v
;  175  1202 prs
;  176  1206 prunsign1
;  177  1216 cmpneg
;  178  1223 prs
;  179  1227 expect
;  180  1234 eqstr
;  181  1240 expr2
;  182  1246 expr
;  183  1251 getlex
;  184  1258 typeName
;  185  1267 error1
;  186  1274 checkreg
;  187  1283 doreg1
;  188  1290 searchname
;  189  1301 gettypes
;  190  1310 error1
;  191  1317 isrelational
;  192  1330 error1
;  193  1337 istoken
;  194  1345 error1
;  195  1352 istoken
;  196  1360 prs
;  197  1364 prs
;  198  1368 prs
;  199  1372 prs
;  200  1376 prs
;  201  1380 v
;  202  1382 prs
;  203  1386 prunsign1
;  204  1396 adrofname
;  205  1406 prs
;  206  1410 prs
;  207  1414 typeName
;  208  1423 checkreg
;  209  1432 prs
;  210  1436 printreg
;  211  1445 v
;  212  1447 prs
;  213  1451 printreg
;  214  1460 error1
;  215  1467 searchname
;  216  1478 gettypes
;  217  1487 error1
;  218  1494 prs
;  219  1498 printreg
;  220  1507 error1
;  221  1514 prs
;  222  1518 a
;  223  1520 prs
;  224  1524 prs
;  225  1528 prs
;  226  1532 v
;  227  1534 adrofname
;  228  1544 prs
;  229  1548 prs
;  230  1552 error1
;  231  1559 istoken
;  232  1567 strcpy
;  233  1574 istoken
;  234  1582 strcpy
;  235  1589 istoken
;  236  1597 strcpy
;  237  1604 istoken
;  238  1612 strcpy
;  239  1619 istoken
;  240  1627 strcpy
;  241  1634 istoken
;  242  1642 strcpy
;  243  1649 istoken
;  244  1657 strcpy
;  245  1664 getlex
;  246  1671 isrelational
;  247  1684 error1
;  248  1691 strcpy
;  249  1698 prnl
;  250  1703 prs
;  251  1707 prs
;  252  1711 printreg
;  253  1720 prs
;  254  1724 istoken
;  255  1732 prunsign1
;  256  1742 typeName
;  257  1751 checkreg
;  258  1760 printreg
;  259  1769 searchname
;  260  1780 a
;  261  1782 v
;  262  1784 cmpneg
;  263  1791 prs
;  264  1795 expect
;  265  1802 strlen
;  266  1809 eqstr
;  267  1815 eqstr
;  268  1821 eqstr
;  269  1827 eqstr
;  270  1833 eqstr
;  271  1839 eqstr
;  272  1845 eqstr
;  273  1851 eqstr
;  274  1857 eqstr
;  275  1863 eqstr
;  276  1869 eqstr
;  277  1875 eqstr
;  278  1881 eqstr
;  279  1887 eqstr
;  280  1893 eqstr
;  281  1899 eqstr
;  282  1905 eqstr
;  283  1911 eqstr
;  284  1917 eqstr
;  285  1923 eqstr
;  286  1929 eqstr
;  287  1935 eqstr
;  288  1941 strlen
;  289  1948 eqstr
;  290  1954 eqstr
;  291  1960 eqstr
;  292  1966 eqstr
;  293  1972 eqstr
;  294  1978 eqstr
;  295  1984 eqstr
;  296  1990 eqstr
;  297  1996 eqstr
;  298  2002 prc
;  299  2006 prc
;  300  2010 prc
;  301  2014 istoken
;  302  2022 prs
;  303  2026 prunsign1
;  304  2036 typeName
;  305  2045 checkreg
;  306  2054 doreg1
;  307  2061 docall1
;  308  2069 isreg
;  309  2075 searchname
;  310  2086 gettypes
;  311  2095 istoken
;  312  2103 istoken
;  313  2111 expect
;  314  2118 searchname
;  315  2129 expect
;  316  2136 expect
;  317  2143 gettypes
;  318  2152 error1
;  319  2159 istoken
;  320  2167 error1
;  321  2174 prs
;  322  2178 prs
;  323  2182 prs
;  324  2186 v
;  325  2188 istoken
;  326  2196 error1
;  327  2203 prs
;  328  2207 prs
;  329  2211 prs
;  330  2215 v
;  331  2217 istoken
;  332  2225 compoundass
;  333  2237 istoken
;  334  2245 compoundass
;  335  2257 istoken
;  336  2265 compoundass
;  337  2277 istoken
;  338  2285 compoundass
;  339  2297 istoken
;  340  2305 error1
;  341  2312 istoken
;  342  2320 error1
;  343  2327 istoken
;  344  2335 expr
;  345  2340 doassign
;  346  2349 dovar1
;  347  2356 istoken
;  348  2364 rterm
;  349  2370 istoken
;  350  2378 rterm
;  351  2384 istoken
;  352  2392 rterm
;  353  2398 istoken
;  354  2406 rterm
;  355  2412 istoken
;  356  2420 rterm
;  357  2426 istoken
;  358  2434 rterm
;  359  2440 istoken
;  360  2448 domul
;  361  2454 istoken
;  362  2462 doidiv
;  363  2469 istoken
;  364  2477 domod
;  365  2483 isrelational
;  366  2496 rterm
;  367  2502 cmpneg
;  368  2509 error1
;  369  2516 prnl
;  370  2521 prs
;  371  2525 prs
;  372  2529 gettypes
;  373  2538 prs
;  374  2542 prs
;  375  2546 v
;  376  2548 prs
;  377  2552 expect
;  378  2559 prunsign1
;  379  2569 gettypes
;  380  2578 prs
;  381  2582 v
;  382  2584 prnl
;  383  2589 prs
;  384  2593 prs
;  385  2597 prs
;  386  2601 prnl
;  387  2606 prs
;  388  2610 prs
;  389  2614 a
;  390  2616 prs
;  391  2620 v
;  392  2622 prs
;  393  2626 prs
;  394  2630 prs
;  395  2634 prs
;  396  2638 prs
;  397  2642 prc
;  398  2646 printName
;  399  2656 prs
;  400  2660 prnl
;  401  2665 prs
;  402  2669 prs
;  403  2673 prs
;  404  2677 prs
;  405  2681 v
;  406  2683 istoken
;  407  2691 prnl
;  408  2696 prs
;  409  2700 prs
;  410  2704 prs
;  411  2708 prs
;  412  2712 prunsign1
;  413  2722 typeName
;  414  2731 searchname
;  415  2742 istoken
;  416  2750 searchname
;  417  2761 expect
;  418  2768 expect
;  419  2775 gettypes
;  420  2784 error1
;  421  2791 eqstr
;  422  2797 dovar1
;  423  2804 eqstr
;  424  2810 doreg
;  425  2816 eqstr
;  426  2822 doreg
;  427  2828 eqstr
;  428  2834 doreg
;  429  2840 eqstr
;  430  2846 doreg
;  431  2852 eqstr
;  432  2858 doreg
;  433  2864 eqstr
;  434  2870 doreg
;  435  2876 eqstr
;  436  2882 doreg
;  437  2888 eqstr
;  438  2894 doreg
;  439  2900 eqstr
;  440  2906 doreg
;  441  2912 eqstr
;  442  2918 doreg
;  443  2924 eqstr
;  444  2930 doreg
;  445  2936 eqstr
;  446  2942 doreg
;  447  2948 eqstr
;  448  2954 doreg
;  449  2960 eqstr
;  450  2966 doreg
;  451  2972 eqstr
;  452  2978 doreg
;  453  2984 expect
;  454  2991 prs
;  455  2995 prs
;  456  2999 prs
;  457  3003 istoken
;  458  3011 prunsign1
;  459  3021 istoken
;  460  3029 searchname
;  461  3040 v
;  462  3042 error1
;  463  3049 gettypes
;  464  3058 prs
;  465  3062 v
;  466  3064 prs
;  467  3068 prs
;  468  3072 prs
;  469  3076 a
;  470  3078 prs
;  471  3082 prs
;  472  3086 prunsign1
;  473  3096 v
;  474  3098 prs
;  475  3102 prs
;  476  3106 printName
;  477  3116 prs
;  478  3120 prs
;  479  3124 prs
;  480  3128 prs
;  481  3132 v
;  482  3134 prs
;  483  3138 prs
;  484  3142 prs
;  485  3146 v
;  486  3148 prs
;  487  3152 prs
;  488  3156 prs
;  489  3160 v
;  490  3162 prs
;  491  3166 rterm
;  492  3172 istoken
;  493  3180 prs
;  494  3184 prunsign1
;  495  3194 prs
;  496  3198 error1
;  497  3205 istoken
;  498  3213 prs
;  499  3217 prunsign1
;  500  3227 prs
;  501  3231 prs
;  502  3235 typeName
;  503  3244 searchname
;  504  3255 error1
;  505  3262 gettypes
;  506  3271 error1
;  507  3278 error1
;  508  3285 prs
;  509  3289 v
;  510  3291 prs
;  511  3295 prs
;  512  3299 doidiv
;  513  3306 prs
;  514  3310 checknamelen
;  515  3323 strcpy
;  516  3330 storecall
;  517  3340 expect
;  518  3347 istoken
;  519  3355 error1
;  520  3362 istoken
;  521  3370 istoken
;  522  3378 eprs
;  523  3383 eprs
;  524  3388 eprc
;  525  3393 eprnum
;  526  3400 eprs
;  527  3405 eprc
;  528  3410 eprs
;  529  3415 eprc
;  530  3420 eprs
;  531  3425 istoken
;  532  3433 name1
;  533  3439 searchname
;  534  3450 istoken
;  535  3458 checkreg
;  536  3467 searchname
;  537  3478 error1
;  538  3485 istoken
;  539  3493 expect
;  540  3500 prs
;  541  3504 pint1
;  542  3510 prs
;  543  3514 prs
;  544  3518 prc
;  545  3522 pint1
;  546  3528 prs
;  547  3532 v
;  548  3534 prs
;  549  3538 gettypes
;  550  3547 prs
;  551  3551 v
;  552  3553 prs
;  553  3557 v
;  554  3559 prs
;  555  3563 prs
;  556  3567 printreg
;  557  3576 prs
;  558  3580 prs
;  559  3584 prs
;  560  3588 pint1
;  561  3594 getarg
;  562  3601 setblock
;  563  3610 error1
;  564  3617 allocmem
;  565  3626 error1
;  566  3633 getfirstchar
;  567  3646 parse
;  568  3652 checkcalls
;  569  3663 epilog
;  570  3670 fgets1
;  571  3677 cputs
;  572  3683 cputs
;  573  3689 readRL
;  574  3696 prnl
;  575  3701 strcpy
;  576  3708 instr2
;  577  3715 strcat1
;  578  3723 toupper
;  579  3731 strcpy
;  580  3738 strlen
;  581  3745 openR
;  582  3751 cputs
;  583  3757 cputs
;  584  3763 exitR
;  585  3769 creatR
;  586  3776 cputs
;  587  3782 cputs
;  588  3788 exitR
;  589  3794 prs
;  590  3798 prs
;  591  3802 prs
;  592  3806 pint1
;  593  3812 prs
;  594  3816 prs
;  595  3820 prs
;  596  3824 prs
;  597  3828 prs
;  598  3832 prs
;  599  3836 prs
;  600  3840 getlex
;  601  3847 istoken
;  602  3855 istoken
;  603  3863 dodefine
;  604  3872 istoken
;  605  3880 doinclude
;  606  3890 error1
;  607  3897 typeName
;  608  3906 dofunc
;  609  3913 doglob
;  610  3920 prs
;  611  3924 from_far
;  612  3933 adrF
;  613  3938 eqstr
;  614  3944 prs
;  615  3948 prs
;  616  3952 prs
;  617  3956 printint51
;  618  3967 error1
;  619  3974 prs
;  620  3978 prs
;  621  3982 prs
;  622  3986 openR
;  623  3992 prs
;  624  3996 prs
;  625  4000 error1
;  626  4007 parse
;  627  4013 prs
;  628  4017 prs
;  629  4021 getfirstchar
;  630  4034 getlex
;  631  4041 eqstr
;  632  4047 getlex
;  633  4054 eqstr
;  634  4060 getlex
;  635  4067 prs
;  636  4071 strcpy
;  637  4078 prs
;  638  4082 error1
;  639  4089 getlex
;  640  4096 expect
;  641  4103 error1
;  642  4110 strlen
;  643  4117 error1
;  644  4124 adrofname
;  645  4134 strcpy
;  646  4141 expect
;  647  4148 istoken
;  648  4156 istoken
;  649  4164 stmt
;  650  4169 istoken
;  651  4177 doif
;  652  4182 istoken
;  653  4190 dodo
;  654  4195 istoken
;  655  4203 dowhile
;  656  4211 istoken
;  657  4219 prs
;  658  4223 name1
;  659  4229 prs
;  660  4233 expect
;  661  4240 prs
;  662  4244 next
;  663  4249 prc
;  664  4253 next
;  665  4258 getlex
;  666  4265 istoken
;  667  4273 prs
;  668  4277 next
;  669  4282 prc
;  670  4286 next
;  671  4291 getlex
;  672  4298 error1
;  673  4305 istoken
;  674  4313 doemit
;  675  4320 istoken
;  676  4328 istoken
;  677  4336 exprstart
;  678  4346 prs
;  679  4350 expect
;  680  4357 prs
;  681  4361 prs
;  682  4365 prc
;  683  4369 expect
;  684  4376 expect
;  685  4383 exprstart
;  686  4393 expect
;  687  4400 prs
;  688  4404 getlex
;  689  4411 prunsign1
;  690  4421 getlex
;  691  4428 prc
;  692  4432 expect
;  693  4439 prs
;  694  4443 prs
;  695  4447 prs
;  696  4451 prs
;  697  4455 prs
;  698  4459 prunsign1
;  699  4469 prs
;  700  4473 prs
;  701  4477 prunsign1
;  702  4487 prs
;  703  4491 prs
;  704  4495 prs
;  705  4499 error1
;  706  4506 prs
;  707  4510 prs
;  708  4514 pint1
;  709  4520 prc
;  710  4524 prs
;  711  4528 prs
;  712  4532 pint1
;  713  4538 pexpr
;  714  4544 pint1
;  715  4550 stmt
;  716  4555 istoken
;  717  4563 prjump
;  718  4570 prlabel
;  719  4578 stmt
;  720  4583 prlabel
;  721  4591 prlabel
;  722  4599 prlabel
;  723  4607 stmt
;  724  4612 expect
;  725  4619 pexpr
;  726  4625 pint1
;  727  4631 prjump
;  728  4638 prlabel
;  729  4646 prlabel
;  730  4654 pexpr
;  731  4660 pint1
;  732  4666 stmt
;  733  4671 prjump
;  734  4678 prlabel
;  735  4686 getlex
;  736  4693 next
;  737  4698 next
;  738  4703 next
;  739  4708 next
;  740  4713 next
;  741  4718 next
;  742  4723 next
;  743  4728 next
;  744  4733 next
;  745  4738 next
;  746  4743 next
;  747  4748 next
;  748  4753 next
;  749  4758 next
;  750  4763 next
;  751  4768 instr1
;  752  4775 next
;  753  4780 getlex
;  754  4787 next
;  755  4792 next
;  756  4797 getlex
;  757  4804 getstring
;  758  4814 digit
;  759  4820 getdigit
;  760  4829 next
;  761  4834 next
;  762  4839 next
;  763  4844 letter
;  764  4851 strcpy
;  765  4858 letter
;  766  4865 next
;  767  4870 eqstr
;  768  4876 eqstr
;  769  4882 eqstr
;  770  4888 eqstr
;  771  4894 eqstr
;  772  4900 eqstr
;  773  4906 eqstr
;  774  4912 eqstr
;  775  4918 eqstr
;  776  4924 eqstr
;  777  4930 eqstr
;  778  4936 eqstr
;  779  4942 eqstr
;  780  4948 eqstr
;  781  4954 eqstr
;  782  4960 eqstr
;  783  4966 eqstr
;  784  4972 convertdefine
;  785  4986 strcpy
;  786  4993 error1
;  787  5000 adrofname
;  788  5010 eqstr
;  789  5016 next
;  790  5021 letter
;  791  5028 next
;  792  5033 digit
;  793  5039 next
;  794  5044 next
;  795  5049 next
;  796  5054 fgets1
;  797  5061 getlex
;  798  5068 istoken
;  799  5076 prs
;  800  5080 listproc
;  801  5089 prs
;  802  5093 pint1
;  803  5099 error1
;  804  5106 eprc
;  805  5111 writetty
;  806  5120 writetty
;  807  5129 fputcR
;  808  5136 prc
;  809  5140 prs
;  810  5144 prc
;  811  5148 eprc
;  812  5153 mkneg
;  813  5159 eprnum
;  814  5166 eprc
;  815  5171 prc
;  816  5175 mkneg
;  817  5181 pint1
;  818  5187 prc
;  819  5191 prunsign1
;  820  5201 prc
;  821  5205 prc
;  822  5209 prc
;  823  5213 prc
;  824  5217 prc
;  825  5221 prunsign1
;  826  5231 printinputline
;  827  5246 readR
;  828  5252 prs
;  829  5256 prunsign1
;  830  5266 prc
;  831  5270 prscomment
;  832  5281 fcloseR
;  833  5289 fcloseR
;  834  5297 exitR
;  835  5303 prnl
;  836  5308 prscomment
;  837  5319 prs
;  838  5323 prunsign1
;  839  5333 prs
;  840  5337 prs
;  841  5341 prs
;  842  5345 pint1
;  843  5351 prs
;  844  5355 prunsign1
;  845  5365 prs
;  846  5369 prc
;  847  5373 prs
;  848  5377 pint1
;  849  5383 prs
;  850  5387 prs
;  851  5391 end1
;  852  5396 prs
;  853  5400 prs
;  854  5404 prs
;  855  5408 prunsign1
;  856  5418 prs
;  857  5422 listvar
;  858  5430 prs
;  859  5434 printint51
;  860  5445 prc
;  861  5449 prs
;  862  5453 prs
;  863  5457 prs
;  864  5461 prs
;  865  5465 prs
;  866  5469 prs
;  867  5473 prs
;  868  5477 prs
;  869  5481 prs
;  870  5485 printint51
;  871  5496 printint51
;  872  5507 prs
;  873  5511 prs
;  874  5515 prc
;  875  5519 adrofname
;  876  5529 prs
;  877  5533 prc
;  878  5537 prunsign1
;  879  5547 prc
;  880  5551 prunsign1
;  881  5561 prc
;  882  5565 prs
;  883  5569 prc
;  884  5573 pint1
;  885  5579 prs
;  886  5583 calllisting
;  887  5595 prs
;  888  5599 printint51
;  889  5610 prc
;  890  5614 prs
;  891  5618 printint51
;  892  5629 prc
;  893  5633 from_far
;  894  5642 prs
;  895  5646 adrF
;  896  5651 from_far
;  897  5660 eqstr
;  898  5666 prs
;  899  5670 countcalls
;  900  5681 funclisting
;  901  5693 prs
;  902  5697 printint51
;  903  5708 printint51
;  904  5719 prs
;  905  5723 printint51
;  906  5734 prc
;  907  5738 prs
;  908  5742 prs
;  909  5746 prs
;  910  5750 prs
;  911  5754 prc
;  912  5758 prc
;  913  5762 adrF
;  914  5767 prs
;  915  5771 strcpy
;  916  5778 storefunc
;  917  5788 prs
;  918  5792 prs
;  919  5796 listvar
;  920  5804 listfunc
;  921  5813 listcall
;  922  5822 prs
;  923  5826 prs
;  924  5830 prs
;  925  5834 prs
;  926  5838 prs
;  927  5842 printint51
;  928  5853 prs
;  929  5857 printint51
;  930  5868 prs
;  931  5872 printint51
;  932  5883 prs
;  933  5887 printint51
;  934  5898 prs
;  935  5902 printint51
;  936  5913 prs
;  937  5917 printint51
;  938  5928 prs
;  939  5932 printint51
;  940  5943 prs
;  941  5947 printint51
;  942  5958 prs
;  943  5962 printint51
;  944  5973 prs
;  945  5977 printint51
;  946  5988 prs
;  947  5992 printint51
;  948  6003 prs
;  949  6007 printint51
;  950  6018 prs
;  951  6022 prs
;  952  6026 prunsign1
;  953  6036 prs
;  954  6040 printint51
;  955  6051 prs
;  956  6055 prs
;  957  6059 prs
;  958  6063 prs
;  959  6067 printint51
;  960  6078 prs
;  961  6082 printint51
;  962  6093 prs
;  963  6097 printint51
;  964  6108 prs
;  965  6112 end1
;  966  6117 DosInt
;  967  6124 DosInt
;Input: A.C, List: A.S,  Lines: 1003
;Glob. variables:  129 max.:  200
;Functions      :  110 max.:  300
;Calls          :  968 max.: 2000, NameField: 6131 max.:    65535
;Code until     :21830 max.: 30000, free: 8170
;Data (HeapEnd) :53548, resting stacksize: 11987
;Max. Const in 'epilog' :  947 max. 3000, free: 2053