
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

;-40 #define COMAX        2000


;-41 char co[COMAX];//constant storage

section .bss
absolute 25000
co resb 2000
section .text

;-42 int maxco=0;

maxco dw 0

;-43 int maxco1=0;

maxco1 dw 0

;-44 #define CMDLENMAX      67


;-45 char coname[CMDLENMAX];

section .bss
absolute 27000
coname resb 67
section .text

;-46 char symbol[COLUMNMAX];

section .bss
absolute 27067
symbol resb 128
section .text

;-47 char fname[CMDLENMAX];

section .bss
absolute 27195
fname resb 67
section .text

;-48 char namein[CMDLENMAX];

section .bss
absolute 27262
namein resb 67
section .text

;-49 char namelst[CMDLENMAX];

section .bss
absolute 27329
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
absolute 27396
GType resb 300
section .text

;-70 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 27696
GSign resb 300
section .text

;-71 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 27996
GWidth resb 300
section .text

;-72 int GAdr  [VARMAX];

section .bss
absolute 28296
GAdr resw 300
section .text

;-73 int GUsed [VARMAX];

section .bss
absolute 28896
GUsed resw 300
section .text

;-74 int GData [VARMAX];

section .bss
absolute 29496
GData resw 300
section .text

;-75 char GNameField[GNAMEMAX];

section .bss
absolute 30096
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
absolute 34896
FType resb 300
section .text

;-81 int  FAdr  [FUNCMAX];

section .bss
absolute 35196
FAdr resw 300
section .text

;-82 int  FCalls[FUNCMAX];

section .bss
absolute 35796
FCalls resw 300
section .text

;-83 char FNameField[FNAMEMAX];

section .bss
absolute 36396
FNameField resb 4800
section .text

;-84 int  FTop=0;

FTop dw 0

;-85 #define CALLMAX      1500//max call


;-86 char CType[CALLMAX]; //0=unresolved,  1=resolved

section .bss
absolute 41196
CType resb 1500
section .text

;-87 int  CAdr [CALLMAX]; //start of nameof address in CNameField

section .bss
absolute 42696
CAdr resw 1500
section .text

;-88 #define CNAMEMAX    10000//space for call names


;-89 char CNameField[10016];//CNAMEMAX+IDLENMAX+1

section .bss
absolute 45696
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
absolute 55712
fgetsdest resb 128
section .text

;-95 unsigned char *fgetsp=0;

fgetsp dw 0

;-96 unsigned int segE;

segE dw 0

;-97 unsigned int lineno=1;

lineno dw 1

;-98 unsigned char *pt=0;

pt dw 0

;-99 unsigned char *p1=0;

p1 dw 0

;-100 int DOS_ERR=0;

DOS_ERR dw 0

;-101 int DOS_NoBytes=0;

DOS_NoBytes dw 0

;-102 char DOS_ByteRead=0;

DOS_ByteRead db 0

;-103 


;-104 


;-105 int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); }


writetty: PROC
 mov  ah, 14
 mov  bx, 0
 db 205,16

;-106 int putch(char c)  {if (c==10) {al=13; writetty();} al=c; writetty(); }

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

;-107 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
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

;-108 int mkneg(int n)   { n; __asm {neg ax} }
 LEAVE
 ret
ENDP

mkneg: PROC;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-109 


;-110 int DosInt() {
 LEAVE
 ret
ENDP

DosInt: PROC

;-111     __emit__(0xCD,0x21);//inth 0x21;

 db 205,33

;-112     __emit__(0x73, 04); //ifcarry DOS_ERR++;

 db 115,4

;-113     DOS_ERR++;

 inc  word[DOS_ERR]

;-114 }


;-115 int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }

 ret
ENDP

openR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-116 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
ENDP

creatR: PROC;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-117 int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
 LEAVE
 ret
ENDP

fcloseR: PROC;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 call DosInt

;-118 int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
 LEAVE
 ret
ENDP

exitR: PROC;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 call DosInt

;-119 int readRL(char *s, int fd, int len){
 LEAVE
 ret
ENDP

readRL: PROC

;-120     dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-121 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
ENDP

fputcR: PROC;
 ENTER  0,0
lea dx, [bp+4]

;-122   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-123 


;-124   int letter(char c) {
 LEAVE
 ret
ENDP

letter: PROC

;-125       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter

;-126       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter

;-127       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter

;-128       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter

;-129       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter

;-130       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter

;-131       if (c> 'Z') { if (c< 'a') return 0; }

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

;-132       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter

;-133   }


;-134   int digit(char c){

 .retnletter: LEAVE
 ret
ENDP

digit: PROC

;-135       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit

;-136       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit

;-137       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit

;-138   }


;-139   int alnum(char c) {

 .retndigit: LEAVE
 ret
ENDP

alnum: PROC

;-140     if (digit (c)) return 1;
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

;-141     if (letter(c)) return 1;

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

;-142     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum

;-143   }


;-144 


;-145 int strlen(char *s) { int c;

 .retnalnum: LEAVE
 ret
ENDP

strlen: PROC

;-146     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-147     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]

;-148     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen

;-149 }


;-150 int strcpy(char *s, char *t) {

 .retnstrlen: LEAVE
 ret
ENDP

strcpy: PROC

;-151     do { *s=*t; s++; t++; }
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

;-152     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:

;-153     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-154     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy

;-155 }


;-156 int eqstr(char *p, char *q) {

 .retnstrcpy: LEAVE
 ret
ENDP

eqstr: PROC

;-157     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21

;-158         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr

;-159         p++;

.eqstr22:
 inc  word[bp+4]

;-160         q++;

 inc  word[bp+6]

;-161     }


;-162     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr

;-163     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr

;-164 int strcat1(char *s, char *t) {

 .retneqstr: LEAVE
 ret
ENDP

strcat1: PROC

;-165     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]

;-166     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-167 }


;-168 int toupper(char *s) {
 LEAVE
 ret
ENDP

toupper: PROC

;-169     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27

;-170         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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

;-171         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]

;-172     }


;-173 }

 jmp .toupper26
.toupper27:

;-174 int instr1(char *s, char c) {
 LEAVE
 ret
ENDP

instr1: PROC

;-175     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131

;-176         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1

;-177         s++;

.instr132:
 inc  word[bp+4]

;-178     }


;-179     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1

;-180 }


;-181 


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


;-279 int error1(char *s) {
 LEAVE
 ret
ENDP

error1: PROC

;-280     lineno--;
;
 ENTER  0,0
 dec  word[lineno]

;-281     prnl();

 call prnl

;-282     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-283     prs(";Line: ");

 push error1_0
 call prs
 add  sp, 2

;-284     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-285     prs(" ************** ERROR: ");

 push error1_1
 call prs
 add  sp, 2

;-286     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2

;-287     prs("  in column: ");

 push error1_2
 call prs
 add  sp, 2

;-288     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2

;-289     prs("\nToken: ");

 push error1_3
 call prs
 add  sp, 2

;-290     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2

;-291     prs(", symbol: ");

 push error1_4
 call prs
 add  sp, 2

;-292     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-293     end1(1);

 push 1
 call end1
 add  sp, 2

;-294 }


;-295 


;-296 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR
 LEAVE
 ret
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", symbol: ",0
ENDP

ifEOL: PROC

;-297     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL56
 mov ax, 1
 jmp .retnifEOL

;-298     if (c == 13) {//CR

.ifEOL56:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL57

;-299         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL58
 call next
 mov [bp+4], al

;-300         return 1;

.ifEOL58:
 mov ax, 1
 jmp .retnifEOL

;-301     }


;-302     return 0;

.ifEOL57:
 mov ax, 0
 jmp .retnifEOL

;-303 }


;-304 int printinputline() {

 .retnifEOL: LEAVE
 ret
ENDP

printinputline: PROC

;-305     int col;


;-306     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax

;-307     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-308     do {

.printinputline59:

;-309         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax

;-310         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline60
 jmp .retnprintinputline

;-311         *fgetsp=DOS_ByteRead;

.printinputline60:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al

;-312         fgetsp++;

 inc  word[fgetsp]

;-313         col++;

 inc  word[bp-2]

;-314         if (col >80) error1("input line longer than 80 char");

 mov ax, [bp-2]
 cmp ax, 80
 jle .printinputline61
 push printinputline_0
 call error1
 add  sp, 2

;-315         }

.printinputline61:

;-316         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline62
 jmp .printinputline59
.printinputline62:

;-317     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-318     if (fdout) {

 mov ax, [fdout]
 or  al, al
 je .printinputline63

;-319         prs("\n\n;-");

 push printinputline_1
 call prs
 add  sp, 2

;-320         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2

;-321         prc(' ');

 push 32
 call prc
 add  sp, 2

;-322         lineno++;

 inc  word[lineno]

;-323         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-324         }


;-325 }

.printinputline63:

;-326 int fgets1() {

 .retnprintinputline: LEAVE
 ret
printinputline_0 db "input line longer than 80 char",0
printinputline_1 db "\n\n;-",0
ENDP

fgets1: PROC

;-327     char c;


;-328     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-329     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets164

;-330         printinputline();

 call printinputline

;-331         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets165
 mov ax, 0
 jmp .retnfgets1

;-332         fgetsp=&fgetsdest;

.fgets165:
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-333         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-334         column=0;

 mov ax, 0
 mov word [column], ax

;-335     }


;-336     fgetsp++;

.fgets164:
 inc  word[fgetsp]

;-337     column++;

 inc  word[column]

;-338     return c;

 mov al, [bp-2]
 jmp .retnfgets1

;-339 }


;-340 


;-341 


;-342 int next() {

 .retnfgets1: LEAVE
 ret
ENDP

next: PROC

;-343     char r;


;-344     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al

;-345     globC=r;

 mov al, [bp-2]
 mov byte [globC], al

;-346     thechar = fgets1();

 call fgets1
 mov byte [thechar], al

;-347     return r;

 mov al, [bp-2]
 jmp .retnnext

;-348 }


;-349 int istoken(int t) {

 .retnnext: LEAVE
 ret
ENDP

istoken: PROC

;-350     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken66

;-351         token=getlex();

 call getlex
 mov word [token], ax

;-352         return 1;

 mov ax, 1
 jmp .retnistoken

;-353     }


;-354     return 0;

.istoken66:
 mov ax, 0
 jmp .retnistoken

;-355 }


;-356 int expect(int t) {

 .retnistoken: LEAVE
 ret
ENDP

expect: PROC

;-357     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect67

;-358         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al

;-359         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-360         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2

;-361         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2

;-362         error1(" not found");

 push expect_1
 call error1
 add  sp, 2

;-363     }


;-364 }

.expect67:

;-365 


;-366 int printName(unsigned int i) {int j;
 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

printName: PROC

;-367   if (i < LSTART) { i=adrofname(i); prs(i); }
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .printName68
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-368   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp .printName69
.printName68:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle .printName70
 push 43
 call prc
 add  sp, 2
.printName70:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-369 }

.printName69:

;-370 


;-371 int a(unsigned int i) { printName(i);//address
 LEAVE
 ret
printName_0 db "[bp",0
ENDP

a: PROC;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-372 }


;-373 int v(unsigned int i) {//value
 LEAVE
 ret
ENDP

v: PROC

;-374     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge .v71
 push 91
 call prc
 add  sp, 2

;-375     printName(i);

.v71:
 push word [bp+4]
 call printName
 add  sp, 2

;-376     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 200
 jge .v72
 push 93
 call prc
 add  sp, 2

;-377 }

.v72:

;-378 int checknamelen() {
 LEAVE
 ret
ENDP

checknamelen: PROC

;-379     int i;


;-380     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-381     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen73
 push checknamelen_0
 call error1
 add  sp, 2

;-382 }

.checknamelen73:

;-383 


;-384 int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

adrF: PROC;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-385   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-386 


;-387   int adrofname(unsigned int i) { adrF(GNameField, i); }
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

;-388 


;-389 int gettypes(int i) {int j; char c;
 LEAVE
 ret
ENDP

gettypes: PROC

;-390   c=GSign [i]; if (c=='S') signi =1;    else signi =0;
;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne .gettypes74
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes75
.gettypes74:
 mov ax, 0
 mov word [signi], ax

;-391   c=GWidth[i]; widthi=0;wi=0;

.gettypes75:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-392   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne .gettypes76
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-393   if (c==2) {widthi=2;wi=2;}

.gettypes76:
 mov al, [bp-4]
 cmp al, 2
 jne .gettypes77
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-394   if (c==4) {widthi=4;wi=4;}

.gettypes77:
 mov al, [bp-4]
 cmp al, 4
 jne .gettypes78
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-395   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

.gettypes78:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne .gettypes79
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-396   if (c=='&')  typei=2;

.gettypes79:
 mov al, [bp-4]
 cmp al, 38
 jne .gettypes80
 mov ax, 2
 mov word [typei], ax

;-397   return i; }

.gettypes80:
 mov ax, [bp+4]
 jmp .retngettypes

;-398 int searchname() { unsigned int i;

 .retngettypes: LEAVE
 ret
ENDP

searchname: PROC

;-399   i=checkName(); if (i == 0) error1("Variable unknown");
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname81
 push searchname_0
 call error1
 add  sp, 2

;-400   GUsed[i]=GUsed[i] + 1; return i;

.searchname81:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp .retnsearchname

;-401 }


;-402 int checkName() { unsigned int i; unsigned int j;

 .retnsearchname: LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

checkName: PROC

;-403   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
.checkName82:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName83
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
 je .checkName84
 mov ax, [bp-2]
 jmp .retncheckName
.checkName84:
 inc  word[bp-2]

;-404   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp .checkName82
.checkName83:
 mov ax, 1
 mov [bp-2], ax
.checkName85:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName86
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
 je .checkName87
 mov ax, [bp-2]
 jmp .retncheckName
.checkName87:
 inc  word[bp-2]

;-405   return 0;

 jmp .checkName85
.checkName86:
 mov ax, 0
 jmp .retncheckName

;-406 }


;-407 int typeName() { int m; //0=V,1=*,2=&

 .retncheckName: LEAVE
 ret
ENDP

typeName: PROC

;-408     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-409     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName88
 mov ax, 83
 mov byte [issign], al

;-410     if(istoken(T_UNSIGNED)) issign='U';

.typeName88:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName89
 mov ax, 85
 mov byte [issign], al

;-411     iswidth=2;

.typeName89:
 mov ax, 2
 mov byte [iswidth], al

;-412     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName90
 mov ax, 0
 mov byte [iswidth], al

;-413     if(istoken(T_CHAR))     iswidth=1;

.typeName90:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName91
 mov ax, 1
 mov byte [iswidth], al

;-414     if(istoken(T_INT))      iswidth=2;

.typeName91:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName92
 mov ax, 2
 mov byte [iswidth], al

;-415     if(istoken(T_LONG))     iswidth=4;

.typeName92:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName93
 mov ax, 4
 mov byte [iswidth], al

;-416     istype='V';

.typeName93:
 mov ax, 86
 mov byte [istype], al

;-417     m=0;

 mov ax, 0
 mov [bp-2], ax

;-418     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName94
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax

;-419     if(istoken('&'))  {istype='&'; m=2;}

.typeName94:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName95
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-420     name1();

.typeName95:
 call name1

;-421     return m;

 mov ax, [bp-2]
 jmp .retntypeName

;-422 }


;-423 int name1() {

 .retntypeName: LEAVE
 ret
ENDP

name1: PROC

;-424     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name196
 push name1_0
 call error1
 add  sp, 2

;-425     token=getlex();

.name196:
 call getlex
 mov word [token], ax

;-426 }


;-427 


;-428 int storeCall1() {//todo

 ret
name1_0 db "Name expected",0
ENDP

storeCall1: PROC

;-429     unsigned int i;


;-430     CTop++;
;
 ENTER  2,0
 inc  word[CTop]

;-431     if (CTop >= CALLMAX) error1("too many calls");

 mov ax, [CTop]
 cmp ax, 1500 ;unsigned : 1
 jl  .storeCall197
 push storeCall1_0
 call error1
 add  sp, 2

;-432     i = CNamePtr - &CNameField;

.storeCall197:
 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-433     if (i >= CNAMEMAX) error1("too many call names");

 mov ax, [bp-2]
 cmp ax, 10000 ;unsigned : 0
 jb  .storeCall198
 push storeCall1_1
 call error1
 add  sp, 2

;-434     CType[CTop]=0;

.storeCall198:
 mov ax, 0
 mov bx, [CTop]
 mov [CType+bx], al

;-435     CAdr [CTop]=CNamePtr;

 mov ax, [CNamePtr]
 mov bx, [CTop]
 shl bx, 1
 mov [CAdr+bx], ax

;-436     CNamePtr=strcpy(CNamePtr, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNamePtr]
 call strcpy
 add  sp, 4
 mov word [CNamePtr], ax

;-437     CNamePtr++;

 inc  word[CNamePtr]

;-438 }


;-439 


;-440 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
storeCall1_0 db "too many calls",0
storeCall1_1 db "too many call names",0
ENDP

storefunc: PROC
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .storefunc99
 push storefunc_0
 call error1
 add  sp, 2

;-441     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

.storefunc99:
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

;-442     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-443 }


;-444 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
storefunc_0 db "Function table full",0
ENDP

addlocal: PROC
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  .addlocal100
 push addlocal_0
 call error1
 add  sp, 2

;-445   if (checkName() != 0) error1("Variable already defined");

.addlocal100:
 call checkName
 cmp ax, 0
 je  .addlocal101
 push addlocal_1
 call error1
 add  sp, 2

;-446   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

.addlocal101:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-447   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-448   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-449 }


;-450 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

checkFunction: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-451   while (i < FTop) {

.checkFunction102:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge .checkFunction103

;-452     j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

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
 je .checkFunction104
 mov ax, [bp-2]
 jmp .retncheckFunction
.checkFunction104:
 inc  word[bp-2]

;-453   return 0; }

 jmp .checkFunction102
.checkFunction103:
 mov ax, 0
 jmp .retncheckFunction

;-454 


;-455 int isvariable() {

 .retncheckFunction: LEAVE
 ret
ENDP

isvariable: PROC

;-456     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable105
 jmp .v1

;-457     if(token==T_UNSIGNED) goto v1;

.isvariable105:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable106
 jmp .v1

;-458     if(token==T_CHAR)     goto v1;

.isvariable106:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable107
 jmp .v1

;-459     if(token==T_INT)      goto v1;

.isvariable107:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable108
 jmp .v1

;-460     if(token==T_LONG)     goto v1;

.isvariable108:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable109
 jmp .v1

;-461     return 0;

.isvariable109:
 mov ax, 0
 jmp .retnisvariable

;-462 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable

;-463 }


;-464 


;-465 int ireg1;

 .retnisvariable:
 ret
ENDP
ireg1 dw 0

;-466 int mod2; int ireg2;

mod2 dw 0
ireg2 dw 0

;-467 


;-468 int pexpr() {expect('('); iscmp=0;


pexpr: PROC
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-469   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne .pexpr110
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .pexpr111
 call constantexpr
 jmp .retnpexpr

;-470     ireg1=checkreg();

.pexpr111:
 call checkreg
 mov word [ireg1], ax

;-471     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je .pexpr112
 push 1
 call doreg1
 add  sp, 2
 jmp .retnpexpr
.pexpr112:

;-472   expr(0);

.pexpr110:
 push 0
 call expr
 add  sp, 2

;-473   if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr113
 push pexpr_1
 call prs
 add  sp, 2
.pexpr113:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-474   expect(')'); }

 push 41
 call expect
 add  sp, 2

;-475 


;-476 int constantexpr() { int mode; int id1;int ids;

 .retnpexpr:
 ret
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je .",0
ENDP

constantexpr: PROC

;-477   token=getlex();   mode=typeName();
;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-478   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-479   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne .constantexpr114
 push constantexpr_0
 call error1
 add  sp, 2

;-480   expect(T_CONST);  prs(" ; constant expression");

.constantexpr114:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-481   prs("\ncmp ");

 push constantexpr_2
 call prs
 add  sp, 2

;-482   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .constantexpr115
 push constantexpr_3
 call prs
 add  sp, 2
 jmp .constantexpr116
.constantexpr115:
 push constantexpr_4
 call prs
 add  sp, 2

;-483   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

.constantexpr116:
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

;-484   expect(')');

 push 41
 call expect
 add  sp, 2

;-485 }


;-486 


;-487 char ops[5];
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
absolute 55840
ops resb 5
section .text

;-488 int doreg1(int iscmp1) { int i;


doreg1: PROC

;-489   if (istoken('='))          strcpy(ops, "mov");
;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1117
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-490   if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1117:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1118
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-491   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1118:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1119
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-492   if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1119:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1120
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-493   if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1120:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1121
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-494   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1121:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1122
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-495   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1122:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1123
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-496   if (iscmp1 == 1) { token=getlex();

.doreg1123:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1124
 call getlex
 mov word [token], ax

;-497       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1125
 push doreg1_7
 call error1
 add  sp, 2

;-498       strcpy(ops, "cmp"); }

.doreg1125:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-499   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

.doreg1124:
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

;-500 


;-501   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1126
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .reg1

;-502   mod2=typeName(); ireg2=checkreg();

.doreg1126:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-503   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je .doreg1127
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp .reg1

;-504   i=searchname();  if (mod2 == 2) a(i); else v(i);

.doreg1127:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1128
 push word [bp-2]
 call a
 add  sp, 2
 jmp .doreg1129
.doreg1128:
 push word [bp-2]
 call v
 add  sp, 2

;-505   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

.doreg1129:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1130
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

;-506 }

.doreg1130:

;-507 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

checkreg: PROC

;-508   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg131
 mov ax, 0
 jmp .retncheckreg

;-509   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg131:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg132
 mov ax, 1
 jmp .retncheckreg
.checkreg132:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg133
 mov ax, 3
 jmp .retncheckreg

;-510   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg133:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg134
 mov ax, 5
 jmp .retncheckreg
.checkreg134:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg135
 mov ax, 7
 jmp .retncheckreg

;-511   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg135:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg136
 mov ax, 9
 jmp .retncheckreg
.checkreg136:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg137
 mov ax, 11
 jmp .retncheckreg

;-512   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg137:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg138
 mov ax, 13
 jmp .retncheckreg
.checkreg138:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg139
 mov ax, 15
 jmp .retncheckreg

;-513   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg139:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg140
 mov ax, 17
 jmp .retncheckreg
.checkreg140:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg141
 mov ax, 19
 jmp .retncheckreg

;-514   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg141:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg142
 mov ax, 21
 jmp .retncheckreg
.checkreg142:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg143
 mov ax, 23
 jmp .retncheckreg

;-515   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg143:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg144
 mov ax, 25
 jmp .retncheckreg
.checkreg144:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg145
 mov ax, 27
 jmp .retncheckreg

;-516   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg145:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg146
 mov ax, 29
 jmp .retncheckreg
.checkreg146:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg147
 mov ax, 31
 jmp .retncheckreg

;-517   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg147:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg148
 mov ax, 33
 jmp .retncheckreg
.checkreg148:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg149
 mov ax, 35
 jmp .retncheckreg

;-518   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg149:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg150
 mov ax, 37
 jmp .retncheckreg
.checkreg150:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg151
 mov ax, 39
 jmp .retncheckreg

;-519   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg151:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg152
 mov ax, 41
 jmp .retncheckreg
.checkreg152:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg153
 mov ax, 43
 jmp .retncheckreg

;-520   // (eqstr(symbol,"ip")) return 45;


;-521   if (strlen(symbol) >   3) return 0;

.checkreg153:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg154
 mov ax, 0
 jmp .retncheckreg

;-522   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg154:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg155
 mov ax, 47
 jmp .retncheckreg
.checkreg155:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg156
 mov ax, 50
 jmp .retncheckreg

;-523   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg156:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg157
 mov ax, 53
 jmp .retncheckreg
.checkreg157:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg158
 mov ax, 56
 jmp .retncheckreg

;-524   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg158:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg159
 mov ax, 59
 jmp .retncheckreg
.checkreg159:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg160
 mov ax, 62
 jmp .retncheckreg

;-525   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg160:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg161
 mov ax, 65
 jmp .retncheckreg
.checkreg161:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg162
 mov ax, 68
 jmp .retncheckreg

;-526   if (eqstr(symbol,"cr0")) return 71;

.checkreg162:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg163
 mov ax, 71
 jmp .retncheckreg

;-527   return 0;   }

.checkreg163:
 mov ax, 0
 jmp .retncheckreg

;-528 


;-529 char printregstr[]

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

;-530 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-531 


;-532 int printreg(int i) {  unsigned int k; unsigned char c;


printreg: PROC

;-533   k = &printregstr + i; c=*k; prc(c); i++;
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

;-534   k = &printregstr + i; c=*k; prc(c);

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

;-535   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg164
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

;-536 }

.printreg164:

;-537 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
ENDP
evalue dw 0
exprtype dw 10

;-538 int expr(int isRight)


expr: PROC

;-539 { int mode; int id1;     int ixarr; int ixconst;


;-540   int ids;  int isCONST; int i;     unsigned char *p;


;-541   if (istoken(T_CONST)) { evalue=lexval;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr165
 mov ax, [lexval]
 mov word [evalue], ax

;-542     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp .retnexpr

;-543   mode=typeName(); /*0=V,1=*,2=&*/

.expr165:
 call typeName
 mov [bp-2], ax

;-544   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-545   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je .expr166
 push 0
 call doreg1
 add  sp, 2
 jmp .retnexpr

;-546   if (token=='(')  {docall1(); goto e1; }

.expr166:
 mov ax, [token]
 cmp ax, 40
 jne .expr167
 call docall1
 jmp .e1

;-547   if (isreg()) goto e1;

.expr167:
 call isreg
 or  al, al
 je .expr168
 jmp .e1

;-548 


;-549   id1=searchname(); gettypes(id1); ids=signi;

.expr168:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-550   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-551     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr169
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr170

;-552       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-553     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp .expr171
.expr170:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-554     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-555     if (widthi != 2) error1("Array index must be number or int"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  .expr172
 push expr_1
 call error1
 add  sp, 2
.expr172:
.expr171:

;-556   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Only var allowed");

.expr169:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr173
 mov ax, [bp-2]
 or  al, al
 je .expr174
 push expr_2
 call error1
 add  sp, 2

;-557      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

.expr174:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr175
 push expr_4
 call prs
 add  sp, 2
 jmp .expr176
.expr175:
 push expr_5
 call prs
 add  sp, 2

;-558      v(id1); goto e1;}

.expr176:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-559   if (istoken(T_MINUSMINUS)) {if(mode)error1("Only var allowed");

.expr173:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr177
 mov ax, [bp-2]
 or  al, al
 je .expr178
 push expr_6
 call error1
 add  sp, 2

;-560      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

.expr178:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .expr179
 push expr_8
 call prs
 add  sp, 2
 jmp .expr180
.expr179:
 push expr_9
 call prs
 add  sp, 2

;-561      v(id1); goto e1;}

.expr180:
 push word [bp-4]
 call v
 add  sp, 2
 jmp .e1

;-562 


;-563   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

.expr177:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr181
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1

;-564   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

.expr181:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr182
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1

;-565   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

.expr182:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr183
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1

;-566   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}

.expr183:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr184
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1

;-567   if (istoken(T_MULASS    )) {error1("not implemented");}

.expr184:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr185
 push expr_14
 call error1
 add  sp, 2

;-568   if (istoken(T_DIVASS    )) {error1("not implemented");}

.expr185:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr186
 push expr_15
 call error1
 add  sp, 2

;-569 


;-570   if (istoken('=')) { exprtype= expr(1);

.expr186:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr187
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-571   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp .e1

;-572   dovar1(mode, "mov", ixarr, id1);

.expr187:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-573 


;-574 e1:    if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr188
 push expr_17
 call rterm
 add  sp, 2

;-575   else if (istoken('-')) rterm("sub" );

 jmp .expr189
.expr188:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr190
 push expr_18
 call rterm
 add  sp, 2

;-576   else if (istoken('&')) rterm("and" );

 jmp .expr191
.expr190:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr192
 push expr_19
 call rterm
 add  sp, 2

;-577   else if (istoken('|')) rterm("or" );

 jmp .expr193
.expr192:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr194
 push expr_20
 call rterm
 add  sp, 2

;-578   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr195
.expr194:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr196
 push expr_21
 call rterm
 add  sp, 2

;-579   else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr197
.expr196:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr198
 push expr_22
 call rterm
 add  sp, 2

;-580   else if (istoken('*')) domul (ids);

 jmp .expr199
.expr198:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr200
 push word [bp-10]
 call domul
 add  sp, 2

;-581   else if (istoken('/')) doidiv(ids);

 jmp .expr201
.expr200:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr202
 push word [bp-10]
 call doidiv
 add  sp, 2

;-582   else if (istoken('%')) domod (ids);

 jmp .expr203
.expr202:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr204
 push word [bp-10]
 call domod
 add  sp, 2

;-583   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

.expr204:
.expr203:
.expr201:
.expr199:
.expr197:
.expr195:
.expr193:
.expr191:
.expr189:
 call isrelational
 or  al, al
 je .expr205
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-584   return 0;

.expr205:
 mov ax, 0
 jmp .retnexpr

;-585 }


;-586 


;-587 int compoundass(char *op, int mode, int id1) {

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

compoundass: PROC

;-588   if(mode) error1("only scalar Var allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass206
 push compoundass_0
 call error1
 add  sp, 2

;-589   prnl(); prs(op); prs("  ");

.compoundass206:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-590   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne .compoundass207
 push compoundass_2
 call prs
 add  sp, 2
 jmp .compoundass208
.compoundass207:
 push compoundass_3
 call prs
 add  sp, 2

;-591   v(id1); prs(", ");

.compoundass208:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-592   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-593 }


;-594 int dovar1(int mode, int op, int ixarr, int id1) {
 LEAVE
 ret
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0
ENDP

dovar1: PROC

;-595   gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-596   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1209
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

;-597     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1210
 push dovar1_1
 call prs
 add  sp, 2

;-598     if(widthi == 2) prs(" ax, [bx]");

.dovar1210:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1211
 push dovar1_2
 call prs
 add  sp, 2

;-599     return; }

.dovar1211:
 jmp .retndovar1

;-600   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

.dovar1209:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1212
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

;-601   if (ixarr) {

.dovar1212:
 mov ax, [bp+8]
 or  al, al
 je .dovar1213

;-602     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-603     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1214
 push dovar1_5
 call prs
 add  sp, 2

;-604     prs("\n "); prs(op);

.dovar1214:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-605     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1215
 push dovar1_7
 call prs
 add  sp, 2
 jmp .dovar1216
.dovar1215:
 push dovar1_8
 call prs
 add  sp, 2

;-606 // v(id1); prs(" [bx]");


;-607     prc('['); printName(id1); prs(" + bx]");

.dovar1216:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-608     return; }

 jmp .retndovar1

;-609   prnl();prs(op);

.dovar1213:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-610   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1217
 push dovar1_10
 call prs
 add  sp, 2

;-611   if(wi==2) prs(" ax, ");

.dovar1217:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1218
 push dovar1_11
 call prs
 add  sp, 2

;-612   if(wi==4) prs(" eax, ");

.dovar1218:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1219
 push dovar1_12
 call prs
 add  sp, 2

;-613   v(id1);

.dovar1219:
 push word [bp+10]
 call v
 add  sp, 2

;-614 }


;-615 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-616   if (istoken(T_CONST)) { prnl(); prs(op);
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm220
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-617     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm221
 push rterm_0
 call prs
 add  sp, 2

;-618     if (wi==2) prs(" ax, ");

.rterm221:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm222
 push rterm_1
 call prs
 add  sp, 2

;-619     if (wi==4) prs(" eax, ");

.rterm222:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm223
 push rterm_2
 call prs
 add  sp, 2

;-620     prunsign1(lexval); return;}

.rterm223:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp .retnrterm

;-621   mode=typeName(); id1=searchname(); ixarr=0;

.rterm220:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-622   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm224
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-623     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-624     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm225
 push rterm_3
 call error1
 add  sp, 2
.rterm225:

;-625   if (eqstr(symbol,"_AX")) return;

.rterm224:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm226
 jmp .retnrterm

;-626   opint=op; dovar1(mode, opint, ixarr, id1);

.rterm226:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-627 }


;-628 int isreg() {

 .retnrterm: LEAVE
 ret
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0
ENDP

isreg: PROC

;-629   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg227
 push isreg_1
 call doreg
 add  sp, 2
 jmp .r1

;-630   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}

.isreg227:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg228
 push isreg_3
 call doreg
 add  sp, 2
 jmp .r1

;-631   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

.isreg228:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg229
 push isreg_5
 call doreg
 add  sp, 2
 jmp .r1

;-632   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

.isreg229:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg230
 push isreg_7
 call doreg
 add  sp, 2
 jmp .r1

;-633   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

.isreg230:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg231
 push isreg_9
 call doreg
 add  sp, 2
 jmp .r1

;-634   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}

.isreg231:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg232
 push isreg_11
 call doreg
 add  sp, 2
 jmp .r1

;-635   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

.isreg232:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg233
 push isreg_13
 call doreg
 add  sp, 2
 jmp .r1

;-636   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

.isreg233:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg234
 push isreg_15
 call doreg
 add  sp, 2
 jmp .r1

;-637   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}

.isreg234:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg235
 push isreg_17
 call doreg
 add  sp, 2
 jmp .r1

;-638   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

.isreg235:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg236
 push isreg_19
 call doreg
 add  sp, 2
 jmp .r1

;-639   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

.isreg236:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg237
 push isreg_21
 call doreg
 add  sp, 2
 jmp .r1

;-640   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}

.isreg237:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg238
 push isreg_23
 call doreg
 add  sp, 2
 jmp .r1

;-641   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

.isreg238:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg239
 push isreg_25
 call doreg
 add  sp, 2
 jmp .r1

;-642   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

.isreg239:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg240
 push isreg_27
 call doreg
 add  sp, 2
 jmp .r1

;-643   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}

.isreg240:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .isreg241
 push isreg_29
 call doreg
 add  sp, 2
 jmp .r1

;-644   return 0;   r1: return 1;

.isreg241:
 mov ax, 0
 jmp .retnisreg
.r1:
 mov ax, 1
 jmp .retnisreg

;-645 }


;-646 int doreg(char *dr) { int i; expect('=');

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

doreg: PROC;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-647   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-648        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg242
 push word [lexval]
 call prunsign1
 add  sp, 2

;-649   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp .doreg243
.doreg242:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .doreg244
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-650   else error1("only number or var allowed"); }

 jmp .doreg245
.doreg244:
 push doreg_2
 call error1
 add  sp, 2
.doreg245:
.doreg243:

;-651 


;-652 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0
ENDP

doassign: PROC

;-653   gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-654   if (mode==1) {prs("\n mov  bx, ");v(i);

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign246
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-655     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign247
 push doassign_1
 call prs
 add  sp, 2

;-656     else  prs("\n mov  [bx], al"); return;}

 jmp .doassign248
.doassign247:
 push doassign_2
 call prs
 add  sp, 2
.doassign248:
 jmp .retndoassign

;-657   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

.doassign246:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign249
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

;-658   if (ixarr) {  prs("\n mov bx, ");

.doassign249:
 mov ax, [bp+8]
 or  al, al
 je .doassign250
 push doassign_5
 call prs
 add  sp, 2

;-659     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign251
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp .doassign252
.doassign251:
 push word [bp+8]
 call v
 add  sp, 2

;-660     if (wi==2) prs("\n shl bx, 1");

.doassign252:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign253
 push doassign_6
 call prs
 add  sp, 2

;-661     prs("\n mov ["); printName(i);

.doassign253:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-662     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne .doassign254
 push doassign_8
 call prs
 add  sp, 2
 jmp .doassign255
.doassign254:
 push doassign_9
 call prs
 add  sp, 2
.doassign255:
 jmp .retndoassign

;-663   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

.doassign250:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign256
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign257
 push doassign_11
 call prs
 add  sp, 2

;-664     } v(i); prs(", al"); return; }

.doassign257:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp .retndoassign

;-665   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

.doassign256:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign258
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign259
 push doassign_14
 call prs
 add  sp, 2

;-666     } v(i); prs(", ax"); return; }

.doassign259:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp .retndoassign

;-667   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

.doassign258:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign260
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge .doassign261
 push doassign_17
 call prs
 add  sp, 2

;-668     } v(i); prs(", eax"); return; }

.doassign261:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp .retndoassign

;-669 }

.doassign260:

;-670 int domul(int ids) {

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

;-671   if (ids) rterm("imul"); else {
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul262
 push domul_0
 call rterm
 add  sp, 2
 jmp .domul263
.domul262:

;-672   if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul264

;-673     prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx");

 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-674     }


;-675   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp .domul265
.domul264:
 push domul_3
 call error1
 add  sp, 2
.domul265:
.domul263:

;-676 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC

;-677   if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv266

;-678     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-679     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv267
 push doidiv_1
 call prs
 add  sp, 2
 jmp .doidiv268
.doidiv267:
 push doidiv_2
 call prs
 add  sp, 2
.doidiv268:

;-680   else {

 jmp .doidiv269
.doidiv266:

;-681     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-682     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv270
 push doidiv_3
 call error1
 add  sp, 2

;-683     gettypes(id1);

.doidiv270:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-684     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv271
 push doidiv_4
 call error1
 add  sp, 2

;-685     if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv271:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv272
 push doidiv_5
 call error1
 add  sp, 2

;-686     prs("\n mov bx, "); v(id1);

.doidiv272:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-687     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je .doidiv273
 push doidiv_7
 call prs
 add  sp, 2
 jmp .doidiv274
.doidiv273:
 push doidiv_8
 call prs
 add  sp, 2
.doidiv274:

;-688 }

.doidiv269:

;-689 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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

;-690 


;-691 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 55845
docalltype resw 10
section .text
section .bss
absolute 55865
docallvalue resw 10
section .text

;-692 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 55885
procname resb 17
section .text

;-693 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1: PROC

;-694   narg=0;  sz32=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-695   checknamelen();

 call checknamelen

;-696   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-697   storeCall1();

 call storeCall1

;-698   expect('(');

 push 40
 call expect
 add  sp, 2

;-699 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1275

;-700 	  do { narg++;

.docall1276:
 inc  word[bp-4]

;-701 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1277
 push docall1_0
 call error1
 add  sp, 2
.docall1277:
 mov ax, 0
 mov [bp-6], ax

;-702       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1278
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-703       if(istoken(T_STRING)){t0=2; n0=nconst;

.docall1278:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1279
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-704         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-705         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-706       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

.docall1279:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1280
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-707       if(istoken(T_NAME))  { n0=checkreg();

.docall1280:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1281
 call checkreg
 mov [bp-8], ax

;-708         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1282
 mov ax, 5
 mov [bp-6], ax

;-709         else {t0=4; n0=searchname();

 jmp .docall1283
.docall1282:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-710           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1284
 mov ax, 3
 mov [bp-6], ax
.docall1284:
.docall1283:

;-711       if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1281:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1285
 push docall1_4
 call error1
 add  sp, 2

;-712       docalltype [narg] = t0;

.docall1285:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-713       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-714     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1286
 jmp .docall1276
.docall1286:

;-715 


;-716   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-717     do {

.docall1287:

;-718       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-719       n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-720       if(t0==1){ prs("\n push "); prunsign1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1288
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call prunsign1
 add  sp, 2

;-721       if(t0==2){ prs("\n push ");

.docall1288:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1289
 push docall1_6
 call prs
 add  sp, 2

;-722         prs(fname);prc(95);prunsign1(n0);}

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

;-723       if(t0==3){ prs("\n lea  ax, ");   v(n0);

.docall1289:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1290
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-724         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-725       if(t0==4){ gettypes(n0);

.docall1290:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1291
 push word [bp-8]
 call gettypes
 add  sp, 2

;-726         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne .docall1292
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-727         else { prs("\n mov al, byte ");   v(n0);

 jmp .docall1293
.docall1292:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-728         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
.docall1293:

;-729       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

.docall1291:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1294
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1295
 mov ax, [bp-10]
 add ax, 2
.docall1295:

;-730    i--; } while (i > 0);  }

.docall1294:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1296
 jmp .docall1287
.docall1296:

;-731 	 prs("\n call "); prs(&procname);

.docall1275:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-732 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1297
 push docall1_14
 call prs
 add  sp, 2

;-733      narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call prunsign1
 add  sp, 2
.docall1297:

;-734 /***************************************************************/


;-735 


;-736 int doemit() {prs("\n db ");
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

doemit: PROC
 push doemit_0
 call prs
 add  sp, 2

;-737   L1: token=getlex(); prunsign1(lexval); token=getlex();

.L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-738     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne .doemit298
 push 44
 call prc
 add  sp, 2
 jmp .L1
.doemit298:
 push 41
 call expect
 add  sp, 2

;-739 


;-740 int cmpneg(int ids) {

 ret
doemit_0 db "\n db ",0
ENDP

cmpneg: PROC

;-741        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg299
 push cmpneg_0
 call prs
 add  sp, 2

;-742   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg300
.cmpneg299:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg301
 push cmpneg_1
 call prs
 add  sp, 2

;-743   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg302
.cmpneg301:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg303
 mov ax, [bp+4]
 or  al, al
 je .cmpneg304
 push cmpneg_2
 call prs
 add  sp, 2

;-744                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg305
.cmpneg304:
 push cmpneg_3
 call prs
 add  sp, 2

;-745   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg305:
 jmp .cmpneg306
.cmpneg303:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg307
 mov ax, [bp+4]
 or  al, al
 je .cmpneg308
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-746                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-747                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg309
.cmpneg308:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-748                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-749   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg309:
 jmp .cmpneg310
.cmpneg307:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg311
 push cmpneg_8
 call prs
 add  sp, 2

;-750   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg312
.cmpneg311:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg313
 push cmpneg_9
 call prs
 add  sp, 2

;-751   else error1("internal error compare unknown in CMPNEG()");  }

 jmp .cmpneg314
.cmpneg313:
 push cmpneg_10
 call error1
 add  sp, 2
.cmpneg314:
.cmpneg312:
.cmpneg310:
.cmpneg306:
.cmpneg302:
.cmpneg300:

;-752 


;-753 int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
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

prlabel: PROC;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-754 int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-755 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

doif: PROC;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-756   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-757   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .doif315
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-758     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

 push word [bp-4]
 call prjump
 add  sp, 2
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt
 push word [bp-4]
 call prlabel
 add  sp, 2

;-759   else prlabel(jdest); }

 jmp .doif316
.doif315:
 push word [bp-2]
 call prlabel
 add  sp, 2
.doif316:

;-760 


;-761 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
ENDP

dodo: PROC

;-762   nlabel++; jdest=nlabel; prlabel(jdest); stmt();
;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-763   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

 push 515
 call expect
 add  sp, 2
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2

;-764   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-765 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
ENDP

dowhile: PROC;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-766   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

 push word [bp-2]
 call prlabel
 add  sp, 2
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2

;-767   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-768 int isrelational() {
 LEAVE
 ret
ENDP

isrelational: PROC

;-769   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational317
 jmp .w
.isrelational317:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational318
 jmp .w

;-770   if (token==T_LE) goto w; if (token==T_GE) goto w;

.isrelational318:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational319
 jmp .w
.isrelational319:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational320
 jmp .w

;-771   if (token=='<' ) goto w; if (token=='>' ) goto w;

.isrelational320:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational321
 jmp .w
.isrelational321:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational322
 jmp .w

;-772   return 0;  w: iscmp=token; token=getlex(); return 1;}

.isrelational322:
 mov ax, 0
 jmp .retnisrelational
.w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp .retnisrelational

;-773 


;-774 char symboltemp[80];

 .retnisrelational:
 ret
ENDP
section .bss
absolute 55902
symboltemp resb 80
section .text

;-775 int getlex() { char c; char *p;


getlex: PROC

;-776 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
;
 ENTER  4,0
.g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne .getlex323
 mov ax, 0
 jmp .retngetlex
.getlex323:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex324
 jmp .g1

;-777   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

.getlex324:
 mov al, [bp-2]
 cmp al, 61
 jne .getlex325
 mov al, [thechar]
 cmp al, 61
 jne .getlex326
 call next
 mov ax, 806
 jmp .retngetlex
.getlex326:

;-778   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

.getlex325:
 mov al, [bp-2]
 cmp al, 33
 jne .getlex327
 mov al, [thechar]
 cmp al, 61
 jne .getlex328
 call next
 mov ax, 807
 jmp .retngetlex
.getlex328:

;-779   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

.getlex327:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex329
 mov al, [thechar]
 cmp al, 61
 jne .getlex330
 call next
 mov ax, 824
 jmp .retngetlex
.getlex330:

;-780   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

.getlex329:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex331
 mov al, [thechar]
 cmp al, 61
 jne .getlex332
 call next
 mov ax, 811
 jmp .retngetlex
.getlex332:

;-781   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

.getlex331:
 mov al, [bp-2]
 cmp al, 60
 jne .getlex333
 mov al, [thechar]
 cmp al, 60
 jne .getlex334
 call next
 mov ax, 1240
 jmp .retngetlex
.getlex334:

;-782   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

.getlex333:
 mov al, [bp-2]
 cmp al, 62
 jne .getlex335
 mov al, [thechar]
 cmp al, 62
 jne .getlex336
 call next
 mov ax, 1241
 jmp .retngetlex
.getlex336:

;-783   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

.getlex335:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex337
 mov al, [thechar]
 cmp al, 43
 jne .getlex338
 call next
 mov ax, 1219
 jmp .retngetlex
.getlex338:

;-784   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

.getlex337:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex339
 mov al, [thechar]
 cmp al, 45
 jne .getlex340
 call next
 mov ax, 1225
 jmp .retngetlex
.getlex340:

;-785   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

.getlex339:
 mov al, [bp-2]
 cmp al, 43
 jne .getlex341
 mov al, [thechar]
 cmp al, 61
 jne .getlex342
 call next
 mov ax, 1230
 jmp .retngetlex
.getlex342:

;-786   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

.getlex341:
 mov al, [bp-2]
 cmp al, 45
 jne .getlex343
 mov al, [thechar]
 cmp al, 61
 jne .getlex344
 call next
 mov ax, 1231
 jmp .retngetlex
.getlex344:

;-787   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

.getlex343:
 mov al, [bp-2]
 cmp al, 38
 jne .getlex345
 mov al, [thechar]
 cmp al, 61
 jne .getlex346
 call next
 mov ax, 1234
 jmp .retngetlex
.getlex346:

;-788   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

.getlex345:
 mov al, [bp-2]
 cmp al, 124
 jne .getlex347
 mov al, [thechar]
 cmp al, 61
 jne .getlex348
 call next
 mov ax, 1235
 jmp .retngetlex
.getlex348:

;-789   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

.getlex347:
 mov al, [bp-2]
 cmp al, 42
 jne .getlex349
 mov al, [thechar]
 cmp al, 61
 jne .getlex350
 call next
 mov ax, 1232
 jmp .retngetlex
.getlex350:

;-790   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

.getlex349:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex351
 mov al, [thechar]
 cmp al, 61
 jne .getlex352
 call next
 mov ax, 1233
 jmp .retngetlex
.getlex352:

;-791   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

.getlex351:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je .getlex353
 mov al, [bp-2]
 jmp .retngetlex

;-792   if (c == '/') { if (thechar == '/') {

.getlex353:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex354
 mov al, [thechar]
 cmp al, 47
 jne .getlex355

;-793       do c=next(); while(ifEOL(c)==0) return getlex(); } }

.getlex356:
 call next
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call ifEOL
 add  sp, 2
 cmp al, 0
 jne .getlex357
 jmp .getlex356
.getlex357:
 call getlex
 jmp .retngetlex
.getlex355:

;-794   if (c == '/') { if (thechar == '*') {

.getlex354:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex358
 mov al, [thechar]
 cmp al, 42
 jne .getlex359

;-795       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

.g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  .getlex360
 jmp .g2
.getlex360:
 mov al, [thechar]
 cmp al, 47
 je  .getlex361
 jmp .g2

;-796       c=next(); return getlex(); } else  return '/'; }

.getlex361:
 call next
 mov [bp-2], al
 call getlex
 jmp .retngetlex
 jmp .getlex362
.getlex359:
 mov ax, 47
 jmp .retngetlex
.getlex362:

;-797   if (c == '"') {getstring(c); return T_STRING;}

.getlex358:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex363
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp .retngetlex

;-798   if (digit(c)) { getdigit(c); return T_CONST; }

.getlex363:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex364
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp .retngetlex

;-799   if (c==39) { lexval=next();

.getlex364:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex365
 call next
 mov word [lexval], ax

;-800     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex366
 call next
 mov word [lexval], ax

;-801       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex367
 mov ax, 10
 mov word [lexval], ax
.getlex367:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex368
 mov ax, 9
 mov word [lexval], ax

;-802       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

.getlex368:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex369
 mov ax, 0
 mov word [lexval], ax
.getlex369:
.getlex366:
 call next
 mov ax, 257
 jmp .retngetlex

;-803   if (alnum(c)) {

.getlex365:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex370

;-804     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-805     while(alnum(thechar)) {c=next(); *p=c;  p++; }

.getlex371:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex372
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-806       *p=0;

 jmp .getlex371
.getlex372:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-807     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex373
 mov ax, 531
 jmp .retngetlex

;-808     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

.getlex373:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex374
 mov ax, 532
 jmp .retngetlex

;-809     if (eqstr(symbol,"void"    )) return T_VOID;

.getlex374:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex375
 mov ax, 529
 jmp .retngetlex

;-810     if (eqstr(symbol,"int"     )) return T_INT;

.getlex375:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex376
 mov ax, 517
 jmp .retngetlex

;-811     if (eqstr(symbol,"long"    )) return T_LONG;

.getlex376:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex377
 mov ax, 533
 jmp .retngetlex

;-812     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex377:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex378
 mov ax, 530
 jmp .retngetlex

;-813     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex378:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex379
 mov ax, 518
 jmp .retngetlex

;-814     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

.getlex379:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex380
 mov ax, 519
 jmp .retngetlex

;-815     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex380:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex381
 mov ax, 520
 jmp .retngetlex

;-816     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex381:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex382
 mov ax, 512
 jmp .retngetlex

;-817     if (eqstr(symbol,"if"      )) return T_IF;

.getlex382:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex383
 mov ax, 513
 jmp .retngetlex

;-818     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex383:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex384
 mov ax, 514
 jmp .retngetlex

;-819     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex384:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex385
 mov ax, 515
 jmp .retngetlex

;-820     if (eqstr(symbol,"do"      )) return T_DO;

.getlex385:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex386
 mov ax, 516
 jmp .retngetlex

;-821     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex386:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex387
 mov ax, 521
 jmp .retngetlex

;-822     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex387:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex388
 mov ax, 511
 jmp .retngetlex

;-823     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

.getlex388:
 call convertdefine
 or  al, al
 je .getlex389
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp .retngetlex

;-824     return T_NAME; } error1("Input item not recognized"); }

.getlex389:
 mov ax, 256
 jmp .retngetlex
.getlex370:
 push getlex_17
 call error1
 add  sp, 2

;-825 


;-826 int convertdefine() { int i; int j;   i=0;

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

convertdefine: PROC;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-827   while (i < GTop) {

.convertdefine390:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .convertdefine391

;-828    j=adrofname(i);

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-829    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .convertdefine392
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne .convertdefine393
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-830    return T_CONST; } }

 mov ax, 257
 jmp .retnconvertdefine
.convertdefine393:

;-831    i++; }

.convertdefine392:
 inc  word[bp-2]

;-832    return 0; }

 jmp .convertdefine390
.convertdefine391:
 mov ax, 0
 jmp .retnconvertdefine

;-833 


;-834 int getdigit(char c) { int i;

 .retnconvertdefine: LEAVE
 ret
ENDP

getdigit: PROC

;-835     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-836     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne .getdigit394
 mov ax, 88
 mov byte [thechar], al
.getdigit394:
 mov al, [thechar]
 cmp al, 88
 jne .getdigit395
 call next

;-837       while(alnum(thechar)) { c=next(); if(c>96) c=c-39;

.getdigit396:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getdigit397
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle .getdigit398
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-838 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

.getdigit398:
 mov al, [bp+4]
 cmp al, 64
 jle .getdigit399
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
.getdigit399:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-839      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-840     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10;

 jmp .getdigit396
.getdigit397:
 jmp .getdigit400
.getdigit395:
.getdigit401:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getdigit402
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-841      i=0; i=c; lexval=lexval+i; } }

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp .getdigit401
.getdigit402:

;-842 }

.getdigit400:

;-843 


;-844 int stmt() { int c; char cha;
 LEAVE
 ret
ENDP

stmt: PROC

;-845        if(istoken('{'))     {while(istoken('}')==0) stmt();}
;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt403
.stmt404:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt405
 call stmt
 jmp .stmt404
.stmt405:

;-846   else if(istoken(T_IF))    doif();

 jmp .stmt406
.stmt403:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt407
 call doif

;-847   else if(istoken(T_DO))    dodo();

 jmp .stmt408
.stmt407:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt409
 call dodo

;-848   else if(istoken(T_WHILE)) dowhile();

 jmp .stmt410
.stmt409:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt411
 call dowhile

;-849   else if(istoken(T_GOTO))  {

 jmp .stmt412
.stmt411:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt413

;-850     prs("\n jmp .");name1();prs(symbol);expect(';');}

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

;-851   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp .stmt414
.stmt413:
 mov ax, [token]
 cmp ax, 518
 jne .stmt415
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-852         while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

.stmt416:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt417
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp .stmt416
.stmt417:
 call getlex
 mov word [token], ax

;-853   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();

 jmp .stmt418
.stmt415:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je .stmt419
 mov ax, [token]
 cmp ax, 123
 jne .stmt420
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-854         while(cha!= '}') { prc(cha); cha=next(); }

.stmt421:
 mov al, [bp-4]
 cmp al, 125
 je  .stmt422
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-855         token=getlex(); }

 jmp .stmt421
.stmt422:
 call getlex
 mov word [token], ax

;-856         else error1("Curly open expected");

 jmp .stmt423
.stmt420:
 push stmt_3
 call error1
 add  sp, 2

;-857         }

.stmt423:

;-858   else if(istoken(T_EMIT))   doemit();

 jmp .stmt424
.stmt419:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt425
 call doemit

;-859   else if(istoken(';'))      { }

 jmp .stmt426
.stmt425:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt427

;-860   else if(istoken(T_RETURN)) {

 jmp .stmt428
.stmt427:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt429

;-861         if (token!=';') expr(0);

 mov ax, [token]
 cmp ax, 59
 je  .stmt430
 push 0
 call expr
 add  sp, 2

;-862         prs("\n jmp .retn");

.stmt430:
 push stmt_4
 call prs
 add  sp, 2

;-863         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-864         nreturn++;

 inc  word[nreturn]

;-865         expect(';');

 push 59
 call expect
 add  sp, 2

;-866         }


;-867   else if(thechar==':')      {

 jmp .stmt431
.stmt429:
 mov al, [thechar]
 cmp al, 58
 jne .stmt432

;-868         prs("\n."); // Label

 push stmt_5
 call prs
 add  sp, 2

;-869         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-870         expect(T_NAME);

 push 256
 call expect
 add  sp, 2

;-871         expect(':');

 push 58
 call expect
 add  sp, 2

;-872         }


;-873   else  {expr(0);; expect(';'); }

 jmp .stmt433
.stmt432:
 push 0
 call expr
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-874 }

.stmt433:
.stmt431:
.stmt428:
.stmt426:
.stmt424:
.stmt418:
.stmt414:
.stmt412:
.stmt410:
.stmt408:
.stmt406:

;-875 


;-876 int getstring(int delim) {
 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n jmp .retn",0
stmt_5 db "\n.",0
ENDP

getstring: PROC

;-877     int c; char *p;


;-878     p=&symbol;
;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax

;-879     c=next();

 call next
 mov [bp-2], ax

;-880     while (c != delim) {

.getstring434:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  .getstring435

;-881         *p=c;

 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al

;-882         p++;

 inc  word[bp-4]

;-883         c=next();

 call next
 mov [bp-2], ax

;-884     }


;-885     *p=0;

 jmp .getstring434
.getstring435:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-886 }


;-887 


;-888 


;-889 int dofunc() { int nloc; int i; int narg;
 LEAVE
 ret
ENDP

dofunc: PROC

;-890   cloc=&co;
;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-891   checknamelen();

 call checknamelen

;-892   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-893   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je .dofunc436
 push dofunc_0
 call error1
 add  sp, 2

;-894   storefunc();

.dofunc436:
 call storefunc

;-895   prs("\n\n"); prs(symbol); prs(": PROC");

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

;-896   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-897   if (istoken(')')==0) { narg=2;

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc437
 mov ax, 2
 mov [bp-6], ax

;-898     do { typeName();  addlocal(); narg+=2;

.dofunc438:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-899          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

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

;-900     while (istoken(','));  expect(')'); }

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

;-901 


;-902   expect('{'); /*body*/

.dofunc437:
 push 123
 call expect
 add  sp, 2

;-903   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-904   while(isvariable()) {

.dofunc441:
 call isvariable
 or  al, al
 je .dofunc442

;-905     do {typeName();

.dofunc443:
 call typeName

;-906         checknamelen();

 call checknamelen

;-907         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-908         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc444
 sub  word[bp-2], 2

;-909         GData[LTop]=nloc;

.dofunc444:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-910         if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc445

;-911             istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

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

;-912             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-913             }


;-914         LTop++;

.dofunc445:
 inc  word[LTop]

;-915       } while (istoken(',')); expect(';'); }

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

;-916   if (LTop>LSTART){prs(";\n ENTER  ");

 jmp .dofunc441
.dofunc442:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc447
 push dofunc_3
 call prs
 add  sp, 2

;-917     nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }

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

;-918   while(istoken('}')==0)   stmt();

.dofunc447:
.dofunc448:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc449
 call stmt

;-919   if (nreturn) {

 jmp .dofunc448
.dofunc449:
 mov ax, [nreturn]
 or  al, al
 je .dofunc450

;-920         prs("\n .retn");

 push dofunc_5
 call prs
 add  sp, 2

;-921         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-922         prc(':');

 push 58
 call prc
 add  sp, 2

;-923         }


;-924   if (LTop > LSTART) prs(" LEAVE");

.dofunc450:
 mov ax, [LTop]
 cmp ax, 200
 jle .dofunc451
 push dofunc_6
 call prs
 add  sp, 2

;-925   prs("\n ret");

.dofunc451:
 push dofunc_7
 call prs
 add  sp, 2

;-926   *cloc=0; prs(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2

;-927   maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-928   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

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

;-929   prs("\nENDP");

.dofunc452:
 push dofunc_8
 call prs
 add  sp, 2

;-930 }


;-931 


;-932 char doglobName[IDLENMAX];
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
absolute 55982
doglobName resb 15
section .text

;-933 int doglob() {


doglob: PROC

;-934     int i; int j; int isstrarr; isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-935   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .doglob453
 push doglob_0
 call error1
 add  sp, 2

;-936   if (iswidth == 0) error1("no VOID as var type");

.doglob453:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob454
 push doglob_1
 call error1
 add  sp, 2

;-937   checknamelen();

.doglob454:
 call checknamelen

;-938   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob455
 push doglob_2
 call error1
 add  sp, 2

;-939   if (istoken('[')) { istype='&';

.doglob455:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob456
 mov ax, 38
 mov byte [istype], al

;-940     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob457

;-941       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-942       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-943       prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-944       if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob458
 push doglob_5
 call prs
 add  sp, 2

;-945       if (iswidth==2) prs(" resw ");

.doglob458:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob459
 push doglob_6
 call prs
 add  sp, 2

;-946       if (iswidth==4) prs(" resd ");

.doglob459:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob460
 push doglob_7
 call prs
 add  sp, 2

;-947       prunsign1(lexval);

.doglob460:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-948       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-949       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-950       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob461
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-951       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

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

;-952       GData[GTop]=lexval; expect(']');

.doglob462:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-953     }else { expect(']');

 jmp .doglob463
.doglob457:
 push 93
 call expect
 add  sp, 2

;-954       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob464
 push doglob_9
 call error1
 add  sp, 2

;-955       prs("\n"); prs(symbol); prs(" db ");

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

;-956       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-957       expect('=');

 push 61
 call expect
 add  sp, 2

;-958       if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob465

;-959         prc(34); prscomment(symbol); prc(34); prs(",0");

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

;-960         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-961       else if (istoken('{' )) { i=0;

 jmp .doglob466
.doglob465:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob467
 mov ax, 0
 mov [bp-2], ax

;-962         do { if(i) prc(',');

.doglob468:
 mov ax, [bp-2]
 or  al, al
 je .doglob469
 push 44
 call prc
 add  sp, 2

;-963           expect(T_CONST); prunsign1(lexval); i=1; }

.doglob469:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-964         while (istoken(',')); expect('}'); }

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

;-965       else error1("String or number array expected");

 jmp .doglob471
.doglob467:
 push doglob_13
 call error1
 add  sp, 2

;-966       };

.doglob471:
.doglob466:
.doglob463:

;-967   }else { //expect('=');

 jmp .doglob472
.doglob456:

;-968     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

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

;-969     else {

 jmp .doglob474
.doglob473:

;-970       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob475
 push doglob_16
 call prs
 add  sp, 2

;-971       else if (iswidth==2) prs(" dw ");

 jmp .doglob476
.doglob475:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob477
 push doglob_17
 call prs
 add  sp, 2

;-972       else                 prs(" dd ");

 jmp .doglob478
.doglob477:
 push doglob_18
 call prs
 add  sp, 2

;-973     }

.doglob478:
.doglob476:

;-974     if(istoken('-')) prc('-');

.doglob474:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob479
 push 45
 call prc
 add  sp, 2

;-975     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

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

;-976     else prunsign1(0); }

 jmp .doglob481
.doglob480:
 push 0
 call prunsign1
 add  sp, 2
.doglob481:

;-977   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

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

;-978   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-979   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-980   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

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

;-981   GTop++; expect(';'); }

.doglob483:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-982 


;-983 int end1(int n) {
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

end1: PROC

;-984     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2

;-985     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2

;-986     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2

;-987 }


;-988 


;-989 unsigned int MAXUI=65535;
 LEAVE
 ret
ENDP
MAXUI dw 65535

;-990 int epilog() {


epilog: PROC

;-991     unsigned int i;


;-992     prs("\n;Input: "); prs(&namein);
;
 ENTER  2,0
 push epilog_0
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-993     prs(", List: ");   prs(&namelst);

 push epilog_1
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-994     prs(",  Lines:"); printint51(lineno);

 push epilog_2
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-995     prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_3
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-996     prs(" max.:"); printint51(LSTART);

 push epilog_4
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-997     prs("\n;Functions      :"); printint51(FTop);

 push epilog_5
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-998     prs(" max.:"); printint51(FUNCMAX);

 push epilog_6
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-999     prs("\n;Calls          :"); printint51(CTop);

 push epilog_7
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-1000     prs(" max.:"); printint51(CALLMAX);

 push epilog_8
 call prs
 add  sp, 2
 push 1500
 call printint51
 add  sp, 2

;-1001     i = CNamePtr - &CNameField;

 mov ax, [CNamePtr]
 sub ax, CNameField
 mov [bp-2], ax

;-1002     prs("\n;NameField      :"); printint51(i);

 push epilog_9
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-1003     prs(" max.:"); printint51(CNAMEMAX);

 push epilog_10
 call prs
 add  sp, 2
 push 10000
 call printint51
 add  sp, 2

;-1004     prs("\n;Const in '"); prs(coname); prs("' :"); printint51(maxco);

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

;-1005     prs(" max.:"); printint51(COMAX);

 push epilog_13
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-1006     i=COMAX; i=i-maxco;

 mov ax, 2000
 mov [bp-2], ax
 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax

;-1007     if (i <= 1000)prs(" *** Warning *** constant area too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog484
 push epilog_14
 call prs
 add  sp, 2

;-1008     prs(", stacksize: ");

.epilog484:
 push epilog_15
 call prs
 add  sp, 2

;-1009     i=MAXUI-orgData; printint51(i);

 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-1010     if (i <= 1000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 1000
 ja  .epilog485
 push epilog_16
 call prs
 add  sp, 2

;-1011   end1(0);}

.epilog485:
 push 0
 call end1
 add  sp, 2

;-1012 


;-1013 int dodefine() {
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
 je .dodefine486

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

.dodefine486:
 push 256
 call expect
 add  sp, 2

;-1022     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine487

;-1023         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  .dodefine488
 push dodefine_1
 call error1
 add  sp, 2

;-1024         i=strlen(symbol);

.dodefine488:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-1025         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine489
 push dodefine_2
 call error1
 add  sp, 2

;-1026         GSign [GTop]='U';

.dodefine489:
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

;-1029         GAdr [GTop]=lineno-1;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax

;-1030         GUsed [GTop]=0;

 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-1031         pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-1032         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-1033         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-1034         expect(T_CONST);

 push 257
 call expect
 add  sp, 2

;-1035         GTop++;

 inc  word[GTop]

;-1036     }


;-1037 }

.dodefine487:

;-1038 


;-1039 int parse() {

 .retndodefine: LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC

;-1040     CNamePtr = &CNameField;

 mov ax, CNameField
 mov word [CNamePtr], ax

;-1041     token=getlex();

 call getlex
 mov word [token], ax

;-1042     do {

.parse490:

;-1043         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse491
 mov ax, 1
 jmp .retnparse

;-1044         if (istoken('#')) {

.parse491:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse492

;-1045              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse493
 call dodefine

;-1046              else error1("define expected");

 jmp .parse494
.parse493:
 push parse_0
 call error1
 add  sp, 2

;-1047         }

.parse494:

;-1048     else{

 jmp .parse495
.parse492:

;-1049         typeName();

 call typeName

;-1050         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse496
 call dofunc

;-1051         else doglob(); }

 jmp .parse497
.parse496:
 call doglob
.parse497:

;-1052     } while(1);

.parse495:
 mov ax, 1
 or  al, al
 je .parse498
 jmp .parse490
.parse498:

;-1053 }


;-1054 


;-1055 int getfirstchar() {

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP

getfirstchar: PROC

;-1056     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax

;-1057     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-1058     thechar=fgets1();

 call fgets1
 mov byte [thechar], al

;-1059     }


;-1060 


;-1061 char *arglen=0x80; char *argv=0x82;

 ret
ENDP
arglen dw 128
argv dw 130

;-1062 int getarg() {


getarg: PROC

;-1063     int arglen1; int i; char *c;


;-1064     arglen1=*arglen;
;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-1065     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .getarg499

;-1066         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2

;-1067         cputs(" Usage: A.COM in_file[.C]: ");

 push getarg_0
 call cputs
 add  sp, 2

;-1068         exitR(3);

 push 3
 call exitR
 add  sp, 2

;-1069         }


;-1070     i=arglen1+129;

.getarg499:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax

;-1071     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-1072     arglen1--;

 dec  word[bp-2]

;-1073     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2

;-1074     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-1075     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

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

;-1076     strcpy(namelst, namein);

.getarg500:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4

;-1077     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax

;-1078     i--;

 dec  word[bp-4]

;-1079     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax

;-1080     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-1081 


;-1082     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-1083     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg501

;-1084         cputs("Source file missing (.C): ");

 push getarg_2
 call cputs
 add  sp, 2

;-1085         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2

;-1086         exitR(1);

 push 1
 call exitR
 add  sp, 2

;-1087         }


;-1088     fdout=creatR(namelst);

.getarg501:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-1089     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .getarg502

;-1090         cputs("list file not creatable: ");

 push getarg_3
 call cputs
 add  sp, 2

;-1091         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2

;-1092         exitR(2);

 push 2
 call exitR
 add  sp, 2

;-1093         }


;-1094     prs("\n; ");

.getarg502:
 push getarg_4
 call prs
 add  sp, 2

;-1095     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-1096     prs(", Source: "); prs(namein);

 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-1097     prs(", Output asm: "); prs(namelst);

 push getarg_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-1098     prs("\norg  256 \njmp main");

 push getarg_7
 call prs
 add  sp, 2

;-1099 }


;-1100 


;-1101 int main() {
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

;-1102     getarg();

 call getarg

;-1103     CNameTop=0;

 mov ax, 0
 mov word [CNameTop], ax

;-1104     coname=0;

 mov ax, 0
 mov byte [coname], al

;-1105     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax

;-1106     getfirstchar();

 call getfirstchar

;-1107     parse();

 call parse

;-1108   epilog();

 call epilog

;-1109 }

 ret
ENDP
;Input: A.C, List: A.S,  Lines: 1110
;Glob. variables:  118 max.:  200
;Functions      :   91 max.:  300
;Calls          :  786 max.: 1500
;NameField      : 4999 max.:10000
;Const in 'checkreg' :  712 max.: 2000, stacksize:  9538