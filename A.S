
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


;-38 unsigned int ORGDATAORIG=25000;//start of arrays, end of text

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


;-45 char symbol[COLUMNMAX];

section .bss
absolute 28000
symbol resb 128
section .text

;-46 char fname[CMDLENMAX];

section .bss
absolute 28128
fname resb 67
section .text

;-47 char namein[CMDLENMAX];

section .bss
absolute 28195
namein resb 67
section .text

;-48 char namelst[CMDLENMAX];

section .bss
absolute 28262
namelst resb 67
section .text

;-49 char *cloc=0;

cloc dw 0

;-50 int fdin=0;

fdin dw 0

;-51 int fdout=0;

fdout dw 0

;-52 int token=0;

token dw 0

;-53 int column=0;

column dw 0

;-54 char thechar=0;   //reads one char forward

thechar db 0

;-55 int iscmp=0;

iscmp dw 0

;-56 int nconst=0;

nconst dw 0

;-57 int nreturn=0;

nreturn dw 0

;-58 int nlabel=0;

nlabel dw 0

;-59 unsigned int lexval=0;

lexval dw 0

;-60 int typei;       char istype;

typei dw 0
istype db 0

;-61 int signi;       char issign;

signi dw 0
issign db 0

;-62 int widthi;      char iswidth;

widthi dw 0
iswidth db 0

;-63 int wi=0;

wi dw 0

;-64 #define VARMAX        400//max global and local var


;-65 #define LSTART        200//max global var


;-66 #define GNAMEMAX     6400// 16*VARMAX


;-67 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 28329
GType resb 400
section .text

;-68 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 28729
GSign resb 400
section .text

;-69 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 29129
GWidth resb 400
section .text

;-70 int GData [VARMAX];

section .bss
absolute 29529
GData resw 400
section .text

;-71 char GNameField[GNAMEMAX];

section .bss
absolute 30329
GNameField resb 6400
section .text

;-72 int GTop=1;

GTop dw 1

;-73 int LTop=LSTART;

LTop dw 200

;-74 #define FUNCMAX       300//max functions


;-75 #define FNAMEMAX     4800// 16*FUNCMAX


;-76 char FNameField[FNAMEMAX];

section .bss
absolute 36729
FNameField resb 4800
section .text

;-77 int  FTop=0;

FTop dw 0

;-78 char fgetsdest[COLUMNMAX];

section .bss
absolute 41529
fgetsdest resb 128
section .text

;-79 unsigned char *fgetsp=0;

fgetsp dw 0

;-80 unsigned int lineno=1;

lineno dw 1

;-81 unsigned char *pt=0;

pt dw 0

;-82 unsigned char *p1=0;

p1 dw 0

;-83 int DOS_ERR=0;

DOS_ERR dw 0

;-84 int DOS_NoBytes=0;

DOS_NoBytes dw 0

;-85 char DOS_ByteRead=0;

DOS_ByteRead db 0

;-86 int ireg1;

ireg1 dw 0

;-87 int mod2;

mod2 dw 0

;-88 int ireg2;

ireg2 dw 0

;-89 


;-90 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-91 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }

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

;-92 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
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

;-93 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-94 


;-95 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-96     __emit__(0xCD,0x21);//inth 0x21;

 db 205,33

;-97     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-98     DOS_ERR++;

 inc  word[DOS_ERR]

;-99 }


;-100 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-101 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-102 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-103 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-104 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-105     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-106 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC;
 ENTER  0,0
lea dx, [bp+4]

;-107   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-108 


;-109   int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-110       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-111       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-112       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-113       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-114       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-115       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-116       if (c> 'Z') { if (c< 'a') return 0; }

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

;-117       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-118   }


;-119   int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-120       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-121       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-122       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-123   }


;-124   int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-125     if (digit (c)) return 1;
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

;-126     if (letter(c)) return 1;

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

;-127     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-128   }


;-129 


;-130 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-131     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-132     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-133     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-134 }


;-135 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-136     do { *s=*t; s++; t++; }
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

;-137     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-138     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-139     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-140 }


;-141 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-142     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-143         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-144         p++;

.eqstr22:
 inc  word[bp+4]

;-145         q++;

 inc  word[bp+6]

;-146     }


;-147     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-148     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-149 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-150     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-151     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-152 }


;-153 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-154     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-155         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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

;-156         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-157     }


;-158 }

 jmp .toupper26
.toupper27:

;-159 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-160     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-161         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-162         s++;

.instr132:
 inc  word[bp+4]

;-163     }


;-164     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-165 }


;-166 


;-167 int eprc(char c)  {

 .retninstr1: LEAVE
 ret
ENDP

eprc: PROC

;-168     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al

;-169     cloc++;

 inc  word[cloc]

;-170 }


;-171 int eprs(char *s) {
 LEAVE
 ret
ENDP

eprs: PROC

;-172     char c;


;-173     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34

;-174         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-175         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2

;-176         s++;

 inc  word[bp+4]

;-177     }


;-178 }

 jmp .eprs33
.eprs34:

;-179 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-180     if (c==10) {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc35

;-181         ax=13;

 mov  ax, 13

;-182         writetty();

 call writetty

;-183     }


;-184     al=c;

.prc35:
 mov  al, [bp+4]

;-185     writetty();

 call writetty

;-186     fputcR(c, fdout);

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-187 }


;-188 int prscomment(unsigned char *s) {
 LEAVE
 ret
ENDP

prscomment: PROC

;-189     unsigned char c;


;-190     while(*s){
;
 ENTER  2,0
.prscomment36:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment37

;-191         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-192         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-193         s++;

 inc  word[bp+4]

;-194     }


;-195 }

 jmp .prscomment36
.prscomment37:

;-196 int prs(unsigned char *s) {
 LEAVE
 ret
ENDP

prs: PROC

;-197     unsigned char c; int com;


;-198     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-199     while(*s) {

.prs38:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs39

;-200         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-201         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs40
 mov ax, [bp-4]
 or  al, al
 je .prs41
 mov ax, 0
 mov [bp-4], ax

;-202                    else com=1;

 jmp .prs42
.prs41:
 mov ax, 1
 mov [bp-4], ax

;-203         if (c==92) {

.prs42:
.prs40:
 mov al, [bp-2]
 cmp al, 92
 jne .prs43

;-204             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs44

;-205                 s++;

 inc  word[bp+4]

;-206                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-207                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs45
 mov ax, 10
 mov [bp-2], al

;-208                 if (c=='t') c= 9;

.prs45:
 mov al, [bp-2]
 cmp al, 116
 jne .prs46
 mov ax, 9
 mov [bp-2], al

;-209             }

.prs46:

;-210         }

.prs44:

;-211         prc(c);

.prs43:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-212         s++;

 inc  word[bp+4]

;-213     }


;-214 }

 jmp .prs38
.prs39:

;-215 


;-216 int eprnum(int n){//for docall1 procedure
 LEAVE
 ret
ENDP

eprnum: PROC

;-217     int e;


;-218     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum47

;-219         eprc('-');

 push 45
 call eprc
 add  sp, 2

;-220         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-221     }


;-222     if (n >= 10) {

.eprnum47:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum48

;-223         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-224         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2

;-225     }


;-226     n=n%10;

.eprnum48:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-227     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax

;-228     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2

;-229 }


;-230 int pint1 (int n){
 LEAVE
 ret
ENDP

pint1: PROC

;-231     int e;


;-232     if(n<0) {  prc('-');  n=mkneg(n); }
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

;-233     if (n >= 10) {

.pint149:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint150

;-234         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-235         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2

;-236     }


;-237     n=n%10;

.pint150:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-238     n += '0';

 add  word[bp+4], 48

;-239     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-240 }


;-241 int prunsign1(unsigned int n) {
 LEAVE
 ret
ENDP

prunsign1: PROC

;-242     unsigned int e;


;-243     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign151

;-244         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax

;-245         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-246     }


;-247     n = n % 10; /*unsigned mod*/

.prunsign151:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax

;-248     n += '0';

 add  word[bp+4], 48

;-249     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-250 }


;-251 


;-252 int end1(int n) {
 LEAVE
 ret
ENDP

end1: PROC

;-253     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-254     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-255     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-256 }


;-257 


;-258 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-259     lineno--;
;
 ENTER  0,0
 dec  word[lineno]

;-260     prs("\n ");

 push error1_0
 call prs
 add  sp, 2

;-261     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-262     prs(";Line: ");

 push error1_1
 call prs
 add  sp, 2

;-263     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-264     prs(" ************** ERROR: ");

 push error1_2
 call prs
 add  sp, 2

;-265     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-266     prs("  in column: ");

 push error1_3
 call prs
 add  sp, 2

;-267     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-268     prs("\nToken: ");

 push error1_4
 call prs
 add  sp, 2

;-269     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-270     prs(", symbol: ");

 push error1_5
 call prs
 add  sp, 2

;-271     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-272     end1(1);

 push 1
 call end1
 add  sp, 2

;-273 }


;-274 


;-275 int printinputline() {
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

;-276     int col;


;-277     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-278     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-279     do {

.printinputline52:

;-280         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-281         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline53
 jmp .retnprintinputline

;-282         *fgetsp=DOS_ByteRead;

.printinputline53:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-283         fgetsp++;

 inc  word[fgetsp]

;-284         col++;

 inc  word[bp-2]

;-285         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline54
 push printinputline_0
 call error1
 add  sp, 2

;-286         }

.printinputline54:

;-287         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline55
 jmp .printinputline52
.printinputline55:

;-288     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-289     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline56

;-290         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-291         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-292         prc(' ');

 push 32
 call prc
 add  sp, 2

;-293         lineno++;

 inc  word[lineno]

;-294         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-295         }


;-296 }

.printinputline56:

;-297 int fgets1() {

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n\n;-",0
ENDP

fgets1: PROC

;-298     char c;


;-299     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-300     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157

;-301         printinputline();

 call printinputline

;-302         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1

;-303         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-304         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-305         column=0;

 mov ax, 0
 mov word [column], ax

;-306     }


;-307     fgetsp++;

.fgets157:
 inc  word[fgetsp]

;-308     column++;

 inc  word[column]

;-309     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-310 }


;-311 int next() {

 .retnfgets1: LEAVE
 ret
ENDP

next: PROC

;-312     char r;


;-313     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-314     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-315     return r;

 mov al, [bp-2]
 jmp .retnnext

;-316 }


;-317 


;-318 int adrF(char *s, unsigned int i) {

 .retnnext: LEAVE
 ret
ENDP

adrF: PROC

;-319     i << 4;//*16; IDLENMAX=15!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-320     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 

;-321 }


;-322 


;-323 int printName(unsigned int i) {
 LEAVE
 ret
ENDP

printName: PROC

;-324     int j;


;-325     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName59

;-326         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax

;-327         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2

;-328     }


;-329     else {

 jmp .printName60
.printName59:

;-330         prs("[bp");

 push printName_0
 call prs
 add  sp, 2

;-331         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-332         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2

;-333         pint1(j);

.printName61:
 push word [bp-2]
 call pint1
 add  sp, 2

;-334         prc(']');

 push 93
 call prc
 add  sp, 2

;-335     }


;-336 }

.printName60:

;-337 


;-338 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC

;-339     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL

;-340     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63

;-341         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al

;-342         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL

;-343     }


;-344     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL

;-345 }


;-346 


;-347 char symboltemp[80];

 .retnifEOL: LEAVE
 ret
ENDP
section .bss
absolute 41657
symboltemp resb 80
section .text

;-348 int getlex() {


getlex: PROC

;-349     char c; char *p;


;-350     int i; int j;


;-351 g1: c=next();
;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al

;-352     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex

;-353     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1

;-354   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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

;-355   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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

;-356   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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

;-357   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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

;-358   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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

;-359   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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

;-360   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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

;-361   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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

;-362   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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

;-363   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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

;-364   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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

;-365   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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

;-366   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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

;-367   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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

;-368   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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

;-369   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96

;-370       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97

;-371           do c=next();

.getlex98:
 call next
 mov [bp-2], al

;-372           while(ifEOL(c)==0) return getlex();

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

;-373       }


;-374   }

.getlex97:

;-375   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100

;-376       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101

;-377           g2: c=next();

.g2:
 call next
 mov [bp-2], al

;-378           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2

;-379           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2

;-380           c=next();

.getlex103:
 call next
 mov [bp-2], al

;-381           return getlex();

 call getlex
 jmp .retngetlex

;-382       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex

;-383   }

.getlex104:

;-384   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105

;-385       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax

;-386       c=next();

 call next
 mov [bp-2], al

;-387       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107

;-388           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-389           p++;

 inc  word[bp-4]

;-390           c=next();

 call next
 mov [bp-2], al

;-391           }


;-392           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-393       return T_STRING;

 mov ax, 258
 jmp .retngetlex

;-394   }


;-395   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108

;-396       lexval=0;

 mov ax, 0
 mov word [lexval], ax

;-397       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax

;-398       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al

;-399       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110

;-400           next();

 call next

;-401           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112

;-402               c=next();

 call next
 mov [bp-2], al

;-403               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al

;-404       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al

;-405                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al

;-406                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-407                i=0;

 mov ax, 0
 mov [bp-6], ax

;-408                i=c;

 mov al, [bp-2]
 mov [bp-6], ax

;-409                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax

;-410            }


;-411        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:

;-412            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117

;-413                c=next();

 call next
 mov [bp-2], al

;-414                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al

;-415                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-416                i=0;

 mov ax, 0
 mov [bp-6], ax

;-417                i=c;

 mov al, [bp-2]
 mov [bp-6], ax

;-418                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax

;-419            }


;-420        }

 jmp .getlex116
.getlex117:

;-421       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex

;-422   }


;-423   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118

;-424       lexval=next();

 call next
 mov word [lexval], ax

;-425       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119

;-426           lexval=next();

 call next
 mov word [lexval], ax

;-427           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax

;-428           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax

;-429           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax

;-430       }

.getlex122:

;-431       next();

.getlex119:
 call next

;-432       return T_CONST;

 mov ax, 257
 jmp .retngetlex

;-433   }


;-434   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123

;-435     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4

;-436     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax

;-437     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-438     p++;

 inc  word[bp-4]

;-439     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125

;-440         c=next();

 call next
 mov [bp-2], al

;-441         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-442         p++;

 inc  word[bp-4]

;-443     }


;-444     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-445     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex

;-446     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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

;-447     if (eqstr(symbol,"void"    )) return T_VOID;

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

;-448     if (eqstr(symbol,"int"     )) return T_INT;

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

;-449     if (eqstr(symbol,"long"    )) return T_LONG;

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

;-450     if (eqstr(symbol,"char"    )) return T_CHAR;

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

;-451     if (eqstr(symbol,"asm"     )) return T_ASM;

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

;-452     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

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

;-453     if (eqstr(symbol,"__emit__")) return T_EMIT;

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

;-454     if (eqstr(symbol,"return"  )) return T_RETURN;

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

;-455     if (eqstr(symbol,"if"      )) return T_IF;

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

;-456     if (eqstr(symbol,"else"    )) return T_ELSE;

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

;-457     if (eqstr(symbol,"while"   )) return T_WHILE;

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

;-458     if (eqstr(symbol,"do"      )) return T_DO;

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

;-459     if (eqstr(symbol,"goto"    )) return T_GOTO;

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

;-460     if (eqstr(symbol,"define"  )) return T_DEFINE;

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

;-461 


;-462     i=0;//convert define to value

.getlex141:
 mov ax, 0
 mov [bp-6], ax

;-463     while (i < GTop) {

.getlex142:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex143

;-464         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax

;-465         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex144

;-466             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex145

;-467                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-468                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4

;-469                 return T_CONST;

 mov ax, 257
 jmp .retngetlex

;-470             }


;-471         }

.getlex145:

;-472         i++;

.getlex144:
 inc  word[bp-6]

;-473     }


;-474     return T_NAME; } error1("Input item not recognized");

 jmp .getlex142
.getlex143:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_17
 call error1
 add  sp, 2

;-475 }


;-476 


;-477 int istoken(int t) {

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

;-478     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken146

;-479         token=getlex();

 call getlex
 mov word [token], ax

;-480         return 1;

 mov ax, 1
 jmp .retnistoken

;-481     }


;-482     return 0;

.istoken146:
 mov ax, 0
 jmp .retnistoken

;-483 }


;-484 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-485     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect147

;-486         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-487         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-488         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-489         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-490         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-491     }


;-492 }

.expect147:

;-493 


;-494 int v(unsigned int i) {//value
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC

;-495     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v148
 push 91
 call prc
 add  sp, 2

;-496     printName(i);

.v148:
 push word [bp+4]
 call printName
 add  sp, 2

;-497     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v149
 push 93
 call prc
 add  sp, 2

;-498 }

.v149:

;-499 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-500     int i;


;-501     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-502     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen150
 push checknamelen_0
 call error1
 add  sp, 2

;-503 }

.checknamelen150:

;-504 


;-505 int checkName() { unsigned int i; unsigned int j;
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

checkName: PROC

;-506     i=LSTART;
;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax

;-507     while(i<LTop) {

.checkName151:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName152

;-508         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-509         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName153
 mov ax, [bp-2]
 jmp .retncheckName

;-510         i++;

.checkName153:
 inc  word[bp-2]

;-511     }


;-512     i=1;

 jmp .checkName151
.checkName152:
 mov ax, 1
 mov [bp-2], ax

;-513     while(i<GTop) {

.checkName154:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName155

;-514         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-515         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName156
 mov ax, [bp-2]
 jmp .retncheckName

;-516         i++;

.checkName156:
 inc  word[bp-2]

;-517     }


;-518     return 0;

 jmp .checkName154
.checkName155:
 mov ax, 0
 jmp .retncheckName

;-519 }


;-520 int searchname() { unsigned int i;

 .retncheckName: LEAVE
 ret
ENDP

searchname: PROC

;-521   i=checkName(); if (i == 0) error1("Variable unknown");
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname157
 push searchname_0
 call error1
 add  sp, 2

;-522   return i;

.searchname157:
 mov ax, [bp-2]
 jmp .retnsearchname

;-523 }


;-524 int name1() {

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC

;-525     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1158
 push name1_0
 call error1
 add  sp, 2

;-526     token=getlex();

.name1158:
 call getlex
 mov word [token], ax

;-527 }


;-528 int typeName() { int m; //0=V,1=*,2=&

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC

;-529     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-530     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName159
 mov ax, 83
 mov byte [issign], al

;-531     if(istoken(T_UNSIGNED)) issign='U';

.typeName159:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 85
 mov byte [issign], al

;-532     iswidth=2;

.typeName160:
 mov ax, 2
 mov byte [iswidth], al

;-533     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 0
 mov byte [iswidth], al

;-534     if(istoken(T_CHAR))     iswidth=1;

.typeName161:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 1
 mov byte [iswidth], al

;-535     if(istoken(T_INT))      iswidth=2;

.typeName162:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 2
 mov byte [iswidth], al

;-536     if(istoken(T_LONG))     iswidth=4;

.typeName163:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 4
 mov byte [iswidth], al

;-537     istype='V';

.typeName164:
 mov ax, 86
 mov byte [istype], al

;-538     m=0;

 mov ax, 0
 mov [bp-2], ax

;-539     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-540     if(istoken('&'))  {istype='&'; m=2;}

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

;-541     name1();

.typeName166:
 call name1

;-542     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-543 }


;-544 int gettypes(int i) {int j; char c;

 .retntypeName: LEAVE
 ret
ENDP

gettypes: PROC

;-545   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes167
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes168
.gettypes167:
 mov ax, 0
 mov word [signi], ax

;-546   c=GWidth[i]; widthi=0;wi=0;

.gettypes168:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-547   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes169
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-548   if (c==2) {widthi=2;wi=2;}

.gettypes169:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes170
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-549   if (c==4) {widthi=4;wi=4;}

.gettypes170:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes171
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-550   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes171:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes172
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-551   if (c=='&')  typei=2;

.gettypes172:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes173
 mov ax, 2
 mov word [typei], ax

;-552   return i; }

.gettypes173:
 mov ax, [bp+4]
 jmp .retngettypes

;-553 


;-554 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 .retngettypes: LEAVE
 ret
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal174
 push addlocal_0
 call error1
 add  sp, 2

;-555   if (checkName() != 0) error1("Variable already defined");

.addlocal174:
 call checkName
 cmp ax, 0
 je  .addlocal175
 push addlocal_1
 call error1
 add  sp, 2

;-556   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal175:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-557   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-558 }


;-559 


;-560 int isvariable() {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

isvariable: PROC

;-561     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable176
 jmp .v1

;-562     if(token==T_UNSIGNED) goto v1;

.isvariable176:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable177
 jmp .v1

;-563     if(token==T_CHAR)     goto v1;

.isvariable177:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable178
 jmp .v1

;-564     if(token==T_INT)      goto v1;

.isvariable178:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable179
 jmp .v1

;-565     if(token==T_LONG)     goto v1;

.isvariable179:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable180
 jmp .v1

;-566     return 0;

.isvariable180:
 mov ax, 0
 jmp .retnisvariable

;-567 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-568 }


;-569 


;-570 int cmpneg(int ids) {

 .retnisvariable:
 ret
ENDP

cmpneg: PROC

;-571        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg181
 push cmpneg_0
 call prs
 add  sp, 2

;-572   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg182
.cmpneg181:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg183
 push cmpneg_1
 call prs
 add  sp, 2

;-573   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg184
.cmpneg183:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg185
 mov ax, [bp+4]
 or  al, al
 je .cmpneg186
 push cmpneg_2
 call prs
 add  sp, 2

;-574                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg187
.cmpneg186:
 push cmpneg_3
 call prs
 add  sp, 2

;-575   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg187:
 jmp .cmpneg188
.cmpneg185:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg189
 mov ax, [bp+4]
 or  al, al
 je .cmpneg190
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-576                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-577                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg191
.cmpneg190:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-578                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-579   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg191:
 jmp .cmpneg192
.cmpneg189:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg193
 push cmpneg_8
 call prs
 add  sp, 2

;-580   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg194
.cmpneg193:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg195
 push cmpneg_9
 call prs
 add  sp, 2

;-581   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg196
.cmpneg195:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg196:
.cmpneg194:
.cmpneg192:
.cmpneg188:
.cmpneg184:
.cmpneg182:

;-582 


;-583   int isrelational() {
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

;-584     if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational197
 jmp .w
.isrelational197:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational198
 jmp .w

;-585     if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational198:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational199
 jmp .w
.isrelational199:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational200
 jmp .w

;-586     if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational200:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational201
 jmp .w
.isrelational201:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational202
 jmp .w

;-587     return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational202:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-588 


;-589 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC

;-590   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg203
 mov ax, 0
 jmp .retncheckreg

;-591   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg203:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 1
 jmp .retncheckreg
.checkreg204:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 3
 jmp .retncheckreg

;-592   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg205:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 5
 jmp .retncheckreg
.checkreg206:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 7
 jmp .retncheckreg

;-593   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg207:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 9
 jmp .retncheckreg
.checkreg208:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 11
 jmp .retncheckreg

;-594   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg209:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 13
 jmp .retncheckreg
.checkreg210:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 15
 jmp .retncheckreg

;-595   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg211:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 17
 jmp .retncheckreg
.checkreg212:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 19
 jmp .retncheckreg

;-596   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg213:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 21
 jmp .retncheckreg
.checkreg214:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 23
 jmp .retncheckreg

;-597   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg215:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 25
 jmp .retncheckreg
.checkreg216:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 27
 jmp .retncheckreg

;-598   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg217:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 29
 jmp .retncheckreg
.checkreg218:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 31
 jmp .retncheckreg

;-599   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg219:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 33
 jmp .retncheckreg
.checkreg220:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 35
 jmp .retncheckreg

;-600   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg221:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 37
 jmp .retncheckreg
.checkreg222:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 39
 jmp .retncheckreg

;-601   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg223:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 41
 jmp .retncheckreg
.checkreg224:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 43
 jmp .retncheckreg

;-602   // (eqstr(symbol,"ip")) return 45;


;-603   if (strlen(symbol) >   3) return 0;

.checkreg225:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg226
 mov ax, 0
 jmp .retncheckreg

;-604   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg226:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 47
 jmp .retncheckreg
.checkreg227:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 50
 jmp .retncheckreg

;-605   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg228:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 53
 jmp .retncheckreg
.checkreg229:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 56
 jmp .retncheckreg

;-606   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg230:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 59
 jmp .retncheckreg
.checkreg231:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 62
 jmp .retncheckreg

;-607   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg232:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 65
 jmp .retncheckreg
.checkreg233:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 68
 jmp .retncheckreg

;-608 //  if (eqstr(symbol,"cr0")) return 71;


;-609   return 0;   }

.checkreg234:
 mov ax, 0
 jmp .retncheckreg

;-610 


;-611 char printregstr[]

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

;-612 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0

;-613 


;-614 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-615   k = &printregstr + i; c=*k; prc(c); i++;
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

;-616   k = &printregstr + i; c=*k; prc(c);

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

;-617   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg235
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

;-618 }

.printreg235:

;-619 


;-620 char ops[5];
 LEAVE
 ret
ENDP
section .bss
absolute 41737
ops resb 5
section .text

;-621 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-622   if (istoken('='))          strcpy(ops, "mov");
;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1236
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-623   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1236:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1237
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-624   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1237:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1238
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-625   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1238:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1239
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-626   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1239:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1240
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-627   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1240:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1241
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-628   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1241:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1242
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-629   if (iscmp1 == 1) { token=getlex();

.doreg1242:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1243
 call getlex
 mov word [token], ax

;-630       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1244
 push doreg1_7
 call error1
 add  sp, 2

;-631       strcpy(ops, "cmp"); }

.doreg1244:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-632   prs("\n "); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1243:
 push doreg1_9
 call prs
 add  sp, 2
 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2
 push doreg1_10
 call prs
 add  sp, 2
 push word [ireg1]
 call printreg
 add  sp, 2
 push doreg1_11
 call prs
 add  sp, 2

;-633 


;-634   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1245
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-635   mod2=typeName(); ireg2=checkreg();

.doreg1245:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-636   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1246
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-637   i=searchname();  if (mod2 == 2) printName(i); else v(i);

.doreg1246:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1247
 push word [bp-2]
 call printName
 add  sp, 2
 jmp .doreg1248
.doreg1247:
 push word [bp-2]
 call v
 add  sp, 2

;-638   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1248:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1249
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

;-639 }

.doreg1249:

;-640 


;-641 int compoundass(char *op, int mode, int id1) {
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

;-642   if(mode) error1("only scalar Var allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass250
 push compoundass_0
 call error1
 add  sp, 2

;-643   prs("\n "); prs(op); prs("  ");

.compoundass250:
 push compoundass_1
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_2
 call prs
 add  sp, 2

;-644   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass251
 push compoundass_3
 call prs
 add  sp, 2
 jmp .compoundass252
.compoundass251:
 push compoundass_4
 call prs
 add  sp, 2

;-645   v(id1); prs(", ");

.compoundass252:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_5
 call prs
 add  sp, 2

;-646   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-647 }


;-648 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "\n ",0
compoundass_2 db "  ",0
compoundass_3 db "word",0
compoundass_4 db "byte",0
compoundass_5 db ", ",0
ENDP

dovar1: PROC

;-649   gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-650   if (mode==1) {prs("\n mov bx, "); v(id1); prs("\n "); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1253
 push dovar1_0
 call prs
 add  sp, 2
 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-651     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1254
 push dovar1_2
 call prs
 add  sp, 2

;-652     if(widthi == 2) prs(" ax, [bx]");

.dovar1254:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_3
 call prs
 add  sp, 2

;-653     return; }

.dovar1255:
 jmp .retndovar1

;-654   if (mode==2){prs("\n ");prs(op);prs(" ax, "); printName(id1); return; }

.dovar1253:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1256
 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2
 push dovar1_5
 call prs
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 jmp .retndovar1

;-655   if (ixarr) {

.dovar1256:
 mov ax, [bp+8]
 or  al, al
 je .dovar1257

;-656     prs("\n mov bx, "); v(ixarr);

 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-657     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_7
 call prs
 add  sp, 2

;-658     prs("\n "); prs(op);

.dovar1258:
 push dovar1_8
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-659     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1259
 push dovar1_9
 call prs
 add  sp, 2
 jmp .dovar1260
.dovar1259:
 push dovar1_10
 call prs
 add  sp, 2

;-660 // v(id1); prs(" [bx]");


;-661     prc('['); printName(id1); prs(" + bx]");

.dovar1260:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_11
 call prs
 add  sp, 2

;-662     return; }

 jmp .retndovar1

;-663   prs("\n ");prs(op);

.dovar1257:
 push dovar1_12
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-664   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1261
 push dovar1_13
 call prs
 add  sp, 2

;-665   if(wi==2) prs(" ax, ");

.dovar1261:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1262
 push dovar1_14
 call prs
 add  sp, 2

;-666   if(wi==4) prs(" eax, ");

.dovar1262:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1263
 push dovar1_15
 call prs
 add  sp, 2

;-667   v(id1);

.dovar1263:
 push word [bp+10]
 call v
 add  sp, 2

;-668 }


;-669 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

 .retndovar1: LEAVE
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

;-670   if (istoken(T_CONST)) { prs("\n "); prs(op);
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm264
 push rterm_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2

;-671     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm265
 push rterm_1
 call prs
 add  sp, 2

;-672     if (wi==2) prs(" ax, ");

.rterm265:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm266
 push rterm_2
 call prs
 add  sp, 2

;-673     if (wi==4) prs(" eax, ");

.rterm266:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm267
 push rterm_3
 call prs
 add  sp, 2

;-674     prunsign1(lexval); return;}

.rterm267:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-675   mode=typeName(); id1=searchname(); ixarr=0;

.rterm264:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-676   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm268
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-677     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-678     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm269
 push rterm_4
 call error1
 add  sp, 2
.rterm269:

;-679   if (eqstr(symbol,"_AX")) return;

.rterm268:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm270
 jmp .retnrterm

;-680   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm270:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-681 }


;-682 


;-683 int doassign(int mode, int i, int ixarr, int ixconst) {

 .retnrterm: LEAVE
 ret
rterm_0 db "\n ",0
rterm_1 db " al, ",0
rterm_2 db " ax, ",0
rterm_3 db " eax, ",0
rterm_4 db "Arrayindex muss int sein",0
rterm_5 db "_AX",0
ENDP

doassign: PROC

;-684   gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-685   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign271
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-686     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign272
 push doassign_1
 call prs
 add  sp, 2

;-687     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign273
.doassign272:
 push doassign_2
 call prs
 add  sp, 2
.doassign273:
 jmp .retndoassign

;-688   if (mode==2) {prs("\n mov  ");printName(i); prs(", ax"); return;}

.doassign271:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign274
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

;-689   if (ixarr) {  prs("\n mov bx, ");

.doassign274:
 mov ax, [bp+8]
 or  al, al
 je .doassign275
 push doassign_5
 call prs
 add  sp, 2

;-690     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign276
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign277
.doassign276:
 push word [bp+8]
 call v
 add  sp, 2

;-691     if (wi==2) prs("\n shl bx, 1");

.doassign277:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign278
 push doassign_6
 call prs
 add  sp, 2

;-692     prs("\n mov ["); printName(i);

.doassign278:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-693     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign279
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign280
.doassign279:
 push doassign_9
 call prs
 add  sp, 2
.doassign280:
 jmp .retndoassign

;-694   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign275:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign281
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign282
 push doassign_11
 call prs
 add  sp, 2

;-695     } v(i); prs(", al"); return; }

.doassign282:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-696   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign281:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign283
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign284
 push doassign_14
 call prs
 add  sp, 2

;-697     } v(i); prs(", ax"); return; }

.doassign284:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-698   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign283:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign285
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign286
 push doassign_17
 call prs
 add  sp, 2

;-699     } v(i); prs(", eax"); return; }

.doassign286:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-700 }

.doassign285:

;-701 int domul(int ids) {

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

;-702   if (ids) rterm("imul"); else {
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul287
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul288
.domul287:

;-703   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul289

;-704     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-705     }


;-706   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul290
.domul289:
 push domul_3
 call error1
 add  sp, 2
.domul290:
.domul288:

;-707 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-708   if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv291

;-709     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-710     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv292
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv293
.doidiv292:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv293:

;-711   else {

 jmp .doidiv294
.doidiv291:

;-712     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-713     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv295
 push doidiv_3
 call error1
 add  sp, 2

;-714     gettypes(id1);

.doidiv295:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-715     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv296
 push doidiv_4
 call error1
 add  sp, 2

;-716     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv296:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv297
 push doidiv_5
 call error1
 add  sp, 2

;-717     prs("\n mov bx, "); v(id1);

.doidiv297:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-718     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv298
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv299
.doidiv298:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv299:

;-719 }

.doidiv294:

;-720 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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

;-721 


;-722 


;-723 int docalltype[10]; int docallvalue[10];
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

;-724 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 41782
procname resb 17
section .text

;-725 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-726   narg=0;  sz32=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-727   checknamelen();

 call checknamelen

;-728   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-729   expect('(');

 push 40
 call expect
 add  sp, 2

;-730 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1300

;-731 	  do { narg++;

.docall1301:
 inc  word[bp-4]

;-732 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1302
 push docall1_0
 call error1
 add  sp, 2
.docall1302:
 mov ax, 0
 mov [bp-6], ax

;-733       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1303
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-734       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1303:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1304
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-735         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-736         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-737       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1304:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1305
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-738       if(istoken(T_NAME))  { n0=checkreg();

.docall1305:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1306
 call checkreg
 mov [bp-8], ax

;-739         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1307
 mov ax, 5
 mov [bp-6], ax

;-740         else {t0=4; n0=searchname();

 jmp .docall1308
.docall1307:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-741           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1309
 mov ax, 3
 mov [bp-6], ax
.docall1309:
.docall1308:

;-742       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1306:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1310
 push docall1_4
 call error1
 add  sp, 2

;-743       docalltype [narg] = t0;

.docall1310:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-744       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-745     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1311
 jmp .docall1301
.docall1311:

;-746 


;-747   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-748     do {

.docall1312:

;-749       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-750       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-751       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1313
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-752       if(t0==2){ prs("\n push ");

.docall1313:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1314
 push docall1_6
 call prs
 add  sp, 2

;-753         prs(fname);prc(95);prunsign1(n0);}

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

;-754       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1314:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1315
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-755         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-756       if(t0==4){ gettypes(n0);

.docall1315:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1316
 push word [bp-8]
 call gettypes
 add  sp, 2

;-757         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1317
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-758         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1318
.docall1317:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-759         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1318:

;-760       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1316:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1319
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1320
 mov ax, [bp-10]
 add ax, 2
.docall1320:

;-761    i--; } while (i > 0);  }

.docall1319:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1321
 jmp .docall1312
.docall1321:

;-762 	 prs("\n call "); prs(&procname);

.docall1300:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-763 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1322
 push docall1_14
 call prs
 add  sp, 2

;-764      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2

;-765  }

.docall1322:

;-766 


;-767 int expr(int isRight)
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

;-768  { int mode; int id1;     int ixarr; int ixconst;


;-769    int ids;  int isCONST; int i;     unsigned char *p;


;-770    if (istoken(T_CONST)) {
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr323

;-771      prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-772    mode=typeName(); /*0=V,1=*,2=&*/

.expr323:
 call typeName
 mov [bp-2], ax

;-773    ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-774    if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr324
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-775    if (token=='(')  {docall1(); goto e1; }

.expr324:
 mov ax, [token]
 cmp ax, 40
 jne .expr325
 call docall1
 jmp .e1

;-776 


;-777    id1=searchname(); gettypes(id1); ids=signi;

.expr325:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-778    ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-779      if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr326
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr327

;-780        ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-781      else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr328
.expr327:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-782      gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-783      if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr329
 push expr_1
 call error1
 add  sp, 2
.expr329:
.expr328:

;-784    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

.expr326:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr330
 mov ax, [bp-2]
 or  al, al
 je .expr331
 push expr_2
 call error1
 add  sp, 2

;-785       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr331:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr332
 push expr_4
 call prs
 add  sp, 2
 jmp .expr333
.expr332:
 push expr_5
 call prs
 add  sp, 2

;-786       v(id1); goto e1;}

.expr333:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-787    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

.expr330:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr334
 mov ax, [bp-2]
 or  al, al
 je .expr335
 push expr_6
 call error1
 add  sp, 2

;-788       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr335:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr336
 push expr_8
 call prs
 add  sp, 2
 jmp .expr337
.expr336:
 push expr_9
 call prs
 add  sp, 2

;-789       v(id1); goto e1;}

.expr337:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-790 


;-791    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr334:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-792    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr338:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-793    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr339:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr340
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-794    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr340:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-795    if (istoken(T_MULASS    )) {error1("not implemented");}

.expr341:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr342
 push expr_14
 call error1
 add  sp, 2

;-796    if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr342:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
 push expr_15
 call error1
 add  sp, 2

;-797 


;-798    if (istoken('=')) {

.expr343:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr344

;-799        expr(1);

 push 1
 call expr
 add  sp, 2

;-800        doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8

;-801        goto e1;

 jmp .e1

;-802    }


;-803    dovar1(mode, "mov", ixarr, id1);

.expr344:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-804 


;-805  e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr345
 push expr_17
 call rterm
 add  sp, 2

;-806    else if (istoken('-')) rterm("sub" );

 jmp .expr346
.expr345:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr347
 push expr_18
 call rterm
 add  sp, 2

;-807    else if (istoken('&')) rterm("and" );

 jmp .expr348
.expr347:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr349
 push expr_19
 call rterm
 add  sp, 2

;-808    else if (istoken('|')) rterm("or" );

 jmp .expr350
.expr349:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr351
 push expr_20
 call rterm
 add  sp, 2

;-809    else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr352
.expr351:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr353
 push expr_21
 call rterm
 add  sp, 2

;-810    else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr354
.expr353:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
 push expr_22
 call rterm
 add  sp, 2

;-811    else if (istoken('*')) domul (ids);

 jmp .expr356
.expr355:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
 push word [bp-10]
 call domul
 add  sp, 2

;-812    else if (istoken('/')) doidiv(ids);

 jmp .expr358
.expr357:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr359
 push word [bp-10]
 call doidiv
 add  sp, 2

;-813    else if (istoken('%')) domod (ids);

 jmp .expr360
.expr359:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr361
 push word [bp-10]
 call domod
 add  sp, 2

;-814    if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr361:
.expr360:
.expr358:
.expr356:
.expr354:
.expr352:
.expr350:
.expr348:
.expr346:
 call isrelational
 or  al, al
 je .expr362
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-815    return 0;

.expr362:
 mov ax, 0
 jmp .retnexpr

;-816  }


;-817 


;-818  int pexpr() {expect('('); iscmp=0;

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

;-819    if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr363

;-820      ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-821      if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr364
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr364:

;-822    expr(0);

.pexpr363:
 push 0
 call expr
 add  sp, 2

;-823    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr365
 push pexpr_0
 call prs
 add  sp, 2
.pexpr365:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-824    expect(')');

 push 41
 call expect
 add  sp, 2

;-825  }


;-826 


;-827 


;-828 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC

;-829     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2

;-830     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-831     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-832     prc(':');

 push 58
 call prc
 add  sp, 2

;-833 }


;-834 int prjump (int n) {
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC

;-835     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2

;-836     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-837     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-838 }


;-839 


;-840 int stmt() {
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC

;-841     int c; char cha;


;-842     int jdest; int tst; int jtemp;


;-843        if(istoken('{'))     {while(istoken('}')==0) stmt();}
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt366
.stmt367:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt368
 call stmt
 jmp .stmt367
.stmt368:

;-844   else if(istoken(T_IF)) {

 jmp .stmt369
.stmt366:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370

;-845       int jdest; int tst;

 mov ax, [bp-6]
 mov ax, [bp-8]

;-846       pexpr(); nlabel++; jdest=nlabel;

 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax

;-847       pint1(jdest); stmt();

 push word [bp-6]
 call pint1
 add  sp, 2
 call stmt

;-848       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt371
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-8], ax

;-849           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);

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

;-850       }


;-851       else prlabel(jdest);

 jmp .stmt372
.stmt371:
 push word [bp-6]
 call prlabel
 add  sp, 2

;-852   }

.stmt372:

;-853   else if(istoken(T_DO)) {

 jmp .stmt373
.stmt370:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt374

;-854       nlabel++; jdest=nlabel; prlabel(jdest); stmt();

 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax
 push word [bp-6]
 call prlabel
 add  sp, 2
 call stmt

;-855       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-856       prjump(jdest); prlabel(jtemp);

 push word [bp-6]
 call prjump
 add  sp, 2
 push word [bp-10]
 call prlabel
 add  sp, 2

;-857   }


;-858   else if(istoken(T_WHILE)) {

 jmp .stmt375
.stmt374:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt376

;-859       nlabel++; jdest=nlabel;

 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax

;-860       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-861       stmt(); prjump(jdest); prlabel(tst);

 call stmt
 push word [bp-6]
 call prjump
 add  sp, 2
 push word [bp-8]
 call prlabel
 add  sp, 2

;-862   }


;-863   else if(istoken(T_GOTO))  {

 jmp .stmt377
.stmt376:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt378

;-864       prs("\n jmp .");name1();prs(symbol);expect(';');

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

;-865   }


;-866   else if(token==T_ASM)     {

 jmp .stmt379
.stmt378:
 mov ax, [token]
 cmp ax, 518
 jne .stmt380

;-867       prs("\n"); c=next();

 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-868       while(c != '\n') { prc(c);	c=next(); };

.stmt381:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt382
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt381
.stmt382:

;-869       token=getlex();

 call getlex
 mov word [token], ax

;-870   }


;-871   else if(istoken(T_ASMBLOCK)) {

 jmp .stmt383
.stmt380:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt384

;-872       if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt385

;-873           prs("\n"); cha=next();

 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-874           while(cha!= '}') {

.stmt386:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt387

;-875               prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-876               cha=next();

 call next
 mov [bp-4], al

;-877           }


;-878           token=getlex();

 jmp .stmt386
.stmt387:
 call getlex
 mov word [token], ax

;-879       } else error1("Curly open expected");

 jmp .stmt388
.stmt385:
 push stmt_3
 call error1
 add  sp, 2

;-880         }

.stmt388:

;-881   else if(istoken(T_EMIT)) {

 jmp .stmt389
.stmt384:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt390

;-882       prs("\n db ");

 push stmt_4
 call prs
 add  sp, 2

;-883     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax

;-884       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2

;-885       token=getlex();

 call getlex
 mov word [token], ax

;-886       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt391

;-887           prc(',');

 push 44
 call prc
 add  sp, 2

;-888           goto L1;

 jmp .L1

;-889       }


;-890       expect(')');

.stmt391:
 push 41
 call expect
 add  sp, 2

;-891   }


;-892   else if(istoken(';'))      { }

 jmp .stmt392
.stmt390:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt393

;-893   else if(istoken(T_RETURN)) {

 jmp .stmt394
.stmt393:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt395

;-894         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt396
 push 0
 call expr
 add  sp, 2

;-895         prs("\n jmp .retn");

.stmt396:
 push stmt_5
 call prs
 add  sp, 2

;-896         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-897         nreturn++;

 inc  word[nreturn]

;-898         expect(';');

 push 59
 call expect
 add  sp, 2

;-899         }


;-900   else if(thechar==':')      {

 jmp .stmt397
.stmt395:
 mov al, [thechar]
 cmp al, 58
 jne .stmt398

;-901         prs("\n."); // Label

 push stmt_6
 call prs
 add  sp, 2

;-902         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-903         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-904         expect(':');

 push 58
 call expect
 add  sp, 2

;-905         }


;-906   else  {expr(0);; expect(';'); }

 jmp .stmt399
.stmt398:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-907 }

.stmt399:
.stmt397:
.stmt394:
.stmt392:
.stmt389:
.stmt383:
.stmt379:
.stmt377:
.stmt375:
.stmt373:
.stmt369:

;-908 


;-909 


;-910 int dofunc() { int nloc; int i; unsigned int j;int narg;
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

;-911     cloc=&co;
;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax

;-912     checknamelen();

 call checknamelen

;-913     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-914     i=0;

 mov ax, 0
 mov [bp-4], ax

;-915     while (i < FTop) {

.dofunc400:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc401

;-916         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax

;-917         if(eqstr(symbol, j)) error1("Function already defined");

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

;-918         i++;

.dofunc402:
 inc  word[bp-4]

;-919     }


;-920     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc400
.dofunc401:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc403
 push dofunc_1
 call error1
 add  sp, 2

;-921     pt=adrF(FNameField, FTop);

.dofunc403:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-922     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-923     FTop++;

 inc  word[FTop]

;-924 


;-925   prs("\n\n"); prs(symbol); prs(": PROC");

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

;-926   expect('('); LTop=LSTART;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax

;-927   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc404
 mov ax, 2
 mov [bp-8], ax

;-928     do { typeName();  addlocal(); narg+=2;

.dofunc405:
 call typeName
 call addlocal
 add  word[bp-8], 2

;-929          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc406
 add  word[bp-8], 2
.dofunc406:
 inc  word[LTop]

;-930     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc407
 jmp .dofunc405
.dofunc407:
 push 41
 call expect
 add  sp, 2

;-931 


;-932   expect('{'); /*body*/

.dofunc404:
 push 123
 call expect
 add  sp, 2

;-933   nloc=0; nreturn=0; nconst=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax

;-934   while(isvariable()) {

.dofunc408:
 call isvariable
 or  al, al
 je .dofunc409

;-935     do {typeName();

.dofunc410:
 call typeName

;-936         checknamelen();

 call checknamelen

;-937         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-938         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc411
 sub  word[bp-2], 2

;-939         GData[LTop]=nloc;

.dofunc411:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-940         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc412

;-941             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

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

;-942             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-943             }


;-944         LTop++;

.dofunc412:
 inc  word[LTop]

;-945       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc413
 jmp .dofunc410
.dofunc413:
 push 59
 call expect
 add  sp, 2

;-946   if (LTop>LSTART){prs(";\n ENTER  ");

 jmp .dofunc408
.dofunc409:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc414
 push dofunc_4
 call prs
 add  sp, 2

;-947     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

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

;-948   while(istoken('}')==0)   stmt();

.dofunc414:
.dofunc415:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc416
 call stmt

;-949   if (nreturn) {

 jmp .dofunc415
.dofunc416:
 mov ax, [nreturn]
 or  al, al
 je .dofunc417

;-950         prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2

;-951         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-952         prc(':');

 push 58
 call prc
 add  sp, 2

;-953         }


;-954   if (LTop > LSTART) prs(" LEAVE");

.dofunc417:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc418
 push dofunc_7
 call prs
 add  sp, 2

;-955   prs("\n ret");

.dofunc418:
 push dofunc_8
 call prs
 add  sp, 2

;-956   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-957   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-958   if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc419
 mov ax, [maxco1]
 mov word [maxco], ax

;-959   prs("\nENDP");

.dofunc419:
 push dofunc_9
 call prs
 add  sp, 2

;-960 }


;-961 


;-962 char doglobName[IDLENMAX];
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
absolute 41799
doglobName resb 15
section .text

;-963 int doglob() {


doglob: PROC

;-964     int i; int j; int isstrarr; isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-965   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob420
 push doglob_0
 call error1
 add  sp, 2

;-966   if (iswidth == 0) error1("no VOID as var type");

.doglob420:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob421
 push doglob_1
 call error1
 add  sp, 2

;-967   checknamelen();

.doglob421:
 call checknamelen

;-968   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob422
 push doglob_2
 call error1
 add  sp, 2

;-969   if (istoken('[')) { istype='&';

.doglob422:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob423
 mov ax, 38
 mov byte [istype], al

;-970     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob424

;-971       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-972       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-973       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-974       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob425
 push doglob_5
 call prs
 add  sp, 2

;-975       if (iswidth==2) prs(" resw ");

.doglob425:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob426
 push doglob_6
 call prs
 add  sp, 2

;-976       if (iswidth==4) prs(" resd ");

.doglob426:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob427
 push doglob_7
 call prs
 add  sp, 2

;-977       prunsign1(lexval);

.doglob427:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-978       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-979       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-980       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob428
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-981       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

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

;-982       GData[GTop]=lexval; expect(']');

.doglob429:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-983     }else { expect(']');

 jmp .doglob430
.doglob424:
 push 93
 call expect
 add  sp, 2

;-984       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob431
 push doglob_9
 call error1
 add  sp, 2

;-985       prs("\n"); prs(symbol); prs(" db ");

.doglob431:
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

;-986       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-987       expect('=');

 push 61
 call expect
 add  sp, 2

;-988       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob432

;-989         prc(34); prscomment(symbol); prc(34); prs(",0");

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

;-990         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-991       else if (istoken('{' )) { i=0;

 jmp .doglob433
.doglob432:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob434
 mov ax, 0
 mov [bp-2], ax

;-992         do { if(i) prc(',');

.doglob435:
 mov ax, [bp-2]
 or  al, al
 je .doglob436
 push 44
 call prc
 add  sp, 2

;-993           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob436:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-994         while (istoken(',')); expect('}'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob437
 jmp .doglob435
.doglob437:
 push 125
 call expect
 add  sp, 2

;-995       else error1("String or number array expected");

 jmp .doglob438
.doglob434:
 push doglob_13
 call error1
 add  sp, 2

;-996       };

.doglob438:
.doglob433:
.doglob430:

;-997   }else { //expect('=');

 jmp .doglob439
.doglob423:

;-998     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob440
 push doglob_15
 call prs
 add  sp, 2

;-999     else {

 jmp .doglob441
.doglob440:

;-1000       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob442
 push doglob_16
 call prs
 add  sp, 2

;-1001       else if (iswidth==2) prs(" dw ");

 jmp .doglob443
.doglob442:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob444
 push doglob_17
 call prs
 add  sp, 2

;-1002       else                 prs(" dd ");

 jmp .doglob445
.doglob444:
 push doglob_18
 call prs
 add  sp, 2

;-1003     }

.doglob445:
.doglob443:

;-1004     if(istoken('-')) prc('-');

.doglob441:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob446
 push 45
 call prc
 add  sp, 2

;-1005     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob446:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob447
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-1006     else prunsign1(0); }

 jmp .doglob448
.doglob447:
 push 0
 call prunsign1
 add  sp, 2
.doglob448:

;-1007   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob439:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-1008   pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1009   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob449
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob450
.doglob449:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1010   GTop++; expect(';'); }

.doglob450:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-1011 


;-1012 


;-1013 int dodefine() {
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

;-1014     int i; int j; int fdtemp;


;-1015     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine451

;-1016         token=getlex();

 call getlex
 mov word [token], ax

;-1017         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1018         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1019         return;

 jmp .retndodefine

;-1020     }


;-1021     expect(T_NAME);

.dodefine451:
 push 256
 call expect
 add  sp, 2

;-1022     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine452

;-1023         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine453
 push dodefine_1
 call error1
 add  sp, 2

;-1024         i=strlen(symbol);

.dodefine453:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1025         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine454
 push dodefine_2
 call error1
 add  sp, 2

;-1026         GSign [GTop]='U';

.dodefine454:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1027         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1028         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1029         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1030         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1031         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1032         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1033         GTop++;

 inc  word[GTop]

;-1034     }


;-1035 }

.dodefine452:

;-1036 


;-1037 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1038     token=getlex();

 call getlex
 mov word [token], ax

;-1039     do {

.parse455:

;-1040         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse456
 mov ax, 1
 jmp .retnparse

;-1041         if (istoken('#')) {

.parse456:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse457

;-1042              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse458
 call dodefine

;-1043              else error1("define expected");

 jmp .parse459
.parse458:
 push parse_0
 call error1
 add  sp, 2

;-1044         }

.parse459:

;-1045     else{

 jmp .parse460
.parse457:

;-1046         typeName();

 call typeName

;-1047         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse461
 call dofunc

;-1048         else doglob(); }

 jmp .parse462
.parse461:
 call doglob
.parse462:

;-1049     } while(1);

.parse460:
 mov ax, 1
 or  al, al
 je .parse463
 jmp .parse455
.parse463:

;-1050 }


;-1051 


;-1052 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130

;-1053 int main() {


main: PROC

;-1054     int arglen1; unsigned int i; char *c;


;-1055     arglen1=*arglen;
;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1056     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main464

;-1057         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1058         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2

;-1059         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1060         }


;-1061     i=arglen1+129;

.main464:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1062     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1063     arglen1--;

 dec  word[bp-2]

;-1064     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1065     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1066     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

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

;-1067     strcpy(namelst, namein);

.main465:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1068     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1069     i--;

 dec  word[bp-4]

;-1070     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1071     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1072 


;-1073     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1074     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main466

;-1075         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2

;-1076         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1077         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1078         }


;-1079     fdout=creatR(namelst);

.main466:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1080     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main467

;-1081         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2

;-1082         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1083         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1084         }


;-1085     prs("\n; ");

.main467:
 push main_4
 call prs
 add  sp, 2

;-1086     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1087     prs(", Source: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1088     prs(", Output asm: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1089     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2

;-1090     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1091     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1092     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1093     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1094     parse();

 call parse

;-1095     prs("\n;Input: "); prs(namein);

 push main_8
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1096     prs(", List: ");   prs(namelst);

 push main_9
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1097     prs(", Lines: "); prunsign1(lineno);

 push main_10
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-1098     prs("\n;Glob. variables: "); GTop--; prunsign1(GTop);

 push main_11
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call prunsign1
 add  sp, 2

;-1099     prs(" ("); prunsign1(LSTART);

 push main_12
 call prs
 add  sp, 2
 push 200
 call prunsign1
 add  sp, 2

;-1100     prs("), Functions: "); prunsign1(FTop);

 push main_13
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2

;-1101     prs(" ("); prunsign1(FUNCMAX);

 push main_14
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2

;-1102     prs(")\n;Constant: ");   prunsign1(maxco);

 push main_15
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2

;-1103     prs(" ("); prunsign1(COMAX);

 push main_16
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2

;-1104     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax

;-1105     if (i <= 1000)prs("\n *** Warning *** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main468
 push main_17
 call prs
 add  sp, 2

;-1106     prs("), stacksize: ");

.main468:
 push main_18
 call prs
 add  sp, 2

;-1107     i=65636; i=i-orgData;

 mov ax, 100
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax

;-1108     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2

;-1109     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main469
 push main_19
 call prs
 add  sp, 2

;-1110     prs("    ");

.main469:
 push main_20
 call prs
 add  sp, 2

;-1111     end1(0);

 push 0
 call end1
 add  sp, 2

;-1112 }
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
main_15 db ")\n;Constant: ",0
main_16 db " (",0
main_17 db "\n *** Warning *** constant area too small",0
main_18 db "), stacksize: ",0
main_19 db "\n *** Warning *** Stack too small",0
main_20 db "    ",0
ENDP
;Input: A.C, List: A.S, Lines: 1113
;Glob. variables: 99 (200), Functions: 71 (300)
;Constant: 688 (3000), stacksize: 23822    