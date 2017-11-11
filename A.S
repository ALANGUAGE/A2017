
;A.COM V0.9.4, Input: A.C, Output: A.S
org  256 
jmp main

;-1 char Version1[]="A.COM V0.9.4";//todo: 2. op=reg not recognized

Version1 db "A.COM V0.9.4",0

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

;-65 #define VARMAX        400//max global and local var


;-66 #define LSTART        200//max global var


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

LTop dw 200

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


;-91 int writetty()     {ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-92 int putch(char c)  {if (c==10)  {al=13; writetty();} al=c; writetty(); }

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

;-93 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
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

;-94 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-95 


;-96 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-97     __emit__(0xCD,0x21);//inth 0x21;

 db 205,33

;-98     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-99     DOS_ERR++;

 inc  word[DOS_ERR]

;-100 }


;-101 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-102 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-103 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-104 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-105 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-106     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-107 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC;
 ENTER  0,0
lea dx, [bp+4]

;-108     cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-109 


;-110 int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-111       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-112       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-113       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-114       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-115       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-116       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-117       if (c> 'Z') { if (c< 'a') return 0; }

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

;-118       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-119 }


;-120 int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-121       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-122       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-123       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-124 }


;-125 int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-126     if (digit (c)) return 1;
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

;-127     if (letter(c)) return 1;

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

;-128     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-129 }


;-130 


;-131 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-132     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-133     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-134     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-135 }


;-136 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-137     do { *s=*t; s++; t++; }
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

;-138     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-139     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-140     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-141 }


;-142 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-143     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-144         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-145         p++;

.eqstr22:
 inc  word[bp+4]

;-146         q++;

 inc  word[bp+6]

;-147     }


;-148     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-149     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-150 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-151     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-152     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-153 }


;-154 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-155     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-156         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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

;-157         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-158     }


;-159 }

 jmp .toupper26
.toupper27:

;-160 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-161     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-162         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-163         s++;

.instr132:
 inc  word[bp+4]

;-164     }


;-165     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-166 }


;-167 


;-168 int eprc(char c)  {

 .retninstr1: LEAVE
 ret
ENDP

eprc: PROC

;-169     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al

;-170     cloc++;

 inc  word[cloc]

;-171 }


;-172 int eprs(char *s) {
 LEAVE
 ret
ENDP

eprs: PROC

;-173     char c;


;-174     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34

;-175         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-176         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2

;-177         s++;

 inc  word[bp+4]

;-178     }


;-179 }

 jmp .eprs33
.eprs34:

;-180 


;-181 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-182     if (isPrint) {
;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35

;-183         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36

;-184             ax=13;

 mov  ax, 13

;-185             writetty();

 call writetty

;-186         }


;-187         al=c;

.prc36:
 mov  al, [bp+4]

;-188         writetty();

 call writetty

;-189     }


;-190     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-191 }


;-192 


;-193 int prscomment(unsigned char *s) {
 LEAVE
 ret
ENDP

prscomment: PROC

;-194     unsigned char c;


;-195     while(*s){
;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38

;-196         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-197         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-198         s++;

 inc  word[bp+4]

;-199     }


;-200 }

 jmp .prscomment37
.prscomment38:

;-201 


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

.prs39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs40

;-206         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-207         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs41
 mov ax, [bp-4]
 or  al, al
 je .prs42
 mov ax, 0
 mov [bp-4], ax

;-208                    else com=1;

 jmp .prs43
.prs42:
 mov ax, 1
 mov [bp-4], ax

;-209         if (c==92) {

.prs43:
.prs41:
 mov al, [bp-2]
 cmp al, 92
 jne .prs44

;-210             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs45

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
 jne .prs46
 mov ax, 10
 mov [bp-2], al

;-214                 if (c=='t') c= 9;

.prs46:
 mov al, [bp-2]
 cmp al, 116
 jne .prs47
 mov ax, 9
 mov [bp-2], al

;-215             }

.prs47:

;-216         }

.prs45:

;-217         prc(c);

.prs44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-218         s++;

 inc  word[bp+4]

;-219     }


;-220 }

 jmp .prs39
.prs40:

;-221 


;-222 int eprnum(int n){//for docall1 procedure
 LEAVE
 ret
ENDP

eprnum: PROC

;-223     int e;


;-224     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48

;-225         eprc('-');

 push 45
 call eprc
 add  sp, 2

;-226         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-227     }


;-228     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49

;-229         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-230         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2

;-231     }


;-232     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-233     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax

;-234     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2

;-235 }


;-236 


;-237 int pint1 (int n){
 LEAVE
 ret
ENDP

pint1: PROC

;-238     int e;


;-239     if(n<0) {  prc('-');  n=mkneg(n); }
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

;-240     if (n >= 10) {

.pint150:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint151

;-241         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-242         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2

;-243     }


;-244     n=n%10;

.pint151:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-245     n += '0';

 add  word[bp+4], 48

;-246     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-247 }


;-248 


;-249 int prunsign1(unsigned int n) {
 LEAVE
 ret
ENDP

prunsign1: PROC

;-250     unsigned int e;


;-251     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign152

;-252         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax

;-253         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-254     }


;-255     n = n % 10; /*unsigned mod*/

.prunsign152:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax

;-256     n += '0';

 add  word[bp+4], 48

;-257     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-258 }


;-259 


;-260 int end1(int n) {
 LEAVE
 ret
ENDP

end1: PROC

;-261     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-262     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-263     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-264 }


;-265 


;-266 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-267     isPrint=1;
;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al

;-268     lineno--;

 dec  word[lineno]

;-269     prs("\n ");

 push error1_0
 call prs
 add  sp, 2

;-270     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-271     prs(";Line: ");

 push error1_1
 call prs
 add  sp, 2

;-272     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-273     prs(" ************** ERROR: ");

 push error1_2
 call prs
 add  sp, 2

;-274     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-275     prs("  in column: ");

 push error1_3
 call prs
 add  sp, 2

;-276     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-277     prs("\nToken: ");

 push error1_4
 call prs
 add  sp, 2

;-278     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-279     prs(", symbol: ");

 push error1_5
 call prs
 add  sp, 2

;-280     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-281     end1(1);

 push 1
 call end1
 add  sp, 2

;-282 }


;-283 


;-284 int printinputline() {
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

;-285     int col;


;-286     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-287     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-288     do {

.printinputline53:

;-289         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-290         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline

;-291         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-292         fgetsp++;

 inc  word[fgetsp]

;-293         col++;

 inc  word[bp-2]

;-294         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2

;-295         }

.printinputline55:

;-296         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:

;-297     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-298     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline57

;-299         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-300         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-301         prc(' ');

 push 32
 call prc
 add  sp, 2

;-302         lineno++;

 inc  word[lineno]

;-303         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-304         }


;-305 }

.printinputline57:

;-306 


;-307 int fgets1() {

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n\n;-",0
ENDP

fgets1: PROC

;-308     char c;


;-309     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-310     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets158

;-311         printinputline();

 call printinputline

;-312         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets159
 mov ax, 0
 jmp .retnfgets1

;-313         fgetsp=&fgetsdest;

.fgets159:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-314         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-315         column=0;

 mov ax, 0
 mov word [column], ax

;-316     }


;-317     fgetsp++;

.fgets158:
 inc  word[fgetsp]

;-318     column++;

 inc  word[column]

;-319     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-320 }


;-321 


;-322 int next() {

 .retnfgets1: LEAVE
 ret
ENDP

next: PROC

;-323     char r;


;-324     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-325     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-326     return r;

 mov al, [bp-2]
 jmp .retnnext

;-327 }


;-328 


;-329 int adrF(char *s, unsigned int i) {

 .retnnext: LEAVE
 ret
ENDP

adrF: PROC

;-330     i << 4;//*16; IDLENMAX=15!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-331     __asm{ add ax, [bp+4]  ; offset s }

 add ax, [bp+4]  ; offset s 

;-332 }


;-333 


;-334 int printName(unsigned int i) {
 LEAVE
 ret
ENDP

printName: PROC

;-335     int j;


;-336     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName60

;-337         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax

;-338         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2

;-339     }


;-340     else {

 jmp .printName61
.printName60:

;-341         prs("[bp");

 push printName_0
 call prs
 add  sp, 2

;-342         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-343         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName62
 push 43
 call prc
 add  sp, 2

;-344         pint1(j);

.printName62:
 push word [bp-2]
 call pint1
 add  sp, 2

;-345         prc(']');

 push 93
 call prc
 add  sp, 2

;-346     }


;-347 }

.printName61:

;-348 


;-349 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC

;-350     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL63
 mov ax, 1
 jmp .retnifEOL

;-351     if (c == 13) {//CR

.ifEOL63:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL64

;-352         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL65
 call next
 mov [bp+4], al

;-353         return 1;

.ifEOL65:
 mov ax, 1
 jmp .retnifEOL

;-354     }


;-355     return 0;

.ifEOL64:
 mov ax, 0
 jmp .retnifEOL

;-356 }


;-357 


;-358 char symboltemp[80];

 .retnifEOL: LEAVE
 ret
ENDP
section .bss
absolute 41657
symboltemp resb 80
section .text

;-359 


;-360 int getlex() {


getlex: PROC

;-361     char c; char *p;


;-362     int i; int j;


;-363 g1: c=next();
;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al

;-364     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex66
 mov ax, 0
 jmp .retngetlex

;-365     if (c <= ' ') goto g1;

.getlex66:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex67
 jmp .g1

;-366   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex67:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex68
 mov al, [thechar]
 cmp al, 61
 jne .getlex69
 call next
 mov ax, 806
 jmp .retngetlex
.getlex69:

;-367   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex68:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex70
 mov al, [thechar]
 cmp al, 61
 jne .getlex71
 call next
 mov ax, 807
 jmp .retngetlex
.getlex71:

;-368   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex70:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex72
 mov al, [thechar]
 cmp al, 61
 jne .getlex73
 call next
 mov ax, 824
 jmp .retngetlex
.getlex73:

;-369   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex72:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex74
 mov al, [thechar]
 cmp al, 61
 jne .getlex75
 call next
 mov ax, 811
 jmp .retngetlex
.getlex75:

;-370   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex74:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex76
 mov al, [thechar]
 cmp al, 60
 jne .getlex77
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex77:

;-371   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex76:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex78
 mov al, [thechar]
 cmp al, 62
 jne .getlex79
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex79:

;-372   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex78:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex80
 mov al, [thechar]
 cmp al, 43
 jne .getlex81
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex81:

;-373   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex80:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex82
 mov al, [thechar]
 cmp al, 45
 jne .getlex83
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex83:

;-374   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex82:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex84
 mov al, [thechar]
 cmp al, 61
 jne .getlex85
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex85:

;-375   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex84:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex86
 mov al, [thechar]
 cmp al, 61
 jne .getlex87
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex87:

;-376   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex86:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex88
 mov al, [thechar]
 cmp al, 61
 jne .getlex89
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex89:

;-377   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex88:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex90
 mov al, [thechar]
 cmp al, 61
 jne .getlex91
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex91:

;-378   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex90:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex92
 mov al, [thechar]
 cmp al, 61
 jne .getlex93
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex93:

;-379   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex92:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex94
 mov al, [thechar]
 cmp al, 61
 jne .getlex95
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex95:

;-380   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex94:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex96
 mov al, [bp-2]
 jmp .retngetlex

;-381   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex97

;-382       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex98

;-383           do c=next();

.getlex99:
 call next
 mov [bp-2], al

;-384           while(ifEOL(c)==0) return getlex();

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex100
 jmp .getlex99
.getlex100:
 call getlex
 jmp .retngetlex

;-385       }


;-386   }

.getlex98:

;-387   if (c == '/') {

.getlex97:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex101

;-388       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex102

;-389           g2: c=next();

.g2:
 call next
 mov [bp-2], al

;-390           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex103
 jmp .g2

;-391           if (thechar != '/') goto g2;

.getlex103:
 mov al, [thechar]
 cmp al, 47
 je  .getlex104
 jmp .g2

;-392           c=next();

.getlex104:
 call next
 mov [bp-2], al

;-393           return getlex();

 call getlex
 jmp .retngetlex

;-394       } else  return '/';

 jmp .getlex105
.getlex102:
 mov ax, 47
 jmp .retngetlex

;-395   }

.getlex105:

;-396   if (c == '"') {

.getlex101:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex106

;-397       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax

;-398       c=next();

 call next
 mov [bp-2], al

;-399       while (c != '"') {

.getlex107:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex108

;-400           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-401           p++;

 inc  word[bp-4]

;-402           c=next();

 call next
 mov [bp-2], al

;-403           }


;-404           *p=0;

 jmp .getlex107
.getlex108:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-405       return T_STRING;

 mov ax, 258
 jmp .retngetlex

;-406   }


;-407   if (digit(c)) {

.getlex106:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex109

;-408       lexval=0;

 mov ax, 0
 mov word [lexval], ax

;-409       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax

;-410       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex110
 mov ax, 88
 mov byte [thechar], al

;-411       if (thechar=='X') {

.getlex110:
 mov al, [thechar]
 cmp al, 88
 jne .getlex111

;-412           next();

 call next

;-413           while(alnum(thechar)) {

.getlex112:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex113

;-414               c=next();

 call next
 mov [bp-2], al

;-415               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex114
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al

;-416       	       if (c>64) c=c-7;

.getlex114:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex115
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al

;-417                c=c-48;

.getlex115:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al

;-418                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-419                i=0;

 mov ax, 0
 mov [bp-6], ax

;-420                i=c;

 mov al, [bp-2]
 mov [bp-6], ax

;-421                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax

;-422            }


;-423        }else {

 jmp .getlex112
.getlex113:
 jmp .getlex116
.getlex111:

;-424            while(digit(thechar)) {

.getlex117:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex118

;-425                c=next();

 call next
 mov [bp-2], al

;-426                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al

;-427                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-428                i=0;

 mov ax, 0
 mov [bp-6], ax

;-429                i=c;

 mov al, [bp-2]
 mov [bp-6], ax

;-430                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax

;-431            }


;-432        }

 jmp .getlex117
.getlex118:

;-433       return T_CONST;

.getlex116:
 mov ax, 257
 jmp .retngetlex

;-434   }


;-435   if (c==39) {

.getlex109:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex119

;-436       lexval=next();

 call next
 mov word [lexval], ax

;-437       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex120

;-438           lexval=next();

 call next
 mov word [lexval], ax

;-439           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex121
 mov ax, 10
 mov word [lexval], ax

;-440           if (lexval=='t') lexval= 9;

.getlex121:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex122
 mov ax, 9
 mov word [lexval], ax

;-441           if (lexval=='0') lexval= 0;

.getlex122:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex123
 mov ax, 0
 mov word [lexval], ax

;-442       }

.getlex123:

;-443       next();

.getlex120:
 call next

;-444       return T_CONST;

 mov ax, 257
 jmp .retngetlex

;-445   }


;-446   if (alnum(c)) {

.getlex119:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex124

;-447     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4

;-448     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax

;-449     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-450     p++;

 inc  word[bp-4]

;-451     while(alnum(thechar)) {

.getlex125:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex126

;-452         c=next();

 call next
 mov [bp-2], al

;-453         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-454         p++;

 inc  word[bp-4]

;-455     }


;-456     *p=0;

 jmp .getlex125
.getlex126:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-457     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex127
 mov ax, 531
 jmp .retngetlex

;-458     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex127:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex128
 mov ax, 532
 jmp .retngetlex

;-459     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex128:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex129
 mov ax, 529
 jmp .retngetlex

;-460     if (eqstr(symbol,"int"     )) return T_INT;

.getlex129:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 517
 jmp .retngetlex

;-461     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex130:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 533
 jmp .retngetlex

;-462     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex131:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 530
 jmp .retngetlex

;-463     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex132:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 518
 jmp .retngetlex

;-464     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex133:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 519
 jmp .retngetlex

;-465     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex134:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 520
 jmp .retngetlex

;-466     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex135:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 512
 jmp .retngetlex

;-467     if (eqstr(symbol,"if"      )) return T_IF;

.getlex136:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 513
 jmp .retngetlex

;-468     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex137:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 514
 jmp .retngetlex

;-469     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex138:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 515
 jmp .retngetlex

;-470     if (eqstr(symbol,"do"      )) return T_DO;

.getlex139:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 516
 jmp .retngetlex

;-471     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex140:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex141
 mov ax, 521
 jmp .retngetlex

;-472     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex141:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex142
 mov ax, 511
 jmp .retngetlex

;-473 


;-474     i=0;//convert define to value

.getlex142:
 mov ax, 0
 mov [bp-6], ax

;-475     while (i < GTop) {

.getlex143:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex144

;-476         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax

;-477         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex145

;-478             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex146

;-479                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-480                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4

;-481                 return T_CONST;

 mov ax, 257
 jmp .retngetlex

;-482             }


;-483         }

.getlex146:

;-484         i++;

.getlex145:
 inc  word[bp-6]

;-485     }


;-486     return T_NAME; } error1("Input item not recognized");

 jmp .getlex143
.getlex144:
 mov ax, 256
 jmp .retngetlex
.getlex124:
 push getlex_17
 call error1
 add  sp, 2

;-487 }


;-488 


;-489 int istoken(int t) {

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

;-490     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken147

;-491         token=getlex();

 call getlex
 mov word [token], ax

;-492         return 1;

 mov ax, 1
 jmp .retnistoken

;-493     }


;-494     return 0;

.istoken147:
 mov ax, 0
 jmp .retnistoken

;-495 }


;-496 


;-497 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-498     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect148

;-499         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-500         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-501         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-502         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-503         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-504     }


;-505 }

.expect148:

;-506 


;-507 int v(unsigned int i) {//value
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC

;-508     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v149
 push 91
 call prc
 add  sp, 2

;-509     printName(i);

.v149:
 push word [bp+4]
 call printName
 add  sp, 2

;-510     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v150
 push 93
 call prc
 add  sp, 2

;-511 }

.v150:

;-512 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-513     int i;


;-514     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-515     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen151
 push checknamelen_0
 call error1
 add  sp, 2

;-516 }

.checknamelen151:

;-517 


;-518 int checkName() { 
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

checkName: PROC

;-519     unsigned int i; unsigned int j;


;-520     i=LSTART;
;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax

;-521     while(i<LTop) {

.checkName152:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName153

;-522         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-523         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName154
 mov ax, [bp-2]
 jmp .retncheckName

;-524         i++;

.checkName154:
 inc  word[bp-2]

;-525     }


;-526     i=1;

 jmp .checkName152
.checkName153:
 mov ax, 1
 mov [bp-2], ax

;-527     while(i<GTop) {

.checkName155:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName156

;-528         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax

;-529         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName157
 mov ax, [bp-2]
 jmp .retncheckName

;-530         i++;

.checkName157:
 inc  word[bp-2]

;-531     }


;-532     return 0;

 jmp .checkName155
.checkName156:
 mov ax, 0
 jmp .retncheckName

;-533 }


;-534 


;-535 int searchname() { 

 .retncheckName: LEAVE
 ret
ENDP

searchname: PROC

;-536     unsigned int i;


;-537     i=checkName(); 
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax

;-538     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname158
 push searchname_0
 call error1
 add  sp, 2

;-539     return i;

.searchname158:
 mov ax, [bp-2]
 jmp .retnsearchname

;-540 }


;-541 


;-542 int name1() {

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC

;-543     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1159
 push name1_0
 call error1
 add  sp, 2

;-544     token=getlex();

.name1159:
 call getlex
 mov word [token], ax

;-545 }


;-546 


;-547 int typeName() { 

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC

;-548     int m; //0=V,1=*,2=&


;-549     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-550     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 83
 mov byte [issign], al

;-551     if(istoken(T_UNSIGNED)) issign='U';

.typeName160:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 85
 mov byte [issign], al

;-552     iswidth=2;

.typeName161:
 mov ax, 2
 mov byte [iswidth], al

;-553     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 0
 mov byte [iswidth], al

;-554     if(istoken(T_CHAR))     iswidth=1;

.typeName162:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 1
 mov byte [iswidth], al

;-555     if(istoken(T_INT))      iswidth=2;

.typeName163:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 2
 mov byte [iswidth], al

;-556     if(istoken(T_LONG))     iswidth=4;

.typeName164:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 4
 mov byte [iswidth], al

;-557     istype='V';

.typeName165:
 mov ax, 86
 mov byte [istype], al

;-558     m=0;

 mov ax, 0
 mov [bp-2], ax

;-559     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-560     if(istoken('&'))  {istype='&'; m=2;}

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

;-561     name1();

.typeName167:
 call name1

;-562     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-563 }


;-564 


;-565 int gettypes(int i) {

 .retntypeName: LEAVE
 ret
ENDP

gettypes: PROC

;-566     int j; char c;


;-567     c=GSign [i]; 
;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al

;-568     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-4]
 cmp al, 83
 jne .gettypes168
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes169
.gettypes168:
 mov ax, 0
 mov word [signi], ax

;-569     c=GWidth[i]; 

.gettypes169:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al

;-570     widthi=0;

 mov ax, 0
 mov word [widthi], ax

;-571     wi=0;

 mov ax, 0
 mov word [wi], ax

;-572     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes170
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-573     if (c==2) {widthi=2;wi=2;}

.gettypes170:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes171
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-574     if (c==4) {widthi=4;wi=4;}

.gettypes171:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes172
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-575     c=GType [i]; 

.gettypes172:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al

;-576     typei=0; 

 mov ax, 0
 mov word [typei], ax

;-577     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-4]
 cmp al, 42
 jne .gettypes173
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-578     if (c=='&')  typei=2;

.gettypes173:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes174
 mov ax, 2
 mov word [typei], ax

;-579     return i; 

.gettypes174:
 mov ax, [bp+4]
 jmp .retngettypes

;-580 }


;-581 


;-582 int addlocal() { 

 .retngettypes: LEAVE
 ret
ENDP

addlocal: PROC

;-583     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal175
 push addlocal_0
 call error1
 add  sp, 2

;-584     if (checkName() != 0) error1("Variable already defined");

.addlocal175:
 call checkName
 cmp ax, 0
 je  .addlocal176
 push addlocal_1
 call error1
 add  sp, 2

;-585     GSign[LTop]=issign; 

.addlocal176:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al

;-586     GWidth[LTop]=iswidth; 

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al

;-587     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-588     pt=adrF(GNameField, LTop); 

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-589     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-590 }


;-591 


;-592 


;-593 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC

;-594        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg177
 push cmpneg_0
 call prs
 add  sp, 2

;-595   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg178
.cmpneg177:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg179
 push cmpneg_1
 call prs
 add  sp, 2

;-596   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

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

;-597                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg183
.cmpneg182:
 push cmpneg_3
 call prs
 add  sp, 2

;-598   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

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

;-599                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-600                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg187
.cmpneg186:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-601                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-602   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg187:
 jmp .cmpneg188
.cmpneg185:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg189
 push cmpneg_8
 call prs
 add  sp, 2

;-603   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg190
.cmpneg189:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg191
 push cmpneg_9
 call prs
 add  sp, 2

;-604   else error1("internal error compare unknown in CMPNEG()");  

 jmp .cmpneg192
.cmpneg191:
 push cmpneg_10
 call error1
 add  sp, 2

;-605 }

.cmpneg192:
.cmpneg190:
.cmpneg188:
.cmpneg184:
.cmpneg180:
.cmpneg178:

;-606 


;-607 int isrelational() {
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

;-608     if (token==T_EQ) goto w; 

 mov ax, [token]
 cmp ax, 806
 jne .isrelational193
 jmp .w

;-609     if (token==T_NE) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational194
 jmp .w

;-610     if (token==T_LE) goto w; 

.isrelational194:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational195
 jmp .w

;-611     if (token==T_GE) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational196
 jmp .w

;-612     if (token=='<' ) goto w; 

.isrelational196:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational197
 jmp .w

;-613     if (token=='>' ) goto w;

.isrelational197:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational198
 jmp .w

;-614     return 0;  

.isrelational198:
 mov ax, 0
 jmp .retnisrelational

;-615 w:  iscmp=token; 

.w:
 mov ax, [token]
 mov word [iscmp], ax

;-616     token=getlex(); 

 call getlex
 mov word [token], ax

;-617     return 1;

 mov ax, 1
 jmp .retnisrelational

;-618 }


;-619 


;-620 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC

;-621   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg199
 mov ax, 0
 jmp .retncheckreg

;-622   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

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

;-623   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

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

;-624   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

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

;-625   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

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

;-626   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

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

;-627   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

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

;-628   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

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

;-629   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

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

;-630   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

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

;-631   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

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

;-632   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

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

;-633   // (eqstr(symbol,"ip")) return 45;


;-634   if (strlen(symbol) >   3) return 0;

.checkreg221:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg222
 mov ax, 0
 jmp .retncheckreg

;-635   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

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

;-636   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

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

;-637   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

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

;-638   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

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

;-639 //  if (eqstr(symbol,"cr0")) return 71;


;-640   return 0;   

.checkreg230:
 mov ax, 0
 jmp .retncheckreg

;-641 }


;-642 


;-643 char printregstr[]

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

;-644 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0

;-645 


;-646 int printreg(int i) {  


printreg: PROC

;-647     unsigned int k; unsigned char c;


;-648     k = &printregstr + i; 
;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax

;-649     c=*k; 

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al

;-650     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-651     i++;

 inc  word[bp+4]

;-652     k = &printregstr + i; 

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax

;-653     c=*k; 

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al

;-654     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-655     if (i > 47) { 

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg231

;-656         i++; 

 inc  word[bp+4]

;-657         k = &printregstr + i; 

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax

;-658         c=*k; 

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al

;-659         prc(c); 

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-660         }


;-661 }

.printreg231:

;-662 


;-663 char ops[5];
 LEAVE
 ret
ENDP
section .bss
absolute 41737
ops resb 5
section .text

;-664 int doreg1(int iscmp1) { 


doreg1: PROC

;-665     int i;


;-666     if (istoken('='))          strcpy(ops, "mov");
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

;-667     if (istoken(T_PLUSASS))    strcpy(ops, "add");

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

;-668     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

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

;-669     if (istoken(T_ANDASS))     strcpy(ops, "and");

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

;-670     if (istoken(T_ORASS))      strcpy(ops, "or" );

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

;-671     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

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

;-672     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

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

;-673     if (iscmp1 == 1) { 

.doreg1238:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1239

;-674             token=getlex();

 call getlex
 mov word [token], ax

;-675             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1240
 push doreg1_7
 call error1
 add  sp, 2

;-676             strcpy(ops, "cmp"); 

.doreg1240:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-677         }


;-678     prs("\n "); 

.doreg1239:
 push doreg1_9
 call prs
 add  sp, 2

;-679     prs(ops); 

 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2

;-680     prs("  "); 

 push doreg1_10
 call prs
 add  sp, 2

;-681     printreg(ireg1); 

 push word [ireg1]
 call printreg
 add  sp, 2

;-682     prs(", ");

 push doreg1_11
 call prs
 add  sp, 2

;-683 


;-684     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1241

;-685         prunsign1(lexval); 

 push word [lexval]
 call prunsign1
 add  sp, 2

;-686         goto reg1;

 jmp .reg1

;-687         }


;-688     mod2=typeName(); 

.doreg1241:
 call typeName
 mov word [mod2], ax

;-689     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax

;-690     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1242

;-691         printreg(ireg2); 

 push word [ireg2]
 call printreg
 add  sp, 2

;-692         goto reg1;

 jmp .reg1

;-693         }


;-694     i=searchname();  

.doreg1242:
 call searchname
 mov [bp-2], ax

;-695     if (mod2 == 2) printName(i); 

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1243
 push word [bp-2]
 call printName
 add  sp, 2

;-696         else v(i);

 jmp .doreg1244
.doreg1243:
 push word [bp-2]
 call v
 add  sp, 2

;-697 reg1: if (iscmp1 == 1) {

.doreg1244:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1245

;-698     cmpneg(0); 

 push 0
 call cmpneg
 add  sp, 2

;-699     prs(fname); 

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-700     expect(')'); 

 push 41
 call expect
 add  sp, 2

;-701     }


;-702 }

.doreg1245:

;-703 


;-704 int compoundass(char *op, int mode, int id1) {
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

;-705     if(mode) error1("only scalar variable allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass246
 push compoundass_0
 call error1
 add  sp, 2

;-706     prs("\n "); 

.compoundass246:
 push compoundass_1
 call prs
 add  sp, 2

;-707     prs(op); 

 push word [bp+4]
 call prs
 add  sp, 2

;-708     prs("  ");

 push compoundass_2
 call prs
 add  sp, 2

;-709     gettypes(id1); 

 push word [bp+8]
 call gettypes
 add  sp, 2

;-710     if (wi==2) prs("word"); 

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass247
 push compoundass_3
 call prs
 add  sp, 2

;-711         else prs("byte");

 jmp .compoundass248
.compoundass247:
 push compoundass_4
 call prs
 add  sp, 2

;-712     v(id1); 

.compoundass248:
 push word [bp+8]
 call v
 add  sp, 2

;-713     prs(", ");

 push compoundass_5
 call prs
 add  sp, 2

;-714     expect(T_CONST); 

 push 257
 call expect
 add  sp, 2

;-715     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2

;-716 }


;-717 


;-718 int dovar1(int mode, int op, int ixarr, int id1) {
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

;-719     gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-720     if (mode==1) {

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1249

;-721         prs("\n mov bx, "); 

 push dovar1_0
 call prs
 add  sp, 2

;-722         v(id1); prs("\n "); 

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call prs
 add  sp, 2

;-723         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2

;-724         if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1250
 push dovar1_2
 call prs
 add  sp, 2

;-725         if(widthi == 2) prs(" ax, [bx]");

.dovar1250:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1251
 push dovar1_3
 call prs
 add  sp, 2

;-726         return; 

.dovar1251:
 jmp .retndovar1

;-727         }


;-728     if (mode==2){

.dovar1249:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1252

;-729         prs("\n ");

 push dovar1_4
 call prs
 add  sp, 2

;-730         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2

;-731         prs(" ax, "); 

 push dovar1_5
 call prs
 add  sp, 2

;-732         printName(id1); 

 push word [bp+10]
 call printName
 add  sp, 2

;-733         return; 

 jmp .retndovar1

;-734         }


;-735     if (ixarr) {

.dovar1252:
 mov ax, [bp+8]
 or  al, al
 je .dovar1253

;-736         prs("\n mov bx, "); 

 push dovar1_6
 call prs
 add  sp, 2

;-737         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2

;-738         if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_7
 call prs
 add  sp, 2

;-739         prs("\n "); 

.dovar1254:
 push dovar1_8
 call prs
 add  sp, 2

;-740         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2

;-741         if (wi==2) prs(" ax, "); 

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1255
 push dovar1_9
 call prs
 add  sp, 2

;-742             else prs(" al, ");

 jmp .dovar1256
.dovar1255:
 push dovar1_10
 call prs
 add  sp, 2

;-743         prc('['); 

.dovar1256:
 push 91
 call prc
 add  sp, 2

;-744         printName(id1); 

 push word [bp+10]
 call printName
 add  sp, 2

;-745         prs(" + bx]");

 push dovar1_11
 call prs
 add  sp, 2

;-746         return; 

 jmp .retndovar1

;-747         }


;-748     prs("\n ");

.dovar1253:
 push dovar1_12
 call prs
 add  sp, 2

;-749     prs(op);

 push word [bp+6]
 call prs
 add  sp, 2

;-750     if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1257
 push dovar1_13
 call prs
 add  sp, 2

;-751     if(wi==2) prs(" ax, ");

.dovar1257:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1258
 push dovar1_14
 call prs
 add  sp, 2

;-752     if(wi==4) prs(" eax, ");

.dovar1258:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1259
 push dovar1_15
 call prs
 add  sp, 2

;-753     v(id1);

.dovar1259:
 push word [bp+10]
 call v
 add  sp, 2

;-754 }


;-755 


;-756 int rterm(char *op) {

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

;-757     int mode; int opint; int ixarr; int id1;


;-758     if (istoken(T_CONST)) { 
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm260

;-759         prs("\n "); 

 push rterm_0
 call prs
 add  sp, 2

;-760         prs(op);

 push word [bp+4]
 call prs
 add  sp, 2

;-761         if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm261
 push rterm_1
 call prs
 add  sp, 2

;-762         if (wi==2) prs(" ax, ");

.rterm261:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm262
 push rterm_2
 call prs
 add  sp, 2

;-763         if (wi==4) prs(" eax, ");

.rterm262:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm263
 push rterm_3
 call prs
 add  sp, 2

;-764         prunsign1(lexval); 

.rterm263:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-765         return;

 jmp .retnrterm

;-766         }


;-767     mode=typeName(); 

.rterm260:
 call typeName
 mov [bp-2], ax

;-768     id1=searchname(); 

 call searchname
 mov [bp-8], ax

;-769     ixarr=0;

 mov ax, 0
 mov [bp-6], ax

;-770     if (istoken('[')) { 

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm264

;-771         ixarr=searchname(); 

 call searchname
 mov [bp-6], ax

;-772         expect(T_NAME); 

 push 256
 call expect
 add  sp, 2

;-773         expect(']');

 push 93
 call expect
 add  sp, 2

;-774         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-775         if (widthi != 2) error1("Array index must be int"); 

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm265
 push rterm_4
 call error1
 add  sp, 2

;-776         }

.rterm265:

;-777     if (eqstr(symbol,"ax")) return;

.rterm264:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm266
 jmp .retnrterm

;-778     opint=op; 

.rterm266:
 mov ax, [bp+4]
 mov [bp-4], ax

;-779     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-780 }


;-781 


;-782 int doassign(int mode, int i, int ixarr, int ixconst) {

 .retnrterm: LEAVE
 ret
rterm_0 db "\n ",0
rterm_1 db " al, ",0
rterm_2 db " ax, ",0
rterm_3 db " eax, ",0
rterm_4 db "Array index must be int",0
rterm_5 db "ax",0
ENDP

doassign: PROC

;-783     gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-784     if (mode==1) {

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign267

;-785         prs("\n mov  bx, ");

 push doassign_0
 call prs
 add  sp, 2

;-786         v(i);

 push word [bp+6]
 call v
 add  sp, 2

;-787         if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign268
 push doassign_1
 call prs
 add  sp, 2

;-788             else  prs("\n mov  [bx], al"); 

 jmp .doassign269
.doassign268:
 push doassign_2
 call prs
 add  sp, 2

;-789         return;

.doassign269:
 jmp .retndoassign

;-790         }


;-791     if (mode==2) {

.doassign267:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign270

;-792         prs("\n mov  ");

 push doassign_3
 call prs
 add  sp, 2

;-793         printName(i); 

 push word [bp+6]
 call printName
 add  sp, 2

;-794         prs(", ax"); 

 push doassign_4
 call prs
 add  sp, 2

;-795         return;

 jmp .retndoassign

;-796         }


;-797     if (ixarr) {  

.doassign270:
 mov ax, [bp+8]
 or  al, al
 je .doassign271

;-798         prs("\n mov bx, ");

 push doassign_5
 call prs
 add  sp, 2

;-799         if(ixconst) prunsign1(ixarr); 

 mov ax, [bp+10]
 or  al, al
 je .doassign272
 push word [bp+8]
 call prunsign1
 add  sp, 2

;-800             else v(ixarr);

 jmp .doassign273
.doassign272:
 push word [bp+8]
 call v
 add  sp, 2

;-801         if (wi==2) prs("\n shl bx, 1");

.doassign273:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign274
 push doassign_6
 call prs
 add  sp, 2

;-802         prs("\n mov [");

.doassign274:
 push doassign_7
 call prs
 add  sp, 2

;-803         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2

;-804         if (wi==2) prs("+bx], ax"); 

 mov ax, [wi]
 cmp ax, 2
 jne .doassign275
 push doassign_8
 call prs
 add  sp, 2

;-805             else prs("+bx], al"); 

 jmp .doassign276
.doassign275:
 push doassign_9
 call prs
 add  sp, 2

;-806         return;

.doassign276:
 jmp .retndoassign

;-807         }


;-808     if (wi==1){

.doassign271:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign277

;-809         prs("\n mov ");

 push doassign_10
 call prs
 add  sp, 2

;-810         if(i<LSTART) prs("byte ");

 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign278
 push doassign_11
 call prs
 add  sp, 2

;-811         v(i); 

.doassign278:
 push word [bp+6]
 call v
 add  sp, 2

;-812         prs(", al"); 

 push doassign_12
 call prs
 add  sp, 2

;-813         return; 

 jmp .retndoassign

;-814         }


;-815     if (wi==2){

.doassign277:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign279

;-816         prs("\n mov ");

 push doassign_13
 call prs
 add  sp, 2

;-817         if(i<LSTART) prs("word ");

 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign280
 push doassign_14
 call prs
 add  sp, 2

;-818         v(i); 

.doassign280:
 push word [bp+6]
 call v
 add  sp, 2

;-819         prs(", ax"); 

 push doassign_15
 call prs
 add  sp, 2

;-820         return; 

 jmp .retndoassign

;-821         }


;-822     if (wi==4){

.doassign279:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign281

;-823         prs("\n mov ");

 push doassign_16
 call prs
 add  sp, 2

;-824         if(i<LSTART) prs("dword ");

 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign282
 push doassign_17
 call prs
 add  sp, 2

;-825         v(i); 

.doassign282:
 push word [bp+6]
 call v
 add  sp, 2

;-826         prs(", eax"); 

 push doassign_18
 call prs
 add  sp, 2

;-827         return; 

 jmp .retndoassign

;-828         }


;-829 }

.doassign281:

;-830 


;-831 int domul(int ids) {

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

;-832     if (ids) rterm("imul"); 
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul283
 push domul_0
 call rterm
 add  sp, 2

;-833         else {

 jmp .domul284
.domul283:

;-834         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul285

;-835             prs("\n mov bx, "); 

 push domul_1
 call prs
 add  sp, 2

;-836             prunsign1(lexval); 

 push word [lexval]
 call prunsign1
 add  sp, 2

;-837             prs("\n mul bx");

 push domul_2
 call prs
 add  sp, 2

;-838             }


;-839         else error1("with MUL only const number as multiplicator allowed"); 

 jmp .domul286
.domul285:
 push domul_3
 call error1
 add  sp, 2

;-840         } 

.domul286:

;-841 }

.domul284:

;-842 


;-843 int doidiv(int ids) { 
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-844     int mode; int id1;


;-845     if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv287

;-846         prs("\n mov bx, "); 

 push doidiv_0
 call prs
 add  sp, 2

;-847         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2

;-848         if (ids) prs("\n cwd\n idiv bx"); 

 mov ax, [bp+4]
 or  al, al
 je .doidiv288
 push doidiv_1
 call prs
 add  sp, 2

;-849             else prs("\n mov dx, 0\n div bx"); 

 jmp .doidiv289
.doidiv288:
 push doidiv_2
 call prs
 add  sp, 2

;-850         }

.doidiv289:

;-851     else {

 jmp .doidiv290
.doidiv287:

;-852         mode=typeName(); 

 call typeName
 mov [bp-2], ax

;-853         id1=searchname();

 call searchname
 mov [bp-4], ax

;-854         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv291
 push doidiv_3
 call error1
 add  sp, 2

;-855         gettypes(id1);

.doidiv291:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-856         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv292
 push doidiv_4
 call error1
 add  sp, 2

;-857         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv292:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv293
 push doidiv_5
 call error1
 add  sp, 2

;-858         prs("\n mov bx, "); 

.doidiv293:
 push doidiv_6
 call prs
 add  sp, 2

;-859         v(id1);

 push word [bp-4]
 call v
 add  sp, 2

;-860         if (ids) prs("\n cwd\n idiv bx"); 

 mov ax, [bp+4]
 or  al, al
 je .doidiv294
 push doidiv_7
 call prs
 add  sp, 2

;-861             else prs("\n mov dx, 0\n div bx"); 

 jmp .doidiv295
.doidiv294:
 push doidiv_8
 call prs
 add  sp, 2

;-862     }

.doidiv295:

;-863 }

.doidiv290:

;-864 


;-865 int domod(int ids) { 
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

;-866     doidiv(ids); 
;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2

;-867     prs("\n mov ax, dx"); 

 push domod_0
 call prs
 add  sp, 2

;-868 }


;-869 


;-870 


;-871 int docalltype[10]; int docallvalue[10];
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

;-872 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 41782
procname resb 17
section .text

;-873 


;-874 int docall1() {


docall1: PROC

;-875     int i; int narg; int t0; int n0;  int sz32;


;-876     narg=0;  
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax

;-877     sz32=0;

 mov ax, 0
 mov [bp-10], ax

;-878     checknamelen();

 call checknamelen

;-879     strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-880     expect('(');

 push 40
 call expect
 add  sp, 2

;-881 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1296

;-882 	    do { 

.docall1297:

;-883 	        narg++;

 inc  word[bp-4]

;-884 	        if (narg >9 ) error1("Max. 9 parameters");  

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1298
 push docall1_0
 call error1
 add  sp, 2

;-885 	        t0=0;

.docall1298:
 mov ax, 0
 mov [bp-6], ax

;-886             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1299

;-887                 t0=1; 

 mov ax, 1
 mov [bp-6], ax

;-888                 n0=lexval; 

 mov ax, [lexval]
 mov [bp-8], ax

;-889                 }


;-890             if(istoken(T_STRING)){

.docall1299:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1300

;-891                 t0=2; 

 mov ax, 2
 mov [bp-6], ax

;-892                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax

;-893                 eprs("\n"); 

 push docall1_1
 call eprs
 add  sp, 2

;-894                 eprs(fname); 

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2

;-895                 eprc(95);

 push 95
 call eprc
 add  sp, 2

;-896                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2

;-897                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2

;-898                 eprc(34);

 push 34
 call eprc
 add  sp, 2

;-899                 eprs(symbol);

 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2

;-900                 eprc(34);

 push 34
 call eprc
 add  sp, 2

;-901                 eprs(",0"); 

 push docall1_3
 call eprs
 add  sp, 2

;-902                 nconst++; 

 inc  word[nconst]

;-903                 }


;-904             if(istoken('&'))     {

.docall1300:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1301

;-905                 t0=3; 

 mov ax, 3
 mov [bp-6], ax

;-906                 name1(); 

 call name1

;-907                 n0=searchname();

 call searchname
 mov [bp-8], ax

;-908                 }


;-909             if(istoken(T_NAME))  { 

.docall1301:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1302

;-910                 n0=checkreg();

 call checkreg
 mov [bp-8], ax

;-911                 if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1303
 mov ax, 5
 mov [bp-6], ax

;-912                 else {

 jmp .docall1304
.docall1303:

;-913                     t0=4; 

 mov ax, 4
 mov [bp-6], ax

;-914                     n0=searchname();

 call searchname
 mov [bp-8], ax

;-915                     p1=&GType; 

 mov ax, GType
 mov word [p1], ax

;-916                     p1=p1+n0; 

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax

;-917                     if (*p1=='&') t0=3; 

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1305
 mov ax, 3
 mov [bp-6], ax

;-918                     }

.docall1305:

;-919                 }

.docall1304:

;-920             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1302:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1306
 push docall1_4
 call error1
 add  sp, 2

;-921             docalltype [narg] = t0;

.docall1306:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-922             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-923         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1307
 jmp .docall1297
.docall1307:

;-924 


;-925   	expect(')');  

 push 41
 call expect
 add  sp, 2

;-926   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax

;-927     do {

.docall1308:

;-928         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-929         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-930         if(t0==1){ 

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1309

;-931             prs("\n push "); 

 push docall1_5
 call prs
 add  sp, 2

;-932             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2

;-933             }


;-934         if(t0==2){ 

.docall1309:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1310

;-935             prs("\n push ");

 push docall1_6
 call prs
 add  sp, 2

;-936             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-937             prc(95);

 push 95
 call prc
 add  sp, 2

;-938             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2

;-939             }


;-940         if(t0==3){ 

.docall1310:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1311

;-941             prs("\n lea  ax, ");   

 push docall1_7
 call prs
 add  sp, 2

;-942             v(n0);

 push word [bp-8]
 call v
 add  sp, 2

;-943             prs("\n push ax");

 push docall1_8
 call prs
 add  sp, 2

;-944             }


;-945         if(t0==4){ 

.docall1311:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1312

;-946             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2

;-947             if(wi==2) { 

 mov ax, [wi]
 cmp ax, 2
 jne .docall1313

;-948                 prs("\n push word "); 

 push docall1_9
 call prs
 add  sp, 2

;-949                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2

;-950                 }


;-951             else { 

 jmp .docall1314
.docall1313:

;-952                 prs("\n mov al, byte ");   

 push docall1_10
 call prs
 add  sp, 2

;-953                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2

;-954                 prs("\n mov ah, 0\n push ax"); 

 push docall1_11
 call prs
 add  sp, 2

;-955                 } 


;-956             }

.docall1314:

;-957         if(t0==5){ 

.docall1312:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1315

;-958             prs("\n push "); 

 push docall1_12
 call prs
 add  sp, 2

;-959             printreg(n0); 

 push word [bp-8]
 call printreg
 add  sp, 2

;-960             if (n0 >= 47) sz32+2;  

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1316
 mov ax, [bp-10]
 add ax, 2

;-961             }

.docall1316:

;-962         i--; 

.docall1315:
 dec  word[bp-2]

;-963         } while (i > 0);  

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1317
 jmp .docall1308
.docall1317:

;-964     }


;-965 	prs("\n call ");

.docall1296:
 push docall1_13
 call prs
 add  sp, 2

;-966 	prs(&procname);

 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-967 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1318

;-968 	    prs("\n add  sp, ");

 push docall1_14
 call prs
 add  sp, 2

;-969         narg=narg+narg; 

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax

;-970         narg=narg+sz32; 

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax

;-971         prunsign1(narg); 

 push word [bp-4]
 call prunsign1
 add  sp, 2

;-972         }


;-973 }

.docall1318:

;-974 


;-975 


;-976 int expr() { 
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

;-977     int mode;   int id1;     


;-978     int ixarr;  int ixconst;


;-979     int ids;    int isCONST; 


;-980     int i;      unsigned char *p;


;-981     


;-982     if (istoken(T_CONST)) {
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr319

;-983         prs("\n mov ax, "); 

 push expr_0
 call prs
 add  sp, 2

;-984         prunsign1(lexval); 

 push word [lexval]
 call prunsign1
 add  sp, 2

;-985         return 4; 

 mov ax, 4
 jmp .retnexpr

;-986         }


;-987     mode=typeName(); /*0=V,1=*,2=&*/

.expr319:
 call typeName
 mov [bp-2], ax

;-988     ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-989     if (ireg1) { 

 mov ax, [ireg1]
 or  al, al
 je .expr320

;-990         doreg1(0); 

 push 0
 call doreg1
 add  sp, 2

;-991         return; 

 jmp .retnexpr

;-992         }


;-993     if (token=='(')  {

.expr320:
 mov ax, [token]
 cmp ax, 40
 jne .expr321

;-994         docall1(); 

 call docall1

;-995         goto e1; 

 jmp .e1

;-996         }


;-997 


;-998     id1=searchname(); 

.expr321:
 call searchname
 mov [bp-4], ax

;-999     gettypes(id1); 

 push word [bp-4]
 call gettypes
 add  sp, 2

;-1000     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax

;-1001     ixarr=0;  

 mov ax, 0
 mov [bp-6], ax

;-1002     ixconst=0;

 mov ax, 0
 mov [bp-8], ax

;-1003     if (istoken('[')) { 

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr322

;-1004         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr323

;-1005             ixconst=1; 

 mov ax, 1
 mov [bp-8], ax

;-1006             ixarr=lexval; 

 mov ax, [lexval]
 mov [bp-6], ax

;-1007             expect(']');  

 push 93
 call expect
 add  sp, 2

;-1008             }


;-1009         else {

 jmp .expr324
.expr323:

;-1010             ixarr=searchname(); 

 call searchname
 mov [bp-6], ax

;-1011             expect(T_NAME); 

 push 256
 call expect
 add  sp, 2

;-1012             expect(']');

 push 93
 call expect
 add  sp, 2

;-1013             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-1014             if (widthi != 2) error1("Array index must be number or int"); 

 mov ax, [widthi]
 cmp ax, 2
 je  .expr325
 push expr_1
 call error1
 add  sp, 2

;-1015             } 

.expr325:

;-1016         }

.expr324:

;-1017     if (istoken(T_PLUSPLUS  )) {

.expr322:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr326

;-1018         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr327
 push expr_2
 call error1
 add  sp, 2

;-1019         prs("\n inc  "); 

.expr327:
 push expr_3
 call prs
 add  sp, 2

;-1020         if (wi==2) prs("word"); else prs("byte");

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

;-1021         v(id1); 

.expr329:
 push word [bp-4]
 call v
 add  sp, 2

;-1022         goto e1;

 jmp .e1

;-1023         }


;-1024     if (istoken(T_MINUSMINUS)) {

.expr326:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr330

;-1025         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr331
 push expr_6
 call error1
 add  sp, 2

;-1026         prs("\n dec  "); 

.expr331:
 push expr_7
 call prs
 add  sp, 2

;-1027         if (wi==2) prs("word"); else prs("byte");

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

;-1028         v(id1); 

.expr333:
 push word [bp-4]
 call v
 add  sp, 2

;-1029         goto e1;

 jmp .e1

;-1030         }


;-1031 


;-1032     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

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

;-1033     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

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

;-1034     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

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

;-1035     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

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

;-1036     if (istoken(T_MULASS  )) error1("not implemented");

.expr337:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
 push expr_14
 call error1
 add  sp, 2

;-1037     if (istoken(T_DIVASS  )) error1("not implemented");

.expr338:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push expr_15
 call error1
 add  sp, 2

;-1038 


;-1039     if (istoken('=')) {

.expr339:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr340

;-1040         expr();

 call expr

;-1041         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8

;-1042         goto e1;

 jmp .e1

;-1043         }


;-1044     dovar1(mode, "mov", ixarr, id1);

.expr340:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-1045 


;-1046 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push expr_17
 call rterm
 add  sp, 2

;-1047     else if (istoken('-')) rterm("sub");

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

;-1048     else if (istoken('&')) rterm("and");

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

;-1049     else if (istoken('|')) rterm("or" );

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

;-1050     else if (istoken(T_LESSLESS)) rterm("shl");

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

;-1051     else if (istoken(T_GREATGREAT)) rterm("shr");

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

;-1052     else if (istoken('*')) domul (ids);

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

;-1053     else if (istoken('/')) doidiv(ids);

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

;-1054     else if (istoken('%')) domod (ids);

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

;-1055     if (isrelational()) { 

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

;-1056         rterm("cmp"); 

 push expr_23
 call rterm
 add  sp, 2

;-1057         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2

;-1058         }


;-1059     return 0;

.expr358:
 mov ax, 0
 jmp .retnexpr

;-1060 }


;-1061 


;-1062 int pexpr() {

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

;-1063     expect('('); 

 push 40
 call expect
 add  sp, 2

;-1064     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax

;-1065     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr359

;-1066         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-1067         if (ireg1) { 

 mov ax, [ireg1]
 or  al, al
 je .pexpr360

;-1068             doreg1(1); 

 push 1
 call doreg1
 add  sp, 2

;-1069             return; 

 jmp .retnpexpr

;-1070             }  


;-1071         }

.pexpr360:

;-1072     expr();

.pexpr359:
 call expr

;-1073     if (iscmp==0) prs("\n or  al, al\n je .");  

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr361
 push pexpr_0
 call prs
 add  sp, 2

;-1074     prs(fname);

.pexpr361:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-1075     expect(')');

 push 41
 call expect
 add  sp, 2

;-1076 }


;-1077 


;-1078 


;-1079 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC

;-1080     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2

;-1081     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-1082     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-1083     prc(':');

 push 58
 call prc
 add  sp, 2

;-1084 }


;-1085 int prjump (int n) {
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC

;-1086     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2

;-1087     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-1088     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-1089 }


;-1090 


;-1091 int stmt() {
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC

;-1092     int c; char cha;


;-1093     int jdest; int tst; int jtemp;


;-1094     if(istoken('{')) {
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt362

;-1095         while(istoken('}')==0) stmt();

.stmt363:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt364
 call stmt

;-1096         }

 jmp .stmt363
.stmt364:

;-1097     else if(istoken(T_IF)) {

 jmp .stmt365
.stmt362:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt366

;-1098         pexpr(); 

 call pexpr

;-1099         nlabel++; 

 inc  word[nlabel]

;-1100         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax

;-1101         pint1(jdest); 

 push word [bp-6]
 call pint1
 add  sp, 2

;-1102         stmt();

 call stmt

;-1103         if (istoken(T_ELSE)) { 

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt367

;-1104             nlabel++; 

 inc  word[nlabel]

;-1105             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax

;-1106             prjump(tst); 

 push word [bp-8]
 call prjump
 add  sp, 2

;-1107             prlabel(jdest); 

 push word [bp-6]
 call prlabel
 add  sp, 2

;-1108             stmt(); 

 call stmt

;-1109             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2

;-1110         }


;-1111         else prlabel(jdest);

 jmp .stmt368
.stmt367:
 push word [bp-6]
 call prlabel
 add  sp, 2

;-1112     }

.stmt368:

;-1113     else if(istoken(T_DO)) {

 jmp .stmt369
.stmt366:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370

;-1114         nlabel++; 

 inc  word[nlabel]

;-1115         jdest=nlabel; 

 mov ax, [nlabel]
 mov [bp-6], ax

;-1116         prlabel(jdest); 

 push word [bp-6]
 call prlabel
 add  sp, 2

;-1117         stmt();

 call stmt

;-1118         expect(T_WHILE); 

 push 515
 call expect
 add  sp, 2

;-1119         pexpr(); 

 call pexpr

;-1120         nlabel++; 

 inc  word[nlabel]

;-1121         jtemp=nlabel; 

 mov ax, [nlabel]
 mov [bp-10], ax

;-1122         pint1(jtemp);

 push word [bp-10]
 call pint1
 add  sp, 2

;-1123         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2

;-1124          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2

;-1125     }


;-1126     else if(istoken(T_WHILE)) {

 jmp .stmt371
.stmt370:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372

;-1127         nlabel++; 

 inc  word[nlabel]

;-1128         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax

;-1129         prlabel(jdest); 

 push word [bp-6]
 call prlabel
 add  sp, 2

;-1130         pexpr(); 

 call pexpr

;-1131         nlabel++; 

 inc  word[nlabel]

;-1132         tst=nlabel; 

 mov ax, [nlabel]
 mov [bp-8], ax

;-1133         pint1(tst);

 push word [bp-8]
 call pint1
 add  sp, 2

;-1134         stmt(); 

 call stmt

;-1135         prjump(jdest); 

 push word [bp-6]
 call prjump
 add  sp, 2

;-1136         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2

;-1137     }


;-1138     else if(istoken(T_GOTO))  {

 jmp .stmt373
.stmt372:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt374

;-1139         prs("\n jmp .");

 push stmt_0
 call prs
 add  sp, 2

;-1140         name1();

 call name1

;-1141         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-1142         expect(';');

 push 59
 call expect
 add  sp, 2

;-1143     }


;-1144     else if(token==T_ASM)     {

 jmp .stmt375
.stmt374:
 mov ax, [token]
 cmp ax, 518
 jne .stmt376

;-1145       prs("\n"); 

 push stmt_1
 call prs
 add  sp, 2

;-1146       c=next();

 call next
 mov [bp-2], ax

;-1147       while(c != '\n') { 

.stmt377:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt378

;-1148         prc(c);	

 push word [bp-2]
 call prc
 add  sp, 2

;-1149         c=next(); 

 call next
 mov [bp-2], ax

;-1150         };

 jmp .stmt377
.stmt378:

;-1151         token=getlex();

 call getlex
 mov word [token], ax

;-1152     }


;-1153     else if(istoken(T_ASMBLOCK)) {

 jmp .stmt379
.stmt376:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt380

;-1154         if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt381

;-1155             prs("\n"); cha=next();

 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-1156             while(cha!= '}') {

.stmt382:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt383

;-1157                 prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-1158                 cha=next();

 call next
 mov [bp-4], al

;-1159             }


;-1160             token=getlex();

 jmp .stmt382
.stmt383:
 call getlex
 mov word [token], ax

;-1161         } else error1("Curly open expected");

 jmp .stmt384
.stmt381:
 push stmt_3
 call error1
 add  sp, 2

;-1162     }

.stmt384:

;-1163     else if(istoken(T_EMIT)) {

 jmp .stmt385
.stmt380:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt386

;-1164       prs("\n db ");

 push stmt_4
 call prs
 add  sp, 2

;-1165     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax

;-1166       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2

;-1167       token=getlex();

 call getlex
 mov word [token], ax

;-1168       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt387

;-1169           prc(',');

 push 44
 call prc
 add  sp, 2

;-1170           goto L1;

 jmp .L1

;-1171       }


;-1172       expect(')');

.stmt387:
 push 41
 call expect
 add  sp, 2

;-1173     }


;-1174     else if(istoken(';'))      { }

 jmp .stmt388
.stmt386:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt389

;-1175     else if(istoken(T_RETURN)) {

 jmp .stmt390
.stmt389:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt391

;-1176         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt392
 call expr

;-1177         prs("\n jmp .retn");

.stmt392:
 push stmt_5
 call prs
 add  sp, 2

;-1178         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-1179         nreturn++;

 inc  word[nreturn]

;-1180         expect(';');

 push 59
 call expect
 add  sp, 2

;-1181     }


;-1182     else if(thechar==':')      {

 jmp .stmt393
.stmt391:
 mov al, [thechar]
 cmp al, 58
 jne .stmt394

;-1183         prs("\n."); // Label

 push stmt_6
 call prs
 add  sp, 2

;-1184         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-1185         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-1186         expect(':');

 push 58
 call expect
 add  sp, 2

;-1187     }


;-1188     else  {expr();; expect(';'); }

 jmp .stmt395
.stmt394:
 call expr
 push 59
 call expect
 add  sp, 2

;-1189 }

.stmt395:
.stmt393:
.stmt390:
.stmt388:
.stmt385:
.stmt379:
.stmt375:
.stmt373:
.stmt371:
.stmt369:
.stmt365:

;-1190 


;-1191 int isvariable() {
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

;-1192     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable396
 jmp .v1

;-1193     if(token==T_UNSIGNED) goto v1;

.isvariable396:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable397
 jmp .v1

;-1194     if(token==T_CHAR)     goto v1;

.isvariable397:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable398
 jmp .v1

;-1195     if(token==T_INT)      goto v1;

.isvariable398:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable399
 jmp .v1

;-1196     if(token==T_LONG)     goto v1;

.isvariable399:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable400
 jmp .v1

;-1197     return 0;

.isvariable400:
 mov ax, 0
 jmp .retnisvariable

;-1198 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-1199 }


;-1200 


;-1201 int dofunc() { 

 .retnisvariable:
 ret
ENDP

dofunc: PROC

;-1202     int nloc; int i; unsigned int j;int narg;


;-1203     cloc=&co;
;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax

;-1204     checknamelen();

 call checknamelen

;-1205     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-1206     i=0;

 mov ax, 0
 mov [bp-4], ax

;-1207     while (i < FTop) {

.dofunc401:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc402

;-1208         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax

;-1209         if(eqstr(symbol, j)) error1("Function already defined");

 push word [bp-6]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dofunc403
 push dofunc_0
 call error1
 add  sp, 2

;-1210         i++;

.dofunc403:
 inc  word[bp-4]

;-1211     }


;-1212     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc401
.dofunc402:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc404
 push dofunc_1
 call error1
 add  sp, 2

;-1213     pt=adrF(FNameField, FTop);

.dofunc404:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1214     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1215     FTop++;

 inc  word[FTop]

;-1216     prs("\n\n"); 

 push dofunc_2
 call prs
 add  sp, 2

;-1217     prs(symbol); 

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-1218     prs(": PROC");

 push dofunc_3
 call prs
 add  sp, 2

;-1219     expect('('); 

 push 40
 call expect
 add  sp, 2

;-1220     LTop=LSTART;

 mov ax, 200
 mov word [LTop], ax

;-1221     if (istoken(')')==0) { 

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc405

;-1222         narg=2;

 mov ax, 2
 mov [bp-8], ax

;-1223         do { 

.dofunc406:

;-1224             typeName();  

 call typeName

;-1225             addlocal(); 

 call addlocal

;-1226             narg+=2;

 add  word[bp-8], 2

;-1227             GData[LTop]=narg; 

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-1228             if (iswidth == 4) narg+=2; 

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc407
 add  word[bp-8], 2

;-1229                 LTop++; 

.dofunc407:
 inc  word[LTop]

;-1230                 }


;-1231         while (istoken(','));  

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc408
 jmp .dofunc406
.dofunc408:

;-1232         expect(')'); 

 push 41
 call expect
 add  sp, 2

;-1233         }


;-1234 


;-1235     expect('{'); /*body*/

.dofunc405:
 push 123
 call expect
 add  sp, 2

;-1236     nloc=0; 

 mov ax, 0
 mov [bp-2], ax

;-1237     nreturn=0; 

 mov ax, 0
 mov word [nreturn], ax

;-1238     nconst=0;

 mov ax, 0
 mov word [nconst], ax

;-1239     while(isvariable()) {

.dofunc409:
 call isvariable
 or  al, al
 je .dofunc410

;-1240         do {

.dofunc411:

;-1241             typeName();

 call typeName

;-1242             checknamelen();

 call checknamelen

;-1243             addlocal(); 

 call addlocal

;-1244             nloc-=2;

 sub  word[bp-2], 2

;-1245             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc412
 sub  word[bp-2], 2

;-1246             GData[LTop]=nloc;

.dofunc412:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-1247             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc413

;-1248                 istype='&';

 mov ax, 38
 mov byte [istype], al

;-1249                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al

;-1250                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1251                 expect(']');

 push 93
 call expect
 add  sp, 2

;-1252                 nloc=nloc-lexval; 

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax

;-1253                 nloc+=2; 

 add  word[bp-2], 2

;-1254                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-1255             }


;-1256             LTop++;

.dofunc413:
 inc  word[LTop]

;-1257         } while (istoken(',')); 

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc414
 jmp .dofunc411
.dofunc414:

;-1258         expect(';'); 

 push 59
 call expect
 add  sp, 2

;-1259     }


;-1260     if (LTop>LSTART){

 jmp .dofunc409
.dofunc410:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc415

;-1261         prs(";\n ENTER  ");

 push dofunc_4
 call prs
 add  sp, 2

;-1262         nloc=mkneg(nloc); 

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax

;-1263         prunsign1 (nloc); 

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-1264         prs(",0"); 

 push dofunc_5
 call prs
 add  sp, 2

;-1265         }


;-1266     


;-1267     while(istoken('}')==0)  stmt();

.dofunc415:
.dofunc416:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc417
 call stmt

;-1268   


;-1269     if (nreturn) {

 jmp .dofunc416
.dofunc417:
 mov ax, [nreturn]
 or  al, al
 je .dofunc418

;-1270             prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2

;-1271             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-1272             prc(':');

 push 58
 call prc
 add  sp, 2

;-1273         }


;-1274     if (LTop > LSTART) prs(" LEAVE");

.dofunc418:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc419
 push dofunc_7
 call prs
 add  sp, 2

;-1275     prs("\n ret");

.dofunc419:
 push dofunc_8
 call prs
 add  sp, 2

;-1276     *cloc=0; 

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-1277     prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-1278     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-1279     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc420
 mov ax, [maxco1]
 mov word [maxco], ax

;-1280     prs("\nENDP");

.dofunc420:
 push dofunc_9
 call prs
 add  sp, 2

;-1281 }


;-1282 


;-1283 char doglobName[IDLENMAX];
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

;-1284 int doglob() {


doglob: PROC

;-1285     int i; int j; int isstrarr; 


;-1286     isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-1287     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob421
 push doglob_0
 call error1
 add  sp, 2

;-1288     if (iswidth == 0) error1("no VOID as var type");

.doglob421:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob422
 push doglob_1
 call error1
 add  sp, 2

;-1289     checknamelen();

.doglob422:
 call checknamelen

;-1290     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob423
 push doglob_2
 call error1
 add  sp, 2

;-1291     if (istoken('[')) { 

.doglob423:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob424

;-1292         istype='&';

 mov ax, 38
 mov byte [istype], al

;-1293         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob425

;-1294             prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-1295             prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-1296             prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-1297             if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob426
 push doglob_5
 call prs
 add  sp, 2

;-1298             if (iswidth==2) prs(" resw ");

.doglob426:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob427
 push doglob_6
 call prs
 add  sp, 2

;-1299             if (iswidth==4) prs(" resd ");

.doglob427:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob428
 push doglob_7
 call prs
 add  sp, 2

;-1300             prunsign1(lexval);

.doglob428:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-1301             prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-1302             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-1303             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob429
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-1304             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob429:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob430
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-1305             GData[GTop]=lexval; 

.doglob430:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1306             expect(']');

 push 93
 call expect
 add  sp, 2

;-1307         }else { 

 jmp .doglob431
.doglob425:

;-1308             expect(']');

 push 93
 call expect
 add  sp, 2

;-1309             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob432
 push doglob_9
 call error1
 add  sp, 2

;-1310             prs("\n"); 

.doglob432:
 push doglob_10
 call prs
 add  sp, 2

;-1311             prs(symbol); 

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-1312             prs(" db ");

 push doglob_11
 call prs
 add  sp, 2

;-1313             isstrarr=1; 

 mov ax, 1
 mov [bp-6], ax

;-1314             strcpy(doglobName, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-1315             expect('=');

 push 61
 call expect
 add  sp, 2

;-1316             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob433

;-1317                 prc(34); 

 push 34
 call prc
 add  sp, 2

;-1318                 prscomment(symbol); 

 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2

;-1319                 prc(34); 

 push 34
 call prc
 add  sp, 2

;-1320                 prs(",0");

 push doglob_12
 call prs
 add  sp, 2

;-1321                 i=strlen(symbol); 

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1322                 GData[GTop]=i; 

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1323                 }


;-1324             else if (istoken('{' )) { 

 jmp .doglob434
.doglob433:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob435

;-1325                 i=0;

 mov ax, 0
 mov [bp-2], ax

;-1326                 do { 

.doglob436:

;-1327                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob437
 push 44
 call prc
 add  sp, 2

;-1328                     expect(T_CONST); 

.doglob437:
 push 257
 call expect
 add  sp, 2

;-1329                     prunsign1(lexval); 

 push word [lexval]
 call prunsign1
 add  sp, 2

;-1330                     i=1; 

 mov ax, 1
 mov [bp-2], ax

;-1331                     }


;-1332                     while (istoken(',')); 

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob438
 jmp .doglob436
.doglob438:

;-1333                 expect('}');

 push 125
 call expect
 add  sp, 2

;-1334             }


;-1335         else error1("String or number array expected");

 jmp .doglob439
.doglob435:
 push doglob_13
 call error1
 add  sp, 2

;-1336         };

.doglob439:
.doglob434:
.doglob431:

;-1337     }else { //expect('=');

 jmp .doglob440
.doglob424:

;-1338         prs("\n"); 

 push doglob_14
 call prs
 add  sp, 2

;-1339         prs(symbol); 

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-1340         if (istype=='*') prs(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob441
 push doglob_15
 call prs
 add  sp, 2

;-1341         else {

 jmp .doglob442
.doglob441:

;-1342             if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob443
 push doglob_16
 call prs
 add  sp, 2

;-1343             else if (iswidth==2) prs(" dw ");

 jmp .doglob444
.doglob443:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob445
 push doglob_17
 call prs
 add  sp, 2

;-1344             else                 prs(" dd ");

 jmp .doglob446
.doglob445:
 push doglob_18
 call prs
 add  sp, 2

;-1345         }

.doglob446:
.doglob444:

;-1346     if(istoken('-')) prc('-');

.doglob442:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob447
 push 45
 call prc
 add  sp, 2

;-1347     if (istoken('=')) {

.doglob447:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob448

;-1348         expect(T_CONST); 

 push 257
 call expect
 add  sp, 2

;-1349         prunsign1(lexval); 

 push word [lexval]
 call prunsign1
 add  sp, 2

;-1350         }else prunsign1(0); 

 jmp .doglob449
.doglob448:
 push 0
 call prunsign1
 add  sp, 2

;-1351     }

.doglob449:

;-1352     GSign[GTop]=issign; 

.doglob440:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al

;-1353     GWidth[GTop]=iswidth; 

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1354     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-1355     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1356     if (isstrarr) strcpy(pt, doglobName); 

 mov ax, [bp-6]
 or  al, al
 je .doglob450
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1357         else strcpy(pt, symbol);

 jmp .doglob451
.doglob450:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1358     GTop++; 

.doglob451:
 inc  word[GTop]

;-1359     expect(';'); 

 push 59
 call expect
 add  sp, 2

;-1360 }


;-1361 


;-1362 int dodefine() {
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

;-1363     int i; int j; int fdtemp;


;-1364     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine452

;-1365         token=getlex();

 call getlex
 mov word [token], ax

;-1366         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1367         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1368         return;

 jmp .retndodefine

;-1369     }


;-1370     expect(T_NAME);

.dodefine452:
 push 256
 call expect
 add  sp, 2

;-1371     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine453

;-1372         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine454
 push dodefine_1
 call error1
 add  sp, 2

;-1373         i=strlen(symbol);

.dodefine454:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1374         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine455
 push dodefine_2
 call error1
 add  sp, 2

;-1375         GSign [GTop]='U';

.dodefine455:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1376         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1377         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1378         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-1379         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1380         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1381         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1382         GTop++;

 inc  word[GTop]

;-1383     }


;-1384 }

.dodefine453:

;-1385 


;-1386 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1387     token=getlex();

 call getlex
 mov word [token], ax

;-1388     do {

.parse456:

;-1389         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse457
 mov ax, 1
 jmp .retnparse

;-1390         if (istoken('#')) {

.parse457:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse458

;-1391              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse459
 call dodefine

;-1392              else error1("define expected");

 jmp .parse460
.parse459:
 push parse_0
 call error1
 add  sp, 2

;-1393         }

.parse460:

;-1394     else{

 jmp .parse461
.parse458:

;-1395         typeName();

 call typeName

;-1396         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse462
 call dofunc

;-1397         else doglob(); }

 jmp .parse463
.parse462:
 call doglob
.parse463:

;-1398     } while(1);

.parse461:
 mov ax, 1
 or  al, al
 je .parse464
 jmp .parse456
.parse464:

;-1399 }


;-1400 


;-1401 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130

;-1402 int main() {


main: PROC

;-1403     int arglen1; unsigned int i; char *c;


;-1404     isPrint=1;
;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al

;-1405     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1406     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main465

;-1407         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1408         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2

;-1409         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1410         }


;-1411     i=arglen1+129;

.main465:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1412     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1413     arglen1--;

 dec  word[bp-2]

;-1414     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1415     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1416     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main466
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-1417     strcpy(namelst, namein);

.main466:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1418     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1419     i--;

 dec  word[bp-4]

;-1420     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1421     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1422 


;-1423     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1424     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main467

;-1425         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2

;-1426         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1427         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1428         }


;-1429     fdout=creatR(namelst);

.main467:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1430     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main468

;-1431         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2

;-1432         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1433         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1434         }


;-1435     prs("\n;");

.main468:
 push main_4
 call prs
 add  sp, 2

;-1436     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1437     prs(", Input: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1438     prs(", Output: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1439     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al

;-1440     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2

;-1441     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1442     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1443     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1444     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1445     parse(); 

 call parse

;-1446     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al

;-1447     prs("\n;Glob. variables:"); GTop--; prunsign1(GTop);

 push main_8
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call prunsign1
 add  sp, 2

;-1448     prs(" ("); prunsign1(LSTART);

 push main_9
 call prs
 add  sp, 2
 push 200
 call prunsign1
 add  sp, 2

;-1449     prs("), Functions:"); prunsign1(FTop);

 push main_10
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2

;-1450     prs(" ("); prunsign1(FUNCMAX);

 push main_11
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2

;-1451     prs("), Lines:"); prunsign1(lineno);

 push main_12
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-1452     prs("\n;Constant: ");   prunsign1(maxco);

 push main_13
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2

;-1453     prs(" ("); prunsign1(COMAX);

 push main_14
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2

;-1454     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax

;-1455     if (i <= 1000)prs("\n *** Warning *** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main469
 push main_15
 call prs
 add  sp, 2

;-1456     prs("), stacksize: ");

.main469:
 push main_16
 call prs
 add  sp, 2

;-1457     i=65636; i=i-orgData;

 mov ax, 100
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax

;-1458     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2

;-1459     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main470
 push main_17
 call prs
 add  sp, 2

;-1460 //    prs("\n;");


;-1461     end1(0);

.main470:
 push 0
 call end1
 add  sp, 2

;-1462 }
 LEAVE
 ret
main_0 db " Usage: A.COM in_file[.C]: ",0
main_1 db ".C",0
main_2 db "Source file missing (.C): ",0
main_3 db "list file not creatable: ",0
main_4 db "\n;",0
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
;Glob. variables:100 (200), Functions:71 (300), Lines:1463
;Constant: 688 (3000), stacksize: 23822