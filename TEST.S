
; A.COM V0.9.2, Source: A.C, Output asm: A.S
org  256 
jmp main

;-1 char Version1[]="A.COM V0.9.2";//todo: 2. op=reg not recognized

Version1 db "A.COM V0.9.2",0

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


;-335 int getdigit(char c) { int i;

 .retnnext: LEAVE
 ret
ENDP

getdigit: PROC

;-336     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-337     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit63
 mov ax, 88
 mov byte [thechar], al
.getdigit63:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit64
 call next

;-338       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit65:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit66
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit67
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-339 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit67:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit68
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit68:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-340      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-341     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

 jmp .getdigit65
.getdigit66:
 jmp .getdigit69
.getdigit64:
.getdigit70:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit71
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-342      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit70
.getdigit71:

;-343 }

.getdigit69:

;-344 int getstring(int delim) {
 LEAVE
 ret
ENDP

getstring: PROC

;-345     int c; char *p;


;-346     p=&symbol;
;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax

;-347     c=next();

 call next
 mov [bp-2], ax

;-348     while (c != delim) {

.getstring72:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring73

;-349         *p=c;

 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-350         p++;

 inc  word[bp-4]

;-351         c=next();

 call next
 mov [bp-2], ax

;-352     }


;-353     *p=0;

 jmp .getstring72
.getstring73:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-354 }


;-355 


;-356 int adrF(char *s, unsigned int i) {
 LEAVE
 ret
ENDP

adrF: PROC

;-357     i << 4;//*16; IDLENMAX=15!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-358     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 

;-359 }


;-360 


;-361 int printName(unsigned int i) {
 LEAVE
 ret
ENDP

printName: PROC

;-362     int j;


;-363     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName74

;-364         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax

;-365         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2

;-366     }


;-367     else {

 jmp .printName75
.printName74:

;-368         prs("[bp");

 push printName_0
 call prs
 add  sp, 2

;-369         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-370         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName76
 push 43
 call prc
 add  sp, 2

;-371         pint1(j);

.printName76:
 push word [bp-2]
 call pint1
 add  sp, 2

;-372         prc(']');

 push 93
 call prc
 add  sp, 2

;-373     }


;-374 }

.printName75:

;-375 int convertdefine() { int i; int j;   i=0;
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

convertdefine: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-376   while (i < GTop) {

.convertdefine77:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine78

;-377    j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-378    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine79
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine80
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-379    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine80:

;-380    i++; }

.convertdefine79:
 inc  word[bp-2]

;-381    return 0; }

 jmp .convertdefine77
.convertdefine78:
 mov ax, 0
 jmp .retnconvertdefine

;-382 


;-383 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 .retnconvertdefine: LEAVE
 ret
ENDP

ifEOL: PROC

;-384     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL81
 mov ax, 1
 jmp .retnifEOL

;-385     if (c == 13) {//CR

.ifEOL81:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL82

;-386         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL83
 call next
 mov [bp+4], al

;-387         return 1;

.ifEOL83:
 mov ax, 1
 jmp .retnifEOL

;-388     }


;-389     return 0;

.ifEOL82:
 mov ax, 0
 jmp .retnifEOL

;-390 }


;-391 


;-392 char symboltemp[80];

 .retnifEOL: LEAVE
 ret
ENDP
section .bss
absolute 42324
symboltemp resb 80
section .text

;-393 int getlex() { char c; char *p;


getlex: PROC

;-394 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex84
 mov ax, 0
 jmp .retngetlex
.getlex84:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex85
 jmp .g1

;-395   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex85:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex86
 mov al, [thechar]
 cmp al, 61
 jne .getlex87
 call next
 mov ax, 806
 jmp .retngetlex
.getlex87:

;-396   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex86:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex88
 mov al, [thechar]
 cmp al, 61
 jne .getlex89
 call next
 mov ax, 807
 jmp .retngetlex
.getlex89:

;-397   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex88:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex90
 mov al, [thechar]
 cmp al, 61
 jne .getlex91
 call next
 mov ax, 824
 jmp .retngetlex
.getlex91:

;-398   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex90:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex92
 mov al, [thechar]
 cmp al, 61
 jne .getlex93
 call next
 mov ax, 811
 jmp .retngetlex
.getlex93:

;-399   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex92:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex94
 mov al, [thechar]
 cmp al, 60
 jne .getlex95
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex95:

;-400   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex94:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex96
 mov al, [thechar]
 cmp al, 62
 jne .getlex97
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex97:

;-401   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex96:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex98
 mov al, [thechar]
 cmp al, 43
 jne .getlex99
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex99:

;-402   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex98:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex100
 mov al, [thechar]
 cmp al, 45
 jne .getlex101
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex101:

;-403   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex100:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex102
 mov al, [thechar]
 cmp al, 61
 jne .getlex103
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex103:

;-404   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex102:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex104
 mov al, [thechar]
 cmp al, 61
 jne .getlex105
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex105:

;-405   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex104:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex106
 mov al, [thechar]
 cmp al, 61
 jne .getlex107
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex107:

;-406   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex106:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex108
 mov al, [thechar]
 cmp al, 61
 jne .getlex109
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex109:

;-407   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex108:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex110
 mov al, [thechar]
 cmp al, 61
 jne .getlex111
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex111:

;-408   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex110:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex112
 mov al, [thechar]
 cmp al, 61
 jne .getlex113
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex113:

;-409   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex112:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex114
 mov al, [bp-2]
 jmp .retngetlex

;-410   if (c == '/') { if (thechar == '/') {

.getlex114:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex115
 mov al, [thechar]
 cmp al, 47
 jne .getlex116

;-411       do c=next(); while(ifEOL(c)==0) return getlex(); } }

.getlex117:
 call next
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex118
 jmp .getlex117
.getlex118:
 call getlex
 jmp .retngetlex
.getlex116:

;-412   if (c == '/') { if (thechar == '*') {

.getlex115:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex119
 mov al, [thechar]
 cmp al, 42
 jne .getlex120

;-413       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex121
 jmp .g2
.getlex121:
 mov al, [thechar]
 cmp al, 47
 je  .getlex122
 jmp .g2

;-414       c=next(); return getlex(); } else  return '/'; }

.getlex122:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex123
.getlex120:
 mov ax, 47
 jmp .retngetlex
.getlex123:

;-415   if (c == '"') {getstring(c); return T_STRING;}

.getlex119:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex124
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-416   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex124:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex125
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-417   if (c==39) { lexval=next();

.getlex125:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex126
 call next
 mov word [lexval], ax

;-418     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex127
 call next
 mov word [lexval], ax

;-419       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex128
 mov ax, 10
 mov word [lexval], ax
.getlex128:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex129
 mov ax, 9
 mov word [lexval], ax

;-420       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex129:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex130
 mov ax, 0
 mov word [lexval], ax
.getlex130:
.getlex127:
 call next
 mov ax, 257
 jmp .retngetlex

;-421   if (alnum(c)) {

.getlex126:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex131

;-422     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
 mov ax, symbol
 mov [bp-4], ax
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-423     while(alnum(thechar)) {c=next(); *p=c;  p++; }

.getlex132:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex133
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-424       *p=0;

 jmp .getlex132
.getlex133:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-425     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 531
 jmp .retngetlex

;-426     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex134:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 532
 jmp .retngetlex

;-427     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex135:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 529
 jmp .retngetlex

;-428     if (eqstr(symbol,"int"     )) return T_INT;

.getlex136:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 517
 jmp .retngetlex

;-429     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex137:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 533
 jmp .retngetlex

;-430     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex138:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 530
 jmp .retngetlex

;-431     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex139:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 518
 jmp .retngetlex

;-432     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex140:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 519
 jmp .retngetlex

;-433     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex141:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 520
 jmp .retngetlex

;-434     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex142:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
 mov ax, 512
 jmp .retngetlex

;-435     if (eqstr(symbol,"if"      )) return T_IF;

.getlex143:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144
 mov ax, 513
 jmp .retngetlex

;-436     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex144:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145
 mov ax, 514
 jmp .retngetlex

;-437     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex145:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex146
 mov ax, 515
 jmp .retngetlex

;-438     if (eqstr(symbol,"do"      )) return T_DO;

.getlex146:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex147
 mov ax, 516
 jmp .retngetlex

;-439     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex147:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex148
 mov ax, 521
 jmp .retngetlex

;-440     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex148:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex149
 mov ax, 511
 jmp .retngetlex

;-441     if (convertdefine() ) {

.getlex149:
 call convertdefine
 or  al, al
 je .getlex150

;-442         strcpy(symbol, symboltemp); return T_CONST;

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-443     }


;-444     return T_NAME; } error1("Input item not recognized");

.getlex150:
 mov ax, 256
 jmp .retngetlex
.getlex131:
 push getlex_17
 call error1
 add  sp, 2

;-445 }


;-446 


;-447 int istoken(int t) {

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

;-448     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken151

;-449         token=getlex();

 call getlex
 mov word [token], ax

;-450         return 1;

 mov ax, 1
 jmp .retnistoken

;-451     }


;-452     return 0;

.istoken151:
 mov ax, 0
 jmp .retnistoken

;-453 }


;-454 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-455     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect152

;-456         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-457         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-458         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-459         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-460         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-461     }


;-462 }

.expect152:

;-463 


;-464 


;-465 int a(unsigned int i) { printName(i);//address
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

a: PROC;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-466 }


;-467 int v(unsigned int i) {//value
 LEAVE
 ret
ENDP

v: PROC

;-468     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v153
 push 91
 call prc
 add  sp, 2

;-469     printName(i);

.v153:
 push word [bp+4]
 call printName
 add  sp, 2

;-470     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v154
 push 93
 call prc
 add  sp, 2

;-471 }

.v154:

;-472 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-473     int i;


;-474     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-475     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen155
 push checknamelen_0
 call error1
 add  sp, 2

;-476 }

.checknamelen155:

;-477 


;-478 int checkName() { unsigned int i; unsigned int j;
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

checkName: PROC

;-479     i=LSTART;
;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax

;-480     while(i<LTop) {

.checkName156:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName157

;-481         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-482         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName158
 mov ax, [bp-2]
 jmp .retncheckName

;-483         i++;

.checkName158:
 inc  word[bp-2]

;-484     }


;-485     i=1;

 jmp .checkName156
.checkName157:
 mov ax, 1
 mov [bp-2], ax

;-486     while(i<GTop) {

.checkName159:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName160

;-487         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-488         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName161
 mov ax, [bp-2]
 jmp .retncheckName

;-489         i++;

.checkName161:
 inc  word[bp-2]

;-490     }


;-491     return 0;

 jmp .checkName159
.checkName160:
 mov ax, 0
 jmp .retncheckName

;-492 }


;-493 int searchname() { unsigned int i;

 .retncheckName: LEAVE
 ret
ENDP

searchname: PROC

;-494   i=checkName(); if (i == 0) error1("Variable unknown");
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname162
 push searchname_0
 call error1
 add  sp, 2

;-495   GUsed[i]=GUsed[i] + 1; return i;

.searchname162:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp .retnsearchname

;-496 }


;-497 int name1() {

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC

;-498     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1163
 push name1_0
 call error1
 add  sp, 2

;-499     token=getlex();

.name1163:
 call getlex
 mov word [token], ax

;-500 }


;-501 int typeName() { int m; //0=V,1=*,2=&

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC

;-502     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-503     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 83
 mov byte [issign], al

;-504     if(istoken(T_UNSIGNED)) issign='U';

.typeName164:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 85
 mov byte [issign], al

;-505     iswidth=2;

.typeName165:
 mov ax, 2
 mov byte [iswidth], al

;-506     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 0
 mov byte [iswidth], al

;-507     if(istoken(T_CHAR))     iswidth=1;

.typeName166:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 1
 mov byte [iswidth], al

;-508     if(istoken(T_INT))      iswidth=2;

.typeName167:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName168
 mov ax, 2
 mov byte [iswidth], al

;-509     if(istoken(T_LONG))     iswidth=4;

.typeName168:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName169
 mov ax, 4
 mov byte [iswidth], al

;-510     istype='V';

.typeName169:
 mov ax, 86
 mov byte [istype], al

;-511     m=0;

 mov ax, 0
 mov [bp-2], ax

;-512     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName170
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-513     if(istoken('&'))  {istype='&'; m=2;}

.typeName170:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName171
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-514     name1();

.typeName171:
 call name1

;-515     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-516 }


;-517 int gettypes(int i) {int j; char c;

 .retntypeName: LEAVE
 ret
ENDP

gettypes: PROC

;-518   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes172
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes173
.gettypes172:
 mov ax, 0
 mov word [signi], ax

;-519   c=GWidth[i]; widthi=0;wi=0;

.gettypes173:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-520   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes174
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-521   if (c==2) {widthi=2;wi=2;}

.gettypes174:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes175
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-522   if (c==4) {widthi=4;wi=4;}

.gettypes175:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes176
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-523   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes176:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes177
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-524   if (c=='&')  typei=2;

.gettypes177:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes178
 mov ax, 2
 mov word [typei], ax

;-525   return i; }

.gettypes178:
 mov ax, [bp+4]
 jmp .retngettypes

;-526 


;-527 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");

 .retngettypes: LEAVE
 ret
ENDP

storefunc: PROC
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc179
 push storefunc_0
 call error1
 add  sp, 2

;-528     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc179:
 mov ax, [lineno]
 sub ax, 1
 mov bx, [FTop]
 shl bx, 1
 mov [FAdr+bx], ax
 mov ax, 0
 mov bx, [FTop]
 shl bx, 1
 mov [FCalls+bx], ax
 mov al, [iswidth]
 mov bx, [FTop]
 mov [FType+bx], al

;-529     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 inc  word[FTop]

;-530 }


;-531 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal180
 push addlocal_0
 call error1
 add  sp, 2

;-532   if (checkName() != 0) error1("Variable already defined");

.addlocal180:
 call checkName
 cmp ax, 0
 je  .addlocal181
 push addlocal_1
 call error1
 add  sp, 2

;-533   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal181:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-534   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-535   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-536 }


;-537 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-538   while (i < FTop) {

.checkFunction182:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction183

;-539     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

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
 je .checkFunction184
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction184:
 inc  word[bp-2]

;-540   return 0; }

 jmp .checkFunction182
.checkFunction183:
 mov ax, 0
 jmp .retncheckFunction

;-541 


;-542 int isvariable() {

 .retncheckFunction: LEAVE
 ret
ENDP

isvariable: PROC

;-543     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable185
 jmp .v1

;-544     if(token==T_UNSIGNED) goto v1;

.isvariable185:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable186
 jmp .v1

;-545     if(token==T_CHAR)     goto v1;

.isvariable186:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable187
 jmp .v1

;-546     if(token==T_INT)      goto v1;

.isvariable187:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable188
 jmp .v1

;-547     if(token==T_LONG)     goto v1;

.isvariable188:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable189
 jmp .v1

;-548     return 0;

.isvariable189:
 mov ax, 0
 jmp .retnisvariable

;-549 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-550 }


;-551 


;-552 int cmpneg(int ids) {

 .retnisvariable:
 ret
ENDP

cmpneg: PROC

;-553        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg190
 push cmpneg_0
 call prs
 add  sp, 2

;-554   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg191
.cmpneg190:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg192
 push cmpneg_1
 call prs
 add  sp, 2

;-555   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg193
.cmpneg192:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg194
 mov ax, [bp+4]
 or  al, al
 je .cmpneg195
 push cmpneg_2
 call prs
 add  sp, 2

;-556                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg196
.cmpneg195:
 push cmpneg_3
 call prs
 add  sp, 2

;-557   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

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
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-558                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-559                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg200
.cmpneg199:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-560                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-561   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg200:
 jmp .cmpneg201
.cmpneg198:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg202
 push cmpneg_8
 call prs
 add  sp, 2

;-562   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg203
.cmpneg202:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg204
 push cmpneg_9
 call prs
 add  sp, 2

;-563   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg205
.cmpneg204:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg205:
.cmpneg203:
.cmpneg201:
.cmpneg197:
.cmpneg193:
.cmpneg191:

;-564 


;-565   int isrelational() {
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

;-566     if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational206
 jmp .w
.isrelational206:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational207
 jmp .w

;-567     if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational207:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational208
 jmp .w
.isrelational208:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational209
 jmp .w

;-568     if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational209:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational210
 jmp .w
.isrelational210:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational211
 jmp .w

;-569     return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational211:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-570 


;-571 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC

;-572   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg212
 mov ax, 0
 jmp .retncheckreg

;-573   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg212:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 1
 jmp .retncheckreg
.checkreg213:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 3
 jmp .retncheckreg

;-574   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg214:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 5
 jmp .retncheckreg
.checkreg215:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 7
 jmp .retncheckreg

;-575   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg216:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 9
 jmp .retncheckreg
.checkreg217:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 11
 jmp .retncheckreg

;-576   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg218:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 13
 jmp .retncheckreg
.checkreg219:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 15
 jmp .retncheckreg

;-577   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg220:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 17
 jmp .retncheckreg
.checkreg221:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 19
 jmp .retncheckreg

;-578   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg222:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 21
 jmp .retncheckreg
.checkreg223:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 23
 jmp .retncheckreg

;-579   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg224:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 25
 jmp .retncheckreg
.checkreg225:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 27
 jmp .retncheckreg

;-580   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg226:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 29
 jmp .retncheckreg
.checkreg227:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 31
 jmp .retncheckreg

;-581   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg228:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 33
 jmp .retncheckreg
.checkreg229:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 35
 jmp .retncheckreg

;-582   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg230:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 37
 jmp .retncheckreg
.checkreg231:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 39
 jmp .retncheckreg

;-583   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg232:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 41
 jmp .retncheckreg
.checkreg233:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 43
 jmp .retncheckreg

;-584   // (eqstr(symbol,"ip")) return 45;


;-585   if (strlen(symbol) >   3) return 0;

.checkreg234:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg235
 mov ax, 0
 jmp .retncheckreg

;-586   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg235:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg236
 mov ax, 47
 jmp .retncheckreg
.checkreg236:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg237
 mov ax, 50
 jmp .retncheckreg

;-587   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg237:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg238
 mov ax, 53
 jmp .retncheckreg
.checkreg238:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg239
 mov ax, 56
 jmp .retncheckreg

;-588   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg239:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg240
 mov ax, 59
 jmp .retncheckreg
.checkreg240:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg241
 mov ax, 62
 jmp .retncheckreg

;-589   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg241:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg242
 mov ax, 65
 jmp .retncheckreg
.checkreg242:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg243
 mov ax, 68
 jmp .retncheckreg

;-590   if (eqstr(symbol,"cr0")) return 71;

.checkreg243:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg244
 mov ax, 71
 jmp .retncheckreg

;-591   return 0;   }

.checkreg244:
 mov ax, 0
 jmp .retncheckreg

;-592 


;-593 char printregstr[]

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

;-594 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-595 


;-596 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-597   k = &printregstr + i; c=*k; prc(c); i++;
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

;-598   k = &printregstr + i; c=*k; prc(c);

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

;-599   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg245
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

;-600 }

.printreg245:

;-601 


;-602 int constantexpr() { int mode; int id1;int ids;
 LEAVE
 ret
ENDP

constantexpr: PROC

;-603   token=getlex();   mode=typeName();
;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-604   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-605   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr246
 push constantexpr_0
 call error1
 add  sp, 2

;-606   expect(T_CONST);  prs(" ; constant expression");

.constantexpr246:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-607   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-608   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr247
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr248
.constantexpr247:
 push constantexpr_4
 call prs
 add  sp, 2

;-609   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr248:
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

;-610   expect(')');

 push 41
 call expect
 add  sp, 2

;-611 }


;-612 


;-613 char ops[5];
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

;-614 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-615   if (istoken('='))          strcpy(ops, "mov");
;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1249
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-616   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1249:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1250
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-617   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1250:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1251
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-618   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1251:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1252
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-619   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1252:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1253
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-620   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1253:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1254
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-621   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1254:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1255
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-622   if (iscmp1 == 1) { token=getlex();

.doreg1255:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1256
 call getlex
 mov word [token], ax

;-623       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1257
 push doreg1_7
 call error1
 add  sp, 2

;-624       strcpy(ops, "cmp"); }

.doreg1257:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-625   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1256:
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

;-626 


;-627   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1258
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-628   mod2=typeName(); ireg2=checkreg();

.doreg1258:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-629   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1259
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-630   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1259:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1260
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1261
.doreg1260:
 push word [bp-2]
 call v
 add  sp, 2

;-631   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1261:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1262
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

;-632 }

.doreg1262:

;-633 


;-634 int compoundass(char *op, int mode, int id1) {
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

;-635   if(mode) error1("only scalar Var allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass263
 push compoundass_0
 call error1
 add  sp, 2

;-636   prnl(); prs(op); prs("  ");

.compoundass263:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-637   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass264
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass265
.compoundass264:
 push compoundass_3
 call prs
 add  sp, 2

;-638   v(id1); prs(", ");

.compoundass265:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-639   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-640 }


;-641 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-642   gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-643   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1266
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

;-644     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1267
 push dovar1_1
 call prs
 add  sp, 2

;-645     if(widthi == 2) prs(" ax, [bx]");

.dovar1267:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1268
 push dovar1_2
 call prs
 add  sp, 2

;-646     return; }

.dovar1268:
 jmp .retndovar1

;-647   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1266:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1269
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2
 push dovar1_3
 call prs
 add  sp, 2
 push word [bp+10]
 call a
 add  sp, 2
 jmp .retndovar1

;-648   if (ixarr) {

.dovar1269:
 mov ax, [bp+8]
 or  al, al
 je .dovar1270

;-649     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-650     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1271
 push dovar1_5
 call prs
 add  sp, 2

;-651     prs("\n "); prs(op);

.dovar1271:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-652     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1272
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1273
.dovar1272:
 push dovar1_8
 call prs
 add  sp, 2

;-653 // v(id1); prs(" [bx]");


;-654     prc('['); printName(id1); prs(" + bx]");

.dovar1273:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-655     return; }

 jmp .retndovar1

;-656   prnl();prs(op);

.dovar1270:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-657   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1274
 push dovar1_10
 call prs
 add  sp, 2

;-658   if(wi==2) prs(" ax, ");

.dovar1274:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1275
 push dovar1_11
 call prs
 add  sp, 2

;-659   if(wi==4) prs(" eax, ");

.dovar1275:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1276
 push dovar1_12
 call prs
 add  sp, 2

;-660   v(id1);

.dovar1276:
 push word [bp+10]
 call v
 add  sp, 2

;-661 }


;-662 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-663   if (istoken(T_CONST)) { prnl(); prs(op);
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm277
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-664     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm278
 push rterm_0
 call prs
 add  sp, 2

;-665     if (wi==2) prs(" ax, ");

.rterm278:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm279
 push rterm_1
 call prs
 add  sp, 2

;-666     if (wi==4) prs(" eax, ");

.rterm279:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm280
 push rterm_2
 call prs
 add  sp, 2

;-667     prunsign1(lexval); return;}

.rterm280:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-668   mode=typeName(); id1=searchname(); ixarr=0;

.rterm277:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-669   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm281
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-670     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-671     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm282
 push rterm_3
 call error1
 add  sp, 2
.rterm282:

;-672   if (eqstr(symbol,"_AX")) return;

.rterm281:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm283
 jmp .retnrterm

;-673   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm283:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-674 }


;-675 


;-676 int doreg(char *dr) { int i; expect('=');

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

;-677   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-678        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg284
 push word [lexval]
 call prunsign1
 add  sp, 2

;-679   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg285
.doreg284:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg286
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-680   else error1("only number or var allowed");

 jmp .doreg287
.doreg286:
 push doreg_2
 call error1
 add  sp, 2

;-681 }

.doreg287:
.doreg285:

;-682 int isreg() {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

isreg: PROC

;-683   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg288
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-684   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg288:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg289
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-685   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg289:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg290
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-686   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg290:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg291
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-687   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg291:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg292
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-688   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg292:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg293
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-689   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg293:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg294
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-690   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg294:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg295
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-691   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg295:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg296
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-692   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg296:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg297
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-693   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg297:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg298
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-694   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg298:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg299
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-695   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg299:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg300
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-696   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg300:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg301
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-697   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg301:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg302
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-698   return 0;   r1: return 1;

.isreg302:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-699 }


;-700 


;-701 int doassign(int mode, int i, int ixarr, int ixconst) {

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

;-702   gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-703   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign303
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-704     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign304
 push doassign_1
 call prs
 add  sp, 2

;-705     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign305
.doassign304:
 push doassign_2
 call prs
 add  sp, 2
.doassign305:
 jmp .retndoassign

;-706   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign303:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign306
 push doassign_3
 call prs
 add  sp, 2
 push word [bp+6]
 call a
 add  sp, 2
 push doassign_4
 call prs
 add  sp, 2
 jmp .retndoassign

;-707   if (ixarr) {  prs("\n mov bx, ");

.doassign306:
 mov ax, [bp+8]
 or  al, al
 je .doassign307
 push doassign_5
 call prs
 add  sp, 2

;-708     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign308
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign309
.doassign308:
 push word [bp+8]
 call v
 add  sp, 2

;-709     if (wi==2) prs("\n shl bx, 1");

.doassign309:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign310
 push doassign_6
 call prs
 add  sp, 2

;-710     prs("\n mov ["); printName(i);

.doassign310:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-711     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign311
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign312
.doassign311:
 push doassign_9
 call prs
 add  sp, 2
.doassign312:
 jmp .retndoassign

;-712   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign307:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign313
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign314
 push doassign_11
 call prs
 add  sp, 2

;-713     } v(i); prs(", al"); return; }

.doassign314:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-714   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign313:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign315
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign316
 push doassign_14
 call prs
 add  sp, 2

;-715     } v(i); prs(", ax"); return; }

.doassign316:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-716   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign315:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign317
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign318
 push doassign_17
 call prs
 add  sp, 2

;-717     } v(i); prs(", eax"); return; }

.doassign318:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-718 }

.doassign317:

;-719 int domul(int ids) {

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

;-720   if (ids) rterm("imul"); else {
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul319
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul320
.domul319:

;-721   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul321

;-722     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-723     }


;-724   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul322
.domul321:
 push domul_3
 call error1
 add  sp, 2
.domul322:
.domul320:

;-725 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-726   if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv323

;-727     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-728     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv324
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv325
.doidiv324:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv325:

;-729   else {

 jmp .doidiv326
.doidiv323:

;-730     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-731     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv327
 push doidiv_3
 call error1
 add  sp, 2

;-732     gettypes(id1);

.doidiv327:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-733     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv328
 push doidiv_4
 call error1
 add  sp, 2

;-734     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv328:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv329
 push doidiv_5
 call error1
 add  sp, 2

;-735     prs("\n mov bx, "); v(id1);

.doidiv329:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-736     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv330
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv331
.doidiv330:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv331:

;-737 }

.doidiv326:

;-738 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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

;-739 


;-740 


;-741 int docalltype[10]; int docallvalue[10];
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

;-742 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 42449
procname resb 17
section .text

;-743 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-744   narg=0;  sz32=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-745   checknamelen();

 call checknamelen

;-746   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-747 //  storeCall1();


;-748   expect('(');

 push 40
 call expect
 add  sp, 2

;-749 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1332

;-750 	  do { narg++;

.docall1333:
 inc  word[bp-4]

;-751 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1334
 push docall1_0
 call error1
 add  sp, 2
.docall1334:
 mov ax, 0
 mov [bp-6], ax

;-752       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1335
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-753       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1335:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1336
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-754         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-755         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-756       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1336:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1337
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-757       if(istoken(T_NAME))  { n0=checkreg();

.docall1337:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1338
 call checkreg
 mov [bp-8], ax

;-758         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1339
 mov ax, 5
 mov [bp-6], ax

;-759         else {t0=4; n0=searchname();

 jmp .docall1340
.docall1339:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-760           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1341
 mov ax, 3
 mov [bp-6], ax
.docall1341:
.docall1340:

;-761       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1338:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1342
 push docall1_4
 call error1
 add  sp, 2

;-762       docalltype [narg] = t0;

.docall1342:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-763       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-764     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1343
 jmp .docall1333
.docall1343:

;-765 


;-766   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-767     do {

.docall1344:

;-768       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-769       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-770       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1345
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-771       if(t0==2){ prs("\n push ");

.docall1345:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1346
 push docall1_6
 call prs
 add  sp, 2

;-772         prs(fname);prc(95);prunsign1(n0);}

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

;-773       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1346:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1347
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-774         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-775       if(t0==4){ gettypes(n0);

.docall1347:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1348
 push word [bp-8]
 call gettypes
 add  sp, 2

;-776         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1349
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-777         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1350
.docall1349:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-778         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1350:

;-779       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1348:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1351
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1352
 mov ax, [bp-10]
 add ax, 2
.docall1352:

;-780    i--; } while (i > 0);  }

.docall1351:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1353
 jmp .docall1344
.docall1353:

;-781 	 prs("\n call "); prs(&procname);

.docall1332:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-782 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1354
 push docall1_14
 call prs
 add  sp, 2

;-783      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2

;-784  }

.docall1354:

;-785 


;-786  int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
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

;-787  int expr(int isRight)


expr: PROC

;-788  { int mode; int id1;     int ixarr; int ixconst;


;-789    int ids;  int isCONST; int i;     unsigned char *p;


;-790    if (istoken(T_CONST)) { evalue=lexval;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
 mov ax, [lexval]
 mov word [evalue], ax

;-791      prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-792    mode=typeName(); /*0=V,1=*,2=&*/

.expr355:
 call typeName
 mov [bp-2], ax

;-793    ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-794    if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr356
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-795    if (token=='(')  {docall1(); goto e1; }

.expr356:
 mov ax, [token]
 cmp ax, 40
 jne .expr357
 call docall1
 jmp .e1

;-796    if (isreg()) goto e1;

.expr357:
 call isreg
 or  al, al
 je .expr358
 jmp .e1

;-797 


;-798    id1=searchname(); gettypes(id1); ids=signi;

.expr358:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-799    ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-800      if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr359
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr360

;-801        ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-802      else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr361
.expr360:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-803      gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-804      if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr362
 push expr_1
 call error1
 add  sp, 2
.expr362:
.expr361:

;-805    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

.expr359:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr363
 mov ax, [bp-2]
 or  al, al
 je .expr364
 push expr_2
 call error1
 add  sp, 2

;-806       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr364:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr365
 push expr_4
 call prs
 add  sp, 2
 jmp .expr366
.expr365:
 push expr_5
 call prs
 add  sp, 2

;-807       v(id1); goto e1;}

.expr366:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-808    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

.expr363:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr367
 mov ax, [bp-2]
 or  al, al
 je .expr368
 push expr_6
 call error1
 add  sp, 2

;-809       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr368:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr369
 push expr_8
 call prs
 add  sp, 2
 jmp .expr370
.expr369:
 push expr_9
 call prs
 add  sp, 2

;-810       v(id1); goto e1;}

.expr370:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-811 


;-812    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr367:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr371
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-813    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr371:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr372
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-814    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr372:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr373
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-815    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr373:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr374
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-816    if (istoken(T_MULASS    )) {error1("not implemented");}

.expr374:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr375
 push expr_14
 call error1
 add  sp, 2

;-817    if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr375:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr376
 push expr_15
 call error1
 add  sp, 2

;-818 


;-819    if (istoken('=')) { exprtype= expr(1);

.expr376:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr377
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-820    doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-821    dovar1(mode, "mov", ixarr, id1);

.expr377:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-822 


;-823  e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr378
 push expr_17
 call rterm
 add  sp, 2

;-824    else if (istoken('-')) rterm("sub" );

 jmp .expr379
.expr378:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr380
 push expr_18
 call rterm
 add  sp, 2

;-825    else if (istoken('&')) rterm("and" );

 jmp .expr381
.expr380:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr382
 push expr_19
 call rterm
 add  sp, 2

;-826    else if (istoken('|')) rterm("or" );

 jmp .expr383
.expr382:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr384
 push expr_20
 call rterm
 add  sp, 2

;-827    else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr385
.expr384:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr386
 push expr_21
 call rterm
 add  sp, 2

;-828    else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr387
.expr386:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr388
 push expr_22
 call rterm
 add  sp, 2

;-829    else if (istoken('*')) domul (ids);

 jmp .expr389
.expr388:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr390
 push word [bp-10]
 call domul
 add  sp, 2

;-830    else if (istoken('/')) doidiv(ids);

 jmp .expr391
.expr390:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr392
 push word [bp-10]
 call doidiv
 add  sp, 2

;-831    else if (istoken('%')) domod (ids);

 jmp .expr393
.expr392:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr394
 push word [bp-10]
 call domod
 add  sp, 2

;-832    if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr394:
.expr393:
.expr391:
.expr389:
.expr387:
.expr385:
.expr383:
.expr381:
.expr379:
 call isrelational
 or  al, al
 je .expr395
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-833    return 0;

.expr395:
 mov ax, 0
 jmp .retnexpr

;-834  }


;-835 


;-836  int pexpr() {expect('('); iscmp=0;

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

;-837    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr396
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr397
 call constantexpr
 jmp .retnpexpr

;-838      ireg1=checkreg();

.pexpr397:
 call checkreg
 mov word [ireg1], ax

;-839      if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr398
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr398:

;-840    expr(0);

.pexpr396:
 push 0
 call expr
 add  sp, 2

;-841    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr399
 push pexpr_1
 call prs
 add  sp, 2
.pexpr399:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-842    expect(')');

 push 41
 call expect
 add  sp, 2

;-843  }


;-844 


;-845 /***************************************************************/


;-846 


;-847 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC

;-848     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2

;-849     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-850     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-851     prc(':');

 push 58
 call prc
 add  sp, 2

;-852 }


;-853 int prjump (int n) {
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC

;-854     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2

;-855     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-856     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-857 }


;-858 


;-859 int stmt() {
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC

;-860     int c; char cha;


;-861     int jdest; int tst; int jtemp;


;-862        if(istoken('{'))     {while(istoken('}')==0) stmt();}
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt400
.stmt401:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt402
 call stmt
 jmp .stmt401
.stmt402:

;-863   else if(istoken(T_IF)) {

 jmp .stmt403
.stmt400:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt404

;-864       int jdest; int tst;

 mov ax, [bp-6]
 mov ax, [bp-8]

;-865       pexpr(); nlabel++; jdest=nlabel;

 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax

;-866       pint1(jdest); stmt();

 push word [bp-6]
 call pint1
 add  sp, 2
 call stmt

;-867       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt405
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-8], ax

;-868           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);

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

;-869       }


;-870       else prlabel(jdest);

 jmp .stmt406
.stmt405:
 push word [bp-6]
 call prlabel
 add  sp, 2

;-871   }

.stmt406:

;-872   else if(istoken(T_DO)) {

 jmp .stmt407
.stmt404:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt408

;-873       nlabel++; jdest=nlabel; prlabel(jdest); stmt();

 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax
 push word [bp-6]
 call prlabel
 add  sp, 2
 call stmt

;-874       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-875       prjump(jdest); prlabel(jtemp);

 push word [bp-6]
 call prjump
 add  sp, 2
 push word [bp-10]
 call prlabel
 add  sp, 2

;-876   }


;-877   else if(istoken(T_WHILE)) {

 jmp .stmt409
.stmt408:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt410

;-878       nlabel++; jdest=nlabel;

 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax

;-879       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-880       stmt(); prjump(jdest); prlabel(tst);

 call stmt
 push word [bp-6]
 call prjump
 add  sp, 2
 push word [bp-8]
 call prlabel
 add  sp, 2

;-881   }


;-882   else if(istoken(T_GOTO))  {

 jmp .stmt411
.stmt410:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt412

;-883       prs("\n jmp .");name1();prs(symbol);expect(';');

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

;-884   }


;-885   else if(token==T_ASM)     {

 jmp .stmt413
.stmt412:
 mov ax, [token]
 cmp ax, 518
 jne .stmt414

;-886       prs("\n"); c=next();

 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-887       while(c != '\n') { prc(c);	c=next(); };

.stmt415:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt416
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt415
.stmt416:

;-888       token=getlex();

 call getlex
 mov word [token], ax

;-889   }


;-890   else if(istoken(T_ASMBLOCK)) {

 jmp .stmt417
.stmt414:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt418

;-891       if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt419

;-892           prs("\n"); cha=next();

 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-893           while(cha!= '}') {

.stmt420:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt421

;-894               prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-895               cha=next();

 call next
 mov [bp-4], al

;-896           }


;-897           token=getlex();

 jmp .stmt420
.stmt421:
 call getlex
 mov word [token], ax

;-898       } else error1("Curly open expected");

 jmp .stmt422
.stmt419:
 push stmt_3
 call error1
 add  sp, 2

;-899         }

.stmt422:

;-900   else if(istoken(T_EMIT)) {

 jmp .stmt423
.stmt418:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt424

;-901       prs("\n db ");

 push stmt_4
 call prs
 add  sp, 2

;-902     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax

;-903       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2

;-904       token=getlex();

 call getlex
 mov word [token], ax

;-905       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt425

;-906           prc(',');

 push 44
 call prc
 add  sp, 2

;-907           goto L1;

 jmp .L1

;-908       }


;-909       expect(')');

.stmt425:
 push 41
 call expect
 add  sp, 2

;-910   }


;-911   else if(istoken(';'))      { }

 jmp .stmt426
.stmt424:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt427

;-912   else if(istoken(T_RETURN)) {

 jmp .stmt428
.stmt427:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt429

;-913         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt430
 push 0
 call expr
 add  sp, 2

;-914         prs("\n jmp .retn");

.stmt430:
 push stmt_5
 call prs
 add  sp, 2

;-915         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-916         nreturn++;

 inc  word[nreturn]

;-917         expect(';');

 push 59
 call expect
 add  sp, 2

;-918         }


;-919   else if(thechar==':')      {

 jmp .stmt431
.stmt429:
 mov al, [thechar]
 cmp al, 58
 jne .stmt432

;-920         prs("\n."); // Label

 push stmt_6
 call prs
 add  sp, 2

;-921         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-922         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-923         expect(':');

 push 58
 call expect
 add  sp, 2

;-924         }


;-925   else  {expr(0);; expect(';'); }

 jmp .stmt433
.stmt432:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-926 }

.stmt433:
.stmt431:
.stmt428:
.stmt426:
.stmt423:
.stmt417:
.stmt413:
.stmt411:
.stmt409:
.stmt407:
.stmt403:

;-927 


;-928 


;-929 int dofunc() { int nloc; int i; int narg;
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

;-930   cloc=&co;
;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-931   checknamelen();

 call checknamelen

;-932   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-933   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc434
 push dofunc_0
 call error1
 add  sp, 2

;-934   storefunc();

.dofunc434:
 call storefunc

;-935   prs("\n\n"); prs(symbol); prs(": PROC");

 push dofunc_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push dofunc_2
 call prs
 add  sp, 2

;-936   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-937   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc435
 mov ax, 2
 mov [bp-6], ax

;-938     do { typeName();  addlocal(); narg+=2;

.dofunc436:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-939          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc437
 add  word[bp-6], 2
.dofunc437:
 inc  word[LTop]

;-940     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc438
 jmp .dofunc436
.dofunc438:
 push 41
 call expect
 add  sp, 2

;-941 


;-942   expect('{'); /*body*/

.dofunc435:
 push 123
 call expect
 add  sp, 2

;-943   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-944   while(isvariable()) {

.dofunc439:
 call isvariable
 or  al, al
 je .dofunc440

;-945     do {typeName();

.dofunc441:
 call typeName

;-946         checknamelen();

 call checknamelen

;-947         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-948         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc442
 sub  word[bp-2], 2

;-949         GData[LTop]=nloc;

.dofunc442:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-950         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc443

;-951             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

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

;-952             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-953             }


;-954         LTop++;

.dofunc443:
 inc  word[LTop]

;-955       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc444
 jmp .dofunc441
.dofunc444:
 push 59
 call expect
 add  sp, 2

;-956   if (LTop>LSTART){prs(";\n ENTER  ");

 jmp .dofunc439
.dofunc440:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc445
 push dofunc_3
 call prs
 add  sp, 2

;-957     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2
 push dofunc_4
 call prs
 add  sp, 2

;-958   while(istoken('}')==0)   stmt();

.dofunc445:
.dofunc446:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc447
 call stmt

;-959   if (nreturn) {

 jmp .dofunc446
.dofunc447:
 mov ax, [nreturn]
 or  al, al
 je .dofunc448

;-960         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-961         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-962         prc(':');

 push 58
 call prc
 add  sp, 2

;-963         }


;-964   if (LTop > LSTART) prs(" LEAVE");

.dofunc448:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc449
 push dofunc_6
 call prs
 add  sp, 2

;-965   prs("\n ret");

.dofunc449:
 push dofunc_7
 call prs
 add  sp, 2

;-966   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-967   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-968   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc450
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-969   prs("\nENDP");

.dofunc450:
 push dofunc_8
 call prs
 add  sp, 2

;-970 }


;-971 


;-972 char doglobName[IDLENMAX];
 LEAVE
 ret
dofunc_0 db "Function already defined",0
dofunc_1 db "\n\n",0
dofunc_2 db ": PROC",0
dofunc_3 db ";\n ENTER  ",0
dofunc_4 db ",0",0
dofunc_5 db "\n .retn",0
dofunc_6 db " LEAVE",0
dofunc_7 db "\n ret",0
dofunc_8 db "\nENDP",0
ENDP
section .bss
absolute 42466
doglobName resb 15
section .text

;-973 int doglob() {


doglob: PROC

;-974     int i; int j; int isstrarr; isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-975   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob451
 push doglob_0
 call error1
 add  sp, 2

;-976   if (iswidth == 0) error1("no VOID as var type");

.doglob451:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob452
 push doglob_1
 call error1
 add  sp, 2

;-977   checknamelen();

.doglob452:
 call checknamelen

;-978   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob453
 push doglob_2
 call error1
 add  sp, 2

;-979   if (istoken('[')) { istype='&';

.doglob453:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob454
 mov ax, 38
 mov byte [istype], al

;-980     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob455

;-981       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-982       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-983       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-984       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob456
 push doglob_5
 call prs
 add  sp, 2

;-985       if (iswidth==2) prs(" resw ");

.doglob456:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob457
 push doglob_6
 call prs
 add  sp, 2

;-986       if (iswidth==4) prs(" resd ");

.doglob457:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob458
 push doglob_7
 call prs
 add  sp, 2

;-987       prunsign1(lexval);

.doglob458:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-988       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-989       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-990       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob459
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-991       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob459:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob460
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-992       GData[GTop]=lexval; expect(']');

.doglob460:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-993     }else { expect(']');

 jmp .doglob461
.doglob455:
 push 93
 call expect
 add  sp, 2

;-994       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob462
 push doglob_9
 call error1
 add  sp, 2

;-995       prs("\n"); prs(symbol); prs(" db ");

.doglob462:
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

;-996       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-997       expect('=');

 push 61
 call expect
 add  sp, 2

;-998       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob463

;-999         prc(34); prscomment(symbol); prc(34); prs(",0");

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

;-1000         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1001       else if (istoken('{' )) { i=0;

 jmp .doglob464
.doglob463:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob465
 mov ax, 0
 mov [bp-2], ax

;-1002         do { if(i) prc(',');

.doglob466:
 mov ax, [bp-2]
 or  al, al
 je .doglob467
 push 44
 call prc
 add  sp, 2

;-1003           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob467:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-1004         while (istoken(',')); expect('}'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob468
 jmp .doglob466
.doglob468:
 push 125
 call expect
 add  sp, 2

;-1005       else error1("String or number array expected");

 jmp .doglob469
.doglob465:
 push doglob_13
 call error1
 add  sp, 2

;-1006       };

.doglob469:
.doglob464:
.doglob461:

;-1007   }else { //expect('=');

 jmp .doglob470
.doglob454:

;-1008     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob471
 push doglob_15
 call prs
 add  sp, 2

;-1009     else {

 jmp .doglob472
.doglob471:

;-1010       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob473
 push doglob_16
 call prs
 add  sp, 2

;-1011       else if (iswidth==2) prs(" dw ");

 jmp .doglob474
.doglob473:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob475
 push doglob_17
 call prs
 add  sp, 2

;-1012       else                 prs(" dd ");

 jmp .doglob476
.doglob475:
 push doglob_18
 call prs
 add  sp, 2

;-1013     }

.doglob476:
.doglob474:

;-1014     if(istoken('-')) prc('-');

.doglob472:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob477
 push 45
 call prc
 add  sp, 2

;-1015     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob477:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob478
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-1016     else prunsign1(0); }

 jmp .doglob479
.doglob478:
 push 0
 call prunsign1
 add  sp, 2
.doglob479:

;-1017   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob470:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-1018   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1019   pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1020   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob480
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob481
.doglob480:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1021   GTop++; expect(';'); }

.doglob481:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-1022 


;-1023 


;-1024 int dodefine() {
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

;-1025     int i; int j; int fdtemp;


;-1026     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine482

;-1027         token=getlex();

 call getlex
 mov word [token], ax

;-1028         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1029         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1030         return;

 jmp .retndodefine

;-1031     }


;-1032     expect(T_NAME);

.dodefine482:
 push 256
 call expect
 add  sp, 2

;-1033     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine483

;-1034         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine484
 push dodefine_1
 call error1
 add  sp, 2

;-1035         i=strlen(symbol);

.dodefine484:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1036         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine485
 push dodefine_2
 call error1
 add  sp, 2

;-1037         GSign [GTop]='U';

.dodefine485:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1038         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1039         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1040         GAdr [GTop]=lineno-1;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax

;-1041         GUsed [GTop]=0;

 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1042         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1043         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1044         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1045         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1046         GTop++;

 inc  word[GTop]

;-1047     }


;-1048 }

.dodefine483:

;-1049 


;-1050 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1051     token=getlex();

 call getlex
 mov word [token], ax

;-1052     do {

.parse486:

;-1053         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse487
 mov ax, 1
 jmp .retnparse

;-1054         if (istoken('#')) {

.parse487:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse488

;-1055              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse489
 call dodefine

;-1056              else error1("define expected");

 jmp .parse490
.parse489:
 push parse_0
 call error1
 add  sp, 2

;-1057         }

.parse490:

;-1058     else{

 jmp .parse491
.parse488:

;-1059         typeName();

 call typeName

;-1060         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse492
 call dofunc

;-1061         else doglob(); }

 jmp .parse493
.parse492:
 call doglob
.parse493:

;-1062     } while(1);

.parse491:
 mov ax, 1
 or  al, al
 je .parse494
 jmp .parse486
.parse494:

;-1063 }


;-1064 


;-1065 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130

;-1066 int main() {


main: PROC

;-1067     int arglen1; unsigned int i; char *c;


;-1068     arglen1=*arglen;
;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1069     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main495

;-1070         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1071         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2

;-1072         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1073         }


;-1074     i=arglen1+129;

.main495:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1075     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1076     arglen1--;

 dec  word[bp-2]

;-1077     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1078     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1079     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main496
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-1080     strcpy(namelst, namein);

.main496:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1081     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1082     i--;

 dec  word[bp-4]

;-1083     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1084     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1085 


;-1086     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1087     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main497

;-1088         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2

;-1089         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1090         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1091         }


;-1092     fdout=creatR(namelst);

.main497:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1093     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main498

;-1094         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2

;-1095         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1096         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1097         }


;-1098     prs("\n; ");

.main498:
 push main_4
 call prs
 add  sp, 2

;-1099     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1100     prs(", Source: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1101     prs(", Output asm: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1102     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2

;-1103     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1104     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1105     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1106     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1107     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1108     parse();

 call parse

;-1109     prs("\n;Input: "); prs(namein);

 push main_8
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1110     prs(", List: ");   prs(namelst);

 push main_9
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1111     prs(", Lines: "); prunsign1(lineno);

 push main_10
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-1112     prs("\n;Glob. variables: "); GTop--; prunsign1(GTop);

 push main_11
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call prunsign1
 add  sp, 2

;-1113     prs(" ("); prunsign1(LSTART);

 push main_12
 call prs
 add  sp, 2
 push 200
 call prunsign1
 add  sp, 2

;-1114     prs("), Functions: "); prunsign1(FTop);

 push main_13
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2

;-1115     prs(" ("); prunsign1(FUNCMAX);

 push main_14
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2

;-1116     prs(")\n;Const in '"); prs(coname); prs("': "); prunsign1(maxco);

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

;-1117     prs(" ("); prunsign1(COMAX);

 push main_17
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2

;-1118     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax

;-1119     if (i <= 1000)prs("\n *** Warning *** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main499
 push main_18
 call prs
 add  sp, 2

;-1120     prs("), stacksize: ");

.main499:
 push main_19
 call prs
 add  sp, 2

;-1121     i=65636; i=i-orgData;

 mov ax, 100
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax

;-1122     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2

;-1123     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main500
 push main_20
 call prs
 add  sp, 2

;-1124     prs("          ");

.main500:
 push main_21
 call prs
 add  sp, 2

;-1125     end1(0);

 push 0
 call end1
 add  sp, 2

;-1126 }
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
;Input: A.C, List: A.S, Lines: 1127
;Glob. variables: 107 (200), Functions: 82 (300)
;Const in 'checkreg': 712 (3000), stacksize: 23155          