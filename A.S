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
;-116     n;

;Function : mkneg, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
;-117     asm mov ax, [bp+4]; parameter n

 mov ax, [bp+4]; parameter n
;-118     asm neg ax

 neg ax
;-119 }

;-120 

;-121 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-122     inth 0x21;

 int  33
;-123     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-124     DOS_ERR++;

 inc  word[DOS_ERR]
;-125 }

;-126 int openR (char *s) {

 ret
ENDP

openR: PROC
;-127     dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-128     ax=0x3D02;

 mov  ax, 15618
;-129     DosInt();

 call DosInt
;-130 }

;-131 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-132     dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-133     cx=0;

 mov  cx, 0
;-134     ax=0x3C00;

 mov  ax, 15360
;-135     DosInt();

 call DosInt
;-136 }

;-137 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-138     bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;300 var sign word fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
;-139     ax=0x3E00;

 mov  ax, 15872
;-140     DosInt();

 call DosInt
;-141 }

;-142 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-143     ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov  ah, 76
;-144     al=c;

 mov  al, [bp+4]
;-145     DosInt();

 call DosInt
;-146 }

;-147 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-148     dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign word fd = bp+6
;302 var sign word len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
;-149     cx=len;

 mov  cx, [bp+8]
;-150     bx=fd;

 mov  bx, [bp+6]
;-151     ax=0x3F00;

 mov  ax, 16128
;-152     DosInt();

 call DosInt
;-153 }

;-154 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-155     __asm{lea dx, [bp+4]}; /* = *n */

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte n = bp+4
;301 var sign word fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]
;-156     cx=1;

 mov  cx, 1
;-157     bx=fd;

 mov  bx, [bp+6]
;-158     ax=0x4000;

 mov  ax, 16384
;-159     DosInt();

 call DosInt
;-160 }

;-161 

;-162 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-163       if (c=='_') return 1;

;Function : letter, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-164       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-165       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-166       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-167       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-168       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-169       if (c> 'Z') { if (c< 'a') return 0; }

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
;-170       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-171 }

;-172 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-173       if(c<'0') return 0;

;Function : digit, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-174       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-175       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-176 }

;-177 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-178     if (digit (c)) return 1;

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
;-179     if (letter(c)) return 1;

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
;-180     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-181 }

;-182 

;-183 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-184     c=0;

;Function : strlen, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var sign word c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-185     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-186     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-187 }

;-188 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-189     do { *s=*t; s++; t++; }

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
;-190     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-191     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-192     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-193 }

;-194 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-195     while(*p) {

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
;-196         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-197         p++;

.eqstr22:
 inc  word[bp+4]
;-198         q++;

 inc  word[bp+6]
;-199     }

;-200     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-201     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-202 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-203     while (*s != 0) s++;

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
;-204     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-205 }

;-206 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-207     while(*s) {

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
;-208         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-209         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-210     }

;-211 }

 jmp .toupper26
.toupper27:
;-212 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-213     while(*s) {

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
;-214         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-215         s++;

.instr132:
 inc  word[bp+4]
;-216     }

;-217     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-218 }

;-219 

;-220 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-221     *cloc=c;

;Function : eprc, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-222     cloc++;

 inc  word[cloc]
;-223 }

;-224 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-225     char c;

;-226     while(*s) {

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
;-227         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-228         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-229         s++;

 inc  word[bp+4]
;-230     }

;-231 }

 jmp .eprs33
.eprs34:
;-232 

;-233 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-234     if (isPrint) {

;Function : prc, Number local Var: 1
; # type sign width local variables
;300 var unsg byte c = bp+4;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-235         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-236             ax=13;

 mov  ax, 13
;-237             writetty();

 call writetty
;-238         }

;-239         al=c;

.prc36:
 mov  al, [bp+4]
;-240         writetty();

 call writetty
;-241     }

;-242     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-243 }

;-244 

;-245 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-246     unsigned char c;

;-247     while(*s){

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
;-248         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-249         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-250         s++;

 inc  word[bp+4]
;-251     }

;-252 }

 jmp .prscomment37
.prscomment38:
;-253 

;-254 int prs(unsigned char *s) {

 LEAVE
 ret
ENDP

prs: PROC
;-255     unsigned char c; int com;

;-256     com=0;

;Function : prs, Number local Var: 3
; # type sign width local variables
;300 ptr unsg byte s = bp+4
;301 var unsg byte c = bp-2
;302 var sign word com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-257     while(*s) {

.prs39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs40
;-258         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-259         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs41
 mov ax, [bp-4]
 or  al, al
 je .prs42
 mov ax, 0
 mov [bp-4], ax
;-260                    else com=1;

 jmp .prs43
.prs42:
 mov ax, 1
 mov [bp-4], ax
;-261         if (c==92) {

.prs43:
.prs41:
 mov al, [bp-2]
 cmp al, 92
 jne .prs44
;-262             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs45
;-263                 s++;

 inc  word[bp+4]
;-264                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-265                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs46
 mov ax, 10
 mov [bp-2], al
;-266                 if (c=='t') c= 9;

.prs46:
 mov al, [bp-2]
 cmp al, 116
 jne .prs47
 mov ax, 9
 mov [bp-2], al
;-267             }

.prs47:
;-268         }

.prs45:
;-269         prc(c);

.prs44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-270         s++;

 inc  word[bp+4]
;-271     }

;-272 }

 jmp .prs39
.prs40:
;-273 

;-274 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-275     int e;

;-276     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;300 var sign word n = bp+4
;301 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-277         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-278         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-279     }

;-280     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-281         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-282         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-283     }

;-284     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-285     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-286     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-287 }

;-288 

;-289 int pint1 (int n){

 LEAVE
 ret
ENDP

pint1: PROC
;-290     int e;

;-291     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : pint1, Number local Var: 2
; # type sign width local variables
;300 var sign word n = bp+4
;301 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint150
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-292     if (n >= 10) {

.pint150:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint151
;-293         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-294         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2
;-295     }

;-296     n=n%10;

.pint151:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-297     n += '0';

 add  word[bp+4], 48
;-298     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-299 }

;-300 

;-301 int prunsign1(unsigned int n) {

 LEAVE
 ret
ENDP

prunsign1: PROC
;-302     unsigned int e;

;-303     if (n >= 10) {

;Function : prunsign1, Number local Var: 2
; # type sign width local variables
;300 var unsg word n = bp+4
;301 var unsg word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign152
;-304         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-305         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-306     }

;-307     n = n % 10; /*unsigned mod*/

.prunsign152:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-308     n += '0';

 add  word[bp+4], 48
;-309     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-310 }

;-311 

;-312 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-313     fcloseR(fdin);

;Function : end1, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-314     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-315     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-316 }

;-317 

;-318 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-319     isPrint=1;

;Function : error1, Number local Var: 1
; # type sign width local variables
;300 ptr sign byte s = bp+4;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-320     lineno--;

 dec  word[lineno]
;-321     prs("\n ");

 push error1_0
 call prs
 add  sp, 2
;-322     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-323     prs(";Line: ");

 push error1_1
 call prs
 add  sp, 2
;-324     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-325     prs(" ************** ERROR: ");

 push error1_2
 call prs
 add  sp, 2
;-326     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2
;-327     prs("  in column: ");

 push error1_3
 call prs
 add  sp, 2
;-328     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2
;-329     prs("\nToken: ");

 push error1_4
 call prs
 add  sp, 2
;-330     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2
;-331     prs(", symbol: ");

 push error1_5
 call prs
 add  sp, 2
;-332     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-333     end1(1);

 push 1
 call end1
 add  sp, 2
;-334 }

;-335 

;-336 int printinputline() {

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
;-337     int col;

;-338     col=0;

;Function : printinputline, Number local Var: 1
; # type sign width local variables
;300 var sign word col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-339     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-340     do {

.printinputline53:
;-341         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-342         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-343         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-344         fgetsp++;

 inc  word[fgetsp]
;-345         col++;

 inc  word[bp-2]
;-346         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-347         }

.printinputline55:
;-348         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-349     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-350         prs("\n;-");

 push printinputline_1
 call prs
 add  sp, 2
;-351         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-352         prc(' ');

 push 32
 call prc
 add  sp, 2
;-353         lineno++;

 inc  word[lineno]
;-354         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-355 }

;-356 

;-357 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-358     char c;

;-359     c=*fgetsp;

;Function : fgets1, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-360     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-361         printinputline();

 call printinputline
;-362         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-363         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-364         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-365         column=0;

 mov ax, 0
 mov word [column], ax
;-366     }

;-367     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-368     column++;

 inc  word[column]
;-369     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-370 }

;-371 

;-372 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-373     char r;

;-374     r = thechar;

;Function : next, Number local Var: 1
; # type sign width local variables
;300 var sign byte r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-375     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-376     return r;

 mov al, [bp-2]
 jmp .retnnext
;-377 }

;-378 

;-379 int adrF(char *s, unsigned int i) {

 .retnnext:
 LEAVE
 ret
ENDP

adrF: PROC
;-380     i << 5;//ax=i*32; IDLENMAX=31!

;Function : adrF, Number local Var: 2
; # type sign width local variables
;300 ptr sign byte s = bp+4
;301 var unsg word i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 5
;-381     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 
;-382 }

;-383 

;-384 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-385     int j;

;-386     if (i < LSTART) {

;Function : printName, Number local Var: 2
; # type sign width local variables
;300 var unsg word i = bp+4
;301 var sign word j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName59
;-387         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-388         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2
;-389     }

;-390     else {

 jmp .printName60
.printName59:
;-391         prs("[bp");

 push printName_0
 call prs
 add  sp, 2
;-392         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-393         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2
;-394         pint1(j);

.printName61:
 push word [bp-2]
 call pint1
 add  sp, 2
;-395         prc(']');

 push 93
 call prc
 add  sp, 2
;-396     }

;-397 }

.printName60:
;-398 

;-399 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-400     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;300 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL
;-401     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63
;-402         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al
;-403         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL
;-404     }

;-405     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL
;-406 }

;-407 

;-408 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 52857
symboltemp resb 80
section .text
;-409 

;-410 int getlex() {


getlex: PROC
;-411     char c; char *p;

;-412     int i; int j;

;-413 g1: c=next();

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
;-414     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex
;-415     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1
;-416   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-417   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-418   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-419   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-420   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-421   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-422   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-423   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-424   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-425   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-426   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-427   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-428   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-429   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-430   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-431   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96
;-432       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97
;-433           do c=next();

.getlex98:
 call next
 mov [bp-2], al
;-434           while(ifEOL(c)==0) return getlex();

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
;-435       }

;-436   }

.getlex97:
;-437   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-438       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101
;-439           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-440           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2
;-441           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2
;-442           c=next();

.getlex103:
 call next
 mov [bp-2], al
;-443           return getlex();

 call getlex
 jmp .retngetlex
;-444       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex
;-445   }

.getlex104:
;-446   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105
;-447       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-448       c=next();

 call next
 mov [bp-2], al
;-449       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107
;-450           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-451           p++;

 inc  word[bp-4]
;-452           c=next();

 call next
 mov [bp-2], al
;-453           }

;-454           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-455       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-456   }

;-457   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108
;-458       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-459       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-460       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al
;-461       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110
;-462           next();

 call next
;-463           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112
;-464               c=next();

 call next
 mov [bp-2], al
;-465               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-466       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-467                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-468                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-469                i=0;

 mov ax, 0
 mov [bp-6], ax
;-470                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-471                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-472            }

;-473        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:
;-474            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-475                c=next();

 call next
 mov [bp-2], al
;-476                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-477                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-478                i=0;

 mov ax, 0
 mov [bp-6], ax
;-479                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-480                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-481            }

;-482        }

 jmp .getlex116
.getlex117:
;-483       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex
;-484   }

;-485   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118
;-486       lexval=next();

 call next
 mov word [lexval], ax
;-487       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119
;-488           lexval=next();

 call next
 mov word [lexval], ax
;-489           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax
;-490           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax
;-491           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax
;-492       }

.getlex122:
;-493       next();

.getlex119:
 call next
;-494       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-495   }

;-496   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-497     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-498     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-499     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-500     p++;

 inc  word[bp-4]
;-501     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125
;-502         c=next();

 call next
 mov [bp-2], al
;-503         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-504         p++;

 inc  word[bp-4]
;-505     }

;-506     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-507     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex
;-508     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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
;-509     if (eqstr(symbol,"void"    )) return T_VOID;

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
;-510     if (eqstr(symbol,"int"     )) return T_INT;

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
;-511     if (eqstr(symbol,"long"    )) return T_LONG;

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
;-512     if (eqstr(symbol,"inth"    )) return T_INTH;

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
;-513     if (eqstr(symbol,"char"    )) return T_CHAR;

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
;-514     if (eqstr(symbol,"asm"     )) return T_ASM;

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
;-515     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

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
;-516     if (eqstr(symbol,"__emit__")) return T_EMIT;

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
;-517     if (eqstr(symbol,"return"  )) return T_RETURN;

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
;-518     if (eqstr(symbol,"if"      )) return T_IF;

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
;-519     if (eqstr(symbol,"else"    )) return T_ELSE;

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
;-520     if (eqstr(symbol,"while"   )) return T_WHILE;

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
;-521     if (eqstr(symbol,"do"      )) return T_DO;

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
;-522     if (eqstr(symbol,"goto"    )) return T_GOTO;

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
;-523     if (eqstr(symbol,"define"  )) return T_DEFINE;

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
;-524 

;-525     i=0;//convert define to value

.getlex142:
 mov ax, 0
 mov [bp-6], ax
;-526     while (i < GTop) {

.getlex143:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex144
;-527         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-528         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
;-529             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex146
;-530                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-531                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
;-532                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-533             }

;-534         }

.getlex146:
;-535         i++;

.getlex145:
 inc  word[bp-6]
;-536     }

;-537     return T_NAME; } error1("Input item not recognized");

 jmp .getlex143
.getlex144:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_18
 call error1
 add  sp, 2
;-538 }

;-539 

;-540 int istoken(int t) {

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
;-541     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;300 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken147
;-542         token=getlex();

 call getlex
 mov word [token], ax
;-543         return 1;

 mov ax, 1
 jmp .retnistoken
;-544     }

;-545     return 0;

.istoken147:
 mov ax, 0
 jmp .retnistoken
;-546 }

;-547 

;-548 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-549     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;300 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect148
;-550         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-551         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-552         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2
;-553         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2
;-554         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-555     }

;-556 }

.expect148:
;-557 

;-558 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-559     if (i < LSTART) prc('[');

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
;-560     printName(i);

.v149:
 push word [bp+4]
 call printName
 add  sp, 2
;-561     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v150
 push 93
 call prc
 add  sp, 2
;-562 }

.v150:
;-563 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-564     int i;

;-565     i=strlen(symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;300 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-566     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen151
 push checknamelen_0
 call error1
 add  sp, 2
;-567 }

.checknamelen151:
;-568 

;-569 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-570     unsigned int i; unsigned int j;

;-571     i=LSTART;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;300 var unsg word i = bp-2
;301 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, 300
 mov [bp-2], ax
;-572     while(i<LTop) {

.checkName152:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName153
;-573         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-574         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName154
 mov ax, [bp-2]
 jmp .retncheckName
;-575         i++;

.checkName154:
 inc  word[bp-2]
;-576     }

;-577     i=1;

 jmp .checkName152
.checkName153:
 mov ax, 1
 mov [bp-2], ax
;-578     while(i<GTop) {

.checkName155:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName156
;-579         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-580         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName157
 mov ax, [bp-2]
 jmp .retncheckName
;-581         i++;

.checkName157:
 inc  word[bp-2]
;-582     }

;-583     return 0;

 jmp .checkName155
.checkName156:
 mov ax, 0
 jmp .retncheckName
;-584 }

;-585 

;-586 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-587     unsigned int i;

;-588     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;300 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-589     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname158
 push searchname_0
 call error1
 add  sp, 2
;-590     return i;

.searchname158:
 mov ax, [bp-2]
 jmp .retnsearchname
;-591 }

;-592 

;-593 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-594     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1159
 push name1_0
 call error1
 add  sp, 2
;-595     token=getlex();

.name1159:
 call getlex
 mov word [token], ax
;-596 }

;-597 

;-598 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-599     int m; //0=V,1=*,2=&

;-600     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;300 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-601     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 83
 mov byte [issign], al
;-602     if(istoken(T_UNSIGNED)) issign='U';

.typeName160:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 85
 mov byte [issign], al
;-603     iswidth=2;

.typeName161:
 mov ax, 2
 mov byte [iswidth], al
;-604     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 0
 mov byte [iswidth], al
;-605     if(istoken(T_CHAR))     iswidth=1;

.typeName162:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 1
 mov byte [iswidth], al
;-606     if(istoken(T_INT))      iswidth=2;

.typeName163:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 2
 mov byte [iswidth], al
;-607     if(istoken(T_LONG))     iswidth=4;

.typeName164:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 4
 mov byte [iswidth], al
;-608     istype='V';

.typeName165:
 mov ax, 86
 mov byte [istype], al
;-609     m=0;

 mov ax, 0
 mov [bp-2], ax
;-610     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-611     if(istoken('&'))  {istype='&'; m=2;}

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
;-612     name1();

.typeName167:
 call name1
;-613     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-614 }

;-615 

;-616 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-617     char c;

;-618     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;300 var sign word i = bp+4
;301 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-619     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes168
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes169
.gettypes168:
 mov ax, 0
 mov word [signi], ax
;-620     c=GWidth[i];

.gettypes169:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-621     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-622     wi=0;

 mov ax, 0
 mov word [wi], ax
;-623     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes170
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-624     if (c==2) {widthi=2;wi=2;}

.gettypes170:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes171
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-625     if (c==4) {widthi=4;wi=4;}

.gettypes171:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes172
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-626     c=GType [i];

.gettypes172:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-627     typei=0;

 mov ax, 0
 mov word [typei], ax
;-628     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes173
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-629     if (c=='&')  typei=2;

.gettypes173:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes174
 mov ax, 2
 mov word [typei], ax
;-630     return i;

.gettypes174:
 mov ax, [bp+4]
 jmp .retngettypes
;-631 }

;-632 

;-633 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-634     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal175
 push addlocal_0
 call error1
 add  sp, 2
;-635     if (checkName() != 0) error1("Variable already defined");

.addlocal175:
 call checkName
 cmp ax, 0
 je  .addlocal176
 push addlocal_1
 call error1
 add  sp, 2
;-636     GSign[LTop]=issign;

.addlocal176:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-637     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-638     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-639     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-640     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-641 }

;-642 

;-643 

;-644 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-645        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg177
 push cmpneg_0
 call prs
 add  sp, 2
;-646   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg178
.cmpneg177:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg179
 push cmpneg_1
 call prs
 add  sp, 2
;-647   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg180
.cmpneg179:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg181
 mov ax, [bp+4]
 or  al, al
 je .cmpneg182
 push cmpneg_2
 call prs
 add  sp, 2
;-648                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg183
.cmpneg182:
 push cmpneg_3
 call prs
 add  sp, 2
;-649   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

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
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-650                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2
;-651                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg187
.cmpneg186:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-652                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2
;-653   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg187:
 jmp .cmpneg188
.cmpneg185:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg189
 push cmpneg_8
 call prs
 add  sp, 2
;-654   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg190
.cmpneg189:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg191
 push cmpneg_9
 call prs
 add  sp, 2
;-655   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg192
.cmpneg191:
 push cmpneg_10
 call error1
 add  sp, 2
;-656 }

.cmpneg192:
.cmpneg190:
.cmpneg188:
.cmpneg184:
.cmpneg180:
.cmpneg178:
;-657 

;-658 int isrelational() {

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
;-659     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational193
 jmp .w
;-660     if (token==T_NE) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational194
 jmp .w
;-661     if (token==T_LE) goto w;

.isrelational194:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational195
 jmp .w
;-662     if (token==T_GE) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational196
 jmp .w
;-663     if (token=='<' ) goto w;

.isrelational196:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational197
 jmp .w
;-664     if (token=='>' ) goto w;

.isrelational197:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational198
 jmp .w
;-665     return 0;

.isrelational198:
 mov ax, 0
 jmp .retnisrelational
;-666 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-667     token=getlex();

 call getlex
 mov word [token], ax
;-668     return 1;

 mov ax, 1
 jmp .retnisrelational
;-669 }

;-670 

;-671 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-672   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg199
 mov ax, 0
 jmp .retncheckreg
;-673   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

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
;-674   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

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
;-675   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

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
;-676   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

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
;-677   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

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
;-678   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

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
;-679   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

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
;-680   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

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
;-681   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

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
;-682   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

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
;-683   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

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
;-684   // (eqstr(symbol,"ip")) return 45;

;-685   if (strlen(symbol) >   3) return 0;

.checkreg221:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg222
 mov ax, 0
 jmp .retncheckreg
;-686   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

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
;-687   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

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
;-688   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

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
;-689   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

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
;-690 //  if (eqstr(symbol,"cr0")) return 71;

;-691   return 0;

.checkreg230:
 mov ax, 0
 jmp .retncheckreg
;-692 }

;-693 

;-694 char printregstr[]

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
;-695 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-696 

;-697 int printreg(int i) {


printreg: PROC
;-698     unsigned int k; unsigned char c;

;-699     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp+4
;301 var unsg word k = bp-2
;302 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-700     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-701     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-702     i++;

 inc  word[bp+4]
;-703     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-704     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-705     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-706     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg231
;-707         i++;

 inc  word[bp+4]
;-708         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-709         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-710         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-711         }

;-712 }

.printreg231:
;-713 

;-714 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 52937
ops resb 5
section .text
;-715 int doreg1(int iscmp1) {


doreg1: PROC
;-716     int i;

;-717     if (istoken('='))          strcpy(ops, "mov");

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
;-718     if (istoken(T_PLUSASS))    strcpy(ops, "add");

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
;-719     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

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
;-720     if (istoken(T_ANDASS))     strcpy(ops, "and");

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
;-721     if (istoken(T_ORASS))      strcpy(ops, "or" );

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
;-722     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

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
;-723     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

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
;-724     if (iscmp1 == 1) {

.doreg1238:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1239
;-725             token=getlex();

 call getlex
 mov word [token], ax
;-726             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1240
 push doreg1_7
 call error1
 add  sp, 2
;-727             strcpy(ops, "cmp");

.doreg1240:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-728         }

;-729     prs("\n ");

.doreg1239:
 push doreg1_9
 call prs
 add  sp, 2
;-730     prs(ops);

 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2
;-731     prs("  ");

 push doreg1_10
 call prs
 add  sp, 2
;-732     printreg(ireg1);

 push word [ireg1]
 call printreg
 add  sp, 2
;-733     prs(", ");

 push doreg1_11
 call prs
 add  sp, 2
;-734 

;-735     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1241
;-736         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-737         goto reg1;

 jmp .reg1
;-738         }

;-739     mod2=typeName();

.doreg1241:
 call typeName
 mov word [mod2], ax
;-740     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-741     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1242
;-742         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-743         goto reg1;

 jmp .reg1
;-744         }

;-745     i=searchname();

.doreg1242:
 call searchname
 mov [bp-2], ax
;-746     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1243
 push word [bp-2]
 call printName
 add  sp, 2
;-747         else v(i);

 jmp .doreg1244
.doreg1243:
 push word [bp-2]
 call v
 add  sp, 2
;-748 reg1: if (iscmp1 == 1) {

.doreg1244:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1245
;-749     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-750     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-751     expect(')');

 push 41
 call expect
 add  sp, 2
;-752     }

;-753 }

.doreg1245:
;-754 

;-755 int compoundass(char *op, int mode, int id1) {

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
;-756     if(mode) error1("only scalar variable allowed");

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
;-757     prs("\n ");

.compoundass246:
 push compoundass_1
 call prs
 add  sp, 2
;-758     prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-759     prs("  ");

 push compoundass_2
 call prs
 add  sp, 2
;-760     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-761     if (wi==2) prs("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass247
 push compoundass_3
 call prs
 add  sp, 2
;-762         else prs("byte");

 jmp .compoundass248
.compoundass247:
 push compoundass_4
 call prs
 add  sp, 2
;-763     v(id1);

.compoundass248:
 push word [bp+8]
 call v
 add  sp, 2
;-764     prs(", ");

 push compoundass_5
 call prs
 add  sp, 2
;-765     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-766     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-767 }

;-768 

;-769 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-770     gettypes(id1);

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
;-771     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1249
;-772         prs("\n mov bx, ");

 push dovar1_0
 call prs
 add  sp, 2
;-773         v(id1); prs("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call prs
 add  sp, 2
;-774         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-775         if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1250
 push dovar1_2
 call prs
 add  sp, 2
;-776         if(widthi == 2) prs(" ax, [bx]");

.dovar1250:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1251
 push dovar1_3
 call prs
 add  sp, 2
;-777         return;

.dovar1251:
 jmp .retndovar1
;-778         }

;-779     if (mode==2){// & = adr

.dovar1249:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1252
;-780         prs("\n ");

 push dovar1_4
 call prs
 add  sp, 2
;-781         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-782         prs(" ax, ");

 push dovar1_5
 call prs
 add  sp, 2
;-783         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-784         return;

 jmp .retndovar1
;-785         }

;-786     if (ixarr) {//array

.dovar1252:
 mov ax, [bp+8]
 or  al, al
 je .dovar1253
;-787         prs("\n mov bx, ");

 push dovar1_6
 call prs
 add  sp, 2
;-788         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-789         if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_7
 call prs
 add  sp, 2
;-790         prs("\n ");

.dovar1254:
 push dovar1_8
 call prs
 add  sp, 2
;-791         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-792         if (wi==2) prs(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_9
 call prs
 add  sp, 2
;-793             else prs(" al, ");

 jmp .dovar1256
.dovar1255:
 push dovar1_10
 call prs
 add  sp, 2
;-794         prc('[');

.dovar1256:
 push 91
 call prc
 add  sp, 2
;-795         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-796         prs(" + bx]");

 push dovar1_11
 call prs
 add  sp, 2
;-797         return;

 jmp .retndovar1
;-798         }

;-799     prs("\n ");

.dovar1253:
 push dovar1_12
 call prs
 add  sp, 2
;-800     prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-801     if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1257
 push dovar1_13
 call prs
 add  sp, 2
;-802     if(wi==2) prs(" ax, ");

.dovar1257:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_14
 call prs
 add  sp, 2
;-803     if(wi==4) prs(" eax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1259
 push dovar1_15
 call prs
 add  sp, 2
;-804     v(id1);

.dovar1259:
 push word [bp+10]
 call v
 add  sp, 2
;-805 }

;-806 

;-807 int rterm(char *op) {

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
;-808     int mode; int opint; int ixarr; int id1;

;-809     if (istoken(T_CONST)) {

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
;-810         prs("\n ");

 push rterm_0
 call prs
 add  sp, 2
;-811         prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-812         if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm261
 push rterm_1
 call prs
 add  sp, 2
;-813         if (wi==2) prs(" ax, ");

.rterm261:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm262
 push rterm_2
 call prs
 add  sp, 2
;-814         if (wi==4) prs(" eax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm263
 push rterm_3
 call prs
 add  sp, 2
;-815         prunsign1(lexval);

.rterm263:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-816         return;

 jmp .retnrterm
;-817         }

;-818     mode=typeName();

.rterm260:
 call typeName
 mov [bp-2], ax
;-819     id1=searchname();

 call searchname
 mov [bp-8], ax
;-820     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-821     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm264
;-822         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-823         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-824         expect(']');

 push 93
 call expect
 add  sp, 2
;-825         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-826         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm265
 push rterm_4
 call error1
 add  sp, 2
;-827         }

.rterm265:
;-828     if (eqstr(symbol,"ax")) return;

.rterm264:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm266
 jmp .retnrterm
;-829     opint=op;

.rterm266:
 mov ax, [bp+4]
 mov [bp-4], ax
;-830     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-831 }

;-832 

;-833 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-834     gettypes(i);

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
;-835     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign267
;-836         prs("\n mov  bx, ");

 push doassign_0
 call prs
 add  sp, 2
;-837         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-838         if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign268
 push doassign_1
 call prs
 add  sp, 2
;-839             else  prs("\n mov  [bx], al");

 jmp .doassign269
.doassign268:
 push doassign_2
 call prs
 add  sp, 2
;-840         return;

.doassign269:
 jmp .retndoassign
;-841         }

;-842     if (mode==2) {// & = adr

.doassign267:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign270
;-843         prs("\n mov  ");

 push doassign_3
 call prs
 add  sp, 2
;-844         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-845         prs(", ax");

 push doassign_4
 call prs
 add  sp, 2
;-846         return;

 jmp .retndoassign
;-847         }

;-848     if (ixarr) {

.doassign270:
 mov ax, [bp+8]
 or  al, al
 je .doassign271
;-849         prs("\n mov bx, ");

 push doassign_5
 call prs
 add  sp, 2
;-850         if(ixconst) prunsign1(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign272
 push word [bp+8]
 call prunsign1
 add  sp, 2
;-851             else v(ixarr);

 jmp .doassign273
.doassign272:
 push word [bp+8]
 call v
 add  sp, 2
;-852         if (wi==2) prs("\n shl bx, 1");

.doassign273:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign274
 push doassign_6
 call prs
 add  sp, 2
;-853         prs("\n mov [");

.doassign274:
 push doassign_7
 call prs
 add  sp, 2
;-854         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-855         if (wi==2) prs("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign275
 push doassign_8
 call prs
 add  sp, 2
;-856             else prs("+bx], al");

 jmp .doassign276
.doassign275:
 push doassign_9
 call prs
 add  sp, 2
;-857         return;

.doassign276:
 jmp .retndoassign
;-858         }

;-859     if (wi==1){

.doassign271:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign277
;-860         prs("\n mov ");

 push doassign_10
 call prs
 add  sp, 2
;-861         if(i<LSTART) prs("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign278
 push doassign_11
 call prs
 add  sp, 2
;-862         v(i);

.doassign278:
 push word [bp+6]
 call v
 add  sp, 2
;-863         prs(", al");

 push doassign_12
 call prs
 add  sp, 2
;-864         return;

 jmp .retndoassign
;-865         }

;-866     if (wi==2){

.doassign277:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign279
;-867         prs("\n mov ");

 push doassign_13
 call prs
 add  sp, 2
;-868         if(i<LSTART) prs("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign280
 push doassign_14
 call prs
 add  sp, 2
;-869         v(i);

.doassign280:
 push word [bp+6]
 call v
 add  sp, 2
;-870         prs(", ax");

 push doassign_15
 call prs
 add  sp, 2
;-871         return;

 jmp .retndoassign
;-872         }

;-873     if (wi==4){

.doassign279:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign281
;-874         prs("\n mov ");

 push doassign_16
 call prs
 add  sp, 2
;-875         if(i<LSTART) prs("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign282
 push doassign_17
 call prs
 add  sp, 2
;-876         v(i);

.doassign282:
 push word [bp+6]
 call v
 add  sp, 2
;-877         prs(", eax");

 push doassign_18
 call prs
 add  sp, 2
;-878         return;

 jmp .retndoassign
;-879         }

;-880 }

.doassign281:
;-881 

;-882 int domul(int ids) {

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
;-883     if (ids) rterm("imul");

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
;-884         else {

 jmp .domul284
.domul283:
;-885         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul285
;-886             prs("\n mov bx, ");

 push domul_1
 call prs
 add  sp, 2
;-887             prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-888             prs("\n mul bx");

 push domul_2
 call prs
 add  sp, 2
;-889             }

;-890         else error1("with MUL only const number as multiplicator allowed");

 jmp .domul286
.domul285:
 push domul_3
 call error1
 add  sp, 2
;-891         }

.domul286:
;-892 }

.domul284:
;-893 

;-894 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC
;-895     int mode; int id1;

;-896     if (istoken(T_CONST)) {

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
;-897         prs("\n mov bx, ");

 push doidiv_0
 call prs
 add  sp, 2
;-898         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-899         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv288
 push doidiv_1
 call prs
 add  sp, 2
;-900             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv289
.doidiv288:
 push doidiv_2
 call prs
 add  sp, 2
;-901         }

.doidiv289:
;-902     else {

 jmp .doidiv290
.doidiv287:
;-903         mode=typeName();

 call typeName
 mov [bp-2], ax
;-904         id1=searchname();

 call searchname
 mov [bp-4], ax
;-905         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv291
 push doidiv_3
 call error1
 add  sp, 2
;-906         gettypes(id1);

.doidiv291:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-907         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv292
 push doidiv_4
 call error1
 add  sp, 2
;-908         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv292:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv293
 push doidiv_5
 call error1
 add  sp, 2
;-909         prs("\n mov bx, ");

.doidiv293:
 push doidiv_6
 call prs
 add  sp, 2
;-910         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-911         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv294
 push doidiv_7
 call prs
 add  sp, 2
;-912             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv295
.doidiv294:
 push doidiv_8
 call prs
 add  sp, 2
;-913     }

.doidiv295:
;-914 }

.doidiv290:
;-915 

;-916 int domod(int ids) {

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
;-917     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;300 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-918     prs("\n mov ax, dx");

 push domod_0
 call prs
 add  sp, 2
;-919 }

;-920 

;-921 

;-922 int docalltype[10]; int docallvalue[10];

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
;-923 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 52982
procname resb 17
section .text
;-924 

;-925 int docall1() {


docall1: PROC
;-926     int i; int narg; int t0; int n0;  int sz32;

;-927     narg=0;

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
;-928     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-929     checknamelen();

 call checknamelen
;-930     strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-931     expect('(');

 push 40
 call expect
 add  sp, 2
;-932 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1296
;-933 	    do {

.docall1297:
;-934 	        narg++;

 inc  word[bp-4]
;-935 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1298
 push docall1_0
 call error1
 add  sp, 2
;-936 	        t0=0;

.docall1298:
 mov ax, 0
 mov [bp-6], ax
;-937             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1299
;-938                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-939                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-940                 }

;-941             if(istoken(T_STRING)){

.docall1299:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1300
;-942                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-943                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-944                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-945                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-946                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-947                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-948                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-949                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-950                 eprs(symbol);

 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
;-951                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-952                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-953                 nconst++;

 inc  word[nconst]
;-954                 }

;-955             if(istoken('&'))     {

.docall1300:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1301
;-956                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-957                 name1();

 call name1
;-958                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-959                 }

;-960             if(istoken(T_NAME))  {

.docall1301:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1302
;-961                 n0=checkreg();

 call checkreg
 mov [bp-8], ax
;-962                 if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1303
 mov ax, 5
 mov [bp-6], ax
;-963                 else {

 jmp .docall1304
.docall1303:
;-964                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-965                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-966                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-967                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-968                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1305
 mov ax, 3
 mov [bp-6], ax
;-969                     }

.docall1305:
;-970                 }

.docall1304:
;-971             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1302:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1306
 push docall1_4
 call error1
 add  sp, 2
;-972             docalltype [narg] = t0;

.docall1306:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-973             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-974         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1307
 jmp .docall1297
.docall1307:
;-975 

;-976   	expect(')');

 push 41
 call expect
 add  sp, 2
;-977   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-978     do {

.docall1308:
;-979         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-980         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-981         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1309
;-982             prs("\n push ");

 push docall1_5
 call prs
 add  sp, 2
;-983             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-984             }

;-985         if(t0==2){

.docall1309:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1310
;-986             prs("\n push ");

 push docall1_6
 call prs
 add  sp, 2
;-987             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-988             prc(95);

 push 95
 call prc
 add  sp, 2
;-989             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-990             }

;-991         if(t0==3){

.docall1310:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1311
;-992             prs("\n lea  ax, ");

 push docall1_7
 call prs
 add  sp, 2
;-993             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-994             prs("\n push ax");

 push docall1_8
 call prs
 add  sp, 2
;-995             }

;-996         if(t0==4){

.docall1311:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1312
;-997             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-998             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1313
;-999                 prs("\n push word ");

 push docall1_9
 call prs
 add  sp, 2
;-1000                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1001                 }

;-1002             else {

 jmp .docall1314
.docall1313:
;-1003                 prs("\n mov al, byte ");

 push docall1_10
 call prs
 add  sp, 2
;-1004                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1005                 prs("\n mov ah, 0\n push ax");

 push docall1_11
 call prs
 add  sp, 2
;-1006                 }

;-1007             }

.docall1314:
;-1008         if(t0==5){

.docall1312:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1315
;-1009             prs("\n push ");

 push docall1_12
 call prs
 add  sp, 2
;-1010             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1011             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1316
 mov ax, [bp-10]
 add ax, 2
;-1012             }

.docall1316:
;-1013         i--;

.docall1315:
 dec  word[bp-2]
;-1014         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1317
 jmp .docall1308
.docall1317:
;-1015     }

;-1016 	prs("\n call ");

.docall1296:
 push docall1_13
 call prs
 add  sp, 2
;-1017 	prs(&procname);

 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2
;-1018 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1318
;-1019 	    prs("\n add  sp, ");

 push docall1_14
 call prs
 add  sp, 2
;-1020         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1021         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1022         prunsign1(narg);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1023         }

;-1024 }

.docall1318:
;-1025 

;-1026 

;-1027 int expr() {

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
;-1028     int mode;   int id1;

;-1029     int ixarr;  int ixconst;

;-1030     int ids;    int isCONST;

;-1031     int i;      unsigned char *p;

;-1032 

;-1033     if (istoken(T_CONST)) {// constant ;

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
 je .expr319
;-1034         prs("\n mov ax, ");

 push expr_0
 call prs
 add  sp, 2
;-1035         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1036         return 4;

 mov ax, 4
 jmp .retnexpr
;-1037         }

;-1038     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr319:
 call typeName
 mov [bp-2], ax
;-1039     ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1040     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr320
;-1041         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1042         return;

 jmp .retnexpr
;-1043         }

;-1044     if (token=='(')  {

.expr320:
 mov ax, [token]
 cmp ax, 40
 jne .expr321
;-1045         docall1();

 call docall1
;-1046         goto e1;

 jmp .e1
;-1047         }

;-1048 

;-1049     id1=searchname();

.expr321:
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
 je .expr322
;-1055         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr323
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

 jmp .expr324
.expr323:
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
 je  .expr325
 push expr_1
 call error1
 add  sp, 2
;-1066             }

.expr325:
;-1067         }

.expr324:
;-1068     if (istoken(T_PLUSPLUS  )) {

.expr322:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr326
;-1069         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr327
 push expr_2
 call error1
 add  sp, 2
;-1070         prs("\n inc  ");

.expr327:
 push expr_3
 call prs
 add  sp, 2
;-1071         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr328
 push expr_4
 call prs
 add  sp, 2
 jmp .expr329
.expr328:
 push expr_5
 call prs
 add  sp, 2
;-1072         v(id1);

.expr329:
 push word [bp-4]
 call v
 add  sp, 2
;-1073         goto e1;

 jmp .e1
;-1074         }

;-1075     if (istoken(T_MINUSMINUS)) {

.expr326:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr330
;-1076         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr331
 push expr_6
 call error1
 add  sp, 2
;-1077         prs("\n dec  ");

.expr331:
 push expr_7
 call prs
 add  sp, 2
;-1078         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr332
 push expr_8
 call prs
 add  sp, 2
 jmp .expr333
.expr332:
 push expr_9
 call prs
 add  sp, 2
;-1079         v(id1);

.expr333:
 push word [bp-4]
 call v
 add  sp, 2
;-1080         goto e1;

 jmp .e1
;-1081         }

;-1082 

;-1083     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr330:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr334
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1
;-1084     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr334:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr335
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1
;-1085     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr335:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr336
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1
;-1086     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr336:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1087     if (istoken(T_MULASS  )) error1("not implemented");

.expr337:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
 push expr_14
 call error1
 add  sp, 2
;-1088     if (istoken(T_DIVASS  )) error1("not implemented");

.expr338:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push expr_15
 call error1
 add  sp, 2
;-1089 

;-1090     if (istoken('=')) {

.expr339:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
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

.expr340:
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
 je .expr341
 push expr_17
 call rterm
 add  sp, 2
;-1098     else if (istoken('-')) rterm("sub");

 jmp .expr342
.expr341:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
 push expr_18
 call rterm
 add  sp, 2
;-1099     else if (istoken('&')) rterm("and");

 jmp .expr344
.expr343:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr345
 push expr_19
 call rterm
 add  sp, 2
;-1100     else if (istoken('|')) rterm("or" );

 jmp .expr346
.expr345:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr347
 push expr_20
 call rterm
 add  sp, 2
;-1101     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr348
.expr347:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr349
 push expr_21
 call rterm
 add  sp, 2
;-1102     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr350
.expr349:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr351
 push expr_22
 call rterm
 add  sp, 2
;-1103     else if (istoken('*')) domul (ids);

 jmp .expr352
.expr351:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr353
 push word [bp-10]
 call domul
 add  sp, 2
;-1104     else if (istoken('/')) doidiv(ids);

 jmp .expr354
.expr353:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1105     else if (istoken('%')) domod (ids);

 jmp .expr356
.expr355:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
 push word [bp-10]
 call domod
 add  sp, 2
;-1106     if (isrelational()) {

.expr357:
.expr356:
.expr354:
.expr352:
.expr350:
.expr348:
.expr346:
.expr344:
.expr342:
 call isrelational
 or  al, al
 je .expr358
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

.expr358:
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
;-1116     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr359
;-1117         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1118         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr360
;-1119             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1120             return;

 jmp .retnpexpr
;-1121             }

;-1122         }

.pexpr360:
;-1123     expr();

.pexpr359:
 call expr
;-1124     if (iscmp==0) prs("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr361
 push pexpr_0
 call prs
 add  sp, 2
;-1125     prs(fname);

.pexpr361:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1126     expect(')');

 push 41
 call expect
 add  sp, 2
;-1127 }

;-1128 

;-1129 

;-1130 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1131     prs("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
;-1132     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1133     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1134     prc(':');

 push 58
 call prc
 add  sp, 2
;-1135 }

;-1136 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1137     prs("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;300 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
;-1138     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1139     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1140 }

;-1141 

;-1142 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1143     int c; char cha;

;-1144     int jdest; int tst; int jtemp;

;-1145     if(istoken('{')) {

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
 je .stmt362
;-1146         while(istoken('}')==0) stmt();

.stmt363:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt364
 call stmt
;-1147         }

 jmp .stmt363
.stmt364:
;-1148     else if(istoken(T_IF)) {

 jmp .stmt365
.stmt362:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt366
;-1149         pexpr();

 call pexpr
;-1150         nlabel++;

 inc  word[nlabel]
;-1151         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1152         pint1(jdest);

 push word [bp-6]
 call pint1
 add  sp, 2
;-1153         stmt();

 call stmt
;-1154         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt367
;-1155             nlabel++;

 inc  word[nlabel]
;-1156             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1157             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1158             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1159             stmt();

 call stmt
;-1160             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1161         }

;-1162         else prlabel(jdest);

 jmp .stmt368
.stmt367:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1163     }

.stmt368:
;-1164     else if(istoken(T_DO)) {

 jmp .stmt369
.stmt366:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370
;-1165         nlabel++;

 inc  word[nlabel]
;-1166         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1167         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1168         stmt();

 call stmt
;-1169         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1170         pexpr();

 call pexpr
;-1171         nlabel++;

 inc  word[nlabel]
;-1172         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1173         pint1(jtemp);

 push word [bp-10]
 call pint1
 add  sp, 2
;-1174         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1175          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1176     }

;-1177     else if(istoken(T_WHILE)) {

 jmp .stmt371
.stmt370:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372
;-1178         nlabel++;

 inc  word[nlabel]
;-1179         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1180         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1181         pexpr();

 call pexpr
;-1182         nlabel++;

 inc  word[nlabel]
;-1183         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1184         pint1(tst);

 push word [bp-8]
 call pint1
 add  sp, 2
;-1185         stmt();

 call stmt
;-1186         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1187         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1188     }

;-1189     else if(istoken(T_GOTO))  {

 jmp .stmt373
.stmt372:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt374
;-1190         prs("\n jmp .");

 push stmt_0
 call prs
 add  sp, 2
;-1191         name1();

 call name1
;-1192         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1193         expect(';');

 push 59
 call expect
 add  sp, 2
;-1194     }

;-1195     else if(token==T_ASM)     {

 jmp .stmt375
.stmt374:
 mov ax, [token]
 cmp ax, 518
 jne .stmt376
;-1196       prs("\n");

 push stmt_1
 call prs
 add  sp, 2
;-1197       c=next();

 call next
 mov [bp-2], ax
;-1198       while(c != '\n') {

.stmt377:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt378
;-1199         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1200         c=next();

 call next
 mov [bp-2], ax
;-1201         };

 jmp .stmt377
.stmt378:
;-1202         token=getlex();

 call getlex
 mov word [token], ax
;-1203     }

;-1204     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt379
.stmt376:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt380
;-1205         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt381
;-1206             prs("\n"); cha=next();

 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al
;-1207             while(cha!= '}') {

.stmt382:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt383
;-1208                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1209                 cha=next();

 call next
 mov [bp-4], al
;-1210             }

;-1211             token=getlex();

 jmp .stmt382
.stmt383:
 call getlex
 mov word [token], ax
;-1212         } else error1("Curly open expected");

 jmp .stmt384
.stmt381:
 push stmt_3
 call error1
 add  sp, 2
;-1213     }

.stmt384:
;-1214     else if(istoken(T_INTH))  {

 jmp .stmt385
.stmt380:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt386
;-1215         prs("\n int  ");

 push stmt_4
 call prs
 add  sp, 2
;-1216         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1217         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1218         expect(';');

 push 59
 call expect
 add  sp, 2
;-1219     }

;-1220     else if(istoken(T_EMIT)) {

 jmp .stmt387
.stmt386:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt388
;-1221       prs("\n db ");

 push stmt_5
 call prs
 add  sp, 2
;-1222     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1223       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1224       token=getlex();

 call getlex
 mov word [token], ax
;-1225       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt389
;-1226           prc(',');

 push 44
 call prc
 add  sp, 2
;-1227           goto L1;

 jmp .L1
;-1228       }

;-1229       expect(')');

.stmt389:
 push 41
 call expect
 add  sp, 2
;-1230     }

;-1231     else if(istoken(';'))      { }

 jmp .stmt390
.stmt388:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt391
;-1232     else if(istoken(T_RETURN)) {

 jmp .stmt392
.stmt391:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt393
;-1233         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt394
 call expr
;-1234         prs("\n jmp .retn");

.stmt394:
 push stmt_6
 call prs
 add  sp, 2
;-1235         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1236         nreturn++;

 inc  word[nreturn]
;-1237         expect(';');

 push 59
 call expect
 add  sp, 2
;-1238     }

;-1239     else if(thechar==':')      {

 jmp .stmt395
.stmt393:
 mov al, [thechar]
 cmp al, 58
 jne .stmt396
;-1240         prs("\n."); // Label

 push stmt_7
 call prs
 add  sp, 2
;-1241         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1242         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1243         expect(':');

 push 58
 call expect
 add  sp, 2
;-1244     }

;-1245     else  {expr();; expect(';'); }

 jmp .stmt397
.stmt396:
 call expr
 push 59
 call expect
 add  sp, 2
;-1246 }

.stmt397:
.stmt395:
.stmt392:
.stmt390:
.stmt387:
.stmt385:
.stmt379:
.stmt375:
.stmt373:
.stmt371:
.stmt369:
.stmt365:
;-1247 

;-1248 int isvariable() {

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
;-1249     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable398
 jmp .v1
;-1250     if(token==T_UNSIGNED) goto v1;

.isvariable398:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable399
 jmp .v1
;-1251     if(token==T_CHAR)     goto v1;

.isvariable399:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable400
 jmp .v1
;-1252     if(token==T_INT)      goto v1;

.isvariable400:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable401
 jmp .v1
;-1253     if(token==T_LONG)     goto v1;

.isvariable401:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable402
 jmp .v1
;-1254     return 0;

.isvariable402:
 mov ax, 0
 jmp .retnisvariable
;-1255 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1256 }

;-1257 

;-1258 //***************************************************************

;-1259 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1260     unsigned int j;

;-1261     char c;

;-1262     prs("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;300 var unsg word i = bp+4
;301 var unsg word j = bp-2
;302 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call prs
 add  sp, 2
;-1263     prunsign1(i);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1264     prc(32);

 push 32
 call prc
 add  sp, 2
;-1265     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1266     if(c=='V')prs("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar403
 push listvar_1
 call prs
 add  sp, 2
;-1267     if(c=='*')prs("ptr ");

.listvar403:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar404
 push listvar_2
 call prs
 add  sp, 2
;-1268     if(c=='&')prs("arr ");

.listvar404:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar405
 push listvar_3
 call prs
 add  sp, 2
;-1269     if(c=='#')prs("def ");

.listvar405:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar406
 push listvar_4
 call prs
 add  sp, 2
;-1270     c=GSign [i];

.listvar406:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1271     if(c=='S')prs("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar407
 push listvar_5
 call prs
 add  sp, 2
;-1272     if(c=='U')prs("unsg ");

.listvar407:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar408
 push listvar_6
 call prs
 add  sp, 2
;-1273     c=GWidth[i];

.listvar408:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1274     if(c== 0)prs("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar409
 push listvar_7
 call prs
 add  sp, 2
;-1275     if(c== 1)prs("byte " );

.listvar409:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar410
 push listvar_8
 call prs
 add  sp, 2
;-1276     if(c== 2)prs("word " );

.listvar410:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar411
 push listvar_9
 call prs
 add  sp, 2
;-1277     if(c== 4)prs("long " );

.listvar411:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar412
 push listvar_10
 call prs
 add  sp, 2
;-1278     j=i*32;

.listvar412:
 mov ax, [bp+4]
 mov bx, 32
 mul bx
 mov [bp-2], ax
;-1279     pt=&GNameField + j;

 mov ax, GNameField
 add ax, [bp-2]
 mov word [pt], ax
;-1280     prs(pt);

 push word [pt]
 call prs
 add  sp, 2
;-1281     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar413
;-1282         prc('=');

 push 61
 call prc
 add  sp, 2
;-1283         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1284         prunsign1(j);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1285     }

;-1286     if(GType[i]=='&') {

.listvar413:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar414
;-1287         prc('[');

 push 91
 call prc
 add  sp, 2
;-1288         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1289         prunsign1(j);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1290         prc(']');

 push 93
 call prc
 add  sp, 2
;-1291     }

;-1292     if (i >= LSTART) {

.listvar414:
 mov ax, [bp+4]
 cmp ax, 300 ;unsigned : 0
 jb  .listvar415
;-1293         prs(" = bp");

 push listvar_11
 call prs
 add  sp, 2
;-1294         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1295         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar416
 push 43
 call prc
 add  sp, 2
;-1296         pint1(j);

.listvar416:
 push word [bp-2]
 call pint1
 add  sp, 2
;-1297     }

;-1298 }

.listvar415:
;-1299 

;-1300 int listproc() {

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
;-1301     int i;

;-1302     if (LTop > LSTART) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;300 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 300
 jle .listproc417
;-1303         prs("\n;Function : ");

 push listproc_0
 call prs
 add  sp, 2
;-1304         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1305         prs(", Number local Var: ");

 push listproc_1
 call prs
 add  sp, 2
;-1306         i=LTop - LSTART;

 mov ax, [LTop]
 sub ax, 300
 mov [bp-2], ax
;-1307         prunsign1(i);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1308         prs("\n; # type sign width local variables");

 push listproc_2
 call prs
 add  sp, 2
;-1309         i=LSTART;

 mov ax, 300
 mov [bp-2], ax
;-1310         while (i < LTop) {

.listproc418:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc419
;-1311             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1312             i++;

 inc  word[bp-2]
;-1313         }

;-1314     }

 jmp .listproc418
.listproc419:
;-1315 }

.listproc417:
;-1316 

;-1317 int dofunc() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

dofunc: PROC
;-1318     int nloc; int i; unsigned int j;int narg;

;-1319     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;300 var sign word nloc = bp-2
;301 var sign word i = bp-4
;302 var unsg word j = bp-6
;303 var sign word narg = bp-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1320     checknamelen();

 call checknamelen
;-1321     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1322     i=0;

 mov ax, 0
 mov [bp-4], ax
;-1323     while (i < FTop) {

.dofunc420:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc421
;-1324         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax
;-1325         if(eqstr(symbol, j)) error1("Function already defined");

 push word [bp-6]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dofunc422
 push dofunc_0
 call error1
 add  sp, 2
;-1326         i++;

.dofunc422:
 inc  word[bp-4]
;-1327     }

;-1328     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc420
.dofunc421:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc423
 push dofunc_1
 call error1
 add  sp, 2
;-1329     pt=adrF(FNameField, FTop);

.dofunc423:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1330     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1331     FTop++;

 inc  word[FTop]
;-1332     prs("\n\n");

 push dofunc_2
 call prs
 add  sp, 2
;-1333     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1334     prs(": PROC");

 push dofunc_3
 call prs
 add  sp, 2
;-1335     expect('(');

 push 40
 call expect
 add  sp, 2
;-1336     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1337     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc424
;-1338         narg=2;

 mov ax, 2
 mov [bp-8], ax
;-1339         do {

.dofunc425:
;-1340             typeName();

 call typeName
;-1341             addlocal();

 call addlocal
;-1342             narg+=2;

 add  word[bp-8], 2
;-1343             GData[LTop]=narg;

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1344             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc426
 add  word[bp-8], 2
;-1345                 LTop++;

.dofunc426:
 inc  word[LTop]
;-1346                 }

;-1347         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc427
 jmp .dofunc425
.dofunc427:
;-1348         expect(')');

 push 41
 call expect
 add  sp, 2
;-1349         }

;-1350 

;-1351     expect('{'); /*body*/

.dofunc424:
 push 123
 call expect
 add  sp, 2
;-1352     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1353     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1354     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1355     while(isvariable()) {

.dofunc428:
 call isvariable
 or  al, al
 je .dofunc429
;-1356         do {

.dofunc430:
;-1357             typeName();

 call typeName
;-1358             checknamelen();

 call checknamelen
;-1359             addlocal();

 call addlocal
;-1360             nloc-=2;

 sub  word[bp-2], 2
;-1361             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc431
 sub  word[bp-2], 2
;-1362             GData[LTop]=nloc;

.dofunc431:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1363             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc432
;-1364                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1365                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1366                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1367                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1368                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1369                 nloc+=2;

 add  word[bp-2], 2
;-1370                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1371             }

;-1372             LTop++;

.dofunc432:
 inc  word[LTop]
;-1373         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc433
 jmp .dofunc430
.dofunc433:
;-1374         expect(';');

 push 59
 call expect
 add  sp, 2
;-1375     }

;-1376     listproc();

 jmp .dofunc428
.dofunc429:
 call listproc
;-1377     if (LTop>LSTART){

 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc434
;-1378         prs(";\n ENTER  ");

 push dofunc_4
 call prs
 add  sp, 2
;-1379         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1380         prunsign1 (nloc);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1381         prs(",0");

 push dofunc_5
 call prs
 add  sp, 2
;-1382         }

;-1383 

;-1384     while(istoken('}')==0)  stmt();

.dofunc434:
.dofunc435:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc436
 call stmt
;-1385 

;-1386     if (nreturn) {

 jmp .dofunc435
.dofunc436:
 mov ax, [nreturn]
 or  al, al
 je .dofunc437
;-1387             prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2
;-1388             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1389             prc(':');

 push 58
 call prc
 add  sp, 2
;-1390         }

;-1391     if (LTop > LSTART) prs("\n LEAVE");

.dofunc437:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc438
 push dofunc_7
 call prs
 add  sp, 2
;-1392     prs("\n ret");

.dofunc438:
 push dofunc_8
 call prs
 add  sp, 2
;-1393     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1394     prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-1395     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1396     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc439
 mov ax, [maxco1]
 mov word [maxco], ax
;-1397     prs("\nENDP");

.dofunc439:
 push dofunc_9
 call prs
 add  sp, 2
;-1398 }

;-1399 

;-1400 char doglobName[IDLENMAX];

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
;-1401 int doglob() {


doglob: PROC
;-1402     int i; int j; int isstrarr;

;-1403     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;300 var sign word i = bp-2
;301 var sign word j = bp-4
;302 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1404     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .doglob440
 push doglob_0
 call error1
 add  sp, 2
;-1405     if (iswidth == 0) error1("no VOID as var type");

.doglob440:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob441
 push doglob_1
 call error1
 add  sp, 2
;-1406     checknamelen();

.doglob441:
 call checknamelen
;-1407     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob442
 push doglob_2
 call error1
 add  sp, 2
;-1408     if (istoken('[')) {

.doglob442:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob443
;-1409         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1410         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob444
;-1411             prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2
;-1412             prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2
;-1413             prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1414             if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob445
 push doglob_5
 call prs
 add  sp, 2
;-1415             if (iswidth==2) prs(" resw ");

.doglob445:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob446
 push doglob_6
 call prs
 add  sp, 2
;-1416             if (iswidth==4) prs(" resd ");

.doglob446:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob447
 push doglob_7
 call prs
 add  sp, 2
;-1417             prunsign1(lexval);

.doglob447:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-1418             prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2
;-1419             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1420             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob448
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1421             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

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
;-1422             GData[GTop]=lexval;

.doglob449:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1423             expect(']');

 push 93
 call expect
 add  sp, 2
;-1424         }else {

 jmp .doglob450
.doglob444:
;-1425             expect(']');

 push 93
 call expect
 add  sp, 2
;-1426             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob451
 push doglob_9
 call error1
 add  sp, 2
;-1427             prs("\n");

.doglob451:
 push doglob_10
 call prs
 add  sp, 2
;-1428             prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1429             prs(" db ");

 push doglob_11
 call prs
 add  sp, 2
;-1430             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1431             strcpy(doglobName, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1432             expect('=');

 push 61
 call expect
 add  sp, 2
;-1433             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob452
;-1434                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1435                 prscomment(symbol);

 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
;-1436                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1437                 prs(",0");

 push doglob_12
 call prs
 add  sp, 2
;-1438                 i=strlen(symbol);

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1439                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1440                 }

;-1441             else if (istoken('{' )) {

 jmp .doglob453
.doglob452:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob454
;-1442                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1443                 do {

.doglob455:
;-1444                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob456
 push 44
 call prc
 add  sp, 2
;-1445                     expect(T_CONST);

.doglob456:
 push 257
 call expect
 add  sp, 2
;-1446                     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1447                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1448                     }

;-1449                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob457
 jmp .doglob455
.doglob457:
;-1450                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1451             }

;-1452         else error1("String or number array expected");

 jmp .doglob458
.doglob454:
 push doglob_13
 call error1
 add  sp, 2
;-1453         };

.doglob458:
.doglob453:
.doglob450:
;-1454     }else { //expect('=');

 jmp .doglob459
.doglob443:
;-1455         prs("\n");

 push doglob_14
 call prs
 add  sp, 2
;-1456         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1457         if (istype=='*') prs(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob460
 push doglob_15
 call prs
 add  sp, 2
;-1458         else {

 jmp .doglob461
.doglob460:
;-1459             if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob462
 push doglob_16
 call prs
 add  sp, 2
;-1460             else if (iswidth==2) prs(" dw ");

 jmp .doglob463
.doglob462:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob464
 push doglob_17
 call prs
 add  sp, 2
;-1461             else                 prs(" dd ");

 jmp .doglob465
.doglob464:
 push doglob_18
 call prs
 add  sp, 2
;-1462         }

.doglob465:
.doglob463:
;-1463     if(istoken('-')) prc('-');

.doglob461:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob466
 push 45
 call prc
 add  sp, 2
;-1464     if (istoken('=')) {

.doglob466:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob467
;-1465         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1466         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1467         }else prunsign1(0);

 jmp .doglob468
.doglob467:
 push 0
 call prunsign1
 add  sp, 2
;-1468     }

.doglob468:
;-1469     GSign[GTop]=issign;

.doglob459:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1470     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1471     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1472     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1473     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob469
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1474         else strcpy(pt, symbol);

 jmp .doglob470
.doglob469:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1475     GTop++;

.doglob470:
 inc  word[GTop]
;-1476     expect(';');

 push 59
 call expect
 add  sp, 2
;-1477 }

;-1478 

;-1479 int dodefine() {

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
;-1480     int i; int j; int fdtemp;

;-1481     if (eqstr(symbol, "ORGDATA")) {

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
 je .dodefine471
;-1482         token=getlex();

 call getlex
 mov word [token], ax
;-1483         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1484         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1485         return;

 jmp .retndodefine
;-1486     }

;-1487     expect(T_NAME);

.dodefine471:
 push 256
 call expect
 add  sp, 2
;-1488     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine472
;-1489         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine473
 push dodefine_1
 call error1
 add  sp, 2
;-1490         i=strlen(symbol);

.dodefine473:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1491         if (i>IDLENMAX) error1("Define name too long");

 mov ax, [bp-2]
 cmp ax, 31
 jle .dodefine474
 push dodefine_2
 call error1
 add  sp, 2
;-1492         GSign [GTop]='U';

.dodefine474:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1493         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1494         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1495         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1496         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1497         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1498         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1499         GTop++;

 inc  word[GTop]
;-1500     }

;-1501 }

.dodefine472:
;-1502 

;-1503 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name too long",0
ENDP

parse: PROC
;-1504     token=getlex();

 call getlex
 mov word [token], ax
;-1505     do {

.parse475:
;-1506         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse476
 mov ax, 1
 jmp .retnparse
;-1507         if (istoken('#')) {

.parse476:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse477
;-1508              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse478
 call dodefine
;-1509              else error1("define expected");

 jmp .parse479
.parse478:
 push parse_0
 call error1
 add  sp, 2
;-1510         }

.parse479:
;-1511     else{

 jmp .parse480
.parse477:
;-1512         typeName();

 call typeName
;-1513         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse481
 call dofunc
;-1514         else doglob(); }

 jmp .parse482
.parse481:
 call doglob
.parse482:
;-1515     } while(1);

.parse480:
 mov ax, 1
 or  al, al
 je .parse483
 jmp .parse475
.parse483:
;-1516 }

;-1517 

;-1518 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1519 int main() {


main: PROC
;-1520     int arglen1; unsigned int i; char *c;

;-1521     isPrint=1;

;Function : main, Number local Var: 3
; # type sign width local variables
;300 var sign word arglen1 = bp-2
;301 var unsg word i = bp-4
;302 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1522     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1523     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main484
;-1524         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1525         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1526         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1527         }

;-1528     i=arglen1+129;

.main484:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1529     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1530     arglen1--;

 dec  word[bp-2]
;-1531     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1532     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1533     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

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
;-1534     strcpy(namelst, namein);

.main485:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1535     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1536     i--;

 dec  word[bp-4]
;-1537     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1538     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1539 

;-1540     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1541     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main486
;-1542         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1543         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1544         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1545         }

;-1546     fdout=creatR(namelst);

.main486:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1547     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main487
;-1548         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1549         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1550         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1551         }

;-1552     prs(";");

.main487:
 push main_4
 call prs
 add  sp, 2
;-1553     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2
;-1554     prs(", Input: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
;-1555     prs(", Output: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2
;-1556     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1557     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2
;-1558     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1559     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1560     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1561     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1562     parse();

 call parse
;-1563     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1564     GTop--;

 dec  word[GTop]
;-1565     prs("\n;Glob. variables:");     prunsign1(GTop);

 push main_8
 call prs
 add  sp, 2
 push word [GTop]
 call prunsign1
 add  sp, 2
;-1566     prs(" (");                      prunsign1(LSTART);

 push main_9
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1567     prs("), Functions:");           prunsign1(FTop);

 push main_10
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2
;-1568     prs(" (");                      prunsign1(FUNCMAX);

 push main_11
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1569     prs("), Lines:");               prunsign1(lineno);

 push main_12
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2
;-1570     prs("\n;Constant: ");           prunsign1(maxco);

 push main_13
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2
;-1571     prs(" (");                      prunsign1(COMAX);

 push main_14
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2
;-1572     i=COMAX;

 mov ax, 3000
 mov [bp-4], ax
;-1573     i=i-maxco;

 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1574     if (i <= 1000)prs("\n ** Warning ** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main488
 push main_15
 call prs
 add  sp, 2
;-1575     prs("), stacksize: ");

.main488:
 push main_16
 call prs
 add  sp, 2
;-1576     i=65536;

 mov ax, 0
 mov [bp-4], ax
;-1577     i=i-orgData;

 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1578     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1579     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main489
 push main_17
 call prs
 add  sp, 2
;-1580     end1(0);

.main489:
 push 0
 call end1
 add  sp, 2
;-1581 }

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
;Glob. variables:101 (300), Functions:73 (300), Lines:1582
;Constant: 688 (3000), stacksize: 12506