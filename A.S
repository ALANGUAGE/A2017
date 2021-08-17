;PLA Compiler A.COM V1.2, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA Compiler A.COM V1.2";//17475 bytes. 32905 stack

Version1 db "PLA Compiler A.COM V1.2",0
;-2 /*todo:

;-3 	op=reg not recognized

;-4 	char, int,long var=const, shortcut for: mov ax,0; mov var,ax

;-5 	Property byte: 0-Null, 1-8Byte, 2-16Int, 3-32Long, 4-64LongLong

;-6 											5-Sign, 6-Ptr, 7_&Array

;-7 	L691: while (i<65528) jae without sign

;-8 	#ifdef debug, #endif

;-9 	statistic: var

;-10 	1. array[] not found

;-11 	if (long == const)

;-12 	long += 512; add byte

;-13 	var += var; not found error, better: only with const

;-14 */

;-15 #define IDLENMAX       31//max length of names

;-16 #define COLUMNMAX     128//output, input is 100

;-17 #define T_NAME        256//the following defines for better clearity > 255

;-18 #define T_CONST       257

;-19 #define T_STRING      258

;-20 #define T_DEFINE      511

;-21 #define T_RETURN      512

;-22 #define T_IF          513

;-23 #define T_ELSE        514

;-24 #define T_WHILE       515

;-25 #define T_DO          516

;-26 #define T_INT         517

;-27 #define T_ASM         518

;-28 #define T_ASMBLOCK    519

;-29 #define T_ASMDIRECT   525

;-30 #define T_EMIT        520

;-31 #define T_GOTO        521

;-32 #define T_VOID        529

;-33 #define T_CHAR        530

;-34 #define T_SIGNED      531

;-35 #define T_UNSIGNED    532

;-36 #define T_LONG        533

;-37 #define T_INTH        600

;-38 #define T_EQ          806

;-39 #define T_NE          807

;-40 #define T_GE          811

;-41 #define T_LE          824

;-42 #define T_PLUSPLUS   1219

;-43 #define T_MINUSMINUS 1225

;-44 #define T_PLUSASS    1230

;-45 #define T_MINUSASS   1231

;-46 #define T_MULASS     1232

;-47 #define T_DIVASS     1233

;-48 #define T_ANDASS     1234

;-49 #define T_ORASS      1235

;-50 #define T_LESSLESS   1240

;-51 #define T_GREATGREAT 1241

;-52 

;-53 char isPrint=1;//set screen listing

isPrint db 1
;-54 #define ORGDATA     20000//set to end of text=start of arrays

;-55 unsigned int orgDataOriginal=20000;//must be ORGDATA

orgDataOriginal dw 20000
;-56 unsigned int orgDatai;//actual max of array, must be less than stack

orgDatai dw 0
;-57 #define COMAX        4000

;-58 char co[COMAX];//constant storage

section .bss
absolute 20000
co resb 4000
section .text
;-59 int maxco=0;

maxco dw 0
;-60 int maxco1=0;

maxco1 dw 0
;-61 #define CMDLENMAX      67

;-62 char Symbol[COLUMNMAX];

section .bss
absolute 24000
Symbol resb 128
section .text
;-63 char fname[CMDLENMAX];

section .bss
absolute 24128
fname resb 67
section .text
;-64 char namein[CMDLENMAX];

section .bss
absolute 24195
namein resb 67
section .text
;-65 char namelst[CMDLENMAX];

section .bss
absolute 24262
namelst resb 67
section .text
;-66 char *cloc=0;

cloc dw 0
;-67 int fdin=0;

fdin dw 0
;-68 int fdout=0;

fdout dw 0
;-69 int token=0;

token dw 0
;-70 int column=0;

column dw 0
;-71 char thechar=0;   //reads one char forward

thechar db 0
;-72 int iscmp=0;

iscmp dw 0
;-73 int nconst=0;

nconst dw 0
;-74 int nreturn=0;

nreturn dw 0
;-75 int nlabel=0;‚

nlabel dw 0
;-76 unsigned int lexval=0;

lexval dw 0
;-77 unsigned long Llexval;

Llexval dd 0
;-78 int typei;       char istype;

typei dw 0
istype db 0
;-79 int signi;       char issign;

signi dw 0
issign db 0
;-80 int widthi;      char iswidth;

widthi dw 0
iswidth db 0
;-81 int wi=0;

wi dw 0
;-82 #define VARMAX        400//max global and local var

;-83 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 24329
GType resb 400
section .text
;-84 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 24729
GSign resb 400
section .text
;-85 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 25129
GWidth resb 400
section .text
;-86 int  GData [VARMAX];

section .bss
absolute 25529
GData resw 400
section .text
;-87 #define VARNAMESMAX 4000

;-88 char VarNames[VARNAMESMAX];//Space for global and local var names

section .bss
absolute 26329
VarNames resb 4000
section .text
;-89 char *VarNamePtr;   //first free position

VarNamePtr dw 0
;-90 int GTop=1;         //0 = empty

GTop dw 1
;-91 int LTop=1;

LTop dw 1
;-92 

;-93 #define FUNCMAX       300//max functions

;-94 #define FUNCTIONNAMESMAX 3000//Space for preceeding functon names

;-95 char FunctionNames[FUNCTIONNAMESMAX];

section .bss
absolute 30329
FunctionNames resb 3000
section .text
;-96 char *FunctionNamePtr;  //first free position in FunctionNames

FunctionNamePtr dw 0
;-97 int  FunctionMaxIx=0;   //number of functions

FunctionMaxIx dw 0
;-98 

;-99 char fgetsdest[COLUMNMAX];

section .bss
absolute 33329
fgetsdest resb 128
section .text
;-100 unsigned char *fgetsp=0;

fgetsp dw 0
;-101 unsigned int lineno=1;

lineno dw 1
;-102 unsigned char *pt=0;

pt dw 0
;-103 unsigned char *p1=0;

p1 dw 0
;-104 int DOS_ERR=0;

DOS_ERR dw 0
;-105 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-106 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-107 int ireg1;

ireg1 dw 0
;-108 int mod2;

mod2 dw 0
;-109 int ireg2;

ireg2 dw 0
;-110 

;-111 int test() {


test: PROC
;-112 	if (fdin > 500) ;

 mov ax, [fdin]
 cmp ax, 500
 jle .test1
;-113 	if (lexval > 500) ;

.test1:
 mov ax, [lexval]
 cmp ax, 500
 jle .test2
;-114 //	if (Llexval > 500) ;

;-115 //	if (Llexval == 500) ;

;-116 //	Llexval += 512;

;-117 //	lexval += nlabel;

;-118 	__asm{

.test2:

;-119 }	}


;-120 

;-121 

;-122 //---------------------------  Start LIB.C  --------------------

;-123 //------------------------------------   IO  -------------------

;-124 

;-125 int writetty()     {//char in AL

 ret
ENDP

writetty: PROC
;-126     ah=0x0E;

 mov  ah, 14
;-127     push bx

push bx
;-128     bx=0;     //page in BH

 mov  bx, 0
;-129     inth 0x10;

 int  16
;-130     pop bx

pop bx
;-131 }

;-132 int putch(char c)  {

 ret
ENDP

putch: PROC
;-133     if (c==10)  {// LF

;Function : putch, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch3
;-134         al=13;   // CR, write CR first and then LF

 mov  al, 13
;-135         writetty();

 call writetty
;-136     }

;-137     al=c;

.putch3:
 mov  al, [bp+4]
;-138     writetty();

 call writetty
;-139 }

;-140 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-141     unsigned char c;//var unsg byte c = bp+-2;

;-142     while(*s) {

;Function : cputs, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var unsg byte c = bp-2;
 ENTER  2,0
.cputs4:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs5
;-143         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-144         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-145         s++;

 inc  word[bp+4]
;-146     }

;-147 }

 jmp .cputs4
.cputs5:
;-148 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-149     n; // ax=n;

;Function : mkneg, Number local Var: 1
; # type sign width local variables
;96 var sign word n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
;-150     asm neg ax

 neg ax
;-151 }

;-152 

;-153 //--------------------------------  dos  -----------------------

;-154 

;-155 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-156     inth 0x21;

 int  33
;-157     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-158     DOS_ERR++;

 inc  word[DOS_ERR]
;-159 }

;-160 int openR (char *s) {

 ret
ENDP

openR: PROC
;-161 	dx=s;

;Function : openR, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-162     ax=0x3D02;

 mov  ax, 15618
;-163     DosInt();

 call DosInt
;-164 }

;-165 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-166     dx=s;

;Function : creatR, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
;-167     cx=0;

 mov  cx, 0
;-168     ax=0x3C00;

 mov  ax, 15360
;-169     DosInt();

 call DosInt
;-170 }

;-171 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-172     bx=fd;

;Function : fcloseR, Number local Var: 1
; # type sign width local variables
;96 var sign word fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
;-173     ax=0x3E00;

 mov  ax, 15872
;-174     DosInt();

 call DosInt
;-175 }

;-176 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-177     ah=0x4C;

;Function : exitR, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov  ah, 76
;-178     al=c;

 mov  al, [bp+4]
;-179     DosInt();

 call DosInt
;-180 }

;-181 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-182     dx=s;

;Function : readRL, Number local Var: 3
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign word fd = bp+6
;98 var sign word len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
;-183     cx=len;

 mov  cx, [bp+8]
;-184     bx=fd;

 mov  bx, [bp+6]
;-185     ax=0x3F00;

 mov  ax, 16128
;-186     DosInt();

 call DosInt
;-187 }

;-188 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-189     asm lea dx, [bp+4]; *n  todo: why not mov

;Function : fputcR, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte n = bp+4
;97 var sign word fd = bp+6;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov
;-190     cx=1;

 mov  cx, 1
;-191     bx=fd;

 mov  bx, [bp+6]
;-192     ax=0x4000;

 mov  ax, 16384
;-193     DosInt();

 call DosInt
;-194 }

;-195 

;-196 //--------------------------------  string  ---------------------

;-197 

;-198 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-199       if (c=='_') return 1;

;Function : letter, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-200       if (c=='.') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 46
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-201       if (c=='?') return 1;

.letter7:
 mov al, [bp+4]
 cmp al, 63
 jne .letter8
 mov ax, 1
 jmp .retnletter
;-202       if (c=='$') return 1;

.letter8:
 mov al, [bp+4]
 cmp al, 36
 jne .letter9
 mov ax, 1
 jmp .retnletter
;-203       if (c> 'z') return 0;

.letter9:
 mov al, [bp+4]
 cmp al, 122
 jle .letter10
 mov ax, 0
 jmp .retnletter
;-204       if (c< '@') return 0;// at included

.letter10:
 mov al, [bp+4]
 cmp al, 64
 jge .letter11
 mov ax, 0
 jmp .retnletter
;-205       if (c> 'Z') { if (c< 'a') return 0; }

.letter11:
 mov al, [bp+4]
 cmp al, 90
 jle .letter12
 mov al, [bp+4]
 cmp al, 97
 jge .letter13
 mov ax, 0
 jmp .retnletter
.letter13:
;-206       return 1;

.letter12:
 mov ax, 1
 jmp .retnletter
;-207 }

;-208 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-209       if(c<'0') return 0;

;Function : digit, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit14
 mov ax, 0
 jmp .retndigit
;-210       if(c>'9') return 0;

.digit14:
 mov al, [bp+4]
 cmp al, 57
 jle .digit15
 mov ax, 0
 jmp .retndigit
;-211       return 1;

.digit15:
 mov ax, 1
 jmp .retndigit
;-212 }

;-213 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-214     if (digit (c)) return 1;

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
 je .alnum16
 mov ax, 1
 jmp .retnalnum
;-215     if (letter(c)) return 1;

.alnum16:
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je .alnum17
 mov ax, 1
 jmp .retnalnum
;-216     return 0;

.alnum17:
 mov ax, 0
 jmp .retnalnum
;-217 }

;-218 

;-219 //int strlen(char *s) { int c;

;-220 //    c=0;

;-221 //    while (*s!=0) {s++; c++;}

;-222 //    return c;

;-223 //}

;-224 int strlen1(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen1: PROC
;-225     c=0;

;Function : strlen1, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign word c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-226     if (*s == 34) return 0; // "  quotation

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 34
 jne .strlen118
 mov ax, 0
 jmp .retnstrlen1
;-227     while (*s!=0) {s++; c++;}

.strlen118:
.strlen119:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen120
 inc  word[bp+4]
 inc  word[bp-2]
;-228     return c;

 jmp .strlen119
.strlen120:
 mov ax, [bp-2]
 jmp .retnstrlen1
;-229 }

;-230 

;-231 int strcpy(char *s, char *t) {//new

 .retnstrlen1:
 LEAVE
 ret
ENDP

strcpy: PROC
;-232     while (*t!=0) {

;Function : strcpy, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 ptr sign byte t = bp+6;
 ENTER  0,0
.strcpy21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy22
;-233     	*s=*t; s++; t++; }

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]
;-234     *s=0;

 jmp .strcpy21
.strcpy22:
 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-235     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-236 }

;-237 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-238     while(*p) {

;Function : eqstr, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte p = bp+4
;97 ptr sign byte q = bp+6;
 ENTER  0,0
.eqstr23:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr24
;-239         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr25
 mov ax, 0
 jmp .retneqstr
;-240         p++;

.eqstr25:
 inc  word[bp+4]
;-241         q++;

 inc  word[bp+6]
;-242     }

;-243     if(*q) return 0;

 jmp .eqstr23
.eqstr24:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr26
 mov ax, 0
 jmp .retneqstr
;-244     return 1;

.eqstr26:
 mov ax, 1
 jmp .retneqstr
;-245 }

;-246 int strcat(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat: PROC
;-247     while (*s != 0) s++;

;Function : strcat, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 ptr sign byte t = bp+6;
 ENTER  0,0
.strcat27:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat28
 inc  word[bp+4]
;-248     strcpy(s, t);

 jmp .strcat27
.strcat28:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-249 }

;-250 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-251     while(*s) {

;Function : toupper, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
.toupper29:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper30
;-252         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 97
 jl  .toupper31
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 122
 jg  .toupper32
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 sub ax, 32
 mov  bx, [bp+4]
 mov  [bx], al
;-253         s++;

.toupper32:
.toupper31:
 inc  word[bp+4]
;-254     }

;-255 }

 jmp .toupper29
.toupper30:
;-256 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-257     while(*s) {

;Function : instr1, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp+6;
 ENTER  0,0
.instr133:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr134
;-258         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr135
 mov ax, 1
 jmp .retninstr1
;-259         s++;

.instr135:
 inc  word[bp+4]
;-260     }

;-261     return 0;

 jmp .instr133
.instr134:
 mov ax, 0
 jmp .retninstr1
;-262 }

;-263 

;-264 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-265     *cloc=c;

;Function : eprc, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-266     cloc++;

 inc  word[cloc]
;-267 }

;-268 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-269     char c;

;-270     while(*s) {

;Function : eprs, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp-2;
 ENTER  2,0
.eprs36:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs37
;-271         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-272         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-273         s++;

 inc  word[bp+4]
;-274     }

;-275 }

 jmp .eprs36
.eprs37:
;-276 

;-277 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-278     if (isPrint) {

;Function : prc, Number local Var: 1
; # type sign width local variables
;96 var unsg byte c = bp+4;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc38
;-279         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc39
;-280             al=13;

 mov  al, 13
;-281             writetty();

 call writetty
;-282         }

;-283         al=c;

.prc39:
 mov  al, [bp+4]
;-284         writetty();

 call writetty
;-285     }

;-286     fputcR(c, fdout);

.prc38:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-287 }

;-288 

;-289 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-290     unsigned char c;

;-291     while(*s){

;Function : prscomment, Number local Var: 2
; # type sign width local variables
;96 ptr unsg byte s = bp+4
;97 var unsg byte c = bp-2;
 ENTER  2,0
.prscomment40:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment41
;-292         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-293         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-294         s++;

 inc  word[bp+4]
;-295     }

;-296 }

 jmp .prscomment40
.prscomment41:
;-297 

;-298 int printstring(unsigned char *s) {

 LEAVE
 ret
ENDP

printstring: PROC
;-299     unsigned char c; int com;

;-300     com=0;

;Function : printstring, Number local Var: 3
; # type sign width local variables
;96 ptr unsg byte s = bp+4
;97 var unsg byte c = bp-2
;98 var sign word com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-301     while(*s) {

.printstring42:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .printstring43
;-302         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-303         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .printstring44
 mov ax, [bp-4]
 or  al, al
 je .printstring45
 mov ax, 0
 mov [bp-4], ax
;-304                    else com=1;

 jmp .printstring46
.printstring45:
 mov ax, 1
 mov [bp-4], ax
;-305         if (c==92) {

.printstring46:
.printstring44:
 mov al, [bp-2]
 cmp al, 92
 jne .printstring47
;-306             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .printstring48
;-307                 s++;

 inc  word[bp+4]
;-308                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-309                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .printstring49
 mov ax, 10
 mov [bp-2], al
;-310                 if (c=='t') c= 9;

.printstring49:
 mov al, [bp-2]
 cmp al, 116
 jne .printstring50
 mov ax, 9
 mov [bp-2], al
;-311             }

.printstring50:
;-312         }

.printstring48:
;-313         prc(c);

.printstring47:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-314         s++;

 inc  word[bp+4]
;-315     }

;-316 }

 jmp .printstring42
.printstring43:
;-317 

;-318 int eprnum(int n){//for docall procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-319     int e;

;-320     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;96 var sign word n = bp+4
;97 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum51
;-321         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-322         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-323     }

;-324     if (n >= 10) {

.eprnum51:
 mov ax, [bp+4]
 cmp ax, 10
 jl  .eprnum52
;-325         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-326         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-327     }

;-328     n=n%10;

.eprnum52:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-329     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-330     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-331 }

;-332 

;-333 int printinteger (int n){

 LEAVE
 ret
ENDP

printinteger: PROC
;-334     int e;

;-335     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : printinteger, Number local Var: 2
; # type sign width local variables
;96 var sign word n = bp+4
;97 var sign word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .printinteger53
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-336     if (n >= 10) {

.printinteger53:
 mov ax, [bp+4]
 cmp ax, 10
 jl  .printinteger54
;-337         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-338         printinteger(e);

 push word [bp-2]
 call printinteger
 add  sp, 2
;-339     }

;-340     n=n%10;

.printinteger54:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-341     n += '0';

 add  word[bp+4], 48
;-342     prc(n);//only print with isPrint=on

 push word [bp+4]
 call prc
 add  sp, 2
;-343 }

;-344 

;-345 int printunsigned(unsigned int n) {

 LEAVE
 ret
ENDP

printunsigned: PROC
;-346     unsigned int e;

;-347     if (n >= 10) {

;Function : printunsigned, Number local Var: 2
; # type sign width local variables
;96 var unsg word n = bp+4
;97 var unsg word e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10
 jb  .printunsigned55
;-348         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-349         printunsigned(e);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-350     }

;-351     n = n % 10; /*unsigned mod*/

.printunsigned55:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-352     n += '0';

 add  word[bp+4], 48
;-353     prc(n);//only print with isPrint=on

 push word [bp+4]
 call prc
 add  sp, 2
;-354 }

;-355 

;-356 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-357     fcloseR(fdin);

;Function : end1, Number local Var: 1
; # type sign width local variables
;96 var sign word n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-358     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-359     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-360 }

;-361 

;-362 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-363     isPrint=1;

;Function : error1, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-364     lineno--;

 dec  word[lineno]
;-365     printstring("\n ");

 push error1_0
 call printstring
 add  sp, 2
;-366     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-367     printstring(";Line: ");

 push error1_1
 call printstring
 add  sp, 2
;-368     printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-369     printstring(" ************** ERROR: ");

 push error1_2
 call printstring
 add  sp, 2
;-370     printstring(s);

 push word [bp+4]
 call printstring
 add  sp, 2
;-371     printstring("  in column: ");

 push error1_3
 call printstring
 add  sp, 2
;-372     printunsigned(column);

 push word [column]
 call printunsigned
 add  sp, 2
;-373     printstring("\nToken: ");

 push error1_4
 call printstring
 add  sp, 2
;-374     printunsigned(token);

 push word [token]
 call printunsigned
 add  sp, 2
;-375     printstring(", Symbol: ");

 push error1_5
 call printstring
 add  sp, 2
;-376     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-377     end1(1);

 push 1
 call end1
 add  sp, 2
;-378 }

;-379 

;-380 int printinputline() {

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
;-381     int col;

;-382     col=0;

;Function : printinputline, Number local Var: 1
; # type sign width local variables
;96 var sign word col = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-383     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-384     do {

.printinputline56:
;-385         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-386         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline57
 jmp .retnprintinputline
;-387         *fgetsp=DOS_ByteRead;

.printinputline57:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-388         fgetsp++;

 inc  word[fgetsp]
;-389         col++;

 inc  word[bp-2]
;-390         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline58
 push printinputline_0
 call error1
 add  sp, 2
;-391         }

.printinputline58:
;-392         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline59
 jmp .printinputline56
.printinputline59:
;-393     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-394         printstring("\n;-");

 push printinputline_1
 call printstring
 add  sp, 2
;-395         printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-396         prc(' ');

 push 32
 call prc
 add  sp, 2
;-397         lineno++;

 inc  word[lineno]
;-398         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-399 }

;-400 

;-401 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-402     char c;

;-403     c=*fgetsp;

;Function : fgets1, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-404     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets160
;-405         printinputline();

 call printinputline
;-406         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets161
 mov ax, 0
 jmp .retnfgets1
;-407         fgetsp=&fgetsdest;

.fgets161:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-408         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-409         column=0;

 mov ax, 0
 mov word [column], ax
;-410     }

;-411     fgetsp++;

.fgets160:
 inc  word[fgetsp]
;-412     column++;

 inc  word[column]
;-413     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-414 }

;-415 

;-416 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-417     char r;

;-418     r = thechar;

;Function : next, Number local Var: 1
; # type sign width local variables
;96 var sign byte r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-419     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-420     return r;

 mov al, [bp-2]
 jmp .retnnext
;-421 }

;-422 

;-423 int storeVarName() {

 .retnnext:
 LEAVE
 ret
ENDP

storeVarName: PROC
;-424     unsigned int i;

;-425     VarNamePtr=strcpy(VarNamePtr, Symbol);

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
;-426     VarNamePtr++;

 inc  word[VarNamePtr]
;-427     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-428     i += IDLENMAX;

 add  word[bp-2], 31
;-429     if (i > VARNAMESMAX) error1("too many variable names");

 mov ax, [bp-2]
 cmp ax, 4000
 jle .storeVarName62
 push storeVarName_0
 call error1
 add  sp, 2
;-430 }

.storeVarName62:
;-431 

;-432 int getVarName(unsigned int i) {

 LEAVE
 ret
storeVarName_0 db "too many variable names",0
ENDP

getVarName: PROC
;-433 	int j; char *p;

;-434 	j = 1;

;Function : getVarName, Number local Var: 3
; # type sign width local variables
;96 var unsg word i = bp+4
;97 var sign word j = bp-2
;98 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, 1
 mov [bp-2], ax
;-435 	p = &VarNames;

 mov ax, VarNames
 mov [bp-4], ax
;-436 	while (j < i) {

.getVarName63:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 jge .getVarName64
;-437 		while (*p) p++;

.getVarName65:
 mov bx, [bp-4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .getVarName66
 inc  word[bp-4]
;-438 		p++;

 jmp .getVarName65
.getVarName66:
 inc  word[bp-4]
;-439 		j++;

 inc  word[bp-2]
;-440 	}

;-441 	return p;

 jmp .getVarName63
.getVarName64:
 mov ax, [bp-4]
 jmp .retngetVarName
;-442 }

;-443 

;-444 int printName(unsigned int i) {

 .retngetVarName:
 LEAVE
 ret
ENDP

printName: PROC
;-445     if (i < GTop) {

;Function : printName, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .printName67
;-446 	    i=getVarName(i);

 push word [bp+4]
 call getVarName
 add  sp, 2
 mov [bp+4], ax
;-447         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-448     }

;-449     else {

 jmp .printName68
.printName67:
;-450         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-451         i = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp+4], ax
;-452         if (i>0) prc('+');

 mov ax, [bp+4]
 cmp ax, 0
 jle .printName69
 push 43
 call prc
 add  sp, 2
;-453         printinteger(i);

.printName69:
 push word [bp+4]
 call printinteger
 add  sp, 2
;-454         prc(']');

 push 93
 call prc
 add  sp, 2
;-455     }

;-456 }

.printName68:
;-457 

;-458 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-459     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL70
 mov ax, 1
 jmp .retnifEOL
;-460     if (c == 13) {//CR

.ifEOL70:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL71
;-461         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL72
 call next
 mov [bp+4], al
;-462         return 1;

.ifEOL72:
 mov ax, 1
 jmp .retnifEOL
;-463     }

;-464     return 0;

.ifEOL71:
 mov ax, 0
 jmp .retnifEOL
;-465 }

;-466 

;-467 int getlex() {

 .retnifEOL:
 LEAVE
 ret
ENDP

getlex: PROC
;-468     char c; char *p;

;-469     char symboltmp[80];

;-470     int i; int j; long l;

;-471 

;-472 	do {

;Function : getlex, Number local Var: 6
; # type sign width local variables
;96 var sign byte c = bp-2
;97 ptr sign byte p = bp-4
;98 arr sign byte symboltmp[65452] = bp-84
;99 var sign word i = bp-86
;100 var sign word j = bp-88
;101 var sign long l = bp-92;
 ENTER  92,0
.getlex73:
;-473 		c=next();

 call next
 mov [bp-2], al
;-474     	if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex74
 mov ax, 0
 jmp .retngetlex
;-475     	}

.getlex74:
;-476     while (c <= ' ');

 mov al, [bp-2]
 cmp al, 32
 jg  .getlex75
 jmp .getlex73
.getlex75:
;-477 

;-478   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

 mov al, [bp-2]
 cmp al, 61
 jne .getlex76
 mov al, [thechar]
 cmp al, 61
 jne .getlex77
 call next
 mov ax, 806
 jmp .retngetlex
.getlex77:
;-479   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex76:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex78
 mov al, [thechar]
 cmp al, 61
 jne .getlex79
 call next
 mov ax, 807
 jmp .retngetlex
.getlex79:
;-480   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex78:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex80
 mov al, [thechar]
 cmp al, 61
 jne .getlex81
 call next
 mov ax, 824
 jmp .retngetlex
.getlex81:
;-481   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex80:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex82
 mov al, [thechar]
 cmp al, 61
 jne .getlex83
 call next
 mov ax, 811
 jmp .retngetlex
.getlex83:
;-482   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex82:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex84
 mov al, [thechar]
 cmp al, 60
 jne .getlex85
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex85:
;-483   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex84:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex86
 mov al, [thechar]
 cmp al, 62
 jne .getlex87
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex87:
;-484   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex86:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex88
 mov al, [thechar]
 cmp al, 43
 jne .getlex89
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex89:
;-485   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex88:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex90
 mov al, [thechar]
 cmp al, 45
 jne .getlex91
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex91:
;-486   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex90:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex92
 mov al, [thechar]
 cmp al, 61
 jne .getlex93
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex93:
;-487   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex92:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex94
 mov al, [thechar]
 cmp al, 61
 jne .getlex95
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex95:
;-488   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex94:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex96
 mov al, [thechar]
 cmp al, 61
 jne .getlex97
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex97:
;-489   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex96:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex98
 mov al, [thechar]
 cmp al, 61
 jne .getlex99
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex99:
;-490   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex98:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex100
 mov al, [thechar]
 cmp al, 61
 jne .getlex101
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex101:
;-491   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex100:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex102
 mov al, [thechar]
 cmp al, 61
 jne .getlex103
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex103:
;-492   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex102:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex104
 mov al, [bp-2]
 jmp .retngetlex
;-493   if (c == '/') {

.getlex104:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex105
;-494       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex106
;-495           do c=next();

.getlex107:
 call next
 mov [bp-2], al
;-496           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex108
 jmp .getlex107
.getlex108:
 call getlex
 jmp .retngetlex
;-497       }

;-498   }

.getlex106:
;-499   if (c == '/') {

.getlex105:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex109
;-500       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex110
;-501           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-502           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex111
 jmp .g2
;-503           if (thechar != '/') goto g2;

.getlex111:
 mov al, [thechar]
 cmp al, 47
 je  .getlex112
 jmp .g2
;-504           c=next();

.getlex112:
 call next
 mov [bp-2], al
;-505           return getlex();

 call getlex
 jmp .retngetlex
;-506       } else  return '/';

 jmp .getlex113
.getlex110:
 mov ax, 47
 jmp .retngetlex
;-507   }

.getlex113:
;-508   if (c == '"') {

.getlex109:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex114
;-509       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-510       c=next();

 call next
 mov [bp-2], al
;-511       while (c != '"') {

.getlex115:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex116
;-512           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-513           p++;

 inc  word[bp-4]
;-514           c=next();

 call next
 mov [bp-2], al
;-515           }

;-516           *p=0;

 jmp .getlex115
.getlex116:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-517       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-518   }

;-519   if (digit(c)) {

.getlex114:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-520       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-521       Llexval = (long) 0;//todo get number in long

 xor eax, eax
 mov ax, 0
 mov dword [Llexval], eax
;-522       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-523       Llexval= (long) c-'0';

 xor eax, eax
 mov al, [bp-2]
 sub al, 48
 mov dword [Llexval], eax
;-524       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex118
 mov ax, 88
 mov byte [thechar], al
;-525       if (thechar=='X') {

.getlex118:
 mov al, [thechar]
 cmp al, 88
 jne .getlex119
;-526           next();

 call next
;-527           while(alnum(thechar)) {

.getlex120:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex121
;-528               c=next();

 call next
 mov [bp-2], al
;-529               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex122
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-530       	       if (c>64) c=c-7;

.getlex122:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex123
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-531                c=c-48;

.getlex123:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-532                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-533                Llexval = Llexval << 4; // * 16

 mov eax, [Llexval]
 shl eax, 4
 mov dword [Llexval], eax
;-534                i = (int) c;

 xor ax, ax
 mov al, [bp-2]
 mov [bp-86], ax
;-535                l = (long) c;

 xor eax, eax
 mov al, [bp-2]
 mov [bp-92], eax
;-536                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-86]
 mov word [lexval], ax
;-537                Llexval = Llexval + l;

 mov eax, [Llexval]
 add eax, [bp-92]
 mov dword [Llexval], eax
;-538            }

;-539        }else {

 jmp .getlex120
.getlex121:
 jmp .getlex124
.getlex119:
;-540            while(digit(thechar)) {

.getlex125:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex126
;-541                c=next();

 call next
 mov [bp-2], al
;-542                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-543                lexval=lexval*10;

 mov ax, [lexval]
;todo:save high part:mov [Longvar+2(+4)],(e)dx
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-544 			asm	mov eax, [Llexval];//emulate: Llexval=Llexval*(long)10;

	mov eax, [Llexval];//emulate: Llexval=Llexval*(long)10;
;-545 		    __emit__ (0x66,0xBB,0x0A,0,0,0 );// error  mov ebx, 10

 db 102,187,10,0,0,0
;-546             asm mul ebx

 mul ebx
;-547 		    asm mov dword [Llexval], eax

 mov dword [Llexval], eax
;-548                i = (int) c;

 xor ax, ax
 mov al, [bp-2]
 mov [bp-86], ax
;-549                l = (long) c;

 xor eax, eax
 mov al, [bp-2]
 mov [bp-92], eax
;-550                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-86]
 mov word [lexval], ax
;-551                Llexval = Llexval + l;

 mov eax, [Llexval]
 add eax, [bp-92]
 mov dword [Llexval], eax
;-552            }

;-553       }

 jmp .getlex125
.getlex126:
;-554 //      lexval = Llexval;//cast long to int, todo remove calc of lexval

;-555 	if (Llexval != lexval) error1("lexval != Llexval");

.getlex124:
 mov eax, [Llexval]
 cmp ax, [lexval]
 je  .getlex127
 push getlex_1
 call error1
 add  sp, 2
;-556     return T_CONST;

.getlex127:
 mov ax, 257
 jmp .retngetlex
;-557   }

;-558   if (c==39) {//single apostrophe

.getlex117:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex128
;-559       lexval=next();

 call next
 mov word [lexval], ax
;-560       if (lexval==92) {//backslash

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex129
;-561           lexval=next();

 call next
 mov word [lexval], ax
;-562           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex130
 mov ax, 10
 mov word [lexval], ax
;-563           if (lexval=='t') lexval= 9;

.getlex130:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex131
 mov ax, 9
 mov word [lexval], ax
;-564           if (lexval=='0') lexval= 0;

.getlex131:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex132
 mov ax, 0
 mov word [lexval], ax
;-565           if (lexval=='\\') lexval=92;//backslash

.getlex132:
 mov ax, [lexval]
 cmp ax, 92
 jne .getlex133
 mov ax, 92
 mov word [lexval], ax
;-566       }

.getlex133:
;-567       next();

.getlex129:
 call next
;-568       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-569   }

;-570   if (alnum(c)) {

.getlex128:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex134
;-571     strcpy(symboltmp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [bp-84]
 push ax
 call strcpy
 add  sp, 4
;-572     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-573     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-574     p++;

 inc  word[bp-4]
;-575     while(alnum(thechar)) {

.getlex135:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex136
;-576         c=next();

 call next
 mov [bp-2], al
;-577         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-578         p++;

 inc  word[bp-4]
;-579     }

;-580     *p=0;

 jmp .getlex135
.getlex136:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-581     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 531
 jmp .retngetlex
;-582     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

.getlex137:
 push getlex_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 532
 jmp .retngetlex
;-583     if (eqstr(Symbol,"void"    )) return T_VOID;

.getlex138:
 push getlex_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 529
 jmp .retngetlex
;-584     if (eqstr(Symbol,"int"     )) return T_INT;

.getlex139:
 push getlex_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 517
 jmp .retngetlex
;-585     if (eqstr(Symbol,"long"    )) return T_LONG;

.getlex140:
 push getlex_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 533
 jmp .retngetlex
;-586     if (eqstr(Symbol,"inth"    )) return T_INTH;

.getlex141:
 push getlex_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 600
 jmp .retngetlex
;-587     if (eqstr(Symbol,"char"    )) return T_CHAR;

.getlex142:
 push getlex_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 530
 jmp .retngetlex
;-588     if (eqstr(Symbol,"asm"     )) return T_ASM;

.getlex143:
 push getlex_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
 mov ax, 518
 jmp .retngetlex
;-589     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

.getlex144:
 push getlex_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
 mov ax, 519
 jmp .retngetlex
;-590     if (eqstr(Symbol,"push"    )) return T_ASMDIRECT;

.getlex145:
 push getlex_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex146
 mov ax, 525
 jmp .retngetlex
;-591     if (eqstr(Symbol,"pop"     )) return T_ASMDIRECT;

.getlex146:
 push getlex_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex147
 mov ax, 525
 jmp .retngetlex
;-592     if (eqstr(Symbol,"iret"    )) return T_ASMDIRECT;

.getlex147:
 push getlex_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex148
 mov ax, 525
 jmp .retngetlex
;-593     if (eqstr(Symbol,"ret"     )) return T_ASMDIRECT;

.getlex148:
 push getlex_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex149
 mov ax, 525
 jmp .retngetlex
;-594     if (eqstr(Symbol,"cli"     )) return T_ASMDIRECT;

.getlex149:
 push getlex_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex150
 mov ax, 525
 jmp .retngetlex
;-595     if (eqstr(Symbol,"sti"     )) return T_ASMDIRECT;

.getlex150:
 push getlex_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex151
 mov ax, 525
 jmp .retngetlex
;-596     if (eqstr(Symbol,"__emit__")) return T_EMIT;

.getlex151:
 push getlex_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex152
 mov ax, 520
 jmp .retngetlex
;-597     if (eqstr(Symbol,"return"  )) return T_RETURN;

.getlex152:
 push getlex_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex153
 mov ax, 512
 jmp .retngetlex
;-598     if (eqstr(Symbol,"if"      )) return T_IF;

.getlex153:
 push getlex_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex154
 mov ax, 513
 jmp .retngetlex
;-599     if (eqstr(Symbol,"else"    )) return T_ELSE;

.getlex154:
 push getlex_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex155
 mov ax, 514
 jmp .retngetlex
;-600     if (eqstr(Symbol,"while"   )) return T_WHILE;

.getlex155:
 push getlex_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex156
 mov ax, 515
 jmp .retngetlex
;-601     if (eqstr(Symbol,"do"      )) return T_DO;

.getlex156:
 push getlex_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex157
 mov ax, 516
 jmp .retngetlex
;-602     if (eqstr(Symbol,"goto"    )) return T_GOTO;

.getlex157:
 push getlex_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex158
 mov ax, 521
 jmp .retngetlex
;-603     if (eqstr(Symbol,"define"  )) return T_DEFINE;

.getlex158:
 push getlex_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex159
 mov ax, 511
 jmp .retngetlex
;-604 

;-605     i=0;//convert define to value (lexval)

.getlex159:
 mov ax, 0
 mov [bp-86], ax
;-606     while (i < GTop) {

.getlex160:
 mov ax, [bp-86]
 cmp ax, [GTop]
 jge .getlex161
;-607         j=getVarName(i);

 push word [bp-86]
 call getVarName
 add  sp, 2
 mov [bp-88], ax
;-608         if (eqstr(Symbol,j)) {

 push word [bp-88]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex162
;-609             if (GType[i]=='#') {

 mov bx, [bp-86]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex163
;-610                 lexval=GData[i];

 mov bx, [bp-86]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-611                 strcpy(Symbol, symboltmp);

 lea  ax, [bp-84]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-612                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-613             }

;-614         }

.getlex163:
;-615         i++;

.getlex162:
 inc  word[bp-86]
;-616     }

;-617     return T_NAME; }

 jmp .getlex160
.getlex161:
 mov ax, 256
 jmp .retngetlex
;-618     error1("Input item not recognized");

.getlex134:
 push getlex_25
 call error1
 add  sp, 2
;-619 }

;-620 

;-621 int istoken(int t) {

 .retngetlex:
 LEAVE
 ret
getlex_0 db "()[]{},;*:%-><=+!&|#?",0
getlex_1 db "lexval != Llexval",0
getlex_2 db "signed",0
getlex_3 db "unsigned",0
getlex_4 db "void",0
getlex_5 db "int",0
getlex_6 db "long",0
getlex_7 db "inth",0
getlex_8 db "char",0
getlex_9 db "asm",0
getlex_10 db "__asm",0
getlex_11 db "push",0
getlex_12 db "pop",0
getlex_13 db "iret",0
getlex_14 db "ret",0
getlex_15 db "cli",0
getlex_16 db "sti",0
getlex_17 db "__emit__",0
getlex_18 db "return",0
getlex_19 db "if",0
getlex_20 db "else",0
getlex_21 db "while",0
getlex_22 db "do",0
getlex_23 db "goto",0
getlex_24 db "define",0
getlex_25 db "Input item not recognized",0
ENDP

istoken: PROC
;-622     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;96 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken164
;-623         token=getlex();

 call getlex
 mov word [token], ax
;-624         return 1;

 mov ax, 1
 jmp .retnistoken
;-625     }

;-626     return 0;

.istoken164:
 mov ax, 0
 jmp .retnistoken
;-627 }

;-628 

;-629 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-630     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;96 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect165
;-631         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-632         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-633         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-634         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-635         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-636     }

;-637 }

.expect165:
;-638 

;-639 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-640     if (i < GTop) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v166
 push 91
 call prc
 add  sp, 2
;-641     printName(i);

.v166:
 push word [bp+4]
 call printName
 add  sp, 2
;-642     if (i < GTop) prc(']');

 mov ax, [bp+4]
 cmp ax, [GTop]
 jge .v167
 push 93
 call prc
 add  sp, 2
;-643 }

.v167:
;-644 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-645     int i;

;-646     i=strlen1(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;96 var sign word i = bp-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen1
 add  sp, 2
 mov [bp-2], ax
;-647     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen168
 push checknamelen_0
 call error1
 add  sp, 2
;-648 }

.checknamelen168:
;-649 

;-650 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-651     unsigned int i; unsigned int j;

;-652     i=GTop;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;96 var unsg word i = bp-2
;97 var unsg word j = bp-4;
 ENTER  4,0
 mov ax, [GTop]
 mov [bp-2], ax
;-653     while(i<LTop) {//todo look for local var first

.checkName169:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName170
;-654         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-655         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName171
 mov ax, [bp-2]
 jmp .retncheckName
;-656         i++;

.checkName171:
 inc  word[bp-2]
;-657     }

;-658     i=1;

 jmp .checkName169
.checkName170:
 mov ax, 1
 mov [bp-2], ax
;-659     while(i<GTop) {

.checkName172:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName173
;-660         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-661         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName174
 mov ax, [bp-2]
 jmp .retncheckName
;-662         i++;

.checkName174:
 inc  word[bp-2]
;-663     }

;-664     return 0;

 jmp .checkName172
.checkName173:
 mov ax, 0
 jmp .retncheckName
;-665 }

;-666 

;-667 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-668     unsigned int i;

;-669     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-670     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname175
 push searchname_0
 call error1
 add  sp, 2
;-671     return i;

.searchname175:
 mov ax, [bp-2]
 jmp .retnsearchname
;-672 }

;-673 

;-674 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-675     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1176
 push name1_0
 call error1
 add  sp, 2
;-676     token=getlex();

.name1176:
 call getlex
 mov word [token], ax
;-677 }

;-678 

;-679 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-680     int m; //0=V,1=*,2=&

;-681     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;96 var sign word m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-682     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName177
 mov ax, 83
 mov byte [issign], al
;-683     if(istoken(T_UNSIGNED)) issign='U';

.typeName177:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName178
 mov ax, 85
 mov byte [issign], al
;-684     iswidth=2;

.typeName178:
 mov ax, 2
 mov byte [iswidth], al
;-685     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName179
 mov ax, 0
 mov byte [iswidth], al
;-686     if(istoken(T_CHAR))     iswidth=1;

.typeName179:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName180
 mov ax, 1
 mov byte [iswidth], al
;-687     if(istoken(T_INT))      iswidth=2;

.typeName180:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName181
 mov ax, 2
 mov byte [iswidth], al
;-688     if(istoken(T_LONG))     iswidth=4;

.typeName181:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName182
 mov ax, 4
 mov byte [iswidth], al
;-689     istype='V';

.typeName182:
 mov ax, 86
 mov byte [istype], al
;-690     m=0;

 mov ax, 0
 mov [bp-2], ax
;-691     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName183
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-692     if(istoken('&'))  {istype='&'; m=2;}

.typeName183:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName184
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-693     name1();

.typeName184:
 call name1
;-694     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-695 }

;-696 

;-697 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-698     char c;

;-699     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;96 var sign word i = bp+4
;97 var sign byte c = bp-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-700     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes185
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes186
.gettypes185:
 mov ax, 0
 mov word [signi], ax
;-701     c=GWidth[i];

.gettypes186:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-702     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-703     wi=0;

 mov ax, 0
 mov word [wi], ax
;-704     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes187
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-705     if (c==2) {widthi=2;wi=2;}

.gettypes187:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes188
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-706     if (c==4) {widthi=4;wi=4;}

.gettypes188:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes189
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-707     c=GType [i];

.gettypes189:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-708     typei=0;

 mov ax, 0
 mov word [typei], ax
;-709     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes190
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-710     if (c=='&')  typei=2;

.gettypes190:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes191
 mov ax, 2
 mov word [typei], ax
;-711     return i;

.gettypes191:
 mov ax, [bp+4]
 jmp .retngettypes
;-712 }

;-713 

;-714 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-715     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400
 jl  .addlocal192
 push addlocal_0
 call error1
 add  sp, 2
;-716     if (checkName() != 0) error1("Variable already defined");

.addlocal192:
 call checkName
 cmp ax, 0
 je  .addlocal193
 push addlocal_1
 call error1
 add  sp, 2
;-717     GSign[LTop]=issign;

.addlocal193:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-718     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-719     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-720     pt=getVarName(LTop);

 push word [LTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-721     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-722     storeVarName();

 call storeVarName
;-723 }

;-724 

;-725 

;-726 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-727        if(iscmp==T_EQ)			printstring("\n jne .");//ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;96 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg194
 push cmpneg_0
 call printstring
 add  sp, 2
;-728   else if(iscmp==T_NE)			printstring("\n je  .");//ZF=1

 jmp .cmpneg195
.cmpneg194:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg196
 push cmpneg_1
 call printstring
 add  sp, 2
;-729   else if(iscmp==T_LE)	if (ids)printstring("\n jg  .");//ZF=0 SF=OF

 jmp .cmpneg197
.cmpneg196:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg198
 mov ax, [bp+4]
 or  al, al
 je .cmpneg199
 push cmpneg_2
 call printstring
 add  sp, 2
;-730 						else    printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg200
.cmpneg199:
 push cmpneg_3
 call printstring
 add  sp, 2
;-731   else if(iscmp==T_GE)	if (ids)printstring("\n jl  .");//SF!=OF

.cmpneg200:
 jmp .cmpneg201
.cmpneg198:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg202
 mov ax, [bp+4]
 or  al, al
 je .cmpneg203
 push cmpneg_4
 call printstring
 add  sp, 2
;-732 						else    printstring("\n jb  .");//jb=jc=CF=1

 jmp .cmpneg204
.cmpneg203:
 push cmpneg_5
 call printstring
 add  sp, 2
;-733   else if(iscmp=='<' )	if (ids)printstring("\n jge .");//SF=OF

.cmpneg204:
 jmp .cmpneg205
.cmpneg202:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg206
 mov ax, [bp+4]
 or  al, al
 je .cmpneg207
 push cmpneg_6
 call printstring
 add  sp, 2
;-734 							else	printstring("\n jge .");//CF=0

 jmp .cmpneg208
.cmpneg207:
 push cmpneg_7
 call printstring
 add  sp, 2
;-735   else if(iscmp=='>' )	if (ids)printstring("\n jle .");//ZF=1 | SF!=OF

.cmpneg208:
 jmp .cmpneg209
.cmpneg206:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg210
 mov ax, [bp+4]
 or  al, al
 je .cmpneg211
 push cmpneg_8
 call printstring
 add  sp, 2
;-736   						else	printstring("\n jle .");//ZF=1 | CF=1

 jmp .cmpneg212
.cmpneg211:
 push cmpneg_9
 call printstring
 add  sp, 2
;-737 //  else if(iscmp=='<' )	if (ids)printstring("\n jge .");//SF=OF

;-738 //						else	printstring("\n jae .");//CF=0

;-739 //  else if(iscmp=='>' )	if (ids)printstring("\n jle .");//ZF=1 | SF!=OF

;-740 //  						else	printstring("\n jbe .");//ZF=1 | CF=1

;-741 //  else error1("internal error compare unknown in CMPNEG()");

;-742 }

.cmpneg212:
.cmpneg210:
.cmpneg209:
.cmpneg205:
.cmpneg201:
.cmpneg197:
.cmpneg195:
;-743 

;-744 int isrelational() {

 LEAVE
 ret
cmpneg_0 db "\n jne .",0
cmpneg_1 db "\n je  .",0
cmpneg_2 db "\n jg  .",0
cmpneg_3 db "\n ja  .",0
cmpneg_4 db "\n jl  .",0
cmpneg_5 db "\n jb  .",0
cmpneg_6 db "\n jge .",0
cmpneg_7 db "\n jge .",0
cmpneg_8 db "\n jle .",0
cmpneg_9 db "\n jle .",0
ENDP

isrelational: PROC
;-745     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational213
 jmp .w
;-746     if (token==T_NE) goto w;

.isrelational213:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational214
 jmp .w
;-747     if (token==T_LE) goto w;

.isrelational214:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational215
 jmp .w
;-748     if (token==T_GE) goto w;

.isrelational215:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational216
 jmp .w
;-749     if (token=='<' ) goto w;

.isrelational216:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational217
 jmp .w
;-750     if (token=='>' ) goto w;

.isrelational217:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational218
 jmp .w
;-751     return 0;

.isrelational218:
 mov ax, 0
 jmp .retnisrelational
;-752 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-753     token=getlex();

 call getlex
 mov word [token], ax
;-754     return 1;

 mov ax, 1
 jmp .retnisrelational
;-755 }

;-756 

;-757 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-758   if (strlen1(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen1
 add  sp, 2
 cmp ax, 2
 jge .checkreg219
 mov ax, 0
 jmp .retncheckreg
;-759   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

.checkreg219:
 push checkreg_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 1
 jmp .retncheckreg
.checkreg220:
 push checkreg_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 3
 jmp .retncheckreg
;-760   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

.checkreg221:
 push checkreg_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 5
 jmp .retncheckreg
.checkreg222:
 push checkreg_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 7
 jmp .retncheckreg
;-761   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

.checkreg223:
 push checkreg_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 9
 jmp .retncheckreg
.checkreg224:
 push checkreg_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 11
 jmp .retncheckreg
;-762   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

.checkreg225:
 push checkreg_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 13
 jmp .retncheckreg
.checkreg226:
 push checkreg_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 15
 jmp .retncheckreg
;-763   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

.checkreg227:
 push checkreg_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 17
 jmp .retncheckreg
.checkreg228:
 push checkreg_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 19
 jmp .retncheckreg
;-764   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

.checkreg229:
 push checkreg_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 21
 jmp .retncheckreg
.checkreg230:
 push checkreg_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 23
 jmp .retncheckreg
;-765   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

.checkreg231:
 push checkreg_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 25
 jmp .retncheckreg
.checkreg232:
 push checkreg_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 27
 jmp .retncheckreg
;-766   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

.checkreg233:
 push checkreg_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 29
 jmp .retncheckreg
.checkreg234:
 push checkreg_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg235
 mov ax, 31
 jmp .retncheckreg
;-767   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

.checkreg235:
 push checkreg_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg236
 mov ax, 33
 jmp .retncheckreg
.checkreg236:
 push checkreg_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg237
 mov ax, 35
 jmp .retncheckreg
;-768   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

.checkreg237:
 push checkreg_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg238
 mov ax, 37
 jmp .retncheckreg
.checkreg238:
 push checkreg_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg239
 mov ax, 39
 jmp .retncheckreg
;-769   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

.checkreg239:
 push checkreg_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg240
 mov ax, 41
 jmp .retncheckreg
.checkreg240:
 push checkreg_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg241
 mov ax, 43
 jmp .retncheckreg
;-770   // (eqstr(Symbol,"ip")) return 45;

;-771   if (strlen1(Symbol) >   3) return 0;

.checkreg241:
 lea  ax, [Symbol]
 push ax
 call strlen1
 add  sp, 2
 cmp ax, 3
 jle .checkreg242
 mov ax, 0
 jmp .retncheckreg
;-772   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

.checkreg242:
 push checkreg_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg243
 mov ax, 47
 jmp .retncheckreg
.checkreg243:
 push checkreg_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg244
 mov ax, 50
 jmp .retncheckreg
;-773   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

.checkreg244:
 push checkreg_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg245
 mov ax, 53
 jmp .retncheckreg
.checkreg245:
 push checkreg_25
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg246
 mov ax, 56
 jmp .retncheckreg
;-774   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

.checkreg246:
 push checkreg_26
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg247
 mov ax, 59
 jmp .retncheckreg
.checkreg247:
 push checkreg_27
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg248
 mov ax, 62
 jmp .retncheckreg
;-775   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

.checkreg248:
 push checkreg_28
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg249
 mov ax, 65
 jmp .retncheckreg
.checkreg249:
 push checkreg_29
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg250
 mov ax, 68
 jmp .retncheckreg
;-776 //  if (eqstr(Symbol,"cr0")) return 71;

;-777   return 0;

.checkreg250:
 mov ax, 0
 jmp .retncheckreg
;-778 }

;-779 

;-780 char printregstr[]

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
;-781 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-782 

;-783 int printreg(int i) {


printreg: PROC
;-784     unsigned int k; unsigned char c;

;-785     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;97 var sign word i = bp+4
;98 var unsg word k = bp-2
;99 var unsg byte c = bp-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-786     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-787     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-788     i++;

 inc  word[bp+4]
;-789     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-790     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-791     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-792     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg251
;-793         i++;

 inc  word[bp+4]
;-794         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-795         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-796         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-797         }

;-798 }

.printreg251:
;-799 

;-800 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 33457
ops resb 5
section .text
;-801 int doreg1(int iscmp1) {


doreg1: PROC
;-802     int i;

;-803     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;98 var sign word iscmp1 = bp+4
;99 var sign word i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1252
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-804     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1252:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1253
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-805     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1253:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1254
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-806     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1254:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1255
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-807     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1255:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1256
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-808     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1256:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1257
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-809     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1257:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1258
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-810     if (iscmp1 == 1) {

.doreg1258:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1259
;-811             token=getlex();

 call getlex
 mov word [token], ax
;-812             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1260
 push doreg1_7
 call error1
 add  sp, 2
;-813             strcpy(ops, "cmp");

.doreg1260:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-814         }

;-815     printstring("\n ");

.doreg1259:
 push doreg1_9
 call printstring
 add  sp, 2
;-816     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-817     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-818     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-819     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-820 

;-821     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1261
;-822         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-823         goto reg1;

 jmp .reg1
;-824         }

;-825     mod2=typeName();

.doreg1261:
 call typeName
 mov word [mod2], ax
;-826     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-827     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1262
;-828         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-829         goto reg1;

 jmp .reg1
;-830         }

;-831     i=searchname();

.doreg1262:
 call searchname
 mov [bp-2], ax
;-832     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1263
 push word [bp-2]
 call printName
 add  sp, 2
;-833         else v(i);

 jmp .doreg1264
.doreg1263:
 push word [bp-2]
 call v
 add  sp, 2
;-834 reg1: if (iscmp1 == 1) {

.doreg1264:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1265
;-835     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-836     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-837     expect(')');

 push 41
 call expect
 add  sp, 2
;-838     }

;-839 }

.doreg1265:
;-840 

;-841 int compoundass(char *op, int mode, int id1) {

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
;-842     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;98 ptr sign byte op = bp+4
;99 var sign word mode = bp+6
;100 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass266
 push compoundass_0
 call error1
 add  sp, 2
;-843     printstring("\n ");

.compoundass266:
 push compoundass_1
 call printstring
 add  sp, 2
;-844     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-845     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-846     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-847     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass267
 push compoundass_3
 call printstring
 add  sp, 2
;-848         else printstring("byte");

 jmp .compoundass268
.compoundass267:
 push compoundass_4
 call printstring
 add  sp, 2
;-849     v(id1);

.compoundass268:
 push word [bp+8]
 call v
 add  sp, 2
;-850     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-851     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-852     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-853 }

;-854 

;-855 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-856     gettypes(id1);

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
;-857     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1269
;-858         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-859         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-860         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-861         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1270
 push dovar1_2
 call printstring
 add  sp, 2
;-862         if(widthi == 2) printstring(" ax, [bx]");

.dovar1270:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1271
 push dovar1_3
 call printstring
 add  sp, 2
;-863         return;

.dovar1271:
 jmp .retndovar1
;-864         }

;-865     if (mode==2){// & = adr

.dovar1269:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1272
;-866         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-867         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-868         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-869         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-870         return;

 jmp .retndovar1
;-871         }

;-872     if (ixarr) {//array

.dovar1272:
 mov ax, [bp+8]
 or  al, al
 je .dovar1273
;-873         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-874         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-875         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1274
 push dovar1_7
 call printstring
 add  sp, 2
;-876         printstring("\n ");

.dovar1274:
 push dovar1_8
 call printstring
 add  sp, 2
;-877         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-878         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1275
 push dovar1_9
 call printstring
 add  sp, 2
;-879             else printstring(" al, ");

 jmp .dovar1276
.dovar1275:
 push dovar1_10
 call printstring
 add  sp, 2
;-880         prc('[');

.dovar1276:
 push 91
 call prc
 add  sp, 2
;-881         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-882         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-883         return;

 jmp .retndovar1
;-884         }

;-885     printstring("\n ");

.dovar1273:
 push dovar1_12
 call printstring
 add  sp, 2
;-886     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-887     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1277
 push dovar1_13
 call printstring
 add  sp, 2
;-888     if(wi==2) printstring(" ax, ");

.dovar1277:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1278
 push dovar1_14
 call printstring
 add  sp, 2
;-889     if(wi==4) printstring(" eax, ");

.dovar1278:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1279
 push dovar1_15
 call printstring
 add  sp, 2
;-890     v(id1);

.dovar1279:
 push word [bp+10]
 call v
 add  sp, 2
;-891 }

;-892 

;-893 int rterm(char *op) {

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
;-894     int mode; int opint; int ixarr; int id1;

;-895     if (istoken(T_CONST)) {

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
 je .rterm280
;-896         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-897         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-898         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm281
 push rterm_1
 call printstring
 add  sp, 2
;-899         if (wi==2) printstring(" ax, ");

.rterm281:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm282
 push rterm_2
 call printstring
 add  sp, 2
;-900         if (wi==4) printstring(" eax, ");

.rterm282:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm283
 push rterm_3
 call printstring
 add  sp, 2
;-901         printunsigned(lexval);

.rterm283:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-902         return;

 jmp .retnrterm
;-903         }

;-904     mode=typeName();

.rterm280:
 call typeName
 mov [bp-2], ax
;-905     id1=searchname();

 call searchname
 mov [bp-8], ax
;-906     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-907     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm284
;-908         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-909         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-910         expect(']');

 push 93
 call expect
 add  sp, 2
;-911         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-912         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm285
 push rterm_4
 call error1
 add  sp, 2
;-913         }

.rterm285:
;-914     if (eqstr(Symbol,"ax")) return;

.rterm284:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm286
 jmp .retnrterm
;-915     opint=op;

.rterm286:
 mov ax, [bp+4]
 mov [bp-4], ax
;-916     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-917 }

;-918 

;-919 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-920     gettypes(i);

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
;-921     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign287
;-922         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-923         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-924         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign288
 push doassign_1
 call printstring
 add  sp, 2
;-925             else  printstring("\n mov  [bx], al");

 jmp .doassign289
.doassign288:
 push doassign_2
 call printstring
 add  sp, 2
;-926         return;

.doassign289:
 jmp .retndoassign
;-927         }

;-928     if (mode==2) {// & = adr

.doassign287:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign290
;-929         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-930         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-931         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-932         return;

 jmp .retndoassign
;-933         }

;-934     if (ixarr) {

.doassign290:
 mov ax, [bp+8]
 or  al, al
 je .doassign291
;-935         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-936         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign292
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-937             else v(ixarr);

 jmp .doassign293
.doassign292:
 push word [bp+8]
 call v
 add  sp, 2
;-938         if (wi==2) printstring("\n shl bx, 1");

.doassign293:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign294
 push doassign_6
 call printstring
 add  sp, 2
;-939         printstring("\n mov [");

.doassign294:
 push doassign_7
 call printstring
 add  sp, 2
;-940         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-941         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign295
 push doassign_8
 call printstring
 add  sp, 2
;-942             else printstring("+bx], al");

 jmp .doassign296
.doassign295:
 push doassign_9
 call printstring
 add  sp, 2
;-943         return;

.doassign296:
 jmp .retndoassign
;-944         }

;-945     if (wi==1){

.doassign291:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign297
;-946         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-947         if(i<GTop) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign298
 push doassign_11
 call printstring
 add  sp, 2
;-948         v(i);

.doassign298:
 push word [bp+6]
 call v
 add  sp, 2
;-949         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-950         return;

 jmp .retndoassign
;-951         }

;-952     if (wi==2){

.doassign297:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign299
;-953         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-954         if(i<GTop) printstring("word ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign300
 push doassign_14
 call printstring
 add  sp, 2
;-955         v(i);

.doassign300:
 push word [bp+6]
 call v
 add  sp, 2
;-956         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-957         return;

 jmp .retndoassign
;-958         }

;-959     if (wi==4){

.doassign299:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign301
;-960         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-961         if(i<GTop) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign302
 push doassign_17
 call printstring
 add  sp, 2
;-962         v(i);

.doassign302:
 push word [bp+6]
 call v
 add  sp, 2
;-963         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-964         return;

 jmp .retndoassign
;-965         }

;-966 }

.doassign301:
;-967 

;-968 int domul(int ids) {

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
;-969     int mode; int id1;

;-970     if (ids) {

;Function : domul, Number local Var: 3
; # type sign width local variables
;98 var sign word ids = bp+4
;99 var sign word mode = bp-2
;100 var sign word id1 = bp-4;
 ENTER  4,0
 mov ax, [bp+4]
 or  al, al
 je .domul303
;-971 	    rterm("imul");

 push domul_0
 call rterm
 add  sp, 2
;-972 	    return;

 jmp .retndomul
;-973 	    }

;-974 	printstring("\n;todo:save high part:mov [Longvar+2(+4)],(e)dx");

.domul303:
 push domul_1
 call printstring
 add  sp, 2
;-975 	if (istoken(T_CONST)) {//mul 123

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul304
;-976 		printstring("\n mov bx, ");

 push domul_2
 call printstring
 add  sp, 2
;-977 		printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-978 		printstring("\n mul bx");

 push domul_3
 call printstring
 add  sp, 2
;-979 		return;

 jmp .retndomul
;-980 	}

;-981 	mode=typeName();

.domul304:
 call typeName
 mov [bp-2], ax
;-982 	id1=searchname();

 call searchname
 mov [bp-4], ax
;-983 	if (mode) error1("only simple var as multiplier");

 mov ax, [bp-2]
 or  al, al
 je .domul305
 push domul_4
 call error1
 add  sp, 2
;-984 	gettypes(id1);

.domul305:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-985 	if (typei) error1("only simple int as multipier");

 mov ax, [typei]
 or  al, al
 je .domul306
 push domul_5
 call error1
 add  sp, 2
;-986 	if (wi==0) error1("multiplier");

.domul306:
 mov ax, [wi]
 cmp ax, 0
 jne .domul307
 push domul_6
 call error1
 add  sp, 2
;-987 	if (wi==1) printstring("\n mul byte ");//  AL  MUL r/m8  = AX

.domul307:
 mov ax, [wi]
 cmp ax, 1
 jne .domul308
 push domul_7
 call printstring
 add  sp, 2
;-988 	if (wi==2) printstring("\n mul word ");//  AX  MUL r/m16 = DX:AX

.domul308:
 mov ax, [wi]
 cmp ax, 2
 jne .domul309
 push domul_8
 call printstring
 add  sp, 2
;-989 	if (wi==4) printstring("\n mul dword ");//EAX  MUL r/m32 = EDX:EAX

.domul309:
 mov ax, [wi]
 cmp ax, 4
 jne .domul310
 push domul_9
 call printstring
 add  sp, 2
;-990 	v(id1);

.domul310:
 push word [bp-4]
 call v
 add  sp, 2
;-991 }

;-992 

;-993 int doidiv(int ids) {

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
;-994     int mode; int id1;

;-995     if (istoken(T_CONST)) {

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
 je .doidiv311
;-996         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-997         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-998         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv312
 push doidiv_1
 call printstring
 add  sp, 2
;-999             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv313
.doidiv312:
 push doidiv_2
 call printstring
 add  sp, 2
;-1000         return;

.doidiv313:
 jmp .retndoidiv
;-1001 	}

;-1002 	mode=typeName();

.doidiv311:
 call typeName
 mov [bp-2], ax
;-1003 	id1=searchname();

 call searchname
 mov [bp-4], ax
;-1004 	if (mode) error1("only simple var as divisor");//no *, &

 mov ax, [bp-2]
 or  al, al
 je .doidiv314
 push doidiv_3
 call error1
 add  sp, 2
;-1005 	gettypes(id1);//widthi, wi(0,1,2,4), typei(0, 1=*, 2=&)

.doidiv314:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-1006 	if (typei) error1("only char int or long as simple var divisor");

 mov ax, [typei]
 or  al, al
 je .doidiv315
 push doidiv_4
 call error1
 add  sp, 2
;-1007 	if (wi==0) error1("divisor");

.doidiv315:
 mov ax, [wi]
 cmp ax, 0
 jne .doidiv316
 push doidiv_5
 call error1
 add  sp, 2
;-1008 

;-1009 	if (wi==1) {//   AX   DIV r/m8  =  AL(Quotient),  AH(Remainder)

.doidiv316:
 mov ax, [wi]
 cmp ax, 1
 jne .doidiv317
;-1010 		if (ids) printstring("\n cbw\n idiv byte ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv318
 push doidiv_6
 call printstring
 add  sp, 2
;-1011 			else printstring("\n div byte ");

 jmp .doidiv319
.doidiv318:
 push doidiv_7
 call printstring
 add  sp, 2
;-1012 		}

.doidiv319:
;-1013 	if (wi==2) {//DX:AX   DIV r/m16 =  AX(Quotient),  DX(Remainder)

.doidiv317:
 mov ax, [wi]
 cmp ax, 2
 jne .doidiv320
;-1014 		if (ids) printstring("\n cwd\n idiv word ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv321
 push doidiv_8
 call printstring
 add  sp, 2
;-1015 			else printstring("\n xor dx, dx\n div word ");

 jmp .doidiv322
.doidiv321:
 push doidiv_9
 call printstring
 add  sp, 2
;-1016 		}

.doidiv322:
;-1017 	if (wi==4) {//EDX:EAX DIV r/m32 = EAX(Quotient), EDX(Remainder)

.doidiv320:
 mov ax, [wi]
 cmp ax, 4
 jne .doidiv323
;-1018 		if (ids) printstring("\n cdq\n idiv dword ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv324
 push doidiv_10
 call printstring
 add  sp, 2
;-1019 			else printstring("\n xor edx, edx\n div dword ");

 jmp .doidiv325
.doidiv324:
 push doidiv_11
 call printstring
 add  sp, 2
;-1020 		}

.doidiv325:
;-1021 	v(id1);

.doidiv323:
 push word [bp-4]
 call v
 add  sp, 2
;-1022 }

;-1023 

;-1024 int domod(int ids) {

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
;-1025     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;98 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-1026     if (wi==1) printstring("\n mov al, ah");

 mov ax, [wi]
 cmp ax, 1
 jne .domod326
 push domod_0
 call printstring
 add  sp, 2
;-1027     if (wi==2) printstring("\n mov ax, dx");

.domod326:
 mov ax, [wi]
 cmp ax, 2
 jne .domod327
 push domod_1
 call printstring
 add  sp, 2
;-1028     if (wi==4) printstring("\n mov eax, edx");

.domod327:
 mov ax, [wi]
 cmp ax, 4
 jne .domod328
 push domod_2
 call printstring
 add  sp, 2
;-1029 }

.domod328:
;-1030 

;-1031 

;-1032 int docalltype[10]; int docallvalue[10];

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
;-1033 

;-1034 int docall() {


docall: PROC
;-1035     int i; int narg; int t0;// 1=CONST, 2=String, 3=&, 4=Name, (5=reg)

;-1036     int n0;  int sz32;

;-1037 	char procname[IDLENMAX];

;-1038     narg=0;

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
;-1039     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-1040     checknamelen();

 call checknamelen
;-1041     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [bp-41]
 push ax
 call strcpy
 add  sp, 4
;-1042     expect('(');

 push 40
 call expect
 add  sp, 2
;-1043 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall329
;-1044 	    do {

.docall330:
;-1045 	        narg++;

 inc  word[bp-4]
;-1046 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall331
 push docall_0
 call error1
 add  sp, 2
;-1047 	        t0=0;

.docall331:
 mov ax, 0
 mov [bp-6], ax
;-1048             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall332
;-1049                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-1050                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-1051                 }

;-1052             if(istoken(T_STRING)){

.docall332:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall333
;-1053                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-1054                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-1055                 eprs("\n");

 push docall_1
 call eprs
 add  sp, 2
;-1056                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-1057                 eprc(95);//underscore

 push 95
 call eprc
 add  sp, 2
;-1058                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-1059                 eprs(" db ");

 push docall_2
 call eprs
 add  sp, 2
;-1060                 eprc(34);//doubel apostrophe

 push 34
 call eprc
 add  sp, 2
;-1061                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-1062                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-1063                 eprs(",0");

 push docall_3
 call eprs
 add  sp, 2
;-1064                 nconst++;

 inc  word[nconst]
;-1065                 }

;-1066             if(istoken('&'))     {

.docall333:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall334
;-1067                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-1068                 name1();

 call name1
;-1069                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-1070                 }

;-1071             if(istoken(T_NAME))  {

.docall334:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall335
;-1072                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-1073                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-1074                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-1075                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-1076                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall336
 mov ax, 3
 mov [bp-6], ax
;-1077 //todo push reg is missing t0=5

;-1078                 }

.docall336:
;-1079             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall335:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall337
 push docall_4
 call error1
 add  sp, 2
;-1080             docalltype [narg] = t0;

.docall337:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-1081             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-1082         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall338
 jmp .docall330
.docall338:
;-1083 

;-1084   	expect(')');

 push 41
 call expect
 add  sp, 2
;-1085   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-1086     do {

.docall339:
;-1087         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-1088         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-1089         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall340
;-1090             printstring("\n push ");

 push docall_5
 call printstring
 add  sp, 2
;-1091             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1092             }

;-1093         if(t0==2){

.docall340:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall341
;-1094             printstring("\n push ");

 push docall_6
 call printstring
 add  sp, 2
;-1095             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1096             prc(95);

 push 95
 call prc
 add  sp, 2
;-1097             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1098             }

;-1099         if(t0==3){

.docall341:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall342
;-1100             printstring("\n lea  ax, ");

 push docall_7
 call printstring
 add  sp, 2
;-1101             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1102             printstring("\n push ax");

 push docall_8
 call printstring
 add  sp, 2
;-1103             }

;-1104         if(t0==4){

.docall342:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall343
;-1105             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1106             if (wi==1) {

 mov ax, [wi]
 cmp ax, 1
 jne .docall344
;-1107                 printstring("\n mov al, byte ");

 push docall_9
 call printstring
 add  sp, 2
;-1108                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1109                 printstring("\n mov ah, 0\n push ax");

 push docall_10
 call printstring
 add  sp, 2
;-1110             }

;-1111             else if(wi==2) {

 jmp .docall345
.docall344:
 mov ax, [wi]
 cmp ax, 2
 jne .docall346
;-1112                 printstring("\n push word ");

 push docall_11
 call printstring
 add  sp, 2
;-1113                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1114                 }

;-1115             else if(wi==4) {

 jmp .docall347
.docall346:
 mov ax, [wi]
 cmp ax, 4
 jne .docall348
;-1116                 printstring("\n push dword ");

 push docall_12
 call printstring
 add  sp, 2
;-1117                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1118                 sz32=sz32+2;

 mov ax, [bp-10]
 add ax, 2
 mov [bp-10], ax
;-1119                 }

;-1120             else error1("wi compiler error in docall() ");

 jmp .docall349
.docall348:
 push docall_13
 call error1
 add  sp, 2
;-1121             }

.docall349:
.docall347:
.docall345:
;-1122         if(t0==5){

.docall343:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall350
;-1123             printstring("\n push ");

 push docall_14
 call printstring
 add  sp, 2
;-1124             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1125             if (n0 >= 47) sz32=sz32+2;

 mov ax, [bp-8]
 cmp ax, 47
 jl  .docall351
 mov ax, [bp-10]
 add ax, 2
 mov [bp-10], ax
;-1126             }

.docall351:
;-1127         i--;

.docall350:
 dec  word[bp-2]
;-1128         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall352
 jmp .docall339
.docall352:
;-1129     }

;-1130 	printstring("\n call ");

.docall329:
 push docall_15
 call printstring
 add  sp, 2
;-1131 	printstring(&procname);

 lea  ax, [bp-41]
 push ax
 call printstring
 add  sp, 2
;-1132 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall353
;-1133 	    printstring("\n add  sp, ");

 push docall_16
 call printstring
 add  sp, 2
;-1134         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1135         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1136         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1137         }

;-1138 }

.docall353:
;-1139 

;-1140 

;-1141 int expr() {

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
docall_9 db "\n mov al, byte ",0
docall_10 db "\n mov ah, 0\n push ax",0
docall_11 db "\n push word ",0
docall_12 db "\n push dword ",0
docall_13 db "wi compiler error in docall() ",0
docall_14 db "\n push ",0
docall_15 db "\n call ",0
docall_16 db "\n add  sp, ",0
ENDP

expr: PROC
;-1142     int mode;   int id1;

;-1143     int ixarr;  int ixconst;

;-1144     int ids;    int isCONST;

;-1145     int i;      unsigned char *p;

;-1146 

;-1147 	if (istoken('(')) {//cast to int or long, clear destination

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
 je .expr354
;-1148 		     if(istoken(T_INT)) printstring("\n xor ax, ax");

 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
 push expr_0
 call printstring
 add  sp, 2
;-1149 		else if(istoken(T_LONG)) printstring("\n xor eax, eax");

 jmp .expr356
.expr355:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
 push expr_1
 call printstring
 add  sp, 2
;-1150 		else error1("only int or long allowed");

 jmp .expr358
.expr357:
 push expr_2
 call error1
 add  sp, 2
;-1151 		expect(')');

.expr358:
.expr356:
 push 41
 call expect
 add  sp, 2
;-1152 		}

;-1153     if (istoken(T_CONST)) {// constant ;

.expr354:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr359
;-1154         printstring("\n mov ax, ");

 push expr_3
 call printstring
 add  sp, 2
;-1155         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1156         return 4;

 mov ax, 4
 jmp .retnexpr
;-1157         }

;-1158     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr359:
 call typeName
 mov [bp-2], ax
;-1159     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1160     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr360
;-1161         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1162         return;

 jmp .retnexpr
;-1163         }

;-1164 

;-1165     if (token=='(')  {

.expr360:
 mov ax, [token]
 cmp ax, 40
 jne .expr361
;-1166         docall();

 call docall
;-1167         goto e1;

 jmp .e1
;-1168         }

;-1169 

;-1170     id1=searchname();

.expr361:
 call searchname
 mov [bp-4], ax
;-1171     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1172     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1173     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1174     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1175     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr362
;-1176         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr363
;-1177             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1178             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1179             expect(']');

 push 93
 call expect
 add  sp, 2
;-1180             }

;-1181         else {

 jmp .expr364
.expr363:
;-1182             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1183             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1184             expect(']');

 push 93
 call expect
 add  sp, 2
;-1185             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1186             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr365
 push expr_4
 call error1
 add  sp, 2
;-1187             }

.expr365:
;-1188         }

.expr364:
;-1189     if (istoken(T_PLUSPLUS  )) {

.expr362:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr366
;-1190         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr367
 push expr_5
 call error1
 add  sp, 2
;-1191         printstring("\n inc  ");

.expr367:
 push expr_6
 call printstring
 add  sp, 2
;-1192         

;-1193         if 		(wi==1) printstring("byte");

 mov ax, [wi]
 cmp ax, 1
 jne .expr368
 push expr_7
 call printstring
 add  sp, 2
;-1194         else if (wi==2) printstring("word"); 

 jmp .expr369
.expr368:
 mov ax, [wi]
 cmp ax, 2
 jne .expr370
 push expr_8
 call printstring
 add  sp, 2
;-1195         else if (wi==4) printstring("dword");

 jmp .expr371
.expr370:
 mov ax, [wi]
 cmp ax, 4
 jne .expr372
 push expr_9
 call printstring
 add  sp, 2
;-1196         else error1("wi compiler error in T_PLUSPLUS ");        

 jmp .expr373
.expr372:
 push expr_10
 call error1
 add  sp, 2
;-1197         v(id1);

.expr373:
.expr371:
.expr369:
 push word [bp-4]
 call v
 add  sp, 2
;-1198         goto e1;

 jmp .e1
;-1199         }

;-1200     if (istoken(T_MINUSMINUS)) {

.expr366:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr374
;-1201         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr375
 push expr_11
 call error1
 add  sp, 2
;-1202         printstring("\n dec  ");

.expr375:
 push expr_12
 call printstring
 add  sp, 2
;-1203         if 		(wi==1) printstring("byte");

 mov ax, [wi]
 cmp ax, 1
 jne .expr376
 push expr_13
 call printstring
 add  sp, 2
;-1204         else if (wi==2) printstring("word"); 

 jmp .expr377
.expr376:
 mov ax, [wi]
 cmp ax, 2
 jne .expr378
 push expr_14
 call printstring
 add  sp, 2
;-1205         else if (wi==4) printstring("dword");

 jmp .expr379
.expr378:
 mov ax, [wi]
 cmp ax, 4
 jne .expr380
 push expr_15
 call printstring
 add  sp, 2
;-1206         else error1("wi compiler error in T_MINUSMINUS ");        

 jmp .expr381
.expr380:
 push expr_16
 call error1
 add  sp, 2
;-1207         v(id1);

.expr381:
.expr379:
.expr377:
 push word [bp-4]
 call v
 add  sp, 2
;-1208         goto e1;

 jmp .e1
;-1209         }

;-1210 

;-1211     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr374:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr382
 push word [bp-4]
 push word [bp-2]
 push expr_17
 call compoundass
 add  sp, 6
 jmp .e1
;-1212     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr382:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr383
 push word [bp-4]
 push word [bp-2]
 push expr_18
 call compoundass
 add  sp, 6
 jmp .e1
;-1213     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr383:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr384
 push word [bp-4]
 push word [bp-2]
 push expr_19
 call compoundass
 add  sp, 6
 jmp .e1
;-1214     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr384:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr385
 push word [bp-4]
 push word [bp-2]
 push expr_20
 call compoundass
 add  sp, 6
 jmp .e1
;-1215     if (istoken(T_MULASS  )) error1("not implemented");

.expr385:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr386
 push expr_21
 call error1
 add  sp, 2
;-1216     if (istoken(T_DIVASS  )) error1("not implemented");

.expr386:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr387
 push expr_22
 call error1
 add  sp, 2
;-1217 

;-1218     if (istoken('=')) {

.expr387:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr388
;-1219         expr();

 call expr
;-1220         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1221         goto e1;

 jmp .e1
;-1222         }

;-1223     dovar1(mode, "mov", ixarr, id1);

.expr388:
 push word [bp-4]
 push word [bp-6]
 push expr_23
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1224 

;-1225 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr389
 push expr_24
 call rterm
 add  sp, 2
;-1226     else if (istoken('-')) rterm("sub");

 jmp .expr390
.expr389:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr391
 push expr_25
 call rterm
 add  sp, 2
;-1227     else if (istoken('&')) rterm("and");

 jmp .expr392
.expr391:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr393
 push expr_26
 call rterm
 add  sp, 2
;-1228     else if (istoken('|')) rterm("or" );

 jmp .expr394
.expr393:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr395
 push expr_27
 call rterm
 add  sp, 2
;-1229     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr396
.expr395:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr397
 push expr_28
 call rterm
 add  sp, 2
;-1230     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr398
.expr397:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr399
 push expr_29
 call rterm
 add  sp, 2
;-1231     else if (istoken('*')) domul (ids);

 jmp .expr400
.expr399:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr401
 push word [bp-10]
 call domul
 add  sp, 2
;-1232     else if (istoken('/')) doidiv(ids);

 jmp .expr402
.expr401:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr403
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1233     else if (istoken('%')) domod (ids);

 jmp .expr404
.expr403:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr405
 push word [bp-10]
 call domod
 add  sp, 2
;-1234     if (isrelational()) {

.expr405:
.expr404:
.expr402:
.expr400:
.expr398:
.expr396:
.expr394:
.expr392:
.expr390:
 call isrelational
 or  al, al
 je .expr406
;-1235         rterm("cmp");

 push expr_30
 call rterm
 add  sp, 2
;-1236         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1237         }

;-1238     return 0;

.expr406:
 mov ax, 0
 jmp .retnexpr
;-1239 }

;-1240 

;-1241 int pexpr() {//called from if, do, while

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
expr_7 db "byte",0
expr_8 db "word",0
expr_9 db "dword",0
expr_10 db "wi compiler error in T_PLUSPLUS ",0
expr_11 db "Only var allowed",0
expr_12 db "\n dec  ",0
expr_13 db "byte",0
expr_14 db "word",0
expr_15 db "dword",0
expr_16 db "wi compiler error in T_MINUSMINUS ",0
expr_17 db "add",0
expr_18 db "sub",0
expr_19 db "and",0
expr_20 db "or",0
expr_21 db "not implemented",0
expr_22 db "not implemented",0
expr_23 db "mov",0
expr_24 db "add",0
expr_25 db "sub",0
expr_26 db "and",0
expr_27 db "or",0
expr_28 db "shl",0
expr_29 db "shr",0
expr_30 db "cmp",0
ENDP

pexpr: PROC
;-1242     expect('(');

 push 40
 call expect
 add  sp, 2
;-1243     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1244     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr407
;-1245         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1246         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr408
;-1247             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1248             return;

 jmp .retnpexpr
;-1249             }

;-1250         }

.pexpr408:
;-1251 

;-1252     expr();

.pexpr407:
 call expr
;-1253     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr409
 push pexpr_0
 call printstring
 add  sp, 2
;-1254     printstring(fname);

.pexpr409:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1255     expect(')');

 push 41
 call expect
 add  sp, 2
;-1256 }

;-1257 

;-1258 

;-1259 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1260     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;100 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1261     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1262     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1263     prc(':');

 push 58
 call prc
 add  sp, 2
;-1264 }

;-1265 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1266     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;100 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1267     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1268     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1269 }

;-1270 

;-1271 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1272     int c; char cha;

;-1273     int jdest; int tst; int jtemp;

;-1274     if(istoken('{')) {

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
 je .stmt410
;-1275         while(istoken('}')==0) stmt();

.stmt411:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt412
 call stmt
;-1276         }

 jmp .stmt411
.stmt412:
;-1277     else if(istoken(T_IF)) {

 jmp .stmt413
.stmt410:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt414
;-1278         pexpr();

 call pexpr
;-1279         nlabel++;

 inc  word[nlabel]
;-1280         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1281         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1282         stmt();

 call stmt
;-1283         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt415
;-1284             nlabel++;

 inc  word[nlabel]
;-1285             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1286             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1287             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1288             stmt();

 call stmt
;-1289             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1290         }

;-1291         else prlabel(jdest);

 jmp .stmt416
.stmt415:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1292     }

.stmt416:
;-1293     else if(istoken(T_DO)) {

 jmp .stmt417
.stmt414:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt418
;-1294         nlabel++;

 inc  word[nlabel]
;-1295         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1296         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1297         stmt();

 call stmt
;-1298         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1299         pexpr();

 call pexpr
;-1300         nlabel++;

 inc  word[nlabel]
;-1301         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1302         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1303         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1304          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1305     }

;-1306     else if(istoken(T_WHILE)) {

 jmp .stmt419
.stmt418:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt420
;-1307         nlabel++;

 inc  word[nlabel]
;-1308         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1309         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1310         pexpr();

 call pexpr
;-1311         nlabel++;

 inc  word[nlabel]
;-1312         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1313         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1314         stmt();

 call stmt
;-1315         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1316         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1317     }

;-1318     else if(istoken(T_GOTO))  {

 jmp .stmt421
.stmt420:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt422
;-1319         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1320         name1();

 call name1
;-1321         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1322         expect(';');

 push 59
 call expect
 add  sp, 2
;-1323     }

;-1324     else if(token==T_ASM)     {

 jmp .stmt423
.stmt422:
 mov ax, [token]
 cmp ax, 518
 jne .stmt424
;-1325       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1326       c=next();

 call next
 mov [bp-2], ax
;-1327       while(c != '\n') {

.stmt425:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt426
;-1328         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1329         c=next();

 call next
 mov [bp-2], ax
;-1330         };

 jmp .stmt425
.stmt426:
;-1331         token=getlex();

 call getlex
 mov word [token], ax
;-1332     }

;-1333     else if(token==T_ASMDIRECT)     {

 jmp .stmt427
.stmt424:
 mov ax, [token]
 cmp ax, 525
 jne .stmt428
;-1334       printstring("\n");

 push stmt_2
 call printstring
 add  sp, 2
;-1335       printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1336       c=next();

 call next
 mov [bp-2], ax
;-1337       while(c != '\n') {

.stmt429:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt430
;-1338         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1339         c=next();

 call next
 mov [bp-2], ax
;-1340         };

 jmp .stmt429
.stmt430:
;-1341         token=getlex();

 call getlex
 mov word [token], ax
;-1342     }

;-1343     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt431
.stmt428:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt432
;-1344         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt433
;-1345             printstring("\n"); cha=next();

 push stmt_3
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1346             while(cha!= '}') {

.stmt434:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt435
;-1347                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1348                 cha=next();

 call next
 mov [bp-4], al
;-1349             }

;-1350             token=getlex();

 jmp .stmt434
.stmt435:
 call getlex
 mov word [token], ax
;-1351         } else error1("Curly open expected");

 jmp .stmt436
.stmt433:
 push stmt_4
 call error1
 add  sp, 2
;-1352     }

.stmt436:
;-1353     else if(istoken(T_INTH))  {

 jmp .stmt437
.stmt432:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt438
;-1354         printstring("\n int  ");

 push stmt_5
 call printstring
 add  sp, 2
;-1355         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1356         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1357         expect(';');

 push 59
 call expect
 add  sp, 2
;-1358     }

;-1359     else if(istoken(T_EMIT)) {

 jmp .stmt439
.stmt438:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt440
;-1360       printstring("\n db ");

 push stmt_6
 call printstring
 add  sp, 2
;-1361     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1362       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1363       token=getlex();

 call getlex
 mov word [token], ax
;-1364       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt441
;-1365           prc(',');

 push 44
 call prc
 add  sp, 2
;-1366           goto L1;

 jmp .L1
;-1367       }

;-1368       expect(')');

.stmt441:
 push 41
 call expect
 add  sp, 2
;-1369     }

;-1370     else if(istoken(';'))      { }

 jmp .stmt442
.stmt440:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt443
;-1371     else if(istoken(T_RETURN)) {

 jmp .stmt444
.stmt443:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt445
;-1372         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt446
 call expr
;-1373         printstring("\n jmp .retn");

.stmt446:
 push stmt_7
 call printstring
 add  sp, 2
;-1374         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1375         nreturn++;

 inc  word[nreturn]
;-1376         expect(';');

 push 59
 call expect
 add  sp, 2
;-1377     }

;-1378     else if(thechar==':')      {

 jmp .stmt447
.stmt445:
 mov al, [thechar]
 cmp al, 58
 jne .stmt448
;-1379         printstring("\n."); // Label

 push stmt_8
 call printstring
 add  sp, 2
;-1380         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1381         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1382         expect(':');

 push 58
 call expect
 add  sp, 2
;-1383     }

;-1384     else  {expr(); expect(';'); }

 jmp .stmt449
.stmt448:
 call expr
 push 59
 call expect
 add  sp, 2
;-1385 }

.stmt449:
.stmt447:
.stmt444:
.stmt442:
.stmt439:
.stmt437:
.stmt431:
.stmt427:
.stmt423:
.stmt421:
.stmt419:
.stmt417:
.stmt413:
;-1386 

;-1387 int isvariable() {

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
;-1388     if(token==T_SIGNED)   return 1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable450
 mov ax, 1
 jmp .retnisvariable
;-1389     if(token==T_UNSIGNED) return 1;

.isvariable450:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable451
 mov ax, 1
 jmp .retnisvariable
;-1390     if(token==T_CHAR)     return 1;

.isvariable451:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable452
 mov ax, 1
 jmp .retnisvariable
;-1391     if(token==T_INT)      return 1;

.isvariable452:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable453
 mov ax, 1
 jmp .retnisvariable
;-1392     if(token==T_LONG)     return 1;

.isvariable453:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable454
 mov ax, 1
 jmp .retnisvariable
;-1393     return 0;

.isvariable454:
 mov ax, 0
 jmp .retnisvariable
;-1394 }

;-1395 

;-1396 //***************************************************************

;-1397 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1398     unsigned int j;

;-1399     char c;

;-1400     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;100 var unsg word i = bp+4
;101 var unsg word j = bp-2
;102 var sign byte c = bp-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1401     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1402     prc(32);

 push 32
 call prc
 add  sp, 2
;-1403     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1404     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar455
 push listvar_1
 call printstring
 add  sp, 2
;-1405     if(c=='*')printstring("ptr ");

.listvar455:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar456
 push listvar_2
 call printstring
 add  sp, 2
;-1406     if(c=='&')printstring("arr ");

.listvar456:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar457
 push listvar_3
 call printstring
 add  sp, 2
;-1407     if(c=='#')printstring("def ");

.listvar457:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar458
 push listvar_4
 call printstring
 add  sp, 2
;-1408     c=GSign [i];

.listvar458:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1409     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar459
 push listvar_5
 call printstring
 add  sp, 2
;-1410     if(c=='U')printstring("unsg ");

.listvar459:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar460
 push listvar_6
 call printstring
 add  sp, 2
;-1411     c=GWidth[i];

.listvar460:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1412     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar461
 push listvar_7
 call printstring
 add  sp, 2
;-1413     if(c== 1)printstring("byte " );

.listvar461:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar462
 push listvar_8
 call printstring
 add  sp, 2
;-1414     if(c== 2)printstring("word " );

.listvar462:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar463
 push listvar_9
 call printstring
 add  sp, 2
;-1415     if(c== 4)printstring("long " );

.listvar463:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar464
 push listvar_10
 call printstring
 add  sp, 2
;-1416     pt=getVarName(i);

.listvar464:
 push word [bp+4]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1417     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1418     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar465
;-1419         prc('=');

 push 61
 call prc
 add  sp, 2
;-1420         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1421         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1422     }

;-1423     if(GType[i]=='&') {

.listvar465:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar466
;-1424         prc('[');

 push 91
 call prc
 add  sp, 2
;-1425         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1426         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1427         prc(']');

 push 93
 call prc
 add  sp, 2
;-1428     }

;-1429     if (i >= GTop) {

.listvar466:
 mov ax, [bp+4]
 cmp ax, [GTop]
 jb  .listvar467
;-1430         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1431         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1432         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .listvar468
 push 43
 call prc
 add  sp, 2
;-1433         printinteger(j);

.listvar468:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1434     }

;-1435 }

.listvar467:
;-1436 

;-1437 int listproc() {

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
;-1438     int i;

;-1439     if (LTop > GTop) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;100 var sign word i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .listproc469
;-1440         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1441         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1442         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1443         i=LTop - GTop;

 mov ax, [LTop]
 sub ax, [GTop]
 mov [bp-2], ax
;-1444         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1445         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1446         i=GTop;

 mov ax, [GTop]
 mov [bp-2], ax
;-1447         while (i < LTop) {

.listproc470:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc471
;-1448             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1449             i++;

 inc  word[bp-2]
;-1450         }

;-1451     }

 jmp .listproc470
.listproc471:
;-1452 }

.listproc469:
;-1453 

;-1454 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1455     int FunctionIndex; char *p;

;-1456     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;100 var sign word FunctionIndex = bp-2
;101 ptr sign byte p = bp-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1457     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1458     while (FunctionIndex <= FunctionMaxIx ) {

.searchFunction472:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction473
;-1459         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction474
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1460         p = strlen1(p) + p;

.searchFunction474:
 push word [bp-4]
 call strlen1
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1461         p++;

 inc  word[bp-4]
;-1462         FunctionIndex++;

 inc  word[bp-2]
;-1463     }

;-1464     return 0;               //no function found

 jmp .searchFunction472
.searchFunction473:
 mov ax, 0
 jmp .retnsearchFunction
;-1465 }

;-1466 

;-1467 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1468     unsigned int i;

;-1469     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;100 var unsg word i = bp-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1470     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300
 jl  .storeFunction475
 push storeFunction_0
 call error1
 add  sp, 2
;-1471     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction475:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1472     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1473     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1474     i += IDLENMAX;

 add  word[bp-2], 31
;-1475     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000
 jb  .storeFunction476
 push storeFunction_1
 call error1
 add  sp, 2
;-1476 }

.storeFunction476:
;-1477 

;-1478 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1479     int nloc; unsigned int j;int narg;

;-1480     int VarNamePtrLocalStart;

;-1481     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;100 var sign word nloc = bp-2
;101 var unsg word j = bp-4
;102 var sign word narg = bp-6
;103 var sign word VarNamePtrLocalStart = bp-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1482     checknamelen();

 call checknamelen
;-1483     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1484     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc477
 push dofunc_0
 call error1
 add  sp, 2
;-1485     storeFunction();

.dofunc477:
 call storeFunction
;-1486 

;-1487     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1488     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1489     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1490     expect('(');

 push 40
 call expect
 add  sp, 2
;-1491     LTop=GTop;

 mov ax, [GTop]
 mov word [LTop], ax
;-1492     VarNamePtrLocalStart=VarNamePtr;

 mov ax, [VarNamePtr]
 mov [bp-8], ax
;-1493 

;-1494     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc478
;-1495         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1496         do {

.dofunc479:
;-1497             typeName();

 call typeName
;-1498             addlocal();

 call addlocal
;-1499             narg+=2;

 add  word[bp-6], 2
;-1500             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1501             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc480
 add  word[bp-6], 2
;-1502             LTop++;

.dofunc480:
 inc  word[LTop]
;-1503             }

;-1504         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc481
 jmp .dofunc479
.dofunc481:
;-1505         expect(')');

 push 41
 call expect
 add  sp, 2
;-1506         }

;-1507 

;-1508     expect('{'); //function body

.dofunc478:
 push 123
 call expect
 add  sp, 2
;-1509     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1510     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1511     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1512     while(isvariable()) {

.dofunc482:
 call isvariable
 or  al, al
 je .dofunc483
;-1513         do {

.dofunc484:
;-1514             typeName();

 call typeName
;-1515             checknamelen();

 call checknamelen
;-1516             addlocal();

 call addlocal
;-1517             nloc-=2;

 sub  word[bp-2], 2
;-1518             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc485
 sub  word[bp-2], 2
;-1519             GData[LTop]=nloc;

.dofunc485:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1520             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc486
;-1521                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1522                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1523                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1524                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1525                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1526                 nloc+=2;

 add  word[bp-2], 2
;-1527                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1528             }

;-1529             LTop++;

.dofunc486:
 inc  word[LTop]
;-1530         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc487
 jmp .dofunc484
.dofunc487:
;-1531         expect(';');

 push 59
 call expect
 add  sp, 2
;-1532     }

;-1533     listproc();

 jmp .dofunc482
.dofunc483:
 call listproc
;-1534     if (LTop>GTop){

 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc488
;-1535         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1536         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1537         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1538         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1539         }

;-1540 

;-1541     while(istoken('}')==0)  stmt();

.dofunc488:
.dofunc489:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc490
 call stmt
;-1542 

;-1543     if (nreturn) {

 jmp .dofunc489
.dofunc490:
 mov ax, [nreturn]
 or  al, al
 je .dofunc491
;-1544             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1545             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1546             prc(':');

 push 58
 call prc
 add  sp, 2
;-1547         }

;-1548     if (LTop > GTop) printstring("\n LEAVE");

.dofunc491:
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc492
 push dofunc_6
 call printstring
 add  sp, 2
;-1549     printstring("\n ret");

.dofunc492:
 push dofunc_7
 call printstring
 add  sp, 2
;-1550     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1551     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1552     maxco1=strlen1(co);

 lea  ax, [co]
 push ax
 call strlen1
 add  sp, 2
 mov word [maxco1], ax
;-1553     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc493
 mov ax, [maxco1]
 mov word [maxco], ax
;-1554     printstring("\nENDP");

.dofunc493:
 push dofunc_8
 call printstring
 add  sp, 2
;-1555     VarNamePtr=VarNamePtrLocalStart;//delete local names

 mov ax, [bp-8]
 mov word [VarNamePtr], ax
;-1556 }

;-1557 

;-1558 char doglobName[IDLENMAX];

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
;-1559 int doglob() {


doglob: PROC
;-1560     int i; int j; int isstrarr;

;-1561     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;101 var sign word i = bp-2
;102 var sign word j = bp-4
;103 var sign word isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1562     if (GTop >= VARMAX) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 400
 jl  .doglob494
 push doglob_0
 call error1
 add  sp, 2
;-1563     if (iswidth == 0) error1("no VOID as var type");

.doglob494:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob495
 push doglob_1
 call error1
 add  sp, 2
;-1564     checknamelen();

.doglob495:
 call checknamelen
;-1565     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob496
 push doglob_2
 call error1
 add  sp, 2
;-1566     if (istoken('[')) {

.doglob496:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob497
;-1567         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1568         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob498
;-1569             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1570             printunsigned(orgDatai);

 push word [orgDatai]
 call printunsigned
 add  sp, 2
;-1571             printstring("\n"); printstring(Symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1572             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob499
 push doglob_5
 call printstring
 add  sp, 2
;-1573             if (iswidth==2) printstring(" resw ");

.doglob499:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob500
 push doglob_6
 call printstring
 add  sp, 2
;-1574             if (iswidth==4) printstring(" resd ");

.doglob500:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob501
 push doglob_7
 call printstring
 add  sp, 2
;-1575             printunsigned(lexval);

.doglob501:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1576             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1577             orgDatai=orgDatai+lexval;

 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1578             if (iswidth==2) orgDatai=orgDatai+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob502
 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1579             if (iswidth==4) {i= lexval * 3; orgDatai=orgDatai + i;}

.doglob502:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob503
 mov ax, [lexval]
;todo:save high part:mov [Longvar+2(+4)],(e)dx
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgDatai]
 add ax, [bp-2]
 mov word [orgDatai], ax
;-1580             GData[GTop]=lexval;

.doglob503:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1581             expect(']');

 push 93
 call expect
 add  sp, 2
;-1582         }else {

 jmp .doglob504
.doglob498:
;-1583             expect(']');

 push 93
 call expect
 add  sp, 2
;-1584             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob505
 push doglob_9
 call error1
 add  sp, 2
;-1585             printstring("\n");

.doglob505:
 push doglob_10
 call printstring
 add  sp, 2
;-1586             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1587             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1588             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1589             strcpy(doglobName, Symbol);//save Symbol name

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1590             expect('=');

 push 61
 call expect
 add  sp, 2
;-1591             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob506
;-1592                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1593                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1594                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1595                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1596                 i=strlen1(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen1
 add  sp, 2
 mov [bp-2], ax
;-1597                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1598                 }

;-1599             else if (istoken('{' )) {

 jmp .doglob507
.doglob506:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob508
;-1600                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1601                 do {

.doglob509:
;-1602                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob510
 push 44
 call prc
 add  sp, 2
;-1603                     expect(T_CONST);

.doglob510:
 push 257
 call expect
 add  sp, 2
;-1604                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1605                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1606                     }

;-1607                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob511
 jmp .doglob509
.doglob511:
;-1608                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1609             }

;-1610         else error1("String or number array expected");

 jmp .doglob512
.doglob508:
 push doglob_13
 call error1
 add  sp, 2
;-1611         };

.doglob512:
.doglob507:
.doglob504:
;-1612     }else { //expect('=');

 jmp .doglob513
.doglob497:
;-1613         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1614         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1615         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob514
 push doglob_15
 call printstring
 add  sp, 2
;-1616         else {

 jmp .doglob515
.doglob514:
;-1617             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob516
 push doglob_16
 call printstring
 add  sp, 2
;-1618             else if (iswidth==2) printstring(" dw ");

 jmp .doglob517
.doglob516:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob518
 push doglob_17
 call printstring
 add  sp, 2
;-1619             else                 printstring(" dd ");

 jmp .doglob519
.doglob518:
 push doglob_18
 call printstring
 add  sp, 2
;-1620         }

.doglob519:
.doglob517:
;-1621     if(istoken('-')) prc('-');

.doglob515:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob520
 push 45
 call prc
 add  sp, 2
;-1622     if (istoken('=')) {

.doglob520:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob521
;-1623         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1624         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1625         }else printunsigned(0);

 jmp .doglob522
.doglob521:
 push 0
 call printunsigned
 add  sp, 2
;-1626     }

.doglob522:
;-1627     GSign[GTop]=issign;

.doglob513:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1628     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1629     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1630     pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1631     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob523
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1632         else strcpy(pt, Symbol);

 jmp .doglob524
.doglob523:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1633 	if (isstrarr) strcpy(Symbol, doglobName);

.doglob524:
 mov ax, [bp-6]
 or  al, al
 je .doglob525
 lea  ax, [doglobName]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-1634 	storeVarName();

.doglob525:
 call storeVarName
;-1635     GTop++;

 inc  word[GTop]
;-1636     expect(';');

 push 59
 call expect
 add  sp, 2
;-1637 }

;-1638 

;-1639 int dodefine() {

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
;-1640     expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1641     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine526
;-1642         if (GTop >= VARMAX) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 400
 jl  .dodefine527
 push dodefine_0
 call error1
 add  sp, 2
;-1643         checknamelen();

.dodefine527:
 call checknamelen
;-1644         if (checkName() != 0) error1("#Define var already defined");

 call checkName
 cmp ax, 0
 je  .dodefine528
 push dodefine_1
 call error1
 add  sp, 2
;-1645         if (eqstr(Symbol, "ORGDATA")) {

.dodefine528:
 push dodefine_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine529
;-1646             orgDataOriginal=lexval;

 mov ax, [lexval]
 mov word [orgDataOriginal], ax
;-1647             orgDatai=lexval;

 mov ax, [lexval]
 mov word [orgDatai], ax
;-1648             expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1649             return;

 jmp .retndodefine
;-1650         }

;-1651         GSign [GTop]='U';

.dodefine529:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1652         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1653         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1654         pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1655         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1656         storeVarName();

 call storeVarName
;-1657         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1658         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1659         GTop++;

 inc  word[GTop]
;-1660     }

;-1661 }

.dodefine526:
;-1662 

;-1663 int parse() {

 .retndodefine:
 ret
dodefine_0 db "global table (define) full",0
dodefine_1 db "#Define var already defined",0
dodefine_2 db "ORGDATA",0
ENDP

parse: PROC
;-1664     token=getlex();

 call getlex
 mov word [token], ax
;-1665     do {

.parse530:
;-1666         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse531
 mov ax, 1
 jmp .retnparse
;-1667         if (istoken('#')) {

.parse531:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse532
;-1668              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse533
 call dodefine
;-1669              else error1("define expected");

 jmp .parse534
.parse533:
 push parse_0
 call error1
 add  sp, 2
;-1670         }

.parse534:
;-1671     else{

 jmp .parse535
.parse532:
;-1672         typeName();

 call typeName
;-1673         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse536
 call dofunc
;-1674         else doglob(); }

 jmp .parse537
.parse536:
 call doglob
.parse537:
;-1675     } while(1);

.parse535:
 mov ax, 1
 or  al, al
 je .parse538
 jmp .parse530
.parse538:
;-1676 }

;-1677 

;-1678 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1679 int getarguments() {


getarguments: PROC
;-1680     int arglen1; unsigned int i; char *c;

;-1681     isPrint=1;

;Function : getarguments, Number local Var: 3
; # type sign width local variables
;103 var sign word arglen1 = bp-2
;104 var unsg word i = bp-4
;105 ptr sign byte c = bp-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1682     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1683     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarguments539
;-1684         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1685         cputs(" Usage: A.COM in_file[.C]: ");

 push getarguments_0
 call cputs
 add  sp, 2
;-1686         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1687         }

;-1688     i=arglen1+129;

.getarguments539:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1689     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1690     arglen1--;

 dec  word[bp-2]
;-1691     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1692     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1693     if (instr1(namein, '.') == 0) strcat(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarguments540
 push getarguments_1
 lea  ax, [namein]
 push ax
 call strcat
 add  sp, 4
;-1694     strcpy(namelst, namein);

.getarguments540:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1695     i=strlen1(namelst);

 lea  ax, [namelst]
 push ax
 call strlen1
 add  sp, 2
 mov [bp-4], ax
;-1696     i--;

 dec  word[bp-4]
;-1697     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1698     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1699 }

;-1700 int openfiles() {

 LEAVE
 ret
getarguments_0 db " Usage: A.COM in_file[.C]: ",0
getarguments_1 db ".C",0
ENDP

openfiles: PROC
;-1701     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1702     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles541
;-1703         cputs("Source file missing (.C): ");

 push openfiles_0
 call cputs
 add  sp, 2
;-1704         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1705         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1706         }

;-1707     fdout=creatR(namelst);

.openfiles541:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1708     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles542
;-1709         cputs("list file not creatable: ");

 push openfiles_1
 call cputs
 add  sp, 2
;-1710         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1711         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1712         }

;-1713     printstring(";");

.openfiles542:
 push openfiles_2
 call printstring
 add  sp, 2
;-1714     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1715     printstring(", Input: "); printstring(namein);

 push openfiles_3
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1716     printstring(", Output: "); printstring(namelst);

 push openfiles_4
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1717 }

;-1718 

;-1719 int epilog() {

 ret
openfiles_0 db "Source file missing (.C): ",0
openfiles_1 db "list file not creatable: ",0
openfiles_2 db ";",0
openfiles_3 db ", Input: ",0
openfiles_4 db ", Output: ",0
ENDP

epilog: PROC
;-1720     unsigned int i;

;-1721     isPrint=1;

;Function : epilog, Number local Var: 1
; # type sign width local variables
;103 var unsg word i = bp-2;
 ENTER  2,0
 mov ax, 1
 mov byte [isPrint], al
;-1722     GTop--;

 dec  word[GTop]
;-1723 /*

;-1724     printstring("\n;Glob. variables:"); printunsigned(GTop);

;-1725     printstring(" (");                  printunsigned(VARMAX);

;-1726     i = VarNamePtr - &VarNames;

;-1727     printstring("):");                  printunsigned(i);

;-1728     printstring(" (");					printunsigned(VARNAMESMAX);

;-1729     printstring("), Functions:");       printunsigned(FunctionMaxIx);

;-1730     printstring(" (");                  printunsigned(FUNCMAX);

;-1731     i = FunctionNamePtr - &FunctionNames;

;-1732     printstring("):");                  printunsigned(i);

;-1733     printstring(" (");					printunsigned(FUNCTIONNAMESMAX);

;-1734     printstring(")\n;Lines:");          printunsigned(lineno);

;-1735     printstring(", Constant: ");        printunsigned(maxco);

;-1736     printstring(" (");                  printunsigned(COMAX);

;-1737 	printstring("). ");

;-1738 */

;-1739     i = COMAX;

 mov ax, 4000
 mov [bp-2], ax
;-1740     i = i - maxco;

 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax
;-1741     if (i<=500)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-2]
 cmp ax, 500
 ja  .epilog543
 push epilog_0
 call printstring
 add  sp, 2
;-1742 //    printstring("), stacksize: ");

;-1743     i=65535;

.epilog543:
 mov ax, 65535
 mov [bp-2], ax
;-1744     i=i-orgDatai;

 mov ax, [bp-2]
 sub ax, [orgDatai]
 mov [bp-2], ax
;-1745 //    printunsigned(i);

;-1746     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog544
 push epilog_1
 call printstring
 add  sp, 2
;-1747 

;-1748 }

.epilog544:
;-1749 

;-1750 int main() {

 LEAVE
 ret
epilog_0 db "\n ** Warning ** constant area too small",0
epilog_1 db "\n *** Warning *** Stack too small",0
ENDP

main: PROC
;-1751     getarguments();

 call getarguments
;-1752     openfiles();

 call openfiles
;-1753     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1754     printstring("\norg  256 \njmp main");

 push main_0
 call printstring
 add  sp, 2
;-1755 

;-1756 	GTop = 1;

 mov ax, 1
 mov word [GTop], ax
;-1757     VarNamePtr= &VarNames;

 mov ax, VarNames
 mov word [VarNamePtr], ax
;-1758     FunctionNamePtr= &FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1759     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1760     orgDatai=orgDataOriginal;

 mov ax, [orgDataOriginal]
 mov word [orgDatai], ax
;-1761     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1762     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1763     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1764 

;-1765     parse();

 call parse
;-1766 

;-1767     epilog();

 call epilog
;-1768     end1(0);

 push 0
 call end1
 add  sp, 2
;-1769 }

;-1770 

 ret
main_0 db "\norg  256 \njmp main",0
ENDP