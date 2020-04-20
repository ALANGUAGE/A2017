;PLA compiler A.COM V1.0, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA compiler A.COM V1.0";//todo:op=reg not recognized

Version1 db "PLA compiler A.COM V1.0",0
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
;-40 #define ORGDATA     20000//set it to end of text

;-41 unsigned int orgDataOriginal=20000;//must be ORGDATA

orgDataOriginal dw 20000
;-42 unsigned int orgDatai;//actual max of array, must be less than stack

orgDatai dw 0
;-43 #define COMAX        3000

;-44 char co[COMAX];//constant storage

section .bss
absolute 20000
co resb 3000
section .text
;-45 int maxco=0;

maxco dw 0
;-46 int maxco1=0;

maxco1 dw 0
;-47 #define CMDLENMAX      67

;-48 char Symbol[COLUMNMAX];

section .bss
absolute 23000
Symbol resb 128
section .text
;-49 char fname[CMDLENMAX];

section .bss
absolute 23128
fname resb 67
section .text
;-50 char namein[CMDLENMAX];

section .bss
absolute 23195
namein resb 67
section .text
;-51 char namelst[CMDLENMAX];

section .bss
absolute 23262
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

;-68 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 23329
GType resb 400
section .text
;-69 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 23729
GSign resb 400
section .text
;-70 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 24129
GWidth resb 400
section .text
;-71 int  GData [VARMAX];

section .bss
absolute 24529
GData resw 400
section .text
;-72 #define VARNAMESMAX 4000//VARMAX * 10 - IDLENMAX

;-73 char VarNames[VARNAMESMAX];//Space for global and local var names

section .bss
absolute 25329
VarNames resb 4000
section .text
;-74 char *VarNamePtr;   //first free position

VarNamePtr dw 0
;-75 int GTop=1;         //0 = empty

GTop dw 1
;-76 // int LStart=1  ;     //max global var

;-77 int LTop=1;

LTop dw 1
;-78 

;-79 #define FUNCMAX       300//max functions

;-80 #define FUNCTIONNAMESMAX 3000//Space for preceeding functon names

;-81 char FunctionNames[FUNCTIONNAMESMAX];

section .bss
absolute 29329
FunctionNames resb 3000
section .text
;-82 char *FunctionNamePtr;  //first free position in FunctionNames

FunctionNamePtr dw 0
;-83 int  FunctionMaxIx=0;   //number of functions

FunctionMaxIx dw 0
;-84 

;-85 char fgetsdest[COLUMNMAX];

section .bss
absolute 32329
fgetsdest resb 128
section .text
;-86 unsigned char *fgetsp=0;

fgetsp dw 0
;-87 unsigned int lineno=1;

lineno dw 1
;-88 unsigned char *pt=0;

pt dw 0
;-89 unsigned char *p1=0;

p1 dw 0
;-90 int DOS_ERR=0;

DOS_ERR dw 0
;-91 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-92 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-93 int ireg1;

ireg1 dw 0
;-94 int mod2;

mod2 dw 0
;-95 int ireg2;

ireg2 dw 0
;-96 

;-97 int writetty()     {//char in AL


writetty: PROC
;-98     ah=0x0E;

 mov  ah, 14
;-99     asm push bx

 push bx
;-100     bx=0;     //page in BH

 mov  bx, 0
;-101     inth 0x10;

 int  16
;-102     asm pop bx

 pop bx
;-103 }

;-104 int putch(char c)  {

 ret
ENDP

putch: PROC
;-105     if (c==10)  {// LF

;Function : putch, Number local Var: 1
; # type sign width local variables
;94 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-106         al=13;   // CR, write CR first and then LF

 mov  al, 13
;-107         writetty();

 call writetty
;-108     }

;-109     al=c;

.putch1:
 mov  al, [bp+4]
;-110     writetty();

 call writetty
;-111 }

;-112 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-113     char c;

;-114     while(*s) {

;Function : cputs, Number local Var: 2
; # type sign width local variables
;94 ptr sign byte s = bp+4
;95 var sign byte c = bp-2;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
;-115         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-116         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-117         s++;

 inc  word[bp+4]
;-118     }

;-119 }

 jmp .cputs2
.cputs3:
;-120 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-121     n; // ax=n;

;Function : mkneg, Number local Var: 1
; # type sign width local variables
;94 var sign word n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
;-122     asm neg ax

 neg ax
;-123 }

;-124 

;-125 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-126     inth 0x21;

 int  33
;-127     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-128     DOS_ERR++;

 inc  word[DOS_ERR]
;-129 }

;-130 int openR (char *s) {

 ret
ENDP

openR: PROC
;-131 	dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;94 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-132     ax=0x3D02;

 mov  ax, 15618
;-133     DosInt();

 call DosInt
;-134 }

;-135 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-136     dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;94 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-137     cx=0;

 mov  cx, 0
;-138     ax=0x3C00;

 mov  ax, 15360
;-139     DosInt();

 call DosInt
;-140 }

;-141 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-142     bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;94 var sign word fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
;-143     ax=0x3E00;

 mov  ax, 15872
;-144     DosInt();

 call DosInt
;-145 }

;-146 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-147     ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;94 var sign byte c = bp+4;
 ENTER  0,0
 mov  ah, 76
;-148     al=c;

 mov  al, [bp+4]
;-149     DosInt();

 call DosInt
;-150 }

;-151 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-152     dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;94 ptr sign byte s = bp+4
;95 var sign word fd = bp+6
;96 var sign word len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
;-153     cx=len;

 mov  cx, [bp+8]
;-154     bx=fd;

 mov  bx, [bp+6]
;-155     ax=0x3F00;

 mov  ax, 16128
;-156     DosInt();

 call DosInt
;-157 }

;-158 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-159     asm lea dx, [bp+4]; *n  todo: why not mov

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;94 ptr sign byte n = bp+4
;95 var sign word fd = bp+6;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov
;-160     asm mov cx, 1;      cx=1;

 mov cx, 1;      cx=1;
;-161     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-162     asm mov ax, 16384;  ax=0x4000;

 mov ax, 16384;  ax=0x4000;
;-163     DosInt();

 call DosInt
;-164 }

;-165 

;-166 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-167       if (c=='_') return 1;

;Function : letter, Number local Var: 1
; # type sign width local variables
;94 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-168       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-169       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-170       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-171       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-172       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-173       if (c> 'Z') { if (c< 'a') return 0; }

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
;-174       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-175 }

;-176 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-177       if(c<'0') return 0;

;Function : digit, Number local Var: 1
; # type sign width local variables
;94 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-178       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-179       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-180 }

;-181 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-182     if (digit (c)) return 1;

;Function : alnum, Number local Var: 1
; # type sign width local variables
;94 var sign byte c = bp+4;
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
;-183     if (letter(c)) return 1;

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
;-184     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-185 }

;-186 

;-187 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-188     c=0;

;Function : strlen, Number local Var: 2
; # type sign width local variables
;94 ptr sign byte s = bp+4
;95 var sign word c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-189     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-190     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-191 }

;-192 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-193     do { *s=*t; s++; t++; }

;Function : strcpy, Number local Var: 2
; # type sign width local variables
;94 ptr sign byte s = bp+4
;95 ptr sign byte t = bp+6;
 ENTER  0,0
.strcpy18:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]
;-194     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-195     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-196     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-197 }

;-198 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-199     while(*p) {

;Function : eqstr, Number local Var: 2
; # type sign width local variables
;94 ptr sign byte p = bp+4
;95 ptr sign byte q = bp+6;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21
;-200         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-201         p++;

.eqstr22:
 inc  word[bp+4]
;-202         q++;

 inc  word[bp+6]
;-203     }

;-204     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-205     return 1;

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-206 }

;-207 int strcat(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat: PROC
;-208     while (*s != 0) s++;

;Function : strcat, Number local Var: 2
; # type sign width local variables
;94 ptr sign byte s = bp+4
;95 ptr sign byte t = bp+6;
 ENTER  0,0
.strcat24:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat25
 inc  word[bp+4]
;-209     strcpy(s, t);

 jmp .strcat24
.strcat25:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-210 }

;-211 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-212     while(*s) {

;Function : toupper, Number local Var: 1
; # type sign width local variables
;94 ptr sign byte s = bp+4;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27
;-213         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-214         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-215     }

;-216 }

 jmp .toupper26
.toupper27:
;-217 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-218     while(*s) {

;Function : instr1, Number local Var: 2
; # type sign width local variables
;94 ptr sign byte s = bp+4
;95 var sign byte c = bp+6;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131
;-219         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-220         s++;

.instr132:
 inc  word[bp+4]
;-221     }

;-222     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-223 }

;-224 

;-225 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-226     *cloc=c;

;Function : eprc, Number local Var: 1
; # type sign width local variables
;94 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-227     cloc++;

 inc  word[cloc]
;-228 }

;-229 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-230     char c;

;-231     while(*s) {

;Function : eprs, Number local Var: 2
; # type sign width local variables
;94 ptr sign byte s = bp+4
;95 var sign byte c = bp-2;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34
;-232         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-233         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-234         s++;

 inc  word[bp+4]
;-235     }

;-236 }

 jmp .eprs33
.eprs34:
;-237 

;-238 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-239     if (isPrint) {

;Function : prc, Number local Var: 1
; # type sign width local variables
;94 var unsg byte c = bp+4;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-240         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-241             asm mov ax, 13

 mov ax, 13
;-242             writetty();

 call writetty
;-243         }

;-244         asm mov al, [bp+4]; al=c;

.prc36:
 mov al, [bp+4]; al=c;
;-245         writetty();

 call writetty
;-246     }

;-247     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-248 }

;-249 

;-250 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-251     unsigned char c;

;-252     while(*s){

;Function : prscomment, Number local Var: 2
; # type sign width local variables
;94 ptr unsg byte s = bp+4
;95 var unsg byte c = bp-2;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38
;-253         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-254         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-255         s++;

 inc  word[bp+4]
;-256     }

;-257 }

 jmp .prscomment37
.prscomment38:
;-258 

;-259 int printstring(unsigned char *s) {

 LEAVE
 ret
ENDP

printstring: PROC
;-260     unsigned char c; int com;

;-261     com=0;

;Function : printstring, Number local Var: 3
; # type sign width local variables
;94 ptr unsg byte s = bp+4
;95 var unsg byte c = bp-2
;96 var sign word com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-262     while(*s) {

.printstring39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .printstring40
;-263         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-264         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .printstring41
 mov ax, [bp-4]
 or  al, al
 je .printstring42
 mov ax, 0
 mov [bp-4], ax
;-265                    else com=1;

 jmp .printstring43
.printstring42:
 mov ax, 1
 mov [bp-4], ax
;-266         if (c==92) {

.printstring43:
.printstring41:
 mov al, [bp-2]
 cmp al, 92
 jne .printstring44
;-267             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .printstring45
;-268                 s++;

 inc  word[bp+4]
;-269                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-270                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .printstring46
 mov ax, 10
 mov [bp-2], al
;-271                 if (c=='t') c= 9;

.printstring46:
 mov al, [bp-2]
 cmp al, 116
 jne .printstring47
 mov ax, 9
 mov [bp-2], al
;-272             }

.printstring47:
;-273         }

.printstring45:
;-274         prc(c);

.printstring44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-275         s++;

 inc  word[bp+4]
;-276     }

;-277 }

 jmp .printstring39
.printstring40:
;-278 

;-279 int eprnum(int n){//for docall procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-280     int e;

;-281     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;94 var sign word n = bp+4
;95 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-282         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-283         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-284     }

;-285     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-286         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-287         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-288     }

;-289     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-290     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-291     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-292 }

;-293 

;-294 int printinteger (int n){

 LEAVE
 ret
ENDP

printinteger: PROC
;-295     int e;

;-296     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : printinteger, Number local Var: 2
; # type sign width local variables
;94 var sign word n = bp+4
;95 var sign word e = bp-2;
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
;-297     if (n >= 10) {

.printinteger50:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .printinteger51
;-298         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-299         printinteger(e);

 push word [bp-2]
 call printinteger
 add  sp, 2
;-300     }

;-301     n=n%10;

.printinteger51:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-302     n += '0';

 add  word[bp+4], 48
;-303     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-304 }

;-305 

;-306 int printunsigned(unsigned int n) {

 LEAVE
 ret
ENDP

printunsigned: PROC
;-307     unsigned int e;

;-308     if (n >= 10) {

;Function : printunsigned, Number local Var: 2
; # type sign width local variables
;94 var unsg word n = bp+4
;95 var unsg word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .printunsigned52
;-309         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-310         printunsigned(e);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-311     }

;-312     n = n % 10; /*unsigned mod*/

.printunsigned52:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-313     n += '0';

 add  word[bp+4], 48
;-314     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-315 }

;-316 

;-317 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-318     fcloseR(fdin);

;Function : end1, Number local Var: 1
; # type sign width local variables
;94 var sign word n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-319     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-320     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-321 }

;-322 

;-323 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-324     isPrint=1;

;Function : error1, Number local Var: 1
; # type sign width local variables
;94 ptr sign byte s = bp+4;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-325     lineno--;

 dec  word[lineno]
;-326     printstring("\n ");

 push error1_0
 call printstring
 add  sp, 2
;-327     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-328     printstring(";Line: ");

 push error1_1
 call printstring
 add  sp, 2
;-329     printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-330     printstring(" ************** ERROR: ");

 push error1_2
 call printstring
 add  sp, 2
;-331     printstring(s);

 push word [bp+4]
 call printstring
 add  sp, 2
;-332     printstring("  in column: ");

 push error1_3
 call printstring
 add  sp, 2
;-333     printunsigned(column);

 push word [column]
 call printunsigned
 add  sp, 2
;-334     printstring("\nToken: ");

 push error1_4
 call printstring
 add  sp, 2
;-335     printunsigned(token);

 push word [token]
 call printunsigned
 add  sp, 2
;-336     printstring(", Symbol: ");

 push error1_5
 call printstring
 add  sp, 2
;-337     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-338     end1(1);

 push 1
 call end1
 add  sp, 2
;-339 }

;-340 

;-341 int printinputline() {

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
;-342     int col;

;-343     col=0;

;Function : printinputline, Number local Var: 1
; # type sign width local variables
;94 var sign word col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-344     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-345     do {

.printinputline53:
;-346         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-347         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-348         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-349         fgetsp++;

 inc  word[fgetsp]
;-350         col++;

 inc  word[bp-2]
;-351         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-352         }

.printinputline55:
;-353         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-354     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-355         printstring("\n;-");

 push printinputline_1
 call printstring
 add  sp, 2
;-356         printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-357         prc(' ');

 push 32
 call prc
 add  sp, 2
;-358         lineno++;

 inc  word[lineno]
;-359         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-360 }

;-361 

;-362 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-363     char c;

;-364     c=*fgetsp;

;Function : fgets1, Number local Var: 1
; # type sign width local variables
;94 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-365     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-366         printinputline();

 call printinputline
;-367         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-368         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-369         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-370         column=0;

 mov ax, 0
 mov word [column], ax
;-371     }

;-372     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-373     column++;

 inc  word[column]
;-374     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-375 }

;-376 

;-377 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-378     char r;

;-379     r = thechar;

;Function : next, Number local Var: 1
; # type sign width local variables
;94 var sign byte r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-380     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-381     return r;

 mov al, [bp-2]
 jmp .retnnext
;-382 }

;-383 

;-384 int storeVarName() {

 .retnnext:
 LEAVE
 ret
ENDP

storeVarName: PROC
;-385     unsigned int i;

;-386     VarNamePtr=strcpy(VarNamePtr, Symbol);

;Function : storeVarName, Number local Var: 1
; # type sign width local variables
;94 var unsg word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 push word [VarNamePtr]
 call strcpy
 add  sp, 4
 mov word [VarNamePtr], ax
;-387     VarNamePtr++;

 inc  word[VarNamePtr]
;-388     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-389     i += IDLENMAX;

 add  word[bp-2], 31
;-390     if (i > VARNAMESMAX) error1("too many variable names");

 mov ax, [bp-2]
 cmp ax, 4000
 jle .storeVarName59
 push storeVarName_0
 call error1
 add  sp, 2
;-391 }

.storeVarName59:
;-392 /*

;-393 int searchVarName() {

;-394 	char *p; int i;

;-395 	p = &VarNames;

;-396 	i=1;//start with 1

;-397 	while (i < VARMAX) {

;-398 		if (eqstr(p, Symbol)) return i;

;-399 		p=strlen(p) + p;

;-400 		p++;

;-401 		i++;

;-402 	}

;-403 	return 0;		

;-404 }

;-405 */	

;-406 int getVarName(unsigned int i) {

 LEAVE
 ret
storeVarName_0 db "too many variable names",0
ENDP

getVarName: PROC
;-407 	int j; char *p;

;-408 	j = 1;

;Function : getVarName, Number local Var: 3
; # type sign width local variables
;94 var unsg word i = bp+4
;95 var sign word j = bp-2
;96 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, 1
 mov [bp-2], ax
;-409 	p = &VarNames;

 mov ax, VarNames
 mov [bp-4], ax
;-410 	while (j < i) {

.getVarName60:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 jge .getVarName61
;-411 		while (*p) p++;

.getVarName62:
 mov bx, [bp-4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .getVarName63
 inc  word[bp-4]
;-412 		p++;

 jmp .getVarName62
.getVarName63:
 inc  word[bp-4]
;-413 		j++;	 		

 inc  word[bp-2]
;-414 	}

;-415 	return p;	

 jmp .getVarName60
.getVarName61:
 mov ax, [bp-4]
 jmp .retngetVarName
;-416 		

;-417 }

;-418 		

;-419 

;-420 int printName(unsigned int i) {

 .retngetVarName:
 LEAVE
 ret
ENDP

printName: PROC
;-421     if (i < GTop) {

;Function : printName, Number local Var: 1
; # type sign width local variables
;94 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .printName64
;-422 	    i=getVarName(i);	    

 push word [bp+4]
 call getVarName
 add  sp, 2
 mov [bp+4], ax
;-423         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-424     }

;-425     else {

 jmp .printName65
.printName64:
;-426         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-427         i = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp+4], ax
;-428         if (i>0) prc('+');

 mov ax, [bp+4]
 cmp ax, 0
 jle .printName66
 push 43
 call prc
 add  sp, 2
;-429         printinteger(i);

.printName66:
 push word [bp+4]
 call printinteger
 add  sp, 2
;-430         prc(']');

 push 93
 call prc
 add  sp, 2
;-431     }

;-432 }

.printName65:
;-433 

;-434 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-435     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;94 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL67
 mov ax, 1
 jmp .retnifEOL
;-436     if (c == 13) {//CR

.ifEOL67:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL68
;-437         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL69
 call next
 mov [bp+4], al
;-438         return 1;

.ifEOL69:
 mov ax, 1
 jmp .retnifEOL
;-439     }

;-440     return 0;

.ifEOL68:
 mov ax, 0
 jmp .retnifEOL
;-441 }

;-442 

;-443 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 32457
symboltemp resb 80
section .text
;-444 

;-445 int getlex() {


getlex: PROC
;-446     char c; char *p;

;-447     int i; int j;

;-448 g1: c=next();

;Function : getlex, Number local Var: 4
; # type sign width local variables
;95 var sign byte c = bp-2
;96 ptr sign byte p = bp-4
;97 var sign word i = bp-6
;98 var sign word j = bp-8;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-449     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex70
 mov ax, 0
 jmp .retngetlex
;-450     if (c <= ' ') goto g1;

.getlex70:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex71
 jmp .g1
;-451   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-452   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-453   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-454   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-455   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-456   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-457   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-458   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-459   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-460   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-461   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-462   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-463   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-464   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-465   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-466   if (c == '/') {

.getlex100:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex101
;-467       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex102
;-468           do c=next();

.getlex103:
 call next
 mov [bp-2], al
;-469           while(ifEOL(c)==0) return getlex();

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
;-470       }

;-471   }

.getlex102:
;-472   if (c == '/') {

.getlex101:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex105
;-473       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex106
;-474           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-475           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex107
 jmp .g2
;-476           if (thechar != '/') goto g2;

.getlex107:
 mov al, [thechar]
 cmp al, 47
 je  .getlex108
 jmp .g2
;-477           c=next();

.getlex108:
 call next
 mov [bp-2], al
;-478           return getlex();

 call getlex
 jmp .retngetlex
;-479       } else  return '/';

 jmp .getlex109
.getlex106:
 mov ax, 47
 jmp .retngetlex
;-480   }

.getlex109:
;-481   if (c == '"') {

.getlex105:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex110
;-482       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-483       c=next();

 call next
 mov [bp-2], al
;-484       while (c != '"') {

.getlex111:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex112
;-485           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-486           p++;

 inc  word[bp-4]
;-487           c=next();

 call next
 mov [bp-2], al
;-488           }

;-489           *p=0;

 jmp .getlex111
.getlex112:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-490       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-491   }

;-492   if (digit(c)) {

.getlex110:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex113
;-493       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-494       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-495       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex114
 mov ax, 88
 mov byte [thechar], al
;-496       if (thechar=='X') {

.getlex114:
 mov al, [thechar]
 cmp al, 88
 jne .getlex115
;-497           next();

 call next
;-498           while(alnum(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex117
;-499               c=next();

 call next
 mov [bp-2], al
;-500               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex118
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-501       	       if (c>64) c=c-7;

.getlex118:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex119
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-502                c=c-48;

.getlex119:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-503                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-504                i=0;

 mov ax, 0
 mov [bp-6], ax
;-505                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-506                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-507            }

;-508        }else {

 jmp .getlex116
.getlex117:
 jmp .getlex120
.getlex115:
;-509            while(digit(thechar)) {

.getlex121:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex122
;-510                c=next();

 call next
 mov [bp-2], al
;-511                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-512                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-513                i=0;

 mov ax, 0
 mov [bp-6], ax
;-514                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-515                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-516            }

;-517        }

 jmp .getlex121
.getlex122:
;-518       return T_CONST;

.getlex120:
 mov ax, 257
 jmp .retngetlex
;-519   }

;-520   if (c==39) {

.getlex113:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex123
;-521       lexval=next();

 call next
 mov word [lexval], ax
;-522       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex124
;-523           lexval=next();

 call next
 mov word [lexval], ax
;-524           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex125
 mov ax, 10
 mov word [lexval], ax
;-525           if (lexval=='t') lexval= 9;

.getlex125:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex126
 mov ax, 9
 mov word [lexval], ax
;-526           if (lexval=='0') lexval= 0;

.getlex126:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex127
 mov ax, 0
 mov word [lexval], ax
;-527       }

.getlex127:
;-528       next();

.getlex124:
 call next
;-529       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-530   }

;-531   if (alnum(c)) {

.getlex123:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex128
;-532     strcpy(symboltemp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-533     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-534     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-535     p++;

 inc  word[bp-4]
;-536     while(alnum(thechar)) {

.getlex129:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex130
;-537         c=next();

 call next
 mov [bp-2], al
;-538         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-539         p++;

 inc  word[bp-4]
;-540     }

;-541     *p=0;

 jmp .getlex129
.getlex130:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-542     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 531
 jmp .retngetlex
;-543     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

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
;-544     if (eqstr(Symbol,"void"    )) return T_VOID;

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
;-545     if (eqstr(Symbol,"int"     )) return T_INT;

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
;-546     if (eqstr(Symbol,"long"    )) return T_LONG;

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
;-547     if (eqstr(Symbol,"inth"    )) return T_INTH;

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
;-548     if (eqstr(Symbol,"char"    )) return T_CHAR;

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
;-549     if (eqstr(Symbol,"asm"     )) return T_ASM;

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
;-550     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

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
;-551     if (eqstr(Symbol,"__emit__")) return T_EMIT;

.getlex139:
 push getlex_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 520
 jmp .retngetlex
;-552     if (eqstr(Symbol,"return"  )) return T_RETURN;

.getlex140:
 push getlex_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 512
 jmp .retngetlex
;-553     if (eqstr(Symbol,"if"      )) return T_IF;

.getlex141:
 push getlex_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 513
 jmp .retngetlex
;-554     if (eqstr(Symbol,"else"    )) return T_ELSE;

.getlex142:
 push getlex_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 514
 jmp .retngetlex
;-555     if (eqstr(Symbol,"while"   )) return T_WHILE;

.getlex143:
 push getlex_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
 mov ax, 515
 jmp .retngetlex
;-556     if (eqstr(Symbol,"do"      )) return T_DO;

.getlex144:
 push getlex_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
 mov ax, 516
 jmp .retngetlex
;-557     if (eqstr(Symbol,"goto"    )) return T_GOTO;

.getlex145:
 push getlex_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex146
 mov ax, 521
 jmp .retngetlex
;-558     if (eqstr(Symbol,"define"  )) return T_DEFINE;

.getlex146:
 push getlex_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex147
 mov ax, 511
 jmp .retngetlex
;-559 

;-560     i=0;//convert define to value

.getlex147:
 mov ax, 0
 mov [bp-6], ax
;-561     while (i < GTop) {

.getlex148:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex149
;-562         j=getVarName(i);

 push word [bp-6]
 call getVarName
 add  sp, 2
 mov [bp-8], ax
;-563         if (eqstr(Symbol,j)) {

 push word [bp-8]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex150
;-564             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex151
;-565                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-566                 strcpy(Symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-567                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-568             }

;-569         }

.getlex151:
;-570         i++;

.getlex150:
 inc  word[bp-6]
;-571     }

;-572     return T_NAME; } 

 jmp .getlex148
.getlex149:
 mov ax, 256
 jmp .retngetlex
;-573     error1("Input item not recognized");

.getlex128:
 push getlex_18
 call error1
 add  sp, 2
;-574 }

;-575 

;-576 int istoken(int t) {

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
;-577     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;95 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken152
;-578         token=getlex();

 call getlex
 mov word [token], ax
;-579         return 1;

 mov ax, 1
 jmp .retnistoken
;-580     }

;-581     return 0;

.istoken152:
 mov ax, 0
 jmp .retnistoken
;-582 }

;-583 

;-584 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-585     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;95 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect153
;-586         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-587         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-588         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-589         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-590         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-591     }

;-592 }

.expect153:
;-593 

;-594 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-595     if (i < GTop) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;95 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v154
 push 91
 call prc
 add  sp, 2
;-596     printName(i);

.v154:
 push word [bp+4]
 call printName
 add  sp, 2
;-597     if (i < GTop) prc(']');

 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v155
 push 93
 call prc
 add  sp, 2
;-598 }

.v155:
;-599 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-600     int i;

;-601     i=strlen(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;95 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-602     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen156
 push checknamelen_0
 call error1
 add  sp, 2
;-603 }

.checknamelen156:
;-604 

;-605 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-606     unsigned int i; unsigned int j;

;-607     i=GTop;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;95 var unsg word i = bp-2
;96 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, [GTop]
 mov [bp-2], ax
;-608     while(i<LTop) {//todo look for local var first

.checkName157:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName158
;-609         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-610         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName159
 mov ax, [bp-2]
 jmp .retncheckName
;-611         i++;

.checkName159:
 inc  word[bp-2]
;-612     }

;-613     i=1;

 jmp .checkName157
.checkName158:
 mov ax, 1
 mov [bp-2], ax
;-614     while(i<GTop) {

.checkName160:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName161
;-615         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-616         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName162
 mov ax, [bp-2]
 jmp .retncheckName
;-617         i++;

.checkName162:
 inc  word[bp-2]
;-618     }

;-619     return 0;

 jmp .checkName160
.checkName161:
 mov ax, 0
 jmp .retncheckName
;-620 }

;-621 

;-622 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-623     unsigned int i;

;-624     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;95 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-625     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname163
 push searchname_0
 call error1
 add  sp, 2
;-626     return i;

.searchname163:
 mov ax, [bp-2]
 jmp .retnsearchname
;-627 }

;-628 

;-629 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-630     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1164
 push name1_0
 call error1
 add  sp, 2
;-631     token=getlex();

.name1164:
 call getlex
 mov word [token], ax
;-632 }

;-633 

;-634 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-635     int m; //0=V,1=*,2=&

;-636     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;95 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-637     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 83
 mov byte [issign], al
;-638     if(istoken(T_UNSIGNED)) issign='U';

.typeName165:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 85
 mov byte [issign], al
;-639     iswidth=2;

.typeName166:
 mov ax, 2
 mov byte [iswidth], al
;-640     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 0
 mov byte [iswidth], al
;-641     if(istoken(T_CHAR))     iswidth=1;

.typeName167:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName168
 mov ax, 1
 mov byte [iswidth], al
;-642     if(istoken(T_INT))      iswidth=2;

.typeName168:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName169
 mov ax, 2
 mov byte [iswidth], al
;-643     if(istoken(T_LONG))     iswidth=4;

.typeName169:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName170
 mov ax, 4
 mov byte [iswidth], al
;-644     istype='V';

.typeName170:
 mov ax, 86
 mov byte [istype], al
;-645     m=0;

 mov ax, 0
 mov [bp-2], ax
;-646     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName171
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-647     if(istoken('&'))  {istype='&'; m=2;}

.typeName171:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName172
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-648     name1();

.typeName172:
 call name1
;-649     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-650 }

;-651 

;-652 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-653     char c;

;-654     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;95 var sign word i = bp+4
;96 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-655     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes173
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes174
.gettypes173:
 mov ax, 0
 mov word [signi], ax
;-656     c=GWidth[i];

.gettypes174:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-657     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-658     wi=0;

 mov ax, 0
 mov word [wi], ax
;-659     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes175
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-660     if (c==2) {widthi=2;wi=2;}

.gettypes175:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes176
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-661     if (c==4) {widthi=4;wi=4;}

.gettypes176:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes177
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-662     c=GType [i];

.gettypes177:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-663     typei=0;

 mov ax, 0
 mov word [typei], ax
;-664     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes178
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-665     if (c=='&')  typei=2;

.gettypes178:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes179
 mov ax, 2
 mov word [typei], ax
;-666     return i;

.gettypes179:
 mov ax, [bp+4]
 jmp .retngettypes
;-667 }

;-668 

;-669 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-670     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal180
 push addlocal_0
 call error1
 add  sp, 2
;-671     if (checkName() != 0) error1("Variable already defined");

.addlocal180:
 call checkName
 cmp ax, 0
 je  .addlocal181
 push addlocal_1
 call error1
 add  sp, 2
;-672     GSign[LTop]=issign;

.addlocal181:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-673     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-674     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-675     pt=getVarName(LTop);

 push word [LTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-676     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-677     storeVarName();

 call storeVarName
;-678 }

;-679 

;-680 

;-681 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-682        if(iscmp==T_EQ) printstring("\n jne .");         //ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;95 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg182
 push cmpneg_0
 call printstring
 add  sp, 2
;-683   else if(iscmp==T_NE) printstring("\n je  .");         //ZF=1

 jmp .cmpneg183
.cmpneg182:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg184
 push cmpneg_1
 call printstring
 add  sp, 2
;-684   else if(iscmp==T_LE) if (ids) printstring("\n jg  .");//ZF=0 SF=O

 jmp .cmpneg185
.cmpneg184:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg186
 mov ax, [bp+4]
 or  al, al
 je .cmpneg187
 push cmpneg_2
 call printstring
 add  sp, 2
;-685                        else     printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg188
.cmpneg187:
 push cmpneg_3
 call printstring
 add  sp, 2
;-686   else if(iscmp==T_GE) if (ids){printstring(" ;unsigned : ");

.cmpneg188:
 jmp .cmpneg189
.cmpneg186:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg190
 mov ax, [bp+4]
 or  al, al
 je .cmpneg191
 push cmpneg_4
 call printstring
 add  sp, 2
;-687                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-688                                 printstring("\n jl  .");}//SF!=O

 push cmpneg_5
 call printstring
 add  sp, 2
;-689                        else    {printstring(" ;unsigned : ");

 jmp .cmpneg192
.cmpneg191:
 push cmpneg_6
 call printstring
 add  sp, 2
;-690                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-691                                 printstring("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call printstring
 add  sp, 2
;-692   else if(iscmp=='<' ) printstring("\n jge .");          //SF=O

.cmpneg192:
 jmp .cmpneg193
.cmpneg190:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg194
 push cmpneg_8
 call printstring
 add  sp, 2
;-693   else if(iscmp=='>' ) printstring("\n jle .");          //ZF=1 | SF!=O

 jmp .cmpneg195
.cmpneg194:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg196
 push cmpneg_9
 call printstring
 add  sp, 2
;-694   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg197
.cmpneg196:
 push cmpneg_10
 call error1
 add  sp, 2
;-695 }

.cmpneg197:
.cmpneg195:
.cmpneg193:
.cmpneg189:
.cmpneg185:
.cmpneg183:
;-696 

;-697 int isrelational() {

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
;-698     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational198
 jmp .w
;-699     if (token==T_NE) goto w;

.isrelational198:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational199
 jmp .w
;-700     if (token==T_LE) goto w;

.isrelational199:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational200
 jmp .w
;-701     if (token==T_GE) goto w;

.isrelational200:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational201
 jmp .w
;-702     if (token=='<' ) goto w;

.isrelational201:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational202
 jmp .w
;-703     if (token=='>' ) goto w;

.isrelational202:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational203
 jmp .w
;-704     return 0;

.isrelational203:
 mov ax, 0
 jmp .retnisrelational
;-705 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-706     token=getlex();

 call getlex
 mov word [token], ax
;-707     return 1;

 mov ax, 1
 jmp .retnisrelational
;-708 }

;-709 

;-710 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-711   if (strlen(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg204
 mov ax, 0
 jmp .retncheckreg
;-712   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

.checkreg204:
 push checkreg_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 1
 jmp .retncheckreg
.checkreg205:
 push checkreg_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 3
 jmp .retncheckreg
;-713   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

.checkreg206:
 push checkreg_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 5
 jmp .retncheckreg
.checkreg207:
 push checkreg_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 7
 jmp .retncheckreg
;-714   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

.checkreg208:
 push checkreg_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 9
 jmp .retncheckreg
.checkreg209:
 push checkreg_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 11
 jmp .retncheckreg
;-715   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

.checkreg210:
 push checkreg_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 13
 jmp .retncheckreg
.checkreg211:
 push checkreg_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 15
 jmp .retncheckreg
;-716   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

.checkreg212:
 push checkreg_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 17
 jmp .retncheckreg
.checkreg213:
 push checkreg_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 19
 jmp .retncheckreg
;-717   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

.checkreg214:
 push checkreg_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 21
 jmp .retncheckreg
.checkreg215:
 push checkreg_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 23
 jmp .retncheckreg
;-718   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

.checkreg216:
 push checkreg_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 25
 jmp .retncheckreg
.checkreg217:
 push checkreg_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 27
 jmp .retncheckreg
;-719   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

.checkreg218:
 push checkreg_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 29
 jmp .retncheckreg
.checkreg219:
 push checkreg_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 31
 jmp .retncheckreg
;-720   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

.checkreg220:
 push checkreg_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 33
 jmp .retncheckreg
.checkreg221:
 push checkreg_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 35
 jmp .retncheckreg
;-721   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

.checkreg222:
 push checkreg_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 37
 jmp .retncheckreg
.checkreg223:
 push checkreg_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 39
 jmp .retncheckreg
;-722   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

.checkreg224:
 push checkreg_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 41
 jmp .retncheckreg
.checkreg225:
 push checkreg_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 43
 jmp .retncheckreg
;-723   // (eqstr(Symbol,"ip")) return 45;

;-724   if (strlen(Symbol) >   3) return 0;

.checkreg226:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg227
 mov ax, 0
 jmp .retncheckreg
;-725   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

.checkreg227:
 push checkreg_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 47
 jmp .retncheckreg
.checkreg228:
 push checkreg_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 50
 jmp .retncheckreg
;-726   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

.checkreg229:
 push checkreg_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 53
 jmp .retncheckreg
.checkreg230:
 push checkreg_25
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 56
 jmp .retncheckreg
;-727   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

.checkreg231:
 push checkreg_26
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 59
 jmp .retncheckreg
.checkreg232:
 push checkreg_27
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 62
 jmp .retncheckreg
;-728   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

.checkreg233:
 push checkreg_28
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 65
 jmp .retncheckreg
.checkreg234:
 push checkreg_29
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg235
 mov ax, 68
 jmp .retncheckreg
;-729 //  if (eqstr(Symbol,"cr0")) return 71;

;-730   return 0;

.checkreg235:
 mov ax, 0
 jmp .retncheckreg
;-731 }

;-732 

;-733 char printregstr[]

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
;-734 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-735 

;-736 int printreg(int i) {


printreg: PROC
;-737     unsigned int k; unsigned char c;

;-738     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;96 var sign word i = bp+4
;97 var unsg word k = bp-2
;98 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-739     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-740     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-741     i++;

 inc  word[bp+4]
;-742     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-743     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-744     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-745     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg236
;-746         i++;

 inc  word[bp+4]
;-747         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-748         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-749         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-750         }

;-751 }

.printreg236:
;-752 

;-753 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 32537
ops resb 5
section .text
;-754 int doreg1(int iscmp1) {


doreg1: PROC
;-755     int i;

;-756     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;97 var sign word iscmp1 = bp+4
;98 var sign word i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1237
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-757     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1237:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1238
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-758     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1238:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1239
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-759     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1239:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1240
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-760     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1240:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1241
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-761     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1241:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1242
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-762     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1242:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1243
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-763     if (iscmp1 == 1) {

.doreg1243:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1244
;-764             token=getlex();

 call getlex
 mov word [token], ax
;-765             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1245
 push doreg1_7
 call error1
 add  sp, 2
;-766             strcpy(ops, "cmp");

.doreg1245:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-767         }

;-768     printstring("\n ");

.doreg1244:
 push doreg1_9
 call printstring
 add  sp, 2
;-769     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-770     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-771     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-772     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-773 

;-774     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1246
;-775         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-776         goto reg1;

 jmp .reg1
;-777         }

;-778     mod2=typeName();

.doreg1246:
 call typeName
 mov word [mod2], ax
;-779     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-780     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1247
;-781         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-782         goto reg1;

 jmp .reg1
;-783         }

;-784     i=searchname();

.doreg1247:
 call searchname
 mov [bp-2], ax
;-785     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1248
 push word [bp-2]
 call printName
 add  sp, 2
;-786         else v(i);

 jmp .doreg1249
.doreg1248:
 push word [bp-2]
 call v
 add  sp, 2
;-787 reg1: if (iscmp1 == 1) {

.doreg1249:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1250
;-788     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-789     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-790     expect(')');

 push 41
 call expect
 add  sp, 2
;-791     }

;-792 }

.doreg1250:
;-793 

;-794 int compoundass(char *op, int mode, int id1) {

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
;-795     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;97 ptr sign byte op = bp+4
;98 var sign word mode = bp+6
;99 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass251
 push compoundass_0
 call error1
 add  sp, 2
;-796     printstring("\n ");

.compoundass251:
 push compoundass_1
 call printstring
 add  sp, 2
;-797     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-798     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-799     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-800     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass252
 push compoundass_3
 call printstring
 add  sp, 2
;-801         else printstring("byte");

 jmp .compoundass253
.compoundass252:
 push compoundass_4
 call printstring
 add  sp, 2
;-802     v(id1);

.compoundass253:
 push word [bp+8]
 call v
 add  sp, 2
;-803     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-804     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-805     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-806 }

;-807 

;-808 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-809     gettypes(id1);

;Function : dovar1, Number local Var: 4
; # type sign width local variables
;97 var sign word mode = bp+4
;98 var sign word op = bp+6
;99 var sign word ixarr = bp+8
;100 var sign word id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-810     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1254
;-811         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-812         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-813         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-814         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1255
 push dovar1_2
 call printstring
 add  sp, 2
;-815         if(widthi == 2) printstring(" ax, [bx]");

.dovar1255:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1256
 push dovar1_3
 call printstring
 add  sp, 2
;-816         return;

.dovar1256:
 jmp .retndovar1
;-817         }

;-818     if (mode==2){// & = adr

.dovar1254:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1257
;-819         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-820         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-821         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-822         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-823         return;

 jmp .retndovar1
;-824         }

;-825     if (ixarr) {//array

.dovar1257:
 mov ax, [bp+8]
 or  al, al
 je .dovar1258
;-826         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-827         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-828         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1259
 push dovar1_7
 call printstring
 add  sp, 2
;-829         printstring("\n ");

.dovar1259:
 push dovar1_8
 call printstring
 add  sp, 2
;-830         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-831         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1260
 push dovar1_9
 call printstring
 add  sp, 2
;-832             else printstring(" al, ");

 jmp .dovar1261
.dovar1260:
 push dovar1_10
 call printstring
 add  sp, 2
;-833         prc('[');

.dovar1261:
 push 91
 call prc
 add  sp, 2
;-834         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-835         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-836         return;

 jmp .retndovar1
;-837         }

;-838     printstring("\n ");

.dovar1258:
 push dovar1_12
 call printstring
 add  sp, 2
;-839     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-840     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1262
 push dovar1_13
 call printstring
 add  sp, 2
;-841     if(wi==2) printstring(" ax, ");

.dovar1262:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1263
 push dovar1_14
 call printstring
 add  sp, 2
;-842     if(wi==4) printstring(" eax, ");

.dovar1263:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1264
 push dovar1_15
 call printstring
 add  sp, 2
;-843     v(id1);

.dovar1264:
 push word [bp+10]
 call v
 add  sp, 2
;-844 }

;-845 

;-846 int rterm(char *op) {

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
;-847     int mode; int opint; int ixarr; int id1;

;-848     if (istoken(T_CONST)) {

;Function : rterm, Number local Var: 5
; # type sign width local variables
;97 ptr sign byte op = bp+4
;98 var sign word mode = bp-2
;99 var sign word opint = bp-4
;100 var sign word ixarr = bp-6
;101 var sign word id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm265
;-849         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-850         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-851         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm266
 push rterm_1
 call printstring
 add  sp, 2
;-852         if (wi==2) printstring(" ax, ");

.rterm266:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm267
 push rterm_2
 call printstring
 add  sp, 2
;-853         if (wi==4) printstring(" eax, ");

.rterm267:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm268
 push rterm_3
 call printstring
 add  sp, 2
;-854         printunsigned(lexval);

.rterm268:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-855         return;

 jmp .retnrterm
;-856         }

;-857     mode=typeName();

.rterm265:
 call typeName
 mov [bp-2], ax
;-858     id1=searchname();

 call searchname
 mov [bp-8], ax
;-859     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-860     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm269
;-861         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-862         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-863         expect(']');

 push 93
 call expect
 add  sp, 2
;-864         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-865         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm270
 push rterm_4
 call error1
 add  sp, 2
;-866         }

.rterm270:
;-867     if (eqstr(Symbol,"ax")) return;

.rterm269:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm271
 jmp .retnrterm
;-868     opint=op;

.rterm271:
 mov ax, [bp+4]
 mov [bp-4], ax
;-869     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-870 }

;-871 

;-872 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-873     gettypes(i);

;Function : doassign, Number local Var: 4
; # type sign width local variables
;97 var sign word mode = bp+4
;98 var sign word i = bp+6
;99 var sign word ixarr = bp+8
;100 var sign word ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-874     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign272
;-875         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-876         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-877         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign273
 push doassign_1
 call printstring
 add  sp, 2
;-878             else  printstring("\n mov  [bx], al");

 jmp .doassign274
.doassign273:
 push doassign_2
 call printstring
 add  sp, 2
;-879         return;

.doassign274:
 jmp .retndoassign
;-880         }

;-881     if (mode==2) {// & = adr

.doassign272:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign275
;-882         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-883         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-884         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-885         return;

 jmp .retndoassign
;-886         }

;-887     if (ixarr) {

.doassign275:
 mov ax, [bp+8]
 or  al, al
 je .doassign276
;-888         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-889         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign277
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-890             else v(ixarr);

 jmp .doassign278
.doassign277:
 push word [bp+8]
 call v
 add  sp, 2
;-891         if (wi==2) printstring("\n shl bx, 1");

.doassign278:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign279
 push doassign_6
 call printstring
 add  sp, 2
;-892         printstring("\n mov [");

.doassign279:
 push doassign_7
 call printstring
 add  sp, 2
;-893         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-894         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign280
 push doassign_8
 call printstring
 add  sp, 2
;-895             else printstring("+bx], al");

 jmp .doassign281
.doassign280:
 push doassign_9
 call printstring
 add  sp, 2
;-896         return;

.doassign281:
 jmp .retndoassign
;-897         }

;-898     if (wi==1){

.doassign276:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign282
;-899         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-900         if(i<GTop) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign283
 push doassign_11
 call printstring
 add  sp, 2
;-901         v(i);

.doassign283:
 push word [bp+6]
 call v
 add  sp, 2
;-902         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-903         return;

 jmp .retndoassign
;-904         }

;-905     if (wi==2){

.doassign282:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign284
;-906         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-907         if(i<GTop) printstring("word ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign285
 push doassign_14
 call printstring
 add  sp, 2
;-908         v(i);

.doassign285:
 push word [bp+6]
 call v
 add  sp, 2
;-909         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-910         return;

 jmp .retndoassign
;-911         }

;-912     if (wi==4){

.doassign284:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign286
;-913         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-914         if(i<GTop) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign287
 push doassign_17
 call printstring
 add  sp, 2
;-915         v(i);

.doassign287:
 push word [bp+6]
 call v
 add  sp, 2
;-916         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-917         return;

 jmp .retndoassign
;-918         }

;-919 }

.doassign286:
;-920 

;-921 int domul(int ids) {

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
;-922     if (ids) rterm("imul");

;Function : domul, Number local Var: 1
; # type sign width local variables
;97 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul288
 push domul_0
 call rterm
 add  sp, 2
;-923         else {

 jmp .domul289
.domul288:
;-924         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul290
;-925             printstring("\n mov bx, ");

 push domul_1
 call printstring
 add  sp, 2
;-926             printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-927             printstring("\n mul bx");

 push domul_2
 call printstring
 add  sp, 2
;-928             }

;-929         else error1("with MUL only const number as multipl. allowed");

 jmp .domul291
.domul290:
 push domul_3
 call error1
 add  sp, 2
;-930         }

.domul291:
;-931 }

.domul289:
;-932 

;-933 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multipl. allowed",0
ENDP

doidiv: PROC
;-934     int mode; int id1;

;-935     if (istoken(T_CONST)) {

;Function : doidiv, Number local Var: 3
; # type sign width local variables
;97 var sign word ids = bp+4
;98 var sign word mode = bp-2
;99 var sign word id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv292
;-936         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-937         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-938         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv293
 push doidiv_1
 call printstring
 add  sp, 2
;-939             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv294
.doidiv293:
 push doidiv_2
 call printstring
 add  sp, 2
;-940         }

.doidiv294:
;-941     else {

 jmp .doidiv295
.doidiv292:
;-942         mode=typeName();

 call typeName
 mov [bp-2], ax
;-943         id1=searchname();

 call searchname
 mov [bp-4], ax
;-944         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv296
 push doidiv_3
 call error1
 add  sp, 2
;-945         gettypes(id1);

.doidiv296:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-946         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv297
 push doidiv_4
 call error1
 add  sp, 2
;-947         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv297:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv298
 push doidiv_5
 call error1
 add  sp, 2
;-948         printstring("\n mov bx, ");

.doidiv298:
 push doidiv_6
 call printstring
 add  sp, 2
;-949         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-950         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv299
 push doidiv_7
 call printstring
 add  sp, 2
;-951             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv300
.doidiv299:
 push doidiv_8
 call printstring
 add  sp, 2
;-952     }

.doidiv300:
;-953 }

.doidiv295:
;-954 

;-955 int domod(int ids) {

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
;-956     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;97 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-957     printstring("\n mov ax, dx");

 push domod_0
 call printstring
 add  sp, 2
;-958 }

;-959 

;-960 

;-961 int docalltype[10]; int docallvalue[10];

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
;-962 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name

section .bss
absolute 32582
procname resb 17
section .text
;-963 

;-964 int docall() {


docall: PROC
;-965     int i; int narg; int t0; int n0;  int sz32;

;-966     narg=0;

;Function : docall, Number local Var: 5
; # type sign width local variables
;100 var sign word i = bp-2
;101 var sign word narg = bp-4
;102 var sign word t0 = bp-6
;103 var sign word n0 = bp-8
;104 var sign word sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-967     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-968     checknamelen();

 call checknamelen
;-969     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-970     expect('(');

 push 40
 call expect
 add  sp, 2
;-971 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall301
;-972 	    do {

.docall302:
;-973 	        narg++;

 inc  word[bp-4]
;-974 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall303
 push docall_0
 call error1
 add  sp, 2
;-975 	        t0=0;

.docall303:
 mov ax, 0
 mov [bp-6], ax
;-976             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall304
;-977                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-978                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-979                 }

;-980             if(istoken(T_STRING)){

.docall304:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall305
;-981                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-982                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-983                 eprs("\n");

 push docall_1
 call eprs
 add  sp, 2
;-984                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-985                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-986                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-987                 eprs(" db ");

 push docall_2
 call eprs
 add  sp, 2
;-988                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-989                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-990                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-991                 eprs(",0");

 push docall_3
 call eprs
 add  sp, 2
;-992                 nconst++;

 inc  word[nconst]
;-993                 }

;-994             if(istoken('&'))     {

.docall305:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall306
;-995                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-996                 name1();

 call name1
;-997                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-998                 }

;-999             if(istoken(T_NAME))  {

.docall306:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall307
;-1000 

;-1001 

;-1002 

;-1003                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-1004                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-1005                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-1006                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-1007                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall308
 mov ax, 3
 mov [bp-6], ax
;-1008 

;-1009                 }

.docall308:
;-1010             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall307:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall309
 push docall_4
 call error1
 add  sp, 2
;-1011             docalltype [narg] = t0;

.docall309:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-1012             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-1013         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall310
 jmp .docall302
.docall310:
;-1014 

;-1015   	expect(')');

 push 41
 call expect
 add  sp, 2
;-1016   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-1017     do {

.docall311:
;-1018         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-1019         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-1020         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall312
;-1021             printstring("\n push ");

 push docall_5
 call printstring
 add  sp, 2
;-1022             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1023             }

;-1024         if(t0==2){

.docall312:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall313
;-1025             printstring("\n push ");

 push docall_6
 call printstring
 add  sp, 2
;-1026             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1027             prc(95);

 push 95
 call prc
 add  sp, 2
;-1028             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1029             }

;-1030         if(t0==3){

.docall313:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall314
;-1031             printstring("\n lea  ax, ");

 push docall_7
 call printstring
 add  sp, 2
;-1032             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1033             printstring("\n push ax");

 push docall_8
 call printstring
 add  sp, 2
;-1034             }

;-1035         if(t0==4){

.docall314:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall315
;-1036             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1037             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall316
;-1038                 printstring("\n push word ");

 push docall_9
 call printstring
 add  sp, 2
;-1039                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1040                 }

;-1041             else {

 jmp .docall317
.docall316:
;-1042                 printstring("\n mov al, byte ");

 push docall_10
 call printstring
 add  sp, 2
;-1043                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1044                 printstring("\n mov ah, 0\n push ax");

 push docall_11
 call printstring
 add  sp, 2
;-1045                 }

;-1046             }

.docall317:
;-1047         if(t0==5){

.docall315:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall318
;-1048             printstring("\n push ");

 push docall_12
 call printstring
 add  sp, 2
;-1049             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1050             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall319
 mov ax, [bp-10]
 add ax, 2
;-1051             }

.docall319:
;-1052         i--;

.docall318:
 dec  word[bp-2]
;-1053         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall320
 jmp .docall311
.docall320:
;-1054     }

;-1055 	printstring("\n call ");

.docall301:
 push docall_13
 call printstring
 add  sp, 2
;-1056 	printstring(&procname);

 lea  ax, [procname]
 push ax
 call printstring
 add  sp, 2
;-1057 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall321
;-1058 	    printstring("\n add  sp, ");

 push docall_14
 call printstring
 add  sp, 2
;-1059         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1060         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1061         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1062         }

;-1063 }

.docall321:
;-1064 

;-1065 

;-1066 int expr() {

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
;-1067     int mode;   int id1;

;-1068     int ixarr;  int ixconst;

;-1069     int ids;    int isCONST;

;-1070     int i;      unsigned char *p;

;-1071 

;-1072     if (istoken(T_CONST)) {// constant ;

;Function : expr, Number local Var: 8
; # type sign width local variables
;100 var sign word mode = bp-2
;101 var sign word id1 = bp-4
;102 var sign word ixarr = bp-6
;103 var sign word ixconst = bp-8
;104 var sign word ids = bp-10
;105 var sign word isCONST = bp-12
;106 var sign word i = bp-14
;107 ptr unsg byte p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr322
;-1073         printstring("\n mov ax, ");

 push expr_0
 call printstring
 add  sp, 2
;-1074         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1075         return 4;

 mov ax, 4
 jmp .retnexpr
;-1076         }

;-1077     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr322:
 call typeName
 mov [bp-2], ax
;-1078     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1079     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr323
;-1080         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1081         return;

 jmp .retnexpr
;-1082         }

;-1083 

;-1084     if (token=='(')  {

.expr323:
 mov ax, [token]
 cmp ax, 40
 jne .expr324
;-1085         docall();

 call docall
;-1086         goto e1;

 jmp .e1
;-1087         }

;-1088 

;-1089     id1=searchname();

.expr324:
 call searchname
 mov [bp-4], ax
;-1090     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1091     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1092     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1093     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1094     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr325
;-1095         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr326
;-1096             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1097             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1098             expect(']');

 push 93
 call expect
 add  sp, 2
;-1099             }

;-1100         else {

 jmp .expr327
.expr326:
;-1101             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1102             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1103             expect(']');

 push 93
 call expect
 add  sp, 2
;-1104             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1105             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr328
 push expr_1
 call error1
 add  sp, 2
;-1106             }

.expr328:
;-1107         }

.expr327:
;-1108     if (istoken(T_PLUSPLUS  )) {

.expr325:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr329
;-1109         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr330
 push expr_2
 call error1
 add  sp, 2
;-1110         printstring("\n inc  ");

.expr330:
 push expr_3
 call printstring
 add  sp, 2
;-1111         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr331
 push expr_4
 call printstring
 add  sp, 2
 jmp .expr332
.expr331:
 push expr_5
 call printstring
 add  sp, 2
;-1112         v(id1);

.expr332:
 push word [bp-4]
 call v
 add  sp, 2
;-1113         goto e1;

 jmp .e1
;-1114         }

;-1115     if (istoken(T_MINUSMINUS)) {

.expr329:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr333
;-1116         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr334
 push expr_6
 call error1
 add  sp, 2
;-1117         printstring("\n dec  ");

.expr334:
 push expr_7
 call printstring
 add  sp, 2
;-1118         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr335
 push expr_8
 call printstring
 add  sp, 2
 jmp .expr336
.expr335:
 push expr_9
 call printstring
 add  sp, 2
;-1119         v(id1);

.expr336:
 push word [bp-4]
 call v
 add  sp, 2
;-1120         goto e1;

 jmp .e1
;-1121         }

;-1122 

;-1123     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr333:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1
;-1124     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr337:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1
;-1125     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr338:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1
;-1126     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr339:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1127     if (istoken(T_MULASS  )) error1("not implemented");

.expr340:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push expr_14
 call error1
 add  sp, 2
;-1128     if (istoken(T_DIVASS  )) error1("not implemented");

.expr341:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr342
 push expr_15
 call error1
 add  sp, 2
;-1129 

;-1130     if (istoken('=')) {

.expr342:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
;-1131         expr();

 call expr
;-1132         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1133         goto e1;

 jmp .e1
;-1134         }

;-1135     dovar1(mode, "mov", ixarr, id1);

.expr343:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1136 

;-1137 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr344
 push expr_17
 call rterm
 add  sp, 2
;-1138     else if (istoken('-')) rterm("sub");

 jmp .expr345
.expr344:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr346
 push expr_18
 call rterm
 add  sp, 2
;-1139     else if (istoken('&')) rterm("and");

 jmp .expr347
.expr346:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr348
 push expr_19
 call rterm
 add  sp, 2
;-1140     else if (istoken('|')) rterm("or" );

 jmp .expr349
.expr348:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr350
 push expr_20
 call rterm
 add  sp, 2
;-1141     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr351
.expr350:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr352
 push expr_21
 call rterm
 add  sp, 2
;-1142     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr353
.expr352:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr354
 push expr_22
 call rterm
 add  sp, 2
;-1143     else if (istoken('*')) domul (ids);

 jmp .expr355
.expr354:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr356
 push word [bp-10]
 call domul
 add  sp, 2
;-1144     else if (istoken('/')) doidiv(ids);

 jmp .expr357
.expr356:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr358
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1145     else if (istoken('%')) domod (ids);

 jmp .expr359
.expr358:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr360
 push word [bp-10]
 call domod
 add  sp, 2
;-1146     if (isrelational()) {

.expr360:
.expr359:
.expr357:
.expr355:
.expr353:
.expr351:
.expr349:
.expr347:
.expr345:
 call isrelational
 or  al, al
 je .expr361
;-1147         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1148         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1149         }

;-1150     return 0;

.expr361:
 mov ax, 0
 jmp .retnexpr
;-1151 }

;-1152 

;-1153 int pexpr() {//called from if, do, while

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
;-1154     expect('(');

 push 40
 call expect
 add  sp, 2
;-1155     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1156     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr362
;-1157         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1158         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr363
;-1159             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1160             return;

 jmp .retnpexpr
;-1161             }

;-1162         }

.pexpr363:
;-1163 

;-1164     expr();

.pexpr362:
 call expr
;-1165     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr364
 push pexpr_0
 call printstring
 add  sp, 2
;-1166     printstring(fname);

.pexpr364:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1167     expect(')');

 push 41
 call expect
 add  sp, 2
;-1168 }

;-1169 

;-1170 

;-1171 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1172     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;100 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1173     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1174     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1175     prc(':');

 push 58
 call prc
 add  sp, 2
;-1176 }

;-1177 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1178     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;100 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1179     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1180     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1181 }

;-1182 

;-1183 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1184     int c; char cha;

;-1185     int jdest; int tst; int jtemp;

;-1186     if(istoken('{')) {

;Function : stmt, Number local Var: 5
; # type sign width local variables
;100 var sign word c = bp-2
;101 var sign byte cha = bp-4
;102 var sign word jdest = bp-6
;103 var sign word tst = bp-8
;104 var sign word jtemp = bp-10;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt365
;-1187         while(istoken('}')==0) stmt();

.stmt366:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt367
 call stmt
;-1188         }

 jmp .stmt366
.stmt367:
;-1189     else if(istoken(T_IF)) {

 jmp .stmt368
.stmt365:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt369
;-1190         pexpr();

 call pexpr
;-1191         nlabel++;

 inc  word[nlabel]
;-1192         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1193         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1194         stmt();

 call stmt
;-1195         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370
;-1196             nlabel++;

 inc  word[nlabel]
;-1197             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1198             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1199             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1200             stmt();

 call stmt
;-1201             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1202         }

;-1203         else prlabel(jdest);

 jmp .stmt371
.stmt370:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1204     }

.stmt371:
;-1205     else if(istoken(T_DO)) {

 jmp .stmt372
.stmt369:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt373
;-1206         nlabel++;

 inc  word[nlabel]
;-1207         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1208         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1209         stmt();

 call stmt
;-1210         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1211         pexpr();

 call pexpr
;-1212         nlabel++;

 inc  word[nlabel]
;-1213         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1214         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1215         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1216          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1217     }

;-1218     else if(istoken(T_WHILE)) {

 jmp .stmt374
.stmt373:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt375
;-1219         nlabel++;

 inc  word[nlabel]
;-1220         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1221         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1222         pexpr();

 call pexpr
;-1223         nlabel++;

 inc  word[nlabel]
;-1224         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1225         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1226         stmt();

 call stmt
;-1227         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1228         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1229     }

;-1230     else if(istoken(T_GOTO))  {

 jmp .stmt376
.stmt375:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt377
;-1231         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1232         name1();

 call name1
;-1233         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1234         expect(';');

 push 59
 call expect
 add  sp, 2
;-1235     }

;-1236     else if(token==T_ASM)     {

 jmp .stmt378
.stmt377:
 mov ax, [token]
 cmp ax, 518
 jne .stmt379
;-1237       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1238       c=next();

 call next
 mov [bp-2], ax
;-1239       while(c != '\n') {

.stmt380:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt381
;-1240         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1241         c=next();

 call next
 mov [bp-2], ax
;-1242         };

 jmp .stmt380
.stmt381:
;-1243         token=getlex();

 call getlex
 mov word [token], ax
;-1244     }

;-1245     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt382
.stmt379:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt383
;-1246         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt384
;-1247             printstring("\n"); cha=next();

 push stmt_2
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1248             while(cha!= '}') {

.stmt385:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt386
;-1249                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1250                 cha=next();

 call next
 mov [bp-4], al
;-1251             }

;-1252             token=getlex();

 jmp .stmt385
.stmt386:
 call getlex
 mov word [token], ax
;-1253         } else error1("Curly open expected");

 jmp .stmt387
.stmt384:
 push stmt_3
 call error1
 add  sp, 2
;-1254     }

.stmt387:
;-1255     else if(istoken(T_INTH))  {

 jmp .stmt388
.stmt383:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt389
;-1256         printstring("\n int  ");

 push stmt_4
 call printstring
 add  sp, 2
;-1257         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1258         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1259         expect(';');

 push 59
 call expect
 add  sp, 2
;-1260     }

;-1261     else if(istoken(T_EMIT)) {

 jmp .stmt390
.stmt389:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt391
;-1262       printstring("\n db ");

 push stmt_5
 call printstring
 add  sp, 2
;-1263     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1264       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1265       token=getlex();

 call getlex
 mov word [token], ax
;-1266       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt392
;-1267           prc(',');

 push 44
 call prc
 add  sp, 2
;-1268           goto L1;

 jmp .L1
;-1269       }

;-1270       expect(')');

.stmt392:
 push 41
 call expect
 add  sp, 2
;-1271     }

;-1272     else if(istoken(';'))      { }

 jmp .stmt393
.stmt391:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt394
;-1273     else if(istoken(T_RETURN)) {

 jmp .stmt395
.stmt394:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt396
;-1274         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt397
 call expr
;-1275         printstring("\n jmp .retn");

.stmt397:
 push stmt_6
 call printstring
 add  sp, 2
;-1276         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1277         nreturn++;

 inc  word[nreturn]
;-1278         expect(';');

 push 59
 call expect
 add  sp, 2
;-1279     }

;-1280     else if(thechar==':')      {

 jmp .stmt398
.stmt396:
 mov al, [thechar]
 cmp al, 58
 jne .stmt399
;-1281         printstring("\n."); // Label

 push stmt_7
 call printstring
 add  sp, 2
;-1282         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1283         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1284         expect(':');

 push 58
 call expect
 add  sp, 2
;-1285     }

;-1286     else  {expr();; expect(';'); }

 jmp .stmt400
.stmt399:
 call expr
 push 59
 call expect
 add  sp, 2
;-1287 }

.stmt400:
.stmt398:
.stmt395:
.stmt393:
.stmt390:
.stmt388:
.stmt382:
.stmt378:
.stmt376:
.stmt374:
.stmt372:
.stmt368:
;-1288 

;-1289 int isvariable() {

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
;-1290     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable401
 jmp .v1
;-1291     if(token==T_UNSIGNED) goto v1;

.isvariable401:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable402
 jmp .v1
;-1292     if(token==T_CHAR)     goto v1;

.isvariable402:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable403
 jmp .v1
;-1293     if(token==T_INT)      goto v1;

.isvariable403:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable404
 jmp .v1
;-1294     if(token==T_LONG)     goto v1;

.isvariable404:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable405
 jmp .v1
;-1295     return 0;

.isvariable405:
 mov ax, 0
 jmp .retnisvariable
;-1296 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1297 }

;-1298 

;-1299 //***************************************************************

;-1300 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1301     unsigned int j;

;-1302     char c;

;-1303     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;100 var unsg word i = bp+4
;101 var unsg word j = bp-2
;102 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1304     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1305     prc(32);

 push 32
 call prc
 add  sp, 2
;-1306     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1307     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar406
 push listvar_1
 call printstring
 add  sp, 2
;-1308     if(c=='*')printstring("ptr ");

.listvar406:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar407
 push listvar_2
 call printstring
 add  sp, 2
;-1309     if(c=='&')printstring("arr ");

.listvar407:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar408
 push listvar_3
 call printstring
 add  sp, 2
;-1310     if(c=='#')printstring("def ");

.listvar408:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar409
 push listvar_4
 call printstring
 add  sp, 2
;-1311     c=GSign [i];

.listvar409:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1312     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar410
 push listvar_5
 call printstring
 add  sp, 2
;-1313     if(c=='U')printstring("unsg ");

.listvar410:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar411
 push listvar_6
 call printstring
 add  sp, 2
;-1314     c=GWidth[i];

.listvar411:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1315     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar412
 push listvar_7
 call printstring
 add  sp, 2
;-1316     if(c== 1)printstring("byte " );

.listvar412:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar413
 push listvar_8
 call printstring
 add  sp, 2
;-1317     if(c== 2)printstring("word " );

.listvar413:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar414
 push listvar_9
 call printstring
 add  sp, 2
;-1318     if(c== 4)printstring("long " );

.listvar414:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar415
 push listvar_10
 call printstring
 add  sp, 2
;-1319     pt=getVarName(i);

.listvar415:
 push word [bp+4]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1320 //    j=i*32;

;-1321 //    pt=&GNameField + j;

;-1322     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1323     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar416
;-1324         prc('=');

 push 61
 call prc
 add  sp, 2
;-1325         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1326         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1327     }

;-1328     if(GType[i]=='&') {

.listvar416:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar417
;-1329         prc('[');

 push 91
 call prc
 add  sp, 2
;-1330         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1331         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1332         prc(']');

 push 93
 call prc
 add  sp, 2
;-1333     }

;-1334     if (i >= GTop) {

.listvar417:
 mov ax, [bp+4]
 cmp ax, [GTop] ;unsigned : 0
 jb  .listvar418
;-1335         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1336         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1337         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar419
 push 43
 call prc
 add  sp, 2
;-1338         printinteger(j);

.listvar419:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1339     }

;-1340 }

.listvar418:
;-1341 

;-1342 int listproc() {

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
;-1343     int i;

;-1344     if (LTop > GTop) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;100 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .listproc420
;-1345         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1346         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1347         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1348         i=LTop - GTop;

 mov ax, [LTop]
 sub ax, [GTop]
 mov [bp-2], ax
;-1349         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1350         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1351         i=GTop;

 mov ax, [GTop]
 mov [bp-2], ax
;-1352         while (i < LTop) {

.listproc421:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc422
;-1353             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1354             i++;

 inc  word[bp-2]
;-1355         }

;-1356     }

 jmp .listproc421
.listproc422:
;-1357 }

.listproc420:
;-1358 

;-1359 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1360     int FunctionIndex; char *p;

;-1361     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;100 var sign word FunctionIndex = bp-2
;101 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1362     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1363     while (FunctionIndex <= FunctionMaxIx ) {

.searchFunction423:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction424
;-1364         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction425
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1365         p = strlen(p) + p;

.searchFunction425:
 push word [bp-4]
 call strlen
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1366         p++;

 inc  word[bp-4]
;-1367         FunctionIndex++;

 inc  word[bp-2]
;-1368     }

;-1369     return 0;               //no function found

 jmp .searchFunction423
.searchFunction424:
 mov ax, 0
 jmp .retnsearchFunction
;-1370 }

;-1371 

;-1372 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1373     unsigned int i;

;-1374     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;100 var unsg word i = bp-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1375     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300 ;unsigned : 1
 jl  .storeFunction426
 push storeFunction_0
 call error1
 add  sp, 2
;-1376     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction426:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1377     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1378     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1379     i += IDLENMAX;

 add  word[bp-2], 31
;-1380     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000 ;unsigned : 0
 jb  .storeFunction427
 push storeFunction_1
 call error1
 add  sp, 2
;-1381 

;-1382 }

.storeFunction427:
;-1383 

;-1384 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1385     int nloc; unsigned int j;int narg;

;-1386     int VarNamePtrLocalStart;

;-1387     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;100 var sign word nloc = bp-2
;101 var unsg word j = bp-4
;102 var sign word narg = bp-6
;103 var sign word VarNamePtrLocalStart = bp-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1388     checknamelen();

 call checknamelen
;-1389     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1390     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc428
 push dofunc_0
 call error1
 add  sp, 2
;-1391     storeFunction();

.dofunc428:
 call storeFunction
;-1392 

;-1393     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1394     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1395     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1396     expect('(');

 push 40
 call expect
 add  sp, 2
;-1397 //    LStart=GTop;

;-1398     LTop=GTop;

 mov ax, [GTop]
 mov word [LTop], ax
;-1399     VarNamePtrLocalStart=VarNamePtr;

 mov ax, [VarNamePtr]
 mov [bp-8], ax
;-1400 

;-1401     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc429
;-1402         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1403         do {

.dofunc430:
;-1404             typeName();

 call typeName
;-1405             addlocal();

 call addlocal
;-1406             narg+=2;

 add  word[bp-6], 2
;-1407             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1408             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc431
 add  word[bp-6], 2
;-1409             LTop++;

.dofunc431:
 inc  word[LTop]
;-1410             }

;-1411         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc432
 jmp .dofunc430
.dofunc432:
;-1412         expect(')');

 push 41
 call expect
 add  sp, 2
;-1413         }

;-1414 

;-1415     expect('{'); /*body*/

.dofunc429:
 push 123
 call expect
 add  sp, 2
;-1416     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1417     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1418     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1419     while(isvariable()) {

.dofunc433:
 call isvariable
 or  al, al
 je .dofunc434
;-1420         do {

.dofunc435:
;-1421             typeName();

 call typeName
;-1422             checknamelen();

 call checknamelen
;-1423             addlocal();

 call addlocal
;-1424             nloc-=2;

 sub  word[bp-2], 2
;-1425             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc436
 sub  word[bp-2], 2
;-1426             GData[LTop]=nloc;

.dofunc436:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1427             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc437
;-1428                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1429                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1430                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1431                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1432                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1433                 nloc+=2;

 add  word[bp-2], 2
;-1434                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1435             }

;-1436             LTop++;

.dofunc437:
 inc  word[LTop]
;-1437         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc438
 jmp .dofunc435
.dofunc438:
;-1438         expect(';');

 push 59
 call expect
 add  sp, 2
;-1439     }

;-1440     listproc();

 jmp .dofunc433
.dofunc434:
 call listproc
;-1441     if (LTop>GTop){

 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc439
;-1442         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1443         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1444         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1445         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1446         }

;-1447 

;-1448     while(istoken('}')==0)  stmt();

.dofunc439:
.dofunc440:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc441
 call stmt
;-1449 

;-1450     if (nreturn) {

 jmp .dofunc440
.dofunc441:
 mov ax, [nreturn]
 or  al, al
 je .dofunc442
;-1451             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1452             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1453             prc(':');

 push 58
 call prc
 add  sp, 2
;-1454         }

;-1455     if (LTop > GTop) printstring("\n LEAVE");

.dofunc442:
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc443
 push dofunc_6
 call printstring
 add  sp, 2
;-1456     printstring("\n ret");

.dofunc443:
 push dofunc_7
 call printstring
 add  sp, 2
;-1457     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1458     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1459     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1460     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc444
 mov ax, [maxco1]
 mov word [maxco], ax
;-1461     printstring("\nENDP");

.dofunc444:
 push dofunc_8
 call printstring
 add  sp, 2
;-1462     VarNamePtr=VarNamePtrLocalStart;//delete local names

 mov ax, [bp-8]
 mov word [VarNamePtr], ax
;-1463 }

;-1464 

;-1465 char doglobName[IDLENMAX];

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
;-1466 int doglob() {


doglob: PROC
;-1467     int i; int j; int isstrarr;

;-1468     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;101 var sign word i = bp-2
;102 var sign word j = bp-4
;103 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1469     if (GTop >= VARMAX) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .doglob445
 push doglob_0
 call error1
 add  sp, 2
;-1470     if (iswidth == 0) error1("no VOID as var type");

.doglob445:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob446
 push doglob_1
 call error1
 add  sp, 2
;-1471     checknamelen();

.doglob446:
 call checknamelen
;-1472     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob447
 push doglob_2
 call error1
 add  sp, 2
;-1473     if (istoken('[')) {

.doglob447:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob448
;-1474         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1475         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob449
;-1476             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1477             printunsigned(orgDatai);

 push word [orgDatai]
 call printunsigned
 add  sp, 2
;-1478             printstring("\n"); printstring(Symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1479             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob450
 push doglob_5
 call printstring
 add  sp, 2
;-1480             if (iswidth==2) printstring(" resw ");

.doglob450:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob451
 push doglob_6
 call printstring
 add  sp, 2
;-1481             if (iswidth==4) printstring(" resd ");

.doglob451:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob452
 push doglob_7
 call printstring
 add  sp, 2
;-1482             printunsigned(lexval);

.doglob452:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1483             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1484             orgDatai=orgDatai+lexval;

 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1485             if (iswidth==2) orgDatai=orgDatai+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob453
 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1486             if (iswidth==4) {i= lexval * 3; orgDatai=orgDatai + i;}

.doglob453:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob454
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgDatai]
 add ax, [bp-2]
 mov word [orgDatai], ax
;-1487             GData[GTop]=lexval;

.doglob454:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1488             expect(']');

 push 93
 call expect
 add  sp, 2
;-1489         }else {

 jmp .doglob455
.doglob449:
;-1490             expect(']');

 push 93
 call expect
 add  sp, 2
;-1491             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob456
 push doglob_9
 call error1
 add  sp, 2
;-1492             printstring("\n");

.doglob456:
 push doglob_10
 call printstring
 add  sp, 2
;-1493             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1494             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1495             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1496             strcpy(doglobName, Symbol);//save Symbol name

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1497             expect('=');

 push 61
 call expect
 add  sp, 2
;-1498             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob457
;-1499                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1500                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1501                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1502                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1503                 i=strlen(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1504                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1505                 }

;-1506             else if (istoken('{' )) {

 jmp .doglob458
.doglob457:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob459
;-1507                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1508                 do {

.doglob460:
;-1509                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob461
 push 44
 call prc
 add  sp, 2
;-1510                     expect(T_CONST);

.doglob461:
 push 257
 call expect
 add  sp, 2
;-1511                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1512                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1513                     }

;-1514                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob462
 jmp .doglob460
.doglob462:
;-1515                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1516             }

;-1517         else error1("String or number array expected");

 jmp .doglob463
.doglob459:
 push doglob_13
 call error1
 add  sp, 2
;-1518         };

.doglob463:
.doglob458:
.doglob455:
;-1519     }else { //expect('=');

 jmp .doglob464
.doglob448:
;-1520         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1521         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1522         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob465
 push doglob_15
 call printstring
 add  sp, 2
;-1523         else {

 jmp .doglob466
.doglob465:
;-1524             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob467
 push doglob_16
 call printstring
 add  sp, 2
;-1525             else if (iswidth==2) printstring(" dw ");

 jmp .doglob468
.doglob467:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob469
 push doglob_17
 call printstring
 add  sp, 2
;-1526             else                 printstring(" dd ");

 jmp .doglob470
.doglob469:
 push doglob_18
 call printstring
 add  sp, 2
;-1527         }

.doglob470:
.doglob468:
;-1528     if(istoken('-')) prc('-');

.doglob466:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob471
 push 45
 call prc
 add  sp, 2
;-1529     if (istoken('=')) {

.doglob471:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob472
;-1530         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1531         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1532         }else printunsigned(0);

 jmp .doglob473
.doglob472:
 push 0
 call printunsigned
 add  sp, 2
;-1533     }

.doglob473:
;-1534     GSign[GTop]=issign;

.doglob464:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1535     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1536     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1537     pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1538     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob474
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1539         else strcpy(pt, Symbol);

 jmp .doglob475
.doglob474:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1540 	if (isstrarr) strcpy(Symbol, doglobName);

.doglob475:
 mov ax, [bp-6]
 or  al, al
 je .doglob476
 lea  ax, [doglobName]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-1541 	storeVarName();

.doglob476:
 call storeVarName
;-1542     GTop++;

 inc  word[GTop]
;-1543     expect(';');

 push 59
 call expect
 add  sp, 2
;-1544 }

;-1545 

;-1546 int dodefine() {

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
;-1547     expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1548     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine477
;-1549         if (GTop >= VARMAX) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .dodefine478
 push dodefine_0
 call error1
 add  sp, 2
;-1550         checknamelen();

.dodefine478:
 call checknamelen
;-1551         if (checkName() != 0) error1("#Define var already defined");

 call checkName
 cmp ax, 0
 je  .dodefine479
 push dodefine_1
 call error1
 add  sp, 2
;-1552         if (eqstr(Symbol, "ORGDATA")) {

.dodefine479:
 push dodefine_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine480
;-1553             orgDataOriginal=lexval;

 mov ax, [lexval]
 mov word [orgDataOriginal], ax
;-1554             orgDatai=lexval;

 mov ax, [lexval]
 mov word [orgDatai], ax
;-1555             expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1556             return;

 jmp .retndodefine
;-1557         }

;-1558         GSign [GTop]='U';

.dodefine480:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1559         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1560         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1561         pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1562         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1563         storeVarName();

 call storeVarName
;-1564         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1565         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1566         GTop++;

 inc  word[GTop]
;-1567     }

;-1568 }

.dodefine477:
;-1569 

;-1570 int parse() {

 .retndodefine:
 ret
dodefine_0 db "global table (define) full",0
dodefine_1 db "#Define var already defined",0
dodefine_2 db "ORGDATA",0
ENDP

parse: PROC
;-1571     token=getlex();

 call getlex
 mov word [token], ax
;-1572     do {

.parse481:
;-1573         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse482
 mov ax, 1
 jmp .retnparse
;-1574         if (istoken('#')) {

.parse482:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse483
;-1575              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse484
 call dodefine
;-1576              else error1("define expected");

 jmp .parse485
.parse484:
 push parse_0
 call error1
 add  sp, 2
;-1577         }

.parse485:
;-1578     else{

 jmp .parse486
.parse483:
;-1579         typeName();

 call typeName
;-1580         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse487
 call dofunc
;-1581         else doglob(); }

 jmp .parse488
.parse487:
 call doglob
.parse488:
;-1582     } while(1);

.parse486:
 mov ax, 1
 or  al, al
 je .parse489
 jmp .parse481
.parse489:
;-1583 }

;-1584 

;-1585 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1586 int getarguments() {


getarguments: PROC
;-1587     int arglen1; unsigned int i; char *c;

;-1588     isPrint=1;

;Function : getarguments, Number local Var: 3
; # type sign width local variables
;103 var sign word arglen1 = bp-2
;104 var unsg word i = bp-4
;105 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1589     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1590     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarguments490
;-1591         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1592         cputs(" Usage: A.COM in_file[.C]: ");

 push getarguments_0
 call cputs
 add  sp, 2
;-1593         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1594         }

;-1595     i=arglen1+129;

.getarguments490:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1596     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1597     arglen1--;

 dec  word[bp-2]
;-1598     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1599     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1600     if (instr1(namein, '.') == 0) strcat(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarguments491
 push getarguments_1
 lea  ax, [namein]
 push ax
 call strcat
 add  sp, 4
;-1601     strcpy(namelst, namein);

.getarguments491:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1602     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1603     i--;

 dec  word[bp-4]
;-1604     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1605     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1606 }

;-1607 int openfiles() {

 LEAVE
 ret
getarguments_0 db " Usage: A.COM in_file[.C]: ",0
getarguments_1 db ".C",0
ENDP

openfiles: PROC
;-1608     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1609     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles492
;-1610         cputs("Source file missing (.C): ");

 push openfiles_0
 call cputs
 add  sp, 2
;-1611         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1612         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1613         }

;-1614     fdout=creatR(namelst);

.openfiles492:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1615     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles493
;-1616         cputs("list file not creatable: ");

 push openfiles_1
 call cputs
 add  sp, 2
;-1617         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1618         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1619         }

;-1620     printstring(";");

.openfiles493:
 push openfiles_2
 call printstring
 add  sp, 2
;-1621     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1622     printstring(", Input: "); printstring(namein);

 push openfiles_3
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1623     printstring(", Output: "); printstring(namelst);

 push openfiles_4
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1624 }

;-1625 

;-1626 int epilog() {

 ret
openfiles_0 db "Source file missing (.C): ",0
openfiles_1 db "list file not creatable: ",0
openfiles_2 db ";",0
openfiles_3 db ", Input: ",0
openfiles_4 db ", Output: ",0
ENDP

epilog: PROC
;-1627     unsigned int i;

;-1628     isPrint=1;

;Function : epilog, Number local Var: 1
; # type sign width local variables
;103 var unsg word i = bp-2;
 ENTER  2,0
 mov ax, 1
 mov byte [isPrint], al
;-1629     GTop--;

 dec  word[GTop]
;-1630     printstring("\n;Glob. variables:"); printunsigned(GTop);

 push epilog_0
 call printstring
 add  sp, 2
 push word [GTop]
 call printunsigned
 add  sp, 2
;-1631     printstring(" (");                  printunsigned(VARMAX);

 push epilog_1
 call printstring
 add  sp, 2
 push 400
 call printunsigned
 add  sp, 2
;-1632     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-1633     printstring("):");                  printunsigned(i);

 push epilog_2
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1634     printstring(" (");					printunsigned(VARNAMESMAX);

 push epilog_3
 call printstring
 add  sp, 2
 push 4000
 call printunsigned
 add  sp, 2
;-1635     printstring("), Functions:");       printunsigned(FunctionMaxIx);

 push epilog_4
 call printstring
 add  sp, 2
 push word [FunctionMaxIx]
 call printunsigned
 add  sp, 2
;-1636     printstring(" (");                  printunsigned(FUNCMAX);

 push epilog_5
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1637     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1638     printstring("):");                  printunsigned(i);

 push epilog_6
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1639     printstring(" (");					printunsigned(FUNCTIONNAMESMAX);

 push epilog_7
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1640     printstring(")\n;Lines:");          printunsigned(lineno);

 push epilog_8
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1641     printstring(", Constant: ");        printunsigned(maxco);

 push epilog_9
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1642     printstring(" (");                  printunsigned(COMAX);

 push epilog_10
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1643     i = COMAX;

 mov ax, 3000
 mov [bp-2], ax
;-1644     i = i - maxco;

 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax
;-1645     if (i<=1000)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog494
 push epilog_11
 call printstring
 add  sp, 2
;-1646     printstring("), stacksize: ");

.epilog494:
 push epilog_12
 call printstring
 add  sp, 2
;-1647     i=65535;

 mov ax, 65535
 mov [bp-2], ax
;-1648     i=i-orgDatai;

 mov ax, [bp-2]
 sub ax, [orgDatai]
 mov [bp-2], ax
;-1649     printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1650     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog495
 push epilog_13
 call printstring
 add  sp, 2
;-1651 

;-1652 }

.epilog495:
;-1653 

;-1654 int main() {

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
;-1655     getarguments();

 call getarguments
;-1656     openfiles();

 call openfiles
;-1657     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1658     printstring("\norg  256 \njmp main");

 push main_0
 call printstring
 add  sp, 2
;-1659 

;-1660 	GTop = 1;

 mov ax, 1
 mov word [GTop], ax
;-1661     VarNamePtr= &VarNames;

 mov ax, VarNames
 mov word [VarNamePtr], ax
;-1662     FunctionNamePtr= &FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1663     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1664     orgDatai=orgDataOriginal;

 mov ax, [orgDataOriginal]
 mov word [orgDatai], ax
;-1665     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1666     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1667     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1668 

;-1669     parse();

 call parse
;-1670 

;-1671     epilog();

 call epilog
;-1672     end1(0);

 push 0
 call end1
 add  sp, 2
;-1673 }

 ret
main_0 db "\norg  256 \njmp main",0
ENDP
;Glob. variables:102 (400):818 (4000), Functions:79 (300):634 (3000)
;Lines:1674, Constant: 688 (3000), stacksize: 32905