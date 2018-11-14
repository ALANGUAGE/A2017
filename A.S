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
;-86 int ireg1;

ireg1 dw 0
;-87 int mod2;

mod2 dw 0
;-88 int ireg2;

ireg2 dw 0
;-89 

;-90 int writetty()     {//ah=0x0E; bx=0; __emit__(0xCD,0x10);


writetty: PROC
;-91 asm mov ah, 14

 mov ah, 14
;-92 asm mov bx, 0

 mov bx, 0
;-93 asm int 16

 int 16
;-94 }

;-95 int putch(char c)  {

 ret
ENDP

putch: PROC
;-96     if (c==10)  {
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .putch1
;-97         asm mov al, 13

 mov al, 13
;-98         writetty();

 call writetty
;-99     }

;-100     asm mov al, [bp+4]; parameter c

.putch1:
 mov al, [bp+4]; parameter c
;-101     writetty();

 call writetty
;-102 }

;-103 int cputs(char *s) {

 LEAVE
 ret
ENDP

cputs: PROC
;-104     char c;

;-105     while(*s) {
;
 ENTER  2,0
.cputs2:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .cputs3
;-106         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-107         putch(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call putch
 add  sp, 2
;-108         s++;

 inc  word[bp+4]
;-109     }

;-110 }

 jmp .cputs2
.cputs3:
;-111 int mkneg(int n)   {

 LEAVE
 ret
ENDP

mkneg: PROC
;-112     asm mov ax, [bp+4]; parameter n
;
 ENTER  0,0
 mov ax, [bp+4]; parameter n
;-113     asm neg ax

 neg ax
;-114 }

;-115 

;-116 int DosInt() {

 LEAVE
 ret
ENDP

DosInt: PROC
;-117     asm int 33; 21h

 int 33; 21h
;-118     __emit__(0x73, 04); //jnc over DOS_ERR++

 db 115,4
;-119     DOS_ERR++;

 inc  word[DOS_ERR]
;-120 }

;-121 int openR (char *s) {

 ret
ENDP

openR: PROC
;-122     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-123     asm mov ax, 15618; ax=0x3D02;

 mov ax, 15618; ax=0x3D02;
;-124     DosInt();

 call DosInt
;-125 }

;-126 int creatR(char *s) {

 LEAVE
 ret
ENDP

creatR: PROC
;-127     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-128     asm mov cx, 0

 mov cx, 0
;-129     asm mov ax, 15360; ax=0x3C00;

 mov ax, 15360; ax=0x3C00;
;-130     DosInt();

 call DosInt
;-131 }

;-132 int fcloseR(int fd) {

 LEAVE
 ret
ENDP

fcloseR: PROC
;-133     asm mov bx, [bp+4]; bx=fd;
;
 ENTER  0,0
 mov bx, [bp+4]; bx=fd;
;-134     asm mov ax, 15872; ax=0x3E00;

 mov ax, 15872; ax=0x3E00;
;-135     DosInt();

 call DosInt
;-136 }

;-137 int exitR  (char c) {

 LEAVE
 ret
ENDP

exitR: PROC
;-138     asm mov ah, 76; ah=0x4C;
;
 ENTER  0,0
 mov ah, 76; ah=0x4C;
;-139     asm mov al, [bp+4]; al=c;

 mov al, [bp+4]; al=c;
;-140     DosInt();

 call DosInt
;-141 }

;-142 int readRL(char *s, int fd, int len){

 LEAVE
 ret
ENDP

readRL: PROC
;-143     asm mov dx, [bp+4]; dx=s;
;
 ENTER  0,0
 mov dx, [bp+4]; dx=s;
;-144     asm mov cx, [bp+8]; cx=len;

 mov cx, [bp+8]; cx=len;
;-145     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-146     asm mov ax, 16128;  ax=0x3F00;

 mov ax, 16128;  ax=0x3F00;
;-147     DosInt();

 call DosInt
;-148 }

;-149 int fputcR(char *n, int fd) {

 LEAVE
 ret
ENDP

fputcR: PROC
;-150     asm lea dx, [bp+4]; *n  todo: why not mov ?????
;
 ENTER  0,0
 lea dx, [bp+4]; *n  todo: why not mov ?????
;-151     asm mov cx, 1;      cx=1;

 mov cx, 1;      cx=1;
;-152     asm mov bx, [bp+6]; bx=fd;

 mov bx, [bp+6]; bx=fd;
;-153     asm mov ax, 16384;  ax=0x4000;

 mov ax, 16384;  ax=0x4000;
;-154     DosInt();

 call DosInt
;-155 }

;-156 

;-157 int letter(char c) {

 LEAVE
 ret
ENDP

letter: PROC
;-158       if (c=='_') return 1;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 95
 jne .letter4
 mov ax, 1
 jmp .retnletter
;-159       if (c=='.') return 1;

.letter4:
 mov al, [bp+4]
 cmp al, 46
 jne .letter5
 mov ax, 1
 jmp .retnletter
;-160       if (c=='?') return 1;

.letter5:
 mov al, [bp+4]
 cmp al, 63
 jne .letter6
 mov ax, 1
 jmp .retnletter
;-161       if (c=='$') return 1;

.letter6:
 mov al, [bp+4]
 cmp al, 36
 jne .letter7
 mov ax, 1
 jmp .retnletter
;-162       if (c> 'z') return 0;

.letter7:
 mov al, [bp+4]
 cmp al, 122
 jle .letter8
 mov ax, 0
 jmp .retnletter
;-163       if (c< '@') return 0;// at included

.letter8:
 mov al, [bp+4]
 cmp al, 64
 jge .letter9
 mov ax, 0
 jmp .retnletter
;-164       if (c> 'Z') { if (c< 'a') return 0; }

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
;-165       return 1;

.letter10:
 mov ax, 1
 jmp .retnletter
;-166 }

;-167 int digit(char c){

 .retnletter:
 LEAVE
 ret
ENDP

digit: PROC
;-168       if(c<'0') return 0;
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge .digit12
 mov ax, 0
 jmp .retndigit
;-169       if(c>'9') return 0;

.digit12:
 mov al, [bp+4]
 cmp al, 57
 jle .digit13
 mov ax, 0
 jmp .retndigit
;-170       return 1;

.digit13:
 mov ax, 1
 jmp .retndigit
;-171 }

;-172 int alnum(char c) {

 .retndigit:
 LEAVE
 ret
ENDP

alnum: PROC
;-173     if (digit (c)) return 1;
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
;-174     if (letter(c)) return 1;

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
;-175     return 0;

.alnum15:
 mov ax, 0
 jmp .retnalnum
;-176 }

;-177 

;-178 int strlen(char *s) { int c;

 .retnalnum:
 LEAVE
 ret
ENDP

strlen: PROC
;-179     c=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-180     while (*s!=0) {s++; c++;}

.strlen16:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strlen17
 inc  word[bp+4]
 inc  word[bp-2]
;-181     return c;

 jmp .strlen16
.strlen17:
 mov ax, [bp-2]
 jmp .retnstrlen
;-182 }

;-183 int strcpy(char *s, char *t) {

 .retnstrlen:
 LEAVE
 ret
ENDP

strcpy: PROC
;-184     do { *s=*t; s++; t++; }
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
;-185     while (*t!=0);

 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcpy19
 jmp .strcpy18
.strcpy19:
;-186     *s=0;

 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al
;-187     return s;

 mov ax, [bp+4]
 jmp .retnstrcpy
;-188 }

;-189 int eqstr(char *p, char *q) {

 .retnstrcpy:
 LEAVE
 ret
ENDP

eqstr: PROC
;-190     while(*p) {
;
 ENTER  0,0
.eqstr20:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr21
;-191         if (*p != *q) return 0;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  .eqstr22
 mov ax, 0
 jmp .retneqstr
;-192         p++;

.eqstr22:
 inc  word[bp+4]
;-193         q++;

 inc  word[bp+6]
;-194     }

;-195     if(*q) return 0;

 jmp .eqstr20
.eqstr21:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eqstr23
 mov ax, 0
 jmp .retneqstr
;-196     return 1; }

.eqstr23:
 mov ax, 1
 jmp .retneqstr
;-197 int strcat1(char *s, char *t) {

 .retneqstr:
 LEAVE
 ret
ENDP

strcat1: PROC
;-198     while (*s != 0) s++;
;
 ENTER  0,0
.strcat124:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  .strcat125
 inc  word[bp+4]
;-199     strcpy(s, t);

 jmp .strcat124
.strcat125:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4
;-200 }

;-201 int toupper(char *s) {

 LEAVE
 ret
ENDP

toupper: PROC
;-202     while(*s) {
;
 ENTER  0,0
.toupper26:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .toupper27
;-203         if (*s >= 'a') if (*s <= 'z') *s=*s-32;

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
;-204         s++;

.toupper29:
.toupper28:
 inc  word[bp+4]
;-205     }

;-206 }

 jmp .toupper26
.toupper27:
;-207 int instr1(char *s, char c) {

 LEAVE
 ret
ENDP

instr1: PROC
;-208     while(*s) {
;
 ENTER  0,0
.instr130:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .instr131
;-209         if (*s==c) return 1;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne .instr132
 mov ax, 1
 jmp .retninstr1
;-210         s++;

.instr132:
 inc  word[bp+4]
;-211     }

;-212     return 0;

 jmp .instr130
.instr131:
 mov ax, 0
 jmp .retninstr1
;-213 }

;-214 

;-215 int eprc(char c)  {

 .retninstr1:
 LEAVE
 ret
ENDP

eprc: PROC
;-216     *cloc=c;
;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
;-217     cloc++;

 inc  word[cloc]
;-218 }

;-219 int eprs(char *s) {

 LEAVE
 ret
ENDP

eprs: PROC
;-220     char c;

;-221     while(*s) {
;
 ENTER  2,0
.eprs33:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .eprs34
;-222         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-223         eprc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
;-224         s++;

 inc  word[bp+4]
;-225     }

;-226 }

 jmp .eprs33
.eprs34:
;-227 

;-228 int prc(unsigned char c) {

 LEAVE
 ret
ENDP

prc: PROC
;-229     if (isPrint) {
;
 ENTER  0,0
 mov al, [isPrint]
 or  al, al
 je .prc35
;-230         if (c==10) {

 mov al, [bp+4]
 cmp al, 10
 jne .prc36
;-231             asm mov ax, 13

 mov ax, 13
;-232             writetty();

 call writetty
;-233         }

;-234         asm mov al, [bp+4]; al=c;

.prc36:
 mov al, [bp+4]; al=c;
;-235         writetty();

 call writetty
;-236     }

;-237     fputcR(c, fdout);

.prc35:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4
;-238 }

;-239 

;-240 int prscomment(unsigned char *s) {

 LEAVE
 ret
ENDP

prscomment: PROC
;-241     unsigned char c;

;-242     while(*s){
;
 ENTER  2,0
.prscomment37:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prscomment38
;-243         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-244         prc(c);

 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-245         s++;

 inc  word[bp+4]
;-246     }

;-247 }

 jmp .prscomment37
.prscomment38:
;-248 

;-249 int prs(unsigned char *s) {

 LEAVE
 ret
ENDP

prs: PROC
;-250     unsigned char c; int com;

;-251     com=0;
;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax
;-252     while(*s) {

.prs39:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je .prs40
;-253         c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-254         if (c==34) if (com) com=0;

 mov al, [bp-2]
 cmp al, 34
 jne .prs41
 mov ax, [bp-4]
 or  al, al
 je .prs42
 mov ax, 0
 mov [bp-4], ax
;-255                    else com=1;

 jmp .prs43
.prs42:
 mov ax, 1
 mov [bp-4], ax
;-256         if (c==92) {

.prs43:
.prs41:
 mov al, [bp-2]
 cmp al, 92
 jne .prs44
;-257             if (com==0) {

 mov ax, [bp-4]
 cmp ax, 0
 jne .prs45
;-258                 s++;

 inc  word[bp+4]
;-259                 c=*s;

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-260                 if (c=='n') c=10;

 mov al, [bp-2]
 cmp al, 110
 jne .prs46
 mov ax, 10
 mov [bp-2], al
;-261                 if (c=='t') c= 9;

.prs46:
 mov al, [bp-2]
 cmp al, 116
 jne .prs47
 mov ax, 9
 mov [bp-2], al
;-262             }

.prs47:
;-263         }

.prs45:
;-264         prc(c);

.prs44:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-265         s++;

 inc  word[bp+4]
;-266     }

;-267 }

 jmp .prs39
.prs40:
;-268 

;-269 int eprnum(int n){//for docall1 procedure

 LEAVE
 ret
ENDP

eprnum: PROC
;-270     int e;

;-271     if(n<0) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge .eprnum48
;-272         eprc('-');

 push 45
 call eprc
 add  sp, 2
;-273         n=mkneg(n);

 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax
;-274     }

;-275     if (n >= 10) {

.eprnum48:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .eprnum49
;-276         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-277         eprnum(e);

 push word [bp-2]
 call eprnum
 add  sp, 2
;-278     }

;-279     n=n%10;

.eprnum49:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-280     n=n+'0';

 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
;-281     eprc(n);

 push word [bp+4]
 call eprc
 add  sp, 2
;-282 }

;-283 

;-284 int pint1 (int n){

 LEAVE
 ret
ENDP

pint1: PROC
;-285     int e;

;-286     if(n<0) {  prc('-');  n=mkneg(n); }
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
;-287     if (n >= 10) {

.pint150:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  .pint151
;-288         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
;-289         pint1(e);

 push word [bp-2]
 call pint1
 add  sp, 2
;-290     }

;-291     n=n%10;

.pint151:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
;-292     n += '0';

 add  word[bp+4], 48
;-293     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-294 }

;-295 

;-296 int prunsign1(unsigned int n) {

 LEAVE
 ret
ENDP

prunsign1: PROC
;-297     unsigned int e;

;-298     if (n >= 10) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 0
 jb  .prunsign152
;-299         e=n/10;

 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
;-300         prunsign1(e);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-301     }

;-302     n = n % 10; /*unsigned mod*/

.prunsign152:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
;-303     n += '0';

 add  word[bp+4], 48
;-304     prc(n);

 push word [bp+4]
 call prc
 add  sp, 2
;-305 }

;-306 

;-307 int end1(int n) {

 LEAVE
 ret
ENDP

end1: PROC
;-308     fcloseR(fdin);
;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
;-309     fcloseR(fdout);

 push word [fdout]
 call fcloseR
 add  sp, 2
;-310     exitR(n);

 push word [bp+4]
 call exitR
 add  sp, 2
;-311 }

;-312 

;-313 int error1(char *s) {

 LEAVE
 ret
ENDP

error1: PROC
;-314     isPrint=1;
;
 ENTER  0,0
 mov ax, 1
 mov byte [isPrint], al
;-315     lineno--;

 dec  word[lineno]
;-316     prs("\n ");

 push error1_0
 call prs
 add  sp, 2
;-317     prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-318     prs(";Line: ");

 push error1_1
 call prs
 add  sp, 2
;-319     prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-320     prs(" ************** ERROR: ");

 push error1_2
 call prs
 add  sp, 2
;-321     prs(s);

 push word [bp+4]
 call prs
 add  sp, 2
;-322     prs("  in column: ");

 push error1_3
 call prs
 add  sp, 2
;-323     prunsign1(column);

 push word [column]
 call prunsign1
 add  sp, 2
;-324     prs("\nToken: ");

 push error1_4
 call prs
 add  sp, 2
;-325     prunsign1(token);

 push word [token]
 call prunsign1
 add  sp, 2
;-326     prs(", symbol: ");

 push error1_5
 call prs
 add  sp, 2
;-327     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-328     end1(1);

 push 1
 call end1
 add  sp, 2
;-329 }

;-330 

;-331 int printinputline() {

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
;-332     int col;

;-333     col=0;
;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
;-334     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-335     do {

.printinputline53:
;-336         DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);

 push 1
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
;-337         if (DOS_NoBytes == 0) return;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .printinputline54
 jmp .retnprintinputline
;-338         *fgetsp=DOS_ByteRead;

.printinputline54:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
;-339         fgetsp++;

 inc  word[fgetsp]
;-340         col++;

 inc  word[bp-2]
;-341         if (col >100) error1("input line longer than 100 char");

 mov ax, [bp-2]
 cmp ax, 100
 jle .printinputline55
 push printinputline_0
 call error1
 add  sp, 2
;-342         }

.printinputline55:
;-343         while (DOS_ByteRead != 10);

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  .printinputline56
 jmp .printinputline53
.printinputline56:
;-344     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-345         prs("\n;-");

 push printinputline_1
 call prs
 add  sp, 2
;-346         prunsign1(lineno);

 push word [lineno]
 call prunsign1
 add  sp, 2
;-347         prc(' ');

 push 32
 call prc
 add  sp, 2
;-348         lineno++;

 inc  word[lineno]
;-349         prscomment(&fgetsdest);

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2
;-350 }

;-351 

;-352 int fgets1() {

 .retnprintinputline:
 LEAVE
 ret
printinputline_0 db "input line longer than 100 char",0
printinputline_1 db "\n;-",0
ENDP

fgets1: PROC
;-353     char c;

;-354     c=*fgetsp;
;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-355     if (c==0) {

 mov al, [bp-2]
 cmp al, 0
 jne .fgets157
;-356         printinputline();

 call printinputline
;-357         if (DOS_NoBytes == 0) return 0;

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne .fgets158
 mov ax, 0
 jmp .retnfgets1
;-358         fgetsp=&fgetsdest;

.fgets158:
 mov ax, fgetsdest
 mov word [fgetsp], ax
;-359         c=*fgetsp;

 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
;-360         column=0;

 mov ax, 0
 mov word [column], ax
;-361     }

;-362     fgetsp++;

.fgets157:
 inc  word[fgetsp]
;-363     column++;

 inc  word[column]
;-364     return c;

 mov al, [bp-2]
 jmp .retnfgets1
;-365 }

;-366 

;-367 int next() {

 .retnfgets1:
 LEAVE
 ret
ENDP

next: PROC
;-368     char r;

;-369     r = thechar;
;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
;-370     thechar = fgets1();

 call fgets1
 mov byte [thechar], al
;-371     return r;

 mov al, [bp-2]
 jmp .retnnext
;-372 }

;-373 

;-374 int adrF(char *s, unsigned int i) {

 .retnnext:
 LEAVE
 ret
ENDP

adrF: PROC
;-375     i << 4;//*16; IDLENMAX=15!
;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4
;-376     asm add ax, [bp+4]  ; offset s

 add ax, [bp+4]  ; offset s
;-377 }

;-378 

;-379 int printName(unsigned int i) {

 LEAVE
 ret
ENDP

printName: PROC
;-380     int j;

;-381     if (i < LSTART) {
;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .printName59
;-382         i=adrF(GNameField, i);

 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp+4], ax
;-383         prs(i);

 push word [bp+4]
 call prs
 add  sp, 2
;-384     }

;-385     else {

 jmp .printName60
.printName59:
;-386         prs("[bp");

 push printName_0
 call prs
 add  sp, 2
;-387         j = GData[i];

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
;-388         if (j>0) prc('+');

 mov ax, [bp-2]
 cmp ax, 0
 jle .printName61
 push 43
 call prc
 add  sp, 2
;-389         pint1(j);

.printName61:
 push word [bp-2]
 call pint1
 add  sp, 2
;-390         prc(']');

 push 93
 call prc
 add  sp, 2
;-391     }

;-392 }

.printName60:
;-393 

;-394 int ifEOL(char c) {//unix LF, win CRLF= 13/10, mac CR

 LEAVE
 ret
printName_0 db "[bp",0
ENDP

ifEOL: PROC
;-395     if (c == 10) return 1;//LF
;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne .ifEOL62
 mov ax, 1
 jmp .retnifEOL
;-396     if (c == 13) {//CR

.ifEOL62:
 mov al, [bp+4]
 cmp al, 13
 jne .ifEOL63
;-397         if (thechar == 10) c=next();

 mov al, [thechar]
 cmp al, 10
 jne .ifEOL64
 call next
 mov [bp+4], al
;-398         return 1;

.ifEOL64:
 mov ax, 1
 jmp .retnifEOL
;-399     }

;-400     return 0;

.ifEOL63:
 mov ax, 0
 jmp .retnifEOL
;-401 }

;-402 

;-403 char symboltemp[80];

 .retnifEOL:
 LEAVE
 ret
ENDP
section .bss
absolute 41657
symboltemp resb 80
section .text
;-404 

;-405 int getlex() {


getlex: PROC
;-406     char c; char *p;

;-407     int i; int j;

;-408 g1: c=next();
;
 ENTER  8,0
.g1:
 call next
 mov [bp-2], al
;-409     if (c == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne .getlex65
 mov ax, 0
 jmp .retngetlex
;-410     if (c <= ' ') goto g1;

.getlex65:
 mov al, [bp-2]
 cmp al, 32
 jg  .getlex66
 jmp .g1
;-411   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

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
;-412   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

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
;-413   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

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
;-414   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

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
;-415   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

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
;-416   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

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
;-417   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

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
;-418   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

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
;-419   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

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
;-420   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

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
;-421   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

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
;-422   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}

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
;-423   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

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
;-424   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}

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
;-425   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

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
;-426   if (c == '/') {

.getlex95:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex96
;-427       if (thechar == '/') {

 mov al, [thechar]
 cmp al, 47
 jne .getlex97
;-428           do c=next();

.getlex98:
 call next
 mov [bp-2], al
;-429           while(ifEOL(c)==0) return getlex();

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
;-430       }

;-431   }

.getlex97:
;-432   if (c == '/') {

.getlex96:
 mov al, [bp-2]
 cmp al, 47
 jne .getlex100
;-433       if (thechar == '*') {

 mov al, [thechar]
 cmp al, 42
 jne .getlex101
;-434           g2: c=next();

.g2:
 call next
 mov [bp-2], al
;-435           if (c != '*') goto g2;

 mov al, [bp-2]
 cmp al, 42
 je  .getlex102
 jmp .g2
;-436           if (thechar != '/') goto g2;

.getlex102:
 mov al, [thechar]
 cmp al, 47
 je  .getlex103
 jmp .g2
;-437           c=next();

.getlex103:
 call next
 mov [bp-2], al
;-438           return getlex();

 call getlex
 jmp .retngetlex
;-439       } else  return '/';

 jmp .getlex104
.getlex101:
 mov ax, 47
 jmp .retngetlex
;-440   }

.getlex104:
;-441   if (c == '"') {

.getlex100:
 mov al, [bp-2]
 cmp al, 34
 jne .getlex105
;-442       p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-443       c=next();

 call next
 mov [bp-2], al
;-444       while (c != '"') {

.getlex106:
 mov al, [bp-2]
 cmp al, 34
 je  .getlex107
;-445           *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-446           p++;

 inc  word[bp-4]
;-447           c=next();

 call next
 mov [bp-2], al
;-448           }

;-449           *p=0;

 jmp .getlex106
.getlex107:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-450       return T_STRING;

 mov ax, 258
 jmp .retngetlex
;-451   }

;-452   if (digit(c)) {

.getlex105:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex108
;-453       lexval=0;

 mov ax, 0
 mov word [lexval], ax
;-454       lexval=c-'0'; // lexval=int hi=0, c=char

 mov al, [bp-2]
 sub al, 48
 mov word [lexval], ax
;-455       if (thechar=='x') thechar='X';

 mov al, [thechar]
 cmp al, 120
 jne .getlex109
 mov ax, 88
 mov byte [thechar], al
;-456       if (thechar=='X') {

.getlex109:
 mov al, [thechar]
 cmp al, 88
 jne .getlex110
;-457           next();

 call next
;-458           while(alnum(thechar)) {

.getlex111:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex112
;-459               c=next();

 call next
 mov [bp-2], al
;-460               if(c>96) c=c-39;

 mov al, [bp-2]
 cmp al, 96
 jle .getlex113
 mov al, [bp-2]
 sub al, 39
 mov [bp-2], al
;-461       	       if (c>64) c=c-7;

.getlex113:
 mov al, [bp-2]
 cmp al, 64
 jle .getlex114
 mov al, [bp-2]
 sub al, 7
 mov [bp-2], al
;-462                c=c-48;

.getlex114:
 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-463                lexval=lexval << 4; // * 16

 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax
;-464                i=0;

 mov ax, 0
 mov [bp-6], ax
;-465                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-466                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-467            }

;-468        }else {

 jmp .getlex111
.getlex112:
 jmp .getlex115
.getlex110:
;-469            while(digit(thechar)) {

.getlex116:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je .getlex117
;-470                c=next();

 call next
 mov [bp-2], al
;-471                c=c-48;

 mov al, [bp-2]
 sub al, 48
 mov [bp-2], al
;-472                lexval=lexval*10;

 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax
;-473                i=0;

 mov ax, 0
 mov [bp-6], ax
;-474                i=c;

 mov al, [bp-2]
 mov [bp-6], ax
;-475                lexval=lexval+i;

 mov ax, [lexval]
 add ax, [bp-6]
 mov word [lexval], ax
;-476            }

;-477        }

 jmp .getlex116
.getlex117:
;-478       return T_CONST;

.getlex115:
 mov ax, 257
 jmp .retngetlex
;-479   }

;-480   if (c==39) {

.getlex108:
 mov al, [bp-2]
 cmp al, 39
 jne .getlex118
;-481       lexval=next();

 call next
 mov word [lexval], ax
;-482       if (lexval==92) {

 mov ax, [lexval]
 cmp ax, 92
 jne .getlex119
;-483           lexval=next();

 call next
 mov word [lexval], ax
;-484           if (lexval=='n') lexval=10;

 mov ax, [lexval]
 cmp ax, 110
 jne .getlex120
 mov ax, 10
 mov word [lexval], ax
;-485           if (lexval=='t') lexval= 9;

.getlex120:
 mov ax, [lexval]
 cmp ax, 116
 jne .getlex121
 mov ax, 9
 mov word [lexval], ax
;-486           if (lexval=='0') lexval= 0;

.getlex121:
 mov ax, [lexval]
 cmp ax, 48
 jne .getlex122
 mov ax, 0
 mov word [lexval], ax
;-487       }

.getlex122:
;-488       next();

.getlex119:
 call next
;-489       return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-490   }

;-491   if (alnum(c)) {

.getlex118:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex123
;-492     strcpy(symboltemp, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [symboltemp]
 push ax
 call strcpy
 add  sp, 4
;-493     p=&symbol;

 mov ax, symbol
 mov [bp-4], ax
;-494     *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-495     p++;

 inc  word[bp-4]
;-496     while(alnum(thechar)) {

.getlex124:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call alnum
 add  sp, 2
 or  al, al
 je .getlex125
;-497         c=next();

 call next
 mov [bp-2], al
;-498         *p=c;

 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
;-499         p++;

 inc  word[bp-4]
;-500     }

;-501     *p=0;

 jmp .getlex124
.getlex125:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al
;-502     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex126
 mov ax, 531
 jmp .retngetlex
;-503     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

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
;-504     if (eqstr(symbol,"void"    )) return T_VOID;

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
;-505     if (eqstr(symbol,"int"     )) return T_INT;

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
;-506     if (eqstr(symbol,"long"    )) return T_LONG;

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
;-507     if (eqstr(symbol,"char"    )) return T_CHAR;

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
;-508     if (eqstr(symbol,"asm"     )) return T_ASM;

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
;-509     if (eqstr(symbol,"__emit__")) return T_EMIT;

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
;-510     if (eqstr(symbol,"return"  )) return T_RETURN;

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
;-511     if (eqstr(symbol,"if"      )) return T_IF;

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
;-512     if (eqstr(symbol,"else"    )) return T_ELSE;

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
;-513     if (eqstr(symbol,"while"   )) return T_WHILE;

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
;-514     if (eqstr(symbol,"do"      )) return T_DO;

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
;-515     if (eqstr(symbol,"goto"    )) return T_GOTO;

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
;-516     if (eqstr(symbol,"define"  )) return T_DEFINE;

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
;-517 

;-518     i=0;//convert define to value

.getlex140:
 mov ax, 0
 mov [bp-6], ax
;-519     while (i < GTop) {

.getlex141:
 mov ax, [bp-6]
 cmp ax, [GTop]
 jge .getlex142
;-520         j=adrF(GNameField, i);

 push word [bp-6]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-8], ax
;-521         if (eqstr(symbol,j)) {

 push word [bp-8]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .getlex143
;-522             if (GType[i]=='#') {

 mov bx, [bp-6]
 mov al, [GType + bx]
 cmp al, 35
 jne .getlex144
;-523                 lexval=GData[i];

 mov bx, [bp-6]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax
;-524                 strcpy(symbol, symboltemp);

 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
;-525                 return T_CONST;

 mov ax, 257
 jmp .retngetlex
;-526             }

;-527         }

.getlex144:
;-528         i++;

.getlex143:
 inc  word[bp-6]
;-529     }

;-530     return T_NAME; } error1("Input item not recognized");

 jmp .getlex141
.getlex142:
 mov ax, 256
 jmp .retngetlex
.getlex123:
 push getlex_16
 call error1
 add  sp, 2
;-531 }

;-532 

;-533 int istoken(int t) {

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
;-534     if (token == t) {
;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne .istoken145
;-535         token=getlex();

 call getlex
 mov word [token], ax
;-536         return 1;

 mov ax, 1
 jmp .retnistoken
;-537     }

;-538     return 0;

.istoken145:
 mov ax, 0
 jmp .retnistoken
;-539 }

;-540 

;-541 int expect(int t) {

 .retnistoken:
 LEAVE
 ret
ENDP

expect: PROC
;-542     if (istoken(t)==0) {
;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .expect146
;-543         *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-544         prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-545         prs("\nExpected ASCII(dez): ");

 push expect_0
 call prs
 add  sp, 2
;-546         pint1(t);

 push word [bp+4]
 call pint1
 add  sp, 2
;-547         error1(" not found");

 push expect_1
 call error1
 add  sp, 2
;-548     }

;-549 }

.expect146:
;-550 

;-551 int v(unsigned int i) {//value

 LEAVE
 ret
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0
ENDP

v: PROC
;-552     if (i < LSTART) prc('[');
;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 300
 jge .v147
 push 91
 call prc
 add  sp, 2
;-553     printName(i);

.v147:
 push word [bp+4]
 call printName
 add  sp, 2
;-554     if (i < LSTART) prc(']');

 mov ax, [bp+4]
 cmp ax, 300
 jge .v148
 push 93
 call prc
 add  sp, 2
;-555 }

.v148:
;-556 int checknamelen() {

 LEAVE
 ret
ENDP

checknamelen: PROC
;-557     int i;

;-558     i=strlen(symbol);
;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-559     if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle .checknamelen149
 push checknamelen_0
 call error1
 add  sp, 2
;-560 }

.checknamelen149:
;-561 

;-562 int checkName() {

 LEAVE
 ret
checknamelen_0 db "Item name is too long in characters)",0
ENDP

checkName: PROC
;-563     unsigned int i; unsigned int j;

;-564     i=LSTART;
;
 ENTER  4,0
 mov ax, 300
 mov [bp-2], ax
;-565     while(i<LTop) {

.checkName150:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge .checkName151
;-566         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-567         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName152
 mov ax, [bp-2]
 jmp .retncheckName
;-568         i++;

.checkName152:
 inc  word[bp-2]
;-569     }

;-570     i=1;

 jmp .checkName150
.checkName151:
 mov ax, 1
 mov [bp-2], ax
;-571     while(i<GTop) {

.checkName153:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge .checkName154
;-572         j=adrF(GNameField, i);

 push word [bp-2]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-4], ax
;-573         if(eqstr(symbol,j))return i;

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkName155
 mov ax, [bp-2]
 jmp .retncheckName
;-574         i++;

.checkName155:
 inc  word[bp-2]
;-575     }

;-576     return 0;

 jmp .checkName153
.checkName154:
 mov ax, 0
 jmp .retncheckName
;-577 }

;-578 

;-579 int searchname() {

 .retncheckName:
 LEAVE
 ret
ENDP

searchname: PROC
;-580     unsigned int i;

;-581     i=checkName();
;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
;-582     if (i == 0) error1("Variable unknown");

 mov ax, [bp-2]
 cmp ax, 0
 jne .searchname156
 push searchname_0
 call error1
 add  sp, 2
;-583     return i;

.searchname156:
 mov ax, [bp-2]
 jmp .retnsearchname
;-584 }

;-585 

;-586 int name1() {

 .retnsearchname:
 LEAVE
 ret
searchname_0 db "Variable unknown",0
ENDP

name1: PROC
;-587     if (token!=T_NAME) error1("Name expected");

 mov ax, [token]
 cmp ax, 256
 je  .name1157
 push name1_0
 call error1
 add  sp, 2
;-588     token=getlex();

.name1157:
 call getlex
 mov word [token], ax
;-589 }

;-590 

;-591 int typeName() {

 ret
name1_0 db "Name expected",0
ENDP

typeName: PROC
;-592     int m; //0=V,1=*,2=&

;-593     issign='S';
;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al
;-594     if(istoken(T_SIGNED))   issign='S';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je .typeName158
 mov ax, 83
 mov byte [issign], al
;-595     if(istoken(T_UNSIGNED)) issign='U';

.typeName158:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je .typeName159
 mov ax, 85
 mov byte [issign], al
;-596     iswidth=2;

.typeName159:
 mov ax, 2
 mov byte [iswidth], al
;-597     if(istoken(T_VOID))     iswidth=0;

 push 529
 call istoken
 add  sp, 2
 or  al, al
 je .typeName160
 mov ax, 0
 mov byte [iswidth], al
;-598     if(istoken(T_CHAR))     iswidth=1;

.typeName160:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je .typeName161
 mov ax, 1
 mov byte [iswidth], al
;-599     if(istoken(T_INT))      iswidth=2;

.typeName161:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je .typeName162
 mov ax, 2
 mov byte [iswidth], al
;-600     if(istoken(T_LONG))     iswidth=4;

.typeName162:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je .typeName163
 mov ax, 4
 mov byte [iswidth], al
;-601     istype='V';

.typeName163:
 mov ax, 86
 mov byte [istype], al
;-602     m=0;

 mov ax, 0
 mov [bp-2], ax
;-603     if(istoken('*'))  {istype='*'; m=1;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .typeName164
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
;-604     if(istoken('&'))  {istype='&'; m=2;}

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
;-605     name1();

.typeName165:
 call name1
;-606     return m;

 mov ax, [bp-2]
 jmp .retntypeName
;-607 }

;-608 

;-609 int gettypes(int i) {

 .retntypeName:
 LEAVE
 ret
ENDP

gettypes: PROC
;-610     char c;

;-611     c=GSign [i];
;
 ENTER  2,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-2], al
;-612     if (c=='S') signi =1;  else signi =0;

 mov al, [bp-2]
 cmp al, 83
 jne .gettypes166
 mov ax, 1
 mov word [signi], ax
 jmp .gettypes167
.gettypes166:
 mov ax, 0
 mov word [signi], ax
;-613     c=GWidth[i];

.gettypes167:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-2], al
;-614     widthi=0;

 mov ax, 0
 mov word [widthi], ax
;-615     wi=0;

 mov ax, 0
 mov word [wi], ax
;-616     if (c==1) {widthi=1;wi=1;}

 mov al, [bp-2]
 cmp al, 1
 jne .gettypes168
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax
;-617     if (c==2) {widthi=2;wi=2;}

.gettypes168:
 mov al, [bp-2]
 cmp al, 2
 jne .gettypes169
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax
;-618     if (c==4) {widthi=4;wi=4;}

.gettypes169:
 mov al, [bp-2]
 cmp al, 4
 jne .gettypes170
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax
;-619     c=GType [i];

.gettypes170:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-2], al
;-620     typei=0;

 mov ax, 0
 mov word [typei], ax
;-621     if (c=='*') {typei=1;wi=2;}

 mov al, [bp-2]
 cmp al, 42
 jne .gettypes171
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax
;-622     if (c=='&')  typei=2;

.gettypes171:
 mov al, [bp-2]
 cmp al, 38
 jne .gettypes172
 mov ax, 2
 mov word [typei], ax
;-623     return i;

.gettypes172:
 mov ax, [bp+4]
 jmp .retngettypes
;-624 }

;-625 

;-626 int addlocal() {

 .retngettypes:
 LEAVE
 ret
ENDP

addlocal: PROC
;-627     if(LTop >= VARMAX) error1("Local variable table full");

 mov ax, [LTop]
 cmp ax, 400 ;unsigned : 1
 jl  .addlocal173
 push addlocal_0
 call error1
 add  sp, 2
;-628     if (checkName() != 0) error1("Variable already defined");

.addlocal173:
 call checkName
 cmp ax, 0
 je  .addlocal174
 push addlocal_1
 call error1
 add  sp, 2
;-629     GSign[LTop]=issign;

.addlocal174:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
;-630     GWidth[LTop]=iswidth;

 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
;-631     GType[LTop]=istype;

 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al
;-632     pt=adrF(GNameField, LTop);

 push word [LTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-633     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-634 }

;-635 

;-636 

;-637 int cmpneg(int ids) {

 ret
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0
ENDP

cmpneg: PROC
;-638        if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne .cmpneg175
 push cmpneg_0
 call prs
 add  sp, 2
;-639   else if(iscmp==T_NE) prs("\n je  .");         //ZF=1

 jmp .cmpneg176
.cmpneg175:
 mov ax, [iscmp]
 cmp ax, 807
 jne .cmpneg177
 push cmpneg_1
 call prs
 add  sp, 2
;-640   else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF

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
;-641                            else prs("\n ja  .");//ZF=0 CF=0

 jmp .cmpneg181
.cmpneg180:
 push cmpneg_3
 call prs
 add  sp, 2
;-642   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

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
;-643                                prs("\n jl  .");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2
;-644                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp .cmpneg185
.cmpneg184:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2
;-645                                prs("\n jb  .");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2
;-646   else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF

.cmpneg185:
 jmp .cmpneg186
.cmpneg183:
 mov ax, [iscmp]
 cmp ax, 60
 jne .cmpneg187
 push cmpneg_8
 call prs
 add  sp, 2
;-647   else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF

 jmp .cmpneg188
.cmpneg187:
 mov ax, [iscmp]
 cmp ax, 62
 jne .cmpneg189
 push cmpneg_9
 call prs
 add  sp, 2
;-648   else error1("internal error compare unknown in CMPNEG()");

 jmp .cmpneg190
.cmpneg189:
 push cmpneg_10
 call error1
 add  sp, 2
;-649 }

.cmpneg190:
.cmpneg188:
.cmpneg186:
.cmpneg182:
.cmpneg178:
.cmpneg176:
;-650 

;-651 int isrelational() {

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
;-652     if (token==T_EQ) goto w;

 mov ax, [token]
 cmp ax, 806
 jne .isrelational191
 jmp .w
;-653     if (token==T_NE) goto w;

.isrelational191:
 mov ax, [token]
 cmp ax, 807
 jne .isrelational192
 jmp .w
;-654     if (token==T_LE) goto w;

.isrelational192:
 mov ax, [token]
 cmp ax, 824
 jne .isrelational193
 jmp .w
;-655     if (token==T_GE) goto w;

.isrelational193:
 mov ax, [token]
 cmp ax, 811
 jne .isrelational194
 jmp .w
;-656     if (token=='<' ) goto w;

.isrelational194:
 mov ax, [token]
 cmp ax, 60
 jne .isrelational195
 jmp .w
;-657     if (token=='>' ) goto w;

.isrelational195:
 mov ax, [token]
 cmp ax, 62
 jne .isrelational196
 jmp .w
;-658     return 0;

.isrelational196:
 mov ax, 0
 jmp .retnisrelational
;-659 w:  iscmp=token;

.w:
 mov ax, [token]
 mov word [iscmp], ax
;-660     token=getlex();

 call getlex
 mov word [token], ax
;-661     return 1;

 mov ax, 1
 jmp .retnisrelational
;-662 }

;-663 

;-664 int checkreg() { // >=17 = 16bit, >=47 = 32bit

 .retnisrelational:
 ret
ENDP

checkreg: PROC
;-665 

;-666     return 0; // todo:  no reg allowed anymore

 mov ax, 0
 jmp .retncheckreg
;-667 

;-668   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge .checkreg197
 mov ax, 0
 jmp .retncheckreg
;-669   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

.checkreg197:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg198
 mov ax, 1
 jmp .retncheckreg
.checkreg198:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg199
 mov ax, 3
 jmp .retncheckreg
;-670   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

.checkreg199:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg200
 mov ax, 5
 jmp .retncheckreg
.checkreg200:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg201
 mov ax, 7
 jmp .retncheckreg
;-671   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

.checkreg201:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg202
 mov ax, 9
 jmp .retncheckreg
.checkreg202:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg203
 mov ax, 11
 jmp .retncheckreg
;-672   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

.checkreg203:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg204
 mov ax, 13
 jmp .retncheckreg
.checkreg204:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg205
 mov ax, 15
 jmp .retncheckreg
;-673   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

.checkreg205:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg206
 mov ax, 17
 jmp .retncheckreg
.checkreg206:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg207
 mov ax, 19
 jmp .retncheckreg
;-674   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

.checkreg207:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg208
 mov ax, 21
 jmp .retncheckreg
.checkreg208:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg209
 mov ax, 23
 jmp .retncheckreg
;-675   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

.checkreg209:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg210
 mov ax, 25
 jmp .retncheckreg
.checkreg210:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg211
 mov ax, 27
 jmp .retncheckreg
;-676   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

.checkreg211:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg212
 mov ax, 29
 jmp .retncheckreg
.checkreg212:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg213
 mov ax, 31
 jmp .retncheckreg
;-677   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

.checkreg213:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg214
 mov ax, 33
 jmp .retncheckreg
.checkreg214:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg215
 mov ax, 35
 jmp .retncheckreg
;-678   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

.checkreg215:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg216
 mov ax, 37
 jmp .retncheckreg
.checkreg216:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg217
 mov ax, 39
 jmp .retncheckreg
;-679   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

.checkreg217:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg218
 mov ax, 41
 jmp .retncheckreg
.checkreg218:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg219
 mov ax, 43
 jmp .retncheckreg
;-680   // (eqstr(symbol,"ip")) return 45;

;-681   if (strlen(symbol) >   3) return 0;

.checkreg219:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle .checkreg220
 mov ax, 0
 jmp .retncheckreg
;-682   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

.checkreg220:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg221
 mov ax, 47
 jmp .retncheckreg
.checkreg221:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg222
 mov ax, 50
 jmp .retncheckreg
;-683   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

.checkreg222:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg223
 mov ax, 53
 jmp .retncheckreg
.checkreg223:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg224
 mov ax, 56
 jmp .retncheckreg
;-684   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

.checkreg224:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg225
 mov ax, 59
 jmp .retncheckreg
.checkreg225:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg226
 mov ax, 62
 jmp .retncheckreg
;-685   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

.checkreg226:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg227
 mov ax, 65
 jmp .retncheckreg
.checkreg227:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .checkreg228
 mov ax, 68
 jmp .retncheckreg
;-686 //  if (eqstr(symbol,"cr0")) return 71;

;-687   return 0;

.checkreg228:
 mov ax, 0
 jmp .retncheckreg
;-688 }

;-689 

;-690 char printregstr[]

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
;-691 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedi",0
;-692 

;-693 int printreg(int i) {


printreg: PROC
;-694     unsigned int k; unsigned char c;

;-695     k = &printregstr + i;
;
 ENTER  4,0
 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-696     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-697     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-698     i++;

 inc  word[bp+4]
;-699     k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-700     c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-701     prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-702     if (i > 47) {

 mov ax, [bp+4]
 cmp ax, 47
 jle .printreg229
;-703         i++;

 inc  word[bp+4]
;-704         k = &printregstr + i;

 mov ax, printregstr
 add ax, [bp+4]
 mov [bp-2], ax
;-705         c=*k;

 mov bx, [bp-2]
 mov ax, [bx]
 mov [bp-4], al
;-706         prc(c);

 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
;-707         }

;-708 }

.printreg229:
;-709 

;-710 char ops[5];

 LEAVE
 ret
ENDP
section .bss
absolute 41737
ops resb 5
section .text
;-711 int doreg1(int iscmp1) {


doreg1: PROC
;-712     int i;

;-713     if (istoken('='))          strcpy(ops, "mov");
;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1230
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-714     if (istoken(T_PLUSASS))    strcpy(ops, "add");

.doreg1230:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1231
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-715     if (istoken(T_MINUSASS))   strcpy(ops, "sub");

.doreg1231:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1232
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-716     if (istoken(T_ANDASS))     strcpy(ops, "and");

.doreg1232:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1233
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-717     if (istoken(T_ORASS))      strcpy(ops, "or" );

.doreg1233:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1234
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-718     if (istoken(T_LESSLESS))   strcpy(ops, "shl");

.doreg1234:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1235
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-719     if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

.doreg1235:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1236
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-720     if (iscmp1 == 1) {

.doreg1236:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1237
;-721             token=getlex();

 call getlex
 mov word [token], ax
;-722             if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne .doreg1238
 push doreg1_7
 call error1
 add  sp, 2
;-723             strcpy(ops, "cmp");

.doreg1238:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4
;-724         }

;-725     prs("\n ");

.doreg1237:
 push doreg1_9
 call prs
 add  sp, 2
;-726     prs(ops);

 lea  ax, [ops]
 push ax
 call prs
 add  sp, 2
;-727     prs("  ");

 push doreg1_10
 call prs
 add  sp, 2
;-728     printreg(ireg1);

 push word [ireg1]
 call printreg
 add  sp, 2
;-729     prs(", ");

 push doreg1_11
 call prs
 add  sp, 2
;-730 

;-731     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doreg1239
;-732         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-733         goto reg1;

 jmp .reg1
;-734         }

;-735     mod2=typeName();

.doreg1239:
 call typeName
 mov word [mod2], ax
;-736     ireg2=checkreg();

 call checkreg
 mov word [ireg2], ax
;-737     if (ireg2) {

 mov ax, [ireg2]
 or  al, al
 je .doreg1240
;-738         printreg(ireg2);

 push word [ireg2]
 call printreg
 add  sp, 2
;-739         goto reg1;

 jmp .reg1
;-740         }

;-741     i=searchname();

.doreg1240:
 call searchname
 mov [bp-2], ax
;-742     if (mod2 == 2) printName(i);

 mov ax, [mod2]
 cmp ax, 2
 jne .doreg1241
 push word [bp-2]
 call printName
 add  sp, 2
;-743         else v(i);

 jmp .doreg1242
.doreg1241:
 push word [bp-2]
 call v
 add  sp, 2
;-744 reg1: if (iscmp1 == 1) {

.doreg1242:
.reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne .doreg1243
;-745     cmpneg(0);

 push 0
 call cmpneg
 add  sp, 2
;-746     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-747     expect(')');

 push 41
 call expect
 add  sp, 2
;-748     }

;-749 }

.doreg1243:
;-750 

;-751 int compoundass(char *op, int mode, int id1) {

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
;-752     if(mode) error1("only scalar variable allowed");
;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je .compoundass244
 push compoundass_0
 call error1
 add  sp, 2
;-753     prs("\n ");

.compoundass244:
 push compoundass_1
 call prs
 add  sp, 2
;-754     prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-755     prs("  ");

 push compoundass_2
 call prs
 add  sp, 2
;-756     gettypes(id1);

 push word [bp+8]
 call gettypes
 add  sp, 2
;-757     if (wi==2) prs("word");

 mov ax, [wi]
 cmp ax, 2
 jne .compoundass245
 push compoundass_3
 call prs
 add  sp, 2
;-758         else prs("byte");

 jmp .compoundass246
.compoundass245:
 push compoundass_4
 call prs
 add  sp, 2
;-759     v(id1);

.compoundass246:
 push word [bp+8]
 call v
 add  sp, 2
;-760     prs(", ");

 push compoundass_5
 call prs
 add  sp, 2
;-761     expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-762     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-763 }

;-764 

;-765 int dovar1(int mode, int op, int ixarr, int id1) {

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
;-766     gettypes(id1);
;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2
;-767     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .dovar1247
;-768         prs("\n mov bx, ");

 push dovar1_0
 call prs
 add  sp, 2
;-769         v(id1); prs("\n ");

 push word [bp+10]
 call v
 add  sp, 2
 push dovar1_1
 call prs
 add  sp, 2
;-770         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-771         if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne .dovar1248
 push dovar1_2
 call prs
 add  sp, 2
;-772         if(widthi == 2) prs(" ax, [bx]");

.dovar1248:
 mov ax, [widthi]
 cmp ax, 2
 jne .dovar1249
 push dovar1_3
 call prs
 add  sp, 2
;-773         return;

.dovar1249:
 jmp .retndovar1
;-774         }

;-775     if (mode==2){// & = adr

.dovar1247:
 mov ax, [bp+4]
 cmp ax, 2
 jne .dovar1250
;-776         prs("\n ");

 push dovar1_4
 call prs
 add  sp, 2
;-777         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-778         prs(" ax, ");

 push dovar1_5
 call prs
 add  sp, 2
;-779         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-780         return;

 jmp .retndovar1
;-781         }

;-782     if (ixarr) {//array

.dovar1250:
 mov ax, [bp+8]
 or  al, al
 je .dovar1251
;-783         prs("\n mov bx, ");

 push dovar1_6
 call prs
 add  sp, 2
;-784         v(ixarr);

 push word [bp+8]
 call v
 add  sp, 2
;-785         if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1252
 push dovar1_7
 call prs
 add  sp, 2
;-786         prs("\n ");

.dovar1252:
 push dovar1_8
 call prs
 add  sp, 2
;-787         prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-788         if (wi==2) prs(" ax, ");

 mov ax, [wi]
 cmp ax, 2
 jne .dovar1253
 push dovar1_9
 call prs
 add  sp, 2
;-789             else prs(" al, ");

 jmp .dovar1254
.dovar1253:
 push dovar1_10
 call prs
 add  sp, 2
;-790         prc('[');

.dovar1254:
 push 91
 call prc
 add  sp, 2
;-791         printName(id1);

 push word [bp+10]
 call printName
 add  sp, 2
;-792         prs(" + bx]");

 push dovar1_11
 call prs
 add  sp, 2
;-793         return;

 jmp .retndovar1
;-794         }

;-795     prs("\n ");

.dovar1251:
 push dovar1_12
 call prs
 add  sp, 2
;-796     prs(op);

 push word [bp+6]
 call prs
 add  sp, 2
;-797     if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .dovar1255
 push dovar1_13
 call prs
 add  sp, 2
;-798     if(wi==2) prs(" ax, ");

.dovar1255:
 mov ax, [wi]
 cmp ax, 2
 jne .dovar1256
 push dovar1_14
 call prs
 add  sp, 2
;-799     if(wi==4) prs(" eax, ");

.dovar1256:
 mov ax, [wi]
 cmp ax, 4
 jne .dovar1257
 push dovar1_15
 call prs
 add  sp, 2
;-800     v(id1);

.dovar1257:
 push word [bp+10]
 call v
 add  sp, 2
;-801 }

;-802 

;-803 int rterm(char *op) {

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
;-804     int mode; int opint; int ixarr; int id1;

;-805     if (istoken(T_CONST)) {
;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .rterm258
;-806         prs("\n ");

 push rterm_0
 call prs
 add  sp, 2
;-807         prs(op);

 push word [bp+4]
 call prs
 add  sp, 2
;-808         if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne .rterm259
 push rterm_1
 call prs
 add  sp, 2
;-809         if (wi==2) prs(" ax, ");

.rterm259:
 mov ax, [wi]
 cmp ax, 2
 jne .rterm260
 push rterm_2
 call prs
 add  sp, 2
;-810         if (wi==4) prs(" eax, ");

.rterm260:
 mov ax, [wi]
 cmp ax, 4
 jne .rterm261
 push rterm_3
 call prs
 add  sp, 2
;-811         prunsign1(lexval);

.rterm261:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-812         return;

 jmp .retnrterm
;-813         }

;-814     mode=typeName();

.rterm258:
 call typeName
 mov [bp-2], ax
;-815     id1=searchname();

 call searchname
 mov [bp-8], ax
;-816     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-817     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .rterm262
;-818         ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-819         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-820         expect(']');

 push 93
 call expect
 add  sp, 2
;-821         gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-822         if (widthi != 2) error1("Array index must be int");

 mov ax, [widthi]
 cmp ax, 2
 je  .rterm263
 push rterm_4
 call error1
 add  sp, 2
;-823         }

.rterm263:
;-824     if (eqstr(symbol,"ax")) return;

.rterm262:
 push rterm_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .rterm264
 jmp .retnrterm
;-825     opint=op;

.rterm264:
 mov ax, [bp+4]
 mov [bp-4], ax
;-826     dovar1(mode, opint, ixarr, id1);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8
;-827 }

;-828 

;-829 int doassign(int mode, int i, int ixarr, int ixconst) {

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
;-830     gettypes(i);
;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2
;-831     if (mode==1) {// * = ptr

 mov ax, [bp+4]
 cmp ax, 1
 jne .doassign265
;-832         prs("\n mov  bx, ");

 push doassign_0
 call prs
 add  sp, 2
;-833         v(i);

 push word [bp+6]
 call v
 add  sp, 2
;-834         if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne .doassign266
 push doassign_1
 call prs
 add  sp, 2
;-835             else  prs("\n mov  [bx], al");

 jmp .doassign267
.doassign266:
 push doassign_2
 call prs
 add  sp, 2
;-836         return;

.doassign267:
 jmp .retndoassign
;-837         }

;-838     if (mode==2) {// & = adr

.doassign265:
 mov ax, [bp+4]
 cmp ax, 2
 jne .doassign268
;-839         prs("\n mov  ");

 push doassign_3
 call prs
 add  sp, 2
;-840         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-841         prs(", ax");

 push doassign_4
 call prs
 add  sp, 2
;-842         return;

 jmp .retndoassign
;-843         }

;-844     if (ixarr) {

.doassign268:
 mov ax, [bp+8]
 or  al, al
 je .doassign269
;-845         prs("\n mov bx, ");

 push doassign_5
 call prs
 add  sp, 2
;-846         if(ixconst) prunsign1(ixarr);

 mov ax, [bp+10]
 or  al, al
 je .doassign270
 push word [bp+8]
 call prunsign1
 add  sp, 2
;-847             else v(ixarr);

 jmp .doassign271
.doassign270:
 push word [bp+8]
 call v
 add  sp, 2
;-848         if (wi==2) prs("\n shl bx, 1");

.doassign271:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign272
 push doassign_6
 call prs
 add  sp, 2
;-849         prs("\n mov [");

.doassign272:
 push doassign_7
 call prs
 add  sp, 2
;-850         printName(i);

 push word [bp+6]
 call printName
 add  sp, 2
;-851         if (wi==2) prs("+bx], ax");

 mov ax, [wi]
 cmp ax, 2
 jne .doassign273
 push doassign_8
 call prs
 add  sp, 2
;-852             else prs("+bx], al");

 jmp .doassign274
.doassign273:
 push doassign_9
 call prs
 add  sp, 2
;-853         return;

.doassign274:
 jmp .retndoassign
;-854         }

;-855     if (wi==1){

.doassign269:
 mov ax, [wi]
 cmp ax, 1
 jne .doassign275
;-856         prs("\n mov ");

 push doassign_10
 call prs
 add  sp, 2
;-857         if(i<LSTART) prs("byte ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign276
 push doassign_11
 call prs
 add  sp, 2
;-858         v(i);

.doassign276:
 push word [bp+6]
 call v
 add  sp, 2
;-859         prs(", al");

 push doassign_12
 call prs
 add  sp, 2
;-860         return;

 jmp .retndoassign
;-861         }

;-862     if (wi==2){

.doassign275:
 mov ax, [wi]
 cmp ax, 2
 jne .doassign277
;-863         prs("\n mov ");

 push doassign_13
 call prs
 add  sp, 2
;-864         if(i<LSTART) prs("word ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign278
 push doassign_14
 call prs
 add  sp, 2
;-865         v(i);

.doassign278:
 push word [bp+6]
 call v
 add  sp, 2
;-866         prs(", ax");

 push doassign_15
 call prs
 add  sp, 2
;-867         return;

 jmp .retndoassign
;-868         }

;-869     if (wi==4){

.doassign277:
 mov ax, [wi]
 cmp ax, 4
 jne .doassign279
;-870         prs("\n mov ");

 push doassign_16
 call prs
 add  sp, 2
;-871         if(i<LSTART) prs("dword ");

 mov ax, [bp+6]
 cmp ax, 300
 jge .doassign280
 push doassign_17
 call prs
 add  sp, 2
;-872         v(i);

.doassign280:
 push word [bp+6]
 call v
 add  sp, 2
;-873         prs(", eax");

 push doassign_18
 call prs
 add  sp, 2
;-874         return;

 jmp .retndoassign
;-875         }

;-876 }

.doassign279:
;-877 

;-878 int domul(int ids) {

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
;-879     if (ids) rterm("imul");
;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je .domul281
 push domul_0
 call rterm
 add  sp, 2
;-880         else {

 jmp .domul282
.domul281:
;-881         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .domul283
;-882             prs("\n mov bx, ");

 push domul_1
 call prs
 add  sp, 2
;-883             prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-884             prs("\n mul bx");

 push domul_2
 call prs
 add  sp, 2
;-885             }

;-886         else error1("with MUL only const number as multiplicator allowed");

 jmp .domul284
.domul283:
 push domul_3
 call error1
 add  sp, 2
;-887         }

.domul284:
;-888 }

.domul282:
;-889 

;-890 int doidiv(int ids) {

 LEAVE
 ret
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0
ENDP

doidiv: PROC
;-891     int mode; int id1;

;-892     if (istoken(T_CONST)) {
;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doidiv285
;-893         prs("\n mov bx, ");

 push doidiv_0
 call prs
 add  sp, 2
;-894         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-895         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv286
 push doidiv_1
 call prs
 add  sp, 2
;-896             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv287
.doidiv286:
 push doidiv_2
 call prs
 add  sp, 2
;-897         }

.doidiv287:
;-898     else {

 jmp .doidiv288
.doidiv285:
;-899         mode=typeName();

 call typeName
 mov [bp-2], ax
;-900         id1=searchname();

 call searchname
 mov [bp-4], ax
;-901         if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je .doidiv289
 push doidiv_3
 call error1
 add  sp, 2
;-902         gettypes(id1);

.doidiv289:
 push word [bp-4]
 call gettypes
 add  sp, 2
;-903         if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je .doidiv290
 push doidiv_4
 call error1
 add  sp, 2
;-904         if (wi!=2) error1("only int, no byte as divisor allowed");

.doidiv290:
 mov ax, [wi]
 cmp ax, 2
 je  .doidiv291
 push doidiv_5
 call error1
 add  sp, 2
;-905         prs("\n mov bx, ");

.doidiv291:
 push doidiv_6
 call prs
 add  sp, 2
;-906         v(id1);

 push word [bp-4]
 call v
 add  sp, 2
;-907         if (ids) prs("\n cwd\n idiv bx");

 mov ax, [bp+4]
 or  al, al
 je .doidiv292
 push doidiv_7
 call prs
 add  sp, 2
;-908             else prs("\n mov dx, 0\n div bx");

 jmp .doidiv293
.doidiv292:
 push doidiv_8
 call prs
 add  sp, 2
;-909     }

.doidiv293:
;-910 }

.doidiv288:
;-911 

;-912 int domod(int ids) {

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
;-913     doidiv(ids);
;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
;-914     prs("\n mov ax, dx");

 push domod_0
 call prs
 add  sp, 2
;-915 }

;-916 

;-917 

;-918 int docalltype[10]; int docallvalue[10];

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
;-919 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 41782
procname resb 17
section .text
;-920 

;-921 int docall1() {


docall1: PROC
;-922     int i; int narg; int t0; int n0;  int sz32;

;-923     narg=0;
;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
;-924     sz32=0;

 mov ax, 0
 mov [bp-10], ax
;-925     checknamelen();

 call checknamelen
;-926     strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4
;-927     expect('(');

 push 40
 call expect
 add  sp, 2
;-928 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .docall1294
;-929 	    do {

.docall1295:
;-930 	        narg++;

 inc  word[bp-4]
;-931 	        if (narg >9 ) error1("Max. 9 parameters");

 mov ax, [bp-4]
 cmp ax, 9
 jle .docall1296
 push docall1_0
 call error1
 add  sp, 2
;-932 	        t0=0;

.docall1296:
 mov ax, 0
 mov [bp-6], ax
;-933             if(istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .docall1297
;-934                 t0=1;

 mov ax, 1
 mov [bp-6], ax
;-935                 n0=lexval;

 mov ax, [lexval]
 mov [bp-8], ax
;-936                 }

;-937             if(istoken(T_STRING)){

.docall1297:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .docall1298
;-938                 t0=2;

 mov ax, 2
 mov [bp-6], ax
;-939                 n0=nconst;

 mov ax, [nconst]
 mov [bp-8], ax
;-940                 eprs("\n");

 push docall1_1
 call eprs
 add  sp, 2
;-941                 eprs(fname);

 lea  ax, [fname]
 push ax
 call eprs
 add  sp, 2
;-942                 eprc(95);

 push 95
 call eprc
 add  sp, 2
;-943                 eprnum(nconst);

 push word [nconst]
 call eprnum
 add  sp, 2
;-944                 eprs(" db ");

 push docall1_2
 call eprs
 add  sp, 2
;-945                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-946                 eprs(symbol);

 lea  ax, [symbol]
 push ax
 call eprs
 add  sp, 2
;-947                 eprc(34);

 push 34
 call eprc
 add  sp, 2
;-948                 eprs(",0");

 push docall1_3
 call eprs
 add  sp, 2
;-949                 nconst++;

 inc  word[nconst]
;-950                 }

;-951             if(istoken('&'))     {

.docall1298:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .docall1299
;-952                 t0=3;

 mov ax, 3
 mov [bp-6], ax
;-953                 name1();

 call name1
;-954                 n0=searchname();

 call searchname
 mov [bp-8], ax
;-955                 }

;-956             if(istoken(T_NAME))  {

.docall1299:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je .docall1300
;-957                 n0=checkreg();

 call checkreg
 mov [bp-8], ax
;-958                 if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je .docall1301
 mov ax, 5
 mov [bp-6], ax
;-959                 else {

 jmp .docall1302
.docall1301:
;-960                     t0=4;

 mov ax, 4
 mov [bp-6], ax
;-961                     n0=searchname();

 call searchname
 mov [bp-8], ax
;-962                     p1=&GType;

 mov ax, GType
 mov word [p1], ax
;-963                     p1=p1+n0;

 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
;-964                     if (*p1=='&') t0=3;

 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne .docall1303
 mov ax, 3
 mov [bp-6], ax
;-965                     }

.docall1303:
;-966                 }

.docall1302:
;-967             if (t0==0) error1("parameter not recognized (no * allowed)");

.docall1300:
 mov ax, [bp-6]
 cmp ax, 0
 jne .docall1304
 push docall1_4
 call error1
 add  sp, 2
;-968             docalltype [narg] = t0;

.docall1304:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax
;-969             docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax
;-970         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .docall1305
 jmp .docall1295
.docall1305:
;-971 

;-972   	expect(')');

 push 41
 call expect
 add  sp, 2
;-973   	i=narg;

 mov ax, [bp-4]
 mov [bp-2], ax
;-974     do {

.docall1306:
;-975         t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax
;-976         n0 = docallvalue[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax
;-977         if(t0==1){

 mov ax, [bp-6]
 cmp ax, 1
 jne .docall1307
;-978             prs("\n push ");

 push docall1_5
 call prs
 add  sp, 2
;-979             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-980             }

;-981         if(t0==2){

.docall1307:
 mov ax, [bp-6]
 cmp ax, 2
 jne .docall1308
;-982             prs("\n push ");

 push docall1_6
 call prs
 add  sp, 2
;-983             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-984             prc(95);

 push 95
 call prc
 add  sp, 2
;-985             prunsign1(n0);

 push word [bp-8]
 call prunsign1
 add  sp, 2
;-986             }

;-987         if(t0==3){

.docall1308:
 mov ax, [bp-6]
 cmp ax, 3
 jne .docall1309
;-988             prs("\n lea  ax, ");

 push docall1_7
 call prs
 add  sp, 2
;-989             v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-990             prs("\n push ax");

 push docall1_8
 call prs
 add  sp, 2
;-991             }

;-992         if(t0==4){

.docall1309:
 mov ax, [bp-6]
 cmp ax, 4
 jne .docall1310
;-993             gettypes(n0);

 push word [bp-8]
 call gettypes
 add  sp, 2
;-994             if(wi==2) {

 mov ax, [wi]
 cmp ax, 2
 jne .docall1311
;-995                 prs("\n push word ");

 push docall1_9
 call prs
 add  sp, 2
;-996                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-997                 }

;-998             else {

 jmp .docall1312
.docall1311:
;-999                 prs("\n mov al, byte ");

 push docall1_10
 call prs
 add  sp, 2
;-1000                 v(n0);

 push word [bp-8]
 call v
 add  sp, 2
;-1001                 prs("\n mov ah, 0\n push ax");

 push docall1_11
 call prs
 add  sp, 2
;-1002                 }

;-1003             }

.docall1312:
;-1004         if(t0==5){

.docall1310:
 mov ax, [bp-6]
 cmp ax, 5
 jne .docall1313
;-1005             prs("\n push ");

 push docall1_12
 call prs
 add  sp, 2
;-1006             printreg(n0);

 push word [bp-8]
 call printreg
 add  sp, 2
;-1007             if (n0 >= 47) sz32+2;

 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  .docall1314
 mov ax, [bp-10]
 add ax, 2
;-1008             }

.docall1314:
;-1009         i--;

.docall1313:
 dec  word[bp-2]
;-1010         } while (i > 0);

 mov ax, [bp-2]
 cmp ax, 0
 jle .docall1315
 jmp .docall1306
.docall1315:
;-1011     }

;-1012 	prs("\n call ");

.docall1294:
 push docall1_13
 call prs
 add  sp, 2
;-1013 	prs(&procname);

 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2
;-1014 	if (narg>0) {

 mov ax, [bp-4]
 cmp ax, 0
 jle .docall1316
;-1015 	    prs("\n add  sp, ");

 push docall1_14
 call prs
 add  sp, 2
;-1016         narg=narg+narg;

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
;-1017         narg=narg+sz32;

 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
;-1018         prunsign1(narg);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1019         }

;-1020 }

.docall1316:
;-1021 

;-1022 

;-1023 int expr() {

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
;-1024     int mode;   int id1;

;-1025     int ixarr;  int ixconst;

;-1026     int ids;    int isCONST;

;-1027     int i;      unsigned char *p;

;-1028 

;-1029     if (istoken(T_CONST)) {// constant ;
;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr317
;-1030         prs("\n mov ax, ");

 push expr_0
 call prs
 add  sp, 2
;-1031         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1032         return 4;

 mov ax, 4
 jmp .retnexpr
;-1033         }

;-1034     mode=typeName(); /*0=variable, 1=* ptr, 2=& adr*/

.expr317:
 call typeName
 mov [bp-2], ax
;-1035     ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1036     if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .expr318
;-1037         doreg1(0);

 push 0
 call doreg1
 add  sp, 2
;-1038         return;

 jmp .retnexpr
;-1039         }

;-1040     if (token=='(')  {

.expr318:
 mov ax, [token]
 cmp ax, 40
 jne .expr319
;-1041         docall1();

 call docall1
;-1042         goto e1;

 jmp .e1
;-1043         }

;-1044 

;-1045     id1=searchname();

.expr319:
 call searchname
 mov [bp-4], ax
;-1046     gettypes(id1);

 push word [bp-4]
 call gettypes
 add  sp, 2
;-1047     ids=signi;

 mov ax, [signi]
 mov [bp-10], ax
;-1048     ixarr=0;

 mov ax, 0
 mov [bp-6], ax
;-1049     ixconst=0;

 mov ax, 0
 mov [bp-8], ax
;-1050     if (istoken('[')) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .expr320
;-1051         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .expr321
;-1052             ixconst=1;

 mov ax, 1
 mov [bp-8], ax
;-1053             ixarr=lexval;

 mov ax, [lexval]
 mov [bp-6], ax
;-1054             expect(']');

 push 93
 call expect
 add  sp, 2
;-1055             }

;-1056         else {

 jmp .expr322
.expr321:
;-1057             ixarr=searchname();

 call searchname
 mov [bp-6], ax
;-1058             expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1059             expect(']');

 push 93
 call expect
 add  sp, 2
;-1060             gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2
;-1061             if (widthi != 2) error1("Array index must be number or int");

 mov ax, [widthi]
 cmp ax, 2
 je  .expr323
 push expr_1
 call error1
 add  sp, 2
;-1062             }

.expr323:
;-1063         }

.expr322:
;-1064     if (istoken(T_PLUSPLUS  )) {

.expr320:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je .expr324
;-1065         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr325
 push expr_2
 call error1
 add  sp, 2
;-1066         prs("\n inc  ");

.expr325:
 push expr_3
 call prs
 add  sp, 2
;-1067         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr326
 push expr_4
 call prs
 add  sp, 2
 jmp .expr327
.expr326:
 push expr_5
 call prs
 add  sp, 2
;-1068         v(id1);

.expr327:
 push word [bp-4]
 call v
 add  sp, 2
;-1069         goto e1;

 jmp .e1
;-1070         }

;-1071     if (istoken(T_MINUSMINUS)) {

.expr324:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je .expr328
;-1072         if(mode)error1("Only var allowed");

 mov ax, [bp-2]
 or  al, al
 je .expr329
 push expr_6
 call error1
 add  sp, 2
;-1073         prs("\n dec  ");

.expr329:
 push expr_7
 call prs
 add  sp, 2
;-1074         if (wi==2) prs("word"); else prs("byte");

 mov ax, [wi]
 cmp ax, 2
 jne .expr330
 push expr_8
 call prs
 add  sp, 2
 jmp .expr331
.expr330:
 push expr_9
 call prs
 add  sp, 2
;-1075         v(id1);

.expr331:
 push word [bp-4]
 call v
 add  sp, 2
;-1076         goto e1;

 jmp .e1
;-1077         }

;-1078 

;-1079     if (istoken(T_PLUSASS )) {compoundass("add", mode, id1); goto e1; }

.expr328:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je .expr332
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp .e1
;-1080     if (istoken(T_MINUSASS)) {compoundass("sub", mode, id1); goto e1; }

.expr332:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je .expr333
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp .e1
;-1081     if (istoken(T_ANDASS  )) {compoundass("and", mode, id1); goto e1; }

.expr333:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je .expr334
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp .e1
;-1082     if (istoken(T_ORASS   )) {compoundass("or" , mode, id1); goto e1; }

.expr334:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je .expr335
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp .e1
;-1083     if (istoken(T_MULASS  )) error1("not implemented");

.expr335:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je .expr336
 push expr_14
 call error1
 add  sp, 2
;-1084     if (istoken(T_DIVASS  )) error1("not implemented");

.expr336:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je .expr337
 push expr_15
 call error1
 add  sp, 2
;-1085 

;-1086     if (istoken('=')) {

.expr337:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .expr338
;-1087         expr();

 call expr
;-1088         doassign(mode, id1, ixarr, ixconst);

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
;-1089         goto e1;

 jmp .e1
;-1090         }

;-1091     dovar1(mode, "mov", ixarr, id1);

.expr338:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8
;-1092 

;-1093 e1:      if (istoken('+')) rterm("add");

.e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je .expr339
 push expr_17
 call rterm
 add  sp, 2
;-1094     else if (istoken('-')) rterm("sub");

 jmp .expr340
.expr339:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .expr341
 push expr_18
 call rterm
 add  sp, 2
;-1095     else if (istoken('&')) rterm("and");

 jmp .expr342
.expr341:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je .expr343
 push expr_19
 call rterm
 add  sp, 2
;-1096     else if (istoken('|')) rterm("or" );

 jmp .expr344
.expr343:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je .expr345
 push expr_20
 call rterm
 add  sp, 2
;-1097     else if (istoken(T_LESSLESS)) rterm("shl");

 jmp .expr346
.expr345:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je .expr347
 push expr_21
 call rterm
 add  sp, 2
;-1098     else if (istoken(T_GREATGREAT)) rterm("shr");

 jmp .expr348
.expr347:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je .expr349
 push expr_22
 call rterm
 add  sp, 2
;-1099     else if (istoken('*')) domul (ids);

 jmp .expr350
.expr349:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je .expr351
 push word [bp-10]
 call domul
 add  sp, 2
;-1100     else if (istoken('/')) doidiv(ids);

 jmp .expr352
.expr351:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je .expr353
 push word [bp-10]
 call doidiv
 add  sp, 2
;-1101     else if (istoken('%')) domod (ids);

 jmp .expr354
.expr353:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je .expr355
 push word [bp-10]
 call domod
 add  sp, 2
;-1102     if (isrelational()) {

.expr355:
.expr354:
.expr352:
.expr350:
.expr348:
.expr346:
.expr344:
.expr342:
.expr340:
 call isrelational
 or  al, al
 je .expr356
;-1103         rterm("cmp");

 push expr_23
 call rterm
 add  sp, 2
;-1104         cmpneg(ids);

 push word [bp-10]
 call cmpneg
 add  sp, 2
;-1105         }

;-1106     return 0;

.expr356:
 mov ax, 0
 jmp .retnexpr
;-1107 }

;-1108 

;-1109 int pexpr() {//called from if, do, while

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
;-1110     expect('(');

 push 40
 call expect
 add  sp, 2
;-1111     iscmp=0;

 mov ax, 0
 mov word [iscmp], ax
;-1112     if (token==T_NAME) {

 mov ax, [token]
 cmp ax, 256
 jne .pexpr357
;-1113         ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax
;-1114         if (ireg1) {

 mov ax, [ireg1]
 or  al, al
 je .pexpr358
;-1115             doreg1(1);

 push 1
 call doreg1
 add  sp, 2
;-1116             return;

 jmp .retnpexpr
;-1117             }

;-1118         }

.pexpr358:
;-1119     expr();

.pexpr357:
 call expr
;-1120     if (iscmp==0) prs("\n or  al, al\n je .");

 mov ax, [iscmp]
 cmp ax, 0
 jne .pexpr359
 push pexpr_0
 call prs
 add  sp, 2
;-1121     prs(fname);

.pexpr359:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1122     expect(')');

 push 41
 call expect
 add  sp, 2
;-1123 }

;-1124 

;-1125 

;-1126 int prlabel(int n) {

 .retnpexpr:
 ret
pexpr_0 db "\n or  al, al\n je .",0
ENDP

prlabel: PROC
;-1127     prs("\n.");
;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
;-1128     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1129     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1130     prc(':');

 push 58
 call prc
 add  sp, 2
;-1131 }

;-1132 int prjump (int n) {

 LEAVE
 ret
prlabel_0 db "\n.",0
ENDP

prjump: PROC
;-1133     prs("\n jmp .");
;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
;-1134     prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1135     prunsign1(n);

 push word [bp+4]
 call prunsign1
 add  sp, 2
;-1136 }

;-1137 

;-1138 int stmt() {

 LEAVE
 ret
prjump_0 db "\n jmp .",0
ENDP

stmt: PROC
;-1139     int c; char cha;

;-1140     int jdest; int tst; int jtemp;

;-1141     if(istoken('{')) {
;
 ENTER  10,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .stmt360
;-1142         while(istoken('}')==0) stmt();

.stmt361:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .stmt362
 call stmt
;-1143         }

 jmp .stmt361
.stmt362:
;-1144     else if(istoken(T_IF)) {

 jmp .stmt363
.stmt360:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je .stmt364
;-1145         pexpr();

 call pexpr
;-1146         nlabel++;

 inc  word[nlabel]
;-1147         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1148         pint1(jdest);

 push word [bp-6]
 call pint1
 add  sp, 2
;-1149         stmt();

 call stmt
;-1150         if (istoken(T_ELSE)) {

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je .stmt365
;-1151             nlabel++;

 inc  word[nlabel]
;-1152             tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1153             prjump(tst);

 push word [bp-8]
 call prjump
 add  sp, 2
;-1154             prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1155             stmt();

 call stmt
;-1156             prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1157         }

;-1158         else prlabel(jdest);

 jmp .stmt366
.stmt365:
 push word [bp-6]
 call prlabel
 add  sp, 2
;-1159     }

.stmt366:
;-1160     else if(istoken(T_DO)) {

 jmp .stmt367
.stmt364:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je .stmt368
;-1161         nlabel++;

 inc  word[nlabel]
;-1162         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1163         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1164         stmt();

 call stmt
;-1165         expect(T_WHILE);

 push 515
 call expect
 add  sp, 2
;-1166         pexpr();

 call pexpr
;-1167         nlabel++;

 inc  word[nlabel]
;-1168         jtemp=nlabel;

 mov ax, [nlabel]
 mov [bp-10], ax
;-1169         pint1(jtemp);

 push word [bp-10]
 call pint1
 add  sp, 2
;-1170         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1171          prlabel(jtemp);

 push word [bp-10]
 call prlabel
 add  sp, 2
;-1172     }

;-1173     else if(istoken(T_WHILE)) {

 jmp .stmt369
.stmt368:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je .stmt370
;-1174         nlabel++;

 inc  word[nlabel]
;-1175         jdest=nlabel;

 mov ax, [nlabel]
 mov [bp-6], ax
;-1176         prlabel(jdest);

 push word [bp-6]
 call prlabel
 add  sp, 2
;-1177         pexpr();

 call pexpr
;-1178         nlabel++;

 inc  word[nlabel]
;-1179         tst=nlabel;

 mov ax, [nlabel]
 mov [bp-8], ax
;-1180         pint1(tst);

 push word [bp-8]
 call pint1
 add  sp, 2
;-1181         stmt();

 call stmt
;-1182         prjump(jdest);

 push word [bp-6]
 call prjump
 add  sp, 2
;-1183         prlabel(tst);

 push word [bp-8]
 call prlabel
 add  sp, 2
;-1184     }

;-1185     else if(istoken(T_GOTO))  {

 jmp .stmt371
.stmt370:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je .stmt372
;-1186         prs("\n jmp .");

 push stmt_0
 call prs
 add  sp, 2
;-1187         name1();

 call name1
;-1188         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1189         expect(';');

 push 59
 call expect
 add  sp, 2
;-1190     }

;-1191     else if(token==T_ASM)     {

 jmp .stmt373
.stmt372:
 mov ax, [token]
 cmp ax, 518
 jne .stmt374
;-1192       prs("\n");

 push stmt_1
 call prs
 add  sp, 2
;-1193       c=next();

 call next
 mov [bp-2], ax
;-1194       while(c != '\n') {

.stmt375:
 mov ax, [bp-2]
 cmp ax, 10
 je  .stmt376
;-1195         prc(c);

 push word [bp-2]
 call prc
 add  sp, 2
;-1196         c=next();

 call next
 mov [bp-2], ax
;-1197         };

 jmp .stmt375
.stmt376:
;-1198         token=getlex();

 call getlex
 mov word [token], ax
;-1199     }

;-1200     else if(istoken(T_EMIT)) {

 jmp .stmt377
.stmt374:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je .stmt378
;-1201       prs("\n db ");

 push stmt_2
 call prs
 add  sp, 2
;-1202     L1: token=getlex();

.L1:
 call getlex
 mov word [token], ax
;-1203       prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1204       token=getlex();

 call getlex
 mov word [token], ax
;-1205       if (token== ',') {

 mov ax, [token]
 cmp ax, 44
 jne .stmt379
;-1206           prc(',');

 push 44
 call prc
 add  sp, 2
;-1207           goto L1;

 jmp .L1
;-1208       }

;-1209       expect(')');

.stmt379:
 push 41
 call expect
 add  sp, 2
;-1210     }

;-1211     else if(istoken(';'))      { }

 jmp .stmt380
.stmt378:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je .stmt381
;-1212     else if(istoken(T_RETURN)) {

 jmp .stmt382
.stmt381:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je .stmt383
;-1213         if (token!=';') expr();

 mov ax, [token]
 cmp ax, 59
 je  .stmt384
 call expr
;-1214         prs("\n jmp .retn");

.stmt384:
 push stmt_3
 call prs
 add  sp, 2
;-1215         prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1216         nreturn++;

 inc  word[nreturn]
;-1217         expect(';');

 push 59
 call expect
 add  sp, 2
;-1218     }

;-1219     else if(thechar==':')      {

 jmp .stmt385
.stmt383:
 mov al, [thechar]
 cmp al, 58
 jne .stmt386
;-1220         prs("\n."); // Label

 push stmt_4
 call prs
 add  sp, 2
;-1221         prs(symbol); prc(':');

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2
;-1222         expect(T_NAME);

 push 256
 call expect
 add  sp, 2
;-1223         expect(':');

 push 58
 call expect
 add  sp, 2
;-1224     }

;-1225     else  {expr();; expect(';'); }

 jmp .stmt387
.stmt386:
 call expr
 push 59
 call expect
 add  sp, 2
;-1226 }

.stmt387:
.stmt385:
.stmt382:
.stmt380:
.stmt377:
.stmt373:
.stmt371:
.stmt369:
.stmt367:
.stmt363:
;-1227 

;-1228 int isvariable() {

 LEAVE
 ret
stmt_0 db "\n jmp .",0
stmt_1 db "\n",0
stmt_2 db "\n db ",0
stmt_3 db "\n jmp .retn",0
stmt_4 db "\n.",0
ENDP

isvariable: PROC
;-1229     if(token==T_SIGNED)   goto v1;

 mov ax, [token]
 cmp ax, 531
 jne .isvariable388
 jmp .v1
;-1230     if(token==T_UNSIGNED) goto v1;

.isvariable388:
 mov ax, [token]
 cmp ax, 532
 jne .isvariable389
 jmp .v1
;-1231     if(token==T_CHAR)     goto v1;

.isvariable389:
 mov ax, [token]
 cmp ax, 530
 jne .isvariable390
 jmp .v1
;-1232     if(token==T_INT)      goto v1;

.isvariable390:
 mov ax, [token]
 cmp ax, 517
 jne .isvariable391
 jmp .v1
;-1233     if(token==T_LONG)     goto v1;

.isvariable391:
 mov ax, [token]
 cmp ax, 533
 jne .isvariable392
 jmp .v1
;-1234     return 0;

.isvariable392:
 mov ax, 0
 jmp .retnisvariable
;-1235 v1: return 1;

.v1:
 mov ax, 1
 jmp .retnisvariable
;-1236 }

;-1237 

;-1238 int dofunc() {

 .retnisvariable:
 ret
ENDP

dofunc: PROC
;-1239     int nloc; int i; unsigned int j;int narg;

;-1240     cloc=&co;
;
 ENTER  8,0
 mov ax, co
 mov word [cloc], ax
;-1241     checknamelen();

 call checknamelen
;-1242     strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4
;-1243     i=0;

 mov ax, 0
 mov [bp-4], ax
;-1244     while (i < FTop) {

.dofunc393:
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge .dofunc394
;-1245         j=adrF(FNameField, i);

 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov [bp-6], ax
;-1246         if(eqstr(symbol, j)) error1("Function already defined");

 push word [bp-6]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dofunc395
 push dofunc_0
 call error1
 add  sp, 2
;-1247         i++;

.dofunc395:
 inc  word[bp-4]
;-1248     }

;-1249     if (FTop >= FUNCMAX) error1("Function table full");

 jmp .dofunc393
.dofunc394:
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dofunc396
 push dofunc_1
 call error1
 add  sp, 2
;-1250     pt=adrF(FNameField, FTop);

.dofunc396:
 push word [FTop]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1251     strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1252     FTop++;

 inc  word[FTop]
;-1253     prs("\n\n");

 push dofunc_2
 call prs
 add  sp, 2
;-1254     prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1255     prs(": PROC");

 push dofunc_3
 call prs
 add  sp, 2
;-1256     expect('(');

 push 40
 call expect
 add  sp, 2
;-1257     LTop=LSTART;

 mov ax, 300
 mov word [LTop], ax
;-1258     if (istoken(')')==0) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc397
;-1259         narg=2;

 mov ax, 2
 mov [bp-8], ax
;-1260         do {

.dofunc398:
;-1261             typeName();

 call typeName
;-1262             addlocal();

 call addlocal
;-1263             narg+=2;

 add  word[bp-8], 2
;-1264             GData[LTop]=narg;

 mov ax, [bp-8]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1265             if (iswidth == 4) narg+=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc399
 add  word[bp-8], 2
;-1266                 LTop++;

.dofunc399:
 inc  word[LTop]
;-1267                 }

;-1268         while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc400
 jmp .dofunc398
.dofunc400:
;-1269         expect(')');

 push 41
 call expect
 add  sp, 2
;-1270         }

;-1271 

;-1272     expect('{'); /*body*/

.dofunc397:
 push 123
 call expect
 add  sp, 2
;-1273     nloc=0;

 mov ax, 0
 mov [bp-2], ax
;-1274     nreturn=0;

 mov ax, 0
 mov word [nreturn], ax
;-1275     nconst=0;

 mov ax, 0
 mov word [nconst], ax
;-1276     while(isvariable()) {

.dofunc401:
 call isvariable
 or  al, al
 je .dofunc402
;-1277         do {

.dofunc403:
;-1278             typeName();

 call typeName
;-1279             checknamelen();

 call checknamelen
;-1280             addlocal();

 call addlocal
;-1281             nloc-=2;

 sub  word[bp-2], 2
;-1282             if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne .dofunc404
 sub  word[bp-2], 2
;-1283             GData[LTop]=nloc;

.dofunc404:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1284             if (istoken('[')){

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc405
;-1285                 istype='&';

 mov ax, 38
 mov byte [istype], al
;-1286                 GType[LTop]='&';

 mov ax, 38
 mov bx, [LTop]
 mov [GType+bx], al
;-1287                 expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1288                 expect(']');

 push 93
 call expect
 add  sp, 2
;-1289                 nloc=nloc-lexval;

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
;-1290                 nloc+=2;

 add  word[bp-2], 2
;-1291                 GData[LTop]=nloc;

 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
;-1292             }

;-1293             LTop++;

.dofunc405:
 inc  word[LTop]
;-1294         } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .dofunc406
 jmp .dofunc403
.dofunc406:
;-1295         expect(';');

 push 59
 call expect
 add  sp, 2
;-1296     }

;-1297     if (LTop>LSTART){

 jmp .dofunc401
.dofunc402:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc407
;-1298         prs(";\n ENTER  ");

 push dofunc_4
 call prs
 add  sp, 2
;-1299         nloc=mkneg(nloc);

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
;-1300         prunsign1 (nloc);

 push word [bp-2]
 call prunsign1
 add  sp, 2
;-1301         prs(",0");

 push dofunc_5
 call prs
 add  sp, 2
;-1302         }

;-1303 

;-1304     while(istoken('}')==0)  stmt();

.dofunc407:
.dofunc408:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne .dofunc409
 call stmt
;-1305 

;-1306     if (nreturn) {

 jmp .dofunc408
.dofunc409:
 mov ax, [nreturn]
 or  al, al
 je .dofunc410
;-1307             prs("\n .retn");

 push dofunc_6
 call prs
 add  sp, 2
;-1308             prs(fname);

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
;-1309             prc(':');

 push 58
 call prc
 add  sp, 2
;-1310         }

;-1311     if (LTop > LSTART) prs("\n LEAVE");

.dofunc410:
 mov ax, [LTop]
 cmp ax, 300
 jle .dofunc411
 push dofunc_7
 call prs
 add  sp, 2
;-1312     prs("\n ret");

.dofunc411:
 push dofunc_8
 call prs
 add  sp, 2
;-1313     *cloc=0;

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
;-1314     prs(co);

 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
;-1315     maxco1=strlen(co);

 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax
;-1316     if (maxco1 > maxco) maxco=maxco1;

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle .dofunc412
 mov ax, [maxco1]
 mov word [maxco], ax
;-1317     prs("\nENDP");

.dofunc412:
 push dofunc_9
 call prs
 add  sp, 2
;-1318 }

;-1319 

;-1320 char doglobName[IDLENMAX];

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
;-1321 int doglob() {


doglob: PROC
;-1322     int i; int j; int isstrarr;

;-1323     isstrarr=0;
;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax
;-1324     if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .doglob413
 push doglob_0
 call error1
 add  sp, 2
;-1325     if (iswidth == 0) error1("no VOID as var type");

.doglob413:
 mov al, [iswidth]
 cmp al, 0
 jne .doglob414
 push doglob_1
 call error1
 add  sp, 2
;-1326     checknamelen();

.doglob414:
 call checknamelen
;-1327     if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  .doglob415
 push doglob_2
 call error1
 add  sp, 2
;-1328     if (istoken('[')) {

.doglob415:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je .doglob416
;-1329         istype='&';

 mov ax, 38
 mov byte [istype], al
;-1330         if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je .doglob417
;-1331             prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2
;-1332             prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2
;-1333             prs("\n"); prs(symbol);

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1334             if (iswidth==1) prs(" resb ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob418
 push doglob_5
 call prs
 add  sp, 2
;-1335             if (iswidth==2) prs(" resw ");

.doglob418:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob419
 push doglob_6
 call prs
 add  sp, 2
;-1336             if (iswidth==4) prs(" resd ");

.doglob419:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob420
 push doglob_7
 call prs
 add  sp, 2
;-1337             prunsign1(lexval);

.doglob420:
 push word [lexval]
 call prunsign1
 add  sp, 2
;-1338             prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2
;-1339             orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1340             if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne .doglob421
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax
;-1341             if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

.doglob421:
 mov al, [iswidth]
 cmp al, 4
 jne .doglob422
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax
;-1342             GData[GTop]=lexval;

.doglob422:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1343             expect(']');

 push 93
 call expect
 add  sp, 2
;-1344         }else {

 jmp .doglob423
.doglob417:
;-1345             expect(']');

 push 93
 call expect
 add  sp, 2
;-1346             if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  .doglob424
 push doglob_9
 call error1
 add  sp, 2
;-1347             prs("\n");

.doglob424:
 push doglob_10
 call prs
 add  sp, 2
;-1348             prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1349             prs(" db ");

 push doglob_11
 call prs
 add  sp, 2
;-1350             isstrarr=1;

 mov ax, 1
 mov [bp-6], ax
;-1351             strcpy(doglobName, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4
;-1352             expect('=');

 push 61
 call expect
 add  sp, 2
;-1353             if (istoken(T_STRING)) {

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je .doglob425
;-1354                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1355                 prscomment(symbol);

 lea  ax, [symbol]
 push ax
 call prscomment
 add  sp, 2
;-1356                 prc(34);

 push 34
 call prc
 add  sp, 2
;-1357                 prs(",0");

 push doglob_12
 call prs
 add  sp, 2
;-1358                 i=strlen(symbol);

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1359                 GData[GTop]=i;

 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1360                 }

;-1361             else if (istoken('{' )) {

 jmp .doglob426
.doglob425:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je .doglob427
;-1362                 i=0;

 mov ax, 0
 mov [bp-2], ax
;-1363                 do {

.doglob428:
;-1364                     if(i) prc(',');

 mov ax, [bp-2]
 or  al, al
 je .doglob429
 push 44
 call prc
 add  sp, 2
;-1365                     expect(T_CONST);

.doglob429:
 push 257
 call expect
 add  sp, 2
;-1366                     prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1367                     i=1;

 mov ax, 1
 mov [bp-2], ax
;-1368                     }

;-1369                     while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je .doglob430
 jmp .doglob428
.doglob430:
;-1370                 expect('}');

 push 125
 call expect
 add  sp, 2
;-1371             }

;-1372         else error1("String or number array expected");

 jmp .doglob431
.doglob427:
 push doglob_13
 call error1
 add  sp, 2
;-1373         };

.doglob431:
.doglob426:
.doglob423:
;-1374     }else { //expect('=');

 jmp .doglob432
.doglob416:
;-1375         prs("\n");

 push doglob_14
 call prs
 add  sp, 2
;-1376         prs(symbol);

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
;-1377         if (istype=='*') prs(" dw ");

 mov al, [istype]
 cmp al, 42
 jne .doglob433
 push doglob_15
 call prs
 add  sp, 2
;-1378         else {

 jmp .doglob434
.doglob433:
;-1379             if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne .doglob435
 push doglob_16
 call prs
 add  sp, 2
;-1380             else if (iswidth==2) prs(" dw ");

 jmp .doglob436
.doglob435:
 mov al, [iswidth]
 cmp al, 2
 jne .doglob437
 push doglob_17
 call prs
 add  sp, 2
;-1381             else                 prs(" dd ");

 jmp .doglob438
.doglob437:
 push doglob_18
 call prs
 add  sp, 2
;-1382         }

.doglob438:
.doglob436:
;-1383     if(istoken('-')) prc('-');

.doglob434:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je .doglob439
 push 45
 call prc
 add  sp, 2
;-1384     if (istoken('=')) {

.doglob439:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je .doglob440
;-1385         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1386         prunsign1(lexval);

 push word [lexval]
 call prunsign1
 add  sp, 2
;-1387         }else prunsign1(0);

 jmp .doglob441
.doglob440:
 push 0
 call prunsign1
 add  sp, 2
;-1388     }

.doglob441:
;-1389     GSign[GTop]=issign;

.doglob432:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
;-1390     GWidth[GTop]=iswidth;

 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1391     GType[GTop]=istype;

 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al
;-1392     pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1393     if (isstrarr) strcpy(pt, doglobName);

 mov ax, [bp-6]
 or  al, al
 je .doglob442
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1394         else strcpy(pt, symbol);

 jmp .doglob443
.doglob442:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1395     GTop++;

.doglob443:
 inc  word[GTop]
;-1396     expect(';');

 push 59
 call expect
 add  sp, 2
;-1397 }

;-1398 

;-1399 int dodefine() {

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
;-1400     int i; int j; int fdtemp;

;-1401     if (eqstr(symbol, "ORGDATA")) {
;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je .dodefine444
;-1402         token=getlex();

 call getlex
 mov word [token], ax
;-1403         ORGDATAORIG=lexval;

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
;-1404         orgData=lexval;

 mov ax, [lexval]
 mov word [orgData], ax
;-1405         return;

 jmp .retndodefine
;-1406     }

;-1407     expect(T_NAME);

.dodefine444:
 push 256
 call expect
 add  sp, 2
;-1408     if (token==T_CONST) {

 mov ax, [token]
 cmp ax, 257
 jne .dodefine445
;-1409         if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 300 ;unsigned : 1
 jl  .dodefine446
 push dodefine_1
 call error1
 add  sp, 2
;-1410         i=strlen(symbol);

.dodefine446:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
;-1411         if (i>15) error1("Define name longer 15 char");

 mov ax, [bp-2]
 cmp ax, 15
 jle .dodefine447
 push dodefine_2
 call error1
 add  sp, 2
;-1412         GSign [GTop]='U';

.dodefine447:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
;-1413         GWidth[GTop]=1;

 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
;-1414         GType [GTop]='#';

 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al
;-1415         pt=adrF(GNameField, GTop);

 push word [GTop]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
;-1416         strcpy(pt, symbol);

 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
;-1417         GData[GTop]=lexval;

 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
;-1418         expect(T_CONST);

 push 257
 call expect
 add  sp, 2
;-1419         GTop++;

 inc  word[GTop]
;-1420     }

;-1421 }

.dodefine445:
;-1422 

;-1423 int parse() {

 .retndodefine:
 LEAVE
 ret
dodefine_0 db "ORGDATA",0
dodefine_1 db "global table (define) full",0
dodefine_2 db "Define name longer 15 char",0
ENDP

parse: PROC
;-1424     token=getlex();

 call getlex
 mov word [token], ax
;-1425     do {

.parse448:
;-1426         if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  .parse449
 mov ax, 1
 jmp .retnparse
;-1427         if (istoken('#')) {

.parse449:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je .parse450
;-1428              if (istoken(T_DEFINE))  dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je .parse451
 call dodefine
;-1429              else error1("define expected");

 jmp .parse452
.parse451:
 push parse_0
 call error1
 add  sp, 2
;-1430         }

.parse452:
;-1431     else{

 jmp .parse453
.parse450:
;-1432         typeName();

 call typeName
;-1433         if (token=='(') dofunc();

 mov ax, [token]
 cmp ax, 40
 jne .parse454
 call dofunc
;-1434         else doglob(); }

 jmp .parse455
.parse454:
 call doglob
.parse455:
;-1435     } while(1);

.parse453:
 mov ax, 1
 or  al, al
 je .parse456
 jmp .parse448
.parse456:
;-1436 }

;-1437 

;-1438 char *arglen=0x80; char *argv=0x82;

 .retnparse:
 ret
parse_0 db "define expected",0
ENDP
arglen dw 128
argv dw 130
;-1439 int main() {


main: PROC
;-1440     int arglen1; unsigned int i; char *c;

;-1441     isPrint=1;
;
 ENTER  6,0
 mov ax, 1
 mov byte [isPrint], al
;-1442     arglen1=*arglen;

 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax
;-1443     if (arglen1 == 0) {

 mov ax, [bp-2]
 cmp ax, 0
 jne .main457
;-1444         cputs(Version1);

 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
;-1445         cputs(" Usage: A.COM in_file[.C]: ");

 push main_0
 call cputs
 add  sp, 2
;-1446         exitR(3);

 push 3
 call exitR
 add  sp, 2
;-1447         }

;-1448     i=arglen1+129;

.main457:
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
;-1449     *i=0;

 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax
;-1450     arglen1--;

 dec  word[bp-2]
;-1451     toupper(argv);

 push word [argv]
 call toupper
 add  sp, 2
;-1452     strcpy(namein, argv);

 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4
;-1453     if (instr1(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr1
 add  sp, 4
 cmp ax, 0
 jne .main458
 push main_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4
;-1454     strcpy(namelst, namein);

.main458:
 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
;-1455     i=strlen(namelst);

 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
;-1456     i--;

 dec  word[bp-4]
;-1457     c=&namelst+i;

 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
;-1458     *c='S';

 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al
;-1459 

;-1460     fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax
;-1461     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main459
;-1462         cputs("Source file missing (.C): ");

 push main_2
 call cputs
 add  sp, 2
;-1463         cputs(namein);

 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
;-1464         exitR(1);

 push 1
 call exitR
 add  sp, 2
;-1465         }

;-1466     fdout=creatR(namelst);

.main459:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax
;-1467     if(DOS_ERR){

 mov ax, [DOS_ERR]
 or  al, al
 je .main460
;-1468         cputs("list file not creatable: ");

 push main_3
 call cputs
 add  sp, 2
;-1469         cputs(namelst);

 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
;-1470         exitR(2);

 push 2
 call exitR
 add  sp, 2
;-1471         }

;-1472     prs(";");

.main460:
 push main_4
 call prs
 add  sp, 2
;-1473     prs(Version1);

 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2
;-1474     prs(", Input: "); prs(namein);

 push main_5
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
;-1475     prs(", Output: "); prs(namelst);

 push main_6
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2
;-1476     isPrint=0;

 mov ax, 0
 mov byte [isPrint], al
;-1477     prs("\norg  256 \njmp main");

 push main_7
 call prs
 add  sp, 2
;-1478     orgData=ORGDATAORIG;

 mov ax, [ORGDATAORIG]
 mov word [orgData], ax
;-1479     fgetsp=&fgetsdest;

 mov ax, fgetsdest
 mov word [fgetsp], ax
;-1480     *fgetsp=0;

 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
;-1481     thechar=fgets1();

 call fgets1
 mov byte [thechar], al
;-1482     parse();

 call parse
;-1483     isPrint=1;

 mov ax, 1
 mov byte [isPrint], al
;-1484     prs("\n;Glob. variables:"); GTop--; prunsign1(GTop);

 push main_8
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call prunsign1
 add  sp, 2
;-1485     prs(" ("); prunsign1(LSTART);

 push main_9
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1486     prs("), Functions:"); prunsign1(FTop);

 push main_10
 call prs
 add  sp, 2
 push word [FTop]
 call prunsign1
 add  sp, 2
;-1487     prs(" ("); prunsign1(FUNCMAX);

 push main_11
 call prs
 add  sp, 2
 push 300
 call prunsign1
 add  sp, 2
;-1488     prs("), Lines:"); prunsign1(lineno);

 push main_12
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2
;-1489     prs("\n;Constant: ");   prunsign1(maxco);

 push main_13
 call prs
 add  sp, 2
 push word [maxco]
 call prunsign1
 add  sp, 2
;-1490     prs(" ("); prunsign1(COMAX);

 push main_14
 call prs
 add  sp, 2
 push 3000
 call prunsign1
 add  sp, 2
;-1491     i=COMAX; i=i-maxco;

 mov ax, 3000
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [maxco]
 mov [bp-4], ax
;-1492     if (i <= 1000)prs("\n *** Warning *** constant area too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main461
 push main_15
 call prs
 add  sp, 2
;-1493     prs("), stacksize: ");

.main461:
 push main_16
 call prs
 add  sp, 2
;-1494     i=65636; i=i-orgData;

 mov ax, 100
 mov [bp-4], ax
 mov ax, [bp-4]
 sub ax, [orgData]
 mov [bp-4], ax
;-1495     prunsign1(i);

 push word [bp-4]
 call prunsign1
 add  sp, 2
;-1496     if (i <= 1000) prs("\n *** Warning *** Stack too small");

 mov ax, [bp-4]
 cmp ax, 1000
 ja  .main462
 push main_17
 call prs
 add  sp, 2
;-1497     end1(0);

.main462:
 push 0
 call end1
 add  sp, 2
;-1498 }

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
;Glob. variables:99 (300), Functions:71 (300), Lines:1499
;Constant: 688 (3000), stacksize: 23822