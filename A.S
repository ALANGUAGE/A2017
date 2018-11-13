;PLA compiler A.COM V0.9.5, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA compiler A.COM V0.9.5";//todo: 2. op=reg not recognized

Version1 db "PLA compiler A.COM V0.9.5",0
;-2 #define IDLENMAX       15//max length of names

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

;-23 #define T_EQ          806

;-24 #define T_NE          807

;-25 #define T_GE          811

;-26 #define T_LE          824

;-27 #define T_PLUSPLUS   1219

;-28 #define T_MINUSMINUS 1225

;-29 #define T_PLUSASS    1230

;-30 #define T_MINUSASS   1231

;-31 #define T_MULASS     1232

;-32 #define T_DIVASS     1233

;-33 #define T_ANDASS     1234

;-34 #define T_ORASS      1235

;-35 #define T_LESSLESS   1240

;-36 #define T_GREATGREAT 1241

;-37 

;-38 char isPrint=1;//set screen listing

isPrint db 1
;-39 unsigned int ORGDATAORIG=25000;//start of arrays, end of text

ORGDATAORIG dw 25000
;-40 unsigned int orgData;//actual max of array, must be less than stack

orgData dw 0
;-41 #define COMAX        3000

;-42 char co[COMAX];//constant storage

section .bss
absolute 25000
co resb 3000
section .text
;-43 int maxco=0;

maxco dw 0
;-44 int maxco1=0;

maxco1 dw 0
;-45 #define CMDLENMAX      67

;-46 char symbol[COLUMNMAX];

section .bss
absolute 28000
symbol resb 128
section .text
;-47 char fname[CMDLENMAX];

section .bss
absolute 28128
fname resb 67
section .text
;-48 char namein[CMDLENMAX];

section .bss
absolute 28195
namein resb 67
section .text
;-49 char namelst[CMDLENMAX];

section .bss
absolute 28262
namelst resb 67
section .text
;-50 char *cloc=0;

cloc dw 0
;-51 int fdin=0;

fdin dw 0
;-52 int fdout=0;

fdout dw 0
;-53 int token=0;

token dw 0
;-54 int column=0;

column dw 0
;-55 char thechar=0;   //reads one char forward

thechar db 0
;-56 int iscmp=0;

iscmp dw 0
;-57 int nconst=0;

nconst dw 0
;-58 int nreturn=0;

nreturn dw 0
;-59 int nlabel=0;‚

nlabel dw 0
;-60 unsigned int lexval=0;

lexval dw 0
;-61 int typei;       char istype;

typei dw 0
istype db 0
;-62 int signi;       char issign;

signi dw 0
issign db 0
;-63 int widthi;      char iswidth;

widthi dw 0
iswidth db 0
;-64 int wi=0;

wi dw 0
;-65 #define VARMAX        400//max global and local var

;-66 #define LSTART        300//max global var

;-67 #define GNAMEMAX     6400// 16*VARMAX

;-68 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 28329
GType resb 400
section .text
;-69 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 28729
GSign resb 400
section .text
;-70 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 29129
GWidth resb 400
section .text
;-71 int GData [VARMAX];

section .bss
absolute 29529
GData resw 400
section .text
;-72 char GNameField[GNAMEMAX];

section .bss
absolute 30329
GNameField resb 6400
section .text
;-73 int GTop=1;

GTop dw 1
;-74 int LTop=LSTART;

LTop dw 300
;-75 #define FUNCMAX       300//max functions

;-76 #define FNAMEMAX     4800// 16*FUNCMAX

;-77 char FNameField[FNAMEMAX];

section .bss
absolute 36729
FNameField resb 4800
section .text
;-78 int  FTop=0;

FTop dw 0
;-79 char fgetsdest[COLUMNMAX];

section .bss
absolute 41529
fgetsdest resb 128
section .text
;-80 unsigned char *fgetsp=0;

fgetsp dw 0
;-81 unsigned int lineno=1;

lineno dw 1
;-82 unsigned char *pt=0;

pt dw 0
;-83 unsigned char *p1=0;

p1 dw 0
;-84 int DOS_ERR=0;

DOS_ERR dw 0
;-85 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-86 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-87 int ireg1;

ireg1 dw 0
;-88 int mod2;

mod2 dw 0
;-89 int ireg2;

ireg2 dw 0
;-90 

;-91 int writetty()     {//ah=0x0E; bx=0; __emit__(0xCD,0x10);


writetty: PROC
;-92 asm mov ah, 14

 mov ah, 14
;-93 asm mov bx, 0

 mov bx, 0
;-94 asm int 16

 int 16
;-95 }

;-96 int putch(char c)  {

 ret
ENDP

putch: PROC
;-97     if (c==10)  {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-98         asm mov al, 13

 mov al, 13
;-99         writetty();

 call writetty
;-100     }

;-101     asm mov al, [bp+4]; parameter c

.putch1:
 mov al, [bp+4]; parameter c
;-102     writetty();

 call writetty
;-103 }

;-104 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-105     char c;

;-106     while(*s) {
;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
;-107         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-108         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-109         s++;

 inc  word[bp+4]
;-110     }

;-111 }

 jmp .cputs2
.cputs3:
;-112 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-113     asm mov ax, [bp+4]; parameter n
;
 ENTER  0,0
 mov ax, [bp+4]; parameter n
;-114     asm neg ax

 neg ax
;-115 }

;-116 

;-117 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-118     asm int 33; 21h

 int 33; 21h
;-119     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-120     DOS_ERR++;

 inc  word[DOS_ERR]
;-121 }

;-122 int openR (char *s) {

 ret
ENDP

openR: PROC
;-123     dx=s;
;
 ENTER  0,0
 mov  dx, [bp+4]
;-124     ax=0x3D02;

 mov  ax, 15618
;-125     DosInt();

 call DosInt
;-126 }

;-127 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-128     dx=s;
;
 ENTER  0,0
 mov  dx, [bp+4]
;-129     cx=0;

 mov  cx, 0
;-130     ax=0x3C00;

 mov  ax, 15360
;-131     DosInt();

 call DosInt
;-132 }

;-133 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-134     bx=fd;
;
 ENTER  0,0
 mov  bx, [bp+4]
;-135     ax=0x3E00;

 mov  ax, 15872
;-136     DosInt();

 call DosInt
;-137 }

;-138 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-139     ah=0x4C;
;
 ENTER  0,0
 mov  ah, 76
;-140     al=c;

 mov  al, [bp+4]
;-141     DosInt();

 call DosInt
;-142 }

;-143 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-144     dx=s;
;
 ENTER  0,0
 mov  dx, [bp+4]
;-145     cx=len;

 mov  cx, [bp+8]
;-146     bx=fd;

 mov  bx, [bp+6]
;-147     ax=0x3F00;

 mov  ax, 16128
;-148     DosInt();

 call DosInt
;-149 }

;-150 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-151     __asm{lea dx, [bp+4]}; /* = *n */
;
 ENTER  0,0
lea dx, [bp+4]
;-152     cx=1;

 mov  cx, 1
;-153     bx=fd;

 mov  bx, [bp+6]
;-154     ax=0x4000;

 mov  ax, 16384
;-155     DosInt();

 call DosInt
;-156 }

;-157 

;-158 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-159       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-160       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-161       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-162       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-163       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-164       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-165       if (c> 'Z') { if (c< 'a') return 0; }

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
;-166       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-167 }

;-168 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-169       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-170       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-171       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-172 }

;-173 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-174     if (digit (c)) return 1;
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
;-175     if (letter(c)) return 1;

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
;-176     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-177 }

;-178 

;-179 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-180     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-181     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-182     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-183 }

;-184 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-185     do { *s=*t; s++; t++; }
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
;-186     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-187     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-188     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-189 }

;-190 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-191     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21
;-192         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-193         p++;

.eqstr22:
 inc  word[bp+4]
;-194         q++;

 inc  word[bp+6]
;-195     }

;-196     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-197     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-198 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-199     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]
;-200     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-201 }

;-202 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-203     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27
;-204         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-205         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-206     }

;-207 }

 jmp .toupper26
.toupper27:
;-208 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-209     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131
;-210         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-211         s++;

.instr132:
 inc  word[bp+4]
;-212     }

;-213     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-214 }

;-215 

;-216 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-217     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-218     cloc++;

 inc  word[cloc]
;-219 }

;-220 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-221     char c;

;-222     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34
;-223         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-224         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-225         s++;

 inc  word[bp+4]
;-226     }

;-227 }

 jmp .eprs33
.eprs34:
;-228 

;-229 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-230     if (isPrint) {
;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-231         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-232             ax=13;

 mov  ax, 13
;-233             writetty();

 call writetty
;-234         }

;-235         al=c;

.prc36:
 mov  al, [bp+4]
;-236         writetty();

 call writetty
;-237     }

;-238     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-239 }

;-240 

;-241 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-242     unsigned char c;

;-243     while(*s){
;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38
;-244         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-245         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-246         s++;

 inc  word[bp+4]
;-247     }

;-248 }

 jmp .prscomment37
.prscomment38:
;-249 

;-250 int prs(unsigned char *s) {

 LEAVE
 ret
ENDP

prs: PROC
;-251     unsigned char c; int com;

;-252     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-253     while(*s) {

.prs39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs40
;-254         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-255         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs41
 mov ax, [bp-4]
 or  al, al
 je .prs42
 mov ax, 0
 mov [bp-4], ax
;-256                    else com=1;

 jmp .prs43
.prs42:
 mov ax, 1
 mov [bp-4], ax
;-257         if (c==92) {

.prs43:
.prs41:
 mov al, [bp-2]
 cmp al, 92
 jne .prs44
;-258             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs45
;-259                 s++;

 inc  word[bp+4]
;-260                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-261                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs46
 mov ax, 10
 mov [bp-2], al
;-262                 if (c=='t') c= 9;

.prs46:
 mov al, [bp-2]
 cmp al, 116
 jne .prs47
 mov ax, 9
 mov [bp-2], al
;-263             }

.prs47:
;-264         }

.prs45:
;-265         prc(c);

.prs44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-266         s++;

 inc  word[bp+4]
;-267     }

;-268 }

 jmp .prs39
.prs40:
;-269 

;-270 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-271     int e;

;-272     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-273         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-274         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-275     }

;-276     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-277         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-278         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-279     }

;-280     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-281     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-282     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-283 }

;-284 

;-285 int pint1 (int n){

 LEAVE
 ret
ENDP

pint1: PROC
;-286     int e;

;-287     if(n<0) {  prc('-');  n=mkneg(n); }
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
;-288     if (n >= 10) {

.pint150:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint151
;-289         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-290         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2
;-291     }

;-292     n=n%10;

.pint151:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-293     n += '0';

 add  word[bp+4], 48
;-294     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-295 }

;-296 

;-297 int prunsign1(unsigned int n) {

 LEAVE
 ret
ENDP

prunsign1: PROC
;-298     unsigned int e;

;-299     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign152
;-300         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-301         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-302     }

;-303     n = n % 10; /*unsigned mod*/

.prunsign152:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
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

;-308 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-309     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-310     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-311     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-312 }

;-313 

;-314 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-315     isPrint=1;
;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-316     lineno--;

 dec  word[lineno]
;-317     prs("\n ");

 push error1_0
 call prs
 add  sp, 2
;-318     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-319     prs(";Line: ");

 push error1_1
 call prs
 add  sp, 2
;-320     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-321     prs(" ************** ERROR: ");

 push error1_2
 call prs
 add  sp, 2
;-322     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2
;-323     prs("  in column: ");

 push error1_3
 call prs
 add  sp, 2
;-324     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2
;-325     prs("\nToken: ");

 push error1_4
 call prs
 add  sp, 2
;-326     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2
;-327     prs(", symbol: ");

 push error1_5
 call prs
 add  sp, 2
;-328     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-329     end1(1);

 push 1
 call end1
 add  sp, 2
;-330 }

;-331 

;-332 int printinputline() {

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
;-333     int col;

;-334     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-335     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-336     do {

.printinputline53:
;-337         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-338         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-339         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-340         fgetsp++;

 inc  word[fgetsp]
;-341         col++;

 inc  word[bp-2]
;-342         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-343         }

.printinputline55:
;-344         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-345     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-346         prs("\n;-");

 push printinputline_1
 call prs
 add  sp, 2
;-347         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-348         prc(' ');

 push 32
 call prc
 add  sp, 2
;-349         lineno++;

 inc  word[lineno]
;-350         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-351 }

;-352 

;-353 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-354     char c;

;-355     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-356     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-357         printinputline();

 call printinputline
;-358         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-359         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-360         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-361         column=0;

 mov ax, 0
 mov word [column], ax
;-362     }

;-363     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-364     column++;

 inc  word[column]
;-365     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-366 }

;-367 

;-368 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-369     char r;

;-370     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-371     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-372     return r;

 mov al, [bp-2]
 jmp .retnnext
;-373 }

;-374 

;-375 int adrF(char *s, unsigned int i) {

 .retnnext:
 LEAVE
 ret
ENDP

adrF: PROC
;-376     i << 4;//*16; IDLENMAX=15!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4
;-377     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 
;-378 }

;-379 

;-380 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-381     int j;

;-382     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName59
;-383         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-384         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2
;-385     }

;-386     else {

 jmp .printName60
.printName59:
;-387         prs("[bp");

 push printName_0
 call prs
 add  sp, 2
;-388         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-389         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2
;-390         pint1(j);

.printName61:
 push word [bp-2]
 call pint1
 add  sp, 2
;-391         prc(']');

 push 93
 call prc
 add  sp, 2
;-392     }

;-393 }

.printName60:
;-394 

;-395 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-396     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL
;-397     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63
;-398         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al
;-399         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL
;-400     }

;-401     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL
;-402 }

;-403 

;-404 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 41657
symboltemp resb 80
section .text
;-405 

;-406 int getlex() {


getlex: PROC
;-407     char c; char *p;

;-408     int i; int j;

;-409 g1: c=next();
;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-410     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex
;-411     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1
;-412   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-413   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-414   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-415   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-416   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-417   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-418   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-419   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-420   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-421   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-422   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-423   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-424   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-425   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-426   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-427   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96
;-428       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97
;-429           do c=next();

.getlex98:
 call next
 mov [bp-2], al
;-430           while(ifEOL(c)==0) return getlex();

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
;-431       }

;-432   }

.getlex97:
;-433   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-434       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101
;-435           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-436           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2
;-437           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2
;-438           c=next();

.getlex103:
 call next
 mov [bp-2], al
;-439           return getlex();

 call getlex
 jmp .retngetlex
;-440       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex
;-441   }

.getlex104:
;-442   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105
;-443       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-444       c=next();

 call next
 mov [bp-2], al
;-445       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107
;-446           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-447           p++;

 inc  word[bp-4]
;-448           c=next();

 call next
 mov [bp-2], al
;-449           }

;-450           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-451       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-452   }

;-453   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108
;-454       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-455       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-456       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al
;-457       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110
;-458           next();

 call next
;-459           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112
;-460               c=next();

 call next
 mov [bp-2], al
;-461               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-462       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-463                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-464                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-465                i=0;

 mov ax, 0
 mov [bp-6], ax
;-466                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-467                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-468            }

;-469        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:
;-470            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-471                c=next();

 call next
 mov [bp-2], al
;-472                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-473                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-474                i=0;

 mov ax, 0
 mov [bp-6], ax
;-475                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-476                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-477            }

;-478        }

 jmp .getlex116
.getlex117:
;-479       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex
;-480   }

;-481   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118
;-482       lexval=next();

 call next
 mov word [lexval], ax
;-483       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119
;-484           lexval=next();

 call next
 mov word [lexval], ax
;-485           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax
;-486           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax
;-487           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax
;-488       }

.getlex122:
;-489       next();

.getlex119:
 call next
;-490       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-491   }

;-492   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-493     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-494     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-495     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-496     p++;

 inc  word[bp-4]
;-497     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125
;-498         c=next();

 call next
 mov [bp-2], al
;-499         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-500         p++;

 inc  word[bp-4]
;-501     }

;-502     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-503     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex
;-504     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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
;-505     if (eqstr(symbol,"void"    )) return T_VOID;

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
;-506     if (eqstr(symbol,"int"     )) return T_INT;

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
;-507     if (eqstr(symbol,"long"    )) return T_LONG;

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
;-508     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex130:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 530
 jmp .retngetlex
;-509     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex131:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 518
 jmp .retngetlex
;-510     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex132:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 519
 jmp .retngetlex
;-511     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex133:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 520
 jmp .retngetlex
;-512     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex134:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 512
 jmp .retngetlex
;-513     if (eqstr(symbol,"if"      )) return T_IF;

.getlex135:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 513
 jmp .retngetlex
;-514     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex136:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 514
 jmp .retngetlex
;-515     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex137:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 515
 jmp .retngetlex
;-516     if (eqstr(symbol,"do"      )) return T_DO;

.getlex138:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 516
 jmp .retngetlex
;-517     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex139:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 521
 jmp .retngetlex
;-518     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex140:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 511
 jmp .retngetlex
;-519 

;-520     i=0;//convert define to value

.getlex141:
 mov ax, 0
 mov [bp-6], ax
;-521     while (i < GTop) {

.getlex142:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex143
;-522         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-523         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
;-524             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex145
;-525                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-526                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
;-527                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-528             }

;-529         }

.getlex145:
;-530         i++;

.getlex144:
 inc  word[bp-6]
;-531     }

;-532     return T_NAME; } error1("Input item not recognized");

 jmp .getlex142
.getlex143:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_17
 call error1
 add  sp, 2
;-533 }

;-534 

;-535 int istoken(int t) {

 .retngetlex:
 LEAVE
 ret
getlex_0 db "()[]{},;*:%-><=+!&|#?",0
getlex_1 db "signed",0
getlex_2 db "unsigned",0
getlex_3 db "void",0
getlex_4 db "int",0
getlex_5 db "long",0
getlex_6 db "char",0
getlex_7 db "asm",0
getlex_8 db "__asm",0
getlex_9 db "__emit__",0
getlex_10 db "return",0
getlex_11 db "if",0
getlex_12 db "else",0
getlex_13 db "while",0
getlex_14 db "do",0
getlex_15 db "goto",0
getlex_16 db "define",0
getlex_17 db "Input item not recognized",0
ENDP

istoken: PROC
;-536     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken146
;-537         token=getlex();

 call getlex
 mov word [token], ax
;-538         return 1;

 mov ax, 1
 jmp .retnistoken
;-539     }

;-540     return 0;

.istoken146:
 mov ax, 0
 jmp .retnistoken
;-541 }

;-542 

;-543 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-544     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect147
;-545         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-546         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-547         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2
;-548         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2
;-549         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-550     }

;-551 }

.expect147:
;-552 

;-553 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-554     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .v148
 push 91
 call prc
 add  sp, 2
;-555     printName(i);

.v148:
 push word [bp+4]
 call printName
 add  sp, 2
;-556     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v149
 push 93
 call prc
 add  sp, 2
;-557 }

.v149:
;-558 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-559     int i;

;-560     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-561     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen150
 push checknamelen_0
 call error1
 add  sp, 2
;-562 }

.checknamelen150:
;-563 

;-564 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

checkName: PROC
;-565     unsigned int i; unsigned int j;

;-566     i=LSTART;
;
 ENTER  4,0
 mov ax, 300
 mov [bp-2], ax
;-567     while(i<LTop) {

.checkName151:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName152
;-568         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-569         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName153
 mov ax, [bp-2]
 jmp .retncheckName
;-570         i++;

.checkName153:
 inc  word[bp-2]
;-571     }

;-572     i=1;

 jmp .checkName151
.checkName152:
 mov ax, 1
 mov [bp-2], ax
;-573     while(i<GTop) {

.checkName154:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName155
;-574         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-575         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName156
 mov ax, [bp-2]
 jmp .retncheckName
;-576         i++;

.checkName156:
 inc  word[bp-2]
;-577     }

;-578     return 0;

 jmp .checkName154
.checkName155:
 mov ax, 0
 jmp .retncheckName
;-579 }

;-580 

;-581 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-582     unsigned int i;

;-583     i=checkName();
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-584     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname157
 push searchname_0
 call error1
 add  sp, 2
;-585     return i;

.searchname157:
 mov ax, [bp-2]
 jmp .retnsearchname
;-586 }

;-587 

;-588 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-589     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1158
 push name1_0
 call error1
 add  sp, 2
;-590     token=getlex();

.name1158:
 call getlex
 mov word [token], ax
;-591 }

;-592 

;-593 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-594     int m; //0=V,1=*,2=&

;-595     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-596     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName159
 mov ax, 83
 mov byte [issign], al
;-597     if(istoken(T_UNSIGNED)) issign='U';

.typeName159:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 85
 mov byte [issign], al
;-598     iswidth=2;

.typeName160:
 mov ax, 2
 mov byte [iswidth], al
;-599     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 0
 mov byte [iswidth], al
;-600     if(istoken(T_CHAR))     iswidth=1;

.typeName161:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 1
 mov byte [iswidth], al
;-601     if(istoken(T_INT))      iswidth=2;

.typeName162:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 2
 mov byte [iswidth], al
;-602     if(istoken(T_LONG))     iswidth=4;

.typeName163:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 4
 mov byte [iswidth], al
;-603     istype='V';

.typeName164:
 mov ax, 86
 mov byte [istype], al
;-604     m=0;

 mov ax, 0
 mov [bp-2], ax
;-605     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-606     if(istoken('&'))  {istype='&'; m=2;}

.typeName165:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-607     name1();

.typeName166:
 call name1
;-608     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-609 }

;-610 

;-611 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-612     char c;

;-613     c=GSign [i];
;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-614     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes167
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes168
.gettypes167:
 mov ax, 0
 mov word [signi], ax
;-615     c=GWidth[i];

.gettypes168:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-616     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-617     wi=0;

 mov ax, 0
 mov word [wi], ax
;-618     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes169
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-619     if (c==2) {widthi=2;wi=2;}

.gettypes169:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes170
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-620     if (c==4) {widthi=4;wi=4;}

.gettypes170:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes171
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-621     c=GType [i];

.gettypes171:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-622     typei=0;

 mov ax, 0
 mov word [typei], ax
;-623     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes172
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-624     if (c=='&')  typei=2;

.gettypes172:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes173
 mov ax, 2
 mov word [typei], ax
;-625     return i;

.gettypes173:
 mov ax, [bp+4]
 jmp .retngettypes
;-626 }

;-627 

;-628 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-629     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal174
 push addlocal_0
 call error1
 add  sp, 2
;-630     if (checkName() != 0) error1("Variable already defined");

.addlocal174:
 call checkName
 cmp ax, 0
 je  .addlocal175
 push addlocal_1
 call error1
 add  sp, 2
;-631     GSign[LTop]=issign;

.addlocal175:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-632     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-633     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-634     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-635     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-636 }

;-637 

;-638 

;-639 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-640        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg176
 push cmpneg_0
 call prs
 add  sp, 2
;-641   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg177
.cmpneg176:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg178
 push cmpneg_1
 call prs
 add  sp, 2
;-642   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg179
.cmpneg178:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg180
 mov ax, [bp+4]
 or  al, al
 je .cmpneg181
 push cmpneg_2
 call prs
 add  sp, 2
;-643                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg182
.cmpneg181:
 push cmpneg_3
 call prs
 add  sp, 2
;-644   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg182:
 jmp .cmpneg183
.cmpneg180:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg184
 mov ax, [bp+4]
 or  al, al
 je .cmpneg185
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-645                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2
;-646                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg186
.cmpneg185:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-647                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2
;-648   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg186:
 jmp .cmpneg187
.cmpneg184:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg188
 push cmpneg_8
 call prs
 add  sp, 2
;-649   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg189
.cmpneg188:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg190
 push cmpneg_9
 call prs
 add  sp, 2
;-650   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg191
.cmpneg190:
 push cmpneg_10
 call error1
 add  sp, 2
;-651 }

.cmpneg191:
.cmpneg189:
.cmpneg187:
.cmpneg183:
.cmpneg179:
.cmpneg177:
;-652 

;-653 int isrelational() {

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
;-654     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational192
 jmp .w
;-655     if (token==T_NE) goto w;

.isrelational192:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational193
 jmp .w
;-656     if (token==T_LE) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational194
 jmp .w
;-657     if (token==T_GE) goto w;

.isrelational194:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational195
 jmp .w
;-658     if (token=='<' ) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational196
 jmp .w
;-659     if (token=='>' ) goto w;

.isrelational196:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational197
 jmp .w
;-660     return 0;

.isrelational197:
 mov ax, 0
 jmp .retnisrelational
;-661 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-662     token=getlex();

 call getlex
 mov word [token], ax
;-663     return 1;

 mov ax, 1
 jmp .retnisrelational
;-664 }

;-665 

;-666 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-667   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg198
 mov ax, 0
 jmp .retncheckreg
;-668   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg198:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 1
 jmp .retncheckreg
.checkreg199:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 3
 jmp .retncheckreg
;-669   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg200:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 5
 jmp .retncheckreg
.checkreg201:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 7
 jmp .retncheckreg
;-670   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg202:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 9
 jmp .retncheckreg
.checkreg203:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 11
 jmp .retncheckreg
;-671   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg204:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 13
 jmp .retncheckreg
.checkreg205:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 15
 jmp .retncheckreg
;-672   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg206:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 17
 jmp .retncheckreg
.checkreg207:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 19
 jmp .retncheckreg
;-673   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg208:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 21
 jmp .retncheckreg
.checkreg209:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 23
 jmp .retncheckreg
;-674   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg210:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 25
 jmp .retncheckreg
.checkreg211:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 27
 jmp .retncheckreg
;-675   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg212:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 29
 jmp .retncheckreg
.checkreg213:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 31
 jmp .retncheckreg
;-676   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg214:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 33
 jmp .retncheckreg
.checkreg215:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 35
 jmp .retncheckreg
;-677   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg216:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 37
 jmp .retncheckreg
.checkreg217:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 39
 jmp .retncheckreg
;-678   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg218:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 41
 jmp .retncheckreg
.checkreg219:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 43
 jmp .retncheckreg
;-679   // (eqstr(symbol,"ip")) return 45;

;-680   if (strlen(symbol) >   3) return 0;

.checkreg220:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg221
 mov ax, 0
 jmp .retncheckreg
;-681   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg221:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 47
 jmp .retncheckreg
.checkreg222:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 50
 jmp .retncheckreg
;-682   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg223:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 53
 jmp .retncheckreg
.checkreg224:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 56
 jmp .retncheckreg
;-683   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg225:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 59
 jmp .retncheckreg
.checkreg226:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 62
 jmp .retncheckreg
;-684   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg227:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 65
 jmp .retncheckreg
.checkreg228:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 68
 jmp .retncheckreg
;-685 //  if (eqstr(symbol,"cr0")) return 71;

;-686   return 0;

.checkreg229:
 mov ax, 0
 jmp .retncheckreg
;-687 }

;-688 

;-689 char printregstr[]

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
;-690 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-691 

;-692 int printreg(int i) {


printreg: PROC
;-693     unsigned int k; unsigned char c;

;-694     k = &printregstr + i;
;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-695     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-696     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-697     i++;

 inc  word[bp+4]
;-698     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-699     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-700     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-701     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg230
;-702         i++;

 inc  word[bp+4]
;-703         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-704         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-705         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-706         }

;-707 }

.printreg230:
;-708 

;-709 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 41737
ops resb 5
section .text
;-710 int doreg1(int iscmp1) {


doreg1: PROC
;-711     int i;

;-712     if (istoken('='))          strcpy(ops, "mov");
;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1231
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-713     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1231:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1232
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-714     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1232:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1233
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-715     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1233:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1234
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-716     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1234:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1235
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-717     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1235:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1236
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-718     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1236:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1237
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-719     if (iscmp1 == 1) {

.doreg1237:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1238
;-720             token=getlex();

 call getlex
 mov word [token], ax
;-721             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1239
 push doreg1_7
 call error1
 add  sp, 2
;-722             strcpy(ops, "cmp");

.doreg1239:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-723         }

;-724     prs("\n ");

.doreg1238:
 push doreg1_9
 call prs
 add  sp, 2
;-725     prs(ops);

 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2
;-726     prs("  ");

 push doreg1_10
 call prs
 add  sp, 2
;-727     printreg(ireg1);

 push word [ireg1]
 call printreg
 add  sp, 2
;-728     prs(", ");

 push doreg1_11
 call prs
 add  sp, 2
;-729 

;-730     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1240
;-731         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-732         goto reg1;

 jmp .reg1
;-733         }

;-734     mod2=typeName();

.doreg1240:
 call typeName
 mov word [mod2], ax
;-735     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-736     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1241
;-737         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-738         goto reg1;

 jmp .reg1
;-739         }

;-740     i=searchname();

.doreg1241:
 call searchname
 mov [bp-2], ax
;-741     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1242
 push word [bp-2]
 call printName
 add  sp, 2
;-742         else v(i);

 jmp .doreg1243
.doreg1242:
 push word [bp-2]
 call v
 add  sp, 2
;-743 reg1: if (iscmp1 == 1) {

.doreg1243:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1244
;-744     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-745     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-746     expect(')');

 push 41
 call expect
 add  sp, 2
;-747     }

;-748 }

.doreg1244:
;-749 

;-750 int compoundass(char *op, int mode, int id1) {

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
;-751     if(mode) error1("only scalar variable allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass245
 push compoundass_0
 call error1
 add  sp, 2
;-752     prs("\n ");

.compoundass245:
 push compoundass_1
 call prs
 add  sp, 2
;-753     prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-754     prs("  ");

 push compoundass_2
 call prs
 add  sp, 2
;-755     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-756     if (wi==2) prs("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass246
 push compoundass_3
 call prs
 add  sp, 2
;-757         else prs("byte");

 jmp .compoundass247
.compoundass246:
 push compoundass_4
 call prs
 add  sp, 2
;-758     v(id1);

.compoundass247:
 push word [bp+8]
 call v
 add  sp, 2
;-759     prs(", ");

 push compoundass_5
 call prs
 add  sp, 2
;-760     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-761     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-762 }

;-763 

;-764 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-765     gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-766     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1248
;-767         prs("\n mov bx, ");

 push dovar1_0
 call prs
 add  sp, 2
;-768         v(id1); prs("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call prs
 add  sp, 2
;-769         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-770         if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1249
 push dovar1_2
 call prs
 add  sp, 2
;-771         if(widthi == 2) prs(" ax, [bx]");

.dovar1249:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1250
 push dovar1_3
 call prs
 add  sp, 2
;-772         return;

.dovar1250:
 jmp .retndovar1
;-773         }

;-774     if (mode==2){// & = adr

.dovar1248:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1251
;-775         prs("\n ");

 push dovar1_4
 call prs
 add  sp, 2
;-776         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-777         prs(" ax, ");

 push dovar1_5
 call prs
 add  sp, 2
;-778         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-779         return;

 jmp .retndovar1
;-780         }

;-781     if (ixarr) {//array

.dovar1251:
 mov ax, [bp+8]
 or  al, al
 je .dovar1252
;-782         prs("\n mov bx, ");

 push dovar1_6
 call prs
 add  sp, 2
;-783         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-784         if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1253
 push dovar1_7
 call prs
 add  sp, 2
;-785         prs("\n ");

.dovar1253:
 push dovar1_8
 call prs
 add  sp, 2
;-786         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-787         if (wi==2) prs(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_9
 call prs
 add  sp, 2
;-788             else prs(" al, ");

 jmp .dovar1255
.dovar1254:
 push dovar1_10
 call prs
 add  sp, 2
;-789         prc('[');

.dovar1255:
 push 91
 call prc
 add  sp, 2
;-790         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-791         prs(" + bx]");

 push dovar1_11
 call prs
 add  sp, 2
;-792         return;

 jmp .retndovar1
;-793         }

;-794     prs("\n ");

.dovar1252:
 push dovar1_12
 call prs
 add  sp, 2
;-795     prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-796     if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1256
 push dovar1_13
 call prs
 add  sp, 2
;-797     if(wi==2) prs(" ax, ");

.dovar1256:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1257
 push dovar1_14
 call prs
 add  sp, 2
;-798     if(wi==4) prs(" eax, ");

.dovar1257:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1258
 push dovar1_15
 call prs
 add  sp, 2
;-799     v(id1);

.dovar1258:
 push word [bp+10]
 call v
 add  sp, 2
;-800 }

;-801 

;-802 int rterm(char *op) {

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
;-803     int mode; int opint; int ixarr; int id1;

;-804     if (istoken(T_CONST)) {
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm259
;-805         prs("\n ");

 push rterm_0
 call prs
 add  sp, 2
;-806         prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-807         if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm260
 push rterm_1
 call prs
 add  sp, 2
;-808         if (wi==2) prs(" ax, ");

.rterm260:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm261
 push rterm_2
 call prs
 add  sp, 2
;-809         if (wi==4) prs(" eax, ");

.rterm261:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm262
 push rterm_3
 call prs
 add  sp, 2
;-810         prunsign1(lexval);

.rterm262:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-811         return;

 jmp .retnrterm
;-812         }

;-813     mode=typeName();

.rterm259:
 call typeName
 mov [bp-2], ax
;-814     id1=searchname();

 call searchname
 mov [bp-8], ax
;-815     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-816     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm263
;-817         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-818         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-819         expect(']');

 push 93
 call expect
 add  sp, 2
;-820         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-821         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm264
 push rterm_4
 call error1
 add  sp, 2
;-822         }

.rterm264:
;-823     if (eqstr(symbol,"ax")) return;

.rterm263:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm265
 jmp .retnrterm
;-824     opint=op;

.rterm265:
 mov ax, [bp+4]
 mov [bp-4], ax
;-825     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-826 }

;-827 

;-828 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-829     gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-830     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign266
;-831         prs("\n mov  bx, ");

 push doassign_0
 call prs
 add  sp, 2
;-832         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-833         if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign267
 push doassign_1
 call prs
 add  sp, 2
;-834             else  prs("\n mov  [bx], al");

 jmp .doassign268
.doassign267:
 push doassign_2
 call prs
 add  sp, 2
;-835         return;

.doassign268:
 jmp .retndoassign
;-836         }

;-837     if (mode==2) {// & = adr

.doassign266:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign269
;-838         prs("\n mov  ");

 push doassign_3
 call prs
 add  sp, 2
;-839         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-840         prs(", ax");

 push doassign_4
 call prs
 add  sp, 2
;-841         return;

 jmp .retndoassign
;-842         }

;-843     if (ixarr) {

.doassign269:
 mov ax, [bp+8]
 or  al, al
 je .doassign270
;-844         prs("\n mov bx, ");

 push doassign_5
 call prs
 add  sp, 2
;-845         if(ixconst) prunsign1(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign271
 push word [bp+8]
 call prunsign1
 add  sp, 2
;-846             else v(ixarr);

 jmp .doassign272
.doassign271:
 push word [bp+8]
 call v
 add  sp, 2
;-847         if (wi==2) prs("\n shl bx, 1");

.doassign272:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign273
 push doassign_6
 call prs
 add  sp, 2
;-848         prs("\n mov [");

.doassign273:
 push doassign_7
 call prs
 add  sp, 2
;-849         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-850         if (wi==2) prs("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign274
 push doassign_8
 call prs
 add  sp, 2
;-851             else prs("+bx], al");

 jmp .doassign275
.doassign274:
 push doassign_9
 call prs
 add  sp, 2
;-852         return;

.doassign275:
 jmp .retndoassign
;-853         }

;-854     if (wi==1){

.doassign270:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign276
;-855         prs("\n mov ");

 push doassign_10
 call prs
 add  sp, 2
;-856         if(i<LSTART) prs("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign277
 push doassign_11
 call prs
 add  sp, 2
;-857         v(i);

.doassign277:
 push word [bp+6]
 call v
 add  sp, 2
;-858         prs(", al");

 push doassign_12
 call prs
 add  sp, 2
;-859         return;

 jmp .retndoassign
;-860         }

;-861     if (wi==2){

.doassign276:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign278
;-862         prs("\n mov ");

 push doassign_13
 call prs
 add  sp, 2
;-863         if(i<LSTART) prs("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign279
 push doassign_14
 call prs
 add  sp, 2
;-864         v(i);

.doassign279:
 push word [bp+6]
 call v
 add  sp, 2
;-865         prs(", ax");

 push doassign_15
 call prs
 add  sp, 2
;-866         return;

 jmp .retndoassign
;-867         }

;-868     if (wi==4){

.doassign278:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign280
;-869         prs("\n mov ");

 push doassign_16
 call prs
 add  sp, 2
;-870         if(i<LSTART) prs("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign281
 push doassign_17
 call prs
 add  sp, 2
;-871         v(i);

.doassign281:
 push word [bp+6]
 call v
 add  sp, 2
;-872         prs(", eax");

 push doassign_18
 call prs
 add  sp, 2
;-873         return;

 jmp .retndoassign
;-874         }

;-875 }

.doassign280:
;-876 

;-877 int domul(int ids) {

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
;-878     if (ids) rterm("imul");
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul282
 push domul_0
 call rterm
 add  sp, 2
;-879         else {

 jmp .domul283
.domul282:
;-880         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul284
;-881             prs("\n mov bx, ");

 push domul_1
 call prs
 add  sp, 2
;-882             prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-883             prs("\n mul bx");

 push domul_2
 call prs
 add  sp, 2
;-884             }

;-885         else error1("with MUL only const number as multiplicator allowed");

 jmp .domul285
.domul284:
 push domul_3
 call error1
 add  sp, 2
;-886         }

.domul285:
;-887 }

.domul283:
;-888 

;-889 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC
;-890     int mode; int id1;

;-891     if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv286
;-892         prs("\n mov bx, ");

 push doidiv_0
 call prs
 add  sp, 2
;-893         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-894         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv287
 push doidiv_1
 call prs
 add  sp, 2
;-895             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv288
.doidiv287:
 push doidiv_2
 call prs
 add  sp, 2
;-896         }

.doidiv288:
;-897     else {

 jmp .doidiv289
.doidiv286:
;-898         mode=typeName();

 call typeName
 mov [bp-2], ax
;-899         id1=searchname();

 call searchname
 mov [bp-4], ax
;-900         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv290
 push doidiv_3
 call error1
 add  sp, 2
;-901         gettypes(id1);

.doidiv290:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-902         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv291
 push doidiv_4
 call error1
 add  sp, 2
;-903         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv291:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv292
 push doidiv_5
 call error1
 add  sp, 2
;-904         prs("\n mov bx, ");

.doidiv292:
 push doidiv_6
 call prs
 add  sp, 2
;-905         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-906         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv293
 push doidiv_7
 call prs
 add  sp, 2
;-907             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv294
.doidiv293:
 push doidiv_8
 call prs
 add  sp, 2
;-908     }

.doidiv294:
;-909 }

.doidiv289:
;-910 

;-911 int domod(int ids) {

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
;-912     doidiv(ids);
;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-913     prs("\n mov ax, dx");

 push domod_0
 call prs
 add  sp, 2
;-914 }

;-915 

;-916 

;-917 int docalltype[10]; int docallvalue[10];

 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 41742
docalltype resw 10
section .text
section .bss
absolute 41762
docallvalue resw 10
section .text
;-918 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 41782
procname resb 17
section .text
;-919 

;-920 int docall1() {


docall1: PROC
;-921     int i; int narg; int t0; int n0;  int sz32;

;-922     narg=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-923     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-924     checknamelen();

 call checknamelen
;-925     strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-926     expect('(');

 push 40
 call expect
 add  sp, 2
;-927 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1295
;-928 	    do {

.docall1296:
;-929 	        narg++;

 inc  word[bp-4]
;-930 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1297
 push docall1_0
 call error1
 add  sp, 2
;-931 	        t0=0;

.docall1297:
 mov ax, 0
 mov [bp-6], ax
;-932             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1298
;-933                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-934                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-935                 }

;-936             if(istoken(T_STRING)){

.docall1298:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1299
;-937                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-938                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-939                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-940                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-941                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-942                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-943                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-944                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-945                 eprs(symbol);

 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
;-946                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-947                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-948                 nconst++;

 inc  word[nconst]
;-949                 }

;-950             if(istoken('&'))     {

.docall1299:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1300
;-951                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-952                 name1();

 call name1
;-953                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-954                 }

;-955             if(istoken(T_NAME))  {

.docall1300:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1301
;-956                 n0=checkreg();

 call checkreg
 mov [bp-8], ax
;-957                 if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1302
 mov ax, 5
 mov [bp-6], ax
;-958                 else {

 jmp .docall1303
.docall1302:
;-959                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-960                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-961                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-962                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-963                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1304
 mov ax, 3
 mov [bp-6], ax
;-964                     }

.docall1304:
;-965                 }

.docall1303:
;-966             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1301:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1305
 push docall1_4
 call error1
 add  sp, 2
;-967             docalltype [narg] = t0;

.docall1305:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-968             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-969         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1306
 jmp .docall1296
.docall1306:
;-970 

;-971   	expect(')');

 push 41
 call expect
 add  sp, 2
;-972   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-973     do {

.docall1307:
;-974         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-975         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-976         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1308
;-977             prs("\n push ");

 push docall1_5
 call prs
 add  sp, 2
;-978             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-979             }

;-980         if(t0==2){

.docall1308:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1309
;-981             prs("\n push ");

 push docall1_6
 call prs
 add  sp, 2
;-982             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-983             prc(95);

 push 95
 call prc
 add  sp, 2
;-984             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-985             }

;-986         if(t0==3){

.docall1309:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1310
;-987             prs("\n lea  ax, ");

 push docall1_7
 call prs
 add  sp, 2
;-988             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-989             prs("\n push ax");

 push docall1_8
 call prs
 add  sp, 2
;-990             }

;-991         if(t0==4){

.docall1310:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1311
;-992             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-993             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1312
;-994                 prs("\n push word ");

 push docall1_9
 call prs
 add  sp, 2
;-995                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-996                 }

;-997             else {

 jmp .docall1313
.docall1312:
;-998                 prs("\n mov al, byte ");

 push docall1_10
 call prs
 add  sp, 2
;-999                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1000                 prs("\n mov ah, 0\n push ax");

 push docall1_11
 call prs
 add  sp, 2
;-1001                 }

;-1002             }

.docall1313:
;-1003         if(t0==5){

.docall1311:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1314
;-1004             prs("\n push ");

 push docall1_12
 call prs
 add  sp, 2
;-1005             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1006             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1315
 mov ax, [bp-10]
 add ax, 2
;-1007             }

.docall1315:
;-1008         i--;

.docall1314:
 dec  word[bp-2]
;-1009         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1316
 jmp .docall1307
.docall1316:
;-1010     }

;-1011 	prs("\n call ");

.docall1295:
 push docall1_13
 call prs
 add  sp, 2
;-1012 	prs(&procname);

 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2
;-1013 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1317
;-1014 	    prs("\n add  sp, ");

 push docall1_14
 call prs
 add  sp, 2
;-1015         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1016         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1017         prunsign1(narg);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1018         }

;-1019 }

.docall1317:
;-1020 

;-1021 

;-1022 int expr() {

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
;-1023     int mode;   int id1;

;-1024     int ixarr;  int ixconst;

;-1025     int ids;    int isCONST;

;-1026     int i;      unsigned char *p;

;-1027 

;-1028     if (istoken(T_CONST)) {// constant ;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr318
;-1029         prs("\n mov ax, ");

 push expr_0
 call prs
 add  sp, 2
;-1030         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1031         return 4;

 mov ax, 4
 jmp .retnexpr
;-1032         }

;-1033     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr318:
 call typeName
 mov [bp-2], ax
;-1034     ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1035     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr319
;-1036         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1037         return;

 jmp .retnexpr
;-1038         }

;-1039     if (token=='(')  {

.expr319:
 mov ax, [token]
 cmp ax, 40
 jne .expr320
;-1040         docall1();

 call docall1
;-1041         goto e1;

 jmp .e1
;-1042         }

;-1043 

;-1044     id1=searchname();

.expr320:
 call searchname
 mov [bp-4], ax
;-1045     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1046     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1047     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1048     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1049     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr321
;-1050         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr322
;-1051             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1052             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1053             expect(']');

 push 93
 call expect
 add  sp, 2
;-1054             }

;-1055         else {

 jmp .expr323
.expr322:
;-1056             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1057             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1058             expect(']');

 push 93
 call expect
 add  sp, 2
;-1059             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1060             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr324
 push expr_1
 call error1
 add  sp, 2
;-1061             }

.expr324:
;-1062         }

.expr323:
;-1063     if (istoken(T_PLUSPLUS  )) {

.expr321:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr325
;-1064         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr326
 push expr_2
 call error1
 add  sp, 2
;-1065         prs("\n inc  ");

.expr326:
 push expr_3
 call prs
 add  sp, 2
;-1066         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr327
 push expr_4
 call prs
 add  sp, 2
 jmp .expr328
.expr327:
 push expr_5
 call prs
 add  sp, 2
;-1067         v(id1);

.expr328:
 push word [bp-4]
 call v
 add  sp, 2
;-1068         goto e1;

 jmp .e1
;-1069         }

;-1070     if (istoken(T_MINUSMINUS)) {

.expr325:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr329
;-1071         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr330
 push expr_6
 call error1
 add  sp, 2
;-1072         prs("\n dec  ");

.expr330:
 push expr_7
 call prs
 add  sp, 2
;-1073         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr331
 push expr_8
 call prs
 add  sp, 2
 jmp .expr332
.expr331:
 push expr_9
 call prs
 add  sp, 2
;-1074         v(id1);

.expr332:
 push word [bp-4]
 call v
 add  sp, 2
;-1075         goto e1;

 jmp .e1
;-1076         }

;-1077 

;-1078     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

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
;-1079     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

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
;-1080     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

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
;-1081     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

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
;-1082     if (istoken(T_MULASS  )) error1("not implemented");

.expr336:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push expr_14
 call error1
 add  sp, 2
;-1083     if (istoken(T_DIVASS  )) error1("not implemented");

.expr337:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
 push expr_15
 call error1
 add  sp, 2
;-1084 

;-1085     if (istoken('=')) {

.expr338:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
;-1086         expr();

 call expr
;-1087         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1088         goto e1;

 jmp .e1
;-1089         }

;-1090     dovar1(mode, "mov", ixarr, id1);

.expr339:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1091 

;-1092 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
 push expr_17
 call rterm
 add  sp, 2
;-1093     else if (istoken('-')) rterm("sub");

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
;-1094     else if (istoken('&')) rterm("and");

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
;-1095     else if (istoken('|')) rterm("or" );

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
;-1096     else if (istoken(T_LESSLESS)) rterm("shl");

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
;-1097     else if (istoken(T_GREATGREAT)) rterm("shr");

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
;-1098     else if (istoken('*')) domul (ids);

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
;-1099     else if (istoken('/')) doidiv(ids);

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
;-1100     else if (istoken('%')) domod (ids);

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
;-1101     if (isrelational()) {

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
;-1102         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1103         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1104         }

;-1105     return 0;

.expr357:
 mov ax, 0
 jmp .retnexpr
;-1106 }

;-1107 

;-1108 int pexpr() {//called from if, do, while

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
;-1109     expect('(');

 push 40
 call expect
 add  sp, 2
;-1110     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1111     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr358
;-1112         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1113         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr359
;-1114             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1115             return;

 jmp .retnpexpr
;-1116             }

;-1117         }

.pexpr359:
;-1118     expr();

.pexpr358:
 call expr
;-1119     if (iscmp==0) prs("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr360
 push pexpr_0
 call prs
 add  sp, 2
;-1120     prs(fname);

.pexpr360:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1121     expect(')');

 push 41
 call expect
 add  sp, 2
;-1122 }

;-1123 

;-1124 

;-1125 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1126     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
;-1127     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1128     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1129     prc(':');

 push 58
 call prc
 add  sp, 2
;-1130 }

;-1131 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1132     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
;-1133     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1134     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1135 }

;-1136 

;-1137 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1138     int c; char cha;

;-1139     int jdest; int tst; int jtemp;

;-1140     if(istoken('{')) {
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt361
;-1141         while(istoken('}')==0) stmt();

.stmt362:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt363
 call stmt
;-1142         }

 jmp .stmt362
.stmt363:
;-1143     else if(istoken(T_IF)) {

 jmp .stmt364
.stmt361:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt365
;-1144         pexpr();

 call pexpr
;-1145         nlabel++;

 inc  word[nlabel]
;-1146         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1147         pint1(jdest);

 push word [bp-6]
 call pint1
 add  sp, 2
;-1148         stmt();

 call stmt
;-1149         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt366
;-1150             nlabel++;

 inc  word[nlabel]
;-1151             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1152             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1153             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1154             stmt();

 call stmt
;-1155             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1156         }

;-1157         else prlabel(jdest);

 jmp .stmt367
.stmt366:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1158     }

.stmt367:
;-1159     else if(istoken(T_DO)) {

 jmp .stmt368
.stmt365:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt369
;-1160         nlabel++;

 inc  word[nlabel]
;-1161         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1162         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1163         stmt();

 call stmt
;-1164         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1165         pexpr();

 call pexpr
;-1166         nlabel++;

 inc  word[nlabel]
;-1167         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1168         pint1(jtemp);

 push word [bp-10]
 call pint1
 add  sp, 2
;-1169         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1170          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1171     }

;-1172     else if(istoken(T_WHILE)) {

 jmp .stmt370
.stmt369:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt371
;-1173         nlabel++;

 inc  word[nlabel]
;-1174         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1175         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1176         pexpr();

 call pexpr
;-1177         nlabel++;

 inc  word[nlabel]
;-1178         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1179         pint1(tst);

 push word [bp-8]
 call pint1
 add  sp, 2
;-1180         stmt();

 call stmt
;-1181         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1182         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1183     }

;-1184     else if(istoken(T_GOTO))  {

 jmp .stmt372
.stmt371:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt373
;-1185         prs("\n jmp .");

 push stmt_0
 call prs
 add  sp, 2
;-1186         name1();

 call name1
;-1187         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1188         expect(';');

 push 59
 call expect
 add  sp, 2
;-1189     }

;-1190     else if(token==T_ASM)     {

 jmp .stmt374
.stmt373:
 mov ax, [token]
 cmp ax, 518
 jne .stmt375
;-1191       prs("\n");

 push stmt_1
 call prs
 add  sp, 2
;-1192       c=next();

 call next
 mov [bp-2], ax
;-1193       while(c != '\n') {

.stmt376:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt377
;-1194         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1195         c=next();

 call next
 mov [bp-2], ax
;-1196         };

 jmp .stmt376
.stmt377:
;-1197         token=getlex();

 call getlex
 mov word [token], ax
;-1198     }

;-1199     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt378
.stmt375:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt379
;-1200         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt380
;-1201             prs("\n"); cha=next();

 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al
;-1202             while(cha!= '}') {

.stmt381:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt382
;-1203                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-1204                 cha=next();

 call next
 mov [bp-4], al
;-1205             }

;-1206             token=getlex();

 jmp .stmt381
.stmt382:
 call getlex
 mov word [token], ax
;-1207         } else error1("Curly open expected");

 jmp .stmt383
.stmt380:
 push stmt_3
 call error1
 add  sp, 2
;-1208     }

.stmt383:
;-1209     else if(istoken(T_EMIT)) {

 jmp .stmt384
.stmt379:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt385
;-1210       prs("\n db ");

 push stmt_4
 call prs
 add  sp, 2
;-1211     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1212       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1213       token=getlex();

 call getlex
 mov word [token], ax
;-1214       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt386
;-1215           prc(',');

 push 44
 call prc
 add  sp, 2
;-1216           goto L1;

 jmp .L1
;-1217       }

;-1218       expect(')');

.stmt386:
 push 41
 call expect
 add  sp, 2
;-1219     }

;-1220     else if(istoken(';'))      { }

 jmp .stmt387
.stmt385:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt388
;-1221     else if(istoken(T_RETURN)) {

 jmp .stmt389
.stmt388:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt390
;-1222         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt391
 call expr
;-1223         prs("\n jmp .retn");

.stmt391:
 push stmt_5
 call prs
 add  sp, 2
;-1224         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1225         nreturn++;

 inc  word[nreturn]
;-1226         expect(';');

 push 59
 call expect
 add  sp, 2
;-1227     }

;-1228     else if(thechar==':')      {

 jmp .stmt392
.stmt390:
 mov al, [thechar]
 cmp al, 58
 jne .stmt393
;-1229         prs("\n."); // Label

 push stmt_6
 call prs
 add  sp, 2
;-1230         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1231         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1232         expect(':');

 push 58
 call expect
 add  sp, 2
;-1233     }

;-1234     else  {expr();; expect(';'); }

 jmp .stmt394
.stmt393:
 call expr
 push 59
 call expect
 add  sp, 2
;-1235 }

.stmt394:
.stmt392:
.stmt389:
.stmt387:
.stmt384:
.stmt378:
.stmt374:
.stmt372:
.stmt370:
.stmt368:
.stmt364:
;-1236 

;-1237 int isvariable() {

 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n db ",0
stmt_5 db "\n jmp .retn",0
stmt_6 db "\n.",0
ENDP

isvariable: PROC
;-1238     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable395
 jmp .v1
;-1239     if(token==T_UNSIGNED) goto v1;

.isvariable395:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable396
 jmp .v1
;-1240     if(token==T_CHAR)     goto v1;

.isvariable396:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable397
 jmp .v1
;-1241     if(token==T_INT)      goto v1;

.isvariable397:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable398
 jmp .v1
;-1242     if(token==T_LONG)     goto v1;

.isvariable398:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable399
 jmp .v1
;-1243     return 0;

.isvariable399:
 mov ax, 0
 jmp .retnisvariable
;-1244 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1245 }

;-1246 

;-1247 int dofunc() {

 .retnisvariable:
 ret
ENDP

dofunc: PROC
;-1248     int nloc; int i; unsigned int j;int narg;

;-1249     cloc=&co;
;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1250     checknamelen();

 call checknamelen
;-1251     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1252     i=0;

 mov ax, 0
 mov [bp-4], ax
;-1253     while (i < FTop) {

.dofunc400:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc401
;-1254         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax
;-1255         if(eqstr(symbol, j)) error1("Function already defined");

 push word [bp-6]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dofunc402
 push dofunc_0
 call error1
 add  sp, 2
;-1256         i++;

.dofunc402:
 inc  word[bp-4]
;-1257     }

;-1258     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc400
.dofunc401:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc403
 push dofunc_1
 call error1
 add  sp, 2
;-1259     pt=adrF(FNameField, FTop);

.dofunc403:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1260     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1261     FTop++;

 inc  word[FTop]
;-1262     prs("\n\n");

 push dofunc_2
 call prs
 add  sp, 2
;-1263     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1264     prs(": PROC");

 push dofunc_3
 call prs
 add  sp, 2
;-1265     expect('(');

 push 40
 call expect
 add  sp, 2
;-1266     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1267     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc404
;-1268         narg=2;

 mov ax, 2
 mov [bp-8], ax
;-1269         do {

.dofunc405:
;-1270             typeName();

 call typeName
;-1271             addlocal();

 call addlocal
;-1272             narg+=2;

 add  word[bp-8], 2
;-1273             GData[LTop]=narg;

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1274             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc406
 add  word[bp-8], 2
;-1275                 LTop++;

.dofunc406:
 inc  word[LTop]
;-1276                 }

;-1277         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc407
 jmp .dofunc405
.dofunc407:
;-1278         expect(')');

 push 41
 call expect
 add  sp, 2
;-1279         }

;-1280 

;-1281     expect('{'); /*body*/

.dofunc404:
 push 123
 call expect
 add  sp, 2
;-1282     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1283     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1284     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1285     while(isvariable()) {

.dofunc408:
 call isvariable
 or  al, al
 je .dofunc409
;-1286         do {

.dofunc410:
;-1287             typeName();

 call typeName
;-1288             checknamelen();

 call checknamelen
;-1289             addlocal();

 call addlocal
;-1290             nloc-=2;

 sub  word[bp-2], 2
;-1291             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc411
 sub  word[bp-2], 2
;-1292             GData[LTop]=nloc;

.dofunc411:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1293             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc412
;-1294                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1295                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1296                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1297                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1298                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1299                 nloc+=2;

 add  word[bp-2], 2
;-1300                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1301             }

;-1302             LTop++;

.dofunc412:
 inc  word[LTop]
;-1303         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc413
 jmp .dofunc410
.dofunc413:
;-1304         expect(';');

 push 59
 call expect
 add  sp, 2
;-1305     }

;-1306     if (LTop>LSTART){

 jmp .dofunc408
.dofunc409:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc414
;-1307         prs(";\n ENTER  ");

 push dofunc_4
 call prs
 add  sp, 2
;-1308         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1309         prunsign1 (nloc);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1310         prs(",0");

 push dofunc_5
 call prs
 add  sp, 2
;-1311         }

;-1312 

;-1313     while(istoken('}')==0)  stmt();

.dofunc414:
.dofunc415:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc416
 call stmt
;-1314 

;-1315     if (nreturn) {

 jmp .dofunc415
.dofunc416:
 mov ax, [nreturn]
 or  al, al
 je .dofunc417
;-1316             prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2
;-1317             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1318             prc(':');

 push 58
 call prc
 add  sp, 2
;-1319         }

;-1320     if (LTop > LSTART) prs("\n LEAVE");

.dofunc417:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc418
 push dofunc_7
 call prs
 add  sp, 2
;-1321     prs("\n ret");

.dofunc418:
 push dofunc_8
 call prs
 add  sp, 2
;-1322     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1323     prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-1324     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1325     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc419
 mov ax, [maxco1]
 mov word [maxco], ax
;-1326     prs("\nENDP");

.dofunc419:
 push dofunc_9
 call prs
 add  sp, 2
;-1327 }

;-1328 

;-1329 char doglobName[IDLENMAX];

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
absolute 41799
doglobName resb 15
section .text
;-1330 int doglob() {


doglob: PROC
;-1331     int i; int j; int isstrarr;

;-1332     isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1333     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .doglob420
 push doglob_0
 call error1
 add  sp, 2
;-1334     if (iswidth == 0) error1("no VOID as var type");

.doglob420:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob421
 push doglob_1
 call error1
 add  sp, 2
;-1335     checknamelen();

.doglob421:
 call checknamelen
;-1336     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob422
 push doglob_2
 call error1
 add  sp, 2
;-1337     if (istoken('[')) {

.doglob422:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob423
;-1338         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1339         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob424
;-1340             prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2
;-1341             prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2
;-1342             prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1343             if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob425
 push doglob_5
 call prs
 add  sp, 2
;-1344             if (iswidth==2) prs(" resw ");

.doglob425:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob426
 push doglob_6
 call prs
 add  sp, 2
;-1345             if (iswidth==4) prs(" resd ");

.doglob426:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob427
 push doglob_7
 call prs
 add  sp, 2
;-1346             prunsign1(lexval);

.doglob427:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-1347             prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2
;-1348             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1349             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob428
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1350             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob428:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob429
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax
;-1351             GData[GTop]=lexval;

.doglob429:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1352             expect(']');

 push 93
 call expect
 add  sp, 2
;-1353         }else {

 jmp .doglob430
.doglob424:
;-1354             expect(']');

 push 93
 call expect
 add  sp, 2
;-1355             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob431
 push doglob_9
 call error1
 add  sp, 2
;-1356             prs("\n");

.doglob431:
 push doglob_10
 call prs
 add  sp, 2
;-1357             prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1358             prs(" db ");

 push doglob_11
 call prs
 add  sp, 2
;-1359             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1360             strcpy(doglobName, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1361             expect('=');

 push 61
 call expect
 add  sp, 2
;-1362             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob432
;-1363                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1364                 prscomment(symbol);

 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
;-1365                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1366                 prs(",0");

 push doglob_12
 call prs
 add  sp, 2
;-1367                 i=strlen(symbol);

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1368                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1369                 }

;-1370             else if (istoken('{' )) {

 jmp .doglob433
.doglob432:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob434
;-1371                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1372                 do {

.doglob435:
;-1373                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob436
 push 44
 call prc
 add  sp, 2
;-1374                     expect(T_CONST);

.doglob436:
 push 257
 call expect
 add  sp, 2
;-1375                     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1376                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1377                     }

;-1378                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob437
 jmp .doglob435
.doglob437:
;-1379                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1380             }

;-1381         else error1("String or number array expected");

 jmp .doglob438
.doglob434:
 push doglob_13
 call error1
 add  sp, 2
;-1382         };

.doglob438:
.doglob433:
.doglob430:
;-1383     }else { //expect('=');

 jmp .doglob439
.doglob423:
;-1384         prs("\n");

 push doglob_14
 call prs
 add  sp, 2
;-1385         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1386         if (istype=='*') prs(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob440
 push doglob_15
 call prs
 add  sp, 2
;-1387         else {

 jmp .doglob441
.doglob440:
;-1388             if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob442
 push doglob_16
 call prs
 add  sp, 2
;-1389             else if (iswidth==2) prs(" dw ");

 jmp .doglob443
.doglob442:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob444
 push doglob_17
 call prs
 add  sp, 2
;-1390             else                 prs(" dd ");

 jmp .doglob445
.doglob444:
 push doglob_18
 call prs
 add  sp, 2
;-1391         }

.doglob445:
.doglob443:
;-1392     if(istoken('-')) prc('-');

.doglob441:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob446
 push 45
 call prc
 add  sp, 2
;-1393     if (istoken('=')) {

.doglob446:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob447
;-1394         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1395         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1396         }else prunsign1(0);

 jmp .doglob448
.doglob447:
 push 0
 call prunsign1
 add  sp, 2
;-1397     }

.doglob448:
;-1398     GSign[GTop]=issign;

.doglob439:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1399     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1400     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1401     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1402     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob449
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1403         else strcpy(pt, symbol);

 jmp .doglob450
.doglob449:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1404     GTop++;

.doglob450:
 inc  word[GTop]
;-1405     expect(';');

 push 59
 call expect
 add  sp, 2
;-1406 }

;-1407 

;-1408 int dodefine() {

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
;-1409     int i; int j; int fdtemp;

;-1410     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine451
;-1411         token=getlex();

 call getlex
 mov word [token], ax
;-1412         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1413         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1414         return;

 jmp .retndodefine
;-1415     }

;-1416     expect(T_NAME);

.dodefine451:
 push 256
 call expect
 add  sp, 2
;-1417     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine452
;-1418         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine453
 push dodefine_1
 call error1
 add  sp, 2
;-1419         i=strlen(symbol);

.dodefine453:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1420         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine454
 push dodefine_2
 call error1
 add  sp, 2
;-1421         GSign [GTop]='U';

.dodefine454:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1422         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1423         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1424         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1425         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1426         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1427         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1428         GTop++;

 inc  word[GTop]
;-1429     }

;-1430 }

.dodefine452:
;-1431 

;-1432 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC
;-1433     token=getlex();

 call getlex
 mov word [token], ax
;-1434     do {

.parse455:
;-1435         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse456
 mov ax, 1
 jmp .retnparse
;-1436         if (istoken('#')) {

.parse456:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse457
;-1437              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse458
 call dodefine
;-1438              else error1("define expected");

 jmp .parse459
.parse458:
 push parse_0
 call error1
 add  sp, 2
;-1439         }

.parse459:
;-1440     else{

 jmp .parse460
.parse457:
;-1441         typeName();

 call typeName
;-1442         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse461
 call dofunc
;-1443         else doglob(); }

 jmp .parse462
.parse461:
 call doglob
.parse462:
;-1444     } while(1);

.parse460:
 mov ax, 1
 or  al, al
 je .parse463
 jmp .parse455
.parse463:
;-1445 }

;-1446 

;-1447 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1448 int main() {


main: PROC
;-1449     int arglen1; unsigned int i; char *c;

;-1450     isPrint=1;
;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1451     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1452     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main464
;-1453         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1454         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1455         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1456         }

;-1457     i=arglen1+129;

.main464:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1458     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1459     arglen1--;

 dec  word[bp-2]
;-1460     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1461     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1462     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main465
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4
;-1463     strcpy(namelst, namein);

.main465:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1464     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1465     i--;

 dec  word[bp-4]
;-1466     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1467     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1468 

;-1469     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1470     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main466
;-1471         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1472         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1473         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1474         }

;-1475     fdout=creatR(namelst);

.main466:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1476     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main467
;-1477         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1478         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1479         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1480         }

;-1481     prs(";");

.main467:
 push main_4
 call prs
 add  sp, 2
;-1482     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2
;-1483     prs(", Input: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
;-1484     prs(", Output: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2
;-1485     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1486     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2
;-1487     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1488     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1489     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1490     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1491     parse();

 call parse
;-1492     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1493     prs("\n;Glob. variables:"); GTop--; prunsign1(GTop);

 push main_8
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call prunsign1
 add  sp, 2
;-1494     prs(" ("); prunsign1(LSTART);

 push main_9
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1495     prs("), Functions:"); prunsign1(FTop);

 push main_10
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2
;-1496     prs(" ("); prunsign1(FUNCMAX);

 push main_11
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1497     prs("), Lines:"); prunsign1(lineno);

 push main_12
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2
;-1498     prs("\n;Constant: ");   prunsign1(maxco);

 push main_13
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2
;-1499     prs(" ("); prunsign1(COMAX);

 push main_14
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2
;-1500     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1501     if (i <= 1000)prs("\n *** Warning *** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main468
 push main_15
 call prs
 add  sp, 2
;-1502     prs("), stacksize: ");

.main468:
 push main_16
 call prs
 add  sp, 2
;-1503     i=65636; i=i-orgData;

 mov ax, 100
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1504     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1505     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main469
 push main_17
 call prs
 add  sp, 2
;-1506     end1(0);

.main469:
 push 0
 call end1
 add  sp, 2
;-1507 }

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
main_15 db "\n *** Warning *** constant area too small",0
main_16 db "), stacksize: ",0
main_17 db "\n *** Warning *** Stack too small",0
ENDP
;Glob. variables:100 (300), Functions:71 (300), Lines:1508
;Constant: 688 (3000), stacksize: 23822