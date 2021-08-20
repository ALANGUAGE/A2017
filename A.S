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
 jbe .test2
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
;97 var unsg byte c = bp+-2;
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

;-219 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-220     c=0;

;Function : strlen, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign word c = bp+-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-221     while (*s!=0) {s++; c++;}

.strlen18:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen19
 inc  word[bp+4]
 inc  word[bp-2]
;-222     return c;

 jmp .strlen18
.strlen19:
 mov ax, [bp-2]
 jmp .retnstrlen
;-223 }

;-224 

;-225 int strlen1(char *s) { int c;

 .retnstrlen:
 LEAVE
 ret
ENDP

strlen1: PROC
;-226     c=0;

;Function : strlen1, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign word c = bp+-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-227     if (*s == 34) return 0; // "  quotation

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 34
 jne .strlen120
 mov ax, 0
 jmp .retnstrlen1
;-228     while (*s!=0) {s++; c++;}

.strlen120:
.strlen121:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen122
 inc  word[bp+4]
 inc  word[bp-2]
;-229     return c;

 jmp .strlen121
.strlen122:
 mov ax, [bp-2]
 jmp .retnstrlen1
;-230 }

;-231 

;-232 int strcpy(char *s, char *t) {//new

 .retnstrlen1:
 LEAVE
 ret
ENDP

strcpy: PROC
;-233     while (*t!=0) {

;Function : strcpy, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 ptr sign byte t = bp+6;
 ENTER  0,0
.strcpy23:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy24
;-234     	*s=*t; s++; t++; }

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]
;-235     *s=0;

 jmp .strcpy23
.strcpy24:
 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-236     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-237 }

;-238 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-239     while(*p) {

;Function : eqstr, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte p = bp+4
;97 ptr sign byte q = bp+6;
 ENTER  0,0
.eqstr25:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr26
;-240         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr27
 mov ax, 0
 jmp .retneqstr
;-241         p++;

.eqstr27:
 inc  word[bp+4]
;-242         q++;

 inc  word[bp+6]
;-243     }

;-244     if(*q) return 0;

 jmp .eqstr25
.eqstr26:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr28
 mov ax, 0
 jmp .retneqstr
;-245     return 1;

.eqstr28:
 mov ax, 1
 jmp .retneqstr
;-246 }

;-247 int strcat(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat: PROC
;-248     while (*s != 0) s++;

;Function : strcat, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 ptr sign byte t = bp+6;
 ENTER  0,0
.strcat29:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat30
 inc  word[bp+4]
;-249     strcpy(s, t);

 jmp .strcat29
.strcat30:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-250 }

;-251 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-252     while(*s) {

;Function : toupper, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
.toupper31:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper32
;-253         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 97
 jl  .toupper33
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 122
 jg  .toupper34
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 sub ax, 32
 mov  bx, [bp+4]
 mov  [bx], al
;-254         s++;

.toupper34:
.toupper33:
 inc  word[bp+4]
;-255     }

;-256 }

 jmp .toupper31
.toupper32:
;-257 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-258     while(*s) {

;Function : instr1, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp+6;
 ENTER  0,0
.instr135:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr136
;-259         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr137
 mov ax, 1
 jmp .retninstr1
;-260         s++;

.instr137:
 inc  word[bp+4]
;-261     }

;-262     return 0;

 jmp .instr135
.instr136:
 mov ax, 0
 jmp .retninstr1
;-263 }

;-264 

;-265 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-266     *cloc=c;

;Function : eprc, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-267     cloc++;

 inc  word[cloc]
;-268 }

;-269 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-270     char c;

;-271     while(*s) {

;Function : eprs, Number local Var: 2
; # type sign width local variables
;96 ptr sign byte s = bp+4
;97 var sign byte c = bp+-2;
 ENTER  2,0
.eprs38:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs39
;-272         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-273         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-274         s++;

 inc  word[bp+4]
;-275     }

;-276 }

 jmp .eprs38
.eprs39:
;-277 

;-278 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-279     if (isPrint) {

;Function : prc, Number local Var: 1
; # type sign width local variables
;96 var unsg byte c = bp+4;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc40
;-280         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc41
;-281             al=13;

 mov  al, 13
;-282             writetty();

 call writetty
;-283         }

;-284         al=c;

.prc41:
 mov  al, [bp+4]
;-285         writetty();

 call writetty
;-286     }

;-287     fputcR(c, fdout);

.prc40:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-288 }

;-289 

;-290 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-291     unsigned char c;

;-292     while(*s){

;Function : prscomment, Number local Var: 2
; # type sign width local variables
;96 ptr unsg byte s = bp+4
;97 var unsg byte c = bp+-2;
 ENTER  2,0
.prscomment42:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment43
;-293         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-294         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-295         s++;

 inc  word[bp+4]
;-296     }

;-297 }

 jmp .prscomment42
.prscomment43:
;-298 

;-299 int printstring(unsigned char *s) {

 LEAVE
 ret
ENDP

printstring: PROC
;-300     unsigned char c; int com;

;-301     com=0;

;Function : printstring, Number local Var: 3
; # type sign width local variables
;96 ptr unsg byte s = bp+4
;97 var unsg byte c = bp+-2
;98 var sign word com = bp+-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-302     while(*s) {

.printstring44:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .printstring45
;-303         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-304         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .printstring46
 mov ax, [bp-4]
 or  al, al
 je .printstring47
 mov ax, 0
 mov [bp-4], ax
;-305                    else com=1;

 jmp .printstring48
.printstring47:
 mov ax, 1
 mov [bp-4], ax
;-306         if (c==92) {

.printstring48:
.printstring46:
 mov al, [bp-2]
 cmp al, 92
 jne .printstring49
;-307             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .printstring50
;-308                 s++;

 inc  word[bp+4]
;-309                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-310                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .printstring51
 mov ax, 10
 mov [bp-2], al
;-311                 if (c=='t') c= 9;

.printstring51:
 mov al, [bp-2]
 cmp al, 116
 jne .printstring52
 mov ax, 9
 mov [bp-2], al
;-312             }

.printstring52:
;-313         }

.printstring50:
;-314         prc(c);

.printstring49:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-315         s++;

 inc  word[bp+4]
;-316     }

;-317 }

 jmp .printstring44
.printstring45:
;-318 

;-319 int eprnum(int n){//for docall procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-320     int e;

;-321     if(n<0) {

;Function : eprnum, Number local Var: 2
; # type sign width local variables
;96 var sign word n = bp+4
;97 var sign word e = bp+-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum53
;-322         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-323         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-324     }

;-325     if (n >= 10) {

.eprnum53:
 mov ax, [bp+4]
 cmp ax, 10
 jl  .eprnum54
;-326         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-327         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-328     }

;-329     n=n%10;

.eprnum54:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-330     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-331     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-332 }

;-333 

;-334 int printinteger (int n){

 LEAVE
 ret
ENDP

printinteger: PROC
;-335     int e;

;-336     if(n<0) {  prc('-');  n=mkneg(n); }

;Function : printinteger, Number local Var: 2
; # type sign width local variables
;96 var sign word n = bp+4
;97 var sign word e = bp+-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .printinteger55
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-337     if (n >= 10) {

.printinteger55:
 mov ax, [bp+4]
 cmp ax, 10
 jl  .printinteger56
;-338         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-339         printinteger(e);

 push word [bp-2]
 call printinteger
 add  sp, 2
;-340     }

;-341     n=n%10;

.printinteger56:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-342     n += '0';

 add  word[bp+4], 48
;-343     prc(n);//only print with isPrint=on

 push word [bp+4]
 call prc
 add  sp, 2
;-344 }

;-345 

;-346 int printunsigned(unsigned int n) {

 LEAVE
 ret
ENDP

printunsigned: PROC
;-347     unsigned int e;

;-348     if (n >= 10) {

;Function : printunsigned, Number local Var: 2
; # type sign width local variables
;96 var unsg word n = bp+4
;97 var unsg word e = bp+-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10
 jb  .printunsigned57
;-349         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-350         printunsigned(e);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-351     }

;-352     n = n % 10; /*unsigned mod*/

.printunsigned57:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-353     n += '0';

 add  word[bp+4], 48
;-354     prc(n);//only print with isPrint=on

 push word [bp+4]
 call prc
 add  sp, 2
;-355 }

;-356 

;-357 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-358     fcloseR(fdin);

;Function : end1, Number local Var: 1
; # type sign width local variables
;96 var sign word n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-359     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-360     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-361 }

;-362 

;-363 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-364     isPrint=1;

;Function : error1, Number local Var: 1
; # type sign width local variables
;96 ptr sign byte s = bp+4;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-365     lineno--;

 dec  word[lineno]
;-366     printstring("\n ");

 push error1_0
 call printstring
 add  sp, 2
;-367     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-368     printstring(";Line: ");

 push error1_1
 call printstring
 add  sp, 2
;-369     printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-370     printstring(" ************** ERROR: ");

 push error1_2
 call printstring
 add  sp, 2
;-371     printstring(s);

 push word [bp+4]
 call printstring
 add  sp, 2
;-372     printstring("  in column: ");

 push error1_3
 call printstring
 add  sp, 2
;-373     printunsigned(column);

 push word [column]
 call printunsigned
 add  sp, 2
;-374     printstring("\nToken: ");

 push error1_4
 call printstring
 add  sp, 2
;-375     printunsigned(token);

 push word [token]
 call printunsigned
 add  sp, 2
;-376     printstring(", Symbol: ");

 push error1_5
 call printstring
 add  sp, 2
;-377     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-378     end1(1);

 push 1
 call end1
 add  sp, 2
;-379 }

;-380 

;-381 int printinputline() {

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
;-382     int col;

;-383     col=0;

;Function : printinputline, Number local Var: 1
; # type sign width local variables
;96 var sign word col = bp+-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-384     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-385     do {

.printinputline58:
;-386         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-387         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline59
 jmp .retnprintinputline
;-388         *fgetsp=DOS_ByteRead;

.printinputline59:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-389         fgetsp++;

 inc  word[fgetsp]
;-390         col++;

 inc  word[bp-2]
;-391         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline60
 push printinputline_0
 call error1
 add  sp, 2
;-392         }

.printinputline60:
;-393         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline61
 jmp .printinputline58
.printinputline61:
;-394     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-395         printstring("\n;-");

 push printinputline_1
 call printstring
 add  sp, 2
;-396         printunsigned(lineno);

 push word [lineno]
 call printunsigned
 add  sp, 2
;-397         prc(' ');

 push 32
 call prc
 add  sp, 2
;-398         lineno++;

 inc  word[lineno]
;-399         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-400 }

;-401 

;-402 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-403     char c;

;-404     c=*fgetsp;

;Function : fgets1, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-405     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets162
;-406         printinputline();

 call printinputline
;-407         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets163
 mov ax, 0
 jmp .retnfgets1
;-408         fgetsp=&fgetsdest;

.fgets163:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-409         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-410         column=0;

 mov ax, 0
 mov word [column], ax
;-411     }

;-412     fgetsp++;

.fgets162:
 inc  word[fgetsp]
;-413     column++;

 inc  word[column]
;-414     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-415 }

;-416 

;-417 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-418     char r;

;-419     r = thechar;

;Function : next, Number local Var: 1
; # type sign width local variables
;96 var sign byte r = bp+-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-420     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-421     return r;

 mov al, [bp-2]
 jmp .retnnext
;-422 }

;-423 

;-424 int storeVarName() {

 .retnnext:
 LEAVE
 ret
ENDP

storeVarName: PROC
;-425     unsigned int i;

;-426     VarNamePtr=strcpy(VarNamePtr, Symbol);

;Function : storeVarName, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp+-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 push word [VarNamePtr]
 call strcpy
 add  sp, 4
 mov word [VarNamePtr], ax
;-427     VarNamePtr++;

 inc  word[VarNamePtr]
;-428     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-429     i += IDLENMAX;

 add  word[bp-2], 31
;-430     if (i > VARNAMESMAX) error1("too many variable names");

 mov ax, [bp-2]
 cmp ax, 4000
 jbe .storeVarName64
 push storeVarName_0
 call error1
 add  sp, 2
;-431 }

.storeVarName64:
;-432 

;-433 int getVarName(unsigned int i) {

 LEAVE
 ret
storeVarName_0 db "too many variable names",0
ENDP

getVarName: PROC
;-434 	int j; char *p;

;-435 	j = 1;

;Function : getVarName, Number local Var: 3
; # type sign width local variables
;96 var unsg word i = bp+4
;97 var sign word j = bp+-2
;98 ptr sign byte p = bp+-4;
 ENTER  4,0
 mov ax, 1
 mov [bp-2], ax
;-436 	p = &VarNames;

 mov ax, VarNames
 mov [bp-4], ax
;-437 	while (j < i) {

.getVarName65:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 jge .getVarName66
;-438 		while (*p) p++;

.getVarName67:
 mov bx, [bp-4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .getVarName68
 inc  word[bp-4]
;-439 		p++;

 jmp .getVarName67
.getVarName68:
 inc  word[bp-4]
;-440 		j++;

 inc  word[bp-2]
;-441 	}

;-442 	return p;

 jmp .getVarName65
.getVarName66:
 mov ax, [bp-4]
 jmp .retngetVarName
;-443 }

;-444 

;-445 int printName(unsigned int i) {

 .retngetVarName:
 LEAVE
 ret
ENDP

printName: PROC
;-446 	int j;

;-447     if (i < GTop) {

;Function : printName, Number local Var: 2
; # type sign width local variables
;96 var unsg word i = bp+4
;97 var sign word j = bp+-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jae .printName69
;-448 	    i=getVarName(i);

 push word [bp+4]
 call getVarName
 add  sp, 2
 mov [bp+4], ax
;-449         printstring(i);

 push word [bp+4]
 call printstring
 add  sp, 2
;-450     }

;-451     else {

 jmp .printName70
.printName69:
;-452         printstring("[bp");

 push printName_0
 call printstring
 add  sp, 2
;-453         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-454         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName71
 push 43
 call prc
 add  sp, 2
;-455         printinteger(j);

.printName71:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-456         prc(']');

 push 93
 call prc
 add  sp, 2
;-457     }

;-458 }

.printName70:
;-459 

;-460 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-461     if (c == 10) return 1;//LF

;Function : ifEOL, Number local Var: 1
; # type sign width local variables
;96 var sign byte c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL72
 mov ax, 1
 jmp .retnifEOL
;-462     if (c == 13) {//CR

.ifEOL72:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL73
;-463         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL74
 call next
 mov [bp+4], al
;-464         return 1;

.ifEOL74:
 mov ax, 1
 jmp .retnifEOL
;-465     }

;-466     return 0;

.ifEOL73:
 mov ax, 0
 jmp .retnifEOL
;-467 }

;-468 

;-469 int getlex() {

 .retnifEOL:
 LEAVE
 ret
ENDP

getlex: PROC
;-470     char c; char *p;

;-471     char symboltmp[80];

;-472     int i; int j; long l;

;-473 

;-474 	do {

;Function : getlex, Number local Var: 6
; # type sign width local variables
;96 var sign byte c = bp+-2
;97 ptr sign byte p = bp+-4
;98 arr sign byte symboltmp[65452] = bp+-84
;99 var sign word i = bp+-86
;100 var sign word j = bp+-88
;101 var sign long l = bp+-92;
 ENTER  92,0
.getlex75:
;-475 		c=next();

 call next
 mov [bp-2], al
;-476     	if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex76
 mov ax, 0
 jmp .retngetlex
;-477     	}

.getlex76:
;-478     while (c <= ' ');

 mov al, [bp-2]
 cmp al, 32
 jg  .getlex77
 jmp .getlex75
.getlex77:
;-479 

;-480   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

 mov al, [bp-2]
 cmp al, 61
 jne .getlex78
 mov al, [thechar]
 cmp al, 61
 jne .getlex79
 call next
 mov ax, 806
 jmp .retngetlex
.getlex79:
;-481   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex78:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex80
 mov al, [thechar]
 cmp al, 61
 jne .getlex81
 call next
 mov ax, 807
 jmp .retngetlex
.getlex81:
;-482   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex80:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex82
 mov al, [thechar]
 cmp al, 61
 jne .getlex83
 call next
 mov ax, 824
 jmp .retngetlex
.getlex83:
;-483   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex82:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex84
 mov al, [thechar]
 cmp al, 61
 jne .getlex85
 call next
 mov ax, 811
 jmp .retngetlex
.getlex85:
;-484   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex84:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex86
 mov al, [thechar]
 cmp al, 60
 jne .getlex87
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex87:
;-485   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex86:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex88
 mov al, [thechar]
 cmp al, 62
 jne .getlex89
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex89:
;-486   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex88:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex90
 mov al, [thechar]
 cmp al, 43
 jne .getlex91
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex91:
;-487   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex90:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex92
 mov al, [thechar]
 cmp al, 45
 jne .getlex93
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex93:
;-488   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex92:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex94
 mov al, [thechar]
 cmp al, 61
 jne .getlex95
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex95:
;-489   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex94:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex96
 mov al, [thechar]
 cmp al, 61
 jne .getlex97
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex97:
;-490   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex96:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex98
 mov al, [thechar]
 cmp al, 61
 jne .getlex99
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex99:
;-491   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex98:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex100
 mov al, [thechar]
 cmp al, 61
 jne .getlex101
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex101:
;-492   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex100:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex102
 mov al, [thechar]
 cmp al, 61
 jne .getlex103
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex103:
;-493   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex102:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex104
 mov al, [thechar]
 cmp al, 61
 jne .getlex105
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex105:
;-494   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex104:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex106
 mov al, [bp-2]
 jmp .retngetlex
;-495   if (c == '/') {

.getlex106:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex107
;-496       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex108
;-497           do c=next();

.getlex109:
 call next
 mov [bp-2], al
;-498           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex110
 jmp .getlex109
.getlex110:
 call getlex
 jmp .retngetlex
;-499       }

;-500   }

.getlex108:
;-501   if (c == '/') {

.getlex107:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex111
;-502       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex112
;-503           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-504           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex113
 jmp .g2
;-505           if (thechar != '/') goto g2;

.getlex113:
 mov al, [thechar]
 cmp al, 47
 je  .getlex114
 jmp .g2
;-506           c=next();

.getlex114:
 call next
 mov [bp-2], al
;-507           return getlex();

 call getlex
 jmp .retngetlex
;-508       } else  return '/';

 jmp .getlex115
.getlex112:
 mov ax, 47
 jmp .retngetlex
;-509   }

.getlex115:
;-510   if (c == '"') {

.getlex111:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex116
;-511       p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-512       c=next();

 call next
 mov [bp-2], al
;-513       while (c != '"') {

.getlex117:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex118
;-514           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-515           p++;

 inc  word[bp-4]
;-516           c=next();

 call next
 mov [bp-2], al
;-517           }

;-518           *p=0;

 jmp .getlex117
.getlex118:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-519       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-520   }

;-521   if (digit(c)) {

.getlex116:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex119
;-522       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-523       Llexval = (long) 0;//todo get number in long

 xor eax, eax
 mov ax, 0
 mov dword [Llexval], eax
;-524       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-525       Llexval= (long) c-'0';

 xor eax, eax
 mov al, [bp-2]
 sub al, 48
 mov dword [Llexval], eax
;-526       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex120
 mov ax, 88
 mov byte [thechar], al
;-527       if (thechar=='X') {

.getlex120:
 mov al, [thechar]
 cmp al, 88
 jne .getlex121
;-528           next();

 call next
;-529           while(alnum(thechar)) {

.getlex122:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-530               c=next();

 call next
 mov [bp-2], al
;-531               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex124
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-532       	       if (c>64) c=c-7;

.getlex124:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex125
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-533                c=c-48;

.getlex125:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-534                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-535                Llexval = Llexval << 4; // * 16

 mov eax, [Llexval]
 shl eax, 4
 mov dword [Llexval], eax
;-536                i = (int) c;

 xor ax, ax
 mov al, [bp-2]
 mov [bp-86], ax
;-537                l = (long) c;

 xor eax, eax
 mov al, [bp-2]
 mov [bp-92], eax
;-538                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-86]
 mov word [lexval], ax
;-539                Llexval = Llexval + l;

 mov eax, [Llexval]
 add eax, [bp-92]
 mov dword [Llexval], eax
;-540            }

;-541        }else {

 jmp .getlex122
.getlex123:
 jmp .getlex126
.getlex121:
;-542            while(digit(thechar)) {

.getlex127:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex128
;-543                c=next();

 call next
 mov [bp-2], al
;-544                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-545                lexval=lexval*10;

 mov ax, [lexval]
;todo:save high part:mov [Longvar+2(+4)],(e)dx
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-546 			asm	mov eax, [Llexval];//emulate: Llexval=Llexval*(long)10;

	mov eax, [Llexval];//emulate: Llexval=Llexval*(long)10;
;-547 		    __emit__ (0x66,0xBB,0x0A,0,0,0 );// error  mov ebx, 10

 db 102,187,10,0,0,0
;-548             asm mul ebx

 mul ebx
;-549 		    asm mov dword [Llexval], eax

 mov dword [Llexval], eax
;-550                i = (int) c;

 xor ax, ax
 mov al, [bp-2]
 mov [bp-86], ax
;-551                l = (long) c;

 xor eax, eax
 mov al, [bp-2]
 mov [bp-92], eax
;-552                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-86]
 mov word [lexval], ax
;-553                Llexval = Llexval + l;

 mov eax, [Llexval]
 add eax, [bp-92]
 mov dword [Llexval], eax
;-554            }

;-555       }

 jmp .getlex127
.getlex128:
;-556 //      lexval = Llexval;//cast long to int, todo remove calc of lexval

;-557 	if (Llexval != lexval) error1("lexval != Llexval");

.getlex126:
 mov eax, [Llexval]
 cmp ax, [lexval]
 je  .getlex129
 push getlex_1
 call error1
 add  sp, 2
;-558     return T_CONST;

.getlex129:
 mov ax, 257
 jmp .retngetlex
;-559   }

;-560   if (c==39) {//single apostrophe

.getlex119:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex130
;-561       lexval=next();

 call next
 mov word [lexval], ax
;-562       if (lexval==92) {//backslash

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex131
;-563           lexval=next();

 call next
 mov word [lexval], ax
;-564           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex132
 mov ax, 10
 mov word [lexval], ax
;-565           if (lexval=='t') lexval= 9;

.getlex132:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex133
 mov ax, 9
 mov word [lexval], ax
;-566           if (lexval=='0') lexval= 0;

.getlex133:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex134
 mov ax, 0
 mov word [lexval], ax
;-567           if (lexval=='\\') lexval=92;//backslash

.getlex134:
 mov ax, [lexval]
 cmp ax, 92
 jne .getlex135
 mov ax, 92
 mov word [lexval], ax
;-568       }

.getlex135:
;-569       next();

.getlex131:
 call next
;-570       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-571   }

;-572   if (alnum(c)) {

.getlex130:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex136
;-573     strcpy(symboltmp, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [bp-84]
 push ax
 call strcpy
 add  sp, 4
;-574     p=&Symbol;

 mov ax, Symbol
 mov [bp-4], ax
;-575     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-576     p++;

 inc  word[bp-4]
;-577     while(alnum(thechar)) {

.getlex137:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex138
;-578         c=next();

 call next
 mov [bp-2], al
;-579         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-580         p++;

 inc  word[bp-4]
;-581     }

;-582     *p=0;

 jmp .getlex137
.getlex138:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-583     if (eqstr(Symbol,"signed"  )) return T_SIGNED;

 push getlex_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 531
 jmp .retngetlex
;-584     if (eqstr(Symbol,"unsigned")) return T_UNSIGNED;

.getlex139:
 push getlex_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 532
 jmp .retngetlex
;-585     if (eqstr(Symbol,"void"    )) return T_VOID;

.getlex140:
 push getlex_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 529
 jmp .retngetlex
;-586     if (eqstr(Symbol,"int"     )) return T_INT;

.getlex141:
 push getlex_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 517
 jmp .retngetlex
;-587     if (eqstr(Symbol,"long"    )) return T_LONG;

.getlex142:
 push getlex_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 533
 jmp .retngetlex
;-588     if (eqstr(Symbol,"inth"    )) return T_INTH;

.getlex143:
 push getlex_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
 mov ax, 600
 jmp .retngetlex
;-589     if (eqstr(Symbol,"char"    )) return T_CHAR;

.getlex144:
 push getlex_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
 mov ax, 530
 jmp .retngetlex
;-590     if (eqstr(Symbol,"asm"     )) return T_ASM;

.getlex145:
 push getlex_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex146
 mov ax, 518
 jmp .retngetlex
;-591     if (eqstr(Symbol,"__asm"   )) return T_ASMBLOCK;

.getlex146:
 push getlex_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex147
 mov ax, 519
 jmp .retngetlex
;-592     if (eqstr(Symbol,"push"    )) return T_ASMDIRECT;

.getlex147:
 push getlex_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex148
 mov ax, 525
 jmp .retngetlex
;-593     if (eqstr(Symbol,"pop"     )) return T_ASMDIRECT;

.getlex148:
 push getlex_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex149
 mov ax, 525
 jmp .retngetlex
;-594     if (eqstr(Symbol,"iret"    )) return T_ASMDIRECT;

.getlex149:
 push getlex_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex150
 mov ax, 525
 jmp .retngetlex
;-595     if (eqstr(Symbol,"ret"     )) return T_ASMDIRECT;

.getlex150:
 push getlex_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex151
 mov ax, 525
 jmp .retngetlex
;-596     if (eqstr(Symbol,"cli"     )) return T_ASMDIRECT;

.getlex151:
 push getlex_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex152
 mov ax, 525
 jmp .retngetlex
;-597     if (eqstr(Symbol,"sti"     )) return T_ASMDIRECT;

.getlex152:
 push getlex_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex153
 mov ax, 525
 jmp .retngetlex
;-598     if (eqstr(Symbol,"__emit__")) return T_EMIT;

.getlex153:
 push getlex_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex154
 mov ax, 520
 jmp .retngetlex
;-599     if (eqstr(Symbol,"return"  )) return T_RETURN;

.getlex154:
 push getlex_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex155
 mov ax, 512
 jmp .retngetlex
;-600     if (eqstr(Symbol,"if"      )) return T_IF;

.getlex155:
 push getlex_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex156
 mov ax, 513
 jmp .retngetlex
;-601     if (eqstr(Symbol,"else"    )) return T_ELSE;

.getlex156:
 push getlex_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex157
 mov ax, 514
 jmp .retngetlex
;-602     if (eqstr(Symbol,"while"   )) return T_WHILE;

.getlex157:
 push getlex_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex158
 mov ax, 515
 jmp .retngetlex
;-603     if (eqstr(Symbol,"do"      )) return T_DO;

.getlex158:
 push getlex_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex159
 mov ax, 516
 jmp .retngetlex
;-604     if (eqstr(Symbol,"goto"    )) return T_GOTO;

.getlex159:
 push getlex_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex160
 mov ax, 521
 jmp .retngetlex
;-605     if (eqstr(Symbol,"define"  )) return T_DEFINE;

.getlex160:
 push getlex_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex161
 mov ax, 511
 jmp .retngetlex
;-606 

;-607     i=0;//convert define to value (lexval)

.getlex161:
 mov ax, 0
 mov [bp-86], ax
;-608     while (i < GTop) {

.getlex162:
 mov ax, [bp-86]
 cmp ax, [GTop]
 jge .getlex163
;-609         j=getVarName(i);

 push word [bp-86]
 call getVarName
 add  sp, 2
 mov [bp-88], ax
;-610         if (eqstr(Symbol,j)) {

 push word [bp-88]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex164
;-611             if (GType[i]=='#') {

 mov bx, [bp-86]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex165
;-612                 lexval=GData[i];

 mov bx, [bp-86]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-613                 strcpy(Symbol, symboltmp);

 lea  ax, [bp-84]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-614                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-615             }

;-616         }

.getlex165:
;-617         i++;

.getlex164:
 inc  word[bp-86]
;-618     }

;-619     return T_NAME; }

 jmp .getlex162
.getlex163:
 mov ax, 256
 jmp .retngetlex
;-620     error1("Input item not recognized");

.getlex136:
 push getlex_25
 call error1
 add  sp, 2
;-621 }

;-622 

;-623 int istoken(int t) {

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
;-624     if (token == t) {

;Function : istoken, Number local Var: 1
; # type sign width local variables
;96 var sign word t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken166
;-625         token=getlex();

 call getlex
 mov word [token], ax
;-626         return 1;

 mov ax, 1
 jmp .retnistoken
;-627     }

;-628     return 0;

.istoken166:
 mov ax, 0
 jmp .retnistoken
;-629 }

;-630 

;-631 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-632     if (istoken(t)==0) {

;Function : expect, Number local Var: 1
; # type sign width local variables
;96 var sign word t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect167
;-633         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-634         printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-635         printstring("\nExpected ASCII(dez): ");

 push expect_0
 call printstring
 add  sp, 2
;-636         printinteger(t);

 push word [bp+4]
 call printinteger
 add  sp, 2
;-637         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-638     }

;-639 }

.expect167:
;-640 

;-641 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-642     if (i < GTop) prc('[');

;Function : v, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, [GTop]
 jae .v168
 push 91
 call prc
 add  sp, 2
;-643     printName(i);

.v168:
 push word [bp+4]
 call printName
 add  sp, 2
;-644     if (i < GTop) prc(']');

 mov ax, [bp+4]
 cmp ax, [GTop]
 jae .v169
 push 93
 call prc
 add  sp, 2
;-645 }

.v169:
;-646 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-647     int i;

;-648     i=strlen(Symbol);

;Function : checknamelen, Number local Var: 1
; # type sign width local variables
;96 var sign word i = bp+-2;
 ENTER  2,0
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-649     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen170
 push checknamelen_0
 call error1
 add  sp, 2
;-650 }

.checknamelen170:
;-651 

;-652 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-653     unsigned int i; unsigned int j;

;-654     i=GTop;

;Function : checkName, Number local Var: 2
; # type sign width local variables
;96 var unsg word i = bp+-2
;97 var unsg word j = bp+-4;
 ENTER  4,0
 mov ax, [GTop]
 mov [bp-2], ax
;-655     while(i<LTop) {//todo look for local var first

.checkName171:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jae .checkName172
;-656         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-657         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName173
 mov ax, [bp-2]
 jmp .retncheckName
;-658         i++;

.checkName173:
 inc  word[bp-2]
;-659     }

;-660     i=1;

 jmp .checkName171
.checkName172:
 mov ax, 1
 mov [bp-2], ax
;-661     while(i<GTop) {

.checkName174:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jae .checkName175
;-662         j=getVarName(i);

 push word [bp-2]
 call getVarName
 add  sp, 2
 mov [bp-4], ax
;-663         if(eqstr(Symbol,j))return i;

 push word [bp-4]
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName176
 mov ax, [bp-2]
 jmp .retncheckName
;-664         i++;

.checkName176:
 inc  word[bp-2]
;-665     }

;-666     return 0;

 jmp .checkName174
.checkName175:
 mov ax, 0
 jmp .retncheckName
;-667 }

;-668 

;-669 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-670     unsigned int i;

;-671     i=checkName();

;Function : searchname, Number local Var: 1
; # type sign width local variables
;96 var unsg word i = bp+-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-672     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname177
 push searchname_0
 call error1
 add  sp, 2
;-673     return i;

.searchname177:
 mov ax, [bp-2]
 jmp .retnsearchname
;-674 }

;-675 

;-676 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-677     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1178
 push name1_0
 call error1
 add  sp, 2
;-678     token=getlex();

.name1178:
 call getlex
 mov word [token], ax
;-679 }

;-680 

;-681 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-682     int m; //0=V,1=*,2=&

;-683     issign='S';

;Function : typeName, Number local Var: 1
; # type sign width local variables
;96 var sign word m = bp+-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-684     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName179
 mov ax, 83
 mov byte [issign], al
;-685     if(istoken(T_UNSIGNED)) issign='U';

.typeName179:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName180
 mov ax, 85
 mov byte [issign], al
;-686     iswidth=2;

.typeName180:
 mov ax, 2
 mov byte [iswidth], al
;-687     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName181
 mov ax, 0
 mov byte [iswidth], al
;-688     if(istoken(T_CHAR))     iswidth=1;

.typeName181:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName182
 mov ax, 1
 mov byte [iswidth], al
;-689     if(istoken(T_INT))      iswidth=2;

.typeName182:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName183
 mov ax, 2
 mov byte [iswidth], al
;-690     if(istoken(T_LONG))     iswidth=4;

.typeName183:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName184
 mov ax, 4
 mov byte [iswidth], al
;-691     istype='V';

.typeName184:
 mov ax, 86
 mov byte [istype], al
;-692     m=0;

 mov ax, 0
 mov [bp-2], ax
;-693     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName185
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-694     if(istoken('&'))  {istype='&'; m=2;}

.typeName185:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName186
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-695     name1();

.typeName186:
 call name1
;-696     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-697 }

;-698 

;-699 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-700     char c;

;-701     c=GSign [i];

;Function : gettypes, Number local Var: 2
; # type sign width local variables
;96 var sign word i = bp+4
;97 var sign byte c = bp+-2;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-702     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes187
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes188
.gettypes187:
 mov ax, 0
 mov word [signi], ax
;-703     c=GWidth[i];

.gettypes188:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-704     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-705     wi=0;

 mov ax, 0
 mov word [wi], ax
;-706     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes189
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-707     if (c==2) {widthi=2;wi=2;}

.gettypes189:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes190
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-708     if (c==4) {widthi=4;wi=4;}

.gettypes190:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes191
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-709     c=GType [i];

.gettypes191:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-710     typei=0;

 mov ax, 0
 mov word [typei], ax
;-711     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes192
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-712     if (c=='&')  typei=2;

.gettypes192:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes193
 mov ax, 2
 mov word [typei], ax
;-713     return i;

.gettypes193:
 mov ax, [bp+4]
 jmp .retngettypes
;-714 }

;-715 

;-716 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-717     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400
 jl  .addlocal194
 push addlocal_0
 call error1
 add  sp, 2
;-718     if (checkName() != 0) error1("Variable already defined");

.addlocal194:
 call checkName
 cmp ax, 0
 je  .addlocal195
 push addlocal_1
 call error1
 add  sp, 2
;-719     GSign[LTop]=issign;

.addlocal195:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-720     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-721     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-722     pt=getVarName(LTop);

 push word [LTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-723     strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-724     storeVarName();

 call storeVarName
;-725 }

;-726 

;-727 

;-728 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-729        if(iscmp==T_EQ)			printstring("\n jne .");//ZF=0

;Function : cmpneg, Number local Var: 1
; # type sign width local variables
;96 var sign word ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg196
 push cmpneg_0
 call printstring
 add  sp, 2
;-730   else if(iscmp==T_NE)			printstring("\n je  .");//ZF=1

 jmp .cmpneg197
.cmpneg196:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg198
 push cmpneg_1
 call printstring
 add  sp, 2
;-731   else if(iscmp==T_LE)	if (ids)printstring("\n jg  .");//ZF=0 SF=OF

 jmp .cmpneg199
.cmpneg198:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg200
 mov ax, [bp+4]
 or  al, al
 je .cmpneg201
 push cmpneg_2
 call printstring
 add  sp, 2
;-732 						else    printstring("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg202
.cmpneg201:
 push cmpneg_3
 call printstring
 add  sp, 2
;-733   else if(iscmp==T_GE)	if (ids)printstring("\n jl  .");//SF!=OF

.cmpneg202:
 jmp .cmpneg203
.cmpneg200:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg204
 mov ax, [bp+4]
 or  al, al
 je .cmpneg205
 push cmpneg_4
 call printstring
 add  sp, 2
;-734 						else    printstring("\n jb  .");//jb=jc=CF=1

 jmp .cmpneg206
.cmpneg205:
 push cmpneg_5
 call printstring
 add  sp, 2
;-735   else if(iscmp=='<' )	if (ids)printstring("\n jge .");//SF=OF

.cmpneg206:
 jmp .cmpneg207
.cmpneg204:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg208
 mov ax, [bp+4]
 or  al, al
 je .cmpneg209
 push cmpneg_6
 call printstring
 add  sp, 2
;-736 						else	printstring("\n jae .");//CF=0

 jmp .cmpneg210
.cmpneg209:
 push cmpneg_7
 call printstring
 add  sp, 2
;-737   else if(iscmp=='>' )	if (ids)printstring("\n jle .");//ZF=1 | SF!=OF

.cmpneg210:
 jmp .cmpneg211
.cmpneg208:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg212
 mov ax, [bp+4]
 or  al, al
 je .cmpneg213
 push cmpneg_8
 call printstring
 add  sp, 2
;-738   						else	printstring("\n jbe .");//ZF=1 | CF=1

 jmp .cmpneg214
.cmpneg213:
 push cmpneg_9
 call printstring
 add  sp, 2
;-739   else error1("internal error compare unknown in CMPNEG()");

.cmpneg214:
 jmp .cmpneg215
.cmpneg212:
 push cmpneg_10
 call error1
 add  sp, 2
;-740 }

.cmpneg215:
.cmpneg211:
.cmpneg207:
.cmpneg203:
.cmpneg199:
.cmpneg197:
;-741 

;-742 int isrelational() {

 LEAVE
 ret
cmpneg_0 db "\n jne .",0
cmpneg_1 db "\n je  .",0
cmpneg_2 db "\n jg  .",0
cmpneg_3 db "\n ja  .",0
cmpneg_4 db "\n jl  .",0
cmpneg_5 db "\n jb  .",0
cmpneg_6 db "\n jge .",0
cmpneg_7 db "\n jae .",0
cmpneg_8 db "\n jle .",0
cmpneg_9 db "\n jbe .",0
cmpneg_10 db "internal error compare unknown in CMPNEG()",0
ENDP

isrelational: PROC
;-743     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational216
 jmp .w
;-744     if (token==T_NE) goto w;

.isrelational216:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational217
 jmp .w
;-745     if (token==T_LE) goto w;

.isrelational217:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational218
 jmp .w
;-746     if (token==T_GE) goto w;

.isrelational218:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational219
 jmp .w
;-747     if (token=='<' ) goto w;

.isrelational219:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational220
 jmp .w
;-748     if (token=='>' ) goto w;

.isrelational220:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational221
 jmp .w
;-749     return 0;

.isrelational221:
 mov ax, 0
 jmp .retnisrelational
;-750 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-751     token=getlex();

 call getlex
 mov word [token], ax
;-752     return 1;

 mov ax, 1
 jmp .retnisrelational
;-753 }

;-754 

;-755 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-756   if (strlen(Symbol) <  2) return 0;

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg222
 mov ax, 0
 jmp .retncheckreg
;-757   if (eqstr(Symbol,"al")) return 1;   if (eqstr(Symbol,"cl")) return 3;

.checkreg222:
 push checkreg_0
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 1
 jmp .retncheckreg
.checkreg223:
 push checkreg_1
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 3
 jmp .retncheckreg
;-758   if (eqstr(Symbol,"dl")) return 5;   if (eqstr(Symbol,"bl")) return 7;

.checkreg224:
 push checkreg_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 5
 jmp .retncheckreg
.checkreg225:
 push checkreg_3
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 7
 jmp .retncheckreg
;-759   if (eqstr(Symbol,"ah")) return 9;   if (eqstr(Symbol,"ch")) return 11;

.checkreg226:
 push checkreg_4
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 9
 jmp .retncheckreg
.checkreg227:
 push checkreg_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 11
 jmp .retncheckreg
;-760   if (eqstr(Symbol,"dh")) return 13;  if (eqstr(Symbol,"bh")) return 15;

.checkreg228:
 push checkreg_6
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 13
 jmp .retncheckreg
.checkreg229:
 push checkreg_7
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 15
 jmp .retncheckreg
;-761   if (eqstr(Symbol,"ax")) return 17;  if (eqstr(Symbol,"cx")) return 19;

.checkreg230:
 push checkreg_8
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 17
 jmp .retncheckreg
.checkreg231:
 push checkreg_9
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 19
 jmp .retncheckreg
;-762   if (eqstr(Symbol,"dx")) return 21;  if (eqstr(Symbol,"bx")) return 23;

.checkreg232:
 push checkreg_10
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 21
 jmp .retncheckreg
.checkreg233:
 push checkreg_11
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 23
 jmp .retncheckreg
;-763   if (eqstr(Symbol,"sp")) return 25;  if (eqstr(Symbol,"bp")) return 27;

.checkreg234:
 push checkreg_12
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg235
 mov ax, 25
 jmp .retncheckreg
.checkreg235:
 push checkreg_13
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg236
 mov ax, 27
 jmp .retncheckreg
;-764   if (eqstr(Symbol,"si")) return 29;  if (eqstr(Symbol,"di")) return 31;

.checkreg236:
 push checkreg_14
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg237
 mov ax, 29
 jmp .retncheckreg
.checkreg237:
 push checkreg_15
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg238
 mov ax, 31
 jmp .retncheckreg
;-765   if (eqstr(Symbol,"es")) return 33;  if (eqstr(Symbol,"cs")) return 35;

.checkreg238:
 push checkreg_16
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg239
 mov ax, 33
 jmp .retncheckreg
.checkreg239:
 push checkreg_17
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg240
 mov ax, 35
 jmp .retncheckreg
;-766   if (eqstr(Symbol,"ss")) return 37;  if (eqstr(Symbol,"ds")) return 39;

.checkreg240:
 push checkreg_18
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg241
 mov ax, 37
 jmp .retncheckreg
.checkreg241:
 push checkreg_19
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg242
 mov ax, 39
 jmp .retncheckreg
;-767   if (eqstr(Symbol,"fs")) return 41;  if (eqstr(Symbol,"gs")) return 43;

.checkreg242:
 push checkreg_20
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg243
 mov ax, 41
 jmp .retncheckreg
.checkreg243:
 push checkreg_21
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg244
 mov ax, 43
 jmp .retncheckreg
;-768   // (eqstr(Symbol,"ip")) return 45;

;-769   if (strlen(Symbol) >   3) return 0;

.checkreg244:
 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg245
 mov ax, 0
 jmp .retncheckreg
;-770   if (eqstr(Symbol,"eax")) return 47; if (eqstr(Symbol,"ecx")) return 50;

.checkreg245:
 push checkreg_22
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg246
 mov ax, 47
 jmp .retncheckreg
.checkreg246:
 push checkreg_23
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg247
 mov ax, 50
 jmp .retncheckreg
;-771   if (eqstr(Symbol,"edx")) return 53; if (eqstr(Symbol,"ebx")) return 56;

.checkreg247:
 push checkreg_24
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg248
 mov ax, 53
 jmp .retncheckreg
.checkreg248:
 push checkreg_25
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg249
 mov ax, 56
 jmp .retncheckreg
;-772   if (eqstr(Symbol,"esp")) return 59; if (eqstr(Symbol,"ebp")) return 62;

.checkreg249:
 push checkreg_26
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg250
 mov ax, 59
 jmp .retncheckreg
.checkreg250:
 push checkreg_27
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg251
 mov ax, 62
 jmp .retncheckreg
;-773   if (eqstr(Symbol,"esi")) return 65; if (eqstr(Symbol,"edi")) return 68;

.checkreg251:
 push checkreg_28
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg252
 mov ax, 65
 jmp .retncheckreg
.checkreg252:
 push checkreg_29
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg253
 mov ax, 68
 jmp .retncheckreg
;-774 //  if (eqstr(Symbol,"cr0")) return 71;

;-775   return 0;

.checkreg253:
 mov ax, 0
 jmp .retncheckreg
;-776 }

;-777 

;-778 char printregstr[]

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
;-779 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-780 

;-781 int printreg(int i) {


printreg: PROC
;-782     unsigned int k; unsigned char c;

;-783     k = &printregstr + i;

;Function : printreg, Number local Var: 3
; # type sign width local variables
;97 var sign word i = bp+4
;98 var unsg word k = bp+-2
;99 var unsg byte c = bp+-4;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-784     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-785     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-786     i++;

 inc  word[bp+4]
;-787     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-788     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-789     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-790     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg254
;-791         i++;

 inc  word[bp+4]
;-792         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-793         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-794         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-795         }

;-796 }

.printreg254:
;-797 

;-798 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 33457
ops resb 5
section .text
;-799 int doreg1(int iscmp1) {


doreg1: PROC
;-800     int i;

;-801     if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number local Var: 2
; # type sign width local variables
;98 var sign word iscmp1 = bp+4
;99 var sign word i = bp+-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1255
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-802     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1255:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1256
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-803     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1256:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1257
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-804     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1257:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1258
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-805     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1258:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1259
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-806     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1259:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1260
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-807     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1260:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1261
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-808     if (iscmp1 == 1) {

.doreg1261:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1262
;-809             token=getlex();

 call getlex
 mov word [token], ax
;-810             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1263
 push doreg1_7
 call error1
 add  sp, 2
;-811             strcpy(ops, "cmp");

.doreg1263:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-812         }

;-813     printstring("\n ");

.doreg1262:
 push doreg1_9
 call printstring
 add  sp, 2
;-814     printstring(ops);

 lea  ax, [ops]
 push ax
 call printstring
 add  sp, 2
;-815     printstring("  ");

 push doreg1_10
 call printstring
 add  sp, 2
;-816     printreg(ireg1);   //todo

 push word [ireg1]
 call printreg
 add  sp, 2
;-817     printstring(", ");

 push doreg1_11
 call printstring
 add  sp, 2
;-818 

;-819     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1264
;-820         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-821         goto reg1;

 jmp .reg1
;-822         }

;-823     mod2=typeName();

.doreg1264:
 call typeName
 mov word [mod2], ax
;-824     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-825     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1265
;-826         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-827         goto reg1;

 jmp .reg1
;-828         }

;-829     i=searchname();

.doreg1265:
 call searchname
 mov [bp-2], ax
;-830     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1266
 push word [bp-2]
 call printName
 add  sp, 2
;-831         else v(i);

 jmp .doreg1267
.doreg1266:
 push word [bp-2]
 call v
 add  sp, 2
;-832 reg1: if (iscmp1 == 1) {

.doreg1267:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1268
;-833     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-834     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-835     expect(')');

 push 41
 call expect
 add  sp, 2
;-836     }

;-837 }

.doreg1268:
;-838 

;-839 int compoundass(char *op, int mode, int id1) {

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
;-840     if(mode) error1("only scalar variable allowed");

;Function : compoundass, Number local Var: 3
; # type sign width local variables
;98 ptr sign byte op = bp+4
;99 var sign word mode = bp+6
;100 var sign word id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass269
 push compoundass_0
 call error1
 add  sp, 2
;-841     printstring("\n ");

.compoundass269:
 push compoundass_1
 call printstring
 add  sp, 2
;-842     printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-843     printstring("  ");

 push compoundass_2
 call printstring
 add  sp, 2
;-844     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-845     if (wi==2) printstring("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass270
 push compoundass_3
 call printstring
 add  sp, 2
;-846         else printstring("byte");

 jmp .compoundass271
.compoundass270:
 push compoundass_4
 call printstring
 add  sp, 2
;-847     v(id1);

.compoundass271:
 push word [bp+8]
 call v
 add  sp, 2
;-848     printstring(", ");

 push compoundass_5
 call printstring
 add  sp, 2
;-849     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-850     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-851 }

;-852 

;-853 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-854     gettypes(id1);

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
;-855     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1272
;-856         printstring("\n mov bx, ");

 push dovar1_0
 call printstring
 add  sp, 2
;-857         v(id1); printstring("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call printstring
 add  sp, 2
;-858         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-859         if(widthi == 1) printstring(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1273
 push dovar1_2
 call printstring
 add  sp, 2
;-860         if(widthi == 2) printstring(" ax, [bx]");

.dovar1273:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1274
 push dovar1_3
 call printstring
 add  sp, 2
;-861         return;

.dovar1274:
 jmp .retndovar1
;-862         }

;-863     if (mode==2){// & = adr

.dovar1272:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1275
;-864         printstring("\n ");

 push dovar1_4
 call printstring
 add  sp, 2
;-865         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-866         printstring(" ax, ");

 push dovar1_5
 call printstring
 add  sp, 2
;-867         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-868         return;

 jmp .retndovar1
;-869         }

;-870     if (ixarr) {//array

.dovar1275:
 mov ax, [bp+8]
 or  al, al
 je .dovar1276
;-871         printstring("\n mov bx, ");

 push dovar1_6
 call printstring
 add  sp, 2
;-872         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-873         if (wi==2) printstring("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1277
 push dovar1_7
 call printstring
 add  sp, 2
;-874         printstring("\n ");

.dovar1277:
 push dovar1_8
 call printstring
 add  sp, 2
;-875         printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-876         if (wi==2) printstring(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1278
 push dovar1_9
 call printstring
 add  sp, 2
;-877             else printstring(" al, ");

 jmp .dovar1279
.dovar1278:
 push dovar1_10
 call printstring
 add  sp, 2
;-878         prc('[');

.dovar1279:
 push 91
 call prc
 add  sp, 2
;-879         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-880         printstring(" + bx]");

 push dovar1_11
 call printstring
 add  sp, 2
;-881         return;

 jmp .retndovar1
;-882         }

;-883     printstring("\n ");

.dovar1276:
 push dovar1_12
 call printstring
 add  sp, 2
;-884     printstring(op);

 push word [bp+6]
 call printstring
 add  sp, 2
;-885     if(wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1280
 push dovar1_13
 call printstring
 add  sp, 2
;-886     if(wi==2) printstring(" ax, ");

.dovar1280:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1281
 push dovar1_14
 call printstring
 add  sp, 2
;-887     if(wi==4) printstring(" eax, ");

.dovar1281:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1282
 push dovar1_15
 call printstring
 add  sp, 2
;-888     v(id1);

.dovar1282:
 push word [bp+10]
 call v
 add  sp, 2
;-889 }

;-890 

;-891 int rterm(char *op) {

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
;-892     int mode; int opint; int ixarr; int id1;

;-893     if (istoken(T_CONST)) {

;Function : rterm, Number local Var: 5
; # type sign width local variables
;98 ptr sign byte op = bp+4
;99 var sign word mode = bp+-2
;100 var sign word opint = bp+-4
;101 var sign word ixarr = bp+-6
;102 var sign word id1 = bp+-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm283
;-894         printstring("\n ");

 push rterm_0
 call printstring
 add  sp, 2
;-895         printstring(op);

 push word [bp+4]
 call printstring
 add  sp, 2
;-896         if (wi==1) printstring(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm284
 push rterm_1
 call printstring
 add  sp, 2
;-897         if (wi==2) printstring(" ax, ");

.rterm284:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm285
 push rterm_2
 call printstring
 add  sp, 2
;-898         if (wi==4) printstring(" eax, ");

.rterm285:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm286
 push rterm_3
 call printstring
 add  sp, 2
;-899         printunsigned(lexval);

.rterm286:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-900         return;

 jmp .retnrterm
;-901         }

;-902     mode=typeName();

.rterm283:
 call typeName
 mov [bp-2], ax
;-903     id1=searchname();

 call searchname
 mov [bp-8], ax
;-904     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-905     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm287
;-906         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-907         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-908         expect(']');

 push 93
 call expect
 add  sp, 2
;-909         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-910         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm288
 push rterm_4
 call error1
 add  sp, 2
;-911         }

.rterm288:
;-912     if (eqstr(Symbol,"ax")) return;

.rterm287:
 push rterm_5
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm289
 jmp .retnrterm
;-913     opint=op;

.rterm289:
 mov ax, [bp+4]
 mov [bp-4], ax
;-914     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-915 }

;-916 

;-917 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-918     gettypes(i);

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
;-919     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign290
;-920         printstring("\n mov  bx, ");

 push doassign_0
 call printstring
 add  sp, 2
;-921         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-922         if (widthi == 2) printstring("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign291
 push doassign_1
 call printstring
 add  sp, 2
;-923             else  printstring("\n mov  [bx], al");

 jmp .doassign292
.doassign291:
 push doassign_2
 call printstring
 add  sp, 2
;-924         return;

.doassign292:
 jmp .retndoassign
;-925         }

;-926     if (mode==2) {// & = adr

.doassign290:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign293
;-927         printstring("\n mov  ");

 push doassign_3
 call printstring
 add  sp, 2
;-928         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-929         printstring(", ax");

 push doassign_4
 call printstring
 add  sp, 2
;-930         return;

 jmp .retndoassign
;-931         }

;-932     if (ixarr) {

.doassign293:
 mov ax, [bp+8]
 or  al, al
 je .doassign294
;-933         printstring("\n mov bx, ");

 push doassign_5
 call printstring
 add  sp, 2
;-934         if(ixconst) printunsigned(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign295
 push word [bp+8]
 call printunsigned
 add  sp, 2
;-935             else v(ixarr);

 jmp .doassign296
.doassign295:
 push word [bp+8]
 call v
 add  sp, 2
;-936         if (wi==2) printstring("\n shl bx, 1");

.doassign296:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign297
 push doassign_6
 call printstring
 add  sp, 2
;-937         printstring("\n mov [");

.doassign297:
 push doassign_7
 call printstring
 add  sp, 2
;-938         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-939         if (wi==2) printstring("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign298
 push doassign_8
 call printstring
 add  sp, 2
;-940             else printstring("+bx], al");

 jmp .doassign299
.doassign298:
 push doassign_9
 call printstring
 add  sp, 2
;-941         return;

.doassign299:
 jmp .retndoassign
;-942         }

;-943     if (wi==1){

.doassign294:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign300
;-944         printstring("\n mov ");

 push doassign_10
 call printstring
 add  sp, 2
;-945         if(i<GTop) printstring("byte ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign301
 push doassign_11
 call printstring
 add  sp, 2
;-946         v(i);

.doassign301:
 push word [bp+6]
 call v
 add  sp, 2
;-947         printstring(", al");

 push doassign_12
 call printstring
 add  sp, 2
;-948         return;

 jmp .retndoassign
;-949         }

;-950     if (wi==2){

.doassign300:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign302
;-951         printstring("\n mov ");

 push doassign_13
 call printstring
 add  sp, 2
;-952         if(i<GTop) printstring("word ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign303
 push doassign_14
 call printstring
 add  sp, 2
;-953         v(i);

.doassign303:
 push word [bp+6]
 call v
 add  sp, 2
;-954         printstring(", ax");

 push doassign_15
 call printstring
 add  sp, 2
;-955         return;

 jmp .retndoassign
;-956         }

;-957     if (wi==4){

.doassign302:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign304
;-958         printstring("\n mov ");

 push doassign_16
 call printstring
 add  sp, 2
;-959         if(i<GTop) printstring("dword ");

 mov ax, [bp+6]
 cmp ax, [GTop]
 jge .doassign305
 push doassign_17
 call printstring
 add  sp, 2
;-960         v(i);

.doassign305:
 push word [bp+6]
 call v
 add  sp, 2
;-961         printstring(", eax");

 push doassign_18
 call printstring
 add  sp, 2
;-962         return;

 jmp .retndoassign
;-963         }

;-964 }

.doassign304:
;-965 

;-966 int domul(int ids) {

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
;-967     int mode; int id1;

;-968     if (ids) {

;Function : domul, Number local Var: 3
; # type sign width local variables
;98 var sign word ids = bp+4
;99 var sign word mode = bp+-2
;100 var sign word id1 = bp+-4;
 ENTER  4,0
 mov ax, [bp+4]
 or  al, al
 je .domul306
;-969 	    rterm("imul");

 push domul_0
 call rterm
 add  sp, 2
;-970 	    return;

 jmp .retndomul
;-971 	    }

;-972 	printstring("\n;todo:save high part:mov [Longvar+2(+4)],(e)dx");

.domul306:
 push domul_1
 call printstring
 add  sp, 2
;-973 	if (istoken(T_CONST)) {//mul 123

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul307
;-974 		printstring("\n mov bx, ");

 push domul_2
 call printstring
 add  sp, 2
;-975 		printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-976 		printstring("\n mul bx");

 push domul_3
 call printstring
 add  sp, 2
;-977 		return;

 jmp .retndomul
;-978 	}

;-979 	mode=typeName();

.domul307:
 call typeName
 mov [bp-2], ax
;-980 	id1=searchname();

 call searchname
 mov [bp-4], ax
;-981 	if (mode) error1("only simple var as multiplier");

 mov ax, [bp-2]
 or  al, al
 je .domul308
 push domul_4
 call error1
 add  sp, 2
;-982 	gettypes(id1);

.domul308:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-983 	if (typei) error1("only simple int as multipier");

 mov ax, [typei]
 or  al, al
 je .domul309
 push domul_5
 call error1
 add  sp, 2
;-984 	if (wi==0) error1("multiplier");

.domul309:
 mov ax, [wi]
 cmp ax, 0
 jne .domul310
 push domul_6
 call error1
 add  sp, 2
;-985 	if (wi==1) printstring("\n mul byte ");//  AL  MUL r/m8  = AX

.domul310:
 mov ax, [wi]
 cmp ax, 1
 jne .domul311
 push domul_7
 call printstring
 add  sp, 2
;-986 	if (wi==2) printstring("\n mul word ");//  AX  MUL r/m16 = DX:AX

.domul311:
 mov ax, [wi]
 cmp ax, 2
 jne .domul312
 push domul_8
 call printstring
 add  sp, 2
;-987 	if (wi==4) printstring("\n mul dword ");//EAX  MUL r/m32 = EDX:EAX

.domul312:
 mov ax, [wi]
 cmp ax, 4
 jne .domul313
 push domul_9
 call printstring
 add  sp, 2
;-988 	v(id1);

.domul313:
 push word [bp-4]
 call v
 add  sp, 2
;-989 }

;-990 

;-991 int doidiv(int ids) {

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
;-992     int mode; int id1;

;-993     if (istoken(T_CONST)) {

;Function : doidiv, Number local Var: 3
; # type sign width local variables
;98 var sign word ids = bp+4
;99 var sign word mode = bp+-2
;100 var sign word id1 = bp+-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv314
;-994         printstring("\n mov bx, ");

 push doidiv_0
 call printstring
 add  sp, 2
;-995         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-996         if (ids) printstring("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv315
 push doidiv_1
 call printstring
 add  sp, 2
;-997             else printstring("\n mov dx, 0\n div bx");

 jmp .doidiv316
.doidiv315:
 push doidiv_2
 call printstring
 add  sp, 2
;-998         return;

.doidiv316:
 jmp .retndoidiv
;-999 	}

;-1000 	mode=typeName();

.doidiv314:
 call typeName
 mov [bp-2], ax
;-1001 	id1=searchname();

 call searchname
 mov [bp-4], ax
;-1002 	if (mode) error1("only simple var as divisor");//no *, &

 mov ax, [bp-2]
 or  al, al
 je .doidiv317
 push doidiv_3
 call error1
 add  sp, 2
;-1003 	gettypes(id1);//widthi, wi(0,1,2,4), typei(0, 1=*, 2=&)

.doidiv317:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-1004 	if (typei) error1("only char int or long as simple var divisor");

 mov ax, [typei]
 or  al, al
 je .doidiv318
 push doidiv_4
 call error1
 add  sp, 2
;-1005 	if (wi==0) error1("divisor");

.doidiv318:
 mov ax, [wi]
 cmp ax, 0
 jne .doidiv319
 push doidiv_5
 call error1
 add  sp, 2
;-1006 

;-1007 	if (wi==1) {//   AX   DIV r/m8  =  AL(Quotient),  AH(Remainder)

.doidiv319:
 mov ax, [wi]
 cmp ax, 1
 jne .doidiv320
;-1008 		if (ids) printstring("\n cbw\n idiv byte ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv321
 push doidiv_6
 call printstring
 add  sp, 2
;-1009 			else printstring("\n div byte ");

 jmp .doidiv322
.doidiv321:
 push doidiv_7
 call printstring
 add  sp, 2
;-1010 		}

.doidiv322:
;-1011 	if (wi==2) {//DX:AX   DIV r/m16 =  AX(Quotient),  DX(Remainder)

.doidiv320:
 mov ax, [wi]
 cmp ax, 2
 jne .doidiv323
;-1012 		if (ids) printstring("\n cwd\n idiv word ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv324
 push doidiv_8
 call printstring
 add  sp, 2
;-1013 			else printstring("\n xor dx, dx\n div word ");

 jmp .doidiv325
.doidiv324:
 push doidiv_9
 call printstring
 add  sp, 2
;-1014 		}

.doidiv325:
;-1015 	if (wi==4) {//EDX:EAX DIV r/m32 = EAX(Quotient), EDX(Remainder)

.doidiv323:
 mov ax, [wi]
 cmp ax, 4
 jne .doidiv326
;-1016 		if (ids) printstring("\n cdq\n idiv dword ");//sign ext DX:AX

 mov ax, [bp+4]
 or  al, al
 je .doidiv327
 push doidiv_10
 call printstring
 add  sp, 2
;-1017 			else printstring("\n xor edx, edx\n div dword ");

 jmp .doidiv328
.doidiv327:
 push doidiv_11
 call printstring
 add  sp, 2
;-1018 		}

.doidiv328:
;-1019 	v(id1);

.doidiv326:
 push word [bp-4]
 call v
 add  sp, 2
;-1020 }

;-1021 

;-1022 int domod(int ids) {

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
;-1023     doidiv(ids);

;Function : domod, Number local Var: 1
; # type sign width local variables
;98 var sign word ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-1024     if (wi==1) printstring("\n mov al, ah");

 mov ax, [wi]
 cmp ax, 1
 jne .domod329
 push domod_0
 call printstring
 add  sp, 2
;-1025     if (wi==2) printstring("\n mov ax, dx");

.domod329:
 mov ax, [wi]
 cmp ax, 2
 jne .domod330
 push domod_1
 call printstring
 add  sp, 2
;-1026     if (wi==4) printstring("\n mov eax, edx");

.domod330:
 mov ax, [wi]
 cmp ax, 4
 jne .domod331
 push domod_2
 call printstring
 add  sp, 2
;-1027 }

.domod331:
;-1028 

;-1029 

;-1030 int docalltype[10]; int docallvalue[10];

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
;-1031 

;-1032 int docall() {


docall: PROC
;-1033     int i; int narg; int t0;// 1=CONST, 2=String, 3=&, 4=Name, (5=reg)

;-1034     int n0;  int sz32;

;-1035 	char procname[IDLENMAX];

;-1036     narg=0;

;Function : docall, Number local Var: 6
; # type sign width local variables
;100 var sign word i = bp+-2
;101 var sign word narg = bp+-4
;102 var sign word t0 = bp+-6
;103 var sign word n0 = bp+-8
;104 var sign word sz32 = bp+-10
;105 arr sign byte procname[65495] = bp+-41;
 ENTER  41,0
 mov ax, 0
 mov [bp-4], ax
;-1037     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-1038     checknamelen();

 call checknamelen
;-1039     strcpy(&procname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [bp-41]
 push ax
 call strcpy
 add  sp, 4
;-1040     expect('(');

 push 40
 call expect
 add  sp, 2
;-1041 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall332
;-1042 	    do {

.docall333:
;-1043 	        narg++;

 inc  word[bp-4]
;-1044 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall334
 push docall_0
 call error1
 add  sp, 2
;-1045 	        t0=0;

.docall334:
 mov ax, 0
 mov [bp-6], ax
;-1046             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall335
;-1047                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-1048                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-1049                 }

;-1050             if(istoken(T_STRING)){

.docall335:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall336
;-1051                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-1052                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-1053                 eprs("\n");

 push docall_1
 call eprs
 add  sp, 2
;-1054                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-1055                 eprc(95);//underscore

 push 95
 call eprc
 add  sp, 2
;-1056                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-1057                 eprs(" db ");

 push docall_2
 call eprs
 add  sp, 2
;-1058                 eprc(34);//doubel apostrophe

 push 34
 call eprc
 add  sp, 2
;-1059                 eprs(Symbol);

 lea  ax, [Symbol]
 push ax
 call eprs
 add  sp, 2
;-1060                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-1061                 eprs(",0");

 push docall_3
 call eprs
 add  sp, 2
;-1062                 nconst++;

 inc  word[nconst]
;-1063                 }

;-1064             if(istoken('&'))     {

.docall336:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall337
;-1065                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-1066                 name1();

 call name1
;-1067                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-1068                 }

;-1069             if(istoken(T_NAME))  {

.docall337:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall338
;-1070                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-1071                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-1072                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-1073                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-1074                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall339
 mov ax, 3
 mov [bp-6], ax
;-1075 //todo push reg is missing t0=5

;-1076                 }

.docall339:
;-1077             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall338:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall340
 push docall_4
 call error1
 add  sp, 2
;-1078             docalltype [narg] = t0;

.docall340:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-1079             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-1080         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall341
 jmp .docall333
.docall341:
;-1081 

;-1082   	expect(')');

 push 41
 call expect
 add  sp, 2
;-1083   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-1084     do {

.docall342:
;-1085         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-1086         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-1087         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall343
;-1088             printstring("\n push ");

 push docall_5
 call printstring
 add  sp, 2
;-1089             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1090             }

;-1091         if(t0==2){

.docall343:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall344
;-1092             printstring("\n push ");

 push docall_6
 call printstring
 add  sp, 2
;-1093             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1094             prc(95);

 push 95
 call prc
 add  sp, 2
;-1095             printunsigned(n0);

 push word [bp-8]
 call printunsigned
 add  sp, 2
;-1096             }

;-1097         if(t0==3){

.docall344:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall345
;-1098             printstring("\n lea  ax, ");

 push docall_7
 call printstring
 add  sp, 2
;-1099             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1100             printstring("\n push ax");

 push docall_8
 call printstring
 add  sp, 2
;-1101             }

;-1102         if(t0==4){

.docall345:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall346
;-1103             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-1104             if (wi==1) {

 mov ax, [wi]
 cmp ax, 1
 jne .docall347
;-1105                 printstring("\n mov al, byte ");

 push docall_9
 call printstring
 add  sp, 2
;-1106                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1107                 printstring("\n mov ah, 0\n push ax");

 push docall_10
 call printstring
 add  sp, 2
;-1108             }

;-1109             else if(wi==2) {

 jmp .docall348
.docall347:
 mov ax, [wi]
 cmp ax, 2
 jne .docall349
;-1110                 printstring("\n push word ");

 push docall_11
 call printstring
 add  sp, 2
;-1111                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1112                 }

;-1113             else if(wi==4) {

 jmp .docall350
.docall349:
 mov ax, [wi]
 cmp ax, 4
 jne .docall351
;-1114                 printstring("\n push dword ");

 push docall_12
 call printstring
 add  sp, 2
;-1115                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1116                 sz32=sz32+2;

 mov ax, [bp-10]
 add ax, 2
 mov [bp-10], ax
;-1117                 }

;-1118             else error1("wi compiler error in docall() ");

 jmp .docall352
.docall351:
 push docall_13
 call error1
 add  sp, 2
;-1119             }

.docall352:
.docall350:
.docall348:
;-1120         if(t0==5){

.docall346:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall353
;-1121             printstring("\n push ");

 push docall_14
 call printstring
 add  sp, 2
;-1122             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1123             if (n0 >= 47) sz32=sz32+2;

 mov ax, [bp-8]
 cmp ax, 47
 jl  .docall354
 mov ax, [bp-10]
 add ax, 2
 mov [bp-10], ax
;-1124             }

.docall354:
;-1125         i--;

.docall353:
 dec  word[bp-2]
;-1126         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall355
 jmp .docall342
.docall355:
;-1127     }

;-1128 	printstring("\n call ");

.docall332:
 push docall_15
 call printstring
 add  sp, 2
;-1129 	printstring(&procname);

 lea  ax, [bp-41]
 push ax
 call printstring
 add  sp, 2
;-1130 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall356
;-1131 	    printstring("\n add  sp, ");

 push docall_16
 call printstring
 add  sp, 2
;-1132         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1133         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1134         printunsigned(narg);

 push word [bp-4]
 call printunsigned
 add  sp, 2
;-1135         }

;-1136 }

.docall356:
;-1137 

;-1138 

;-1139 int expr() {

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
;-1140     int mode;   int id1;

;-1141     int ixarr;  int ixconst;

;-1142     int ids;    int isCONST;

;-1143     int i;      unsigned char *p;

;-1144 

;-1145 	if (istoken('(')) {//cast to int or long, clear destination

;Function : expr, Number local Var: 8
; # type sign width local variables
;100 var sign word mode = bp+-2
;101 var sign word id1 = bp+-4
;102 var sign word ixarr = bp+-6
;103 var sign word ixconst = bp+-8
;104 var sign word ids = bp+-10
;105 var sign word isCONST = bp+-12
;106 var sign word i = bp+-14
;107 ptr unsg byte p = bp+-16;
 ENTER  16,0
 push 40
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
;-1146 		     if(istoken(T_INT)) printstring("\n xor ax, ax");

 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .expr358
 push expr_0
 call printstring
 add  sp, 2
;-1147 		else if(istoken(T_LONG)) printstring("\n xor eax, eax");

 jmp .expr359
.expr358:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .expr360
 push expr_1
 call printstring
 add  sp, 2
;-1148 		else error1("only int or long allowed");

 jmp .expr361
.expr360:
 push expr_2
 call error1
 add  sp, 2
;-1149 		expect(')');

.expr361:
.expr359:
 push 41
 call expect
 add  sp, 2
;-1150 		}

;-1151     if (istoken(T_CONST)) {// constant ;

.expr357:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr362
;-1152         printstring("\n mov ax, ");

 push expr_3
 call printstring
 add  sp, 2
;-1153         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1154         return 4;

 mov ax, 4
 jmp .retnexpr
;-1155         }

;-1156     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr362:
 call typeName
 mov [bp-2], ax
;-1157     ireg1=checkreg();//todo

 call checkreg
 mov word [ireg1], ax
;-1158     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr363
;-1159         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1160         return;

 jmp .retnexpr
;-1161         }

;-1162 

;-1163     if (token=='(')  {

.expr363:
 mov ax, [token]
 cmp ax, 40
 jne .expr364
;-1164         docall();

 call docall
;-1165         goto e1;

 jmp .e1
;-1166         }

;-1167 

;-1168     id1=searchname();

.expr364:
 call searchname
 mov [bp-4], ax
;-1169     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1170     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1171     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1172     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1173     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr365
;-1174         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr366
;-1175             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1176             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1177             expect(']');

 push 93
 call expect
 add  sp, 2
;-1178             }

;-1179         else {

 jmp .expr367
.expr366:
;-1180             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1181             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1182             expect(']');

 push 93
 call expect
 add  sp, 2
;-1183             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1184             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr368
 push expr_4
 call error1
 add  sp, 2
;-1185             }

.expr368:
;-1186         }

.expr367:
;-1187     if (istoken(T_PLUSPLUS  )) {

.expr365:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr369
;-1188         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr370
 push expr_5
 call error1
 add  sp, 2
;-1189         printstring("\n inc  ");

.expr370:
 push expr_6
 call printstring
 add  sp, 2
;-1190         

;-1191         if 		(wi==1) printstring("byte");

 mov ax, [wi]
 cmp ax, 1
 jne .expr371
 push expr_7
 call printstring
 add  sp, 2
;-1192         else if (wi==2) printstring("word"); 

 jmp .expr372
.expr371:
 mov ax, [wi]
 cmp ax, 2
 jne .expr373
 push expr_8
 call printstring
 add  sp, 2
;-1193         else if (wi==4) printstring("dword");

 jmp .expr374
.expr373:
 mov ax, [wi]
 cmp ax, 4
 jne .expr375
 push expr_9
 call printstring
 add  sp, 2
;-1194         else error1("wi compiler error in T_PLUSPLUS ");        

 jmp .expr376
.expr375:
 push expr_10
 call error1
 add  sp, 2
;-1195         v(id1);

.expr376:
.expr374:
.expr372:
 push word [bp-4]
 call v
 add  sp, 2
;-1196         goto e1;

 jmp .e1
;-1197         }

;-1198     if (istoken(T_MINUSMINUS)) {

.expr369:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr377
;-1199         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr378
 push expr_11
 call error1
 add  sp, 2
;-1200         printstring("\n dec  ");

.expr378:
 push expr_12
 call printstring
 add  sp, 2
;-1201         if 		(wi==1) printstring("byte");

 mov ax, [wi]
 cmp ax, 1
 jne .expr379
 push expr_13
 call printstring
 add  sp, 2
;-1202         else if (wi==2) printstring("word"); 

 jmp .expr380
.expr379:
 mov ax, [wi]
 cmp ax, 2
 jne .expr381
 push expr_14
 call printstring
 add  sp, 2
;-1203         else if (wi==4) printstring("dword");

 jmp .expr382
.expr381:
 mov ax, [wi]
 cmp ax, 4
 jne .expr383
 push expr_15
 call printstring
 add  sp, 2
;-1204         else error1("wi compiler error in T_MINUSMINUS ");        

 jmp .expr384
.expr383:
 push expr_16
 call error1
 add  sp, 2
;-1205         v(id1);

.expr384:
.expr382:
.expr380:
 push word [bp-4]
 call v
 add  sp, 2
;-1206         goto e1;

 jmp .e1
;-1207         }

;-1208 

;-1209     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr377:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr385
 push word [bp-4]
 push word [bp-2]
 push expr_17
 call compoundass
 add  sp, 6
 jmp .e1
;-1210     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr385:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr386
 push word [bp-4]
 push word [bp-2]
 push expr_18
 call compoundass
 add  sp, 6
 jmp .e1
;-1211     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr386:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr387
 push word [bp-4]
 push word [bp-2]
 push expr_19
 call compoundass
 add  sp, 6
 jmp .e1
;-1212     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr387:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr388
 push word [bp-4]
 push word [bp-2]
 push expr_20
 call compoundass
 add  sp, 6
 jmp .e1
;-1213     if (istoken(T_MULASS  )) error1("not implemented");

.expr388:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr389
 push expr_21
 call error1
 add  sp, 2
;-1214     if (istoken(T_DIVASS  )) error1("not implemented");

.expr389:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr390
 push expr_22
 call error1
 add  sp, 2
;-1215 

;-1216     if (istoken('=')) {

.expr390:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr391
;-1217         expr();

 call expr
;-1218         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1219         goto e1;

 jmp .e1
;-1220         }

;-1221     dovar1(mode, "mov", ixarr, id1);

.expr391:
 push word [bp-4]
 push word [bp-6]
 push expr_23
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1222 

;-1223 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr392
 push expr_24
 call rterm
 add  sp, 2
;-1224     else if (istoken('-')) rterm("sub");

 jmp .expr393
.expr392:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr394
 push expr_25
 call rterm
 add  sp, 2
;-1225     else if (istoken('&')) rterm("and");

 jmp .expr395
.expr394:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr396
 push expr_26
 call rterm
 add  sp, 2
;-1226     else if (istoken('|')) rterm("or" );

 jmp .expr397
.expr396:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr398
 push expr_27
 call rterm
 add  sp, 2
;-1227     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr399
.expr398:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr400
 push expr_28
 call rterm
 add  sp, 2
;-1228     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr401
.expr400:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr402
 push expr_29
 call rterm
 add  sp, 2
;-1229     else if (istoken('*')) domul (ids);

 jmp .expr403
.expr402:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr404
 push word [bp-10]
 call domul
 add  sp, 2
;-1230     else if (istoken('/')) doidiv(ids);

 jmp .expr405
.expr404:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr406
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1231     else if (istoken('%')) domod (ids);

 jmp .expr407
.expr406:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr408
 push word [bp-10]
 call domod
 add  sp, 2
;-1232     if (isrelational()) {

.expr408:
.expr407:
.expr405:
.expr403:
.expr401:
.expr399:
.expr397:
.expr395:
.expr393:
 call isrelational
 or  al, al
 je .expr409
;-1233         rterm("cmp");

 push expr_30
 call rterm
 add  sp, 2
;-1234         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1235         }

;-1236     return 0;

.expr409:
 mov ax, 0
 jmp .retnexpr
;-1237 }

;-1238 

;-1239 int pexpr() {//called from if, do, while

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
;-1240     expect('(');

 push 40
 call expect
 add  sp, 2
;-1241     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1242     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr410
;-1243         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1244         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr411
;-1245             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1246             return;

 jmp .retnpexpr
;-1247             }

;-1248         }

.pexpr411:
;-1249 

;-1250     expr();

.pexpr410:
 call expr
;-1251     if (iscmp==0) printstring("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr412
 push pexpr_0
 call printstring
 add  sp, 2
;-1252     printstring(fname);

.pexpr412:
 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1253     expect(')');

 push 41
 call expect
 add  sp, 2
;-1254 }

;-1255 

;-1256 

;-1257 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1258     printstring("\n.");

;Function : prlabel, Number local Var: 1
; # type sign width local variables
;100 var sign word n = bp+4;
 ENTER  0,0
 push prlabel_0
 call printstring
 add  sp, 2
;-1259     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1260     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1261     prc(':');

 push 58
 call prc
 add  sp, 2
;-1262 }

;-1263 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1264     printstring("\n jmp .");

;Function : prjump, Number local Var: 1
; # type sign width local variables
;100 var sign word n = bp+4;
 ENTER  0,0
 push prjump_0
 call printstring
 add  sp, 2
;-1265     printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1266     printunsigned(n);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1267 }

;-1268 

;-1269 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1270     int c; char cha;

;-1271     int jdest; int tst; int jtemp;

;-1272     if(istoken('{')) {

;Function : stmt, Number local Var: 5
; # type sign width local variables
;100 var sign word c = bp+-2
;101 var sign byte cha = bp+-4
;102 var sign word jdest = bp+-6
;103 var sign word tst = bp+-8
;104 var sign word jtemp = bp+-10;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt413
;-1273         while(istoken('}')==0) stmt();

.stmt414:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt415
 call stmt
;-1274         }

 jmp .stmt414
.stmt415:
;-1275     else if(istoken(T_IF)) {

 jmp .stmt416
.stmt413:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt417
;-1276         pexpr();

 call pexpr
;-1277         nlabel++;

 inc  word[nlabel]
;-1278         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1279         printinteger(jdest);

 push word [bp-6]
 call printinteger
 add  sp, 2
;-1280         stmt();

 call stmt
;-1281         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt418
;-1282             nlabel++;

 inc  word[nlabel]
;-1283             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1284             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1285             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1286             stmt();

 call stmt
;-1287             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1288         }

;-1289         else prlabel(jdest);

 jmp .stmt419
.stmt418:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1290     }

.stmt419:
;-1291     else if(istoken(T_DO)) {

 jmp .stmt420
.stmt417:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt421
;-1292         nlabel++;

 inc  word[nlabel]
;-1293         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1294         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1295         stmt();

 call stmt
;-1296         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1297         pexpr();

 call pexpr
;-1298         nlabel++;

 inc  word[nlabel]
;-1299         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1300         printinteger(jtemp);

 push word [bp-10]
 call printinteger
 add  sp, 2
;-1301         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1302          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1303     }

;-1304     else if(istoken(T_WHILE)) {

 jmp .stmt422
.stmt421:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt423
;-1305         nlabel++;

 inc  word[nlabel]
;-1306         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1307         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1308         pexpr();

 call pexpr
;-1309         nlabel++;

 inc  word[nlabel]
;-1310         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1311         printinteger(tst);

 push word [bp-8]
 call printinteger
 add  sp, 2
;-1312         stmt();

 call stmt
;-1313         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1314         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1315     }

;-1316     else if(istoken(T_GOTO))  {

 jmp .stmt424
.stmt423:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt425
;-1317         printstring("\n jmp .");

 push stmt_0
 call printstring
 add  sp, 2
;-1318         name1();

 call name1
;-1319         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1320         expect(';');

 push 59
 call expect
 add  sp, 2
;-1321     }

;-1322     else if(token==T_ASM)     {

 jmp .stmt426
.stmt425:
 mov ax, [token]
 cmp ax, 518
 jne .stmt427
;-1323       printstring("\n");

 push stmt_1
 call printstring
 add  sp, 2
;-1324       c=next();

 call next
 mov [bp-2], ax
;-1325       while(c != '\n') {

.stmt428:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt429
;-1326         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1327         c=next();

 call next
 mov [bp-2], ax
;-1328         };

 jmp .stmt428
.stmt429:
;-1329         token=getlex();

 call getlex
 mov word [token], ax
;-1330     }

;-1331     else if(token==T_ASMDIRECT)     {

 jmp .stmt430
.stmt427:
 mov ax, [token]
 cmp ax, 525
 jne .stmt431
;-1332       printstring("\n");

 push stmt_2
 call printstring
 add  sp, 2
;-1333       printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1334       c=next();

 call next
 mov [bp-2], ax
;-1335       while(c != '\n') {

.stmt432:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt433
;-1336         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1337         c=next();

 call next
 mov [bp-2], ax
;-1338         };

 jmp .stmt432
.stmt433:
;-1339         token=getlex();

 call getlex
 mov word [token], ax
;-1340     }

;-1341     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt434
.stmt431:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt435
;-1342         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt436
;-1343             printstring("\n"); cha=next();

 push stmt_3
 call printstring
 add  sp, 2
 call next
 mov [bp-4], al
;-1344             while(cha!= '}') {

.stmt437:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt438
;-1345                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1346                 cha=next();

 call next
 mov [bp-4], al
;-1347             }

;-1348             token=getlex();

 jmp .stmt437
.stmt438:
 call getlex
 mov word [token], ax
;-1349         } else error1("Curly open expected");

 jmp .stmt439
.stmt436:
 push stmt_4
 call error1
 add  sp, 2
;-1350     }

.stmt439:
;-1351     else if(istoken(T_INTH))  {

 jmp .stmt440
.stmt435:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt441
;-1352         printstring("\n int  ");

 push stmt_5
 call printstring
 add  sp, 2
;-1353         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1354         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1355         expect(';');

 push 59
 call expect
 add  sp, 2
;-1356     }

;-1357     else if(istoken(T_EMIT)) {

 jmp .stmt442
.stmt441:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt443
;-1358       printstring("\n db ");

 push stmt_6
 call printstring
 add  sp, 2
;-1359     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1360       printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1361       token=getlex();

 call getlex
 mov word [token], ax
;-1362       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt444
;-1363           prc(',');

 push 44
 call prc
 add  sp, 2
;-1364           goto L1;

 jmp .L1
;-1365       }

;-1366       expect(')');

.stmt444:
 push 41
 call expect
 add  sp, 2
;-1367     }

;-1368     else if(istoken(';'))      { }

 jmp .stmt445
.stmt443:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt446
;-1369     else if(istoken(T_RETURN)) {

 jmp .stmt447
.stmt446:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt448
;-1370         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt449
 call expr
;-1371         printstring("\n jmp .retn");

.stmt449:
 push stmt_7
 call printstring
 add  sp, 2
;-1372         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1373         nreturn++;

 inc  word[nreturn]
;-1374         expect(';');

 push 59
 call expect
 add  sp, 2
;-1375     }

;-1376     else if(thechar==':')      {

 jmp .stmt450
.stmt448:
 mov al, [thechar]
 cmp al, 58
 jne .stmt451
;-1377         printstring("\n."); // Label

 push stmt_8
 call printstring
 add  sp, 2
;-1378         printstring(Symbol); prc(':');

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1379         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1380         expect(':');

 push 58
 call expect
 add  sp, 2
;-1381     }

;-1382     else  {expr(); expect(';'); }

 jmp .stmt452
.stmt451:
 call expr
 push 59
 call expect
 add  sp, 2
;-1383 }

.stmt452:
.stmt450:
.stmt447:
.stmt445:
.stmt442:
.stmt440:
.stmt434:
.stmt430:
.stmt426:
.stmt424:
.stmt422:
.stmt420:
.stmt416:
;-1384 

;-1385 int isvariable() {

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
;-1386     if(token==T_SIGNED)   return 1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable453
 mov ax, 1
 jmp .retnisvariable
;-1387     if(token==T_UNSIGNED) return 1;

.isvariable453:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable454
 mov ax, 1
 jmp .retnisvariable
;-1388     if(token==T_CHAR)     return 1;

.isvariable454:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable455
 mov ax, 1
 jmp .retnisvariable
;-1389     if(token==T_INT)      return 1;

.isvariable455:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable456
 mov ax, 1
 jmp .retnisvariable
;-1390     if(token==T_LONG)     return 1;

.isvariable456:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable457
 mov ax, 1
 jmp .retnisvariable
;-1391     return 0;

.isvariable457:
 mov ax, 0
 jmp .retnisvariable
;-1392 }

;-1393 

;-1394 //***************************************************************

;-1395 int listvar(unsigned int i) {

 .retnisvariable:
 ret
ENDP

listvar: PROC
;-1396     unsigned int j;

;-1397     char c;

;-1398     printstring("\n;");

;Function : listvar, Number local Var: 3
; # type sign width local variables
;100 var unsg word i = bp+4
;101 var unsg word j = bp+-2
;102 var sign byte c = bp+-4;
 ENTER  4,0
 push listvar_0
 call printstring
 add  sp, 2
;-1399     printunsigned(i);

 push word [bp+4]
 call printunsigned
 add  sp, 2
;-1400     prc(32);

 push 32
 call prc
 add  sp, 2
;-1401     c=GType [i];

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
;-1402     if(c=='V')printstring("var ");

 mov al, [bp-4]
 cmp al, 86
 jne .listvar458
 push listvar_1
 call printstring
 add  sp, 2
;-1403     if(c=='*')printstring("ptr ");

.listvar458:
 mov al, [bp-4]
 cmp al, 42
 jne .listvar459
 push listvar_2
 call printstring
 add  sp, 2
;-1404     if(c=='&')printstring("arr ");

.listvar459:
 mov al, [bp-4]
 cmp al, 38
 jne .listvar460
 push listvar_3
 call printstring
 add  sp, 2
;-1405     if(c=='#')printstring("def ");

.listvar460:
 mov al, [bp-4]
 cmp al, 35
 jne .listvar461
 push listvar_4
 call printstring
 add  sp, 2
;-1406     c=GSign [i];

.listvar461:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
;-1407     if(c=='S')printstring("sign ");

 mov al, [bp-4]
 cmp al, 83
 jne .listvar462
 push listvar_5
 call printstring
 add  sp, 2
;-1408     if(c=='U')printstring("unsg ");

.listvar462:
 mov al, [bp-4]
 cmp al, 85
 jne .listvar463
 push listvar_6
 call printstring
 add  sp, 2
;-1409     c=GWidth[i];

.listvar463:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
;-1410     if(c== 0)printstring("NULL " );

 mov al, [bp-4]
 cmp al, 0
 jne .listvar464
 push listvar_7
 call printstring
 add  sp, 2
;-1411     if(c== 1)printstring("byte " );

.listvar464:
 mov al, [bp-4]
 cmp al, 1
 jne .listvar465
 push listvar_8
 call printstring
 add  sp, 2
;-1412     if(c== 2)printstring("word " );

.listvar465:
 mov al, [bp-4]
 cmp al, 2
 jne .listvar466
 push listvar_9
 call printstring
 add  sp, 2
;-1413     if(c== 4)printstring("long " );

.listvar466:
 mov al, [bp-4]
 cmp al, 4
 jne .listvar467
 push listvar_10
 call printstring
 add  sp, 2
;-1414     pt=getVarName(i);

.listvar467:
 push word [bp+4]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1415     printstring(pt);

 push word [pt]
 call printstring
 add  sp, 2
;-1416     if(GType[i]=='#') {

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne .listvar468
;-1417         prc('=');

 push 61
 call prc
 add  sp, 2
;-1418         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1419         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1420     }

;-1421     if(GType[i]=='&') {

.listvar468:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne .listvar469
;-1422         prc('[');

 push 91
 call prc
 add  sp, 2
;-1423         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1424         printunsigned(j);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1425         prc(']');

 push 93
 call prc
 add  sp, 2
;-1426     }

;-1427     if (i >= GTop) {

.listvar469:
 mov ax, [bp+4]
 cmp ax, [GTop]
 jb  .listvar470
;-1428         printstring(" = bp");

 push listvar_11
 call printstring
 add  sp, 2
;-1429         j=GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-1430         if (j > 0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jbe .listvar471
 push 43
 call prc
 add  sp, 2
;-1431         printinteger(j);

.listvar471:
 push word [bp-2]
 call printinteger
 add  sp, 2
;-1432     }

;-1433 }

.listvar470:
;-1434 

;-1435 int listproc() {

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
;-1436     int i;

;-1437     if (LTop > GTop) {

;Function : listproc, Number local Var: 1
; # type sign width local variables
;100 var sign word i = bp+-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .listproc472
;-1438         printstring("\n;Function : ");

 push listproc_0
 call printstring
 add  sp, 2
;-1439         printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1440         printstring(", Number local Var: ");

 push listproc_1
 call printstring
 add  sp, 2
;-1441         i=LTop - GTop;

 mov ax, [LTop]
 sub ax, [GTop]
 mov [bp-2], ax
;-1442         printunsigned(i);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1443         printstring("\n; # type sign width local variables");

 push listproc_2
 call printstring
 add  sp, 2
;-1444         i=GTop;

 mov ax, [GTop]
 mov [bp-2], ax
;-1445         while (i < LTop) {

.listproc473:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .listproc474
;-1446             listvar(i);

 push word [bp-2]
 call listvar
 add  sp, 2
;-1447             i++;

 inc  word[bp-2]
;-1448         }

;-1449     }

 jmp .listproc473
.listproc474:
;-1450 }

.listproc472:
;-1451 

;-1452 int searchFunction() {

 LEAVE
 ret
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number local Var: ",0
listproc_2 db "\n; # type sign width local variables",0
ENDP

searchFunction: PROC
;-1453     int FunctionIndex; char *p;

;-1454     p= &FunctionNames;

;Function : searchFunction, Number local Var: 2
; # type sign width local variables
;100 var sign word FunctionIndex = bp+-2
;101 ptr sign byte p = bp+-4;
 ENTER  4,0
 mov ax, FunctionNames
 mov [bp-4], ax
;-1455     FunctionIndex=1;          //0=function name not found

 mov ax, 1
 mov [bp-2], ax
;-1456     while (FunctionIndex <= FunctionMaxIx ) {

.searchFunction475:
 mov ax, [bp-2]
 cmp ax, [FunctionMaxIx]
 jg  .searchFunction476
;-1457         if (eqstr(p, Symbol)) return FunctionIndex;

 lea  ax, [Symbol]
 push ax
 push word [bp-4]
 call eqstr
 add  sp, 4
 or  al, al
 je .searchFunction477
 mov ax, [bp-2]
 jmp .retnsearchFunction
;-1458         p = strlen(p) + p;

.searchFunction477:
 push word [bp-4]
 call strlen
 add  sp, 2
 add ax, [bp-4]
 mov [bp-4], ax
;-1459         p++;

 inc  word[bp-4]
;-1460         FunctionIndex++;

 inc  word[bp-2]
;-1461     }

;-1462     return 0;               //no function found

 jmp .searchFunction475
.searchFunction476:
 mov ax, 0
 jmp .retnsearchFunction
;-1463 }

;-1464 

;-1465 int storeFunction() {

 .retnsearchFunction:
 LEAVE
 ret
ENDP

storeFunction: PROC
;-1466     unsigned int i;

;-1467     FunctionMaxIx++;        //leave 0 empty for function not notfound

;Function : storeFunction, Number local Var: 1
; # type sign width local variables
;100 var unsg word i = bp+-2;
 ENTER  2,0
 inc  word[FunctionMaxIx]
;-1468     if (FunctionMaxIx >= FUNCMAX) error1("Function table full");

 mov ax, [FunctionMaxIx]
 cmp ax, 300
 jl  .storeFunction478
 push storeFunction_0
 call error1
 add  sp, 2
;-1469     FunctionNamePtr=strcpy(FunctionNamePtr, Symbol);

.storeFunction478:
 lea  ax, [Symbol]
 push ax
 push word [FunctionNamePtr]
 call strcpy
 add  sp, 4
 mov word [FunctionNamePtr], ax
;-1470     FunctionNamePtr++;      //function name is saved

 inc  word[FunctionNamePtr]
;-1471     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1472     i += IDLENMAX;

 add  word[bp-2], 31
;-1473     if (i >= FUNCTIONNAMESMAX) error1("too many function names");

 mov ax, [bp-2]
 cmp ax, 3000
 jb  .storeFunction479
 push storeFunction_1
 call error1
 add  sp, 2
;-1474 }

.storeFunction479:
;-1475 

;-1476 int dofunc() {

 LEAVE
 ret
storeFunction_0 db "Function table full",0
storeFunction_1 db "too many function names",0
ENDP

dofunc: PROC
;-1477     int nloc; unsigned int j;int narg;

;-1478     int VarNamePtrLocalStart;

;-1479     cloc=&co;

;Function : dofunc, Number local Var: 4
; # type sign width local variables
;100 var sign word nloc = bp+-2
;101 var unsg word j = bp+-4
;102 var sign word narg = bp+-6
;103 var sign word VarNamePtrLocalStart = bp+-8;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1480     checknamelen();

 call checknamelen
;-1481     strcpy(fname, Symbol);

 lea  ax, [Symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1482     if(searchFunction()) error1("Function already defined");

 call searchFunction
 or  al, al
 je .dofunc480
 push dofunc_0
 call error1
 add  sp, 2
;-1483     storeFunction();

.dofunc480:
 call storeFunction
;-1484 

;-1485     printstring("\n\n");

 push dofunc_1
 call printstring
 add  sp, 2
;-1486     printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1487     printstring(": PROC");

 push dofunc_2
 call printstring
 add  sp, 2
;-1488     expect('(');

 push 40
 call expect
 add  sp, 2
;-1489     LTop=GTop;

 mov ax, [GTop]
 mov word [LTop], ax
;-1490     VarNamePtrLocalStart=VarNamePtr;

 mov ax, [VarNamePtr]
 mov [bp-8], ax
;-1491 

;-1492     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc481
;-1493         narg=2;

 mov ax, 2
 mov [bp-6], ax
;-1494         do {

.dofunc482:
;-1495             typeName();

 call typeName
;-1496             addlocal();

 call addlocal
;-1497             narg+=2;

 add  word[bp-6], 2
;-1498             GData[LTop]=narg;

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1499             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc483
 add  word[bp-6], 2
;-1500             LTop++;

.dofunc483:
 inc  word[LTop]
;-1501             }

;-1502         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc484
 jmp .dofunc482
.dofunc484:
;-1503         expect(')');

 push 41
 call expect
 add  sp, 2
;-1504         }

;-1505 

;-1506     expect('{'); //function body

.dofunc481:
 push 123
 call expect
 add  sp, 2
;-1507     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1508     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1509     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1510     while(isvariable()) {

.dofunc485:
 call isvariable
 or  al, al
 je .dofunc486
;-1511         do {

.dofunc487:
;-1512             typeName();

 call typeName
;-1513             checknamelen();

 call checknamelen
;-1514             addlocal();

 call addlocal
;-1515             nloc-=2;

 sub  word[bp-2], 2
;-1516             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc488
 sub  word[bp-2], 2
;-1517             GData[LTop]=nloc;

.dofunc488:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1518             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc489
;-1519                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1520                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1521                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1522                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1523                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1524                 nloc+=2;

 add  word[bp-2], 2
;-1525                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1526             }

;-1527             LTop++;

.dofunc489:
 inc  word[LTop]
;-1528         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc490
 jmp .dofunc487
.dofunc490:
;-1529         expect(';');

 push 59
 call expect
 add  sp, 2
;-1530     }

;-1531     listproc();

 jmp .dofunc485
.dofunc486:
 call listproc
;-1532     if (LTop>GTop){

 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc491
;-1533         printstring(";\n ENTER  ");

 push dofunc_3
 call printstring
 add  sp, 2
;-1534         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1535         printunsigned (nloc);

 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1536         printstring(",0");

 push dofunc_4
 call printstring
 add  sp, 2
;-1537         }

;-1538 

;-1539     while(istoken('}')==0)  stmt();

.dofunc491:
.dofunc492:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc493
 call stmt
;-1540 

;-1541     if (nreturn) {

 jmp .dofunc492
.dofunc493:
 mov ax, [nreturn]
 or  al, al
 je .dofunc494
;-1542             printstring("\n .retn");

 push dofunc_5
 call printstring
 add  sp, 2
;-1543             printstring(fname);

 lea  ax, [fname]
 push ax
 call printstring
 add  sp, 2
;-1544             prc(':');

 push 58
 call prc
 add  sp, 2
;-1545         }

;-1546     if (LTop > GTop) printstring("\n LEAVE");

.dofunc494:
 mov ax, [LTop]
 cmp ax, [GTop]
 jle .dofunc495
 push dofunc_6
 call printstring
 add  sp, 2
;-1547     printstring("\n ret");

.dofunc495:
 push dofunc_7
 call printstring
 add  sp, 2
;-1548     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1549     printstring(co);

 lea  ax, [co]
 push ax
 call printstring
 add  sp, 2
;-1550     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1551     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc496
 mov ax, [maxco1]
 mov word [maxco], ax
;-1552     printstring("\nENDP");

.dofunc496:
 push dofunc_8
 call printstring
 add  sp, 2
;-1553     VarNamePtr=VarNamePtrLocalStart;//delete local names

 mov ax, [bp-8]
 mov word [VarNamePtr], ax
;-1554 }

;-1555 

;-1556 char doglobName[IDLENMAX];

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
;-1557 int doglob() {


doglob: PROC
;-1558     int i; int j; int isstrarr;

;-1559     isstrarr=0;

;Function : doglob, Number local Var: 3
; # type sign width local variables
;101 var sign word i = bp+-2
;102 var sign word j = bp+-4
;103 var sign word isstrarr = bp+-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1560     if (GTop >= VARMAX) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 400
 jl  .doglob497
 push doglob_0
 call error1
 add  sp, 2
;-1561     if (iswidth == 0) error1("no VOID as var type");

.doglob497:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob498
 push doglob_1
 call error1
 add  sp, 2
;-1562     checknamelen();

.doglob498:
 call checknamelen
;-1563     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob499
 push doglob_2
 call error1
 add  sp, 2
;-1564     if (istoken('[')) {

.doglob499:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob500
;-1565         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1566         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob501
;-1567             printstring("\nsection .bss\nabsolute ");

 push doglob_3
 call printstring
 add  sp, 2
;-1568             printunsigned(orgDatai);

 push word [orgDatai]
 call printunsigned
 add  sp, 2
;-1569             printstring("\n"); printstring(Symbol);

 push doglob_4
 call printstring
 add  sp, 2
 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1570             if (iswidth==1) printstring(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob502
 push doglob_5
 call printstring
 add  sp, 2
;-1571             if (iswidth==2) printstring(" resw ");

.doglob502:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob503
 push doglob_6
 call printstring
 add  sp, 2
;-1572             if (iswidth==4) printstring(" resd ");

.doglob503:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob504
 push doglob_7
 call printstring
 add  sp, 2
;-1573             printunsigned(lexval);

.doglob504:
 push word [lexval]
 call printunsigned
 add  sp, 2
;-1574             printstring("\nsection .text");

 push doglob_8
 call printstring
 add  sp, 2
;-1575             orgDatai=orgDatai+lexval;

 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1576             if (iswidth==2) orgDatai=orgDatai+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob505
 mov ax, [orgDatai]
 add ax, [lexval]
 mov word [orgDatai], ax
;-1577             if (iswidth==4) {i= lexval * 3; orgDatai=orgDatai + i;}

.doglob505:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob506
 mov ax, [lexval]
;todo:save high part:mov [Longvar+2(+4)],(e)dx
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgDatai]
 add ax, [bp-2]
 mov word [orgDatai], ax
;-1578             GData[GTop]=lexval;

.doglob506:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1579             expect(']');

 push 93
 call expect
 add  sp, 2
;-1580         }else {

 jmp .doglob507
.doglob501:
;-1581             expect(']');

 push 93
 call expect
 add  sp, 2
;-1582             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob508
 push doglob_9
 call error1
 add  sp, 2
;-1583             printstring("\n");

.doglob508:
 push doglob_10
 call printstring
 add  sp, 2
;-1584             printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1585             printstring(" db ");

 push doglob_11
 call printstring
 add  sp, 2
;-1586             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1587             strcpy(doglobName, Symbol);//save Symbol name

 lea  ax, [Symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1588             expect('=');

 push 61
 call expect
 add  sp, 2
;-1589             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob509
;-1590                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1591                 prscomment(Symbol);

 lea  ax, [Symbol]
 push ax
 call prscomment
 add  sp, 2
;-1592                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1593                 printstring(",0");

 push doglob_12
 call printstring
 add  sp, 2
;-1594                 i=strlen(Symbol);

 lea  ax, [Symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1595                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1596                 }

;-1597             else if (istoken('{' )) {

 jmp .doglob510
.doglob509:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob511
;-1598                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1599                 do {

.doglob512:
;-1600                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob513
 push 44
 call prc
 add  sp, 2
;-1601                     expect(T_CONST);

.doglob513:
 push 257
 call expect
 add  sp, 2
;-1602                     printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1603                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1604                     }

;-1605                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob514
 jmp .doglob512
.doglob514:
;-1606                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1607             }

;-1608         else error1("String or number array expected");

 jmp .doglob515
.doglob511:
 push doglob_13
 call error1
 add  sp, 2
;-1609         };

.doglob515:
.doglob510:
.doglob507:
;-1610     }else { //expect('=');

 jmp .doglob516
.doglob500:
;-1611         printstring("\n");

 push doglob_14
 call printstring
 add  sp, 2
;-1612         printstring(Symbol);

 lea  ax, [Symbol]
 push ax
 call printstring
 add  sp, 2
;-1613         if (istype=='*') printstring(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob517
 push doglob_15
 call printstring
 add  sp, 2
;-1614         else {

 jmp .doglob518
.doglob517:
;-1615             if      (iswidth==1) printstring(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob519
 push doglob_16
 call printstring
 add  sp, 2
;-1616             else if (iswidth==2) printstring(" dw ");

 jmp .doglob520
.doglob519:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob521
 push doglob_17
 call printstring
 add  sp, 2
;-1617             else                 printstring(" dd ");

 jmp .doglob522
.doglob521:
 push doglob_18
 call printstring
 add  sp, 2
;-1618         }

.doglob522:
.doglob520:
;-1619     if(istoken('-')) prc('-');

.doglob518:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob523
 push 45
 call prc
 add  sp, 2
;-1620     if (istoken('=')) {

.doglob523:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob524
;-1621         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1622         printunsigned(lexval);

 push word [lexval]
 call printunsigned
 add  sp, 2
;-1623         }else printunsigned(0);

 jmp .doglob525
.doglob524:
 push 0
 call printunsigned
 add  sp, 2
;-1624     }

.doglob525:
;-1625     GSign[GTop]=issign;

.doglob516:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1626     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1627     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1628     pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1629     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob526
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1630         else strcpy(pt, Symbol);

 jmp .doglob527
.doglob526:
 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1631 	if (isstrarr) strcpy(Symbol, doglobName);

.doglob527:
 mov ax, [bp-6]
 or  al, al
 je .doglob528
 lea  ax, [doglobName]
 push ax
 lea  ax, [Symbol]
 push ax
 call strcpy
 add  sp, 4
;-1632 	storeVarName();

.doglob528:
 call storeVarName
;-1633     GTop++;

 inc  word[GTop]
;-1634     expect(';');

 push 59
 call expect
 add  sp, 2
;-1635 }

;-1636 

;-1637 int dodefine() {

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
;-1638     expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1639     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine529
;-1640         if (GTop >= VARMAX) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 400
 jl  .dodefine530
 push dodefine_0
 call error1
 add  sp, 2
;-1641         checknamelen();

.dodefine530:
 call checknamelen
;-1642         if (checkName() != 0) error1("#Define var already defined");

 call checkName
 cmp ax, 0
 je  .dodefine531
 push dodefine_1
 call error1
 add  sp, 2
;-1643         if (eqstr(Symbol, "ORGDATA")) {

.dodefine531:
 push dodefine_2
 lea  ax, [Symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine532
;-1644             orgDataOriginal=lexval;

 mov ax, [lexval]
 mov word [orgDataOriginal], ax
;-1645             orgDatai=lexval;

 mov ax, [lexval]
 mov word [orgDatai], ax
;-1646             expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1647             return;

 jmp .retndodefine
;-1648         }

;-1649         GSign [GTop]='U';

.dodefine532:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1650         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1651         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1652         pt=getVarName(GTop);

 push word [GTop]
 call getVarName
 add  sp, 2
 mov word [pt], ax
;-1653         strcpy(pt, Symbol);

 lea  ax, [Symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1654         storeVarName();

 call storeVarName
;-1655         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1656         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1657         GTop++;

 inc  word[GTop]
;-1658     }

;-1659 }

.dodefine529:
;-1660 

;-1661 int parse() {

 .retndodefine:
 ret
dodefine_0 db "global table (define) full",0
dodefine_1 db "#Define var already defined",0
dodefine_2 db "ORGDATA",0
ENDP

parse: PROC
;-1662     token=getlex();

 call getlex
 mov word [token], ax
;-1663     do {

.parse533:
;-1664         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse534
 mov ax, 1
 jmp .retnparse
;-1665         if (istoken('#')) {

.parse534:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse535
;-1666              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse536
 call dodefine
;-1667              else error1("define expected");

 jmp .parse537
.parse536:
 push parse_0
 call error1
 add  sp, 2
;-1668         }

.parse537:
;-1669     else{

 jmp .parse538
.parse535:
;-1670         typeName();

 call typeName
;-1671         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse539
 call dofunc
;-1672         else doglob(); }

 jmp .parse540
.parse539:
 call doglob
.parse540:
;-1673     } while(1);

.parse538:
 mov ax, 1
 or  al, al
 je .parse541
 jmp .parse533
.parse541:
;-1674 }

;-1675 

;-1676 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1677 int getarguments() {


getarguments: PROC
;-1678     int arglen1; unsigned int i; char *c;

;-1679     isPrint=1;

;Function : getarguments, Number local Var: 3
; # type sign width local variables
;103 var sign word arglen1 = bp+-2
;104 var unsg word i = bp+-4
;105 ptr sign byte c = bp+-6;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1680     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1681     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarguments542
;-1682         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1683         cputs(" Usage: A.COM in_file[.C]: ");

 push getarguments_0
 call cputs
 add  sp, 2
;-1684         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1685         }

;-1686     i=arglen1+129;

.getarguments542:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1687     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1688     arglen1--;

 dec  word[bp-2]
;-1689     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1690     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1691     if (instr1(namein, '.') == 0) strcat(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarguments543
 push getarguments_1
 lea  ax, [namein]
 push ax
 call strcat
 add  sp, 4
;-1692     strcpy(namelst, namein);

.getarguments543:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1693     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1694     i--;

 dec  word[bp-4]
;-1695     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1696     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1697 }

;-1698 int openfiles() {

 LEAVE
 ret
getarguments_0 db " Usage: A.COM in_file[.C]: ",0
getarguments_1 db ".C",0
ENDP

openfiles: PROC
;-1699     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1700     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles544
;-1701         cputs("Source file missing (.C): ");

 push openfiles_0
 call cputs
 add  sp, 2
;-1702         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1703         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1704         }

;-1705     fdout=creatR(namelst);

.openfiles544:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1706     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .openfiles545
;-1707         cputs("list file not creatable: ");

 push openfiles_1
 call cputs
 add  sp, 2
;-1708         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1709         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1710         }

;-1711     printstring(";");

.openfiles545:
 push openfiles_2
 call printstring
 add  sp, 2
;-1712     printstring(Version1);

 lea  ax, [Version1]
 push ax
 call printstring
 add  sp, 2
;-1713     printstring(", Input: "); printstring(namein);

 push openfiles_3
 call printstring
 add  sp, 2
 lea  ax, [namein]
 push ax
 call printstring
 add  sp, 2
;-1714     printstring(", Output: "); printstring(namelst);

 push openfiles_4
 call printstring
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call printstring
 add  sp, 2
;-1715 }

;-1716 

;-1717 int epilog() {

 ret
openfiles_0 db "Source file missing (.C): ",0
openfiles_1 db "list file not creatable: ",0
openfiles_2 db ";",0
openfiles_3 db ", Input: ",0
openfiles_4 db ", Output: ",0
ENDP

epilog: PROC
;-1718     unsigned int i;

;-1719     isPrint=1;

;Function : epilog, Number local Var: 1
; # type sign width local variables
;103 var unsg word i = bp+-2;
 ENTER  2,0
 mov ax, 1
 mov byte [isPrint], al
;-1720     GTop--;

 dec  word[GTop]
;-1721 

;-1722     printstring("\n;Glob. variables:"); printunsigned(GTop);

 push epilog_0
 call printstring
 add  sp, 2
 push word [GTop]
 call printunsigned
 add  sp, 2
;-1723     printstring(" (");                  printunsigned(VARMAX);

 push epilog_1
 call printstring
 add  sp, 2
 push 400
 call printunsigned
 add  sp, 2
;-1724     i = VarNamePtr - &VarNames;

 mov ax, [VarNamePtr]
 sub ax, VarNames
 mov [bp-2], ax
;-1725     printstring("):");                  printunsigned(i);

 push epilog_2
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1726     printstring(" (");					printunsigned(VARNAMESMAX);

 push epilog_3
 call printstring
 add  sp, 2
 push 4000
 call printunsigned
 add  sp, 2
;-1727     printstring("), Functions:");       printunsigned(FunctionMaxIx);

 push epilog_4
 call printstring
 add  sp, 2
 push word [FunctionMaxIx]
 call printunsigned
 add  sp, 2
;-1728     printstring(" (");                  printunsigned(FUNCMAX);

 push epilog_5
 call printstring
 add  sp, 2
 push 300
 call printunsigned
 add  sp, 2
;-1729     i = FunctionNamePtr - &FunctionNames;

 mov ax, [FunctionNamePtr]
 sub ax, FunctionNames
 mov [bp-2], ax
;-1730     printstring("):");                  printunsigned(i);

 push epilog_6
 call printstring
 add  sp, 2
 push word [bp-2]
 call printunsigned
 add  sp, 2
;-1731     printstring(" (");					printunsigned(FUNCTIONNAMESMAX);

 push epilog_7
 call printstring
 add  sp, 2
 push 3000
 call printunsigned
 add  sp, 2
;-1732     printstring(")\n;Lines:");          printunsigned(lineno);

 push epilog_8
 call printstring
 add  sp, 2
 push word [lineno]
 call printunsigned
 add  sp, 2
;-1733     printstring(", Constant: ");        printunsigned(maxco);

 push epilog_9
 call printstring
 add  sp, 2
 push word [maxco]
 call printunsigned
 add  sp, 2
;-1734     printstring(" (");                  printunsigned(COMAX);

 push epilog_10
 call printstring
 add  sp, 2
 push 4000
 call printunsigned
 add  sp, 2
;-1735 	printstring("). ");

 push epilog_11
 call printstring
 add  sp, 2
;-1736 

;-1737     i = COMAX;

 mov ax, 4000
 mov [bp-2], ax
;-1738     i = i - maxco;

 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax
;-1739     if (i<=500)printstring("\n ** Warning ** constant area too small");

 mov ax, [bp-2]
 cmp ax, 500
 ja  .epilog546
 push epilog_12
 call printstring
 add  sp, 2
;-1740 //    printstring("), stacksize: ");

;-1741     i=65535;

.epilog546:
 mov ax, 65535
 mov [bp-2], ax
;-1742     i=i-orgDatai;

 mov ax, [bp-2]
 sub ax, [orgDatai]
 mov [bp-2], ax
;-1743 //    printunsigned(i);

;-1744     if (i <= 1000) printstring("\n *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog547
 push epilog_13
 call printstring
 add  sp, 2
;-1745 

;-1746 }

.epilog547:
;-1747 

;-1748 int main() {

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
epilog_11 db "). ",0
epilog_12 db "\n ** Warning ** constant area too small",0
epilog_13 db "\n *** Warning *** Stack too small",0
ENDP

main: PROC
;-1749     getarguments();

 call getarguments
;-1750     openfiles();

 call openfiles
;-1751     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1752     printstring("\norg  256 \njmp main");

 push main_0
 call printstring
 add  sp, 2
;-1753 

;-1754 	GTop = 1;

 mov ax, 1
 mov word [GTop], ax
;-1755     VarNamePtr= &VarNames;

 mov ax, VarNames
 mov word [VarNamePtr], ax
;-1756     FunctionNamePtr= &FunctionNames;

 mov ax, FunctionNames
 mov word [FunctionNamePtr], ax
;-1757     FunctionMaxIx=0;

 mov ax, 0
 mov word [FunctionMaxIx], ax
;-1758     orgDatai=orgDataOriginal;

 mov ax, [orgDataOriginal]
 mov word [orgDatai], ax
;-1759     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1760     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1761     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1762 

;-1763     parse();

 call parse
;-1764 

;-1765     epilog();

 call epilog
;-1766     end1(0);

 push 0
 call end1
 add  sp, 2
;-1767 }

;-1768 

 ret
main_0 db "\norg  256 \njmp main",0
ENDP
;Glob. variables:102 (400):818 (4000), Functions:81 (300):647 (3000)
;Lines:1769, Constant: 817 (4000). 