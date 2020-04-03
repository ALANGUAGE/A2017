;PLA compiler A.COM V0.9.6, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA compiler A.COM V0.9.6";//todo:op=reg not recognized

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

;-47 char Symbol[COLUMNMAX];

section .bss
absolute 28000
Symbol resb 128
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
;-66 int isstrarr;

isstrarr dw 0
;-67 

;-68 #define VARMAX        400//max global and local var

;-69 #define LSTART        300//max global var

;-70 #define GNAMEMAX    12800// 32*VARMAX

;-71 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 28329
GType resb 400
section .text
;-72 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 28729
GSign resb 400
section .text
;-73 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 29129
GWidth resb 400
section .text
;-74 int  GData [VARMAX];

section .bss
absolute 29529
GData resw 400
section .text
;-75 int  VarNamesIX[VARMAX];//start of names in VarNames

section .bss
absolute 30329
VarNamesIX resw 400
section .text
;-76 char GNameField[GNAMEMAX];

section .bss
absolute 31129
GNameField resb 12800
section .text
;-77 char doglobName[IDLENMAX];//in doglob

section .bss
absolute 43929
doglobName resb 31
section .text
;-78 #define VARNAMESMAX 4000

;-79 char VarNames[VARNAMESMAX];//Space for global and local var names

section .bss
absolute 43960
VarNames resb 4000
section .text
;-80 char *VarNamePtr;       //first free position

VarNamePtr dw 0
;-81 int GTop=1;

GTop dw 1
;-82 int LTop=LSTART;

LTop dw 300
;-83 

;-84 #define FUNCMAX           300//max functions

;-85 #define FUNCTIONNAMESMAX 3000//Space for preceeding functon names

;-86 char FunctionNames[FUNCTIONNAMESMAX];

section .bss
absolute 47960
FunctionNames resb 3000
section .text
;-87 char *FunctionNamePtr;  //first free position in FunctionNames

FunctionNamePtr dw 0
;-88 int  FunctionMaxIx=0;   //number of functions

FunctionMaxIx dw 0
;-89 

;-90 char fgetsdest[COLUMNMAX];

section .bss
absolute 50960
fgetsdest resb 128
section .text
;-91 unsigned char *fgetsp=0;

fgetsp dw 0
;-92 unsigned int lineno=1;

lineno dw 1
;-93 unsigned char *pt=0;

pt dw 0
;-94 unsigned char *p1=0;

p1 dw 0
;-95 int DOS_ERR=0;

DOS_ERR dw 0
;-96 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-97 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-98 int ireg1;//todo

ireg1 dw 0
;-99 int mod2;

mod2 dw 0
;-100 int ireg2;

ireg2 dw 0
;-101 

;-102 int writetty()     {//char in AL


writetty: PROC
;-103     ah=0x0E;

 mov  ah, 14
;-104     asm push bx

 push bx
;-105     bx=0;     //page in BH

 mov  bx, 0
;-106     inth 0x10;

 int  16
;-107     asm pop bx

 pop bx
;-108 }

;-109 int putch(char c)  {

 ret
ENDP

putch: PROC
;-110     if (c==10)  {// LF

;Function : putch, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-111         al=13;   // CR, write CR first and then LF

 mov  al, 13
;-112         writetty();

 call writetty
;-113     }

;-114     al=c;

.putch1:
 mov  al, [bp+4]
;-115     writetty();

 call writetty
;-116 }

;-117 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-118     char c;

;-119     while(*s) {

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
;-120         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-121         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-122         s++;

 inc  word[bp+4]
;-123     }

;-124 }

 jmp .cputs2
.cputs3:
;-125 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-126     n; // ax=n;

;Function : mkneg, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
;-127     asm neg ax

 neg ax
;-128 }

;-129 

;-130 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-131     inth 0x21;

 int  33
;-132     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-133     DOS_ERR++;

 inc  word[DOS_ERR]
;-134 }

;-135 int openR (char *s) {

 ret
ENDP

openR: PROC
;-136     asm mov dx, [bp+4]; dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-137     asm mov ax, 15618; ax=0x3D02;

 mov ax, 15618; ax=0x3D02;
;-138     DosInt();

 call DosInt
;-139 }

;-140 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-141     asm mov dx, [bp+4]; dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-142     asm mov cx, 0

 mov cx, 0
;-143     asm mov ax, 15360; ax=0x3C00;

 mov ax, 15360; ax=0x3C00;
;-144     DosInt();

 call DosInt
;-145 }

;-146 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-147     asm mov bx, [bp+4]; bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;300 var sign word fd = bp+4;
 ENTER  0,0
 mov bx, [bp+4]; bx=fd;
;-148     asm mov ax, 15872; ax=0x3E00;

 mov ax, 15872; ax=0x3E00;
;-149     DosInt();

 call DosInt
;-150 }

;-151 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-152     asm mov ah, 76; ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov ah, 76; ah=0x4C;
;-153     asm mov al, [bp+4]; al=c;

 mov al, [bp+4]; al=c;
;-154     DosInt();

 call DosInt
;-155 }

;-156 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-157     asm mov dx, [bp+4]; dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign word fd = bp+6
;302 var sign word len = bp+8;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-158     asm mov cx, [bp+8]; cx=len;

 mov cx, [bp+8]; cx=len;
;-159     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-160     asm mov ax, 16128;  ax=0x3F00;

 mov ax, 16128;  ax=0x3F00;
;-161     DosInt();

 call DosInt
;-162 }

;-163 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-164     asm lea dx, [bp+4]; *n  todo: why not mov ?????

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte n = bp+4
;301 var sign word fd = bp+6;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov ?????
;-165     asm mov cx, 1;      cx=1;

 mov cx, 1;      cx=1;
;-166     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-167     asm mov ax, 16384;  ax=0x4000;

 mov ax, 16384;  ax=0x4000;
;-168     DosInt();

 call DosInt
;-169 }

;-170 

;-171 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-172       if (c=='_') return 1;

;Function : letter, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-173       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-174       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-175       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-176       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-177       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-178       if (c> 'Z') { if (c< 'a') return 0; }

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
;-179       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-180 }

;-181 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-182       if(c<'0') return 0;

;Function : digit, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-183       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-184       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-185 }

;-186 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-187     if (digit (c)) return 1;

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
;-188     if (letter(c)) return 1;

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
;-189     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-190 }

;-191 

;-192 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-193     c=0;

;Function : strlen, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign word c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-194     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-195     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-196 }

;-197 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-198     do { *s=*t; s++; t++; }

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
;-199     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-200     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-201     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-202 }

;-203 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-204     while(*p) {

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
;-205         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-206         p++;

.eqstr22:
 inc  word[bp+4]
;-207         q++;

 inc  word[bp+6]
;-208     }

;-209     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-210     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-211 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-212     while (*s != 0) s++;

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
;-213     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-214 }

;-215 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-216     while(*s) {

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
;-217         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-218         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-219     }

;-220 }

 jmp .toupper26
.toupper27:
;-221 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-222     while(*s) {

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
;-223         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-224         s++;

.instr132:
 inc  word[bp+4]
;-225     }

;-226     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-227 }

;-228 

;-229 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-230     *cloc=c;

;Function : eprc, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-231     cloc++;

 inc  word[cloc]
;-232 }

;-233 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-234     char c;

;-235     while(*s) {

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
;-236         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-237         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-238         s++;

 inc  word[bp+4]
;-239     }

;-240 }

 jmp .eprs33
.eprs34:
;-241 

;-242 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-243     if (isPrint) {

;Function : prc, Number local Var: 1
; # type sign width local variables
;300 var unsg byte c = bp+4;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-244         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-245             asm mov ax, 13

 mov ax, 13
;-246             writetty();

 call writetty
;-247         }

;-248         asm mov al, [bp+4]; al=c;

.prc36:
 mov al, [bp+4]; al=c;
;-249         writetty();

 call writetty
;-250     }

;-251     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-252 }

;-253 

;-254 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-255     unsigned char c;

;-256     while(*s){

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
;-257         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-258         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-259         s++;

 inc  word[bp+4]
;-260     }

;-261 }

 jmp .prscomment37
.prscomment38:
;-262 

;-263 int printstring(unsigned char *s) {

 LEAVE
 ret
ENDP

printstring: PROC
;-264     unsigned char c; int com;

;-265     com=0;

;Function : printstring, Number local Var: 3
; # type sign width local variables
;300 ptr unsg byte s = bp+4
;301 var unsg byte c = bp-2
;302 var sign word com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-266     while(*s) {

.printstring39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .printstring40
;-267         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-268         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .printstring41
 mov ax, [bp-4]
 or  al, al
 je .printstring42
 mov ax, 0
 mov [bp-4], ax
;-269                    else com=1;

 jmp .printstring43
.printstring42:
 mov ax, 1
 mov [bp-4], ax
;-270         if (c==92) {

.printstring43:
.printstring41:
 mov al, [bp-2]
 cmp al, 92
 jne .printstring44
;-271             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .printstring45
;-272                 s++;

 inc  word[bp+4]
;-273                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-274                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .printstring46
 mov ax, 10
 mov [bp-2], al
;-275                 if (c=='t') c= 9;

.printstring46:
 mov al, [bp-2]
 cmp al, 116
 jne .printstring47
 mov ax, 9
 mov [bp-2], al
;-276             }

.printstring47:
;-277         }

.printstring45:
;-278         prc(c);

.printstring44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-279         s++;

 inc  word[bp+4]
;-280     }

;-281 }

 jmp .printstring39
.printstring40:
;-282 

;-283 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-284     int e;

;-285     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;300 var sign word n = bp+4
;301 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-286         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-287         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-288     }

;-289     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-290         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-291         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-292     }

;-293     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-294     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-295     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-296 }

;-297 

;-298 int printinteger (int n){

 LEAVE
 ret
ENDP

printinteger: PROC
;-299     int e;

;-300     if(n<0) {  prc('-');  n=mkneg(n); }

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
;-301     if (n >= 10) {

.printinteger50:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .printinteger51
;-302         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-303         printinteger(e);

 push word [bp-2]
 call printinteger
 add  sp, 2
;-304     }

;-305     n=n%10;

.printinteger51:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-306     n += '0';

 add  word[bp+4], 48
;-307     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-308 }

;-309 

;-310 int printunsigned(unsigned int n) {

 LEAVE
 ret
ENDP

printunsigned: PROC
;-311     unsigned int e;

;-312     if (n >= 10) {

;Function : printunsigned, Number local Var: 2
; # type sign width local variables
;300 var unsg word n = bp+4
;301 var unsg word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .printunsigned52
;-313         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-314         printunsigned(e);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-315     }

;-316     n = n % 10; /*unsigned mod*/

.printunsigned52:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-317     n += '0';

 add  word[bp+4], 48
;-318     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-319 }

;-320 

;-321 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-322     fcloseR(fdin);

;Function : end1, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-323     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-324     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-325 }

;-326 

;-327 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-328     isPrint=1;

;Function : error1, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-329     lineno--;

 dec  word[lineno]
;-330     printstring("\n ");

 push error1_0
 call printstring
 add  sp, 2
;-331     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-332     printstring(";Line: ");

 push error1_1
 call printstring
 add  sp, 2
;-333     printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-334     printstring(" ************** ERROR: ");

 push error1_2
 call printstring
 add  sp, 2
;-335     printstring(s);

 push word [bp+4]
 call printstring
 add  sp, 2
;-336     printstring("  in column: ");

 push error1_3
 call printstring
 add  sp, 2
;-337     printunsigned(column);

 push word [column]
 call printunsigned
 add  sp, 2
;-338     printstring("\nToken: ");

 push error1_4
 call printstring
 add  sp, 2
;-339     printunsigned(token);

 push word [token]
 call printunsigned
 add  sp, 2
;-340     printstring(", Symbol: ");

 push error1_5
 call printstring
 add  sp, 2
;-341     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-342     end1(1);

 push 1
 call end1
 add  sp, 2
;-343 }

;-344 

;-345 int printinputline() {

 LEAVE
 ret
error1_0 db "\n ",0
error1_1 db ";Line: ",0
error1_2 db " ************** ERROR: ",0
error1_3 db "  in column: ",0
error1_4 db "\nToken: ",0
error1_5 db ", Symbol: ",0
ENDP

printinputline: PROC
;-346     int col;

;-347     col=0;

;Function : printinputline, Number local Var: 1
; # type sign width local variables
;300 var sign word col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-348     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-349     do {

.printinputline53:
;-350         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-351         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-352         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-353         fgetsp++;

 inc  word[fgetsp]
;-354         col++;

 inc  word[bp-2]
;-355         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-356         }

.printinputline55:
;-357         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-358     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-359         printstring("\n;-");

 push printinputline_1
 call printstring
 add  sp, 2
;-360         printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-361         prc(' ');

 push 32
 call prc
 add  sp, 2
;-362         lineno++;

 inc  word[lineno]
;-363         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-364 }

;-365 

;-366 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-367     char c;

;-368     c=*fgetsp;

;Function : fgets1, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-369     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-370         printinputline();

 call printinputline
;-371         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-372         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-373         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-374         column=0;

 mov ax, 0
 mov word [column], ax
;-375     }

;-376     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-377     column++;

 inc  word[column]
;-378     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-379 }

;-380 

;-381 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-382     char r;

;-383     r = thechar;

;Function : next, Number local Var: 1
; # type sign width local variables
;300 var sign byte r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-384     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-385     return r;

 mov al, [bp-2]
 jmp .retnnext
;-386 }

;-387 

;-388 int searchVarName(){

 .retnnext:
 LEAVE
 ret
ENDP

searchVarName: PROC
;-389 

;-390 }

;-391 

;-392 int storeGlobalVar() {

 ret
ENDP

storeGlobalVar: PROC
;-393     unsigned int i;

;-394     if (GTop >= LSTART) error1("Global table full");

;Function : storeGlobalVar, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp-2;
 ENTER  2,0
 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storeGlobalVar59
 push storeGlobalVar_0
 call error1
 add  sp, 2
;-395     if (isstrarr) VarNamePtr=strcpy(VarNamePtr, doglobName);

.storeGlobalVar59:
 mov ax, [isstrarr]
 or  al, al
 je .storeGlobalVar60
 lea  ax, [doglobName]
 push ax
 push word [VarNamePtr]
 call strcpy
 add  sp, 4
 mov word [VarNamePtr], ax
;-396     else VarNamePtr=strcpy(VarNamePtr, Symbol);

 jmp .storeGlobalVar61
.storeGlobalVar60:
 lea  ax, [Symbol]
 push ax
 push word [VarNamePtr]
 call strcpy
 add  sp, 4
 mov word [VarNamePtr], ax
;-397     i = VarNamePtr - &VarNames;

.storeGlobalVar61:
 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-398     i += IDLENMAX;

 add  word[bp-2], 31
;-399     if (i >= VARNAMESMAX) error1("too many variable name");

 mov ax, [bp-2]
 cmp ax, 4000 ;unsigned : 0
 jb  .storeGlobalVar62
 push storeGlobalVar_1
 call error1
 add  sp, 2
;-400 }

.storeGlobalVar62:
;-401 

;-402 int printVarName() {

 LEAVE
 ret
storeGlobalVar_0 db "Global table full",0
storeGlobalVar_1 db "too many variable name",0
ENDP

printVarName: PROC
;-403 

;-404 }

;-405 

;-406 int adrF(char *s, unsigned int i) {

 ret
ENDP

adrF: PROC
;-407     i << 5;//ax=i*32; IDLENMAX=31!

;Function : adrF, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var unsg word i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 5
;-408     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 
;-409 }

;-410 

;-411 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-412     int j;

;-413     if (i < LSTART) {

;Function : printName, Number local Var: 2
; # type sign width local variables
;300 var unsg word i = bp+4
;301 var sign word j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName63
;-414         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-415         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-416     }

;-417     else {

 jmp .printName64
.printName63:
;-418         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-419         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-420         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName65
 push 43
 call prc
 add  sp, 2
;-421         printinteger(j);

.printName65:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-422         prc(']');

 push 93
 call prc
 add  sp, 2
;-423     }

;-424 }

.printName64:
;-425 

;-426 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-427     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL66
 mov ax, 1
 jmp .retnifEOL
;-428     if (c == 13) {//CR

.ifEOL66:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL67
;-429         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL68
 call next
 mov [bp+4], al
;-430         return 1;

.ifEOL68:
 mov ax, 1
 jmp .retnifEOL
;-431     }

;-432     return 0;

.ifEOL67:
 mov ax, 0
 jmp .retnifEOL
;-433 }

;-434 

;-435 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 51088
symboltemp resb 80
section .text
;-436 

;-437 int getlex() {


getlex: PROC
;-438     char c; char *p;

;-439     int i; int j;

;-440 g1: c=next();

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
;-441     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex69
 mov ax, 0
 jmp .retngetlex
;-442     if (c <= ' ') goto g1;

.getlex69:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex70
 jmp .g1
;-443   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex70:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex71
 mov al, [thechar]
 cmp al, 61
 jne .getlex72
 call next
 mov ax, 806
 jmp .retngetlex
.getlex72:
;-444   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex71:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex73
 mov al, [thechar]
 cmp al, 61
 jne .getlex74
 call next
 mov ax, 807
 jmp .retngetlex
.getlex74:
;-445   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex73:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex75
 mov al, [thechar]
 cmp al, 61
 jne .getlex76
 call next
 mov ax, 824
 jmp .retngetlex
.getlex76:
;-446   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex75:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex77
 mov al, [thechar]
 cmp al, 61
 jne .getlex78
 call next
 mov ax, 811
 jmp .retngetlex
.getlex78:
;-447   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex77:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex79
 mov al, [thechar]
 cmp al, 60
 jne .getlex80
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex80:
;-448   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex79:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex81
 mov al, [thechar]
 cmp al, 62
 jne .getlex82
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex82:
;-449   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex81:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex83
 mov al, [thechar]
 cmp al, 43
 jne .getlex84
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex84:
;-450   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex83:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex85
 mov al, [thechar]
 cmp al, 45
 jne .getlex86
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex86:
;-451   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex85:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex87
 mov al, [thechar]
 cmp al, 61
 jne .getlex88
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex88:
;-452   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex87:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex89
 mov al, [thechar]
 cmp al, 61
 jne .getlex90
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex90:
;-453   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex89:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex91
 mov al, [thechar]
 cmp al, 61
 jne .getlex92
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex92:
;-454   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex91:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex93
 mov al, [thechar]
 cmp al, 61
 jne .getlex94
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex94:
;-455   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex93:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex95
 mov al, [thechar]
 cmp al, 61
 jne .getlex96
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex96:
;-456   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex97
 mov al, [thechar]
 cmp al, 61
 jne .getlex98
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex98:
;-457   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex97:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex99
 mov al, [bp-2]
 jmp .retngetlex
;-458   if (c == '/') {

.getlex99:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-459       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex101
;-460           do c=next();

.getlex102:
 call next
 mov [bp-2], al
;-461           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex103
 jmp .getlex102
.getlex103:
 call getlex
 jmp .retngetlex
;-462       }

;-463   }

.getlex101:
;-464   if (c == '/') {

.getlex100:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex104
;-465       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex105
;-466           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-467           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex106
 jmp .g2
;-468           if (thechar != '/') goto g2;

.getlex106:
 mov al, [thechar]
 cmp al, 47
 je  .getlex107
 jmp .g2
;-469           c=next();

.getlex107:
 call next
 mov [bp-2], al
;-470           return getlex();

 call getlex
 jmp .retngetlex
;-471       } else  return '/';

 jmp .getlex108
.getlex105:
 mov ax, 47
 jmp .retngetlex
;-472   }

.getlex108:
;-473   if (c == '"') {

.getlex104:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex109
;-474       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-475       c=next();

 call next
 mov [bp-2], al
;-476       while (c != '"') {

.getlex110:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex111
;-477           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-478           p++;

 inc  word[bp-4]
;-479           c=next();

 call next
 mov [bp-2], al
;-480           }

;-481           *p=0;

 jmp .getlex110
.getlex111:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-482       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-483   }

;-484   if (digit(c)) {

.getlex109:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex112
;-485       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-486       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-487       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex113
 mov ax, 88
 mov byte [thechar], al
;-488       if (thechar=='X') {

.getlex113:
 mov al, [thechar]
 cmp al, 88
 jne .getlex114
;-489           next();

 call next
;-490           while(alnum(thechar)) {

.getlex115:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex116
;-491               c=next();

 call next
 mov [bp-2], al
;-492               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex117
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-493       	       if (c>64) c=c-7;

.getlex117:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex118
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-494                c=c-48;

.getlex118:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-495                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-496                i=0;

 mov ax, 0
 mov [bp-6], ax
;-497                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-498                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-499            }

;-500        }else {

 jmp .getlex115
.getlex116:
 jmp .getlex119
.getlex114:
;-501            while(digit(thechar)) {

.getlex120:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex121
;-502                c=next();

 call next
 mov [bp-2], al
;-503                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-504                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-505                i=0;

 mov ax, 0
 mov [bp-6], ax
;-506                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-507                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-508            }

;-509        }

 jmp .getlex120
.getlex121:
;-510       return T_CONST;

.getlex119:
 mov ax, 257
 jmp .retngetlex
;-511   }

;-512   if (c==39) {

.getlex112:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex122
;-513       lexval=next();

 call next
 mov word [lexval], ax
;-514       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex123
;-515           lexval=next();

 call next
 mov word [lexval], ax
;-516           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex124
 mov ax, 10
 mov word [lexval], ax
;-517           if (lexval=='t') lexval= 9;

.getlex124:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex125
 mov ax, 9
 mov word [lexval], ax
;-518           if (lexval=='0') lexval= 0;

.getlex125:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex126
 mov ax, 0
 mov word [lexval], ax
;-519       }

.getlex126:
;-520       next();

.getlex123:
 call next
;-521       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-522   }

;-523   if (alnum(c)) {

.getlex122:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex127
;-524     strcpy(symboltemp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-525     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-526     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-527     p++;

 inc  word[bp-4]
;-528     while(alnum(thechar)) {

.getlex128:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex129
;-529         c=next();

 call next
 mov [bp-2], al
;-530         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-531         p++;

 inc  word[bp-4]
;-532     }

;-533     *p=0;

 jmp .getlex128
.getlex129:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-534     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 531
 jmp .retngetlex
;-535     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

.getlex130:
 push getlex_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 532
 jmp .retngetlex
;-536     if (eqstr(Symbol,"void"    )) return T_VOID;

.getlex131:
 push getlex_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 529
 jmp .retngetlex
;-537     if (eqstr(Symbol,"int"     )) return T_INT;

.getlex132:
 push getlex_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 517
 jmp .retngetlex
;-538     if (eqstr(Symbol,"long"    )) return T_LONG;

.getlex133:
 push getlex_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 533
 jmp .retngetlex
;-539     if (eqstr(Symbol,"inth"    )) return T_INTH;

.getlex134:
 push getlex_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 600
 jmp .retngetlex
;-540     if (eqstr(Symbol,"char"    )) return T_CHAR;

.getlex135:
 push getlex_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 530
 jmp .retngetlex
;-541     if (eqstr(Symbol,"asm"     )) return T_ASM;

.getlex136:
 push getlex_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 518
 jmp .retngetlex
;-542     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

.getlex137:
 push getlex_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 519
 jmp .retngetlex
;-543     if (eqstr(Symbol,"__emit__")) return T_EMIT;

.getlex138:
 push getlex_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 520
 jmp .retngetlex
;-544     if (eqstr(Symbol,"return"  )) return T_RETURN;

.getlex139:
 push getlex_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 512
 jmp .retngetlex
;-545     if (eqstr(Symbol,"if"      )) return T_IF;

.getlex140:
 push getlex_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 513
 jmp .retngetlex
;-546     if (eqstr(Symbol,"else"    )) return T_ELSE;

.getlex141:
 push getlex_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 514
 jmp .retngetlex
;-547     if (eqstr(Symbol,"while"   )) return T_WHILE;

.getlex142:
 push getlex_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 515
 jmp .retngetlex
;-548     if (eqstr(Symbol,"do"      )) return T_DO;

.getlex143:
 push getlex_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
 mov ax, 516
 jmp .retngetlex
;-549     if (eqstr(Symbol,"goto"    )) return T_GOTO;

.getlex144:
 push getlex_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
 mov ax, 521
 jmp .retngetlex
;-550     if (eqstr(Symbol,"define"  )) return T_DEFINE;

.getlex145:
 push getlex_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex146
 mov ax, 511
 jmp .retngetlex
;-551 

;-552     i=0;//convert define to value

.getlex146:
 mov ax, 0
 mov [bp-6], ax
;-553     while (i < GTop) {

.getlex147:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex148
;-554         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-555         if (eqstr(Symbol,j)) {

 push word [bp-8]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex149
;-556             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex150
;-557                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-558                 strcpy(Symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-559                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-560             }

;-561         }

.getlex150:
;-562         i++;

.getlex149:
 inc  word[bp-6]
;-563     }

;-564     return T_NAME; } error1("Input item not recognized");

 jmp .getlex147
.getlex148:
 mov ax, 256
 jmp .retngetlex
.getlex127:
 push getlex_18
 call error1
 add  sp, 2
;-565 }

;-566 

;-567 int istoken(int t) {

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
;-568     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;300 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken151
;-569         token=getlex();

 call getlex
 mov word [token], ax
;-570         return 1;

 mov ax, 1
 jmp .retnistoken
;-571     }

;-572     return 0;

.istoken151:
 mov ax, 0
 jmp .retnistoken
;-573 }

;-574 

;-575 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-576     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;300 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect152
;-577         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-578         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-579         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-580         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-581         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-582     }

;-583 }

.expect152:
;-584 

;-585 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-586     if (i < LSTART) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .v153
 push 91
 call prc
 add  sp, 2
;-587     printName(i);

.v153:
 push word [bp+4]
 call printName
 add  sp, 2
;-588     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v154
 push 93
 call prc
 add  sp, 2
;-589 }

.v154:
;-590 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-591     int i;

;-592     i=strlen(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;300 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-593     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen155
 push checknamelen_0
 call error1
 add  sp, 2
;-594 }

.checknamelen155:
;-595 

;-596 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-597     unsigned int i; unsigned int j;

;-598     i=LSTART;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;300 var unsg word i = bp-2
;301 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, 300
 mov [bp-2], ax
;-599     while(i<LTop) {

.checkName156:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName157
;-600         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-601         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName158
 mov ax, [bp-2]
 jmp .retncheckName
;-602         i++;

.checkName158:
 inc  word[bp-2]
;-603     }

;-604     i=1;

 jmp .checkName156
.checkName157:
 mov ax, 1
 mov [bp-2], ax
;-605     while(i<GTop) {

.checkName159:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName160
;-606         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-607         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName161
 mov ax, [bp-2]
 jmp .retncheckName
;-608         i++;

.checkName161:
 inc  word[bp-2]
;-609     }

;-610     return 0;

 jmp .checkName159
.checkName160:
 mov ax, 0
 jmp .retncheckName
;-611 }

;-612 

;-613 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-614     unsigned int i;

;-615     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-616     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname162
 push searchname_0
 call error1
 add  sp, 2
;-617     return i;

.searchname162:
 mov ax, [bp-2]
 jmp .retnsearchname
;-618 }

;-619 

;-620 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-621     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1163
 push name1_0
 call error1
 add  sp, 2
;-622     token=getlex();

.name1163:
 call getlex
 mov word [token], ax
;-623 }

;-624 

;-625 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-626     int m; //0=V,1=*,2=&

;-627     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;300 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-628     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 83
 mov byte [issign], al
;-629     if(istoken(T_UNSIGNED)) issign='U';

.typeName164:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 85
 mov byte [issign], al
;-630     iswidth=2;

.typeName165:
 mov ax, 2
 mov byte [iswidth], al
;-631     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 0
 mov byte [iswidth], al
;-632     if(istoken(T_CHAR))     iswidth=1;

.typeName166:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 1
 mov byte [iswidth], al
;-633     if(istoken(T_INT))      iswidth=2;

.typeName167:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName168
 mov ax, 2
 mov byte [iswidth], al
;-634     if(istoken(T_LONG))     iswidth=4;

.typeName168:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName169
 mov ax, 4
 mov byte [iswidth], al
;-635     istype='V';

.typeName169:
 mov ax, 86
 mov byte [istype], al
;-636     m=0;

 mov ax, 0
 mov [bp-2], ax
;-637     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName170
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-638     if(istoken('&'))  {istype='&'; m=2;}

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
;-639     name1();

.typeName171:
 call name1
;-640     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-641 }

;-642 

;-643 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-644     char c;

;-645     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;300 var sign word i = bp+4
;301 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-646     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes172
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes173
.gettypes172:
 mov ax, 0
 mov word [signi], ax
;-647     c=GWidth[i];

.gettypes173:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-648     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-649     wi=0;

 mov ax, 0
 mov word [wi], ax
;-650     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes174
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-651     if (c==2) {widthi=2;wi=2;}

.gettypes174:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes175
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-652     if (c==4) {widthi=4;wi=4;}

.gettypes175:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes176
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-653     c=GType [i];

.gettypes176:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-654     typei=0;

 mov ax, 0
 mov word [typei], ax
;-655     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes177
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-656     if (c=='&')  typei=2;

.gettypes177:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes178
 mov ax, 2
 mov word [typei], ax
;-657     return i;

.gettypes178:
 mov ax, [bp+4]
 jmp .retngettypes
;-658 }

;-659 

;-660 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-661     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal179
 push addlocal_0
 call error1
 add  sp, 2
;-662     if (checkName() != 0) error1("Variable already defined");

.addlocal179:
 call checkName
 cmp ax, 0
 je  .addlocal180
 push addlocal_1
 call error1
 add  sp, 2
;-663     GSign[LTop]=issign;

.addlocal180:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-664     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-665     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-666     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-667     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-668 }

;-669 

;-670 

;-671 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-672        if(iscmp==T_EQ) printstring("\n jne .");         //ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg181
 push cmpneg_0
 call printstring
 add  sp, 2
;-673   else if(iscmp==T_NE) printstring("\n je  .");         //ZF=1

 jmp .cmpneg182
.cmpneg181:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg183
 push cmpneg_1
 call printstring
 add  sp, 2
;-674   else if(iscmp==T_LE) if (ids) printstring("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg184
.cmpneg183:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg185
 mov ax, [bp+4]
 or  al, al
 je .cmpneg186
 push cmpneg_2
 call printstring
 add  sp, 2
;-675                            else printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg187
.cmpneg186:
 push cmpneg_3
 call printstring
 add  sp, 2
;-676   else if(iscmp==T_GE) if (ids){printstring(" ;unsigned : "); printunsigned(ids);

.cmpneg187:
 jmp .cmpneg188
.cmpneg185:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg189
 mov ax, [bp+4]
 or  al, al
 je .cmpneg190
 push cmpneg_4
 call printstring
 add  sp, 2
 push word [bp+4]
 call printunsigned
 add  sp, 2
;-677                                printstring("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call printstring
 add  sp, 2
;-678                            else{printstring(" ;unsigned : "); printunsigned(ids);

 jmp .cmpneg191
.cmpneg190:
 push cmpneg_6
 call printstring
 add  sp, 2
 push word [bp+4]
 call printunsigned
 add  sp, 2
;-679                                printstring("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call printstring
 add  sp, 2
;-680   else if(iscmp=='<' ) printstring("\n jge .");         //          SF =OF

.cmpneg191:
 jmp .cmpneg192
.cmpneg189:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg193
 push cmpneg_8
 call printstring
 add  sp, 2
;-681   else if(iscmp=='>' ) printstring("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg194
.cmpneg193:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg195
 push cmpneg_9
 call printstring
 add  sp, 2
;-682   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg196
.cmpneg195:
 push cmpneg_10
 call error1
 add  sp, 2
;-683 }

.cmpneg196:
.cmpneg194:
.cmpneg192:
.cmpneg188:
.cmpneg184:
.cmpneg182:
;-684 

;-685 int isrelational() {

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
;-686     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational197
 jmp .w
;-687     if (token==T_NE) goto w;

.isrelational197:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational198
 jmp .w
;-688     if (token==T_LE) goto w;

.isrelational198:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational199
 jmp .w
;-689     if (token==T_GE) goto w;

.isrelational199:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational200
 jmp .w
;-690     if (token=='<' ) goto w;

.isrelational200:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational201
 jmp .w
;-691     if (token=='>' ) goto w;

.isrelational201:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational202
 jmp .w
;-692     return 0;

.isrelational202:
 mov ax, 0
 jmp .retnisrelational
;-693 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-694     token=getlex();

 call getlex
 mov word [token], ax
;-695     return 1;

 mov ax, 1
 jmp .retnisrelational
;-696 }

;-697 

;-698 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-699   if (strlen(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg203
 mov ax, 0
 jmp .retncheckreg
;-700   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

.checkreg203:
 push checkreg_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 1
 jmp .retncheckreg
.checkreg204:
 push checkreg_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 3
 jmp .retncheckreg
;-701   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

.checkreg205:
 push checkreg_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 5
 jmp .retncheckreg
.checkreg206:
 push checkreg_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 7
 jmp .retncheckreg
;-702   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

.checkreg207:
 push checkreg_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 9
 jmp .retncheckreg
.checkreg208:
 push checkreg_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 11
 jmp .retncheckreg
;-703   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

.checkreg209:
 push checkreg_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 13
 jmp .retncheckreg
.checkreg210:
 push checkreg_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 15
 jmp .retncheckreg
;-704   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

.checkreg211:
 push checkreg_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 17
 jmp .retncheckreg
.checkreg212:
 push checkreg_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 19
 jmp .retncheckreg
;-705   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

.checkreg213:
 push checkreg_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 21
 jmp .retncheckreg
.checkreg214:
 push checkreg_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 23
 jmp .retncheckreg
;-706   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

.checkreg215:
 push checkreg_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 25
 jmp .retncheckreg
.checkreg216:
 push checkreg_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 27
 jmp .retncheckreg
;-707   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

.checkreg217:
 push checkreg_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 29
 jmp .retncheckreg
.checkreg218:
 push checkreg_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 31
 jmp .retncheckreg
;-708   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

.checkreg219:
 push checkreg_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 33
 jmp .retncheckreg
.checkreg220:
 push checkreg_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 35
 jmp .retncheckreg
;-709   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

.checkreg221:
 push checkreg_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 37
 jmp .retncheckreg
.checkreg222:
 push checkreg_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 39
 jmp .retncheckreg
;-710   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

.checkreg223:
 push checkreg_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 41
 jmp .retncheckreg
.checkreg224:
 push checkreg_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 43
 jmp .retncheckreg
;-711   // (eqstr(Symbol,"ip")) return 45;

;-712   if (strlen(Symbol) >   3) return 0;

.checkreg225:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg226
 mov ax, 0
 jmp .retncheckreg
;-713   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

.checkreg226:
 push checkreg_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 47
 jmp .retncheckreg
.checkreg227:
 push checkreg_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 50
 jmp .retncheckreg
;-714   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

.checkreg228:
 push checkreg_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 53
 jmp .retncheckreg
.checkreg229:
 push checkreg_25
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 56
 jmp .retncheckreg
;-715   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

.checkreg230:
 push checkreg_26
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 59
 jmp .retncheckreg
.checkreg231:
 push checkreg_27
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 62
 jmp .retncheckreg
;-716   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

.checkreg232:
 push checkreg_28
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 65
 jmp .retncheckreg
.checkreg233:
 push checkreg_29
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 68
 jmp .retncheckreg
;-717 //  if (eqstr(Symbol,"cr0")) return 71;

;-718   return 0;

.checkreg234:
 mov ax, 0
 jmp .retncheckreg
;-719 }

;-720 

;-721 char printregstr[]

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
;-722 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-723 

;-724 int printreg(int i) {


printreg: PROC
;-725     unsigned int k; unsigned char c;

;-726     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp+4
;301 var unsg word k = bp-2
;302 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-727     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-728     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-729     i++;

 inc  word[bp+4]
;-730     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-731     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-732     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-733     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg235
;-734         i++;

 inc  word[bp+4]
;-735         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-736         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-737         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-738         }

;-739 }

.printreg235:
;-740 

;-741 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 51168
ops resb 5
section .text
;-742 int doreg1(int iscmp1) {


doreg1: PROC
;-743     int i;

;-744     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;300 var sign word iscmp1 = bp+4
;301 var sign word i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1236
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-745     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1236:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1237
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-746     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1237:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1238
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-747     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1238:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1239
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-748     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1239:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1240
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-749     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1240:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1241
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-750     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1241:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1242
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-751     if (iscmp1 == 1) {

.doreg1242:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1243
;-752             token=getlex();

 call getlex
 mov word [token], ax
;-753             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1244
 push doreg1_7
 call error1
 add  sp, 2
;-754             strcpy(ops, "cmp");

.doreg1244:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-755         }

;-756     printstring("\n ");

.doreg1243:
 push doreg1_9
 call printstring
 add  sp, 2
;-757     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-758     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-759     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-760     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-761 

;-762     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1245
;-763         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-764         goto reg1;

 jmp .reg1
;-765         }

;-766     mod2=typeName();

.doreg1245:
 call typeName
 mov word [mod2], ax
;-767     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-768     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1246
;-769         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-770         goto reg1;

 jmp .reg1
;-771         }

;-772     i=searchname();

.doreg1246:
 call searchname
 mov [bp-2], ax
;-773     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1247
 push word [bp-2]
 call printName
 add  sp, 2
;-774         else v(i);

 jmp .doreg1248
.doreg1247:
 push word [bp-2]
 call v
 add  sp, 2
;-775 reg1: if (iscmp1 == 1) {

.doreg1248:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1249
;-776     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-777     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-778     expect(')');

 push 41
 call expect
 add  sp, 2
;-779     }

;-780 }

.doreg1249:
;-781 

;-782 int compoundass(char *op, int mode, int id1) {

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
;-783     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;300 ptr sign byte op = bp+4
;301 var sign word mode = bp+6
;302 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass250
 push compoundass_0
 call error1
 add  sp, 2
;-784     printstring("\n ");

.compoundass250:
 push compoundass_1
 call printstring
 add  sp, 2
;-785     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-786     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-787     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-788     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass251
 push compoundass_3
 call printstring
 add  sp, 2
;-789         else printstring("byte");

 jmp .compoundass252
.compoundass251:
 push compoundass_4
 call printstring
 add  sp, 2
;-790     v(id1);

.compoundass252:
 push word [bp+8]
 call v
 add  sp, 2
;-791     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-792     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-793     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-794 }

;-795 

;-796 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-797     gettypes(id1);

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
;-798     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1253
;-799         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-800         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-801         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-802         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1254
 push dovar1_2
 call printstring
 add  sp, 2
;-803         if(widthi == 2) printstring(" ax, [bx]");

.dovar1254:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_3
 call printstring
 add  sp, 2
;-804         return;

.dovar1255:
 jmp .retndovar1
;-805         }

;-806     if (mode==2){// & = adr

.dovar1253:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1256
;-807         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-808         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-809         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-810         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-811         return;

 jmp .retndovar1
;-812         }

;-813     if (ixarr) {//array

.dovar1256:
 mov ax, [bp+8]
 or  al, al
 je .dovar1257
;-814         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-815         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-816         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_7
 call printstring
 add  sp, 2
;-817         printstring("\n ");

.dovar1258:
 push dovar1_8
 call printstring
 add  sp, 2
;-818         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-819         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1259
 push dovar1_9
 call printstring
 add  sp, 2
;-820             else printstring(" al, ");

 jmp .dovar1260
.dovar1259:
 push dovar1_10
 call printstring
 add  sp, 2
;-821         prc('[');

.dovar1260:
 push 91
 call prc
 add  sp, 2
;-822         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-823         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-824         return;

 jmp .retndovar1
;-825         }

;-826     printstring("\n ");

.dovar1257:
 push dovar1_12
 call printstring
 add  sp, 2
;-827     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-828     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1261
 push dovar1_13
 call printstring
 add  sp, 2
;-829     if(wi==2) printstring(" ax, ");

.dovar1261:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1262
 push dovar1_14
 call printstring
 add  sp, 2
;-830     if(wi==4) printstring(" eax, ");

.dovar1262:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1263
 push dovar1_15
 call printstring
 add  sp, 2
;-831     v(id1);

.dovar1263:
 push word [bp+10]
 call v
 add  sp, 2
;-832 }

;-833 

;-834 int rterm(char *op) {

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
;-835     int mode; int opint; int ixarr; int id1;

;-836     if (istoken(T_CONST)) {

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
 je .rterm264
;-837         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-838         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-839         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm265
 push rterm_1
 call printstring
 add  sp, 2
;-840         if (wi==2) printstring(" ax, ");

.rterm265:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm266
 push rterm_2
 call printstring
 add  sp, 2
;-841         if (wi==4) printstring(" eax, ");

.rterm266:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm267
 push rterm_3
 call printstring
 add  sp, 2
;-842         printunsigned(lexval);

.rterm267:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-843         return;

 jmp .retnrterm
;-844         }

;-845     mode=typeName();

.rterm264:
 call typeName
 mov [bp-2], ax
;-846     id1=searchname();

 call searchname
 mov [bp-8], ax
;-847     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-848     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm268
;-849         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-850         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-851         expect(']');

 push 93
 call expect
 add  sp, 2
;-852         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-853         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm269
 push rterm_4
 call error1
 add  sp, 2
;-854         }

.rterm269:
;-855     if (eqstr(Symbol,"ax")) return;

.rterm268:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm270
 jmp .retnrterm
;-856     opint=op;

.rterm270:
 mov ax, [bp+4]
 mov [bp-4], ax
;-857     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-858 }

;-859 

;-860 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-861     gettypes(i);

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
;-862     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign271
;-863         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-864         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-865         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign272
 push doassign_1
 call printstring
 add  sp, 2
;-866             else  printstring("\n mov  [bx], al");

 jmp .doassign273
.doassign272:
 push doassign_2
 call printstring
 add  sp, 2
;-867         return;

.doassign273:
 jmp .retndoassign
;-868         }

;-869     if (mode==2) {// & = adr

.doassign271:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign274
;-870         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-871         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-872         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-873         return;

 jmp .retndoassign
;-874         }

;-875     if (ixarr) {

.doassign274:
 mov ax, [bp+8]
 or  al, al
 je .doassign275
;-876         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-877         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign276
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-878             else v(ixarr);

 jmp .doassign277
.doassign276:
 push word [bp+8]
 call v
 add  sp, 2
;-879         if (wi==2) printstring("\n shl bx, 1");

.doassign277:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign278
 push doassign_6
 call printstring
 add  sp, 2
;-880         printstring("\n mov [");

.doassign278:
 push doassign_7
 call printstring
 add  sp, 2
;-881         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-882         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign279
 push doassign_8
 call printstring
 add  sp, 2
;-883             else printstring("+bx], al");

 jmp .doassign280
.doassign279:
 push doassign_9
 call printstring
 add  sp, 2
;-884         return;

.doassign280:
 jmp .retndoassign
;-885         }

;-886     if (wi==1){

.doassign275:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign281
;-887         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-888         if(i<LSTART) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign282
 push doassign_11
 call printstring
 add  sp, 2
;-889         v(i);

.doassign282:
 push word [bp+6]
 call v
 add  sp, 2
;-890         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-891         return;

 jmp .retndoassign
;-892         }

;-893     if (wi==2){

.doassign281:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign283
;-894         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-895         if(i<LSTART) printstring("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign284
 push doassign_14
 call printstring
 add  sp, 2
;-896         v(i);

.doassign284:
 push word [bp+6]
 call v
 add  sp, 2
;-897         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-898         return;

 jmp .retndoassign
;-899         }

;-900     if (wi==4){

.doassign283:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign285
;-901         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-902         if(i<LSTART) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign286
 push doassign_17
 call printstring
 add  sp, 2
;-903         v(i);

.doassign286:
 push word [bp+6]
 call v
 add  sp, 2
;-904         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-905         return;

 jmp .retndoassign
;-906         }

;-907 }

.doassign285:
;-908 

;-909 int domul(int ids) {

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
;-910     if (ids) rterm("imul");

;Function : domul, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul287
 push domul_0
 call rterm
 add  sp, 2
;-911         else {

 jmp .domul288
.domul287:
;-912         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul289
;-913             printstring("\n mov bx, ");

 push domul_1
 call printstring
 add  sp, 2
;-914             printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-915             printstring("\n mul bx");

 push domul_2
 call printstring
 add  sp, 2
;-916             }

;-917         else error1("with MUL only const number as multipl. allowed");

 jmp .domul290
.domul289:
 push domul_3
 call error1
 add  sp, 2
;-918         }

.domul290:
;-919 }

.domul288:
;-920 

;-921 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multipl. allowed",0
ENDP

doidiv: PROC
;-922     int mode; int id1;

;-923     if (istoken(T_CONST)) {

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
 je .doidiv291
;-924         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-925         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-926         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv292
 push doidiv_1
 call printstring
 add  sp, 2
;-927             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv293
.doidiv292:
 push doidiv_2
 call printstring
 add  sp, 2
;-928         }

.doidiv293:
;-929     else {

 jmp .doidiv294
.doidiv291:
;-930         mode=typeName();

 call typeName
 mov [bp-2], ax
;-931         id1=searchname();

 call searchname
 mov [bp-4], ax
;-932         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv295
 push doidiv_3
 call error1
 add  sp, 2
;-933         gettypes(id1);

.doidiv295:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-934         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv296
 push doidiv_4
 call error1
 add  sp, 2
;-935         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv296:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv297
 push doidiv_5
 call error1
 add  sp, 2
;-936         printstring("\n mov bx, ");

.doidiv297:
 push doidiv_6
 call printstring
 add  sp, 2
;-937         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-938         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv298
 push doidiv_7
 call printstring
 add  sp, 2
;-939             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv299
.doidiv298:
 push doidiv_8
 call printstring
 add  sp, 2
;-940     }

.doidiv299:
;-941 }

.doidiv294:
;-942 

;-943 int domod(int ids) {

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
;-944     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-945     printstring("\n mov ax, dx");

 push domod_0
 call printstring
 add  sp, 2
;-946 }

;-947 

;-948 

;-949 int docalltype[10]; int docallvalue[10];

 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 51173
docalltype resw 10
section .text
section .bss
absolute 51193
docallvalue resw 10
section .text
;-950 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name

section .bss
absolute 51213
procname resb 17
section .text
;-951 

;-952 int docall1() {


docall1: PROC
;-953     int i; int narg; int t0; int n0;  int sz32;

;-954     narg=0;

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
;-955     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-956     checknamelen();

 call checknamelen
;-957     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-958     expect('(');

 push 40
 call expect
 add  sp, 2
;-959 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1300
;-960 	    do {

.docall1301:
;-961 	        narg++;

 inc  word[bp-4]
;-962 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1302
 push docall1_0
 call error1
 add  sp, 2
;-963 	        t0=0;

.docall1302:
 mov ax, 0
 mov [bp-6], ax
;-964             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1303
;-965                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-966                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-967                 }

;-968             if(istoken(T_STRING)){

.docall1303:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1304
;-969                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-970                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-971                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-972                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-973                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-974                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-975                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-976                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-977                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-978                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-979                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-980                 nconst++;

 inc  word[nconst]
;-981                 }

;-982             if(istoken('&'))     {

.docall1304:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1305
;-983                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-984                 name1();

 call name1
;-985                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-986                 }

;-987             if(istoken(T_NAME))  {

.docall1305:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1306
;-988 

;-989 

;-990 

;-991                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-992                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-993                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-994                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-995                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1307
 mov ax, 3
 mov [bp-6], ax
;-996 

;-997                 }

.docall1307:
;-998             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1306:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1308
 push docall1_4
 call error1
 add  sp, 2
;-999             docalltype [narg] = t0;

.docall1308:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-1000             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-1001         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1309
 jmp .docall1301
.docall1309:
;-1002 

;-1003   	expect(')');

 push 41
 call expect
 add  sp, 2
;-1004   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-1005     do {

.docall1310:
;-1006         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-1007         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-1008         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1311
;-1009             printstring("\n push ");

 push docall1_5
 call printstring
 add  sp, 2
;-1010             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1011             }

;-1012         if(t0==2){

.docall1311:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1312
;-1013             printstring("\n push ");

 push docall1_6
 call printstring
 add  sp, 2
;-1014             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1015             prc(95);

 push 95
 call prc
 add  sp, 2
;-1016             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1017             }

;-1018         if(t0==3){

.docall1312:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1313
;-1019             printstring("\n lea  ax, ");

 push docall1_7
 call printstring
 add  sp, 2
;-1020             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1021             printstring("\n push ax");

 push docall1_8
 call printstring
 add  sp, 2
;-1022             }

;-1023         if(t0==4){

.docall1313:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1314
;-1024             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1025             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1315
;-1026                 printstring("\n push word ");

 push docall1_9
 call printstring
 add  sp, 2
;-1027                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1028                 }

;-1029             else {

 jmp .docall1316
.docall1315:
;-1030                 printstring("\n mov al, byte ");

 push docall1_10
 call printstring
 add  sp, 2
;-1031                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1032                 printstring("\n mov ah, 0\n push ax");

 push docall1_11
 call printstring
 add  sp, 2
;-1033                 }

;-1034             }

.docall1316:
;-1035         if(t0==5){

.docall1314:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1317
;-1036             printstring("\n push ");

 push docall1_12
 call printstring
 add  sp, 2
;-1037             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1038             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1318
 mov ax, [bp-10]
 add ax, 2
;-1039             }

.docall1318:
;-1040         i--;

.docall1317:
 dec  word[bp-2]
;-1041         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1319
 jmp .docall1310
.docall1319:
;-1042     }

;-1043 	printstring("\n call ");

.docall1300:
 push docall1_13
 call printstring
 add  sp, 2
;-1044 	printstring(&procname);

 lea  ax, [procname]
 push ax
 call printstring
 add  sp, 2
;-1045 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1320
;-1046 	    printstring("\n add  sp, ");

 push docall1_14
 call printstring
 add  sp, 2
;-1047         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1048         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1049         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1050         }

;-1051 }

.docall1320:
;-1052 

;-1053 

;-1054 int expr() {

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
;-1055     int mode;   int id1;

;-1056     int ixarr;  int ixconst;

;-1057     int ids;    int isCONST;

;-1058     int i;      unsigned char *p;

;-1059 

;-1060     if (istoken(T_CONST)) {// constant ;

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
 je .expr321
;-1061         printstring("\n mov ax, ");

 push expr_0
 call printstring
 add  sp, 2
;-1062         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1063         return 4;

 mov ax, 4
 jmp .retnexpr
;-1064         }

;-1065     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr321:
 call typeName
 mov [bp-2], ax
;-1066     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1067     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr322
;-1068         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1069         return;

 jmp .retnexpr
;-1070         }

;-1071 

;-1072     if (token=='(')  {

.expr322:
 mov ax, [token]
 cmp ax, 40
 jne .expr323
;-1073         docall1();

 call docall1
;-1074         goto e1;

 jmp .e1
;-1075         }

;-1076 

;-1077     id1=searchname();

.expr323:
 call searchname
 mov [bp-4], ax
;-1078     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1079     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1080     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1081     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1082     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr324
;-1083         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr325
;-1084             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1085             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1086             expect(']');

 push 93
 call expect
 add  sp, 2
;-1087             }

;-1088         else {

 jmp .expr326
.expr325:
;-1089             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1090             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1091             expect(']');

 push 93
 call expect
 add  sp, 2
;-1092             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1093             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr327
 push expr_1
 call error1
 add  sp, 2
;-1094             }

.expr327:
;-1095         }

.expr326:
;-1096     if (istoken(T_PLUSPLUS  )) {

.expr324:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr328
;-1097         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr329
 push expr_2
 call error1
 add  sp, 2
;-1098         printstring("\n inc  ");

.expr329:
 push expr_3
 call printstring
 add  sp, 2
;-1099         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr330
 push expr_4
 call printstring
 add  sp, 2
 jmp .expr331
.expr330:
 push expr_5
 call printstring
 add  sp, 2
;-1100         v(id1);

.expr331:
 push word [bp-4]
 call v
 add  sp, 2
;-1101         goto e1;

 jmp .e1
;-1102         }

;-1103     if (istoken(T_MINUSMINUS)) {

.expr328:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr332
;-1104         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr333
 push expr_6
 call error1
 add  sp, 2
;-1105         printstring("\n dec  ");

.expr333:
 push expr_7
 call printstring
 add  sp, 2
;-1106         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr334
 push expr_8
 call printstring
 add  sp, 2
 jmp .expr335
.expr334:
 push expr_9
 call printstring
 add  sp, 2
;-1107         v(id1);

.expr335:
 push word [bp-4]
 call v
 add  sp, 2
;-1108         goto e1;

 jmp .e1
;-1109         }

;-1110 

;-1111     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr332:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr336
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1
;-1112     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr336:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1
;-1113     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr337:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1
;-1114     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr338:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1115     if (istoken(T_MULASS  )) error1("not implemented");

.expr339:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
 push expr_14
 call error1
 add  sp, 2
;-1116     if (istoken(T_DIVASS  )) error1("not implemented");

.expr340:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push expr_15
 call error1
 add  sp, 2
;-1117 

;-1118     if (istoken('=')) {

.expr341:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr342
;-1119         expr();

 call expr
;-1120         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1121         goto e1;

 jmp .e1
;-1122         }

;-1123     dovar1(mode, "mov", ixarr, id1);

.expr342:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1124 

;-1125 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
 push expr_17
 call rterm
 add  sp, 2
;-1126     else if (istoken('-')) rterm("sub");

 jmp .expr344
.expr343:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr345
 push expr_18
 call rterm
 add  sp, 2
;-1127     else if (istoken('&')) rterm("and");

 jmp .expr346
.expr345:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr347
 push expr_19
 call rterm
 add  sp, 2
;-1128     else if (istoken('|')) rterm("or" );

 jmp .expr348
.expr347:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr349
 push expr_20
 call rterm
 add  sp, 2
;-1129     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr350
.expr349:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr351
 push expr_21
 call rterm
 add  sp, 2
;-1130     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr352
.expr351:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr353
 push expr_22
 call rterm
 add  sp, 2
;-1131     else if (istoken('*')) domul (ids);

 jmp .expr354
.expr353:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
 push word [bp-10]
 call domul
 add  sp, 2
;-1132     else if (istoken('/')) doidiv(ids);

 jmp .expr356
.expr355:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1133     else if (istoken('%')) domod (ids);

 jmp .expr358
.expr357:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr359
 push word [bp-10]
 call domod
 add  sp, 2
;-1134     if (isrelational()) {

.expr359:
.expr358:
.expr356:
.expr354:
.expr352:
.expr350:
.expr348:
.expr346:
.expr344:
 call isrelational
 or  al, al
 je .expr360
;-1135         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1136         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1137         }

;-1138     return 0;

.expr360:
 mov ax, 0
 jmp .retnexpr
;-1139 }

;-1140 

;-1141 int pexpr() {//called from if, do, while

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
;-1142     expect('(');

 push 40
 call expect
 add  sp, 2
;-1143     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1144     if (token==T_NAME) {//todo

 mov ax, [token]
 cmp ax, 256
 jne .pexpr361
;-1145         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1146         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr362
;-1147             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1148             return;

 jmp .retnpexpr
;-1149             }

;-1150         }

.pexpr362:
;-1151 

;-1152     expr();

.pexpr361:
 call expr
;-1153     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr363
 push pexpr_0
 call printstring
 add  sp, 2
;-1154     printstring(fname);

.pexpr363:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1155     expect(')');

 push 41
 call expect
 add  sp, 2
;-1156 }

;-1157 

;-1158 

;-1159 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1160     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1161     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1162     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1163     prc(':');

 push 58
 call prc
 add  sp, 2
;-1164 }

;-1165 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1166     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1167     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1168     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1169 }

;-1170 

;-1171 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1172     int c; char cha;

;-1173     int jdest; int tst; int jtemp;

;-1174     if(istoken('{')) {

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
 je .stmt364
;-1175         while(istoken('}')==0) stmt();

.stmt365:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt366
 call stmt
;-1176         }

 jmp .stmt365
.stmt366:
;-1177     else if(istoken(T_IF)) {

 jmp .stmt367
.stmt364:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt368
;-1178         pexpr();

 call pexpr
;-1179         nlabel++;

 inc  word[nlabel]
;-1180         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1181         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1182         stmt();

 call stmt
;-1183         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt369
;-1184             nlabel++;

 inc  word[nlabel]
;-1185             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1186             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1187             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1188             stmt();

 call stmt
;-1189             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1190         }

;-1191         else prlabel(jdest);

 jmp .stmt370
.stmt369:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1192     }

.stmt370:
;-1193     else if(istoken(T_DO)) {

 jmp .stmt371
.stmt368:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372
;-1194         nlabel++;

 inc  word[nlabel]
;-1195         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1196         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1197         stmt();

 call stmt
;-1198         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1199         pexpr();

 call pexpr
;-1200         nlabel++;

 inc  word[nlabel]
;-1201         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1202         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1203         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1204          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1205     }

;-1206     else if(istoken(T_WHILE)) {

 jmp .stmt373
.stmt372:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt374
;-1207         nlabel++;

 inc  word[nlabel]
;-1208         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1209         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1210         pexpr();

 call pexpr
;-1211         nlabel++;

 inc  word[nlabel]
;-1212         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1213         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1214         stmt();

 call stmt
;-1215         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1216         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1217     }

;-1218     else if(istoken(T_GOTO))  {

 jmp .stmt375
.stmt374:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt376
;-1219         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1220         name1();

 call name1
;-1221         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1222         expect(';');

 push 59
 call expect
 add  sp, 2
;-1223     }

;-1224     else if(token==T_ASM)     {

 jmp .stmt377
.stmt376:
 mov ax, [token]
 cmp ax, 518
 jne .stmt378
;-1225       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1226       c=next();

 call next
 mov [bp-2], ax
;-1227       while(c != '\n') {

.stmt379:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt380
;-1228         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1229         c=next();

 call next
 mov [bp-2], ax
;-1230         };

 jmp .stmt379
.stmt380:
;-1231         token=getlex();

 call getlex
 mov word [token], ax
;-1232     }

;-1233     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt381
.stmt378:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt382
;-1234         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt383
;-1235             printstring("\n"); cha=next();

 push stmt_2
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1236             while(cha!= '}') {

.stmt384:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt385
;-1237                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1238                 cha=next();

 call next
 mov [bp-4], al
;-1239             }

;-1240             token=getlex();

 jmp .stmt384
.stmt385:
 call getlex
 mov word [token], ax
;-1241         } else error1("Curly open expected");

 jmp .stmt386
.stmt383:
 push stmt_3
 call error1
 add  sp, 2
;-1242     }

.stmt386:
;-1243     else if(istoken(T_INTH))  {

 jmp .stmt387
.stmt382:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt388
;-1244         printstring("\n int  ");

 push stmt_4
 call printstring
 add  sp, 2
;-1245         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1246         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1247         expect(';');

 push 59
 call expect
 add  sp, 2
;-1248     }

;-1249     else if(istoken(T_EMIT)) {

 jmp .stmt389
.stmt388:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt390
;-1250       printstring("\n db ");

 push stmt_5
 call printstring
 add  sp, 2
;-1251     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1252       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1253       token=getlex();

 call getlex
 mov word [token], ax
;-1254       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt391
;-1255           prc(',');

 push 44
 call prc
 add  sp, 2
;-1256           goto L1;

 jmp .L1
;-1257       }

;-1258       expect(')');

.stmt391:
 push 41
 call expect
 add  sp, 2
;-1259     }

;-1260     else if(istoken(';'))      { }

 jmp .stmt392
.stmt390:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt393
;-1261     else if(istoken(T_RETURN)) {

 jmp .stmt394
.stmt393:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt395
;-1262         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt396
 call expr
;-1263         printstring("\n jmp .retn");

.stmt396:
 push stmt_6
 call printstring
 add  sp, 2
;-1264         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1265         nreturn++;

 inc  word[nreturn]
;-1266         expect(';');

 push 59
 call expect
 add  sp, 2
;-1267     }

;-1268     else if(thechar==':')      {

 jmp .stmt397
.stmt395:
 mov al, [thechar]
 cmp al, 58
 jne .stmt398
;-1269         printstring("\n."); // Label

 push stmt_7
 call printstring
 add  sp, 2
;-1270         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1271         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1272         expect(':');

 push 58
 call expect
 add  sp, 2
;-1273     }

;-1274     else  {expr();; expect(';'); }

 jmp .stmt399
.stmt398:
 call expr
 push 59
 call expect
 add  sp, 2
;-1275 }

.stmt399:
.stmt397:
.stmt394:
.stmt392:
.stmt389:
.stmt387:
.stmt381:
.stmt377:
.stmt375:
.stmt373:
.stmt371:
.stmt367:
;-1276 

;-1277 int isvariable() {

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
;-1278     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable400
 jmp .v1
;-1279     if(token==T_UNSIGNED) goto v1;

.isvariable400:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable401
 jmp .v1
;-1280     if(token==T_CHAR)     goto v1;

.isvariable401:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable402
 jmp .v1
;-1281     if(token==T_INT)      goto v1;

.isvariable402:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable403
 jmp .v1
;-1282     if(token==T_LONG)     goto v1;

.isvariable403:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable404
 jmp .v1
;-1283     return 0;

.isvariable404:
 mov ax, 0
 jmp .retnisvariable
;-1284 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1285 }

;-1286 

;-1287 //***************************************************************

;-1288 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1289     unsigned int j;

;-1290     char c;

;-1291     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;300 var unsg word i = bp+4
;301 var unsg word j = bp-2
;302 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1292     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1293     prc(32);

 push 32
 call prc
 add  sp, 2
;-1294     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1295     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar405
 push listvar_1
 call printstring
 add  sp, 2
;-1296     if(c=='*')printstring("ptr ");

.listvar405:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar406
 push listvar_2
 call printstring
 add  sp, 2
;-1297     if(c=='&')printstring("arr ");

.listvar406:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar407
 push listvar_3
 call printstring
 add  sp, 2
;-1298     if(c=='#')printstring("def ");

.listvar407:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar408
 push listvar_4
 call printstring
 add  sp, 2
;-1299     c=GSign [i];

.listvar408:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1300     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar409
 push listvar_5
 call printstring
 add  sp, 2
;-1301     if(c=='U')printstring("unsg ");

.listvar409:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar410
 push listvar_6
 call printstring
 add  sp, 2
;-1302     c=GWidth[i];

.listvar410:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1303     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar411
 push listvar_7
 call printstring
 add  sp, 2
;-1304     if(c== 1)printstring("byte " );

.listvar411:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar412
 push listvar_8
 call printstring
 add  sp, 2
;-1305     if(c== 2)printstring("word " );

.listvar412:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar413
 push listvar_9
 call printstring
 add  sp, 2
;-1306     if(c== 4)printstring("long " );

.listvar413:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar414
 push listvar_10
 call printstring
 add  sp, 2
;-1307     j=i*32;

.listvar414:
 mov ax, [bp+4]
 mov bx, 32
 mul bx
 mov [bp-2], ax
;-1308     pt=&GNameField + j;

 mov ax, GNameField
 add ax, [bp-2]
 mov word [pt], ax
;-1309     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1310     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar415
;-1311         prc('=');

 push 61
 call prc
 add  sp, 2
;-1312         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1313         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1314     }

;-1315     if(GType[i]=='&') {

.listvar415:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar416
;-1316         prc('[');

 push 91
 call prc
 add  sp, 2
;-1317         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1318         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1319         prc(']');

 push 93
 call prc
 add  sp, 2
;-1320     }

;-1321     if (i >= LSTART) {

.listvar416:
 mov ax, [bp+4]
 cmp ax, 300 ;unsigned : 0
 jb  .listvar417
;-1322         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1323         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1324         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar418
 push 43
 call prc
 add  sp, 2
;-1325         printinteger(j);

.listvar418:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1326     }

;-1327 }

.listvar417:
;-1328 

;-1329 int listproc() {

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
;-1330     int i;

;-1331     if (LTop > LSTART) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;300 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 300
 jle .listproc419
;-1332         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1333         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1334         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1335         i=LTop - LSTART;

 mov ax, [LTop]
 sub ax, 300
 mov [bp-2], ax
;-1336         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1337         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1338         i=LSTART;

 mov ax, 300
 mov [bp-2], ax
;-1339         while (i < LTop) {

.listproc420:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc421
;-1340             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1341             i++;

 inc  word[bp-2]
;-1342         }

;-1343     }

 jmp .listproc420
.listproc421:
;-1344 }

.listproc419:
;-1345 

;-1346 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1347     int FunctionIndex; char *p;

;-1348     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;300 var sign word FunctionIndex = bp-2
;301 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1349     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1350     while (FunctionIndex <= FunctionMaxIx) {

.searchFunction422:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction423
;-1351         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction424
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1352         p = strlen(p) + p;

.searchFunction424:
 push word [bp-4]
 call strlen
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1353         p++;

 inc  word[bp-4]
;-1354         FunctionIndex++;

 inc  word[bp-2]
;-1355     }

;-1356     return 0;               //no function found

 jmp .searchFunction422
.searchFunction423:
 mov ax, 0
 jmp .retnsearchFunction
;-1357 }

;-1358 

;-1359 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1360     unsigned int i;

;-1361     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1362     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300 ;unsigned : 1
 jl  .storeFunction425
 push storeFunction_0
 call error1
 add  sp, 2
;-1363     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction425:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1364     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1365     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1366     i += IDLENMAX;

 add  word[bp-2], 31
;-1367     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000 ;unsigned : 0
 jb  .storeFunction426
 push storeFunction_1
 call error1
 add  sp, 2
;-1368 

;-1369 }

.storeFunction426:
;-1370 

;-1371 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1372     int nloc; unsigned int j;int narg;

;-1373     cloc=&co;

;Function : dofunc, Number local Var: 3
; # type sign width local variables
;300 var sign word nloc = bp-2
;301 var unsg word j = bp-4
;302 var sign word narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax
;-1374     checknamelen();

 call checknamelen
;-1375     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1376     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc427
 push dofunc_0
 call error1
 add  sp, 2
;-1377     storeFunction();

.dofunc427:
 call storeFunction
;-1378 

;-1379     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1380     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1381     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1382     expect('(');

 push 40
 call expect
 add  sp, 2
;-1383     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1384     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc428
;-1385         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1386         do {

.dofunc429:
;-1387             typeName();

 call typeName
;-1388             addlocal();

 call addlocal
;-1389             narg+=2;

 add  word[bp-6], 2
;-1390             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1391             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc430
 add  word[bp-6], 2
;-1392                 LTop++;

.dofunc430:
 inc  word[LTop]
;-1393                 }

;-1394         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc431
 jmp .dofunc429
.dofunc431:
;-1395         expect(')');

 push 41
 call expect
 add  sp, 2
;-1396         }

;-1397 

;-1398     expect('{'); /*body*/

.dofunc428:
 push 123
 call expect
 add  sp, 2
;-1399     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1400     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1401     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1402     while(isvariable()) {

.dofunc432:
 call isvariable
 or  al, al
 je .dofunc433
;-1403         do {

.dofunc434:
;-1404             typeName();

 call typeName
;-1405             checknamelen();

 call checknamelen
;-1406             addlocal();

 call addlocal
;-1407             nloc-=2;

 sub  word[bp-2], 2
;-1408             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc435
 sub  word[bp-2], 2
;-1409             GData[LTop]=nloc;

.dofunc435:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1410             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc436
;-1411                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1412                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1413                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1414                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1415                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1416                 nloc+=2;

 add  word[bp-2], 2
;-1417                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1418             }

;-1419             LTop++;

.dofunc436:
 inc  word[LTop]
;-1420         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc437
 jmp .dofunc434
.dofunc437:
;-1421         expect(';');

 push 59
 call expect
 add  sp, 2
;-1422     }

;-1423     listproc();

 jmp .dofunc432
.dofunc433:
 call listproc
;-1424     if (LTop>LSTART){

 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc438
;-1425         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1426         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1427         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1428         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1429         }

;-1430 

;-1431     while(istoken('}')==0)  stmt();

.dofunc438:
.dofunc439:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc440
 call stmt
;-1432 

;-1433     if (nreturn) {

 jmp .dofunc439
.dofunc440:
 mov ax, [nreturn]
 or  al, al
 je .dofunc441
;-1434             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1435             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1436             prc(':');

 push 58
 call prc
 add  sp, 2
;-1437         }

;-1438     if (LTop > LSTART) printstring("\n LEAVE");

.dofunc441:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc442
 push dofunc_6
 call printstring
 add  sp, 2
;-1439     printstring("\n ret");

.dofunc442:
 push dofunc_7
 call printstring
 add  sp, 2
;-1440     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1441     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1442     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1443     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc443
 mov ax, [maxco1]
 mov word [maxco], ax
;-1444     printstring("\nENDP");

.dofunc443:
 push dofunc_8
 call printstring
 add  sp, 2
;-1445 }

;-1446 

;-1447 int doglob() {

 LEAVE
 ret
dofunc_0 db "Function already defined",0
dofunc_1 db "\n\n",0
dofunc_2 db ": PROC",0
dofunc_3 db ";\n ENTER  ",0
dofunc_4 db ",0",0
dofunc_5 db "\n .retn",0
dofunc_6 db "\n LEAVE",0
dofunc_7 db "\n ret",0
dofunc_8 db "\nENDP",0
ENDP

doglob: PROC
;-1448     int i; int j;

;-1449     isstrarr=0;

;Function : doglob, Number local Var: 2
; # type sign width local variables
;300 var sign word i = bp-2
;301 var sign word j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [isstrarr], ax
;-1450     if (iswidth == 0) error1("no VOID as var type");

 mov al, [iswidth]
 cmp al, 0
 jne .doglob444
 push doglob_0
 call error1
 add  sp, 2
;-1451     checknamelen();

.doglob444:
 call checknamelen
;-1452     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob445
 push doglob_1
 call error1
 add  sp, 2
;-1453     if (istoken('[')) {

.doglob445:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob446
;-1454         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1455         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob447
;-1456             printstring("\nsection .bss\nabsolute ");

 push doglob_2
 call printstring
 add  sp, 2
;-1457             printunsigned(orgData);

 push word [orgData]
 call printunsigned
 add  sp, 2
;-1458             printstring("\n"); printstring(Symbol);

 push doglob_3
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1459             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob448
 push doglob_4
 call printstring
 add  sp, 2
;-1460             if (iswidth==2) printstring(" resw ");

.doglob448:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob449
 push doglob_5
 call printstring
 add  sp, 2
;-1461             if (iswidth==4) printstring(" resd ");

.doglob449:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob450
 push doglob_6
 call printstring
 add  sp, 2
;-1462             printunsigned(lexval);

.doglob450:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1463             printstring("\nsection .text");

 push doglob_7
 call printstring
 add  sp, 2
;-1464             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1465             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob451
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1466             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob451:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob452
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax
;-1467             GData[GTop]=lexval;

.doglob452:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1468             expect(']');

 push 93
 call expect
 add  sp, 2
;-1469         }else {

 jmp .doglob453
.doglob447:
;-1470             expect(']');

 push 93
 call expect
 add  sp, 2
;-1471             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob454
 push doglob_8
 call error1
 add  sp, 2
;-1472             printstring("\n");

.doglob454:
 push doglob_9
 call printstring
 add  sp, 2
;-1473             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1474             printstring(" db ");

 push doglob_10
 call printstring
 add  sp, 2
;-1475             isstrarr=1;

 mov ax, 1
 mov word [isstrarr], ax
;-1476             strcpy(doglobName, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1477             expect('=');

 push 61
 call expect
 add  sp, 2
;-1478             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob455
;-1479                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1480                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1481                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1482                 printstring(",0");

 push doglob_11
 call printstring
 add  sp, 2
;-1483                 i=strlen(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1484                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1485                 }

;-1486             else if (istoken('{' )) {

 jmp .doglob456
.doglob455:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob457
;-1487                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1488                 do {

.doglob458:
;-1489                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob459
 push 44
 call prc
 add  sp, 2
;-1490                     expect(T_CONST);

.doglob459:
 push 257
 call expect
 add  sp, 2
;-1491                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1492                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1493                     }

;-1494                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob460
 jmp .doglob458
.doglob460:
;-1495                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1496             }

;-1497         else error1("String or number array expected");

 jmp .doglob461
.doglob457:
 push doglob_12
 call error1
 add  sp, 2
;-1498         };

.doglob461:
.doglob456:
.doglob453:
;-1499     }else { //expect('=');

 jmp .doglob462
.doglob446:
;-1500         printstring("\n");

 push doglob_13
 call printstring
 add  sp, 2
;-1501         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1502         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob463
 push doglob_14
 call printstring
 add  sp, 2
;-1503         else {

 jmp .doglob464
.doglob463:
;-1504             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob465
 push doglob_15
 call printstring
 add  sp, 2
;-1505             else if (iswidth==2) printstring(" dw ");

 jmp .doglob466
.doglob465:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob467
 push doglob_16
 call printstring
 add  sp, 2
;-1506             else                 printstring(" dd ");

 jmp .doglob468
.doglob467:
 push doglob_17
 call printstring
 add  sp, 2
;-1507         }

.doglob468:
.doglob466:
;-1508     if(istoken('-')) prc('-');

.doglob464:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob469
 push 45
 call prc
 add  sp, 2
;-1509     if (istoken('=')) {

.doglob469:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob470
;-1510         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1511         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1512         }else printunsigned(0);

 jmp .doglob471
.doglob470:
 push 0
 call printunsigned
 add  sp, 2
;-1513     }

.doglob471:
;-1514     GSign[GTop]=issign;

.doglob462:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1515     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1516     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1517     storeGlobalVar();

 call storeGlobalVar
;-1518 

;-1519     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1520     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [isstrarr]
 or  al, al
 je .doglob472
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1521         else strcpy(pt, Symbol);

 jmp .doglob473
.doglob472:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1522 

;-1523     GTop++;

.doglob473:
 inc  word[GTop]
;-1524     expect(';');

 push 59
 call expect
 add  sp, 2
;-1525 }

;-1526 

;-1527 int dodefine() {

 LEAVE
 ret
doglob_0 db "no VOID as var type",0
doglob_1 db "Variable already defined",0
doglob_2 db "\nsection .bss\nabsolute ",0
doglob_3 db "\n",0
doglob_4 db " resb ",0
doglob_5 db " resw ",0
doglob_6 db " resd ",0
doglob_7 db "\nsection .text",0
doglob_8 db "Only ByteArray allowed",0
doglob_9 db "\n",0
doglob_10 db " db ",0
doglob_11 db ",0",0
doglob_12 db "String or number array expected",0
doglob_13 db "\n",0
doglob_14 db " dw ",0
doglob_15 db " db ",0
doglob_16 db " dw ",0
doglob_17 db " dd ",0
ENDP

dodefine: PROC
;-1528     int i; int j; int fdtemp;

;-1529     if (eqstr(Symbol, "ORGDATA")) {

;Function : dodefine, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp-2
;301 var sign word j = bp-4
;302 var sign word fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine474
;-1530         token=getlex();

 call getlex
 mov word [token], ax
;-1531         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1532         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1533         return;

 jmp .retndodefine
;-1534     }

;-1535     expect(T_NAME);

.dodefine474:
 push 256
 call expect
 add  sp, 2
;-1536     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine475
;-1537         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine476
 push dodefine_1
 call error1
 add  sp, 2
;-1538         i=strlen(Symbol);

.dodefine476:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1539         if (i>IDLENMAX) error1("Define name too long");

 mov ax, [bp-2]
 cmp ax, 31
 jle .dodefine477
 push dodefine_2
 call error1
 add  sp, 2
;-1540         GSign [GTop]='U';

.dodefine477:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1541         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1542         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1543         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1544         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1545         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1546         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1547         GTop++;

 inc  word[GTop]
;-1548     }

;-1549 }

.dodefine475:
;-1550 

;-1551 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name too long",0
ENDP

parse: PROC
;-1552     token=getlex();

 call getlex
 mov word [token], ax
;-1553     do {

.parse478:
;-1554         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse479
 mov ax, 1
 jmp .retnparse
;-1555         if (istoken('#')) {

.parse479:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse480
;-1556              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse481
 call dodefine
;-1557              else error1("define expected");

 jmp .parse482
.parse481:
 push parse_0
 call error1
 add  sp, 2
;-1558         }

.parse482:
;-1559     else{

 jmp .parse483
.parse480:
;-1560         typeName();

 call typeName
;-1561         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse484
 call dofunc
;-1562         else doglob(); }

 jmp .parse485
.parse484:
 call doglob
.parse485:
;-1563     } while(1);

.parse483:
 mov ax, 1
 or  al, al
 je .parse486
 jmp .parse478
.parse486:
;-1564 }

;-1565 

;-1566 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1567 int main() {


main: PROC
;-1568     int arglen1; unsigned int i; char *c;

;-1569     isPrint=1;

;Function : main, Number local Var: 3
; # type sign width local variables
;300 var sign word arglen1 = bp-2
;301 var unsg word i = bp-4
;302 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1570     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1571     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main487
;-1572         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1573         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1574         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1575         }

;-1576     i=arglen1+129;

.main487:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1577     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1578     arglen1--;

 dec  word[bp-2]
;-1579     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1580     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1581     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main488
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4
;-1582     strcpy(namelst, namein);

.main488:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1583     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1584     i--;

 dec  word[bp-4]
;-1585     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1586     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1587 

;-1588     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1589     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main489
;-1590         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1591         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1592         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1593         }

;-1594     fdout=creatR(namelst);

.main489:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1595     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main490
;-1596         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1597         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1598         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1599         }

;-1600     printstring(";");

.main490:
 push main_4
 call printstring
 add  sp, 2
;-1601     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1602     printstring(", Input: "); printstring(namein);

 push main_5
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1603     printstring(", Output: "); printstring(namelst);

 push main_6
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1604     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1605     printstring("\norg  256 \njmp main");

 push main_7
 call printstring
 add  sp, 2
;-1606 

;-1607     VarNamePtr=&VarNames;

 mov ax, VarNames
 mov word [VarNamePtr], ax
;-1608     FunctionNamePtr=&FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1609     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1610     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1611     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1612     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1613     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1614 

;-1615     parse();

 call parse
;-1616 

;-1617     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1618     GTop--;

 dec  word[GTop]
;-1619     printstring("\n;Glob. variables:");     printunsigned(GTop);

 push main_8
 call printstring
 add  sp, 2
 push word [GTop]
 call printunsigned
 add  sp, 2
;-1620     printstring(" (");                      printunsigned(LSTART);

 push main_9
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1621     printstring("), Functions:");           printunsigned(FunctionMaxIx);

 push main_10
 call printstring
 add  sp, 2
 push word [FunctionMaxIx]
 call printunsigned
 add  sp, 2
;-1622     printstring(" (");                      printunsigned(FUNCMAX);

 push main_11
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1623     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-4], ax
;-1624     printstring(")'");                      printunsigned(i);

 push main_12
 call printstring
 add  sp, 2
 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1625     printstring("', Lines:");               printunsigned(lineno);

 push main_13
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1626     printstring("\n;Constant: ");           printunsigned(maxco);

 push main_14
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1627     printstring(" (");                      printunsigned(COMAX);

 push main_15
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1628     i=COMAX;

 mov ax, 3000
 mov [bp-4], ax
;-1629     i=i-maxco;

 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1630     if (i <= 1000)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main491
 push main_16
 call printstring
 add  sp, 2
;-1631     printstring("), stacksize: ");

.main491:
 push main_17
 call printstring
 add  sp, 2
;-1632     i=65536;

 mov ax, 0
 mov [bp-4], ax
;-1633     i=i-orgData;

 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1634     printunsigned(i);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1635     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main492
 push main_18
 call printstring
 add  sp, 2
;-1636     end1(0);

.main492:
 push 0
 call end1
 add  sp, 2
;-1637 }

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
main_12 db ")'",0
main_13 db "', Lines:",0
main_14 db "\n;Constant: ",0
main_15 db " (",0
main_16 db "\n ** Warning ** constant area too small",0
main_17 db "), stacksize: ",0
main_18 db "\n *** Warning *** Stack too small",0
ENDP
;Glob. variables:107 (300), Functions:78 (300)'629', Lines:1638
;Constant: 688 (3000), stacksize: 14306