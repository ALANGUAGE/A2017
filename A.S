;PLA compiler A.COM V0.9.6, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA compiler A.COM V0.9.6";//todo:op=reg not recognized

Version1 db "PLA compiler A.COM V0.9.6",0
;-2 #define ORGDATA     24000//set it to end of text

;-3 #define IDLENMAX       31//max length of names

;-4 #define COLUMNMAX     128//output, input is 100

;-5 #define T_NAME        256//the following defines for better clearity

;-6 #define T_CONST       257

;-7 #define T_STRING      258

;-8 #define T_DEFINE      511

;-9 #define T_RETURN      512

;-10 #define T_IF          513

;-11 #define T_ELSE        514

;-12 #define T_WHILE       515

;-13 #define T_DO          516

;-14 #define T_INT         517

;-15 #define T_ASM         518

;-16 #define T_ASMBLOCK    519

;-17 #define T_EMIT        520

;-18 #define T_GOTO        521

;-19 #define T_VOID        529

;-20 #define T_CHAR        530

;-21 #define T_SIGNED      531

;-22 #define T_UNSIGNED    532

;-23 #define T_LONG        533

;-24 #define T_INTH        600

;-25 #define T_EQ          806

;-26 #define T_NE          807

;-27 #define T_GE          811

;-28 #define T_LE          824

;-29 #define T_PLUSPLUS   1219

;-30 #define T_MINUSMINUS 1225

;-31 #define T_PLUSASS    1230

;-32 #define T_MINUSASS   1231

;-33 #define T_MULASS     1232

;-34 #define T_DIVASS     1233

;-35 #define T_ANDASS     1234

;-36 #define T_ORASS      1235

;-37 #define T_LESSLESS   1240

;-38 #define T_GREATGREAT 1241

;-39 

;-40 char isPrint=1;//set screen listing

isPrint db 1
;-41 unsigned int orgDataOriginal=25000;//start of arrays, end of text

orgDataOriginal dw 25000
;-42 unsigned int orgDatai;//actual max of array, must be less than stack

orgDatai dw 0
;-43 #define COMAX        3000

;-44 char co[COMAX];//constant storage

section .bss
absolute 24000
co resb 3000
section .text
;-45 int maxco=0;

maxco dw 0
;-46 int maxco1=0;

maxco1 dw 0
;-47 #define CMDLENMAX      67

;-48 char Symbol[COLUMNMAX];

section .bss
absolute 27000
Symbol resb 128
section .text
;-49 char fname[CMDLENMAX];

section .bss
absolute 27128
fname resb 67
section .text
;-50 char namein[CMDLENMAX];

section .bss
absolute 27195
namein resb 67
section .text
;-51 char namelst[CMDLENMAX];

section .bss
absolute 27262
namelst resb 67
section .text
;-52 char *cloc=0;

cloc dw 0
;-53 int fdin=0;

fdin dw 0
;-54 int fdout=0;

fdout dw 0
;-55 int token=0;

token dw 0
;-56 int column=0;

column dw 0
;-57 char thechar=0;   //reads one char forward

thechar db 0
;-58 int iscmp=0;

iscmp dw 0
;-59 int nconst=0;

nconst dw 0
;-60 int nreturn=0;

nreturn dw 0
;-61 int nlabel=0;‚

nlabel dw 0
;-62 unsigned int lexval=0;

lexval dw 0
;-63 int typei;       char istype;

typei dw 0
istype db 0
;-64 int signi;       char issign;

signi dw 0
issign db 0
;-65 int widthi;      char iswidth;

widthi dw 0
iswidth db 0
;-66 int wi=0;

wi dw 0
;-67 #define VARMAX        400//max global and local var

;-68 #define GNAMEMAX    12800// 32*VARMAX

;-69 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 27329
GType resb 400
section .text
;-70 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 27729
GSign resb 400
section .text
;-71 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 28129
GWidth resb 400
section .text
;-72 int  GData [VARMAX];

section .bss
absolute 28529
GData resw 400
section .text
;-73 char GNameField[GNAMEMAX];

section .bss
absolute 29329
GNameField resb 12800
section .text
;-74 #define VARNAMESMAX 4000//VARMAX * 10 - IDLENMAX

;-75 char VarNames[VARNAMESMAX];//Space for global and local var names

section .bss
absolute 42129
VarNames resb 4000
section .text
;-76 char *VarNamePtr;   //first free position

VarNamePtr dw 0
;-77 int GTop=1;         //0 = empty

GTop dw 1
;-78 // int LStart=1  ;     //max global var

;-79 int LTop=1;

LTop dw 1
;-80 

;-81 #define FUNCMAX       300//max functions

;-82 #define FUNCTIONNAMESMAX 3000//Space for preceeding functon names

;-83 char FunctionNames[FUNCTIONNAMESMAX];

section .bss
absolute 46129
FunctionNames resb 3000
section .text
;-84 char *FunctionNamePtr;  //first free position in FunctionNames

FunctionNamePtr dw 0
;-85 int  FunctionMaxIx=0;   //number of functions

FunctionMaxIx dw 0
;-86 

;-87 char fgetsdest[COLUMNMAX];

section .bss
absolute 49129
fgetsdest resb 128
section .text
;-88 unsigned char *fgetsp=0;

fgetsp dw 0
;-89 unsigned int lineno=1;

lineno dw 1
;-90 unsigned char *pt=0;

pt dw 0
;-91 unsigned char *p1=0;

p1 dw 0
;-92 int DOS_ERR=0;

DOS_ERR dw 0
;-93 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-94 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-95 int ireg1;//todo

ireg1 dw 0
;-96 int mod2;

mod2 dw 0
;-97 int ireg2;

ireg2 dw 0
;-98 

;-99 int writetty()     {//char in AL


writetty: PROC
;-100     ah=0x0E;

 mov  ah, 14
;-101     asm push bx

 push bx
;-102     bx=0;     //page in BH

 mov  bx, 0
;-103     inth 0x10;

 int  16
;-104     asm pop bx

 pop bx
;-105 }

;-106 int putch(char c)  {

 ret
ENDP

putch: PROC
;-107     if (c==10)  {// LF

;Function : putch, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-108         al=13;   // CR, write CR first and then LF

 mov  al, 13
;-109         writetty();

 call writetty
;-110     }

;-111     al=c;

.putch1:
 mov  al, [bp+4]
;-112     writetty();

 call writetty
;-113 }

;-114 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-115     char c;

;-116     while(*s) {

;Function : cputs, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp-2;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
;-117         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-118         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-119         s++;

 inc  word[bp+4]
;-120     }

;-121 }

 jmp .cputs2
.cputs3:
;-122 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-123     n; // ax=n;

;Function : mkneg, Number local Var: 1
; # type sign width local variables
;96 var sign word n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
;-124     asm neg ax

 neg ax
;-125 }

;-126 

;-127 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-128     inth 0x21;

 int  33
;-129     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-130     DOS_ERR++;

 inc  word[DOS_ERR]
;-131 }

;-132 int openR (char *s) {

 ret
ENDP

openR: PROC
;-133 	dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-134     ax=0x3D02;

 mov  ax, 15618
;-135     DosInt();

 call DosInt
;-136 }

;-137 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-138     dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-139     cx=0;

 mov  cx, 0
;-140     ax=0x3C00;

 mov  ax, 15360
;-141     DosInt();

 call DosInt
;-142 }

;-143 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-144     bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;96 var sign word fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
;-145     ax=0x3E00;

 mov  ax, 15872
;-146     DosInt();

 call DosInt
;-147 }

;-148 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-149     ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov  ah, 76
;-150     al=c;

 mov  al, [bp+4]
;-151     DosInt();

 call DosInt
;-152 }

;-153 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-154     dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign word fd = bp+6
;98 var sign word len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
;-155     cx=len;

 mov  cx, [bp+8]
;-156     bx=fd;

 mov  bx, [bp+6]
;-157     ax=0x3F00;

 mov  ax, 16128
;-158     DosInt();

 call DosInt
;-159 }

;-160 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-161     asm lea dx, [bp+4]; = *n  todo: why not mov

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte n = bp+4
;97 var sign word fd = bp+6;
 ENTER  0,0
 lea dx, [bp+4]; = *n  todo: why not mov
;-162     cx=1;

 mov  cx, 1
;-163     bx=fd;

 mov  bx, [bp+6]
;-164     ax=0x4000;

 mov  ax, 16384
;-165     DosInt();

 call DosInt
;-166 }

;-167 

;-168 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-169       if (c=='_') return 1;

;Function : letter, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-170       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-171       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-172       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-173       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-174       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-175       if (c> 'Z') { if (c< 'a') return 0; }

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
;-176       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-177 }

;-178 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-179       if(c<'0') return 0;

;Function : digit, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-180       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-181       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-182 }

;-183 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-184     if (digit (c)) return 1;

;Function : alnum, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
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
;-185     if (letter(c)) return 1;

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
;-186     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-187 }

;-188 

;-189 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-190     c=0;

;Function : strlen, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign word c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-191     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-192     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-193 }

;-194 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-195     do { *s=*t; s++; t++; }

;Function : strcpy, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 ptr sign byte t = bp+6;
 ENTER  0,0
.strcpy18:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]
;-196     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-197     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-198     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-199 }

;-200 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-201     while(*p) {

;Function : eqstr, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte p = bp+4
;97 ptr sign byte q = bp+6;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21
;-202         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-203         p++;

.eqstr22:
 inc  word[bp+4]
;-204         q++;

 inc  word[bp+6]
;-205     }

;-206     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-207     return 1;

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-208 }

;-209 int strcat(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat: PROC
;-210     while (*s != 0) s++;

;Function : strcat, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 ptr sign byte t = bp+6;
 ENTER  0,0
.strcat24:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat25
 inc  word[bp+4]
;-211     strcpy(s, t);

 jmp .strcat24
.strcat25:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-212 }

;-213 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-214     while(*s) {

;Function : toupper, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27
;-215         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-216         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-217     }

;-218 }

 jmp .toupper26
.toupper27:
;-219 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-220     while(*s) {

;Function : instr1, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp+6;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131
;-221         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-222         s++;

.instr132:
 inc  word[bp+4]
;-223     }

;-224     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-225 }

;-226 

;-227 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-228     *cloc=c;

;Function : eprc, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-229     cloc++;

 inc  word[cloc]
;-230 }

;-231 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-232     char c;

;-233     while(*s) {

;Function : eprs, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp-2;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34
;-234         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-235         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-236         s++;

 inc  word[bp+4]
;-237     }

;-238 }

 jmp .eprs33
.eprs34:
;-239 

;-240 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-241     if (isPrint) {

;Function : prc, Number local Var: 1
; # type sign width local variables
;96 var unsg byte c = bp+4;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-242         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-243             asm mov ax, 13

 mov ax, 13
;-244             writetty();

 call writetty
;-245         }

;-246         asm mov al, [bp+4]; al=c;

.prc36:
 mov al, [bp+4]; al=c;
;-247         writetty();

 call writetty
;-248     }

;-249     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-250 }

;-251 

;-252 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-253     unsigned char c;

;-254     while(*s){

;Function : prscomment, Number local Var: 2
; # type sign width local variables
;96 ptr unsg byte s = bp+4
;97 var unsg byte c = bp-2;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38
;-255         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-256         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-257         s++;

 inc  word[bp+4]
;-258     }

;-259 }

 jmp .prscomment37
.prscomment38:
;-260 

;-261 int printstring(unsigned char *s) {

 LEAVE
 ret
ENDP

printstring: PROC
;-262     unsigned char c; int com;

;-263     com=0;

;Function : printstring, Number local Var: 3
; # type sign width local variables
;96 ptr unsg byte s = bp+4
;97 var unsg byte c = bp-2
;98 var sign word com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-264     while(*s) {

.printstring39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .printstring40
;-265         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-266         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .printstring41
 mov ax, [bp-4]
 or  al, al
 je .printstring42
 mov ax, 0
 mov [bp-4], ax
;-267                    else com=1;

 jmp .printstring43
.printstring42:
 mov ax, 1
 mov [bp-4], ax
;-268         if (c==92) {

.printstring43:
.printstring41:
 mov al, [bp-2]
 cmp al, 92
 jne .printstring44
;-269             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .printstring45
;-270                 s++;

 inc  word[bp+4]
;-271                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-272                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .printstring46
 mov ax, 10
 mov [bp-2], al
;-273                 if (c=='t') c= 9;

.printstring46:
 mov al, [bp-2]
 cmp al, 116
 jne .printstring47
 mov ax, 9
 mov [bp-2], al
;-274             }

.printstring47:
;-275         }

.printstring45:
;-276         prc(c);

.printstring44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-277         s++;

 inc  word[bp+4]
;-278     }

;-279 }

 jmp .printstring39
.printstring40:
;-280 

;-281 int eprnum(int n){//for docall procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-282     int e;

;-283     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;96 var sign word n = bp+4
;97 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-284         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-285         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-286     }

;-287     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-288         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-289         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-290     }

;-291     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-292     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-293     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-294 }

;-295 

;-296 int printinteger (int n){

 LEAVE
 ret
ENDP

printinteger: PROC
;-297     int e;

;-298     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : printinteger, Number local Var: 2
; # type sign width local variables
;96 var sign word n = bp+4
;97 var sign word e = bp-2;
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
;-299     if (n >= 10) {

.printinteger50:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .printinteger51
;-300         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-301         printinteger(e);

 push word [bp-2]
 call printinteger
 add  sp, 2
;-302     }

;-303     n=n%10;

.printinteger51:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-304     n += '0';

 add  word[bp+4], 48
;-305     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-306 }

;-307 

;-308 int printunsigned(unsigned int n) {

 LEAVE
 ret
ENDP

printunsigned: PROC
;-309     unsigned int e;

;-310     if (n >= 10) {

;Function : printunsigned, Number local Var: 2
; # type sign width local variables
;96 var unsg word n = bp+4
;97 var unsg word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .printunsigned52
;-311         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-312         printunsigned(e);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-313     }

;-314     n = n % 10; /*unsigned mod*/

.printunsigned52:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-315     n += '0';

 add  word[bp+4], 48
;-316     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-317 }

;-318 

;-319 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-320     fcloseR(fdin);

;Function : end1, Number local Var: 1
; # type sign width local variables
;96 var sign word n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-321     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-322     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-323 }

;-324 

;-325 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-326     isPrint=1;

;Function : error1, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-327     lineno--;

 dec  word[lineno]
;-328     printstring("\n ");

 push error1_0
 call printstring
 add  sp, 2
;-329     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-330     printstring(";Line: ");

 push error1_1
 call printstring
 add  sp, 2
;-331     printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-332     printstring(" ************** ERROR: ");

 push error1_2
 call printstring
 add  sp, 2
;-333     printstring(s);

 push word [bp+4]
 call printstring
 add  sp, 2
;-334     printstring("  in column: ");

 push error1_3
 call printstring
 add  sp, 2
;-335     printunsigned(column);

 push word [column]
 call printunsigned
 add  sp, 2
;-336     printstring("\nToken: ");

 push error1_4
 call printstring
 add  sp, 2
;-337     printunsigned(token);

 push word [token]
 call printunsigned
 add  sp, 2
;-338     printstring(", Symbol: ");

 push error1_5
 call printstring
 add  sp, 2
;-339     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-340     end1(1);

 push 1
 call end1
 add  sp, 2
;-341 }

;-342 

;-343 int printinputline() {

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
;-344     int col;

;-345     col=0;

;Function : printinputline, Number local Var: 1
; # type sign width local variables
;96 var sign word col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-346     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-347     do {

.printinputline53:
;-348         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-349         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-350         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-351         fgetsp++;

 inc  word[fgetsp]
;-352         col++;

 inc  word[bp-2]
;-353         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-354         }

.printinputline55:
;-355         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-356     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-357         printstring("\n;-");

 push printinputline_1
 call printstring
 add  sp, 2
;-358         printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-359         prc(' ');

 push 32
 call prc
 add  sp, 2
;-360         lineno++;

 inc  word[lineno]
;-361         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-362 }

;-363 

;-364 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-365     char c;

;-366     c=*fgetsp;

;Function : fgets1, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-367     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-368         printinputline();

 call printinputline
;-369         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-370         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-371         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-372         column=0;

 mov ax, 0
 mov word [column], ax
;-373     }

;-374     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-375     column++;

 inc  word[column]
;-376     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-377 }

;-378 

;-379 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-380     char r;

;-381     r = thechar;

;Function : next, Number local Var: 1
; # type sign width local variables
;96 var sign byte r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-382     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-383     return r;

 mov al, [bp-2]
 jmp .retnnext
;-384 }

;-385 

;-386 int storeVarName() {

 .retnnext:
 LEAVE
 ret
ENDP

storeVarName: PROC
;-387     unsigned int i;

;-388     VarNamePtr=strcpy(VarNamePtr, Symbol);

;Function : storeVarName, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 push word [VarNamePtr]
 call strcpy
 add  sp, 4
 mov word [VarNamePtr], ax
;-389     VarNamePtr++;

 inc  word[VarNamePtr]
;-390     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-391     i += IDLENMAX;

 add  word[bp-2], 31
;-392     if (i > VARNAMESMAX) error1("too many variable names");

 mov ax, [bp-2]
 cmp ax, 4000
 jle .storeVarName59
 push storeVarName_0
 call error1
 add  sp, 2
;-393 }

.storeVarName59:
;-394 

;-395 int searchVarName() {

 LEAVE
 ret
storeVarName_0 db "too many variable names",0
ENDP

searchVarName: PROC
;-396 	char *p; int i;

;-397 	p = &VarNames;

;Function : searchVarName, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte p = bp-2
;97 var sign word i = bp-4;
 ENTER  4,0
 mov ax, VarNames
 mov [bp-2], ax
;-398 	i=1;//start with 1

 mov ax, 1
 mov [bp-4], ax
;-399 	while (i < VARMAX) {

.searchVarName60:
 mov ax, [bp-4]
 cmp ax, 400
 jge .searchVarName61
;-400 		if (eqstr(p, Symbol)) return i;

 lea  ax, [Symbol]
 push ax
 push word [bp-2]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchVarName62
 mov ax, [bp-4]
 jmp .retnsearchVarName
;-401 		p=strlen(p) + p;

.searchVarName62:
 push word [bp-2]
 call strlen
 add  sp, 2
 add ax, [bp-2]
 mov [bp-2], ax
;-402 		p++;

 inc  word[bp-2]
;-403 		i++;

 inc  word[bp-4]
;-404 	}

;-405 	return 0;	

 jmp .searchVarName60
.searchVarName61:
 mov ax, 0
 jmp .retnsearchVarName
;-406 }

;-407 	

;-408 int adrF(char *s, unsigned int i) {

 .retnsearchVarName:
 LEAVE
 ret
ENDP

adrF: PROC
;-409     i << 5;//ax=i*32; IDLENMAX=31!

;Function : adrF, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var unsg word i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 5
;-410     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 
;-411 }

;-412 

;-413 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-414     int j;

;-415     if (i < GTop) {

;Function : printName, Number local Var: 2
; # type sign width local variables
;96 var unsg word i = bp+4
;97 var sign word j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .printName63
;-416         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-417         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-418     }

;-419     else {

 jmp .printName64
.printName63:
;-420         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-421         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-422         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName65
 push 43
 call prc
 add  sp, 2
;-423         printinteger(j);

.printName65:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-424         prc(']');

 push 93
 call prc
 add  sp, 2
;-425     }

;-426 }

.printName64:
;-427 

;-428 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-429     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL66
 mov ax, 1
 jmp .retnifEOL
;-430     if (c == 13) {//CR

.ifEOL66:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL67
;-431         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL68
 call next
 mov [bp+4], al
;-432         return 1;

.ifEOL68:
 mov ax, 1
 jmp .retnifEOL
;-433     }

;-434     return 0;

.ifEOL67:
 mov ax, 0
 jmp .retnifEOL
;-435 }

;-436 

;-437 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 49257
symboltemp resb 80
section .text
;-438 

;-439 int getlex() {


getlex: PROC
;-440     char c; char *p;

;-441     int i; int j;

;-442 g1: c=next();

;Function : getlex, Number local Var: 4
; # type sign width local variables
;97 var sign byte c = bp-2
;98 ptr sign byte p = bp-4
;99 var sign word i = bp-6
;100 var sign word j = bp-8;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-443     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex69
 mov ax, 0
 jmp .retngetlex
;-444     if (c <= ' ') goto g1;

.getlex69:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex70
 jmp .g1
;-445   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-446   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-447   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-448   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-449   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-450   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-451   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-452   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-453   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-454   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-455   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-456   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-457   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-458   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-459   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-460   if (c == '/') {

.getlex99:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-461       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex101
;-462           do c=next();

.getlex102:
 call next
 mov [bp-2], al
;-463           while(ifEOL(c)==0) return getlex();

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
;-464       }

;-465   }

.getlex101:
;-466   if (c == '/') {

.getlex100:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex104
;-467       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex105
;-468           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-469           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex106
 jmp .g2
;-470           if (thechar != '/') goto g2;

.getlex106:
 mov al, [thechar]
 cmp al, 47
 je  .getlex107
 jmp .g2
;-471           c=next();

.getlex107:
 call next
 mov [bp-2], al
;-472           return getlex();

 call getlex
 jmp .retngetlex
;-473       } else  return '/';

 jmp .getlex108
.getlex105:
 mov ax, 47
 jmp .retngetlex
;-474   }

.getlex108:
;-475   if (c == '"') {

.getlex104:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex109
;-476       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-477       c=next();

 call next
 mov [bp-2], al
;-478       while (c != '"') {

.getlex110:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex111
;-479           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-480           p++;

 inc  word[bp-4]
;-481           c=next();

 call next
 mov [bp-2], al
;-482           }

;-483           *p=0;

 jmp .getlex110
.getlex111:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-484       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-485   }

;-486   if (digit(c)) {

.getlex109:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex112
;-487       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-488       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-489       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex113
 mov ax, 88
 mov byte [thechar], al
;-490       if (thechar=='X') {

.getlex113:
 mov al, [thechar]
 cmp al, 88
 jne .getlex114
;-491           next();

 call next
;-492           while(alnum(thechar)) {

.getlex115:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex116
;-493               c=next();

 call next
 mov [bp-2], al
;-494               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex117
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-495       	       if (c>64) c=c-7;

.getlex117:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex118
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-496                c=c-48;

.getlex118:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-497                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-498                i=0;

 mov ax, 0
 mov [bp-6], ax
;-499                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-500                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-501            }

;-502        }else {

 jmp .getlex115
.getlex116:
 jmp .getlex119
.getlex114:
;-503            while(digit(thechar)) {

.getlex120:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex121
;-504                c=next();

 call next
 mov [bp-2], al
;-505                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-506                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-507                i=0;

 mov ax, 0
 mov [bp-6], ax
;-508                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-509                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-510            }

;-511        }

 jmp .getlex120
.getlex121:
;-512       return T_CONST;

.getlex119:
 mov ax, 257
 jmp .retngetlex
;-513   }

;-514   if (c==39) {

.getlex112:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex122
;-515       lexval=next();

 call next
 mov word [lexval], ax
;-516       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex123
;-517           lexval=next();

 call next
 mov word [lexval], ax
;-518           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex124
 mov ax, 10
 mov word [lexval], ax
;-519           if (lexval=='t') lexval= 9;

.getlex124:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex125
 mov ax, 9
 mov word [lexval], ax
;-520           if (lexval=='0') lexval= 0;

.getlex125:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex126
 mov ax, 0
 mov word [lexval], ax
;-521       }

.getlex126:
;-522       next();

.getlex123:
 call next
;-523       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-524   }

;-525   if (alnum(c)) {

.getlex122:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex127
;-526     strcpy(symboltemp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-527     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-528     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-529     p++;

 inc  word[bp-4]
;-530     while(alnum(thechar)) {

.getlex128:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex129
;-531         c=next();

 call next
 mov [bp-2], al
;-532         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-533         p++;

 inc  word[bp-4]
;-534     }

;-535     *p=0;

 jmp .getlex128
.getlex129:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-536     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 531
 jmp .retngetlex
;-537     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

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
;-538     if (eqstr(Symbol,"void"    )) return T_VOID;

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
;-539     if (eqstr(Symbol,"int"     )) return T_INT;

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
;-540     if (eqstr(Symbol,"long"    )) return T_LONG;

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
;-541     if (eqstr(Symbol,"inth"    )) return T_INTH;

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
;-542     if (eqstr(Symbol,"char"    )) return T_CHAR;

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
;-543     if (eqstr(Symbol,"asm"     )) return T_ASM;

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
;-544     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

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
;-545     if (eqstr(Symbol,"__emit__")) return T_EMIT;

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
;-546     if (eqstr(Symbol,"return"  )) return T_RETURN;

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
;-547     if (eqstr(Symbol,"if"      )) return T_IF;

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
;-548     if (eqstr(Symbol,"else"    )) return T_ELSE;

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
;-549     if (eqstr(Symbol,"while"   )) return T_WHILE;

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
;-550     if (eqstr(Symbol,"do"      )) return T_DO;

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
;-551     if (eqstr(Symbol,"goto"    )) return T_GOTO;

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
;-552     if (eqstr(Symbol,"define"  )) return T_DEFINE;

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
;-553 

;-554     i=0;//convert define to value

.getlex146:
 mov ax, 0
 mov [bp-6], ax
;-555     while (i < GTop) {

.getlex147:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex148
;-556         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-557         if (eqstr(Symbol,j)) {

 push word [bp-8]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex149
;-558             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex150
;-559                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-560                 strcpy(Symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-561                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-562             }

;-563         }

.getlex150:
;-564         i++;

.getlex149:
 inc  word[bp-6]
;-565     }

;-566     return T_NAME; } error1("Input item not recognized");

 jmp .getlex147
.getlex148:
 mov ax, 256
 jmp .retngetlex
.getlex127:
 push getlex_18
 call error1
 add  sp, 2
;-567 }

;-568 

;-569 int istoken(int t) {

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
;-570     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;97 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken151
;-571         token=getlex();

 call getlex
 mov word [token], ax
;-572         return 1;

 mov ax, 1
 jmp .retnistoken
;-573     }

;-574     return 0;

.istoken151:
 mov ax, 0
 jmp .retnistoken
;-575 }

;-576 

;-577 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-578     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;97 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect152
;-579         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-580         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-581         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-582         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-583         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-584     }

;-585 }

.expect152:
;-586 

;-587 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-588     if (i < GTop) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;97 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v153
 push 91
 call prc
 add  sp, 2
;-589     printName(i);

.v153:
 push word [bp+4]
 call printName
 add  sp, 2
;-590     if (i < GTop) prc(']');

 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v154
 push 93
 call prc
 add  sp, 2
;-591 }

.v154:
;-592 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-593     int i;

;-594     i=strlen(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;97 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-595     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen155
 push checknamelen_0
 call error1
 add  sp, 2
;-596 }

.checknamelen155:
;-597 

;-598 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-599     unsigned int i; unsigned int j;

;-600     i=GTop;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;97 var unsg word i = bp-2
;98 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, [GTop]
 mov [bp-2], ax
;-601     while(i<LTop) {//todo look for local var first

.checkName156:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName157
;-602         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-603         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName158
 mov ax, [bp-2]
 jmp .retncheckName
;-604         i++;

.checkName158:
 inc  word[bp-2]
;-605     }

;-606     i=1;

 jmp .checkName156
.checkName157:
 mov ax, 1
 mov [bp-2], ax
;-607     while(i<GTop) {

.checkName159:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName160
;-608         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-609         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName161
 mov ax, [bp-2]
 jmp .retncheckName
;-610         i++;

.checkName161:
 inc  word[bp-2]
;-611     }

;-612     return 0;

 jmp .checkName159
.checkName160:
 mov ax, 0
 jmp .retncheckName
;-613 }

;-614 

;-615 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-616     unsigned int i;

;-617     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;97 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-618     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname162
 push searchname_0
 call error1
 add  sp, 2
;-619     return i;

.searchname162:
 mov ax, [bp-2]
 jmp .retnsearchname
;-620 }

;-621 

;-622 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-623     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1163
 push name1_0
 call error1
 add  sp, 2
;-624     token=getlex();

.name1163:
 call getlex
 mov word [token], ax
;-625 }

;-626 

;-627 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-628     int m; //0=V,1=*,2=&

;-629     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;97 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-630     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 83
 mov byte [issign], al
;-631     if(istoken(T_UNSIGNED)) issign='U';

.typeName164:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 85
 mov byte [issign], al
;-632     iswidth=2;

.typeName165:
 mov ax, 2
 mov byte [iswidth], al
;-633     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 0
 mov byte [iswidth], al
;-634     if(istoken(T_CHAR))     iswidth=1;

.typeName166:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 1
 mov byte [iswidth], al
;-635     if(istoken(T_INT))      iswidth=2;

.typeName167:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName168
 mov ax, 2
 mov byte [iswidth], al
;-636     if(istoken(T_LONG))     iswidth=4;

.typeName168:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName169
 mov ax, 4
 mov byte [iswidth], al
;-637     istype='V';

.typeName169:
 mov ax, 86
 mov byte [istype], al
;-638     m=0;

 mov ax, 0
 mov [bp-2], ax
;-639     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName170
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-640     if(istoken('&'))  {istype='&'; m=2;}

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
;-641     name1();

.typeName171:
 call name1
;-642     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-643 }

;-644 

;-645 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-646     char c;

;-647     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;97 var sign word i = bp+4
;98 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-648     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes172
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes173
.gettypes172:
 mov ax, 0
 mov word [signi], ax
;-649     c=GWidth[i];

.gettypes173:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-650     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-651     wi=0;

 mov ax, 0
 mov word [wi], ax
;-652     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes174
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-653     if (c==2) {widthi=2;wi=2;}

.gettypes174:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes175
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-654     if (c==4) {widthi=4;wi=4;}

.gettypes175:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes176
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-655     c=GType [i];

.gettypes176:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-656     typei=0;

 mov ax, 0
 mov word [typei], ax
;-657     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes177
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-658     if (c=='&')  typei=2;

.gettypes177:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes178
 mov ax, 2
 mov word [typei], ax
;-659     return i;

.gettypes178:
 mov ax, [bp+4]
 jmp .retngettypes
;-660 }

;-661 

;-662 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-663     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal179
 push addlocal_0
 call error1
 add  sp, 2
;-664     if (checkName() != 0) error1("Variable already defined");

.addlocal179:
 call checkName
 cmp ax, 0
 je  .addlocal180
 push addlocal_1
 call error1
 add  sp, 2
;-665     GSign[LTop]=issign;

.addlocal180:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-666     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-667     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-668     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-669     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-670     storeVarName();

 call storeVarName
;-671 }

;-672 

;-673 

;-674 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-675        if(iscmp==T_EQ) printstring("\n jne .");         //ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;97 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg181
 push cmpneg_0
 call printstring
 add  sp, 2
;-676   else if(iscmp==T_NE) printstring("\n je  .");         //ZF=1

 jmp .cmpneg182
.cmpneg181:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg183
 push cmpneg_1
 call printstring
 add  sp, 2
;-677   else if(iscmp==T_LE) if (ids) printstring("\n jg  .");//ZF=0 SF=O

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
;-678                        else     printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg187
.cmpneg186:
 push cmpneg_3
 call printstring
 add  sp, 2
;-679   else if(iscmp==T_GE) if (ids){printstring(" ;unsigned : ");

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
;-680                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-681                                 printstring("\n jl  .");}//SF!=O

 push cmpneg_5
 call printstring
 add  sp, 2
;-682                        else    {printstring(" ;unsigned : ");

 jmp .cmpneg191
.cmpneg190:
 push cmpneg_6
 call printstring
 add  sp, 2
;-683                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-684                                 printstring("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call printstring
 add  sp, 2
;-685   else if(iscmp=='<' ) printstring("\n jge .");          //SF=O

.cmpneg191:
 jmp .cmpneg192
.cmpneg189:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg193
 push cmpneg_8
 call printstring
 add  sp, 2
;-686   else if(iscmp=='>' ) printstring("\n jle .");          //ZF=1 | SF!=O

 jmp .cmpneg194
.cmpneg193:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg195
 push cmpneg_9
 call printstring
 add  sp, 2
;-687   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg196
.cmpneg195:
 push cmpneg_10
 call error1
 add  sp, 2
;-688 }

.cmpneg196:
.cmpneg194:
.cmpneg192:
.cmpneg188:
.cmpneg184:
.cmpneg182:
;-689 

;-690 int isrelational() {

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
;-691     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational197
 jmp .w
;-692     if (token==T_NE) goto w;

.isrelational197:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational198
 jmp .w
;-693     if (token==T_LE) goto w;

.isrelational198:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational199
 jmp .w
;-694     if (token==T_GE) goto w;

.isrelational199:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational200
 jmp .w
;-695     if (token=='<' ) goto w;

.isrelational200:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational201
 jmp .w
;-696     if (token=='>' ) goto w;

.isrelational201:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational202
 jmp .w
;-697     return 0;

.isrelational202:
 mov ax, 0
 jmp .retnisrelational
;-698 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-699     token=getlex();

 call getlex
 mov word [token], ax
;-700     return 1;

 mov ax, 1
 jmp .retnisrelational
;-701 }

;-702 

;-703 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-704   if (strlen(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg203
 mov ax, 0
 jmp .retncheckreg
;-705   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

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
;-706   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

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
;-707   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

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
;-708   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

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
;-709   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

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
;-710   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

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
;-711   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

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
;-712   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

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
;-713   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

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
;-714   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

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
;-715   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

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
;-716   // (eqstr(Symbol,"ip")) return 45;

;-717   if (strlen(Symbol) >   3) return 0;

.checkreg225:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg226
 mov ax, 0
 jmp .retncheckreg
;-718   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

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
;-719   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

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
;-720   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

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
;-721   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

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
;-722 //  if (eqstr(Symbol,"cr0")) return 71;

;-723   return 0;

.checkreg234:
 mov ax, 0
 jmp .retncheckreg
;-724 }

;-725 

;-726 char printregstr[]

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
;-727 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-728 

;-729 int printreg(int i) {


printreg: PROC
;-730     unsigned int k; unsigned char c;

;-731     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;98 var sign word i = bp+4
;99 var unsg word k = bp-2
;100 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-732     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-733     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-734     i++;

 inc  word[bp+4]
;-735     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-736     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-737     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-738     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg235
;-739         i++;

 inc  word[bp+4]
;-740         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-741         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-742         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-743         }

;-744 }

.printreg235:
;-745 

;-746 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 49337
ops resb 5
section .text
;-747 int doreg1(int iscmp1) {


doreg1: PROC
;-748     int i;

;-749     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;99 var sign word iscmp1 = bp+4
;100 var sign word i = bp-2;
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
;-750     if (istoken(T_PLUSASS))    strcpy(ops, "add");

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
;-751     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

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
;-752     if (istoken(T_ANDASS))     strcpy(ops, "and");

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
;-753     if (istoken(T_ORASS))      strcpy(ops, "or" );

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
;-754     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

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
;-755     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

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
;-756     if (iscmp1 == 1) {

.doreg1242:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1243
;-757             token=getlex();

 call getlex
 mov word [token], ax
;-758             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1244
 push doreg1_7
 call error1
 add  sp, 2
;-759             strcpy(ops, "cmp");

.doreg1244:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-760         }

;-761     printstring("\n ");

.doreg1243:
 push doreg1_9
 call printstring
 add  sp, 2
;-762     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-763     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-764     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-765     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-766 

;-767     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1245
;-768         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-769         goto reg1;

 jmp .reg1
;-770         }

;-771     mod2=typeName();

.doreg1245:
 call typeName
 mov word [mod2], ax
;-772     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-773     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1246
;-774         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-775         goto reg1;

 jmp .reg1
;-776         }

;-777     i=searchname();

.doreg1246:
 call searchname
 mov [bp-2], ax
;-778     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1247
 push word [bp-2]
 call printName
 add  sp, 2
;-779         else v(i);

 jmp .doreg1248
.doreg1247:
 push word [bp-2]
 call v
 add  sp, 2
;-780 reg1: if (iscmp1 == 1) {

.doreg1248:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1249
;-781     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-782     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-783     expect(')');

 push 41
 call expect
 add  sp, 2
;-784     }

;-785 }

.doreg1249:
;-786 

;-787 int compoundass(char *op, int mode, int id1) {

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
;-788     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;99 ptr sign byte op = bp+4
;100 var sign word mode = bp+6
;101 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass250
 push compoundass_0
 call error1
 add  sp, 2
;-789     printstring("\n ");

.compoundass250:
 push compoundass_1
 call printstring
 add  sp, 2
;-790     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-791     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-792     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-793     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass251
 push compoundass_3
 call printstring
 add  sp, 2
;-794         else printstring("byte");

 jmp .compoundass252
.compoundass251:
 push compoundass_4
 call printstring
 add  sp, 2
;-795     v(id1);

.compoundass252:
 push word [bp+8]
 call v
 add  sp, 2
;-796     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-797     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-798     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-799 }

;-800 

;-801 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-802     gettypes(id1);

;Function : dovar1, Number local Var: 4
; # type sign width local variables
;99 var sign word mode = bp+4
;100 var sign word op = bp+6
;101 var sign word ixarr = bp+8
;102 var sign word id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-803     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1253
;-804         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-805         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-806         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-807         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1254
 push dovar1_2
 call printstring
 add  sp, 2
;-808         if(widthi == 2) printstring(" ax, [bx]");

.dovar1254:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_3
 call printstring
 add  sp, 2
;-809         return;

.dovar1255:
 jmp .retndovar1
;-810         }

;-811     if (mode==2){// & = adr

.dovar1253:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1256
;-812         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-813         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-814         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-815         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-816         return;

 jmp .retndovar1
;-817         }

;-818     if (ixarr) {//array

.dovar1256:
 mov ax, [bp+8]
 or  al, al
 je .dovar1257
;-819         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-820         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-821         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_7
 call printstring
 add  sp, 2
;-822         printstring("\n ");

.dovar1258:
 push dovar1_8
 call printstring
 add  sp, 2
;-823         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-824         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1259
 push dovar1_9
 call printstring
 add  sp, 2
;-825             else printstring(" al, ");

 jmp .dovar1260
.dovar1259:
 push dovar1_10
 call printstring
 add  sp, 2
;-826         prc('[');

.dovar1260:
 push 91
 call prc
 add  sp, 2
;-827         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-828         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-829         return;

 jmp .retndovar1
;-830         }

;-831     printstring("\n ");

.dovar1257:
 push dovar1_12
 call printstring
 add  sp, 2
;-832     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-833     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1261
 push dovar1_13
 call printstring
 add  sp, 2
;-834     if(wi==2) printstring(" ax, ");

.dovar1261:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1262
 push dovar1_14
 call printstring
 add  sp, 2
;-835     if(wi==4) printstring(" eax, ");

.dovar1262:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1263
 push dovar1_15
 call printstring
 add  sp, 2
;-836     v(id1);

.dovar1263:
 push word [bp+10]
 call v
 add  sp, 2
;-837 }

;-838 

;-839 int rterm(char *op) {

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
;-840     int mode; int opint; int ixarr; int id1;

;-841     if (istoken(T_CONST)) {

;Function : rterm, Number local Var: 5
; # type sign width local variables
;99 ptr sign byte op = bp+4
;100 var sign word mode = bp-2
;101 var sign word opint = bp-4
;102 var sign word ixarr = bp-6
;103 var sign word id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm264
;-842         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-843         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-844         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm265
 push rterm_1
 call printstring
 add  sp, 2
;-845         if (wi==2) printstring(" ax, ");

.rterm265:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm266
 push rterm_2
 call printstring
 add  sp, 2
;-846         if (wi==4) printstring(" eax, ");

.rterm266:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm267
 push rterm_3
 call printstring
 add  sp, 2
;-847         printunsigned(lexval);

.rterm267:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-848         return;

 jmp .retnrterm
;-849         }

;-850     mode=typeName();

.rterm264:
 call typeName
 mov [bp-2], ax
;-851     id1=searchname();

 call searchname
 mov [bp-8], ax
;-852     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-853     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm268
;-854         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-855         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-856         expect(']');

 push 93
 call expect
 add  sp, 2
;-857         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-858         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm269
 push rterm_4
 call error1
 add  sp, 2
;-859         }

.rterm269:
;-860     if (eqstr(Symbol,"ax")) return;

.rterm268:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm270
 jmp .retnrterm
;-861     opint=op;

.rterm270:
 mov ax, [bp+4]
 mov [bp-4], ax
;-862     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-863 }

;-864 

;-865 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-866     gettypes(i);

;Function : doassign, Number local Var: 4
; # type sign width local variables
;99 var sign word mode = bp+4
;100 var sign word i = bp+6
;101 var sign word ixarr = bp+8
;102 var sign word ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-867     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign271
;-868         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-869         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-870         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign272
 push doassign_1
 call printstring
 add  sp, 2
;-871             else  printstring("\n mov  [bx], al");

 jmp .doassign273
.doassign272:
 push doassign_2
 call printstring
 add  sp, 2
;-872         return;

.doassign273:
 jmp .retndoassign
;-873         }

;-874     if (mode==2) {// & = adr

.doassign271:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign274
;-875         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-876         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-877         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-878         return;

 jmp .retndoassign
;-879         }

;-880     if (ixarr) {

.doassign274:
 mov ax, [bp+8]
 or  al, al
 je .doassign275
;-881         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-882         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign276
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-883             else v(ixarr);

 jmp .doassign277
.doassign276:
 push word [bp+8]
 call v
 add  sp, 2
;-884         if (wi==2) printstring("\n shl bx, 1");

.doassign277:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign278
 push doassign_6
 call printstring
 add  sp, 2
;-885         printstring("\n mov [");

.doassign278:
 push doassign_7
 call printstring
 add  sp, 2
;-886         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-887         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign279
 push doassign_8
 call printstring
 add  sp, 2
;-888             else printstring("+bx], al");

 jmp .doassign280
.doassign279:
 push doassign_9
 call printstring
 add  sp, 2
;-889         return;

.doassign280:
 jmp .retndoassign
;-890         }

;-891     if (wi==1){

.doassign275:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign281
;-892         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-893         if(i<GTop) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign282
 push doassign_11
 call printstring
 add  sp, 2
;-894         v(i);

.doassign282:
 push word [bp+6]
 call v
 add  sp, 2
;-895         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-896         return;

 jmp .retndoassign
;-897         }

;-898     if (wi==2){

.doassign281:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign283
;-899         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-900         if(i<GTop) printstring("word ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign284
 push doassign_14
 call printstring
 add  sp, 2
;-901         v(i);

.doassign284:
 push word [bp+6]
 call v
 add  sp, 2
;-902         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-903         return;

 jmp .retndoassign
;-904         }

;-905     if (wi==4){

.doassign283:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign285
;-906         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-907         if(i<GTop) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign286
 push doassign_17
 call printstring
 add  sp, 2
;-908         v(i);

.doassign286:
 push word [bp+6]
 call v
 add  sp, 2
;-909         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-910         return;

 jmp .retndoassign
;-911         }

;-912 }

.doassign285:
;-913 

;-914 int domul(int ids) {

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
;-915     if (ids) rterm("imul");

;Function : domul, Number local Var: 1
; # type sign width local variables
;99 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul287
 push domul_0
 call rterm
 add  sp, 2
;-916         else {

 jmp .domul288
.domul287:
;-917         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul289
;-918             printstring("\n mov bx, ");

 push domul_1
 call printstring
 add  sp, 2
;-919             printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-920             printstring("\n mul bx");

 push domul_2
 call printstring
 add  sp, 2
;-921             }

;-922         else error1("with MUL only const number as multipl. allowed");

 jmp .domul290
.domul289:
 push domul_3
 call error1
 add  sp, 2
;-923         }

.domul290:
;-924 }

.domul288:
;-925 

;-926 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multipl. allowed",0
ENDP

doidiv: PROC
;-927     int mode; int id1;

;-928     if (istoken(T_CONST)) {

;Function : doidiv, Number local Var: 3
; # type sign width local variables
;99 var sign word ids = bp+4
;100 var sign word mode = bp-2
;101 var sign word id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv291
;-929         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-930         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-931         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv292
 push doidiv_1
 call printstring
 add  sp, 2
;-932             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv293
.doidiv292:
 push doidiv_2
 call printstring
 add  sp, 2
;-933         }

.doidiv293:
;-934     else {

 jmp .doidiv294
.doidiv291:
;-935         mode=typeName();

 call typeName
 mov [bp-2], ax
;-936         id1=searchname();

 call searchname
 mov [bp-4], ax
;-937         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv295
 push doidiv_3
 call error1
 add  sp, 2
;-938         gettypes(id1);

.doidiv295:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-939         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv296
 push doidiv_4
 call error1
 add  sp, 2
;-940         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv296:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv297
 push doidiv_5
 call error1
 add  sp, 2
;-941         printstring("\n mov bx, ");

.doidiv297:
 push doidiv_6
 call printstring
 add  sp, 2
;-942         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-943         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv298
 push doidiv_7
 call printstring
 add  sp, 2
;-944             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv299
.doidiv298:
 push doidiv_8
 call printstring
 add  sp, 2
;-945     }

.doidiv299:
;-946 }

.doidiv294:
;-947 

;-948 int domod(int ids) {

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
;-949     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;99 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-950     printstring("\n mov ax, dx");

 push domod_0
 call printstring
 add  sp, 2
;-951 }

;-952 

;-953 

;-954 int docalltype[10]; int docallvalue[10];

 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 49342
docalltype resw 10
section .text
section .bss
absolute 49362
docallvalue resw 10
section .text
;-955 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name

section .bss
absolute 49382
procname resb 17
section .text
;-956 

;-957 int docall() {


docall: PROC
;-958     int i; int narg; int t0; int n0;  int sz32;

;-959     narg=0;

;Function : docall, Number local Var: 5
; # type sign width local variables
;102 var sign word i = bp-2
;103 var sign word narg = bp-4
;104 var sign word t0 = bp-6
;105 var sign word n0 = bp-8
;106 var sign word sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-960     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-961     checknamelen();

 call checknamelen
;-962     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-963     expect('(');

 push 40
 call expect
 add  sp, 2
;-964 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall300
;-965 	    do {

.docall301:
;-966 	        narg++;

 inc  word[bp-4]
;-967 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall302
 push docall_0
 call error1
 add  sp, 2
;-968 	        t0=0;

.docall302:
 mov ax, 0
 mov [bp-6], ax
;-969             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall303
;-970                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-971                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-972                 }

;-973             if(istoken(T_STRING)){

.docall303:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall304
;-974                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-975                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-976                 eprs("\n");

 push docall_1
 call eprs
 add  sp, 2
;-977                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-978                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-979                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-980                 eprs(" db ");

 push docall_2
 call eprs
 add  sp, 2
;-981                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-982                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-983                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-984                 eprs(",0");

 push docall_3
 call eprs
 add  sp, 2
;-985                 nconst++;

 inc  word[nconst]
;-986                 }

;-987             if(istoken('&'))     {

.docall304:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall305
;-988                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-989                 name1();

 call name1
;-990                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-991                 }

;-992             if(istoken(T_NAME))  {

.docall305:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall306
;-993 

;-994 

;-995 

;-996                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-997                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-998                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-999                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-1000                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall307
 mov ax, 3
 mov [bp-6], ax
;-1001 

;-1002                 }

.docall307:
;-1003             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall306:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall308
 push docall_4
 call error1
 add  sp, 2
;-1004             docalltype [narg] = t0;

.docall308:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-1005             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-1006         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall309
 jmp .docall301
.docall309:
;-1007 

;-1008   	expect(')');

 push 41
 call expect
 add  sp, 2
;-1009   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-1010     do {

.docall310:
;-1011         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-1012         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-1013         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall311
;-1014             printstring("\n push ");

 push docall_5
 call printstring
 add  sp, 2
;-1015             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1016             }

;-1017         if(t0==2){

.docall311:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall312
;-1018             printstring("\n push ");

 push docall_6
 call printstring
 add  sp, 2
;-1019             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1020             prc(95);

 push 95
 call prc
 add  sp, 2
;-1021             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1022             }

;-1023         if(t0==3){

.docall312:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall313
;-1024             printstring("\n lea  ax, ");

 push docall_7
 call printstring
 add  sp, 2
;-1025             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1026             printstring("\n push ax");

 push docall_8
 call printstring
 add  sp, 2
;-1027             }

;-1028         if(t0==4){

.docall313:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall314
;-1029             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1030             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall315
;-1031                 printstring("\n push word ");

 push docall_9
 call printstring
 add  sp, 2
;-1032                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1033                 }

;-1034             else {

 jmp .docall316
.docall315:
;-1035                 printstring("\n mov al, byte ");

 push docall_10
 call printstring
 add  sp, 2
;-1036                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1037                 printstring("\n mov ah, 0\n push ax");

 push docall_11
 call printstring
 add  sp, 2
;-1038                 }

;-1039             }

.docall316:
;-1040         if(t0==5){

.docall314:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall317
;-1041             printstring("\n push ");

 push docall_12
 call printstring
 add  sp, 2
;-1042             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1043             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall318
 mov ax, [bp-10]
 add ax, 2
;-1044             }

.docall318:
;-1045         i--;

.docall317:
 dec  word[bp-2]
;-1046         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall319
 jmp .docall310
.docall319:
;-1047     }

;-1048 	printstring("\n call ");

.docall300:
 push docall_13
 call printstring
 add  sp, 2
;-1049 	printstring(&procname);

 lea  ax, [procname]
 push ax
 call printstring
 add  sp, 2
;-1050 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall320
;-1051 	    printstring("\n add  sp, ");

 push docall_14
 call printstring
 add  sp, 2
;-1052         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1053         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1054         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1055         }

;-1056 }

.docall320:
;-1057 

;-1058 

;-1059 int expr() {

 LEAVE
 ret
docall_0 db "Max. 9 parameters",0
docall_1 db "\n",0
docall_2 db " db ",0
docall_3 db ",0",0
docall_4 db "parameter not recognized (no * allowed)",0
docall_5 db "\n push ",0
docall_6 db "\n push ",0
docall_7 db "\n lea  ax, ",0
docall_8 db "\n push ax",0
docall_9 db "\n push word ",0
docall_10 db "\n mov al, byte ",0
docall_11 db "\n mov ah, 0\n push ax",0
docall_12 db "\n push ",0
docall_13 db "\n call ",0
docall_14 db "\n add  sp, ",0
ENDP

expr: PROC
;-1060     int mode;   int id1;

;-1061     int ixarr;  int ixconst;

;-1062     int ids;    int isCONST;

;-1063     int i;      unsigned char *p;

;-1064 

;-1065     if (istoken(T_CONST)) {// constant ;

;Function : expr, Number local Var: 8
; # type sign width local variables
;102 var sign word mode = bp-2
;103 var sign word id1 = bp-4
;104 var sign word ixarr = bp-6
;105 var sign word ixconst = bp-8
;106 var sign word ids = bp-10
;107 var sign word isCONST = bp-12
;108 var sign word i = bp-14
;109 ptr unsg byte p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr321
;-1066         printstring("\n mov ax, ");

 push expr_0
 call printstring
 add  sp, 2
;-1067         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1068         return 4;

 mov ax, 4
 jmp .retnexpr
;-1069         }

;-1070     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr321:
 call typeName
 mov [bp-2], ax
;-1071     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1072     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr322
;-1073         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1074         return;

 jmp .retnexpr
;-1075         }

;-1076 

;-1077     if (token=='(')  {

.expr322:
 mov ax, [token]
 cmp ax, 40
 jne .expr323
;-1078         docall();

 call docall
;-1079         goto e1;

 jmp .e1
;-1080         }

;-1081 

;-1082     id1=searchname();

.expr323:
 call searchname
 mov [bp-4], ax
;-1083     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1084     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1085     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1086     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1087     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr324
;-1088         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr325
;-1089             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1090             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1091             expect(']');

 push 93
 call expect
 add  sp, 2
;-1092             }

;-1093         else {

 jmp .expr326
.expr325:
;-1094             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1095             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1096             expect(']');

 push 93
 call expect
 add  sp, 2
;-1097             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1098             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr327
 push expr_1
 call error1
 add  sp, 2
;-1099             }

.expr327:
;-1100         }

.expr326:
;-1101     if (istoken(T_PLUSPLUS  )) {

.expr324:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr328
;-1102         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr329
 push expr_2
 call error1
 add  sp, 2
;-1103         printstring("\n inc  ");

.expr329:
 push expr_3
 call printstring
 add  sp, 2
;-1104         if (wi==2) printstring("word"); else printstring("byte");

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
;-1105         v(id1);

.expr331:
 push word [bp-4]
 call v
 add  sp, 2
;-1106         goto e1;

 jmp .e1
;-1107         }

;-1108     if (istoken(T_MINUSMINUS)) {

.expr328:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr332
;-1109         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr333
 push expr_6
 call error1
 add  sp, 2
;-1110         printstring("\n dec  ");

.expr333:
 push expr_7
 call printstring
 add  sp, 2
;-1111         if (wi==2) printstring("word"); else printstring("byte");

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
;-1112         v(id1);

.expr335:
 push word [bp-4]
 call v
 add  sp, 2
;-1113         goto e1;

 jmp .e1
;-1114         }

;-1115 

;-1116     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

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
;-1117     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

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
;-1118     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

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
;-1119     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

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
;-1120     if (istoken(T_MULASS  )) error1("not implemented");

.expr339:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
 push expr_14
 call error1
 add  sp, 2
;-1121     if (istoken(T_DIVASS  )) error1("not implemented");

.expr340:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push expr_15
 call error1
 add  sp, 2
;-1122 

;-1123     if (istoken('=')) {

.expr341:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr342
;-1124         expr();

 call expr
;-1125         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1126         goto e1;

 jmp .e1
;-1127         }

;-1128     dovar1(mode, "mov", ixarr, id1);

.expr342:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1129 

;-1130 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
 push expr_17
 call rterm
 add  sp, 2
;-1131     else if (istoken('-')) rterm("sub");

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
;-1132     else if (istoken('&')) rterm("and");

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
;-1133     else if (istoken('|')) rterm("or" );

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
;-1134     else if (istoken(T_LESSLESS)) rterm("shl");

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
;-1135     else if (istoken(T_GREATGREAT)) rterm("shr");

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
;-1136     else if (istoken('*')) domul (ids);

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
;-1137     else if (istoken('/')) doidiv(ids);

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
;-1138     else if (istoken('%')) domod (ids);

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
;-1139     if (isrelational()) {

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
;-1140         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1141         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1142         }

;-1143     return 0;

.expr360:
 mov ax, 0
 jmp .retnexpr
;-1144 }

;-1145 

;-1146 int pexpr() {//called from if, do, while

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
;-1147     expect('(');

 push 40
 call expect
 add  sp, 2
;-1148     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1149     if (token==T_NAME) {//todo

 mov ax, [token]
 cmp ax, 256
 jne .pexpr361
;-1150         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1151         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr362
;-1152             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1153             return;

 jmp .retnpexpr
;-1154             }

;-1155         }

.pexpr362:
;-1156 

;-1157     expr();

.pexpr361:
 call expr
;-1158     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr363
 push pexpr_0
 call printstring
 add  sp, 2
;-1159     printstring(fname);

.pexpr363:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1160     expect(')');

 push 41
 call expect
 add  sp, 2
;-1161 }

;-1162 

;-1163 

;-1164 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1165     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;102 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1166     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1167     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1168     prc(':');

 push 58
 call prc
 add  sp, 2
;-1169 }

;-1170 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1171     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;102 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1172     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1173     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1174 }

;-1175 

;-1176 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1177     int c; char cha;

;-1178     int jdest; int tst; int jtemp;

;-1179     if(istoken('{')) {

;Function : stmt, Number local Var: 5
; # type sign width local variables
;102 var sign word c = bp-2
;103 var sign byte cha = bp-4
;104 var sign word jdest = bp-6
;105 var sign word tst = bp-8
;106 var sign word jtemp = bp-10;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt364
;-1180         while(istoken('}')==0) stmt();

.stmt365:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt366
 call stmt
;-1181         }

 jmp .stmt365
.stmt366:
;-1182     else if(istoken(T_IF)) {

 jmp .stmt367
.stmt364:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt368
;-1183         pexpr();

 call pexpr
;-1184         nlabel++;

 inc  word[nlabel]
;-1185         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1186         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1187         stmt();

 call stmt
;-1188         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt369
;-1189             nlabel++;

 inc  word[nlabel]
;-1190             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1191             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1192             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1193             stmt();

 call stmt
;-1194             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1195         }

;-1196         else prlabel(jdest);

 jmp .stmt370
.stmt369:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1197     }

.stmt370:
;-1198     else if(istoken(T_DO)) {

 jmp .stmt371
.stmt368:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372
;-1199         nlabel++;

 inc  word[nlabel]
;-1200         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1201         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1202         stmt();

 call stmt
;-1203         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1204         pexpr();

 call pexpr
;-1205         nlabel++;

 inc  word[nlabel]
;-1206         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1207         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1208         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1209          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1210     }

;-1211     else if(istoken(T_WHILE)) {

 jmp .stmt373
.stmt372:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt374
;-1212         nlabel++;

 inc  word[nlabel]
;-1213         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1214         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1215         pexpr();

 call pexpr
;-1216         nlabel++;

 inc  word[nlabel]
;-1217         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1218         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1219         stmt();

 call stmt
;-1220         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1221         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1222     }

;-1223     else if(istoken(T_GOTO))  {

 jmp .stmt375
.stmt374:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt376
;-1224         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1225         name1();

 call name1
;-1226         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1227         expect(';');

 push 59
 call expect
 add  sp, 2
;-1228     }

;-1229     else if(token==T_ASM)     {

 jmp .stmt377
.stmt376:
 mov ax, [token]
 cmp ax, 518
 jne .stmt378
;-1230       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1231       c=next();

 call next
 mov [bp-2], ax
;-1232       while(c != '\n') {

.stmt379:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt380
;-1233         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1234         c=next();

 call next
 mov [bp-2], ax
;-1235         };

 jmp .stmt379
.stmt380:
;-1236         token=getlex();

 call getlex
 mov word [token], ax
;-1237     }

;-1238     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt381
.stmt378:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt382
;-1239         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt383
;-1240             printstring("\n"); cha=next();

 push stmt_2
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1241             while(cha!= '}') {

.stmt384:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt385
;-1242                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1243                 cha=next();

 call next
 mov [bp-4], al
;-1244             }

;-1245             token=getlex();

 jmp .stmt384
.stmt385:
 call getlex
 mov word [token], ax
;-1246         } else error1("Curly open expected");

 jmp .stmt386
.stmt383:
 push stmt_3
 call error1
 add  sp, 2
;-1247     }

.stmt386:
;-1248     else if(istoken(T_INTH))  {

 jmp .stmt387
.stmt382:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt388
;-1249         printstring("\n int  ");

 push stmt_4
 call printstring
 add  sp, 2
;-1250         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1251         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1252         expect(';');

 push 59
 call expect
 add  sp, 2
;-1253     }

;-1254     else if(istoken(T_EMIT)) {

 jmp .stmt389
.stmt388:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt390
;-1255       printstring("\n db ");

 push stmt_5
 call printstring
 add  sp, 2
;-1256     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1257       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1258       token=getlex();

 call getlex
 mov word [token], ax
;-1259       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt391
;-1260           prc(',');

 push 44
 call prc
 add  sp, 2
;-1261           goto L1;

 jmp .L1
;-1262       }

;-1263       expect(')');

.stmt391:
 push 41
 call expect
 add  sp, 2
;-1264     }

;-1265     else if(istoken(';'))      { }

 jmp .stmt392
.stmt390:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt393
;-1266     else if(istoken(T_RETURN)) {

 jmp .stmt394
.stmt393:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt395
;-1267         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt396
 call expr
;-1268         printstring("\n jmp .retn");

.stmt396:
 push stmt_6
 call printstring
 add  sp, 2
;-1269         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1270         nreturn++;

 inc  word[nreturn]
;-1271         expect(';');

 push 59
 call expect
 add  sp, 2
;-1272     }

;-1273     else if(thechar==':')      {

 jmp .stmt397
.stmt395:
 mov al, [thechar]
 cmp al, 58
 jne .stmt398
;-1274         printstring("\n."); // Label

 push stmt_7
 call printstring
 add  sp, 2
;-1275         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1276         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1277         expect(':');

 push 58
 call expect
 add  sp, 2
;-1278     }

;-1279     else  {expr();; expect(';'); }

 jmp .stmt399
.stmt398:
 call expr
 push 59
 call expect
 add  sp, 2
;-1280 }

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
;-1281 

;-1282 int isvariable() {

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
;-1283     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable400
 jmp .v1
;-1284     if(token==T_UNSIGNED) goto v1;

.isvariable400:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable401
 jmp .v1
;-1285     if(token==T_CHAR)     goto v1;

.isvariable401:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable402
 jmp .v1
;-1286     if(token==T_INT)      goto v1;

.isvariable402:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable403
 jmp .v1
;-1287     if(token==T_LONG)     goto v1;

.isvariable403:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable404
 jmp .v1
;-1288     return 0;

.isvariable404:
 mov ax, 0
 jmp .retnisvariable
;-1289 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1290 }

;-1291 

;-1292 //***************************************************************

;-1293 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1294     unsigned int j;

;-1295     char c;

;-1296     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;102 var unsg word i = bp+4
;103 var unsg word j = bp-2
;104 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1297     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1298     prc(32);

 push 32
 call prc
 add  sp, 2
;-1299     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1300     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar405
 push listvar_1
 call printstring
 add  sp, 2
;-1301     if(c=='*')printstring("ptr ");

.listvar405:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar406
 push listvar_2
 call printstring
 add  sp, 2
;-1302     if(c=='&')printstring("arr ");

.listvar406:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar407
 push listvar_3
 call printstring
 add  sp, 2
;-1303     if(c=='#')printstring("def ");

.listvar407:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar408
 push listvar_4
 call printstring
 add  sp, 2
;-1304     c=GSign [i];

.listvar408:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1305     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar409
 push listvar_5
 call printstring
 add  sp, 2
;-1306     if(c=='U')printstring("unsg ");

.listvar409:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar410
 push listvar_6
 call printstring
 add  sp, 2
;-1307     c=GWidth[i];

.listvar410:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1308     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar411
 push listvar_7
 call printstring
 add  sp, 2
;-1309     if(c== 1)printstring("byte " );

.listvar411:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar412
 push listvar_8
 call printstring
 add  sp, 2
;-1310     if(c== 2)printstring("word " );

.listvar412:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar413
 push listvar_9
 call printstring
 add  sp, 2
;-1311     if(c== 4)printstring("long " );

.listvar413:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar414
 push listvar_10
 call printstring
 add  sp, 2
;-1312     j=i*32;

.listvar414:
 mov ax, [bp+4]
 mov bx, 32
 mul bx
 mov [bp-2], ax
;-1313     pt=&GNameField + j;

 mov ax, GNameField
 add ax, [bp-2]
 mov word [pt], ax
;-1314     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1315     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar415
;-1316         prc('=');

 push 61
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
;-1319     }

;-1320     if(GType[i]=='&') {

.listvar415:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar416
;-1321         prc('[');

 push 91
 call prc
 add  sp, 2
;-1322         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1323         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1324         prc(']');

 push 93
 call prc
 add  sp, 2
;-1325     }

;-1326     if (i >= GTop) {

.listvar416:
 mov ax, [bp+4]
 cmp ax, [GTop] ;unsigned : 0
 jb  .listvar417
;-1327         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1328         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1329         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar418
 push 43
 call prc
 add  sp, 2
;-1330         printinteger(j);

.listvar418:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1331     }

;-1332 }

.listvar417:
;-1333 

;-1334 int listproc() {

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
;-1335     int i;

;-1336     if (LTop > GTop) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;102 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .listproc419
;-1337         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1338         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1339         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1340         i=LTop - GTop;

 mov ax, [LTop]
 sub ax, [GTop]
 mov [bp-2], ax
;-1341         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1342         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1343         i=GTop;

 mov ax, [GTop]
 mov [bp-2], ax
;-1344         while (i < LTop) {

.listproc420:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc421
;-1345             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1346             i++;

 inc  word[bp-2]
;-1347         }

;-1348     }

 jmp .listproc420
.listproc421:
;-1349 }

.listproc419:
;-1350 

;-1351 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1352     int FunctionIndex; char *p;

;-1353     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;102 var sign word FunctionIndex = bp-2
;103 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1354     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1355     while (FunctionIndex <= FunctionMaxIx ) {

.searchFunction422:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction423
;-1356         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction424
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1357         p = strlen(p) + p;

.searchFunction424:
 push word [bp-4]
 call strlen
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1358         p++;

 inc  word[bp-4]
;-1359         FunctionIndex++;

 inc  word[bp-2]
;-1360     }

;-1361     return 0;               //no function found

 jmp .searchFunction422
.searchFunction423:
 mov ax, 0
 jmp .retnsearchFunction
;-1362 }

;-1363 

;-1364 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1365     unsigned int i;

;-1366     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;102 var unsg word i = bp-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1367     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300 ;unsigned : 1
 jl  .storeFunction425
 push storeFunction_0
 call error1
 add  sp, 2
;-1368     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction425:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1369     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1370     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1371     i += IDLENMAX;

 add  word[bp-2], 31
;-1372     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000 ;unsigned : 0
 jb  .storeFunction426
 push storeFunction_1
 call error1
 add  sp, 2
;-1373 

;-1374 }

.storeFunction426:
;-1375 

;-1376 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1377     int nloc; unsigned int j;int narg;

;-1378     int VarNamePtrLocalStart;

;-1379     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;102 var sign word nloc = bp-2
;103 var unsg word j = bp-4
;104 var sign word narg = bp-6
;105 var sign word VarNamePtrLocalStart = bp-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1380     checknamelen();

 call checknamelen
;-1381     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1382     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc427
 push dofunc_0
 call error1
 add  sp, 2
;-1383     storeFunction();

.dofunc427:
 call storeFunction
;-1384 

;-1385     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1386     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1387     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1388     expect('(');

 push 40
 call expect
 add  sp, 2
;-1389 //    LStart=GTop;

;-1390     LTop=GTop;

 mov ax, [GTop]
 mov word [LTop], ax
;-1391     VarNamePtrLocalStart=VarNamePtr;

 mov ax, [VarNamePtr]
 mov [bp-8], ax
;-1392 

;-1393     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc428
;-1394         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1395         do {

.dofunc429:
;-1396             typeName();

 call typeName
;-1397             addlocal();

 call addlocal
;-1398             narg+=2;

 add  word[bp-6], 2
;-1399             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1400             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc430
 add  word[bp-6], 2
;-1401             LTop++;

.dofunc430:
 inc  word[LTop]
;-1402             }

;-1403         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc431
 jmp .dofunc429
.dofunc431:
;-1404         expect(')');

 push 41
 call expect
 add  sp, 2
;-1405         }

;-1406 

;-1407     expect('{'); /*body*/

.dofunc428:
 push 123
 call expect
 add  sp, 2
;-1408     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1409     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1410     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1411     while(isvariable()) {

.dofunc432:
 call isvariable
 or  al, al
 je .dofunc433
;-1412         do {

.dofunc434:
;-1413             typeName();

 call typeName
;-1414             checknamelen();

 call checknamelen
;-1415             addlocal();

 call addlocal
;-1416             nloc-=2;

 sub  word[bp-2], 2
;-1417             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc435
 sub  word[bp-2], 2
;-1418             GData[LTop]=nloc;

.dofunc435:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1419             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc436
;-1420                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1421                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1422                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1423                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1424                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1425                 nloc+=2;

 add  word[bp-2], 2
;-1426                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1427             }

;-1428             LTop++;

.dofunc436:
 inc  word[LTop]
;-1429         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc437
 jmp .dofunc434
.dofunc437:
;-1430         expect(';');

 push 59
 call expect
 add  sp, 2
;-1431     }

;-1432     listproc();

 jmp .dofunc432
.dofunc433:
 call listproc
;-1433     if (LTop>GTop){

 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc438
;-1434         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1435         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1436         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1437         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1438         }

;-1439 

;-1440     while(istoken('}')==0)  stmt();

.dofunc438:
.dofunc439:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc440
 call stmt
;-1441 

;-1442     if (nreturn) {

 jmp .dofunc439
.dofunc440:
 mov ax, [nreturn]
 or  al, al
 je .dofunc441
;-1443             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1444             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1445             prc(':');

 push 58
 call prc
 add  sp, 2
;-1446         }

;-1447     if (LTop > GTop) printstring("\n LEAVE");

.dofunc441:
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc442
 push dofunc_6
 call printstring
 add  sp, 2
;-1448     printstring("\n ret");

.dofunc442:
 push dofunc_7
 call printstring
 add  sp, 2
;-1449     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1450     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1451     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1452     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc443
 mov ax, [maxco1]
 mov word [maxco], ax
;-1453     printstring("\nENDP");

.dofunc443:
 push dofunc_8
 call printstring
 add  sp, 2
;-1454     VarNamePtr=VarNamePtrLocalStart;//delete local names

 mov ax, [bp-8]
 mov word [VarNamePtr], ax
;-1455 }

;-1456 

;-1457 char doglobName[IDLENMAX];

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
section .bss
absolute 49399
doglobName resb 31
section .text
;-1458 int doglob() {


doglob: PROC
;-1459     int i; int j; int isstrarr;

;-1460     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;103 var sign word i = bp-2
;104 var sign word j = bp-4
;105 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1461     if (GTop >= VARMAX) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .doglob444
 push doglob_0
 call error1
 add  sp, 2
;-1462     if (iswidth == 0) error1("no VOID as var type");

.doglob444:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob445
 push doglob_1
 call error1
 add  sp, 2
;-1463     checknamelen();

.doglob445:
 call checknamelen
;-1464     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob446
 push doglob_2
 call error1
 add  sp, 2
;-1465     if (istoken('[')) {

.doglob446:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob447
;-1466         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1467         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob448
;-1468             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1469             printunsigned(orgDatai);

 push word [orgDatai]
 call printunsigned
 add  sp, 2
;-1470             printstring("\n"); printstring(Symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1471             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob449
 push doglob_5
 call printstring
 add  sp, 2
;-1472             if (iswidth==2) printstring(" resw ");

.doglob449:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob450
 push doglob_6
 call printstring
 add  sp, 2
;-1473             if (iswidth==4) printstring(" resd ");

.doglob450:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob451
 push doglob_7
 call printstring
 add  sp, 2
;-1474             printunsigned(lexval);

.doglob451:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1475             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1476             orgDatai=orgDatai+lexval;

 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1477             if (iswidth==2) orgDatai=orgDatai+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob452
 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1478             if (iswidth==4) {i= lexval * 3; orgDatai=orgDatai + i;}

.doglob452:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob453
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgDatai]
 add ax, [bp-2]
 mov word [orgDatai], ax
;-1479             GData[GTop]=lexval;

.doglob453:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1480             expect(']');

 push 93
 call expect
 add  sp, 2
;-1481         }else {

 jmp .doglob454
.doglob448:
;-1482             expect(']');

 push 93
 call expect
 add  sp, 2
;-1483             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob455
 push doglob_9
 call error1
 add  sp, 2
;-1484             printstring("\n");

.doglob455:
 push doglob_10
 call printstring
 add  sp, 2
;-1485             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1486             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1487             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1488             strcpy(doglobName, Symbol);//save Symbol name

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1489             expect('=');

 push 61
 call expect
 add  sp, 2
;-1490             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob456
;-1491                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1492                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1493                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1494                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1495                 i=strlen(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1496                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1497                 }

;-1498             else if (istoken('{' )) {

 jmp .doglob457
.doglob456:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob458
;-1499                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1500                 do {

.doglob459:
;-1501                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob460
 push 44
 call prc
 add  sp, 2
;-1502                     expect(T_CONST);

.doglob460:
 push 257
 call expect
 add  sp, 2
;-1503                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1504                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1505                     }

;-1506                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob461
 jmp .doglob459
.doglob461:
;-1507                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1508             }

;-1509         else error1("String or number array expected");

 jmp .doglob462
.doglob458:
 push doglob_13
 call error1
 add  sp, 2
;-1510         };

.doglob462:
.doglob457:
.doglob454:
;-1511     }else { //expect('=');

 jmp .doglob463
.doglob447:
;-1512         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1513         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1514         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob464
 push doglob_15
 call printstring
 add  sp, 2
;-1515         else {

 jmp .doglob465
.doglob464:
;-1516             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob466
 push doglob_16
 call printstring
 add  sp, 2
;-1517             else if (iswidth==2) printstring(" dw ");

 jmp .doglob467
.doglob466:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob468
 push doglob_17
 call printstring
 add  sp, 2
;-1518             else                 printstring(" dd ");

 jmp .doglob469
.doglob468:
 push doglob_18
 call printstring
 add  sp, 2
;-1519         }

.doglob469:
.doglob467:
;-1520     if(istoken('-')) prc('-');

.doglob465:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob470
 push 45
 call prc
 add  sp, 2
;-1521     if (istoken('=')) {

.doglob470:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob471
;-1522         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1523         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1524         }else printunsigned(0);

 jmp .doglob472
.doglob471:
 push 0
 call printunsigned
 add  sp, 2
;-1525     }

.doglob472:
;-1526     GSign[GTop]=issign;

.doglob463:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1527     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1528     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1529     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1530     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob473
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1531         else strcpy(pt, Symbol);

 jmp .doglob474
.doglob473:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1532 	if (isstrarr) strcpy(Symbol, doglobName);

.doglob474:
 mov ax, [bp-6]
 or  al, al
 je .doglob475
 lea  ax, [doglobName]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-1533 	storeVarName();

.doglob475:
 call storeVarName
;-1534     GTop++;

 inc  word[GTop]
;-1535     expect(';');

 push 59
 call expect
 add  sp, 2
;-1536 }

;-1537 

;-1538 int dodefine() {

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
;-1539     expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1540     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine476
;-1541         if (GTop >= VARMAX) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .dodefine477
 push dodefine_0
 call error1
 add  sp, 2
;-1542         checknamelen();

.dodefine477:
 call checknamelen
;-1543         if (checkName() != 0) error1("#Define var already defined");

 call checkName
 cmp ax, 0
 je  .dodefine478
 push dodefine_1
 call error1
 add  sp, 2
;-1544         if (eqstr(Symbol, "ORGDATA")) {

.dodefine478:
 push dodefine_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine479
;-1545             orgDataOriginal=lexval;

 mov ax, [lexval]
 mov word [orgDataOriginal], ax
;-1546             orgDatai=lexval;

 mov ax, [lexval]
 mov word [orgDatai], ax
;-1547             expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1548             return;

 jmp .retndodefine
;-1549         }

;-1550         GSign [GTop]='U';

.dodefine479:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1551         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1552         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1553         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1554         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1555         storeVarName();

 call storeVarName
;-1556         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1557         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1558         GTop++;

 inc  word[GTop]
;-1559     }

;-1560 }

.dodefine476:
;-1561 

;-1562 int parse() {

 .retndodefine:
 ret
dodefine_0 db "global table (define) full",0
dodefine_1 db "#Define var already defined",0
dodefine_2 db "ORGDATA",0
ENDP

parse: PROC
;-1563     token=getlex();

 call getlex
 mov word [token], ax
;-1564     do {

.parse480:
;-1565         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse481
 mov ax, 1
 jmp .retnparse
;-1566         if (istoken('#')) {

.parse481:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse482
;-1567              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse483
 call dodefine
;-1568              else error1("define expected");

 jmp .parse484
.parse483:
 push parse_0
 call error1
 add  sp, 2
;-1569         }

.parse484:
;-1570     else{

 jmp .parse485
.parse482:
;-1571         typeName();

 call typeName
;-1572         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse486
 call dofunc
;-1573         else doglob(); }

 jmp .parse487
.parse486:
 call doglob
.parse487:
;-1574     } while(1);

.parse485:
 mov ax, 1
 or  al, al
 je .parse488
 jmp .parse480
.parse488:
;-1575 }

;-1576 

;-1577 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1578 int getarguments() {


getarguments: PROC
;-1579     int arglen1; unsigned int i; char *c;

;-1580     isPrint=1;

;Function : getarguments, Number local Var: 3
; # type sign width local variables
;105 var sign word arglen1 = bp-2
;106 var unsg word i = bp-4
;107 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1581     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1582     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarguments489
;-1583         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1584         cputs(" Usage: A.COM in_file[.C]: ");

 push getarguments_0
 call cputs
 add  sp, 2
;-1585         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1586         }

;-1587     i=arglen1+129;

.getarguments489:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1588     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1589     arglen1--;

 dec  word[bp-2]
;-1590     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1591     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1592     if (instr1(namein, '.') == 0) strcat(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarguments490
 push getarguments_1
 lea  ax, [namein]
 push ax
 call strcat
 add  sp, 4
;-1593     strcpy(namelst, namein);

.getarguments490:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1594     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1595     i--;

 dec  word[bp-4]
;-1596     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1597     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1598 }

;-1599 int openfiles() {

 LEAVE
 ret
getarguments_0 db " Usage: A.COM in_file[.C]: ",0
getarguments_1 db ".C",0
ENDP

openfiles: PROC
;-1600     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1601     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles491
;-1602         cputs("Source file missing (.C): ");

 push openfiles_0
 call cputs
 add  sp, 2
;-1603         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1604         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1605         }

;-1606     fdout=creatR(namelst);

.openfiles491:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1607     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles492
;-1608         cputs("list file not creatable: ");

 push openfiles_1
 call cputs
 add  sp, 2
;-1609         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1610         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1611         }

;-1612     printstring(";");

.openfiles492:
 push openfiles_2
 call printstring
 add  sp, 2
;-1613     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1614     printstring(", Input: "); printstring(namein);

 push openfiles_3
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1615     printstring(", Output: "); printstring(namelst);

 push openfiles_4
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1616 }

;-1617 

;-1618 int epilog() {

 ret
openfiles_0 db "Source file missing (.C): ",0
openfiles_1 db "list file not creatable: ",0
openfiles_2 db ";",0
openfiles_3 db ", Input: ",0
openfiles_4 db ", Output: ",0
ENDP

epilog: PROC
;-1619     int i;

;-1620     isPrint=1;

;Function : epilog, Number local Var: 1
; # type sign width local variables
;105 var sign word i = bp-2;
 ENTER  2,0
 mov ax, 1
 mov byte [isPrint], al
;-1621     GTop--;

 dec  word[GTop]
;-1622     printstring("\n;Glob. variables:"); printunsigned(GTop);

 push epilog_0
 call printstring
 add  sp, 2
 push word [GTop]
 call printunsigned
 add  sp, 2
;-1623     printstring(" (");                  printunsigned(VARMAX);

 push epilog_1
 call printstring
 add  sp, 2
 push 400
 call printunsigned
 add  sp, 2
;-1624     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-1625     printstring("):");                  printunsigned(i);

 push epilog_2
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1626     printstring(" (");					printunsigned(VARNAMESMAX);

 push epilog_3
 call printstring
 add  sp, 2
 push 4000
 call printunsigned
 add  sp, 2
;-1627     printstring("), Functions:");       printunsigned(FunctionMaxIx);

 push epilog_4
 call printstring
 add  sp, 2
 push word [FunctionMaxIx]
 call printunsigned
 add  sp, 2
;-1628     printstring(" (");                  printunsigned(FUNCMAX);

 push epilog_5
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1629     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1630     printstring("):");                  printunsigned(i);

 push epilog_6
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1631     printstring(" (");					printunsigned(FUNCTIONNAMESMAX);

 push epilog_7
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1632     printstring(")\n;Lines:");          printunsigned(lineno);

 push epilog_8
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1633     printstring(", Constant: ");        printunsigned(maxco);

 push epilog_9
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1634     printstring(" (");                  printunsigned(COMAX);

 push epilog_10
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1635     i = COMAX;

 mov ax, 3000
 mov [bp-2], ax
;-1636     i = i - maxco;

 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax
;-1637     if (i<=1000)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 jg  .epilog493
 push epilog_11
 call printstring
 add  sp, 2
;-1638     printstring("), stacksize: ");

.epilog493:
 push epilog_12
 call printstring
 add  sp, 2
;-1639     i=65536;

 mov ax, 0
 mov [bp-2], ax
;-1640     i=i-orgDatai;

 mov ax, [bp-2]
 sub ax, [orgDatai]
 mov [bp-2], ax
;-1641     printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1642     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 jg  .epilog494
 push epilog_13
 call printstring
 add  sp, 2
;-1643 

;-1644 }

.epilog494:
;-1645 

;-1646 int main() {

 LEAVE
 ret
epilog_0 db "\n;Glob. variables:",0
epilog_1 db " (",0
epilog_2 db "):",0
epilog_3 db " (",0
epilog_4 db "), Functions:",0
epilog_5 db " (",0
epilog_6 db "):",0
epilog_7 db " (",0
epilog_8 db ")\n;Lines:",0
epilog_9 db ", Constant: ",0
epilog_10 db " (",0
epilog_11 db "\n ** Warning ** constant area too small",0
epilog_12 db "), stacksize: ",0
epilog_13 db "\n *** Warning *** Stack too small",0
ENDP

main: PROC
;-1647     getarguments();

 call getarguments
;-1648     openfiles();

 call openfiles
;-1649     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1650     printstring("\norg  256 \njmp main");

 push main_0
 call printstring
 add  sp, 2
;-1651 

;-1652 	GTop = 1;

 mov ax, 1
 mov word [GTop], ax
;-1653     VarNamePtr= &VarNames;

 mov ax, VarNames
 mov word [VarNamePtr], ax
;-1654     FunctionNamePtr= &FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1655     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1656     orgDatai=orgDataOriginal;

 mov ax, [orgDataOriginal]
 mov word [orgDatai], ax
;-1657     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1658     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1659     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1660 

;-1661     parse();

 call parse
;-1662 

;-1663     epilog();

 call epilog
;-1664     end1(0);

 push 0
 call end1
 add  sp, 2
;-1665 }

 ret
main_0 db "\norg  256 \njmp main",0
ENDP
;Glob. variables:104 (400):838 (4000), Functions:80 (300):642 (3000)
;Lines:1666, Constant: 688 (3000), stacksize: 16106