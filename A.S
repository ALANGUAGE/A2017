;PLA compiler A.COM V0.9.5, Input: A.C, Output: A.S
org  256 
jmp main
;-1 char Version1[]="PLA compiler A.COM V0.9.5";//todo: 2. op=reg not recognize

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

;-15 #define T_EMIT        520

;-16 #define T_GOTO        521

;-17 #define T_VOID        529

;-18 #define T_CHAR        530

;-19 #define T_SIGNED      531

;-20 #define T_UNSIGNED    532

;-21 #define T_LONG        533

;-22 #define T_EQ          806

;-23 #define T_NE          807

;-24 #define T_GE          811

;-25 #define T_LE          824

;-26 #define T_PLUSPLUS   1219

;-27 #define T_MINUSMINUS 1225

;-28 #define T_PLUSASS    1230

;-29 #define T_MINUSASS   1231

;-30 #define T_MULASS     1232

;-31 #define T_DIVASS     1233

;-32 #define T_ANDASS     1234

;-33 #define T_ORASS      1235

;-34 #define T_LESSLESS   1240

;-35 #define T_GREATGREAT 1241

;-36 

;-37 char isPrint=1;//set screen listing

isPrint db 1
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
;-58 int nlabel=0;‚

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

;-65 #define LSTART        300//max global var

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

LTop dw 300
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
;-86 

;-87 

;-88 int writetty()     {//ah=0x0E; bx=0; __emit__(0xCD,0x10);


writetty: PROC
;-89 asm mov ah, 14

 mov ah, 14
;-90 asm mov bx, 0

 mov bx, 0
;-91 asm int 16

 int 16
;-92 }

;-93 int putch(char c)  {

 ret
ENDP

putch: PROC
;-94     if (c==10)  {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-95         asm mov al, 13

 mov al, 13
;-96         writetty();

 call writetty
;-97     }

;-98     asm mov al, [bp+4]; parameter c

.putch1:
 mov al, [bp+4]; parameter c
;-99     writetty();

 call writetty
;-100 }

;-101 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-102     char c;

;-103     while(*s) {
;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
;-104         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-105         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-106         s++;

 inc  word[bp+4]
;-107     }

;-108 }

 jmp .cputs2
.cputs3:
;-109 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-110     asm mov ax, [bp+4]; parameter n
;
 ENTER  0,0
 mov ax, [bp+4]; parameter n
;-111     asm neg ax

 neg ax
;-112 }

;-113 

;-114 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-115     asm int 33; 21h

 int 33; 21h
;-116     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-117     DOS_ERR++;

 inc  word[DOS_ERR]
;-118 }

;-119 int openR (char *s) {

 ret
ENDP

openR: PROC
;-120     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-121     asm mov ax, 15618; ax=0x3D02;

 mov ax, 15618; ax=0x3D02;
;-122     DosInt();

 call DosInt
;-123 }

;-124 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-125     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-126     asm mov cx, 0

 mov cx, 0
;-127     asm mov ax, 15360; ax=0x3C00;

 mov ax, 15360; ax=0x3C00;
;-128     DosInt();

 call DosInt
;-129 }

;-130 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-131     asm mov bx, [bp+4]; bx=fd;
;
 ENTER  0,0
 mov bx, [bp+4]; bx=fd;
;-132     asm mov ax, 15872; ax=0x3E00;

 mov ax, 15872; ax=0x3E00;
;-133     DosInt();

 call DosInt
;-134 }

;-135 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-136     asm mov ah, 76; ah=0x4C;
;
 ENTER  0,0
 mov ah, 76; ah=0x4C;
;-137     asm mov al, [bp+4]; al=c;

 mov al, [bp+4]; al=c;
;-138     DosInt();

 call DosInt
;-139 }

;-140 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-141     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-142     asm mov cx, [bp+8]; cx=len;

 mov cx, [bp+8]; cx=len;
;-143     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-144     asm mov ax, 16128;  ax=0x3F00;

 mov ax, 16128;  ax=0x3F00;
;-145     DosInt();

 call DosInt
;-146 }

;-147 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-148     asm lea dx, [bp+4]; *n  todo: why not mov ?????
;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov ?????
;-149     asm mov cx, 1;      cx=1;

 mov cx, 1;      cx=1;
;-150     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-151     asm mov ax, 16384;  ax=0x4000;

 mov ax, 16384;  ax=0x4000;
;-152     DosInt();

 call DosInt
;-153 }

;-154 

;-155 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-156       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-157       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-158       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-159       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-160       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-161       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-162       if (c> 'Z') { if (c< 'a') return 0; }

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
;-163       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-164 }

;-165 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-166       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-167       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-168       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-169 }

;-170 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-171     if (digit (c)) return 1;
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
;-172     if (letter(c)) return 1;

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
;-173     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-174 }

;-175 

;-176 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-177     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-178     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-179     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-180 }

;-181 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-182     do { *s=*t; s++; t++; }
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
;-183     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-184     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-185     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-186 }

;-187 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-188     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21
;-189         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-190         p++;

.eqstr22:
 inc  word[bp+4]
;-191         q++;

 inc  word[bp+6]
;-192     }

;-193     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-194     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-195 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-196     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]
;-197     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-198 }

;-199 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-200     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27
;-201         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-202         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-203     }

;-204 }

 jmp .toupper26
.toupper27:
;-205 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-206     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131
;-207         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-208         s++;

.instr132:
 inc  word[bp+4]
;-209     }

;-210     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-211 }

;-212 

;-213 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-214     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-215     cloc++;

 inc  word[cloc]
;-216 }

;-217 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-218     char c;

;-219     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34
;-220         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-221         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-222         s++;

 inc  word[bp+4]
;-223     }

;-224 }

 jmp .eprs33
.eprs34:
;-225 

;-226 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-227     if (isPrint) {
;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-228         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-229             asm mov ax, 13

 mov ax, 13
;-230             writetty();

 call writetty
;-231         }

;-232         asm mov al, [bp+4]; al=c;

.prc36:
 mov al, [bp+4]; al=c;
;-233         writetty();

 call writetty
;-234     }

;-235     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-236 }

;-237 

;-238 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-239     unsigned char c;

;-240     while(*s){
;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38
;-241         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-242         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-243         s++;

 inc  word[bp+4]
;-244     }

;-245 }

 jmp .prscomment37
.prscomment38:
;-246 

;-247 int prs(unsigned char *s) {

 LEAVE
 ret
ENDP

prs: PROC
;-248     unsigned char c; int com;

;-249     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-250     while(*s) {

.prs39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs40
;-251         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-252         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs41
 mov ax, [bp-4]
 or  al, al
 je .prs42
 mov ax, 0
 mov [bp-4], ax
;-253                    else com=1;

 jmp .prs43
.prs42:
 mov ax, 1
 mov [bp-4], ax
;-254         if (c==92) {

.prs43:
.prs41:
 mov al, [bp-2]
 cmp al, 92
 jne .prs44
;-255             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs45
;-256                 s++;

 inc  word[bp+4]
;-257                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-258                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs46
 mov ax, 10
 mov [bp-2], al
;-259                 if (c=='t') c= 9;

.prs46:
 mov al, [bp-2]
 cmp al, 116
 jne .prs47
 mov ax, 9
 mov [bp-2], al
;-260             }

.prs47:
;-261         }

.prs45:
;-262         prc(c);

.prs44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-263         s++;

 inc  word[bp+4]
;-264     }

;-265 }

 jmp .prs39
.prs40:
;-266 

;-267 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-268     int e;

;-269     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-270         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-271         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-272     }

;-273     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-274         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-275         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-276     }

;-277     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-278     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-279     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-280 }

;-281 

;-282 int pint1 (int n){

 LEAVE
 ret
ENDP

pint1: PROC
;-283     int e;

;-284     if(n<0) {  prc('-');  n=mkneg(n); }
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
;-285     if (n >= 10) {

.pint150:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint151
;-286         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-287         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2
;-288     }

;-289     n=n%10;

.pint151:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-290     n += '0';

 add  word[bp+4], 48
;-291     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-292 }

;-293 

;-294 int prunsign1(unsigned int n) {

 LEAVE
 ret
ENDP

prunsign1: PROC
;-295     unsigned int e;

;-296     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign152
;-297         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-298         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-299     }

;-300     n = n % 10; /*unsigned mod*/

.prunsign152:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-301     n += '0';

 add  word[bp+4], 48
;-302     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-303 }

;-304 

;-305 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-306     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-307     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-308     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-309 }

;-310 

;-311 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-312     isPrint=1;
;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-313     lineno--;

 dec  word[lineno]
;-314     prs("\n ");

 push error1_0
 call prs
 add  sp, 2
;-315     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-316     prs(";Line: ");

 push error1_1
 call prs
 add  sp, 2
;-317     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-318     prs(" ************** ERROR: ");

 push error1_2
 call prs
 add  sp, 2
;-319     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2
;-320     prs("  in column: ");

 push error1_3
 call prs
 add  sp, 2
;-321     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2
;-322     prs("\nToken: ");

 push error1_4
 call prs
 add  sp, 2
;-323     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2
;-324     prs(", symbol: ");

 push error1_5
 call prs
 add  sp, 2
;-325     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-326     end1(1);

 push 1
 call end1
 add  sp, 2
;-327 }

;-328 

;-329 int printinputline() {

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
;-330     int col;

;-331     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-332     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-333     do {

.printinputline53:
;-334         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-335         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-336         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-337         fgetsp++;

 inc  word[fgetsp]
;-338         col++;

 inc  word[bp-2]
;-339         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-340         }

.printinputline55:
;-341         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-342     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-343         prs("\n;-");

 push printinputline_1
 call prs
 add  sp, 2
;-344         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-345         prc(' ');

 push 32
 call prc
 add  sp, 2
;-346         lineno++;

 inc  word[lineno]
;-347         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-348 }

;-349 

;-350 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-351     char c;

;-352     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-353     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-354         printinputline();

 call printinputline
;-355         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-356         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-357         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-358         column=0;

 mov ax, 0
 mov word [column], ax
;-359     }

;-360     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-361     column++;

 inc  word[column]
;-362     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-363 }

;-364 

;-365 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-366     char r;

;-367     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-368     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-369     return r;

 mov al, [bp-2]
 jmp .retnnext
;-370 }

;-371 

;-372 int adrF(char *s, unsigned int i) {

 .retnnext:
 LEAVE
 ret
ENDP

adrF: PROC
;-373     i << 4;//*16; IDLENMAX=15!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4
;-374     asm add ax, [bp+4]  ; offset s

 add ax, [bp+4]  ; offset s
;-375 }

;-376 

;-377 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-378     int j;

;-379     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName59
;-380         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-381         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2
;-382     }

;-383     else {

 jmp .printName60
.printName59:
;-384         prs("[bp");

 push printName_0
 call prs
 add  sp, 2
;-385         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-386         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2
;-387         pint1(j);

.printName61:
 push word [bp-2]
 call pint1
 add  sp, 2
;-388         prc(']');

 push 93
 call prc
 add  sp, 2
;-389     }

;-390 }

.printName60:
;-391 

;-392 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-393     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL
;-394     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63
;-395         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al
;-396         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL
;-397     }

;-398     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL
;-399 }

;-400 

;-401 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 41657
symboltemp resb 80
section .text
;-402 

;-403 int getlex() {


getlex: PROC
;-404     char c; char *p;

;-405     int i; int j;

;-406 g1: c=next();
;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-407     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex
;-408     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1
;-409   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-410   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-411   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-412   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-413   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-414   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-415   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-416   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-417   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-418   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-419   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-420   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-421   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-422   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-423   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-424   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96
;-425       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97
;-426           do c=next();

.getlex98:
 call next
 mov [bp-2], al
;-427           while(ifEOL(c)==0) return getlex();

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
;-428       }

;-429   }

.getlex97:
;-430   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-431       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101
;-432           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-433           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2
;-434           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2
;-435           c=next();

.getlex103:
 call next
 mov [bp-2], al
;-436           return getlex();

 call getlex
 jmp .retngetlex
;-437       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex
;-438   }

.getlex104:
;-439   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105
;-440       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-441       c=next();

 call next
 mov [bp-2], al
;-442       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107
;-443           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-444           p++;

 inc  word[bp-4]
;-445           c=next();

 call next
 mov [bp-2], al
;-446           }

;-447           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-448       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-449   }

;-450   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108
;-451       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-452       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-453       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al
;-454       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110
;-455           next();

 call next
;-456           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112
;-457               c=next();

 call next
 mov [bp-2], al
;-458               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-459       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-460                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-461                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-462                i=0;

 mov ax, 0
 mov [bp-6], ax
;-463                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-464                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-465            }

;-466        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:
;-467            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-468                c=next();

 call next
 mov [bp-2], al
;-469                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-470                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-471                i=0;

 mov ax, 0
 mov [bp-6], ax
;-472                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-473                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-474            }

;-475        }

 jmp .getlex116
.getlex117:
;-476       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex
;-477   }

;-478   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118
;-479       lexval=next();

 call next
 mov word [lexval], ax
;-480       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119
;-481           lexval=next();

 call next
 mov word [lexval], ax
;-482           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax
;-483           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax
;-484           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax
;-485       }

.getlex122:
;-486       next();

.getlex119:
 call next
;-487       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-488   }

;-489   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-490     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-491     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-492     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-493     p++;

 inc  word[bp-4]
;-494     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125
;-495         c=next();

 call next
 mov [bp-2], al
;-496         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-497         p++;

 inc  word[bp-4]
;-498     }

;-499     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-500     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex
;-501     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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
;-502     if (eqstr(symbol,"void"    )) return T_VOID;

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
;-503     if (eqstr(symbol,"int"     )) return T_INT;

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
;-504     if (eqstr(symbol,"long"    )) return T_LONG;

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
;-505     if (eqstr(symbol,"char"    )) return T_CHAR;

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
;-506     if (eqstr(symbol,"asm"     )) return T_ASM;

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
;-507     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex132:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 520
 jmp .retngetlex
;-508     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex133:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 512
 jmp .retngetlex
;-509     if (eqstr(symbol,"if"      )) return T_IF;

.getlex134:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 513
 jmp .retngetlex
;-510     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex135:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 514
 jmp .retngetlex
;-511     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex136:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 515
 jmp .retngetlex
;-512     if (eqstr(symbol,"do"      )) return T_DO;

.getlex137:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 516
 jmp .retngetlex
;-513     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex138:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 521
 jmp .retngetlex
;-514     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex139:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex140
 mov ax, 511
 jmp .retngetlex
;-515 

;-516     i=0;//convert define to value

.getlex140:
 mov ax, 0
 mov [bp-6], ax
;-517     while (i < GTop) {

.getlex141:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex142
;-518         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-519         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
;-520             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex144
;-521                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-522                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
;-523                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-524             }

;-525         }

.getlex144:
;-526         i++;

.getlex143:
 inc  word[bp-6]
;-527     }

;-528     return T_NAME; } error1("Input item not recognized");

 jmp .getlex141
.getlex142:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_16
 call error1
 add  sp, 2
;-529 }

;-530 

;-531 int istoken(int t) {

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
getlex_8 db "__emit__",0
getlex_9 db "return",0
getlex_10 db "if",0
getlex_11 db "else",0
getlex_12 db "while",0
getlex_13 db "do",0
getlex_14 db "goto",0
getlex_15 db "define",0
getlex_16 db "Input item not recognized",0
ENDP

istoken: PROC
;-532     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken145
;-533         token=getlex();

 call getlex
 mov word [token], ax
;-534         return 1;

 mov ax, 1
 jmp .retnistoken
;-535     }

;-536     return 0;

.istoken145:
 mov ax, 0
 jmp .retnistoken
;-537 }

;-538 

;-539 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-540     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect146
;-541         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-542         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-543         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2
;-544         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2
;-545         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-546     }

;-547 }

.expect146:
;-548 

;-549 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-550     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .v147
 push 91
 call prc
 add  sp, 2
;-551     printName(i);

.v147:
 push word [bp+4]
 call printName
 add  sp, 2
;-552     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v148
 push 93
 call prc
 add  sp, 2
;-553 }

.v148:
;-554 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-555     int i;

;-556     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-557     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen149
 push checknamelen_0
 call error1
 add  sp, 2
;-558 }

.checknamelen149:
;-559 

;-560 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

checkName: PROC
;-561     unsigned int i; unsigned int j;

;-562     i=LSTART;
;
 ENTER  4,0
 mov ax, 300
 mov [bp-2], ax
;-563     while(i<LTop) {

.checkName150:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName151
;-564         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-565         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName152
 mov ax, [bp-2]
 jmp .retncheckName
;-566         i++;

.checkName152:
 inc  word[bp-2]
;-567     }

;-568     i=1;

 jmp .checkName150
.checkName151:
 mov ax, 1
 mov [bp-2], ax
;-569     while(i<GTop) {

.checkName153:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName154
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
 je .checkName155
 mov ax, [bp-2]
 jmp .retncheckName
;-572         i++;

.checkName155:
 inc  word[bp-2]
;-573     }

;-574     return 0;

 jmp .checkName153
.checkName154:
 mov ax, 0
 jmp .retncheckName
;-575 }

;-576 

;-577 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-578     unsigned int i;

;-579     i=checkName();
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-580     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname156
 push searchname_0
 call error1
 add  sp, 2
;-581     return i;

.searchname156:
 mov ax, [bp-2]
 jmp .retnsearchname
;-582 }

;-583 

;-584 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-585     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1157
 push name1_0
 call error1
 add  sp, 2
;-586     token=getlex();

.name1157:
 call getlex
 mov word [token], ax
;-587 }

;-588 

;-589 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-590     int m; //0=V,1=*,2=&

;-591     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-592     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName158
 mov ax, 83
 mov byte [issign], al
;-593     if(istoken(T_UNSIGNED)) issign='U';

.typeName158:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName159
 mov ax, 85
 mov byte [issign], al
;-594     iswidth=2;

.typeName159:
 mov ax, 2
 mov byte [iswidth], al
;-595     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 0
 mov byte [iswidth], al
;-596     if(istoken(T_CHAR))     iswidth=1;

.typeName160:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 1
 mov byte [iswidth], al
;-597     if(istoken(T_INT))      iswidth=2;

.typeName161:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 2
 mov byte [iswidth], al
;-598     if(istoken(T_LONG))     iswidth=4;

.typeName162:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 4
 mov byte [iswidth], al
;-599     istype='V';

.typeName163:
 mov ax, 86
 mov byte [istype], al
;-600     m=0;

 mov ax, 0
 mov [bp-2], ax
;-601     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-602     if(istoken('&'))  {istype='&'; m=2;}

.typeName164:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName165
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-603     name1();

.typeName165:
 call name1
;-604     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-605 }

;-606 

;-607 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-608     char c;

;-609     c=GSign [i];
;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-610     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes166
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes167
.gettypes166:
 mov ax, 0
 mov word [signi], ax
;-611     c=GWidth[i];

.gettypes167:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-612     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-613     wi=0;

 mov ax, 0
 mov word [wi], ax
;-614     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes168
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-615     if (c==2) {widthi=2;wi=2;}

.gettypes168:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes169
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-616     if (c==4) {widthi=4;wi=4;}

.gettypes169:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes170
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-617     c=GType [i];

.gettypes170:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-618     typei=0;

 mov ax, 0
 mov word [typei], ax
;-619     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes171
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-620     if (c=='&')  typei=2;

.gettypes171:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes172
 mov ax, 2
 mov word [typei], ax
;-621     return i;

.gettypes172:
 mov ax, [bp+4]
 jmp .retngettypes
;-622 }

;-623 

;-624 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-625     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal173
 push addlocal_0
 call error1
 add  sp, 2
;-626     if (checkName() != 0) error1("Variable already defined");

.addlocal173:
 call checkName
 cmp ax, 0
 je  .addlocal174
 push addlocal_1
 call error1
 add  sp, 2
;-627     GSign[LTop]=issign;

.addlocal174:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-628     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-629     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-630     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-631     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-632 }

;-633 

;-634 

;-635 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-636        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg175
 push cmpneg_0
 call prs
 add  sp, 2
;-637   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg176
.cmpneg175:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg177
 push cmpneg_1
 call prs
 add  sp, 2
;-638   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg178
.cmpneg177:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg179
 mov ax, [bp+4]
 or  al, al
 je .cmpneg180
 push cmpneg_2
 call prs
 add  sp, 2
;-639                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg181
.cmpneg180:
 push cmpneg_3
 call prs
 add  sp, 2
;-640   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg181:
 jmp .cmpneg182
.cmpneg179:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg183
 mov ax, [bp+4]
 or  al, al
 je .cmpneg184
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-641                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2
;-642                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg185
.cmpneg184:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-643                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2
;-644   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg185:
 jmp .cmpneg186
.cmpneg183:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg187
 push cmpneg_8
 call prs
 add  sp, 2
;-645   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg188
.cmpneg187:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg189
 push cmpneg_9
 call prs
 add  sp, 2
;-646   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg190
.cmpneg189:
 push cmpneg_10
 call error1
 add  sp, 2
;-647 }

.cmpneg190:
.cmpneg188:
.cmpneg186:
.cmpneg182:
.cmpneg178:
.cmpneg176:
;-648 

;-649 int isrelational() {

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
;-650     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational191
 jmp .w
;-651     if (token==T_NE) goto w;

.isrelational191:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational192
 jmp .w
;-652     if (token==T_LE) goto w;

.isrelational192:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational193
 jmp .w
;-653     if (token==T_GE) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational194
 jmp .w
;-654     if (token=='<' ) goto w;

.isrelational194:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational195
 jmp .w
;-655     if (token=='>' ) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational196
 jmp .w
;-656     return 0;

.isrelational196:
 mov ax, 0
 jmp .retnisrelational
;-657 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-658     token=getlex();

 call getlex
 mov word [token], ax
;-659     return 1;

 mov ax, 1
 jmp .retnisrelational
;-660 }

;-661 

;-662 int compoundass(char *op, int mode, int id1) {

 .retnisrelational:
 ret
ENDP

compoundass: PROC
;-663     if(mode) error1("only scalar variable allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass197
 push compoundass_0
 call error1
 add  sp, 2
;-664     prs("\n ");

.compoundass197:
 push compoundass_1
 call prs
 add  sp, 2
;-665     prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-666     prs("  ");

 push compoundass_2
 call prs
 add  sp, 2
;-667     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-668     if (wi==2) prs("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass198
 push compoundass_3
 call prs
 add  sp, 2
;-669         else prs("byte");

 jmp .compoundass199
.compoundass198:
 push compoundass_4
 call prs
 add  sp, 2
;-670     v(id1);

.compoundass199:
 push word [bp+8]
 call v
 add  sp, 2
;-671     prs(", ");

 push compoundass_5
 call prs
 add  sp, 2
;-672     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-673     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-674 }

;-675 

;-676 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-677     gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-678     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1200
;-679         prs("\n mov bx, ");

 push dovar1_0
 call prs
 add  sp, 2
;-680         v(id1); prs("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call prs
 add  sp, 2
;-681         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-682         if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1201
 push dovar1_2
 call prs
 add  sp, 2
;-683         if(widthi == 2) prs(" ax, [bx]");

.dovar1201:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1202
 push dovar1_3
 call prs
 add  sp, 2
;-684         return;

.dovar1202:
 jmp .retndovar1
;-685         }

;-686     if (mode==2){// & = adr

.dovar1200:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1203
;-687         prs("\n ");

 push dovar1_4
 call prs
 add  sp, 2
;-688         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-689         prs(" ax, ");

 push dovar1_5
 call prs
 add  sp, 2
;-690         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-691         return;

 jmp .retndovar1
;-692         }

;-693     if (ixarr) {//array

.dovar1203:
 mov ax, [bp+8]
 or  al, al
 je .dovar1204
;-694         prs("\n mov bx, ");

 push dovar1_6
 call prs
 add  sp, 2
;-695         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-696         if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1205
 push dovar1_7
 call prs
 add  sp, 2
;-697         prs("\n ");

.dovar1205:
 push dovar1_8
 call prs
 add  sp, 2
;-698         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-699         if (wi==2) prs(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1206
 push dovar1_9
 call prs
 add  sp, 2
;-700             else prs(" al, ");

 jmp .dovar1207
.dovar1206:
 push dovar1_10
 call prs
 add  sp, 2
;-701         prc('[');

.dovar1207:
 push 91
 call prc
 add  sp, 2
;-702         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-703         prs(" + bx]");

 push dovar1_11
 call prs
 add  sp, 2
;-704         return;

 jmp .retndovar1
;-705         }

;-706     prs("\n ");

.dovar1204:
 push dovar1_12
 call prs
 add  sp, 2
;-707     prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-708     if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1208
 push dovar1_13
 call prs
 add  sp, 2
;-709     if(wi==2) prs(" ax, ");

.dovar1208:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1209
 push dovar1_14
 call prs
 add  sp, 2
;-710     if(wi==4) prs(" eax, ");

.dovar1209:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1210
 push dovar1_15
 call prs
 add  sp, 2
;-711     v(id1);

.dovar1210:
 push word [bp+10]
 call v
 add  sp, 2
;-712 }

;-713 

;-714 int rterm(char *op) {

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
;-715     int mode; int opint; int ixarr; int id1;

;-716     if (istoken(T_CONST)) {
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm211
;-717         prs("\n ");

 push rterm_0
 call prs
 add  sp, 2
;-718         prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-719         if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm212
 push rterm_1
 call prs
 add  sp, 2
;-720         if (wi==2) prs(" ax, ");

.rterm212:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm213
 push rterm_2
 call prs
 add  sp, 2
;-721         if (wi==4) prs(" eax, ");

.rterm213:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm214
 push rterm_3
 call prs
 add  sp, 2
;-722         prunsign1(lexval);

.rterm214:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-723         return;

 jmp .retnrterm
;-724         }

;-725     mode=typeName();

.rterm211:
 call typeName
 mov [bp-2], ax
;-726     id1=searchname();

 call searchname
 mov [bp-8], ax
;-727     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-728     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm215
;-729         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-730         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-731         expect(']');

 push 93
 call expect
 add  sp, 2
;-732         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-733         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm216
 push rterm_4
 call error1
 add  sp, 2
;-734         }

.rterm216:
;-735     if (eqstr(symbol,"ax")) return;

.rterm215:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm217
 jmp .retnrterm
;-736     opint=op;

.rterm217:
 mov ax, [bp+4]
 mov [bp-4], ax
;-737     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-738 }

;-739 

;-740 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-741     gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-742     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign218
;-743         prs("\n mov  bx, ");

 push doassign_0
 call prs
 add  sp, 2
;-744         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-745         if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign219
 push doassign_1
 call prs
 add  sp, 2
;-746             else  prs("\n mov  [bx], al");

 jmp .doassign220
.doassign219:
 push doassign_2
 call prs
 add  sp, 2
;-747         return;

.doassign220:
 jmp .retndoassign
;-748         }

;-749     if (mode==2) {// & = adr

.doassign218:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign221
;-750         prs("\n mov  ");

 push doassign_3
 call prs
 add  sp, 2
;-751         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-752         prs(", ax");

 push doassign_4
 call prs
 add  sp, 2
;-753         return;

 jmp .retndoassign
;-754         }

;-755     if (ixarr) {

.doassign221:
 mov ax, [bp+8]
 or  al, al
 je .doassign222
;-756         prs("\n mov bx, ");

 push doassign_5
 call prs
 add  sp, 2
;-757         if(ixconst) prunsign1(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign223
 push word [bp+8]
 call prunsign1
 add  sp, 2
;-758             else v(ixarr);

 jmp .doassign224
.doassign223:
 push word [bp+8]
 call v
 add  sp, 2
;-759         if (wi==2) prs("\n shl bx, 1");

.doassign224:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign225
 push doassign_6
 call prs
 add  sp, 2
;-760         prs("\n mov [");

.doassign225:
 push doassign_7
 call prs
 add  sp, 2
;-761         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-762         if (wi==2) prs("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign226
 push doassign_8
 call prs
 add  sp, 2
;-763             else prs("+bx], al");

 jmp .doassign227
.doassign226:
 push doassign_9
 call prs
 add  sp, 2
;-764         return;

.doassign227:
 jmp .retndoassign
;-765         }

;-766     if (wi==1){

.doassign222:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign228
;-767         prs("\n mov ");

 push doassign_10
 call prs
 add  sp, 2
;-768         if(i<LSTART) prs("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign229
 push doassign_11
 call prs
 add  sp, 2
;-769         v(i);

.doassign229:
 push word [bp+6]
 call v
 add  sp, 2
;-770         prs(", al");

 push doassign_12
 call prs
 add  sp, 2
;-771         return;

 jmp .retndoassign
;-772         }

;-773     if (wi==2){

.doassign228:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign230
;-774         prs("\n mov ");

 push doassign_13
 call prs
 add  sp, 2
;-775         if(i<LSTART) prs("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign231
 push doassign_14
 call prs
 add  sp, 2
;-776         v(i);

.doassign231:
 push word [bp+6]
 call v
 add  sp, 2
;-777         prs(", ax");

 push doassign_15
 call prs
 add  sp, 2
;-778         return;

 jmp .retndoassign
;-779         }

;-780     if (wi==4){

.doassign230:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign232
;-781         prs("\n mov ");

 push doassign_16
 call prs
 add  sp, 2
;-782         if(i<LSTART) prs("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign233
 push doassign_17
 call prs
 add  sp, 2
;-783         v(i);

.doassign233:
 push word [bp+6]
 call v
 add  sp, 2
;-784         prs(", eax");

 push doassign_18
 call prs
 add  sp, 2
;-785         return;

 jmp .retndoassign
;-786         }

;-787 }

.doassign232:
;-788 

;-789 int domul(int ids) {

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
;-790     if (ids) rterm("imul");
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul234
 push domul_0
 call rterm
 add  sp, 2
;-791         else {

 jmp .domul235
.domul234:
;-792         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul236
;-793             prs("\n mov bx, ");

 push domul_1
 call prs
 add  sp, 2
;-794             prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-795             prs("\n mul bx");

 push domul_2
 call prs
 add  sp, 2
;-796             }

;-797         else error1("with MUL only const number as multiplicator allowed");

 jmp .domul237
.domul236:
 push domul_3
 call error1
 add  sp, 2
;-798         }

.domul237:
;-799 }

.domul235:
;-800 

;-801 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC
;-802     int mode; int id1;

;-803     if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv238
;-804         prs("\n mov bx, ");

 push doidiv_0
 call prs
 add  sp, 2
;-805         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-806         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv239
 push doidiv_1
 call prs
 add  sp, 2
;-807             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv240
.doidiv239:
 push doidiv_2
 call prs
 add  sp, 2
;-808         }

.doidiv240:
;-809     else {

 jmp .doidiv241
.doidiv238:
;-810         mode=typeName();

 call typeName
 mov [bp-2], ax
;-811         id1=searchname();

 call searchname
 mov [bp-4], ax
;-812         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv242
 push doidiv_3
 call error1
 add  sp, 2
;-813         gettypes(id1);

.doidiv242:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-814         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv243
 push doidiv_4
 call error1
 add  sp, 2
;-815         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv243:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv244
 push doidiv_5
 call error1
 add  sp, 2
;-816         prs("\n mov bx, ");

.doidiv244:
 push doidiv_6
 call prs
 add  sp, 2
;-817         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-818         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv245
 push doidiv_7
 call prs
 add  sp, 2
;-819             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv246
.doidiv245:
 push doidiv_8
 call prs
 add  sp, 2
;-820     }

.doidiv246:
;-821 }

.doidiv241:
;-822 

;-823 int domod(int ids) {

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
;-824     doidiv(ids);
;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-825     prs("\n mov ax, dx");

 push domod_0
 call prs
 add  sp, 2
;-826 }

;-827 

;-828 

;-829 int docalltype[10]; int docallvalue[10];

 LEAVE
 ret
domod_0 db "\n mov ax, dx",0
ENDP
section .bss
absolute 41737
docalltype resw 10
section .text
section .bss
absolute 41757
docallvalue resw 10
section .text
;-830 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 41777
procname resb 17
section .text
;-831 

;-832 int docall1() {


docall1: PROC
;-833     int i; int narg; int t0; int n0;  int sz32;

;-834     narg=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-835     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-836     checknamelen();

 call checknamelen
;-837     strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-838     expect('(');

 push 40
 call expect
 add  sp, 2
;-839 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1247
;-840 	    do {

.docall1248:
;-841 	        narg++;

 inc  word[bp-4]
;-842 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1249
 push docall1_0
 call error1
 add  sp, 2
;-843 	        t0=0;

.docall1249:
 mov ax, 0
 mov [bp-6], ax
;-844             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1250
;-845                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-846                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-847                 }

;-848             if(istoken(T_STRING)){

.docall1250:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1251
;-849                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-850                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-851                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-852                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-853                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-854                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-855                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-856                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-857                 eprs(symbol);

 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
;-858                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-859                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-860                 nconst++;

 inc  word[nconst]
;-861                 }

;-862             if(istoken('&'))     {

.docall1251:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1252
;-863                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-864                 name1();

 call name1
;-865                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-866                 }

;-867             if(istoken(T_NAME))  {

.docall1252:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1253
;-868 

;-869 

;-870 

;-871                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-872                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-873                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-874                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-875                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1254
 mov ax, 3
 mov [bp-6], ax
;-876 

;-877                 }

.docall1254:
;-878             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1253:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1255
 push docall1_4
 call error1
 add  sp, 2
;-879             docalltype [narg] = t0;

.docall1255:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-880             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-881         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1256
 jmp .docall1248
.docall1256:
;-882 

;-883   	expect(')');

 push 41
 call expect
 add  sp, 2
;-884   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-885     do {

.docall1257:
;-886         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-887         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-888         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1258
;-889             prs("\n push ");

 push docall1_5
 call prs
 add  sp, 2
;-890             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-891             }

;-892         if(t0==2){

.docall1258:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1259
;-893             prs("\n push ");

 push docall1_6
 call prs
 add  sp, 2
;-894             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-895             prc(95);

 push 95
 call prc
 add  sp, 2
;-896             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-897             }

;-898         if(t0==3){

.docall1259:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1260
;-899             prs("\n lea  ax, ");

 push docall1_7
 call prs
 add  sp, 2
;-900             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-901             prs("\n push ax");

 push docall1_8
 call prs
 add  sp, 2
;-902             }

;-903         if(t0==4){

.docall1260:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1261
;-904             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-905             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1262
;-906                 prs("\n push word ");

 push docall1_9
 call prs
 add  sp, 2
;-907                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-908                 }

;-909             else {

 jmp .docall1263
.docall1262:
;-910                 prs("\n mov al, byte ");

 push docall1_10
 call prs
 add  sp, 2
;-911                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-912                 prs("\n mov ah, 0\n push ax");

 push docall1_11
 call prs
 add  sp, 2
;-913                 }

;-914             }

.docall1263:
;-915         i--;

.docall1261:
 dec  word[bp-2]
;-916         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1264
 jmp .docall1257
.docall1264:
;-917     }

;-918 	prs("\n call ");

.docall1247:
 push docall1_12
 call prs
 add  sp, 2
;-919 	prs(&procname);

 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2
;-920 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1265
;-921 	    prs("\n add  sp, ");

 push docall1_13
 call prs
 add  sp, 2
;-922         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-923         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-924         prunsign1(narg);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-925         }

;-926 }

.docall1265:
;-927 

;-928 

;-929 int expr() {

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
docall1_12 db "\n call ",0
docall1_13 db "\n add  sp, ",0
ENDP

expr: PROC
;-930     int mode;   int id1;

;-931     int ixarr;  int ixconst;

;-932     int ids;    int isCONST;

;-933     int i;      unsigned char *p;

;-934 

;-935     if (istoken(T_CONST)) {// constant ;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr266
;-936         prs("\n mov ax, ");

 push expr_0
 call prs
 add  sp, 2
;-937         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-938         return 4;

 mov ax, 4
 jmp .retnexpr
;-939         }

;-940     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr266:
 call typeName
 mov [bp-2], ax
;-941     if (token=='(')  {

 mov ax, [token]
 cmp ax, 40
 jne .expr267
;-942         docall1();

 call docall1
;-943         goto e1;

 jmp .e1
;-944         }

;-945 

;-946     id1=searchname();

.expr267:
 call searchname
 mov [bp-4], ax
;-947     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-948     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-949     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-950     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-951     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr268
;-952         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr269
;-953             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-954             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-955             expect(']');

 push 93
 call expect
 add  sp, 2
;-956             }

;-957         else {

 jmp .expr270
.expr269:
;-958             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-959             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-960             expect(']');

 push 93
 call expect
 add  sp, 2
;-961             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-962             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr271
 push expr_1
 call error1
 add  sp, 2
;-963             }

.expr271:
;-964         }

.expr270:
;-965     if (istoken(T_PLUSPLUS  )) {

.expr268:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr272
;-966         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr273
 push expr_2
 call error1
 add  sp, 2
;-967         prs("\n inc  ");

.expr273:
 push expr_3
 call prs
 add  sp, 2
;-968         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr274
 push expr_4
 call prs
 add  sp, 2
 jmp .expr275
.expr274:
 push expr_5
 call prs
 add  sp, 2
;-969         v(id1);

.expr275:
 push word [bp-4]
 call v
 add  sp, 2
;-970         goto e1;

 jmp .e1
;-971         }

;-972     if (istoken(T_MINUSMINUS)) {

.expr272:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr276
;-973         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr277
 push expr_6
 call error1
 add  sp, 2
;-974         prs("\n dec  ");

.expr277:
 push expr_7
 call prs
 add  sp, 2
;-975         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr278
 push expr_8
 call prs
 add  sp, 2
 jmp .expr279
.expr278:
 push expr_9
 call prs
 add  sp, 2
;-976         v(id1);

.expr279:
 push word [bp-4]
 call v
 add  sp, 2
;-977         goto e1;

 jmp .e1
;-978         }

;-979 

;-980     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr276:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr280
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1
;-981     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr280:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr281
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1
;-982     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr281:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr282
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1
;-983     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr282:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr283
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-984     if (istoken(T_MULASS  )) error1("not implemented");

.expr283:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr284
 push expr_14
 call error1
 add  sp, 2
;-985     if (istoken(T_DIVASS  )) error1("not implemented");

.expr284:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr285
 push expr_15
 call error1
 add  sp, 2
;-986 

;-987     if (istoken('=')) {

.expr285:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr286
;-988         expr();

 call expr
;-989         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-990         goto e1;

 jmp .e1
;-991         }

;-992     dovar1(mode, "mov", ixarr, id1);

.expr286:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-993 

;-994 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr287
 push expr_17
 call rterm
 add  sp, 2
;-995     else if (istoken('-')) rterm("sub");

 jmp .expr288
.expr287:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr289
 push expr_18
 call rterm
 add  sp, 2
;-996     else if (istoken('&')) rterm("and");

 jmp .expr290
.expr289:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr291
 push expr_19
 call rterm
 add  sp, 2
;-997     else if (istoken('|')) rterm("or" );

 jmp .expr292
.expr291:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr293
 push expr_20
 call rterm
 add  sp, 2
;-998     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr294
.expr293:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr295
 push expr_21
 call rterm
 add  sp, 2
;-999     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr296
.expr295:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr297
 push expr_22
 call rterm
 add  sp, 2
;-1000     else if (istoken('*')) domul (ids);

 jmp .expr298
.expr297:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr299
 push word [bp-10]
 call domul
 add  sp, 2
;-1001     else if (istoken('/')) doidiv(ids);

 jmp .expr300
.expr299:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr301
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1002     else if (istoken('%')) domod (ids);

 jmp .expr302
.expr301:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr303
 push word [bp-10]
 call domod
 add  sp, 2
;-1003     if (isrelational()) {

.expr303:
.expr302:
.expr300:
.expr298:
.expr296:
.expr294:
.expr292:
.expr290:
.expr288:
 call isrelational
 or  al, al
 je .expr304
;-1004         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1005         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1006         }

;-1007     return 0;

.expr304:
 mov ax, 0
 jmp .retnexpr
;-1008 }

;-1009 

;-1010 int pexpr() {//called from if, do, while

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
;-1011     expect('(');

 push 40
 call expect
 add  sp, 2
;-1012     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1013 

;-1014     expr();

 call expr
;-1015     if (iscmp==0) prs("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr305
 push pexpr_0
 call prs
 add  sp, 2
;-1016     prs(fname);

.pexpr305:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1017     expect(')');

 push 41
 call expect
 add  sp, 2
;-1018 }

;-1019 

;-1020 

;-1021 int prlabel(int n) {

 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1022     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
;-1023     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1024     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1025     prc(':');

 push 58
 call prc
 add  sp, 2
;-1026 }

;-1027 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1028     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
;-1029     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1030     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1031 }

;-1032 

;-1033 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1034     int c; char cha;

;-1035     int jdest; int tst; int jtemp;

;-1036     if(istoken('{')) {
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt306
;-1037         while(istoken('}')==0) stmt();

.stmt307:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt308
 call stmt
;-1038         }

 jmp .stmt307
.stmt308:
;-1039     else if(istoken(T_IF)) {

 jmp .stmt309
.stmt306:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt310
;-1040         pexpr();

 call pexpr
;-1041         nlabel++;

 inc  word[nlabel]
;-1042         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1043         pint1(jdest);

 push word [bp-6]
 call pint1
 add  sp, 2
;-1044         stmt();

 call stmt
;-1045         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt311
;-1046             nlabel++;

 inc  word[nlabel]
;-1047             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1048             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1049             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1050             stmt();

 call stmt
;-1051             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1052         }

;-1053         else prlabel(jdest);

 jmp .stmt312
.stmt311:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1054     }

.stmt312:
;-1055     else if(istoken(T_DO)) {

 jmp .stmt313
.stmt310:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt314
;-1056         nlabel++;

 inc  word[nlabel]
;-1057         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1058         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1059         stmt();

 call stmt
;-1060         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1061         pexpr();

 call pexpr
;-1062         nlabel++;

 inc  word[nlabel]
;-1063         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1064         pint1(jtemp);

 push word [bp-10]
 call pint1
 add  sp, 2
;-1065         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1066          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1067     }

;-1068     else if(istoken(T_WHILE)) {

 jmp .stmt315
.stmt314:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt316
;-1069         nlabel++;

 inc  word[nlabel]
;-1070         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1071         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1072         pexpr();

 call pexpr
;-1073         nlabel++;

 inc  word[nlabel]
;-1074         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1075         pint1(tst);

 push word [bp-8]
 call pint1
 add  sp, 2
;-1076         stmt();

 call stmt
;-1077         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1078         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1079     }

;-1080     else if(istoken(T_GOTO))  {

 jmp .stmt317
.stmt316:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt318
;-1081         prs("\n jmp .");

 push stmt_0
 call prs
 add  sp, 2
;-1082         name1();

 call name1
;-1083         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1084         expect(';');

 push 59
 call expect
 add  sp, 2
;-1085     }

;-1086     else if(token==T_ASM)     {

 jmp .stmt319
.stmt318:
 mov ax, [token]
 cmp ax, 518
 jne .stmt320
;-1087       prs("\n");

 push stmt_1
 call prs
 add  sp, 2
;-1088       c=next();

 call next
 mov [bp-2], ax
;-1089       while(c != '\n') {

.stmt321:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt322
;-1090         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1091         c=next();

 call next
 mov [bp-2], ax
;-1092         };

 jmp .stmt321
.stmt322:
;-1093         token=getlex();

 call getlex
 mov word [token], ax
;-1094     }

;-1095     else if(istoken(T_EMIT)) {

 jmp .stmt323
.stmt320:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt324
;-1096       prs("\n db ");

 push stmt_2
 call prs
 add  sp, 2
;-1097     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1098       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1099       token=getlex();

 call getlex
 mov word [token], ax
;-1100       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt325
;-1101           prc(',');

 push 44
 call prc
 add  sp, 2
;-1102           goto L1;

 jmp .L1
;-1103       }

;-1104       expect(')');

.stmt325:
 push 41
 call expect
 add  sp, 2
;-1105     }

;-1106     else if(istoken(';'))      { }

 jmp .stmt326
.stmt324:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt327
;-1107     else if(istoken(T_RETURN)) {

 jmp .stmt328
.stmt327:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt329
;-1108         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt330
 call expr
;-1109         prs("\n jmp .retn");

.stmt330:
 push stmt_3
 call prs
 add  sp, 2
;-1110         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1111         nreturn++;

 inc  word[nreturn]
;-1112         expect(';');

 push 59
 call expect
 add  sp, 2
;-1113     }

;-1114     else if(thechar==':')      {

 jmp .stmt331
.stmt329:
 mov al, [thechar]
 cmp al, 58
 jne .stmt332
;-1115         prs("\n."); // Label

 push stmt_4
 call prs
 add  sp, 2
;-1116         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1117         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1118         expect(':');

 push 58
 call expect
 add  sp, 2
;-1119     }

;-1120     else  {expr();; expect(';'); }

 jmp .stmt333
.stmt332:
 call expr
 push 59
 call expect
 add  sp, 2
;-1121 }

.stmt333:
.stmt331:
.stmt328:
.stmt326:
.stmt323:
.stmt319:
.stmt317:
.stmt315:
.stmt313:
.stmt309:
;-1122 

;-1123 int isvariable() {

 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n db ",0
stmt_3 db "\n jmp .retn",0
stmt_4 db "\n.",0
ENDP

isvariable: PROC
;-1124     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable334
 jmp .v1
;-1125     if(token==T_UNSIGNED) goto v1;

.isvariable334:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable335
 jmp .v1
;-1126     if(token==T_CHAR)     goto v1;

.isvariable335:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable336
 jmp .v1
;-1127     if(token==T_INT)      goto v1;

.isvariable336:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable337
 jmp .v1
;-1128     if(token==T_LONG)     goto v1;

.isvariable337:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable338
 jmp .v1
;-1129     return 0;

.isvariable338:
 mov ax, 0
 jmp .retnisvariable
;-1130 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1131 }

;-1132 

;-1133 int dofunc() {

 .retnisvariable:
 ret
ENDP

dofunc: PROC
;-1134     int nloc; int i; unsigned int j;int narg;

;-1135     cloc=&co;
;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1136     checknamelen();

 call checknamelen
;-1137     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1138     i=0;

 mov ax, 0
 mov [bp-4], ax
;-1139     while (i < FTop) {

.dofunc339:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc340
;-1140         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax
;-1141         if(eqstr(symbol, j)) error1("Function already defined");

 push word [bp-6]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dofunc341
 push dofunc_0
 call error1
 add  sp, 2
;-1142         i++;

.dofunc341:
 inc  word[bp-4]
;-1143     }

;-1144     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc339
.dofunc340:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc342
 push dofunc_1
 call error1
 add  sp, 2
;-1145     pt=adrF(FNameField, FTop);

.dofunc342:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1146     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1147     FTop++;

 inc  word[FTop]
;-1148     prs("\n\n");

 push dofunc_2
 call prs
 add  sp, 2
;-1149     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1150     prs(": PROC");

 push dofunc_3
 call prs
 add  sp, 2
;-1151     expect('(');

 push 40
 call expect
 add  sp, 2
;-1152     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1153     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc343
;-1154         narg=2;

 mov ax, 2
 mov [bp-8], ax
;-1155         do {

.dofunc344:
;-1156             typeName();

 call typeName
;-1157             addlocal();

 call addlocal
;-1158             narg+=2;

 add  word[bp-8], 2
;-1159             GData[LTop]=narg;

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1160             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc345
 add  word[bp-8], 2
;-1161                 LTop++;

.dofunc345:
 inc  word[LTop]
;-1162                 }

;-1163         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc346
 jmp .dofunc344
.dofunc346:
;-1164         expect(')');

 push 41
 call expect
 add  sp, 2
;-1165         }

;-1166 

;-1167     expect('{'); /*body*/

.dofunc343:
 push 123
 call expect
 add  sp, 2
;-1168     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1169     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1170     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1171     while(isvariable()) {

.dofunc347:
 call isvariable
 or  al, al
 je .dofunc348
;-1172         do {

.dofunc349:
;-1173             typeName();

 call typeName
;-1174             checknamelen();

 call checknamelen
;-1175             addlocal();

 call addlocal
;-1176             nloc-=2;

 sub  word[bp-2], 2
;-1177             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc350
 sub  word[bp-2], 2
;-1178             GData[LTop]=nloc;

.dofunc350:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1179             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc351
;-1180                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1181                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1182                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1183                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1184                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1185                 nloc+=2;

 add  word[bp-2], 2
;-1186                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1187             }

;-1188             LTop++;

.dofunc351:
 inc  word[LTop]
;-1189         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc352
 jmp .dofunc349
.dofunc352:
;-1190         expect(';');

 push 59
 call expect
 add  sp, 2
;-1191     }

;-1192     if (LTop>LSTART){

 jmp .dofunc347
.dofunc348:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc353
;-1193         prs(";\n ENTER  ");

 push dofunc_4
 call prs
 add  sp, 2
;-1194         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1195         prunsign1 (nloc);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1196         prs(",0");

 push dofunc_5
 call prs
 add  sp, 2
;-1197         }

;-1198 

;-1199     while(istoken('}')==0)  stmt();

.dofunc353:
.dofunc354:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc355
 call stmt
;-1200 

;-1201     if (nreturn) {

 jmp .dofunc354
.dofunc355:
 mov ax, [nreturn]
 or  al, al
 je .dofunc356
;-1202             prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2
;-1203             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1204             prc(':');

 push 58
 call prc
 add  sp, 2
;-1205         }

;-1206     if (LTop > LSTART) prs("\n LEAVE");

.dofunc356:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc357
 push dofunc_7
 call prs
 add  sp, 2
;-1207     prs("\n ret");

.dofunc357:
 push dofunc_8
 call prs
 add  sp, 2
;-1208     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1209     prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-1210     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1211     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc358
 mov ax, [maxco1]
 mov word [maxco], ax
;-1212     prs("\nENDP");

.dofunc358:
 push dofunc_9
 call prs
 add  sp, 2
;-1213 }

;-1214 

;-1215 char doglobName[IDLENMAX];

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
absolute 41794
doglobName resb 15
section .text
;-1216 int doglob() {


doglob: PROC
;-1217     int i; int j; int isstrarr;

;-1218     isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1219     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .doglob359
 push doglob_0
 call error1
 add  sp, 2
;-1220     if (iswidth == 0) error1("no VOID as var type");

.doglob359:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob360
 push doglob_1
 call error1
 add  sp, 2
;-1221     checknamelen();

.doglob360:
 call checknamelen
;-1222     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob361
 push doglob_2
 call error1
 add  sp, 2
;-1223     if (istoken('[')) {

.doglob361:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob362
;-1224         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1225         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob363
;-1226             prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2
;-1227             prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2
;-1228             prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1229             if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob364
 push doglob_5
 call prs
 add  sp, 2
;-1230             if (iswidth==2) prs(" resw ");

.doglob364:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob365
 push doglob_6
 call prs
 add  sp, 2
;-1231             if (iswidth==4) prs(" resd ");

.doglob365:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob366
 push doglob_7
 call prs
 add  sp, 2
;-1232             prunsign1(lexval);

.doglob366:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-1233             prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2
;-1234             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1235             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob367
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1236             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob367:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob368
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax
;-1237             GData[GTop]=lexval;

.doglob368:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1238             expect(']');

 push 93
 call expect
 add  sp, 2
;-1239         }else {

 jmp .doglob369
.doglob363:
;-1240             expect(']');

 push 93
 call expect
 add  sp, 2
;-1241             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob370
 push doglob_9
 call error1
 add  sp, 2
;-1242             prs("\n");

.doglob370:
 push doglob_10
 call prs
 add  sp, 2
;-1243             prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1244             prs(" db ");

 push doglob_11
 call prs
 add  sp, 2
;-1245             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1246             strcpy(doglobName, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1247             expect('=');

 push 61
 call expect
 add  sp, 2
;-1248             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob371
;-1249                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1250                 prscomment(symbol);

 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
;-1251                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1252                 prs(",0");

 push doglob_12
 call prs
 add  sp, 2
;-1253                 i=strlen(symbol);

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1254                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1255                 }

;-1256             else if (istoken('{' )) {

 jmp .doglob372
.doglob371:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob373
;-1257                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1258                 do {

.doglob374:
;-1259                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob375
 push 44
 call prc
 add  sp, 2
;-1260                     expect(T_CONST);

.doglob375:
 push 257
 call expect
 add  sp, 2
;-1261                     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1262                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1263                     }

;-1264                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob376
 jmp .doglob374
.doglob376:
;-1265                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1266             }

;-1267         else error1("String or number array expected");

 jmp .doglob377
.doglob373:
 push doglob_13
 call error1
 add  sp, 2
;-1268         };

.doglob377:
.doglob372:
.doglob369:
;-1269     }else { //expect('=');

 jmp .doglob378
.doglob362:
;-1270         prs("\n");

 push doglob_14
 call prs
 add  sp, 2
;-1271         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1272         if (istype=='*') prs(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob379
 push doglob_15
 call prs
 add  sp, 2
;-1273         else {

 jmp .doglob380
.doglob379:
;-1274             if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob381
 push doglob_16
 call prs
 add  sp, 2
;-1275             else if (iswidth==2) prs(" dw ");

 jmp .doglob382
.doglob381:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob383
 push doglob_17
 call prs
 add  sp, 2
;-1276             else                 prs(" dd ");

 jmp .doglob384
.doglob383:
 push doglob_18
 call prs
 add  sp, 2
;-1277         }

.doglob384:
.doglob382:
;-1278     if(istoken('-')) prc('-');

.doglob380:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob385
 push 45
 call prc
 add  sp, 2
;-1279     if (istoken('=')) {

.doglob385:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob386
;-1280         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1281         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1282         }else prunsign1(0);

 jmp .doglob387
.doglob386:
 push 0
 call prunsign1
 add  sp, 2
;-1283     }

.doglob387:
;-1284     GSign[GTop]=issign;

.doglob378:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1285     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1286     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1287     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1288     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob388
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1289         else strcpy(pt, symbol);

 jmp .doglob389
.doglob388:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1290     GTop++;

.doglob389:
 inc  word[GTop]
;-1291     expect(';');

 push 59
 call expect
 add  sp, 2
;-1292 }

;-1293 

;-1294 int dodefine() {

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
;-1295     int i; int j; int fdtemp;

;-1296     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine390
;-1297         token=getlex();

 call getlex
 mov word [token], ax
;-1298         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1299         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1300         return;

 jmp .retndodefine
;-1301     }

;-1302     expect(T_NAME);

.dodefine390:
 push 256
 call expect
 add  sp, 2
;-1303     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine391
;-1304         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine392
 push dodefine_1
 call error1
 add  sp, 2
;-1305         i=strlen(symbol);

.dodefine392:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1306         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine393
 push dodefine_2
 call error1
 add  sp, 2
;-1307         GSign [GTop]='U';

.dodefine393:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1308         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1309         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1310         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1311         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1312         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1313         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1314         GTop++;

 inc  word[GTop]
;-1315     }

;-1316 }

.dodefine391:
;-1317 

;-1318 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC
;-1319     token=getlex();

 call getlex
 mov word [token], ax
;-1320     do {

.parse394:
;-1321         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse395
 mov ax, 1
 jmp .retnparse
;-1322         if (istoken('#')) {

.parse395:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse396
;-1323              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse397
 call dodefine
;-1324              else error1("define expected");

 jmp .parse398
.parse397:
 push parse_0
 call error1
 add  sp, 2
;-1325         }

.parse398:
;-1326     else{

 jmp .parse399
.parse396:
;-1327         typeName();

 call typeName
;-1328         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse400
 call dofunc
;-1329         else doglob(); }

 jmp .parse401
.parse400:
 call doglob
.parse401:
;-1330     } while(1);

.parse399:
 mov ax, 1
 or  al, al
 je .parse402
 jmp .parse394
.parse402:
;-1331 }

;-1332 

;-1333 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1334 int main() {


main: PROC
;-1335     int arglen1; unsigned int i; char *c;

;-1336     isPrint=1;
;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1337     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1338     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main403
;-1339         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1340         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1341         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1342         }

;-1343     i=arglen1+129;

.main403:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1344     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1345     arglen1--;

 dec  word[bp-2]
;-1346     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1347     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1348     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main404
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4
;-1349     strcpy(namelst, namein);

.main404:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1350     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1351     i--;

 dec  word[bp-4]
;-1352     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1353     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1354 

;-1355     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1356     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main405
;-1357         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1358         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1359         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1360         }

;-1361     fdout=creatR(namelst);

.main405:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1362     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main406
;-1363         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1364         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1365         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1366         }

;-1367     prs(";");

.main406:
 push main_4
 call prs
 add  sp, 2
;-1368     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2
;-1369     prs(", Input: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
;-1370     prs(", Output: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2
;-1371     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1372     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2
;-1373     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1374     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1375     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1376     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1377     parse();

 call parse
;-1378     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1379     prs("\n;Glob. variables:"); GTop--; prunsign1(GTop);

 push main_8
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call prunsign1
 add  sp, 2
;-1380     prs(" ("); prunsign1(LSTART);

 push main_9
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1381     prs("), Functions:"); prunsign1(FTop);

 push main_10
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2
;-1382     prs(" ("); prunsign1(FUNCMAX);

 push main_11
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1383     prs("), Lines:"); prunsign1(lineno);

 push main_12
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2
;-1384     prs("\n;Constant: ");   prunsign1(maxco);

 push main_13
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2
;-1385     prs(" ("); prunsign1(COMAX);

 push main_14
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2
;-1386     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1387     if (i <= 1000)prs("\n *** Warning *** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main407
 push main_15
 call prs
 add  sp, 2
;-1388     prs("), stacksize: ");

.main407:
 push main_16
 call prs
 add  sp, 2
;-1389     i=65636; i=i-orgData;

 mov ax, 100
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1390     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1391     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main408
 push main_17
 call prs
 add  sp, 2
;-1392     end1(0);

.main408:
 push 0
 call end1
 add  sp, 2
;-1393 }

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
;Glob. variables:94 (300), Functions:68 (300), Lines:1394
;Constant: 570 (3000), stacksize: 23827