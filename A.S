;PLA compiler A.COM V0.9.6, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA compiler A.COM V0.9.6";//todo: 2. op=reg not recognized

Version1 db "PLA compiler A.COM V0.9.6",0
;-2 #define IDLENMAX       31//max length of names

;-3 #define COLUMNMAX     128//output, input is 100

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

;-23 #define T_INTH        600

;-24 #define T_EQ          806

;-25 #define T_NE          807

;-26 #define T_GE          811

;-27 #define T_LE          824

;-28 #define T_PLUSPLUS   1219

;-29 #define T_MINUSMINUS 1225

;-30 #define T_PLUSASS    1230

;-31 #define T_MINUSASS   1231

;-32 #define T_MULASS     1232

;-33 #define T_DIVASS     1233

;-34 #define T_ANDASS     1234

;-35 #define T_ORASS      1235

;-36 #define T_LESSLESS   1240

;-37 #define T_GREATGREAT 1241

;-38 

;-39 char isPrint=1;//set screen listing

isPrint db 1
;-40 unsigned int ORGDATAORIG=25000;//start of arrays, end of text

ORGDATAORIG dw 25000
;-41 unsigned int orgData;//actual max of array, must be less than stack

orgData dw 0
;-42 #define COMAX        3000

;-43 char co[COMAX];//constant storage

section .bss
absolute 25000
co resb 3000
section .text
;-44 int maxco=0;

maxco dw 0
;-45 int maxco1=0;

maxco1 dw 0
;-46 #define CMDLENMAX      67

;-47 char symbol[COLUMNMAX];

section .bss
absolute 28000
symbol resb 128
section .text
;-48 char fname[CMDLENMAX];

section .bss
absolute 28128
fname resb 67
section .text
;-49 char namein[CMDLENMAX];

section .bss
absolute 28195
namein resb 67
section .text
;-50 char namelst[CMDLENMAX];

section .bss
absolute 28262
namelst resb 67
section .text
;-51 char *cloc=0;

cloc dw 0
;-52 int fdin=0;

fdin dw 0
;-53 int fdout=0;

fdout dw 0
;-54 int token=0;

token dw 0
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
;-60 int nlabel=0;‚

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
;-66 #define VARMAX        400//max global and local var

;-67 #define LSTART        300//max global var

;-68 #define GNAMEMAX    12800// 32*VARMAX

;-69 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 28329
GType resb 400
section .text
;-70 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 28729
GSign resb 400
section .text
;-71 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 29129
GWidth resb 400
section .text
;-72 int GData [VARMAX];

section .bss
absolute 29529
GData resw 400
section .text
;-73 char GNameField[GNAMEMAX];

section .bss
absolute 30329
GNameField resb 12800
section .text
;-74 int GTop=1;

GTop dw 1
;-75 int LTop=LSTART;

LTop dw 300
;-76 #define FUNCMAX       300//max functions

;-77 #define FNAMEMAX     9600// 32*FUNCMAX

;-78 char FNameField[FNAMEMAX];

section .bss
absolute 43129
FNameField resb 9600
section .text
;-79 int  FTop=0;

FTop dw 0
;-80 char fgetsdest[COLUMNMAX];

section .bss
absolute 52729
fgetsdest resb 128
section .text
;-81 unsigned char *fgetsp=0;

fgetsp dw 0
;-82 unsigned int lineno=1;

lineno dw 1
;-83 unsigned char *pt=0;

pt dw 0
;-84 unsigned char *p1=0;

p1 dw 0
;-85 int DOS_ERR=0;

DOS_ERR dw 0
;-86 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-87 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-88 int ireg1;

ireg1 dw 0
;-89 int mod2;

mod2 dw 0
;-90 int ireg2;

ireg2 dw 0
;-91 

;-92 int writetty()     {//char in AL


writetty: PROC
;-93     ah=0x0E;

 mov  ah, 14
;-94     asm push bx

 push bx
;-95     bx=0;     //page in BH

 mov  bx, 0
;-96     inth 0x10;

 int  16
;-97     asm pop bx

 pop bx
;-98 }

;-99 int putch(char c)  {

 ret
ENDP

putch: PROC
;-100     if (c==10)  {// LF

;Function : putch, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-101         al=13;   // CR, write CR first and then LF

 mov  al, 13
;-102         writetty();

 call writetty
;-103     }

;-104     al=c;

.putch1:
 mov  al, [bp+4]
;-105     writetty();

 call writetty
;-106 }

;-107 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-108     char c;

;-109     while(*s) {

;Function : cputs, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign byte c = bp-2;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
;-110         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-111         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-112         s++;

 inc  word[bp+4]
;-113     }

;-114 }

 jmp .cputs2
.cputs3:
;-115 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-116     n; // ax=n;

;Function : mkneg, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
;-117     asm neg ax

 neg ax
;-118 }

;-119 

;-120 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-121     inth 0x21;

 int  33
;-122     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-123     DOS_ERR++;

 inc  word[DOS_ERR]
;-124 }

;-125 int openR (char *s) {

 ret
ENDP

openR: PROC
;-126     asm mov dx, [bp+4]; dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-127     asm mov ax, 15618; ax=0x3D02;

 mov ax, 15618; ax=0x3D02;
;-128     DosInt();

 call DosInt
;-129 }

;-130 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-131     asm mov dx, [bp+4]; dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-132     asm mov cx, 0

 mov cx, 0
;-133     asm mov ax, 15360; ax=0x3C00;

 mov ax, 15360; ax=0x3C00;
;-134     DosInt();

 call DosInt
;-135 }

;-136 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-137     asm mov bx, [bp+4]; bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;300 var sign word fd = bp+4;
 ENTER  0,0
 mov bx, [bp+4]; bx=fd;
;-138     asm mov ax, 15872; ax=0x3E00;

 mov ax, 15872; ax=0x3E00;
;-139     DosInt();

 call DosInt
;-140 }

;-141 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-142     asm mov ah, 76; ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov ah, 76; ah=0x4C;
;-143     asm mov al, [bp+4]; al=c;

 mov al, [bp+4]; al=c;
;-144     DosInt();

 call DosInt
;-145 }

;-146 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-147     asm mov dx, [bp+4]; dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign word fd = bp+6
;302 var sign word len = bp+8;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-148     asm mov cx, [bp+8]; cx=len;

 mov cx, [bp+8]; cx=len;
;-149     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-150     asm mov ax, 16128;  ax=0x3F00;

 mov ax, 16128;  ax=0x3F00;
;-151     DosInt();

 call DosInt
;-152 }

;-153 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-154     asm lea dx, [bp+4]; *n  todo: why not mov ?????

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte n = bp+4
;301 var sign word fd = bp+6;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov ?????
;-155     asm mov cx, 1;      cx=1;

 mov cx, 1;      cx=1;
;-156     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-157     asm mov ax, 16384;  ax=0x4000;

 mov ax, 16384;  ax=0x4000;
;-158     DosInt();

 call DosInt
;-159 }

;-160 

;-161 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-162       if (c=='_') return 1;

;Function : letter, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-163       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-164       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-165       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-166       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-167       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-168       if (c> 'Z') { if (c< 'a') return 0; }

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
;-169       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-170 }

;-171 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-172       if(c<'0') return 0;

;Function : digit, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-173       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-174       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-175 }

;-176 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-177     if (digit (c)) return 1;

;Function : alnum, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
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
;-178     if (letter(c)) return 1;

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
;-179     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-180 }

;-181 

;-182 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-183     c=0;

;Function : strlen, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign word c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-184     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-185     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-186 }

;-187 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-188     do { *s=*t; s++; t++; }

;Function : strcpy, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 ptr sign byte t = bp+6;
 ENTER  0,0
.strcpy18:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]
;-189     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-190     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-191     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-192 }

;-193 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-194     while(*p) {

;Function : eqstr, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte p = bp+4
;301 ptr sign byte q = bp+6;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21
;-195         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-196         p++;

.eqstr22:
 inc  word[bp+4]
;-197         q++;

 inc  word[bp+6]
;-198     }

;-199     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-200     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-201 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-202     while (*s != 0) s++;

;Function : strcat1, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 ptr sign byte t = bp+6;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]
;-203     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-204 }

;-205 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-206     while(*s) {

;Function : toupper, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27
;-207         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-208         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-209     }

;-210 }

 jmp .toupper26
.toupper27:
;-211 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-212     while(*s) {

;Function : instr1, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign byte c = bp+6;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131
;-213         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-214         s++;

.instr132:
 inc  word[bp+4]
;-215     }

;-216     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-217 }

;-218 

;-219 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-220     *cloc=c;

;Function : eprc, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-221     cloc++;

 inc  word[cloc]
;-222 }

;-223 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-224     char c;

;-225     while(*s) {

;Function : eprs, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign byte c = bp-2;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34
;-226         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-227         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-228         s++;

 inc  word[bp+4]
;-229     }

;-230 }

 jmp .eprs33
.eprs34:
;-231 

;-232 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-233     if (isPrint) {

;Function : prc, Number local Var: 1
; # type sign width local variables
;300 var unsg byte c = bp+4;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-234         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-235             asm mov ax, 13

 mov ax, 13
;-236             writetty();

 call writetty
;-237         }

;-238         asm mov al, [bp+4]; al=c;

.prc36:
 mov al, [bp+4]; al=c;
;-239         writetty();

 call writetty
;-240     }

;-241     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-242 }

;-243 

;-244 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-245     unsigned char c;

;-246     while(*s){

;Function : prscomment, Number local Var: 2
; # type sign width local variables
;300 ptr unsg byte s = bp+4
;301 var unsg byte c = bp-2;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38
;-247         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-248         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-249         s++;

 inc  word[bp+4]
;-250     }

;-251 }

 jmp .prscomment37
.prscomment38:
;-252 

;-253 int printstring(unsigned char *s) {

 LEAVE
 ret
ENDP

printstring: PROC
;-254     unsigned char c; int com;

;-255     com=0;

;Function : printstring, Number local Var: 3
; # type sign width local variables
;300 ptr unsg byte s = bp+4
;301 var unsg byte c = bp-2
;302 var sign word com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-256     while(*s) {

.printstring39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .printstring40
;-257         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-258         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .printstring41
 mov ax, [bp-4]
 or  al, al
 je .printstring42
 mov ax, 0
 mov [bp-4], ax
;-259                    else com=1;

 jmp .printstring43
.printstring42:
 mov ax, 1
 mov [bp-4], ax
;-260         if (c==92) {

.printstring43:
.printstring41:
 mov al, [bp-2]
 cmp al, 92
 jne .printstring44
;-261             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .printstring45
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
 jne .printstring46
 mov ax, 10
 mov [bp-2], al
;-265                 if (c=='t') c= 9;

.printstring46:
 mov al, [bp-2]
 cmp al, 116
 jne .printstring47
 mov ax, 9
 mov [bp-2], al
;-266             }

.printstring47:
;-267         }

.printstring45:
;-268         prc(c);

.printstring44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-269         s++;

 inc  word[bp+4]
;-270     }

;-271 }

 jmp .printstring39
.printstring40:
;-272 

;-273 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-274     int e;

;-275     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;300 var sign word n = bp+4
;301 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-276         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-277         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-278     }

;-279     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-280         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-281         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-282     }

;-283     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-284     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-285     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-286 }

;-287 

;-288 int printinteger (int n){

 LEAVE
 ret
ENDP

printinteger: PROC
;-289     int e;

;-290     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : printinteger, Number local Var: 2
; # type sign width local variables
;300 var sign word n = bp+4
;301 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .printinteger50
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-291     if (n >= 10) {

.printinteger50:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .printinteger51
;-292         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-293         printinteger(e);

 push word [bp-2]
 call printinteger
 add  sp, 2
;-294     }

;-295     n=n%10;

.printinteger51:
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

;-299 

;-300 int printunsigned(unsigned int n) {

 LEAVE
 ret
ENDP

printunsigned: PROC
;-301     unsigned int e;

;-302     if (n >= 10) {

;Function : printunsigned, Number local Var: 2
; # type sign width local variables
;300 var unsg word n = bp+4
;301 var unsg word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .printunsigned52
;-303         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-304         printunsigned(e);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-305     }

;-306     n = n % 10; /*unsigned mod*/

.printunsigned52:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-307     n += '0';

 add  word[bp+4], 48
;-308     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-309 }

;-310 

;-311 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-312     fcloseR(fdin);

;Function : end1, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-313     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-314     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-315 }

;-316 

;-317 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-318     isPrint=1;

;Function : error1, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-319     lineno--;

 dec  word[lineno]
;-320     printstring("\n ");

 push error1_0
 call printstring
 add  sp, 2
;-321     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-322     printstring(";Line: ");

 push error1_1
 call printstring
 add  sp, 2
;-323     printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-324     printstring(" ************** ERROR: ");

 push error1_2
 call printstring
 add  sp, 2
;-325     printstring(s);

 push word [bp+4]
 call printstring
 add  sp, 2
;-326     printstring("  in column: ");

 push error1_3
 call printstring
 add  sp, 2
;-327     printunsigned(column);

 push word [column]
 call printunsigned
 add  sp, 2
;-328     printstring("\nToken: ");

 push error1_4
 call printstring
 add  sp, 2
;-329     printunsigned(token);

 push word [token]
 call printunsigned
 add  sp, 2
;-330     printstring(", symbol: ");

 push error1_5
 call printstring
 add  sp, 2
;-331     printstring(symbol);

 lea  ax, [symbol]
 push ax
 call printstring
 add  sp, 2
;-332     end1(1);

 push 1
 call end1
 add  sp, 2
;-333 }

;-334 

;-335 int printinputline() {

 LEAVE
 ret
error1_0 db "\n ",0
error1_1 db ";Line: ",0
error1_2 db " ************** ERROR: ",0
error1_3 db "  in column: ",0
error1_4 db "\nToken: ",0
error1_5 db ", symbol: ",0
ENDP

printinputline: PROC
;-336     int col;

;-337     col=0;

;Function : printinputline, Number local Var: 1
; # type sign width local variables
;300 var sign word col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-338     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-339     do {

.printinputline53:
;-340         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-341         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-342         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-343         fgetsp++;

 inc  word[fgetsp]
;-344         col++;

 inc  word[bp-2]
;-345         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-346         }

.printinputline55:
;-347         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-348     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-349         printstring("\n;-");

 push printinputline_1
 call printstring
 add  sp, 2
;-350         printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-351         prc(' ');

 push 32
 call prc
 add  sp, 2
;-352         lineno++;

 inc  word[lineno]
;-353         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-354 }

;-355 

;-356 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-357     char c;

;-358     c=*fgetsp;

;Function : fgets1, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-359     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-360         printinputline();

 call printinputline
;-361         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-362         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-363         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-364         column=0;

 mov ax, 0
 mov word [column], ax
;-365     }

;-366     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-367     column++;

 inc  word[column]
;-368     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-369 }

;-370 

;-371 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-372     char r;

;-373     r = thechar;

;Function : next, Number local Var: 1
; # type sign width local variables
;300 var sign byte r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-374     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-375     return r;

 mov al, [bp-2]
 jmp .retnnext
;-376 }

;-377 

;-378 int adrF(char *s, unsigned int i) {

 .retnnext:
 LEAVE
 ret
ENDP

adrF: PROC
;-379     i << 5;//ax=i*32; IDLENMAX=31!

;Function : adrF, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var unsg word i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 5
;-380     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 
;-381 }

;-382 

;-383 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-384     int j;

;-385     if (i < LSTART) {

;Function : printName, Number local Var: 2
; # type sign width local variables
;300 var unsg word i = bp+4
;301 var sign word j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName59
;-386         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-387         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-388     }

;-389     else {

 jmp .printName60
.printName59:
;-390         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-391         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-392         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2
;-393         printinteger(j);

.printName61:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-394         prc(']');

 push 93
 call prc
 add  sp, 2
;-395     }

;-396 }

.printName60:
;-397 

;-398 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-399     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL
;-400     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63
;-401         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al
;-402         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL
;-403     }

;-404     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL
;-405 }

;-406 

;-407 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 52857
symboltemp resb 80
section .text
;-408 

;-409 int getlex() {


getlex: PROC
;-410     char c; char *p;

;-411     int i; int j;

;-412 g1: c=next();

;Function : getlex, Number local Var: 4
; # type sign width local variables
;300 var sign byte c = bp-2
;301 ptr sign byte p = bp-4
;302 var sign word i = bp-6
;303 var sign word j = bp-8;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-413     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex
;-414     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1
;-415   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex66:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex67
 mov al, [thechar]
 cmp al, 61
 jne .getlex68
 call next
 mov ax, 806
 jmp .retngetlex
.getlex68:
;-416   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex67:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex69
 mov al, [thechar]
 cmp al, 61
 jne .getlex70
 call next
 mov ax, 807
 jmp .retngetlex
.getlex70:
;-417   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex69:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex71
 mov al, [thechar]
 cmp al, 61
 jne .getlex72
 call next
 mov ax, 824
 jmp .retngetlex
.getlex72:
;-418   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex71:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex73
 mov al, [thechar]
 cmp al, 61
 jne .getlex74
 call next
 mov ax, 811
 jmp .retngetlex
.getlex74:
;-419   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex73:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex75
 mov al, [thechar]
 cmp al, 60
 jne .getlex76
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex76:
;-420   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex75:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex77
 mov al, [thechar]
 cmp al, 62
 jne .getlex78
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex78:
;-421   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex77:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex79
 mov al, [thechar]
 cmp al, 43
 jne .getlex80
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex80:
;-422   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex79:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex81
 mov al, [thechar]
 cmp al, 45
 jne .getlex82
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex82:
;-423   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex81:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex83
 mov al, [thechar]
 cmp al, 61
 jne .getlex84
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex84:
;-424   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex83:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex85
 mov al, [thechar]
 cmp al, 61
 jne .getlex86
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex86:
;-425   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex85:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex87
 mov al, [thechar]
 cmp al, 61
 jne .getlex88
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex88:
;-426   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex87:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex89
 mov al, [thechar]
 cmp al, 61
 jne .getlex90
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex90:
;-427   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex89:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex91
 mov al, [thechar]
 cmp al, 61
 jne .getlex92
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex92:
;-428   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex91:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex93
 mov al, [thechar]
 cmp al, 61
 jne .getlex94
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex94:
;-429   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex93:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex95
 mov al, [bp-2]
 jmp .retngetlex
;-430   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96
;-431       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97
;-432           do c=next();

.getlex98:
 call next
 mov [bp-2], al
;-433           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex99
 jmp .getlex98
.getlex99:
 call getlex
 jmp .retngetlex
;-434       }

;-435   }

.getlex97:
;-436   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-437       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101
;-438           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-439           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2
;-440           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2
;-441           c=next();

.getlex103:
 call next
 mov [bp-2], al
;-442           return getlex();

 call getlex
 jmp .retngetlex
;-443       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex
;-444   }

.getlex104:
;-445   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105
;-446       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-447       c=next();

 call next
 mov [bp-2], al
;-448       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107
;-449           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-450           p++;

 inc  word[bp-4]
;-451           c=next();

 call next
 mov [bp-2], al
;-452           }

;-453           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-454       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-455   }

;-456   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108
;-457       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-458       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-459       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al
;-460       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110
;-461           next();

 call next
;-462           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112
;-463               c=next();

 call next
 mov [bp-2], al
;-464               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-465       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-466                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-467                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-468                i=0;

 mov ax, 0
 mov [bp-6], ax
;-469                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-470                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-471            }

;-472        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:
;-473            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-474                c=next();

 call next
 mov [bp-2], al
;-475                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-476                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-477                i=0;

 mov ax, 0
 mov [bp-6], ax
;-478                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-479                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-480            }

;-481        }

 jmp .getlex116
.getlex117:
;-482       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex
;-483   }

;-484   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118
;-485       lexval=next();

 call next
 mov word [lexval], ax
;-486       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119
;-487           lexval=next();

 call next
 mov word [lexval], ax
;-488           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax
;-489           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax
;-490           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax
;-491       }

.getlex122:
;-492       next();

.getlex119:
 call next
;-493       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-494   }

;-495   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-496     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-497     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-498     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-499     p++;

 inc  word[bp-4]
;-500     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125
;-501         c=next();

 call next
 mov [bp-2], al
;-502         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-503         p++;

 inc  word[bp-4]
;-504     }

;-505     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-506     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex
;-507     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex126:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex127
 mov ax, 532
 jmp .retngetlex
;-508     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex127:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex128
 mov ax, 529
 jmp .retngetlex
;-509     if (eqstr(symbol,"int"     )) return T_INT;

.getlex128:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex129
 mov ax, 517
 jmp .retngetlex
;-510     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex129:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 533
 jmp .retngetlex
;-511     if (eqstr(symbol,"inth"    )) return T_INTH;

.getlex130:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 600
 jmp .retngetlex
;-512     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex131:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 530
 jmp .retngetlex
;-513     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex132:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 518
 jmp .retngetlex
;-514     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex133:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 519
 jmp .retngetlex
;-515     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex134:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 520
 jmp .retngetlex
;-516     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex135:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 512
 jmp .retngetlex
;-517     if (eqstr(symbol,"if"      )) return T_IF;

.getlex136:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 513
 jmp .retngetlex
;-518     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex137:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 514
 jmp .retngetlex
;-519     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex138:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 515
 jmp .retngetlex
;-520     if (eqstr(symbol,"do"      )) return T_DO;

.getlex139:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 516
 jmp .retngetlex
;-521     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex140:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 521
 jmp .retngetlex
;-522     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex141:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 511
 jmp .retngetlex
;-523 

;-524     i=0;//convert define to value

.getlex142:
 mov ax, 0
 mov [bp-6], ax
;-525     while (i < GTop) {

.getlex143:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex144
;-526         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-527         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
;-528             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex146
;-529                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-530                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
;-531                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-532             }

;-533         }

.getlex146:
;-534         i++;

.getlex145:
 inc  word[bp-6]
;-535     }

;-536     return T_NAME; } error1("Input item not recognized");

 jmp .getlex143
.getlex144:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_18
 call error1
 add  sp, 2
;-537 }

;-538 

;-539 int istoken(int t) {

 .retngetlex:
 LEAVE
 ret
getlex_0 db "()[]{},;*:%-><=+!&|#?",0
getlex_1 db "signed",0
getlex_2 db "unsigned",0
getlex_3 db "void",0
getlex_4 db "int",0
getlex_5 db "long",0
getlex_6 db "inth",0
getlex_7 db "char",0
getlex_8 db "asm",0
getlex_9 db "__asm",0
getlex_10 db "__emit__",0
getlex_11 db "return",0
getlex_12 db "if",0
getlex_13 db "else",0
getlex_14 db "while",0
getlex_15 db "do",0
getlex_16 db "goto",0
getlex_17 db "define",0
getlex_18 db "Input item not recognized",0
ENDP

istoken: PROC
;-540     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;300 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken147
;-541         token=getlex();

 call getlex
 mov word [token], ax
;-542         return 1;

 mov ax, 1
 jmp .retnistoken
;-543     }

;-544     return 0;

.istoken147:
 mov ax, 0
 jmp .retnistoken
;-545 }

;-546 

;-547 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-548     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;300 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect148
;-549         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-550         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-551         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-552         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-553         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-554     }

;-555 }

.expect148:
;-556 

;-557 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-558     if (i < LSTART) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .v149
 push 91
 call prc
 add  sp, 2
;-559     printName(i);

.v149:
 push word [bp+4]
 call printName
 add  sp, 2
;-560     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v150
 push 93
 call prc
 add  sp, 2
;-561 }

.v150:
;-562 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-563     int i;

;-564     i=strlen(symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;300 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-565     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen151
 push checknamelen_0
 call error1
 add  sp, 2
;-566 }

.checknamelen151:
;-567 

;-568 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-569     unsigned int i; unsigned int j;

;-570     i=LSTART;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;300 var unsg word i = bp-2
;301 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, 300
 mov [bp-2], ax
;-571     while(i<LTop) {

.checkName152:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName153
;-572         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-573         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName154
 mov ax, [bp-2]
 jmp .retncheckName
;-574         i++;

.checkName154:
 inc  word[bp-2]
;-575     }

;-576     i=1;

 jmp .checkName152
.checkName153:
 mov ax, 1
 mov [bp-2], ax
;-577     while(i<GTop) {

.checkName155:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName156
;-578         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-579         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName157
 mov ax, [bp-2]
 jmp .retncheckName
;-580         i++;

.checkName157:
 inc  word[bp-2]
;-581     }

;-582     return 0;

 jmp .checkName155
.checkName156:
 mov ax, 0
 jmp .retncheckName
;-583 }

;-584 

;-585 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-586     unsigned int i;

;-587     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-588     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname158
 push searchname_0
 call error1
 add  sp, 2
;-589     return i;

.searchname158:
 mov ax, [bp-2]
 jmp .retnsearchname
;-590 }

;-591 

;-592 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-593     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1159
 push name1_0
 call error1
 add  sp, 2
;-594     token=getlex();

.name1159:
 call getlex
 mov word [token], ax
;-595 }

;-596 

;-597 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-598     int m; //0=V,1=*,2=&

;-599     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;300 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-600     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 83
 mov byte [issign], al
;-601     if(istoken(T_UNSIGNED)) issign='U';

.typeName160:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 85
 mov byte [issign], al
;-602     iswidth=2;

.typeName161:
 mov ax, 2
 mov byte [iswidth], al
;-603     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 0
 mov byte [iswidth], al
;-604     if(istoken(T_CHAR))     iswidth=1;

.typeName162:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 1
 mov byte [iswidth], al
;-605     if(istoken(T_INT))      iswidth=2;

.typeName163:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 2
 mov byte [iswidth], al
;-606     if(istoken(T_LONG))     iswidth=4;

.typeName164:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 4
 mov byte [iswidth], al
;-607     istype='V';

.typeName165:
 mov ax, 86
 mov byte [istype], al
;-608     m=0;

 mov ax, 0
 mov [bp-2], ax
;-609     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-610     if(istoken('&'))  {istype='&'; m=2;}

.typeName166:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-611     name1();

.typeName167:
 call name1
;-612     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-613 }

;-614 

;-615 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-616     char c;

;-617     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;300 var sign word i = bp+4
;301 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-618     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes168
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes169
.gettypes168:
 mov ax, 0
 mov word [signi], ax
;-619     c=GWidth[i];

.gettypes169:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-620     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-621     wi=0;

 mov ax, 0
 mov word [wi], ax
;-622     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes170
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-623     if (c==2) {widthi=2;wi=2;}

.gettypes170:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes171
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-624     if (c==4) {widthi=4;wi=4;}

.gettypes171:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes172
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-625     c=GType [i];

.gettypes172:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-626     typei=0;

 mov ax, 0
 mov word [typei], ax
;-627     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes173
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-628     if (c=='&')  typei=2;

.gettypes173:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes174
 mov ax, 2
 mov word [typei], ax
;-629     return i;

.gettypes174:
 mov ax, [bp+4]
 jmp .retngettypes
;-630 }

;-631 

;-632 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-633     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal175
 push addlocal_0
 call error1
 add  sp, 2
;-634     if (checkName() != 0) error1("Variable already defined");

.addlocal175:
 call checkName
 cmp ax, 0
 je  .addlocal176
 push addlocal_1
 call error1
 add  sp, 2
;-635     GSign[LTop]=issign;

.addlocal176:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-636     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-637     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-638     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-639     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-640 }

;-641 

;-642 

;-643 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-644        if(iscmp==T_EQ) printstring("\n jne .");         //ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg177
 push cmpneg_0
 call printstring
 add  sp, 2
;-645   else if(iscmp==T_NE) printstring("\n je  .");         //ZF=1

 jmp .cmpneg178
.cmpneg177:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg179
 push cmpneg_1
 call printstring
 add  sp, 2
;-646   else if(iscmp==T_LE) if (ids) printstring("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg180
.cmpneg179:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg181
 mov ax, [bp+4]
 or  al, al
 je .cmpneg182
 push cmpneg_2
 call printstring
 add  sp, 2
;-647                            else printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg183
.cmpneg182:
 push cmpneg_3
 call printstring
 add  sp, 2
;-648   else if(iscmp==T_GE) if (ids){printstring(" ;unsigned : "); printunsigned(ids);

.cmpneg183:
 jmp .cmpneg184
.cmpneg181:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg185
 mov ax, [bp+4]
 or  al, al
 je .cmpneg186
 push cmpneg_4
 call printstring
 add  sp, 2
 push word [bp+4]
 call printunsigned
 add  sp, 2
;-649                                printstring("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call printstring
 add  sp, 2
;-650                            else{printstring(" ;unsigned : "); printunsigned(ids);

 jmp .cmpneg187
.cmpneg186:
 push cmpneg_6
 call printstring
 add  sp, 2
 push word [bp+4]
 call printunsigned
 add  sp, 2
;-651                                printstring("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call printstring
 add  sp, 2
;-652   else if(iscmp=='<' ) printstring("\n jge .");         //          SF =OF

.cmpneg187:
 jmp .cmpneg188
.cmpneg185:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg189
 push cmpneg_8
 call printstring
 add  sp, 2
;-653   else if(iscmp=='>' ) printstring("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg190
.cmpneg189:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg191
 push cmpneg_9
 call printstring
 add  sp, 2
;-654   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg192
.cmpneg191:
 push cmpneg_10
 call error1
 add  sp, 2
;-655 }

.cmpneg192:
.cmpneg190:
.cmpneg188:
.cmpneg184:
.cmpneg180:
.cmpneg178:
;-656 

;-657 int isrelational() {

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
;-658     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational193
 jmp .w
;-659     if (token==T_NE) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational194
 jmp .w
;-660     if (token==T_LE) goto w;

.isrelational194:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational195
 jmp .w
;-661     if (token==T_GE) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational196
 jmp .w
;-662     if (token=='<' ) goto w;

.isrelational196:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational197
 jmp .w
;-663     if (token=='>' ) goto w;

.isrelational197:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational198
 jmp .w
;-664     return 0;

.isrelational198:
 mov ax, 0
 jmp .retnisrelational
;-665 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-666     token=getlex();

 call getlex
 mov word [token], ax
;-667     return 1;

 mov ax, 1
 jmp .retnisrelational
;-668 }

;-669 

;-670 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-671   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg199
 mov ax, 0
 jmp .retncheckreg
;-672   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg199:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 1
 jmp .retncheckreg
.checkreg200:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 3
 jmp .retncheckreg
;-673   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg201:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 5
 jmp .retncheckreg
.checkreg202:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 7
 jmp .retncheckreg
;-674   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg203:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 9
 jmp .retncheckreg
.checkreg204:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 11
 jmp .retncheckreg
;-675   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg205:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 13
 jmp .retncheckreg
.checkreg206:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 15
 jmp .retncheckreg
;-676   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg207:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 17
 jmp .retncheckreg
.checkreg208:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 19
 jmp .retncheckreg
;-677   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg209:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 21
 jmp .retncheckreg
.checkreg210:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 23
 jmp .retncheckreg
;-678   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg211:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 25
 jmp .retncheckreg
.checkreg212:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 27
 jmp .retncheckreg
;-679   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg213:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 29
 jmp .retncheckreg
.checkreg214:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 31
 jmp .retncheckreg
;-680   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg215:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 33
 jmp .retncheckreg
.checkreg216:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 35
 jmp .retncheckreg
;-681   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg217:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 37
 jmp .retncheckreg
.checkreg218:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 39
 jmp .retncheckreg
;-682   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg219:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 41
 jmp .retncheckreg
.checkreg220:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 43
 jmp .retncheckreg
;-683   // (eqstr(symbol,"ip")) return 45;

;-684   if (strlen(symbol) >   3) return 0;

.checkreg221:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg222
 mov ax, 0
 jmp .retncheckreg
;-685   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg222:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 47
 jmp .retncheckreg
.checkreg223:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 50
 jmp .retncheckreg
;-686   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg224:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 53
 jmp .retncheckreg
.checkreg225:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 56
 jmp .retncheckreg
;-687   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg226:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 59
 jmp .retncheckreg
.checkreg227:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 62
 jmp .retncheckreg
;-688   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg228:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 65
 jmp .retncheckreg
.checkreg229:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 68
 jmp .retncheckreg
;-689 //  if (eqstr(symbol,"cr0")) return 71;

;-690   return 0;

.checkreg230:
 mov ax, 0
 jmp .retncheckreg
;-691 }

;-692 

;-693 char printregstr[]

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
ENDP
;-694 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-695 

;-696 int printreg(int i) {


printreg: PROC
;-697     unsigned int k; unsigned char c;

;-698     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp+4
;301 var unsg word k = bp-2
;302 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-699     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-700     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-701     i++;

 inc  word[bp+4]
;-702     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-703     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-704     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-705     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg231
;-706         i++;

 inc  word[bp+4]
;-707         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-708         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-709         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-710         }

;-711 }

.printreg231:
;-712 

;-713 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 52937
ops resb 5
section .text
;-714 int doreg1(int iscmp1) {


doreg1: PROC
;-715     int i;

;-716     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;300 var sign word iscmp1 = bp+4
;301 var sign word i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1232
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-717     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1232:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1233
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-718     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1233:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1234
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-719     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1234:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1235
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-720     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1235:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1236
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-721     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1236:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1237
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-722     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1237:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1238
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-723     if (iscmp1 == 1) {

.doreg1238:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1239
;-724             token=getlex();

 call getlex
 mov word [token], ax
;-725             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1240
 push doreg1_7
 call error1
 add  sp, 2
;-726             strcpy(ops, "cmp");

.doreg1240:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-727         }

;-728     printstring("\n ");

.doreg1239:
 push doreg1_9
 call printstring
 add  sp, 2
;-729     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-730     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-731     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-732     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-733 

;-734     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1241
;-735         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-736         goto reg1;

 jmp .reg1
;-737         }

;-738     mod2=typeName();

.doreg1241:
 call typeName
 mov word [mod2], ax
;-739     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-740     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1242
;-741         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-742         goto reg1;

 jmp .reg1
;-743         }

;-744     i=searchname();

.doreg1242:
 call searchname
 mov [bp-2], ax
;-745     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1243
 push word [bp-2]
 call printName
 add  sp, 2
;-746         else v(i);

 jmp .doreg1244
.doreg1243:
 push word [bp-2]
 call v
 add  sp, 2
;-747 reg1: if (iscmp1 == 1) {

.doreg1244:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1245
;-748     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-749     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-750     expect(')');

 push 41
 call expect
 add  sp, 2
;-751     }

;-752 }

.doreg1245:
;-753 

;-754 int compoundass(char *op, int mode, int id1) {

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
doreg1_9 db "\n ",0
doreg1_10 db "  ",0
doreg1_11 db ", ",0
ENDP

compoundass: PROC
;-755     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;300 ptr sign byte op = bp+4
;301 var sign word mode = bp+6
;302 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass246
 push compoundass_0
 call error1
 add  sp, 2
;-756     printstring("\n ");

.compoundass246:
 push compoundass_1
 call printstring
 add  sp, 2
;-757     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-758     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-759     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-760     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass247
 push compoundass_3
 call printstring
 add  sp, 2
;-761         else printstring("byte");

 jmp .compoundass248
.compoundass247:
 push compoundass_4
 call printstring
 add  sp, 2
;-762     v(id1);

.compoundass248:
 push word [bp+8]
 call v
 add  sp, 2
;-763     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-764     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-765     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-766 }

;-767 

;-768 int dovar1(int mode, int op, int ixarr, int id1) {

 LEAVE
 ret
compoundass_0 db "only scalar variable allowed",0
compoundass_1 db "\n ",0
compoundass_2 db "  ",0
compoundass_3 db "word",0
compoundass_4 db "byte",0
compoundass_5 db ", ",0
ENDP

dovar1: PROC
;-769     gettypes(id1);

;Function : dovar1, Number local Var: 4
; # type sign width local variables
;300 var sign word mode = bp+4
;301 var sign word op = bp+6
;302 var sign word ixarr = bp+8
;303 var sign word id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-770     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1249
;-771         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-772         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-773         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-774         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1250
 push dovar1_2
 call printstring
 add  sp, 2
;-775         if(widthi == 2) printstring(" ax, [bx]");

.dovar1250:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1251
 push dovar1_3
 call printstring
 add  sp, 2
;-776         return;

.dovar1251:
 jmp .retndovar1
;-777         }

;-778     if (mode==2){// & = adr

.dovar1249:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1252
;-779         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-780         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-781         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-782         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-783         return;

 jmp .retndovar1
;-784         }

;-785     if (ixarr) {//array

.dovar1252:
 mov ax, [bp+8]
 or  al, al
 je .dovar1253
;-786         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-787         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-788         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_7
 call printstring
 add  sp, 2
;-789         printstring("\n ");

.dovar1254:
 push dovar1_8
 call printstring
 add  sp, 2
;-790         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-791         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_9
 call printstring
 add  sp, 2
;-792             else printstring(" al, ");

 jmp .dovar1256
.dovar1255:
 push dovar1_10
 call printstring
 add  sp, 2
;-793         prc('[');

.dovar1256:
 push 91
 call prc
 add  sp, 2
;-794         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-795         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-796         return;

 jmp .retndovar1
;-797         }

;-798     printstring("\n ");

.dovar1253:
 push dovar1_12
 call printstring
 add  sp, 2
;-799     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-800     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1257
 push dovar1_13
 call printstring
 add  sp, 2
;-801     if(wi==2) printstring(" ax, ");

.dovar1257:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_14
 call printstring
 add  sp, 2
;-802     if(wi==4) printstring(" eax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1259
 push dovar1_15
 call printstring
 add  sp, 2
;-803     v(id1);

.dovar1259:
 push word [bp+10]
 call v
 add  sp, 2
;-804 }

;-805 

;-806 int rterm(char *op) {

 .retndovar1:
 LEAVE
 ret
dovar1_0 db "\n mov bx, ",0
dovar1_1 db "\n ",0
dovar1_2 db " al, [bx]\n mov ah, 0",0
dovar1_3 db " ax, [bx]",0
dovar1_4 db "\n ",0
dovar1_5 db " ax, ",0
dovar1_6 db "\n mov bx, ",0
dovar1_7 db "\n shl bx, 1",0
dovar1_8 db "\n ",0
dovar1_9 db " ax, ",0
dovar1_10 db " al, ",0
dovar1_11 db " + bx]",0
dovar1_12 db "\n ",0
dovar1_13 db " al, ",0
dovar1_14 db " ax, ",0
dovar1_15 db " eax, ",0
ENDP

rterm: PROC
;-807     int mode; int opint; int ixarr; int id1;

;-808     if (istoken(T_CONST)) {

;Function : rterm, Number local Var: 5
; # type sign width local variables
;300 ptr sign byte op = bp+4
;301 var sign word mode = bp-2
;302 var sign word opint = bp-4
;303 var sign word ixarr = bp-6
;304 var sign word id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm260
;-809         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-810         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-811         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm261
 push rterm_1
 call printstring
 add  sp, 2
;-812         if (wi==2) printstring(" ax, ");

.rterm261:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm262
 push rterm_2
 call printstring
 add  sp, 2
;-813         if (wi==4) printstring(" eax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm263
 push rterm_3
 call printstring
 add  sp, 2
;-814         printunsigned(lexval);

.rterm263:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-815         return;

 jmp .retnrterm
;-816         }

;-817     mode=typeName();

.rterm260:
 call typeName
 mov [bp-2], ax
;-818     id1=searchname();

 call searchname
 mov [bp-8], ax
;-819     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-820     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm264
;-821         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-822         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-823         expect(']');

 push 93
 call expect
 add  sp, 2
;-824         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-825         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm265
 push rterm_4
 call error1
 add  sp, 2
;-826         }

.rterm265:
;-827     if (eqstr(symbol,"ax")) return;

.rterm264:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm266
 jmp .retnrterm
;-828     opint=op;

.rterm266:
 mov ax, [bp+4]
 mov [bp-4], ax
;-829     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-830 }

;-831 

;-832 int doassign(int mode, int i, int ixarr, int ixconst) {

 .retnrterm:
 LEAVE
 ret
rterm_0 db "\n ",0
rterm_1 db " al, ",0
rterm_2 db " ax, ",0
rterm_3 db " eax, ",0
rterm_4 db "Array index must be int",0
rterm_5 db "ax",0
ENDP

doassign: PROC
;-833     gettypes(i);

;Function : doassign, Number local Var: 4
; # type sign width local variables
;300 var sign word mode = bp+4
;301 var sign word i = bp+6
;302 var sign word ixarr = bp+8
;303 var sign word ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-834     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign267
;-835         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-836         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-837         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign268
 push doassign_1
 call printstring
 add  sp, 2
;-838             else  printstring("\n mov  [bx], al");

 jmp .doassign269
.doassign268:
 push doassign_2
 call printstring
 add  sp, 2
;-839         return;

.doassign269:
 jmp .retndoassign
;-840         }

;-841     if (mode==2) {// & = adr

.doassign267:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign270
;-842         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-843         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-844         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-845         return;

 jmp .retndoassign
;-846         }

;-847     if (ixarr) {

.doassign270:
 mov ax, [bp+8]
 or  al, al
 je .doassign271
;-848         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-849         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign272
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-850             else v(ixarr);

 jmp .doassign273
.doassign272:
 push word [bp+8]
 call v
 add  sp, 2
;-851         if (wi==2) printstring("\n shl bx, 1");

.doassign273:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign274
 push doassign_6
 call printstring
 add  sp, 2
;-852         printstring("\n mov [");

.doassign274:
 push doassign_7
 call printstring
 add  sp, 2
;-853         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-854         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign275
 push doassign_8
 call printstring
 add  sp, 2
;-855             else printstring("+bx], al");

 jmp .doassign276
.doassign275:
 push doassign_9
 call printstring
 add  sp, 2
;-856         return;

.doassign276:
 jmp .retndoassign
;-857         }

;-858     if (wi==1){

.doassign271:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign277
;-859         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-860         if(i<LSTART) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign278
 push doassign_11
 call printstring
 add  sp, 2
;-861         v(i);

.doassign278:
 push word [bp+6]
 call v
 add  sp, 2
;-862         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-863         return;

 jmp .retndoassign
;-864         }

;-865     if (wi==2){

.doassign277:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign279
;-866         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-867         if(i<LSTART) printstring("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign280
 push doassign_14
 call printstring
 add  sp, 2
;-868         v(i);

.doassign280:
 push word [bp+6]
 call v
 add  sp, 2
;-869         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-870         return;

 jmp .retndoassign
;-871         }

;-872     if (wi==4){

.doassign279:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign281
;-873         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-874         if(i<LSTART) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign282
 push doassign_17
 call printstring
 add  sp, 2
;-875         v(i);

.doassign282:
 push word [bp+6]
 call v
 add  sp, 2
;-876         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-877         return;

 jmp .retndoassign
;-878         }

;-879 }

.doassign281:
;-880 

;-881 int domul(int ids) {

 .retndoassign:
 LEAVE
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
;-882     if (ids) rterm("imul");

;Function : domul, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul283
 push domul_0
 call rterm
 add  sp, 2
;-883         else {

 jmp .domul284
.domul283:
;-884         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul285
;-885             printstring("\n mov bx, ");

 push domul_1
 call printstring
 add  sp, 2
;-886             printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-887             printstring("\n mul bx");

 push domul_2
 call printstring
 add  sp, 2
;-888             }

;-889         else error1("with MUL only const number as multipl. allowed");

 jmp .domul286
.domul285:
 push domul_3
 call error1
 add  sp, 2
;-890         }

.domul286:
;-891 }

.domul284:
;-892 

;-893 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multipl. allowed",0
ENDP

doidiv: PROC
;-894     int mode; int id1;

;-895     if (istoken(T_CONST)) {

;Function : doidiv, Number local Var: 3
; # type sign width local variables
;300 var sign word ids = bp+4
;301 var sign word mode = bp-2
;302 var sign word id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv287
;-896         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-897         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-898         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv288
 push doidiv_1
 call printstring
 add  sp, 2
;-899             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv289
.doidiv288:
 push doidiv_2
 call printstring
 add  sp, 2
;-900         }

.doidiv289:
;-901     else {

 jmp .doidiv290
.doidiv287:
;-902         mode=typeName();

 call typeName
 mov [bp-2], ax
;-903         id1=searchname();

 call searchname
 mov [bp-4], ax
;-904         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv291
 push doidiv_3
 call error1
 add  sp, 2
;-905         gettypes(id1);

.doidiv291:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-906         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv292
 push doidiv_4
 call error1
 add  sp, 2
;-907         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv292:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv293
 push doidiv_5
 call error1
 add  sp, 2
;-908         printstring("\n mov bx, ");

.doidiv293:
 push doidiv_6
 call printstring
 add  sp, 2
;-909         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-910         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv294
 push doidiv_7
 call printstring
 add  sp, 2
;-911             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv295
.doidiv294:
 push doidiv_8
 call printstring
 add  sp, 2
;-912     }

.doidiv295:
;-913 }

.doidiv290:
;-914 

;-915 int domod(int ids) {

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
;-916     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-917     printstring("\n mov ax, dx");

 push domod_0
 call printstring
 add  sp, 2
;-918 }

;-919 

;-920 

;-921 int docalltype[10]; int docallvalue[10];

 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 52942
docalltype resw 10
section .text
section .bss
absolute 52962
docallvalue resw 10
section .text
;-922 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name

section .bss
absolute 52982
procname resb 17
section .text
;-923 

;-924 int docall1() {


docall1: PROC
;-925     int i; int narg; int t0; int n0;  int sz32;

;-926     narg=0;

;Function : docall1, Number local Var: 5
; # type sign width local variables
;300 var sign word i = bp-2
;301 var sign word narg = bp-4
;302 var sign word t0 = bp-6
;303 var sign word n0 = bp-8
;304 var sign word sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-927     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-928     checknamelen();

 call checknamelen
;-929     strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-930     expect('(');

 push 40
 call expect
 add  sp, 2
;-931 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1296
;-932 	    do {

.docall1297:
;-933 	        narg++;

 inc  word[bp-4]
;-934 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1298
 push docall1_0
 call error1
 add  sp, 2
;-935 	        t0=0;

.docall1298:
 mov ax, 0
 mov [bp-6], ax
;-936             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1299
;-937                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-938                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-939                 }

;-940             if(istoken(T_STRING)){

.docall1299:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1300
;-941                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-942                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-943                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-944                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-945                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-946                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-947                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-948                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-949                 eprs(symbol);

 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
;-950                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-951                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-952                 nconst++;

 inc  word[nconst]
;-953                 }

;-954             if(istoken('&'))     {

.docall1300:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1301
;-955                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-956                 name1();

 call name1
;-957                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-958                 }

;-959             if(istoken(T_NAME))  {

.docall1301:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1302
;-960 

;-961 

;-962 

;-963                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-964                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-965                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-966                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-967                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1303
 mov ax, 3
 mov [bp-6], ax
;-968 

;-969                 }

.docall1303:
;-970             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1302:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1304
 push docall1_4
 call error1
 add  sp, 2
;-971             docalltype [narg] = t0;

.docall1304:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-972             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-973         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1305
 jmp .docall1297
.docall1305:
;-974 

;-975   	expect(')');

 push 41
 call expect
 add  sp, 2
;-976   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-977     do {

.docall1306:
;-978         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-979         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-980         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1307
;-981             printstring("\n push ");

 push docall1_5
 call printstring
 add  sp, 2
;-982             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-983             }

;-984         if(t0==2){

.docall1307:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1308
;-985             printstring("\n push ");

 push docall1_6
 call printstring
 add  sp, 2
;-986             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-987             prc(95);

 push 95
 call prc
 add  sp, 2
;-988             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-989             }

;-990         if(t0==3){

.docall1308:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1309
;-991             printstring("\n lea  ax, ");

 push docall1_7
 call printstring
 add  sp, 2
;-992             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-993             printstring("\n push ax");

 push docall1_8
 call printstring
 add  sp, 2
;-994             }

;-995         if(t0==4){

.docall1309:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1310
;-996             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-997             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1311
;-998                 printstring("\n push word ");

 push docall1_9
 call printstring
 add  sp, 2
;-999                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1000                 }

;-1001             else {

 jmp .docall1312
.docall1311:
;-1002                 printstring("\n mov al, byte ");

 push docall1_10
 call printstring
 add  sp, 2
;-1003                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1004                 printstring("\n mov ah, 0\n push ax");

 push docall1_11
 call printstring
 add  sp, 2
;-1005                 }

;-1006             }

.docall1312:
;-1007         if(t0==5){

.docall1310:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1313
;-1008             printstring("\n push ");

 push docall1_12
 call printstring
 add  sp, 2
;-1009             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1010             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1314
 mov ax, [bp-10]
 add ax, 2
;-1011             }

.docall1314:
;-1012         i--;

.docall1313:
 dec  word[bp-2]
;-1013         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1315
 jmp .docall1306
.docall1315:
;-1014     }

;-1015 	printstring("\n call ");

.docall1296:
 push docall1_13
 call printstring
 add  sp, 2
;-1016 	printstring(&procname);

 lea  ax, [procname]
 push ax
 call printstring
 add  sp, 2
;-1017 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1316
;-1018 	    printstring("\n add  sp, ");

 push docall1_14
 call printstring
 add  sp, 2
;-1019         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1020         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1021         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1022         }

;-1023 }

.docall1316:
;-1024 

;-1025 

;-1026 int expr() {

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

expr: PROC
;-1027     int mode;   int id1;

;-1028     int ixarr;  int ixconst;

;-1029     int ids;    int isCONST;

;-1030     int i;      unsigned char *p;

;-1031 

;-1032     if (istoken(T_CONST)) {// constant ;

;Function : expr, Number local Var: 8
; # type sign width local variables
;300 var sign word mode = bp-2
;301 var sign word id1 = bp-4
;302 var sign word ixarr = bp-6
;303 var sign word ixconst = bp-8
;304 var sign word ids = bp-10
;305 var sign word isCONST = bp-12
;306 var sign word i = bp-14
;307 ptr unsg byte p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr317
;-1033         printstring("\n mov ax, ");

 push expr_0
 call printstring
 add  sp, 2
;-1034         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1035         return 4;

 mov ax, 4
 jmp .retnexpr
;-1036         }

;-1037     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr317:
 call typeName
 mov [bp-2], ax
;-1038     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1039     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr318
;-1040         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1041         return;

 jmp .retnexpr
;-1042         }

;-1043 

;-1044     if (token=='(')  {

.expr318:
 mov ax, [token]
 cmp ax, 40
 jne .expr319
;-1045         docall1();

 call docall1
;-1046         goto e1;

 jmp .e1
;-1047         }

;-1048 

;-1049     id1=searchname();

.expr319:
 call searchname
 mov [bp-4], ax
;-1050     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1051     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1052     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1053     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1054     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr320
;-1055         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr321
;-1056             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1057             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1058             expect(']');

 push 93
 call expect
 add  sp, 2
;-1059             }

;-1060         else {

 jmp .expr322
.expr321:
;-1061             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1062             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1063             expect(']');

 push 93
 call expect
 add  sp, 2
;-1064             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1065             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr323
 push expr_1
 call error1
 add  sp, 2
;-1066             }

.expr323:
;-1067         }

.expr322:
;-1068     if (istoken(T_PLUSPLUS  )) {

.expr320:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr324
;-1069         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr325
 push expr_2
 call error1
 add  sp, 2
;-1070         printstring("\n inc  ");

.expr325:
 push expr_3
 call printstring
 add  sp, 2
;-1071         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr326
 push expr_4
 call printstring
 add  sp, 2
 jmp .expr327
.expr326:
 push expr_5
 call printstring
 add  sp, 2
;-1072         v(id1);

.expr327:
 push word [bp-4]
 call v
 add  sp, 2
;-1073         goto e1;

 jmp .e1
;-1074         }

;-1075     if (istoken(T_MINUSMINUS)) {

.expr324:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr328
;-1076         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr329
 push expr_6
 call error1
 add  sp, 2
;-1077         printstring("\n dec  ");

.expr329:
 push expr_7
 call printstring
 add  sp, 2
;-1078         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr330
 push expr_8
 call printstring
 add  sp, 2
 jmp .expr331
.expr330:
 push expr_9
 call printstring
 add  sp, 2
;-1079         v(id1);

.expr331:
 push word [bp-4]
 call v
 add  sp, 2
;-1080         goto e1;

 jmp .e1
;-1081         }

;-1082 

;-1083     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr328:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr332
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1
;-1084     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr332:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr333
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1
;-1085     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr333:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr334
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1
;-1086     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr334:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr335
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1087     if (istoken(T_MULASS  )) error1("not implemented");

.expr335:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr336
 push expr_14
 call error1
 add  sp, 2
;-1088     if (istoken(T_DIVASS  )) error1("not implemented");

.expr336:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push expr_15
 call error1
 add  sp, 2
;-1089 

;-1090     if (istoken('=')) {

.expr337:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
;-1091         expr();

 call expr
;-1092         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1093         goto e1;

 jmp .e1
;-1094         }

;-1095     dovar1(mode, "mov", ixarr, id1);

.expr338:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1096 

;-1097 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push expr_17
 call rterm
 add  sp, 2
;-1098     else if (istoken('-')) rterm("sub");

 jmp .expr340
.expr339:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push expr_18
 call rterm
 add  sp, 2
;-1099     else if (istoken('&')) rterm("and");

 jmp .expr342
.expr341:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
 push expr_19
 call rterm
 add  sp, 2
;-1100     else if (istoken('|')) rterm("or" );

 jmp .expr344
.expr343:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr345
 push expr_20
 call rterm
 add  sp, 2
;-1101     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr346
.expr345:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr347
 push expr_21
 call rterm
 add  sp, 2
;-1102     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr348
.expr347:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr349
 push expr_22
 call rterm
 add  sp, 2
;-1103     else if (istoken('*')) domul (ids);

 jmp .expr350
.expr349:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr351
 push word [bp-10]
 call domul
 add  sp, 2
;-1104     else if (istoken('/')) doidiv(ids);

 jmp .expr352
.expr351:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr353
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1105     else if (istoken('%')) domod (ids);

 jmp .expr354
.expr353:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
 push word [bp-10]
 call domod
 add  sp, 2
;-1106     if (isrelational()) {

.expr355:
.expr354:
.expr352:
.expr350:
.expr348:
.expr346:
.expr344:
.expr342:
.expr340:
 call isrelational
 or  al, al
 je .expr356
;-1107         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1108         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1109         }

;-1110     return 0;

.expr356:
 mov ax, 0
 jmp .retnexpr
;-1111 }

;-1112 

;-1113 int pexpr() {//called from if, do, while

 .retnexpr:
 LEAVE
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
;-1114     expect('(');

 push 40
 call expect
 add  sp, 2
;-1115     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1116     if (token==T_NAME) {//todo

 mov ax, [token]
 cmp ax, 256
 jne .pexpr357
;-1117         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1118         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr358
;-1119             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1120             return;

 jmp .retnpexpr
;-1121             }

;-1122         }

.pexpr358:
;-1123 

;-1124     expr();

.pexpr357:
 call expr
;-1125     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr359
 push pexpr_0
 call printstring
 add  sp, 2
;-1126     printstring(fname);

.pexpr359:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1127     expect(')');

 push 41
 call expect
 add  sp, 2
;-1128 }

;-1129 

;-1130 

;-1131 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1132     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1133     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1134     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1135     prc(':');

 push 58
 call prc
 add  sp, 2
;-1136 }

;-1137 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1138     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1139     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1140     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1141 }

;-1142 

;-1143 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1144     int c; char cha;

;-1145     int jdest; int tst; int jtemp;

;-1146     if(istoken('{')) {

;Function : stmt, Number local Var: 5
; # type sign width local variables
;300 var sign word c = bp-2
;301 var sign byte cha = bp-4
;302 var sign word jdest = bp-6
;303 var sign word tst = bp-8
;304 var sign word jtemp = bp-10;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt360
;-1147         while(istoken('}')==0) stmt();

.stmt361:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt362
 call stmt
;-1148         }

 jmp .stmt361
.stmt362:
;-1149     else if(istoken(T_IF)) {

 jmp .stmt363
.stmt360:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt364
;-1150         pexpr();

 call pexpr
;-1151         nlabel++;

 inc  word[nlabel]
;-1152         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1153         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1154         stmt();

 call stmt
;-1155         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt365
;-1156             nlabel++;

 inc  word[nlabel]
;-1157             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1158             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1159             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1160             stmt();

 call stmt
;-1161             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1162         }

;-1163         else prlabel(jdest);

 jmp .stmt366
.stmt365:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1164     }

.stmt366:
;-1165     else if(istoken(T_DO)) {

 jmp .stmt367
.stmt364:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt368
;-1166         nlabel++;

 inc  word[nlabel]
;-1167         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1168         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1169         stmt();

 call stmt
;-1170         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1171         pexpr();

 call pexpr
;-1172         nlabel++;

 inc  word[nlabel]
;-1173         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1174         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1175         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1176          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1177     }

;-1178     else if(istoken(T_WHILE)) {

 jmp .stmt369
.stmt368:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370
;-1179         nlabel++;

 inc  word[nlabel]
;-1180         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1181         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1182         pexpr();

 call pexpr
;-1183         nlabel++;

 inc  word[nlabel]
;-1184         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1185         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1186         stmt();

 call stmt
;-1187         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1188         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1189     }

;-1190     else if(istoken(T_GOTO))  {

 jmp .stmt371
.stmt370:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372
;-1191         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1192         name1();

 call name1
;-1193         printstring(symbol);

 lea  ax, [symbol]
 push ax
 call printstring
 add  sp, 2
;-1194         expect(';');

 push 59
 call expect
 add  sp, 2
;-1195     }

;-1196     else if(token==T_ASM)     {

 jmp .stmt373
.stmt372:
 mov ax, [token]
 cmp ax, 518
 jne .stmt374
;-1197       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1198       c=next();

 call next
 mov [bp-2], ax
;-1199       while(c != '\n') {

.stmt375:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt376
;-1200         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1201         c=next();

 call next
 mov [bp-2], ax
;-1202         };

 jmp .stmt375
.stmt376:
;-1203         token=getlex();

 call getlex
 mov word [token], ax
;-1204     }

;-1205     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt377
.stmt374:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt378
;-1206         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt379
;-1207             printstring("\n"); cha=next();

 push stmt_2
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1208             while(cha!= '}') {

.stmt380:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt381
;-1209                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1210                 cha=next();

 call next
 mov [bp-4], al
;-1211             }

;-1212             token=getlex();

 jmp .stmt380
.stmt381:
 call getlex
 mov word [token], ax
;-1213         } else error1("Curly open expected");

 jmp .stmt382
.stmt379:
 push stmt_3
 call error1
 add  sp, 2
;-1214     }

.stmt382:
;-1215     else if(istoken(T_INTH))  {

 jmp .stmt383
.stmt378:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt384
;-1216         printstring("\n int  ");

 push stmt_4
 call printstring
 add  sp, 2
;-1217         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1218         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1219         expect(';');

 push 59
 call expect
 add  sp, 2
;-1220     }

;-1221     else if(istoken(T_EMIT)) {

 jmp .stmt385
.stmt384:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt386
;-1222       printstring("\n db ");

 push stmt_5
 call printstring
 add  sp, 2
;-1223     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1224       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1225       token=getlex();

 call getlex
 mov word [token], ax
;-1226       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt387
;-1227           prc(',');

 push 44
 call prc
 add  sp, 2
;-1228           goto L1;

 jmp .L1
;-1229       }

;-1230       expect(')');

.stmt387:
 push 41
 call expect
 add  sp, 2
;-1231     }

;-1232     else if(istoken(';'))      { }

 jmp .stmt388
.stmt386:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt389
;-1233     else if(istoken(T_RETURN)) {

 jmp .stmt390
.stmt389:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt391
;-1234         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt392
 call expr
;-1235         printstring("\n jmp .retn");

.stmt392:
 push stmt_6
 call printstring
 add  sp, 2
;-1236         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1237         nreturn++;

 inc  word[nreturn]
;-1238         expect(';');

 push 59
 call expect
 add  sp, 2
;-1239     }

;-1240     else if(thechar==':')      {

 jmp .stmt393
.stmt391:
 mov al, [thechar]
 cmp al, 58
 jne .stmt394
;-1241         printstring("\n."); // Label

 push stmt_7
 call printstring
 add  sp, 2
;-1242         printstring(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1243         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1244         expect(':');

 push 58
 call expect
 add  sp, 2
;-1245     }

;-1246     else  {expr();; expect(';'); }

 jmp .stmt395
.stmt394:
 call expr
 push 59
 call expect
 add  sp, 2
;-1247 }

.stmt395:
.stmt393:
.stmt390:
.stmt388:
.stmt385:
.stmt383:
.stmt377:
.stmt373:
.stmt371:
.stmt369:
.stmt367:
.stmt363:
;-1248 

;-1249 int isvariable() {

 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n int  ",0
stmt_5 db "\n db ",0
stmt_6 db "\n jmp .retn",0
stmt_7 db "\n.",0
ENDP

isvariable: PROC
;-1250     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable396
 jmp .v1
;-1251     if(token==T_UNSIGNED) goto v1;

.isvariable396:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable397
 jmp .v1
;-1252     if(token==T_CHAR)     goto v1;

.isvariable397:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable398
 jmp .v1
;-1253     if(token==T_INT)      goto v1;

.isvariable398:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable399
 jmp .v1
;-1254     if(token==T_LONG)     goto v1;

.isvariable399:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable400
 jmp .v1
;-1255     return 0;

.isvariable400:
 mov ax, 0
 jmp .retnisvariable
;-1256 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1257 }

;-1258 

;-1259 //***************************************************************

;-1260 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1261     unsigned int j;

;-1262     char c;

;-1263     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;300 var unsg word i = bp+4
;301 var unsg word j = bp-2
;302 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1264     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1265     prc(32);

 push 32
 call prc
 add  sp, 2
;-1266     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1267     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar401
 push listvar_1
 call printstring
 add  sp, 2
;-1268     if(c=='*')printstring("ptr ");

.listvar401:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar402
 push listvar_2
 call printstring
 add  sp, 2
;-1269     if(c=='&')printstring("arr ");

.listvar402:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar403
 push listvar_3
 call printstring
 add  sp, 2
;-1270     if(c=='#')printstring("def ");

.listvar403:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar404
 push listvar_4
 call printstring
 add  sp, 2
;-1271     c=GSign [i];

.listvar404:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1272     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar405
 push listvar_5
 call printstring
 add  sp, 2
;-1273     if(c=='U')printstring("unsg ");

.listvar405:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar406
 push listvar_6
 call printstring
 add  sp, 2
;-1274     c=GWidth[i];

.listvar406:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1275     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar407
 push listvar_7
 call printstring
 add  sp, 2
;-1276     if(c== 1)printstring("byte " );

.listvar407:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar408
 push listvar_8
 call printstring
 add  sp, 2
;-1277     if(c== 2)printstring("word " );

.listvar408:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar409
 push listvar_9
 call printstring
 add  sp, 2
;-1278     if(c== 4)printstring("long " );

.listvar409:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar410
 push listvar_10
 call printstring
 add  sp, 2
;-1279     j=i*32;

.listvar410:
 mov ax, [bp+4]
 mov bx, 32
 mul bx
 mov [bp-2], ax
;-1280     pt=&GNameField + j;

 mov ax, GNameField
 add ax, [bp-2]
 mov word [pt], ax
;-1281     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1282     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar411
;-1283         prc('=');

 push 61
 call prc
 add  sp, 2
;-1284         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1285         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1286     }

;-1287     if(GType[i]=='&') {

.listvar411:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar412
;-1288         prc('[');

 push 91
 call prc
 add  sp, 2
;-1289         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1290         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1291         prc(']');

 push 93
 call prc
 add  sp, 2
;-1292     }

;-1293     if (i >= LSTART) {

.listvar412:
 mov ax, [bp+4]
 cmp ax, 300 ;unsigned : 0
 jb  .listvar413
;-1294         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1295         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1296         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar414
 push 43
 call prc
 add  sp, 2
;-1297         printinteger(j);

.listvar414:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1298     }

;-1299 }

.listvar413:
;-1300 

;-1301 int listproc() {

 LEAVE
 ret
listvar_0 db "\n;",0
listvar_1 db "var ",0
listvar_2 db "ptr ",0
listvar_3 db "arr ",0
listvar_4 db "def ",0
listvar_5 db "sign ",0
listvar_6 db "unsg ",0
listvar_7 db "NULL ",0
listvar_8 db "byte ",0
listvar_9 db "word ",0
listvar_10 db "long ",0
listvar_11 db " = bp",0
ENDP

listproc: PROC
;-1302     int i;

;-1303     if (LTop > LSTART) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;300 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 300
 jle .listproc415
;-1304         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1305         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1306         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1307         i=LTop - LSTART;

 mov ax, [LTop]
 sub ax, 300
 mov [bp-2], ax
;-1308         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1309         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1310         i=LSTART;

 mov ax, 300
 mov [bp-2], ax
;-1311         while (i < LTop) {

.listproc416:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc417
;-1312             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1313             i++;

 inc  word[bp-2]
;-1314         }

;-1315     }

 jmp .listproc416
.listproc417:
;-1316 }

.listproc415:
;-1317 

;-1318 int dofunc() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

dofunc: PROC
;-1319     int nloc; int i; unsigned int j;int narg;

;-1320     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;300 var sign word nloc = bp-2
;301 var sign word i = bp-4
;302 var unsg word j = bp-6
;303 var sign word narg = bp-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1321     checknamelen();

 call checknamelen
;-1322     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1323     i=0;

 mov ax, 0
 mov [bp-4], ax
;-1324     while (i < FTop) {

.dofunc418:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc419
;-1325         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax
;-1326         if(eqstr(symbol, j)) error1("Function already defined");

 push word [bp-6]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dofunc420
 push dofunc_0
 call error1
 add  sp, 2
;-1327         i++;

.dofunc420:
 inc  word[bp-4]
;-1328     }

;-1329     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc418
.dofunc419:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc421
 push dofunc_1
 call error1
 add  sp, 2
;-1330     pt=adrF(FNameField, FTop);

.dofunc421:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1331     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1332     FTop++;

 inc  word[FTop]
;-1333     printstring("\n\n");

 push dofunc_2
 call printstring
 add  sp, 2
;-1334     printstring(symbol);

 lea  ax, [symbol]
 push ax
 call printstring
 add  sp, 2
;-1335     printstring(": PROC");

 push dofunc_3
 call printstring
 add  sp, 2
;-1336     expect('(');

 push 40
 call expect
 add  sp, 2
;-1337     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1338     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc422
;-1339         narg=2;

 mov ax, 2
 mov [bp-8], ax
;-1340         do {

.dofunc423:
;-1341             typeName();

 call typeName
;-1342             addlocal();

 call addlocal
;-1343             narg+=2;

 add  word[bp-8], 2
;-1344             GData[LTop]=narg;

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1345             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc424
 add  word[bp-8], 2
;-1346                 LTop++;

.dofunc424:
 inc  word[LTop]
;-1347                 }

;-1348         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc425
 jmp .dofunc423
.dofunc425:
;-1349         expect(')');

 push 41
 call expect
 add  sp, 2
;-1350         }

;-1351 

;-1352     expect('{'); /*body*/

.dofunc422:
 push 123
 call expect
 add  sp, 2
;-1353     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1354     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1355     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1356     while(isvariable()) {

.dofunc426:
 call isvariable
 or  al, al
 je .dofunc427
;-1357         do {

.dofunc428:
;-1358             typeName();

 call typeName
;-1359             checknamelen();

 call checknamelen
;-1360             addlocal();

 call addlocal
;-1361             nloc-=2;

 sub  word[bp-2], 2
;-1362             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc429
 sub  word[bp-2], 2
;-1363             GData[LTop]=nloc;

.dofunc429:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1364             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc430
;-1365                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1366                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1367                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1368                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1369                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1370                 nloc+=2;

 add  word[bp-2], 2
;-1371                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1372             }

;-1373             LTop++;

.dofunc430:
 inc  word[LTop]
;-1374         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc431
 jmp .dofunc428
.dofunc431:
;-1375         expect(';');

 push 59
 call expect
 add  sp, 2
;-1376     }

;-1377     listproc();

 jmp .dofunc426
.dofunc427:
 call listproc
;-1378     if (LTop>LSTART){

 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc432
;-1379         printstring(";\n ENTER  ");

 push dofunc_4
 call printstring
 add  sp, 2
;-1380         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1381         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1382         printstring(",0");

 push dofunc_5
 call printstring
 add  sp, 2
;-1383         }

;-1384 

;-1385     while(istoken('}')==0)  stmt();

.dofunc432:
.dofunc433:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc434
 call stmt
;-1386 

;-1387     if (nreturn) {

 jmp .dofunc433
.dofunc434:
 mov ax, [nreturn]
 or  al, al
 je .dofunc435
;-1388             printstring("\n .retn");

 push dofunc_6
 call printstring
 add  sp, 2
;-1389             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1390             prc(':');

 push 58
 call prc
 add  sp, 2
;-1391         }

;-1392     if (LTop > LSTART) printstring("\n LEAVE");

.dofunc435:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc436
 push dofunc_7
 call printstring
 add  sp, 2
;-1393     printstring("\n ret");

.dofunc436:
 push dofunc_8
 call printstring
 add  sp, 2
;-1394     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1395     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1396     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1397     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc437
 mov ax, [maxco1]
 mov word [maxco], ax
;-1398     printstring("\nENDP");

.dofunc437:
 push dofunc_9
 call printstring
 add  sp, 2
;-1399 }

;-1400 

;-1401 char doglobName[IDLENMAX];

 LEAVE
 ret
dofunc_0 db "Function already defined",0
dofunc_1 db "Function table full",0
dofunc_2 db "\n\n",0
dofunc_3 db ": PROC",0
dofunc_4 db ";\n ENTER  ",0
dofunc_5 db ",0",0
dofunc_6 db "\n .retn",0
dofunc_7 db "\n LEAVE",0
dofunc_8 db "\n ret",0
dofunc_9 db "\nENDP",0
ENDP
section .bss
absolute 52999
doglobName resb 31
section .text
;-1402 int doglob() {


doglob: PROC
;-1403     int i; int j; int isstrarr;

;-1404     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp-2
;301 var sign word j = bp-4
;302 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1405     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .doglob438
 push doglob_0
 call error1
 add  sp, 2
;-1406     if (iswidth == 0) error1("no VOID as var type");

.doglob438:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob439
 push doglob_1
 call error1
 add  sp, 2
;-1407     checknamelen();

.doglob439:
 call checknamelen
;-1408     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob440
 push doglob_2
 call error1
 add  sp, 2
;-1409     if (istoken('[')) {

.doglob440:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob441
;-1410         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1411         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob442
;-1412             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1413             printunsigned(orgData);

 push word [orgData]
 call printunsigned
 add  sp, 2
;-1414             printstring("\n"); printstring(symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call printstring
 add  sp, 2
;-1415             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob443
 push doglob_5
 call printstring
 add  sp, 2
;-1416             if (iswidth==2) printstring(" resw ");

.doglob443:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob444
 push doglob_6
 call printstring
 add  sp, 2
;-1417             if (iswidth==4) printstring(" resd ");

.doglob444:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob445
 push doglob_7
 call printstring
 add  sp, 2
;-1418             printunsigned(lexval);

.doglob445:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1419             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1420             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1421             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob446
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1422             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob446:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob447
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax
;-1423             GData[GTop]=lexval;

.doglob447:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1424             expect(']');

 push 93
 call expect
 add  sp, 2
;-1425         }else {

 jmp .doglob448
.doglob442:
;-1426             expect(']');

 push 93
 call expect
 add  sp, 2
;-1427             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob449
 push doglob_9
 call error1
 add  sp, 2
;-1428             printstring("\n");

.doglob449:
 push doglob_10
 call printstring
 add  sp, 2
;-1429             printstring(symbol);

 lea  ax, [symbol]
 push ax
 call printstring
 add  sp, 2
;-1430             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1431             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1432             strcpy(doglobName, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1433             expect('=');

 push 61
 call expect
 add  sp, 2
;-1434             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob450
;-1435                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1436                 prscomment(symbol);

 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
;-1437                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1438                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1439                 i=strlen(symbol);

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1440                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1441                 }

;-1442             else if (istoken('{' )) {

 jmp .doglob451
.doglob450:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob452
;-1443                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1444                 do {

.doglob453:
;-1445                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob454
 push 44
 call prc
 add  sp, 2
;-1446                     expect(T_CONST);

.doglob454:
 push 257
 call expect
 add  sp, 2
;-1447                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1448                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1449                     }

;-1450                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob455
 jmp .doglob453
.doglob455:
;-1451                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1452             }

;-1453         else error1("String or number array expected");

 jmp .doglob456
.doglob452:
 push doglob_13
 call error1
 add  sp, 2
;-1454         };

.doglob456:
.doglob451:
.doglob448:
;-1455     }else { //expect('=');

 jmp .doglob457
.doglob441:
;-1456         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1457         printstring(symbol);

 lea  ax, [symbol]
 push ax
 call printstring
 add  sp, 2
;-1458         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob458
 push doglob_15
 call printstring
 add  sp, 2
;-1459         else {

 jmp .doglob459
.doglob458:
;-1460             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob460
 push doglob_16
 call printstring
 add  sp, 2
;-1461             else if (iswidth==2) printstring(" dw ");

 jmp .doglob461
.doglob460:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob462
 push doglob_17
 call printstring
 add  sp, 2
;-1462             else                 printstring(" dd ");

 jmp .doglob463
.doglob462:
 push doglob_18
 call printstring
 add  sp, 2
;-1463         }

.doglob463:
.doglob461:
;-1464     if(istoken('-')) prc('-');

.doglob459:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob464
 push 45
 call prc
 add  sp, 2
;-1465     if (istoken('=')) {

.doglob464:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob465
;-1466         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1467         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1468         }else printunsigned(0);

 jmp .doglob466
.doglob465:
 push 0
 call printunsigned
 add  sp, 2
;-1469     }

.doglob466:
;-1470     GSign[GTop]=issign;

.doglob457:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1471     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1472     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1473     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1474     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob467
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1475         else strcpy(pt, symbol);

 jmp .doglob468
.doglob467:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1476     GTop++;

.doglob468:
 inc  word[GTop]
;-1477     expect(';');

 push 59
 call expect
 add  sp, 2
;-1478 }

;-1479 

;-1480 int dodefine() {

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

dodefine: PROC
;-1481     int i; int j; int fdtemp;

;-1482     if (eqstr(symbol, "ORGDATA")) {

;Function : dodefine, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp-2
;301 var sign word j = bp-4
;302 var sign word fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine469
;-1483         token=getlex();

 call getlex
 mov word [token], ax
;-1484         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1485         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1486         return;

 jmp .retndodefine
;-1487     }

;-1488     expect(T_NAME);

.dodefine469:
 push 256
 call expect
 add  sp, 2
;-1489     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine470
;-1490         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine471
 push dodefine_1
 call error1
 add  sp, 2
;-1491         i=strlen(symbol);

.dodefine471:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1492         if (i>IDLENMAX) error1("Define name too long");

 mov ax, [bp-2]
 cmp ax, 31
 jle .dodefine472
 push dodefine_2
 call error1
 add  sp, 2
;-1493         GSign [GTop]='U';

.dodefine472:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1494         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1495         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1496         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1497         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1498         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1499         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1500         GTop++;

 inc  word[GTop]
;-1501     }

;-1502 }

.dodefine470:
;-1503 

;-1504 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name too long",0
ENDP

parse: PROC
;-1505     token=getlex();

 call getlex
 mov word [token], ax
;-1506     do {

.parse473:
;-1507         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse474
 mov ax, 1
 jmp .retnparse
;-1508         if (istoken('#')) {

.parse474:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse475
;-1509              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse476
 call dodefine
;-1510              else error1("define expected");

 jmp .parse477
.parse476:
 push parse_0
 call error1
 add  sp, 2
;-1511         }

.parse477:
;-1512     else{

 jmp .parse478
.parse475:
;-1513         typeName();

 call typeName
;-1514         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse479
 call dofunc
;-1515         else doglob(); }

 jmp .parse480
.parse479:
 call doglob
.parse480:
;-1516     } while(1);

.parse478:
 mov ax, 1
 or  al, al
 je .parse481
 jmp .parse473
.parse481:
;-1517 }

;-1518 

;-1519 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1520 int main() {


main: PROC
;-1521     int arglen1; unsigned int i; char *c;

;-1522     isPrint=1;

;Function : main, Number local Var: 3
; # type sign width local variables
;300 var sign word arglen1 = bp-2
;301 var unsg word i = bp-4
;302 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1523     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1524     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main482
;-1525         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1526         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1527         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1528         }

;-1529     i=arglen1+129;

.main482:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1530     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1531     arglen1--;

 dec  word[bp-2]
;-1532     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1533     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1534     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main483
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4
;-1535     strcpy(namelst, namein);

.main483:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1536     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1537     i--;

 dec  word[bp-4]
;-1538     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1539     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1540 

;-1541     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1542     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main484
;-1543         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1544         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1545         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1546         }

;-1547     fdout=creatR(namelst);

.main484:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1548     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main485
;-1549         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1550         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1551         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1552         }

;-1553     printstring(";");

.main485:
 push main_4
 call printstring
 add  sp, 2
;-1554     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1555     printstring(", Input: "); printstring(namein);

 push main_5
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1556     printstring(", Output: "); printstring(namelst);

 push main_6
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1557     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1558     printstring("\norg  256 \njmp main");

 push main_7
 call printstring
 add  sp, 2
;-1559     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1560     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1561     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1562     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1563     parse();

 call parse
;-1564     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1565     GTop--;

 dec  word[GTop]
;-1566     printstring("\n;Glob. variables:");     printunsigned(GTop);

 push main_8
 call printstring
 add  sp, 2
 push word [GTop]
 call printunsigned
 add  sp, 2
;-1567     printstring(" (");                      printunsigned(LSTART);

 push main_9
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1568     printstring("), Functions:");           printunsigned(FTop);

 push main_10
 call printstring
 add  sp, 2
 push word [FTop]
 call printunsigned
 add  sp, 2
;-1569     printstring(" (");                      printunsigned(FUNCMAX);

 push main_11
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1570     printstring("), Lines:");               printunsigned(lineno);

 push main_12
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1571     printstring("\n;Constant: ");           printunsigned(maxco);

 push main_13
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1572     printstring(" (");                      printunsigned(COMAX);

 push main_14
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1573     i=COMAX;

 mov ax, 3000
 mov [bp-4], ax
;-1574     i=i-maxco;

 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1575     if (i <= 1000)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main486
 push main_15
 call printstring
 add  sp, 2
;-1576     printstring("), stacksize: ");

.main486:
 push main_16
 call printstring
 add  sp, 2
;-1577     i=65536;

 mov ax, 0
 mov [bp-4], ax
;-1578     i=i-orgData;

 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1579     printunsigned(i);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1580     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main487
 push main_17
 call printstring
 add  sp, 2
;-1581     end1(0);

.main487:
 push 0
 call end1
 add  sp, 2
;-1582 }

 LEAVE
 ret
main_0 db " Usage: A.COM in_file[.C]: ",0
main_1 db ".C",0
main_2 db "Source file missing (.C): ",0
main_3 db "list file not creatable: ",0
main_4 db ";",0
main_5 db ", Input: ",0
main_6 db ", Output: ",0
main_7 db "\norg  256 \njmp main",0
main_8 db "\n;Glob. variables:",0
main_9 db " (",0
main_10 db "), Functions:",0
main_11 db " (",0
main_12 db "), Lines:",0
main_13 db "\n;Constant: ",0
main_14 db " (",0
main_15 db "\n ** Warning ** constant area too small",0
main_16 db "), stacksize: ",0
main_17 db "\n *** Warning *** Stack too small",0
ENDP
;Glob. variables:101 (300), Functions:73 (300), Lines:1583
;Constant: 688 (3000), stacksize: 12506