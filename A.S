
; A.COM V0.9.3, Source: A.C, Output asm: A.S
org  256 
jmp main

;-1 char Version1[]="A.COM V0.9.3";//todo: 2. op=reg not recognized

Version1 db "A.COM V0.9.3",0

;-2 #define IDLENMAX       15//max length of names


;-3 #define COLUMNMAX     128//output, input is 80


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


;-38 unsigned int ORGDATAORIG=25000;//start of arrays

ORGDATAORIG dw 25000

;-39 unsigned int orgData;//actual max of array, must be less than stack

orgData dw 0

;-40 #define COMAX        3000


;-41 char co[COMAX];//constant storage

section .bss
absolute 25000
co resb 3000
section .text

;-42 int maxco=0;

maxco dw 0

;-43 int maxco1=0;

maxco1 dw 0

;-44 #define CMDLENMAX      67


;-45 char coname[CMDLENMAX];

section .bss
absolute 28000
coname resb 67
section .text

;-46 char symbol[COLUMNMAX];

section .bss
absolute 28067
symbol resb 128
section .text

;-47 char fname[CMDLENMAX];

section .bss
absolute 28195
fname resb 67
section .text

;-48 char namein[CMDLENMAX];

section .bss
absolute 28262
namein resb 67
section .text

;-49 char namelst[CMDLENMAX];

section .bss
absolute 28329
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

;-59 int nlabel=0;

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

;-65 #define VARMAX        300//max global and local var


;-66 #define LSTART        200//max global var


;-67 #define GNAMEMAX     4800// 16*VARMAX


;-68 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 28396
GType resb 300
section .text

;-69 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 28696
GSign resb 300
section .text

;-70 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 28996
GWidth resb 300
section .text

;-71 int GAdr  [VARMAX];

section .bss
absolute 29296
GAdr resw 300
section .text

;-72 int GUsed [VARMAX];

section .bss
absolute 29896
GUsed resw 300
section .text

;-73 int GData [VARMAX];

section .bss
absolute 30496
GData resw 300
section .text

;-74 char GNameField[GNAMEMAX];

section .bss
absolute 31096
GNameField resb 4800
section .text

;-75 int GTop=1;

GTop dw 1

;-76 int LTop=LSTART;

LTop dw 200

;-77 #define FUNCMAX       300//max functions


;-78 #define FNAMEMAX     4800// 16*FUNCMAX


;-79 char FType [FUNCMAX];

section .bss
absolute 35896
FType resb 300
section .text

;-80 int  FAdr  [FUNCMAX];

section .bss
absolute 36196
FAdr resw 300
section .text

;-81 int  FCalls[FUNCMAX];

section .bss
absolute 36796
FCalls resw 300
section .text

;-82 char FNameField[FNAMEMAX];

section .bss
absolute 37396
FNameField resb 4800
section .text

;-83 int  FTop=0;

FTop dw 0

;-84 char fgetsdest[COLUMNMAX];

section .bss
absolute 42196
fgetsdest resb 128
section .text

;-85 unsigned char *fgetsp=0;

fgetsp dw 0

;-86 unsigned int lineno=1;

lineno dw 1

;-87 unsigned char *pt=0;

pt dw 0

;-88 unsigned char *p1=0;

p1 dw 0

;-89 int DOS_ERR=0;

DOS_ERR dw 0

;-90 int DOS_NoBytes=0;

DOS_NoBytes dw 0

;-91 char DOS_ByteRead=0;

DOS_ByteRead db 0

;-92 int ireg1;

ireg1 dw 0

;-93 int mod2;

mod2 dw 0

;-94 int ireg2;

ireg2 dw 0

;-95 


;-96 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-97 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }

 ret
ENDP

putch: PROC;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
 mov  al, 13
 call writetty
.putch1:
 mov  al, [bp+4]
 call writetty

;-98 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
ENDP

cputs: PROC;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
 inc  word[bp+4]
 jmp .cputs2
.cputs3:

;-99 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-100 


;-101 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-102     __emit__(0xCD,0x21);//inth 0x21;

 db 205,33

;-103     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-104     DOS_ERR++;

 inc  word[DOS_ERR]

;-105 }


;-106 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-107 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-108 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-109 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-110 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-111     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-112 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC;
 ENTER  0,0
lea dx, [bp+4]

;-113   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-114 


;-115   int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-116       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-117       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-118       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-119       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-120       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-121       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-122       if (c> 'Z') { if (c< 'a') return 0; }

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

;-123       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-124   }


;-125   int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-126       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-127       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-128       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-129   }


;-130   int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-131     if (digit (c)) return 1;
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

;-132     if (letter(c)) return 1;

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

;-133     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-134   }


;-135 


;-136 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-137     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-138     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-139     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-140 }


;-141 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-142     do { *s=*t; s++; t++; }
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

;-143     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-144     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-145     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-146 }


;-147 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-148     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-149         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-150         p++;

.eqstr22:
 inc  word[bp+4]

;-151         q++;

 inc  word[bp+6]

;-152     }


;-153     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-154     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-155 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-156     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-157     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-158 }


;-159 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-160     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-161         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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

;-162         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-163     }


;-164 }

 jmp .toupper26
.toupper27:

;-165 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-166     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-167         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-168         s++;

.instr132:
 inc  word[bp+4]

;-169     }


;-170     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-171 }


;-172 


;-173 int eprc(char c)  {

 .retninstr1: LEAVE
 ret
ENDP

eprc: PROC

;-174     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al

;-175     cloc++;

 inc  word[cloc]

;-176 }


;-177 int eprs(char *s) {
 LEAVE
 ret
ENDP

eprs: PROC

;-178     char c;


;-179     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34

;-180         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-181         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2

;-182         s++;

 inc  word[bp+4]

;-183     }


;-184 }

 jmp .eprs33
.eprs34:

;-185 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-186     if (c==10) {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc35

;-187         _AX=13;

 mov  ax, 13

;-188         writetty();

 call writetty

;-189     }


;-190     _AL=c;

.prc35:
 mov  al, [bp+4]

;-191     writetty();

 call writetty

;-192     fputcR(c, fdout);

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-193 }


;-194 int prscomment(unsigned char *s) {
 LEAVE
 ret
ENDP

prscomment: PROC

;-195     unsigned char c;


;-196     while(*s){
;
 ENTER  2,0
.prscomment36:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment37

;-197         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-198         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-199         s++;

 inc  word[bp+4]

;-200     }


;-201 }

 jmp .prscomment36
.prscomment37:

;-202 int prs(unsigned char *s) {
 LEAVE
 ret
ENDP

prs: PROC

;-203     unsigned char c; int com;


;-204     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-205     while(*s) {

.prs38:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs39

;-206         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-207         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs40
 mov ax, [bp-4]
 or  al, al
 je .prs41
 mov ax, 0
 mov [bp-4], ax

;-208                    else com=1;

 jmp .prs42
.prs41:
 mov ax, 1
 mov [bp-4], ax

;-209         if (c==92) {

.prs42:
.prs40:
 mov al, [bp-2]
 cmp al, 92
 jne .prs43

;-210             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs44

;-211                 s++;

 inc  word[bp+4]

;-212                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-213                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs45
 mov ax, 10
 mov [bp-2], al

;-214                 if (c=='t') c= 9;

.prs45:
 mov al, [bp-2]
 cmp al, 116
 jne .prs46
 mov ax, 9
 mov [bp-2], al

;-215             }

.prs46:

;-216         }

.prs44:

;-217         prc(c);

.prs43:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-218         s++;

 inc  word[bp+4]

;-219     }


;-220 }

 jmp .prs38
.prs39:

;-221 int prnl() {
 LEAVE
 ret
ENDP

prnl: PROC

;-222     prs("\n ");

 push prnl_0
 call prs
 add  sp, 2

;-223 }


;-224 


;-225 


;-226 int eprnum(int n){//for docall1 procedure

 ret
prnl_0 db "\n ",0
ENDP

eprnum: PROC

;-227     int e;


;-228     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum47

;-229         eprc('-');

 push 45
 call eprc
 add  sp, 2

;-230         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-231     }


;-232     if (n >= 10) {

.eprnum47:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum48

;-233         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-234         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2

;-235     }


;-236     n=n%10;

.eprnum48:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-237     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax

;-238     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2

;-239 }


;-240 int pint1 (int n){
 LEAVE
 ret
ENDP

pint1: PROC

;-241     int e;


;-242     if(n<0) {  prc('-');  n=mkneg(n); }
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .pint149
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-243     if (n >= 10) {

.pint149:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint150

;-244         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-245         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2

;-246     }


;-247     n=n%10;

.pint150:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-248     n += '0';

 add  word[bp+4], 48

;-249     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-250 }


;-251 int prunsign1(unsigned int n) {
 LEAVE
 ret
ENDP

prunsign1: PROC

;-252     unsigned int e;


;-253     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign151

;-254         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax

;-255         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-256     }


;-257     n = n % 10; /*unsigned mod*/

.prunsign151:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax

;-258     n += '0';

 add  word[bp+4], 48

;-259     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-260 }


;-261 int printint51(unsigned int j)  {
 LEAVE
 ret
ENDP

printint51: PROC

;-262     if (j<10000) prc(32);
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint5152
 push 32
 call prc
 add  sp, 2

;-263     if (j<1000) prc(32);

.printint5152:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint5153
 push 32
 call prc
 add  sp, 2

;-264     if (j<100) prc(32);

.printint5153:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint5154
 push 32
 call prc
 add  sp, 2

;-265     if (j<10) prc(32);

.printint5154:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint5155
 push 32
 call prc
 add  sp, 2

;-266     prunsign1(j);

.printint5155:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-267 }


;-268 


;-269 int end1(int n) {
 LEAVE
 ret
ENDP

end1: PROC

;-270     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-271     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-272     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-273 }


;-274 


;-275 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-276     lineno--;
;
 ENTER  0,0
 dec  word[lineno]

;-277     prnl();

 call prnl

;-278     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-279     prs(";Line: ");

 push error1_0
 call prs
 add  sp, 2

;-280     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-281     prs(" ************** ERROR: ");

 push error1_1
 call prs
 add  sp, 2

;-282     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-283     prs("  in column: ");

 push error1_2
 call prs
 add  sp, 2

;-284     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-285     prs("\nToken: ");

 push error1_3
 call prs
 add  sp, 2

;-286     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-287     prs(", symbol: ");

 push error1_4
 call prs
 add  sp, 2

;-288     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-289     end1(1);

 push 1
 call end1
 add  sp, 2

;-290 }


;-291 


;-292 int printinputline() {
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP

printinputline: PROC

;-293     int col;


;-294     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-295     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-296     do {

.printinputline56:

;-297         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-298         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline57
 jmp .retnprintinputline

;-299         *fgetsp=DOS_ByteRead;

.printinputline57:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-300         fgetsp++;

 inc  word[fgetsp]

;-301         col++;

 inc  word[bp-2]

;-302         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline58
 push printinputline_0
 call error1
 add  sp, 2

;-303         }

.printinputline58:

;-304         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline59
 jmp .printinputline56
.printinputline59:

;-305     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-306     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline60

;-307         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-308         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-309         prc(' ');

 push 32
 call prc
 add  sp, 2

;-310         lineno++;

 inc  word[lineno]

;-311         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-312         }


;-313 }

.printinputline60:

;-314 int fgets1() {

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

fgets1: PROC

;-315     char c;


;-316     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-317     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets161

;-318         printinputline();

 call printinputline

;-319         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets162
 mov ax, 0
 jmp .retnfgets1

;-320         fgetsp=&fgetsdest;

.fgets162:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-321         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-322         column=0;

 mov ax, 0
 mov word [column], ax

;-323     }


;-324     fgetsp++;

.fgets161:
 inc  word[fgetsp]

;-325     column++;

 inc  word[column]

;-326     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-327 }


;-328 int next() {

 .retnfgets1: LEAVE
 ret
ENDP

next: PROC

;-329     char r;


;-330     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-331     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-332     return r;

 mov al, [bp-2]
 jmp .retnnext

;-333 }


;-334 


;-335 int adrF(char *s, unsigned int i) {

 .retnnext: LEAVE
 ret
ENDP

adrF: PROC

;-336     i << 4;//*16; IDLENMAX=15!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-337     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 

;-338 }


;-339 


;-340 int printName(unsigned int i) {
 LEAVE
 ret
ENDP

printName: PROC

;-341     int j;


;-342     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName63

;-343         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax

;-344         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2

;-345     }


;-346     else {

 jmp .printName64
.printName63:

;-347         prs("[bp");

 push printName_0
 call prs
 add  sp, 2

;-348         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-349         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName65
 push 43
 call prc
 add  sp, 2

;-350         pint1(j);

.printName65:
 push word [bp-2]
 call pint1
 add  sp, 2

;-351         prc(']');

 push 93
 call prc
 add  sp, 2

;-352     }


;-353 }

.printName64:

;-354 


;-355 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC

;-356     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL66
 mov ax, 1
 jmp .retnifEOL

;-357     if (c == 13) {//CR

.ifEOL66:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL67

;-358         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL68
 call next
 mov [bp+4], al

;-359         return 1;

.ifEOL68:
 mov ax, 1
 jmp .retnifEOL

;-360     }


;-361     return 0;

.ifEOL67:
 mov ax, 0
 jmp .retnifEOL

;-362 }


;-363 


;-364 char symboltemp[80];

 .retnifEOL: LEAVE
 ret
ENDP
section .bss
absolute 42324
symboltemp resb 80
section .text

;-365 int getlex() {


getlex: PROC

;-366     char c; char *p;


;-367     int i; int j;


;-368 g1: c=next();
;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al

;-369     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex69
 mov ax, 0
 jmp .retngetlex

;-370     if (c <= ' ') goto g1;

.getlex69:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex70
 jmp .g1

;-371   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex70:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex71
 mov al, [thechar]
 cmp al, 61
 jne .getlex72
 call next
 mov ax, 806
 jmp .retngetlex
.getlex72:

;-372   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex71:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex73
 mov al, [thechar]
 cmp al, 61
 jne .getlex74
 call next
 mov ax, 807
 jmp .retngetlex
.getlex74:

;-373   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex73:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex75
 mov al, [thechar]
 cmp al, 61
 jne .getlex76
 call next
 mov ax, 824
 jmp .retngetlex
.getlex76:

;-374   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex75:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex77
 mov al, [thechar]
 cmp al, 61
 jne .getlex78
 call next
 mov ax, 811
 jmp .retngetlex
.getlex78:

;-375   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex77:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex79
 mov al, [thechar]
 cmp al, 60
 jne .getlex80
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex80:

;-376   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex79:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex81
 mov al, [thechar]
 cmp al, 62
 jne .getlex82
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex82:

;-377   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex81:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex83
 mov al, [thechar]
 cmp al, 43
 jne .getlex84
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex84:

;-378   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex83:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex85
 mov al, [thechar]
 cmp al, 45
 jne .getlex86
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex86:

;-379   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex85:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex87
 mov al, [thechar]
 cmp al, 61
 jne .getlex88
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex88:

;-380   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex87:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex89
 mov al, [thechar]
 cmp al, 61
 jne .getlex90
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex90:

;-381   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex89:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex91
 mov al, [thechar]
 cmp al, 61
 jne .getlex92
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex92:

;-382   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex91:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex93
 mov al, [thechar]
 cmp al, 61
 jne .getlex94
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex94:

;-383   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex93:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex95
 mov al, [thechar]
 cmp al, 61
 jne .getlex96
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex96:

;-384   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex97
 mov al, [thechar]
 cmp al, 61
 jne .getlex98
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex98:

;-385   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex97:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex99
 mov al, [bp-2]
 jmp .retngetlex

;-386   if (c == '/') {

.getlex99:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100

;-387       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex101

;-388           do c=next();

.getlex102:
 call next
 mov [bp-2], al

;-389           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex103
 jmp .getlex102
.getlex103:
 call getlex
 jmp .retngetlex

;-390       }


;-391   }

.getlex101:

;-392   if (c == '/') {

.getlex100:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex104

;-393       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex105

;-394           g2: c=next();

.g2:
 call next
 mov [bp-2], al

;-395           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex106
 jmp .g2

;-396           if (thechar != '/') goto g2;

.getlex106:
 mov al, [thechar]
 cmp al, 47
 je  .getlex107
 jmp .g2

;-397           c=next();

.getlex107:
 call next
 mov [bp-2], al

;-398           return getlex();

 call getlex
 jmp .retngetlex

;-399       } else  return '/';

 jmp .getlex108
.getlex105:
 mov ax, 47
 jmp .retngetlex

;-400   }

.getlex108:

;-401   if (c == '"') {

.getlex104:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex109

;-402       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax

;-403       c=next();

 call next
 mov [bp-2], al

;-404       while (c != '"') {

.getlex110:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex111

;-405           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-406           p++;

 inc  word[bp-4]

;-407           c=next();

 call next
 mov [bp-2], al

;-408           }


;-409           *p=0;

 jmp .getlex110
.getlex111:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-410       return T_STRING;

 mov ax, 258
 jmp .retngetlex

;-411   }


;-412   if (digit(c)) {

.getlex109:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex112

;-413       lexval=0;

 mov ax, 0
 mov word [lexval], ax

;-414       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax

;-415       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex113
 mov ax, 88
 mov byte [thechar], al

;-416       if (thechar=='X') {

.getlex113:
 mov al, [thechar]
 cmp al, 88
 jne .getlex114

;-417           next();

 call next

;-418           while(alnum(thechar)) {

.getlex115:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex116

;-419               c=next();

 call next
 mov [bp-2], al

;-420               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex117
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al

;-421       	       if (c>64) c=c-7;

.getlex117:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex118
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al

;-422                c=c-48;

.getlex118:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al

;-423                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-424                i=0;

 mov ax, 0
 mov [bp-6], ax

;-425                i=c;

 mov al, [bp-2]
 mov [bp-6], ax

;-426                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax

;-427            }


;-428        }else {

 jmp .getlex115
.getlex116:
 jmp .getlex119
.getlex114:

;-429            while(digit(thechar)) {

.getlex120:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex121

;-430                c=next();

 call next
 mov [bp-2], al

;-431                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al

;-432                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-433                i=0;

 mov ax, 0
 mov [bp-6], ax

;-434                i=c;

 mov al, [bp-2]
 mov [bp-6], ax

;-435                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax

;-436            }


;-437        }

 jmp .getlex120
.getlex121:

;-438       return T_CONST;

.getlex119:
 mov ax, 257
 jmp .retngetlex

;-439   }


;-440   if (c==39) {

.getlex112:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex122

;-441       lexval=next();

 call next
 mov word [lexval], ax

;-442       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex123

;-443           lexval=next();

 call next
 mov word [lexval], ax

;-444           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex124
 mov ax, 10
 mov word [lexval], ax

;-445           if (lexval=='t') lexval= 9;

.getlex124:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex125
 mov ax, 9
 mov word [lexval], ax

;-446           if (lexval=='0') lexval= 0;

.getlex125:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex126
 mov ax, 0
 mov word [lexval], ax

;-447       }

.getlex126:

;-448       next();

.getlex123:
 call next

;-449       return T_CONST;

 mov ax, 257
 jmp .retngetlex

;-450   }


;-451   if (alnum(c)) {

.getlex122:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex127

;-452     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4

;-453     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax

;-454     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-455     p++;

 inc  word[bp-4]

;-456     while(alnum(thechar)) {

.getlex128:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex129

;-457         c=next();

 call next
 mov [bp-2], al

;-458         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-459         p++;

 inc  word[bp-4]

;-460     }


;-461     *p=0;

 jmp .getlex128
.getlex129:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-462     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 531
 jmp .retngetlex

;-463     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex130:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 532
 jmp .retngetlex

;-464     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex131:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 529
 jmp .retngetlex

;-465     if (eqstr(symbol,"int"     )) return T_INT;

.getlex132:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 517
 jmp .retngetlex

;-466     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex133:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 533
 jmp .retngetlex

;-467     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex134:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 530
 jmp .retngetlex

;-468     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex135:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 518
 jmp .retngetlex

;-469     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex136:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 519
 jmp .retngetlex

;-470     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex137:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 520
 jmp .retngetlex

;-471     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex138:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 512
 jmp .retngetlex

;-472     if (eqstr(symbol,"if"      )) return T_IF;

.getlex139:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 513
 jmp .retngetlex

;-473     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex140:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 514
 jmp .retngetlex

;-474     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex141:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 515
 jmp .retngetlex

;-475     if (eqstr(symbol,"do"      )) return T_DO;

.getlex142:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 516
 jmp .retngetlex

;-476     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex143:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
 mov ax, 521
 jmp .retngetlex

;-477     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex144:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
 mov ax, 511
 jmp .retngetlex

;-478 


;-479     i=0;//convert define to value

.getlex145:
 mov ax, 0
 mov [bp-6], ax

;-480     while (i < GTop) {

.getlex146:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex147

;-481         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax

;-482         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex148

;-483             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex149

;-484                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-485                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4

;-486                 return T_CONST;

 mov ax, 257
 jmp .retngetlex

;-487             }


;-488         }

.getlex149:

;-489         i++;

.getlex148:
 inc  word[bp-6]

;-490     }


;-491     return T_NAME; } error1("Input item not recognized");

 jmp .getlex146
.getlex147:
 mov ax, 256
 jmp .retngetlex
.getlex127:
 push getlex_17
 call error1
 add  sp, 2

;-492 }


;-493 


;-494 int istoken(int t) {

 .retngetlex: LEAVE
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

;-495     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken150

;-496         token=getlex();

 call getlex
 mov word [token], ax

;-497         return 1;

 mov ax, 1
 jmp .retnistoken

;-498     }


;-499     return 0;

.istoken150:
 mov ax, 0
 jmp .retnistoken

;-500 }


;-501 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-502     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect151

;-503         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-504         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-505         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-506         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-507         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-508     }


;-509 }

.expect151:

;-510 


;-511 int v(unsigned int i) {//value
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC

;-512     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v152
 push 91
 call prc
 add  sp, 2

;-513     printName(i);

.v152:
 push word [bp+4]
 call printName
 add  sp, 2

;-514     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v153
 push 93
 call prc
 add  sp, 2

;-515 }

.v153:

;-516 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-517     int i;


;-518     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-519     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen154
 push checknamelen_0
 call error1
 add  sp, 2

;-520 }

.checknamelen154:

;-521 


;-522 int checkName() { unsigned int i; unsigned int j;
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

checkName: PROC

;-523     i=LSTART;
;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax

;-524     while(i<LTop) {

.checkName155:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName156

;-525         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-526         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName157
 mov ax, [bp-2]
 jmp .retncheckName

;-527         i++;

.checkName157:
 inc  word[bp-2]

;-528     }


;-529     i=1;

 jmp .checkName155
.checkName156:
 mov ax, 1
 mov [bp-2], ax

;-530     while(i<GTop) {

.checkName158:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName159

;-531         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-532         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName160
 mov ax, [bp-2]
 jmp .retncheckName

;-533         i++;

.checkName160:
 inc  word[bp-2]

;-534     }


;-535     return 0;

 jmp .checkName158
.checkName159:
 mov ax, 0
 jmp .retncheckName

;-536 }


;-537 int searchname() { unsigned int i;

 .retncheckName: LEAVE
 ret
ENDP

searchname: PROC

;-538   i=checkName(); if (i == 0) error1("Variable unknown");
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname161
 push searchname_0
 call error1
 add  sp, 2

;-539   GUsed[i]=GUsed[i] + 1; return i;

.searchname161:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp .retnsearchname

;-540 }


;-541 int name1() {

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC

;-542     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1162
 push name1_0
 call error1
 add  sp, 2

;-543     token=getlex();

.name1162:
 call getlex
 mov word [token], ax

;-544 }


;-545 int typeName() { int m; //0=V,1=*,2=&

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC

;-546     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-547     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 83
 mov byte [issign], al

;-548     if(istoken(T_UNSIGNED)) issign='U';

.typeName163:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 85
 mov byte [issign], al

;-549     iswidth=2;

.typeName164:
 mov ax, 2
 mov byte [iswidth], al

;-550     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 0
 mov byte [iswidth], al

;-551     if(istoken(T_CHAR))     iswidth=1;

.typeName165:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 1
 mov byte [iswidth], al

;-552     if(istoken(T_INT))      iswidth=2;

.typeName166:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 2
 mov byte [iswidth], al

;-553     if(istoken(T_LONG))     iswidth=4;

.typeName167:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName168
 mov ax, 4
 mov byte [iswidth], al

;-554     istype='V';

.typeName168:
 mov ax, 86
 mov byte [istype], al

;-555     m=0;

 mov ax, 0
 mov [bp-2], ax

;-556     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName169
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-557     if(istoken('&'))  {istype='&'; m=2;}

.typeName169:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName170
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-558     name1();

.typeName170:
 call name1

;-559     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-560 }


;-561 int gettypes(int i) {int j; char c;

 .retntypeName: LEAVE
 ret
ENDP

gettypes: PROC

;-562   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes171
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes172
.gettypes171:
 mov ax, 0
 mov word [signi], ax

;-563   c=GWidth[i]; widthi=0;wi=0;

.gettypes172:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-564   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes173
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-565   if (c==2) {widthi=2;wi=2;}

.gettypes173:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes174
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-566   if (c==4) {widthi=4;wi=4;}

.gettypes174:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes175
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-567   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes175:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes176
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-568   if (c=='&')  typei=2;

.gettypes176:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes177
 mov ax, 2
 mov word [typei], ax

;-569   return i; }

.gettypes177:
 mov ax, [bp+4]
 jmp .retngettypes

;-570 


;-571 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 .retngettypes: LEAVE
 ret
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal178
 push addlocal_0
 call error1
 add  sp, 2

;-572   if (checkName() != 0) error1("Variable already defined");

.addlocal178:
 call checkName
 cmp ax, 0
 je  .addlocal179
 push addlocal_1
 call error1
 add  sp, 2

;-573   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal179:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-574   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-575   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-576 }


;-577 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-578   while (i < FTop) {

.checkFunction180:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction181

;-579     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

 push word [bp-2]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkFunction182
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction182:
 inc  word[bp-2]

;-580   return 0; }

 jmp .checkFunction180
.checkFunction181:
 mov ax, 0
 jmp .retncheckFunction

;-581 


;-582 int isvariable() {

 .retncheckFunction: LEAVE
 ret
ENDP

isvariable: PROC

;-583     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable183
 jmp .v1

;-584     if(token==T_UNSIGNED) goto v1;

.isvariable183:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable184
 jmp .v1

;-585     if(token==T_CHAR)     goto v1;

.isvariable184:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable185
 jmp .v1

;-586     if(token==T_INT)      goto v1;

.isvariable185:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable186
 jmp .v1

;-587     if(token==T_LONG)     goto v1;

.isvariable186:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable187
 jmp .v1

;-588     return 0;

.isvariable187:
 mov ax, 0
 jmp .retnisvariable

;-589 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-590 }


;-591 


;-592 int cmpneg(int ids) {

 .retnisvariable:
 ret
ENDP

cmpneg: PROC

;-593        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg188
 push cmpneg_0
 call prs
 add  sp, 2

;-594   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg189
.cmpneg188:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg190
 push cmpneg_1
 call prs
 add  sp, 2

;-595   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg191
.cmpneg190:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg192
 mov ax, [bp+4]
 or  al, al
 je .cmpneg193
 push cmpneg_2
 call prs
 add  sp, 2

;-596                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg194
.cmpneg193:
 push cmpneg_3
 call prs
 add  sp, 2

;-597   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

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
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-598                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-599                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg198
.cmpneg197:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-600                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-601   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg198:
 jmp .cmpneg199
.cmpneg196:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg200
 push cmpneg_8
 call prs
 add  sp, 2

;-602   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg201
.cmpneg200:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg202
 push cmpneg_9
 call prs
 add  sp, 2

;-603   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg203
.cmpneg202:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg203:
.cmpneg201:
.cmpneg199:
.cmpneg195:
.cmpneg191:
.cmpneg189:

;-604 


;-605   int isrelational() {
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

;-606     if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational204
 jmp .w
.isrelational204:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational205
 jmp .w

;-607     if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational205:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational206
 jmp .w
.isrelational206:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational207
 jmp .w

;-608     if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational207:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational208
 jmp .w
.isrelational208:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational209
 jmp .w

;-609     return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational209:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-610 


;-611 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC

;-612   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg210
 mov ax, 0
 jmp .retncheckreg

;-613   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg210:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 1
 jmp .retncheckreg
.checkreg211:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 3
 jmp .retncheckreg

;-614   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg212:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 5
 jmp .retncheckreg
.checkreg213:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 7
 jmp .retncheckreg

;-615   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg214:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 9
 jmp .retncheckreg
.checkreg215:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 11
 jmp .retncheckreg

;-616   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg216:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 13
 jmp .retncheckreg
.checkreg217:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 15
 jmp .retncheckreg

;-617   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg218:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 17
 jmp .retncheckreg
.checkreg219:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 19
 jmp .retncheckreg

;-618   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg220:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 21
 jmp .retncheckreg
.checkreg221:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 23
 jmp .retncheckreg

;-619   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg222:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 25
 jmp .retncheckreg
.checkreg223:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 27
 jmp .retncheckreg

;-620   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg224:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 29
 jmp .retncheckreg
.checkreg225:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 31
 jmp .retncheckreg

;-621   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg226:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 33
 jmp .retncheckreg
.checkreg227:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 35
 jmp .retncheckreg

;-622   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg228:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 37
 jmp .retncheckreg
.checkreg229:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 39
 jmp .retncheckreg

;-623   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg230:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 41
 jmp .retncheckreg
.checkreg231:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 43
 jmp .retncheckreg

;-624   // (eqstr(symbol,"ip")) return 45;


;-625   if (strlen(symbol) >   3) return 0;

.checkreg232:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg233
 mov ax, 0
 jmp .retncheckreg

;-626   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg233:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 47
 jmp .retncheckreg
.checkreg234:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg235
 mov ax, 50
 jmp .retncheckreg

;-627   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg235:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg236
 mov ax, 53
 jmp .retncheckreg
.checkreg236:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg237
 mov ax, 56
 jmp .retncheckreg

;-628   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg237:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg238
 mov ax, 59
 jmp .retncheckreg
.checkreg238:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg239
 mov ax, 62
 jmp .retncheckreg

;-629   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg239:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg240
 mov ax, 65
 jmp .retncheckreg
.checkreg240:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg241
 mov ax, 68
 jmp .retncheckreg

;-630   if (eqstr(symbol,"cr0")) return 71;

.checkreg241:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg242
 mov ax, 71
 jmp .retncheckreg

;-631   return 0;   }

.checkreg242:
 mov ax, 0
 jmp .retncheckreg

;-632 


;-633 char printregstr[]

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
checkreg_30 db "cr0",0
ENDP

;-634 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-635 


;-636 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-637   k = &printregstr + i; c=*k; prc(c); i++;
;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]

;-638   k = &printregstr + i; c=*k; prc(c);

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-639   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg243
 inc  word[bp+4]
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-640 }

.printreg243:

;-641 


;-642 int constantexpr() { int mode; int id1;int ids;
 LEAVE
 ret
ENDP

constantexpr: PROC

;-643   token=getlex();   mode=typeName();
;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-644   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-645   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr244
 push constantexpr_0
 call error1
 add  sp, 2

;-646   expect(T_CONST);  prs(" ; constant expression");

.constantexpr244:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-647   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-648   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr245
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr246
.constantexpr245:
 push constantexpr_4
 call prs
 add  sp, 2

;-649   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr246:
 push word [bp-4]
 call v
 add  sp, 2
 push constantexpr_5
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push word [bp-6]
 call cmpneg
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-650   expect(')');

 push 41
 call expect
 add  sp, 2

;-651 }


;-652 


;-653 char ops[5];
 LEAVE
 ret
constantexpr_0 db "Relational expression expected",0
constantexpr_1 db " ; constant expression",0
constantexpr_2 db "\ncmp ",0
constantexpr_3 db "word",0
constantexpr_4 db "byte",0
constantexpr_5 db ", ",0
ENDP
section .bss
absolute 42404
ops resb 5
section .text

;-654 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-655   if (istoken('='))          strcpy(ops, "mov");
;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1247
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-656   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1247:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1248
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-657   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1248:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1249
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-658   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1249:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1250
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-659   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1250:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1251
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-660   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1251:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1252
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-661   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1252:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1253
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-662   if (iscmp1 == 1) { token=getlex();

.doreg1253:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1254
 call getlex
 mov word [token], ax

;-663       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1255
 push doreg1_7
 call error1
 add  sp, 2

;-664       strcpy(ops, "cmp"); }

.doreg1255:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-665   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1254:
 call prnl
 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2
 push doreg1_9
 call prs
 add  sp, 2
 push word [ireg1]
 call printreg
 add  sp, 2
 push doreg1_10
 call prs
 add  sp, 2

;-666 


;-667   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1256
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-668   mod2=typeName(); ireg2=checkreg();

.doreg1256:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-669   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1257
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-670   i=searchname();  if (mod2 == 2) printName(i); else v(i);

.doreg1257:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1258
 push word [bp-2]
 call printName
 add  sp, 2
 jmp .doreg1259
.doreg1258:
 push word [bp-2]
 call v
 add  sp, 2

;-671   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1259:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1260
 push 0
 call cmpneg
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push 41
 call expect
 add  sp, 2

;-672 }

.doreg1260:

;-673 


;-674 int compoundass(char *op, int mode, int id1) {
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
doreg1_9 db "  ",0
doreg1_10 db ", ",0
ENDP

compoundass: PROC

;-675   if(mode) error1("only scalar Var allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass261
 push compoundass_0
 call error1
 add  sp, 2

;-676   prnl(); prs(op); prs("  ");

.compoundass261:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-677   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass262
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass263
.compoundass262:
 push compoundass_3
 call prs
 add  sp, 2

;-678   v(id1); prs(", ");

.compoundass263:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-679   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-680 }


;-681 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-682   gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-683   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1264
 push dovar1_0
 call prs
 add  sp, 2
 push word [bp+10]
 call v
 add  sp, 2
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-684     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1265
 push dovar1_1
 call prs
 add  sp, 2

;-685     if(widthi == 2) prs(" ax, [bx]");

.dovar1265:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1266
 push dovar1_2
 call prs
 add  sp, 2

;-686     return; }

.dovar1266:
 jmp .retndovar1

;-687   if (mode==2){prnl();prs(op);prs(" ax, "); printName(id1); return; }

.dovar1264:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1267
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2
 push dovar1_3
 call prs
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 jmp .retndovar1

;-688   if (ixarr) {

.dovar1267:
 mov ax, [bp+8]
 or  al, al
 je .dovar1268

;-689     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-690     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1269
 push dovar1_5
 call prs
 add  sp, 2

;-691     prs("\n "); prs(op);

.dovar1269:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-692     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1270
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1271
.dovar1270:
 push dovar1_8
 call prs
 add  sp, 2

;-693 // v(id1); prs(" [bx]");


;-694     prc('['); printName(id1); prs(" + bx]");

.dovar1271:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-695     return; }

 jmp .retndovar1

;-696   prnl();prs(op);

.dovar1268:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-697   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1272
 push dovar1_10
 call prs
 add  sp, 2

;-698   if(wi==2) prs(" ax, ");

.dovar1272:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1273
 push dovar1_11
 call prs
 add  sp, 2

;-699   if(wi==4) prs(" eax, ");

.dovar1273:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1274
 push dovar1_12
 call prs
 add  sp, 2

;-700   v(id1);

.dovar1274:
 push word [bp+10]
 call v
 add  sp, 2

;-701 }


;-702 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

 .retndovar1: LEAVE
 ret
dovar1_0 db "\n mov bx, ",0
dovar1_1 db " al, [bx]\n mov ah, 0",0
dovar1_2 db " ax, [bx]",0
dovar1_3 db " ax, ",0
dovar1_4 db "\n mov bx, ",0
dovar1_5 db "\n shl bx, 1",0
dovar1_6 db "\n ",0
dovar1_7 db " ax, ",0
dovar1_8 db " al, ",0
dovar1_9 db " + bx]",0
dovar1_10 db " al, ",0
dovar1_11 db " ax, ",0
dovar1_12 db " eax, ",0
ENDP

rterm: PROC

;-703   if (istoken(T_CONST)) { prnl(); prs(op);
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm275
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-704     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm276
 push rterm_0
 call prs
 add  sp, 2

;-705     if (wi==2) prs(" ax, ");

.rterm276:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm277
 push rterm_1
 call prs
 add  sp, 2

;-706     if (wi==4) prs(" eax, ");

.rterm277:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm278
 push rterm_2
 call prs
 add  sp, 2

;-707     prunsign1(lexval); return;}

.rterm278:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-708   mode=typeName(); id1=searchname(); ixarr=0;

.rterm275:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-709   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm279
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-710     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-711     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm280
 push rterm_3
 call error1
 add  sp, 2
.rterm280:

;-712   if (eqstr(symbol,"_AX")) return;

.rterm279:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm281
 jmp .retnrterm

;-713   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm281:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-714 }


;-715 


;-716 int doreg(char *dr) { int i; expect('=');

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
ENDP

doreg: PROC;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-717   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-718        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg282
 push word [lexval]
 call prunsign1
 add  sp, 2

;-719   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg283
.doreg282:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg284
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-720   else error1("only number or var allowed");

 jmp .doreg285
.doreg284:
 push doreg_2
 call error1
 add  sp, 2

;-721 }

.doreg285:
.doreg283:

;-722 int isreg() {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

isreg: PROC

;-723   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg286
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-724   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg286:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg287
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-725   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg287:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg288
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-726   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg288:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg289
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-727   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg289:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg290
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-728   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg290:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg291
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-729   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg291:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg292
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-730   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg292:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg293
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-731   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg293:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg294
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-732   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg294:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg295
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-733   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg295:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg296
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-734   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg296:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg297
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-735   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg297:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg298
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-736   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg298:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg299
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-737   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg299:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg300
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-738   return 0;   r1: return 1;

.isreg300:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-739 }


;-740 


;-741 int doassign(int mode, int i, int ixarr, int ixconst) {

 .retnisreg:
 ret
isreg_0 db "_AH",0
isreg_1 db "ah",0
isreg_2 db "_AL",0
isreg_3 db "al",0
isreg_4 db "_AX",0
isreg_5 db "ax",0
isreg_6 db "_BH",0
isreg_7 db "bh",0
isreg_8 db "_BL",0
isreg_9 db "bl",0
isreg_10 db "_BX",0
isreg_11 db "bx",0
isreg_12 db "_CH",0
isreg_13 db "ch",0
isreg_14 db "_CL",0
isreg_15 db "cl",0
isreg_16 db "_CX",0
isreg_17 db "cx",0
isreg_18 db "_DH",0
isreg_19 db "dh",0
isreg_20 db "_DL",0
isreg_21 db "dl",0
isreg_22 db "_DX",0
isreg_23 db "dx",0
isreg_24 db "_SI",0
isreg_25 db "si",0
isreg_26 db "_DI",0
isreg_27 db "di",0
isreg_28 db "_FLAGS",0
isreg_29 db "flags",0
ENDP

doassign: PROC

;-742   gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-743   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign301
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-744     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign302
 push doassign_1
 call prs
 add  sp, 2

;-745     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign303
.doassign302:
 push doassign_2
 call prs
 add  sp, 2
.doassign303:
 jmp .retndoassign

;-746   if (mode==2) {prs("\n mov  ");printName(i); prs(", ax"); return;}

.doassign301:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign304
 push doassign_3
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2
 push doassign_4
 call prs
 add  sp, 2
 jmp .retndoassign

;-747   if (ixarr) {  prs("\n mov bx, ");

.doassign304:
 mov ax, [bp+8]
 or  al, al
 je .doassign305
 push doassign_5
 call prs
 add  sp, 2

;-748     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign306
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign307
.doassign306:
 push word [bp+8]
 call v
 add  sp, 2

;-749     if (wi==2) prs("\n shl bx, 1");

.doassign307:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign308
 push doassign_6
 call prs
 add  sp, 2

;-750     prs("\n mov ["); printName(i);

.doassign308:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-751     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign309
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign310
.doassign309:
 push doassign_9
 call prs
 add  sp, 2
.doassign310:
 jmp .retndoassign

;-752   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign305:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign311
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign312
 push doassign_11
 call prs
 add  sp, 2

;-753     } v(i); prs(", al"); return; }

.doassign312:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-754   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign311:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign313
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign314
 push doassign_14
 call prs
 add  sp, 2

;-755     } v(i); prs(", ax"); return; }

.doassign314:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-756   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign313:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign315
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign316
 push doassign_17
 call prs
 add  sp, 2

;-757     } v(i); prs(", eax"); return; }

.doassign316:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-758 }

.doassign315:

;-759 int domul(int ids) {

 .retndoassign: LEAVE
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

;-760   if (ids) rterm("imul"); else {
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul317
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul318
.domul317:

;-761   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul319

;-762     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-763     }


;-764   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul320
.domul319:
 push domul_3
 call error1
 add  sp, 2
.domul320:
.domul318:

;-765 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-766   if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv321

;-767     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-768     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv322
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv323
.doidiv322:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv323:

;-769   else {

 jmp .doidiv324
.doidiv321:

;-770     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-771     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv325
 push doidiv_3
 call error1
 add  sp, 2

;-772     gettypes(id1);

.doidiv325:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-773     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv326
 push doidiv_4
 call error1
 add  sp, 2

;-774     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv326:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv327
 push doidiv_5
 call error1
 add  sp, 2

;-775     prs("\n mov bx, "); v(id1);

.doidiv327:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-776     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv328
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv329
.doidiv328:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv329:

;-777 }

.doidiv324:

;-778 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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

domod: PROC;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-779 


;-780 


;-781 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 42409
docalltype resw 10
section .text
section .bss
absolute 42429
docallvalue resw 10
section .text

;-782 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 42449
procname resb 17
section .text

;-783 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-784   narg=0;  sz32=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-785   checknamelen();

 call checknamelen

;-786   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-787   expect('(');

 push 40
 call expect
 add  sp, 2

;-788 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1330

;-789 	  do { narg++;

.docall1331:
 inc  word[bp-4]

;-790 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1332
 push docall1_0
 call error1
 add  sp, 2
.docall1332:
 mov ax, 0
 mov [bp-6], ax

;-791       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1333
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-792       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1333:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1334
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-793         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

 push docall1_1
 call eprs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
 push 95
 call eprc
 add  sp, 2
 push word [nconst]
 call eprnum
 add  sp, 2
 push docall1_2
 call eprs
 add  sp, 2

;-794         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

 push 34
 call eprc
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
 push 34
 call eprc
 add  sp, 2
 push docall1_3
 call eprs
 add  sp, 2
 inc  word[nconst]

;-795       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1334:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1335
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-796       if(istoken(T_NAME))  { n0=checkreg();

.docall1335:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1336
 call checkreg
 mov [bp-8], ax

;-797         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1337
 mov ax, 5
 mov [bp-6], ax

;-798         else {t0=4; n0=searchname();

 jmp .docall1338
.docall1337:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-799           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1339
 mov ax, 3
 mov [bp-6], ax
.docall1339:
.docall1338:

;-800       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1336:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1340
 push docall1_4
 call error1
 add  sp, 2

;-801       docalltype [narg] = t0;

.docall1340:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-802       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-803     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1341
 jmp .docall1331
.docall1341:

;-804 


;-805   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-806     do {

.docall1342:

;-807       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-808       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-809       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1343
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-810       if(t0==2){ prs("\n push ");

.docall1343:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1344
 push docall1_6
 call prs
 add  sp, 2

;-811         prs(fname);prc(95);prunsign1(n0);}

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push 95
 call prc
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-812       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1344:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1345
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-813         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-814       if(t0==4){ gettypes(n0);

.docall1345:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1346
 push word [bp-8]
 call gettypes
 add  sp, 2

;-815         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1347
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-816         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1348
.docall1347:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-817         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1348:

;-818       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1346:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1349
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1350
 mov ax, [bp-10]
 add ax, 2
.docall1350:

;-819    i--; } while (i > 0);  }

.docall1349:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1351
 jmp .docall1342
.docall1351:

;-820 	 prs("\n call "); prs(&procname);

.docall1330:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-821 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1352
 push docall1_14
 call prs
 add  sp, 2

;-822      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2

;-823  }

.docall1352:

;-824 


;-825  int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
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
evalue dw 0
exprtype dw 10

;-826  int expr(int isRight)


expr: PROC

;-827  { int mode; int id1;     int ixarr; int ixconst;


;-828    int ids;  int isCONST; int i;     unsigned char *p;


;-829    if (istoken(T_CONST)) { evalue=lexval;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr353
 mov ax, [lexval]
 mov word [evalue], ax

;-830      prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-831    mode=typeName(); /*0=V,1=*,2=&*/

.expr353:
 call typeName
 mov [bp-2], ax

;-832    ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-833    if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr354
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-834    if (token=='(')  {docall1(); goto e1; }

.expr354:
 mov ax, [token]
 cmp ax, 40
 jne .expr355
 call docall1
 jmp .e1

;-835    if (isreg()) goto e1;

.expr355:
 call isreg
 or  al, al
 je .expr356
 jmp .e1

;-836 


;-837    id1=searchname(); gettypes(id1); ids=signi;

.expr356:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-838    ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-839      if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr358

;-840        ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-841      else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr359
.expr358:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-842      gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-843      if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr360
 push expr_1
 call error1
 add  sp, 2
.expr360:
.expr359:

;-844    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

.expr357:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr361
 mov ax, [bp-2]
 or  al, al
 je .expr362
 push expr_2
 call error1
 add  sp, 2

;-845       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr362:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr363
 push expr_4
 call prs
 add  sp, 2
 jmp .expr364
.expr363:
 push expr_5
 call prs
 add  sp, 2

;-846       v(id1); goto e1;}

.expr364:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-847    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

.expr361:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr365
 mov ax, [bp-2]
 or  al, al
 je .expr366
 push expr_6
 call error1
 add  sp, 2

;-848       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr366:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr367
 push expr_8
 call prs
 add  sp, 2
 jmp .expr368
.expr367:
 push expr_9
 call prs
 add  sp, 2

;-849       v(id1); goto e1;}

.expr368:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-850 


;-851    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr365:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr369
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-852    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr369:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr370
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-853    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr370:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr371
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-854    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr371:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr372
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-855    if (istoken(T_MULASS    )) {error1("not implemented");}

.expr372:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr373
 push expr_14
 call error1
 add  sp, 2

;-856    if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr373:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr374
 push expr_15
 call error1
 add  sp, 2

;-857 


;-858    if (istoken('=')) { exprtype= expr(1);

.expr374:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr375
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-859    doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-860    dovar1(mode, "mov", ixarr, id1);

.expr375:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-861 


;-862  e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr376
 push expr_17
 call rterm
 add  sp, 2

;-863    else if (istoken('-')) rterm("sub" );

 jmp .expr377
.expr376:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr378
 push expr_18
 call rterm
 add  sp, 2

;-864    else if (istoken('&')) rterm("and" );

 jmp .expr379
.expr378:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr380
 push expr_19
 call rterm
 add  sp, 2

;-865    else if (istoken('|')) rterm("or" );

 jmp .expr381
.expr380:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr382
 push expr_20
 call rterm
 add  sp, 2

;-866    else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr383
.expr382:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr384
 push expr_21
 call rterm
 add  sp, 2

;-867    else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr385
.expr384:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr386
 push expr_22
 call rterm
 add  sp, 2

;-868    else if (istoken('*')) domul (ids);

 jmp .expr387
.expr386:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr388
 push word [bp-10]
 call domul
 add  sp, 2

;-869    else if (istoken('/')) doidiv(ids);

 jmp .expr389
.expr388:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr390
 push word [bp-10]
 call doidiv
 add  sp, 2

;-870    else if (istoken('%')) domod (ids);

 jmp .expr391
.expr390:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr392
 push word [bp-10]
 call domod
 add  sp, 2

;-871    if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr392:
.expr391:
.expr389:
.expr387:
.expr385:
.expr383:
.expr381:
.expr379:
.expr377:
 call isrelational
 or  al, al
 je .expr393
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-872    return 0;

.expr393:
 mov ax, 0
 jmp .retnexpr

;-873  }


;-874 


;-875  int pexpr() {expect('('); iscmp=0;

 .retnexpr: LEAVE
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
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-876    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr394
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr395
 call constantexpr
 jmp .retnpexpr

;-877      ireg1=checkreg();

.pexpr395:
 call checkreg
 mov word [ireg1], ax

;-878      if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr396
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr396:

;-879    expr(0);

.pexpr394:
 push 0
 call expr
 add  sp, 2

;-880    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr397
 push pexpr_1
 call prs
 add  sp, 2
.pexpr397:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-881    expect(')');

 push 41
 call expect
 add  sp, 2

;-882  }


;-883 


;-884 /***************************************************************/


;-885 


;-886 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC

;-887     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2

;-888     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-889     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-890     prc(':');

 push 58
 call prc
 add  sp, 2

;-891 }


;-892 int prjump (int n) {
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC

;-893     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2

;-894     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-895     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-896 }


;-897 


;-898 int stmt() {
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC

;-899     int c; char cha;


;-900     int jdest; int tst; int jtemp;


;-901        if(istoken('{'))     {while(istoken('}')==0) stmt();}
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt398
.stmt399:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt400
 call stmt
 jmp .stmt399
.stmt400:

;-902   else if(istoken(T_IF)) {

 jmp .stmt401
.stmt398:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt402

;-903       int jdest; int tst;

 mov ax, [bp-6]
 mov ax, [bp-8]

;-904       pexpr(); nlabel++; jdest=nlabel;

 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax

;-905       pint1(jdest); stmt();

 push word [bp-6]
 call pint1
 add  sp, 2
 call stmt

;-906       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt403
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-8], ax

;-907           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
 push word [bp-6]
 call prlabel
 add  sp, 2
 call stmt
 push word [bp-8]
 call prlabel
 add  sp, 2

;-908       }


;-909       else prlabel(jdest);

 jmp .stmt404
.stmt403:
 push word [bp-6]
 call prlabel
 add  sp, 2

;-910   }

.stmt404:

;-911   else if(istoken(T_DO)) {

 jmp .stmt405
.stmt402:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt406

;-912       nlabel++; jdest=nlabel; prlabel(jdest); stmt();

 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax
 push word [bp-6]
 call prlabel
 add  sp, 2
 call stmt

;-913       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

 push 515
 call expect
 add  sp, 2
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-10], ax
 push word [bp-10]
 call pint1
 add  sp, 2

;-914       prjump(jdest); prlabel(jtemp);

 push word [bp-6]
 call prjump
 add  sp, 2
 push word [bp-10]
 call prlabel
 add  sp, 2

;-915   }


;-916   else if(istoken(T_WHILE)) {

 jmp .stmt407
.stmt406:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt408

;-917       nlabel++; jdest=nlabel;

 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax

;-918       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

 push word [bp-6]
 call prlabel
 add  sp, 2
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-8], ax
 push word [bp-8]
 call pint1
 add  sp, 2

;-919       stmt(); prjump(jdest); prlabel(tst);

 call stmt
 push word [bp-6]
 call prjump
 add  sp, 2
 push word [bp-8]
 call prlabel
 add  sp, 2

;-920   }


;-921   else if(istoken(T_GOTO))  {

 jmp .stmt409
.stmt408:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt410

;-922       prs("\n jmp .");name1();prs(symbol);expect(';');

 push stmt_0
 call prs
 add  sp, 2
 call name1
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-923   }


;-924   else if(token==T_ASM)     {

 jmp .stmt411
.stmt410:
 mov ax, [token]
 cmp ax, 518
 jne .stmt412

;-925       prs("\n"); c=next();

 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-926       while(c != '\n') { prc(c);	c=next(); };

.stmt413:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt414
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt413
.stmt414:

;-927       token=getlex();

 call getlex
 mov word [token], ax

;-928   }


;-929   else if(istoken(T_ASMBLOCK)) {

 jmp .stmt415
.stmt412:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt416

;-930       if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt417

;-931           prs("\n"); cha=next();

 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-932           while(cha!= '}') {

.stmt418:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt419

;-933               prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-934               cha=next();

 call next
 mov [bp-4], al

;-935           }


;-936           token=getlex();

 jmp .stmt418
.stmt419:
 call getlex
 mov word [token], ax

;-937       } else error1("Curly open expected");

 jmp .stmt420
.stmt417:
 push stmt_3
 call error1
 add  sp, 2

;-938         }

.stmt420:

;-939   else if(istoken(T_EMIT)) {

 jmp .stmt421
.stmt416:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt422

;-940       prs("\n db ");

 push stmt_4
 call prs
 add  sp, 2

;-941     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax

;-942       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2

;-943       token=getlex();

 call getlex
 mov word [token], ax

;-944       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt423

;-945           prc(',');

 push 44
 call prc
 add  sp, 2

;-946           goto L1;

 jmp .L1

;-947       }


;-948       expect(')');

.stmt423:
 push 41
 call expect
 add  sp, 2

;-949   }


;-950   else if(istoken(';'))      { }

 jmp .stmt424
.stmt422:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt425

;-951   else if(istoken(T_RETURN)) {

 jmp .stmt426
.stmt425:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt427

;-952         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt428
 push 0
 call expr
 add  sp, 2

;-953         prs("\n jmp .retn");

.stmt428:
 push stmt_5
 call prs
 add  sp, 2

;-954         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-955         nreturn++;

 inc  word[nreturn]

;-956         expect(';');

 push 59
 call expect
 add  sp, 2

;-957         }


;-958   else if(thechar==':')      {

 jmp .stmt429
.stmt427:
 mov al, [thechar]
 cmp al, 58
 jne .stmt430

;-959         prs("\n."); // Label

 push stmt_6
 call prs
 add  sp, 2

;-960         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-961         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-962         expect(':');

 push 58
 call expect
 add  sp, 2

;-963         }


;-964   else  {expr(0);; expect(';'); }

 jmp .stmt431
.stmt430:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-965 }

.stmt431:
.stmt429:
.stmt426:
.stmt424:
.stmt421:
.stmt415:
.stmt411:
.stmt409:
.stmt407:
.stmt405:
.stmt401:

;-966 


;-967 


;-968 int dofunc() { int nloc; int i; int narg;
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

dofunc: PROC

;-969     cloc=&co;
;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-970     checknamelen();

 call checknamelen

;-971     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-972     if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc432
 push dofunc_0
 call error1
 add  sp, 2

;-973     if (FTop >= FUNCMAX) error1("Function table full");

.dofunc432:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc433
 push dofunc_1
 call error1
 add  sp, 2

;-974     FAdr[FTop]=lineno - 1;

.dofunc433:
 mov ax, [lineno]
 sub ax, 1
 mov bx, [FTop]
 shl bx, 1
 mov [FAdr+bx], ax

;-975     FCalls[FTop]=0;

 mov ax, 0
 mov bx, [FTop]
 shl bx, 1
 mov [FCalls+bx], ax

;-976     FType[FTop]=iswidth;

 mov al, [iswidth]
 mov bx, [FTop]
 mov [FType+bx], al

;-977     pt=adrF(FNameField, FTop);

 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-978     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-979     FTop++;

 inc  word[FTop]

;-980 


;-981   prs("\n\n"); prs(symbol); prs(": PROC");

 push dofunc_2
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push dofunc_3
 call prs
 add  sp, 2

;-982   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-983   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc434
 mov ax, 2
 mov [bp-6], ax

;-984     do { typeName();  addlocal(); narg+=2;

.dofunc435:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-985          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc436
 add  word[bp-6], 2
.dofunc436:
 inc  word[LTop]

;-986     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc437
 jmp .dofunc435
.dofunc437:
 push 41
 call expect
 add  sp, 2

;-987 


;-988   expect('{'); /*body*/

.dofunc434:
 push 123
 call expect
 add  sp, 2

;-989   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-990   while(isvariable()) {

.dofunc438:
 call isvariable
 or  al, al
 je .dofunc439

;-991     do {typeName();

.dofunc440:
 call typeName

;-992         checknamelen();

 call checknamelen

;-993         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-994         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc441
 sub  word[bp-2], 2

;-995         GData[LTop]=nloc;

.dofunc441:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-996         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc442

;-997             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

 mov ax, 38
 mov byte [istype], al
 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
 push 257
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-998             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-999             }


;-1000         LTop++;

.dofunc442:
 inc  word[LTop]

;-1001       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc443
 jmp .dofunc440
.dofunc443:
 push 59
 call expect
 add  sp, 2

;-1002   if (LTop>LSTART){prs(";\n ENTER  ");

 jmp .dofunc438
.dofunc439:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc444
 push dofunc_4
 call prs
 add  sp, 2

;-1003     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2
 push dofunc_5
 call prs
 add  sp, 2

;-1004   while(istoken('}')==0)   stmt();

.dofunc444:
.dofunc445:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc446
 call stmt

;-1005   if (nreturn) {

 jmp .dofunc445
.dofunc446:
 mov ax, [nreturn]
 or  al, al
 je .dofunc447

;-1006         prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2

;-1007         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-1008         prc(':');

 push 58
 call prc
 add  sp, 2

;-1009         }


;-1010   if (LTop > LSTART) prs(" LEAVE");

.dofunc447:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc448
 push dofunc_7
 call prs
 add  sp, 2

;-1011   prs("\n ret");

.dofunc448:
 push dofunc_8
 call prs
 add  sp, 2

;-1012   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-1013   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-1014   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc449
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-1015   prs("\nENDP");

.dofunc449:
 push dofunc_9
 call prs
 add  sp, 2

;-1016 }


;-1017 


;-1018 char doglobName[IDLENMAX];
 LEAVE
 ret
dofunc_0 db "Function already defined",0
dofunc_1 db "Function table full",0
dofunc_2 db "\n\n",0
dofunc_3 db ": PROC",0
dofunc_4 db ";\n ENTER  ",0
dofunc_5 db ",0",0
dofunc_6 db "\n .retn",0
dofunc_7 db " LEAVE",0
dofunc_8 db "\n ret",0
dofunc_9 db "\nENDP",0
ENDP
section .bss
absolute 42466
doglobName resb 15
section .text

;-1019 int doglob() {


doglob: PROC

;-1020     int i; int j; int isstrarr; isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-1021   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob450
 push doglob_0
 call error1
 add  sp, 2

;-1022   if (iswidth == 0) error1("no VOID as var type");

.doglob450:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob451
 push doglob_1
 call error1
 add  sp, 2

;-1023   checknamelen();

.doglob451:
 call checknamelen

;-1024   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob452
 push doglob_2
 call error1
 add  sp, 2

;-1025   if (istoken('[')) { istype='&';

.doglob452:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob453
 mov ax, 38
 mov byte [istype], al

;-1026     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob454

;-1027       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-1028       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-1029       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-1030       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob455
 push doglob_5
 call prs
 add  sp, 2

;-1031       if (iswidth==2) prs(" resw ");

.doglob455:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob456
 push doglob_6
 call prs
 add  sp, 2

;-1032       if (iswidth==4) prs(" resd ");

.doglob456:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob457
 push doglob_7
 call prs
 add  sp, 2

;-1033       prunsign1(lexval);

.doglob457:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-1034       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-1035       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-1036       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob458
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-1037       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob458:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob459
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-1038       GData[GTop]=lexval; expect(']');

.doglob459:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-1039     }else { expect(']');

 jmp .doglob460
.doglob454:
 push 93
 call expect
 add  sp, 2

;-1040       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob461
 push doglob_9
 call error1
 add  sp, 2

;-1041       prs("\n"); prs(symbol); prs(" db ");

.doglob461:
 push doglob_10
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push doglob_11
 call prs
 add  sp, 2

;-1042       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-1043       expect('=');

 push 61
 call expect
 add  sp, 2

;-1044       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob462

;-1045         prc(34); prscomment(symbol); prc(34); prs(",0");

 push 34
 call prc
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
 push 34
 call prc
 add  sp, 2
 push doglob_12
 call prs
 add  sp, 2

;-1046         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1047       else if (istoken('{' )) { i=0;

 jmp .doglob463
.doglob462:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob464
 mov ax, 0
 mov [bp-2], ax

;-1048         do { if(i) prc(',');

.doglob465:
 mov ax, [bp-2]
 or  al, al
 je .doglob466
 push 44
 call prc
 add  sp, 2

;-1049           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob466:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-1050         while (istoken(',')); expect('}'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob467
 jmp .doglob465
.doglob467:
 push 125
 call expect
 add  sp, 2

;-1051       else error1("String or number array expected");

 jmp .doglob468
.doglob464:
 push doglob_13
 call error1
 add  sp, 2

;-1052       };

.doglob468:
.doglob463:
.doglob460:

;-1053   }else { //expect('=');

 jmp .doglob469
.doglob453:

;-1054     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob470
 push doglob_15
 call prs
 add  sp, 2

;-1055     else {

 jmp .doglob471
.doglob470:

;-1056       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob472
 push doglob_16
 call prs
 add  sp, 2

;-1057       else if (iswidth==2) prs(" dw ");

 jmp .doglob473
.doglob472:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob474
 push doglob_17
 call prs
 add  sp, 2

;-1058       else                 prs(" dd ");

 jmp .doglob475
.doglob474:
 push doglob_18
 call prs
 add  sp, 2

;-1059     }

.doglob475:
.doglob473:

;-1060     if(istoken('-')) prc('-');

.doglob471:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob476
 push 45
 call prc
 add  sp, 2

;-1061     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob476:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob477
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-1062     else prunsign1(0); }

 jmp .doglob478
.doglob477:
 push 0
 call prunsign1
 add  sp, 2
.doglob478:

;-1063   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob469:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-1064   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1065   pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1066   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob479
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob480
.doglob479:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1067   GTop++; expect(';'); }

.doglob480:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-1068 


;-1069 


;-1070 int dodefine() {
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

;-1071     int i; int j; int fdtemp;


;-1072     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine481

;-1073         token=getlex();

 call getlex
 mov word [token], ax

;-1074         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1075         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1076         return;

 jmp .retndodefine

;-1077     }


;-1078     expect(T_NAME);

.dodefine481:
 push 256
 call expect
 add  sp, 2

;-1079     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine482

;-1080         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine483
 push dodefine_1
 call error1
 add  sp, 2

;-1081         i=strlen(symbol);

.dodefine483:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1082         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine484
 push dodefine_2
 call error1
 add  sp, 2

;-1083         GSign [GTop]='U';

.dodefine484:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1084         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1085         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1086         GAdr [GTop]=lineno-1;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax

;-1087         GUsed [GTop]=0;

 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1088         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1089         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1090         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1091         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1092         GTop++;

 inc  word[GTop]

;-1093     }


;-1094 }

.dodefine482:

;-1095 


;-1096 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1097     token=getlex();

 call getlex
 mov word [token], ax

;-1098     do {

.parse485:

;-1099         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse486
 mov ax, 1
 jmp .retnparse

;-1100         if (istoken('#')) {

.parse486:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse487

;-1101              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse488
 call dodefine

;-1102              else error1("define expected");

 jmp .parse489
.parse488:
 push parse_0
 call error1
 add  sp, 2

;-1103         }

.parse489:

;-1104     else{

 jmp .parse490
.parse487:

;-1105         typeName();

 call typeName

;-1106         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse491
 call dofunc

;-1107         else doglob(); }

 jmp .parse492
.parse491:
 call doglob
.parse492:

;-1108     } while(1);

.parse490:
 mov ax, 1
 or  al, al
 je .parse493
 jmp .parse485
.parse493:

;-1109 }


;-1110 


;-1111 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130

;-1112 int main() {


main: PROC

;-1113     int arglen1; unsigned int i; char *c;


;-1114     arglen1=*arglen;
;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1115     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main494

;-1116         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1117         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2

;-1118         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1119         }


;-1120     i=arglen1+129;

.main494:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1121     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1122     arglen1--;

 dec  word[bp-2]

;-1123     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1124     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1125     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main495
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-1126     strcpy(namelst, namein);

.main495:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1127     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1128     i--;

 dec  word[bp-4]

;-1129     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1130     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1131 


;-1132     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1133     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main496

;-1134         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2

;-1135         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1136         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1137         }


;-1138     fdout=creatR(namelst);

.main496:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1139     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main497

;-1140         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2

;-1141         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1142         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1143         }


;-1144     prs("\n; ");

.main497:
 push main_4
 call prs
 add  sp, 2

;-1145     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1146     prs(", Source: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1147     prs(", Output asm: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1148     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2

;-1149     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1150     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1151     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1152     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1153     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1154     parse();

 call parse

;-1155     prs("\n;Input: "); prs(namein);

 push main_8
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1156     prs(", List: ");   prs(namelst);

 push main_9
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1157     prs(", Lines: "); prunsign1(lineno);

 push main_10
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-1158     prs("\n;Glob. variables: "); GTop--; prunsign1(GTop);

 push main_11
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call prunsign1
 add  sp, 2

;-1159     prs(" ("); prunsign1(LSTART);

 push main_12
 call prs
 add  sp, 2
 push 200
 call prunsign1
 add  sp, 2

;-1160     prs("), Functions: "); prunsign1(FTop);

 push main_13
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2

;-1161     prs(" ("); prunsign1(FUNCMAX);

 push main_14
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2

;-1162     prs(")\n;Const in '"); prs(coname); prs("': "); prunsign1(maxco);

 push main_15
 call prs
 add  sp, 2
 lea  ax, [coname]
 push ax
 call prs
 add  sp, 2
 push main_16
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2

;-1163     prs(" ("); prunsign1(COMAX);

 push main_17
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2

;-1164     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax

;-1165     if (i <= 1000)prs("\n *** Warning *** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main498
 push main_18
 call prs
 add  sp, 2

;-1166     prs("), stacksize: ");

.main498:
 push main_19
 call prs
 add  sp, 2

;-1167     i=65636; i=i-orgData;

 mov ax, 100
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax

;-1168     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2

;-1169     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main499
 push main_20
 call prs
 add  sp, 2

;-1170     prs("          ");

.main499:
 push main_21
 call prs
 add  sp, 2

;-1171     end1(0);

 push 0
 call end1
 add  sp, 2

;-1172 }
 LEAVE
 ret
main_0 db " Usage: A.COM in_file[.C]: ",0
main_1 db ".C",0
main_2 db "Source file missing (.C): ",0
main_3 db "list file not creatable: ",0
main_4 db "\n; ",0
main_5 db ", Source: ",0
main_6 db ", Output asm: ",0
main_7 db "\norg  256 \njmp main",0
main_8 db "\n;Input: ",0
main_9 db ", List: ",0
main_10 db ", Lines: ",0
main_11 db "\n;Glob. variables: ",0
main_12 db " (",0
main_13 db "), Functions: ",0
main_14 db " (",0
main_15 db ")\n;Const in '",0
main_16 db "': ",0
main_17 db " (",0
main_18 db "\n *** Warning *** constant area too small",0
main_19 db "), stacksize: ",0
main_20 db "\n *** Warning *** Stack too small",0
main_21 db "          ",0
ENDP
;Input: A.C, List: A.S, Lines: 1173
;Glob. variables: 107 (200), Functions: 77 (300)
;Const in 'checkreg': 712 (3000), stacksize: 23155          