;PLA compiler A.COM V1.1.3, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA compiler A.COM V1.1.3";//17475 bytes. 32905 stack

Version1 db "PLA compiler A.COM V1.1.3",0
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
;-47 #define COMAX        4000

;-48 char co[COMAX];//constant storage

section .bss
absolute 20000
co resb 4000
section .text
;-49 int maxco=0;

maxco dw 0
;-50 int maxco1=0;

maxco1 dw 0
;-51 #define CMDLENMAX      67

;-52 char Symbol[COLUMNMAX];

section .bss
absolute 24000
Symbol resb 128
section .text
;-53 char fname[CMDLENMAX];

section .bss
absolute 24128
fname resb 67
section .text
;-54 char namein[CMDLENMAX];

section .bss
absolute 24195
namein resb 67
section .text
;-55 char namelst[CMDLENMAX];

section .bss
absolute 24262
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
;-67 unsigned long Llexval;

Llexval dd 0
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
absolute 24329
GType resb 400
section .text
;-74 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 24729
GSign resb 400
section .text
;-75 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 25129
GWidth resb 400
section .text
;-76 int  GData [VARMAX];

section .bss
absolute 25529
GData resw 400
section .text
;-77 #define VARNAMESMAX 4000

;-78 char VarNames[VARNAMESMAX];//Space for global and local var names

section .bss
absolute 26329
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
absolute 30329
FunctionNames resb 3000
section .text
;-86 char *FunctionNamePtr;  //first free position in FunctionNames

FunctionNamePtr dw 0
;-87 int  FunctionMaxIx=0;   //number of functions

FunctionMaxIx dw 0
;-88 

;-89 char fgetsdest[COLUMNMAX];

section .bss
absolute 33329
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

;-432 int getlex() {

 .retnifEOL:
 LEAVE
 ret
ENDP

getlex: PROC
;-433     char c; char *p;

;-434     char symboltmp[80];

;-435     int i; int j; long l;

;-436     

;-437 	do {    

;Function : getlex, Number local Var: 6
; # type sign width local variables
;96 var sign byte c = bp-2
;97 ptr sign byte p = bp-4
;98 arr sign byte symboltmp[65452] = bp-84
;99 var sign word i = bp-86
;100 var sign word j = bp-88
;101 var sign long l = bp-92;
 ENTER  92,0
.getlex70:
;-438 		c=next();

 call next
 mov [bp-2], al
;-439     	if (c == 0) return 0; 

 mov al, [bp-2]
 cmp al, 0
 jne .getlex71
 mov ax, 0
 jmp .retngetlex
;-440     	}

.getlex71:
;-441     while (c <= ' ');

 mov al, [bp-2]
 cmp al, 32
 jg  .getlex72
 jmp .getlex70
.getlex72:
;-442       

;-443   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

 mov al, [bp-2]
 cmp al, 61
 jne .getlex73
 mov al, [thechar]
 cmp al, 61
 jne .getlex74
 call next
 mov ax, 806
 jmp .retngetlex
.getlex74:
;-444   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex73:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex75
 mov al, [thechar]
 cmp al, 61
 jne .getlex76
 call next
 mov ax, 807
 jmp .retngetlex
.getlex76:
;-445   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex75:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex77
 mov al, [thechar]
 cmp al, 61
 jne .getlex78
 call next
 mov ax, 824
 jmp .retngetlex
.getlex78:
;-446   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex77:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex79
 mov al, [thechar]
 cmp al, 61
 jne .getlex80
 call next
 mov ax, 811
 jmp .retngetlex
.getlex80:
;-447   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex79:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex81
 mov al, [thechar]
 cmp al, 60
 jne .getlex82
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex82:
;-448   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex81:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex83
 mov al, [thechar]
 cmp al, 62
 jne .getlex84
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex84:
;-449   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex83:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex85
 mov al, [thechar]
 cmp al, 43
 jne .getlex86
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex86:
;-450   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex85:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex87
 mov al, [thechar]
 cmp al, 45
 jne .getlex88
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex88:
;-451   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex87:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex89
 mov al, [thechar]
 cmp al, 61
 jne .getlex90
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex90:
;-452   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex89:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex91
 mov al, [thechar]
 cmp al, 61
 jne .getlex92
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex92:
;-453   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex91:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex93
 mov al, [thechar]
 cmp al, 61
 jne .getlex94
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex94:
;-454   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex93:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex95
 mov al, [thechar]
 cmp al, 61
 jne .getlex96
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex96:
;-455   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex95:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex97
 mov al, [thechar]
 cmp al, 61
 jne .getlex98
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex98:
;-456   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex97:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex99
 mov al, [thechar]
 cmp al, 61
 jne .getlex100
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex100:
;-457   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex99:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex101
 mov al, [bp-2]
 jmp .retngetlex
;-458   if (c == '/') {

.getlex101:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex102
;-459       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex103
;-460           do c=next();

.getlex104:
 call next
 mov [bp-2], al
;-461           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex105
 jmp .getlex104
.getlex105:
 call getlex
 jmp .retngetlex
;-462       }

;-463   }

.getlex103:
;-464   if (c == '/') {

.getlex102:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex106
;-465       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex107
;-466           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-467           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex108
 jmp .g2
;-468           if (thechar != '/') goto g2;

.getlex108:
 mov al, [thechar]
 cmp al, 47
 je  .getlex109
 jmp .g2
;-469           c=next();

.getlex109:
 call next
 mov [bp-2], al
;-470           return getlex();

 call getlex
 jmp .retngetlex
;-471       } else  return '/';

 jmp .getlex110
.getlex107:
 mov ax, 47
 jmp .retngetlex
;-472   }

.getlex110:
;-473   if (c == '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex111
;-474       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-475       c=next();

 call next
 mov [bp-2], al
;-476       while (c != '"') {

.getlex112:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex113
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

 jmp .getlex112
.getlex113:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-482       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-483   }

;-484   if (digit(c)) {

.getlex111:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex114
;-485       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-486       Llexval = (long) 0;//todo get number in long      

 xor eax, eax
 mov ax, 0
 mov dword [Llexval], eax
;-487       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-488       Llexval= (long) c-'0';

 xor eax, eax
 mov al, [bp-2]
 sub al, 48
 mov dword [Llexval], eax
;-489       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex115
 mov ax, 88
 mov byte [thechar], al
;-490       if (thechar=='X') {

.getlex115:
 mov al, [thechar]
 cmp al, 88
 jne .getlex116
;-491           next();

 call next
;-492           while(alnum(thechar)) {

.getlex117:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex118
;-493               c=next();

 call next
 mov [bp-2], al
;-494               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex119
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-495       	       if (c>64) c=c-7;

.getlex119:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex120
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-496                c=c-48;

.getlex120:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-497                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-498                Llexval = Llexval << 4; // * 16

 mov eax, [Llexval]
 shl eax, 4
 mov dword [Llexval], eax
;-499                i = (int) c;

 xor ax, ax
 mov al, [bp-2]
 mov [bp-86], ax
;-500                l = (long) c;

 xor eax, eax
 mov al, [bp-2]
 mov [bp-92], eax
;-501                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-86]
 mov word [lexval], ax
;-502                Llexval = Llexval + l;

 mov eax, [Llexval]
 add eax, [bp-92]
 mov dword [Llexval], eax
;-503            }

;-504        }else {

 jmp .getlex117
.getlex118:
 jmp .getlex121
.getlex116:
;-505            while(digit(thechar)) {

.getlex122:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex123
;-506                c=next();

 call next
 mov [bp-2], al
;-507                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-508                lexval=lexval*10;

 mov ax, [lexval]
;todo:save high part:mov [Longvar+2(+4)],(e)dx
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-509                Llexval = Llexval * 10;//16 bit mul

 mov eax, [Llexval]
;todo:save high part:mov [Longvar+2(+4)],(e)dx
 mov bx, 10
 mul bx
 mov dword [Llexval], eax
;-510 /*		    mov eax, [Llexval]

;-511 		    mov bx, 10

;-512             mul bx

;-513 		    mov dword [Llexval], eax

;-514 */

;-515 /*__asm{

;-516 			mov eax, [Llexval]

;-517 		    mov ebx, 10			; error

;-518             mul ebx

;-519 		    mov dword [Llexval], eax

;-520 }*/         

;-521                i = (int) c;

 xor ax, ax
 mov al, [bp-2]
 mov [bp-86], ax
;-522                l = (long) c;

 xor eax, eax
 mov al, [bp-2]
 mov [bp-92], eax
;-523                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-86]
 mov word [lexval], ax
;-524                Llexval = Llexval + l;

 mov eax, [Llexval]
 add eax, [bp-92]
 mov dword [Llexval], eax
;-525            }

;-526       }

 jmp .getlex122
.getlex123:
;-527 //      lexval = Llexval;//cast long to int 

;-528       return T_CONST;

.getlex121:
 mov ax, 257
 jmp .retngetlex
;-529   }

;-530   if (c==39) {//single apostrophe

.getlex114:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex124
;-531       lexval=next();

 call next
 mov word [lexval], ax
;-532       if (lexval==92) {//backslash

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex125
;-533           lexval=next();

 call next
 mov word [lexval], ax
;-534           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex126
 mov ax, 10
 mov word [lexval], ax
;-535           if (lexval=='t') lexval= 9;

.getlex126:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex127
 mov ax, 9
 mov word [lexval], ax
;-536           if (lexval=='0') lexval= 0;

.getlex127:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex128
 mov ax, 0
 mov word [lexval], ax
;-537           if (lexval=='\\') lexval=92;//backslash

.getlex128:
 mov ax, [lexval]
 cmp ax, 92
 jne .getlex129
 mov ax, 92
 mov word [lexval], ax
;-538       }

.getlex129:
;-539       next();

.getlex125:
 call next
;-540       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-541   }

;-542   if (alnum(c)) {

.getlex124:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex130
;-543     strcpy(symboltmp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [bp-84]
 push ax
 call strcpy
 add  sp, 4
;-544     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-545     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-546     p++;

 inc  word[bp-4]
;-547     while(alnum(thechar)) {

.getlex131:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex132
;-548         c=next();

 call next
 mov [bp-2], al
;-549         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-550         p++;

 inc  word[bp-4]
;-551     }

;-552     *p=0;

 jmp .getlex131
.getlex132:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-553     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 531
 jmp .retngetlex
;-554     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

.getlex133:
 push getlex_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 532
 jmp .retngetlex
;-555     if (eqstr(Symbol,"void"    )) return T_VOID;

.getlex134:
 push getlex_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 529
 jmp .retngetlex
;-556     if (eqstr(Symbol,"int"     )) return T_INT;

.getlex135:
 push getlex_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 517
 jmp .retngetlex
;-557     if (eqstr(Symbol,"long"    )) return T_LONG;

.getlex136:
 push getlex_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 533
 jmp .retngetlex
;-558     if (eqstr(Symbol,"inth"    )) return T_INTH;

.getlex137:
 push getlex_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 600
 jmp .retngetlex
;-559     if (eqstr(Symbol,"char"    )) return T_CHAR;

.getlex138:
 push getlex_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 530
 jmp .retngetlex
;-560     if (eqstr(Symbol,"asm"     )) return T_ASM;

.getlex139:
 push getlex_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 518
 jmp .retngetlex
;-561     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

.getlex140:
 push getlex_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 519
 jmp .retngetlex
;-562     if (eqstr(Symbol,"push"    )) return T_ASMDIRECT;

.getlex141:
 push getlex_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 525
 jmp .retngetlex
;-563     if (eqstr(Symbol,"pop"     )) return T_ASMDIRECT;

.getlex142:
 push getlex_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 525
 jmp .retngetlex
;-564     if (eqstr(Symbol,"iret"    )) return T_ASMDIRECT;

.getlex143:
 push getlex_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
 mov ax, 525
 jmp .retngetlex
;-565     if (eqstr(Symbol,"ret"     )) return T_ASMDIRECT;

.getlex144:
 push getlex_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
 mov ax, 525
 jmp .retngetlex
;-566     if (eqstr(Symbol,"cli"     )) return T_ASMDIRECT;

.getlex145:
 push getlex_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex146
 mov ax, 525
 jmp .retngetlex
;-567     if (eqstr(Symbol,"sti"     )) return T_ASMDIRECT;

.getlex146:
 push getlex_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex147
 mov ax, 525
 jmp .retngetlex
;-568     if (eqstr(Symbol,"__emit__")) return T_EMIT;

.getlex147:
 push getlex_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex148
 mov ax, 520
 jmp .retngetlex
;-569     if (eqstr(Symbol,"return"  )) return T_RETURN;

.getlex148:
 push getlex_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex149
 mov ax, 512
 jmp .retngetlex
;-570     if (eqstr(Symbol,"if"      )) return T_IF;

.getlex149:
 push getlex_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex150
 mov ax, 513
 jmp .retngetlex
;-571     if (eqstr(Symbol,"else"    )) return T_ELSE;

.getlex150:
 push getlex_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex151
 mov ax, 514
 jmp .retngetlex
;-572     if (eqstr(Symbol,"while"   )) return T_WHILE;

.getlex151:
 push getlex_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex152
 mov ax, 515
 jmp .retngetlex
;-573     if (eqstr(Symbol,"do"      )) return T_DO;

.getlex152:
 push getlex_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex153
 mov ax, 516
 jmp .retngetlex
;-574     if (eqstr(Symbol,"goto"    )) return T_GOTO;

.getlex153:
 push getlex_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex154
 mov ax, 521
 jmp .retngetlex
;-575     if (eqstr(Symbol,"define"  )) return T_DEFINE;

.getlex154:
 push getlex_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex155
 mov ax, 511
 jmp .retngetlex
;-576 

;-577     i=0;//convert define to value (lexval)

.getlex155:
 mov ax, 0
 mov [bp-86], ax
;-578     while (i < GTop) {

.getlex156:
 mov ax, [bp-86]
 cmp ax, [GTop]
 jge .getlex157
;-579         j=getVarName(i);

 push word [bp-86]
 call getVarName
 add  sp, 2
 mov [bp-88], ax
;-580         if (eqstr(Symbol,j)) {

 push word [bp-88]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex158
;-581             if (GType[i]=='#') {

 mov bx, [bp-86]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex159
;-582                 lexval=GData[i];

 mov bx, [bp-86]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-583                 strcpy(Symbol, symboltmp);

 lea  ax, [bp-84]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-584                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-585             }

;-586         }

.getlex159:
;-587         i++;

.getlex158:
 inc  word[bp-86]
;-588     }

;-589     return T_NAME; } 

 jmp .getlex156
.getlex157:
 mov ax, 256
 jmp .retngetlex
;-590     error1("Input item not recognized");

.getlex130:
 push getlex_24
 call error1
 add  sp, 2
;-591 }

;-592 

;-593 int istoken(int t) {

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
;-594     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;96 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken160
;-595         token=getlex();

 call getlex
 mov word [token], ax
;-596         return 1;

 mov ax, 1
 jmp .retnistoken
;-597     }

;-598     return 0;

.istoken160:
 mov ax, 0
 jmp .retnistoken
;-599 }

;-600 

;-601 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-602     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;96 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect161
;-603         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-604         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-605         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-606         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-607         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-608     }

;-609 }

.expect161:
;-610 

;-611 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-612     if (i < GTop) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v162
 push 91
 call prc
 add  sp, 2
;-613     printName(i);

.v162:
 push word [bp+4]
 call printName
 add  sp, 2
;-614     if (i < GTop) prc(']');

 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v163
 push 93
 call prc
 add  sp, 2
;-615 }

.v163:
;-616 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-617     int i;

;-618     i=strlen(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;96 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-619     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen164
 push checknamelen_0
 call error1
 add  sp, 2
;-620 }

.checknamelen164:
;-621 

;-622 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-623     unsigned int i; unsigned int j;

;-624     i=GTop;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;96 var unsg word i = bp-2
;97 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, [GTop]
 mov [bp-2], ax
;-625     while(i<LTop) {//todo look for local var first

.checkName165:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName166
;-626         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-627         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName167
 mov ax, [bp-2]
 jmp .retncheckName
;-628         i++;

.checkName167:
 inc  word[bp-2]
;-629     }

;-630     i=1;

 jmp .checkName165
.checkName166:
 mov ax, 1
 mov [bp-2], ax
;-631     while(i<GTop) {

.checkName168:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName169
;-632         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-633         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName170
 mov ax, [bp-2]
 jmp .retncheckName
;-634         i++;

.checkName170:
 inc  word[bp-2]
;-635     }

;-636     return 0;

 jmp .checkName168
.checkName169:
 mov ax, 0
 jmp .retncheckName
;-637 }

;-638 

;-639 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-640     unsigned int i;

;-641     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-642     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname171
 push searchname_0
 call error1
 add  sp, 2
;-643     return i;

.searchname171:
 mov ax, [bp-2]
 jmp .retnsearchname
;-644 }

;-645 

;-646 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-647     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1172
 push name1_0
 call error1
 add  sp, 2
;-648     token=getlex();

.name1172:
 call getlex
 mov word [token], ax
;-649 }

;-650 

;-651 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-652     int m; //0=V,1=*,2=&

;-653     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;96 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-654     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName173
 mov ax, 83
 mov byte [issign], al
;-655     if(istoken(T_UNSIGNED)) issign='U';

.typeName173:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName174
 mov ax, 85
 mov byte [issign], al
;-656     iswidth=2;

.typeName174:
 mov ax, 2
 mov byte [iswidth], al
;-657     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName175
 mov ax, 0
 mov byte [iswidth], al
;-658     if(istoken(T_CHAR))     iswidth=1;

.typeName175:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName176
 mov ax, 1
 mov byte [iswidth], al
;-659     if(istoken(T_INT))      iswidth=2;

.typeName176:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName177
 mov ax, 2
 mov byte [iswidth], al
;-660     if(istoken(T_LONG))     iswidth=4;

.typeName177:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName178
 mov ax, 4
 mov byte [iswidth], al
;-661     istype='V';

.typeName178:
 mov ax, 86
 mov byte [istype], al
;-662     m=0;

 mov ax, 0
 mov [bp-2], ax
;-663     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName179
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-664     if(istoken('&'))  {istype='&'; m=2;}

.typeName179:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName180
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-665     name1();

.typeName180:
 call name1
;-666     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-667 }

;-668 

;-669 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-670     char c;

;-671     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;96 var sign word i = bp+4
;97 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-672     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes181
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes182
.gettypes181:
 mov ax, 0
 mov word [signi], ax
;-673     c=GWidth[i];

.gettypes182:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-674     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-675     wi=0;

 mov ax, 0
 mov word [wi], ax
;-676     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes183
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-677     if (c==2) {widthi=2;wi=2;}

.gettypes183:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes184
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-678     if (c==4) {widthi=4;wi=4;}

.gettypes184:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes185
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-679     c=GType [i];

.gettypes185:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-680     typei=0;

 mov ax, 0
 mov word [typei], ax
;-681     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes186
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-682     if (c=='&')  typei=2;

.gettypes186:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes187
 mov ax, 2
 mov word [typei], ax
;-683     return i;

.gettypes187:
 mov ax, [bp+4]
 jmp .retngettypes
;-684 }

;-685 

;-686 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-687     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal188
 push addlocal_0
 call error1
 add  sp, 2
;-688     if (checkName() != 0) error1("Variable already defined");

.addlocal188:
 call checkName
 cmp ax, 0
 je  .addlocal189
 push addlocal_1
 call error1
 add  sp, 2
;-689     GSign[LTop]=issign;

.addlocal189:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-690     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-691     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-692     pt=getVarName(LTop);

 push word [LTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-693     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-694     storeVarName();

 call storeVarName
;-695 }

;-696 

;-697 

;-698 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-699        if(iscmp==T_EQ) printstring("\n jne .");         //ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;96 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg190
 push cmpneg_0
 call printstring
 add  sp, 2
;-700   else if(iscmp==T_NE) printstring("\n je  .");         //ZF=1

 jmp .cmpneg191
.cmpneg190:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg192
 push cmpneg_1
 call printstring
 add  sp, 2
;-701   else if(iscmp==T_LE) if (ids) printstring("\n jg  .");//ZF=0 SF=O

 jmp .cmpneg193
.cmpneg192:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg194
 mov ax, [bp+4]
 or  al, al
 je .cmpneg195
 push cmpneg_2
 call printstring
 add  sp, 2
;-702                        else     printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg196
.cmpneg195:
 push cmpneg_3
 call printstring
 add  sp, 2
;-703   else if(iscmp==T_GE) if (ids){printstring(" ;unsigned : ");

.cmpneg196:
 jmp .cmpneg197
.cmpneg194:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg198
 mov ax, [bp+4]
 or  al, al
 je .cmpneg199
 push cmpneg_4
 call printstring
 add  sp, 2
;-704                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-705                                 printstring("\n jl  .");}//SF!=O

 push cmpneg_5
 call printstring
 add  sp, 2
;-706                        else    {printstring(" ;unsigned : ");

 jmp .cmpneg200
.cmpneg199:
 push cmpneg_6
 call printstring
 add  sp, 2
;-707                                 printunsigned(ids);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-708                                 printstring("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call printstring
 add  sp, 2
;-709   else if(iscmp=='<' ) printstring("\n jge .");          //SF=O

.cmpneg200:
 jmp .cmpneg201
.cmpneg198:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg202
 push cmpneg_8
 call printstring
 add  sp, 2
;-710   else if(iscmp=='>' ) printstring("\n jle .");          //ZF=1 | SF!=O

 jmp .cmpneg203
.cmpneg202:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg204
 push cmpneg_9
 call printstring
 add  sp, 2
;-711   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg205
.cmpneg204:
 push cmpneg_10
 call error1
 add  sp, 2
;-712 }

.cmpneg205:
.cmpneg203:
.cmpneg201:
.cmpneg197:
.cmpneg193:
.cmpneg191:
;-713 

;-714 int isrelational() {

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
;-715     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational206
 jmp .w
;-716     if (token==T_NE) goto w;

.isrelational206:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational207
 jmp .w
;-717     if (token==T_LE) goto w;

.isrelational207:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational208
 jmp .w
;-718     if (token==T_GE) goto w;

.isrelational208:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational209
 jmp .w
;-719     if (token=='<' ) goto w;

.isrelational209:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational210
 jmp .w
;-720     if (token=='>' ) goto w;

.isrelational210:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational211
 jmp .w
;-721     return 0;

.isrelational211:
 mov ax, 0
 jmp .retnisrelational
;-722 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-723     token=getlex();

 call getlex
 mov word [token], ax
;-724     return 1;

 mov ax, 1
 jmp .retnisrelational
;-725 }

;-726 

;-727 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-728   if (strlen(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg212
 mov ax, 0
 jmp .retncheckreg
;-729   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

.checkreg212:
 push checkreg_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 1
 jmp .retncheckreg
.checkreg213:
 push checkreg_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 3
 jmp .retncheckreg
;-730   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

.checkreg214:
 push checkreg_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 5
 jmp .retncheckreg
.checkreg215:
 push checkreg_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 7
 jmp .retncheckreg
;-731   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

.checkreg216:
 push checkreg_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 9
 jmp .retncheckreg
.checkreg217:
 push checkreg_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 11
 jmp .retncheckreg
;-732   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

.checkreg218:
 push checkreg_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 13
 jmp .retncheckreg
.checkreg219:
 push checkreg_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 15
 jmp .retncheckreg
;-733   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

.checkreg220:
 push checkreg_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 17
 jmp .retncheckreg
.checkreg221:
 push checkreg_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 19
 jmp .retncheckreg
;-734   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

.checkreg222:
 push checkreg_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 21
 jmp .retncheckreg
.checkreg223:
 push checkreg_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 23
 jmp .retncheckreg
;-735   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

.checkreg224:
 push checkreg_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 25
 jmp .retncheckreg
.checkreg225:
 push checkreg_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 27
 jmp .retncheckreg
;-736   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

.checkreg226:
 push checkreg_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 29
 jmp .retncheckreg
.checkreg227:
 push checkreg_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 31
 jmp .retncheckreg
;-737   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

.checkreg228:
 push checkreg_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 33
 jmp .retncheckreg
.checkreg229:
 push checkreg_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 35
 jmp .retncheckreg
;-738   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

.checkreg230:
 push checkreg_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 37
 jmp .retncheckreg
.checkreg231:
 push checkreg_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 39
 jmp .retncheckreg
;-739   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

.checkreg232:
 push checkreg_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 41
 jmp .retncheckreg
.checkreg233:
 push checkreg_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 43
 jmp .retncheckreg
;-740   // (eqstr(Symbol,"ip")) return 45;

;-741   if (strlen(Symbol) >   3) return 0;

.checkreg234:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg235
 mov ax, 0
 jmp .retncheckreg
;-742   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

.checkreg235:
 push checkreg_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg236
 mov ax, 47
 jmp .retncheckreg
.checkreg236:
 push checkreg_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg237
 mov ax, 50
 jmp .retncheckreg
;-743   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

.checkreg237:
 push checkreg_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg238
 mov ax, 53
 jmp .retncheckreg
.checkreg238:
 push checkreg_25
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg239
 mov ax, 56
 jmp .retncheckreg
;-744   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

.checkreg239:
 push checkreg_26
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg240
 mov ax, 59
 jmp .retncheckreg
.checkreg240:
 push checkreg_27
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg241
 mov ax, 62
 jmp .retncheckreg
;-745   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

.checkreg241:
 push checkreg_28
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg242
 mov ax, 65
 jmp .retncheckreg
.checkreg242:
 push checkreg_29
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg243
 mov ax, 68
 jmp .retncheckreg
;-746 //  if (eqstr(Symbol,"cr0")) return 71;

;-747   return 0;

.checkreg243:
 mov ax, 0
 jmp .retncheckreg
;-748 }

;-749 

;-750 char printregstr[]

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
;-751 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-752 

;-753 int printreg(int i) {


printreg: PROC
;-754     unsigned int k; unsigned char c;

;-755     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;97 var sign word i = bp+4
;98 var unsg word k = bp-2
;99 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-756     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-757     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-758     i++;

 inc  word[bp+4]
;-759     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-760     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-761     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-762     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg244
;-763         i++;

 inc  word[bp+4]
;-764         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-765         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-766         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-767         }

;-768 }

.printreg244:
;-769 

;-770 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 33457
ops resb 5
section .text
;-771 int doreg1(int iscmp1) {


doreg1: PROC
;-772     int i;

;-773     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;98 var sign word iscmp1 = bp+4
;99 var sign word i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1245
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-774     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1245:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1246
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-775     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1246:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1247
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-776     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1247:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1248
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-777     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1248:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1249
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-778     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1249:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1250
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-779     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1250:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1251
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-780     if (iscmp1 == 1) {

.doreg1251:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1252
;-781             token=getlex();

 call getlex
 mov word [token], ax
;-782             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1253
 push doreg1_7
 call error1
 add  sp, 2
;-783             strcpy(ops, "cmp");

.doreg1253:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-784         }

;-785     printstring("\n ");

.doreg1252:
 push doreg1_9
 call printstring
 add  sp, 2
;-786     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-787     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-788     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-789     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-790 

;-791     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1254
;-792         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-793         goto reg1;

 jmp .reg1
;-794         }

;-795     mod2=typeName();

.doreg1254:
 call typeName
 mov word [mod2], ax
;-796     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-797     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1255
;-798         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-799         goto reg1;

 jmp .reg1
;-800         }

;-801     i=searchname();

.doreg1255:
 call searchname
 mov [bp-2], ax
;-802     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1256
 push word [bp-2]
 call printName
 add  sp, 2
;-803         else v(i);

 jmp .doreg1257
.doreg1256:
 push word [bp-2]
 call v
 add  sp, 2
;-804 reg1: if (iscmp1 == 1) {

.doreg1257:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1258
;-805     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-806     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-807     expect(')');

 push 41
 call expect
 add  sp, 2
;-808     }

;-809 }

.doreg1258:
;-810 

;-811 int compoundass(char *op, int mode, int id1) {

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
;-812     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;98 ptr sign byte op = bp+4
;99 var sign word mode = bp+6
;100 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass259
 push compoundass_0
 call error1
 add  sp, 2
;-813     printstring("\n ");

.compoundass259:
 push compoundass_1
 call printstring
 add  sp, 2
;-814     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-815     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-816     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-817     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass260
 push compoundass_3
 call printstring
 add  sp, 2
;-818         else printstring("byte");

 jmp .compoundass261
.compoundass260:
 push compoundass_4
 call printstring
 add  sp, 2
;-819     v(id1);

.compoundass261:
 push word [bp+8]
 call v
 add  sp, 2
;-820     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-821     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-822     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-823 }

;-824 

;-825 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-826     gettypes(id1);

;Function : dovar1, Number local Var: 4
; # type sign width local variables
;98 var sign word mode = bp+4
;99 var sign word op = bp+6
;100 var sign word ixarr = bp+8
;101 var sign word id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-827     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1262
;-828         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-829         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-830         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-831         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1263
 push dovar1_2
 call printstring
 add  sp, 2
;-832         if(widthi == 2) printstring(" ax, [bx]");

.dovar1263:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1264
 push dovar1_3
 call printstring
 add  sp, 2
;-833         return;

.dovar1264:
 jmp .retndovar1
;-834         }

;-835     if (mode==2){// & = adr

.dovar1262:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1265
;-836         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-837         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-838         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-839         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-840         return;

 jmp .retndovar1
;-841         }

;-842     if (ixarr) {//array

.dovar1265:
 mov ax, [bp+8]
 or  al, al
 je .dovar1266
;-843         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-844         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-845         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1267
 push dovar1_7
 call printstring
 add  sp, 2
;-846         printstring("\n ");

.dovar1267:
 push dovar1_8
 call printstring
 add  sp, 2
;-847         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-848         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1268
 push dovar1_9
 call printstring
 add  sp, 2
;-849             else printstring(" al, ");

 jmp .dovar1269
.dovar1268:
 push dovar1_10
 call printstring
 add  sp, 2
;-850         prc('[');

.dovar1269:
 push 91
 call prc
 add  sp, 2
;-851         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-852         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-853         return;

 jmp .retndovar1
;-854         }

;-855     printstring("\n ");

.dovar1266:
 push dovar1_12
 call printstring
 add  sp, 2
;-856     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-857     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1270
 push dovar1_13
 call printstring
 add  sp, 2
;-858     if(wi==2) printstring(" ax, ");

.dovar1270:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1271
 push dovar1_14
 call printstring
 add  sp, 2
;-859     if(wi==4) printstring(" eax, ");

.dovar1271:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1272
 push dovar1_15
 call printstring
 add  sp, 2
;-860     v(id1);

.dovar1272:
 push word [bp+10]
 call v
 add  sp, 2
;-861 }

;-862 

;-863 int rterm(char *op) {

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
;-864     int mode; int opint; int ixarr; int id1;

;-865     if (istoken(T_CONST)) {

;Function : rterm, Number local Var: 5
; # type sign width local variables
;98 ptr sign byte op = bp+4
;99 var sign word mode = bp-2
;100 var sign word opint = bp-4
;101 var sign word ixarr = bp-6
;102 var sign word id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm273
;-866         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-867         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-868         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm274
 push rterm_1
 call printstring
 add  sp, 2
;-869         if (wi==2) printstring(" ax, ");

.rterm274:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm275
 push rterm_2
 call printstring
 add  sp, 2
;-870         if (wi==4) printstring(" eax, ");

.rterm275:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm276
 push rterm_3
 call printstring
 add  sp, 2
;-871         printunsigned(lexval);

.rterm276:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-872         return;

 jmp .retnrterm
;-873         }

;-874     mode=typeName();

.rterm273:
 call typeName
 mov [bp-2], ax
;-875     id1=searchname();

 call searchname
 mov [bp-8], ax
;-876     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-877     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm277
;-878         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-879         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-880         expect(']');

 push 93
 call expect
 add  sp, 2
;-881         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-882         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm278
 push rterm_4
 call error1
 add  sp, 2
;-883         }

.rterm278:
;-884     if (eqstr(Symbol,"ax")) return;

.rterm277:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm279
 jmp .retnrterm
;-885     opint=op;

.rterm279:
 mov ax, [bp+4]
 mov [bp-4], ax
;-886     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-887 }

;-888 

;-889 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-890     gettypes(i);

;Function : doassign, Number local Var: 4
; # type sign width local variables
;98 var sign word mode = bp+4
;99 var sign word i = bp+6
;100 var sign word ixarr = bp+8
;101 var sign word ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-891     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign280
;-892         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-893         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-894         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign281
 push doassign_1
 call printstring
 add  sp, 2
;-895             else  printstring("\n mov  [bx], al");

 jmp .doassign282
.doassign281:
 push doassign_2
 call printstring
 add  sp, 2
;-896         return;

.doassign282:
 jmp .retndoassign
;-897         }

;-898     if (mode==2) {// & = adr

.doassign280:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign283
;-899         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-900         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-901         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-902         return;

 jmp .retndoassign
;-903         }

;-904     if (ixarr) {

.doassign283:
 mov ax, [bp+8]
 or  al, al
 je .doassign284
;-905         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-906         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign285
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-907             else v(ixarr);

 jmp .doassign286
.doassign285:
 push word [bp+8]
 call v
 add  sp, 2
;-908         if (wi==2) printstring("\n shl bx, 1");

.doassign286:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign287
 push doassign_6
 call printstring
 add  sp, 2
;-909         printstring("\n mov [");

.doassign287:
 push doassign_7
 call printstring
 add  sp, 2
;-910         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-911         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign288
 push doassign_8
 call printstring
 add  sp, 2
;-912             else printstring("+bx], al");

 jmp .doassign289
.doassign288:
 push doassign_9
 call printstring
 add  sp, 2
;-913         return;

.doassign289:
 jmp .retndoassign
;-914         }

;-915     if (wi==1){

.doassign284:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign290
;-916         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-917         if(i<GTop) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign291
 push doassign_11
 call printstring
 add  sp, 2
;-918         v(i);

.doassign291:
 push word [bp+6]
 call v
 add  sp, 2
;-919         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-920         return;

 jmp .retndoassign
;-921         }

;-922     if (wi==2){

.doassign290:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign292
;-923         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-924         if(i<GTop) printstring("word ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign293
 push doassign_14
 call printstring
 add  sp, 2
;-925         v(i);

.doassign293:
 push word [bp+6]
 call v
 add  sp, 2
;-926         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-927         return;

 jmp .retndoassign
;-928         }

;-929     if (wi==4){

.doassign292:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign294
;-930         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-931         if(i<GTop) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign295
 push doassign_17
 call printstring
 add  sp, 2
;-932         v(i);

.doassign295:
 push word [bp+6]
 call v
 add  sp, 2
;-933         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-934         return;

 jmp .retndoassign
;-935         }

;-936 }

.doassign294:
;-937 

;-938 int domul(int ids) {

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
;-939     int mode; int id1;

;-940     if (ids) {

;Function : domul, Number local Var: 3
; # type sign width local variables
;98 var sign word ids = bp+4
;99 var sign word mode = bp-2
;100 var sign word id1 = bp-4;
 ENTER  4,0
 mov ax, [bp+4]
 or  al, al
 je .domul296
;-941 	    rterm("imul");

 push domul_0
 call rterm
 add  sp, 2
;-942 	    return;

 jmp .retndomul
;-943 	    }

;-944 	printstring("\n;todo:save high part:mov [Longvar+2(+4)],(e)dx");    

.domul296:
 push domul_1
 call printstring
 add  sp, 2
;-945 	if (istoken(T_CONST)) {//mul 123

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul297
;-946 		printstring("\n mov bx, ");

 push domul_2
 call printstring
 add  sp, 2
;-947 		printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-948 		printstring("\n mul bx");

 push domul_3
 call printstring
 add  sp, 2
;-949 		return;

 jmp .retndomul
;-950 	}

;-951 	mode=typeName();

.domul297:
 call typeName
 mov [bp-2], ax
;-952 	id1=searchname();

 call searchname
 mov [bp-4], ax
;-953 	if (mode) error1("only simple var as multiplier");

 mov ax, [bp-2]
 or  al, al
 je .domul298
 push domul_4
 call error1
 add  sp, 2
;-954 	gettypes(id1);

.domul298:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-955 	if (typei) error1("only simple int as multipier");

 mov ax, [typei]
 or  al, al
 je .domul299
 push domul_5
 call error1
 add  sp, 2
;-956 	if (wi==0) error1("multiplier");	

.domul299:
 mov ax, [wi]
 cmp ax, 0
 jne .domul300
 push domul_6
 call error1
 add  sp, 2
;-957 	if (wi==1) printstring("\n mul byte ");//  AL  MUL r/m8  = AX

.domul300:
 mov ax, [wi]
 cmp ax, 1
 jne .domul301
 push domul_7
 call printstring
 add  sp, 2
;-958 	if (wi==2) printstring("\n mul word ");//  AX  MUL r/m16 = DX:AX

.domul301:
 mov ax, [wi]
 cmp ax, 2
 jne .domul302
 push domul_8
 call printstring
 add  sp, 2
;-959 	if (wi==4) printstring("\n mul dword ");//EAX  MUL r/m32 = EDX:EAX

.domul302:
 mov ax, [wi]
 cmp ax, 4
 jne .domul303
 push domul_9
 call printstring
 add  sp, 2
;-960 	v(id1);

.domul303:
 push word [bp-4]
 call v
 add  sp, 2
;-961 }

;-962 

;-963 int doidiv(int ids) {

 .retndomul:
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n;todo:save high part:mov [Longvar+2(+4)],(e)dx",0
domul_2 db "\n mov bx, ",0
domul_3 db "\n mul bx",0
domul_4 db "only simple var as multiplier",0
domul_5 db "only simple int as multipier",0
domul_6 db "multiplier",0
domul_7 db "\n mul byte ",0
domul_8 db "\n mul word ",0
domul_9 db "\n mul dword ",0
ENDP

doidiv: PROC
;-964     int mode; int id1;

;-965     if (istoken(T_CONST)) {

;Function : doidiv, Number local Var: 3
; # type sign width local variables
;98 var sign word ids = bp+4
;99 var sign word mode = bp-2
;100 var sign word id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv304
;-966         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-967         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-968         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv305
 push doidiv_1
 call printstring
 add  sp, 2
;-969             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv306
.doidiv305:
 push doidiv_2
 call printstring
 add  sp, 2
;-970         return;    

.doidiv306:
 jmp .retndoidiv
;-971 	}

;-972 	mode=typeName();

.doidiv304:
 call typeName
 mov [bp-2], ax
;-973 	id1=searchname();

 call searchname
 mov [bp-4], ax
;-974 	if (mode) error1("only simple var as divisor");//no *, &

 mov ax, [bp-2]
 or  al, al
 je .doidiv307
 push doidiv_3
 call error1
 add  sp, 2
;-975 	gettypes(id1);//widthi, wi(0,1,2,4), typei(0, 1=*, 2=&)

.doidiv307:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-976 	if (typei) error1("only char int or long as simple var divisor");

 mov ax, [typei]
 or  al, al
 je .doidiv308
 push doidiv_4
 call error1
 add  sp, 2
;-977 	if (wi==0) error1("divisor");	

.doidiv308:
 mov ax, [wi]
 cmp ax, 0
 jne .doidiv309
 push doidiv_5
 call error1
 add  sp, 2
;-978 

;-979 	if (wi==1) {//   AX   DIV r/m8  =  AL(Quotient),  AH(Remainder)

.doidiv309:
 mov ax, [wi]
 cmp ax, 1
 jne .doidiv310
;-980 		if (ids) printstring("\n cbw\n idiv byte ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv311
 push doidiv_6
 call printstring
 add  sp, 2
;-981 			else printstring("\n div byte ");

 jmp .doidiv312
.doidiv311:
 push doidiv_7
 call printstring
 add  sp, 2
;-982 		}	

.doidiv312:
;-983 	if (wi==2) {//DX:AX   DIV r/m16 =  AX(Quotient),  DX(Remainder)

.doidiv310:
 mov ax, [wi]
 cmp ax, 2
 jne .doidiv313
;-984 		if (ids) printstring("\n cwd\n idiv word ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv314
 push doidiv_8
 call printstring
 add  sp, 2
;-985 			else printstring("\n xor dx, dx\n div word ");

 jmp .doidiv315
.doidiv314:
 push doidiv_9
 call printstring
 add  sp, 2
;-986 		}

.doidiv315:
;-987 	if (wi==4) {//EDX:EAX DIV r/m32 = EAX(Quotient), EDX(Remainder)

.doidiv313:
 mov ax, [wi]
 cmp ax, 4
 jne .doidiv316
;-988 		if (ids) printstring("\n cdq\n idiv dword ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv317
 push doidiv_10
 call printstring
 add  sp, 2
;-989 			else printstring("\n xor edx, edx\n div dword ");

 jmp .doidiv318
.doidiv317:
 push doidiv_11
 call printstring
 add  sp, 2
;-990 		}

.doidiv318:
;-991 	v(id1);

.doidiv316:
 push word [bp-4]
 call v
 add  sp, 2
;-992 }

;-993 

;-994 int domod(int ids) {

 .retndoidiv:
 LEAVE
 ret
doidiv_0 db "\n mov bx, ",0
doidiv_1 db "\n cwd\n idiv bx",0
doidiv_2 db "\n mov dx, 0\n div bx",0
doidiv_3 db "only simple var as divisor",0
doidiv_4 db "only char int or long as simple var divisor",0
doidiv_5 db "divisor",0
doidiv_6 db "\n cbw\n idiv byte ",0
doidiv_7 db "\n div byte ",0
doidiv_8 db "\n cwd\n idiv word ",0
doidiv_9 db "\n xor dx, dx\n div word ",0
doidiv_10 db "\n cdq\n idiv dword ",0
doidiv_11 db "\n xor edx, edx\n div dword ",0
ENDP

domod: PROC
;-995     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;98 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-996     if (wi==1) printstring("\n mov al, ah");

 mov ax, [wi]
 cmp ax, 1
 jne .domod319
 push domod_0
 call printstring
 add  sp, 2
;-997     if (wi==2) printstring("\n mov ax, dx");

.domod319:
 mov ax, [wi]
 cmp ax, 2
 jne .domod320
 push domod_1
 call printstring
 add  sp, 2
;-998     if (wi==4) printstring("\n mov eax, edx");

.domod320:
 mov ax, [wi]
 cmp ax, 4
 jne .domod321
 push domod_2
 call printstring
 add  sp, 2
;-999 }

.domod321:
;-1000 

;-1001 

;-1002 int docalltype[10]; int docallvalue[10];

 LEAVE
 ret
domod_0 db "\n mov al, ah",0
domod_1 db "\n mov ax, dx",0
domod_2 db "\n mov eax, edx",0
ENDP
section .bss
absolute 33462
docalltype resw 10
section .text
section .bss
absolute 33482
docallvalue resw 10
section .text
;-1003 

;-1004 int docall() {


docall: PROC
;-1005     int i; int narg; int t0;// 1=CONST, 2=String, 3=&, 4=Name, (5=reg) 

;-1006     int n0;  int sz32;

;-1007 	char procname[IDLENMAX]; 

;-1008     narg=0;

;Function : docall, Number local Var: 6
; # type sign width local variables
;100 var sign word i = bp-2
;101 var sign word narg = bp-4
;102 var sign word t0 = bp-6
;103 var sign word n0 = bp-8
;104 var sign word sz32 = bp-10
;105 arr sign byte procname[65495] = bp-41;
 ENTER  41,0
 mov ax, 0
 mov [bp-4], ax
;-1009     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-1010     checknamelen();

 call checknamelen
;-1011     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [bp-41]
 push ax
 call strcpy
 add  sp, 4
;-1012     expect('(');

 push 40
 call expect
 add  sp, 2
;-1013 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall322
;-1014 	    do {

.docall323:
;-1015 	        narg++;

 inc  word[bp-4]
;-1016 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall324
 push docall_0
 call error1
 add  sp, 2
;-1017 	        t0=0;

.docall324:
 mov ax, 0
 mov [bp-6], ax
;-1018             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall325
;-1019                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-1020                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-1021                 }

;-1022             if(istoken(T_STRING)){

.docall325:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall326
;-1023                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-1024                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-1025                 eprs("\n");

 push docall_1
 call eprs
 add  sp, 2
;-1026                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-1027                 eprc(95);//underscore

 push 95
 call eprc
 add  sp, 2
;-1028                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-1029                 eprs(" db ");

 push docall_2
 call eprs
 add  sp, 2
;-1030                 eprc(34);//doubel apostrophe

 push 34
 call eprc
 add  sp, 2
;-1031                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-1032                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-1033                 eprs(",0");

 push docall_3
 call eprs
 add  sp, 2
;-1034                 nconst++;

 inc  word[nconst]
;-1035                 }

;-1036             if(istoken('&'))     {

.docall326:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall327
;-1037                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-1038                 name1();

 call name1
;-1039                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-1040                 }

;-1041             if(istoken(T_NAME))  {

.docall327:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall328
;-1042                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-1043                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-1044                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-1045                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-1046                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall329
 mov ax, 3
 mov [bp-6], ax
;-1047 //todo push reg is missing t0=5

;-1048                 }

.docall329:
;-1049             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall328:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall330
 push docall_4
 call error1
 add  sp, 2
;-1050             docalltype [narg] = t0;

.docall330:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-1051             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-1052         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall331
 jmp .docall323
.docall331:
;-1053 

;-1054   	expect(')');

 push 41
 call expect
 add  sp, 2
;-1055   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-1056     do {

.docall332:
;-1057         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-1058         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-1059         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall333
;-1060             printstring("\n push ");

 push docall_5
 call printstring
 add  sp, 2
;-1061             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1062             }

;-1063         if(t0==2){

.docall333:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall334
;-1064             printstring("\n push ");

 push docall_6
 call printstring
 add  sp, 2
;-1065             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1066             prc(95);

 push 95
 call prc
 add  sp, 2
;-1067             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1068             }

;-1069         if(t0==3){

.docall334:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall335
;-1070             printstring("\n lea  ax, ");

 push docall_7
 call printstring
 add  sp, 2
;-1071             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1072             printstring("\n push ax");

 push docall_8
 call printstring
 add  sp, 2
;-1073             }

;-1074         if(t0==4){

.docall335:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall336
;-1075             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1076             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall337
;-1077                 printstring("\n push word ");

 push docall_9
 call printstring
 add  sp, 2
;-1078                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1079                 }

;-1080             else {

 jmp .docall338
.docall337:
;-1081                 printstring("\n mov al, byte ");

 push docall_10
 call printstring
 add  sp, 2
;-1082                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1083                 printstring("\n mov ah, 0\n push ax");

 push docall_11
 call printstring
 add  sp, 2
;-1084                 }

;-1085             }

.docall338:
;-1086         if(t0==5){

.docall336:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall339
;-1087             printstring("\n push ");

 push docall_12
 call printstring
 add  sp, 2
;-1088             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1089             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall340
 mov ax, [bp-10]
 add ax, 2
;-1090             }

.docall340:
;-1091         i--;

.docall339:
 dec  word[bp-2]
;-1092         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall341
 jmp .docall332
.docall341:
;-1093     }

;-1094 	printstring("\n call ");

.docall322:
 push docall_13
 call printstring
 add  sp, 2
;-1095 	printstring(&procname);

 lea  ax, [bp-41]
 push ax
 call printstring
 add  sp, 2
;-1096 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall342
;-1097 	    printstring("\n add  sp, ");

 push docall_14
 call printstring
 add  sp, 2
;-1098         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1099         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1100         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1101         }

;-1102 }

.docall342:
;-1103 

;-1104 

;-1105 int expr() {

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
;-1106     int mode;   int id1;

;-1107     int ixarr;  int ixconst;

;-1108     int ids;    int isCONST;

;-1109     int i;      unsigned char *p;

;-1110 

;-1111 	if (istoken('(')) {//cast to int or long, clear destination

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
 push 40
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
;-1112 		     if(istoken(T_INT)) printstring("\n xor ax, ax");

 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .expr344
 push expr_0
 call printstring
 add  sp, 2
;-1113 		else if(istoken(T_LONG)) printstring("\n xor eax, eax");

 jmp .expr345
.expr344:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .expr346
 push expr_1
 call printstring
 add  sp, 2
;-1114 		else error1("only int or long allowed");

 jmp .expr347
.expr346:
 push expr_2
 call error1
 add  sp, 2
;-1115 		expect(')');

.expr347:
.expr345:
 push 41
 call expect
 add  sp, 2
;-1116 		}

;-1117     if (istoken(T_CONST)) {// constant ;

.expr343:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr348
;-1118         printstring("\n mov ax, ");

 push expr_3
 call printstring
 add  sp, 2
;-1119         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1120         return 4;

 mov ax, 4
 jmp .retnexpr
;-1121         }

;-1122     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr348:
 call typeName
 mov [bp-2], ax
;-1123     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1124     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr349
;-1125         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1126         return;

 jmp .retnexpr
;-1127         }

;-1128 

;-1129     if (token=='(')  {

.expr349:
 mov ax, [token]
 cmp ax, 40
 jne .expr350
;-1130         docall();

 call docall
;-1131         goto e1;

 jmp .e1
;-1132         }

;-1133 

;-1134     id1=searchname();

.expr350:
 call searchname
 mov [bp-4], ax
;-1135     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1136     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1137     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1138     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1139     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr351
;-1140         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr352
;-1141             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1142             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1143             expect(']');

 push 93
 call expect
 add  sp, 2
;-1144             }

;-1145         else {

 jmp .expr353
.expr352:
;-1146             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1147             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1148             expect(']');

 push 93
 call expect
 add  sp, 2
;-1149             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1150             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr354
 push expr_4
 call error1
 add  sp, 2
;-1151             }

.expr354:
;-1152         }

.expr353:
;-1153     if (istoken(T_PLUSPLUS  )) {

.expr351:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
;-1154         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr356
 push expr_5
 call error1
 add  sp, 2
;-1155         printstring("\n inc  ");

.expr356:
 push expr_6
 call printstring
 add  sp, 2
;-1156         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr357
 push expr_7
 call printstring
 add  sp, 2
 jmp .expr358
.expr357:
 push expr_8
 call printstring
 add  sp, 2
;-1157         v(id1);

.expr358:
 push word [bp-4]
 call v
 add  sp, 2
;-1158         goto e1;

 jmp .e1
;-1159         }

;-1160     if (istoken(T_MINUSMINUS)) {

.expr355:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr359
;-1161         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr360
 push expr_9
 call error1
 add  sp, 2
;-1162         printstring("\n dec  ");

.expr360:
 push expr_10
 call printstring
 add  sp, 2
;-1163         if (wi==2) printstring("word"); else printstring("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr361
 push expr_11
 call printstring
 add  sp, 2
 jmp .expr362
.expr361:
 push expr_12
 call printstring
 add  sp, 2
;-1164         v(id1);

.expr362:
 push word [bp-4]
 call v
 add  sp, 2
;-1165         goto e1;

 jmp .e1
;-1166         }

;-1167 

;-1168     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr359:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr363
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1169     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr363:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr364
 push word [bp-4]
 push word [bp-2]
 push expr_14
 call compoundass
 add  sp, 6
 jmp .e1
;-1170     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr364:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr365
 push word [bp-4]
 push word [bp-2]
 push expr_15
 call compoundass
 add  sp, 6
 jmp .e1
;-1171     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr365:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr366
 push word [bp-4]
 push word [bp-2]
 push expr_16
 call compoundass
 add  sp, 6
 jmp .e1
;-1172     if (istoken(T_MULASS  )) error1("not implemented");

.expr366:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr367
 push expr_17
 call error1
 add  sp, 2
;-1173     if (istoken(T_DIVASS  )) error1("not implemented");

.expr367:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr368
 push expr_18
 call error1
 add  sp, 2
;-1174 

;-1175     if (istoken('=')) {

.expr368:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr369
;-1176         expr();

 call expr
;-1177         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1178         goto e1;

 jmp .e1
;-1179         }

;-1180     dovar1(mode, "mov", ixarr, id1);

.expr369:
 push word [bp-4]
 push word [bp-6]
 push expr_19
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1181 

;-1182 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr370
 push expr_20
 call rterm
 add  sp, 2
;-1183     else if (istoken('-')) rterm("sub");

 jmp .expr371
.expr370:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr372
 push expr_21
 call rterm
 add  sp, 2
;-1184     else if (istoken('&')) rterm("and");

 jmp .expr373
.expr372:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr374
 push expr_22
 call rterm
 add  sp, 2
;-1185     else if (istoken('|')) rterm("or" );

 jmp .expr375
.expr374:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr376
 push expr_23
 call rterm
 add  sp, 2
;-1186     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr377
.expr376:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr378
 push expr_24
 call rterm
 add  sp, 2
;-1187     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr379
.expr378:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr380
 push expr_25
 call rterm
 add  sp, 2
;-1188     else if (istoken('*')) domul (ids);

 jmp .expr381
.expr380:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr382
 push word [bp-10]
 call domul
 add  sp, 2
;-1189     else if (istoken('/')) doidiv(ids);

 jmp .expr383
.expr382:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr384
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1190     else if (istoken('%')) domod (ids);

 jmp .expr385
.expr384:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr386
 push word [bp-10]
 call domod
 add  sp, 2
;-1191     if (isrelational()) {

.expr386:
.expr385:
.expr383:
.expr381:
.expr379:
.expr377:
.expr375:
.expr373:
.expr371:
 call isrelational
 or  al, al
 je .expr387
;-1192         rterm("cmp");

 push expr_26
 call rterm
 add  sp, 2
;-1193         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1194         }

;-1195     return 0;

.expr387:
 mov ax, 0
 jmp .retnexpr
;-1196 }

;-1197 

;-1198 int pexpr() {//called from if, do, while

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
;-1199     expect('(');

 push 40
 call expect
 add  sp, 2
;-1200     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1201     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr388
;-1202         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1203         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr389
;-1204             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1205             return;

 jmp .retnpexpr
;-1206             }

;-1207         }

.pexpr389:
;-1208 

;-1209     expr();

.pexpr388:
 call expr
;-1210     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr390
 push pexpr_0
 call printstring
 add  sp, 2
;-1211     printstring(fname);

.pexpr390:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1212     expect(')');

 push 41
 call expect
 add  sp, 2
;-1213 }

;-1214 

;-1215 

;-1216 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1217     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;100 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1218     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1219     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1220     prc(':');

 push 58
 call prc
 add  sp, 2
;-1221 }

;-1222 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1223     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;100 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1224     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1225     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1226 }

;-1227 

;-1228 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1229     int c; char cha;

;-1230     int jdest; int tst; int jtemp;

;-1231     if(istoken('{')) {

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
 je .stmt391
;-1232         while(istoken('}')==0) stmt();

.stmt392:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt393
 call stmt
;-1233         }

 jmp .stmt392
.stmt393:
;-1234     else if(istoken(T_IF)) {

 jmp .stmt394
.stmt391:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt395
;-1235         pexpr();

 call pexpr
;-1236         nlabel++;

 inc  word[nlabel]
;-1237         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1238         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1239         stmt();

 call stmt
;-1240         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt396
;-1241             nlabel++;

 inc  word[nlabel]
;-1242             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1243             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1244             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1245             stmt();

 call stmt
;-1246             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1247         }

;-1248         else prlabel(jdest);

 jmp .stmt397
.stmt396:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1249     }

.stmt397:
;-1250     else if(istoken(T_DO)) {

 jmp .stmt398
.stmt395:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt399
;-1251         nlabel++;

 inc  word[nlabel]
;-1252         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1253         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1254         stmt();

 call stmt
;-1255         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1256         pexpr();

 call pexpr
;-1257         nlabel++;

 inc  word[nlabel]
;-1258         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1259         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1260         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1261          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1262     }

;-1263     else if(istoken(T_WHILE)) {

 jmp .stmt400
.stmt399:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt401
;-1264         nlabel++;

 inc  word[nlabel]
;-1265         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1266         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1267         pexpr();

 call pexpr
;-1268         nlabel++;

 inc  word[nlabel]
;-1269         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1270         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1271         stmt();

 call stmt
;-1272         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1273         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1274     }

;-1275     else if(istoken(T_GOTO))  {

 jmp .stmt402
.stmt401:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt403
;-1276         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1277         name1();

 call name1
;-1278         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1279         expect(';');

 push 59
 call expect
 add  sp, 2
;-1280     }

;-1281     else if(token==T_ASM)     {

 jmp .stmt404
.stmt403:
 mov ax, [token]
 cmp ax, 518
 jne .stmt405
;-1282       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1283       c=next();

 call next
 mov [bp-2], ax
;-1284       while(c != '\n') {

.stmt406:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt407
;-1285         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1286         c=next();

 call next
 mov [bp-2], ax
;-1287         };

 jmp .stmt406
.stmt407:
;-1288         token=getlex();

 call getlex
 mov word [token], ax
;-1289     }

;-1290     else if(token==T_ASMDIRECT)     {

 jmp .stmt408
.stmt405:
 mov ax, [token]
 cmp ax, 525
 jne .stmt409
;-1291       printstring("\n");

 push stmt_2
 call printstring
 add  sp, 2
;-1292       printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1293       c=next();

 call next
 mov [bp-2], ax
;-1294       while(c != '\n') {

.stmt410:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt411
;-1295         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1296         c=next();

 call next
 mov [bp-2], ax
;-1297         };

 jmp .stmt410
.stmt411:
;-1298         token=getlex();

 call getlex
 mov word [token], ax
;-1299     }

;-1300     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt412
.stmt409:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt413
;-1301         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt414
;-1302             printstring("\n"); cha=next();

 push stmt_3
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1303             while(cha!= '}') {

.stmt415:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt416
;-1304                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1305                 cha=next();

 call next
 mov [bp-4], al
;-1306             }

;-1307             token=getlex();

 jmp .stmt415
.stmt416:
 call getlex
 mov word [token], ax
;-1308         } else error1("Curly open expected");

 jmp .stmt417
.stmt414:
 push stmt_4
 call error1
 add  sp, 2
;-1309     }

.stmt417:
;-1310     else if(istoken(T_INTH))  {

 jmp .stmt418
.stmt413:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt419
;-1311         printstring("\n int  ");

 push stmt_5
 call printstring
 add  sp, 2
;-1312         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1313         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1314         expect(';');

 push 59
 call expect
 add  sp, 2
;-1315     }

;-1316     else if(istoken(T_EMIT)) {

 jmp .stmt420
.stmt419:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt421
;-1317       printstring("\n db ");

 push stmt_6
 call printstring
 add  sp, 2
;-1318     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1319       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1320       token=getlex();

 call getlex
 mov word [token], ax
;-1321       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt422
;-1322           prc(',');

 push 44
 call prc
 add  sp, 2
;-1323           goto L1;

 jmp .L1
;-1324       }

;-1325       expect(')');

.stmt422:
 push 41
 call expect
 add  sp, 2
;-1326     }

;-1327     else if(istoken(';'))      { }

 jmp .stmt423
.stmt421:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt424
;-1328     else if(istoken(T_RETURN)) {

 jmp .stmt425
.stmt424:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt426
;-1329         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt427
 call expr
;-1330         printstring("\n jmp .retn");

.stmt427:
 push stmt_7
 call printstring
 add  sp, 2
;-1331         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1332         nreturn++;

 inc  word[nreturn]
;-1333         expect(';');

 push 59
 call expect
 add  sp, 2
;-1334     }

;-1335     else if(thechar==':')      {

 jmp .stmt428
.stmt426:
 mov al, [thechar]
 cmp al, 58
 jne .stmt429
;-1336         printstring("\n."); // Label

 push stmt_8
 call printstring
 add  sp, 2
;-1337         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1338         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1339         expect(':');

 push 58
 call expect
 add  sp, 2
;-1340     }

;-1341     else  {expr(); expect(';'); }

 jmp .stmt430
.stmt429:
 call expr
 push 59
 call expect
 add  sp, 2
;-1342 }

.stmt430:
.stmt428:
.stmt425:
.stmt423:
.stmt420:
.stmt418:
.stmt412:
.stmt408:
.stmt404:
.stmt402:
.stmt400:
.stmt398:
.stmt394:
;-1343 

;-1344 int isvariable() {

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
;-1345     if(token==T_SIGNED)   return 1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable431
 mov ax, 1
 jmp .retnisvariable
;-1346     if(token==T_UNSIGNED) return 1;

.isvariable431:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable432
 mov ax, 1
 jmp .retnisvariable
;-1347     if(token==T_CHAR)     return 1;

.isvariable432:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable433
 mov ax, 1
 jmp .retnisvariable
;-1348     if(token==T_INT)      return 1;

.isvariable433:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable434
 mov ax, 1
 jmp .retnisvariable
;-1349     if(token==T_LONG)     return 1;

.isvariable434:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable435
 mov ax, 1
 jmp .retnisvariable
;-1350     return 0;

.isvariable435:
 mov ax, 0
 jmp .retnisvariable
;-1351 }

;-1352 

;-1353 //***************************************************************

;-1354 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1355     unsigned int j;

;-1356     char c;

;-1357     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;100 var unsg word i = bp+4
;101 var unsg word j = bp-2
;102 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1358     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1359     prc(32);

 push 32
 call prc
 add  sp, 2
;-1360     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1361     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar436
 push listvar_1
 call printstring
 add  sp, 2
;-1362     if(c=='*')printstring("ptr ");

.listvar436:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar437
 push listvar_2
 call printstring
 add  sp, 2
;-1363     if(c=='&')printstring("arr ");

.listvar437:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar438
 push listvar_3
 call printstring
 add  sp, 2
;-1364     if(c=='#')printstring("def ");

.listvar438:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar439
 push listvar_4
 call printstring
 add  sp, 2
;-1365     c=GSign [i];

.listvar439:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1366     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar440
 push listvar_5
 call printstring
 add  sp, 2
;-1367     if(c=='U')printstring("unsg ");

.listvar440:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar441
 push listvar_6
 call printstring
 add  sp, 2
;-1368     c=GWidth[i];

.listvar441:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1369     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar442
 push listvar_7
 call printstring
 add  sp, 2
;-1370     if(c== 1)printstring("byte " );

.listvar442:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar443
 push listvar_8
 call printstring
 add  sp, 2
;-1371     if(c== 2)printstring("word " );

.listvar443:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar444
 push listvar_9
 call printstring
 add  sp, 2
;-1372     if(c== 4)printstring("long " );

.listvar444:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar445
 push listvar_10
 call printstring
 add  sp, 2
;-1373     pt=getVarName(i);

.listvar445:
 push word [bp+4]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1374     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1375     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar446
;-1376         prc('=');

 push 61
 call prc
 add  sp, 2
;-1377         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1378         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1379     }

;-1380     if(GType[i]=='&') {

.listvar446:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar447
;-1381         prc('[');

 push 91
 call prc
 add  sp, 2
;-1382         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1383         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1384         prc(']');

 push 93
 call prc
 add  sp, 2
;-1385     }

;-1386     if (i >= GTop) {

.listvar447:
 mov ax, [bp+4]
 cmp ax, [GTop] ;unsigned : 0
 jb  .listvar448
;-1387         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1388         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1389         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar449
 push 43
 call prc
 add  sp, 2
;-1390         printinteger(j);

.listvar449:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1391     }

;-1392 }

.listvar448:
;-1393 

;-1394 int listproc() {

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
;-1395     int i;

;-1396     if (LTop > GTop) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;100 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .listproc450
;-1397         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1398         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1399         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1400         i=LTop - GTop;

 mov ax, [LTop]
 sub ax, [GTop]
 mov [bp-2], ax
;-1401         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1402         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1403         i=GTop;

 mov ax, [GTop]
 mov [bp-2], ax
;-1404         while (i < LTop) {

.listproc451:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc452
;-1405             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1406             i++;

 inc  word[bp-2]
;-1407         }

;-1408     }

 jmp .listproc451
.listproc452:
;-1409 }

.listproc450:
;-1410 

;-1411 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1412     int FunctionIndex; char *p;

;-1413     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;100 var sign word FunctionIndex = bp-2
;101 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1414     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1415     while (FunctionIndex <= FunctionMaxIx ) {

.searchFunction453:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction454
;-1416         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction455
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1417         p = strlen(p) + p;

.searchFunction455:
 push word [bp-4]
 call strlen
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1418         p++;

 inc  word[bp-4]
;-1419         FunctionIndex++;

 inc  word[bp-2]
;-1420     }

;-1421     return 0;               //no function found

 jmp .searchFunction453
.searchFunction454:
 mov ax, 0
 jmp .retnsearchFunction
;-1422 }

;-1423 

;-1424 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1425     unsigned int i;

;-1426     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;100 var unsg word i = bp-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1427     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300 ;unsigned : 1
 jl  .storeFunction456
 push storeFunction_0
 call error1
 add  sp, 2
;-1428     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction456:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1429     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1430     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1431     i += IDLENMAX;

 add  word[bp-2], 31
;-1432     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000 ;unsigned : 0
 jb  .storeFunction457
 push storeFunction_1
 call error1
 add  sp, 2
;-1433 }

.storeFunction457:
;-1434 

;-1435 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1436     int nloc; unsigned int j;int narg;

;-1437     int VarNamePtrLocalStart;

;-1438     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;100 var sign word nloc = bp-2
;101 var unsg word j = bp-4
;102 var sign word narg = bp-6
;103 var sign word VarNamePtrLocalStart = bp-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1439     checknamelen();

 call checknamelen
;-1440     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1441     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc458
 push dofunc_0
 call error1
 add  sp, 2
;-1442     storeFunction();

.dofunc458:
 call storeFunction
;-1443 

;-1444     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1445     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1446     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1447     expect('(');

 push 40
 call expect
 add  sp, 2
;-1448     LTop=GTop;

 mov ax, [GTop]
 mov word [LTop], ax
;-1449     VarNamePtrLocalStart=VarNamePtr;

 mov ax, [VarNamePtr]
 mov [bp-8], ax
;-1450 

;-1451     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc459
;-1452         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1453         do {

.dofunc460:
;-1454             typeName();

 call typeName
;-1455             addlocal();

 call addlocal
;-1456             narg+=2;

 add  word[bp-6], 2
;-1457             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1458             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc461
 add  word[bp-6], 2
;-1459             LTop++;

.dofunc461:
 inc  word[LTop]
;-1460             }

;-1461         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc462
 jmp .dofunc460
.dofunc462:
;-1462         expect(')');

 push 41
 call expect
 add  sp, 2
;-1463         }

;-1464 

;-1465     expect('{'); //function body

.dofunc459:
 push 123
 call expect
 add  sp, 2
;-1466     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1467     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1468     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1469     while(isvariable()) {

.dofunc463:
 call isvariable
 or  al, al
 je .dofunc464
;-1470         do {

.dofunc465:
;-1471             typeName();

 call typeName
;-1472             checknamelen();

 call checknamelen
;-1473             addlocal();

 call addlocal
;-1474             nloc-=2;

 sub  word[bp-2], 2
;-1475             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc466
 sub  word[bp-2], 2
;-1476             GData[LTop]=nloc;

.dofunc466:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1477             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc467
;-1478                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1479                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1480                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1481                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1482                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1483                 nloc+=2;

 add  word[bp-2], 2
;-1484                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1485             }

;-1486             LTop++;

.dofunc467:
 inc  word[LTop]
;-1487         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc468
 jmp .dofunc465
.dofunc468:
;-1488         expect(';');

 push 59
 call expect
 add  sp, 2
;-1489     }

;-1490     listproc();

 jmp .dofunc463
.dofunc464:
 call listproc
;-1491     if (LTop>GTop){

 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc469
;-1492         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1493         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1494         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1495         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1496         }

;-1497 

;-1498     while(istoken('}')==0)  stmt();

.dofunc469:
.dofunc470:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc471
 call stmt
;-1499 

;-1500     if (nreturn) {

 jmp .dofunc470
.dofunc471:
 mov ax, [nreturn]
 or  al, al
 je .dofunc472
;-1501             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1502             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1503             prc(':');

 push 58
 call prc
 add  sp, 2
;-1504         }

;-1505     if (LTop > GTop) printstring("\n LEAVE");

.dofunc472:
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc473
 push dofunc_6
 call printstring
 add  sp, 2
;-1506     printstring("\n ret");

.dofunc473:
 push dofunc_7
 call printstring
 add  sp, 2
;-1507     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1508     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1509     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1510     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc474
 mov ax, [maxco1]
 mov word [maxco], ax
;-1511     printstring("\nENDP");

.dofunc474:
 push dofunc_8
 call printstring
 add  sp, 2
;-1512     VarNamePtr=VarNamePtrLocalStart;//delete local names

 mov ax, [bp-8]
 mov word [VarNamePtr], ax
;-1513 }

;-1514 

;-1515 char doglobName[IDLENMAX];

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
absolute 33502
doglobName resb 31
section .text
;-1516 int doglob() {


doglob: PROC
;-1517     int i; int j; int isstrarr;

;-1518     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;101 var sign word i = bp-2
;102 var sign word j = bp-4
;103 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1519     if (GTop >= VARMAX) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .doglob475
 push doglob_0
 call error1
 add  sp, 2
;-1520     if (iswidth == 0) error1("no VOID as var type");

.doglob475:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob476
 push doglob_1
 call error1
 add  sp, 2
;-1521     checknamelen();

.doglob476:
 call checknamelen
;-1522     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob477
 push doglob_2
 call error1
 add  sp, 2
;-1523     if (istoken('[')) {

.doglob477:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob478
;-1524         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1525         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob479
;-1526             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1527             printunsigned(orgDatai);

 push word [orgDatai]
 call printunsigned
 add  sp, 2
;-1528             printstring("\n"); printstring(Symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1529             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob480
 push doglob_5
 call printstring
 add  sp, 2
;-1530             if (iswidth==2) printstring(" resw ");

.doglob480:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob481
 push doglob_6
 call printstring
 add  sp, 2
;-1531             if (iswidth==4) printstring(" resd ");

.doglob481:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob482
 push doglob_7
 call printstring
 add  sp, 2
;-1532             printunsigned(lexval);

.doglob482:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1533             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1534             orgDatai=orgDatai+lexval;

 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1535             if (iswidth==2) orgDatai=orgDatai+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob483
 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1536             if (iswidth==4) {i= lexval * 3; orgDatai=orgDatai + i;}

.doglob483:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob484
 mov ax, [lexval]
;todo:save high part:mov [Longvar+2(+4)],(e)dx
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgDatai]
 add ax, [bp-2]
 mov word [orgDatai], ax
;-1537             GData[GTop]=lexval;

.doglob484:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1538             expect(']');

 push 93
 call expect
 add  sp, 2
;-1539         }else {

 jmp .doglob485
.doglob479:
;-1540             expect(']');

 push 93
 call expect
 add  sp, 2
;-1541             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob486
 push doglob_9
 call error1
 add  sp, 2
;-1542             printstring("\n");

.doglob486:
 push doglob_10
 call printstring
 add  sp, 2
;-1543             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1544             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1545             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1546             strcpy(doglobName, Symbol);//save Symbol name

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1547             expect('=');

 push 61
 call expect
 add  sp, 2
;-1548             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob487
;-1549                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1550                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1551                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1552                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1553                 i=strlen(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1554                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1555                 }

;-1556             else if (istoken('{' )) {

 jmp .doglob488
.doglob487:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob489
;-1557                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1558                 do {

.doglob490:
;-1559                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob491
 push 44
 call prc
 add  sp, 2
;-1560                     expect(T_CONST);

.doglob491:
 push 257
 call expect
 add  sp, 2
;-1561                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1562                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1563                     }

;-1564                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob492
 jmp .doglob490
.doglob492:
;-1565                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1566             }

;-1567         else error1("String or number array expected");

 jmp .doglob493
.doglob489:
 push doglob_13
 call error1
 add  sp, 2
;-1568         };

.doglob493:
.doglob488:
.doglob485:
;-1569     }else { //expect('=');

 jmp .doglob494
.doglob478:
;-1570         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1571         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1572         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob495
 push doglob_15
 call printstring
 add  sp, 2
;-1573         else {

 jmp .doglob496
.doglob495:
;-1574             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob497
 push doglob_16
 call printstring
 add  sp, 2
;-1575             else if (iswidth==2) printstring(" dw ");

 jmp .doglob498
.doglob497:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob499
 push doglob_17
 call printstring
 add  sp, 2
;-1576             else                 printstring(" dd ");

 jmp .doglob500
.doglob499:
 push doglob_18
 call printstring
 add  sp, 2
;-1577         }

.doglob500:
.doglob498:
;-1578     if(istoken('-')) prc('-');

.doglob496:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob501
 push 45
 call prc
 add  sp, 2
;-1579     if (istoken('=')) {

.doglob501:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob502
;-1580         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1581         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1582         }else printunsigned(0);

 jmp .doglob503
.doglob502:
 push 0
 call printunsigned
 add  sp, 2
;-1583     }

.doglob503:
;-1584     GSign[GTop]=issign;

.doglob494:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1585     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1586     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1587     pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1588     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob504
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1589         else strcpy(pt, Symbol);

 jmp .doglob505
.doglob504:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1590 	if (isstrarr) strcpy(Symbol, doglobName);

.doglob505:
 mov ax, [bp-6]
 or  al, al
 je .doglob506
 lea  ax, [doglobName]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-1591 	storeVarName();

.doglob506:
 call storeVarName
;-1592     GTop++;

 inc  word[GTop]
;-1593     expect(';');

 push 59
 call expect
 add  sp, 2
;-1594 }

;-1595 

;-1596 int dodefine() {

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
;-1597     expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1598     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine507
;-1599         if (GTop >= VARMAX) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 400 ;unsigned : 1
 jl  .dodefine508
 push dodefine_0
 call error1
 add  sp, 2
;-1600         checknamelen();

.dodefine508:
 call checknamelen
;-1601         if (checkName() != 0) error1("#Define var already defined");

 call checkName
 cmp ax, 0
 je  .dodefine509
 push dodefine_1
 call error1
 add  sp, 2
;-1602         if (eqstr(Symbol, "ORGDATA")) {

.dodefine509:
 push dodefine_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine510
;-1603             orgDataOriginal=lexval;

 mov ax, [lexval]
 mov word [orgDataOriginal], ax
;-1604             orgDatai=lexval;

 mov ax, [lexval]
 mov word [orgDatai], ax
;-1605             expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1606             return;

 jmp .retndodefine
;-1607         }

;-1608         GSign [GTop]='U';

.dodefine510:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1609         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1610         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1611         pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1612         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1613         storeVarName();

 call storeVarName
;-1614         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1615         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1616         GTop++;

 inc  word[GTop]
;-1617     }

;-1618 }

.dodefine507:
;-1619 

;-1620 int parse() {

 .retndodefine:
 ret
dodefine_0 db "global table (define) full",0
dodefine_1 db "#Define var already defined",0
dodefine_2 db "ORGDATA",0
ENDP

parse: PROC
;-1621     token=getlex();

 call getlex
 mov word [token], ax
;-1622     do {

.parse511:
;-1623         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse512
 mov ax, 1
 jmp .retnparse
;-1624         if (istoken('#')) {

.parse512:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse513
;-1625              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse514
 call dodefine
;-1626              else error1("define expected");

 jmp .parse515
.parse514:
 push parse_0
 call error1
 add  sp, 2
;-1627         }

.parse515:
;-1628     else{

 jmp .parse516
.parse513:
;-1629         typeName();

 call typeName
;-1630         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse517
 call dofunc
;-1631         else doglob(); }

 jmp .parse518
.parse517:
 call doglob
.parse518:
;-1632     } while(1);

.parse516:
 mov ax, 1
 or  al, al
 je .parse519
 jmp .parse511
.parse519:
;-1633 }

;-1634 

;-1635 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1636 int getarguments() {


getarguments: PROC
;-1637     int arglen1; unsigned int i; char *c;

;-1638     isPrint=1;

;Function : getarguments, Number local Var: 3
; # type sign width local variables
;103 var sign word arglen1 = bp-2
;104 var unsg word i = bp-4
;105 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1639     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1640     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarguments520
;-1641         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1642         cputs(" Usage: A.COM in_file[.C]: ");

 push getarguments_0
 call cputs
 add  sp, 2
;-1643         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1644         }

;-1645     i=arglen1+129;

.getarguments520:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1646     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1647     arglen1--;

 dec  word[bp-2]
;-1648     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1649     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1650     if (instr1(namein, '.') == 0) strcat(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarguments521
 push getarguments_1
 lea  ax, [namein]
 push ax
 call strcat
 add  sp, 4
;-1651     strcpy(namelst, namein);

.getarguments521:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1652     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1653     i--;

 dec  word[bp-4]
;-1654     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1655     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1656 }

;-1657 int openfiles() {

 LEAVE
 ret
getarguments_0 db " Usage: A.COM in_file[.C]: ",0
getarguments_1 db ".C",0
ENDP

openfiles: PROC
;-1658     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1659     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles522
;-1660         cputs("Source file missing (.C): ");

 push openfiles_0
 call cputs
 add  sp, 2
;-1661         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1662         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1663         }

;-1664     fdout=creatR(namelst);

.openfiles522:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1665     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles523
;-1666         cputs("list file not creatable: ");

 push openfiles_1
 call cputs
 add  sp, 2
;-1667         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1668         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1669         }

;-1670     printstring(";");

.openfiles523:
 push openfiles_2
 call printstring
 add  sp, 2
;-1671     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1672     printstring(", Input: "); printstring(namein);

 push openfiles_3
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1673     printstring(", Output: "); printstring(namelst);

 push openfiles_4
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1674 }

;-1675 

;-1676 int epilog() {

 ret
openfiles_0 db "Source file missing (.C): ",0
openfiles_1 db "list file not creatable: ",0
openfiles_2 db ";",0
openfiles_3 db ", Input: ",0
openfiles_4 db ", Output: ",0
ENDP

epilog: PROC
;-1677     unsigned int i;

;-1678     isPrint=1;

;Function : epilog, Number local Var: 1
; # type sign width local variables
;103 var unsg word i = bp-2;
 ENTER  2,0
 mov ax, 1
 mov byte [isPrint], al
;-1679     GTop--;

 dec  word[GTop]
;-1680     printstring("\n;Glob. variables:"); printunsigned(GTop);

 push epilog_0
 call printstring
 add  sp, 2
 push word [GTop]
 call printunsigned
 add  sp, 2
;-1681     printstring(" (");                  printunsigned(VARMAX);

 push epilog_1
 call printstring
 add  sp, 2
 push 400
 call printunsigned
 add  sp, 2
;-1682     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-1683     printstring("):");                  printunsigned(i);

 push epilog_2
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1684     printstring(" (");					printunsigned(VARNAMESMAX);

 push epilog_3
 call printstring
 add  sp, 2
 push 4000
 call printunsigned
 add  sp, 2
;-1685     printstring("), Functions:");       printunsigned(FunctionMaxIx);

 push epilog_4
 call printstring
 add  sp, 2
 push word [FunctionMaxIx]
 call printunsigned
 add  sp, 2
;-1686     printstring(" (");                  printunsigned(FUNCMAX);

 push epilog_5
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1687     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1688     printstring("):");                  printunsigned(i);

 push epilog_6
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1689     printstring(" (");					printunsigned(FUNCTIONNAMESMAX);

 push epilog_7
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1690     printstring(")\n;Lines:");          printunsigned(lineno);

 push epilog_8
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1691     printstring(", Constant: ");        printunsigned(maxco);

 push epilog_9
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1692     printstring(" (");                  printunsigned(COMAX);

 push epilog_10
 call printstring
 add  sp, 2
 push 4000
 call printunsigned
 add  sp, 2
;-1693     i = COMAX;

 mov ax, 4000
 mov [bp-2], ax
;-1694     i = i - maxco;

 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax
;-1695     if (i<=500)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-2]
 cmp ax, 500
 ja  .epilog524
 push epilog_11
 call printstring
 add  sp, 2
;-1696     printstring("), stacksize: ");

.epilog524:
 push epilog_12
 call printstring
 add  sp, 2
;-1697     i=65535;

 mov ax, 65535
 mov [bp-2], ax
;-1698     i=i-orgDatai;

 mov ax, [bp-2]
 sub ax, [orgDatai]
 mov [bp-2], ax
;-1699     printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1700     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog525
 push epilog_13
 call printstring
 add  sp, 2
;-1701 

;-1702 }

.epilog525:
;-1703 

;-1704 int main() {

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
;-1705     getarguments();

 call getarguments
;-1706     openfiles();

 call openfiles
;-1707     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1708     printstring("\norg  256 \njmp main");

 push main_0
 call printstring
 add  sp, 2
;-1709 

;-1710 	GTop = 1;

 mov ax, 1
 mov word [GTop], ax
;-1711     VarNamePtr= &VarNames;

 mov ax, VarNames
 mov word [VarNamePtr], ax
;-1712     FunctionNamePtr= &FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1713     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1714     orgDatai=orgDataOriginal;

 mov ax, [orgDataOriginal]
 mov word [orgDatai], ax
;-1715     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1716     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1717     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1718 

;-1719     parse();

 call parse
;-1720 

;-1721     epilog();

 call epilog
;-1722     end1(0);

 push 0
 call end1
 add  sp, 2
;-1723 }

 ret
main_0 db "\norg  256 \njmp main",0
ENDP
;Glob. variables:102 (400):818 (4000), Functions:79 (300):634 (3000)
;Lines:1724, Constant: 688 (4000), stacksize: 32002