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
;-74 #define VARNAMESMAX 3969//VARMAX * 10 - IDLENMAX

;-75 char VarNames[4000];    //Space for global and local var names

section .bss
absolute 42129
VarNames resb 4000
section .text
;-76 char *VarNamePtr;       //first free position

VarNamePtr dw 0
;-77 int GTop=1;

GTop dw 1
;-78 int LStart=300;          //max global var

LStart dw 300
;-79 int LTop=300;

LTop dw 300
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
;97 var sign byte c = bp+4;
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
;97 ptr sign byte s = bp+4
;98 var sign byte c = bp-2;
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
;97 var sign word n = bp+4;
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
;-133     asm mov dx, [bp+4]; dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;97 ptr sign byte s = bp+4;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-134     asm mov ax, 15618; ax=0x3D02;

 mov ax, 15618; ax=0x3D02;
;-135     DosInt();

 call DosInt
;-136 }

;-137 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-138     asm mov dx, [bp+4]; dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;97 ptr sign byte s = bp+4;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-139     asm mov cx, 0

 mov cx, 0
;-140     asm mov ax, 15360; ax=0x3C00;

 mov ax, 15360; ax=0x3C00;
;-141     DosInt();

 call DosInt
;-142 }

;-143 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-144     asm mov bx, [bp+4]; bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;97 var sign word fd = bp+4;
 ENTER  0,0
 mov bx, [bp+4]; bx=fd;
;-145     asm mov ax, 15872; ax=0x3E00;

 mov ax, 15872; ax=0x3E00;
;-146     DosInt();

 call DosInt
;-147 }

;-148 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-149     asm mov ah, 76; ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;97 var sign byte c = bp+4;
 ENTER  0,0
 mov ah, 76; ah=0x4C;
;-150     asm mov al, [bp+4]; al=c;

 mov al, [bp+4]; al=c;
;-151     DosInt();

 call DosInt
;-152 }

;-153 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-154     asm mov dx, [bp+4]; dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;97 ptr sign byte s = bp+4
;98 var sign word fd = bp+6
;99 var sign word len = bp+8;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-155     asm mov cx, [bp+8]; cx=len;

 mov cx, [bp+8]; cx=len;
;-156     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-157     asm mov ax, 16128;  ax=0x3F00;

 mov ax, 16128;  ax=0x3F00;
;-158     DosInt();

 call DosInt
;-159 }

;-160 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-161     asm lea dx, [bp+4]; *n  todo: why not mov ?????

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;97 ptr sign byte n = bp+4
;98 var sign word fd = bp+6;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov ?????
;-162     asm mov cx, 1;      cx=1;

 mov cx, 1;      cx=1;
;-163     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-164     asm mov ax, 16384;  ax=0x4000;

 mov ax, 16384;  ax=0x4000;
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
;97 var sign byte c = bp+4;
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
;97 var sign byte c = bp+4;
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
;97 var sign byte c = bp+4;
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
;97 ptr sign byte s = bp+4
;98 var sign word c = bp-2;
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
;97 ptr sign byte s = bp+4
;98 ptr sign byte t = bp+6;
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
;97 ptr sign byte p = bp+4
;98 ptr sign byte q = bp+6;
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
;97 ptr sign byte s = bp+4
;98 ptr sign byte t = bp+6;
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
;97 ptr sign byte s = bp+4;
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
;97 ptr sign byte s = bp+4
;98 var sign byte c = bp+6;
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
;97 var sign byte c = bp+4;
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
;97 ptr sign byte s = bp+4
;98 var sign byte c = bp-2;
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
;97 var unsg byte c = bp+4;
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
;97 ptr unsg byte s = bp+4
;98 var unsg byte c = bp-2;
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
;97 ptr unsg byte s = bp+4
;98 var unsg byte c = bp-2
;99 var sign word com = bp-4;
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
;97 var sign word n = bp+4
;98 var sign word e = bp-2;
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
;97 var sign word n = bp+4
;98 var sign word e = bp-2;
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
;97 var unsg word n = bp+4
;98 var unsg word e = bp-2;
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
;97 var sign word n = bp+4;
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
;97 ptr sign byte s = bp+4;
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
;97 var sign word col = bp-2;
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
;97 var sign byte c = bp-2;
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
;97 var sign byte r = bp-2;
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
;97 var unsg word i = bp-2;
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
;-392     if (i > VARNAMESMAX) error1("too many Variable names");

 mov ax, [bp-2]
 cmp ax, 3969
 jle .storeVarName59
 push storeVarName_0
 call error1
 add  sp, 2
;-393 

;-394     //todo dofunction set start of local VarNamePtr

;-395 }

.storeVarName59:
;-396 

;-397 int adrF(char *s, unsigned int i) {

 LEAVE
 ret
storeVarName_0 db "too many Variable names",0
ENDP

adrF: PROC
;-398     i << 5;//ax=i*32; IDLENMAX=31!

;Function : adrF, Number local Var: 2
; # type sign width local variables
;97 ptr sign byte s = bp+4
;98 var unsg word i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 5
;-399     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 
;-400 }

;-401 

;-402 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-403     int j;

;-404     if (i < LStart) {

;Function : printName, Number local Var: 2
; # type sign width local variables
;97 var unsg word i = bp+4
;98 var sign word j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, [LStart]
 jge .printName60
;-405         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-406         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-407     }

;-408     else {

 jmp .printName61
.printName60:
;-409         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-410         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-411         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName62
 push 43
 call prc
 add  sp, 2
;-412         printinteger(j);

.printName62:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-413         prc(']');

 push 93
 call prc
 add  sp, 2
;-414     }

;-415 }

.printName61:
;-416 

;-417 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-418     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;97 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL63
 mov ax, 1
 jmp .retnifEOL
;-419     if (c == 13) {//CR

.ifEOL63:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL64
;-420         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL65
 call next
 mov [bp+4], al
;-421         return 1;

.ifEOL65:
 mov ax, 1
 jmp .retnifEOL
;-422     }

;-423     return 0;

.ifEOL64:
 mov ax, 0
 jmp .retnifEOL
;-424 }

;-425 

;-426 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 49257
symboltemp resb 80
section .text
;-427 

;-428 int getlex() {


getlex: PROC
;-429     char c; char *p;

;-430     int i; int j;

;-431 g1: c=next();

;Function : getlex, Number local Var: 4
; # type sign width local variables
;98 var sign byte c = bp-2
;99 ptr sign byte p = bp-4
;100 var sign word i = bp-6
;101 var sign word j = bp-8;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-432     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex66
 mov ax, 0
 jmp .retngetlex
;-433     if (c <= ' ') goto g1;

.getlex66:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex67
 jmp .g1
;-434   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex67:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex68
 mov al, [thechar]
 cmp al, 61
 jne .getlex69
 call next
 mov ax, 806
 jmp .retngetlex
.getlex69:
;-435   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex68:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex70
 mov al, [thechar]
 cmp al, 61
 jne .getlex71
 call next
 mov ax, 807
 jmp .retngetlex
.getlex71:
;-436   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex70:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex72
 mov al, [thechar]
 cmp al, 61
 jne .getlex73
 call next
 mov ax, 824
 jmp .retngetlex
.getlex73:
;-437   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex72:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex74
 mov al, [thechar]
 cmp al, 61
 jne .getlex75
 call next
 mov ax, 811
 jmp .retngetlex
.getlex75:
;-438   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex74:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex76
 mov al, [thechar]
 cmp al, 60
 jne .getlex77
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex77:
;-439   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex76:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex78
 mov al, [thechar]
 cmp al, 62
 jne .getlex79
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex79:
;-440   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex78:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex80
 mov al, [thechar]
 cmp al, 43
 jne .getlex81
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex81:
;-441   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex80:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex82
 mov al, [thechar]
 cmp al, 45
 jne .getlex83
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex83:
;-442   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex82:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex84
 mov al, [thechar]
 cmp al, 61
 jne .getlex85
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex85:
;-443   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex84:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex86
 mov al, [thechar]
 cmp al, 61
 jne .getlex87
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex87:
;-444   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex86:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex88
 mov al, [thechar]
 cmp al, 61
 jne .getlex89
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex89:
;-445   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex88:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex90
 mov al, [thechar]
 cmp al, 61
 jne .getlex91
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex91:
;-446   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex90:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex92
 mov al, [thechar]
 cmp al, 61
 jne .getlex93
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex93:
;-447   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex92:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex94
 mov al, [thechar]
 cmp al, 61
 jne .getlex95
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex95:
;-448   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex94:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex96
 mov al, [bp-2]
 jmp .retngetlex
;-449   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex97
;-450       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex98
;-451           do c=next();

.getlex99:
 call next
 mov [bp-2], al
;-452           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex100
 jmp .getlex99
.getlex100:
 call getlex
 jmp .retngetlex
;-453       }

;-454   }

.getlex98:
;-455   if (c == '/') {

.getlex97:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex101
;-456       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex102
;-457           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-458           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex103
 jmp .g2
;-459           if (thechar != '/') goto g2;

.getlex103:
 mov al, [thechar]
 cmp al, 47
 je  .getlex104
 jmp .g2
;-460           c=next();

.getlex104:
 call next
 mov [bp-2], al
;-461           return getlex();

 call getlex
 jmp .retngetlex
;-462       } else  return '/';

 jmp .getlex105
.getlex102:
 mov ax, 47
 jmp .retngetlex
;-463   }

.getlex105:
;-464   if (c == '"') {

.getlex101:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex106
;-465       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-466       c=next();

 call next
 mov [bp-2], al
;-467       while (c != '"') {

.getlex107:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex108
;-468           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-469           p++;

 inc  word[bp-4]
;-470           c=next();

 call next
 mov [bp-2], al
;-471           }

;-472           *p=0;

 jmp .getlex107
.getlex108:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-473       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-474   }

;-475   if (digit(c)) {

.getlex106:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex109
;-476       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-477       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-478       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex110
 mov ax, 88
 mov byte [thechar], al
;-479       if (thechar=='X') {

.getlex110:
 mov al, [thechar]
 cmp al, 88
 jne .getlex111
;-480           next();

 call next
;-481           while(alnum(thechar)) {

.getlex112:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex113
;-482               c=next();

 call next
 mov [bp-2], al
;-483               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex114
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-484       	       if (c>64) c=c-7;

.getlex114:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex115
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-485                c=c-48;

.getlex115:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-486                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-487                i=0;

 mov ax, 0
 mov [bp-6], ax
;-488                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-489                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-490            }

;-491        }else {

 jmp .getlex112
.getlex113:
 jmp .getlex116
.getlex111:
;-492            while(digit(thechar)) {

.getlex117:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex118
;-493                c=next();

 call next
 mov [bp-2], al
;-494                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-495                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
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

;-500        }

 jmp .getlex117
.getlex118:
;-501       return T_CONST;

.getlex116:
 mov ax, 257
 jmp .retngetlex
;-502   }

;-503   if (c==39) {

.getlex109:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex119
;-504       lexval=next();

 call next
 mov word [lexval], ax
;-505       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex120
;-506           lexval=next();

 call next
 mov word [lexval], ax
;-507           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex121
 mov ax, 10
 mov word [lexval], ax
;-508           if (lexval=='t') lexval= 9;

.getlex121:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex122
 mov ax, 9
 mov word [lexval], ax
;-509           if (lexval=='0') lexval= 0;

.getlex122:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex123
 mov ax, 0
 mov word [lexval], ax
;-510       }

.getlex123:
;-511       next();

.getlex120:
 call next
;-512       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-513   }

;-514   if (alnum(c)) {

.getlex119:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex124
;-515     strcpy(symboltemp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-516     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-517     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-518     p++;

 inc  word[bp-4]
;-519     while(alnum(thechar)) {

.getlex125:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex126
;-520         c=next();

 call next
 mov [bp-2], al
;-521         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-522         p++;

 inc  word[bp-4]
;-523     }

;-524     *p=0;

 jmp .getlex125
.getlex126:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-525     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex127
 mov ax, 531
 jmp .retngetlex
;-526     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

.getlex127:
 push getlex_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex128
 mov ax, 532
 jmp .retngetlex
;-527     if (eqstr(Symbol,"void"    )) return T_VOID;

.getlex128:
 push getlex_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex129
 mov ax, 529
 jmp .retngetlex
;-528     if (eqstr(Symbol,"int"     )) return T_INT;

.getlex129:
 push getlex_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 517
 jmp .retngetlex
;-529     if (eqstr(Symbol,"long"    )) return T_LONG;

.getlex130:
 push getlex_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 533
 jmp .retngetlex
;-530     if (eqstr(Symbol,"inth"    )) return T_INTH;

.getlex131:
 push getlex_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 600
 jmp .retngetlex
;-531     if (eqstr(Symbol,"char"    )) return T_CHAR;

.getlex132:
 push getlex_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 530
 jmp .retngetlex
;-532     if (eqstr(Symbol,"asm"     )) return T_ASM;

.getlex133:
 push getlex_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 518
 jmp .retngetlex
;-533     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

.getlex134:
 push getlex_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 519
 jmp .retngetlex
;-534     if (eqstr(Symbol,"__emit__")) return T_EMIT;

.getlex135:
 push getlex_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 520
 jmp .retngetlex
;-535     if (eqstr(Symbol,"return"  )) return T_RETURN;

.getlex136:
 push getlex_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 512
 jmp .retngetlex
;-536     if (eqstr(Symbol,"if"      )) return T_IF;

.getlex137:
 push getlex_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 513
 jmp .retngetlex
;-537     if (eqstr(Symbol,"else"    )) return T_ELSE;

.getlex138:
 push getlex_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 514
 jmp .retngetlex
;-538     if (eqstr(Symbol,"while"   )) return T_WHILE;

.getlex139:
 push getlex_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 515
 jmp .retngetlex
;-539     if (eqstr(Symbol,"do"      )) return T_DO;

.getlex140:
 push getlex_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 516
 jmp .retngetlex
;-540     if (eqstr(Symbol,"goto"    )) return T_GOTO;

.getlex141:
 push getlex_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 521
 jmp .retngetlex
;-541     if (eqstr(Symbol,"define"  )) return T_DEFINE;

.getlex142:
 push getlex_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 511
 jmp .retngetlex
;-542 

;-543     i=0;//convert define to value

.getlex143:
 mov ax, 0
 mov [bp-6], ax
;-544     while (i < GTop) {

.getlex144:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex145
;-545         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-546         if (eqstr(Symbol,j)) {

 push word [bp-8]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex146
;-547             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex147
;-548                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-549                 strcpy(Symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-550                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-551             }

;-552         }

.getlex147:
;-553         i++;

.getlex146:
 inc  word[bp-6]
;-554     }

;-555     return T_NAME; } error1("Input item not recognized");

 jmp .getlex144
.getlex145:
 mov ax, 256
 jmp .retngetlex
.getlex124:
 push getlex_18
 call error1
 add  sp, 2
;-556 }

;-557 

;-558 int istoken(int t) {

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
;-559     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;98 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken148
;-560         token=getlex();

 call getlex
 mov word [token], ax
;-561         return 1;

 mov ax, 1
 jmp .retnistoken
;-562     }

;-563     return 0;

.istoken148:
 mov ax, 0
 jmp .retnistoken
;-564 }

;-565 

;-566 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-567     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;98 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect149
;-568         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-569         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-570         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-571         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-572         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-573     }

;-574 }

.expect149:
;-575 

;-576 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-577     if (i < LStart) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;98 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [LStart]
 jge .v150
 push 91
 call prc
 add  sp, 2
;-578     printName(i);

.v150:
 push word [bp+4]
 call printName
 add  sp, 2
;-579     if (i < LStart) prc(']');

 mov ax, [bp+4]
 cmp ax, [LStart]
 jge .v151
 push 93
 call prc
 add  sp, 2
;-580 }

.v151:
;-581 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-582     int i;

;-583     i=strlen(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;98 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-584     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen152
 push checknamelen_0
 call error1
 add  sp, 2
;-585 }

.checknamelen152:
;-586 

;-587 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-588     unsigned int i; unsigned int j;

;-589     i=LStart;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;98 var unsg word i = bp-2
;99 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, [LStart]
 mov [bp-2], ax
;-590     while(i<LTop) {

.checkName153:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName154
;-591         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-592         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName155
 mov ax, [bp-2]
 jmp .retncheckName
;-593         i++;

.checkName155:
 inc  word[bp-2]
;-594     }

;-595     i=1;

 jmp .checkName153
.checkName154:
 mov ax, 1
 mov [bp-2], ax
;-596     while(i<GTop) {

.checkName156:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName157
;-597         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-598         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName158
 mov ax, [bp-2]
 jmp .retncheckName
;-599         i++;

.checkName158:
 inc  word[bp-2]
;-600     }

;-601     return 0;

 jmp .checkName156
.checkName157:
 mov ax, 0
 jmp .retncheckName
;-602 }

;-603 

;-604 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-605     unsigned int i;

;-606     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;98 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-607     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname159
 push searchname_0
 call error1
 add  sp, 2
;-608     return i;

.searchname159:
 mov ax, [bp-2]
 jmp .retnsearchname
;-609 }

;-610 

;-611 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-612     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1160
 push name1_0
 call error1
 add  sp, 2
;-613     token=getlex();

.name1160:
 call getlex
 mov word [token], ax
;-614 }

;-615 

;-616 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-617     int m; //0=V,1=*,2=&

;-618     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;98 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-619     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 83
 mov byte [issign], al
;-620     if(istoken(T_UNSIGNED)) issign='U';

.typeName161:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 85
 mov byte [issign], al
;-621     iswidth=2;

.typeName162:
 mov ax, 2
 mov byte [iswidth], al
;-622     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 0
 mov byte [iswidth], al
;-623     if(istoken(T_CHAR))     iswidth=1;

.typeName163:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 1
 mov byte [iswidth], al
;-624     if(istoken(T_INT))      iswidth=2;

.typeName164:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 2
 mov byte [iswidth], al
;-625     if(istoken(T_LONG))     iswidth=4;

.typeName165:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 4
 mov byte [iswidth], al
;-626     istype='V';

.typeName166:
 mov ax, 86
 mov byte [istype], al
;-627     m=0;

 mov ax, 0
 mov [bp-2], ax
;-628     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-629     if(istoken('&'))  {istype='&'; m=2;}

.typeName167:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName168
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-630     name1();

.typeName168:
 call name1
;-631     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-632 }

;-633 

;-634 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-635     char c;

;-636     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;98 var sign word i = bp+4
;99 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-637     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes169
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes170
.gettypes169:
 mov ax, 0
 mov word [signi], ax
;-638     c=GWidth[i];

.gettypes170:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-639     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-640     wi=0;

 mov ax, 0
 mov word [wi], ax
;-641     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes171
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-642     if (c==2) {widthi=2;wi=2;}

.gettypes171:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes172
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-643     if (c==4) {widthi=4;wi=4;}

.gettypes172:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes173
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-644     c=GType [i];

.gettypes173:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-645     typei=0;

 mov ax, 0
 mov word [typei], ax
;-646     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes174
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-647     if (c=='&')  typei=2;

.gettypes174:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes175
 mov ax, 2
 mov word [typei], ax
;-648     return i;

.gettypes175:
 mov ax, [bp+4]
 jmp .retngettypes
;-649 }

;-650 

;-651 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-652     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal176
 push addlocal_0
 call error1
 add  sp, 2
;-653     if (checkName() != 0) error1("Variable already defined");

.addlocal176:
 call checkName
 cmp ax, 0
 je  .addlocal177
 push addlocal_1
 call error1
 add  sp, 2
;-654     GSign[LTop]=issign;

.addlocal177:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-655     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-656     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-657     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-658     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-659     //storeVarName();

;-660 }

;-661 

;-662 

;-663 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-664        if(iscmp==T_EQ) printstring("\n jne .");         //ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;98 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg178
 push cmpneg_0
 call printstring
 add  sp, 2
;-665   else if(iscmp==T_NE) printstring("\n je  .");         //ZF=1

 jmp .cmpneg179
.cmpneg178:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg180
 push cmpneg_1
 call printstring
 add  sp, 2
;-666   else if(iscmp==T_LE) if (ids) printstring("\n jg  .");//ZF=0 SF=O

 jmp .cmpneg181
.cmpneg180:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg182
 mov ax, [bp+4]
 or  al, al
 je .cmpneg183
 push cmpneg_2
 call printstring
 add  sp, 2
;-667                        else     printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg184
.cmpneg183:
 push cmpneg_3
 call printstring
 add  sp, 2
;-668   else if(iscmp==T_GE) if (ids){printstring(" ;unsigned : ");

.cmpneg184:
 jmp .cmpneg185
.cmpneg182:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg186
 mov ax, [bp+4]
 or  al, al
 je .cmpneg187
 push cmpneg_4
 call printstring
 add  sp, 2
;-669                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-670                                 printstring("\n jl  .");}//SF!=O

 push cmpneg_5
 call printstring
 add  sp, 2
;-671                        else    {printstring(" ;unsigned : ");

 jmp .cmpneg188
.cmpneg187:
 push cmpneg_6
 call printstring
 add  sp, 2
;-672                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-673                                 printstring("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call printstring
 add  sp, 2
;-674   else if(iscmp=='<' ) printstring("\n jge .");          //SF=O

.cmpneg188:
 jmp .cmpneg189
.cmpneg186:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg190
 push cmpneg_8
 call printstring
 add  sp, 2
;-675   else if(iscmp=='>' ) printstring("\n jle .");          //ZF=1 | SF!=O

 jmp .cmpneg191
.cmpneg190:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg192
 push cmpneg_9
 call printstring
 add  sp, 2
;-676   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg193
.cmpneg192:
 push cmpneg_10
 call error1
 add  sp, 2
;-677 }

.cmpneg193:
.cmpneg191:
.cmpneg189:
.cmpneg185:
.cmpneg181:
.cmpneg179:
;-678 

;-679 int isrelational() {

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
;-680     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational194
 jmp .w
;-681     if (token==T_NE) goto w;

.isrelational194:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational195
 jmp .w
;-682     if (token==T_LE) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational196
 jmp .w
;-683     if (token==T_GE) goto w;

.isrelational196:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational197
 jmp .w
;-684     if (token=='<' ) goto w;

.isrelational197:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational198
 jmp .w
;-685     if (token=='>' ) goto w;

.isrelational198:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational199
 jmp .w
;-686     return 0;

.isrelational199:
 mov ax, 0
 jmp .retnisrelational
;-687 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-688     token=getlex();

 call getlex
 mov word [token], ax
;-689     return 1;

 mov ax, 1
 jmp .retnisrelational
;-690 }

;-691 

;-692 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-693   if (strlen(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg200
 mov ax, 0
 jmp .retncheckreg
;-694   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

.checkreg200:
 push checkreg_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 1
 jmp .retncheckreg
.checkreg201:
 push checkreg_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 3
 jmp .retncheckreg
;-695   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

.checkreg202:
 push checkreg_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 5
 jmp .retncheckreg
.checkreg203:
 push checkreg_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 7
 jmp .retncheckreg
;-696   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

.checkreg204:
 push checkreg_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 9
 jmp .retncheckreg
.checkreg205:
 push checkreg_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 11
 jmp .retncheckreg
;-697   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

.checkreg206:
 push checkreg_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 13
 jmp .retncheckreg
.checkreg207:
 push checkreg_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 15
 jmp .retncheckreg
;-698   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

.checkreg208:
 push checkreg_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 17
 jmp .retncheckreg
.checkreg209:
 push checkreg_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 19
 jmp .retncheckreg
;-699   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

.checkreg210:
 push checkreg_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 21
 jmp .retncheckreg
.checkreg211:
 push checkreg_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 23
 jmp .retncheckreg
;-700   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

.checkreg212:
 push checkreg_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 25
 jmp .retncheckreg
.checkreg213:
 push checkreg_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 27
 jmp .retncheckreg
;-701   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

.checkreg214:
 push checkreg_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 29
 jmp .retncheckreg
.checkreg215:
 push checkreg_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 31
 jmp .retncheckreg
;-702   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

.checkreg216:
 push checkreg_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 33
 jmp .retncheckreg
.checkreg217:
 push checkreg_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 35
 jmp .retncheckreg
;-703   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

.checkreg218:
 push checkreg_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 37
 jmp .retncheckreg
.checkreg219:
 push checkreg_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 39
 jmp .retncheckreg
;-704   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

.checkreg220:
 push checkreg_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 41
 jmp .retncheckreg
.checkreg221:
 push checkreg_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 43
 jmp .retncheckreg
;-705   // (eqstr(Symbol,"ip")) return 45;

;-706   if (strlen(Symbol) >   3) return 0;

.checkreg222:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg223
 mov ax, 0
 jmp .retncheckreg
;-707   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

.checkreg223:
 push checkreg_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 47
 jmp .retncheckreg
.checkreg224:
 push checkreg_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 50
 jmp .retncheckreg
;-708   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

.checkreg225:
 push checkreg_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 53
 jmp .retncheckreg
.checkreg226:
 push checkreg_25
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 56
 jmp .retncheckreg
;-709   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

.checkreg227:
 push checkreg_26
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 59
 jmp .retncheckreg
.checkreg228:
 push checkreg_27
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 62
 jmp .retncheckreg
;-710   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

.checkreg229:
 push checkreg_28
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 65
 jmp .retncheckreg
.checkreg230:
 push checkreg_29
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 68
 jmp .retncheckreg
;-711 //  if (eqstr(Symbol,"cr0")) return 71;

;-712   return 0;

.checkreg231:
 mov ax, 0
 jmp .retncheckreg
;-713 }

;-714 

;-715 char printregstr[]

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
;-716 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-717 

;-718 int printreg(int i) {


printreg: PROC
;-719     unsigned int k; unsigned char c;

;-720     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;99 var sign word i = bp+4
;100 var unsg word k = bp-2
;101 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-721     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-722     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-723     i++;

 inc  word[bp+4]
;-724     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-725     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-726     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-727     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg232
;-728         i++;

 inc  word[bp+4]
;-729         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-730         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-731         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-732         }

;-733 }

.printreg232:
;-734 

;-735 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 49337
ops resb 5
section .text
;-736 int doreg1(int iscmp1) {


doreg1: PROC
;-737     int i;

;-738     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;100 var sign word iscmp1 = bp+4
;101 var sign word i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1233
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-739     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1233:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1234
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-740     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1234:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1235
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-741     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1235:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1236
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-742     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1236:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1237
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-743     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1237:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1238
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-744     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1238:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1239
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-745     if (iscmp1 == 1) {

.doreg1239:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1240
;-746             token=getlex();

 call getlex
 mov word [token], ax
;-747             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1241
 push doreg1_7
 call error1
 add  sp, 2
;-748             strcpy(ops, "cmp");

.doreg1241:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-749         }

;-750     printstring("\n ");

.doreg1240:
 push doreg1_9
 call printstring
 add  sp, 2
;-751     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-752     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-753     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-754     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-755 

;-756     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1242
;-757         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-758         goto reg1;

 jmp .reg1
;-759         }

;-760     mod2=typeName();

.doreg1242:
 call typeName
 mov word [mod2], ax
;-761     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-762     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1243
;-763         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-764         goto reg1;

 jmp .reg1
;-765         }

;-766     i=searchname();

.doreg1243:
 call searchname
 mov [bp-2], ax
;-767     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1244
 push word [bp-2]
 call printName
 add  sp, 2
;-768         else v(i);

 jmp .doreg1245
.doreg1244:
 push word [bp-2]
 call v
 add  sp, 2
;-769 reg1: if (iscmp1 == 1) {

.doreg1245:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1246
;-770     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-771     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-772     expect(')');

 push 41
 call expect
 add  sp, 2
;-773     }

;-774 }

.doreg1246:
;-775 

;-776 int compoundass(char *op, int mode, int id1) {

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
;-777     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;100 ptr sign byte op = bp+4
;101 var sign word mode = bp+6
;102 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass247
 push compoundass_0
 call error1
 add  sp, 2
;-778     printstring("\n ");

.compoundass247:
 push compoundass_1
 call printstring
 add  sp, 2
;-779     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-780     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-781     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-782     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass248
 push compoundass_3
 call printstring
 add  sp, 2
;-783         else printstring("byte");

 jmp .compoundass249
.compoundass248:
 push compoundass_4
 call printstring
 add  sp, 2
;-784     v(id1);

.compoundass249:
 push word [bp+8]
 call v
 add  sp, 2
;-785     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-786     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-787     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-788 }

;-789 

;-790 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-791     gettypes(id1);

;Function : dovar1, Number local Var: 4
; # type sign width local variables
;100 var sign word mode = bp+4
;101 var sign word op = bp+6
;102 var sign word ixarr = bp+8
;103 var sign word id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-792     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1250
;-793         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-794         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-795         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-796         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1251
 push dovar1_2
 call printstring
 add  sp, 2
;-797         if(widthi == 2) printstring(" ax, [bx]");

.dovar1251:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1252
 push dovar1_3
 call printstring
 add  sp, 2
;-798         return;

.dovar1252:
 jmp .retndovar1
;-799         }

;-800     if (mode==2){// & = adr

.dovar1250:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1253
;-801         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-802         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-803         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-804         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-805         return;

 jmp .retndovar1
;-806         }

;-807     if (ixarr) {//array

.dovar1253:
 mov ax, [bp+8]
 or  al, al
 je .dovar1254
;-808         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-809         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-810         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_7
 call printstring
 add  sp, 2
;-811         printstring("\n ");

.dovar1255:
 push dovar1_8
 call printstring
 add  sp, 2
;-812         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-813         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1256
 push dovar1_9
 call printstring
 add  sp, 2
;-814             else printstring(" al, ");

 jmp .dovar1257
.dovar1256:
 push dovar1_10
 call printstring
 add  sp, 2
;-815         prc('[');

.dovar1257:
 push 91
 call prc
 add  sp, 2
;-816         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-817         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-818         return;

 jmp .retndovar1
;-819         }

;-820     printstring("\n ");

.dovar1254:
 push dovar1_12
 call printstring
 add  sp, 2
;-821     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-822     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1258
 push dovar1_13
 call printstring
 add  sp, 2
;-823     if(wi==2) printstring(" ax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1259
 push dovar1_14
 call printstring
 add  sp, 2
;-824     if(wi==4) printstring(" eax, ");

.dovar1259:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1260
 push dovar1_15
 call printstring
 add  sp, 2
;-825     v(id1);

.dovar1260:
 push word [bp+10]
 call v
 add  sp, 2
;-826 }

;-827 

;-828 int rterm(char *op) {

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
;-829     int mode; int opint; int ixarr; int id1;

;-830     if (istoken(T_CONST)) {

;Function : rterm, Number local Var: 5
; # type sign width local variables
;100 ptr sign byte op = bp+4
;101 var sign word mode = bp-2
;102 var sign word opint = bp-4
;103 var sign word ixarr = bp-6
;104 var sign word id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm261
;-831         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-832         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-833         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm262
 push rterm_1
 call printstring
 add  sp, 2
;-834         if (wi==2) printstring(" ax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm263
 push rterm_2
 call printstring
 add  sp, 2
;-835         if (wi==4) printstring(" eax, ");

.rterm263:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm264
 push rterm_3
 call printstring
 add  sp, 2
;-836         printunsigned(lexval);

.rterm264:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-837         return;

 jmp .retnrterm
;-838         }

;-839     mode=typeName();

.rterm261:
 call typeName
 mov [bp-2], ax
;-840     id1=searchname();

 call searchname
 mov [bp-8], ax
;-841     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-842     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm265
;-843         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-844         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-845         expect(']');

 push 93
 call expect
 add  sp, 2
;-846         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-847         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm266
 push rterm_4
 call error1
 add  sp, 2
;-848         }

.rterm266:
;-849     if (eqstr(Symbol,"ax")) return;

.rterm265:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm267
 jmp .retnrterm
;-850     opint=op;

.rterm267:
 mov ax, [bp+4]
 mov [bp-4], ax
;-851     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-852 }

;-853 

;-854 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-855     gettypes(i);

;Function : doassign, Number local Var: 4
; # type sign width local variables
;100 var sign word mode = bp+4
;101 var sign word i = bp+6
;102 var sign word ixarr = bp+8
;103 var sign word ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-856     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign268
;-857         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-858         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-859         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign269
 push doassign_1
 call printstring
 add  sp, 2
;-860             else  printstring("\n mov  [bx], al");

 jmp .doassign270
.doassign269:
 push doassign_2
 call printstring
 add  sp, 2
;-861         return;

.doassign270:
 jmp .retndoassign
;-862         }

;-863     if (mode==2) {// & = adr

.doassign268:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign271
;-864         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-865         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-866         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-867         return;

 jmp .retndoassign
;-868         }

;-869     if (ixarr) {

.doassign271:
 mov ax, [bp+8]
 or  al, al
 je .doassign272
;-870         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-871         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign273
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-872             else v(ixarr);

 jmp .doassign274
.doassign273:
 push word [bp+8]
 call v
 add  sp, 2
;-873         if (wi==2) printstring("\n shl bx, 1");

.doassign274:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign275
 push doassign_6
 call printstring
 add  sp, 2
;-874         printstring("\n mov [");

.doassign275:
 push doassign_7
 call printstring
 add  sp, 2
;-875         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-876         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign276
 push doassign_8
 call printstring
 add  sp, 2
;-877             else printstring("+bx], al");

 jmp .doassign277
.doassign276:
 push doassign_9
 call printstring
 add  sp, 2
;-878         return;

.doassign277:
 jmp .retndoassign
;-879         }

;-880     if (wi==1){

.doassign272:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign278
;-881         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-882         if(i<LStart) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, [LStart]
 jge .doassign279
 push doassign_11
 call printstring
 add  sp, 2
;-883         v(i);

.doassign279:
 push word [bp+6]
 call v
 add  sp, 2
;-884         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-885         return;

 jmp .retndoassign
;-886         }

;-887     if (wi==2){

.doassign278:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign280
;-888         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-889         if(i<LStart) printstring("word ");

 mov ax, [bp+6]
 cmp ax, [LStart]
 jge .doassign281
 push doassign_14
 call printstring
 add  sp, 2
;-890         v(i);

.doassign281:
 push word [bp+6]
 call v
 add  sp, 2
;-891         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-892         return;

 jmp .retndoassign
;-893         }

;-894     if (wi==4){

.doassign280:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign282
;-895         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-896         if(i<LStart) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, [LStart]
 jge .doassign283
 push doassign_17
 call printstring
 add  sp, 2
;-897         v(i);

.doassign283:
 push word [bp+6]
 call v
 add  sp, 2
;-898         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-899         return;

 jmp .retndoassign
;-900         }

;-901 }

.doassign282:
;-902 

;-903 int domul(int ids) {

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
;-904     if (ids) rterm("imul");

;Function : domul, Number local Var: 1
; # type sign width local variables
;100 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul284
 push domul_0
 call rterm
 add  sp, 2
;-905         else {

 jmp .domul285
.domul284:
;-906         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul286
;-907             printstring("\n mov bx, ");

 push domul_1
 call printstring
 add  sp, 2
;-908             printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-909             printstring("\n mul bx");

 push domul_2
 call printstring
 add  sp, 2
;-910             }

;-911         else error1("with MUL only const number as multipl. allowed");

 jmp .domul287
.domul286:
 push domul_3
 call error1
 add  sp, 2
;-912         }

.domul287:
;-913 }

.domul285:
;-914 

;-915 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multipl. allowed",0
ENDP

doidiv: PROC
;-916     int mode; int id1;

;-917     if (istoken(T_CONST)) {

;Function : doidiv, Number local Var: 3
; # type sign width local variables
;100 var sign word ids = bp+4
;101 var sign word mode = bp-2
;102 var sign word id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv288
;-918         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-919         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-920         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv289
 push doidiv_1
 call printstring
 add  sp, 2
;-921             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv290
.doidiv289:
 push doidiv_2
 call printstring
 add  sp, 2
;-922         }

.doidiv290:
;-923     else {

 jmp .doidiv291
.doidiv288:
;-924         mode=typeName();

 call typeName
 mov [bp-2], ax
;-925         id1=searchname();

 call searchname
 mov [bp-4], ax
;-926         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv292
 push doidiv_3
 call error1
 add  sp, 2
;-927         gettypes(id1);

.doidiv292:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-928         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv293
 push doidiv_4
 call error1
 add  sp, 2
;-929         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv293:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv294
 push doidiv_5
 call error1
 add  sp, 2
;-930         printstring("\n mov bx, ");

.doidiv294:
 push doidiv_6
 call printstring
 add  sp, 2
;-931         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-932         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv295
 push doidiv_7
 call printstring
 add  sp, 2
;-933             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv296
.doidiv295:
 push doidiv_8
 call printstring
 add  sp, 2
;-934     }

.doidiv296:
;-935 }

.doidiv291:
;-936 

;-937 int domod(int ids) {

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
;-938     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;100 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-939     printstring("\n mov ax, dx");

 push domod_0
 call printstring
 add  sp, 2
;-940 }

;-941 

;-942 

;-943 int docalltype[10]; int docallvalue[10];

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
;-944 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name

section .bss
absolute 49382
procname resb 17
section .text
;-945 

;-946 int docall() {


docall: PROC
;-947     int i; int narg; int t0; int n0;  int sz32;

;-948     narg=0;

;Function : docall, Number local Var: 5
; # type sign width local variables
;103 var sign word i = bp-2
;104 var sign word narg = bp-4
;105 var sign word t0 = bp-6
;106 var sign word n0 = bp-8
;107 var sign word sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-949     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-950     checknamelen();

 call checknamelen
;-951     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-952     expect('(');

 push 40
 call expect
 add  sp, 2
;-953 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall297
;-954 	    do {

.docall298:
;-955 	        narg++;

 inc  word[bp-4]
;-956 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall299
 push docall_0
 call error1
 add  sp, 2
;-957 	        t0=0;

.docall299:
 mov ax, 0
 mov [bp-6], ax
;-958             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall300
;-959                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-960                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-961                 }

;-962             if(istoken(T_STRING)){

.docall300:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall301
;-963                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-964                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-965                 eprs("\n");

 push docall_1
 call eprs
 add  sp, 2
;-966                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-967                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-968                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-969                 eprs(" db ");

 push docall_2
 call eprs
 add  sp, 2
;-970                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-971                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-972                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-973                 eprs(",0");

 push docall_3
 call eprs
 add  sp, 2
;-974                 nconst++;

 inc  word[nconst]
;-975                 }

;-976             if(istoken('&'))     {

.docall301:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall302
;-977                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-978                 name1();

 call name1
;-979                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-980                 }

;-981             if(istoken(T_NAME))  {

.docall302:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall303
;-982 

;-983 

;-984 

;-985                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-986                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-987                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-988                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-989                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall304
 mov ax, 3
 mov [bp-6], ax
;-990 

;-991                 }

.docall304:
;-992             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall303:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall305
 push docall_4
 call error1
 add  sp, 2
;-993             docalltype [narg] = t0;

.docall305:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-994             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-995         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall306
 jmp .docall298
.docall306:
;-996 

;-997   	expect(')');

 push 41
 call expect
 add  sp, 2
;-998   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-999     do {

.docall307:
;-1000         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-1001         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-1002         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall308
;-1003             printstring("\n push ");

 push docall_5
 call printstring
 add  sp, 2
;-1004             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1005             }

;-1006         if(t0==2){

.docall308:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall309
;-1007             printstring("\n push ");

 push docall_6
 call printstring
 add  sp, 2
;-1008             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1009             prc(95);

 push 95
 call prc
 add  sp, 2
;-1010             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1011             }

;-1012         if(t0==3){

.docall309:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall310
;-1013             printstring("\n lea  ax, ");

 push docall_7
 call printstring
 add  sp, 2
;-1014             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1015             printstring("\n push ax");

 push docall_8
 call printstring
 add  sp, 2
;-1016             }

;-1017         if(t0==4){

.docall310:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall311
;-1018             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1019             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall312
;-1020                 printstring("\n push word ");

 push docall_9
 call printstring
 add  sp, 2
;-1021                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1022                 }

;-1023             else {

 jmp .docall313
.docall312:
;-1024                 printstring("\n mov al, byte ");

 push docall_10
 call printstring
 add  sp, 2
;-1025                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1026                 printstring("\n mov ah, 0\n push ax");

 push docall_11
 call printstring
 add  sp, 2
;-1027                 }

;-1028             }

.docall313:
;-1029         if(t0==5){

.docall311:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall314
;-1030             printstring("\n push ");

 push docall_12
 call printstring
 add  sp, 2
;-1031             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1032             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall315
 mov ax, [bp-10]
 add ax, 2
;-1033             }

.docall315:
;-1034         i--;

.docall314:
 dec  word[bp-2]
;-1035         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall316
 jmp .docall307
.docall316:
;-1036     }

;-1037 	printstring("\n call ");

.docall297:
 push docall_13
 call printstring
 add  sp, 2
;-1038 	printstring(&procname);

 lea  ax, [procname]
 push ax
 call printstring
 add  sp, 2
;-1039 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall317
;-1040 	    printstring("\n add  sp, ");

 push docall_14
 call printstring
 add  sp, 2
;-1041         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1042         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1043         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1044         }

;-1045 }

.docall317:
;-1046 

;-1047 

;-1048 int expr() {

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
;-1049     int mode;   int id1;

;-1050     int ixarr;  int ixconst;

;-1051     int ids;    int isCONST;

;-1052     int i;      unsigned char *p;

;-1053 

;-1054     if (istoken(T_CONST)) {// constant ;

;Function : expr, Number local Var: 8
; # type sign width local variables
;103 var sign word mode = bp-2
;104 var sign word id1 = bp-4
;105 var sign word ixarr = bp-6
;106 var sign word ixconst = bp-8
;107 var sign word ids = bp-10
;108 var sign word isCONST = bp-12
;109 var sign word i = bp-14
;110 ptr unsg byte p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr318
;-1055         printstring("\n mov ax, ");

 push expr_0
 call printstring
 add  sp, 2
;-1056         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1057         return 4;

 mov ax, 4
 jmp .retnexpr
;-1058         }

;-1059     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr318:
 call typeName
 mov [bp-2], ax
;-1060     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1061     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr319
;-1062         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1063         return;

 jmp .retnexpr
;-1064         }

;-1065 

;-1066     if (token=='(')  {

.expr319:
 mov ax, [token]
 cmp ax, 40
 jne .expr320
;-1067         docall();

 call docall
;-1068         goto e1;

 jmp .e1
;-1069         }

;-1070 

;-1071     id1=searchname();

.expr320:
 call searchname
 mov [bp-4], ax
;-1072     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1073     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1074     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1075     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1076     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr321
;-1077         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr322
;-1078             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1079             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1080             expect(']');

 push 93
 call expect
 add  sp, 2
;-1081             }

;-1082         else {

 jmp .expr323
.expr322:
;-1083             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1084             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1085             expect(']');

 push 93
 call expect
 add  sp, 2
;-1086             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1087             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr324
 push expr_1
 call error1
 add  sp, 2
;-1088             }

.expr324:
;-1089         }

.expr323:
;-1090     if (istoken(T_PLUSPLUS  )) {

.expr321:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr325
;-1091         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr326
 push expr_2
 call error1
 add  sp, 2
;-1092         printstring("\n inc  ");

.expr326:
 push expr_3
 call printstring
 add  sp, 2
;-1093         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr327
 push expr_4
 call printstring
 add  sp, 2
 jmp .expr328
.expr327:
 push expr_5
 call printstring
 add  sp, 2
;-1094         v(id1);

.expr328:
 push word [bp-4]
 call v
 add  sp, 2
;-1095         goto e1;

 jmp .e1
;-1096         }

;-1097     if (istoken(T_MINUSMINUS)) {

.expr325:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr329
;-1098         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr330
 push expr_6
 call error1
 add  sp, 2
;-1099         printstring("\n dec  ");

.expr330:
 push expr_7
 call printstring
 add  sp, 2
;-1100         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr331
 push expr_8
 call printstring
 add  sp, 2
 jmp .expr332
.expr331:
 push expr_9
 call printstring
 add  sp, 2
;-1101         v(id1);

.expr332:
 push word [bp-4]
 call v
 add  sp, 2
;-1102         goto e1;

 jmp .e1
;-1103         }

;-1104 

;-1105     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr329:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr333
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1
;-1106     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr333:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr334
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1
;-1107     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr334:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr335
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1
;-1108     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr335:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr336
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1109     if (istoken(T_MULASS  )) error1("not implemented");

.expr336:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push expr_14
 call error1
 add  sp, 2
;-1110     if (istoken(T_DIVASS  )) error1("not implemented");

.expr337:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
 push expr_15
 call error1
 add  sp, 2
;-1111 

;-1112     if (istoken('=')) {

.expr338:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
;-1113         expr();

 call expr
;-1114         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1115         goto e1;

 jmp .e1
;-1116         }

;-1117     dovar1(mode, "mov", ixarr, id1);

.expr339:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1118 

;-1119 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
 push expr_17
 call rterm
 add  sp, 2
;-1120     else if (istoken('-')) rterm("sub");

 jmp .expr341
.expr340:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr342
 push expr_18
 call rterm
 add  sp, 2
;-1121     else if (istoken('&')) rterm("and");

 jmp .expr343
.expr342:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr344
 push expr_19
 call rterm
 add  sp, 2
;-1122     else if (istoken('|')) rterm("or" );

 jmp .expr345
.expr344:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr346
 push expr_20
 call rterm
 add  sp, 2
;-1123     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr347
.expr346:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr348
 push expr_21
 call rterm
 add  sp, 2
;-1124     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr349
.expr348:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr350
 push expr_22
 call rterm
 add  sp, 2
;-1125     else if (istoken('*')) domul (ids);

 jmp .expr351
.expr350:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr352
 push word [bp-10]
 call domul
 add  sp, 2
;-1126     else if (istoken('/')) doidiv(ids);

 jmp .expr353
.expr352:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr354
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1127     else if (istoken('%')) domod (ids);

 jmp .expr355
.expr354:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr356
 push word [bp-10]
 call domod
 add  sp, 2
;-1128     if (isrelational()) {

.expr356:
.expr355:
.expr353:
.expr351:
.expr349:
.expr347:
.expr345:
.expr343:
.expr341:
 call isrelational
 or  al, al
 je .expr357
;-1129         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1130         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1131         }

;-1132     return 0;

.expr357:
 mov ax, 0
 jmp .retnexpr
;-1133 }

;-1134 

;-1135 int pexpr() {//called from if, do, while

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
;-1136     expect('(');

 push 40
 call expect
 add  sp, 2
;-1137     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1138     if (token==T_NAME) {//todo

 mov ax, [token]
 cmp ax, 256
 jne .pexpr358
;-1139         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1140         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr359
;-1141             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1142             return;

 jmp .retnpexpr
;-1143             }

;-1144         }

.pexpr359:
;-1145 

;-1146     expr();

.pexpr358:
 call expr
;-1147     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr360
 push pexpr_0
 call printstring
 add  sp, 2
;-1148     printstring(fname);

.pexpr360:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1149     expect(')');

 push 41
 call expect
 add  sp, 2
;-1150 }

;-1151 

;-1152 

;-1153 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1154     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;103 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1155     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1156     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1157     prc(':');

 push 58
 call prc
 add  sp, 2
;-1158 }

;-1159 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1160     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;103 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
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
;-1163 }

;-1164 

;-1165 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1166     int c; char cha;

;-1167     int jdest; int tst; int jtemp;

;-1168     if(istoken('{')) {

;Function : stmt, Number local Var: 5
; # type sign width local variables
;103 var sign word c = bp-2
;104 var sign byte cha = bp-4
;105 var sign word jdest = bp-6
;106 var sign word tst = bp-8
;107 var sign word jtemp = bp-10;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt361
;-1169         while(istoken('}')==0) stmt();

.stmt362:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt363
 call stmt
;-1170         }

 jmp .stmt362
.stmt363:
;-1171     else if(istoken(T_IF)) {

 jmp .stmt364
.stmt361:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt365
;-1172         pexpr();

 call pexpr
;-1173         nlabel++;

 inc  word[nlabel]
;-1174         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1175         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1176         stmt();

 call stmt
;-1177         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt366
;-1178             nlabel++;

 inc  word[nlabel]
;-1179             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1180             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1181             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1182             stmt();

 call stmt
;-1183             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1184         }

;-1185         else prlabel(jdest);

 jmp .stmt367
.stmt366:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1186     }

.stmt367:
;-1187     else if(istoken(T_DO)) {

 jmp .stmt368
.stmt365:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt369
;-1188         nlabel++;

 inc  word[nlabel]
;-1189         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1190         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1191         stmt();

 call stmt
;-1192         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1193         pexpr();

 call pexpr
;-1194         nlabel++;

 inc  word[nlabel]
;-1195         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1196         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1197         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1198          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1199     }

;-1200     else if(istoken(T_WHILE)) {

 jmp .stmt370
.stmt369:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt371
;-1201         nlabel++;

 inc  word[nlabel]
;-1202         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1203         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1204         pexpr();

 call pexpr
;-1205         nlabel++;

 inc  word[nlabel]
;-1206         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1207         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1208         stmt();

 call stmt
;-1209         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1210         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1211     }

;-1212     else if(istoken(T_GOTO))  {

 jmp .stmt372
.stmt371:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt373
;-1213         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1214         name1();

 call name1
;-1215         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1216         expect(';');

 push 59
 call expect
 add  sp, 2
;-1217     }

;-1218     else if(token==T_ASM)     {

 jmp .stmt374
.stmt373:
 mov ax, [token]
 cmp ax, 518
 jne .stmt375
;-1219       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1220       c=next();

 call next
 mov [bp-2], ax
;-1221       while(c != '\n') {

.stmt376:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt377
;-1222         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1223         c=next();

 call next
 mov [bp-2], ax
;-1224         };

 jmp .stmt376
.stmt377:
;-1225         token=getlex();

 call getlex
 mov word [token], ax
;-1226     }

;-1227     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt378
.stmt375:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt379
;-1228         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt380
;-1229             printstring("\n"); cha=next();

 push stmt_2
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1230             while(cha!= '}') {

.stmt381:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt382
;-1231                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1232                 cha=next();

 call next
 mov [bp-4], al
;-1233             }

;-1234             token=getlex();

 jmp .stmt381
.stmt382:
 call getlex
 mov word [token], ax
;-1235         } else error1("Curly open expected");

 jmp .stmt383
.stmt380:
 push stmt_3
 call error1
 add  sp, 2
;-1236     }

.stmt383:
;-1237     else if(istoken(T_INTH))  {

 jmp .stmt384
.stmt379:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt385
;-1238         printstring("\n int  ");

 push stmt_4
 call printstring
 add  sp, 2
;-1239         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1240         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1241         expect(';');

 push 59
 call expect
 add  sp, 2
;-1242     }

;-1243     else if(istoken(T_EMIT)) {

 jmp .stmt386
.stmt385:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt387
;-1244       printstring("\n db ");

 push stmt_5
 call printstring
 add  sp, 2
;-1245     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1246       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1247       token=getlex();

 call getlex
 mov word [token], ax
;-1248       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt388
;-1249           prc(',');

 push 44
 call prc
 add  sp, 2
;-1250           goto L1;

 jmp .L1
;-1251       }

;-1252       expect(')');

.stmt388:
 push 41
 call expect
 add  sp, 2
;-1253     }

;-1254     else if(istoken(';'))      { }

 jmp .stmt389
.stmt387:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt390
;-1255     else if(istoken(T_RETURN)) {

 jmp .stmt391
.stmt390:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt392
;-1256         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt393
 call expr
;-1257         printstring("\n jmp .retn");

.stmt393:
 push stmt_6
 call printstring
 add  sp, 2
;-1258         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1259         nreturn++;

 inc  word[nreturn]
;-1260         expect(';');

 push 59
 call expect
 add  sp, 2
;-1261     }

;-1262     else if(thechar==':')      {

 jmp .stmt394
.stmt392:
 mov al, [thechar]
 cmp al, 58
 jne .stmt395
;-1263         printstring("\n."); // Label

 push stmt_7
 call printstring
 add  sp, 2
;-1264         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1265         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1266         expect(':');

 push 58
 call expect
 add  sp, 2
;-1267     }

;-1268     else  {expr();; expect(';'); }

 jmp .stmt396
.stmt395:
 call expr
 push 59
 call expect
 add  sp, 2
;-1269 }

.stmt396:
.stmt394:
.stmt391:
.stmt389:
.stmt386:
.stmt384:
.stmt378:
.stmt374:
.stmt372:
.stmt370:
.stmt368:
.stmt364:
;-1270 

;-1271 int isvariable() {

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
;-1272     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable397
 jmp .v1
;-1273     if(token==T_UNSIGNED) goto v1;

.isvariable397:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable398
 jmp .v1
;-1274     if(token==T_CHAR)     goto v1;

.isvariable398:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable399
 jmp .v1
;-1275     if(token==T_INT)      goto v1;

.isvariable399:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable400
 jmp .v1
;-1276     if(token==T_LONG)     goto v1;

.isvariable400:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable401
 jmp .v1
;-1277     return 0;

.isvariable401:
 mov ax, 0
 jmp .retnisvariable
;-1278 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1279 }

;-1280 

;-1281 //***************************************************************

;-1282 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1283     unsigned int j;

;-1284     char c;

;-1285     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;103 var unsg word i = bp+4
;104 var unsg word j = bp-2
;105 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1286     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1287     prc(32);

 push 32
 call prc
 add  sp, 2
;-1288     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1289     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar402
 push listvar_1
 call printstring
 add  sp, 2
;-1290     if(c=='*')printstring("ptr ");

.listvar402:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar403
 push listvar_2
 call printstring
 add  sp, 2
;-1291     if(c=='&')printstring("arr ");

.listvar403:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar404
 push listvar_3
 call printstring
 add  sp, 2
;-1292     if(c=='#')printstring("def ");

.listvar404:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar405
 push listvar_4
 call printstring
 add  sp, 2
;-1293     c=GSign [i];

.listvar405:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1294     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar406
 push listvar_5
 call printstring
 add  sp, 2
;-1295     if(c=='U')printstring("unsg ");

.listvar406:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar407
 push listvar_6
 call printstring
 add  sp, 2
;-1296     c=GWidth[i];

.listvar407:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1297     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar408
 push listvar_7
 call printstring
 add  sp, 2
;-1298     if(c== 1)printstring("byte " );

.listvar408:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar409
 push listvar_8
 call printstring
 add  sp, 2
;-1299     if(c== 2)printstring("word " );

.listvar409:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar410
 push listvar_9
 call printstring
 add  sp, 2
;-1300     if(c== 4)printstring("long " );

.listvar410:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar411
 push listvar_10
 call printstring
 add  sp, 2
;-1301     j=i*32;

.listvar411:
 mov ax, [bp+4]
 mov bx, 32
 mul bx
 mov [bp-2], ax
;-1302     pt=&GNameField + j;

 mov ax, GNameField
 add ax, [bp-2]
 mov word [pt], ax
;-1303     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1304     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar412
;-1305         prc('=');

 push 61
 call prc
 add  sp, 2
;-1306         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1307         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1308     }

;-1309     if(GType[i]=='&') {

.listvar412:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar413
;-1310         prc('[');

 push 91
 call prc
 add  sp, 2
;-1311         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1312         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1313         prc(']');

 push 93
 call prc
 add  sp, 2
;-1314     }

;-1315     if (i >= LStart) {

.listvar413:
 mov ax, [bp+4]
 cmp ax, [LStart] ;unsigned : 0
 jb  .listvar414
;-1316         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1317         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1318         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar415
 push 43
 call prc
 add  sp, 2
;-1319         printinteger(j);

.listvar415:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1320     }

;-1321 }

.listvar414:
;-1322 

;-1323 int listproc() {

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
;-1324     int i;

;-1325     if (LTop > LStart) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;103 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, [LStart]
 jle .listproc416
;-1326         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1327         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1328         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1329         i=LTop - LStart;

 mov ax, [LTop]
 sub ax, [LStart]
 mov [bp-2], ax
;-1330         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1331         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1332         i=LStart;

 mov ax, [LStart]
 mov [bp-2], ax
;-1333         while (i < LTop) {

.listproc417:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc418
;-1334             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1335             i++;

 inc  word[bp-2]
;-1336         }

;-1337     }

 jmp .listproc417
.listproc418:
;-1338 }

.listproc416:
;-1339 

;-1340 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1341     int FunctionIndex; char *p;

;-1342     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;103 var sign word FunctionIndex = bp-2
;104 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1343     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1344     while (FunctionIndex <= FunctionMaxIx) {

.searchFunction419:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction420
;-1345         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction421
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1346         p = strlen(p) + p;

.searchFunction421:
 push word [bp-4]
 call strlen
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1347         p++;

 inc  word[bp-4]
;-1348         FunctionIndex++;

 inc  word[bp-2]
;-1349     }

;-1350     return 0;               //no function found

 jmp .searchFunction419
.searchFunction420:
 mov ax, 0
 jmp .retnsearchFunction
;-1351 }

;-1352 

;-1353 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1354     unsigned int i;

;-1355     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;103 var unsg word i = bp-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1356     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300 ;unsigned : 1
 jl  .storeFunction422
 push storeFunction_0
 call error1
 add  sp, 2
;-1357     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction422:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1358     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1359     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1360     i += IDLENMAX;

 add  word[bp-2], 31
;-1361     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000 ;unsigned : 0
 jb  .storeFunction423
 push storeFunction_1
 call error1
 add  sp, 2
;-1362 

;-1363 }

.storeFunction423:
;-1364 

;-1365 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1366     int nloc; unsigned int j;int narg;

;-1367     int VarNamePtrLocalStart;

;-1368     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;103 var sign word nloc = bp-2
;104 var unsg word j = bp-4
;105 var sign word narg = bp-6
;106 var sign word VarNamePtrLocalStart = bp-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1369     checknamelen();

 call checknamelen
;-1370     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1371     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc424
 push dofunc_0
 call error1
 add  sp, 2
;-1372     storeFunction();

.dofunc424:
 call storeFunction
;-1373 

;-1374     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1375     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1376     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1377     expect('(');

 push 40
 call expect
 add  sp, 2
;-1378     LStart=GTop;

 mov ax, [GTop]
 mov word [LStart], ax
;-1379     LTop=LStart;

 mov ax, [LStart]
 mov word [LTop], ax
;-1380     VarNamePtrLocalStart=VarNamePtr;

 mov ax, [VarNamePtr]
 mov [bp-8], ax
;-1381 

;-1382     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc425
;-1383         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1384         do {

.dofunc426:
;-1385             typeName();

 call typeName
;-1386             addlocal();

 call addlocal
;-1387             narg+=2;

 add  word[bp-6], 2
;-1388             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1389             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc427
 add  word[bp-6], 2
;-1390             LTop++;

.dofunc427:
 inc  word[LTop]
;-1391             }

;-1392         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc428
 jmp .dofunc426
.dofunc428:
;-1393         expect(')');

 push 41
 call expect
 add  sp, 2
;-1394         }

;-1395 

;-1396     expect('{'); /*body*/

.dofunc425:
 push 123
 call expect
 add  sp, 2
;-1397     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1398     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1399     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1400     while(isvariable()) {

.dofunc429:
 call isvariable
 or  al, al
 je .dofunc430
;-1401         do {

.dofunc431:
;-1402             typeName();

 call typeName
;-1403             checknamelen();

 call checknamelen
;-1404             addlocal();

 call addlocal
;-1405             nloc-=2;

 sub  word[bp-2], 2
;-1406             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc432
 sub  word[bp-2], 2
;-1407             GData[LTop]=nloc;

.dofunc432:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1408             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc433
;-1409                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1410                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1411                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1412                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1413                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1414                 nloc+=2;

 add  word[bp-2], 2
;-1415                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1416             }

;-1417             LTop++;

.dofunc433:
 inc  word[LTop]
;-1418         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc434
 jmp .dofunc431
.dofunc434:
;-1419         expect(';');

 push 59
 call expect
 add  sp, 2
;-1420     }

;-1421     listproc();

 jmp .dofunc429
.dofunc430:
 call listproc
;-1422     if (LTop>LStart){

 mov ax, [LTop]
 cmp ax, [LStart]
 jle .dofunc435
;-1423         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1424         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1425         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1426         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1427         }

;-1428 

;-1429     while(istoken('}')==0)  stmt();

.dofunc435:
.dofunc436:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc437
 call stmt
;-1430 

;-1431     if (nreturn) {

 jmp .dofunc436
.dofunc437:
 mov ax, [nreturn]
 or  al, al
 je .dofunc438
;-1432             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1433             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1434             prc(':');

 push 58
 call prc
 add  sp, 2
;-1435         }

;-1436     if (LTop > LStart) printstring("\n LEAVE");

.dofunc438:
 mov ax, [LTop]
 cmp ax, [LStart]
 jle .dofunc439
 push dofunc_6
 call printstring
 add  sp, 2
;-1437     printstring("\n ret");

.dofunc439:
 push dofunc_7
 call printstring
 add  sp, 2
;-1438     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1439     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1440     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1441     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc440
 mov ax, [maxco1]
 mov word [maxco], ax
;-1442     printstring("\nENDP");

.dofunc440:
 push dofunc_8
 call printstring
 add  sp, 2
;-1443     VarNamePtr=VarNamePtrLocalStart;//delete local names

 mov ax, [bp-8]
 mov word [VarNamePtr], ax
;-1444 }

;-1445 

;-1446 char doglobName[IDLENMAX];

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
;-1447 int doglob() {


doglob: PROC
;-1448     int i; int j; int isstrarr;

;-1449     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;104 var sign word i = bp-2
;105 var sign word j = bp-4
;106 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1450     if (GTop >= VARMAX) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .doglob441
 push doglob_0
 call error1
 add  sp, 2
;-1451     if (iswidth == 0) error1("no VOID as var type");

.doglob441:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob442
 push doglob_1
 call error1
 add  sp, 2
;-1452     checknamelen();

.doglob442:
 call checknamelen
;-1453     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob443
 push doglob_2
 call error1
 add  sp, 2
;-1454     if (istoken('[')) {

.doglob443:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob444
;-1455         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1456         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob445
;-1457             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1458             printunsigned(orgDatai);

 push word [orgDatai]
 call printunsigned
 add  sp, 2
;-1459             printstring("\n"); printstring(Symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1460             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob446
 push doglob_5
 call printstring
 add  sp, 2
;-1461             if (iswidth==2) printstring(" resw ");

.doglob446:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob447
 push doglob_6
 call printstring
 add  sp, 2
;-1462             if (iswidth==4) printstring(" resd ");

.doglob447:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob448
 push doglob_7
 call printstring
 add  sp, 2
;-1463             printunsigned(lexval);

.doglob448:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1464             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1465             orgDatai=orgDatai+lexval;

 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1466             if (iswidth==2) orgDatai=orgDatai+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob449
 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1467             if (iswidth==4) {i= lexval * 3; orgDatai=orgDatai + i;}

.doglob449:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob450
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgDatai]
 add ax, [bp-2]
 mov word [orgDatai], ax
;-1468             GData[GTop]=lexval;

.doglob450:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1469             expect(']');

 push 93
 call expect
 add  sp, 2
;-1470         }else {

 jmp .doglob451
.doglob445:
;-1471             expect(']');

 push 93
 call expect
 add  sp, 2
;-1472             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob452
 push doglob_9
 call error1
 add  sp, 2
;-1473             printstring("\n");

.doglob452:
 push doglob_10
 call printstring
 add  sp, 2
;-1474             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1475             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1476             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1477             strcpy(doglobName, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1478             expect('=');

 push 61
 call expect
 add  sp, 2
;-1479             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob453
;-1480                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1481                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1482                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1483                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1484                 i=strlen(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1485                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1486                 }

;-1487             else if (istoken('{' )) {

 jmp .doglob454
.doglob453:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob455
;-1488                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1489                 do {

.doglob456:
;-1490                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob457
 push 44
 call prc
 add  sp, 2
;-1491                     expect(T_CONST);

.doglob457:
 push 257
 call expect
 add  sp, 2
;-1492                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1493                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1494                     }

;-1495                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob458
 jmp .doglob456
.doglob458:
;-1496                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1497             }

;-1498         else error1("String or number array expected");

 jmp .doglob459
.doglob455:
 push doglob_13
 call error1
 add  sp, 2
;-1499         };

.doglob459:
.doglob454:
.doglob451:
;-1500     }else { //expect('=');

 jmp .doglob460
.doglob444:
;-1501         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1502         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1503         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob461
 push doglob_15
 call printstring
 add  sp, 2
;-1504         else {

 jmp .doglob462
.doglob461:
;-1505             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob463
 push doglob_16
 call printstring
 add  sp, 2
;-1506             else if (iswidth==2) printstring(" dw ");

 jmp .doglob464
.doglob463:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob465
 push doglob_17
 call printstring
 add  sp, 2
;-1507             else                 printstring(" dd ");

 jmp .doglob466
.doglob465:
 push doglob_18
 call printstring
 add  sp, 2
;-1508         }

.doglob466:
.doglob464:
;-1509     if(istoken('-')) prc('-');

.doglob462:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob467
 push 45
 call prc
 add  sp, 2
;-1510     if (istoken('=')) {

.doglob467:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob468
;-1511         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1512         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1513         }else printunsigned(0);

 jmp .doglob469
.doglob468:
 push 0
 call printunsigned
 add  sp, 2
;-1514     }

.doglob469:
;-1515     GSign[GTop]=issign;

.doglob460:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1516     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1517     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1518     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1519     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob470
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1520         else strcpy(pt, Symbol);

 jmp .doglob471
.doglob470:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1521 

;-1522     GTop++;

.doglob471:
 inc  word[GTop]
;-1523     expect(';');

 push 59
 call expect
 add  sp, 2
;-1524 }

;-1525 

;-1526 int dodefine() {

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
;-1527     expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1528     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine472
;-1529         if (GTop >= VARMAX) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .dodefine473
 push dodefine_0
 call error1
 add  sp, 2
;-1530         checknamelen();

.dodefine473:
 call checknamelen
;-1531         if (checkName() != 0) error1("#Define var already defined");

 call checkName
 cmp ax, 0
 je  .dodefine474
 push dodefine_1
 call error1
 add  sp, 2
;-1532         if (eqstr(Symbol, "ORGDATA")) {

.dodefine474:
 push dodefine_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine475
;-1533             orgDataOriginal=lexval;

 mov ax, [lexval]
 mov word [orgDataOriginal], ax
;-1534             orgDatai=lexval;

 mov ax, [lexval]
 mov word [orgDatai], ax
;-1535             expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1536             return;

 jmp .retndodefine
;-1537         }

;-1538         GSign [GTop]='U';

.dodefine475:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1539         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1540         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1541         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1542         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1543         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1544         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1545         GTop++;

 inc  word[GTop]
;-1546     }

;-1547 }

.dodefine472:
;-1548 

;-1549 int parse() {

 .retndodefine:
 ret
dodefine_0 db "global table (define) full",0
dodefine_1 db "#Define var already defined",0
dodefine_2 db "ORGDATA",0
ENDP

parse: PROC
;-1550     token=getlex();

 call getlex
 mov word [token], ax
;-1551     do {

.parse476:
;-1552         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse477
 mov ax, 1
 jmp .retnparse
;-1553         if (istoken('#')) {

.parse477:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse478
;-1554              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse479
 call dodefine
;-1555              else error1("define expected");

 jmp .parse480
.parse479:
 push parse_0
 call error1
 add  sp, 2
;-1556         }

.parse480:
;-1557     else{

 jmp .parse481
.parse478:
;-1558         typeName();

 call typeName
;-1559         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse482
 call dofunc
;-1560         else doglob(); }

 jmp .parse483
.parse482:
 call doglob
.parse483:
;-1561     } while(1);

.parse481:
 mov ax, 1
 or  al, al
 je .parse484
 jmp .parse476
.parse484:
;-1562 }

;-1563 

;-1564 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1565 int main() {


main: PROC
;-1566     int arglen1; unsigned int i; char *c;

;-1567     isPrint=1;

;Function : main, Number local Var: 3
; # type sign width local variables
;106 var sign word arglen1 = bp-2
;107 var unsg word i = bp-4
;108 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1568     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1569     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main485
;-1570         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1571         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1572         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1573         }

;-1574     i=arglen1+129;

.main485:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1575     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1576     arglen1--;

 dec  word[bp-2]
;-1577     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1578     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1579     if (instr1(namein, '.') == 0) strcat(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main486
 push main_1
 lea  ax, [namein]
 push ax
 call strcat
 add  sp, 4
;-1580     strcpy(namelst, namein);

.main486:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1581     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1582     i--;

 dec  word[bp-4]
;-1583     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1584     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1585 

;-1586     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1587     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main487
;-1588         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1589         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1590         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1591         }

;-1592     fdout=creatR(namelst);

.main487:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1593     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main488
;-1594         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1595         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1596         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1597         }

;-1598     printstring(";");

.main488:
 push main_4
 call printstring
 add  sp, 2
;-1599     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1600     printstring(", Input: "); printstring(namein);

 push main_5
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1601     printstring(", Output: "); printstring(namelst);

 push main_6
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1602     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1603     printstring("\norg  256 \njmp main");

 push main_7
 call printstring
 add  sp, 2
;-1604 

;-1605     LTop=LStart;//new todo put in dofunction

 mov ax, [LStart]
 mov word [LTop], ax
;-1606 

;-1607     VarNamePtr= &VarNames;

 mov ax, VarNames
 mov word [VarNamePtr], ax
;-1608     FunctionNamePtr= &FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1609     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1610     orgDatai=orgDataOriginal;

 mov ax, [orgDataOriginal]
 mov word [orgDatai], ax
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
;-1620     printstring(" (");                      printunsigned(VARMAX);

 push main_9
 call printstring
 add  sp, 2
 push 400
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
;-1623     printstring("), Lines:");               printunsigned(lineno);

 push main_12
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1624     printstring("\n;Constant: ");           printunsigned(maxco);

 push main_13
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1625     printstring(" (");                      printunsigned(COMAX);

 push main_14
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1626     i=COMAX;

 mov ax, 3000
 mov [bp-4], ax
;-1627     i=i-maxco;

 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1628     if (i <= 1000)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main489
 push main_15
 call printstring
 add  sp, 2
;-1629     printstring("), stacksize: ");

.main489:
 push main_16
 call printstring
 add  sp, 2
;-1630     i=65536;

 mov ax, 0
 mov [bp-4], ax
;-1631     i=i-orgDatai;

 mov ax, [bp-4]
 sub ax, [orgDatai]
 mov [bp-4], ax
;-1632     printunsigned(i);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1633     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main490
 push main_17
 call printstring
 add  sp, 2
;-1634     end1(0);

.main490:
 push 0
 call end1
 add  sp, 2
;-1635 }

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
;Glob. variables:105 (400), Functions:76 (300), Lines:1636
;Constant: 688 (3000), stacksize: 16106