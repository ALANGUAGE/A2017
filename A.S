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

;-21 #define T_EQ          806

;-22 #define T_NE          807

;-23 #define T_GE          811

;-24 #define T_LE          824

;-25 #define T_PLUSPLUS   1219

;-26 #define T_MINUSMINUS 1225

;-27 #define T_PLUSASS    1230

;-28 #define T_MINUSASS   1231

;-29 #define T_MULASS     1232

;-30 #define T_DIVASS     1233

;-31 #define T_ANDASS     1234

;-32 #define T_ORASS      1235

;-33 #define T_LESSLESS   1240

;-34 #define T_GREATGREAT 1241

;-35 

;-36 char isPrint=1;//set screen listing

isPrint db 1
;-37 unsigned int ORGDATAORIG=25000;//start of arrays, end of text

ORGDATAORIG dw 25000
;-38 unsigned int orgData;//actual max of array, must be less than stack

orgData dw 0
;-39 #define COMAX        3000

;-40 char co[COMAX];//constant storage

section .bss
absolute 25000
co resb 3000
section .text
;-41 int maxco=0;

maxco dw 0
;-42 int maxco1=0;

maxco1 dw 0
;-43 #define CMDLENMAX      67

;-44 char symbol[COLUMNMAX];

section .bss
absolute 28000
symbol resb 128
section .text
;-45 char fname[CMDLENMAX];

section .bss
absolute 28128
fname resb 67
section .text
;-46 char namein[CMDLENMAX];

section .bss
absolute 28195
namein resb 67
section .text
;-47 char namelst[CMDLENMAX];

section .bss
absolute 28262
namelst resb 67
section .text
;-48 char *cloc=0;

cloc dw 0
;-49 int fdin=0;

fdin dw 0
;-50 int fdout=0;

fdout dw 0
;-51 int token=0;

token dw 0
;-52 int column=0;

column dw 0
;-53 char thechar=0;   //reads one char forward

thechar db 0
;-54 int iscmp=0;

iscmp dw 0
;-55 int nconst=0;

nconst dw 0
;-56 int nreturn=0;

nreturn dw 0
;-57 int nlabel=0;‚

nlabel dw 0
;-58 unsigned int lexval=0;

lexval dw 0
;-59 int typei;       char istype;

typei dw 0
istype db 0
;-60 int signi;       char issign;

signi dw 0
issign db 0
;-61 int widthi;      char iswidth;

widthi dw 0
iswidth db 0
;-62 int wi=0;

wi dw 0
;-63 #define VARMAX        400//max global and local var

;-64 #define LSTART        300//max global var

;-65 #define GNAMEMAX     6400// 16*VARMAX

;-66 char GType [VARMAX]; // 0=V, 1=*, 2=&,#

section .bss
absolute 28329
GType resb 400
section .text
;-67 char GSign [VARMAX]; // 0=U, 1=S

section .bss
absolute 28729
GSign resb 400
section .text
;-68 char GWidth[VARMAX]; // 0, 1, 2, 4

section .bss
absolute 29129
GWidth resb 400
section .text
;-69 int GData [VARMAX];

section .bss
absolute 29529
GData resw 400
section .text
;-70 char GNameField[GNAMEMAX];

section .bss
absolute 30329
GNameField resb 6400
section .text
;-71 int GTop=1;

GTop dw 1
;-72 int LTop=LSTART;

LTop dw 300
;-73 #define FUNCMAX       300//max functions

;-74 #define FNAMEMAX     4800// 16*FUNCMAX

;-75 char FNameField[FNAMEMAX];

section .bss
absolute 36729
FNameField resb 4800
section .text
;-76 int  FTop=0;

FTop dw 0
;-77 char fgetsdest[COLUMNMAX];

section .bss
absolute 41529
fgetsdest resb 128
section .text
;-78 unsigned char *fgetsp=0;

fgetsp dw 0
;-79 unsigned int lineno=1;

lineno dw 1
;-80 unsigned char *pt=0;

pt dw 0
;-81 unsigned char *p1=0;

p1 dw 0
;-82 int DOS_ERR=0;

DOS_ERR dw 0
;-83 int DOS_NoBytes=0;

DOS_NoBytes dw 0
;-84 char DOS_ByteRead=0;

DOS_ByteRead db 0
;-85 int ireg1;

ireg1 dw 0
;-86 int mod2;

mod2 dw 0
;-87 int ireg2;

ireg2 dw 0
;-88 

;-89 int writetty()     {//ah=0x0E; bx=0; __emit__(0xCD,0x10);


writetty: PROC
;-90 asm mov ah, 14

 mov ah, 14
;-91 asm mov bx, 0

 mov bx, 0
;-92 asm int 16

 int 16
;-93 }

;-94 int putch(char c)  {

 ret
ENDP

putch: PROC
;-95     if (c==10)  {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-96         asm mov al, 13

 mov al, 13
;-97         writetty();

 call writetty
;-98     }

;-99     asm mov al, [bp+4]; parameter c

.putch1:
 mov al, [bp+4]; parameter c
;-100     writetty();

 call writetty
;-101 }

;-102 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-103     char c;

;-104     while(*s) {
;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
;-105         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-106         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-107         s++;

 inc  word[bp+4]
;-108     }

;-109 }

 jmp .cputs2
.cputs3:
;-110 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-111     asm mov ax, [bp+4]; parameter n
;
 ENTER  0,0
 mov ax, [bp+4]; parameter n
;-112     asm neg ax

 neg ax
;-113 }

;-114 

;-115 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-116     asm int 33; 21h

 int 33; 21h
;-117     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-118     DOS_ERR++;

 inc  word[DOS_ERR]
;-119 }

;-120 int openR (char *s) {

 ret
ENDP

openR: PROC
;-121     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-122     asm mov ax, 15618; ax=0x3D02;

 mov ax, 15618; ax=0x3D02;
;-123     DosInt();

 call DosInt
;-124 }

;-125 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-126     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-127     asm mov cx, 0

 mov cx, 0
;-128     asm mov ax, 15360; ax=0x3C00;

 mov ax, 15360; ax=0x3C00;
;-129     DosInt();

 call DosInt
;-130 }

;-131 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-132     asm mov bx, [bp+4]; bx=fd;
;
 ENTER  0,0
 mov bx, [bp+4]; bx=fd;
;-133     asm mov ax, 15872; ax=0x3E00;

 mov ax, 15872; ax=0x3E00;
;-134     DosInt();

 call DosInt
;-135 }

;-136 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-137     asm mov ah, 76; ah=0x4C;
;
 ENTER  0,0
 mov ah, 76; ah=0x4C;
;-138     asm mov al, [bp+4]; al=c;

 mov al, [bp+4]; al=c;
;-139     DosInt();

 call DosInt
;-140 }

;-141 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-142     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-143     asm mov cx, [bp+8]; cx=len;

 mov cx, [bp+8]; cx=len;
;-144     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-145     asm mov ax, 16128;  ax=0x3F00;

 mov ax, 16128;  ax=0x3F00;
;-146     DosInt();

 call DosInt
;-147 }

;-148 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-149     asm lea dx, [bp+4]; *n  todo: why not mov ?????
;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov ?????
;-150     asm mov cx, 1;      cx=1;

 mov cx, 1;      cx=1;
;-151     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-152     asm mov ax, 16384;  ax=0x4000;

 mov ax, 16384;  ax=0x4000;
;-153     DosInt();

 call DosInt
;-154 }

;-155 

;-156 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-157       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-158       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-159       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-160       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-161       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-162       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-163       if (c> 'Z') { if (c< 'a') return 0; }

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
;-164       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-165 }

;-166 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-167       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-168       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-169       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-170 }

;-171 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-172     if (digit (c)) return 1;
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
;-173     if (letter(c)) return 1;

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
;-174     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-175 }

;-176 

;-177 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-178     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-179     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-180     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-181 }

;-182 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-183     do { *s=*t; s++; t++; }
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
;-184     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-185     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-186     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-187 }

;-188 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-189     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21
;-190         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-191         p++;

.eqstr22:
 inc  word[bp+4]
;-192         q++;

 inc  word[bp+6]
;-193     }

;-194     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-195     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-196 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-197     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]
;-198     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-199 }

;-200 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-201     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27
;-202         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-203         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-204     }

;-205 }

 jmp .toupper26
.toupper27:
;-206 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-207     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131
;-208         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-209         s++;

.instr132:
 inc  word[bp+4]
;-210     }

;-211     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-212 }

;-213 

;-214 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-215     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-216     cloc++;

 inc  word[cloc]
;-217 }

;-218 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-219     char c;

;-220     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34
;-221         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-222         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-223         s++;

 inc  word[bp+4]
;-224     }

;-225 }

 jmp .eprs33
.eprs34:
;-226 

;-227 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-228     if (isPrint) {
;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-229         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-230             asm mov ax, 13

 mov ax, 13
;-231             writetty();

 call writetty
;-232         }

;-233         asm mov al, [bp+4]; al=c;

.prc36:
 mov al, [bp+4]; al=c;
;-234         writetty();

 call writetty
;-235     }

;-236     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-237 }

;-238 

;-239 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-240     unsigned char c;

;-241     while(*s){
;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38
;-242         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-243         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-244         s++;

 inc  word[bp+4]
;-245     }

;-246 }

 jmp .prscomment37
.prscomment38:
;-247 

;-248 int prs(unsigned char *s) {

 LEAVE
 ret
ENDP

prs: PROC
;-249     unsigned char c; int com;

;-250     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-251     while(*s) {

.prs39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs40
;-252         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-253         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs41
 mov ax, [bp-4]
 or  al, al
 je .prs42
 mov ax, 0
 mov [bp-4], ax
;-254                    else com=1;

 jmp .prs43
.prs42:
 mov ax, 1
 mov [bp-4], ax
;-255         if (c==92) {

.prs43:
.prs41:
 mov al, [bp-2]
 cmp al, 92
 jne .prs44
;-256             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs45
;-257                 s++;

 inc  word[bp+4]
;-258                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-259                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs46
 mov ax, 10
 mov [bp-2], al
;-260                 if (c=='t') c= 9;

.prs46:
 mov al, [bp-2]
 cmp al, 116
 jne .prs47
 mov ax, 9
 mov [bp-2], al
;-261             }

.prs47:
;-262         }

.prs45:
;-263         prc(c);

.prs44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-264         s++;

 inc  word[bp+4]
;-265     }

;-266 }

 jmp .prs39
.prs40:
;-267 

;-268 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-269     int e;

;-270     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-271         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-272         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-273     }

;-274     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-275         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-276         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-277     }

;-278     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-279     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-280     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-281 }

;-282 

;-283 int pint1 (int n){

 LEAVE
 ret
ENDP

pint1: PROC
;-284     int e;

;-285     if(n<0) {  prc('-');  n=mkneg(n); }
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
;-286     if (n >= 10) {

.pint150:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint151
;-287         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-288         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2
;-289     }

;-290     n=n%10;

.pint151:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-291     n += '0';

 add  word[bp+4], 48
;-292     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-293 }

;-294 

;-295 int prunsign1(unsigned int n) {

 LEAVE
 ret
ENDP

prunsign1: PROC
;-296     unsigned int e;

;-297     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign152
;-298         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-299         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-300     }

;-301     n = n % 10; /*unsigned mod*/

.prunsign152:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-302     n += '0';

 add  word[bp+4], 48
;-303     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-304 }

;-305 

;-306 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-307     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-308     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-309     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-310 }

;-311 

;-312 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-313     isPrint=1;
;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-314     lineno--;

 dec  word[lineno]
;-315     prs("\n ");

 push error1_0
 call prs
 add  sp, 2
;-316     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-317     prs(";Line: ");

 push error1_1
 call prs
 add  sp, 2
;-318     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-319     prs(" ************** ERROR: ");

 push error1_2
 call prs
 add  sp, 2
;-320     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2
;-321     prs("  in column: ");

 push error1_3
 call prs
 add  sp, 2
;-322     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2
;-323     prs("\nToken: ");

 push error1_4
 call prs
 add  sp, 2
;-324     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2
;-325     prs(", symbol: ");

 push error1_5
 call prs
 add  sp, 2
;-326     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-327     end1(1);

 push 1
 call end1
 add  sp, 2
;-328 }

;-329 

;-330 int printinputline() {

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
;-331     int col;

;-332     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-333     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-334     do {

.printinputline53:
;-335         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-336         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-337         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-338         fgetsp++;

 inc  word[fgetsp]
;-339         col++;

 inc  word[bp-2]
;-340         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-341         }

.printinputline55:
;-342         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-343     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-344         prs("\n;-");

 push printinputline_1
 call prs
 add  sp, 2
;-345         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-346         prc(' ');

 push 32
 call prc
 add  sp, 2
;-347         lineno++;

 inc  word[lineno]
;-348         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-349 }

;-350 

;-351 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-352     char c;

;-353     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-354     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-355         printinputline();

 call printinputline
;-356         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-357         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-358         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-359         column=0;

 mov ax, 0
 mov word [column], ax
;-360     }

;-361     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-362     column++;

 inc  word[column]
;-363     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-364 }

;-365 

;-366 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-367     char r;

;-368     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-369     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-370     return r;

 mov al, [bp-2]
 jmp .retnnext
;-371 }

;-372 

;-373 int adrF(char *s, unsigned int i) {

 .retnnext:
 LEAVE
 ret
ENDP

adrF: PROC
;-374     i << 4;//*16; IDLENMAX=15!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4
;-375     asm add ax, [bp+4]  ; offset s 

 add ax, [bp+4]  ; offset s 
;-376 }

;-377 

;-378 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-379     int j;

;-380     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName59
;-381         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-382         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2
;-383     }

;-384     else {

 jmp .printName60
.printName59:
;-385         prs("[bp");

 push printName_0
 call prs
 add  sp, 2
;-386         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-387         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2
;-388         pint1(j);

.printName61:
 push word [bp-2]
 call pint1
 add  sp, 2
;-389         prc(']');

 push 93
 call prc
 add  sp, 2
;-390     }

;-391 }

.printName60:
;-392 

;-393 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-394     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL
;-395     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63
;-396         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al
;-397         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL
;-398     }

;-399     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL
;-400 }

;-401 

;-402 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 41657
symboltemp resb 80
section .text
;-403 

;-404 int getlex() {


getlex: PROC
;-405     char c; char *p;

;-406     int i; int j;

;-407 g1: c=next();
;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-408     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex
;-409     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1
;-410   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-411   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-412   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-413   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-414   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-415   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-416   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-417   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-418   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-419   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-420   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-421   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-422   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-423   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-424   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-425   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96
;-426       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97
;-427           do c=next();

.getlex98:
 call next
 mov [bp-2], al
;-428           while(ifEOL(c)==0) return getlex();

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
;-429       }

;-430   }

.getlex97:
;-431   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-432       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101
;-433           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-434           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2
;-435           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2
;-436           c=next();

.getlex103:
 call next
 mov [bp-2], al
;-437           return getlex();

 call getlex
 jmp .retngetlex
;-438       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex
;-439   }

.getlex104:
;-440   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105
;-441       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-442       c=next();

 call next
 mov [bp-2], al
;-443       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107
;-444           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-445           p++;

 inc  word[bp-4]
;-446           c=next();

 call next
 mov [bp-2], al
;-447           }

;-448           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-449       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-450   }

;-451   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108
;-452       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-453       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-454       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al
;-455       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110
;-456           next();

 call next
;-457           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112
;-458               c=next();

 call next
 mov [bp-2], al
;-459               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-460       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-461                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-462                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-463                i=0;

 mov ax, 0
 mov [bp-6], ax
;-464                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-465                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-466            }

;-467        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:
;-468            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-469                c=next();

 call next
 mov [bp-2], al
;-470                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-471                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-472                i=0;

 mov ax, 0
 mov [bp-6], ax
;-473                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-474                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-475            }

;-476        }

 jmp .getlex116
.getlex117:
;-477       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex
;-478   }

;-479   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118
;-480       lexval=next();

 call next
 mov word [lexval], ax
;-481       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119
;-482           lexval=next();

 call next
 mov word [lexval], ax
;-483           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax
;-484           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax
;-485           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax
;-486       }

.getlex122:
;-487       next();

.getlex119:
 call next
;-488       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-489   }

;-490   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-491     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-492     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-493     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-494     p++;

 inc  word[bp-4]
;-495     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125
;-496         c=next();

 call next
 mov [bp-2], al
;-497         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-498         p++;

 inc  word[bp-4]
;-499     }

;-500     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-501     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex
;-502     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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
;-503     if (eqstr(symbol,"void"    )) return T_VOID;

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
;-504     if (eqstr(symbol,"int"     )) return T_INT;

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
;-505     if (eqstr(symbol,"char"    )) return T_CHAR;

.getlex129:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex130
 mov ax, 530
 jmp .retngetlex
;-506     if (eqstr(symbol,"asm"     )) return T_ASM;

.getlex130:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex131
 mov ax, 518
 jmp .retngetlex
;-507     if (eqstr(symbol,"__emit__")) return T_EMIT;

.getlex131:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex132
 mov ax, 520
 jmp .retngetlex
;-508     if (eqstr(symbol,"return"  )) return T_RETURN;

.getlex132:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex133
 mov ax, 512
 jmp .retngetlex
;-509     if (eqstr(symbol,"if"      )) return T_IF;

.getlex133:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex134
 mov ax, 513
 jmp .retngetlex
;-510     if (eqstr(symbol,"else"    )) return T_ELSE;

.getlex134:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex135
 mov ax, 514
 jmp .retngetlex
;-511     if (eqstr(symbol,"while"   )) return T_WHILE;

.getlex135:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex136
 mov ax, 515
 jmp .retngetlex
;-512     if (eqstr(symbol,"do"      )) return T_DO;

.getlex136:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex137
 mov ax, 516
 jmp .retngetlex
;-513     if (eqstr(symbol,"goto"    )) return T_GOTO;

.getlex137:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex138
 mov ax, 521
 jmp .retngetlex
;-514     if (eqstr(symbol,"define"  )) return T_DEFINE;

.getlex138:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex139
 mov ax, 511
 jmp .retngetlex
;-515 

;-516     i=0;//convert define to value

.getlex139:
 mov ax, 0
 mov [bp-6], ax
;-517     while (i < GTop) {

.getlex140:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex141
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
 je .getlex142
;-520             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex143
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

.getlex143:
;-526         i++;

.getlex142:
 inc  word[bp-6]
;-527     }

;-528     return T_NAME; } error1("Input item not recognized");

 jmp .getlex140
.getlex141:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_15
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
getlex_5 db "char",0
getlex_6 db "asm",0
getlex_7 db "__emit__",0
getlex_8 db "return",0
getlex_9 db "if",0
getlex_10 db "else",0
getlex_11 db "while",0
getlex_12 db "do",0
getlex_13 db "goto",0
getlex_14 db "define",0
getlex_15 db "Input item not recognized",0
ENDP

istoken: PROC
;-532     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken144
;-533         token=getlex();

 call getlex
 mov word [token], ax
;-534         return 1;

 mov ax, 1
 jmp .retnistoken
;-535     }

;-536     return 0;

.istoken144:
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
 jne .expect145
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

.expect145:
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
 jge .v146
 push 91
 call prc
 add  sp, 2
;-551     printName(i);

.v146:
 push word [bp+4]
 call printName
 add  sp, 2
;-552     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v147
 push 93
 call prc
 add  sp, 2
;-553 }

.v147:
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
 jle .checknamelen148
 push checknamelen_0
 call error1
 add  sp, 2
;-558 }

.checknamelen148:
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

.checkName149:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName150
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
 je .checkName151
 mov ax, [bp-2]
 jmp .retncheckName
;-566         i++;

.checkName151:
 inc  word[bp-2]
;-567     }

;-568     i=1;

 jmp .checkName149
.checkName150:
 mov ax, 1
 mov [bp-2], ax
;-569     while(i<GTop) {

.checkName152:
 mov ax, [bp-2]
 cmp ax, [GTop]
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

;-574     return 0;

 jmp .checkName152
.checkName153:
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
 jne .searchname155
 push searchname_0
 call error1
 add  sp, 2
;-581     return i;

.searchname155:
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
 je  .name1156
 push name1_0
 call error1
 add  sp, 2
;-586     token=getlex();

.name1156:
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
 je .typeName157
 mov ax, 83
 mov byte [issign], al
;-593     if(istoken(T_UNSIGNED)) issign='U';

.typeName157:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName158
 mov ax, 85
 mov byte [issign], al
;-594     iswidth=2;

.typeName158:
 mov ax, 2
 mov byte [iswidth], al
;-595     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName159
 mov ax, 0
 mov byte [iswidth], al
;-596     if(istoken(T_CHAR))     iswidth=1;

.typeName159:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 1
 mov byte [iswidth], al
;-597     if(istoken(T_INT))      iswidth=2;

.typeName160:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 2
 mov byte [iswidth], al
;-598     istype='V';

.typeName161:
 mov ax, 86
 mov byte [istype], al
;-599     m=0;

 mov ax, 0
 mov [bp-2], ax
;-600     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-601     if(istoken('&'))  {istype='&'; m=2;}

.typeName162:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax
;-602     name1();

.typeName163:
 call name1
;-603     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-604 }

;-605 

;-606 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-607     char c;

;-608     c=GSign [i];
;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-609     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes164
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes165
.gettypes164:
 mov ax, 0
 mov word [signi], ax
;-610     c=GWidth[i];

.gettypes165:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-611     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-612     wi=0;

 mov ax, 0
 mov word [wi], ax
;-613     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes166
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-614     if (c==2) {widthi=2;wi=2;}

.gettypes166:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes167
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-615     if (c==4) {widthi=4;wi=4;}

.gettypes167:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes168
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-616     c=GType [i];

.gettypes168:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-617     typei=0;

 mov ax, 0
 mov word [typei], ax
;-618     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes169
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-619     if (c=='&')  typei=2;

.gettypes169:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes170
 mov ax, 2
 mov word [typei], ax
;-620     return i;

.gettypes170:
 mov ax, [bp+4]
 jmp .retngettypes
;-621 }

;-622 

;-623 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-624     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal171
 push addlocal_0
 call error1
 add  sp, 2
;-625     if (checkName() != 0) error1("Variable already defined");

.addlocal171:
 call checkName
 cmp ax, 0
 je  .addlocal172
 push addlocal_1
 call error1
 add  sp, 2
;-626     GSign[LTop]=issign;

.addlocal172:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-627     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-628     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-629     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-630     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-631 }

;-632 

;-633 

;-634 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-635        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg173
 push cmpneg_0
 call prs
 add  sp, 2
;-636   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg174
.cmpneg173:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg175
 push cmpneg_1
 call prs
 add  sp, 2
;-637   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

 jmp .cmpneg176
.cmpneg175:
 mov ax, [iscmp]
 cmp ax, 824
 jne .cmpneg177
 mov ax, [bp+4]
 or  al, al
 je .cmpneg178
 push cmpneg_2
 call prs
 add  sp, 2
;-638                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg179
.cmpneg178:
 push cmpneg_3
 call prs
 add  sp, 2
;-639   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

.cmpneg179:
 jmp .cmpneg180
.cmpneg177:
 mov ax, [iscmp]
 cmp ax, 811
 jne .cmpneg181
 mov ax, [bp+4]
 or  al, al
 je .cmpneg182
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-640                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2
;-641                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg183
.cmpneg182:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-642                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2
;-643   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg183:
 jmp .cmpneg184
.cmpneg181:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg185
 push cmpneg_8
 call prs
 add  sp, 2
;-644   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg186
.cmpneg185:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg187
 push cmpneg_9
 call prs
 add  sp, 2
;-645   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg188
.cmpneg187:
 push cmpneg_10
 call error1
 add  sp, 2
;-646 }

.cmpneg188:
.cmpneg186:
.cmpneg184:
.cmpneg180:
.cmpneg176:
.cmpneg174:
;-647 

;-648 int isrelational() {

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
;-649     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational189
 jmp .w
;-650     if (token==T_NE) goto w;

.isrelational189:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational190
 jmp .w
;-651     if (token==T_LE) goto w;

.isrelational190:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational191
 jmp .w
;-652     if (token==T_GE) goto w;

.isrelational191:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational192
 jmp .w
;-653     if (token=='<' ) goto w;

.isrelational192:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational193
 jmp .w
;-654     if (token=='>' ) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational194
 jmp .w
;-655     return 0;

.isrelational194:
 mov ax, 0
 jmp .retnisrelational
;-656 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-657     token=getlex();

 call getlex
 mov word [token], ax
;-658     return 1;

 mov ax, 1
 jmp .retnisrelational
;-659 }

;-660 

;-661 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-662 

;-663     return 0; // todo:  no reg allowed anymore

 mov ax, 0
 jmp .retncheckreg
;-664 

;-665   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg195
 mov ax, 0
 jmp .retncheckreg
;-666   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg195:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg196
 mov ax, 1
 jmp .retncheckreg
.checkreg196:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg197
 mov ax, 3
 jmp .retncheckreg
;-667   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg197:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 5
 jmp .retncheckreg
.checkreg198:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 7
 jmp .retncheckreg
;-668   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg199:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 9
 jmp .retncheckreg
.checkreg200:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 11
 jmp .retncheckreg
;-669   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg201:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 13
 jmp .retncheckreg
.checkreg202:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 15
 jmp .retncheckreg
;-670   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg203:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 17
 jmp .retncheckreg
.checkreg204:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 19
 jmp .retncheckreg
;-671   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg205:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 21
 jmp .retncheckreg
.checkreg206:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 23
 jmp .retncheckreg
;-672   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg207:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 25
 jmp .retncheckreg
.checkreg208:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 27
 jmp .retncheckreg
;-673   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg209:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 29
 jmp .retncheckreg
.checkreg210:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 31
 jmp .retncheckreg
;-674   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg211:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 33
 jmp .retncheckreg
.checkreg212:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 35
 jmp .retncheckreg
;-675   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg213:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 37
 jmp .retncheckreg
.checkreg214:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 39
 jmp .retncheckreg
;-676   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg215:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 41
 jmp .retncheckreg
.checkreg216:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 43
 jmp .retncheckreg
;-677   // (eqstr(symbol,"ip")) return 45;

;-678   if (strlen(symbol) >   3) return 0;

.checkreg217:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg218
 mov ax, 0
 jmp .retncheckreg
;-679   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg218:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 47
 jmp .retncheckreg
.checkreg219:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg220
 mov ax, 50
 jmp .retncheckreg
;-680   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg220:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 53
 jmp .retncheckreg
.checkreg221:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 56
 jmp .retncheckreg
;-681   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg222:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 59
 jmp .retncheckreg
.checkreg223:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 62
 jmp .retncheckreg
;-682   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg224:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 65
 jmp .retncheckreg
.checkreg225:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 68
 jmp .retncheckreg
;-683 //  if (eqstr(symbol,"cr0")) return 71;

;-684   return 0;

.checkreg226:
 mov ax, 0
 jmp .retncheckreg
;-685 }

;-686 

;-687 char printregstr[]

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
;-688 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-689 

;-690 int printreg(int i) {


printreg: PROC
;-691     unsigned int k; unsigned char c;

;-692     k = &printregstr + i;
;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-693     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-694     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-695     i++;

 inc  word[bp+4]
;-696     k = &printregstr + i;

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
;-699     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg227
;-700         i++;

 inc  word[bp+4]
;-701         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-702         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-703         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-704         }

;-705 }

.printreg227:
;-706 

;-707 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 41737
ops resb 5
section .text
;-708 int doreg1(int iscmp1) {


doreg1: PROC
;-709     int i;

;-710     if (istoken('='))          strcpy(ops, "mov");
;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1228
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-711     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1228:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1229
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-712     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1229:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1230
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-713     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1230:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1231
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-714     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1231:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1232
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-715     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1232:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1233
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-716     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1233:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1234
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-717     if (iscmp1 == 1) {

.doreg1234:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1235
;-718             token=getlex();

 call getlex
 mov word [token], ax
;-719             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1236
 push doreg1_7
 call error1
 add  sp, 2
;-720             strcpy(ops, "cmp");

.doreg1236:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-721         }

;-722     prs("\n ");

.doreg1235:
 push doreg1_9
 call prs
 add  sp, 2
;-723     prs(ops);

 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2
;-724     prs("  ");

 push doreg1_10
 call prs
 add  sp, 2
;-725     printreg(ireg1);

 push word [ireg1]
 call printreg
 add  sp, 2
;-726     prs(", ");

 push doreg1_11
 call prs
 add  sp, 2
;-727 

;-728     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1237
;-729         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-730         goto reg1;

 jmp .reg1
;-731         }

;-732     mod2=typeName();

.doreg1237:
 call typeName
 mov word [mod2], ax
;-733     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-734     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1238
;-735         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-736         goto reg1;

 jmp .reg1
;-737         }

;-738     i=searchname();

.doreg1238:
 call searchname
 mov [bp-2], ax
;-739     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1239
 push word [bp-2]
 call printName
 add  sp, 2
;-740         else v(i);

 jmp .doreg1240
.doreg1239:
 push word [bp-2]
 call v
 add  sp, 2
;-741 reg1: if (iscmp1 == 1) {

.doreg1240:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1241
;-742     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-743     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-744     expect(')');

 push 41
 call expect
 add  sp, 2
;-745     }

;-746 }

.doreg1241:
;-747 

;-748 int compoundass(char *op, int mode, int id1) {

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
;-749     if(mode) error1("only scalar variable allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass242
 push compoundass_0
 call error1
 add  sp, 2
;-750     prs("\n ");

.compoundass242:
 push compoundass_1
 call prs
 add  sp, 2
;-751     prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-752     prs("  ");

 push compoundass_2
 call prs
 add  sp, 2
;-753     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-754     if (wi==2) prs("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass243
 push compoundass_3
 call prs
 add  sp, 2
;-755         else prs("byte");

 jmp .compoundass244
.compoundass243:
 push compoundass_4
 call prs
 add  sp, 2
;-756     v(id1);

.compoundass244:
 push word [bp+8]
 call v
 add  sp, 2
;-757     prs(", ");

 push compoundass_5
 call prs
 add  sp, 2
;-758     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-759     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-760 }

;-761 

;-762 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-763     gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-764     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1245
;-765         prs("\n mov bx, ");

 push dovar1_0
 call prs
 add  sp, 2
;-766         v(id1); prs("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call prs
 add  sp, 2
;-767         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-768         if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1246
 push dovar1_2
 call prs
 add  sp, 2
;-769         if(widthi == 2) prs(" ax, [bx]");

.dovar1246:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1247
 push dovar1_3
 call prs
 add  sp, 2
;-770         return;

.dovar1247:
 jmp .retndovar1
;-771         }

;-772     if (mode==2){// & = adr

.dovar1245:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1248
;-773         prs("\n ");

 push dovar1_4
 call prs
 add  sp, 2
;-774         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-775         prs(" ax, ");

 push dovar1_5
 call prs
 add  sp, 2
;-776         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-777         return;

 jmp .retndovar1
;-778         }

;-779     if (ixarr) {//array

.dovar1248:
 mov ax, [bp+8]
 or  al, al
 je .dovar1249
;-780         prs("\n mov bx, ");

 push dovar1_6
 call prs
 add  sp, 2
;-781         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-782         if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1250
 push dovar1_7
 call prs
 add  sp, 2
;-783         prs("\n ");

.dovar1250:
 push dovar1_8
 call prs
 add  sp, 2
;-784         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-785         if (wi==2) prs(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1251
 push dovar1_9
 call prs
 add  sp, 2
;-786             else prs(" al, ");

 jmp .dovar1252
.dovar1251:
 push dovar1_10
 call prs
 add  sp, 2
;-787         prc('[');

.dovar1252:
 push 91
 call prc
 add  sp, 2
;-788         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-789         prs(" + bx]");

 push dovar1_11
 call prs
 add  sp, 2
;-790         return;

 jmp .retndovar1
;-791         }

;-792     prs("\n ");

.dovar1249:
 push dovar1_12
 call prs
 add  sp, 2
;-793     prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-794     if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1253
 push dovar1_13
 call prs
 add  sp, 2
;-795     if(wi==2) prs(" ax, ");

.dovar1253:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1254
 push dovar1_14
 call prs
 add  sp, 2
;-796     if(wi==4) prs(" eax, ");

.dovar1254:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1255
 push dovar1_15
 call prs
 add  sp, 2
;-797     v(id1);

.dovar1255:
 push word [bp+10]
 call v
 add  sp, 2
;-798 }

;-799 

;-800 int rterm(char *op) {

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
;-801     int mode; int opint; int ixarr; int id1;

;-802     if (istoken(T_CONST)) {
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm256
;-803         prs("\n ");

 push rterm_0
 call prs
 add  sp, 2
;-804         prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-805         if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm257
 push rterm_1
 call prs
 add  sp, 2
;-806         if (wi==2) prs(" ax, ");

.rterm257:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm258
 push rterm_2
 call prs
 add  sp, 2
;-807         if (wi==4) prs(" eax, ");

.rterm258:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm259
 push rterm_3
 call prs
 add  sp, 2
;-808         prunsign1(lexval);

.rterm259:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-809         return;

 jmp .retnrterm
;-810         }

;-811     mode=typeName();

.rterm256:
 call typeName
 mov [bp-2], ax
;-812     id1=searchname();

 call searchname
 mov [bp-8], ax
;-813     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-814     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm260
;-815         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-816         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-817         expect(']');

 push 93
 call expect
 add  sp, 2
;-818         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-819         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm261
 push rterm_4
 call error1
 add  sp, 2
;-820         }

.rterm261:
;-821     if (eqstr(symbol,"ax")) return;

.rterm260:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm262
 jmp .retnrterm
;-822     opint=op;

.rterm262:
 mov ax, [bp+4]
 mov [bp-4], ax
;-823     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-824 }

;-825 

;-826 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-827     gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-828     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign263
;-829         prs("\n mov  bx, ");

 push doassign_0
 call prs
 add  sp, 2
;-830         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-831         if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign264
 push doassign_1
 call prs
 add  sp, 2
;-832             else  prs("\n mov  [bx], al");

 jmp .doassign265
.doassign264:
 push doassign_2
 call prs
 add  sp, 2
;-833         return;

.doassign265:
 jmp .retndoassign
;-834         }

;-835     if (mode==2) {// & = adr

.doassign263:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign266
;-836         prs("\n mov  ");

 push doassign_3
 call prs
 add  sp, 2
;-837         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-838         prs(", ax");

 push doassign_4
 call prs
 add  sp, 2
;-839         return;

 jmp .retndoassign
;-840         }

;-841     if (ixarr) {

.doassign266:
 mov ax, [bp+8]
 or  al, al
 je .doassign267
;-842         prs("\n mov bx, ");

 push doassign_5
 call prs
 add  sp, 2
;-843         if(ixconst) prunsign1(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign268
 push word [bp+8]
 call prunsign1
 add  sp, 2
;-844             else v(ixarr);

 jmp .doassign269
.doassign268:
 push word [bp+8]
 call v
 add  sp, 2
;-845         if (wi==2) prs("\n shl bx, 1");

.doassign269:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign270
 push doassign_6
 call prs
 add  sp, 2
;-846         prs("\n mov [");

.doassign270:
 push doassign_7
 call prs
 add  sp, 2
;-847         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-848         if (wi==2) prs("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign271
 push doassign_8
 call prs
 add  sp, 2
;-849             else prs("+bx], al");

 jmp .doassign272
.doassign271:
 push doassign_9
 call prs
 add  sp, 2
;-850         return;

.doassign272:
 jmp .retndoassign
;-851         }

;-852     if (wi==1){

.doassign267:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign273
;-853         prs("\n mov ");

 push doassign_10
 call prs
 add  sp, 2
;-854         if(i<LSTART) prs("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign274
 push doassign_11
 call prs
 add  sp, 2
;-855         v(i);

.doassign274:
 push word [bp+6]
 call v
 add  sp, 2
;-856         prs(", al");

 push doassign_12
 call prs
 add  sp, 2
;-857         return;

 jmp .retndoassign
;-858         }

;-859     if (wi==2){

.doassign273:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign275
;-860         prs("\n mov ");

 push doassign_13
 call prs
 add  sp, 2
;-861         if(i<LSTART) prs("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign276
 push doassign_14
 call prs
 add  sp, 2
;-862         v(i);

.doassign276:
 push word [bp+6]
 call v
 add  sp, 2
;-863         prs(", ax");

 push doassign_15
 call prs
 add  sp, 2
;-864         return;

 jmp .retndoassign
;-865         }

;-866     if (wi==4){

.doassign275:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign277
;-867         prs("\n mov ");

 push doassign_16
 call prs
 add  sp, 2
;-868         if(i<LSTART) prs("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign278
 push doassign_17
 call prs
 add  sp, 2
;-869         v(i);

.doassign278:
 push word [bp+6]
 call v
 add  sp, 2
;-870         prs(", eax");

 push doassign_18
 call prs
 add  sp, 2
;-871         return;

 jmp .retndoassign
;-872         }

;-873 }

.doassign277:
;-874 

;-875 int domul(int ids) {

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
;-876     if (ids) rterm("imul");
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul279
 push domul_0
 call rterm
 add  sp, 2
;-877         else {

 jmp .domul280
.domul279:
;-878         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul281
;-879             prs("\n mov bx, ");

 push domul_1
 call prs
 add  sp, 2
;-880             prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-881             prs("\n mul bx");

 push domul_2
 call prs
 add  sp, 2
;-882             }

;-883         else error1("with MUL only const number as multiplicator allowed");

 jmp .domul282
.domul281:
 push domul_3
 call error1
 add  sp, 2
;-884         }

.domul282:
;-885 }

.domul280:
;-886 

;-887 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC
;-888     int mode; int id1;

;-889     if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv283
;-890         prs("\n mov bx, ");

 push doidiv_0
 call prs
 add  sp, 2
;-891         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-892         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv284
 push doidiv_1
 call prs
 add  sp, 2
;-893             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv285
.doidiv284:
 push doidiv_2
 call prs
 add  sp, 2
;-894         }

.doidiv285:
;-895     else {

 jmp .doidiv286
.doidiv283:
;-896         mode=typeName();

 call typeName
 mov [bp-2], ax
;-897         id1=searchname();

 call searchname
 mov [bp-4], ax
;-898         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv287
 push doidiv_3
 call error1
 add  sp, 2
;-899         gettypes(id1);

.doidiv287:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-900         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv288
 push doidiv_4
 call error1
 add  sp, 2
;-901         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv288:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv289
 push doidiv_5
 call error1
 add  sp, 2
;-902         prs("\n mov bx, ");

.doidiv289:
 push doidiv_6
 call prs
 add  sp, 2
;-903         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-904         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv290
 push doidiv_7
 call prs
 add  sp, 2
;-905             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv291
.doidiv290:
 push doidiv_8
 call prs
 add  sp, 2
;-906     }

.doidiv291:
;-907 }

.doidiv286:
;-908 

;-909 int domod(int ids) {

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
;-910     doidiv(ids);
;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-911     prs("\n mov ax, dx");

 push domod_0
 call prs
 add  sp, 2
;-912 }

;-913 

;-914 

;-915 int docalltype[10]; int docallvalue[10];

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
;-916 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 41782
procname resb 17
section .text
;-917 

;-918 int docall1() {


docall1: PROC
;-919     int i; int narg; int t0; int n0;  int sz32;

;-920     narg=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-921     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-922     checknamelen();

 call checknamelen
;-923     strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-924     expect('(');

 push 40
 call expect
 add  sp, 2
;-925 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1292
;-926 	    do {

.docall1293:
;-927 	        narg++;

 inc  word[bp-4]
;-928 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1294
 push docall1_0
 call error1
 add  sp, 2
;-929 	        t0=0;

.docall1294:
 mov ax, 0
 mov [bp-6], ax
;-930             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1295
;-931                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-932                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-933                 }

;-934             if(istoken(T_STRING)){

.docall1295:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1296
;-935                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-936                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-937                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-938                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-939                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-940                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-941                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-942                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-943                 eprs(symbol);

 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
;-944                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-945                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-946                 nconst++;

 inc  word[nconst]
;-947                 }

;-948             if(istoken('&'))     {

.docall1296:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1297
;-949                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-950                 name1();

 call name1
;-951                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-952                 }

;-953             if(istoken(T_NAME))  {

.docall1297:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1298
;-954                 n0=checkreg();

 call checkreg
 mov [bp-8], ax
;-955                 if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1299
 mov ax, 5
 mov [bp-6], ax
;-956                 else {

 jmp .docall1300
.docall1299:
;-957                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-958                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-959                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-960                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-961                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1301
 mov ax, 3
 mov [bp-6], ax
;-962                     }

.docall1301:
;-963                 }

.docall1300:
;-964             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1298:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1302
 push docall1_4
 call error1
 add  sp, 2
;-965             docalltype [narg] = t0;

.docall1302:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-966             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-967         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1303
 jmp .docall1293
.docall1303:
;-968 

;-969   	expect(')');

 push 41
 call expect
 add  sp, 2
;-970   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-971     do {

.docall1304:
;-972         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-973         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-974         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1305
;-975             prs("\n push ");

 push docall1_5
 call prs
 add  sp, 2
;-976             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-977             }

;-978         if(t0==2){

.docall1305:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1306
;-979             prs("\n push ");

 push docall1_6
 call prs
 add  sp, 2
;-980             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-981             prc(95);

 push 95
 call prc
 add  sp, 2
;-982             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-983             }

;-984         if(t0==3){

.docall1306:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1307
;-985             prs("\n lea  ax, ");

 push docall1_7
 call prs
 add  sp, 2
;-986             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-987             prs("\n push ax");

 push docall1_8
 call prs
 add  sp, 2
;-988             }

;-989         if(t0==4){

.docall1307:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1308
;-990             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-991             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1309
;-992                 prs("\n push word ");

 push docall1_9
 call prs
 add  sp, 2
;-993                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-994                 }

;-995             else {

 jmp .docall1310
.docall1309:
;-996                 prs("\n mov al, byte ");

 push docall1_10
 call prs
 add  sp, 2
;-997                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-998                 prs("\n mov ah, 0\n push ax");

 push docall1_11
 call prs
 add  sp, 2
;-999                 }

;-1000             }

.docall1310:
;-1001         if(t0==5){

.docall1308:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1311
;-1002             prs("\n push ");

 push docall1_12
 call prs
 add  sp, 2
;-1003             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1004             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1312
 mov ax, [bp-10]
 add ax, 2
;-1005             }

.docall1312:
;-1006         i--;

.docall1311:
 dec  word[bp-2]
;-1007         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1313
 jmp .docall1304
.docall1313:
;-1008     }

;-1009 	prs("\n call ");

.docall1292:
 push docall1_13
 call prs
 add  sp, 2
;-1010 	prs(&procname);

 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2
;-1011 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1314
;-1012 	    prs("\n add  sp, ");

 push docall1_14
 call prs
 add  sp, 2
;-1013         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1014         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1015         prunsign1(narg);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1016         }

;-1017 }

.docall1314:
;-1018 

;-1019 

;-1020 int expr() {

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
;-1021     int mode;   int id1;

;-1022     int ixarr;  int ixconst;

;-1023     int ids;    int isCONST;

;-1024     int i;      unsigned char *p;

;-1025 

;-1026     if (istoken(T_CONST)) {// constant ;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr315
;-1027         prs("\n mov ax, ");

 push expr_0
 call prs
 add  sp, 2
;-1028         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1029         return 4;

 mov ax, 4
 jmp .retnexpr
;-1030         }

;-1031     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr315:
 call typeName
 mov [bp-2], ax
;-1032     ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1033     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr316
;-1034         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1035         return;

 jmp .retnexpr
;-1036         }

;-1037     if (token=='(')  {

.expr316:
 mov ax, [token]
 cmp ax, 40
 jne .expr317
;-1038         docall1();

 call docall1
;-1039         goto e1;

 jmp .e1
;-1040         }

;-1041 

;-1042     id1=searchname();

.expr317:
 call searchname
 mov [bp-4], ax
;-1043     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1044     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1045     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1046     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1047     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr318
;-1048         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr319
;-1049             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1050             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1051             expect(']');

 push 93
 call expect
 add  sp, 2
;-1052             }

;-1053         else {

 jmp .expr320
.expr319:
;-1054             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1055             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1056             expect(']');

 push 93
 call expect
 add  sp, 2
;-1057             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1058             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr321
 push expr_1
 call error1
 add  sp, 2
;-1059             }

.expr321:
;-1060         }

.expr320:
;-1061     if (istoken(T_PLUSPLUS  )) {

.expr318:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr322
;-1062         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr323
 push expr_2
 call error1
 add  sp, 2
;-1063         prs("\n inc  ");

.expr323:
 push expr_3
 call prs
 add  sp, 2
;-1064         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr324
 push expr_4
 call prs
 add  sp, 2
 jmp .expr325
.expr324:
 push expr_5
 call prs
 add  sp, 2
;-1065         v(id1);

.expr325:
 push word [bp-4]
 call v
 add  sp, 2
;-1066         goto e1;

 jmp .e1
;-1067         }

;-1068     if (istoken(T_MINUSMINUS)) {

.expr322:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr326
;-1069         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr327
 push expr_6
 call error1
 add  sp, 2
;-1070         prs("\n dec  ");

.expr327:
 push expr_7
 call prs
 add  sp, 2
;-1071         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr328
 push expr_8
 call prs
 add  sp, 2
 jmp .expr329
.expr328:
 push expr_9
 call prs
 add  sp, 2
;-1072         v(id1);

.expr329:
 push word [bp-4]
 call v
 add  sp, 2
;-1073         goto e1;

 jmp .e1
;-1074         }

;-1075 

;-1076     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr326:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr330
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1
;-1077     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr330:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr331
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1
;-1078     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr331:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr332
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1
;-1079     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr332:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr333
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1080     if (istoken(T_MULASS  )) error1("not implemented");

.expr333:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr334
 push expr_14
 call error1
 add  sp, 2
;-1081     if (istoken(T_DIVASS  )) error1("not implemented");

.expr334:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr335
 push expr_15
 call error1
 add  sp, 2
;-1082 

;-1083     if (istoken('=')) {

.expr335:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr336
;-1084         expr();

 call expr
;-1085         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1086         goto e1;

 jmp .e1
;-1087         }

;-1088     dovar1(mode, "mov", ixarr, id1);

.expr336:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1089 

;-1090 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push expr_17
 call rterm
 add  sp, 2
;-1091     else if (istoken('-')) rterm("sub");

 jmp .expr338
.expr337:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push expr_18
 call rterm
 add  sp, 2
;-1092     else if (istoken('&')) rterm("and");

 jmp .expr340
.expr339:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push expr_19
 call rterm
 add  sp, 2
;-1093     else if (istoken('|')) rterm("or" );

 jmp .expr342
.expr341:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
 push expr_20
 call rterm
 add  sp, 2
;-1094     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr344
.expr343:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr345
 push expr_21
 call rterm
 add  sp, 2
;-1095     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr346
.expr345:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr347
 push expr_22
 call rterm
 add  sp, 2
;-1096     else if (istoken('*')) domul (ids);

 jmp .expr348
.expr347:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr349
 push word [bp-10]
 call domul
 add  sp, 2
;-1097     else if (istoken('/')) doidiv(ids);

 jmp .expr350
.expr349:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr351
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1098     else if (istoken('%')) domod (ids);

 jmp .expr352
.expr351:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr353
 push word [bp-10]
 call domod
 add  sp, 2
;-1099     if (isrelational()) {

.expr353:
.expr352:
.expr350:
.expr348:
.expr346:
.expr344:
.expr342:
.expr340:
.expr338:
 call isrelational
 or  al, al
 je .expr354
;-1100         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1101         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1102         }

;-1103     return 0;

.expr354:
 mov ax, 0
 jmp .retnexpr
;-1104 }

;-1105 

;-1106 int pexpr() {//called from if, do, while

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
;-1107     expect('(');

 push 40
 call expect
 add  sp, 2
;-1108     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1109     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr355
;-1110         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1111         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr356
;-1112             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1113             return;

 jmp .retnpexpr
;-1114             }

;-1115         }

.pexpr356:
;-1116     expr();

.pexpr355:
 call expr
;-1117     if (iscmp==0) prs("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr357
 push pexpr_0
 call prs
 add  sp, 2
;-1118     prs(fname);

.pexpr357:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1119     expect(')');

 push 41
 call expect
 add  sp, 2
;-1120 }

;-1121 

;-1122 

;-1123 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1124     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
;-1125     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1126     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1127     prc(':');

 push 58
 call prc
 add  sp, 2
;-1128 }

;-1129 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1130     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
;-1131     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1132     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1133 }

;-1134 

;-1135 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1136     int c; char cha;

;-1137     int jdest; int tst; int jtemp;

;-1138     if(istoken('{')) {
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt358
;-1139         while(istoken('}')==0) stmt();

.stmt359:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt360
 call stmt
;-1140         }

 jmp .stmt359
.stmt360:
;-1141     else if(istoken(T_IF)) {

 jmp .stmt361
.stmt358:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt362
;-1142         pexpr();

 call pexpr
;-1143         nlabel++;

 inc  word[nlabel]
;-1144         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1145         pint1(jdest);

 push word [bp-6]
 call pint1
 add  sp, 2
;-1146         stmt();

 call stmt
;-1147         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt363
;-1148             nlabel++;

 inc  word[nlabel]
;-1149             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1150             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1151             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1152             stmt();

 call stmt
;-1153             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1154         }

;-1155         else prlabel(jdest);

 jmp .stmt364
.stmt363:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1156     }

.stmt364:
;-1157     else if(istoken(T_DO)) {

 jmp .stmt365
.stmt362:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt366
;-1158         nlabel++;

 inc  word[nlabel]
;-1159         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1160         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1161         stmt();

 call stmt
;-1162         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1163         pexpr();

 call pexpr
;-1164         nlabel++;

 inc  word[nlabel]
;-1165         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1166         pint1(jtemp);

 push word [bp-10]
 call pint1
 add  sp, 2
;-1167         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1168          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1169     }

;-1170     else if(istoken(T_WHILE)) {

 jmp .stmt367
.stmt366:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt368
;-1171         nlabel++;

 inc  word[nlabel]
;-1172         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1173         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1174         pexpr();

 call pexpr
;-1175         nlabel++;

 inc  word[nlabel]
;-1176         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1177         pint1(tst);

 push word [bp-8]
 call pint1
 add  sp, 2
;-1178         stmt();

 call stmt
;-1179         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1180         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1181     }

;-1182     else if(istoken(T_GOTO))  {

 jmp .stmt369
.stmt368:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370
;-1183         prs("\n jmp .");

 push stmt_0
 call prs
 add  sp, 2
;-1184         name1();

 call name1
;-1185         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1186         expect(';');

 push 59
 call expect
 add  sp, 2
;-1187     }

;-1188     else if(token==T_ASM)     {

 jmp .stmt371
.stmt370:
 mov ax, [token]
 cmp ax, 518
 jne .stmt372
;-1189       prs("\n");

 push stmt_1
 call prs
 add  sp, 2
;-1190       c=next();

 call next
 mov [bp-2], ax
;-1191       while(c != '\n') {

.stmt373:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt374
;-1192         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1193         c=next();

 call next
 mov [bp-2], ax
;-1194         };

 jmp .stmt373
.stmt374:
;-1195         token=getlex();

 call getlex
 mov word [token], ax
;-1196     }

;-1197     else if(istoken(T_EMIT)) {

 jmp .stmt375
.stmt372:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt376
;-1198       prs("\n db ");

 push stmt_2
 call prs
 add  sp, 2
;-1199     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1200       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1201       token=getlex();

 call getlex
 mov word [token], ax
;-1202       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt377
;-1203           prc(',');

 push 44
 call prc
 add  sp, 2
;-1204           goto L1;

 jmp .L1
;-1205       }

;-1206       expect(')');

.stmt377:
 push 41
 call expect
 add  sp, 2
;-1207     }

;-1208     else if(istoken(';'))      { }

 jmp .stmt378
.stmt376:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt379
;-1209     else if(istoken(T_RETURN)) {

 jmp .stmt380
.stmt379:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt381
;-1210         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt382
 call expr
;-1211         prs("\n jmp .retn");

.stmt382:
 push stmt_3
 call prs
 add  sp, 2
;-1212         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1213         nreturn++;

 inc  word[nreturn]
;-1214         expect(';');

 push 59
 call expect
 add  sp, 2
;-1215     }

;-1216     else if(thechar==':')      {

 jmp .stmt383
.stmt381:
 mov al, [thechar]
 cmp al, 58
 jne .stmt384
;-1217         prs("\n."); // Label

 push stmt_4
 call prs
 add  sp, 2
;-1218         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1219         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1220         expect(':');

 push 58
 call expect
 add  sp, 2
;-1221     }

;-1222     else  {expr();; expect(';'); }

 jmp .stmt385
.stmt384:
 call expr
 push 59
 call expect
 add  sp, 2
;-1223 }

.stmt385:
.stmt383:
.stmt380:
.stmt378:
.stmt375:
.stmt371:
.stmt369:
.stmt367:
.stmt365:
.stmt361:
;-1224 

;-1225 int isvariable() {

 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n db ",0
stmt_3 db "\n jmp .retn",0
stmt_4 db "\n.",0
ENDP

isvariable: PROC
;-1226     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable386
 jmp .v1
;-1227     if(token==T_UNSIGNED) goto v1;

.isvariable386:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable387
 jmp .v1
;-1228     if(token==T_CHAR)     goto v1;

.isvariable387:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable388
 jmp .v1
;-1229     if(token==T_INT)      goto v1;

.isvariable388:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable389
 jmp .v1
;-1230     return 0;

.isvariable389:
 mov ax, 0
 jmp .retnisvariable
;-1231 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1232 }

;-1233 

;-1234 int dofunc() {

 .retnisvariable:
 ret
ENDP

dofunc: PROC
;-1235     int nloc; int i; unsigned int j;int narg;

;-1236     cloc=&co;
;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1237     checknamelen();

 call checknamelen
;-1238     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1239     i=0;

 mov ax, 0
 mov [bp-4], ax
;-1240     while (i < FTop) {

.dofunc390:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc391
;-1241         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax
;-1242         if(eqstr(symbol, j)) error1("Function already defined");

 push word [bp-6]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dofunc392
 push dofunc_0
 call error1
 add  sp, 2
;-1243         i++;

.dofunc392:
 inc  word[bp-4]
;-1244     }

;-1245     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc390
.dofunc391:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc393
 push dofunc_1
 call error1
 add  sp, 2
;-1246     pt=adrF(FNameField, FTop);

.dofunc393:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1247     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1248     FTop++;

 inc  word[FTop]
;-1249     prs("\n\n");

 push dofunc_2
 call prs
 add  sp, 2
;-1250     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1251     prs(": PROC");

 push dofunc_3
 call prs
 add  sp, 2
;-1252     expect('(');

 push 40
 call expect
 add  sp, 2
;-1253     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1254     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc394
;-1255         narg=2;

 mov ax, 2
 mov [bp-8], ax
;-1256         do {

.dofunc395:
;-1257             typeName();

 call typeName
;-1258             addlocal();

 call addlocal
;-1259             narg+=2;

 add  word[bp-8], 2
;-1260             GData[LTop]=narg;

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1261             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc396
 add  word[bp-8], 2
;-1262                 LTop++;

.dofunc396:
 inc  word[LTop]
;-1263                 }

;-1264         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc397
 jmp .dofunc395
.dofunc397:
;-1265         expect(')');

 push 41
 call expect
 add  sp, 2
;-1266         }

;-1267 

;-1268     expect('{'); /*body*/

.dofunc394:
 push 123
 call expect
 add  sp, 2
;-1269     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1270     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1271     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1272     while(isvariable()) {

.dofunc398:
 call isvariable
 or  al, al
 je .dofunc399
;-1273         do {

.dofunc400:
;-1274             typeName();

 call typeName
;-1275             checknamelen();

 call checknamelen
;-1276             addlocal();

 call addlocal
;-1277             nloc-=2;

 sub  word[bp-2], 2
;-1278             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc401
 sub  word[bp-2], 2
;-1279             GData[LTop]=nloc;

.dofunc401:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1280             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc402
;-1281                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1282                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1283                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1284                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1285                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1286                 nloc+=2;

 add  word[bp-2], 2
;-1287                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1288             }

;-1289             LTop++;

.dofunc402:
 inc  word[LTop]
;-1290         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc403
 jmp .dofunc400
.dofunc403:
;-1291         expect(';');

 push 59
 call expect
 add  sp, 2
;-1292     }

;-1293     if (LTop>LSTART){

 jmp .dofunc398
.dofunc399:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc404
;-1294         prs(";\n ENTER  ");

 push dofunc_4
 call prs
 add  sp, 2
;-1295         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1296         prunsign1 (nloc);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1297         prs(",0");

 push dofunc_5
 call prs
 add  sp, 2
;-1298         }

;-1299 

;-1300     while(istoken('}')==0)  stmt();

.dofunc404:
.dofunc405:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc406
 call stmt
;-1301 

;-1302     if (nreturn) {

 jmp .dofunc405
.dofunc406:
 mov ax, [nreturn]
 or  al, al
 je .dofunc407
;-1303             prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2
;-1304             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1305             prc(':');

 push 58
 call prc
 add  sp, 2
;-1306         }

;-1307     if (LTop > LSTART) prs("\n LEAVE");

.dofunc407:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc408
 push dofunc_7
 call prs
 add  sp, 2
;-1308     prs("\n ret");

.dofunc408:
 push dofunc_8
 call prs
 add  sp, 2
;-1309     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1310     prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-1311     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1312     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc409
 mov ax, [maxco1]
 mov word [maxco], ax
;-1313     prs("\nENDP");

.dofunc409:
 push dofunc_9
 call prs
 add  sp, 2
;-1314 }

;-1315 

;-1316 char doglobName[IDLENMAX];

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
;-1317 int doglob() {


doglob: PROC
;-1318     int i; int j; int isstrarr;

;-1319     isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1320     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .doglob410
 push doglob_0
 call error1
 add  sp, 2
;-1321     if (iswidth == 0) error1("no VOID as var type");

.doglob410:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob411
 push doglob_1
 call error1
 add  sp, 2
;-1322     checknamelen();

.doglob411:
 call checknamelen
;-1323     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob412
 push doglob_2
 call error1
 add  sp, 2
;-1324     if (istoken('[')) {

.doglob412:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob413
;-1325         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1326         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob414
;-1327             prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2
;-1328             prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2
;-1329             prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1330             if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob415
 push doglob_5
 call prs
 add  sp, 2
;-1331             if (iswidth==2) prs(" resw ");

.doglob415:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob416
 push doglob_6
 call prs
 add  sp, 2
;-1332             if (iswidth==4) prs(" resd ");

.doglob416:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob417
 push doglob_7
 call prs
 add  sp, 2
;-1333             prunsign1(lexval);

.doglob417:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-1334             prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2
;-1335             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1336             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob418
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1337             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob418:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob419
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax
;-1338             GData[GTop]=lexval;

.doglob419:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1339             expect(']');

 push 93
 call expect
 add  sp, 2
;-1340         }else {

 jmp .doglob420
.doglob414:
;-1341             expect(']');

 push 93
 call expect
 add  sp, 2
;-1342             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob421
 push doglob_9
 call error1
 add  sp, 2
;-1343             prs("\n");

.doglob421:
 push doglob_10
 call prs
 add  sp, 2
;-1344             prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1345             prs(" db ");

 push doglob_11
 call prs
 add  sp, 2
;-1346             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1347             strcpy(doglobName, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1348             expect('=');

 push 61
 call expect
 add  sp, 2
;-1349             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob422
;-1350                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1351                 prscomment(symbol);

 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
;-1352                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1353                 prs(",0");

 push doglob_12
 call prs
 add  sp, 2
;-1354                 i=strlen(symbol);

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1355                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1356                 }

;-1357             else if (istoken('{' )) {

 jmp .doglob423
.doglob422:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob424
;-1358                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1359                 do {

.doglob425:
;-1360                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob426
 push 44
 call prc
 add  sp, 2
;-1361                     expect(T_CONST);

.doglob426:
 push 257
 call expect
 add  sp, 2
;-1362                     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1363                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1364                     }

;-1365                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob427
 jmp .doglob425
.doglob427:
;-1366                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1367             }

;-1368         else error1("String or number array expected");

 jmp .doglob428
.doglob424:
 push doglob_13
 call error1
 add  sp, 2
;-1369         };

.doglob428:
.doglob423:
.doglob420:
;-1370     }else { //expect('=');

 jmp .doglob429
.doglob413:
;-1371         prs("\n");

 push doglob_14
 call prs
 add  sp, 2
;-1372         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1373         if (istype=='*') prs(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob430
 push doglob_15
 call prs
 add  sp, 2
;-1374         else {

 jmp .doglob431
.doglob430:
;-1375             if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob432
 push doglob_16
 call prs
 add  sp, 2
;-1376             else if (iswidth==2) prs(" dw ");

 jmp .doglob433
.doglob432:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob434
 push doglob_17
 call prs
 add  sp, 2
;-1377             else                 prs(" dd ");

 jmp .doglob435
.doglob434:
 push doglob_18
 call prs
 add  sp, 2
;-1378         }

.doglob435:
.doglob433:
;-1379     if(istoken('-')) prc('-');

.doglob431:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob436
 push 45
 call prc
 add  sp, 2
;-1380     if (istoken('=')) {

.doglob436:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob437
;-1381         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1382         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1383         }else prunsign1(0);

 jmp .doglob438
.doglob437:
 push 0
 call prunsign1
 add  sp, 2
;-1384     }

.doglob438:
;-1385     GSign[GTop]=issign;

.doglob429:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1386     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1387     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1388     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1389     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob439
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1390         else strcpy(pt, symbol);

 jmp .doglob440
.doglob439:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1391     GTop++;

.doglob440:
 inc  word[GTop]
;-1392     expect(';');

 push 59
 call expect
 add  sp, 2
;-1393 }

;-1394 

;-1395 int dodefine() {

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
;-1396     int i; int j; int fdtemp;

;-1397     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine441
;-1398         token=getlex();

 call getlex
 mov word [token], ax
;-1399         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1400         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1401         return;

 jmp .retndodefine
;-1402     }

;-1403     expect(T_NAME);

.dodefine441:
 push 256
 call expect
 add  sp, 2
;-1404     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine442
;-1405         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine443
 push dodefine_1
 call error1
 add  sp, 2
;-1406         i=strlen(symbol);

.dodefine443:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1407         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine444
 push dodefine_2
 call error1
 add  sp, 2
;-1408         GSign [GTop]='U';

.dodefine444:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1409         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1410         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1411         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1412         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1413         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1414         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1415         GTop++;

 inc  word[GTop]
;-1416     }

;-1417 }

.dodefine442:
;-1418 

;-1419 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC
;-1420     token=getlex();

 call getlex
 mov word [token], ax
;-1421     do {

.parse445:
;-1422         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse446
 mov ax, 1
 jmp .retnparse
;-1423         if (istoken('#')) {

.parse446:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse447
;-1424              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse448
 call dodefine
;-1425              else error1("define expected");

 jmp .parse449
.parse448:
 push parse_0
 call error1
 add  sp, 2
;-1426         }

.parse449:
;-1427     else{

 jmp .parse450
.parse447:
;-1428         typeName();

 call typeName
;-1429         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse451
 call dofunc
;-1430         else doglob(); }

 jmp .parse452
.parse451:
 call doglob
.parse452:
;-1431     } while(1);

.parse450:
 mov ax, 1
 or  al, al
 je .parse453
 jmp .parse445
.parse453:
;-1432 }

;-1433 

;-1434 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1435 int main() {


main: PROC
;-1436     int arglen1; unsigned int i; char *c;

;-1437     isPrint=1;
;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1438     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1439     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main454
;-1440         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1441         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1442         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1443         }

;-1444     i=arglen1+129;

.main454:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1445     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1446     arglen1--;

 dec  word[bp-2]
;-1447     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1448     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1449     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main455
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4
;-1450     strcpy(namelst, namein);

.main455:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1451     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1452     i--;

 dec  word[bp-4]
;-1453     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1454     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1455 

;-1456     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1457     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main456
;-1458         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1459         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1460         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1461         }

;-1462     fdout=creatR(namelst);

.main456:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1463     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main457
;-1464         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1465         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1466         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1467         }

;-1468     prs(";");

.main457:
 push main_4
 call prs
 add  sp, 2
;-1469     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2
;-1470     prs(", Input: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
;-1471     prs(", Output: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2
;-1472     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1473     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2
;-1474     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1475     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1476     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1477     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1478     parse();

 call parse
;-1479     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1480     prs("\n;Glob. variables:"); GTop--; prunsign1(GTop);

 push main_8
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call prunsign1
 add  sp, 2
;-1481     prs(" ("); prunsign1(LSTART);

 push main_9
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1482     prs("), Functions:"); prunsign1(FTop);

 push main_10
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2
;-1483     prs(" ("); prunsign1(FUNCMAX);

 push main_11
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1484     prs("), Lines:"); prunsign1(lineno);

 push main_12
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2
;-1485     prs("\n;Constant: ");   prunsign1(maxco);

 push main_13
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2
;-1486     prs(" ("); prunsign1(COMAX);

 push main_14
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2
;-1487     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1488     if (i <= 1000)prs("\n *** Warning *** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main458
 push main_15
 call prs
 add  sp, 2
;-1489     prs("), stacksize: ");

.main458:
 push main_16
 call prs
 add  sp, 2
;-1490     i=65636; i=i-orgData;

 mov ax, 100
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1491     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1492     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main459
 push main_17
 call prs
 add  sp, 2
;-1493     end1(0);

.main459:
 push 0
 call end1
 add  sp, 2
;-1494 }

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
;Glob. variables:98 (300), Functions:71 (300), Lines:1495
;Constant: 688 (3000), stacksize: 23822