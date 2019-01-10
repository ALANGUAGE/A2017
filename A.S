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

;-92 int writetty()     {//ah=0x0E; bx=0; __emit__(0xCD,0x10);


writetty: PROC
;-93 asm mov ah, 14

 mov ah, 14
;-94 asm mov bx, 0

 mov bx, 0
;-95 asm int 16

 int 16
;-96 }

;-97 int putch(char c)  {

 ret
ENDP

putch: PROC
;-98     if (c==10)  {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-99         asm mov al, 13

 mov al, 13
;-100         writetty();

 call writetty
;-101     }

;-102     asm mov al, [bp+4]; parameter c

.putch1:
 mov al, [bp+4]; parameter c
;-103     writetty();

 call writetty
;-104 }

;-105 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-106     char c;

;-107     while(*s) {
;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
;-108         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-109         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-110         s++;

 inc  word[bp+4]
;-111     }

;-112 }

 jmp .cputs2
.cputs3:
;-113 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-114     asm mov ax, [bp+4]; parameter n
;
 ENTER  0,0
 mov ax, [bp+4]; parameter n
;-115     asm neg ax

 neg ax
;-116 }

;-117 

;-118 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-119     asm int 33; 21h

 int 33; 21h
;-120     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-121     DOS_ERR++;

 inc  word[DOS_ERR]
;-122 }

;-123 int openR (char *s) {

 ret
ENDP

openR: PROC
;-124     dx=s;
;
 ENTER  0,0
 mov  dx, [bp+4]
;-125     ax=0x3D02;

 mov  ax, 15618
;-126     DosInt();

 call DosInt
;-127 }

;-128 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-129     dx=s;
;
 ENTER  0,0
 mov  dx, [bp+4]
;-130     cx=0;

 mov  cx, 0
;-131     ax=0x3C00;

 mov  ax, 15360
;-132     DosInt();

 call DosInt
;-133 }

;-134 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-135     bx=fd;
;
 ENTER  0,0
 mov  bx, [bp+4]
;-136     ax=0x3E00;

 mov  ax, 15872
;-137     DosInt();

 call DosInt
;-138 }

;-139 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-140     ah=0x4C;
;
 ENTER  0,0
 mov  ah, 76
;-141     al=c;

 mov  al, [bp+4]
;-142     DosInt();

 call DosInt
;-143 }

;-144 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-145     dx=s;
;
 ENTER  0,0
 mov  dx, [bp+4]
;-146     cx=len;

 mov  cx, [bp+8]
;-147     bx=fd;

 mov  bx, [bp+6]
;-148     ax=0x3F00;

 mov  ax, 16128
;-149     DosInt();

 call DosInt
;-150 }

;-151 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-152     __asm{lea dx, [bp+4]}; /* = *n */
;
 ENTER  0,0
lea dx, [bp+4]
;-153     cx=1;

 mov  cx, 1
;-154     bx=fd;

 mov  bx, [bp+6]
;-155     ax=0x4000;

 mov  ax, 16384
;-156     DosInt();

 call DosInt
;-157 }

;-158 

;-159 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-160       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-161       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-162       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-163       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-164       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-165       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-166       if (c> 'Z') { if (c< 'a') return 0; }

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
;-167       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-168 }

;-169 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-170       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-171       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-172       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-173 }

;-174 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-175     if (digit (c)) return 1;
;
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
;-176     if (letter(c)) return 1;

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
;-177     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-178 }

;-179 

;-180 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-181     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-182     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-183     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-184 }

;-185 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-186     do { *s=*t; s++; t++; }
;
 ENTER  0,0
.strcpy18:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]
;-187     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-188     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-189     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-190 }

;-191 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-192     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21
;-193         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-194         p++;

.eqstr22:
 inc  word[bp+4]
;-195         q++;

 inc  word[bp+6]
;-196     }

;-197     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-198     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-199 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-200     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]
;-201     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-202 }

;-203 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-204     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27
;-205         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-206         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-207     }

;-208 }

 jmp .toupper26
.toupper27:
;-209 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-210     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131
;-211         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-212         s++;

.instr132:
 inc  word[bp+4]
;-213     }

;-214     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-215 }

;-216 

;-217 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-218     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-219     cloc++;

 inc  word[cloc]
;-220 }

;-221 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-222     char c;

;-223     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34
;-224         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-225         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-226         s++;

 inc  word[bp+4]
;-227     }

;-228 }

 jmp .eprs33
.eprs34:
;-229 

;-230 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-231     if (isPrint) {
;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-232         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-233             ax=13;

 mov  ax, 13
;-234             writetty();

 call writetty
;-235         }

;-236         al=c;

.prc36:
 mov  al, [bp+4]
;-237         writetty();

 call writetty
;-238     }

;-239     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-240 }

;-241 

;-242 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-243     unsigned char c;

;-244     while(*s){
;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38
;-245         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-246         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-247         s++;

 inc  word[bp+4]
;-248     }

;-249 }

 jmp .prscomment37
.prscomment38:
;-250 

;-251 int prs(unsigned char *s) {

 LEAVE
 ret
ENDP

prs: PROC
;-252     unsigned char c; int com;

;-253     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-254     while(*s) {

.prs39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs40
;-255         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-256         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs41
 mov ax, [bp-4]
 or  al, al
 je .prs42
 mov ax, 0
 mov [bp-4], ax
;-257                    else com=1;

 jmp .prs43
.prs42:
 mov ax, 1
 mov [bp-4], ax
;-258         if (c==92) {

.prs43:
.prs41:
 mov al, [bp-2]
 cmp al, 92
 jne .prs44
;-259             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs45
;-260                 s++;

 inc  word[bp+4]
;-261                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-262                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs46
 mov ax, 10
 mov [bp-2], al
;-263                 if (c=='t') c= 9;

.prs46:
 mov al, [bp-2]
 cmp al, 116
 jne .prs47
 mov ax, 9
 mov [bp-2], al
;-264             }

.prs47:
;-265         }

.prs45:
;-266         prc(c);

.prs44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-267         s++;

 inc  word[bp+4]
;-268     }

;-269 }

 jmp .prs39
.prs40:
;-270 

;-271 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-272     int e;

;-273     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-274         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-275         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-276     }

;-277     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-278         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-279         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-280     }

;-281     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-282     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-283     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-284 }

;-285 

;-286 int pint1 (int n){

 LEAVE
 ret
ENDP

pint1: PROC
;-287     int e;

;-288     if(n<0) {  prc('-');  n=mkneg(n); }
;
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
;-289     if (n >= 10) {

.pint150:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint151
;-290         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-291         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2
;-292     }

;-293     n=n%10;

.pint151:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-294     n += '0';

 add  word[bp+4], 48
;-295     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-296 }

;-297 

;-298 int prunsign1(unsigned int n) {

 LEAVE
 ret
ENDP

prunsign1: PROC
;-299     unsigned int e;

;-300     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign152
;-301         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-302         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-303     }

;-304     n = n % 10; /*unsigned mod*/

.prunsign152:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-305     n += '0';

 add  word[bp+4], 48
;-306     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-307 }

;-308 

;-309 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-310     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-311     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-312     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-313 }

;-314 

;-315 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-316     isPrint=1;
;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-317     lineno--;

 dec  word[lineno]
;-318     prs("\n ");

 push error1_0
 call prs
 add  sp, 2
;-319     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-320     prs(";Line: ");

 push error1_1
 call prs
 add  sp, 2
;-321     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-322     prs(" ************** ERROR: ");

 push error1_2
 call prs
 add  sp, 2
;-323     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2
;-324     prs("  in column: ");

 push error1_3
 call prs
 add  sp, 2
;-325     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2
;-326     prs("\nToken: ");

 push error1_4
 call prs
 add  sp, 2
;-327     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2
;-328     prs(", symbol: ");

 push error1_5
 call prs
 add  sp, 2
;-329     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-330     end1(1);

 push 1
 call end1
 add  sp, 2
;-331 }

;-332 

;-333 int printinputline() {

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
;-334     int col;

;-335     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-336     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-337     do {

.printinputline53:
;-338         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-339         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-340         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-341         fgetsp++;

 inc  word[fgetsp]
;-342         col++;

 inc  word[bp-2]
;-343         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-344         }

.printinputline55:
;-345         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-346     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-347         prs("\n;-");

 push printinputline_1
 call prs
 add  sp, 2
;-348         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-349         prc(' ');

 push 32
 call prc
 add  sp, 2
;-350         lineno++;

 inc  word[lineno]
;-351         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-352 }

;-353 

;-354 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-355     char c;

;-356     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-357     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-358         printinputline();

 call printinputline
;-359         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-360         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-361         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-362         column=0;

 mov ax, 0
 mov word [column], ax
;-363     }

;-364     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-365     column++;

 inc  word[column]
;-366     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-367 }

;-368 

;-369 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-370     char r;

;-371     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-372     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-373     return r;

 mov al, [bp-2]
 jmp .retnnext
;-374 }

;-375 

;-376 int adrF(char *s, unsigned int i) {

 .retnnext:
 LEAVE
 ret
ENDP

adrF: PROC
;-377     i << 5;//ax=i*32; IDLENMAX=31!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 5
;-378     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 
;-379 }

;-380 

;-381 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-382     int j;

;-383     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName59
;-384         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-385         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2
;-386     }

;-387     else {

 jmp .printName60
.printName59:
;-388         prs("[bp");

 push printName_0
 call prs
 add  sp, 2
;-389         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-390         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2
;-391         pint1(j);

.printName61:
 push word [bp-2]
 call pint1
 add  sp, 2
;-392         prc(']');

 push 93
 call prc
 add  sp, 2
;-393     }

;-394 }

.printName60:
;-395 

;-396 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-397     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL
;-398     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63
;-399         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al
;-400         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL
;-401     }

;-402     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL
;-403 }

;-404 

;-405 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 52857
symboltemp resb 80
section .text
;-406 

;-407 int getlex() {


getlex: PROC
;-408     char c; char *p;

;-409     int i; int j;

;-410 g1: c=next();
;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-411     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex
;-412     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1
;-413   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-414   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-415   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-416   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-417   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-418   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-419   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-420   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-421   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-422   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-423   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-424   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-425   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-426   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-427   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-428   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96
;-429       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97
;-430           do c=next();

.getlex98:
 call next
 mov [bp-2], al
;-431           while(ifEOL(c)==0) return getlex();

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
;-432       }

;-433   }

.getlex97:
;-434   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-435       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101
;-436           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-437           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2
;-438           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2
;-439           c=next();

.getlex103:
 call next
 mov [bp-2], al
;-440           return getlex();

 call getlex
 jmp .retngetlex
;-441       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex
;-442   }

.getlex104:
;-443   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105
;-444       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-445       c=next();

 call next
 mov [bp-2], al
;-446       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107
;-447           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-448           p++;

 inc  word[bp-4]
;-449           c=next();

 call next
 mov [bp-2], al
;-450           }

;-451           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-452       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-453   }

;-454   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108
;-455       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-456       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-457       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al
;-458       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110
;-459           next();

 call next
;-460           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112
;-461               c=next();

 call next
 mov [bp-2], al
;-462               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-463       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-464                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-465                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-466                i=0;

 mov ax, 0
 mov [bp-6], ax
;-467                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-468                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-469            }

;-470        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:
;-471            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-472                c=next();

 call next
 mov [bp-2], al
;-473                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-474                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-475                i=0;

 mov ax, 0
 mov [bp-6], ax
;-476                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-477                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-478            }

;-479        }

 jmp .getlex116
.getlex117:
;-480       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex
;-481   }

;-482   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118
;-483       lexval=next();

 call next
 mov word [lexval], ax
;-484       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119
;-485           lexval=next();

 call next
 mov word [lexval], ax
;-486           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax
;-487           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax
;-488           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax
;-489       }

.getlex122:
;-490       next();

.getlex119:
 call next
;-491       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-492   }

;-493   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-494     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-495     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-496     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-497     p++;

 inc  word[bp-4]
;-498     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125
;-499         c=next();

 call next
 mov [bp-2], al
;-500         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-501         p++;

 inc  word[bp-4]
;-502     }

;-503     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-504     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex
;-505     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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
;-506     if (eqstr(symbol,"void"    )) return T_VOID;

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
;-507     if (eqstr(symbol,"int"     )) return T_INT;

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
;-508     if (eqstr(symbol,"long"    )) return T_LONG;

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
;-509     if (eqstr(symbol,"inth"    )) return T_INTH;

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
;-510     if (eqstr(symbol,"char"    )) return T_CHAR;

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
;-511     if (eqstr(symbol,"asm"     )) return T_ASM;

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
;-512     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

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
;-513     if (eqstr(symbol,"__emit__")) return T_EMIT;

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
;-514     if (eqstr(symbol,"return"  )) return T_RETURN;

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
;-515     if (eqstr(symbol,"if"      )) return T_IF;

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
;-516     if (eqstr(symbol,"else"    )) return T_ELSE;

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
;-517     if (eqstr(symbol,"while"   )) return T_WHILE;

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
;-518     if (eqstr(symbol,"do"      )) return T_DO;

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
;-519     if (eqstr(symbol,"goto"    )) return T_GOTO;

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
;-520     if (eqstr(symbol,"define"  )) return T_DEFINE;

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
;-521 

;-522     i=0;//convert define to value

.getlex142:
 mov ax, 0
 mov [bp-6], ax
;-523     while (i < GTop) {

.getlex143:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex144
;-524         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-525         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
;-526             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex146
;-527                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-528                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
;-529                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-530             }

;-531         }

.getlex146:
;-532         i++;

.getlex145:
 inc  word[bp-6]
;-533     }

;-534     return T_NAME; } error1("Input item not recognized");

 jmp .getlex143
.getlex144:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_18
 call error1
 add  sp, 2
;-535 }

;-536 

;-537 int istoken(int t) {

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
;-538     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken147
;-539         token=getlex();

 call getlex
 mov word [token], ax
;-540         return 1;

 mov ax, 1
 jmp .retnistoken
;-541     }

;-542     return 0;

.istoken147:
 mov ax, 0
 jmp .retnistoken
;-543 }

;-544 

;-545 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-546     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect148
;-547         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-548         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-549         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2
;-550         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2
;-551         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-552     }

;-553 }

.expect148:
;-554 

;-555 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-556     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .v149
 push 91
 call prc
 add  sp, 2
;-557     printName(i);

.v149:
 push word [bp+4]
 call printName
 add  sp, 2
;-558     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v150
 push 93
 call prc
 add  sp, 2
;-559 }

.v150:
;-560 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-561     int i;

;-562     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-563     if (i > IDLENMAX) error1("Item name is too long)");

 mov ax, [bp-2]
 cmp ax, 31
 jle .checknamelen151
 push checknamelen_0
 call error1
 add  sp, 2
;-564 }

.checknamelen151:
;-565 

;-566 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long)",0
ENDP

checkName: PROC
;-567     unsigned int i; unsigned int j;

;-568     i=LSTART;
;
 ENTER  4,0
 mov ax, 300
 mov [bp-2], ax
;-569     while(i<LTop) {

.checkName152:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName153
;-570         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-571         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName154
 mov ax, [bp-2]
 jmp .retncheckName
;-572         i++;

.checkName154:
 inc  word[bp-2]
;-573     }

;-574     i=1;

 jmp .checkName152
.checkName153:
 mov ax, 1
 mov [bp-2], ax
;-575     while(i<GTop) {

.checkName155:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName156
;-576         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-577         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName157
 mov ax, [bp-2]
 jmp .retncheckName
;-578         i++;

.checkName157:
 inc  word[bp-2]
;-579     }

;-580     return 0;

 jmp .checkName155
.checkName156:
 mov ax, 0
 jmp .retncheckName
;-581 }

;-582 

;-583 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-584     unsigned int i;

;-585     i=checkName();
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-586     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname158
 push searchname_0
 call error1
 add  sp, 2
;-587     return i;

.searchname158:
 mov ax, [bp-2]
 jmp .retnsearchname
;-588 }

;-589 

;-590 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-591     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1159
 push name1_0
 call error1
 add  sp, 2
;-592     token=getlex();

.name1159:
 call getlex
 mov word [token], ax
;-593 }

;-594 

;-595 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-596     int m; //0=V,1=*,2=&

;-597     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-598     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 83
 mov byte [issign], al
;-599     if(istoken(T_UNSIGNED)) issign='U';

.typeName160:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 85
 mov byte [issign], al
;-600     iswidth=2;

.typeName161:
 mov ax, 2
 mov byte [iswidth], al
;-601     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 0
 mov byte [iswidth], al
;-602     if(istoken(T_CHAR))     iswidth=1;

.typeName162:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 1
 mov byte [iswidth], al
;-603     if(istoken(T_INT))      iswidth=2;

.typeName163:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 2
 mov byte [iswidth], al
;-604     if(istoken(T_LONG))     iswidth=4;

.typeName164:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 4
 mov byte [iswidth], al
;-605     istype='V';

.typeName165:
 mov ax, 86
 mov byte [istype], al
;-606     m=0;

 mov ax, 0
 mov [bp-2], ax
;-607     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-608     if(istoken('&'))  {istype='&'; m=2;}

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
;-609     name1();

.typeName167:
 call name1
;-610     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-611 }

;-612 

;-613 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-614     char c;

;-615     c=GSign [i];
;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-616     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes168
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes169
.gettypes168:
 mov ax, 0
 mov word [signi], ax
;-617     c=GWidth[i];

.gettypes169:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-618     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-619     wi=0;

 mov ax, 0
 mov word [wi], ax
;-620     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes170
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-621     if (c==2) {widthi=2;wi=2;}

.gettypes170:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes171
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-622     if (c==4) {widthi=4;wi=4;}

.gettypes171:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes172
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-623     c=GType [i];

.gettypes172:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-624     typei=0;

 mov ax, 0
 mov word [typei], ax
;-625     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes173
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-626     if (c=='&')  typei=2;

.gettypes173:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes174
 mov ax, 2
 mov word [typei], ax
;-627     return i;

.gettypes174:
 mov ax, [bp+4]
 jmp .retngettypes
;-628 }

;-629 

;-630 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-631     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal175
 push addlocal_0
 call error1
 add  sp, 2
;-632     if (checkName() != 0) error1("Variable already defined");

.addlocal175:
 call checkName
 cmp ax, 0
 je  .addlocal176
 push addlocal_1
 call error1
 add  sp, 2
;-633     GSign[LTop]=issign;

.addlocal176:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-634     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-635     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-636     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-637     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-638 }

;-639 

;-640 

;-641 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-642        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg177
 push cmpneg_0
 call prs
 add  sp, 2
;-643   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg178
.cmpneg177:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg179
 push cmpneg_1
 call prs
 add  sp, 2
;-644   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

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
;-645                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg183
.cmpneg182:
 push cmpneg_3
 call prs
 add  sp, 2
;-646   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

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
;-647                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2
;-648                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg187
.cmpneg186:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-649                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2
;-650   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg187:
 jmp .cmpneg188
.cmpneg185:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg189
 push cmpneg_8
 call prs
 add  sp, 2
;-651   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg190
.cmpneg189:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg191
 push cmpneg_9
 call prs
 add  sp, 2
;-652   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg192
.cmpneg191:
 push cmpneg_10
 call error1
 add  sp, 2
;-653 }

.cmpneg192:
.cmpneg190:
.cmpneg188:
.cmpneg184:
.cmpneg180:
.cmpneg178:
;-654 

;-655 int isrelational() {

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
;-656     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational193
 jmp .w
;-657     if (token==T_NE) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational194
 jmp .w
;-658     if (token==T_LE) goto w;

.isrelational194:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational195
 jmp .w
;-659     if (token==T_GE) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational196
 jmp .w
;-660     if (token=='<' ) goto w;

.isrelational196:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational197
 jmp .w
;-661     if (token=='>' ) goto w;

.isrelational197:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational198
 jmp .w
;-662     return 0;

.isrelational198:
 mov ax, 0
 jmp .retnisrelational
;-663 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-664     token=getlex();

 call getlex
 mov word [token], ax
;-665     return 1;

 mov ax, 1
 jmp .retnisrelational
;-666 }

;-667 

;-668 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-669   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg199
 mov ax, 0
 jmp .retncheckreg
;-670   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

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
;-671   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

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
;-672   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

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
;-673   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

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
;-674   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

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
;-675   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

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
;-676   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

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
;-677   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

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
;-678   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

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
;-679   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

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
;-680   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

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
;-681   // (eqstr(symbol,"ip")) return 45;

;-682   if (strlen(symbol) >   3) return 0;

.checkreg221:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg222
 mov ax, 0
 jmp .retncheckreg
;-683   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

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
;-684   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

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
;-685   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

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
;-686   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

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
;-687 //  if (eqstr(symbol,"cr0")) return 71;

;-688   return 0;

.checkreg230:
 mov ax, 0
 jmp .retncheckreg
;-689 }

;-690 

;-691 char printregstr[]

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
;-692 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-693 

;-694 int printreg(int i) {


printreg: PROC
;-695     unsigned int k; unsigned char c;

;-696     k = &printregstr + i;
;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-697     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-698     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-699     i++;

 inc  word[bp+4]
;-700     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-701     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-702     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-703     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg231
;-704         i++;

 inc  word[bp+4]
;-705         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-706         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-707         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-708         }

;-709 }

.printreg231:
;-710 

;-711 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 52937
ops resb 5
section .text
;-712 int doreg1(int iscmp1) {


doreg1: PROC
;-713     int i;

;-714     if (istoken('='))          strcpy(ops, "mov");
;
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
;-715     if (istoken(T_PLUSASS))    strcpy(ops, "add");

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
;-716     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

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
;-717     if (istoken(T_ANDASS))     strcpy(ops, "and");

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
;-718     if (istoken(T_ORASS))      strcpy(ops, "or" );

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
;-719     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

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
;-720     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

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
;-721     if (iscmp1 == 1) {

.doreg1238:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1239
;-722             token=getlex();

 call getlex
 mov word [token], ax
;-723             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1240
 push doreg1_7
 call error1
 add  sp, 2
;-724             strcpy(ops, "cmp");

.doreg1240:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-725         }

;-726     prs("\n ");

.doreg1239:
 push doreg1_9
 call prs
 add  sp, 2
;-727     prs(ops);

 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2
;-728     prs("  ");

 push doreg1_10
 call prs
 add  sp, 2
;-729     printreg(ireg1);

 push word [ireg1]
 call printreg
 add  sp, 2
;-730     prs(", ");

 push doreg1_11
 call prs
 add  sp, 2
;-731 

;-732     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1241
;-733         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-734         goto reg1;

 jmp .reg1
;-735         }

;-736     mod2=typeName();

.doreg1241:
 call typeName
 mov word [mod2], ax
;-737     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-738     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1242
;-739         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-740         goto reg1;

 jmp .reg1
;-741         }

;-742     i=searchname();

.doreg1242:
 call searchname
 mov [bp-2], ax
;-743     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1243
 push word [bp-2]
 call printName
 add  sp, 2
;-744         else v(i);

 jmp .doreg1244
.doreg1243:
 push word [bp-2]
 call v
 add  sp, 2
;-745 reg1: if (iscmp1 == 1) {

.doreg1244:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1245
;-746     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-747     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-748     expect(')');

 push 41
 call expect
 add  sp, 2
;-749     }

;-750 }

.doreg1245:
;-751 

;-752 int compoundass(char *op, int mode, int id1) {

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
;-753     if(mode) error1("only scalar variable allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass246
 push compoundass_0
 call error1
 add  sp, 2
;-754     prs("\n ");

.compoundass246:
 push compoundass_1
 call prs
 add  sp, 2
;-755     prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-756     prs("  ");

 push compoundass_2
 call prs
 add  sp, 2
;-757     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-758     if (wi==2) prs("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass247
 push compoundass_3
 call prs
 add  sp, 2
;-759         else prs("byte");

 jmp .compoundass248
.compoundass247:
 push compoundass_4
 call prs
 add  sp, 2
;-760     v(id1);

.compoundass248:
 push word [bp+8]
 call v
 add  sp, 2
;-761     prs(", ");

 push compoundass_5
 call prs
 add  sp, 2
;-762     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-763     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-764 }

;-765 

;-766 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-767     gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-768     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1249
;-769         prs("\n mov bx, ");

 push dovar1_0
 call prs
 add  sp, 2
;-770         v(id1); prs("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call prs
 add  sp, 2
;-771         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-772         if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1250
 push dovar1_2
 call prs
 add  sp, 2
;-773         if(widthi == 2) prs(" ax, [bx]");

.dovar1250:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1251
 push dovar1_3
 call prs
 add  sp, 2
;-774         return;

.dovar1251:
 jmp .retndovar1
;-775         }

;-776     if (mode==2){// & = adr

.dovar1249:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1252
;-777         prs("\n ");

 push dovar1_4
 call prs
 add  sp, 2
;-778         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-779         prs(" ax, ");

 push dovar1_5
 call prs
 add  sp, 2
;-780         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-781         return;

 jmp .retndovar1
;-782         }

;-783     if (ixarr) {//array

.dovar1252:
 mov ax, [bp+8]
 or  al, al
 je .dovar1253
;-784         prs("\n mov bx, ");

 push dovar1_6
 call prs
 add  sp, 2
;-785         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-786         if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_7
 call prs
 add  sp, 2
;-787         prs("\n ");

.dovar1254:
 push dovar1_8
 call prs
 add  sp, 2
;-788         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-789         if (wi==2) prs(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_9
 call prs
 add  sp, 2
;-790             else prs(" al, ");

 jmp .dovar1256
.dovar1255:
 push dovar1_10
 call prs
 add  sp, 2
;-791         prc('[');

.dovar1256:
 push 91
 call prc
 add  sp, 2
;-792         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-793         prs(" + bx]");

 push dovar1_11
 call prs
 add  sp, 2
;-794         return;

 jmp .retndovar1
;-795         }

;-796     prs("\n ");

.dovar1253:
 push dovar1_12
 call prs
 add  sp, 2
;-797     prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-798     if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1257
 push dovar1_13
 call prs
 add  sp, 2
;-799     if(wi==2) prs(" ax, ");

.dovar1257:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_14
 call prs
 add  sp, 2
;-800     if(wi==4) prs(" eax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1259
 push dovar1_15
 call prs
 add  sp, 2
;-801     v(id1);

.dovar1259:
 push word [bp+10]
 call v
 add  sp, 2
;-802 }

;-803 

;-804 int rterm(char *op) {

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
;-805     int mode; int opint; int ixarr; int id1;

;-806     if (istoken(T_CONST)) {
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm260
;-807         prs("\n ");

 push rterm_0
 call prs
 add  sp, 2
;-808         prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-809         if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm261
 push rterm_1
 call prs
 add  sp, 2
;-810         if (wi==2) prs(" ax, ");

.rterm261:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm262
 push rterm_2
 call prs
 add  sp, 2
;-811         if (wi==4) prs(" eax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm263
 push rterm_3
 call prs
 add  sp, 2
;-812         prunsign1(lexval);

.rterm263:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-813         return;

 jmp .retnrterm
;-814         }

;-815     mode=typeName();

.rterm260:
 call typeName
 mov [bp-2], ax
;-816     id1=searchname();

 call searchname
 mov [bp-8], ax
;-817     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-818     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm264
;-819         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-820         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-821         expect(']');

 push 93
 call expect
 add  sp, 2
;-822         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-823         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm265
 push rterm_4
 call error1
 add  sp, 2
;-824         }

.rterm265:
;-825     if (eqstr(symbol,"ax")) return;

.rterm264:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm266
 jmp .retnrterm
;-826     opint=op;

.rterm266:
 mov ax, [bp+4]
 mov [bp-4], ax
;-827     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-828 }

;-829 

;-830 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-831     gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-832     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign267
;-833         prs("\n mov  bx, ");

 push doassign_0
 call prs
 add  sp, 2
;-834         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-835         if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign268
 push doassign_1
 call prs
 add  sp, 2
;-836             else  prs("\n mov  [bx], al");

 jmp .doassign269
.doassign268:
 push doassign_2
 call prs
 add  sp, 2
;-837         return;

.doassign269:
 jmp .retndoassign
;-838         }

;-839     if (mode==2) {// & = adr

.doassign267:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign270
;-840         prs("\n mov  ");

 push doassign_3
 call prs
 add  sp, 2
;-841         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-842         prs(", ax");

 push doassign_4
 call prs
 add  sp, 2
;-843         return;

 jmp .retndoassign
;-844         }

;-845     if (ixarr) {

.doassign270:
 mov ax, [bp+8]
 or  al, al
 je .doassign271
;-846         prs("\n mov bx, ");

 push doassign_5
 call prs
 add  sp, 2
;-847         if(ixconst) prunsign1(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign272
 push word [bp+8]
 call prunsign1
 add  sp, 2
;-848             else v(ixarr);

 jmp .doassign273
.doassign272:
 push word [bp+8]
 call v
 add  sp, 2
;-849         if (wi==2) prs("\n shl bx, 1");

.doassign273:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign274
 push doassign_6
 call prs
 add  sp, 2
;-850         prs("\n mov [");

.doassign274:
 push doassign_7
 call prs
 add  sp, 2
;-851         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-852         if (wi==2) prs("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign275
 push doassign_8
 call prs
 add  sp, 2
;-853             else prs("+bx], al");

 jmp .doassign276
.doassign275:
 push doassign_9
 call prs
 add  sp, 2
;-854         return;

.doassign276:
 jmp .retndoassign
;-855         }

;-856     if (wi==1){

.doassign271:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign277
;-857         prs("\n mov ");

 push doassign_10
 call prs
 add  sp, 2
;-858         if(i<LSTART) prs("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign278
 push doassign_11
 call prs
 add  sp, 2
;-859         v(i);

.doassign278:
 push word [bp+6]
 call v
 add  sp, 2
;-860         prs(", al");

 push doassign_12
 call prs
 add  sp, 2
;-861         return;

 jmp .retndoassign
;-862         }

;-863     if (wi==2){

.doassign277:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign279
;-864         prs("\n mov ");

 push doassign_13
 call prs
 add  sp, 2
;-865         if(i<LSTART) prs("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign280
 push doassign_14
 call prs
 add  sp, 2
;-866         v(i);

.doassign280:
 push word [bp+6]
 call v
 add  sp, 2
;-867         prs(", ax");

 push doassign_15
 call prs
 add  sp, 2
;-868         return;

 jmp .retndoassign
;-869         }

;-870     if (wi==4){

.doassign279:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign281
;-871         prs("\n mov ");

 push doassign_16
 call prs
 add  sp, 2
;-872         if(i<LSTART) prs("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign282
 push doassign_17
 call prs
 add  sp, 2
;-873         v(i);

.doassign282:
 push word [bp+6]
 call v
 add  sp, 2
;-874         prs(", eax");

 push doassign_18
 call prs
 add  sp, 2
;-875         return;

 jmp .retndoassign
;-876         }

;-877 }

.doassign281:
;-878 

;-879 int domul(int ids) {

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
;-880     if (ids) rterm("imul");
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul283
 push domul_0
 call rterm
 add  sp, 2
;-881         else {

 jmp .domul284
.domul283:
;-882         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul285
;-883             prs("\n mov bx, ");

 push domul_1
 call prs
 add  sp, 2
;-884             prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-885             prs("\n mul bx");

 push domul_2
 call prs
 add  sp, 2
;-886             }

;-887         else error1("with MUL only const number as multiplicator allowed");

 jmp .domul286
.domul285:
 push domul_3
 call error1
 add  sp, 2
;-888         }

.domul286:
;-889 }

.domul284:
;-890 

;-891 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC
;-892     int mode; int id1;

;-893     if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv287
;-894         prs("\n mov bx, ");

 push doidiv_0
 call prs
 add  sp, 2
;-895         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-896         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv288
 push doidiv_1
 call prs
 add  sp, 2
;-897             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv289
.doidiv288:
 push doidiv_2
 call prs
 add  sp, 2
;-898         }

.doidiv289:
;-899     else {

 jmp .doidiv290
.doidiv287:
;-900         mode=typeName();

 call typeName
 mov [bp-2], ax
;-901         id1=searchname();

 call searchname
 mov [bp-4], ax
;-902         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv291
 push doidiv_3
 call error1
 add  sp, 2
;-903         gettypes(id1);

.doidiv291:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-904         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv292
 push doidiv_4
 call error1
 add  sp, 2
;-905         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv292:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv293
 push doidiv_5
 call error1
 add  sp, 2
;-906         prs("\n mov bx, ");

.doidiv293:
 push doidiv_6
 call prs
 add  sp, 2
;-907         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-908         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv294
 push doidiv_7
 call prs
 add  sp, 2
;-909             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv295
.doidiv294:
 push doidiv_8
 call prs
 add  sp, 2
;-910     }

.doidiv295:
;-911 }

.doidiv290:
;-912 

;-913 int domod(int ids) {

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
;-914     doidiv(ids);
;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-915     prs("\n mov ax, dx");

 push domod_0
 call prs
 add  sp, 2
;-916 }

;-917 

;-918 

;-919 int docalltype[10]; int docallvalue[10];

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
;-920 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 52982
procname resb 17
section .text
;-921 

;-922 int docall1() {


docall1: PROC
;-923     int i; int narg; int t0; int n0;  int sz32;

;-924     narg=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-925     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-926     checknamelen();

 call checknamelen
;-927     strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-928     expect('(');

 push 40
 call expect
 add  sp, 2
;-929 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1296
;-930 	    do {

.docall1297:
;-931 	        narg++;

 inc  word[bp-4]
;-932 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1298
 push docall1_0
 call error1
 add  sp, 2
;-933 	        t0=0;

.docall1298:
 mov ax, 0
 mov [bp-6], ax
;-934             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1299
;-935                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-936                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-937                 }

;-938             if(istoken(T_STRING)){

.docall1299:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1300
;-939                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-940                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-941                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-942                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-943                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-944                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-945                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-946                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-947                 eprs(symbol);

 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
;-948                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-949                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-950                 nconst++;

 inc  word[nconst]
;-951                 }

;-952             if(istoken('&'))     {

.docall1300:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1301
;-953                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-954                 name1();

 call name1
;-955                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-956                 }

;-957             if(istoken(T_NAME))  {

.docall1301:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1302
;-958                 n0=checkreg();

 call checkreg
 mov [bp-8], ax
;-959                 if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1303
 mov ax, 5
 mov [bp-6], ax
;-960                 else {

 jmp .docall1304
.docall1303:
;-961                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-962                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-963                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-964                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-965                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1305
 mov ax, 3
 mov [bp-6], ax
;-966                     }

.docall1305:
;-967                 }

.docall1304:
;-968             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1302:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1306
 push docall1_4
 call error1
 add  sp, 2
;-969             docalltype [narg] = t0;

.docall1306:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-970             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-971         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1307
 jmp .docall1297
.docall1307:
;-972 

;-973   	expect(')');

 push 41
 call expect
 add  sp, 2
;-974   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-975     do {

.docall1308:
;-976         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-977         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-978         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1309
;-979             prs("\n push ");

 push docall1_5
 call prs
 add  sp, 2
;-980             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-981             }

;-982         if(t0==2){

.docall1309:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1310
;-983             prs("\n push ");

 push docall1_6
 call prs
 add  sp, 2
;-984             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-985             prc(95);

 push 95
 call prc
 add  sp, 2
;-986             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-987             }

;-988         if(t0==3){

.docall1310:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1311
;-989             prs("\n lea  ax, ");

 push docall1_7
 call prs
 add  sp, 2
;-990             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-991             prs("\n push ax");

 push docall1_8
 call prs
 add  sp, 2
;-992             }

;-993         if(t0==4){

.docall1311:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1312
;-994             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-995             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1313
;-996                 prs("\n push word ");

 push docall1_9
 call prs
 add  sp, 2
;-997                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-998                 }

;-999             else {

 jmp .docall1314
.docall1313:
;-1000                 prs("\n mov al, byte ");

 push docall1_10
 call prs
 add  sp, 2
;-1001                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1002                 prs("\n mov ah, 0\n push ax");

 push docall1_11
 call prs
 add  sp, 2
;-1003                 }

;-1004             }

.docall1314:
;-1005         if(t0==5){

.docall1312:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1315
;-1006             prs("\n push ");

 push docall1_12
 call prs
 add  sp, 2
;-1007             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1008             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1316
 mov ax, [bp-10]
 add ax, 2
;-1009             }

.docall1316:
;-1010         i--;

.docall1315:
 dec  word[bp-2]
;-1011         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1317
 jmp .docall1308
.docall1317:
;-1012     }

;-1013 	prs("\n call ");

.docall1296:
 push docall1_13
 call prs
 add  sp, 2
;-1014 	prs(&procname);

 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2
;-1015 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1318
;-1016 	    prs("\n add  sp, ");

 push docall1_14
 call prs
 add  sp, 2
;-1017         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1018         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1019         prunsign1(narg);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1020         }

;-1021 }

.docall1318:
;-1022 

;-1023 

;-1024 int expr() {

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
;-1025     int mode;   int id1;

;-1026     int ixarr;  int ixconst;

;-1027     int ids;    int isCONST;

;-1028     int i;      unsigned char *p;

;-1029 

;-1030     if (istoken(T_CONST)) {// constant ;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr319
;-1031         prs("\n mov ax, ");

 push expr_0
 call prs
 add  sp, 2
;-1032         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1033         return 4;

 mov ax, 4
 jmp .retnexpr
;-1034         }

;-1035     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr319:
 call typeName
 mov [bp-2], ax
;-1036     ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1037     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr320
;-1038         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1039         return;

 jmp .retnexpr
;-1040         }

;-1041     if (token=='(')  {

.expr320:
 mov ax, [token]
 cmp ax, 40
 jne .expr321
;-1042         docall1();

 call docall1
;-1043         goto e1;

 jmp .e1
;-1044         }

;-1045 

;-1046     id1=searchname();

.expr321:
 call searchname
 mov [bp-4], ax
;-1047     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1048     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1049     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1050     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1051     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr322
;-1052         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr323
;-1053             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1054             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1055             expect(']');

 push 93
 call expect
 add  sp, 2
;-1056             }

;-1057         else {

 jmp .expr324
.expr323:
;-1058             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1059             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1060             expect(']');

 push 93
 call expect
 add  sp, 2
;-1061             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1062             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr325
 push expr_1
 call error1
 add  sp, 2
;-1063             }

.expr325:
;-1064         }

.expr324:
;-1065     if (istoken(T_PLUSPLUS  )) {

.expr322:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr326
;-1066         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr327
 push expr_2
 call error1
 add  sp, 2
;-1067         prs("\n inc  ");

.expr327:
 push expr_3
 call prs
 add  sp, 2
;-1068         if (wi==2) prs("word"); else prs("byte");

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
;-1069         v(id1);

.expr329:
 push word [bp-4]
 call v
 add  sp, 2
;-1070         goto e1;

 jmp .e1
;-1071         }

;-1072     if (istoken(T_MINUSMINUS)) {

.expr326:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr330
;-1073         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr331
 push expr_6
 call error1
 add  sp, 2
;-1074         prs("\n dec  ");

.expr331:
 push expr_7
 call prs
 add  sp, 2
;-1075         if (wi==2) prs("word"); else prs("byte");

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
;-1076         v(id1);

.expr333:
 push word [bp-4]
 call v
 add  sp, 2
;-1077         goto e1;

 jmp .e1
;-1078         }

;-1079 

;-1080     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

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
;-1081     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

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
;-1082     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

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
;-1083     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

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
;-1084     if (istoken(T_MULASS  )) error1("not implemented");

.expr337:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
 push expr_14
 call error1
 add  sp, 2
;-1085     if (istoken(T_DIVASS  )) error1("not implemented");

.expr338:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push expr_15
 call error1
 add  sp, 2
;-1086 

;-1087     if (istoken('=')) {

.expr339:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
;-1088         expr();

 call expr
;-1089         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1090         goto e1;

 jmp .e1
;-1091         }

;-1092     dovar1(mode, "mov", ixarr, id1);

.expr340:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1093 

;-1094 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push expr_17
 call rterm
 add  sp, 2
;-1095     else if (istoken('-')) rterm("sub");

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
;-1096     else if (istoken('&')) rterm("and");

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
;-1097     else if (istoken('|')) rterm("or" );

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
;-1098     else if (istoken(T_LESSLESS)) rterm("shl");

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
;-1099     else if (istoken(T_GREATGREAT)) rterm("shr");

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
;-1100     else if (istoken('*')) domul (ids);

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
;-1101     else if (istoken('/')) doidiv(ids);

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
;-1102     else if (istoken('%')) domod (ids);

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
;-1103     if (isrelational()) {

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
;-1104         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1105         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1106         }

;-1107     return 0;

.expr358:
 mov ax, 0
 jmp .retnexpr
;-1108 }

;-1109 

;-1110 int pexpr() {//called from if, do, while

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
;-1111     expect('(');

 push 40
 call expect
 add  sp, 2
;-1112     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1113     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr359
;-1114         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1115         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr360
;-1116             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1117             return;

 jmp .retnpexpr
;-1118             }

;-1119         }

.pexpr360:
;-1120     expr();

.pexpr359:
 call expr
;-1121     if (iscmp==0) prs("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr361
 push pexpr_0
 call prs
 add  sp, 2
;-1122     prs(fname);

.pexpr361:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1123     expect(')');

 push 41
 call expect
 add  sp, 2
;-1124 }

;-1125 

;-1126 

;-1127 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1128     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
;-1129     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1130     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1131     prc(':');

 push 58
 call prc
 add  sp, 2
;-1132 }

;-1133 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1134     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
;-1135     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1136     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1137 }

;-1138 

;-1139 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1140     int c; char cha;

;-1141     int jdest; int tst; int jtemp;

;-1142     if(istoken('{')) {
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt362
;-1143         while(istoken('}')==0) stmt();

.stmt363:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt364
 call stmt
;-1144         }

 jmp .stmt363
.stmt364:
;-1145     else if(istoken(T_IF)) {

 jmp .stmt365
.stmt362:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt366
;-1146         pexpr();

 call pexpr
;-1147         nlabel++;

 inc  word[nlabel]
;-1148         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1149         pint1(jdest);

 push word [bp-6]
 call pint1
 add  sp, 2
;-1150         stmt();

 call stmt
;-1151         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt367
;-1152             nlabel++;

 inc  word[nlabel]
;-1153             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1154             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1155             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1156             stmt();

 call stmt
;-1157             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1158         }

;-1159         else prlabel(jdest);

 jmp .stmt368
.stmt367:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1160     }

.stmt368:
;-1161     else if(istoken(T_DO)) {

 jmp .stmt369
.stmt366:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370
;-1162         nlabel++;

 inc  word[nlabel]
;-1163         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1164         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1165         stmt();

 call stmt
;-1166         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1167         pexpr();

 call pexpr
;-1168         nlabel++;

 inc  word[nlabel]
;-1169         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1170         pint1(jtemp);

 push word [bp-10]
 call pint1
 add  sp, 2
;-1171         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1172          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1173     }

;-1174     else if(istoken(T_WHILE)) {

 jmp .stmt371
.stmt370:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372
;-1175         nlabel++;

 inc  word[nlabel]
;-1176         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1177         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1178         pexpr();

 call pexpr
;-1179         nlabel++;

 inc  word[nlabel]
;-1180         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1181         pint1(tst);

 push word [bp-8]
 call pint1
 add  sp, 2
;-1182         stmt();

 call stmt
;-1183         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1184         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1185     }

;-1186     else if(istoken(T_GOTO))  {

 jmp .stmt373
.stmt372:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt374
;-1187         prs("\n jmp .");

 push stmt_0
 call prs
 add  sp, 2
;-1188         name1();

 call name1
;-1189         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1190         expect(';');

 push 59
 call expect
 add  sp, 2
;-1191     }

;-1192     else if(token==T_ASM)     {

 jmp .stmt375
.stmt374:
 mov ax, [token]
 cmp ax, 518
 jne .stmt376
;-1193       prs("\n");

 push stmt_1
 call prs
 add  sp, 2
;-1194       c=next();

 call next
 mov [bp-2], ax
;-1195       while(c != '\n') {

.stmt377:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt378
;-1196         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1197         c=next();

 call next
 mov [bp-2], ax
;-1198         };

 jmp .stmt377
.stmt378:
;-1199         token=getlex();

 call getlex
 mov word [token], ax
;-1200     }

;-1201     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt379
.stmt376:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt380
;-1202         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt381
;-1203             prs("\n"); cha=next();

 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al
;-1204             while(cha!= '}') {

.stmt382:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt383
;-1205                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1206                 cha=next();

 call next
 mov [bp-4], al
;-1207             }

;-1208             token=getlex();

 jmp .stmt382
.stmt383:
 call getlex
 mov word [token], ax
;-1209         } else error1("Curly open expected");

 jmp .stmt384
.stmt381:
 push stmt_3
 call error1
 add  sp, 2
;-1210     }

.stmt384:
;-1211     else if(istoken(T_INTH))  {

 jmp .stmt385
.stmt380:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je .stmt386
;-1212         prs("\n int  ");

 push stmt_4
 call prs
 add  sp, 2
;-1213         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1214         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1215         expect(';');

 push 59
 call expect
 add  sp, 2
;-1216     }

;-1217     else if(istoken(T_EMIT)) {

 jmp .stmt387
.stmt386:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt388
;-1218       prs("\n db ");

 push stmt_5
 call prs
 add  sp, 2
;-1219     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1220       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1221       token=getlex();

 call getlex
 mov word [token], ax
;-1222       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt389
;-1223           prc(',');

 push 44
 call prc
 add  sp, 2
;-1224           goto L1;

 jmp .L1
;-1225       }

;-1226       expect(')');

.stmt389:
 push 41
 call expect
 add  sp, 2
;-1227     }

;-1228     else if(istoken(';'))      { }

 jmp .stmt390
.stmt388:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt391
;-1229     else if(istoken(T_RETURN)) {

 jmp .stmt392
.stmt391:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt393
;-1230         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt394
 call expr
;-1231         prs("\n jmp .retn");

.stmt394:
 push stmt_6
 call prs
 add  sp, 2
;-1232         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1233         nreturn++;

 inc  word[nreturn]
;-1234         expect(';');

 push 59
 call expect
 add  sp, 2
;-1235     }

;-1236     else if(thechar==':')      {

 jmp .stmt395
.stmt393:
 mov al, [thechar]
 cmp al, 58
 jne .stmt396
;-1237         prs("\n."); // Label

 push stmt_7
 call prs
 add  sp, 2
;-1238         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1239         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1240         expect(':');

 push 58
 call expect
 add  sp, 2
;-1241     }

;-1242     else  {expr();; expect(';'); }

 jmp .stmt397
.stmt396:
 call expr
 push 59
 call expect
 add  sp, 2
;-1243 }

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
;-1244 

;-1245 int isvariable() {

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
;-1246     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable398
 jmp .v1
;-1247     if(token==T_UNSIGNED) goto v1;

.isvariable398:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable399
 jmp .v1
;-1248     if(token==T_CHAR)     goto v1;

.isvariable399:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable400
 jmp .v1
;-1249     if(token==T_INT)      goto v1;

.isvariable400:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable401
 jmp .v1
;-1250     if(token==T_LONG)     goto v1;

.isvariable401:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable402
 jmp .v1
;-1251     return 0;

.isvariable402:
 mov ax, 0
 jmp .retnisvariable
;-1252 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1253 }

;-1254 

;-1255 int dofunc() {

 .retnisvariable:
 ret
ENDP

dofunc: PROC
;-1256     int nloc; int i; unsigned int j;int narg;

;-1257     cloc=&co;
;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1258     checknamelen();

 call checknamelen
;-1259     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1260     i=0;

 mov ax, 0
 mov [bp-4], ax
;-1261     while (i < FTop) {

.dofunc403:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc404
;-1262         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax
;-1263         if(eqstr(symbol, j)) error1("Function already defined");

 push word [bp-6]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dofunc405
 push dofunc_0
 call error1
 add  sp, 2
;-1264         i++;

.dofunc405:
 inc  word[bp-4]
;-1265     }

;-1266     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc403
.dofunc404:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc406
 push dofunc_1
 call error1
 add  sp, 2
;-1267     pt=adrF(FNameField, FTop);

.dofunc406:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1268     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1269     FTop++;

 inc  word[FTop]
;-1270     prs("\n\n");

 push dofunc_2
 call prs
 add  sp, 2
;-1271     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1272     prs(": PROC");

 push dofunc_3
 call prs
 add  sp, 2
;-1273     expect('(');

 push 40
 call expect
 add  sp, 2
;-1274     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1275     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc407
;-1276         narg=2;

 mov ax, 2
 mov [bp-8], ax
;-1277         do {

.dofunc408:
;-1278             typeName();

 call typeName
;-1279             addlocal();

 call addlocal
;-1280             narg+=2;

 add  word[bp-8], 2
;-1281             GData[LTop]=narg;

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1282             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc409
 add  word[bp-8], 2
;-1283                 LTop++;

.dofunc409:
 inc  word[LTop]
;-1284                 }

;-1285         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc410
 jmp .dofunc408
.dofunc410:
;-1286         expect(')');

 push 41
 call expect
 add  sp, 2
;-1287         }

;-1288 

;-1289     expect('{'); /*body*/

.dofunc407:
 push 123
 call expect
 add  sp, 2
;-1290     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1291     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1292     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1293     while(isvariable()) {

.dofunc411:
 call isvariable
 or  al, al
 je .dofunc412
;-1294         do {

.dofunc413:
;-1295             typeName();

 call typeName
;-1296             checknamelen();

 call checknamelen
;-1297             addlocal();

 call addlocal
;-1298             nloc-=2;

 sub  word[bp-2], 2
;-1299             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc414
 sub  word[bp-2], 2
;-1300             GData[LTop]=nloc;

.dofunc414:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1301             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc415
;-1302                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1303                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1304                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1305                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1306                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1307                 nloc+=2;

 add  word[bp-2], 2
;-1308                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1309             }

;-1310             LTop++;

.dofunc415:
 inc  word[LTop]
;-1311         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc416
 jmp .dofunc413
.dofunc416:
;-1312         expect(';');

 push 59
 call expect
 add  sp, 2
;-1313     }

;-1314     if (LTop>LSTART){

 jmp .dofunc411
.dofunc412:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc417
;-1315         prs(";\n ENTER  ");

 push dofunc_4
 call prs
 add  sp, 2
;-1316         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1317         prunsign1 (nloc);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1318         prs(",0");

 push dofunc_5
 call prs
 add  sp, 2
;-1319         }

;-1320 

;-1321     while(istoken('}')==0)  stmt();

.dofunc417:
.dofunc418:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc419
 call stmt
;-1322 

;-1323     if (nreturn) {

 jmp .dofunc418
.dofunc419:
 mov ax, [nreturn]
 or  al, al
 je .dofunc420
;-1324             prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2
;-1325             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1326             prc(':');

 push 58
 call prc
 add  sp, 2
;-1327         }

;-1328     if (LTop > LSTART) prs("\n LEAVE");

.dofunc420:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc421
 push dofunc_7
 call prs
 add  sp, 2
;-1329     prs("\n ret");

.dofunc421:
 push dofunc_8
 call prs
 add  sp, 2
;-1330     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1331     prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-1332     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1333     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc422
 mov ax, [maxco1]
 mov word [maxco], ax
;-1334     prs("\nENDP");

.dofunc422:
 push dofunc_9
 call prs
 add  sp, 2
;-1335 }

;-1336 

;-1337 char doglobName[IDLENMAX];

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
;-1338 int doglob() {


doglob: PROC
;-1339     int i; int j; int isstrarr;

;-1340     isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1341     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .doglob423
 push doglob_0
 call error1
 add  sp, 2
;-1342     if (iswidth == 0) error1("no VOID as var type");

.doglob423:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob424
 push doglob_1
 call error1
 add  sp, 2
;-1343     checknamelen();

.doglob424:
 call checknamelen
;-1344     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob425
 push doglob_2
 call error1
 add  sp, 2
;-1345     if (istoken('[')) {

.doglob425:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob426
;-1346         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1347         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob427
;-1348             prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2
;-1349             prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2
;-1350             prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1351             if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob428
 push doglob_5
 call prs
 add  sp, 2
;-1352             if (iswidth==2) prs(" resw ");

.doglob428:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob429
 push doglob_6
 call prs
 add  sp, 2
;-1353             if (iswidth==4) prs(" resd ");

.doglob429:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob430
 push doglob_7
 call prs
 add  sp, 2
;-1354             prunsign1(lexval);

.doglob430:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-1355             prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2
;-1356             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1357             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob431
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1358             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob431:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob432
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax
;-1359             GData[GTop]=lexval;

.doglob432:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1360             expect(']');

 push 93
 call expect
 add  sp, 2
;-1361         }else {

 jmp .doglob433
.doglob427:
;-1362             expect(']');

 push 93
 call expect
 add  sp, 2
;-1363             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob434
 push doglob_9
 call error1
 add  sp, 2
;-1364             prs("\n");

.doglob434:
 push doglob_10
 call prs
 add  sp, 2
;-1365             prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1366             prs(" db ");

 push doglob_11
 call prs
 add  sp, 2
;-1367             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1368             strcpy(doglobName, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1369             expect('=');

 push 61
 call expect
 add  sp, 2
;-1370             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob435
;-1371                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1372                 prscomment(symbol);

 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
;-1373                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1374                 prs(",0");

 push doglob_12
 call prs
 add  sp, 2
;-1375                 i=strlen(symbol);

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1376                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1377                 }

;-1378             else if (istoken('{' )) {

 jmp .doglob436
.doglob435:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob437
;-1379                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1380                 do {

.doglob438:
;-1381                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob439
 push 44
 call prc
 add  sp, 2
;-1382                     expect(T_CONST);

.doglob439:
 push 257
 call expect
 add  sp, 2
;-1383                     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1384                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1385                     }

;-1386                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob440
 jmp .doglob438
.doglob440:
;-1387                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1388             }

;-1389         else error1("String or number array expected");

 jmp .doglob441
.doglob437:
 push doglob_13
 call error1
 add  sp, 2
;-1390         };

.doglob441:
.doglob436:
.doglob433:
;-1391     }else { //expect('=');

 jmp .doglob442
.doglob426:
;-1392         prs("\n");

 push doglob_14
 call prs
 add  sp, 2
;-1393         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1394         if (istype=='*') prs(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob443
 push doglob_15
 call prs
 add  sp, 2
;-1395         else {

 jmp .doglob444
.doglob443:
;-1396             if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob445
 push doglob_16
 call prs
 add  sp, 2
;-1397             else if (iswidth==2) prs(" dw ");

 jmp .doglob446
.doglob445:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob447
 push doglob_17
 call prs
 add  sp, 2
;-1398             else                 prs(" dd ");

 jmp .doglob448
.doglob447:
 push doglob_18
 call prs
 add  sp, 2
;-1399         }

.doglob448:
.doglob446:
;-1400     if(istoken('-')) prc('-');

.doglob444:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob449
 push 45
 call prc
 add  sp, 2
;-1401     if (istoken('=')) {

.doglob449:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob450
;-1402         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1403         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1404         }else prunsign1(0);

 jmp .doglob451
.doglob450:
 push 0
 call prunsign1
 add  sp, 2
;-1405     }

.doglob451:
;-1406     GSign[GTop]=issign;

.doglob442:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1407     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1408     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1409     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1410     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob452
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1411         else strcpy(pt, symbol);

 jmp .doglob453
.doglob452:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1412     GTop++;

.doglob453:
 inc  word[GTop]
;-1413     expect(';');

 push 59
 call expect
 add  sp, 2
;-1414 }

;-1415 

;-1416 int dodefine() {

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
;-1417     int i; int j; int fdtemp;

;-1418     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine454
;-1419         token=getlex();

 call getlex
 mov word [token], ax
;-1420         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1421         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1422         return;

 jmp .retndodefine
;-1423     }

;-1424     expect(T_NAME);

.dodefine454:
 push 256
 call expect
 add  sp, 2
;-1425     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine455
;-1426         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine456
 push dodefine_1
 call error1
 add  sp, 2
;-1427         i=strlen(symbol);

.dodefine456:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1428         if (i>IDLENMAX) error1("Define name too long");

 mov ax, [bp-2]
 cmp ax, 31
 jle .dodefine457
 push dodefine_2
 call error1
 add  sp, 2
;-1429         GSign [GTop]='U';

.dodefine457:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1430         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1431         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1432         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1433         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1434         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1435         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1436         GTop++;

 inc  word[GTop]
;-1437     }

;-1438 }

.dodefine455:
;-1439 

;-1440 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name too long",0
ENDP

parse: PROC
;-1441     token=getlex();

 call getlex
 mov word [token], ax
;-1442     do {

.parse458:
;-1443         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse459
 mov ax, 1
 jmp .retnparse
;-1444         if (istoken('#')) {

.parse459:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse460
;-1445              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse461
 call dodefine
;-1446              else error1("define expected");

 jmp .parse462
.parse461:
 push parse_0
 call error1
 add  sp, 2
;-1447         }

.parse462:
;-1448     else{

 jmp .parse463
.parse460:
;-1449         typeName();

 call typeName
;-1450         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse464
 call dofunc
;-1451         else doglob(); }

 jmp .parse465
.parse464:
 call doglob
.parse465:
;-1452     } while(1);

.parse463:
 mov ax, 1
 or  al, al
 je .parse466
 jmp .parse458
.parse466:
;-1453 }

;-1454 

;-1455 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1456 int main() {


main: PROC
;-1457     int arglen1; unsigned int i; char *c;

;-1458     isPrint=1;
;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1459     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1460     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main467
;-1461         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1462         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1463         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1464         }

;-1465     i=arglen1+129;

.main467:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1466     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1467     arglen1--;

 dec  word[bp-2]
;-1468     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1469     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1470     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main468
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4
;-1471     strcpy(namelst, namein);

.main468:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1472     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1473     i--;

 dec  word[bp-4]
;-1474     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1475     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1476 

;-1477     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1478     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main469
;-1479         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1480         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1481         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1482         }

;-1483     fdout=creatR(namelst);

.main469:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1484     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main470
;-1485         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1486         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1487         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1488         }

;-1489     prs(";");

.main470:
 push main_4
 call prs
 add  sp, 2
;-1490     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2
;-1491     prs(", Input: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
;-1492     prs(", Output: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2
;-1493     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1494     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2
;-1495     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1496     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1497     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1498     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1499     parse();

 call parse
;-1500     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1501     GTop--;

 dec  word[GTop]
;-1502     prs("\n;Glob. variables:");     prunsign1(GTop);

 push main_8
 call prs
 add  sp, 2
 push word [GTop]
 call prunsign1
 add  sp, 2
;-1503     prs(" (");                      prunsign1(LSTART);

 push main_9
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1504     prs("), Functions:");           prunsign1(FTop);

 push main_10
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2
;-1505     prs(" (");                      prunsign1(FUNCMAX);

 push main_11
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1506     prs("), Lines:");               prunsign1(lineno);

 push main_12
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2
;-1507     prs("\n;Constant: ");           prunsign1(maxco);

 push main_13
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2
;-1508     prs(" (");                      prunsign1(COMAX);

 push main_14
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2
;-1509     i=COMAX;

 mov ax, 3000
 mov [bp-4], ax
;-1510     i=i-maxco;

 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1511     if (i <= 1000)prs("\n ** Warning ** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main471
 push main_15
 call prs
 add  sp, 2
;-1512     prs("), stacksize: ");

.main471:
 push main_16
 call prs
 add  sp, 2
;-1513     i=65536;

 mov ax, 0
 mov [bp-4], ax
;-1514     i=i-orgData;

 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1515     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1516     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main472
 push main_17
 call prs
 add  sp, 2
;-1517     end1(0);

.main472:
 push 0
 call end1
 add  sp, 2
;-1518 }

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
;Glob. variables:101 (300), Functions:71 (300), Lines:1519
;Constant: 688 (3000), stacksize: 12506