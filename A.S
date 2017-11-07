
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

;-54 char globC=0;

globC db 0

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

;-60 int nlabel=0;

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

;-66 #define VARMAX        300//max global and local var


;-67 #define LSTART        200//max global var


;-68 #define GNAMEMAX     4800// 16*VARMAX


;-69 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 28396
GType resb 300
section .text

;-70 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 28696
GSign resb 300
section .text

;-71 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 28996
GWidth resb 300
section .text

;-72 int GAdr  [VARMAX];

section .bss
absolute 29296
GAdr resw 300
section .text

;-73 int GUsed [VARMAX];

section .bss
absolute 29896
GUsed resw 300
section .text

;-74 int GData [VARMAX];

section .bss
absolute 30496
GData resw 300
section .text

;-75 char GNameField[GNAMEMAX];

section .bss
absolute 31096
GNameField resb 4800
section .text

;-76 int GTop=1;

GTop dw 1

;-77 int LTop=LSTART;

LTop dw 200

;-78 #define FUNCMAX       300//max functions


;-79 #define FNAMEMAX     4800// 16*FUNCMAX


;-80 char FType [FUNCMAX];

section .bss
absolute 35896
FType resb 300
section .text

;-81 int  FAdr  [FUNCMAX];

section .bss
absolute 36196
FAdr resw 300
section .text

;-82 int  FCalls[FUNCMAX];

section .bss
absolute 36796
FCalls resw 300
section .text

;-83 char FNameField[FNAMEMAX];

section .bss
absolute 37396
FNameField resb 4800
section .text

;-84 int  FTop=0;

FTop dw 0

;-85 #define CALLMAX      1500//max call


;-86 char CType[CALLMAX]; //0=unresolved,  1=resolved

section .bss
absolute 42196
CType resb 1500
section .text

;-87 int  CAdr [CALLMAX]; //start of nameof address in CNameField

section .bss
absolute 43696
CAdr resw 1500
section .text

;-88 #define CNAMEMAX    10000//space for call names


;-89 char CNameField[10016];//CNAMEMAX+IDLENMAX+1

section .bss
absolute 46696
CNameField resb 10016
section .text

;-90 char *CNamePtr;     //first free position in CNameField

CNamePtr dw 0

;-91 unsigned char *CNameTop=0;

CNameTop dw 0

;-92 int  CTop=0;

CTop dw 0

;-93 


;-94 char fgetsdest[COLUMNMAX];

section .bss
absolute 56712
fgetsdest resb 128
section .text

;-95 unsigned char *fgetsp=0;

fgetsp dw 0

;-96 unsigned int lineno=1;

lineno dw 1

;-97 unsigned char *pt=0;

pt dw 0

;-98 unsigned char *p1=0;

p1 dw 0

;-99 int DOS_ERR=0;

DOS_ERR dw 0

;-100 int DOS_NoBytes=0;

DOS_NoBytes dw 0

;-101 char DOS_ByteRead=0;

DOS_ByteRead db 0

;-102 int ireg1;

ireg1 dw 0

;-103 int mod2;

mod2 dw 0

;-104 int ireg2;

ireg2 dw 0

;-105 


;-106 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-107 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }

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

;-108 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
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

;-109 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-110 


;-111 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-112     __emit__(0xCD,0x21);//inth 0x21;

 db 205,33

;-113     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-114     DOS_ERR++;

 inc  word[DOS_ERR]

;-115 }


;-116 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-117 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-118 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-119 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-120 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-121     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-122 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC;
 ENTER  0,0
lea dx, [bp+4]

;-123   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-124 


;-125   int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-126       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-127       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-128       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-129       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-130       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-131       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-132       if (c> 'Z') { if (c< 'a') return 0; }

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

;-133       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-134   }


;-135   int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-136       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-137       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-138       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-139   }


;-140   int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-141     if (digit (c)) return 1;
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

;-142     if (letter(c)) return 1;

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

;-143     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-144   }


;-145 


;-146 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-147     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-148     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-149     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-150 }


;-151 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-152     do { *s=*t; s++; t++; }
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

;-153     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-154     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-155     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-156 }


;-157 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-158     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-159         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-160         p++;

.eqstr22:
 inc  word[bp+4]

;-161         q++;

 inc  word[bp+6]

;-162     }


;-163     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-164     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-165 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-166     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-167     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-168 }


;-169 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-170     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-171         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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

;-172         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-173     }


;-174 }

 jmp .toupper26
.toupper27:

;-175 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-176     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-177         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-178         s++;

.instr132:
 inc  word[bp+4]

;-179     }


;-180     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-181 }


;-182 


;-183 int eprc(char c)  {

 .retninstr1: LEAVE
 ret
ENDP

eprc: PROC

;-184     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al

;-185     cloc++;

 inc  word[cloc]

;-186 }


;-187 int eprs(char *s) {
 LEAVE
 ret
ENDP

eprs: PROC

;-188     char c;


;-189     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34

;-190         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-191         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2

;-192         s++;

 inc  word[bp+4]

;-193     }


;-194 }

 jmp .eprs33
.eprs34:

;-195 int prc(unsigned char c) {
 LEAVE
 ret
ENDP

prc: PROC

;-196     if (c==10) {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .prc35

;-197         _AX=13;

 mov  ax, 13

;-198         writetty();

 call writetty

;-199     }


;-200     _AL=c;

.prc35:
 mov  al, [bp+4]

;-201     writetty();

 call writetty

;-202     fputcR(c, fdout);

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-203 }


;-204 int prscomment(unsigned char *s) {
 LEAVE
 ret
ENDP

prscomment: PROC

;-205     unsigned char c;


;-206     while(*s){
;
 ENTER  2,0
.prscomment36:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment37

;-207         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-208         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-209         s++;

 inc  word[bp+4]

;-210     }


;-211 }

 jmp .prscomment36
.prscomment37:

;-212 int prs(unsigned char *s) {
 LEAVE
 ret
ENDP

prs: PROC

;-213     unsigned char c; int com;


;-214     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-215     while(*s) {

.prs38:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs39

;-216         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-217         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs40
 mov ax, [bp-4]
 or  al, al
 je .prs41
 mov ax, 0
 mov [bp-4], ax

;-218                    else com=1;

 jmp .prs42
.prs41:
 mov ax, 1
 mov [bp-4], ax

;-219         if (c==92) {

.prs42:
.prs40:
 mov al, [bp-2]
 cmp al, 92
 jne .prs43

;-220             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs44

;-221                 s++;

 inc  word[bp+4]

;-222                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-223                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs45
 mov ax, 10
 mov [bp-2], al

;-224                 if (c=='t') c= 9;

.prs45:
 mov al, [bp-2]
 cmp al, 116
 jne .prs46
 mov ax, 9
 mov [bp-2], al

;-225             }

.prs46:

;-226         }

.prs44:

;-227         prc(c);

.prs43:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-228         s++;

 inc  word[bp+4]

;-229     }


;-230 }

 jmp .prs38
.prs39:

;-231 int prnl() {
 LEAVE
 ret
ENDP

prnl: PROC

;-232     prs("\n ");

 push prnl_0
 call prs
 add  sp, 2

;-233 }


;-234 


;-235 


;-236 int eprnum(int n){//for docall1 procedure

 ret
prnl_0 db "\n ",0
ENDP

eprnum: PROC

;-237     int e;


;-238     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum47

;-239         eprc('-');

 push 45
 call eprc
 add  sp, 2

;-240         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-241     }


;-242     if (n >= 10) {

.eprnum47:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum48

;-243         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-244         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2

;-245     }


;-246     n=n%10;

.eprnum48:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-247     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax

;-248     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2

;-249 }


;-250 int pint1 (int n){
 LEAVE
 ret
ENDP

pint1: PROC

;-251     int e;


;-252     if(n<0) {  prc('-');  n=mkneg(n); }
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

;-253     if (n >= 10) {

.pint149:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint150

;-254         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax

;-255         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2

;-256     }


;-257     n=n%10;

.pint150:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax

;-258     n += '0';

 add  word[bp+4], 48

;-259     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-260 }


;-261 int prunsign1(unsigned int n) {
 LEAVE
 ret
ENDP

prunsign1: PROC

;-262     unsigned int e;


;-263     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign151

;-264         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax

;-265         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2

;-266     }


;-267     n = n % 10; /*unsigned mod*/

.prunsign151:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax

;-268     n += '0';

 add  word[bp+4], 48

;-269     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2

;-270 }


;-271 int printint51(unsigned int j)  {
 LEAVE
 ret
ENDP

printint51: PROC

;-272     if (j<10000) prc(32);
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge .printint5152
 push 32
 call prc
 add  sp, 2

;-273     if (j<1000) prc(32);

.printint5152:
 mov ax, [bp+4]
 cmp ax, 1000
 jge .printint5153
 push 32
 call prc
 add  sp, 2

;-274     if (j<100) prc(32);

.printint5153:
 mov ax, [bp+4]
 cmp ax, 100
 jge .printint5154
 push 32
 call prc
 add  sp, 2

;-275     if (j<10) prc(32);

.printint5154:
 mov ax, [bp+4]
 cmp ax, 10
 jge .printint5155
 push 32
 call prc
 add  sp, 2

;-276     prunsign1(j);

.printint5155:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-277 }


;-278 


;-279 int end1(int n) {
 LEAVE
 ret
ENDP

end1: PROC

;-280     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-281     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-282     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-283 }


;-284 


;-285 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-286     lineno--;
;
 ENTER  0,0
 dec  word[lineno]

;-287     prnl();

 call prnl

;-288     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-289     prs(";Line: ");

 push error1_0
 call prs
 add  sp, 2

;-290     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-291     prs(" ************** ERROR: ");

 push error1_1
 call prs
 add  sp, 2

;-292     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-293     prs("  in column: ");

 push error1_2
 call prs
 add  sp, 2

;-294     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-295     prs("\nToken: ");

 push error1_3
 call prs
 add  sp, 2

;-296     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-297     prs(", symbol: ");

 push error1_4
 call prs
 add  sp, 2

;-298     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-299     end1(1);

 push 1
 call end1
 add  sp, 2

;-300 }


;-301 


;-302 int printinputline() {
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP

printinputline: PROC

;-303     int col;


;-304     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-305     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-306     do {

.printinputline56:

;-307         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-308         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline57
 jmp .retnprintinputline

;-309         *fgetsp=DOS_ByteRead;

.printinputline57:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-310         fgetsp++;

 inc  word[fgetsp]

;-311         col++;

 inc  word[bp-2]

;-312         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline58
 push printinputline_0
 call error1
 add  sp, 2

;-313         }

.printinputline58:

;-314         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline59
 jmp .printinputline56
.printinputline59:

;-315     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-316     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline60

;-317         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-318         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-319         prc(' ');

 push 32
 call prc
 add  sp, 2

;-320         lineno++;

 inc  word[lineno]

;-321         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-322         }


;-323 }

.printinputline60:

;-324 int fgets1() {

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

fgets1: PROC

;-325     char c;


;-326     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-327     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets161

;-328         printinputline();

 call printinputline

;-329         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets162
 mov ax, 0
 jmp .retnfgets1

;-330         fgetsp=&fgetsdest;

.fgets162:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-331         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-332         column=0;

 mov ax, 0
 mov word [column], ax

;-333     }


;-334     fgetsp++;

.fgets161:
 inc  word[fgetsp]

;-335     column++;

 inc  word[column]

;-336     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-337 }


;-338 int next() {

 .retnfgets1: LEAVE
 ret
ENDP

next: PROC

;-339     char r;


;-340     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-341     globC=r;

 mov al, [bp-2]
 mov byte [globC], al

;-342     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-343     return r;

 mov al, [bp-2]
 jmp .retnnext

;-344 }


;-345 


;-346 int getdigit(char c) { int i;

 .retnnext: LEAVE
 ret
ENDP

getdigit: PROC

;-347     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-348     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

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

;-349       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

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

;-350 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

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

;-351      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-352     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

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

;-353      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit70
.getdigit71:

;-354 }

.getdigit69:

;-355 int getstring(int delim) {
 LEAVE
 ret
ENDP

getstring: PROC

;-356     int c; char *p;


;-357     p=&symbol;
;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax

;-358     c=next();

 call next
 mov [bp-2], ax

;-359     while (c != delim) {

.getstring72:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring73

;-360         *p=c;

 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-361         p++;

 inc  word[bp-4]

;-362         c=next();

 call next
 mov [bp-2], ax

;-363     }


;-364     *p=0;

 jmp .getstring72
.getstring73:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-365 }


;-366 


;-367 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
ENDP

adrF: PROC;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-368   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-369 


;-370 int adrofname(unsigned int i) { adrF(GNameField, i); }
 LEAVE
 ret
ENDP

adrofname: PROC;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-371 


;-372 int printName(unsigned int i) {int j;
 LEAVE
 ret
ENDP

printName: PROC

;-373   if (i < LSTART) { i=adrofname(i); prs(i); }
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName74
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-374   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp .printName75
.printName74:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle .printName76
 push 43
 call prc
 add  sp, 2
.printName76:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-375 }

.printName75:

;-376 int convertdefine() { int i; int j;   i=0;
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

convertdefine: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-377   while (i < GTop) {

.convertdefine77:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine78

;-378    j=adrofname(i);

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-379    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

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

;-380    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine80:

;-381    i++; }

.convertdefine79:
 inc  word[bp-2]

;-382    return 0; }

 jmp .convertdefine77
.convertdefine78:
 mov ax, 0
 jmp .retnconvertdefine

;-383 


;-384 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 .retnconvertdefine: LEAVE
 ret
ENDP

ifEOL: PROC

;-385     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL81
 mov ax, 1
 jmp .retnifEOL

;-386     if (c == 13) {//CR

.ifEOL81:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL82

;-387         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL83
 call next
 mov [bp+4], al

;-388         return 1;

.ifEOL83:
 mov ax, 1
 jmp .retnifEOL

;-389     }


;-390     return 0;

.ifEOL82:
 mov ax, 0
 jmp .retnifEOL

;-391 }


;-392 


;-393 char symboltemp[80];

 .retnifEOL: LEAVE
 ret
ENDP
section .bss
absolute 56840
symboltemp resb 80
section .text

;-394 int getlex() { char c; char *p;


getlex: PROC

;-395 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
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

;-396   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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

;-397   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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

;-398   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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

;-399   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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

;-400   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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

;-401   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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

;-402   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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

;-403   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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

;-404   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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

;-405   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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

;-406   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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

;-407   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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

;-408   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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

;-409   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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

;-410   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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

;-411   if (c == '/') { if (thechar == '/') {

.getlex114:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex115
 mov al, [thechar]
 cmp al, 47
 jne .getlex116

;-412       do c=next(); while(ifEOL(c)==0) return getlex(); } }

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

;-413   if (c == '/') { if (thechar == '*') {

.getlex115:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex119
 mov al, [thechar]
 cmp al, 42
 jne .getlex120

;-414       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

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

;-415       c=next(); return getlex(); } else  return '/'; }

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

;-416   if (c == '"') {getstring(c); return T_STRING;}

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

;-417   if (digit(c)) { getdigit(c); return T_CONST; }

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

;-418   if (c==39) { lexval=next();

.getlex125:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex126
 call next
 mov word [lexval], ax

;-419     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex127
 call next
 mov word [lexval], ax

;-420       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

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

;-421       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

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

;-422   if (alnum(c)) {

.getlex126:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex131

;-423     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-424     while(alnum(thechar)) {c=next(); *p=c;  p++; }

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

;-425       *p=0;

 jmp .getlex132
.getlex133:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-426     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 531
 jmp .retngetlex

;-427     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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

;-428     if (eqstr(symbol,"void"    )) return T_VOID;

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

;-429     if (eqstr(symbol,"int"     )) return T_INT;

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

;-430     if (eqstr(symbol,"long"    )) return T_LONG;

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

;-431     if (eqstr(symbol,"char"    )) return T_CHAR;

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

;-432     if (eqstr(symbol,"asm"     )) return T_ASM;

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

;-433     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

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

;-434     if (eqstr(symbol,"__emit__")) return T_EMIT;

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

;-435     if (eqstr(symbol,"return"  )) return T_RETURN;

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

;-436     if (eqstr(symbol,"if"      )) return T_IF;

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

;-437     if (eqstr(symbol,"else"    )) return T_ELSE;

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

;-438     if (eqstr(symbol,"while"   )) return T_WHILE;

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

;-439     if (eqstr(symbol,"do"      )) return T_DO;

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

;-440     if (eqstr(symbol,"goto"    )) return T_GOTO;

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

;-441     if (eqstr(symbol,"define"  )) return T_DEFINE;

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

;-442     if (convertdefine() ) {

.getlex149:
 call convertdefine
 or  al, al
 je .getlex150

;-443         strcpy(symbol, symboltemp); return T_CONST;

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-444     }


;-445     return T_NAME; } error1("Input item not recognized");

.getlex150:
 mov ax, 256
 jmp .retngetlex
.getlex131:
 push getlex_17
 call error1
 add  sp, 2

;-446 }


;-447 


;-448 int istoken(int t) {

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

;-449     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken151

;-450         token=getlex();

 call getlex
 mov word [token], ax

;-451         return 1;

 mov ax, 1
 jmp .retnistoken

;-452     }


;-453     return 0;

.istoken151:
 mov ax, 0
 jmp .retnistoken

;-454 }


;-455 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-456     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect152

;-457         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-458         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-459         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-460         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-461         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-462     }


;-463 }

.expect152:

;-464 


;-465 


;-466 int a(unsigned int i) { printName(i);//address
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

;-467 }


;-468 int v(unsigned int i) {//value
 LEAVE
 ret
ENDP

v: PROC

;-469     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v153
 push 91
 call prc
 add  sp, 2

;-470     printName(i);

.v153:
 push word [bp+4]
 call printName
 add  sp, 2

;-471     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v154
 push 93
 call prc
 add  sp, 2

;-472 }

.v154:

;-473 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-474     int i;


;-475     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-476     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen155
 push checknamelen_0
 call error1
 add  sp, 2

;-477 }

.checknamelen155:

;-478 


;-479 int checkName() { unsigned int i; unsigned int j;
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

checkName: PROC

;-480   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
.checkName156:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName157
 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax
 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName158
 mov ax, [bp-2]
 jmp .retncheckName
.checkName158:
 inc  word[bp-2]

;-481   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp .checkName156
.checkName157:
 mov ax, 1
 mov [bp-2], ax
.checkName159:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName160
 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax
 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName161
 mov ax, [bp-2]
 jmp .retncheckName
.checkName161:
 inc  word[bp-2]

;-482   return 0;

 jmp .checkName159
.checkName160:
 mov ax, 0
 jmp .retncheckName

;-483 }


;-484 int searchname() { unsigned int i;

 .retncheckName: LEAVE
 ret
ENDP

searchname: PROC

;-485   i=checkName(); if (i == 0) error1("Variable unknown");
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

;-486   GUsed[i]=GUsed[i] + 1; return i;

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

;-487 }


;-488 int name1() {

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC

;-489     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1163
 push name1_0
 call error1
 add  sp, 2

;-490     token=getlex();

.name1163:
 call getlex
 mov word [token], ax

;-491 }


;-492 int typeName() { int m; //0=V,1=*,2=&

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC

;-493     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-494     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 83
 mov byte [issign], al

;-495     if(istoken(T_UNSIGNED)) issign='U';

.typeName164:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 85
 mov byte [issign], al

;-496     iswidth=2;

.typeName165:
 mov ax, 2
 mov byte [iswidth], al

;-497     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName166
 mov ax, 0
 mov byte [iswidth], al

;-498     if(istoken(T_CHAR))     iswidth=1;

.typeName166:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName167
 mov ax, 1
 mov byte [iswidth], al

;-499     if(istoken(T_INT))      iswidth=2;

.typeName167:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName168
 mov ax, 2
 mov byte [iswidth], al

;-500     if(istoken(T_LONG))     iswidth=4;

.typeName168:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName169
 mov ax, 4
 mov byte [iswidth], al

;-501     istype='V';

.typeName169:
 mov ax, 86
 mov byte [istype], al

;-502     m=0;

 mov ax, 0
 mov [bp-2], ax

;-503     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName170
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-504     if(istoken('&'))  {istype='&'; m=2;}

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

;-505     name1();

.typeName171:
 call name1

;-506     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-507 }


;-508 int gettypes(int i) {int j; char c;

 .retntypeName: LEAVE
 ret
ENDP

gettypes: PROC

;-509   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
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

;-510   c=GWidth[i]; widthi=0;wi=0;

.gettypes173:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-511   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes174
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-512   if (c==2) {widthi=2;wi=2;}

.gettypes174:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes175
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-513   if (c==4) {widthi=4;wi=4;}

.gettypes175:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes176
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-514   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

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

;-515   if (c=='&')  typei=2;

.gettypes177:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes178
 mov ax, 2
 mov word [typei], ax

;-516   return i; }

.gettypes178:
 mov ax, [bp+4]
 jmp .retngettypes

;-517 


;-518 int storeCall1() {//todo

 .retngettypes: LEAVE
 ret
ENDP

storeCall1: PROC

;-519     unsigned int i;


;-520     CTop++;
;
 ENTER  2,0
 inc  word[CTop]

;-521     if (CTop >= CALLMAX) error1("too many calls");

 mov ax, [CTop]
 cmp ax, 1500 ;unsigned : 1
 jl  .storeCall1179
 push storeCall1_0
 call error1
 add  sp, 2

;-522     i = CNamePtr - &CNameField;

.storeCall1179:
 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-523     if (i >= CNAMEMAX) error1("too many call names");

 mov ax, [bp-2]
 cmp ax, 10000 ;unsigned : 0
 jb  .storeCall1180
 push storeCall1_1
 call error1
 add  sp, 2

;-524     CType[CTop]=0;

.storeCall1180:
 mov ax, 0
 mov bx, [CTop]
 mov [CType+bx], al

;-525     CAdr [CTop]=CNamePtr;

 mov ax, [CNamePtr]
 mov bx, [CTop]
 shl bx, 1
 mov [CAdr+bx], ax

;-526     CNamePtr=strcpy(CNamePtr, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNamePtr]
 call strcpy
 add  sp, 4
 mov word [CNamePtr], ax

;-527     CNamePtr++;

 inc  word[CNamePtr]

;-528 }


;-529 


;-530 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storeCall1_0 db "too many calls",0
storeCall1_1 db "too many call names",0
ENDP

storefunc: PROC
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc181
 push storefunc_0
 call error1
 add  sp, 2

;-531     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc181:
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

;-532     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-533 }


;-534 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal182
 push addlocal_0
 call error1
 add  sp, 2

;-535   if (checkName() != 0) error1("Variable already defined");

.addlocal182:
 call checkName
 cmp ax, 0
 je  .addlocal183
 push addlocal_1
 call error1
 add  sp, 2

;-536   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal183:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-537   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-538   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-539 }


;-540 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-541   while (i < FTop) {

.checkFunction184:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction185

;-542     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

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
 je .checkFunction186
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction186:
 inc  word[bp-2]

;-543   return 0; }

 jmp .checkFunction184
.checkFunction185:
 mov ax, 0
 jmp .retncheckFunction

;-544 


;-545 int isvariable() {

 .retncheckFunction: LEAVE
 ret
ENDP

isvariable: PROC

;-546     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable187
 jmp .v1

;-547     if(token==T_UNSIGNED) goto v1;

.isvariable187:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable188
 jmp .v1

;-548     if(token==T_CHAR)     goto v1;

.isvariable188:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable189
 jmp .v1

;-549     if(token==T_INT)      goto v1;

.isvariable189:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable190
 jmp .v1

;-550     if(token==T_LONG)     goto v1;

.isvariable190:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable191
 jmp .v1

;-551     return 0;

.isvariable191:
 mov ax, 0
 jmp .retnisvariable

;-552 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-553 }


;-554 


;-555 int cmpneg(int ids) {

 .retnisvariable:
 ret
ENDP

cmpneg: PROC

;-556        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg192
 push cmpneg_0
 call prs
 add  sp, 2

;-557   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg193
.cmpneg192:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg194
 push cmpneg_1
 call prs
 add  sp, 2

;-558   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg195
.cmpneg194:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg196
 mov ax, [bp+4]
 or  al, al
 je .cmpneg197
 push cmpneg_2
 call prs
 add  sp, 2

;-559                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg198
.cmpneg197:
 push cmpneg_3
 call prs
 add  sp, 2

;-560   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg198:
 jmp .cmpneg199
.cmpneg196:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg200
 mov ax, [bp+4]
 or  al, al
 je .cmpneg201
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-561                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-562                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg202
.cmpneg201:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-563                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-564   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg202:
 jmp .cmpneg203
.cmpneg200:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg204
 push cmpneg_8
 call prs
 add  sp, 2

;-565   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg205
.cmpneg204:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg206
 push cmpneg_9
 call prs
 add  sp, 2

;-566   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg207
.cmpneg206:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg207:
.cmpneg205:
.cmpneg203:
.cmpneg199:
.cmpneg195:
.cmpneg193:

;-567 


;-568   int isrelational() {
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

;-569     if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational208
 jmp .w
.isrelational208:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational209
 jmp .w

;-570     if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational209:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational210
 jmp .w
.isrelational210:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational211
 jmp .w

;-571     if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational211:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational212
 jmp .w
.isrelational212:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational213
 jmp .w

;-572     return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational213:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-573 


;-574 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC

;-575   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg214
 mov ax, 0
 jmp .retncheckreg

;-576   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg214:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 1
 jmp .retncheckreg
.checkreg215:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 3
 jmp .retncheckreg

;-577   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg216:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 5
 jmp .retncheckreg
.checkreg217:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 7
 jmp .retncheckreg

;-578   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg218:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 9
 jmp .retncheckreg
.checkreg219:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 11
 jmp .retncheckreg

;-579   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg220:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 13
 jmp .retncheckreg
.checkreg221:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 15
 jmp .retncheckreg

;-580   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg222:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 17
 jmp .retncheckreg
.checkreg223:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 19
 jmp .retncheckreg

;-581   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg224:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 21
 jmp .retncheckreg
.checkreg225:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 23
 jmp .retncheckreg

;-582   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg226:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 25
 jmp .retncheckreg
.checkreg227:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 27
 jmp .retncheckreg

;-583   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg228:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg229
 mov ax, 29
 jmp .retncheckreg
.checkreg229:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg230
 mov ax, 31
 jmp .retncheckreg

;-584   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg230:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg231
 mov ax, 33
 jmp .retncheckreg
.checkreg231:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg232
 mov ax, 35
 jmp .retncheckreg

;-585   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg232:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg233
 mov ax, 37
 jmp .retncheckreg
.checkreg233:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg234
 mov ax, 39
 jmp .retncheckreg

;-586   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg234:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg235
 mov ax, 41
 jmp .retncheckreg
.checkreg235:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg236
 mov ax, 43
 jmp .retncheckreg

;-587   // (eqstr(symbol,"ip")) return 45;


;-588   if (strlen(symbol) >   3) return 0;

.checkreg236:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg237
 mov ax, 0
 jmp .retncheckreg

;-589   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg237:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg238
 mov ax, 47
 jmp .retncheckreg
.checkreg238:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg239
 mov ax, 50
 jmp .retncheckreg

;-590   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg239:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg240
 mov ax, 53
 jmp .retncheckreg
.checkreg240:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg241
 mov ax, 56
 jmp .retncheckreg

;-591   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg241:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg242
 mov ax, 59
 jmp .retncheckreg
.checkreg242:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg243
 mov ax, 62
 jmp .retncheckreg

;-592   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg243:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg244
 mov ax, 65
 jmp .retncheckreg
.checkreg244:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg245
 mov ax, 68
 jmp .retncheckreg

;-593   if (eqstr(symbol,"cr0")) return 71;

.checkreg245:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg246
 mov ax, 71
 jmp .retncheckreg

;-594   return 0;   }

.checkreg246:
 mov ax, 0
 jmp .retncheckreg

;-595 


;-596 char printregstr[]

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

;-597 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-598 


;-599 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-600   k = &printregstr + i; c=*k; prc(c); i++;
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

;-601   k = &printregstr + i; c=*k; prc(c);

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

;-602   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg247
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

;-603 }

.printreg247:

;-604 


;-605 int constantexpr() { int mode; int id1;int ids;
 LEAVE
 ret
ENDP

constantexpr: PROC

;-606   token=getlex();   mode=typeName();
;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-607   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-608   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr248
 push constantexpr_0
 call error1
 add  sp, 2

;-609   expect(T_CONST);  prs(" ; constant expression");

.constantexpr248:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-610   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-611   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr249
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr250
.constantexpr249:
 push constantexpr_4
 call prs
 add  sp, 2

;-612   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr250:
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

;-613   expect(')');

 push 41
 call expect
 add  sp, 2

;-614 }


;-615 


;-616 char ops[5];
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
absolute 56920
ops resb 5
section .text

;-617 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-618   if (istoken('='))          strcpy(ops, "mov");
;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1251
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-619   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1251:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1252
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-620   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1252:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1253
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-621   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1253:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1254
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-622   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1254:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1255
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-623   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1255:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1256
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-624   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1256:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1257
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-625   if (iscmp1 == 1) { token=getlex();

.doreg1257:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1258
 call getlex
 mov word [token], ax

;-626       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1259
 push doreg1_7
 call error1
 add  sp, 2

;-627       strcpy(ops, "cmp"); }

.doreg1259:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-628   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1258:
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

;-629 


;-630   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1260
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-631   mod2=typeName(); ireg2=checkreg();

.doreg1260:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-632   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1261
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-633   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1261:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1262
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1263
.doreg1262:
 push word [bp-2]
 call v
 add  sp, 2

;-634   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1263:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1264
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

;-635 }

.doreg1264:

;-636 


;-637 int compoundass(char *op, int mode, int id1) {
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

;-638   if(mode) error1("only scalar Var allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass265
 push compoundass_0
 call error1
 add  sp, 2

;-639   prnl(); prs(op); prs("  ");

.compoundass265:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-640   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass266
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass267
.compoundass266:
 push compoundass_3
 call prs
 add  sp, 2

;-641   v(id1); prs(", ");

.compoundass267:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-642   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-643 }


;-644 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-645   gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-646   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1268
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

;-647     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1269
 push dovar1_1
 call prs
 add  sp, 2

;-648     if(widthi == 2) prs(" ax, [bx]");

.dovar1269:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1270
 push dovar1_2
 call prs
 add  sp, 2

;-649     return; }

.dovar1270:
 jmp .retndovar1

;-650   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1268:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1271
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

;-651   if (ixarr) {

.dovar1271:
 mov ax, [bp+8]
 or  al, al
 je .dovar1272

;-652     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-653     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1273
 push dovar1_5
 call prs
 add  sp, 2

;-654     prs("\n "); prs(op);

.dovar1273:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-655     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1274
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1275
.dovar1274:
 push dovar1_8
 call prs
 add  sp, 2

;-656 // v(id1); prs(" [bx]");


;-657     prc('['); printName(id1); prs(" + bx]");

.dovar1275:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-658     return; }

 jmp .retndovar1

;-659   prnl();prs(op);

.dovar1272:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-660   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1276
 push dovar1_10
 call prs
 add  sp, 2

;-661   if(wi==2) prs(" ax, ");

.dovar1276:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1277
 push dovar1_11
 call prs
 add  sp, 2

;-662   if(wi==4) prs(" eax, ");

.dovar1277:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1278
 push dovar1_12
 call prs
 add  sp, 2

;-663   v(id1);

.dovar1278:
 push word [bp+10]
 call v
 add  sp, 2

;-664 }


;-665 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-666   if (istoken(T_CONST)) { prnl(); prs(op);
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm279
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-667     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm280
 push rterm_0
 call prs
 add  sp, 2

;-668     if (wi==2) prs(" ax, ");

.rterm280:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm281
 push rterm_1
 call prs
 add  sp, 2

;-669     if (wi==4) prs(" eax, ");

.rterm281:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm282
 push rterm_2
 call prs
 add  sp, 2

;-670     prunsign1(lexval); return;}

.rterm282:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-671   mode=typeName(); id1=searchname(); ixarr=0;

.rterm279:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-672   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm283
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-673     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-674     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm284
 push rterm_3
 call error1
 add  sp, 2
.rterm284:

;-675   if (eqstr(symbol,"_AX")) return;

.rterm283:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm285
 jmp .retnrterm

;-676   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm285:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-677 }


;-678 


;-679 int doreg(char *dr) { int i; expect('=');

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

;-680   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-681        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg286
 push word [lexval]
 call prunsign1
 add  sp, 2

;-682   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg287
.doreg286:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg288
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-683   else error1("only number or var allowed");

 jmp .doreg289
.doreg288:
 push doreg_2
 call error1
 add  sp, 2

;-684 }

.doreg289:
.doreg287:

;-685 int isreg() {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

isreg: PROC

;-686   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg290
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-687   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg290:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg291
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-688   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg291:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg292
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-689   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg292:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg293
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-690   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg293:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg294
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-691   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg294:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg295
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-692   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg295:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg296
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-693   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg296:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg297
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-694   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg297:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg298
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-695   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg298:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg299
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-696   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg299:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg300
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-697   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg300:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg301
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-698   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg301:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg302
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-699   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg302:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg303
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-700   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg303:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg304
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-701   return 0;   r1: return 1;

.isreg304:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-702 }


;-703 


;-704 int doassign(int mode, int i, int ixarr, int ixconst) {

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

;-705   gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-706   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign305
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-707     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign306
 push doassign_1
 call prs
 add  sp, 2

;-708     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign307
.doassign306:
 push doassign_2
 call prs
 add  sp, 2
.doassign307:
 jmp .retndoassign

;-709   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign305:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign308
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

;-710   if (ixarr) {  prs("\n mov bx, ");

.doassign308:
 mov ax, [bp+8]
 or  al, al
 je .doassign309
 push doassign_5
 call prs
 add  sp, 2

;-711     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign310
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign311
.doassign310:
 push word [bp+8]
 call v
 add  sp, 2

;-712     if (wi==2) prs("\n shl bx, 1");

.doassign311:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign312
 push doassign_6
 call prs
 add  sp, 2

;-713     prs("\n mov ["); printName(i);

.doassign312:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-714     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign313
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign314
.doassign313:
 push doassign_9
 call prs
 add  sp, 2
.doassign314:
 jmp .retndoassign

;-715   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign309:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign315
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign316
 push doassign_11
 call prs
 add  sp, 2

;-716     } v(i); prs(", al"); return; }

.doassign316:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-717   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign315:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign317
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign318
 push doassign_14
 call prs
 add  sp, 2

;-718     } v(i); prs(", ax"); return; }

.doassign318:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-719   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign317:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign319
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign320
 push doassign_17
 call prs
 add  sp, 2

;-720     } v(i); prs(", eax"); return; }

.doassign320:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-721 }

.doassign319:

;-722 int domul(int ids) {

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

;-723   if (ids) rterm("imul"); else {
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul321
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul322
.domul321:

;-724   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul323

;-725     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-726     }


;-727   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul324
.domul323:
 push domul_3
 call error1
 add  sp, 2
.domul324:
.domul322:

;-728 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-729   if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv325

;-730     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-731     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv326
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv327
.doidiv326:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv327:

;-732   else {

 jmp .doidiv328
.doidiv325:

;-733     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-734     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv329
 push doidiv_3
 call error1
 add  sp, 2

;-735     gettypes(id1);

.doidiv329:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-736     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv330
 push doidiv_4
 call error1
 add  sp, 2

;-737     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv330:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv331
 push doidiv_5
 call error1
 add  sp, 2

;-738     prs("\n mov bx, "); v(id1);

.doidiv331:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-739     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv332
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv333
.doidiv332:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv333:

;-740 }

.doidiv328:

;-741 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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

;-742 


;-743 


;-744 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 56925
docalltype resw 10
section .text
section .bss
absolute 56945
docallvalue resw 10
section .text

;-745 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 56965
procname resb 17
section .text

;-746 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-747   narg=0;  sz32=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-748   checknamelen();

 call checknamelen

;-749   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-750   storeCall1();

 call storeCall1

;-751   expect('(');

 push 40
 call expect
 add  sp, 2

;-752 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1334

;-753 	  do { narg++;

.docall1335:
 inc  word[bp-4]

;-754 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1336
 push docall1_0
 call error1
 add  sp, 2
.docall1336:
 mov ax, 0
 mov [bp-6], ax

;-755       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1337
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-756       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1337:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1338
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-757         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-758         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-759       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1338:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1339
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-760       if(istoken(T_NAME))  { n0=checkreg();

.docall1339:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1340
 call checkreg
 mov [bp-8], ax

;-761         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1341
 mov ax, 5
 mov [bp-6], ax

;-762         else {t0=4; n0=searchname();

 jmp .docall1342
.docall1341:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-763           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1343
 mov ax, 3
 mov [bp-6], ax
.docall1343:
.docall1342:

;-764       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1340:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1344
 push docall1_4
 call error1
 add  sp, 2

;-765       docalltype [narg] = t0;

.docall1344:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-766       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-767     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1345
 jmp .docall1335
.docall1345:

;-768 


;-769   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-770     do {

.docall1346:

;-771       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-772       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-773       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1347
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-774       if(t0==2){ prs("\n push ");

.docall1347:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1348
 push docall1_6
 call prs
 add  sp, 2

;-775         prs(fname);prc(95);prunsign1(n0);}

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

;-776       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1348:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1349
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-777         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-778       if(t0==4){ gettypes(n0);

.docall1349:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1350
 push word [bp-8]
 call gettypes
 add  sp, 2

;-779         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1351
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-780         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1352
.docall1351:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-781         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1352:

;-782       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1350:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1353
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1354
 mov ax, [bp-10]
 add ax, 2
.docall1354:

;-783    i--; } while (i > 0);  }

.docall1353:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1355
 jmp .docall1346
.docall1355:

;-784 	 prs("\n call "); prs(&procname);

.docall1334:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-785 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1356
 push docall1_14
 call prs
 add  sp, 2

;-786      narg=narg+narg; narg=narg+sz32; prunsign1(narg); }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2

;-787  }

.docall1356:

;-788 


;-789  int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
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

;-790  int expr(int isRight)


expr: PROC

;-791  { int mode; int id1;     int ixarr; int ixconst;


;-792    int ids;  int isCONST; int i;     unsigned char *p;


;-793    if (istoken(T_CONST)) { evalue=lexval;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr357
 mov ax, [lexval]
 mov word [evalue], ax

;-794      prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-795    mode=typeName(); /*0=V,1=*,2=&*/

.expr357:
 call typeName
 mov [bp-2], ax

;-796    ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-797    if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr358
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-798    if (token=='(')  {docall1(); goto e1; }

.expr358:
 mov ax, [token]
 cmp ax, 40
 jne .expr359
 call docall1
 jmp .e1

;-799    if (isreg()) goto e1;

.expr359:
 call isreg
 or  al, al
 je .expr360
 jmp .e1

;-800 


;-801    id1=searchname(); gettypes(id1); ids=signi;

.expr360:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-802    ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-803      if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr361
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr362

;-804        ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-805      else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr363
.expr362:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-806      gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-807      if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr364
 push expr_1
 call error1
 add  sp, 2
.expr364:
.expr363:

;-808    if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

.expr361:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr365
 mov ax, [bp-2]
 or  al, al
 je .expr366
 push expr_2
 call error1
 add  sp, 2

;-809       prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr366:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr367
 push expr_4
 call prs
 add  sp, 2
 jmp .expr368
.expr367:
 push expr_5
 call prs
 add  sp, 2

;-810       v(id1); goto e1;}

.expr368:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-811    if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

.expr365:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr369
 mov ax, [bp-2]
 or  al, al
 je .expr370
 push expr_6
 call error1
 add  sp, 2

;-812       prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr370:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr371
 push expr_8
 call prs
 add  sp, 2
 jmp .expr372
.expr371:
 push expr_9
 call prs
 add  sp, 2

;-813       v(id1); goto e1;}

.expr372:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-814 


;-815    if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr369:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr373
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-816    if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr373:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr374
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-817    if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr374:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr375
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-818    if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr375:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr376
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-819    if (istoken(T_MULASS    )) {error1("not implemented");}

.expr376:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr377
 push expr_14
 call error1
 add  sp, 2

;-820    if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr377:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr378
 push expr_15
 call error1
 add  sp, 2

;-821 


;-822    if (istoken('=')) { exprtype= expr(1);

.expr378:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr379
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-823    doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-824    dovar1(mode, "mov", ixarr, id1);

.expr379:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-825 


;-826  e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr380
 push expr_17
 call rterm
 add  sp, 2

;-827    else if (istoken('-')) rterm("sub" );

 jmp .expr381
.expr380:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr382
 push expr_18
 call rterm
 add  sp, 2

;-828    else if (istoken('&')) rterm("and" );

 jmp .expr383
.expr382:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr384
 push expr_19
 call rterm
 add  sp, 2

;-829    else if (istoken('|')) rterm("or" );

 jmp .expr385
.expr384:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr386
 push expr_20
 call rterm
 add  sp, 2

;-830    else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr387
.expr386:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr388
 push expr_21
 call rterm
 add  sp, 2

;-831    else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr389
.expr388:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr390
 push expr_22
 call rterm
 add  sp, 2

;-832    else if (istoken('*')) domul (ids);

 jmp .expr391
.expr390:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr392
 push word [bp-10]
 call domul
 add  sp, 2

;-833    else if (istoken('/')) doidiv(ids);

 jmp .expr393
.expr392:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr394
 push word [bp-10]
 call doidiv
 add  sp, 2

;-834    else if (istoken('%')) domod (ids);

 jmp .expr395
.expr394:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr396
 push word [bp-10]
 call domod
 add  sp, 2

;-835    if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr396:
.expr395:
.expr393:
.expr391:
.expr389:
.expr387:
.expr385:
.expr383:
.expr381:
 call isrelational
 or  al, al
 je .expr397
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-836    return 0;

.expr397:
 mov ax, 0
 jmp .retnexpr

;-837  }


;-838 


;-839  int pexpr() {expect('('); iscmp=0;

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

;-840    if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr398
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr399
 call constantexpr
 jmp .retnpexpr

;-841      ireg1=checkreg();

.pexpr399:
 call checkreg
 mov word [ireg1], ax

;-842      if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr400
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr400:

;-843    expr(0);

.pexpr398:
 push 0
 call expr
 add  sp, 2

;-844    if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr401
 push pexpr_1
 call prs
 add  sp, 2
.pexpr401:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-845    expect(')');

 push 41
 call expect
 add  sp, 2

;-846  }


;-847 


;-848 /***************************************************************/


;-849 


;-850 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC

;-851     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2

;-852     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-853     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-854     prc(':');

 push 58
 call prc
 add  sp, 2

;-855 }


;-856 int prjump (int n) {
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC

;-857     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2

;-858     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-859     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2

;-860 }


;-861 


;-862 int stmt() {
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC

;-863     int c; char cha;


;-864     int jdest; int tst; int jtemp;


;-865        if(istoken('{'))     {while(istoken('}')==0) stmt();}
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt402
.stmt403:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt404
 call stmt
 jmp .stmt403
.stmt404:

;-866   else if(istoken(T_IF)) {

 jmp .stmt405
.stmt402:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt406

;-867       int jdest; int tst;

 mov ax, [bp-6]
 mov ax, [bp-8]

;-868       pexpr(); nlabel++; jdest=nlabel;

 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax

;-869       pint1(jdest); stmt();

 push word [bp-6]
 call pint1
 add  sp, 2
 call stmt

;-870       if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt407
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-8], ax

;-871           prjump(tst); prlabel(jdest); stmt(); prlabel(tst);

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

;-872       }


;-873       else prlabel(jdest);

 jmp .stmt408
.stmt407:
 push word [bp-6]
 call prlabel
 add  sp, 2

;-874   }

.stmt408:

;-875   else if(istoken(T_DO)) {

 jmp .stmt409
.stmt406:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt410

;-876       nlabel++; jdest=nlabel; prlabel(jdest); stmt();

 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax
 push word [bp-6]
 call prlabel
 add  sp, 2
 call stmt

;-877       expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-878       prjump(jdest); prlabel(jtemp);

 push word [bp-6]
 call prjump
 add  sp, 2
 push word [bp-10]
 call prlabel
 add  sp, 2

;-879   }


;-880   else if(istoken(T_WHILE)) {

 jmp .stmt411
.stmt410:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt412

;-881       nlabel++; jdest=nlabel;

 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-6], ax

;-882       prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-883       stmt(); prjump(jdest); prlabel(tst);

 call stmt
 push word [bp-6]
 call prjump
 add  sp, 2
 push word [bp-8]
 call prlabel
 add  sp, 2

;-884   }


;-885   else if(istoken(T_GOTO))  {

 jmp .stmt413
.stmt412:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt414

;-886       prs("\n jmp .");name1();prs(symbol);expect(';');

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

;-887   }


;-888   else if(token==T_ASM)     {

 jmp .stmt415
.stmt414:
 mov ax, [token]
 cmp ax, 518
 jne .stmt416

;-889       prs("\n"); c=next();

 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-890       while(c != '\n') { prc(c);	c=next(); };

.stmt417:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt418
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt417
.stmt418:

;-891       token=getlex();

 call getlex
 mov word [token], ax

;-892   }


;-893   else if(istoken(T_ASMBLOCK)) {

 jmp .stmt419
.stmt416:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt420

;-894       if (token== '{' )  {

 mov ax, [token]
 cmp ax, 123
 jne .stmt421

;-895           prs("\n"); cha=next();

 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-896           while(cha!= '}') {

.stmt422:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt423

;-897               prc(cha);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-898               cha=next();

 call next
 mov [bp-4], al

;-899           }


;-900           token=getlex();

 jmp .stmt422
.stmt423:
 call getlex
 mov word [token], ax

;-901       } else error1("Curly open expected");

 jmp .stmt424
.stmt421:
 push stmt_3
 call error1
 add  sp, 2

;-902         }

.stmt424:

;-903   else if(istoken(T_EMIT)) {

 jmp .stmt425
.stmt420:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt426

;-904       prs("\n db ");

 push stmt_4
 call prs
 add  sp, 2

;-905     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax

;-906       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2

;-907       token=getlex();

 call getlex
 mov word [token], ax

;-908       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt427

;-909           prc(',');

 push 44
 call prc
 add  sp, 2

;-910           goto L1;

 jmp .L1

;-911       }


;-912       expect(')');

.stmt427:
 push 41
 call expect
 add  sp, 2

;-913   }


;-914   else if(istoken(';'))      { }

 jmp .stmt428
.stmt426:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt429

;-915   else if(istoken(T_RETURN)) {

 jmp .stmt430
.stmt429:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt431

;-916         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt432
 push 0
 call expr
 add  sp, 2

;-917         prs("\n jmp .retn");

.stmt432:
 push stmt_5
 call prs
 add  sp, 2

;-918         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-919         nreturn++;

 inc  word[nreturn]

;-920         expect(';');

 push 59
 call expect
 add  sp, 2

;-921         }


;-922   else if(thechar==':')      {

 jmp .stmt433
.stmt431:
 mov al, [thechar]
 cmp al, 58
 jne .stmt434

;-923         prs("\n."); // Label

 push stmt_6
 call prs
 add  sp, 2

;-924         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-925         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-926         expect(':');

 push 58
 call expect
 add  sp, 2

;-927         }


;-928   else  {expr(0);; expect(';'); }

 jmp .stmt435
.stmt434:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-929 }

.stmt435:
.stmt433:
.stmt430:
.stmt428:
.stmt425:
.stmt419:
.stmt415:
.stmt413:
.stmt411:
.stmt409:
.stmt405:

;-930 


;-931 


;-932 int dofunc() { int nloc; int i; int narg;
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

;-933   cloc=&co;
;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-934   checknamelen();

 call checknamelen

;-935   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-936   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc436
 push dofunc_0
 call error1
 add  sp, 2

;-937   storefunc();

.dofunc436:
 call storefunc

;-938   prs("\n\n"); prs(symbol); prs(": PROC");

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

;-939   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-940   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc437
 mov ax, 2
 mov [bp-6], ax

;-941     do { typeName();  addlocal(); narg+=2;

.dofunc438:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-942          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne .dofunc439
 add  word[bp-6], 2
.dofunc439:
 inc  word[LTop]

;-943     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc440
 jmp .dofunc438
.dofunc440:
 push 41
 call expect
 add  sp, 2

;-944 


;-945   expect('{'); /*body*/

.dofunc437:
 push 123
 call expect
 add  sp, 2

;-946   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-947   while(isvariable()) {

.dofunc441:
 call isvariable
 or  al, al
 je .dofunc442

;-948     do {typeName();

.dofunc443:
 call typeName

;-949         checknamelen();

 call checknamelen

;-950         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-951         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc444
 sub  word[bp-2], 2

;-952         GData[LTop]=nloc;

.dofunc444:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-953         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc445

;-954             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

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

;-955             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-956             }


;-957         LTop++;

.dofunc445:
 inc  word[LTop]

;-958       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc446
 jmp .dofunc443
.dofunc446:
 push 59
 call expect
 add  sp, 2

;-959   if (LTop>LSTART){prs(";\n ENTER  ");

 jmp .dofunc441
.dofunc442:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc447
 push dofunc_3
 call prs
 add  sp, 2

;-960     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

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

;-961   while(istoken('}')==0)   stmt();

.dofunc447:
.dofunc448:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc449
 call stmt

;-962   if (nreturn) {

 jmp .dofunc448
.dofunc449:
 mov ax, [nreturn]
 or  al, al
 je .dofunc450

;-963         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-964         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-965         prc(':');

 push 58
 call prc
 add  sp, 2

;-966         }


;-967   if (LTop > LSTART) prs(" LEAVE");

.dofunc450:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc451
 push dofunc_6
 call prs
 add  sp, 2

;-968   prs("\n ret");

.dofunc451:
 push dofunc_7
 call prs
 add  sp, 2

;-969   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-970   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-971   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc452
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-972   prs("\nENDP");

.dofunc452:
 push dofunc_8
 call prs
 add  sp, 2

;-973 }


;-974 


;-975 char doglobName[IDLENMAX];
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
absolute 56982
doglobName resb 15
section .text

;-976 int doglob() {


doglob: PROC

;-977     int i; int j; int isstrarr; isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-978   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob453
 push doglob_0
 call error1
 add  sp, 2

;-979   if (iswidth == 0) error1("no VOID as var type");

.doglob453:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob454
 push doglob_1
 call error1
 add  sp, 2

;-980   checknamelen();

.doglob454:
 call checknamelen

;-981   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob455
 push doglob_2
 call error1
 add  sp, 2

;-982   if (istoken('[')) { istype='&';

.doglob455:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob456
 mov ax, 38
 mov byte [istype], al

;-983     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob457

;-984       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-985       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-986       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-987       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob458
 push doglob_5
 call prs
 add  sp, 2

;-988       if (iswidth==2) prs(" resw ");

.doglob458:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob459
 push doglob_6
 call prs
 add  sp, 2

;-989       if (iswidth==4) prs(" resd ");

.doglob459:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob460
 push doglob_7
 call prs
 add  sp, 2

;-990       prunsign1(lexval);

.doglob460:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-991       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-992       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-993       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob461
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-994       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob461:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob462
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-995       GData[GTop]=lexval; expect(']');

.doglob462:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-996     }else { expect(']');

 jmp .doglob463
.doglob457:
 push 93
 call expect
 add  sp, 2

;-997       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob464
 push doglob_9
 call error1
 add  sp, 2

;-998       prs("\n"); prs(symbol); prs(" db ");

.doglob464:
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

;-999       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-1000       expect('=');

 push 61
 call expect
 add  sp, 2

;-1001       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob465

;-1002         prc(34); prscomment(symbol); prc(34); prs(",0");

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

;-1003         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1004       else if (istoken('{' )) { i=0;

 jmp .doglob466
.doglob465:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob467
 mov ax, 0
 mov [bp-2], ax

;-1005         do { if(i) prc(',');

.doglob468:
 mov ax, [bp-2]
 or  al, al
 je .doglob469
 push 44
 call prc
 add  sp, 2

;-1006           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob469:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-1007         while (istoken(',')); expect('}'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob470
 jmp .doglob468
.doglob470:
 push 125
 call expect
 add  sp, 2

;-1008       else error1("String or number array expected");

 jmp .doglob471
.doglob467:
 push doglob_13
 call error1
 add  sp, 2

;-1009       };

.doglob471:
.doglob466:
.doglob463:

;-1010   }else { //expect('=');

 jmp .doglob472
.doglob456:

;-1011     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne .doglob473
 push doglob_15
 call prs
 add  sp, 2

;-1012     else {

 jmp .doglob474
.doglob473:

;-1013       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob475
 push doglob_16
 call prs
 add  sp, 2

;-1014       else if (iswidth==2) prs(" dw ");

 jmp .doglob476
.doglob475:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob477
 push doglob_17
 call prs
 add  sp, 2

;-1015       else                 prs(" dd ");

 jmp .doglob478
.doglob477:
 push doglob_18
 call prs
 add  sp, 2

;-1016     }

.doglob478:
.doglob476:

;-1017     if(istoken('-')) prc('-');

.doglob474:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob479
 push 45
 call prc
 add  sp, 2

;-1018     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

.doglob479:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob480
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-1019     else prunsign1(0); }

 jmp .doglob481
.doglob480:
 push 0
 call prunsign1
 add  sp, 2
.doglob481:

;-1020   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

.doglob472:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-1021   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1022   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-1023   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je .doglob482
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp .doglob483
.doglob482:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1024   GTop++; expect(';'); }

.doglob483:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-1025 


;-1026 unsigned int MAXUI=65535;
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
MAXUI dw 65535

;-1027 int epilog() {


epilog: PROC

;-1028     unsigned int i;


;-1029     prs("\n;Input: "); prs(&namein);
;
 ENTER  2,0
 push epilog_0
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1030     prs(", List: ");   prs(&namelst);

 push epilog_1
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1031     prs(",  Lines:"); printint51(lineno);

 push epilog_2
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-1032     prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_3
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-1033     prs(" max.:"); printint51(LSTART);

 push epilog_4
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-1034     prs("\n;Functions      :"); printint51(FTop);

 push epilog_5
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-1035     prs(" max.:"); printint51(FUNCMAX);

 push epilog_6
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-1036     prs("\n;Calls          :"); printint51(CTop);

 push epilog_7
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-1037     prs(" max.:"); printint51(CALLMAX);

 push epilog_8
 call prs
 add  sp, 2
 push 1500
 call printint51
 add  sp, 2

;-1038     i = CNamePtr - &CNameField;

 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-1039     prs("\n;NameField      :"); printint51(i);

 push epilog_9
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-1040     prs(" max.:"); printint51(CNAMEMAX);

 push epilog_10
 call prs
 add  sp, 2
 push 10000
 call printint51
 add  sp, 2

;-1041     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);

 push epilog_11
 call prs
 add  sp, 2
 lea  ax, [coname]
 push ax
 call prs
 add  sp, 2
 push epilog_12
 call prs
 add  sp, 2
 push word [maxco]
 call printint51
 add  sp, 2

;-1042     prs(" max.:"); printint51(COMAX);

 push epilog_13
 call prs
 add  sp, 2
 push 3000
 call printint51
 add  sp, 2

;-1043     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-2], ax
 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax

;-1044     if (i <= 1000)prs(" *** Warning *** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog484
 push epilog_14
 call prs
 add  sp, 2

;-1045     prs(", stacksize: ");

.epilog484:
 push epilog_15
 call prs
 add  sp, 2

;-1046     i=MAXUI-orgData; printint51(i);

 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1047     if (i <= 1000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog485
 push epilog_16
 call prs
 add  sp, 2

;-1048   end1(0);}

.epilog485:
 push 0
 call end1
 add  sp, 2

;-1049 


;-1050 int dodefine() {
 LEAVE
 ret
epilog_0 db "\n;Input: ",0
epilog_1 db ", List: ",0
epilog_2 db ",  Lines:",0
epilog_3 db "\n;Glob. variables:",0
epilog_4 db " max.:",0
epilog_5 db "\n;Functions      :",0
epilog_6 db " max.:",0
epilog_7 db "\n;Calls          :",0
epilog_8 db " max.:",0
epilog_9 db "\n;NameField      :",0
epilog_10 db " max.:",0
epilog_11 db "\n;Const in '",0
epilog_12 db "' :",0
epilog_13 db " max.:",0
epilog_14 db " *** Warning *** constant area too small",0
epilog_15 db ", stacksize: ",0
epilog_16 db " *** Warning *** Stack too small",0
ENDP

dodefine: PROC

;-1051     int i; int j; int fdtemp;


;-1052     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine486

;-1053         token=getlex();

 call getlex
 mov word [token], ax

;-1054         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax

;-1055         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax

;-1056         return;

 jmp .retndodefine

;-1057     }


;-1058     expect(T_NAME);

.dodefine486:
 push 256
 call expect
 add  sp, 2

;-1059     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine487

;-1060         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine488
 push dodefine_1
 call error1
 add  sp, 2

;-1061         i=strlen(symbol);

.dodefine488:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1062         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine489
 push dodefine_2
 call error1
 add  sp, 2

;-1063         GSign [GTop]='U';

.dodefine489:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al

;-1064         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al

;-1065         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-1066         GAdr [GTop]=lineno-1;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax

;-1067         GUsed [GTop]=0;

 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1068         pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-1069         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1070         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1071         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1072         GTop++;

 inc  word[GTop]

;-1073     }


;-1074 }

.dodefine487:

;-1075 


;-1076 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1077     CNamePtr = &CNameField;

 mov ax, CNameField
 mov word [CNamePtr], ax

;-1078     token=getlex();

 call getlex
 mov word [token], ax

;-1079     do {

.parse490:

;-1080         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse491
 mov ax, 1
 jmp .retnparse

;-1081         if (istoken('#')) {

.parse491:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse492

;-1082              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse493
 call dodefine

;-1083              else error1("define expected");

 jmp .parse494
.parse493:
 push parse_0
 call error1
 add  sp, 2

;-1084         }

.parse494:

;-1085     else{

 jmp .parse495
.parse492:

;-1086         typeName();

 call typeName

;-1087         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse496
 call dofunc

;-1088         else doglob(); }

 jmp .parse497
.parse496:
 call doglob
.parse497:

;-1089     } while(1);

.parse495:
 mov ax, 1
 or  al, al
 je .parse498
 jmp .parse490
.parse498:

;-1090 }


;-1091 


;-1092 int getfirstchar() {

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP

getfirstchar: PROC

;-1093     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1094     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1095     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1096     }


;-1097 


;-1098 char *arglen=0x80; char *argv=0x82;

 ret
ENDP
arglen dw 128
argv dw 130

;-1099 int getarg() {


getarg: PROC

;-1100     int arglen1; int i; char *c;


;-1101     arglen1=*arglen;
;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1102     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarg499

;-1103         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1104         cputs(" Usage: A.COM in_file[.C]: ");

 push getarg_0
 call cputs
 add  sp, 2

;-1105         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1106         }


;-1107     i=arglen1+129;

.getarg499:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1108     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1109     arglen1--;

 dec  word[bp-2]

;-1110     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1111     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1112     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .getarg500
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-1113     strcpy(namelst, namein);

.getarg500:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1114     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1115     i--;

 dec  word[bp-4]

;-1116     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1117     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1118 


;-1119     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1120     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg501

;-1121         cputs("Source file missing (.C): ");

 push getarg_2
 call cputs
 add  sp, 2

;-1122         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1123         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1124         }


;-1125     fdout=creatR(namelst);

.getarg501:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1126     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg502

;-1127         cputs("list file not creatable: ");

 push getarg_3
 call cputs
 add  sp, 2

;-1128         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1129         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1130         }


;-1131     prs("\n; ");

.getarg502:
 push getarg_4
 call prs
 add  sp, 2

;-1132     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1133     prs(", Source: "); prs(namein);

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1134     prs(", Output asm: "); prs(namelst);

 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1135     prs("\norg  256 \njmp main");

 push getarg_7
 call prs
 add  sp, 2

;-1136 }


;-1137 


;-1138 int main() {
 LEAVE
 ret
getarg_0 db " Usage: A.COM in_file[.C]: ",0
getarg_1 db ".C",0
getarg_2 db "Source file missing (.C): ",0
getarg_3 db "list file not creatable: ",0
getarg_4 db "\n; ",0
getarg_5 db ", Source: ",0
getarg_6 db ", Output asm: ",0
getarg_7 db "\norg  256 \njmp main",0
ENDP

main: PROC

;-1139     getarg();

 call getarg

;-1140     CNameTop=0;

 mov ax, 0
 mov word [CNameTop], ax

;-1141     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1142     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1143     getfirstchar();

 call getfirstchar

;-1144     parse();

 call parse

;-1145   epilog();

 call epilog

;-1146 }

 ret
ENDP
;Input: A.C, List: A.S,  Lines: 1147
;Glob. variables:  117 max.:  200
;Functions      :   87 max.:  300
;Calls          :  782 max.: 1500
;NameField      : 4974 max.:10000
;Const in 'checkreg' :  712 max.: 3000, stacksize:  8538