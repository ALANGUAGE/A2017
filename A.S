;PLA compiler A.COM V1.1, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA compiler A.COM V1.1";//16904 bytes. 32905 stack

Version1 db "PLA compiler A.COM V1.1",0
;-2 //todo:op=reg not recognized

;-3 //todo Property byte: 0-Null, 1-8Byte, 2-16Int, 3-32Long, 4-64LongLong

;-4 //5-Sign, 6-Ptr, 7_&Array

;-5 #define IDLENMAX       31//max length of names

;-6 #define COLUMNMAX     128//output, input is 100

;-7 #define T_NAME        256//the following defines for better clearity > 255

;-8 #define T_CONST       257

;-9 #define T_STRING      258

;-10 #define T_DEFINE      511

;-11 #define T_RETURN      512

;-12 #define T_IF          513

;-13 #define T_ELSE        514

;-14 #define T_WHILE       515

;-15 #define T_DO          516

;-16 #define T_INT         517

;-17 #define T_ASM         518

;-18 #define T_ASMBLOCK    519

;-19 #define T_ASMDIRECT   525

;-20 #define T_EMIT        520

;-21 #define T_GOTO        521

;-22 #define T_VOID        529

;-23 #define T_CHAR        530

;-24 #define T_SIGNED      531

;-25 #define T_UNSIGNED    532

;-26 #define T_LONG        533

;-27 #define T_INTH        600

;-28 #define T_EQ          806

;-29 #define T_NE          807

;-30 #define T_GE          811

;-31 #define T_LE          824

;-32 #define T_PLUSPLUS   1219

;-33 #define T_MINUSMINUS 1225

;-34 #define T_PLUSASS    1230

;-35 #define T_MINUSASS   1231

;-36 #define T_MULASS     1232

;-37 #define T_DIVASS     1233

;-38 #define T_ANDASS     1234

;-39 #define T_ORASS      1235

;-40 #define T_LESSLESS   1240

;-41 #define T_GREATGREAT 1241

;-42 

;-43 char isPrint=1;//set screen listing

isPrint db 1
;-44 #define ORGDATA     20000//set to end of text=start of arrays

;-45 unsigned int orgDataOriginal=20000;//must be ORGDATA

orgDataOriginal dw 20000
;-46 unsigned int orgDatai;//actual max of array, must be less than stack

orgDatai dw 0
;-47 #define COMAX        3000

;-48 char co[COMAX];//constant storage

section .bss
absolute 20000
co resb 3000
section .text
;-49 int maxco=0;

maxco dw 0
;-50 int maxco1=0;

maxco1 dw 0
;-51 #define CMDLENMAX      67

;-52 char Symbol[COLUMNMAX];

section .bss
absolute 23000
Symbol resb 128
section .text
;-53 char fname[CMDLENMAX];

section .bss
absolute 23128
fname resb 67
section .text
;-54 char namein[CMDLENMAX];

section .bss
absolute 23195
namein resb 67
section .text
;-55 char namelst[CMDLENMAX];

section .bss
absolute 23262
namelst resb 67
section .text
;-56 char *cloc=0;

cloc dw 0
;-57 int fdin=0;

fdin dw 0
;-58 int fdout=0;

fdout dw 0
;-59 int token=0;

token dw 0
;-60 int column=0;

column dw 0
;-61 char thechar=0;   //reads one char forward

thechar db 0
;-62 int iscmp=0;

iscmp dw 0
;-63 int nconst=0;

nconst dw 0
;-64 int nreturn=0;

nreturn dw 0
;-65 int nlabel=0;‚

nlabel dw 0
;-66 unsigned int lexval=0;

lexval dw 0
;-67 unsigned long Llexvar;

Llexvar dd 0
;-68 int typei;       char istype;

typei dw 0
istype db 0
;-69 int signi;       char issign;

signi dw 0
issign db 0
;-70 int widthi;      char iswidth;

widthi dw 0
iswidth db 0
;-71 int wi=0;

wi dw 0
;-72 #define VARMAX        400//max global and local var

;-73 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 23329
GType resb 400
section .text
;-74 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 23729
GSign resb 400
section .text
;-75 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 24129
GWidth resb 400
section .text
;-76 int  GData [VARMAX];

section .bss
absolute 24529
GData resw 400
section .text
;-77 #define VARNAMESMAX 4000

;-78 char VarNames[VARNAMESMAX];//Space for global and local var names

section .bss
absolute 25329
VarNames resb 4000
section .text
;-79 char *VarNamePtr;   //first free position

VarNamePtr dw 0
;-80 int GTop=1;         //0 = empty

GTop dw 1
;-81 int LTop=1;

LTop dw 1
;-82 

;-83 #define FUNCMAX       300//max functions

;-84 #define FUNCTIONNAMESMAX 3000//Space for preceeding functon names

;-85 char FunctionNames[FUNCTIONNAMESMAX];

section .bss
absolute 29329
FunctionNames resb 3000
section .text
;-86 char *FunctionNamePtr;  //first free position in FunctionNames

FunctionNamePtr dw 0
;-87 int  FunctionMaxIx=0;   //number of functions

FunctionMaxIx dw 0
;-88 

;-89 char fgetsdest[COLUMNMAX];

section .bss
absolute 32329
fgetsdest resb 128
section .text
;-90 unsigned char *fgetsp=0;

fgetsp dw 0
;-91 unsigned int lineno=1;

lineno dw 1
;-92 unsigned char *pt=0;

pt dw 0
;-93 unsigned char *p1=0;

p1 dw 0
;-94 int DOS_ERR=0;

DOS_ERR dw 0
;-95 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-96 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-97 int ireg1;

ireg1 dw 0
;-98 int mod2;

mod2 dw 0
;-99 int ireg2;

ireg2 dw 0
;-100 

;-101 int writetty()     {//char in AL


writetty: PROC
;-102     ah=0x0E;

 mov  ah, 14
;-103     asm push bx

 push bx
;-104     bx=0;     //page in BH

 mov  bx, 0
;-105     inth 0x10;

 int  16
;-106     asm pop bx

 pop bx
;-107 }

;-108 int putch(char c)  {

 ret
ENDP

putch: PROC
;-109     if (c==10)  {// LF

;Function : putch, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-110         al=13;   // CR, write CR first and then LF

 mov  al, 13
;-111         writetty();

 call writetty
;-112     }

;-113     al=c;

.putch1:
 mov  al, [bp+4]
;-114     writetty();

 call writetty
;-115 }

;-116 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-117     char c;

;-118     while(*s) {

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
;-119         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-120         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-121         s++;

 inc  word[bp+4]
;-122     }

;-123 }

 jmp .cputs2
.cputs3:
;-124 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-125     n; // ax=n;

;Function : mkneg, Number local Var: 1
; # type sign width local variables
;96 var sign word n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
;-126     asm neg ax

 neg ax
;-127 }

;-128 

;-129 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-130     inth 0x21;

 int  33
;-131     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-132     DOS_ERR++;

 inc  word[DOS_ERR]
;-133 }

;-134 int openR (char *s) {

 ret
ENDP

openR: PROC
;-135 	dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-136     ax=0x3D02;

 mov  ax, 15618
;-137     DosInt();

 call DosInt
;-138 }

;-139 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-140     dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-141     cx=0;

 mov  cx, 0
;-142     ax=0x3C00;

 mov  ax, 15360
;-143     DosInt();

 call DosInt
;-144 }

;-145 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-146     bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;96 var sign word fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
;-147     ax=0x3E00;

 mov  ax, 15872
;-148     DosInt();

 call DosInt
;-149 }

;-150 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-151     ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov  ah, 76
;-152     al=c;

 mov  al, [bp+4]
;-153     DosInt();

 call DosInt
;-154 }

;-155 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-156     dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign word fd = bp+6
;98 var sign word len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
;-157     cx=len;

 mov  cx, [bp+8]
;-158     bx=fd;

 mov  bx, [bp+6]
;-159     ax=0x3F00;

 mov  ax, 16128
;-160     DosInt();

 call DosInt
;-161 }

;-162 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-163     asm lea dx, [bp+4]; *n  todo: why not mov

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte n = bp+4
;97 var sign word fd = bp+6;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov
;-164     cx=1;

 mov  cx, 1
;-165     bx=fd;

 mov  bx, [bp+6]
;-166     ax=0x4000;

 mov  ax, 16384
;-167     DosInt();

 call DosInt
;-168 }

;-169 

;-170 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-171       if (c=='_') return 1;

;Function : letter, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-172       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-173       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-174       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-175       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-176       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-177       if (c> 'Z') { if (c< 'a') return 0; }

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
;-178       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-179 }

;-180 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-181       if(c<'0') return 0;

;Function : digit, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-182       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-183       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-184 }

;-185 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-186     if (digit (c)) return 1;

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
;-187     if (letter(c)) return 1;

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
;-188     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-189 }

;-190 

;-191 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-192     c=0;

;Function : strlen, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign word c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-193     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-194     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-195 }

;-196 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-197     do { *s=*t; s++; t++; }

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
;-198     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-199     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-200     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-201 }

;-202 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-203     while(*p) {

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
;-204         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-205         p++;

.eqstr22:
 inc  word[bp+4]
;-206         q++;

 inc  word[bp+6]
;-207     }

;-208     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-209     return 1;

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-210 }

;-211 int strcat(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat: PROC
;-212     while (*s != 0) s++;

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
;-213     strcpy(s, t);

 jmp .strcat24
.strcat25:
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
;96 ptr sign byte s = bp+4;
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
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp+6;
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
;96 var sign byte c = bp+4;
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
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp-2;
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
;96 var unsg byte c = bp+4;
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
;96 ptr unsg byte s = bp+4
;97 var unsg byte c = bp-2;
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
;96 ptr unsg byte s = bp+4
;97 var unsg byte c = bp-2
;98 var sign word com = bp-4;
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

;-283 int eprnum(int n){//for docall procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-284     int e;

;-285     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;96 var sign word n = bp+4
;97 var sign word e = bp-2;
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
;96 var unsg word n = bp+4
;97 var unsg word e = bp-2;
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
;96 var sign word n = bp+4;
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
;96 ptr sign byte s = bp+4;
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
;96 var sign word col = bp-2;
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
;96 var sign byte c = bp-2;
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
;96 var sign byte r = bp-2;
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

;-388 int storeVarName() {

 .retnnext:
 LEAVE
 ret
ENDP

storeVarName: PROC
;-389     unsigned int i;

;-390     VarNamePtr=strcpy(VarNamePtr, Symbol);

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
;-391     VarNamePtr++;

 inc  word[VarNamePtr]
;-392     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-393     i += IDLENMAX;

 add  word[bp-2], 31
;-394     if (i > VARNAMESMAX) error1("too many variable names");

 mov ax, [bp-2]
 cmp ax, 4000
 jle .storeVarName59
 push storeVarName_0
 call error1
 add  sp, 2
;-395 }

.storeVarName59:
;-396 

;-397 int getVarName(unsigned int i) {

 LEAVE
 ret
storeVarName_0 db "too many variable names",0
ENDP

getVarName: PROC
;-398 	int j; char *p;

;-399 	j = 1;

;Function : getVarName, Number local Var: 3
; # type sign width local variables
;96 var unsg word i = bp+4
;97 var sign word j = bp-2
;98 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, 1
 mov [bp-2], ax
;-400 	p = &VarNames;

 mov ax, VarNames
 mov [bp-4], ax
;-401 	while (j < i) {

.getVarName60:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 jge .getVarName61
;-402 		while (*p) p++;

.getVarName62:
 mov bx, [bp-4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .getVarName63
 inc  word[bp-4]
;-403 		p++;

 jmp .getVarName62
.getVarName63:
 inc  word[bp-4]
;-404 		j++;	 		

 inc  word[bp-2]
;-405 	}

;-406 	return p;	

 jmp .getVarName60
.getVarName61:
 mov ax, [bp-4]
 jmp .retngetVarName
;-407 }

;-408 		

;-409 int printName(unsigned int i) {

 .retngetVarName:
 LEAVE
 ret
ENDP

printName: PROC
;-410     if (i < GTop) {

;Function : printName, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .printName64
;-411 	    i=getVarName(i);	    

 push word [bp+4]
 call getVarName
 add  sp, 2
 mov [bp+4], ax
;-412         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-413     }

;-414     else {

 jmp .printName65
.printName64:
;-415         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-416         i = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp+4], ax
;-417         if (i>0) prc('+');

 mov ax, [bp+4]
 cmp ax, 0
 jle .printName66
 push 43
 call prc
 add  sp, 2
;-418         printinteger(i);

.printName66:
 push word [bp+4]
 call printinteger
 add  sp, 2
;-419         prc(']');

 push 93
 call prc
 add  sp, 2
;-420     }

;-421 }

.printName65:
;-422 

;-423 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-424     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL67
 mov ax, 1
 jmp .retnifEOL
;-425     if (c == 13) {//CR

.ifEOL67:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL68
;-426         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL69
 call next
 mov [bp+4], al
;-427         return 1;

.ifEOL69:
 mov ax, 1
 jmp .retnifEOL
;-428     }

;-429     return 0;

.ifEOL68:
 mov ax, 0
 jmp .retnifEOL
;-430 }

;-431 

;-432 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 32457
symboltemp resb 80
section .text
;-433 

;-434 int getlex() {


getlex: PROC
;-435     char c; char *p;

;-436     char symboltmp[80];

;-437     int i; int j;

;-438     

;-439 g1: c=next();

;Function : getlex, Number local Var: 5
; # type sign width local variables
;97 var sign byte c = bp-2
;98 ptr sign byte p = bp-4
;99 arr sign byte symboltmp[65452] = bp-84
;100 var sign word i = bp-86
;101 var sign word j = bp-88;
 ENTER  88,0
.g1:
 call next
 mov [bp-2], al
;-440     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex70
 mov ax, 0
 jmp .retngetlex
;-441     if (c <= ' ') goto g1;

.getlex70:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex71
 jmp .g1
;-442 

;-443 /*	do {    

;-444 		c=next();

;-445     	if (c == 0) return 0;

;-446     while (c <= ' ');

;-447 */      

;-448   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex71:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex72
 mov al, [thechar]
 cmp al, 61
 jne .getlex73
 call next
 mov ax, 806
 jmp .retngetlex
.getlex73:
;-449   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex72:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex74
 mov al, [thechar]
 cmp al, 61
 jne .getlex75
 call next
 mov ax, 807
 jmp .retngetlex
.getlex75:
;-450   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex74:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex76
 mov al, [thechar]
 cmp al, 61
 jne .getlex77
 call next
 mov ax, 824
 jmp .retngetlex
.getlex77:
;-451   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex76:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex78
 mov al, [thechar]
 cmp al, 61
 jne .getlex79
 call next
 mov ax, 811
 jmp .retngetlex
.getlex79:
;-452   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex78:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex80
 mov al, [thechar]
 cmp al, 60
 jne .getlex81
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex81:
;-453   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex80:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex82
 mov al, [thechar]
 cmp al, 62
 jne .getlex83
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex83:
;-454   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex82:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex84
 mov al, [thechar]
 cmp al, 43
 jne .getlex85
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex85:
;-455   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex84:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex86
 mov al, [thechar]
 cmp al, 45
 jne .getlex87
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex87:
;-456   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex86:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex88
 mov al, [thechar]
 cmp al, 61
 jne .getlex89
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex89:
;-457   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex88:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex90
 mov al, [thechar]
 cmp al, 61
 jne .getlex91
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex91:
;-458   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex90:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex92
 mov al, [thechar]
 cmp al, 61
 jne .getlex93
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex93:
;-459   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex92:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex94
 mov al, [thechar]
 cmp al, 61
 jne .getlex95
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex95:
;-460   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex94:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex96
 mov al, [thechar]
 cmp al, 61
 jne .getlex97
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex97:
;-461   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex98
 mov al, [thechar]
 cmp al, 61
 jne .getlex99
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex99:
;-462   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex98:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex100
 mov al, [bp-2]
 jmp .retngetlex
;-463   if (c == '/') {

.getlex100:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex101
;-464       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex102
;-465           do c=next();

.getlex103:
 call next
 mov [bp-2], al
;-466           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex104
 jmp .getlex103
.getlex104:
 call getlex
 jmp .retngetlex
;-467       }

;-468   }

.getlex102:
;-469   if (c == '/') {

.getlex101:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex105
;-470       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex106
;-471           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-472           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex107
 jmp .g2
;-473           if (thechar != '/') goto g2;

.getlex107:
 mov al, [thechar]
 cmp al, 47
 je  .getlex108
 jmp .g2
;-474           c=next();

.getlex108:
 call next
 mov [bp-2], al
;-475           return getlex();

 call getlex
 jmp .retngetlex
;-476       } else  return '/';

 jmp .getlex109
.getlex106:
 mov ax, 47
 jmp .retngetlex
;-477   }

.getlex109:
;-478   if (c == '"') {

.getlex105:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex110
;-479       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-480       c=next();

 call next
 mov [bp-2], al
;-481       while (c != '"') {

.getlex111:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex112
;-482           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-483           p++;

 inc  word[bp-4]
;-484           c=next();

 call next
 mov [bp-2], al
;-485           }

;-486           *p=0;

 jmp .getlex111
.getlex112:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-487       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-488   }

;-489   if (digit(c)) {

.getlex110:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex113
;-490       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-491       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-492       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex114
 mov ax, 88
 mov byte [thechar], al
;-493       if (thechar=='X') {

.getlex114:
 mov al, [thechar]
 cmp al, 88
 jne .getlex115
;-494           next();

 call next
;-495           while(alnum(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex117
;-496               c=next();

 call next
 mov [bp-2], al
;-497               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex118
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-498       	       if (c>64) c=c-7;

.getlex118:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex119
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-499                c=c-48;

.getlex119:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-500                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-501                i=0;

 mov ax, 0
 mov [bp-86], ax
;-502                i=c;

 mov al, [bp-2]
 mov [bp-86], ax
;-503                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-86]
 mov word [lexval], ax
;-504            }

;-505        }else {

 jmp .getlex116
.getlex117:
 jmp .getlex120
.getlex115:
;-506            while(digit(thechar)) {

.getlex121:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex122
;-507                c=next();

 call next
 mov [bp-2], al
;-508                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-509                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-510                i=0;

 mov ax, 0
 mov [bp-86], ax
;-511                i=c;

 mov al, [bp-2]
 mov [bp-86], ax
;-512                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-86]
 mov word [lexval], ax
;-513            }

;-514        }

 jmp .getlex121
.getlex122:
;-515       return T_CONST;

.getlex120:
 mov ax, 257
 jmp .retngetlex
;-516   }

;-517   if (c==39) {

.getlex113:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex123
;-518       lexval=next();

 call next
 mov word [lexval], ax
;-519       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex124
;-520           lexval=next();

 call next
 mov word [lexval], ax
;-521           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex125
 mov ax, 10
 mov word [lexval], ax
;-522           if (lexval=='t') lexval= 9;

.getlex125:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex126
 mov ax, 9
 mov word [lexval], ax
;-523           if (lexval=='0') lexval= 0;

.getlex126:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex127
 mov ax, 0
 mov word [lexval], ax
;-524       }

.getlex127:
;-525       next();

.getlex124:
 call next
;-526       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-527   }

;-528   if (alnum(c)) {

.getlex123:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex128
;-529     strcpy(symboltemp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-530     strcpy(symboltmp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [bp-84]
 push ax
 call strcpy
 add  sp, 4
;-531     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-532     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-533     p++;

 inc  word[bp-4]
;-534     while(alnum(thechar)) {

.getlex129:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex130
;-535         c=next();

 call next
 mov [bp-2], al
;-536         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-537         p++;

 inc  word[bp-4]
;-538     }

;-539     *p=0;

 jmp .getlex129
.getlex130:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-540     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 531
 jmp .retngetlex
;-541     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

.getlex131:
 push getlex_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 532
 jmp .retngetlex
;-542     if (eqstr(Symbol,"void"    )) return T_VOID;

.getlex132:
 push getlex_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 529
 jmp .retngetlex
;-543     if (eqstr(Symbol,"int"     )) return T_INT;

.getlex133:
 push getlex_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 517
 jmp .retngetlex
;-544     if (eqstr(Symbol,"long"    )) return T_LONG;

.getlex134:
 push getlex_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 533
 jmp .retngetlex
;-545     if (eqstr(Symbol,"inth"    )) return T_INTH;

.getlex135:
 push getlex_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 600
 jmp .retngetlex
;-546     if (eqstr(Symbol,"char"    )) return T_CHAR;

.getlex136:
 push getlex_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 530
 jmp .retngetlex
;-547     if (eqstr(Symbol,"asm"     )) return T_ASM;

.getlex137:
 push getlex_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 518
 jmp .retngetlex
;-548     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

.getlex138:
 push getlex_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 519
 jmp .retngetlex
;-549     if (eqstr(Symbol,"push"    )) return T_ASMDIRECT;

.getlex139:
 push getlex_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 525
 jmp .retngetlex
;-550     if (eqstr(Symbol,"pop"     )) return T_ASMDIRECT;

.getlex140:
 push getlex_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 525
 jmp .retngetlex
;-551     if (eqstr(Symbol,"iret"    )) return T_ASMDIRECT;

.getlex141:
 push getlex_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 525
 jmp .retngetlex
;-552     if (eqstr(Symbol,"ret"     )) return T_ASMDIRECT;

.getlex142:
 push getlex_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 525
 jmp .retngetlex
;-553     if (eqstr(Symbol,"cli"     )) return T_ASMDIRECT;

.getlex143:
 push getlex_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
 mov ax, 525
 jmp .retngetlex
;-554     if (eqstr(Symbol,"sti"     )) return T_ASMDIRECT;

.getlex144:
 push getlex_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
 mov ax, 525
 jmp .retngetlex
;-555     if (eqstr(Symbol,"__emit__")) return T_EMIT;

.getlex145:
 push getlex_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex146
 mov ax, 520
 jmp .retngetlex
;-556     if (eqstr(Symbol,"return"  )) return T_RETURN;

.getlex146:
 push getlex_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex147
 mov ax, 512
 jmp .retngetlex
;-557     if (eqstr(Symbol,"if"      )) return T_IF;

.getlex147:
 push getlex_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex148
 mov ax, 513
 jmp .retngetlex
;-558     if (eqstr(Symbol,"else"    )) return T_ELSE;

.getlex148:
 push getlex_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex149
 mov ax, 514
 jmp .retngetlex
;-559     if (eqstr(Symbol,"while"   )) return T_WHILE;

.getlex149:
 push getlex_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex150
 mov ax, 515
 jmp .retngetlex
;-560     if (eqstr(Symbol,"do"      )) return T_DO;

.getlex150:
 push getlex_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex151
 mov ax, 516
 jmp .retngetlex
;-561     if (eqstr(Symbol,"goto"    )) return T_GOTO;

.getlex151:
 push getlex_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex152
 mov ax, 521
 jmp .retngetlex
;-562     if (eqstr(Symbol,"define"  )) return T_DEFINE;

.getlex152:
 push getlex_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex153
 mov ax, 511
 jmp .retngetlex
;-563 

;-564     i=0;//convert define to value

.getlex153:
 mov ax, 0
 mov [bp-86], ax
;-565     while (i < GTop) {

.getlex154:
 mov ax, [bp-86]
 cmp ax, [GTop]
 jge .getlex155
;-566         j=getVarName(i);

 push word [bp-86]
 call getVarName
 add  sp, 2
 mov [bp-88], ax
;-567         if (eqstr(Symbol,j)) {

 push word [bp-88]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex156
;-568             if (GType[i]=='#') {

 mov bx, [bp-86]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex157
;-569                 lexval=GData[i];

 mov bx, [bp-86]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-570 //                strcpy(Symbol, symboltemp);

;-571                 strcpy(Symbol, symboltmp);

 lea  ax, [bp-84]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-572                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-573             }

;-574         }

.getlex157:
;-575         i++;

.getlex156:
 inc  word[bp-86]
;-576     }

;-577     return T_NAME; } 

 jmp .getlex154
.getlex155:
 mov ax, 256
 jmp .retngetlex
;-578     error1("Input item not recognized");

.getlex128:
 push getlex_24
 call error1
 add  sp, 2
;-579 }

;-580 

;-581 int istoken(int t) {

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
getlex_10 db "push",0
getlex_11 db "pop",0
getlex_12 db "iret",0
getlex_13 db "ret",0
getlex_14 db "cli",0
getlex_15 db "sti",0
getlex_16 db "__emit__",0
getlex_17 db "return",0
getlex_18 db "if",0
getlex_19 db "else",0
getlex_20 db "while",0
getlex_21 db "do",0
getlex_22 db "goto",0
getlex_23 db "define",0
getlex_24 db "Input item not recognized",0
ENDP

istoken: PROC
;-582     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;97 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken158
;-583         token=getlex();

 call getlex
 mov word [token], ax
;-584         return 1;

 mov ax, 1
 jmp .retnistoken
;-585     }

;-586     return 0;

.istoken158:
 mov ax, 0
 jmp .retnistoken
;-587 }

;-588 

;-589 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-590     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;97 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect159
;-591         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-592         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-593         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-594         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-595         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-596     }

;-597 }

.expect159:
;-598 

;-599 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-600     if (i < GTop) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;97 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v160
 push 91
 call prc
 add  sp, 2
;-601     printName(i);

.v160:
 push word [bp+4]
 call printName
 add  sp, 2
;-602     if (i < GTop) prc(']');

 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v161
 push 93
 call prc
 add  sp, 2
;-603 }

.v161:
;-604 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-605     int i;

;-606     i=strlen(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;97 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-607     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen162
 push checknamelen_0
 call error1
 add  sp, 2
;-608 }

.checknamelen162:
;-609 

;-610 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-611     unsigned int i; unsigned int j;

;-612     i=GTop;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;97 var unsg word i = bp-2
;98 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, [GTop]
 mov [bp-2], ax
;-613     while(i<LTop) {//todo look for local var first

.checkName163:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName164
;-614         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-615         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName165
 mov ax, [bp-2]
 jmp .retncheckName
;-616         i++;

.checkName165:
 inc  word[bp-2]
;-617     }

;-618     i=1;

 jmp .checkName163
.checkName164:
 mov ax, 1
 mov [bp-2], ax
;-619     while(i<GTop) {

.checkName166:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName167
;-620         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-621         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName168
 mov ax, [bp-2]
 jmp .retncheckName
;-622         i++;

.checkName168:
 inc  word[bp-2]
;-623     }

;-624     return 0;

 jmp .checkName166
.checkName167:
 mov ax, 0
 jmp .retncheckName
;-625 }

;-626 

;-627 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-628     unsigned int i;

;-629     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;97 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-630     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname169
 push searchname_0
 call error1
 add  sp, 2
;-631     return i;

.searchname169:
 mov ax, [bp-2]
 jmp .retnsearchname
;-632 }

;-633 

;-634 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-635     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1170
 push name1_0
 call error1
 add  sp, 2
;-636     token=getlex();

.name1170:
 call getlex
 mov word [token], ax
;-637 }

;-638 

;-639 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-640     int m; //0=V,1=*,2=&

;-641     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;97 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-642     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName171
 mov ax, 83
 mov byte [issign], al
;-643     if(istoken(T_UNSIGNED)) issign='U';

.typeName171:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName172
 mov ax, 85
 mov byte [issign], al
;-644     iswidth=2;

.typeName172:
 mov ax, 2
 mov byte [iswidth], al
;-645     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName173
 mov ax, 0
 mov byte [iswidth], al
;-646     if(istoken(T_CHAR))     iswidth=1;

.typeName173:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName174
 mov ax, 1
 mov byte [iswidth], al
;-647     if(istoken(T_INT))      iswidth=2;

.typeName174:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName175
 mov ax, 2
 mov byte [iswidth], al
;-648     if(istoken(T_LONG))     iswidth=4;

.typeName175:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName176
 mov ax, 4
 mov byte [iswidth], al
;-649     istype='V';

.typeName176:
 mov ax, 86
 mov byte [istype], al
;-650     m=0;

 mov ax, 0
 mov [bp-2], ax
;-651     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName177
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-652     if(istoken('&'))  {istype='&'; m=2;}

.typeName177:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName178
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-653     name1();

.typeName178:
 call name1
;-654     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-655 }

;-656 

;-657 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-658     char c;

;-659     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;97 var sign word i = bp+4
;98 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-660     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes179
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes180
.gettypes179:
 mov ax, 0
 mov word [signi], ax
;-661     c=GWidth[i];

.gettypes180:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-662     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-663     wi=0;

 mov ax, 0
 mov word [wi], ax
;-664     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes181
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-665     if (c==2) {widthi=2;wi=2;}

.gettypes181:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes182
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-666     if (c==4) {widthi=4;wi=4;}

.gettypes182:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes183
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-667     c=GType [i];

.gettypes183:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-668     typei=0;

 mov ax, 0
 mov word [typei], ax
;-669     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes184
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-670     if (c=='&')  typei=2;

.gettypes184:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes185
 mov ax, 2
 mov word [typei], ax
;-671     return i;

.gettypes185:
 mov ax, [bp+4]
 jmp .retngettypes
;-672 }

;-673 

;-674 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-675     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal186
 push addlocal_0
 call error1
 add  sp, 2
;-676     if (checkName() != 0) error1("Variable already defined");

.addlocal186:
 call checkName
 cmp ax, 0
 je  .addlocal187
 push addlocal_1
 call error1
 add  sp, 2
;-677     GSign[LTop]=issign;

.addlocal187:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-678     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-679     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-680     pt=getVarName(LTop);

 push word [LTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-681     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-682     storeVarName();

 call storeVarName
;-683 }

;-684 

;-685 

;-686 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-687        if(iscmp==T_EQ) printstring("\n jne .");         //ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;97 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg188
 push cmpneg_0
 call printstring
 add  sp, 2
;-688   else if(iscmp==T_NE) printstring("\n je  .");         //ZF=1

 jmp .cmpneg189
.cmpneg188:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg190
 push cmpneg_1
 call printstring
 add  sp, 2
;-689   else if(iscmp==T_LE) if (ids) printstring("\n jg  .");//ZF=0 SF=O

 jmp .cmpneg191
.cmpneg190:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg192
 mov ax, [bp+4]
 or  al, al
 je .cmpneg193
 push cmpneg_2
 call printstring
 add  sp, 2
;-690                        else     printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg194
.cmpneg193:
 push cmpneg_3
 call printstring
 add  sp, 2
;-691   else if(iscmp==T_GE) if (ids){printstring(" ;unsigned : ");

.cmpneg194:
 jmp .cmpneg195
.cmpneg192:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg196
 mov ax, [bp+4]
 or  al, al
 je .cmpneg197
 push cmpneg_4
 call printstring
 add  sp, 2
;-692                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-693                                 printstring("\n jl  .");}//SF!=O

 push cmpneg_5
 call printstring
 add  sp, 2
;-694                        else    {printstring(" ;unsigned : ");

 jmp .cmpneg198
.cmpneg197:
 push cmpneg_6
 call printstring
 add  sp, 2
;-695                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-696                                 printstring("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call printstring
 add  sp, 2
;-697   else if(iscmp=='<' ) printstring("\n jge .");          //SF=O

.cmpneg198:
 jmp .cmpneg199
.cmpneg196:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg200
 push cmpneg_8
 call printstring
 add  sp, 2
;-698   else if(iscmp=='>' ) printstring("\n jle .");          //ZF=1 | SF!=O

 jmp .cmpneg201
.cmpneg200:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg202
 push cmpneg_9
 call printstring
 add  sp, 2
;-699   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg203
.cmpneg202:
 push cmpneg_10
 call error1
 add  sp, 2
;-700 }

.cmpneg203:
.cmpneg201:
.cmpneg199:
.cmpneg195:
.cmpneg191:
.cmpneg189:
;-701 

;-702 int isrelational() {

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
;-703     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational204
 jmp .w
;-704     if (token==T_NE) goto w;

.isrelational204:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational205
 jmp .w
;-705     if (token==T_LE) goto w;

.isrelational205:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational206
 jmp .w
;-706     if (token==T_GE) goto w;

.isrelational206:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational207
 jmp .w
;-707     if (token=='<' ) goto w;

.isrelational207:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational208
 jmp .w
;-708     if (token=='>' ) goto w;

.isrelational208:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational209
 jmp .w
;-709     return 0;

.isrelational209:
 mov ax, 0
 jmp .retnisrelational
;-710 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-711     token=getlex();

 call getlex
 mov word [token], ax
;-712     return 1;

 mov ax, 1
 jmp .retnisrelational
;-713 }

;-714 

;-715 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-716   if (strlen(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg210
 mov ax, 0
 jmp .retncheckreg
;-717   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

.checkreg210:
 push checkreg_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 1
 jmp .retncheckreg
.checkreg211:
 push checkreg_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 3
 jmp .retncheckreg
;-718   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

.checkreg212:
 push checkreg_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 5
 jmp .retncheckreg
.checkreg213:
 push checkreg_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 7
 jmp .retncheckreg
;-719   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

.checkreg214:
 push checkreg_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 9
 jmp .retncheckreg
.checkreg215:
 push checkreg_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 11
 jmp .retncheckreg
;-720   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

.checkreg216:
 push checkreg_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 13
 jmp .retncheckreg
.checkreg217:
 push checkreg_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 15
 jmp .retncheckreg
;-721   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

.checkreg218:
 push checkreg_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 17
 jmp .retncheckreg
.checkreg219:
 push checkreg_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 19
 jmp .retncheckreg
;-722   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

.checkreg220:
 push checkreg_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 21
 jmp .retncheckreg
.checkreg221:
 push checkreg_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 23
 jmp .retncheckreg
;-723   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

.checkreg222:
 push checkreg_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 25
 jmp .retncheckreg
.checkreg223:
 push checkreg_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 27
 jmp .retncheckreg
;-724   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

.checkreg224:
 push checkreg_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 29
 jmp .retncheckreg
.checkreg225:
 push checkreg_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 31
 jmp .retncheckreg
;-725   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

.checkreg226:
 push checkreg_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 33
 jmp .retncheckreg
.checkreg227:
 push checkreg_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 35
 jmp .retncheckreg
;-726   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

.checkreg228:
 push checkreg_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 37
 jmp .retncheckreg
.checkreg229:
 push checkreg_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 39
 jmp .retncheckreg
;-727   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

.checkreg230:
 push checkreg_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 41
 jmp .retncheckreg
.checkreg231:
 push checkreg_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 43
 jmp .retncheckreg
;-728   // (eqstr(Symbol,"ip")) return 45;

;-729   if (strlen(Symbol) >   3) return 0;

.checkreg232:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg233
 mov ax, 0
 jmp .retncheckreg
;-730   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

.checkreg233:
 push checkreg_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 47
 jmp .retncheckreg
.checkreg234:
 push checkreg_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg235
 mov ax, 50
 jmp .retncheckreg
;-731   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

.checkreg235:
 push checkreg_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg236
 mov ax, 53
 jmp .retncheckreg
.checkreg236:
 push checkreg_25
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg237
 mov ax, 56
 jmp .retncheckreg
;-732   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

.checkreg237:
 push checkreg_26
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg238
 mov ax, 59
 jmp .retncheckreg
.checkreg238:
 push checkreg_27
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg239
 mov ax, 62
 jmp .retncheckreg
;-733   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

.checkreg239:
 push checkreg_28
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg240
 mov ax, 65
 jmp .retncheckreg
.checkreg240:
 push checkreg_29
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg241
 mov ax, 68
 jmp .retncheckreg
;-734 //  if (eqstr(Symbol,"cr0")) return 71;

;-735   return 0;

.checkreg241:
 mov ax, 0
 jmp .retncheckreg
;-736 }

;-737 

;-738 char printregstr[]

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
;-739 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-740 

;-741 int printreg(int i) {


printreg: PROC
;-742     unsigned int k; unsigned char c;

;-743     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;98 var sign word i = bp+4
;99 var unsg word k = bp-2
;100 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-744     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-745     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-746     i++;

 inc  word[bp+4]
;-747     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-748     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-749     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-750     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg242
;-751         i++;

 inc  word[bp+4]
;-752         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-753         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-754         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-755         }

;-756 }

.printreg242:
;-757 

;-758 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 32537
ops resb 5
section .text
;-759 int doreg1(int iscmp1) {


doreg1: PROC
;-760     int i;

;-761     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;99 var sign word iscmp1 = bp+4
;100 var sign word i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1243
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-762     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1243:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1244
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-763     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1244:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1245
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-764     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1245:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1246
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-765     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1246:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1247
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-766     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1247:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1248
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-767     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1248:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1249
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-768     if (iscmp1 == 1) {

.doreg1249:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1250
;-769             token=getlex();

 call getlex
 mov word [token], ax
;-770             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1251
 push doreg1_7
 call error1
 add  sp, 2
;-771             strcpy(ops, "cmp");

.doreg1251:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-772         }

;-773     printstring("\n ");

.doreg1250:
 push doreg1_9
 call printstring
 add  sp, 2
;-774     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-775     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-776     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-777     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-778 

;-779     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1252
;-780         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-781         goto reg1;

 jmp .reg1
;-782         }

;-783     mod2=typeName();

.doreg1252:
 call typeName
 mov word [mod2], ax
;-784     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-785     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1253
;-786         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-787         goto reg1;

 jmp .reg1
;-788         }

;-789     i=searchname();

.doreg1253:
 call searchname
 mov [bp-2], ax
;-790     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1254
 push word [bp-2]
 call printName
 add  sp, 2
;-791         else v(i);

 jmp .doreg1255
.doreg1254:
 push word [bp-2]
 call v
 add  sp, 2
;-792 reg1: if (iscmp1 == 1) {

.doreg1255:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1256
;-793     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-794     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-795     expect(')');

 push 41
 call expect
 add  sp, 2
;-796     }

;-797 }

.doreg1256:
;-798 

;-799 int compoundass(char *op, int mode, int id1) {

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
;-800     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;99 ptr sign byte op = bp+4
;100 var sign word mode = bp+6
;101 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass257
 push compoundass_0
 call error1
 add  sp, 2
;-801     printstring("\n ");

.compoundass257:
 push compoundass_1
 call printstring
 add  sp, 2
;-802     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-803     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-804     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-805     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass258
 push compoundass_3
 call printstring
 add  sp, 2
;-806         else printstring("byte");

 jmp .compoundass259
.compoundass258:
 push compoundass_4
 call printstring
 add  sp, 2
;-807     v(id1);

.compoundass259:
 push word [bp+8]
 call v
 add  sp, 2
;-808     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-809     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-810     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-811 }

;-812 

;-813 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-814     gettypes(id1);

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
;-815     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1260
;-816         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-817         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-818         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-819         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1261
 push dovar1_2
 call printstring
 add  sp, 2
;-820         if(widthi == 2) printstring(" ax, [bx]");

.dovar1261:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1262
 push dovar1_3
 call printstring
 add  sp, 2
;-821         return;

.dovar1262:
 jmp .retndovar1
;-822         }

;-823     if (mode==2){// & = adr

.dovar1260:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1263
;-824         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-825         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-826         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-827         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-828         return;

 jmp .retndovar1
;-829         }

;-830     if (ixarr) {//array

.dovar1263:
 mov ax, [bp+8]
 or  al, al
 je .dovar1264
;-831         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-832         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-833         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1265
 push dovar1_7
 call printstring
 add  sp, 2
;-834         printstring("\n ");

.dovar1265:
 push dovar1_8
 call printstring
 add  sp, 2
;-835         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-836         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1266
 push dovar1_9
 call printstring
 add  sp, 2
;-837             else printstring(" al, ");

 jmp .dovar1267
.dovar1266:
 push dovar1_10
 call printstring
 add  sp, 2
;-838         prc('[');

.dovar1267:
 push 91
 call prc
 add  sp, 2
;-839         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-840         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-841         return;

 jmp .retndovar1
;-842         }

;-843     printstring("\n ");

.dovar1264:
 push dovar1_12
 call printstring
 add  sp, 2
;-844     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-845     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1268
 push dovar1_13
 call printstring
 add  sp, 2
;-846     if(wi==2) printstring(" ax, ");

.dovar1268:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1269
 push dovar1_14
 call printstring
 add  sp, 2
;-847     if(wi==4) printstring(" eax, ");

.dovar1269:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1270
 push dovar1_15
 call printstring
 add  sp, 2
;-848     v(id1);

.dovar1270:
 push word [bp+10]
 call v
 add  sp, 2
;-849 }

;-850 

;-851 int rterm(char *op) {

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
;-852     int mode; int opint; int ixarr; int id1;

;-853     if (istoken(T_CONST)) {

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
 je .rterm271
;-854         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-855         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-856         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm272
 push rterm_1
 call printstring
 add  sp, 2
;-857         if (wi==2) printstring(" ax, ");

.rterm272:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm273
 push rterm_2
 call printstring
 add  sp, 2
;-858         if (wi==4) printstring(" eax, ");

.rterm273:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm274
 push rterm_3
 call printstring
 add  sp, 2
;-859         printunsigned(lexval);

.rterm274:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-860         return;

 jmp .retnrterm
;-861         }

;-862     mode=typeName();

.rterm271:
 call typeName
 mov [bp-2], ax
;-863     id1=searchname();

 call searchname
 mov [bp-8], ax
;-864     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-865     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm275
;-866         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-867         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-868         expect(']');

 push 93
 call expect
 add  sp, 2
;-869         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-870         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm276
 push rterm_4
 call error1
 add  sp, 2
;-871         }

.rterm276:
;-872     if (eqstr(Symbol,"ax")) return;

.rterm275:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm277
 jmp .retnrterm
;-873     opint=op;

.rterm277:
 mov ax, [bp+4]
 mov [bp-4], ax
;-874     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-875 }

;-876 

;-877 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-878     gettypes(i);

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
;-879     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign278
;-880         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-881         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-882         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign279
 push doassign_1
 call printstring
 add  sp, 2
;-883             else  printstring("\n mov  [bx], al");

 jmp .doassign280
.doassign279:
 push doassign_2
 call printstring
 add  sp, 2
;-884         return;

.doassign280:
 jmp .retndoassign
;-885         }

;-886     if (mode==2) {// & = adr

.doassign278:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign281
;-887         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-888         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-889         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-890         return;

 jmp .retndoassign
;-891         }

;-892     if (ixarr) {

.doassign281:
 mov ax, [bp+8]
 or  al, al
 je .doassign282
;-893         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-894         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign283
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-895             else v(ixarr);

 jmp .doassign284
.doassign283:
 push word [bp+8]
 call v
 add  sp, 2
;-896         if (wi==2) printstring("\n shl bx, 1");

.doassign284:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign285
 push doassign_6
 call printstring
 add  sp, 2
;-897         printstring("\n mov [");

.doassign285:
 push doassign_7
 call printstring
 add  sp, 2
;-898         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-899         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign286
 push doassign_8
 call printstring
 add  sp, 2
;-900             else printstring("+bx], al");

 jmp .doassign287
.doassign286:
 push doassign_9
 call printstring
 add  sp, 2
;-901         return;

.doassign287:
 jmp .retndoassign
;-902         }

;-903     if (wi==1){

.doassign282:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign288
;-904         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-905         if(i<GTop) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign289
 push doassign_11
 call printstring
 add  sp, 2
;-906         v(i);

.doassign289:
 push word [bp+6]
 call v
 add  sp, 2
;-907         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-908         return;

 jmp .retndoassign
;-909         }

;-910     if (wi==2){

.doassign288:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign290
;-911         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-912         if(i<GTop) printstring("word ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign291
 push doassign_14
 call printstring
 add  sp, 2
;-913         v(i);

.doassign291:
 push word [bp+6]
 call v
 add  sp, 2
;-914         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-915         return;

 jmp .retndoassign
;-916         }

;-917     if (wi==4){

.doassign290:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign292
;-918         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-919         if(i<GTop) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign293
 push doassign_17
 call printstring
 add  sp, 2
;-920         v(i);

.doassign293:
 push word [bp+6]
 call v
 add  sp, 2
;-921         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-922         return;

 jmp .retndoassign
;-923         }

;-924 }

.doassign292:
;-925 

;-926 int domul(int ids) {

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
;-927     if (ids) rterm("imul");

;Function : domul, Number local Var: 1
; # type sign width local variables
;99 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul294
 push domul_0
 call rterm
 add  sp, 2
;-928         else {

 jmp .domul295
.domul294:
;-929         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul296
;-930             printstring("\n mov bx, ");

 push domul_1
 call printstring
 add  sp, 2
;-931             printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-932             printstring("\n mul bx");

 push domul_2
 call printstring
 add  sp, 2
;-933             }

;-934 

;-935 

;-936 

;-937 

;-938 

;-939 

;-940         else error1("with MUL only const number as multiplier allowed");

 jmp .domul297
.domul296:
 push domul_3
 call error1
 add  sp, 2
;-941         }

.domul297:
;-942 }

.domul295:
;-943 

;-944 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplier allowed",0
ENDP

doidiv: PROC
;-945     int mode; int id1;

;-946     if (istoken(T_CONST)) {

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
 je .doidiv298
;-947         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-948         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-949         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv299
 push doidiv_1
 call printstring
 add  sp, 2
;-950             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv300
.doidiv299:
 push doidiv_2
 call printstring
 add  sp, 2
;-951         }

.doidiv300:
;-952     else {

 jmp .doidiv301
.doidiv298:
;-953         mode=typeName();

 call typeName
 mov [bp-2], ax
;-954         id1=searchname();

 call searchname
 mov [bp-4], ax
;-955         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv302
 push doidiv_3
 call error1
 add  sp, 2
;-956         gettypes(id1);

.doidiv302:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-957         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv303
 push doidiv_4
 call error1
 add  sp, 2
;-958         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv303:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv304
 push doidiv_5
 call error1
 add  sp, 2
;-959         printstring("\n mov bx, ");

.doidiv304:
 push doidiv_6
 call printstring
 add  sp, 2
;-960         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-961         if (ids) printstring("\n cwd\n idiv bx");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv305
 push doidiv_7
 call printstring
 add  sp, 2
;-962             else printstring("\n xor dx, dx\n div bx");

 jmp .doidiv306
.doidiv305:
 push doidiv_8
 call printstring
 add  sp, 2
;-963     }

.doidiv306:
;-964 }

.doidiv301:
;-965 

;-966 int domod(int ids) {

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
doidiv_8 db "\n xor dx, dx\n div bx",0
ENDP

domod: PROC
;-967     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;99 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-968     printstring("\n mov ax, dx");

 push domod_0
 call printstring
 add  sp, 2
;-969 }

;-970 

;-971 

;-972 int docalltype[10]; int docallvalue[10];

 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 32542
docalltype resw 10
section .text
section .bss
absolute 32562
docallvalue resw 10
section .text
;-973 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name

section .bss
absolute 32582
procname resb 17
section .text
;-974 

;-975 int docall() {


docall: PROC
;-976     int i; int narg; int t0; int n0;  int sz32;

;-977     narg=0;

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
;-978     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-979     checknamelen();

 call checknamelen
;-980     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-981     expect('(');

 push 40
 call expect
 add  sp, 2
;-982 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall307
;-983 	    do {

.docall308:
;-984 	        narg++;

 inc  word[bp-4]
;-985 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall309
 push docall_0
 call error1
 add  sp, 2
;-986 	        t0=0;

.docall309:
 mov ax, 0
 mov [bp-6], ax
;-987             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall310
;-988                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-989                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-990                 }

;-991             if(istoken(T_STRING)){

.docall310:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall311
;-992                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-993                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-994                 eprs("\n");

 push docall_1
 call eprs
 add  sp, 2
;-995                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-996                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-997                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-998                 eprs(" db ");

 push docall_2
 call eprs
 add  sp, 2
;-999                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-1000                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-1001                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-1002                 eprs(",0");

 push docall_3
 call eprs
 add  sp, 2
;-1003                 nconst++;

 inc  word[nconst]
;-1004                 }

;-1005             if(istoken('&'))     {

.docall311:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall312
;-1006                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-1007                 name1();

 call name1
;-1008                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-1009                 }

;-1010             if(istoken(T_NAME))  {

.docall312:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall313
;-1011 

;-1012 

;-1013 

;-1014                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-1015                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-1016                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-1017                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-1018                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall314
 mov ax, 3
 mov [bp-6], ax
;-1019 

;-1020                 }

.docall314:
;-1021             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall313:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall315
 push docall_4
 call error1
 add  sp, 2
;-1022             docalltype [narg] = t0;

.docall315:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-1023             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-1024         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall316
 jmp .docall308
.docall316:
;-1025 

;-1026   	expect(')');

 push 41
 call expect
 add  sp, 2
;-1027   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-1028     do {

.docall317:
;-1029         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-1030         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-1031         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall318
;-1032             printstring("\n push ");

 push docall_5
 call printstring
 add  sp, 2
;-1033             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1034             }

;-1035         if(t0==2){

.docall318:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall319
;-1036             printstring("\n push ");

 push docall_6
 call printstring
 add  sp, 2
;-1037             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1038             prc(95);

 push 95
 call prc
 add  sp, 2
;-1039             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1040             }

;-1041         if(t0==3){

.docall319:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall320
;-1042             printstring("\n lea  ax, ");

 push docall_7
 call printstring
 add  sp, 2
;-1043             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1044             printstring("\n push ax");

 push docall_8
 call printstring
 add  sp, 2
;-1045             }

;-1046         if(t0==4){

.docall320:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall321
;-1047             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1048             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall322
;-1049                 printstring("\n push word ");

 push docall_9
 call printstring
 add  sp, 2
;-1050                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1051                 }

;-1052             else {

 jmp .docall323
.docall322:
;-1053                 printstring("\n mov al, byte ");

 push docall_10
 call printstring
 add  sp, 2
;-1054                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1055                 printstring("\n mov ah, 0\n push ax");

 push docall_11
 call printstring
 add  sp, 2
;-1056                 }

;-1057             }

.docall323:
;-1058         if(t0==5){

.docall321:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall324
;-1059             printstring("\n push ");

 push docall_12
 call printstring
 add  sp, 2
;-1060             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1061             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall325
 mov ax, [bp-10]
 add ax, 2
;-1062             }

.docall325:
;-1063         i--;

.docall324:
 dec  word[bp-2]
;-1064         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall326
 jmp .docall317
.docall326:
;-1065     }

;-1066 	printstring("\n call ");

.docall307:
 push docall_13
 call printstring
 add  sp, 2
;-1067 	printstring(&procname);

 lea  ax, [procname]
 push ax
 call printstring
 add  sp, 2
;-1068 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall327
;-1069 	    printstring("\n add  sp, ");

 push docall_14
 call printstring
 add  sp, 2
;-1070         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1071         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1072         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1073         }

;-1074 }

.docall327:
;-1075 

;-1076 

;-1077 int expr() {

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
;-1078     int mode;   int id1;

;-1079     int ixarr;  int ixconst;

;-1080     int ids;    int isCONST;

;-1081     int i;      unsigned char *p;

;-1082 

;-1083 	if (istoken('(')) {//cast to int or long, clear destination

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
 push 40
 call istoken
 add  sp, 2
 or  al, al
 je .expr328
;-1084 		     if(istoken(T_INT)) printstring("\n xor ax, ax");

 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .expr329
 push expr_0
 call printstring
 add  sp, 2
;-1085 		else if(istoken(T_LONG)) printstring("\n xor eax, eax");

 jmp .expr330
.expr329:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .expr331
 push expr_1
 call printstring
 add  sp, 2
;-1086 		else error1("only int or long allowed");

 jmp .expr332
.expr331:
 push expr_2
 call error1
 add  sp, 2
;-1087 		expect(')');

.expr332:
.expr330:
 push 41
 call expect
 add  sp, 2
;-1088 		}

;-1089     if (istoken(T_CONST)) {// constant ;

.expr328:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr333
;-1090         printstring("\n mov ax, ");

 push expr_3
 call printstring
 add  sp, 2
;-1091         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1092         return 4;

 mov ax, 4
 jmp .retnexpr
;-1093         }

;-1094     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr333:
 call typeName
 mov [bp-2], ax
;-1095     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1096     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr334
;-1097         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1098         return;

 jmp .retnexpr
;-1099         }

;-1100 

;-1101     if (token=='(')  {

.expr334:
 mov ax, [token]
 cmp ax, 40
 jne .expr335
;-1102         docall();

 call docall
;-1103         goto e1;

 jmp .e1
;-1104         }

;-1105 

;-1106     id1=searchname();

.expr335:
 call searchname
 mov [bp-4], ax
;-1107     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1108     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1109     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1110     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1111     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr336
;-1112         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
;-1113             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1114             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1115             expect(']');

 push 93
 call expect
 add  sp, 2
;-1116             }

;-1117         else {

 jmp .expr338
.expr337:
;-1118             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1119             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1120             expect(']');

 push 93
 call expect
 add  sp, 2
;-1121             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1122             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr339
 push expr_4
 call error1
 add  sp, 2
;-1123             }

.expr339:
;-1124         }

.expr338:
;-1125     if (istoken(T_PLUSPLUS  )) {

.expr336:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
;-1126         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr341
 push expr_5
 call error1
 add  sp, 2
;-1127         printstring("\n inc  ");

.expr341:
 push expr_6
 call printstring
 add  sp, 2
;-1128         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr342
 push expr_7
 call printstring
 add  sp, 2
 jmp .expr343
.expr342:
 push expr_8
 call printstring
 add  sp, 2
;-1129         v(id1);

.expr343:
 push word [bp-4]
 call v
 add  sp, 2
;-1130         goto e1;

 jmp .e1
;-1131         }

;-1132     if (istoken(T_MINUSMINUS)) {

.expr340:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr344
;-1133         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr345
 push expr_9
 call error1
 add  sp, 2
;-1134         printstring("\n dec  ");

.expr345:
 push expr_10
 call printstring
 add  sp, 2
;-1135         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr346
 push expr_11
 call printstring
 add  sp, 2
 jmp .expr347
.expr346:
 push expr_12
 call printstring
 add  sp, 2
;-1136         v(id1);

.expr347:
 push word [bp-4]
 call v
 add  sp, 2
;-1137         goto e1;

 jmp .e1
;-1138         }

;-1139 

;-1140     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr344:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr348
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1141     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr348:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr349
 push word [bp-4]
 push word [bp-2]
 push expr_14
 call compoundass
 add  sp, 6
 jmp .e1
;-1142     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr349:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr350
 push word [bp-4]
 push word [bp-2]
 push expr_15
 call compoundass
 add  sp, 6
 jmp .e1
;-1143     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr350:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr351
 push word [bp-4]
 push word [bp-2]
 push expr_16
 call compoundass
 add  sp, 6
 jmp .e1
;-1144     if (istoken(T_MULASS  )) error1("not implemented");

.expr351:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr352
 push expr_17
 call error1
 add  sp, 2
;-1145     if (istoken(T_DIVASS  )) error1("not implemented");

.expr352:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr353
 push expr_18
 call error1
 add  sp, 2
;-1146 

;-1147     if (istoken('=')) {

.expr353:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr354
;-1148         expr();

 call expr
;-1149         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1150         goto e1;

 jmp .e1
;-1151         }

;-1152     dovar1(mode, "mov", ixarr, id1);

.expr354:
 push word [bp-4]
 push word [bp-6]
 push expr_19
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1153 

;-1154 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
 push expr_20
 call rterm
 add  sp, 2
;-1155     else if (istoken('-')) rterm("sub");

 jmp .expr356
.expr355:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
 push expr_21
 call rterm
 add  sp, 2
;-1156     else if (istoken('&')) rterm("and");

 jmp .expr358
.expr357:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr359
 push expr_22
 call rterm
 add  sp, 2
;-1157     else if (istoken('|')) rterm("or" );

 jmp .expr360
.expr359:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr361
 push expr_23
 call rterm
 add  sp, 2
;-1158     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr362
.expr361:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr363
 push expr_24
 call rterm
 add  sp, 2
;-1159     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr364
.expr363:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr365
 push expr_25
 call rterm
 add  sp, 2
;-1160     else if (istoken('*')) domul (ids);

 jmp .expr366
.expr365:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr367
 push word [bp-10]
 call domul
 add  sp, 2
;-1161     else if (istoken('/')) doidiv(ids);

 jmp .expr368
.expr367:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr369
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1162     else if (istoken('%')) domod (ids);

 jmp .expr370
.expr369:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr371
 push word [bp-10]
 call domod
 add  sp, 2
;-1163     if (isrelational()) {

.expr371:
.expr370:
.expr368:
.expr366:
.expr364:
.expr362:
.expr360:
.expr358:
.expr356:
 call isrelational
 or  al, al
 je .expr372
;-1164         rterm("cmp");

 push expr_26
 call rterm
 add  sp, 2
;-1165         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1166         }

;-1167     return 0;

.expr372:
 mov ax, 0
 jmp .retnexpr
;-1168 }

;-1169 

;-1170 int pexpr() {//called from if, do, while

 .retnexpr:
 LEAVE
 ret
expr_0 db "\n xor ax, ax",0
expr_1 db "\n xor eax, eax",0
expr_2 db "only int or long allowed",0
expr_3 db "\n mov ax, ",0
expr_4 db "Array index must be number or int",0
expr_5 db "Only var allowed",0
expr_6 db "\n inc  ",0
expr_7 db "word",0
expr_8 db "byte",0
expr_9 db "Only var allowed",0
expr_10 db "\n dec  ",0
expr_11 db "word",0
expr_12 db "byte",0
expr_13 db "add",0
expr_14 db "sub",0
expr_15 db "and",0
expr_16 db "or",0
expr_17 db "not implemented",0
expr_18 db "not implemented",0
expr_19 db "mov",0
expr_20 db "add",0
expr_21 db "sub",0
expr_22 db "and",0
expr_23 db "or",0
expr_24 db "shl",0
expr_25 db "shr",0
expr_26 db "cmp",0
ENDP

pexpr: PROC
;-1171     expect('(');

 push 40
 call expect
 add  sp, 2
;-1172     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1173     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr373
;-1174         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1175         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr374
;-1176             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1177             return;

 jmp .retnpexpr
;-1178             }

;-1179         }

.pexpr374:
;-1180 

;-1181     expr();

.pexpr373:
 call expr
;-1182     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr375
 push pexpr_0
 call printstring
 add  sp, 2
;-1183     printstring(fname);

.pexpr375:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1184     expect(')');

 push 41
 call expect
 add  sp, 2
;-1185 }

;-1186 

;-1187 

;-1188 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1189     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;102 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1190     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1191     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1192     prc(':');

 push 58
 call prc
 add  sp, 2
;-1193 }

;-1194 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1195     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;102 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1196     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1197     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1198 }

;-1199 

;-1200 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1201     int c; char cha;

;-1202     int jdest; int tst; int jtemp;

;-1203     if(istoken('{')) {

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
 je .stmt376
;-1204         while(istoken('}')==0) stmt();

.stmt377:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt378
 call stmt
;-1205         }

 jmp .stmt377
.stmt378:
;-1206     else if(istoken(T_IF)) {

 jmp .stmt379
.stmt376:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt380
;-1207         pexpr();

 call pexpr
;-1208         nlabel++;

 inc  word[nlabel]
;-1209         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1210         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1211         stmt();

 call stmt
;-1212         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt381
;-1213             nlabel++;

 inc  word[nlabel]
;-1214             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1215             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1216             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1217             stmt();

 call stmt
;-1218             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1219         }

;-1220         else prlabel(jdest);

 jmp .stmt382
.stmt381:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1221     }

.stmt382:
;-1222     else if(istoken(T_DO)) {

 jmp .stmt383
.stmt380:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt384
;-1223         nlabel++;

 inc  word[nlabel]
;-1224         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1225         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1226         stmt();

 call stmt
;-1227         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1228         pexpr();

 call pexpr
;-1229         nlabel++;

 inc  word[nlabel]
;-1230         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1231         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1232         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1233          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1234     }

;-1235     else if(istoken(T_WHILE)) {

 jmp .stmt385
.stmt384:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt386
;-1236         nlabel++;

 inc  word[nlabel]
;-1237         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1238         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1239         pexpr();

 call pexpr
;-1240         nlabel++;

 inc  word[nlabel]
;-1241         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1242         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1243         stmt();

 call stmt
;-1244         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1245         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1246     }

;-1247     else if(istoken(T_GOTO))  {

 jmp .stmt387
.stmt386:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt388
;-1248         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1249         name1();

 call name1
;-1250         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1251         expect(';');

 push 59
 call expect
 add  sp, 2
;-1252     }

;-1253     else if(token==T_ASM)     {

 jmp .stmt389
.stmt388:
 mov ax, [token]
 cmp ax, 518
 jne .stmt390
;-1254       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1255       c=next();

 call next
 mov [bp-2], ax
;-1256       while(c != '\n') {

.stmt391:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt392
;-1257         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1258         c=next();

 call next
 mov [bp-2], ax
;-1259         };

 jmp .stmt391
.stmt392:
;-1260         token=getlex();

 call getlex
 mov word [token], ax
;-1261     }

;-1262     else if(token==T_ASMDIRECT)     {

 jmp .stmt393
.stmt390:
 mov ax, [token]
 cmp ax, 525
 jne .stmt394
;-1263       printstring("\n");

 push stmt_2
 call printstring
 add  sp, 2
;-1264       printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1265       c=next();

 call next
 mov [bp-2], ax
;-1266       while(c != '\n') {

.stmt395:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt396
;-1267         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1268         c=next();

 call next
 mov [bp-2], ax
;-1269         };

 jmp .stmt395
.stmt396:
;-1270         token=getlex();

 call getlex
 mov word [token], ax
;-1271     }

;-1272     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt397
.stmt394:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt398
;-1273         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt399
;-1274             printstring("\n"); cha=next();

 push stmt_3
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1275             while(cha!= '}') {

.stmt400:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt401
;-1276                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1277                 cha=next();

 call next
 mov [bp-4], al
;-1278             }

;-1279             token=getlex();

 jmp .stmt400
.stmt401:
 call getlex
 mov word [token], ax
;-1280         } else error1("Curly open expected");

 jmp .stmt402
.stmt399:
 push stmt_4
 call error1
 add  sp, 2
;-1281     }

.stmt402:
;-1282     else if(istoken(T_INTH))  {

 jmp .stmt403
.stmt398:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt404
;-1283         printstring("\n int  ");

 push stmt_5
 call printstring
 add  sp, 2
;-1284         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1285         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1286         expect(';');

 push 59
 call expect
 add  sp, 2
;-1287     }

;-1288     else if(istoken(T_EMIT)) {

 jmp .stmt405
.stmt404:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt406
;-1289       printstring("\n db ");

 push stmt_6
 call printstring
 add  sp, 2
;-1290     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1291       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1292       token=getlex();

 call getlex
 mov word [token], ax
;-1293       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt407
;-1294           prc(',');

 push 44
 call prc
 add  sp, 2
;-1295           goto L1;

 jmp .L1
;-1296       }

;-1297       expect(')');

.stmt407:
 push 41
 call expect
 add  sp, 2
;-1298     }

;-1299     else if(istoken(';'))      { }

 jmp .stmt408
.stmt406:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt409
;-1300     else if(istoken(T_RETURN)) {

 jmp .stmt410
.stmt409:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt411
;-1301         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt412
 call expr
;-1302         printstring("\n jmp .retn");

.stmt412:
 push stmt_7
 call printstring
 add  sp, 2
;-1303         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1304         nreturn++;

 inc  word[nreturn]
;-1305         expect(';');

 push 59
 call expect
 add  sp, 2
;-1306     }

;-1307     else if(thechar==':')      {

 jmp .stmt413
.stmt411:
 mov al, [thechar]
 cmp al, 58
 jne .stmt414
;-1308         printstring("\n."); // Label

 push stmt_8
 call printstring
 add  sp, 2
;-1309         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1310         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1311         expect(':');

 push 58
 call expect
 add  sp, 2
;-1312     }

;-1313     else  {expr(); expect(';'); }//second ; removed

 jmp .stmt415
.stmt414:
 call expr
 push 59
 call expect
 add  sp, 2
;-1314 }

.stmt415:
.stmt413:
.stmt410:
.stmt408:
.stmt405:
.stmt403:
.stmt397:
.stmt393:
.stmt389:
.stmt387:
.stmt385:
.stmt383:
.stmt379:
;-1315 

;-1316 int isvariable() {

 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "\n",0
stmt_4 db "Curly open expected",0
stmt_5 db "\n int  ",0
stmt_6 db "\n db ",0
stmt_7 db "\n jmp .retn",0
stmt_8 db "\n.",0
ENDP

isvariable: PROC
;-1317     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable416
 jmp .v1
;-1318     if(token==T_UNSIGNED) goto v1;

.isvariable416:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable417
 jmp .v1
;-1319     if(token==T_CHAR)     goto v1;

.isvariable417:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable418
 jmp .v1
;-1320     if(token==T_INT)      goto v1;

.isvariable418:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable419
 jmp .v1
;-1321     if(token==T_LONG)     goto v1;

.isvariable419:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable420
 jmp .v1
;-1322     return 0;

.isvariable420:
 mov ax, 0
 jmp .retnisvariable
;-1323 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1324 }

;-1325 

;-1326 //***************************************************************

;-1327 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1328     unsigned int j;

;-1329     char c;

;-1330     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;102 var unsg word i = bp+4
;103 var unsg word j = bp-2
;104 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1331     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1332     prc(32);

 push 32
 call prc
 add  sp, 2
;-1333     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1334     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar421
 push listvar_1
 call printstring
 add  sp, 2
;-1335     if(c=='*')printstring("ptr ");

.listvar421:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar422
 push listvar_2
 call printstring
 add  sp, 2
;-1336     if(c=='&')printstring("arr ");

.listvar422:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar423
 push listvar_3
 call printstring
 add  sp, 2
;-1337     if(c=='#')printstring("def ");

.listvar423:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar424
 push listvar_4
 call printstring
 add  sp, 2
;-1338     c=GSign [i];

.listvar424:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1339     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar425
 push listvar_5
 call printstring
 add  sp, 2
;-1340     if(c=='U')printstring("unsg ");

.listvar425:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar426
 push listvar_6
 call printstring
 add  sp, 2
;-1341     c=GWidth[i];

.listvar426:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1342     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar427
 push listvar_7
 call printstring
 add  sp, 2
;-1343     if(c== 1)printstring("byte " );

.listvar427:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar428
 push listvar_8
 call printstring
 add  sp, 2
;-1344     if(c== 2)printstring("word " );

.listvar428:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar429
 push listvar_9
 call printstring
 add  sp, 2
;-1345     if(c== 4)printstring("long " );

.listvar429:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar430
 push listvar_10
 call printstring
 add  sp, 2
;-1346     pt=getVarName(i);

.listvar430:
 push word [bp+4]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1347 //    j=i*32;

;-1348 //    pt=&GNameField + j;

;-1349     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1350     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar431
;-1351         prc('=');

 push 61
 call prc
 add  sp, 2
;-1352         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1353         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1354     }

;-1355     if(GType[i]=='&') {

.listvar431:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar432
;-1356         prc('[');

 push 91
 call prc
 add  sp, 2
;-1357         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1358         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1359         prc(']');

 push 93
 call prc
 add  sp, 2
;-1360     }

;-1361     if (i >= GTop) {

.listvar432:
 mov ax, [bp+4]
 cmp ax, [GTop] ;unsigned : 0
 jb  .listvar433
;-1362         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1363         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1364         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar434
 push 43
 call prc
 add  sp, 2
;-1365         printinteger(j);

.listvar434:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1366     }

;-1367 }

.listvar433:
;-1368 

;-1369 int listproc() {

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
;-1370     int i;

;-1371     if (LTop > GTop) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;102 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .listproc435
;-1372         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1373         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1374         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1375         i=LTop - GTop;

 mov ax, [LTop]
 sub ax, [GTop]
 mov [bp-2], ax
;-1376         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1377         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1378         i=GTop;

 mov ax, [GTop]
 mov [bp-2], ax
;-1379         while (i < LTop) {

.listproc436:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc437
;-1380             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1381             i++;

 inc  word[bp-2]
;-1382         }

;-1383     }

 jmp .listproc436
.listproc437:
;-1384 }

.listproc435:
;-1385 

;-1386 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1387     int FunctionIndex; char *p;

;-1388     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;102 var sign word FunctionIndex = bp-2
;103 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1389     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1390     while (FunctionIndex <= FunctionMaxIx ) {

.searchFunction438:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction439
;-1391         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction440
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1392         p = strlen(p) + p;

.searchFunction440:
 push word [bp-4]
 call strlen
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1393         p++;

 inc  word[bp-4]
;-1394         FunctionIndex++;

 inc  word[bp-2]
;-1395     }

;-1396     return 0;               //no function found

 jmp .searchFunction438
.searchFunction439:
 mov ax, 0
 jmp .retnsearchFunction
;-1397 }

;-1398 

;-1399 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1400     unsigned int i;

;-1401     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;102 var unsg word i = bp-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1402     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300 ;unsigned : 1
 jl  .storeFunction441
 push storeFunction_0
 call error1
 add  sp, 2
;-1403     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction441:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1404     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1405     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1406     i += IDLENMAX;

 add  word[bp-2], 31
;-1407     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000 ;unsigned : 0
 jb  .storeFunction442
 push storeFunction_1
 call error1
 add  sp, 2
;-1408 

;-1409 }

.storeFunction442:
;-1410 

;-1411 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1412     int nloc; unsigned int j;int narg;

;-1413     int VarNamePtrLocalStart;

;-1414     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;102 var sign word nloc = bp-2
;103 var unsg word j = bp-4
;104 var sign word narg = bp-6
;105 var sign word VarNamePtrLocalStart = bp-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1415     checknamelen();

 call checknamelen
;-1416     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1417     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc443
 push dofunc_0
 call error1
 add  sp, 2
;-1418     storeFunction();

.dofunc443:
 call storeFunction
;-1419 

;-1420     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1421     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1422     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1423     expect('(');

 push 40
 call expect
 add  sp, 2
;-1424 //    LStart=GTop;

;-1425     LTop=GTop;

 mov ax, [GTop]
 mov word [LTop], ax
;-1426     VarNamePtrLocalStart=VarNamePtr;

 mov ax, [VarNamePtr]
 mov [bp-8], ax
;-1427 

;-1428     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc444
;-1429         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1430         do {

.dofunc445:
;-1431             typeName();

 call typeName
;-1432             addlocal();

 call addlocal
;-1433             narg+=2;

 add  word[bp-6], 2
;-1434             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1435             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc446
 add  word[bp-6], 2
;-1436             LTop++;

.dofunc446:
 inc  word[LTop]
;-1437             }

;-1438         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc447
 jmp .dofunc445
.dofunc447:
;-1439         expect(')');

 push 41
 call expect
 add  sp, 2
;-1440         }

;-1441 

;-1442     expect('{'); /*body*/

.dofunc444:
 push 123
 call expect
 add  sp, 2
;-1443     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1444     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1445     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1446     while(isvariable()) {

.dofunc448:
 call isvariable
 or  al, al
 je .dofunc449
;-1447         do {

.dofunc450:
;-1448             typeName();

 call typeName
;-1449             checknamelen();

 call checknamelen
;-1450             addlocal();

 call addlocal
;-1451             nloc-=2;

 sub  word[bp-2], 2
;-1452             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc451
 sub  word[bp-2], 2
;-1453             GData[LTop]=nloc;

.dofunc451:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1454             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc452
;-1455                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1456                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1457                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1458                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1459                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1460                 nloc+=2;

 add  word[bp-2], 2
;-1461                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1462             }

;-1463             LTop++;

.dofunc452:
 inc  word[LTop]
;-1464         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc453
 jmp .dofunc450
.dofunc453:
;-1465         expect(';');

 push 59
 call expect
 add  sp, 2
;-1466     }

;-1467     listproc();

 jmp .dofunc448
.dofunc449:
 call listproc
;-1468     if (LTop>GTop){

 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc454
;-1469         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1470         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1471         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1472         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1473         }

;-1474 

;-1475     while(istoken('}')==0)  stmt();

.dofunc454:
.dofunc455:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc456
 call stmt
;-1476 

;-1477     if (nreturn) {

 jmp .dofunc455
.dofunc456:
 mov ax, [nreturn]
 or  al, al
 je .dofunc457
;-1478             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1479             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1480             prc(':');

 push 58
 call prc
 add  sp, 2
;-1481         }

;-1482     if (LTop > GTop) printstring("\n LEAVE");

.dofunc457:
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc458
 push dofunc_6
 call printstring
 add  sp, 2
;-1483     printstring("\n ret");

.dofunc458:
 push dofunc_7
 call printstring
 add  sp, 2
;-1484     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1485     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1486     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1487     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc459
 mov ax, [maxco1]
 mov word [maxco], ax
;-1488     printstring("\nENDP");

.dofunc459:
 push dofunc_8
 call printstring
 add  sp, 2
;-1489     VarNamePtr=VarNamePtrLocalStart;//delete local names

 mov ax, [bp-8]
 mov word [VarNamePtr], ax
;-1490 }

;-1491 

;-1492 char doglobName[IDLENMAX];

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
absolute 32599
doglobName resb 31
section .text
;-1493 int doglob() {


doglob: PROC
;-1494     int i; int j; int isstrarr;

;-1495     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;103 var sign word i = bp-2
;104 var sign word j = bp-4
;105 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1496     if (GTop >= VARMAX) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .doglob460
 push doglob_0
 call error1
 add  sp, 2
;-1497     if (iswidth == 0) error1("no VOID as var type");

.doglob460:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob461
 push doglob_1
 call error1
 add  sp, 2
;-1498     checknamelen();

.doglob461:
 call checknamelen
;-1499     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob462
 push doglob_2
 call error1
 add  sp, 2
;-1500     if (istoken('[')) {

.doglob462:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob463
;-1501         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1502         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob464
;-1503             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1504             printunsigned(orgDatai);

 push word [orgDatai]
 call printunsigned
 add  sp, 2
;-1505             printstring("\n"); printstring(Symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1506             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob465
 push doglob_5
 call printstring
 add  sp, 2
;-1507             if (iswidth==2) printstring(" resw ");

.doglob465:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob466
 push doglob_6
 call printstring
 add  sp, 2
;-1508             if (iswidth==4) printstring(" resd ");

.doglob466:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob467
 push doglob_7
 call printstring
 add  sp, 2
;-1509             printunsigned(lexval);

.doglob467:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1510             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1511             orgDatai=orgDatai+lexval;

 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1512             if (iswidth==2) orgDatai=orgDatai+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob468
 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1513             if (iswidth==4) {i= lexval * 3; orgDatai=orgDatai + i;}

.doglob468:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob469
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgDatai]
 add ax, [bp-2]
 mov word [orgDatai], ax
;-1514             GData[GTop]=lexval;

.doglob469:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1515             expect(']');

 push 93
 call expect
 add  sp, 2
;-1516         }else {

 jmp .doglob470
.doglob464:
;-1517             expect(']');

 push 93
 call expect
 add  sp, 2
;-1518             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob471
 push doglob_9
 call error1
 add  sp, 2
;-1519             printstring("\n");

.doglob471:
 push doglob_10
 call printstring
 add  sp, 2
;-1520             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1521             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1522             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1523             strcpy(doglobName, Symbol);//save Symbol name

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1524             expect('=');

 push 61
 call expect
 add  sp, 2
;-1525             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob472
;-1526                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1527                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1528                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1529                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1530                 i=strlen(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1531                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1532                 }

;-1533             else if (istoken('{' )) {

 jmp .doglob473
.doglob472:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob474
;-1534                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1535                 do {

.doglob475:
;-1536                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob476
 push 44
 call prc
 add  sp, 2
;-1537                     expect(T_CONST);

.doglob476:
 push 257
 call expect
 add  sp, 2
;-1538                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1539                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1540                     }

;-1541                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob477
 jmp .doglob475
.doglob477:
;-1542                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1543             }

;-1544         else error1("String or number array expected");

 jmp .doglob478
.doglob474:
 push doglob_13
 call error1
 add  sp, 2
;-1545         };

.doglob478:
.doglob473:
.doglob470:
;-1546     }else { //expect('=');

 jmp .doglob479
.doglob463:
;-1547         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1548         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1549         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob480
 push doglob_15
 call printstring
 add  sp, 2
;-1550         else {

 jmp .doglob481
.doglob480:
;-1551             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob482
 push doglob_16
 call printstring
 add  sp, 2
;-1552             else if (iswidth==2) printstring(" dw ");

 jmp .doglob483
.doglob482:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob484
 push doglob_17
 call printstring
 add  sp, 2
;-1553             else                 printstring(" dd ");

 jmp .doglob485
.doglob484:
 push doglob_18
 call printstring
 add  sp, 2
;-1554         }

.doglob485:
.doglob483:
;-1555     if(istoken('-')) prc('-');

.doglob481:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob486
 push 45
 call prc
 add  sp, 2
;-1556     if (istoken('=')) {

.doglob486:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob487
;-1557         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1558         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1559         }else printunsigned(0);

 jmp .doglob488
.doglob487:
 push 0
 call printunsigned
 add  sp, 2
;-1560     }

.doglob488:
;-1561     GSign[GTop]=issign;

.doglob479:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1562     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1563     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1564     pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1565     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob489
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1566         else strcpy(pt, Symbol);

 jmp .doglob490
.doglob489:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1567 	if (isstrarr) strcpy(Symbol, doglobName);

.doglob490:
 mov ax, [bp-6]
 or  al, al
 je .doglob491
 lea  ax, [doglobName]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-1568 	storeVarName();

.doglob491:
 call storeVarName
;-1569     GTop++;

 inc  word[GTop]
;-1570     expect(';');

 push 59
 call expect
 add  sp, 2
;-1571 }

;-1572 

;-1573 int dodefine() {

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
;-1574     expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1575     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine492
;-1576         if (GTop >= VARMAX) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .dodefine493
 push dodefine_0
 call error1
 add  sp, 2
;-1577         checknamelen();

.dodefine493:
 call checknamelen
;-1578         if (checkName() != 0) error1("#Define var already defined");

 call checkName
 cmp ax, 0
 je  .dodefine494
 push dodefine_1
 call error1
 add  sp, 2
;-1579         if (eqstr(Symbol, "ORGDATA")) {

.dodefine494:
 push dodefine_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine495
;-1580             orgDataOriginal=lexval;

 mov ax, [lexval]
 mov word [orgDataOriginal], ax
;-1581             orgDatai=lexval;

 mov ax, [lexval]
 mov word [orgDatai], ax
;-1582             expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1583             return;

 jmp .retndodefine
;-1584         }

;-1585         GSign [GTop]='U';

.dodefine495:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1586         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1587         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1588         pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1589         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1590         storeVarName();

 call storeVarName
;-1591         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1592         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1593         GTop++;

 inc  word[GTop]
;-1594     }

;-1595 }

.dodefine492:
;-1596 

;-1597 int parse() {

 .retndodefine:
 ret
dodefine_0 db "global table (define) full",0
dodefine_1 db "#Define var already defined",0
dodefine_2 db "ORGDATA",0
ENDP

parse: PROC
;-1598     token=getlex();

 call getlex
 mov word [token], ax
;-1599     do {

.parse496:
;-1600         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse497
 mov ax, 1
 jmp .retnparse
;-1601         if (istoken('#')) {

.parse497:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse498
;-1602              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse499
 call dodefine
;-1603              else error1("define expected");

 jmp .parse500
.parse499:
 push parse_0
 call error1
 add  sp, 2
;-1604         }

.parse500:
;-1605     else{

 jmp .parse501
.parse498:
;-1606         typeName();

 call typeName
;-1607         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse502
 call dofunc
;-1608         else doglob(); }

 jmp .parse503
.parse502:
 call doglob
.parse503:
;-1609     } while(1);

.parse501:
 mov ax, 1
 or  al, al
 je .parse504
 jmp .parse496
.parse504:
;-1610 }

;-1611 

;-1612 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1613 int getarguments() {


getarguments: PROC
;-1614     int arglen1; unsigned int i; char *c;

;-1615     isPrint=1;

;Function : getarguments, Number local Var: 3
; # type sign width local variables
;105 var sign word arglen1 = bp-2
;106 var unsg word i = bp-4
;107 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1616     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1617     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarguments505
;-1618         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1619         cputs(" Usage: A.COM in_file[.C]: ");

 push getarguments_0
 call cputs
 add  sp, 2
;-1620         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1621         }

;-1622     i=arglen1+129;

.getarguments505:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1623     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1624     arglen1--;

 dec  word[bp-2]
;-1625     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1626     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1627     if (instr1(namein, '.') == 0) strcat(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarguments506
 push getarguments_1
 lea  ax, [namein]
 push ax
 call strcat
 add  sp, 4
;-1628     strcpy(namelst, namein);

.getarguments506:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1629     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1630     i--;

 dec  word[bp-4]
;-1631     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1632     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1633 }

;-1634 int openfiles() {

 LEAVE
 ret
getarguments_0 db " Usage: A.COM in_file[.C]: ",0
getarguments_1 db ".C",0
ENDP

openfiles: PROC
;-1635     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1636     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles507
;-1637         cputs("Source file missing (.C): ");

 push openfiles_0
 call cputs
 add  sp, 2
;-1638         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1639         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1640         }

;-1641     fdout=creatR(namelst);

.openfiles507:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1642     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles508
;-1643         cputs("list file not creatable: ");

 push openfiles_1
 call cputs
 add  sp, 2
;-1644         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1645         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1646         }

;-1647     printstring(";");

.openfiles508:
 push openfiles_2
 call printstring
 add  sp, 2
;-1648     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1649     printstring(", Input: "); printstring(namein);

 push openfiles_3
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1650     printstring(", Output: "); printstring(namelst);

 push openfiles_4
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1651 }

;-1652 

;-1653 int epilog() {

 ret
openfiles_0 db "Source file missing (.C): ",0
openfiles_1 db "list file not creatable: ",0
openfiles_2 db ";",0
openfiles_3 db ", Input: ",0
openfiles_4 db ", Output: ",0
ENDP

epilog: PROC
;-1654     unsigned int i;

;-1655     isPrint=1;

;Function : epilog, Number local Var: 1
; # type sign width local variables
;105 var unsg word i = bp-2;
 ENTER  2,0
 mov ax, 1
 mov byte [isPrint], al
;-1656     GTop--;

 dec  word[GTop]
;-1657     printstring("\n;Glob. variables:"); printunsigned(GTop);

 push epilog_0
 call printstring
 add  sp, 2
 push word [GTop]
 call printunsigned
 add  sp, 2
;-1658     printstring(" (");                  printunsigned(VARMAX);

 push epilog_1
 call printstring
 add  sp, 2
 push 400
 call printunsigned
 add  sp, 2
;-1659     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-1660     printstring("):");                  printunsigned(i);

 push epilog_2
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1661     printstring(" (");					printunsigned(VARNAMESMAX);

 push epilog_3
 call printstring
 add  sp, 2
 push 4000
 call printunsigned
 add  sp, 2
;-1662     printstring("), Functions:");       printunsigned(FunctionMaxIx);

 push epilog_4
 call printstring
 add  sp, 2
 push word [FunctionMaxIx]
 call printunsigned
 add  sp, 2
;-1663     printstring(" (");                  printunsigned(FUNCMAX);

 push epilog_5
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1664     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1665     printstring("):");                  printunsigned(i);

 push epilog_6
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1666     printstring(" (");					printunsigned(FUNCTIONNAMESMAX);

 push epilog_7
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1667     printstring(")\n;Lines:");          printunsigned(lineno);

 push epilog_8
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1668     printstring(", Constant: ");        printunsigned(maxco);

 push epilog_9
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1669     printstring(" (");                  printunsigned(COMAX);

 push epilog_10
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1670     i = COMAX;

 mov ax, 3000
 mov [bp-2], ax
;-1671     i = i - maxco;

 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax
;-1672     if (i<=1000)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog509
 push epilog_11
 call printstring
 add  sp, 2
;-1673     printstring("), stacksize: ");

.epilog509:
 push epilog_12
 call printstring
 add  sp, 2
;-1674     i=65535;

 mov ax, 65535
 mov [bp-2], ax
;-1675     i=i-orgDatai;

 mov ax, [bp-2]
 sub ax, [orgDatai]
 mov [bp-2], ax
;-1676     printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1677     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog510
 push epilog_13
 call printstring
 add  sp, 2
;-1678 

;-1679 }

.epilog510:
;-1680 

;-1681 int main() {

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
;-1682     getarguments();

 call getarguments
;-1683     openfiles();

 call openfiles
;-1684     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1685     printstring("\norg  256 \njmp main");

 push main_0
 call printstring
 add  sp, 2
;-1686 

;-1687 	GTop = 1;

 mov ax, 1
 mov word [GTop], ax
;-1688     VarNamePtr= &VarNames;

 mov ax, VarNames
 mov word [VarNamePtr], ax
;-1689     FunctionNamePtr= &FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1690     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1691     orgDatai=orgDataOriginal;

 mov ax, [orgDataOriginal]
 mov word [orgDatai], ax
;-1692     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1693     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1694     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1695 

;-1696     parse();

 call parse
;-1697 

;-1698     epilog();

 call epilog
;-1699     end1(0);

 push 0
 call end1
 add  sp, 2
;-1700 }

 ret
main_0 db "\norg  256 \njmp main",0
ENDP
;Glob. variables:104 (400):838 (4000), Functions:79 (300):634 (3000)
;Lines:1701, Constant: 688 (3000), stacksize: 32905