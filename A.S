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
;-72 int  GData [VARMAX];

section .bss
absolute 29529
GData resw 400
section .text
;-73 char GNameField[GNAMEMAX];

section .bss
absolute 30329
GNameField resb 12800
section .text
;-74 #define VARNAMESMAX 3969//VARMAX * 10 - IDLENMAX

;-75 char VarNames[4000];    //Space for global and local var names

section .bss
absolute 43129
VarNames resb 4000
section .text
;-76 char *VarNamePtr;       //first free position

VarNamePtr dw 0
;-77 int GTop=1;

GTop dw 1
;-78 int LTop=LSTART;

LTop dw 300
;-79 

;-80 #define FUNCMAX       300//max functions

;-81 #define FNAMEMAX     9600// 32*FUNCMAX

;-82 char FNameField[FNAMEMAX];

section .bss
absolute 47129
FNameField resb 9600
section .text
;-83 #define FUNCTIONNAMESMAX 3000//Space for preceeding functon names

;-84 char FunctionNames[FUNCTIONNAMESMAX];

section .bss
absolute 56729
FunctionNames resb 3000
section .text
;-85 char *FunctionNamePtr;  //first free position in FunctionNames

FunctionNamePtr dw 0
;-86 int  FunctionMaxIx=0;   //number of functions

FunctionMaxIx dw 0
;-87 

;-88 char fgetsdest[COLUMNMAX];

section .bss
absolute 59729
fgetsdest resb 128
section .text
;-89 unsigned char *fgetsp=0;

fgetsp dw 0
;-90 unsigned int lineno=1;

lineno dw 1
;-91 unsigned char *pt=0;

pt dw 0
;-92 unsigned char *p1=0;

p1 dw 0
;-93 int DOS_ERR=0;

DOS_ERR dw 0
;-94 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-95 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-96 int ireg1;//todo

ireg1 dw 0
;-97 int mod2;

mod2 dw 0
;-98 int ireg2;

ireg2 dw 0
;-99 

;-100 int writetty()     {//char in AL


writetty: PROC
;-101     ah=0x0E;

 mov  ah, 14
;-102     asm push bx

 push bx
;-103     bx=0;     //page in BH

 mov  bx, 0
;-104     inth 0x10;

 int  16
;-105     asm pop bx

 pop bx
;-106 }

;-107 int putch(char c)  {

 ret
ENDP

putch: PROC
;-108     if (c==10)  {// LF

;Function : putch, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-109         al=13;   // CR, write CR first and then LF

 mov  al, 13
;-110         writetty();

 call writetty
;-111     }

;-112     al=c;

.putch1:
 mov  al, [bp+4]
;-113     writetty();

 call writetty
;-114 }

;-115 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-116     char c;

;-117     while(*s) {

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
;-118         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-119         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-120         s++;

 inc  word[bp+4]
;-121     }

;-122 }

 jmp .cputs2
.cputs3:
;-123 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-124     n; // ax=n;

;Function : mkneg, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
;-125     asm neg ax

 neg ax
;-126 }

;-127 

;-128 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-129     inth 0x21;

 int  33
;-130     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-131     DOS_ERR++;

 inc  word[DOS_ERR]
;-132 }

;-133 int openR (char *s) {

 ret
ENDP

openR: PROC
;-134     asm mov dx, [bp+4]; dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-135     asm mov ax, 15618; ax=0x3D02;

 mov ax, 15618; ax=0x3D02;
;-136     DosInt();

 call DosInt
;-137 }

;-138 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-139     asm mov dx, [bp+4]; dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-140     asm mov cx, 0

 mov cx, 0
;-141     asm mov ax, 15360; ax=0x3C00;

 mov ax, 15360; ax=0x3C00;
;-142     DosInt();

 call DosInt
;-143 }

;-144 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-145     asm mov bx, [bp+4]; bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;300 var sign word fd = bp+4;
 ENTER  0,0
 mov bx, [bp+4]; bx=fd;
;-146     asm mov ax, 15872; ax=0x3E00;

 mov ax, 15872; ax=0x3E00;
;-147     DosInt();

 call DosInt
;-148 }

;-149 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-150     asm mov ah, 76; ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov ah, 76; ah=0x4C;
;-151     asm mov al, [bp+4]; al=c;

 mov al, [bp+4]; al=c;
;-152     DosInt();

 call DosInt
;-153 }

;-154 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-155     asm mov dx, [bp+4]; dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign word fd = bp+6
;302 var sign word len = bp+8;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-156     asm mov cx, [bp+8]; cx=len;

 mov cx, [bp+8]; cx=len;
;-157     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-158     asm mov ax, 16128;  ax=0x3F00;

 mov ax, 16128;  ax=0x3F00;
;-159     DosInt();

 call DosInt
;-160 }

;-161 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-162     asm lea dx, [bp+4]; *n  todo: why not mov ?????

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte n = bp+4
;301 var sign word fd = bp+6;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov ?????
;-163     asm mov cx, 1;      cx=1;

 mov cx, 1;      cx=1;
;-164     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-165     asm mov ax, 16384;  ax=0x4000;

 mov ax, 16384;  ax=0x4000;
;-166     DosInt();

 call DosInt
;-167 }

;-168 

;-169 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-170       if (c=='_') return 1;

;Function : letter, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-171       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-172       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-173       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-174       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-175       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-176       if (c> 'Z') { if (c< 'a') return 0; }

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
;-177       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-178 }

;-179 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-180       if(c<'0') return 0;

;Function : digit, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-181       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-182       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-183 }

;-184 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-185     if (digit (c)) return 1;

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
;-186     if (letter(c)) return 1;

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
;-187     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-188 }

;-189 

;-190 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-191     c=0;

;Function : strlen, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign word c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-192     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-193     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-194 }

;-195 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-196     do { *s=*t; s++; t++; }

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
;-197     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-198     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-199     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-200 }

;-201 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-202     while(*p) {

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
;-203         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-204         p++;

.eqstr22:
 inc  word[bp+4]
;-205         q++;

 inc  word[bp+6]
;-206     }

;-207     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-208     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-209 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-210     while (*s != 0) s++;

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
;-211     strcpy(s, t);

 jmp .strcat124
.strcat125:
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
;300 ptr sign byte s = bp+4;
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
;300 ptr sign byte s = bp+4
;301 var sign byte c = bp+6;
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
;300 var sign byte c = bp+4;
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
;300 ptr sign byte s = bp+4
;301 var sign byte c = bp-2;
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
;300 var unsg byte c = bp+4;
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
;300 ptr unsg byte s = bp+4
;301 var unsg byte c = bp-2;
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
;300 ptr unsg byte s = bp+4
;301 var unsg byte c = bp-2
;302 var sign word com = bp-4;
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

;-281 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-282     int e;

;-283     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;300 var sign word n = bp+4
;301 var sign word e = bp-2;
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
;300 var unsg word n = bp+4
;301 var unsg word e = bp-2;
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
;300 var sign word n = bp+4;
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
;300 ptr sign byte s = bp+4;
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
;300 var sign word col = bp-2;
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
;300 var sign byte c = bp-2;
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
;300 var sign byte r = bp-2;
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

;-386 int adrF(char *s, unsigned int i) {

 .retnnext:
 LEAVE
 ret
ENDP

adrF: PROC
;-387     i << 5;//ax=i*32; IDLENMAX=31!

;Function : adrF, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var unsg word i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 5
;-388     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 
;-389 }

;-390 

;-391 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-392     int j;

;-393     if (i < LSTART) {

;Function : printName, Number local Var: 2
; # type sign width local variables
;300 var unsg word i = bp+4
;301 var sign word j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName59
;-394         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-395         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-396     }

;-397     else {

 jmp .printName60
.printName59:
;-398         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-399         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-400         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2
;-401         printinteger(j);

.printName61:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-402         prc(']');

 push 93
 call prc
 add  sp, 2
;-403     }

;-404 }

.printName60:
;-405 

;-406 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-407     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL
;-408     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63
;-409         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al
;-410         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL
;-411     }

;-412     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL
;-413 }

;-414 

;-415 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 59857
symboltemp resb 80
section .text
;-416 

;-417 int getlex() {


getlex: PROC
;-418     char c; char *p;

;-419     int i; int j;

;-420 g1: c=next();

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
;-421     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex
;-422     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1
;-423   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-424   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-425   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-426   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-427   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-428   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-429   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-430   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-431   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-432   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-433   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-434   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-435   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-436   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-437   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-438   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96
;-439       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97
;-440           do c=next();

.getlex98:
 call next
 mov [bp-2], al
;-441           while(ifEOL(c)==0) return getlex();

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
;-442       }

;-443   }

.getlex97:
;-444   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-445       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101
;-446           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-447           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2
;-448           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2
;-449           c=next();

.getlex103:
 call next
 mov [bp-2], al
;-450           return getlex();

 call getlex
 jmp .retngetlex
;-451       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex
;-452   }

.getlex104:
;-453   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105
;-454       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-455       c=next();

 call next
 mov [bp-2], al
;-456       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107
;-457           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-458           p++;

 inc  word[bp-4]
;-459           c=next();

 call next
 mov [bp-2], al
;-460           }

;-461           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-462       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-463   }

;-464   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108
;-465       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-466       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-467       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al
;-468       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110
;-469           next();

 call next
;-470           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112
;-471               c=next();

 call next
 mov [bp-2], al
;-472               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-473       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-474                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-475                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-476                i=0;

 mov ax, 0
 mov [bp-6], ax
;-477                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-478                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-479            }

;-480        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:
;-481            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-482                c=next();

 call next
 mov [bp-2], al
;-483                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-484                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-485                i=0;

 mov ax, 0
 mov [bp-6], ax
;-486                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-487                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-488            }

;-489        }

 jmp .getlex116
.getlex117:
;-490       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex
;-491   }

;-492   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118
;-493       lexval=next();

 call next
 mov word [lexval], ax
;-494       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119
;-495           lexval=next();

 call next
 mov word [lexval], ax
;-496           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax
;-497           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax
;-498           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax
;-499       }

.getlex122:
;-500       next();

.getlex119:
 call next
;-501       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-502   }

;-503   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-504     strcpy(symboltemp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-505     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-506     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-507     p++;

 inc  word[bp-4]
;-508     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125
;-509         c=next();

 call next
 mov [bp-2], al
;-510         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-511         p++;

 inc  word[bp-4]
;-512     }

;-513     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-514     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex
;-515     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

.getlex126:
 push getlex_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex127
 mov ax, 532
 jmp .retngetlex
;-516     if (eqstr(Symbol,"void"    )) return T_VOID;

.getlex127:
 push getlex_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex128
 mov ax, 529
 jmp .retngetlex
;-517     if (eqstr(Symbol,"int"     )) return T_INT;

.getlex128:
 push getlex_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex129
 mov ax, 517
 jmp .retngetlex
;-518     if (eqstr(Symbol,"long"    )) return T_LONG;

.getlex129:
 push getlex_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 533
 jmp .retngetlex
;-519     if (eqstr(Symbol,"inth"    )) return T_INTH;

.getlex130:
 push getlex_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 600
 jmp .retngetlex
;-520     if (eqstr(Symbol,"char"    )) return T_CHAR;

.getlex131:
 push getlex_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 530
 jmp .retngetlex
;-521     if (eqstr(Symbol,"asm"     )) return T_ASM;

.getlex132:
 push getlex_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 518
 jmp .retngetlex
;-522     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

.getlex133:
 push getlex_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 519
 jmp .retngetlex
;-523     if (eqstr(Symbol,"__emit__")) return T_EMIT;

.getlex134:
 push getlex_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 520
 jmp .retngetlex
;-524     if (eqstr(Symbol,"return"  )) return T_RETURN;

.getlex135:
 push getlex_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 512
 jmp .retngetlex
;-525     if (eqstr(Symbol,"if"      )) return T_IF;

.getlex136:
 push getlex_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 513
 jmp .retngetlex
;-526     if (eqstr(Symbol,"else"    )) return T_ELSE;

.getlex137:
 push getlex_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 514
 jmp .retngetlex
;-527     if (eqstr(Symbol,"while"   )) return T_WHILE;

.getlex138:
 push getlex_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 515
 jmp .retngetlex
;-528     if (eqstr(Symbol,"do"      )) return T_DO;

.getlex139:
 push getlex_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 516
 jmp .retngetlex
;-529     if (eqstr(Symbol,"goto"    )) return T_GOTO;

.getlex140:
 push getlex_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 521
 jmp .retngetlex
;-530     if (eqstr(Symbol,"define"  )) return T_DEFINE;

.getlex141:
 push getlex_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 511
 jmp .retngetlex
;-531 

;-532     i=0;//convert define to value

.getlex142:
 mov ax, 0
 mov [bp-6], ax
;-533     while (i < GTop) {

.getlex143:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex144
;-534         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-535         if (eqstr(Symbol,j)) {

 push word [bp-8]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
;-536             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex146
;-537                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-538                 strcpy(Symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-539                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-540             }

;-541         }

.getlex146:
;-542         i++;

.getlex145:
 inc  word[bp-6]
;-543     }

;-544     return T_NAME; } error1("Input item not recognized");

 jmp .getlex143
.getlex144:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_18
 call error1
 add  sp, 2
;-545 }

;-546 

;-547 int istoken(int t) {

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
;-548     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;300 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken147
;-549         token=getlex();

 call getlex
 mov word [token], ax
;-550         return 1;

 mov ax, 1
 jmp .retnistoken
;-551     }

;-552     return 0;

.istoken147:
 mov ax, 0
 jmp .retnistoken
;-553 }

;-554 

;-555 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-556     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;300 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect148
;-557         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-558         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-559         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-560         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-561         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-562     }

;-563 }

.expect148:
;-564 

;-565 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-566     if (i < LSTART) prc('[');

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
;-567     printName(i);

.v149:
 push word [bp+4]
 call printName
 add  sp, 2
;-568     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v150
 push 93
 call prc
 add  sp, 2
;-569 }

.v150:
;-570 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-571     int i;

;-572     i=strlen(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;300 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-573     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen151
 push checknamelen_0
 call error1
 add  sp, 2
;-574 }

.checknamelen151:
;-575 

;-576 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-577     unsigned int i; unsigned int j;

;-578     i=LSTART;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;300 var unsg word i = bp-2
;301 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, 300
 mov [bp-2], ax
;-579     while(i<LTop) {

.checkName152:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName153
;-580         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-581         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName154
 mov ax, [bp-2]
 jmp .retncheckName
;-582         i++;

.checkName154:
 inc  word[bp-2]
;-583     }

;-584     i=1;

 jmp .checkName152
.checkName153:
 mov ax, 1
 mov [bp-2], ax
;-585     while(i<GTop) {

.checkName155:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName156
;-586         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-587         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName157
 mov ax, [bp-2]
 jmp .retncheckName
;-588         i++;

.checkName157:
 inc  word[bp-2]
;-589     }

;-590     return 0;

 jmp .checkName155
.checkName156:
 mov ax, 0
 jmp .retncheckName
;-591 }

;-592 

;-593 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-594     unsigned int i;

;-595     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-596     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname158
 push searchname_0
 call error1
 add  sp, 2
;-597     return i;

.searchname158:
 mov ax, [bp-2]
 jmp .retnsearchname
;-598 }

;-599 

;-600 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-601     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1159
 push name1_0
 call error1
 add  sp, 2
;-602     token=getlex();

.name1159:
 call getlex
 mov word [token], ax
;-603 }

;-604 

;-605 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-606     int m; //0=V,1=*,2=&

;-607     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;300 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-608     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 83
 mov byte [issign], al
;-609     if(istoken(T_UNSIGNED)) issign='U';

.typeName160:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 85
 mov byte [issign], al
;-610     iswidth=2;

.typeName161:
 mov ax, 2
 mov byte [iswidth], al
;-611     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 0
 mov byte [iswidth], al
;-612     if(istoken(T_CHAR))     iswidth=1;

.typeName162:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 1
 mov byte [iswidth], al
;-613     if(istoken(T_INT))      iswidth=2;

.typeName163:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 2
 mov byte [iswidth], al
;-614     if(istoken(T_LONG))     iswidth=4;

.typeName164:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 4
 mov byte [iswidth], al
;-615     istype='V';

.typeName165:
 mov ax, 86
 mov byte [istype], al
;-616     m=0;

 mov ax, 0
 mov [bp-2], ax
;-617     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-618     if(istoken('&'))  {istype='&'; m=2;}

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
;-619     name1();

.typeName167:
 call name1
;-620     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-621 }

;-622 

;-623 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-624     char c;

;-625     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;300 var sign word i = bp+4
;301 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-626     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes168
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes169
.gettypes168:
 mov ax, 0
 mov word [signi], ax
;-627     c=GWidth[i];

.gettypes169:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-628     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-629     wi=0;

 mov ax, 0
 mov word [wi], ax
;-630     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes170
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-631     if (c==2) {widthi=2;wi=2;}

.gettypes170:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes171
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-632     if (c==4) {widthi=4;wi=4;}

.gettypes171:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes172
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-633     c=GType [i];

.gettypes172:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-634     typei=0;

 mov ax, 0
 mov word [typei], ax
;-635     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes173
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-636     if (c=='&')  typei=2;

.gettypes173:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes174
 mov ax, 2
 mov word [typei], ax
;-637     return i;

.gettypes174:
 mov ax, [bp+4]
 jmp .retngettypes
;-638 }

;-639 

;-640 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-641     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal175
 push addlocal_0
 call error1
 add  sp, 2
;-642     if (checkName() != 0) error1("Variable already defined");

.addlocal175:
 call checkName
 cmp ax, 0
 je  .addlocal176
 push addlocal_1
 call error1
 add  sp, 2
;-643     GSign[LTop]=issign;

.addlocal176:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-644     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-645     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-646     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-647     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-648 }

;-649 

;-650 

;-651 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-652        if(iscmp==T_EQ) printstring("\n jne .");         //ZF=0

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
;-653   else if(iscmp==T_NE) printstring("\n je  .");         //ZF=1

 jmp .cmpneg178
.cmpneg177:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg179
 push cmpneg_1
 call printstring
 add  sp, 2
;-654   else if(iscmp==T_LE) if (ids) printstring("\n jg  .");//ZF=0      SF =OF

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
;-655                            else printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg183
.cmpneg182:
 push cmpneg_3
 call printstring
 add  sp, 2
;-656   else if(iscmp==T_GE) if (ids){printstring(" ;unsigned : "); printunsigned(ids);

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
;-657                                printstring("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call printstring
 add  sp, 2
;-658                            else{printstring(" ;unsigned : "); printunsigned(ids);

 jmp .cmpneg187
.cmpneg186:
 push cmpneg_6
 call printstring
 add  sp, 2
 push word [bp+4]
 call printunsigned
 add  sp, 2
;-659                                printstring("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call printstring
 add  sp, 2
;-660   else if(iscmp=='<' ) printstring("\n jge .");         //          SF =OF

.cmpneg187:
 jmp .cmpneg188
.cmpneg185:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg189
 push cmpneg_8
 call printstring
 add  sp, 2
;-661   else if(iscmp=='>' ) printstring("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg190
.cmpneg189:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg191
 push cmpneg_9
 call printstring
 add  sp, 2
;-662   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg192
.cmpneg191:
 push cmpneg_10
 call error1
 add  sp, 2
;-663 }

.cmpneg192:
.cmpneg190:
.cmpneg188:
.cmpneg184:
.cmpneg180:
.cmpneg178:
;-664 

;-665 int isrelational() {

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
;-666     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational193
 jmp .w
;-667     if (token==T_NE) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational194
 jmp .w
;-668     if (token==T_LE) goto w;

.isrelational194:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational195
 jmp .w
;-669     if (token==T_GE) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational196
 jmp .w
;-670     if (token=='<' ) goto w;

.isrelational196:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational197
 jmp .w
;-671     if (token=='>' ) goto w;

.isrelational197:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational198
 jmp .w
;-672     return 0;

.isrelational198:
 mov ax, 0
 jmp .retnisrelational
;-673 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-674     token=getlex();

 call getlex
 mov word [token], ax
;-675     return 1;

 mov ax, 1
 jmp .retnisrelational
;-676 }

;-677 

;-678 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-679   if (strlen(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg199
 mov ax, 0
 jmp .retncheckreg
;-680   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

.checkreg199:
 push checkreg_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 1
 jmp .retncheckreg
.checkreg200:
 push checkreg_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 3
 jmp .retncheckreg
;-681   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

.checkreg201:
 push checkreg_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 5
 jmp .retncheckreg
.checkreg202:
 push checkreg_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 7
 jmp .retncheckreg
;-682   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

.checkreg203:
 push checkreg_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 9
 jmp .retncheckreg
.checkreg204:
 push checkreg_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 11
 jmp .retncheckreg
;-683   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

.checkreg205:
 push checkreg_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 13
 jmp .retncheckreg
.checkreg206:
 push checkreg_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 15
 jmp .retncheckreg
;-684   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

.checkreg207:
 push checkreg_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 17
 jmp .retncheckreg
.checkreg208:
 push checkreg_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 19
 jmp .retncheckreg
;-685   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

.checkreg209:
 push checkreg_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 21
 jmp .retncheckreg
.checkreg210:
 push checkreg_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 23
 jmp .retncheckreg
;-686   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

.checkreg211:
 push checkreg_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 25
 jmp .retncheckreg
.checkreg212:
 push checkreg_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 27
 jmp .retncheckreg
;-687   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

.checkreg213:
 push checkreg_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 29
 jmp .retncheckreg
.checkreg214:
 push checkreg_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 31
 jmp .retncheckreg
;-688   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

.checkreg215:
 push checkreg_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 33
 jmp .retncheckreg
.checkreg216:
 push checkreg_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 35
 jmp .retncheckreg
;-689   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

.checkreg217:
 push checkreg_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 37
 jmp .retncheckreg
.checkreg218:
 push checkreg_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 39
 jmp .retncheckreg
;-690   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

.checkreg219:
 push checkreg_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 41
 jmp .retncheckreg
.checkreg220:
 push checkreg_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 43
 jmp .retncheckreg
;-691   // (eqstr(Symbol,"ip")) return 45;

;-692   if (strlen(Symbol) >   3) return 0;

.checkreg221:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg222
 mov ax, 0
 jmp .retncheckreg
;-693   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

.checkreg222:
 push checkreg_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 47
 jmp .retncheckreg
.checkreg223:
 push checkreg_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 50
 jmp .retncheckreg
;-694   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

.checkreg224:
 push checkreg_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 53
 jmp .retncheckreg
.checkreg225:
 push checkreg_25
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 56
 jmp .retncheckreg
;-695   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

.checkreg226:
 push checkreg_26
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 59
 jmp .retncheckreg
.checkreg227:
 push checkreg_27
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 62
 jmp .retncheckreg
;-696   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

.checkreg228:
 push checkreg_28
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 65
 jmp .retncheckreg
.checkreg229:
 push checkreg_29
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 68
 jmp .retncheckreg
;-697 //  if (eqstr(Symbol,"cr0")) return 71;

;-698   return 0;

.checkreg230:
 mov ax, 0
 jmp .retncheckreg
;-699 }

;-700 

;-701 char printregstr[]

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
;-702 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-703 

;-704 int printreg(int i) {


printreg: PROC
;-705     unsigned int k; unsigned char c;

;-706     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp+4
;301 var unsg word k = bp-2
;302 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-707     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-708     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-709     i++;

 inc  word[bp+4]
;-710     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-711     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-712     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-713     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg231
;-714         i++;

 inc  word[bp+4]
;-715         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-716         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-717         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-718         }

;-719 }

.printreg231:
;-720 

;-721 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 59937
ops resb 5
section .text
;-722 int doreg1(int iscmp1) {


doreg1: PROC
;-723     int i;

;-724     if (istoken('='))          strcpy(ops, "mov");

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
;-725     if (istoken(T_PLUSASS))    strcpy(ops, "add");

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
;-726     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

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
;-727     if (istoken(T_ANDASS))     strcpy(ops, "and");

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
;-728     if (istoken(T_ORASS))      strcpy(ops, "or" );

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
;-729     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

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
;-730     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

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
;-731     if (iscmp1 == 1) {

.doreg1238:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1239
;-732             token=getlex();

 call getlex
 mov word [token], ax
;-733             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1240
 push doreg1_7
 call error1
 add  sp, 2
;-734             strcpy(ops, "cmp");

.doreg1240:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-735         }

;-736     printstring("\n ");

.doreg1239:
 push doreg1_9
 call printstring
 add  sp, 2
;-737     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-738     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-739     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-740     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-741 

;-742     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1241
;-743         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-744         goto reg1;

 jmp .reg1
;-745         }

;-746     mod2=typeName();

.doreg1241:
 call typeName
 mov word [mod2], ax
;-747     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-748     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1242
;-749         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-750         goto reg1;

 jmp .reg1
;-751         }

;-752     i=searchname();

.doreg1242:
 call searchname
 mov [bp-2], ax
;-753     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1243
 push word [bp-2]
 call printName
 add  sp, 2
;-754         else v(i);

 jmp .doreg1244
.doreg1243:
 push word [bp-2]
 call v
 add  sp, 2
;-755 reg1: if (iscmp1 == 1) {

.doreg1244:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1245
;-756     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-757     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-758     expect(')');

 push 41
 call expect
 add  sp, 2
;-759     }

;-760 }

.doreg1245:
;-761 

;-762 int compoundass(char *op, int mode, int id1) {

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
;-763     if(mode) error1("only scalar variable allowed");

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
;-764     printstring("\n ");

.compoundass246:
 push compoundass_1
 call printstring
 add  sp, 2
;-765     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-766     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-767     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-768     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass247
 push compoundass_3
 call printstring
 add  sp, 2
;-769         else printstring("byte");

 jmp .compoundass248
.compoundass247:
 push compoundass_4
 call printstring
 add  sp, 2
;-770     v(id1);

.compoundass248:
 push word [bp+8]
 call v
 add  sp, 2
;-771     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-772     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-773     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-774 }

;-775 

;-776 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-777     gettypes(id1);

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
;-778     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1249
;-779         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-780         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-781         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-782         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1250
 push dovar1_2
 call printstring
 add  sp, 2
;-783         if(widthi == 2) printstring(" ax, [bx]");

.dovar1250:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1251
 push dovar1_3
 call printstring
 add  sp, 2
;-784         return;

.dovar1251:
 jmp .retndovar1
;-785         }

;-786     if (mode==2){// & = adr

.dovar1249:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1252
;-787         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-788         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-789         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-790         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-791         return;

 jmp .retndovar1
;-792         }

;-793     if (ixarr) {//array

.dovar1252:
 mov ax, [bp+8]
 or  al, al
 je .dovar1253
;-794         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-795         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-796         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_7
 call printstring
 add  sp, 2
;-797         printstring("\n ");

.dovar1254:
 push dovar1_8
 call printstring
 add  sp, 2
;-798         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-799         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_9
 call printstring
 add  sp, 2
;-800             else printstring(" al, ");

 jmp .dovar1256
.dovar1255:
 push dovar1_10
 call printstring
 add  sp, 2
;-801         prc('[');

.dovar1256:
 push 91
 call prc
 add  sp, 2
;-802         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-803         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-804         return;

 jmp .retndovar1
;-805         }

;-806     printstring("\n ");

.dovar1253:
 push dovar1_12
 call printstring
 add  sp, 2
;-807     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-808     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1257
 push dovar1_13
 call printstring
 add  sp, 2
;-809     if(wi==2) printstring(" ax, ");

.dovar1257:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_14
 call printstring
 add  sp, 2
;-810     if(wi==4) printstring(" eax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1259
 push dovar1_15
 call printstring
 add  sp, 2
;-811     v(id1);

.dovar1259:
 push word [bp+10]
 call v
 add  sp, 2
;-812 }

;-813 

;-814 int rterm(char *op) {

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
;-815     int mode; int opint; int ixarr; int id1;

;-816     if (istoken(T_CONST)) {

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
;-817         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-818         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-819         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm261
 push rterm_1
 call printstring
 add  sp, 2
;-820         if (wi==2) printstring(" ax, ");

.rterm261:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm262
 push rterm_2
 call printstring
 add  sp, 2
;-821         if (wi==4) printstring(" eax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm263
 push rterm_3
 call printstring
 add  sp, 2
;-822         printunsigned(lexval);

.rterm263:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-823         return;

 jmp .retnrterm
;-824         }

;-825     mode=typeName();

.rterm260:
 call typeName
 mov [bp-2], ax
;-826     id1=searchname();

 call searchname
 mov [bp-8], ax
;-827     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-828     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm264
;-829         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-830         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-831         expect(']');

 push 93
 call expect
 add  sp, 2
;-832         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-833         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm265
 push rterm_4
 call error1
 add  sp, 2
;-834         }

.rterm265:
;-835     if (eqstr(Symbol,"ax")) return;

.rterm264:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm266
 jmp .retnrterm
;-836     opint=op;

.rterm266:
 mov ax, [bp+4]
 mov [bp-4], ax
;-837     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-838 }

;-839 

;-840 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-841     gettypes(i);

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
;-842     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign267
;-843         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-844         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-845         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign268
 push doassign_1
 call printstring
 add  sp, 2
;-846             else  printstring("\n mov  [bx], al");

 jmp .doassign269
.doassign268:
 push doassign_2
 call printstring
 add  sp, 2
;-847         return;

.doassign269:
 jmp .retndoassign
;-848         }

;-849     if (mode==2) {// & = adr

.doassign267:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign270
;-850         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-851         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-852         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-853         return;

 jmp .retndoassign
;-854         }

;-855     if (ixarr) {

.doassign270:
 mov ax, [bp+8]
 or  al, al
 je .doassign271
;-856         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-857         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign272
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-858             else v(ixarr);

 jmp .doassign273
.doassign272:
 push word [bp+8]
 call v
 add  sp, 2
;-859         if (wi==2) printstring("\n shl bx, 1");

.doassign273:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign274
 push doassign_6
 call printstring
 add  sp, 2
;-860         printstring("\n mov [");

.doassign274:
 push doassign_7
 call printstring
 add  sp, 2
;-861         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-862         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign275
 push doassign_8
 call printstring
 add  sp, 2
;-863             else printstring("+bx], al");

 jmp .doassign276
.doassign275:
 push doassign_9
 call printstring
 add  sp, 2
;-864         return;

.doassign276:
 jmp .retndoassign
;-865         }

;-866     if (wi==1){

.doassign271:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign277
;-867         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-868         if(i<LSTART) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign278
 push doassign_11
 call printstring
 add  sp, 2
;-869         v(i);

.doassign278:
 push word [bp+6]
 call v
 add  sp, 2
;-870         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-871         return;

 jmp .retndoassign
;-872         }

;-873     if (wi==2){

.doassign277:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign279
;-874         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-875         if(i<LSTART) printstring("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign280
 push doassign_14
 call printstring
 add  sp, 2
;-876         v(i);

.doassign280:
 push word [bp+6]
 call v
 add  sp, 2
;-877         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-878         return;

 jmp .retndoassign
;-879         }

;-880     if (wi==4){

.doassign279:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign281
;-881         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-882         if(i<LSTART) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign282
 push doassign_17
 call printstring
 add  sp, 2
;-883         v(i);

.doassign282:
 push word [bp+6]
 call v
 add  sp, 2
;-884         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-885         return;

 jmp .retndoassign
;-886         }

;-887 }

.doassign281:
;-888 

;-889 int domul(int ids) {

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
;-890     if (ids) rterm("imul");

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
;-891         else {

 jmp .domul284
.domul283:
;-892         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul285
;-893             printstring("\n mov bx, ");

 push domul_1
 call printstring
 add  sp, 2
;-894             printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-895             printstring("\n mul bx");

 push domul_2
 call printstring
 add  sp, 2
;-896             }

;-897         else error1("with MUL only const number as multipl. allowed");

 jmp .domul286
.domul285:
 push domul_3
 call error1
 add  sp, 2
;-898         }

.domul286:
;-899 }

.domul284:
;-900 

;-901 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multipl. allowed",0
ENDP

doidiv: PROC
;-902     int mode; int id1;

;-903     if (istoken(T_CONST)) {

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
;-904         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-905         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-906         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv288
 push doidiv_1
 call printstring
 add  sp, 2
;-907             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv289
.doidiv288:
 push doidiv_2
 call printstring
 add  sp, 2
;-908         }

.doidiv289:
;-909     else {

 jmp .doidiv290
.doidiv287:
;-910         mode=typeName();

 call typeName
 mov [bp-2], ax
;-911         id1=searchname();

 call searchname
 mov [bp-4], ax
;-912         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv291
 push doidiv_3
 call error1
 add  sp, 2
;-913         gettypes(id1);

.doidiv291:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-914         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv292
 push doidiv_4
 call error1
 add  sp, 2
;-915         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv292:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv293
 push doidiv_5
 call error1
 add  sp, 2
;-916         printstring("\n mov bx, ");

.doidiv293:
 push doidiv_6
 call printstring
 add  sp, 2
;-917         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-918         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv294
 push doidiv_7
 call printstring
 add  sp, 2
;-919             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv295
.doidiv294:
 push doidiv_8
 call printstring
 add  sp, 2
;-920     }

.doidiv295:
;-921 }

.doidiv290:
;-922 

;-923 int domod(int ids) {

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
;-924     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-925     printstring("\n mov ax, dx");

 push domod_0
 call printstring
 add  sp, 2
;-926 }

;-927 

;-928 

;-929 int docalltype[10]; int docallvalue[10];

 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 59942
docalltype resw 10
section .text
section .bss
absolute 59962
docallvalue resw 10
section .text
;-930 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name

section .bss
absolute 59982
procname resb 17
section .text
;-931 

;-932 int docall1() {


docall1: PROC
;-933     int i; int narg; int t0; int n0;  int sz32;

;-934     narg=0;

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
;-935     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-936     checknamelen();

 call checknamelen
;-937     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-938     expect('(');

 push 40
 call expect
 add  sp, 2
;-939 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1296
;-940 	    do {

.docall1297:
;-941 	        narg++;

 inc  word[bp-4]
;-942 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1298
 push docall1_0
 call error1
 add  sp, 2
;-943 	        t0=0;

.docall1298:
 mov ax, 0
 mov [bp-6], ax
;-944             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1299
;-945                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-946                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-947                 }

;-948             if(istoken(T_STRING)){

.docall1299:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1300
;-949                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-950                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-951                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-952                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-953                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-954                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-955                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-956                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-957                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-958                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-959                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-960                 nconst++;

 inc  word[nconst]
;-961                 }

;-962             if(istoken('&'))     {

.docall1300:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1301
;-963                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-964                 name1();

 call name1
;-965                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-966                 }

;-967             if(istoken(T_NAME))  {

.docall1301:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1302
;-968 

;-969 

;-970 

;-971                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-972                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-973                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-974                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-975                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1303
 mov ax, 3
 mov [bp-6], ax
;-976 

;-977                 }

.docall1303:
;-978             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1302:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1304
 push docall1_4
 call error1
 add  sp, 2
;-979             docalltype [narg] = t0;

.docall1304:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-980             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-981         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1305
 jmp .docall1297
.docall1305:
;-982 

;-983   	expect(')');

 push 41
 call expect
 add  sp, 2
;-984   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-985     do {

.docall1306:
;-986         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-987         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-988         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1307
;-989             printstring("\n push ");

 push docall1_5
 call printstring
 add  sp, 2
;-990             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-991             }

;-992         if(t0==2){

.docall1307:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1308
;-993             printstring("\n push ");

 push docall1_6
 call printstring
 add  sp, 2
;-994             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-995             prc(95);

 push 95
 call prc
 add  sp, 2
;-996             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-997             }

;-998         if(t0==3){

.docall1308:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1309
;-999             printstring("\n lea  ax, ");

 push docall1_7
 call printstring
 add  sp, 2
;-1000             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1001             printstring("\n push ax");

 push docall1_8
 call printstring
 add  sp, 2
;-1002             }

;-1003         if(t0==4){

.docall1309:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1310
;-1004             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1005             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1311
;-1006                 printstring("\n push word ");

 push docall1_9
 call printstring
 add  sp, 2
;-1007                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1008                 }

;-1009             else {

 jmp .docall1312
.docall1311:
;-1010                 printstring("\n mov al, byte ");

 push docall1_10
 call printstring
 add  sp, 2
;-1011                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1012                 printstring("\n mov ah, 0\n push ax");

 push docall1_11
 call printstring
 add  sp, 2
;-1013                 }

;-1014             }

.docall1312:
;-1015         if(t0==5){

.docall1310:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1313
;-1016             printstring("\n push ");

 push docall1_12
 call printstring
 add  sp, 2
;-1017             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1018             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1314
 mov ax, [bp-10]
 add ax, 2
;-1019             }

.docall1314:
;-1020         i--;

.docall1313:
 dec  word[bp-2]
;-1021         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1315
 jmp .docall1306
.docall1315:
;-1022     }

;-1023 	printstring("\n call ");

.docall1296:
 push docall1_13
 call printstring
 add  sp, 2
;-1024 	printstring(&procname);

 lea  ax, [procname]
 push ax
 call printstring
 add  sp, 2
;-1025 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1316
;-1026 	    printstring("\n add  sp, ");

 push docall1_14
 call printstring
 add  sp, 2
;-1027         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1028         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1029         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1030         }

;-1031 }

.docall1316:
;-1032 

;-1033 

;-1034 int expr() {

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
;-1035     int mode;   int id1;

;-1036     int ixarr;  int ixconst;

;-1037     int ids;    int isCONST;

;-1038     int i;      unsigned char *p;

;-1039 

;-1040     if (istoken(T_CONST)) {// constant ;

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
;-1041         printstring("\n mov ax, ");

 push expr_0
 call printstring
 add  sp, 2
;-1042         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1043         return 4;

 mov ax, 4
 jmp .retnexpr
;-1044         }

;-1045     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr317:
 call typeName
 mov [bp-2], ax
;-1046     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1047     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr318
;-1048         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1049         return;

 jmp .retnexpr
;-1050         }

;-1051 

;-1052     if (token=='(')  {

.expr318:
 mov ax, [token]
 cmp ax, 40
 jne .expr319
;-1053         docall1();

 call docall1
;-1054         goto e1;

 jmp .e1
;-1055         }

;-1056 

;-1057     id1=searchname();

.expr319:
 call searchname
 mov [bp-4], ax
;-1058     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1059     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1060     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1061     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1062     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr320
;-1063         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr321
;-1064             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1065             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1066             expect(']');

 push 93
 call expect
 add  sp, 2
;-1067             }

;-1068         else {

 jmp .expr322
.expr321:
;-1069             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1070             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1071             expect(']');

 push 93
 call expect
 add  sp, 2
;-1072             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1073             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr323
 push expr_1
 call error1
 add  sp, 2
;-1074             }

.expr323:
;-1075         }

.expr322:
;-1076     if (istoken(T_PLUSPLUS  )) {

.expr320:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr324
;-1077         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr325
 push expr_2
 call error1
 add  sp, 2
;-1078         printstring("\n inc  ");

.expr325:
 push expr_3
 call printstring
 add  sp, 2
;-1079         if (wi==2) printstring("word"); else printstring("byte");

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
;-1080         v(id1);

.expr327:
 push word [bp-4]
 call v
 add  sp, 2
;-1081         goto e1;

 jmp .e1
;-1082         }

;-1083     if (istoken(T_MINUSMINUS)) {

.expr324:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr328
;-1084         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr329
 push expr_6
 call error1
 add  sp, 2
;-1085         printstring("\n dec  ");

.expr329:
 push expr_7
 call printstring
 add  sp, 2
;-1086         if (wi==2) printstring("word"); else printstring("byte");

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
;-1087         v(id1);

.expr331:
 push word [bp-4]
 call v
 add  sp, 2
;-1088         goto e1;

 jmp .e1
;-1089         }

;-1090 

;-1091     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

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
;-1092     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

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
;-1093     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

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
;-1094     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

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
;-1095     if (istoken(T_MULASS  )) error1("not implemented");

.expr335:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr336
 push expr_14
 call error1
 add  sp, 2
;-1096     if (istoken(T_DIVASS  )) error1("not implemented");

.expr336:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push expr_15
 call error1
 add  sp, 2
;-1097 

;-1098     if (istoken('=')) {

.expr337:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
;-1099         expr();

 call expr
;-1100         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1101         goto e1;

 jmp .e1
;-1102         }

;-1103     dovar1(mode, "mov", ixarr, id1);

.expr338:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1104 

;-1105 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push expr_17
 call rterm
 add  sp, 2
;-1106     else if (istoken('-')) rterm("sub");

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
;-1107     else if (istoken('&')) rterm("and");

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
;-1108     else if (istoken('|')) rterm("or" );

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
;-1109     else if (istoken(T_LESSLESS)) rterm("shl");

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
;-1110     else if (istoken(T_GREATGREAT)) rterm("shr");

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
;-1111     else if (istoken('*')) domul (ids);

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
;-1112     else if (istoken('/')) doidiv(ids);

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
;-1113     else if (istoken('%')) domod (ids);

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
;-1114     if (isrelational()) {

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
;-1115         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1116         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1117         }

;-1118     return 0;

.expr356:
 mov ax, 0
 jmp .retnexpr
;-1119 }

;-1120 

;-1121 int pexpr() {//called from if, do, while

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
;-1122     expect('(');

 push 40
 call expect
 add  sp, 2
;-1123     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1124     if (token==T_NAME) {//todo

 mov ax, [token]
 cmp ax, 256
 jne .pexpr357
;-1125         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1126         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr358
;-1127             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1128             return;

 jmp .retnpexpr
;-1129             }

;-1130         }

.pexpr358:
;-1131 

;-1132     expr();

.pexpr357:
 call expr
;-1133     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr359
 push pexpr_0
 call printstring
 add  sp, 2
;-1134     printstring(fname);

.pexpr359:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1135     expect(')');

 push 41
 call expect
 add  sp, 2
;-1136 }

;-1137 

;-1138 

;-1139 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1140     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1141     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1142     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1143     prc(':');

 push 58
 call prc
 add  sp, 2
;-1144 }

;-1145 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1146     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1147     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1148     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1149 }

;-1150 

;-1151 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1152     int c; char cha;

;-1153     int jdest; int tst; int jtemp;

;-1154     if(istoken('{')) {

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
;-1155         while(istoken('}')==0) stmt();

.stmt361:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt362
 call stmt
;-1156         }

 jmp .stmt361
.stmt362:
;-1157     else if(istoken(T_IF)) {

 jmp .stmt363
.stmt360:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt364
;-1158         pexpr();

 call pexpr
;-1159         nlabel++;

 inc  word[nlabel]
;-1160         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1161         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1162         stmt();

 call stmt
;-1163         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt365
;-1164             nlabel++;

 inc  word[nlabel]
;-1165             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1166             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1167             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1168             stmt();

 call stmt
;-1169             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1170         }

;-1171         else prlabel(jdest);

 jmp .stmt366
.stmt365:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1172     }

.stmt366:
;-1173     else if(istoken(T_DO)) {

 jmp .stmt367
.stmt364:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt368
;-1174         nlabel++;

 inc  word[nlabel]
;-1175         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1176         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1177         stmt();

 call stmt
;-1178         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1179         pexpr();

 call pexpr
;-1180         nlabel++;

 inc  word[nlabel]
;-1181         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1182         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1183         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1184          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1185     }

;-1186     else if(istoken(T_WHILE)) {

 jmp .stmt369
.stmt368:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370
;-1187         nlabel++;

 inc  word[nlabel]
;-1188         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1189         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1190         pexpr();

 call pexpr
;-1191         nlabel++;

 inc  word[nlabel]
;-1192         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1193         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1194         stmt();

 call stmt
;-1195         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1196         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1197     }

;-1198     else if(istoken(T_GOTO))  {

 jmp .stmt371
.stmt370:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372
;-1199         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1200         name1();

 call name1
;-1201         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1202         expect(';');

 push 59
 call expect
 add  sp, 2
;-1203     }

;-1204     else if(token==T_ASM)     {

 jmp .stmt373
.stmt372:
 mov ax, [token]
 cmp ax, 518
 jne .stmt374
;-1205       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1206       c=next();

 call next
 mov [bp-2], ax
;-1207       while(c != '\n') {

.stmt375:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt376
;-1208         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1209         c=next();

 call next
 mov [bp-2], ax
;-1210         };

 jmp .stmt375
.stmt376:
;-1211         token=getlex();

 call getlex
 mov word [token], ax
;-1212     }

;-1213     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt377
.stmt374:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt378
;-1214         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt379
;-1215             printstring("\n"); cha=next();

 push stmt_2
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1216             while(cha!= '}') {

.stmt380:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt381
;-1217                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1218                 cha=next();

 call next
 mov [bp-4], al
;-1219             }

;-1220             token=getlex();

 jmp .stmt380
.stmt381:
 call getlex
 mov word [token], ax
;-1221         } else error1("Curly open expected");

 jmp .stmt382
.stmt379:
 push stmt_3
 call error1
 add  sp, 2
;-1222     }

.stmt382:
;-1223     else if(istoken(T_INTH))  {

 jmp .stmt383
.stmt378:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt384
;-1224         printstring("\n int  ");

 push stmt_4
 call printstring
 add  sp, 2
;-1225         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1226         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1227         expect(';');

 push 59
 call expect
 add  sp, 2
;-1228     }

;-1229     else if(istoken(T_EMIT)) {

 jmp .stmt385
.stmt384:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt386
;-1230       printstring("\n db ");

 push stmt_5
 call printstring
 add  sp, 2
;-1231     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1232       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1233       token=getlex();

 call getlex
 mov word [token], ax
;-1234       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt387
;-1235           prc(',');

 push 44
 call prc
 add  sp, 2
;-1236           goto L1;

 jmp .L1
;-1237       }

;-1238       expect(')');

.stmt387:
 push 41
 call expect
 add  sp, 2
;-1239     }

;-1240     else if(istoken(';'))      { }

 jmp .stmt388
.stmt386:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt389
;-1241     else if(istoken(T_RETURN)) {

 jmp .stmt390
.stmt389:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt391
;-1242         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt392
 call expr
;-1243         printstring("\n jmp .retn");

.stmt392:
 push stmt_6
 call printstring
 add  sp, 2
;-1244         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1245         nreturn++;

 inc  word[nreturn]
;-1246         expect(';');

 push 59
 call expect
 add  sp, 2
;-1247     }

;-1248     else if(thechar==':')      {

 jmp .stmt393
.stmt391:
 mov al, [thechar]
 cmp al, 58
 jne .stmt394
;-1249         printstring("\n."); // Label

 push stmt_7
 call printstring
 add  sp, 2
;-1250         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1251         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1252         expect(':');

 push 58
 call expect
 add  sp, 2
;-1253     }

;-1254     else  {expr();; expect(';'); }

 jmp .stmt395
.stmt394:
 call expr
 push 59
 call expect
 add  sp, 2
;-1255 }

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
;-1256 

;-1257 int isvariable() {

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
;-1258     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable396
 jmp .v1
;-1259     if(token==T_UNSIGNED) goto v1;

.isvariable396:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable397
 jmp .v1
;-1260     if(token==T_CHAR)     goto v1;

.isvariable397:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable398
 jmp .v1
;-1261     if(token==T_INT)      goto v1;

.isvariable398:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable399
 jmp .v1
;-1262     if(token==T_LONG)     goto v1;

.isvariable399:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable400
 jmp .v1
;-1263     return 0;

.isvariable400:
 mov ax, 0
 jmp .retnisvariable
;-1264 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1265 }

;-1266 

;-1267 //***************************************************************

;-1268 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1269     unsigned int j;

;-1270     char c;

;-1271     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;300 var unsg word i = bp+4
;301 var unsg word j = bp-2
;302 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1272     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1273     prc(32);

 push 32
 call prc
 add  sp, 2
;-1274     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1275     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar401
 push listvar_1
 call printstring
 add  sp, 2
;-1276     if(c=='*')printstring("ptr ");

.listvar401:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar402
 push listvar_2
 call printstring
 add  sp, 2
;-1277     if(c=='&')printstring("arr ");

.listvar402:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar403
 push listvar_3
 call printstring
 add  sp, 2
;-1278     if(c=='#')printstring("def ");

.listvar403:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar404
 push listvar_4
 call printstring
 add  sp, 2
;-1279     c=GSign [i];

.listvar404:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1280     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar405
 push listvar_5
 call printstring
 add  sp, 2
;-1281     if(c=='U')printstring("unsg ");

.listvar405:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar406
 push listvar_6
 call printstring
 add  sp, 2
;-1282     c=GWidth[i];

.listvar406:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1283     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar407
 push listvar_7
 call printstring
 add  sp, 2
;-1284     if(c== 1)printstring("byte " );

.listvar407:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar408
 push listvar_8
 call printstring
 add  sp, 2
;-1285     if(c== 2)printstring("word " );

.listvar408:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar409
 push listvar_9
 call printstring
 add  sp, 2
;-1286     if(c== 4)printstring("long " );

.listvar409:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar410
 push listvar_10
 call printstring
 add  sp, 2
;-1287     j=i*32;

.listvar410:
 mov ax, [bp+4]
 mov bx, 32
 mul bx
 mov [bp-2], ax
;-1288     pt=&GNameField + j;

 mov ax, GNameField
 add ax, [bp-2]
 mov word [pt], ax
;-1289     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1290     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar411
;-1291         prc('=');

 push 61
 call prc
 add  sp, 2
;-1292         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1293         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1294     }

;-1295     if(GType[i]=='&') {

.listvar411:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar412
;-1296         prc('[');

 push 91
 call prc
 add  sp, 2
;-1297         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1298         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1299         prc(']');

 push 93
 call prc
 add  sp, 2
;-1300     }

;-1301     if (i >= LSTART) {

.listvar412:
 mov ax, [bp+4]
 cmp ax, 300 ;unsigned : 0
 jb  .listvar413
;-1302         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1303         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1304         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar414
 push 43
 call prc
 add  sp, 2
;-1305         printinteger(j);

.listvar414:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1306     }

;-1307 }

.listvar413:
;-1308 

;-1309 int listproc() {

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
;-1310     int i;

;-1311     if (LTop > LSTART) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;300 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 300
 jle .listproc415
;-1312         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1313         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1314         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1315         i=LTop - LSTART;

 mov ax, [LTop]
 sub ax, 300
 mov [bp-2], ax
;-1316         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1317         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1318         i=LSTART;

 mov ax, 300
 mov [bp-2], ax
;-1319         while (i < LTop) {

.listproc416:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc417
;-1320             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1321             i++;

 inc  word[bp-2]
;-1322         }

;-1323     }

 jmp .listproc416
.listproc417:
;-1324 }

.listproc415:
;-1325 

;-1326 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1327     int FunctionIndex; char *p;

;-1328     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;300 var sign word FunctionIndex = bp-2
;301 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1329     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1330     while (FunctionIndex <= FunctionMaxIx) {

.searchFunction418:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction419
;-1331         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction420
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1332         p = strlen(p) + p;

.searchFunction420:
 push word [bp-4]
 call strlen
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1333         p++;

 inc  word[bp-4]
;-1334         FunctionIndex++;

 inc  word[bp-2]
;-1335     }

;-1336     return 0;               //no function found

 jmp .searchFunction418
.searchFunction419:
 mov ax, 0
 jmp .retnsearchFunction
;-1337 }

;-1338 

;-1339 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1340     unsigned int i;

;-1341     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1342     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300 ;unsigned : 1
 jl  .storeFunction421
 push storeFunction_0
 call error1
 add  sp, 2
;-1343     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction421:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1344     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1345     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1346     i += IDLENMAX;

 add  word[bp-2], 31
;-1347     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000 ;unsigned : 0
 jb  .storeFunction422
 push storeFunction_1
 call error1
 add  sp, 2
;-1348 

;-1349 }

.storeFunction422:
;-1350 

;-1351 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1352     int nloc; unsigned int j;int narg;

;-1353     cloc=&co;

;Function : dofunc, Number local Var: 3
; # type sign width local variables
;300 var sign word nloc = bp-2
;301 var unsg word j = bp-4
;302 var sign word narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax
;-1354     checknamelen();

 call checknamelen
;-1355     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1356     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc423
 push dofunc_0
 call error1
 add  sp, 2
;-1357     storeFunction();

.dofunc423:
 call storeFunction
;-1358 

;-1359     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1360     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1361     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1362     expect('(');

 push 40
 call expect
 add  sp, 2
;-1363     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1364     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc424
;-1365         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1366         do {

.dofunc425:
;-1367             typeName();

 call typeName
;-1368             addlocal();

 call addlocal
;-1369             narg+=2;

 add  word[bp-6], 2
;-1370             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1371             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc426
 add  word[bp-6], 2
;-1372                 LTop++;

.dofunc426:
 inc  word[LTop]
;-1373                 }

;-1374         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc427
 jmp .dofunc425
.dofunc427:
;-1375         expect(')');

 push 41
 call expect
 add  sp, 2
;-1376         }

;-1377 

;-1378     expect('{'); /*body*/

.dofunc424:
 push 123
 call expect
 add  sp, 2
;-1379     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1380     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1381     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1382     while(isvariable()) {

.dofunc428:
 call isvariable
 or  al, al
 je .dofunc429
;-1383         do {

.dofunc430:
;-1384             typeName();

 call typeName
;-1385             checknamelen();

 call checknamelen
;-1386             addlocal();

 call addlocal
;-1387             nloc-=2;

 sub  word[bp-2], 2
;-1388             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc431
 sub  word[bp-2], 2
;-1389             GData[LTop]=nloc;

.dofunc431:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1390             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc432
;-1391                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1392                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1393                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1394                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1395                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1396                 nloc+=2;

 add  word[bp-2], 2
;-1397                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1398             }

;-1399             LTop++;

.dofunc432:
 inc  word[LTop]
;-1400         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc433
 jmp .dofunc430
.dofunc433:
;-1401         expect(';');

 push 59
 call expect
 add  sp, 2
;-1402     }

;-1403     listproc();

 jmp .dofunc428
.dofunc429:
 call listproc
;-1404     if (LTop>LSTART){

 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc434
;-1405         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1406         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1407         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1408         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1409         }

;-1410 

;-1411     while(istoken('}')==0)  stmt();

.dofunc434:
.dofunc435:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc436
 call stmt
;-1412 

;-1413     if (nreturn) {

 jmp .dofunc435
.dofunc436:
 mov ax, [nreturn]
 or  al, al
 je .dofunc437
;-1414             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1415             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1416             prc(':');

 push 58
 call prc
 add  sp, 2
;-1417         }

;-1418     if (LTop > LSTART) printstring("\n LEAVE");

.dofunc437:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc438
 push dofunc_6
 call printstring
 add  sp, 2
;-1419     printstring("\n ret");

.dofunc438:
 push dofunc_7
 call printstring
 add  sp, 2
;-1420     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1421     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1422     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1423     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc439
 mov ax, [maxco1]
 mov word [maxco], ax
;-1424     printstring("\nENDP");

.dofunc439:
 push dofunc_8
 call printstring
 add  sp, 2
;-1425 }

;-1426 

;-1427 char doglobName[IDLENMAX];

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
absolute 59999
doglobName resb 31
section .text
;-1428 int doglob() {


doglob: PROC
;-1429     int i; int j; int isstrarr;

;-1430     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp-2
;301 var sign word j = bp-4
;302 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1431     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .doglob440
 push doglob_0
 call error1
 add  sp, 2
;-1432     if (iswidth == 0) error1("no VOID as var type");

.doglob440:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob441
 push doglob_1
 call error1
 add  sp, 2
;-1433     checknamelen();

.doglob441:
 call checknamelen
;-1434     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob442
 push doglob_2
 call error1
 add  sp, 2
;-1435     if (istoken('[')) {

.doglob442:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob443
;-1436         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1437         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob444
;-1438             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1439             printunsigned(orgData);

 push word [orgData]
 call printunsigned
 add  sp, 2
;-1440             printstring("\n"); printstring(Symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1441             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob445
 push doglob_5
 call printstring
 add  sp, 2
;-1442             if (iswidth==2) printstring(" resw ");

.doglob445:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob446
 push doglob_6
 call printstring
 add  sp, 2
;-1443             if (iswidth==4) printstring(" resd ");

.doglob446:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob447
 push doglob_7
 call printstring
 add  sp, 2
;-1444             printunsigned(lexval);

.doglob447:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1445             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1446             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1447             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob448
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1448             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob448:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob449
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax
;-1449             GData[GTop]=lexval;

.doglob449:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1450             expect(']');

 push 93
 call expect
 add  sp, 2
;-1451         }else {

 jmp .doglob450
.doglob444:
;-1452             expect(']');

 push 93
 call expect
 add  sp, 2
;-1453             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob451
 push doglob_9
 call error1
 add  sp, 2
;-1454             printstring("\n");

.doglob451:
 push doglob_10
 call printstring
 add  sp, 2
;-1455             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1456             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1457             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1458             strcpy(doglobName, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1459             expect('=');

 push 61
 call expect
 add  sp, 2
;-1460             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob452
;-1461                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1462                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1463                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1464                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1465                 i=strlen(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1466                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1467                 }

;-1468             else if (istoken('{' )) {

 jmp .doglob453
.doglob452:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob454
;-1469                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1470                 do {

.doglob455:
;-1471                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob456
 push 44
 call prc
 add  sp, 2
;-1472                     expect(T_CONST);

.doglob456:
 push 257
 call expect
 add  sp, 2
;-1473                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1474                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1475                     }

;-1476                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob457
 jmp .doglob455
.doglob457:
;-1477                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1478             }

;-1479         else error1("String or number array expected");

 jmp .doglob458
.doglob454:
 push doglob_13
 call error1
 add  sp, 2
;-1480         };

.doglob458:
.doglob453:
.doglob450:
;-1481     }else { //expect('=');

 jmp .doglob459
.doglob443:
;-1482         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1483         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1484         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob460
 push doglob_15
 call printstring
 add  sp, 2
;-1485         else {

 jmp .doglob461
.doglob460:
;-1486             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob462
 push doglob_16
 call printstring
 add  sp, 2
;-1487             else if (iswidth==2) printstring(" dw ");

 jmp .doglob463
.doglob462:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob464
 push doglob_17
 call printstring
 add  sp, 2
;-1488             else                 printstring(" dd ");

 jmp .doglob465
.doglob464:
 push doglob_18
 call printstring
 add  sp, 2
;-1489         }

.doglob465:
.doglob463:
;-1490     if(istoken('-')) prc('-');

.doglob461:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob466
 push 45
 call prc
 add  sp, 2
;-1491     if (istoken('=')) {

.doglob466:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob467
;-1492         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1493         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1494         }else printunsigned(0);

 jmp .doglob468
.doglob467:
 push 0
 call printunsigned
 add  sp, 2
;-1495     }

.doglob468:
;-1496     GSign[GTop]=issign;

.doglob459:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1497     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1498     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1499     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1500     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob469
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1501         else strcpy(pt, Symbol);

 jmp .doglob470
.doglob469:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1502     GTop++;

.doglob470:
 inc  word[GTop]
;-1503     expect(';');

 push 59
 call expect
 add  sp, 2
;-1504 }

;-1505 

;-1506 int dodefine() {

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
;-1507     int i; int j; int fdtemp;

;-1508     if (eqstr(Symbol, "ORGDATA")) {

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
 je .dodefine471
;-1509         token=getlex();

 call getlex
 mov word [token], ax
;-1510         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1511         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1512         return;

 jmp .retndodefine
;-1513     }

;-1514     expect(T_NAME);

.dodefine471:
 push 256
 call expect
 add  sp, 2
;-1515     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine472
;-1516         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine473
 push dodefine_1
 call error1
 add  sp, 2
;-1517         i=strlen(Symbol);

.dodefine473:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1518         if (i>IDLENMAX) error1("Define name too long");

 mov ax, [bp-2]
 cmp ax, 31
 jle .dodefine474
 push dodefine_2
 call error1
 add  sp, 2
;-1519         GSign [GTop]='U';

.dodefine474:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1520         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1521         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1522         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1523         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1524         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1525         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1526         GTop++;

 inc  word[GTop]
;-1527     }

;-1528 }

.dodefine472:
;-1529 

;-1530 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name too long",0
ENDP

parse: PROC
;-1531     token=getlex();

 call getlex
 mov word [token], ax
;-1532     do {

.parse475:
;-1533         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse476
 mov ax, 1
 jmp .retnparse
;-1534         if (istoken('#')) {

.parse476:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse477
;-1535              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse478
 call dodefine
;-1536              else error1("define expected");

 jmp .parse479
.parse478:
 push parse_0
 call error1
 add  sp, 2
;-1537         }

.parse479:
;-1538     else{

 jmp .parse480
.parse477:
;-1539         typeName();

 call typeName
;-1540         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse481
 call dofunc
;-1541         else doglob(); }

 jmp .parse482
.parse481:
 call doglob
.parse482:
;-1542     } while(1);

.parse480:
 mov ax, 1
 or  al, al
 je .parse483
 jmp .parse475
.parse483:
;-1543 }

;-1544 

;-1545 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1546 int main() {


main: PROC
;-1547     int arglen1; unsigned int i; char *c;

;-1548     isPrint=1;

;Function : main, Number local Var: 3
; # type sign width local variables
;300 var sign word arglen1 = bp-2
;301 var unsg word i = bp-4
;302 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1549     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1550     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main484
;-1551         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1552         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1553         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1554         }

;-1555     i=arglen1+129;

.main484:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1556     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1557     arglen1--;

 dec  word[bp-2]
;-1558     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1559     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1560     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main485
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4
;-1561     strcpy(namelst, namein);

.main485:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1562     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1563     i--;

 dec  word[bp-4]
;-1564     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1565     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1566 

;-1567     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1568     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main486
;-1569         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1570         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1571         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1572         }

;-1573     fdout=creatR(namelst);

.main486:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1574     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main487
;-1575         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1576         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1577         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1578         }

;-1579     printstring(";");

.main487:
 push main_4
 call printstring
 add  sp, 2
;-1580     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1581     printstring(", Input: "); printstring(namein);

 push main_5
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1582     printstring(", Output: "); printstring(namelst);

 push main_6
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1583     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1584     printstring("\norg  256 \njmp main");

 push main_7
 call printstring
 add  sp, 2
;-1585 

;-1586     FunctionNamePtr=&FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1587     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1588     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1589     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1590     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1591     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1592 

;-1593     parse();

 call parse
;-1594 

;-1595     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1596     GTop--;

 dec  word[GTop]
;-1597     printstring("\n;Glob. variables:");     printunsigned(GTop);

 push main_8
 call printstring
 add  sp, 2
 push word [GTop]
 call printunsigned
 add  sp, 2
;-1598     printstring(" (");                      printunsigned(LSTART);

 push main_9
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1599     printstring("), Functions:");           printunsigned(FunctionMaxIx);

 push main_10
 call printstring
 add  sp, 2
 push word [FunctionMaxIx]
 call printunsigned
 add  sp, 2
;-1600     printstring(" (");                      printunsigned(FUNCMAX);

 push main_11
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1601     printstring("), Lines:");               printunsigned(lineno);

 push main_12
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1602     printstring("\n;Constant: ");           printunsigned(maxco);

 push main_13
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1603     printstring(" (");                      printunsigned(COMAX);

 push main_14
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1604     i=COMAX;

 mov ax, 3000
 mov [bp-4], ax
;-1605     i=i-maxco;

 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1606     if (i <= 1000)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main488
 push main_15
 call printstring
 add  sp, 2
;-1607     printstring("), stacksize: ");

.main488:
 push main_16
 call printstring
 add  sp, 2
;-1608     i=65536;

 mov ax, 0
 mov [bp-4], ax
;-1609     i=i-orgData;

 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1610     printunsigned(i);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1611     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main489
 push main_17
 call printstring
 add  sp, 2
;-1612     end1(0);

.main489:
 push 0
 call end1
 add  sp, 2
;-1613 }

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
;Glob. variables:107 (300), Functions:75 (300), Lines:1614
;Constant: 688 (3000), stacksize: 5506