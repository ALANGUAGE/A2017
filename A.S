
; A.COM CComp V0.9, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
org  256 
jmp main

;-1 //  @@ret redefined 2011.04.25 23.644 bytes, Full  Working 2017.09.13


;-2 char Version1[]="A.COM CComp V0.9";

Version1 db "A.COM CComp V0.9",0

;-3 #define ARCHIVE "AR.C"

;Use archive file: AR.C

;-4 #define LSTART        200


;-5 #define VARMAX        300


;-6 #define GNAMEMAX     4800 // 16*VARMAX


;-7 #define FUNCMAX       300


;-8 #define FNAMEMAX     4800 // 16*FUNCMAX


;-9 #define CALLMAX      2000


;-10 #define IDLENMAX       15


;-11 #define _                 // Konstantvergleich


;-12 #define T_NAME        256


;-13 #define T_CONST       257 


;-14 #define T_STRING      258     


;-15 #define T_INCLUDE     510     


;-16 #define T_DEFINE      511  


;-17 #define T_RETURN      512


;-18 #define T_IF          513      


;-19 #define T_ELSE        514  


;-20 #define T_WHILE       515      


;-21 #define T_DO          516


;-22 #define T_INT         517     


;-23 #define T_ASM         518   


;-24 #define T_ASMBLOCK    519   


;-25 #define T_EMIT        520


;-26 #define T_GOTO        521    


;-27 #define T_VOID        529  


;-28 #define T_CHAR        530       


;-29 #define T_SIGNED      531


;-30 #define T_UNSIGNED    532


;-31 #define T_LONG        533


;-32 #define T_SHORT       534


;-33 //T_INT8 540   T_UINT8 541   T_INT16 542   T_UINT16 543   T_INT32 544


;-34 #define T_UINT32      545


;-35 //T_INT64 546   T_UINT64 547


;-36 #define T_INTH        600


;-37 #define T_IFCARRY     601


;-38 #define T_IFZERO      602


;-39 #define T_EQ          806


;-40 #define T_NE          807


;-41 #define T_GE          811


;-42 #define T_LE          824


;-43 #define T_PLUSPLUS   1219


;-44 #define T_MINUSMINUS 1225


;-45 #define T_PLUSASS    1230


;-46 #define T_MINUSASS   1231


;-47 #define T_MULASS     1232


;-48 #define T_DIVASS     1233


;-49 #define T_ANDASS     1234


;-50 #define T_ORASS      1235


;-51 #define T_LESSLESS   1240


;-52 #define T_GREATGREAT 1241


;-53 #define COMAX        3000


;-54 #define CMDLENMAX      67


;-55 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;

ORGDATAORIG dw 30000
orgData dw 30000

;-56 char co[COMAX];    int maxco=0;      int maxco1=0;

section .bss
absolute 30000
co resb 3000
section .text
maxco dw 0
maxco1 dw 0

;-57 char coname[CMDLENMAX];              char *cloc=0;

section .bss
absolute 33000
coname resb 67
section .text
cloc dw 0

;-58 int fdin=0;        int fdout=0;      char symbol[128];

fdin dw 0
fdout dw 0
section .bss
absolute 33067
symbol resb 128
section .text

;-59 char fname[CMDLENMAX];               char namein[CMDLENMAX];

section .bss
absolute 33195
fname resb 67
section .text
section .bss
absolute 33262
namein resb 67
section .text

;-60 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];

section .bss
absolute 33329
namelst resb 67
section .text
section .bss
absolute 33396
archivename resb 67
section .text

;-61 int token=0;       char globC=0;     int spalte=0;

token dw 0
globC db 0
spalte dw 0

;-62 char thechar=0;    int iscmp=0;      int nconst=0;

thechar db 0
iscmp dw 0
nconst dw 0

;-63 int nreturn=0;     int nlabel=0;     int callrecursive=0;

nreturn dw 0
nlabel dw 0
callrecursive dw 0

;-64 int GTop=1;        int LTop=150;

GTop dw 1
LTop dw 150

;-65 unsigned int lexval=0;

lexval dw 0

;-66 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#

typei dw 0
istype db 0
section .bss
absolute 33463
GType resb 300
section .text

;-67 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S

signi dw 0
issign db 0
section .bss
absolute 33763
GSign resb 300
section .text

;-68 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4

widthi dw 0
iswidth db 0
section .bss
absolute 34063
GWidth resb 300
section .text

;-69              int GAdr[VARMAX]; int  GUsed [VARMAX];

section .bss
absolute 34363
GAdr resw 300
section .text
section .bss
absolute 34963
GUsed resw 300
section .text

;-70 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];

wi dw 0
section .bss
absolute 35563
GData resw 300
section .text
section .bss
absolute 36163
GNameField resb 4800
section .text

;-71 int  FTop=0;                 int  CTop=0;

FTop dw 0
CTop dw 0

;-72 char FType [FUNCMAX];        char CType[CALLMAX];

section .bss
absolute 40963
FType resb 300
section .text
section .bss
absolute 41263
CType resb 2000
section .text

;-73 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];

section .bss
absolute 43263
FAdr resw 300
section .text
section .bss
absolute 43863
CAdr resw 2000
section .text

;-74 int  FCalls[FUNCMAX];

section .bss
absolute 47863
FCalls resw 300
section .text

;-75 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];

section .bss
absolute 48463
FNameField resb 4800
section .text

;-76 char NameA[]="12345678901234567890123456789012"; //must be in low memory

NameA db "12345678901234567890123456789012",0

;-77 char fgetsdest[128];         unsigned char *CNameTop=0;

section .bss
absolute 53263
fgetsdest resb 128
section .text
CNameTop dw 0

;-78 unsigned char *fgetsp=0;     unsigned int segE;

fgetsp dw 0
segE dw 0

;-79 unsigned int lineno=1;       unsigned int linenoinclude=1;

lineno dw 1
linenoinclude dw 1

;-80 unsigned char *pt=0;         unsigned char *p1=0;

pt dw 0
p1 dw 0

;-81 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;

DOS_ERR dw 0
DOS_NoBytes dw 0
DOS_ByteRead db 0

;-82 


;-83 int tt1=7; int tt2; long ex;

tt1 dw 7
tt2 dw 0
ex dd 0

;-84 void ttt(long par1) {


ttt:  ; *** PROC ***

;-85   int i1; long in; int i9;


;-86   ttt(in, ex );

;Function : ttt, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign dwrd    84 NULL par1 = bp+4
;  201 var sign word    85 NULL i1 = bp-2
;  202 var sign dwrd    85 NULL in = bp-6
;  203 var sign word    85 NULL i9 = bp-8;
 ENTER  8,0
 mov al, byte [ex]
 mov ah, 0
 push ax
 mov al, byte [bp-6]
 mov ah, 0
 push ax
 call ttt
 add  sp, 4

;-87  si = &FTop;  si=FTop;

 mov  si, FTop
 mov  si, [FTop]

;-88  si= &FAdr;     si=FAdr;

 mov  si, FAdr
 mov  si, [FAdr]

;-89  &FTop;         FTop;

 mov ax, FTop
 mov ax, [FTop]

;-90   }


;-91 int a(unsigned int i) {  printName(i);}//address
 LEAVE
 ret
; ENDP

a:  ; *** PROC ***
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word    91 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 call printName
 add  sp, 2

;-92 int v(unsigned int i) {//value 
 LEAVE
 ret
; ENDP

v:  ; *** PROC ***

;-93     if (i < LSTART) prc('['); 

;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word    92 NULL i = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 200
 jge @@v1
 push 91
 call prc
 add  sp, 2

;-94     printName(i);

@@v1:
 push word [bp+4]
 call printName
 add  sp, 2

;-95     if (i < LSTART) prc(']');   

 mov ax, [bp+4]
 cmp ax, 200
 jge @@v2
 push 93
 call prc
 add  sp, 2

;-96 }

@@v2:

;-97 int checknamelen() { int i;    i=strlen(symbol);
 LEAVE
 ret
; ENDP

checknamelen:  ; *** PROC ***
;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word    97 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-98   if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle @@checknamelen3
 push checknamelen_0
 call error1
 add  sp, 2

;-99 }

@@checknamelen3:

;-100 char doglobName[IDLENMAX];
 LEAVE
 ret
; ENDP
checknamelen_0 db "Item name is too long in characters)",0
section .bss
absolute 53391
doglobName resb 15
section .text

;-101 int doglob() { int i; int j; int isstrarr; isstrarr=0;


doglob:  ; *** PROC ***
;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   101 NULL i = bp-2
;  201 var sign word   101 NULL j = bp-4
;  202 var sign word   101 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-102   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  @@doglob4
 push doglob_0
 call error1
 add  sp, 2

;-103   if (iswidth == 0) error1("no VOID as var type");

@@doglob4:
 mov al, [iswidth]
 cmp al, 0
 jne @@doglob5
 push doglob_1
 call error1
 add  sp, 2

;-104   checknamelen();

@@doglob5:
 call checknamelen

;-105   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  @@doglob6
 push doglob_2
 call error1
 add  sp, 2

;-106   if (istoken('[')) { istype='&';

@@doglob6:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob7
 mov ax, 38
 mov byte [istype], al

;-107     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob8

;-108       prs("\nsection .bss\nabsolute ");

 push doglob_3
 call prs
 add  sp, 2

;-109       prunsign1(orgData);

 push word [orgData]
 call prunsign1
 add  sp, 2

;-110       prs("\n"); prs(symbol); 

 push doglob_4
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-111       if (iswidth==1) prs(" resb "); 

 mov al, [iswidth]
 cmp al, 1
 jne @@doglob9
 push doglob_5
 call prs
 add  sp, 2

;-112       if (iswidth==2) prs(" resw ");

@@doglob9:
 mov al, [iswidth]
 cmp al, 2
 jne @@doglob10
 push doglob_6
 call prs
 add  sp, 2

;-113       if (iswidth==4) prs(" resd ");

@@doglob10:
 mov al, [iswidth]
 cmp al, 4
 jne @@doglob11
 push doglob_7
 call prs
 add  sp, 2

;-114       prunsign1(lexval); 

@@doglob11:
 push word [lexval]
 call prunsign1
 add  sp, 2

;-115       prs("\nsection .text");

 push doglob_8
 call prs
 add  sp, 2

;-116       orgData=orgData+lexval;

 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-117       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne @@doglob12
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-118       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

@@doglob12:
 mov al, [iswidth]
 cmp al, 4
 jne @@doglob13
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-119       GData[GTop]=lexval; expect(']');

@@doglob13:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-120     }else { expect(']');

 jmp @@doglob14
@@doglob8:
 push 93
 call expect
 add  sp, 2

;-121       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  @@doglob15
 push doglob_9
 call error1
 add  sp, 2

;-122       prs("\n"); prs(symbol); prs(" db "); 

@@doglob15:
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

;-123       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-124       expect('='); 

 push 61
 call expect
 add  sp, 2

;-125       if (istoken(T_STRING)) { 

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob16

;-126         prc(34); prscomment(symbol); prc(34); prs(",0"); 

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

;-127         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-128       else if (istoken('{' )) { i=0;

 jmp @@doglob17
@@doglob16:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob18
 mov ax, 0
 mov [bp-2], ax

;-129         do { if(i) prc(','); 

@@doglob19:
 mov ax, [bp-2]
 or  al, al
 je @@doglob20
 push 44
 call prc
 add  sp, 2

;-130           expect(T_CONST); prunsign1(lexval); i=1; }

@@doglob20:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-131         while (istoken(',')); expect('}'); }  

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob21
 jmp @@doglob19
@@doglob21:
 push 125
 call expect
 add  sp, 2

;-132       else error1("String or number array expected");

 jmp @@doglob22
@@doglob18:
 push doglob_13
 call error1
 add  sp, 2

;-133       }; 

@@doglob22:
@@doglob17:
@@doglob14:

;-134   }else { //expect('=');

 jmp @@doglob23
@@doglob7:

;-135     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_14
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne @@doglob24
 push doglob_15
 call prs
 add  sp, 2

;-136     else {

 jmp @@doglob25
@@doglob24:

;-137       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne @@doglob26
 push doglob_16
 call prs
 add  sp, 2

;-138       else if (iswidth==2) prs(" dw ");

 jmp @@doglob27
@@doglob26:
 mov al, [iswidth]
 cmp al, 2
 jne @@doglob28
 push doglob_17
 call prs
 add  sp, 2

;-139       else                 prs(" dd ");

 jmp @@doglob29
@@doglob28:
 push doglob_18
 call prs
 add  sp, 2

;-140     }

@@doglob29:
@@doglob27:

;-141     if(istoken('-')) prc('-');

@@doglob25:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob30
 push 45
 call prc
 add  sp, 2

;-142     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

@@doglob30:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob31
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-143     else prunsign1(0); }

 jmp @@doglob32
@@doglob31:
 push 0
 call prunsign1
 add  sp, 2
@@doglob32:

;-144   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

@@doglob23:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-145   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-146   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-147   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je @@doglob33
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp @@doglob34
@@doglob33:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-148   GTop++; expect(';'); }

@@doglob34:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-149 


;-150 int gettypes(int i) {int j; char c;
 LEAVE
 ret
; ENDP
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

gettypes:  ; *** PROC ***

;-151   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   150 NULL i = bp+4
;  201 var sign word   150 NULL j = bp-2
;  202 var sign byte   150 NULL c = bp-4;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne @@gettypes35
 mov ax, 1
 mov word [signi], ax
 jmp @@gettypes36
@@gettypes35:
 mov ax, 0
 mov word [signi], ax

;-152   c=GWidth[i]; widthi=0;wi=0;

@@gettypes36:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-153   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne @@gettypes37
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-154   if (c==2) {widthi=2;wi=2;}

@@gettypes37:
 mov al, [bp-4]
 cmp al, 2
 jne @@gettypes38
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-155   if (c==4) {widthi=4;wi=4;}

@@gettypes38:
 mov al, [bp-4]
 cmp al, 4
 jne @@gettypes39
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-156   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

@@gettypes39:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne @@gettypes40
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-157   if (c=='&')  typei=2;  

@@gettypes40:
 mov al, [bp-4]
 cmp al, 38
 jne @@gettypes41
 mov ax, 2
 mov word [typei], ax

;-158   return i; }  

@@gettypes41:
 mov ax, [bp+4]
 jmp @@retn

;-159 int adrofname(unsigned int i) { adrF(GNameField, i); }

@@retn: LEAVE
 ret
; ENDP

adrofname:  ; *** PROC ***
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   159 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-160 int adrF(char *s, unsigned int i) { i << 4;
 LEAVE
 ret
; ENDP

adrF:  ; *** PROC ***
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   160 NULL s = bp+4
;  201 var unsg word   160 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-161   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-162 int printName(unsigned int i) {int j;
 LEAVE
 ret
; ENDP

printName:  ; *** PROC ***

;-163   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   162 NULL i = bp+4
;  201 var sign word   162 NULL j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge @@printName42
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-164   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp @@printName43
@@printName42:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle @@printName44
 push 43
 call prc
 add  sp, 2
@@printName44:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-165 }

@@printName43:

;-166 int searchname() { unsigned int i;
 LEAVE
 ret
; ENDP
printName_0 db "[bp",0

searchname:  ; *** PROC ***

;-167   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   166 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne @@searchname45
 push searchname_0
 call error1
 add  sp, 2

;-168   GUsed[i]=GUsed[i] + 1; return i;

@@searchname45:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp @@retn

;-169 }


;-170 int checkName() { unsigned int i; unsigned int j;

@@retn: LEAVE
 ret
; ENDP
searchname_0 db "Variable unknown",0

checkName:  ; *** PROC ***

;-171   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   170 NULL i = bp-2
;  201 var unsg word   170 NULL j = bp-4;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
@@checkName46:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge @@checkName47
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
 je @@checkName48
 mov ax, [bp-2]
 jmp @@retn
@@checkName48:
 inc  word[bp-2]

;-172   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp @@checkName46
@@checkName47:
 mov ax, 1
 mov [bp-2], ax
@@checkName49:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@checkName50
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
 je @@checkName51
 mov ax, [bp-2]
 jmp @@retn
@@checkName51:
 inc  word[bp-2]

;-173   return 0;

 jmp @@checkName49
@@checkName50:
 mov ax, 0
 jmp @@retn

;-174 }    


;-175 int typeName() { int m; //0=V,1=*,2=&

@@retn: LEAVE
 ret
; ENDP

typeName:  ; *** PROC ***

;-176   issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   175 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-177   if(istoken(T_SIGNED))   issign='S';  if(istoken(T_UNSIGNED)) issign='U';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName52
 mov ax, 83
 mov byte [issign], al
@@typeName52:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName53
 mov ax, 85
 mov byte [issign], al

;-178   iswidth=2;                           if(istoken(T_VOID))     iswidth=0;

@@typeName53:
 mov ax, 2
 mov byte [iswidth], al
 push 529
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName54
 mov ax, 0
 mov byte [iswidth], al

;-179   if(istoken(T_CHAR))     iswidth=1;   if(istoken(T_INT))      iswidth=2;

@@typeName54:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName55
 mov ax, 1
 mov byte [iswidth], al
@@typeName55:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName56
 mov ax, 2
 mov byte [iswidth], al

;-180   if(istoken(T_SHORT))    iswidth=2;   if(istoken(T_LONG))     iswidth=4;

@@typeName56:
 push 534
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName57
 mov ax, 2
 mov byte [iswidth], al
@@typeName57:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName58
 mov ax, 4
 mov byte [iswidth], al

;-181   if(istoken(T_UINT32)) { iswidth=4; issign='U'; }

@@typeName58:
 push 545
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName59
 mov ax, 4
 mov byte [iswidth], al
 mov ax, 85
 mov byte [issign], al

;-182   istype='V'; m=0;

@@typeName59:
 mov ax, 86
 mov byte [istype], al
 mov ax, 0
 mov [bp-2], ax

;-183   if(istoken('*'))  { istype='*'; m=1; } if(istoken('&'))  {istype='&'; m=2;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName60
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
@@typeName60:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName61
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-184   name1(); return m; }

@@typeName61:
 call name1
 mov ax, [bp-2]
 jmp @@retn

;-185 int name1() {if (token!=T_NAME) error1("Name expected"); token=getlex(); }

@@retn: LEAVE
 ret
; ENDP

name1:  ; *** PROC ***
 mov ax, [token]
 cmp ax, 256
 je  @@name162
 push name1_0
 call error1
 add  sp, 2
@@name162:
 call getlex
 mov word [token], ax

;-186 


;-187 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");

 ret
; ENDP
name1_0 db "Name expected",0

storecall:  ; *** PROC ***
;Function : storecall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   187 NULL i = bp-2;
 ENTER  2,0
 mov ax, [CTop]
 cmp ax, 2000 ;unsigned : 1
 jl  @@storecall63
 push storecall_0
 call error1
 add  sp, 2

;-188   if (CNameTop >= 65468) error1("Call name table fuill");

@@storecall63:
 mov ax, [CNameTop]
 cmp ax, 65468 ;unsigned : 0
 jb  @@storecall64
 push storecall_1
 call error1
 add  sp, 2

;-189     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

@@storecall64:
 mov ax, 0
 mov bx, [CTop]
 mov [CType+bx], al
 mov ax, [CNameTop]
 mov bx, [CTop]
 shl bx, 1
 mov [CAdr+bx], ax
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-190     to_far(CNameTop, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNameTop]
 call to_far
 add  sp, 4

;-191     CNameTop=CNameTop+i; CNameTop++; CTop++;

 mov ax, [CNameTop]
 add ax, [bp-2]
 mov word [CNameTop], ax
 inc  word[CNameTop]
 inc  word[CTop]

;-192 }


;-193 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
; ENDP
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0

storefunc:  ; *** PROC ***
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  @@storefunc65
 push storefunc_0
 call error1
 add  sp, 2

;-194     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

@@storefunc65:
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

;-195     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-196 }


;-197 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
; ENDP
storefunc_0 db "Function table full",0

addlocal:  ; *** PROC ***
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  @@addlocal66
 push addlocal_0
 call error1
 add  sp, 2

;-198   if (checkName() != 0) error1("Variable already defined");

@@addlocal66:
 call checkName
 cmp ax, 0
 je  @@addlocal67
 push addlocal_1
 call error1
 add  sp, 2

;-199   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

@@addlocal67:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-200   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-201   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-202 }


;-203 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
; ENDP
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0

checkFunction:  ; *** PROC ***
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   203 NULL i = bp-2
;  201 var unsg word   203 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-204   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

@@checkFunction68:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@checkFunction69
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
 je @@checkFunction70
 mov ax, [bp-2]
 jmp @@retn
@@checkFunction70:
 inc  word[bp-2]

;-205   return 0; }

 jmp @@checkFunction68
@@checkFunction69:
 mov ax, 0
 jmp @@retn

;-206 int dofunc() { int nloc; int i; int narg;  

@@retn: LEAVE
 ret
; ENDP

dofunc:  ; *** PROC ***

;-207   cloc=&co; 

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   206 NULL nloc = bp-2
;  201 var sign word   206 NULL i = bp-4
;  202 var sign word   206 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-208   checknamelen();

 call checknamelen

;-209   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-210   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je @@dofunc71
 push dofunc_0
 call error1
 add  sp, 2

;-211   storefunc();

@@dofunc71:
 call storefunc

;-212   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");

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

;-213   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-214   if (istoken(')')==0) { narg=2; 

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@dofunc72
 mov ax, 2
 mov [bp-6], ax

;-215     do { typeName();  addlocal(); narg+=2;

@@dofunc73:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-216          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne @@dofunc74
 add  word[bp-6], 2
@@dofunc74:
 inc  word[LTop]

;-217     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc75
 jmp @@dofunc73
@@dofunc75:
 push 41
 call expect
 add  sp, 2

;-218     


;-219   expect('{'); /*body*/

@@dofunc72:
 push 123
 call expect
 add  sp, 2

;-220   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-221   while(isvariable()) {

@@dofunc76:
 call isvariable
 or  al, al
 je @@dofunc77

;-222     do {typeName();

@@dofunc78:
 call typeName

;-223         checknamelen();

 call checknamelen

;-224         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-225         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne @@dofunc79
 sub  word[bp-2], 2

;-226         GData[LTop]=nloc;

@@dofunc79:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-227         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc80
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

;-228             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-229         LTop++;

@@dofunc80:
 inc  word[LTop]

;-230       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc81
 jmp @@dofunc78
@@dofunc81:
 push 59
 call expect
 add  sp, 2

;-231   listproc(); 

 jmp @@dofunc76
@@dofunc77:
 call listproc

;-232   if (LTop>LSTART){prs(";\n ENTER  "); 

 mov ax, [LTop]
 cmp ax, 200
 jle @@dofunc82
 push dofunc_3
 call prs
 add  sp, 2

;-233     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }

 push word [bp-2]
 call mkneg
 add  sp, 2
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
 push dofunc_4
 call prs
 add  sp, 2

;-234   while(istoken('}')==0)   stmt();

@@dofunc82:
@@dofunc83:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@dofunc84
 call stmt

;-235   if (nreturn) { prs("\n@@retn:");}

 jmp @@dofunc83
@@dofunc84:
 mov ax, [nreturn]
 or  al, al
 je @@dofunc85
 push dofunc_5
 call prs
 add  sp, 2

;-236   if (LTop > LSTART) prs(" LEAVE");

@@dofunc85:
 mov ax, [LTop]
 cmp ax, 200
 jle @@dofunc86
 push dofunc_6
 call prs
 add  sp, 2

;-237   prs("\n ret"); prs("\n; ENDP"); 

@@dofunc86:
 push dofunc_7
 call prs
 add  sp, 2
 push dofunc_8
 call prs
 add  sp, 2

;-238   *cloc=0; prs(co); maxco1=strlen(co);

 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 lea  ax, [co]
 push ax
 call strlen
 add  sp, 2
 mov word [maxco1], ax

;-239   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle @@dofunc87
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-240 }

@@dofunc87:

;-241 int isvariable() {
 LEAVE
 ret
; ENDP
dofunc_0 db "Function already defined",0
dofunc_1 db "\n\n",0
dofunc_2 db ":  ; *** PROC ***",0
dofunc_3 db ";\n ENTER  ",0
dofunc_4 db ",0",0
dofunc_5 db "\n@@retn:",0
dofunc_6 db " LEAVE",0
dofunc_7 db "\n ret",0
dofunc_8 db "\n; ENDP",0

isvariable:  ; *** PROC ***

;-242   if(token==T_SIGNED) goto v1;   if(token==T_UNSIGNED) goto v1;

 mov ax, [token]
 cmp ax, 531
 jne @@isvariable88
 jmp @@v1
@@isvariable88:
 mov ax, [token]
 cmp ax, 532
 jne @@isvariable89
 jmp @@v1

;-243   if(token==T_CHAR)   goto v1;   if(token==T_INT)      goto v1;

@@isvariable89:
 mov ax, [token]
 cmp ax, 530
 jne @@isvariable90
 jmp @@v1
@@isvariable90:
 mov ax, [token]
 cmp ax, 517
 jne @@isvariable91
 jmp @@v1

;-244   if(token==T_SHORT)  goto v1;   if(token==T_LONG)     goto v1;

@@isvariable91:
 mov ax, [token]
 cmp ax, 534
 jne @@isvariable92
 jmp @@v1
@@isvariable92:
 mov ax, [token]
 cmp ax, 533
 jne @@isvariable93
 jmp @@v1

;-245   if(token==T_UINT32) goto v1;   return 0;  v1: return 1;

@@isvariable93:
 mov ax, [token]
 cmp ax, 545
 jne @@isvariable94
 jmp @@v1
@@isvariable94:
 mov ax, 0
 jmp @@retn
@@v1:
 mov ax, 1
 jmp @@retn

;-246 }


;-247                   


;-248 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;

@@retn:
 ret
; ENDP
mod1 dw 0
ireg1 dw 0
idx1 dw 0
ids1 dw 0
idw1 dw 0
idt1 dw 0
val1 dw 0

;-249 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

mod2 dw 0
ireg2 dw 0
idx2 dw 0
ids2 dw 0
idw2 dw 0
idt2 dw 0
val2 dw 0

;-250 


;-251 int pexpr() {expect('('); iscmp=0; 


pexpr:  ; *** PROC ***
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-252   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne @@pexpr95
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@pexpr96
 call constantexpr
 jmp @@retn

;-253     ireg1=checkreg();

@@pexpr96:
 call checkreg
 mov word [ireg1], ax

;-254     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je @@pexpr97
 push 1
 call doreg1
 add  sp, 2
 jmp @@retn
@@pexpr97:

;-255   exprstart(); if (iscmp==0) prs("\n or  al, al\n je @@");  prs(fname);

@@pexpr95:
 call exprstart
 mov ax, [iscmp]
 cmp ax, 0
 jne @@pexpr98
 push pexpr_1
 call prs
 add  sp, 2
@@pexpr98:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-256   expect(')'); }           /*error1("Vergleich fehlt");*/

 push 41
 call expect
 add  sp, 2

;-257 


;-258 int constantexpr() { int mode; int id1;int ids;

@@retn:
 ret
; ENDP
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je @@",0

constantexpr:  ; *** PROC ***

;-259   token=getlex();   mode=typeName();  

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   258 NULL mode = bp-2
;  201 var sign word   258 NULL id1 = bp-4
;  202 var sign word   258 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-260   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-261   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne @@constantexpr99
 push constantexpr_0
 call error1
 add  sp, 2

;-262   expect(T_CONST);  prs(" ; constant expression");

@@constantexpr99:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-263   prs("\ncmp "); 

 push constantexpr_2
 call prs
 add  sp, 2

;-264   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@constantexpr100
 push constantexpr_3
 call prs
 add  sp, 2
 jmp @@constantexpr101
@@constantexpr100:
 push constantexpr_4
 call prs
 add  sp, 2

;-265   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

@@constantexpr101:
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

;-266   expect(')');

 push 41
 call expect
 add  sp, 2

;-267 }  


;-268 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
 LEAVE
 ret
; ENDP
constantexpr_0 db "Relational expression expected",0
constantexpr_1 db " ; constant expression",0
constantexpr_2 db "\ncmp ",0
constantexpr_3 db "word",0
constantexpr_4 db "byte",0
constantexpr_5 db ", ",0

exprstart:  ; *** PROC ***
 push exprstart_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@exprstart102
 push 0
 call expr2
 add  sp, 2
 jmp @@exprstart103
@@exprstart102:
 push 0
 call expr
 add  sp, 2
@@exprstart103:

;-269 


;-270 int expr2(int kind) {  int i;

 ret
; ENDP
exprstart_0 db "_",0

expr2:  ; *** PROC ***

;-271   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   270 NULL kind = bp+4
;  201 var sign word   270 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  @@expr2104
 call getlex
 mov word [token], ax

;-272   mod1=typeName();

@@expr2104:
 call typeName
 mov word [mod1], ax

;-273   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je @@expr2105
 push expr2_0
 call error1
 add  sp, 2

;-274   ireg1=checkreg();

@@expr2105:
 call checkreg
 mov word [ireg1], ax

;-275   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je @@expr2106
 push 0
 call doreg1
 add  sp, 2
 jmp @@retn

;-276   if (ireg1 == 0) { idx1=searchname();

@@expr2106:
 mov ax, [ireg1]
 cmp ax, 0
 jne @@expr2107
 call searchname
 mov word [idx1], ax

;-277     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-278     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je @@expr2108
 push expr2_1
 call error1
 add  sp, 2
@@expr2108:

;-279   


;-280   if (isrelational()) { error1("Vergleich noch nicht implementiert");

@@expr2107:
 call isrelational
 or  al, al
 je @@expr2109
 push expr2_2
 call error1
 add  sp, 2

;-281   }


;-282   if (istoken('=') == 0) error1("Assign expected");

@@expr2109:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@expr2110
 push expr2_3
 call error1
 add  sp, 2

;-283   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

@@expr2110:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr2111
 mov ax, [lexval]
 mov word [val2], ax
 push expr2_4
 call prs
 add  sp, 2

;-284     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-285     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne @@expr2112
 push expr2_6
 call prs
 add  sp, 2

;-286     if (idw1 == 2) prs("word ");

@@expr2112:
 mov ax, [idw1]
 cmp ax, 2
 jne @@expr2113
 push expr2_7
 call prs
 add  sp, 2

;-287     if (idw1 == 4) prs("dword ");

@@expr2113:
 mov ax, [idw1]
 cmp ax, 4
 jne @@expr2114
 push expr2_8
 call prs
 add  sp, 2

;-288     v(idx1);

@@expr2114:
 push word [idx1]
 call v
 add  sp, 2

;-289     prs(", "); prunsign1(val2);

 push expr2_9
 call prs
 add  sp, 2
 push word [val2]
 call prunsign1
 add  sp, 2

;-290     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

 mov ax, [idx1]
 cmp ax, 200 ;unsigned : 1
 jl  @@expr2115
 push word [idx1]
 call adrofname
 add  sp, 2
 mov [bp-2], ax
 push expr2_10
 call prs
 add  sp, 2
 push word [bp-2]
 call prs
 add  sp, 2
@@expr2115:
 jmp @@retn

;-291   


;-292   mod1=typeName(); ireg2=checkreg();

@@expr2111:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-293   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je @@expr2116
 push expr2_11
 call prs
 add  sp, 2

;-294     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}

 mov ax, [ireg1]
 or  al, al
 je @@expr2117
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp @@expr2118
@@expr2117:
 push word [idx1]
 call v
 add  sp, 2
@@expr2118:
 push expr2_12
 call prs
 add  sp, 2
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp @@retn

;-295   else {

 jmp @@expr2119
@@expr2116:

;-296     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne @@expr2120
 push expr2_13
 call error1
 add  sp, 2

;-297     


;-298     idx2=searchname();

@@expr2120:
 call searchname
 mov word [idx2], ax

;-299     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-300     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne @@expr2121
 push expr2_14
 call error1
 add  sp, 2

;-301     prs("\nmov ");

@@expr2121:
 push expr2_15
 call prs
 add  sp, 2

;-302     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");

 mov ax, [ireg1]
 or  al, al
 je @@expr2122
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp @@expr2123
@@expr2122:
 push expr2_16
 call error1
 add  sp, 2

;-303     prs(", ");

@@expr2123:
 push expr2_17
 call prs
 add  sp, 2

;-304     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne @@expr2124
 push word [idx2]
 call a
 add  sp, 2

;-305     else {

 jmp @@expr2125
@@expr2124:

;-306       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne @@expr2126
 push expr2_18
 call prs
 add  sp, 2

;-307       if (idw2 == 2) prs("word ");

@@expr2126:
 mov ax, [idw2]
 cmp ax, 2
 jne @@expr2127
 push expr2_19
 call prs
 add  sp, 2

;-308       if (idw2 == 4) prs("dword ");

@@expr2127:
 mov ax, [idw2]
 cmp ax, 4
 jne @@expr2128
 push expr2_20
 call prs
 add  sp, 2

;-309       v(idx2);

@@expr2128:
 push word [idx2]
 call v
 add  sp, 2

;-310       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

 mov ax, [idx2]
 cmp ax, 200 ;unsigned : 1
 jl  @@expr2129
 push word [idx2]
 call adrofname
 add  sp, 2
 mov [bp-2], ax
 push expr2_21
 call prs
 add  sp, 2
 push word [bp-2]
 call prs
 add  sp, 2
@@expr2129:

;-311     return;

@@expr2125:
 jmp @@retn

;-312   } error1("Internal error: only const or reg allowed");

@@expr2119:
 push expr2_22
 call error1
 add  sp, 2

;-313 }


;-314 char ops[5];

@@retn: LEAVE
 ret
; ENDP
expr2_0 db "Noch kein & und * im Text (Linke Hand) erlaubt",0
expr2_1 db "Noch kein Array oder Pointer links erlaubt",0
expr2_2 db "Vergleich noch nicht implementiert",0
expr2_3 db "Assign expected",0
expr2_4 db " ; constant expression",0
expr2_5 db "\nmov ",0
expr2_6 db "byte ",0
expr2_7 db "word ",0
expr2_8 db "dword ",0
expr2_9 db ", ",0
expr2_10 db "; ",0
expr2_11 db "\nmov ",0
expr2_12 db ", ",0
expr2_13 db "Noch kein * im Text erlaubt",0
expr2_14 db "Noch kein Array rechts erlaubt",0
expr2_15 db "\nmov ",0
expr2_16 db "Mem to Mem not allowed by x86-CPU",0
expr2_17 db ", ",0
expr2_18 db "byte ",0
expr2_19 db "word ",0
expr2_20 db "dword ",0
expr2_21 db "; ",0
expr2_22 db "Internal error: only const or reg allowed",0
section .bss
absolute 53406
ops resb 5
section .text

;-315 int doreg1(int iscmp1) { int i;


doreg1:  ; *** PROC ***

;-316   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   315 NULL iscmp1 = bp+4
;  201 var sign word   315 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1130
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-317   if (istoken(T_PLUSASS))    strcpy(ops, "add");

@@doreg1130:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1131
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-318   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

@@doreg1131:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1132
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-319   if (istoken(T_ANDASS))     strcpy(ops, "and");

@@doreg1132:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1133
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-320   if (istoken(T_ORASS))      strcpy(ops, "or" );

@@doreg1133:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1134
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-321   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

@@doreg1134:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1135
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-322   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

@@doreg1135:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1136
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-323   if (iscmp1 == 1) { token=getlex();

@@doreg1136:
 mov ax, [bp+4]
 cmp ax, 1
 jne @@doreg1137
 call getlex
 mov word [token], ax

;-324       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne @@doreg1138
 push doreg1_7
 call error1
 add  sp, 2

;-325       strcpy(ops, "cmp"); }

@@doreg1138:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-326   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

@@doreg1137:
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

;-327 


;-328   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1139
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp @@reg1

;-329   mod2=typeName(); ireg2=checkreg();

@@doreg1139:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-330   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je @@doreg1140
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp @@reg1

;-331   i=searchname();  if (mod2 == 2) a(i); else v(i);

@@doreg1140:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne @@doreg1141
 push word [bp-2]
 call a
 add  sp, 2
 jmp @@doreg1142
@@doreg1141:
 push word [bp-2]
 call v
 add  sp, 2

;-332   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

@@doreg1142:
@@reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne @@doreg1143
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

;-333 }

@@doreg1143:

;-334 int checkreg() { // >=17 = 16bit, >=47 = 32bit
 LEAVE
 ret
; ENDP
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

checkreg:  ; *** PROC ***

;-335   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge @@checkreg144
 mov ax, 0
 jmp @@retn

;-336   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

@@checkreg144:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg145
 mov ax, 1
 jmp @@retn
@@checkreg145:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg146
 mov ax, 3
 jmp @@retn

;-337   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

@@checkreg146:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg147
 mov ax, 5
 jmp @@retn
@@checkreg147:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg148
 mov ax, 7
 jmp @@retn

;-338   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

@@checkreg148:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg149
 mov ax, 9
 jmp @@retn
@@checkreg149:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg150
 mov ax, 11
 jmp @@retn

;-339   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

@@checkreg150:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg151
 mov ax, 13
 jmp @@retn
@@checkreg151:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg152
 mov ax, 15
 jmp @@retn

;-340   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

@@checkreg152:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg153
 mov ax, 17
 jmp @@retn
@@checkreg153:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg154
 mov ax, 19
 jmp @@retn

;-341   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

@@checkreg154:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg155
 mov ax, 21
 jmp @@retn
@@checkreg155:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg156
 mov ax, 23
 jmp @@retn

;-342   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

@@checkreg156:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg157
 mov ax, 25
 jmp @@retn
@@checkreg157:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg158
 mov ax, 27
 jmp @@retn

;-343   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

@@checkreg158:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg159
 mov ax, 29
 jmp @@retn
@@checkreg159:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg160
 mov ax, 31
 jmp @@retn

;-344   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

@@checkreg160:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg161
 mov ax, 33
 jmp @@retn
@@checkreg161:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg162
 mov ax, 35
 jmp @@retn

;-345   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

@@checkreg162:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg163
 mov ax, 37
 jmp @@retn
@@checkreg163:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg164
 mov ax, 39
 jmp @@retn

;-346   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

@@checkreg164:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg165
 mov ax, 41
 jmp @@retn
@@checkreg165:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg166
 mov ax, 43
 jmp @@retn

;-347   // (eqstr(symbol,"ip")) return 45;


;-348   if (strlen(symbol) >   3) return 0;

@@checkreg166:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle @@checkreg167
 mov ax, 0
 jmp @@retn

;-349   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

@@checkreg167:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg168
 mov ax, 47
 jmp @@retn
@@checkreg168:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg169
 mov ax, 50
 jmp @@retn

;-350   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

@@checkreg169:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg170
 mov ax, 53
 jmp @@retn
@@checkreg170:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg171
 mov ax, 56
 jmp @@retn

;-351   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

@@checkreg171:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg172
 mov ax, 59
 jmp @@retn
@@checkreg172:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg173
 mov ax, 62
 jmp @@retn

;-352   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

@@checkreg173:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg174
 mov ax, 65
 jmp @@retn
@@checkreg174:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg175
 mov ax, 68
 jmp @@retn

;-353   if (eqstr(symbol,"cr0")) return 71;

@@checkreg175:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg176
 mov ax, 71
 jmp @@retn

;-354   return 0;   }

@@checkreg176:
 mov ax, 0
 jmp @@retn

;-355 char printregstr[]

@@retn:
 ret
; ENDP
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

;-356 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-357 //          1         2         3         4         5         6         7


;-358 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-359 int printreg(int i) {  unsigned int k; unsigned char c;


printreg:  ; *** PROC ***

;-360   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   359 NULL i = bp+4
;  201 var unsg word   359 NULL k = bp-2
;  202 var unsg byte   359 NULL c = bp-4;
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

;-361   k = &printregstr + i; c=*k; prc(c);

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

;-362   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle @@printreg177
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

;-363 }

@@printreg177:

;-364 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
; ENDP
evalue dw 0
exprtype dw 10

;-365 int expr(int isRight)


expr:  ; *** PROC ***

;-366 { int mode; int id1;     int ixarr; int ixconst;


;-367   int ids;  int isCONST; int i;     unsigned char *p;


;-368   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   365 NULL isRight = bp+4
;  201 var sign word   366 NULL mode = bp-2
;  202 var sign word   366 NULL id1 = bp-4
;  203 var sign word   366 NULL ixarr = bp-6
;  204 var sign word   366 NULL ixconst = bp-8
;  205 var sign word   367 NULL ids = bp-10
;  206 var sign word   367 NULL isCONST = bp-12
;  207 var sign word   367 NULL i = bp-14
;  208 ptr unsg byte   367 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr178
 mov ax, [lexval]
 mov word [evalue], ax

;-369     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp @@retn

;-370   mode=typeName(); /*0=V,1=*,2=&*/

@@expr178:
 call typeName
 mov [bp-2], ax

;-371   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-372   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je @@expr179
 push 0
 call doreg1
 add  sp, 2
 jmp @@retn

;-373   if (token=='(')  {docall1(); goto e1; }

@@expr179:
 mov ax, [token]
 cmp ax, 40
 jne @@expr180
 call docall1
 jmp @@e1

;-374   if (isreg()) goto e1;

@@expr180:
 call isreg
 or  al, al
 je @@expr181
 jmp @@e1

;-375 


;-376   id1=searchname(); gettypes(id1); ids=signi;

@@expr181:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-377   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-378     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@expr182
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr183

;-379       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-380     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp @@expr184
@@expr183:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-381     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-382     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  @@expr185
 push expr_1
 call error1
 add  sp, 2
@@expr185:
@@expr184:

;-383   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

@@expr182:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je @@expr186
 mov ax, [bp-2]
 or  al, al
 je @@expr187
 push expr_2
 call error1
 add  sp, 2

;-384      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

@@expr187:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@expr188
 push expr_4
 call prs
 add  sp, 2
 jmp @@expr189
@@expr188:
 push expr_5
 call prs
 add  sp, 2

;-385      v(id1); goto e1;}

@@expr189:
 push word [bp-4]
 call v
 add  sp, 2
 jmp @@e1

;-386   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

@@expr186:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je @@expr190
 mov ax, [bp-2]
 or  al, al
 je @@expr191
 push expr_6
 call error1
 add  sp, 2

;-387      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

@@expr191:
 push expr_7
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@expr192
 push expr_8
 call prs
 add  sp, 2
 jmp @@expr193
@@expr192:
 push expr_9
 call prs
 add  sp, 2

;-388      v(id1); goto e1;}

@@expr193:
 push word [bp-4]
 call v
 add  sp, 2
 jmp @@e1

;-389        


;-390   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

@@expr190:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je @@expr194
 push word [bp-4]
 push word [bp-2]
 push expr_10
 call compoundass
 add  sp, 6
 jmp @@e1

;-391   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

@@expr194:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je @@expr195
 push word [bp-4]
 push word [bp-2]
 push expr_11
 call compoundass
 add  sp, 6
 jmp @@e1

;-392   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

@@expr195:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je @@expr196
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp @@e1

;-393   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    

@@expr196:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je @@expr197
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp @@e1

;-394   if (istoken(T_MULASS    )) {error1("not implemented");}

@@expr197:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je @@expr198
 push expr_14
 call error1
 add  sp, 2

;-395   if (istoken(T_DIVASS    )) {error1("not implemented");}

@@expr198:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je @@expr199
 push expr_15
 call error1
 add  sp, 2

;-396 


;-397   if (istoken('=')) { exprtype= expr(1); 

@@expr199:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@expr200
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-398   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp @@e1

;-399   dovar1(mode, "mov", ixarr, id1);

@@expr200:
 push word [bp-4]
 push word [bp-6]
 push expr_16
 push word [bp-2]
 call dovar1
 add  sp, 8

;-400   


;-401 e1:    if (istoken('+')) rterm("add");

@@e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je @@expr201
 push expr_17
 call rterm
 add  sp, 2

;-402   else if (istoken('-')) rterm("sub" );

 jmp @@expr202
@@expr201:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je @@expr203
 push expr_18
 call rterm
 add  sp, 2

;-403   else if (istoken('&')) rterm("and" );

 jmp @@expr204
@@expr203:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@expr205
 push expr_19
 call rterm
 add  sp, 2

;-404   else if (istoken('|')) rterm("or" );  

 jmp @@expr206
@@expr205:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je @@expr207
 push expr_20
 call rterm
 add  sp, 2

;-405   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp @@expr208
@@expr207:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je @@expr209
 push expr_21
 call rterm
 add  sp, 2

;-406   else if (istoken(T_GREATGREAT)) rterm("shr");  

 jmp @@expr210
@@expr209:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je @@expr211
 push expr_22
 call rterm
 add  sp, 2

;-407   else if (istoken('*')) domul (ids);

 jmp @@expr212
@@expr211:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je @@expr213
 push word [bp-10]
 call domul
 add  sp, 2

;-408   else if (istoken('/')) doidiv(ids);

 jmp @@expr214
@@expr213:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je @@expr215
 push word [bp-10]
 call doidiv
 add  sp, 2

;-409   else if (istoken('%')) domod (ids);

 jmp @@expr216
@@expr215:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je @@expr217
 push word [bp-10]
 call domod
 add  sp, 2

;-410   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

@@expr217:
@@expr216:
@@expr214:
@@expr212:
@@expr210:
@@expr208:
@@expr206:
@@expr204:
@@expr202:
 call isrelational
 or  al, al
 je @@expr218
 push expr_23
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-411   return 0;

@@expr218:
 mov ax, 0
 jmp @@retn

;-412 }


;-413 


;-414 int compoundass(char *op, int mode, int id1) {

@@retn: LEAVE
 ret
; ENDP
expr_0 db "\n mov ax, ",0
expr_1 db "Arrayindex muss Zahl oder int sein",0
expr_2 db "Nur var erlaubt",0
expr_3 db "\n inc  ",0
expr_4 db "word",0
expr_5 db "byte",0
expr_6 db "Nur var erlaubt",0
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

compoundass:  ; *** PROC ***

;-415   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   414 NULL op = bp+4
;  201 var sign word   414 NULL mode = bp+6
;  202 var sign word   414 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je @@compoundass219
 push compoundass_0
 call error1
 add  sp, 2

;-416   prnl(); prs(op); prs("  "); 

@@compoundass219:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-417   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@compoundass220
 push compoundass_2
 call prs
 add  sp, 2
 jmp @@compoundass221
@@compoundass220:
 push compoundass_3
 call prs
 add  sp, 2

;-418   v(id1); prs(", ");

@@compoundass221:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_4
 call prs
 add  sp, 2

;-419   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-420 }


;-421 int dovar1(int mode, int op, int ixarr, int id1) { 
 LEAVE
 ret
; ENDP
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db ", ",0

dovar1:  ; *** PROC ***

;-422   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   421 NULL mode = bp+4
;  201 var sign word   421 NULL op = bp+6
;  202 var sign word   421 NULL ixarr = bp+8
;  203 var sign word   421 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-423   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne @@dovar1222
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

;-424     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne @@dovar1223
 push dovar1_1
 call prs
 add  sp, 2

;-425     if(widthi == 2) prs(" ax, [bx]");

@@dovar1223:
 mov ax, [widthi]
 cmp ax, 2
 jne @@dovar1224
 push dovar1_2
 call prs
 add  sp, 2

;-426     return; }

@@dovar1224:
 jmp @@retn

;-427   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

@@dovar1222:
 mov ax, [bp+4]
 cmp ax, 2
 jne @@dovar1225
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
 jmp @@retn

;-428   if (ixarr) {

@@dovar1225:
 mov ax, [bp+8]
 or  al, al
 je @@dovar1226

;-429     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-430     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1227
 push dovar1_5
 call prs
 add  sp, 2

;-431     prs("\n "); prs(op);

@@dovar1227:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-432     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1228
 push dovar1_7
 call prs
 add  sp, 2
 jmp @@dovar1229
@@dovar1228:
 push dovar1_8
 call prs
 add  sp, 2

;-433 // v(id1); prs(" [bx]");


;-434     prc('['); printName(id1); prs(" + bx]"); 

@@dovar1229:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-435     return; }

 jmp @@retn

;-436   prnl();prs(op);

@@dovar1226:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-437   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne @@dovar1230
 push dovar1_10
 call prs
 add  sp, 2

;-438   if(wi==2) prs(" ax, ");

@@dovar1230:
 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1231
 push dovar1_11
 call prs
 add  sp, 2

;-439   if(wi==4) prs(" eax, ");

@@dovar1231:
 mov ax, [wi]
 cmp ax, 4
 jne @@dovar1232
 push dovar1_12
 call prs
 add  sp, 2

;-440   v(id1);

@@dovar1232:
 push word [bp+10]
 call v
 add  sp, 2

;-441 }


;-442 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

@@retn: LEAVE
 ret
; ENDP
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

rterm:  ; *** PROC ***

;-443   if (istoken(T_CONST)) { prnl(); prs(op); 

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   442 NULL op = bp+4
;  201 var sign word   442 NULL mode = bp-2
;  202 var sign word   442 NULL opint = bp-4
;  203 var sign word   442 NULL ixarr = bp-6
;  204 var sign word   442 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@rterm233
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-444     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne @@rterm234
 push rterm_0
 call prs
 add  sp, 2

;-445     if (wi==2) prs(" ax, ");

@@rterm234:
 mov ax, [wi]
 cmp ax, 2
 jne @@rterm235
 push rterm_1
 call prs
 add  sp, 2

;-446     if (wi==4) prs(" eax, ");

@@rterm235:
 mov ax, [wi]
 cmp ax, 4
 jne @@rterm236
 push rterm_2
 call prs
 add  sp, 2

;-447     prunsign1(lexval); return;}

@@rterm236:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp @@retn

;-448   mode=typeName(); id1=searchname(); ixarr=0;

@@rterm233:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-449   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@rterm237
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-450     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-451     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  @@rterm238
 push rterm_3
 call error1
 add  sp, 2
@@rterm238:

;-452   if (eqstr(symbol,"_AX")) return;

@@rterm237:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@rterm239
 jmp @@retn

;-453   opint=op; dovar1(mode, opint, ixarr, id1);

@@rterm239:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-454 }


;-455 int isreg() {

@@retn: LEAVE
 ret
; ENDP
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0

isreg:  ; *** PROC ***

;-456   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg240
 push isreg_1
 call doreg
 add  sp, 2
 jmp @@r1

;-457   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  

@@isreg240:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg241
 push isreg_3
 call doreg
 add  sp, 2
 jmp @@r1

;-458   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

@@isreg241:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg242
 push isreg_5
 call doreg
 add  sp, 2
 jmp @@r1

;-459   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

@@isreg242:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg243
 push isreg_7
 call doreg
 add  sp, 2
 jmp @@r1

;-460   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

@@isreg243:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg244
 push isreg_9
 call doreg
 add  sp, 2
 jmp @@r1

;-461   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    

@@isreg244:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg245
 push isreg_11
 call doreg
 add  sp, 2
 jmp @@r1

;-462   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

@@isreg245:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg246
 push isreg_13
 call doreg
 add  sp, 2
 jmp @@r1

;-463   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

@@isreg246:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg247
 push isreg_15
 call doreg
 add  sp, 2
 jmp @@r1

;-464   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    

@@isreg247:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg248
 push isreg_17
 call doreg
 add  sp, 2
 jmp @@r1

;-465   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

@@isreg248:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg249
 push isreg_19
 call doreg
 add  sp, 2
 jmp @@r1

;-466   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

@@isreg249:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg250
 push isreg_21
 call doreg
 add  sp, 2
 jmp @@r1

;-467   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  

@@isreg250:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg251
 push isreg_23
 call doreg
 add  sp, 2
 jmp @@r1

;-468   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

@@isreg251:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg252
 push isreg_25
 call doreg
 add  sp, 2
 jmp @@r1

;-469   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

@@isreg252:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg253
 push isreg_27
 call doreg
 add  sp, 2
 jmp @@r1

;-470   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  

@@isreg253:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg254
 push isreg_29
 call doreg
 add  sp, 2
 jmp @@r1

;-471   return 0;   r1: return 1; 

@@isreg254:
 mov ax, 0
 jmp @@retn
@@r1:
 mov ax, 1
 jmp @@retn

;-472 }


;-473 int doreg(char *dr) { int i; expect('=');

@@retn:
 ret
; ENDP
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

doreg:  ; *** PROC ***
;Function : doreg, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   473 NULL dr = bp+4
;  201 var sign word   473 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-474   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-475        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg255
 push word [lexval]
 call prunsign1
 add  sp, 2

;-476   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp @@doreg256
@@doreg255:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg257
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-477   else error1("only number or var allowed"); }

 jmp @@doreg258
@@doreg257:
 push doreg_2
 call error1
 add  sp, 2
@@doreg258:
@@doreg256:

;-478 


;-479 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
; ENDP
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0

doassign:  ; *** PROC ***

;-480   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   479 NULL mode = bp+4
;  201 var sign word   479 NULL i = bp+6
;  202 var sign word   479 NULL ixarr = bp+8
;  203 var sign word   479 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-481   if (mode==1) {prs("\n mov  bx, ");v(i);                  

 mov ax, [bp+4]
 cmp ax, 1
 jne @@doassign259
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-482     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne @@doassign260
 push doassign_1
 call prs
 add  sp, 2

;-483     else  prs("\n mov  [bx], al"); return;}

 jmp @@doassign261
@@doassign260:
 push doassign_2
 call prs
 add  sp, 2
@@doassign261:
 jmp @@retn

;-484   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

@@doassign259:
 mov ax, [bp+4]
 cmp ax, 2
 jne @@doassign262
 push doassign_3
 call prs
 add  sp, 2
 push word [bp+6]
 call a
 add  sp, 2
 push doassign_4
 call prs
 add  sp, 2
 jmp @@retn

;-485   if (ixarr) {  prs("\n mov bx, ");

@@doassign262:
 mov ax, [bp+8]
 or  al, al
 je @@doassign263
 push doassign_5
 call prs
 add  sp, 2

;-486     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je @@doassign264
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp @@doassign265
@@doassign264:
 push word [bp+8]
 call v
 add  sp, 2

;-487     if (wi==2) prs("\n shl bx, 1");

@@doassign265:
 mov ax, [wi]
 cmp ax, 2
 jne @@doassign266
 push doassign_6
 call prs
 add  sp, 2

;-488     prs("\n mov ["); printName(i);

@@doassign266:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-489     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne @@doassign267
 push doassign_8
 call prs
 add  sp, 2
 jmp @@doassign268
@@doassign267:
 push doassign_9
 call prs
 add  sp, 2
@@doassign268:
 jmp @@retn

;-490   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

@@doassign263:
 mov ax, [wi]
 cmp ax, 1
 jne @@doassign269
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign270
 push doassign_11
 call prs
 add  sp, 2

;-491     } v(i); prs(", al"); return; }

@@doassign270:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_12
 call prs
 add  sp, 2
 jmp @@retn

;-492   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

@@doassign269:
 mov ax, [wi]
 cmp ax, 2
 jne @@doassign271
 push doassign_13
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign272
 push doassign_14
 call prs
 add  sp, 2

;-493     } v(i); prs(", ax"); return; }

@@doassign272:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_15
 call prs
 add  sp, 2
 jmp @@retn

;-494   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

@@doassign271:
 mov ax, [wi]
 cmp ax, 4
 jne @@doassign273
 push doassign_16
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign274
 push doassign_17
 call prs
 add  sp, 2

;-495     } v(i); prs(", eax"); return; }

@@doassign274:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_18
 call prs
 add  sp, 2
 jmp @@retn

;-496 }

@@doassign273:

;-497 int domul(int ids) {

@@retn: LEAVE
 ret
; ENDP
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

domul:  ; *** PROC ***

;-498   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   497 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je @@domul275
 push domul_0
 call rterm
 add  sp, 2
 jmp @@domul276
@@domul275:

;-499   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@domul277
 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-500   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp @@domul278
@@domul277:
 push domul_3
 call error1
 add  sp, 2
@@domul278:
@@domul276:

;-501 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
; ENDP
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0

doidiv:  ; *** PROC ***

;-502   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   501 NULL ids = bp+4
;  201 var sign word   501 NULL mode = bp-2
;  202 var sign word   501 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doidiv279

;-503     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-504     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je @@doidiv280
 push doidiv_1
 call prs
 add  sp, 2
 jmp @@doidiv281
@@doidiv280:
 push doidiv_2
 call prs
 add  sp, 2
@@doidiv281:

;-505   else {

 jmp @@doidiv282
@@doidiv279:

;-506     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-507     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je @@doidiv283
 push doidiv_3
 call error1
 add  sp, 2

;-508     gettypes(id1);

@@doidiv283:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-509     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je @@doidiv284
 push doidiv_4
 call error1
 add  sp, 2

;-510     if (wi!=2) error1("only int, no byte as divisor allowed");

@@doidiv284:
 mov ax, [wi]
 cmp ax, 2
 je  @@doidiv285
 push doidiv_5
 call error1
 add  sp, 2

;-511     prs("\n mov bx, "); v(id1);

@@doidiv285:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-512     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je @@doidiv286
 push doidiv_7
 call prs
 add  sp, 2
 jmp @@doidiv287
@@doidiv286:
 push doidiv_8
 call prs
 add  sp, 2
@@doidiv287:

;-513 }

@@doidiv282:

;-514 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
 LEAVE
 ret
; ENDP
doidiv_0 db "\n mov bx, ",0
doidiv_1 db "\n cwd\n idiv bx",0
doidiv_2 db "\n mov dx, 0\n div bx",0
doidiv_3 db "only const number or int as divisor allowed",0
doidiv_4 db "only int as simple var divisor allowed",0
doidiv_5 db "only int, no byte as divisor allowed",0
doidiv_6 db "\n mov bx, ",0
doidiv_7 db "\n cwd\n idiv bx",0
doidiv_8 db "\n mov dx, 0\n div bx",0

domod:  ; *** PROC ***
;Function : domod, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   514 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-515 


;-516 int docalltype[10]; int docallvalue[10];
 LEAVE
 ret
; ENDP
domod_0 db "\n mov ax, dx",0
section .bss
absolute 53411
docalltype resw 10
section .text
section .bss
absolute 53431
docallvalue resw 10
section .text

;-517 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 53451
procname resb 17
section .text

;-518 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1:  ; *** PROC ***

;-519   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   518 NULL i = bp-2
;  201 var sign word   518 NULL narg = bp-4
;  202 var sign word   518 NULL t0 = bp-6
;  203 var sign word   518 NULL n0 = bp-8
;  204 var sign word   518 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-520   checknamelen();

 call checknamelen

;-521   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-522   storecall();

 call storecall

;-523   expect('(');

 push 40
 call expect
 add  sp, 2

;-524 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@docall1288

;-525 	  do { narg++;

@@docall1289:
 inc  word[bp-4]

;-526 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle @@docall1290
 push docall1_0
 call error1
 add  sp, 2
@@docall1290:
 mov ax, 0
 mov [bp-6], ax

;-527       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1291
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-528       if(istoken(T_STRING)){t0=2; n0=nconst;

@@docall1291:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1292
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-529         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-530         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-531       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

@@docall1292:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1293
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-532       if(istoken(T_NAME))  { n0=checkreg();

@@docall1293:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1294
 call checkreg
 mov [bp-8], ax

;-533         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je @@docall1295
 mov ax, 5
 mov [bp-6], ax

;-534         else {t0=4; n0=searchname();

 jmp @@docall1296
@@docall1295:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-535           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne @@docall1297
 mov ax, 3
 mov [bp-6], ax
@@docall1297:
@@docall1296:

;-536       if (t0==0) error1("parameter not recognized (no * allowed)");

@@docall1294:
 mov ax, [bp-6]
 cmp ax, 0
 jne @@docall1298
 push docall1_4
 call error1
 add  sp, 2

;-537       docalltype [narg] = t0;

@@docall1298:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-538       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-539     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1299
 jmp @@docall1289
@@docall1299:

;-540     


;-541   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-542     do {

@@docall1300:

;-543       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-544       n0 = docallvalue[i];     

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-545       if(t0==1){ prs("\n push "); pint1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne @@docall1301
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-546       if(t0==2){ prs("\n push "); 

@@docall1301:
 mov ax, [bp-6]
 cmp ax, 2
 jne @@docall1302
 push docall1_6
 call prs
 add  sp, 2

;-547         prs(fname);prc(95);pint1(n0);}

 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push 95
 call prc
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-548       if(t0==3){ prs("\n lea  ax, ");   v(n0);

@@docall1302:
 mov ax, [bp-6]
 cmp ax, 3
 jne @@docall1303
 push docall1_7
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-549         prs("\n push ax");}

 push docall1_8
 call prs
 add  sp, 2

;-550       if(t0==4){ gettypes(n0); 

@@docall1303:
 mov ax, [bp-6]
 cmp ax, 4
 jne @@docall1304
 push word [bp-8]
 call gettypes
 add  sp, 2

;-551         if(wi==2) { prs("\n push word "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne @@docall1305
 push docall1_9
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-552         else { prs("\n mov al, byte ");   v(n0);

 jmp @@docall1306
@@docall1305:
 push docall1_10
 call prs
 add  sp, 2
 push word [bp-8]
 call v
 add  sp, 2

;-553         prs("\n mov ah, 0\n push ax"); } }

 push docall1_11
 call prs
 add  sp, 2
@@docall1306:

;-554       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

@@docall1304:
 mov ax, [bp-6]
 cmp ax, 5
 jne @@docall1307
 push docall1_12
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  @@docall1308
 mov ax, [bp-10]
 add ax, 2
@@docall1308:

;-555    i--; } while (i > 0);  }

@@docall1307:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle @@docall1309
 jmp @@docall1300
@@docall1309:

;-556 	 prs("\n call "); prs(&procname);

@@docall1288:
 push docall1_13
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-557 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle @@docall1310
 push docall1_14
 call prs
 add  sp, 2

;-558      narg=narg+narg; narg=narg+sz32; pint1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2
@@docall1310:

;-559 /****************************************************************************/


;-560 int main() {
 LEAVE
 ret
; ENDP
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

main:  ; *** PROC ***

;-561   getarg();

 call getarg

;-562   setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-563   if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je @@main311
 push main_0
 call error1
 add  sp, 2

;-564   segE=allocmem(4096);

@@main311:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-565   if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je @@main312
 push main_1
 call error1
 add  sp, 2

;-566   CNameTop=0;

@@main312:
 mov ax, 0
 mov word [CNameTop], ax

;-567   getfirstchar();

 call getfirstchar

;-568   parse();

 call parse

;-569   callrecursive=0; checkcalls(); epilog();

 mov ax, 0
 mov word [callrecursive], ax
 call checkcalls
 call epilog

;-570 }


;-571 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }

 ret
; ENDP
main_0 db "SetBlock , AX=",0
main_1 db "alloc memory, AX=",0

getfirstchar:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al
 call fgets1
 mov byte [thechar], al

;-572 char *arglen=0x80; char *argv=0x82;

 ret
; ENDP
arglen dw 128
argv dw 130

;-573 int getarg() { int arglen1; int i; char *c;


getarg:  ; *** PROC ***

;-574   arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   573 NULL arglen1 = bp-2
;  201 var sign word   573 NULL i = bp-4
;  202 ptr sign byte   573 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-575   if (arglen1) { i=arglen1+129; *i=0; }

 mov ax, [bp-2]
 or  al, al
 je @@getarg313
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-576   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");

 jmp @@getarg314
@@getarg313:
 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
 push getarg_0
 call cputs
 add  sp, 2

;-577     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }

 push 67
 push 0
 push word [argv]
 call readRL
 add  sp, 6
 mov word [DOS_NoBytes], ax
 mov ax, [DOS_NoBytes]
 add ax, 128
 mov [bp-6], ax
 mov ax, 0
 mov  bx, [bp-6]
 mov  [bx], al
 call prnl

;-578   strcpy(namein, argv);

@@getarg314:
 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-579   if (instr2(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr2
 add  sp, 4
 cmp ax, 0
 jne @@getarg315
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-580   toupper(namein);

@@getarg315:
 lea  ax, [namein]
 push ax
 call toupper
 add  sp, 2

;-581   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';

 lea  ax, [namein]
 push ax
 lea  ax, [namelst]
 push ax
 call strcpy
 add  sp, 4
 lea  ax, [namelst]
 push ax
 call strlen
 add  sp, 2
 mov [bp-4], ax
 dec  word[bp-4]
 mov ax, namelst
 add ax, [bp-4]
 mov [bp-6], ax
 mov ax, 83
 mov  bx, [bp-6]
 mov  [bx], al

;-582  


;-583   fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-584   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }

 mov ax, [DOS_ERR]
 or  al, al
 je @@getarg316
 push getarg_2
 call cputs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
 push 1
 call exitR
 add  sp, 2

;-585   fdout=creatR(namelst);

@@getarg316:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-586   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}

 mov ax, [DOS_ERR]
 or  al, al
 je @@getarg317
 push getarg_3
 call cputs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
 push 2
 call exitR
 add  sp, 2

;-587   prs("\n; ");prs(Version1);

@@getarg317:
 push getarg_4
 call prs
 add  sp, 2
 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-588   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}

 push getarg_5
 call prs
 add  sp, 2
 push word [bp-2]
 call pint1
 add  sp, 2
 mov ax, [bp-2]
 or  al, al
 je @@getarg318
 push getarg_6
 call prs
 add  sp, 2
 push word [argv]
 call prs
 add  sp, 2

;-589   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);

@@getarg318:
 push getarg_7
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
 push getarg_8
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-590   prs("\norg  256 \njmp main"); 

 push getarg_9
 call prs
 add  sp, 2

;-591 }


;-592 int parse() { token=getlex(); do {
 LEAVE
 ret
; ENDP
getarg_0 db " Usage: A.COM in_file[.C]: ",0
getarg_1 db ".C",0
getarg_2 db "Source file missing (.C): ",0
getarg_3 db "list file not creatable: ",0
getarg_4 db "\n; ",0
getarg_5 db ", Arglen: ",0
getarg_6 db ", Argv: ",0
getarg_7 db ", Source: ",0
getarg_8 db ", Output asm: ",0
getarg_9 db "\norg  256 \njmp main",0

parse:  ; *** PROC ***
 call getlex
 mov word [token], ax
@@parse319:

;-593     if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  @@parse320
 mov ax, 1
 jmp @@retn

;-594     if (istoken('#')) {

@@parse320:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je @@parse321

;-595       if (istoken(T_DEFINE)) dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je @@parse322
 call dodefine

;-596       else if (istoken(T_INCLUDE)) doinclude();

 jmp @@parse323
@@parse322:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je @@parse324
 call doinclude

;-597       else error1("define or include expected");  }

 jmp @@parse325
@@parse324:
 push parse_0
 call error1
 add  sp, 2
@@parse325:
@@parse323:

;-598     else{ typeName();  if (token=='(') dofunc();  else doglob(); }

 jmp @@parse326
@@parse321:
 call typeName
 mov ax, [token]
 cmp ax, 40
 jne @@parse327
 call dofunc
 jmp @@parse328
@@parse327:
 call doglob
@@parse328:

;-599   } while(1);

@@parse326:
 mov ax, 1
 or  al, al
 je @@parse329
 jmp @@parse319
@@parse329:

;-600 }


;-601 int checkcalls() { int i; int j; int k;

@@retn:
 ret
; ENDP
parse_0 db "define or include expected",0

checkcalls:  ; *** PROC ***

;-602   prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   601 NULL i = bp-2
;  201 var sign word   601 NULL j = bp-4
;  202 var sign word   601 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-603   i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-604   while (i < CTop) {

@@checkcalls330:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@checkcalls331

;-605     pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-606     from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-607     j=0;

 mov ax, 0
 mov [bp-4], ax

;-608     do { p1=adrF(FNameField, j);

@@checkcalls332:
 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-609       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkcalls333
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 mov ax, [FTop]
 mov [bp-4], ax

;-610       j++; } while (j < FTop);

@@checkcalls333:
 inc  word[bp-4]
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge @@checkcalls334
 jmp @@checkcalls332
@@checkcalls334:

;-611     if (j == FTop) { k++; prs("\n; "); prs(NameA); }

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne @@checkcalls335
 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-612     i++; }

@@checkcalls335:
 inc  word[bp-2]

;-613   if (k!=0) doar(k); else {prs(" All FUNCTIONs in place");

 jmp @@checkcalls330
@@checkcalls331:
 mov ax, [bp-6]
 cmp ax, 0
 je  @@checkcalls336
 push word [bp-6]
 call doar
 add  sp, 2
 jmp @@checkcalls337
@@checkcalls336:
 push checkcalls_2
 call prs
 add  sp, 2

;-614     cputs("  All CALLs OK! "); }

 push checkcalls_3
 call cputs
 add  sp, 2

;-615 }

@@checkcalls337:

;-616 char wasfunction;
 LEAVE
 ret
; ENDP
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db " All FUNCTIONs in place",0
checkcalls_3 db "  All CALLs OK! ",0
wasfunction db 0

;-617 int doar(int k) { int i; int fdtemp; int fdout1; int used; int found;


doar:  ; *** PROC ***

;-618   cputs("  Open CALLs :"); pint(k);

;Function : doar, Number of local variables: 6
;   # type sign width addr used name   list of local variables
;  200 var sign word   617 NULL k = bp+4
;  201 var sign word   617 NULL i = bp-2
;  202 var sign word   617 NULL fdtemp = bp-4
;  203 var sign word   617 NULL fdout1 = bp-6
;  204 var sign word   617 NULL used = bp-8
;  205 var sign word   617 NULL found = bp-10;
 ENTER  10,0
 push doar_0
 call cputs
 add  sp, 2
 push word [bp+4]
 call pint
 add  sp, 2

;-619   prs("\n; Number of unresolved CALLs :"); printint51(k);

 push doar_1
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-620   fdin=openR (archivename);

 lea  ax, [archivename]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-621   if(DOS_ERR){cputs("Archive file missing: "); cputs(archivename); exitR(3); }

 mov ax, [DOS_ERR]
 or  al, al
 je @@doar338
 push doar_2
 call cputs
 add  sp, 2
 lea  ax, [archivename]
 push ax
 call cputs
 add  sp, 2
 push 3
 call exitR
 add  sp, 2

;-622   prs("\n;use archive file: "); prs(archivename);

@@doar338:
 push doar_3
 call prs
 add  sp, 2
 lea  ax, [archivename]
 push ax
 call prs
 add  sp, 2

;-623   fdtemp=fdout;

 mov ax, [fdout]
 mov [bp-4], ax

;-624   wasfunction=0;

 mov ax, 0
 mov byte [wasfunction], al

;-625   getfirstchar();

 call getfirstchar

;-626   do { fdout=0;do {found=getfunctionhead();}while (found==0); fdout=fdtemp;

@@doar339:
 mov ax, 0
 mov word [fdout], ax
@@doar340:
 call getfunctionhead
 mov [bp-10], ax
 mov ax, [bp-10]
 cmp ax, 0
 jne @@doar341
 jmp @@doar340
@@doar341:
 mov ax, [bp-4]
 mov word [fdout], ax

;-627        if (found > 0) {

 mov ax, [bp-10]
 cmp ax, 0
 jle @@doar342

;-628          used=0; i=0;

 mov ax, 0
 mov [bp-8], ax
 mov ax, 0
 mov [bp-2], ax

;-629          while (i < CTop) {

@@doar343:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@doar344

;-630            pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-631            from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-632            if (eqstr(symbol, NameA)) {

 lea  ax, [NameA]
 push ax
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@doar345

;-633              if (CType[i] == 0) {CType[i]=1; used++; } }  i++; }

 mov bx, [bp-2]
 mov al, [CType + bx]
 cmp al, 0
 jne @@doar346
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 inc  word[bp-8]
@@doar346:
@@doar345:
 inc  word[bp-2]

;-634            if (used) {

 jmp @@doar343
@@doar344:
 mov ax, [bp-8]
 or  al, al
 je @@doar347

;-635               prs("\n;Number of CALLs:"); printint51(used);

 push doar_4
 call prs
 add  sp, 2
 push word [bp-8]
 call printint51
 add  sp, 2

;-636               prs(" : "); prs(symbol); dofunc(); wasfunction=1; }

 push doar_5
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 call dofunc
 mov ax, 1
 mov byte [wasfunction], al

;-637         }

@@doar347:

;-638      } while (token);

@@doar342:
 mov ax, [token]
 or  al, al
 je @@doar348
 jmp @@doar339
@@doar348:

;-639   prs("\n;End of archive file. ");

 push doar_6
 call prs
 add  sp, 2

;-640   callrecursive++; if (callrecursive < 5) checkcalls();

 inc  word[callrecursive]
 mov ax, [callrecursive]
 cmp ax, 5
 jge @@doar349
 call checkcalls

;-641     else {putch(10); cputs("***ERROR*** function(s) missing! ");

 jmp @@doar350
@@doar349:
 push 10
 call putch
 add  sp, 2
 push doar_7
 call cputs
 add  sp, 2

;-642     error1("At least 1 function is missing in archive file! "); }

 push doar_8
 call error1
 add  sp, 2

;-643 }

@@doar350:

;-644 int getfunctionhead() {
 LEAVE
 ret
; ENDP
doar_0 db "  Open CALLs :",0
doar_1 db "\n; Number of unresolved CALLs :",0
doar_2 db "Archive file missing: ",0
doar_3 db "\n;use archive file: ",0
doar_4 db "\n;Number of CALLs:",0
doar_5 db " : ",0
doar_6 db "\n;End of archive file. ",0
doar_7 db "***ERROR*** function(s) missing! ",0
doar_8 db "At least 1 function is missing in archive file! ",0

getfunctionhead:  ; *** PROC ***

;-645   if (wasfunction) wasfunction=0; else token=getlex();

 mov al, [wasfunction]
 or  al, al
 je @@getfunctionhead351
 mov ax, 0
 mov byte [wasfunction], al
 jmp @@getfunctionhead352
@@getfunctionhead351:
 call getlex
 mov word [token], ax

;-646   if (token == 0) return 0xFFFF;

@@getfunctionhead352:
 mov ax, [token]
 cmp ax, 0
 jne @@getfunctionhead353
 mov ax, 65535
 jmp @@retn

;-647   if(istoken(T_INT))  { if (token != T_NAME) return 0;

@@getfunctionhead353:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je @@getfunctionhead354
 mov ax, [token]
 cmp ax, 256
 je  @@getfunctionhead355
 mov ax, 0
 jmp @@retn

;-648   token=getlex(); if (token == '(') return 1; }

@@getfunctionhead355:
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 40
 jne @@getfunctionhead356
 mov ax, 1
 jmp @@retn
@@getfunctionhead356:

;-649   return 0;

@@getfunctionhead354:
 mov ax, 0
 jmp @@retn

;-650 }


;-651 int doinclude() { int fdtemp;

@@retn:
 ret
; ENDP

doinclude:  ; *** PROC ***

;-652   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   651 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne @@doinclude357
 mov ax, [fdin]
 mov [bp-2], ax

;-653   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-654   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-655   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

 mov ax, [DOS_ERR]
 cmp ax, 0
 je  @@doinclude358
 push doinclude_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-656     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-657   linenoinclude=lineno; lineno=1;

@@doinclude358:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-658   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-659   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-660   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-661 }

@@doinclude357:

;-662 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
; ENDP
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0

dodefine:  ; *** PROC ***

;-663   if (eqstr(symbol, "ORGDATA")) {token=getlex();

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   662 NULL i = bp-2
;  201 var sign word   662 NULL j = bp-4
;  202 var sign word   662 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine359
 call getlex
 mov word [token], ax

;-664     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp @@retn

;-665   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

@@dodefine359:
 push dodefine_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine360
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 258
 jne @@dodefine361

;-666     prs("\n;Use archive file: ");

 push dodefine_2
 call prs
 add  sp, 2

;-667     strcpy(archivename, symbol); prs(archivename);

 lea  ax, [symbol]
 push ax
 lea  ax, [archivename]
 push ax
 call strcpy
 add  sp, 4
 lea  ax, [archivename]
 push ax
 call prs
 add  sp, 2

;-668     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp @@dodefine362
@@dodefine361:
 push dodefine_3
 call error1
 add  sp, 2
@@dodefine362:
 call getlex
 mov word [token], ax
 jmp @@retn

;-669    expect(T_NAME);

@@dodefine360:
 push 256
 call expect
 add  sp, 2

;-670   if (token==T_CONST) { 

 mov ax, [token]
 cmp ax, 257
 jne @@dodefine363

;-671     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  @@dodefine364
 push dodefine_4
 call error1
 add  sp, 2

;-672     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

@@dodefine364:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 15
 jle @@dodefine365
 push dodefine_5
 call error1
 add  sp, 2

;-673     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

@@dodefine365:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-674     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-675     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-676     expect(T_CONST); GTop++;  } 

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-677 }

@@dodefine363:

;-678 int stmt() { int c; char cha;

@@retn: LEAVE
 ret
; ENDP
dodefine_0 db "ORGDATA",0
dodefine_1 db "ARCHIVE",0
dodefine_2 db "\n;Use archive file: ",0
dodefine_3 db "Name of archive file missing",0
dodefine_4 db "global table (define) full",0
dodefine_5 db "Define name longer 15 char",0

stmt:  ; *** PROC ***

;-679        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   678 NULL c = bp-2
;  201 var sign byte   678 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt366
@@stmt367:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@stmt368
 call stmt
 jmp @@stmt367
@@stmt368:

;-680   else if(istoken(T_IF))    doif();

 jmp @@stmt369
@@stmt366:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt370
 call doif

;-681   else if(istoken(T_DO))    dodo();

 jmp @@stmt371
@@stmt370:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt372
 call dodo

;-682   else if(istoken(T_WHILE)) dowhile();

 jmp @@stmt373
@@stmt372:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt374
 call dowhile

;-683   else if(istoken(T_GOTO))  {prs("\n jmp @@");name1();prs(symbol);expect(';');}

 jmp @@stmt375
@@stmt374:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt376
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

;-684   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp @@stmt377
@@stmt376:
 mov ax, [token]
 cmp ax, 518
 jne @@stmt378
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-685     while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

@@stmt379:
 mov ax, [bp-2]
 cmp ax, 10
 je  @@stmt380
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp @@stmt379
@@stmt380:
 call getlex
 mov word [token], ax

;-686   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  

 jmp @@stmt381
@@stmt378:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt382
 mov ax, [token]
 cmp ax, 123
 jne @@stmt383
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-687     while(cha!= '}') { prc(cha); cha=next(); }

@@stmt384:
 mov al, [bp-4]
 cmp al, 125
 je  @@stmt385
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-688     token=getlex(); }

 jmp @@stmt384
@@stmt385:
 call getlex
 mov word [token], ax

;-689     else error1("Curly open expected"); }

 jmp @@stmt386
@@stmt383:
 push stmt_3
 call error1
 add  sp, 2
@@stmt386:

;-690   else if(istoken(T_INTH))  {prs("\n int  "); expect(T_CONST);

 jmp @@stmt387
@@stmt382:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt388
 push stmt_4
 call prs
 add  sp, 2
 push 257
 call expect
 add  sp, 2

;-691     prunsign1(lexval); expect(';');    }

 push word [lexval]
 call prunsign1
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-692   else if(istoken(T_IFCARRY))doifcarry();

 jmp @@stmt389
@@stmt388:
 push 601
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt390
 call doifcarry

;-693   else if(istoken(T_IFZERO))doifzero();

 jmp @@stmt391
@@stmt390:
 push 602
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt392
 call doifzero

;-694   else if(istoken(T_EMIT))   doemit();

 jmp @@stmt393
@@stmt392:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt394
 call doemit

;-695   else if(istoken(';'))      { }

 jmp @@stmt395
@@stmt394:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt396

;-696   else if(istoken(T_RETURN)) {if (token!=';') exprstart();

 jmp @@stmt397
@@stmt396:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt398
 mov ax, [token]
 cmp ax, 59
 je  @@stmt399
 call exprstart

;-697     prs("\n jmp @@retn"); nreturn++; expect(';');}

@@stmt399:
 push stmt_5
 call prs
 add  sp, 2
 inc  word[nreturn]
 push 59
 call expect
 add  sp, 2

;-698   else if(thechar==':')      {prs("\n@@"); // Label

 jmp @@stmt400
@@stmt398:
 mov al, [thechar]
 cmp al, 58
 jne @@stmt401
 push stmt_6
 call prs
 add  sp, 2

;-699      prs(symbol); prc(':');  expect(T_NAME); expect(':'); }

 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push 58
 call prc
 add  sp, 2
 push 256
 call expect
 add  sp, 2
 push 58
 call expect
 add  sp, 2

;-700   else                       {exprstart(); expect(';'); } }

 jmp @@stmt402
@@stmt401:
 call exprstart
 push 59
 call expect
 add  sp, 2
@@stmt402:
@@stmt400:
@@stmt397:
@@stmt395:
@@stmt393:
@@stmt391:
@@stmt389:
@@stmt387:
@@stmt381:
@@stmt377:
@@stmt375:
@@stmt373:
@@stmt371:
@@stmt369:

;-701 


;-702 int doemit() {prs("\n db ");
 LEAVE
 ret
; ENDP
stmt_0 db "\n jmp @@",0
stmt_1 db "\n",0
stmt_2 db "\n",0
stmt_3 db "Curly open expected",0
stmt_4 db "\n int  ",0
stmt_5 db "\n jmp @@retn",0
stmt_6 db "\n@@",0

doemit:  ; *** PROC ***
 push doemit_0
 call prs
 add  sp, 2

;-703   L1: token=getlex(); prunsign1(lexval); token=getlex();

@@L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-704     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne @@doemit403
 push 44
 call prc
 add  sp, 2
 jmp @@L1
@@doemit403:
 push 41
 call expect
 add  sp, 2

;-705 


;-706 int cmpneg(int ids) {

 ret
; ENDP
doemit_0 db "\n db ",0

cmpneg:  ; *** PROC ***

;-707        if(iscmp==T_EQ) prs("\n jne @@");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   706 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne @@cmpneg404
 push cmpneg_0
 call prs
 add  sp, 2

;-708   else if(iscmp==T_NE) prs("\n je  @@");         //ZF=1

 jmp @@cmpneg405
@@cmpneg404:
 mov ax, [iscmp]
 cmp ax, 807
 jne @@cmpneg406
 push cmpneg_1
 call prs
 add  sp, 2

;-709   else if(iscmp==T_LE) if (ids) prs("\n jg  @@");//ZF=0      SF =OF

 jmp @@cmpneg407
@@cmpneg406:
 mov ax, [iscmp]
 cmp ax, 824
 jne @@cmpneg408
 mov ax, [bp+4]
 or  al, al
 je @@cmpneg409
 push cmpneg_2
 call prs
 add  sp, 2

;-710                            else prs("\n ja  @@");//ZF=0 CF=0

 jmp @@cmpneg410
@@cmpneg409:
 push cmpneg_3
 call prs
 add  sp, 2

;-711   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

@@cmpneg410:
 jmp @@cmpneg411
@@cmpneg408:
 mov ax, [iscmp]
 cmp ax, 811
 jne @@cmpneg412
 mov ax, [bp+4]
 or  al, al
 je @@cmpneg413
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-712                                prs("\n jl  @@");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-713                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp @@cmpneg414
@@cmpneg413:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-714                                prs("\n jb  @@");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-715   else if(iscmp=='<' ) prs("\n jge @@");         //          SF =OF

@@cmpneg414:
 jmp @@cmpneg415
@@cmpneg412:
 mov ax, [iscmp]
 cmp ax, 60
 jne @@cmpneg416
 push cmpneg_8
 call prs
 add  sp, 2

;-716   else if(iscmp=='>' ) prs("\n jle @@");         //ZF=1 oder SF!=OF

 jmp @@cmpneg417
@@cmpneg416:
 mov ax, [iscmp]
 cmp ax, 62
 jne @@cmpneg418
 push cmpneg_9
 call prs
 add  sp, 2

;-717   else error1("Vergleich unbekannt in CMPNEG()");  }

 jmp @@cmpneg419
@@cmpneg418:
 push cmpneg_10
 call error1
 add  sp, 2
@@cmpneg419:
@@cmpneg417:
@@cmpneg415:
@@cmpneg411:
@@cmpneg407:
@@cmpneg405:

;-718 


;-719 int prlabel(int n) {prs("\n@@"); prs(fname); pint1(n); prc(':'); }
 LEAVE
 ret
; ENDP
cmpneg_0 db "\n jne @@",0
cmpneg_1 db "\n je  @@",0
cmpneg_2 db "\n jg  @@",0
cmpneg_3 db "\n ja  @@",0
cmpneg_4 db " ;unsigned : ",0
cmpneg_5 db "\n jl  @@",0
cmpneg_6 db " ;unsigned : ",0
cmpneg_7 db "\n jb  @@",0
cmpneg_8 db "\n jge @@",0
cmpneg_9 db "\n jle @@",0
cmpneg_10 db "Vergleich unbekannt in CMPNEG()",0

prlabel:  ; *** PROC ***
;Function : prlabel, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   719 NULL n = bp+4;
 ENTER  0,0
 push prlabel_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push 58
 call prc
 add  sp, 2

;-720 int prjump (int n) {prs("\n jmp @@"); prs(fname); pint1(n); }
 LEAVE
 ret
; ENDP
prlabel_0 db "\n@@",0

prjump:  ; *** PROC ***
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   720 NULL n = bp+4;
 ENTER  0,0
 push prjump_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2

;-721 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP
prjump_0 db "\n jmp @@",0

doif:  ; *** PROC ***
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   721 NULL jdest = bp-2
;  201 var sign word   721 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-722   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-723   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je @@doif420
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-724     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-725   else prlabel(jdest); }

 jmp @@doif421
@@doif420:
 push word [bp-2]
 call prlabel
 add  sp, 2
@@doif421:

;-726 int doifcarry() {int jdest;  nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

doifcarry:  ; *** PROC ***
;Function : doifcarry, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   726 NULL jdest = bp-2;
 ENTER  2,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-727   prs("\n jae short @@");/*jnc*/ prs(fname);  pint1(jdest);

 push doifcarry_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp-2]
 call pint1
 add  sp, 2

;-728   stmt(); prlabel(jdest); }

 call stmt
 push word [bp-2]
 call prlabel
 add  sp, 2

;-729 int doifzero() {int jdest;  nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP
doifcarry_0 db "\n jae short @@",0

doifzero:  ; *** PROC ***
;Function : doifzero, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   729 NULL jdest = bp-2;
 ENTER  2,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-730   prs("\n jne short @@");        prs(fname);  pint1(jdest);

 push doifzero_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2
 push word [bp-2]
 call pint1
 add  sp, 2

;-731   stmt(); prlabel(jdest); }

 call stmt
 push word [bp-2]
 call prlabel
 add  sp, 2

;-732 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
; ENDP
doifzero_0 db "\n jne short @@",0

dodo:  ; *** PROC ***

;-733   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   732 NULL jdest = bp-2
;  201 var sign word   732 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-734   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-735   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-736 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

dowhile:  ; *** PROC ***
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   736 NULL jdest = bp-2
;  201 var sign word   736 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-737   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-738   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-739 int isrelational() {
 LEAVE
 ret
; ENDP

isrelational:  ; *** PROC ***

;-740   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne @@isrelational422
 jmp @@w
@@isrelational422:
 mov ax, [token]
 cmp ax, 807
 jne @@isrelational423
 jmp @@w

;-741   if (token==T_LE) goto w; if (token==T_GE) goto w;

@@isrelational423:
 mov ax, [token]
 cmp ax, 824
 jne @@isrelational424
 jmp @@w
@@isrelational424:
 mov ax, [token]
 cmp ax, 811
 jne @@isrelational425
 jmp @@w

;-742   if (token=='<' ) goto w; if (token=='>' ) goto w;

@@isrelational425:
 mov ax, [token]
 cmp ax, 60
 jne @@isrelational426
 jmp @@w
@@isrelational426:
 mov ax, [token]
 cmp ax, 62
 jne @@isrelational427
 jmp @@w

;-743   return 0;  w: iscmp=token; token=getlex(); return 1;}

@@isrelational427:
 mov ax, 0
 jmp @@retn
@@w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp @@retn

;-744  


;-745 char symboltemp[80];    

@@retn:
 ret
; ENDP
section .bss
absolute 53468
symboltemp resb 80
section .text

;-746 int getlex() { char c; char *p; 


getlex:  ; *** PROC ***

;-747 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   746 NULL c = bp-2
;  201 ptr sign byte   746 NULL p = bp-4;
 ENTER  4,0
@@g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne @@getlex428
 mov ax, 0
 jmp @@retn
@@getlex428:
 mov al, [bp-2]
 cmp al, 32
 jg  @@getlex429
 jmp @@g1

;-748   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

@@getlex429:
 mov al, [bp-2]
 cmp al, 61
 jne @@getlex430
 mov al, [thechar]
 cmp al, 61
 jne @@getlex431
 call next
 mov ax, 806
 jmp @@retn
@@getlex431:

;-749   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

@@getlex430:
 mov al, [bp-2]
 cmp al, 33
 jne @@getlex432
 mov al, [thechar]
 cmp al, 61
 jne @@getlex433
 call next
 mov ax, 807
 jmp @@retn
@@getlex433:

;-750   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

@@getlex432:
 mov al, [bp-2]
 cmp al, 60
 jne @@getlex434
 mov al, [thechar]
 cmp al, 61
 jne @@getlex435
 call next
 mov ax, 824
 jmp @@retn
@@getlex435:

;-751   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

@@getlex434:
 mov al, [bp-2]
 cmp al, 62
 jne @@getlex436
 mov al, [thechar]
 cmp al, 61
 jne @@getlex437
 call next
 mov ax, 811
 jmp @@retn
@@getlex437:

;-752   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

@@getlex436:
 mov al, [bp-2]
 cmp al, 60
 jne @@getlex438
 mov al, [thechar]
 cmp al, 60
 jne @@getlex439
 call next
 mov ax, 1240
 jmp @@retn
@@getlex439:

;-753   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

@@getlex438:
 mov al, [bp-2]
 cmp al, 62
 jne @@getlex440
 mov al, [thechar]
 cmp al, 62
 jne @@getlex441
 call next
 mov ax, 1241
 jmp @@retn
@@getlex441:

;-754   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

@@getlex440:
 mov al, [bp-2]
 cmp al, 43
 jne @@getlex442
 mov al, [thechar]
 cmp al, 43
 jne @@getlex443
 call next
 mov ax, 1219
 jmp @@retn
@@getlex443:

;-755   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

@@getlex442:
 mov al, [bp-2]
 cmp al, 45
 jne @@getlex444
 mov al, [thechar]
 cmp al, 45
 jne @@getlex445
 call next
 mov ax, 1225
 jmp @@retn
@@getlex445:

;-756   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

@@getlex444:
 mov al, [bp-2]
 cmp al, 43
 jne @@getlex446
 mov al, [thechar]
 cmp al, 61
 jne @@getlex447
 call next
 mov ax, 1230
 jmp @@retn
@@getlex447:

;-757   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

@@getlex446:
 mov al, [bp-2]
 cmp al, 45
 jne @@getlex448
 mov al, [thechar]
 cmp al, 61
 jne @@getlex449
 call next
 mov ax, 1231
 jmp @@retn
@@getlex449:

;-758   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

@@getlex448:
 mov al, [bp-2]
 cmp al, 38
 jne @@getlex450
 mov al, [thechar]
 cmp al, 61
 jne @@getlex451
 call next
 mov ax, 1234
 jmp @@retn
@@getlex451:

;-759   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    

@@getlex450:
 mov al, [bp-2]
 cmp al, 124
 jne @@getlex452
 mov al, [thechar]
 cmp al, 61
 jne @@getlex453
 call next
 mov ax, 1235
 jmp @@retn
@@getlex453:

;-760   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

@@getlex452:
 mov al, [bp-2]
 cmp al, 42
 jne @@getlex454
 mov al, [thechar]
 cmp al, 61
 jne @@getlex455
 call next
 mov ax, 1232
 jmp @@retn
@@getlex455:

;-761   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        

@@getlex454:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex456
 mov al, [thechar]
 cmp al, 61
 jne @@getlex457
 call next
 mov ax, 1233
 jmp @@retn
@@getlex457:

;-762   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

@@getlex456:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je @@getlex458
 mov al, [bp-2]
 jmp @@retn

;-763   if (c == '/') { if (thechar == '/') {

@@getlex458:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex459
 mov al, [thechar]
 cmp al, 47
 jne @@getlex460

;-764       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }

@@getlex461:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 13
 je  @@getlex462
 jmp @@getlex461
@@getlex462:
 call getlex
 jmp @@retn
@@getlex460:

;-765   if (c == '/') { if (thechar == '*') {

@@getlex459:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex463
 mov al, [thechar]
 cmp al, 42
 jne @@getlex464

;-766       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

@@g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  @@getlex465
 jmp @@g2
@@getlex465:
 mov al, [thechar]
 cmp al, 47
 je  @@getlex466
 jmp @@g2

;-767       c=next(); return getlex(); } else  return '/'; }

@@getlex466:
 call next
 mov [bp-2], al
 call getlex
 jmp @@retn
 jmp @@getlex467
@@getlex464:
 mov ax, 47
 jmp @@retn
@@getlex467:

;-768   if (c == '"') {getstring(c); return T_STRING;}

@@getlex463:
 mov al, [bp-2]
 cmp al, 34
 jne @@getlex468
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp @@retn

;-769   if (digit(c)) { getdigit(c); return T_CONST; }

@@getlex468:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@getlex469
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp @@retn

;-770   if (c==39) { lexval=next();

@@getlex469:
 mov al, [bp-2]
 cmp al, 39
 jne @@getlex470
 call next
 mov word [lexval], ax

;-771     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne @@getlex471
 call next
 mov word [lexval], ax

;-772       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne @@getlex472
 mov ax, 10
 mov word [lexval], ax
@@getlex472:
 mov ax, [lexval]
 cmp ax, 116
 jne @@getlex473
 mov ax, 9
 mov word [lexval], ax

;-773       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

@@getlex473:
 mov ax, [lexval]
 cmp ax, 48
 jne @@getlex474
 mov ax, 0
 mov word [lexval], ax
@@getlex474:
@@getlex471:
 call next
 mov ax, 257
 jmp @@retn

;-774   if (letter(c)) { 

@@getlex470:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getlex475

;-775     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-776     while(letter(thechar)) {c=next(); *p=c;  p++; } 

@@getlex476:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getlex477
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-777       *p=0;

 jmp @@getlex476
@@getlex477:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-778     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex478
 mov ax, 531
 jmp @@retn

;-779     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

@@getlex478:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex479
 mov ax, 532
 jmp @@retn

;-780     if (eqstr(symbol,"void"    )) return T_VOID;

@@getlex479:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex480
 mov ax, 529
 jmp @@retn

;-781     if (eqstr(symbol,"int"     )) return T_INT;

@@getlex480:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex481
 mov ax, 517
 jmp @@retn

;-782     if (eqstr(symbol,"short"   )) return T_SHORT;

@@getlex481:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex482
 mov ax, 534
 jmp @@retn

;-783     if (eqstr(symbol,"long"    )) return T_LONG;

@@getlex482:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex483
 mov ax, 533
 jmp @@retn

;-784     if (eqstr(symbol,"uint32"  )) return T_UINT32;

@@getlex483:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex484
 mov ax, 545
 jmp @@retn

;-785     if (eqstr(symbol,"inth"    )) return T_INTH;

@@getlex484:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex485
 mov ax, 600
 jmp @@retn

;-786     if (eqstr(symbol,"char"    )) return T_CHAR;

@@getlex485:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex486
 mov ax, 530
 jmp @@retn

;-787     if (eqstr(symbol,"asm"     )) return T_ASM;

@@getlex486:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex487
 mov ax, 518
 jmp @@retn

;-788     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

@@getlex487:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex488
 mov ax, 519
 jmp @@retn

;-789     if (eqstr(symbol,"__emit__")) return T_EMIT;

@@getlex488:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex489
 mov ax, 520
 jmp @@retn

;-790     if (eqstr(symbol,"return"  )) return T_RETURN;

@@getlex489:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex490
 mov ax, 512
 jmp @@retn

;-791     if (eqstr(symbol,"if"      )) return T_IF;

@@getlex490:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex491
 mov ax, 513
 jmp @@retn

;-792     if (eqstr(symbol,"ifcarry" )) return T_IFCARRY;

@@getlex491:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex492
 mov ax, 601
 jmp @@retn

;-793     if (eqstr(symbol,"ifzero"  )) return T_IFZERO;

@@getlex492:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex493
 mov ax, 602
 jmp @@retn

;-794     if (eqstr(symbol,"else"    )) return T_ELSE;

@@getlex493:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex494
 mov ax, 514
 jmp @@retn

;-795     if (eqstr(symbol,"while"   )) return T_WHILE;

@@getlex494:
 push getlex_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex495
 mov ax, 515
 jmp @@retn

;-796     if (eqstr(symbol,"do"      )) return T_DO;

@@getlex495:
 push getlex_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex496
 mov ax, 516
 jmp @@retn

;-797     if (eqstr(symbol,"goto"    )) return T_GOTO;

@@getlex496:
 push getlex_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex497
 mov ax, 521
 jmp @@retn

;-798     if (eqstr(symbol,"define"  )) return T_DEFINE;   

@@getlex497:
 push getlex_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex498
 mov ax, 511
 jmp @@retn

;-799     if (eqstr(symbol,"include" )) return T_INCLUDE;   

@@getlex498:
 push getlex_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex499
 mov ax, 510
 jmp @@retn

;-800     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

@@getlex499:
 call convertdefine
 or  al, al
 je @@getlex500
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp @@retn

;-801     return T_NAME; } error1("Input item not recognized"); }

@@getlex500:
 mov ax, 256
 jmp @@retn
@@getlex475:
 push getlex_23
 call error1
 add  sp, 2

;-802 


;-803 int convertdefine() { int i; int j;   i=0;

@@retn: LEAVE
 ret
; ENDP
getlex_0 db "()[]{},;*:%-><=+!&|#?",0
getlex_1 db "signed",0
getlex_2 db "unsigned",0
getlex_3 db "void",0
getlex_4 db "int",0
getlex_5 db "short",0
getlex_6 db "long",0
getlex_7 db "uint32",0
getlex_8 db "inth",0
getlex_9 db "char",0
getlex_10 db "asm",0
getlex_11 db "__asm",0
getlex_12 db "__emit__",0
getlex_13 db "return",0
getlex_14 db "if",0
getlex_15 db "ifcarry",0
getlex_16 db "ifzero",0
getlex_17 db "else",0
getlex_18 db "while",0
getlex_19 db "do",0
getlex_20 db "goto",0
getlex_21 db "define",0
getlex_22 db "include",0
getlex_23 db "Input item not recognized",0

convertdefine:  ; *** PROC ***
;Function : convertdefine, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   803 NULL i = bp-2
;  201 var sign word   803 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-804   while (i < GTop) {

@@convertdefine501:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@convertdefine502

;-805    j=adrofname(i); 

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-806    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@convertdefine503
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne @@convertdefine504
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-807    return T_CONST; } }

 mov ax, 257
 jmp @@retn
@@convertdefine504:

;-808    i++; } 

@@convertdefine503:
 inc  word[bp-2]

;-809    return 0; }

 jmp @@convertdefine501
@@convertdefine502:
 mov ax, 0
 jmp @@retn

;-810 int getdigit(char c) { int i;

@@retn: LEAVE
 ret
; ENDP

getdigit:  ; *** PROC ***

;-811     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   810 NULL c = bp+4
;  201 var sign word   810 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-812     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne @@getdigit505
 mov ax, 88
 mov byte [thechar], al
@@getdigit505:
 mov al, [thechar]
 cmp al, 88
 jne @@getdigit506
 call next

;-813       while(letter(thechar)) { c=next(); if(c>96) c=c-39;

@@getdigit507:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getdigit508
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle @@getdigit509
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-814 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

@@getdigit509:
 mov al, [bp+4]
 cmp al, 64
 jle @@getdigit510
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
@@getdigit510:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-815      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-816     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 

 jmp @@getdigit507
@@getdigit508:
 jmp @@getdigit511
@@getdigit506:
@@getdigit512:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@getdigit513
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-817      i=0; i=c; lexval=lexval+i; } } 

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp @@getdigit512
@@getdigit513:

;-818 }

@@getdigit511:

;-819 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
; ENDP

getstring:  ; *** PROC ***
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   819 NULL delim = bp+4
;  201 var sign word   819 NULL c = bp-2
;  202 ptr sign byte   819 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-820   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

@@getstring514:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  @@getstring515
 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]
 call next
 mov [bp-2], ax
 jmp @@getstring514
@@getstring515:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-821 


;-822 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
 LEAVE
 ret
; ENDP

next:  ; *** PROC ***
;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   822 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
 mov al, [bp-2]
 mov byte [globC], al
 call fgets1
 mov byte [thechar], al
 mov al, [bp-2]
 jmp @@retn

;-823 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}

@@retn: LEAVE
 ret
; ENDP

istoken:  ; *** PROC ***
;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   823 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne @@istoken516
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp @@retn
@@istoken516:
 mov ax, 0
 jmp @@retn

;-824 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();

@@retn: LEAVE
 ret
; ENDP

expect:  ; *** PROC ***
;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   824 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@expect517
 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 call listproc

;-825   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

 push expect_0
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push expect_1
 call error1
 add  sp, 2
@@expect517:

;-826 


;-827 int eprc(char c)  {*cloc=c; cloc++; }
 LEAVE
 ret
; ENDP
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0

eprc:  ; *** PROC ***
;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   827 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
 inc  word[cloc]

;-828 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
 LEAVE
 ret
; ENDP

eprs:  ; *** PROC ***
;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   828 NULL s = bp+4
;  201 var sign byte   828 NULL c = bp-2;
 ENTER  2,0
@@eprs518:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eprs519
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call eprc
 add  sp, 2
 inc  word[bp+4]
 jmp @@eprs518
@@eprs519:

;-829 int prc(unsigned char c) { 
 LEAVE
 ret
; ENDP

prc:  ; *** PROC ***

;-830   if (c==10) {_AX=13; writetty(); }

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   829 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne @@prc520
 mov  ax, 13
 call writetty

;-831   _AL=c; writetty(); 

@@prc520:
 mov  al, [bp+4]
 call writetty

;-832   fputcR(c, fdout); 

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-833   }


;-834 int prscomment(unsigned char *s) {unsigned char c;
 LEAVE
 ret
; ENDP

prscomment:  ; *** PROC ***

;-835   while(*s){c=*s;prc(c);s++;} }

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   834 NULL s = bp+4
;  201 var unsg byte   834 NULL c = bp-2;
 ENTER  2,0
@@prscomment521:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@prscomment522
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp @@prscomment521
@@prscomment522:

;-836 int prnl() { prs("\n ");}
 LEAVE
 ret
; ENDP

prnl:  ; *** PROC ***
 push prnl_0
 call prs
 add  sp, 2

;-837 


;-838 int prs(unsigned char *s) {unsigned char c; int com; com=0;

 ret
; ENDP
prnl_0 db "\n ",0

prs:  ; *** PROC ***
;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   838 NULL s = bp+4
;  201 var unsg byte   838 NULL c = bp-2
;  202 var sign word   838 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-839   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;

@@prs523:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@prs524
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 34
 jne @@prs525
 mov ax, [bp-4]
 or  al, al
 je @@prs526
 mov ax, 0
 mov [bp-4], ax
 jmp @@prs527
@@prs526:
 mov ax, 1
 mov [bp-4], ax

;-840     if (c==92) { if (com==0) { s++; c=*s;

@@prs527:
@@prs525:
 mov al, [bp-2]
 cmp al, 92
 jne @@prs528
 mov ax, [bp-4]
 cmp ax, 0
 jne @@prs529
 inc  word[bp+4]
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-841           if (c=='n') c=10; if (c=='t') c= 9;

 mov al, [bp-2]
 cmp al, 110
 jne @@prs530
 mov ax, 10
 mov [bp-2], al
@@prs530:
 mov al, [bp-2]
 cmp al, 116
 jne @@prs531
 mov ax, 9
 mov [bp-2], al

;-842     } } prc(c); s++;  } }

@@prs531:
@@prs529:
@@prs528:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp @@prs523
@@prs524:

;-843 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
 LEAVE
 ret
; ENDP

eprnum:  ; *** PROC ***
;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   843 NULL n = bp+4
;  201 var sign word   843 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@eprnum532
 push 45
 call eprc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-844   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }

@@eprnum532:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@eprnum533
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call eprnum
 add  sp, 2
@@eprnum533:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
 push word [bp+4]
 call eprc
 add  sp, 2

;-845 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint1:  ; *** PROC ***
;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   845 NULL n = bp+4
;  201 var sign word   845 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@pint1534
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-846   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }

@@pint1534:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@pint1535
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
@@pint1535:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
 push word [bp+4]
 call prc
 add  sp, 2

;-847 int prunsign1(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP

prunsign1:  ; *** PROC ***

;-848   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   847 NULL n = bp+4
;  201 var unsg word   847 NULL e = bp-2;
 ENTER  2,0 ; constant expression
cmp word[bp+4], 10 ;unsigned : 0
 jb  @@prunsign1536
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-849     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }

@@prunsign1536:
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov ax, dx
 mov [bp+4], ax
 add  word[bp+4], 48
 push word [bp+4]
 call prc
 add  sp, 2

;-850 int printint51(unsigned int j)  {
 LEAVE
 ret
; ENDP

printint51:  ; *** PROC ***

;-851   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   850 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge @@printint51537
 push 32
 call prc
 add  sp, 2
@@printint51537:
 mov ax, [bp+4]
 cmp ax, 1000
 jge @@printint51538
 push 32
 call prc
 add  sp, 2
@@printint51538:
 mov ax, [bp+4]
 cmp ax, 100
 jge @@printint51539
 push 32
 call prc
 add  sp, 2

;-852    if (j<10) prc(32);  prunsign1(j); }

@@printint51539:
 mov ax, [bp+4]
 cmp ax, 10
 jge @@printint51540
 push 32
 call prc
 add  sp, 2
@@printint51540:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-853 


;-854 int fgets1() { char c; c=*fgetsp;
 LEAVE
 ret
; ENDP

fgets1:  ; *** PROC ***
;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   854 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-855   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne @@fgets1541
 call printinputline
 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne @@fgets1542
 mov ax, 0
 jmp @@retn

;-856     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }

@@fgets1542:
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov ax, 0
 mov word [spalte], ax

;-857   fgetsp++; spalte++;  return c; }

@@fgets1541:
 inc  word[fgetsp]
 inc  word[spalte]
 mov al, [bp-2]
 jmp @@retn

;-858 int printinputline() { fgetsp=&fgetsdest;

@@retn: LEAVE
 ret
; ENDP

printinputline:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-859   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);

@@printinputline543:
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readR
 add  sp, 4
 mov word [DOS_NoBytes], ax

;-860   if (DOS_NoBytes == 0) return; 

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne @@printinputline544
 jmp @@retn

;-861     *fgetsp=DOS_ByteRead; fgetsp++;} 

@@printinputline544:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
 inc  word[fgetsp]

;-862   while (DOS_ByteRead != 10); *fgetsp=0;

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  @@printinputline545
 jmp @@printinputline543
@@printinputline545:
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-863     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;

 mov ax, [fdout]
 or  al, al
 je @@printinputline546
 push printinputline_0
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2
 push 32
 call prc
 add  sp, 2
 inc  word[lineno]

;-864       prscomment(&fgetsdest);}

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-865 }

@@printinputline546:

;-866 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }

@@retn:
 ret
; ENDP
printinputline_0 db "\n\n;-",0

end1:  ; *** PROC ***
;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   866 NULL n = bp+4;
 ENTER  0,0
 push word [fdin]
 call fcloseR
 add  sp, 2
 push word [fdout]
 call fcloseR
 add  sp, 2
 push word [bp+4]
 call exitR
 add  sp, 2

;-867 int error1(char *s) { 
 LEAVE
 ret
; ENDP

error1:  ; *** PROC ***

;-868   lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   867 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-869   prnl(); prscomment(&fgetsdest);

 call prnl
 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-870   prs(";Line: "); prunsign1(lineno);

 push error1_0
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-871   prs(" ************** ERROR: "); prs(s);

 push error1_1
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2

;-872   prs("  in column: "); pint1(spalte);

 push error1_2
 call prs
 add  sp, 2
 push word [spalte]
 call pint1
 add  sp, 2

;-873   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);

 push error1_3
 call prs
 add  sp, 2
 push word [token]
 call prunsign1
 add  sp, 2
 push error1_4
 call prs
 add  sp, 2
 mov al, byte [globC]
 mov ah, 0
 push ax
 call prc
 add  sp, 2

;-874   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);

 push error1_5
 call prs
 add  sp, 2
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call pint1
 add  sp, 2
 push error1_6
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-875   end1(1); }

 push 1
 call end1
 add  sp, 2

;-876 int listproc() {int i; 
 LEAVE
 ret
; ENDP
error1_0 db ";Line: ",0
error1_1 db " ************** ERROR: ",0
error1_2 db "  in column: ",0
error1_3 db "\nToken: ",0
error1_4 db ", globC: ",0
error1_5 db ", thechar: ",0
error1_6 db ", symbol: ",0

listproc:  ; *** PROC ***

;-877   if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   876 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle @@listproc547

;-878   prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-879   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);

 push listproc_1
 call prs
 add  sp, 2
 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-880   prs("\n;   # type sign width addr used name   list of local variables");

 push listproc_2
 call prs
 add  sp, 2

;-881     i=LSTART; 

 mov ax, 200
 mov [bp-2], ax

;-882     while (i < LTop) { listvar(i); i++; } } 

@@listproc548:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge @@listproc549
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]
 jmp @@listproc548
@@listproc549:

;-883 }

@@listproc547:

;-884 int listvar(unsigned int i) {unsigned int j; char c;
 LEAVE
 ret
; ENDP
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name   list of local variables",0

listvar:  ; *** PROC ***

;-885   prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   884 NULL i = bp+4
;  201 var unsg word   884 NULL j = bp-2
;  202 var sign byte   884 NULL c = bp-4;
 ENTER  4,0
 push listvar_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-886   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne @@listvar550
 push listvar_1
 call prs
 add  sp, 2
@@listvar550:
 mov al, [bp-4]
 cmp al, 42
 jne @@listvar551
 push listvar_2
 call prs
 add  sp, 2

;-887                if(c=='&')prs("arr ");   if(c=='#')prs("def ");

@@listvar551:
 mov al, [bp-4]
 cmp al, 38
 jne @@listvar552
 push listvar_3
 call prs
 add  sp, 2
@@listvar552:
 mov al, [bp-4]
 cmp al, 35
 jne @@listvar553
 push listvar_4
 call prs
 add  sp, 2

;-888   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

@@listvar553:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne @@listvar554
 push listvar_5
 call prs
 add  sp, 2
@@listvar554:
 mov al, [bp-4]
 cmp al, 85
 jne @@listvar555
 push listvar_6
 call prs
 add  sp, 2

;-889   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

@@listvar555:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne @@listvar556
 push listvar_7
 call prs
 add  sp, 2
@@listvar556:
 mov al, [bp-4]
 cmp al, 2
 jne @@listvar557
 push listvar_8
 call prs
 add  sp, 2

;-890                if(c==  4)prs("dwrd " );

@@listvar557:
 mov al, [bp-4]
 cmp al, 4
 jne @@listvar558
 push listvar_9
 call prs
 add  sp, 2

;-891   j=GAdr[i]; printint51(j);

@@listvar558:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-892   j=GUsed[i]; if (j) printint51(j);

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je @@listvar559
 push word [bp-2]
 call printint51
 add  sp, 2

;-893   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}

 jmp @@listvar560
@@listvar559:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne @@listvar561
 push listvar_10
 call prs
 add  sp, 2
 jmp @@listvar562
@@listvar561:
 push listvar_11
 call prs
 add  sp, 2
@@listvar562:

;-894   prc(32);  pt=adrofname(i); prs(pt);

@@listvar560:
 push 32
 call prc
 add  sp, 2
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-895   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne @@listvar563
 push 61
 call prc
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-896   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}

@@listvar563:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne @@listvar564
 push 91
 call prc
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-897   if (i >= LSTART) { prs(" = bp"); j=GData[i];

@@listvar564:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  @@listvar565
 push listvar_12
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-898     if (j > 0) prc('+'); pint1(j);  }

 mov ax, [bp-2]
 cmp ax, 0
 jle @@listvar566
 push 43
 call prc
 add  sp, 2
@@listvar566:
 push word [bp-2]
 call pint1
 add  sp, 2

;-899 }

@@listvar565:

;-900 int listcall() { int i;
 LEAVE
 ret
; ENDP
listvar_0 db "\n;",0
listvar_1 db "var ",0
listvar_2 db "ptr ",0
listvar_3 db "arr ",0
listvar_4 db "def ",0
listvar_5 db "sign ",0
listvar_6 db "unsg ",0
listvar_7 db "byte ",0
listvar_8 db "word ",0
listvar_9 db "dwrd ",0
listvar_10 db "    -",0
listvar_11 db " NULL",0
listvar_12 db " = bp",0

listcall:  ; *** PROC ***

;-901   prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   900 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-902   i=0;  while (i< CTop) { calllisting(i); i++; } }

 mov ax, 0
 mov [bp-2], ax
@@listcall567:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@listcall568
 push word [bp-2]
 call calllisting
 add  sp, 2
 inc  word[bp-2]
 jmp @@listcall567
@@listcall568:

;-903 int calllisting(int i) {char c; int j;
 LEAVE
 ret
; ENDP
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0

calllisting:  ; *** PROC ***

;-904   prs("\n;"); printint51(i); prc(32);

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   903 NULL i = bp+4
;  201 var sign byte   903 NULL c = bp-2
;  202 var sign word   903 NULL j = bp-4;
 ENTER  4,0
 push calllisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-905   c=CType [i]; if(c==0)prs("unresolved ");

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne @@calllisting569
 push calllisting_1
 call prs
 add  sp, 2

;-906   j=CAdr[i];            printint51(j); prc(32);

@@calllisting569:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov [bp-4], ax
 push word [bp-4]
 call printint51
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-907   from_far(NameA, j);   prs(NameA);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-908 }


;-909 int countcalls(int f) { unsigned int i;
 LEAVE
 ret
; ENDP
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0

countcalls:  ; *** PROC ***

;-910   pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   909 NULL f = bp+4
;  201 var unsg word   909 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-911   i=0;  while (i < CTop) {

 mov ax, 0
 mov [bp-2], ax
@@countcalls570:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@countcalls571

;-912     p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-913     from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-914     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je @@countcalls572
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-915     i++; }

@@countcalls572:
 inc  word[bp-2]

;-916 }

 jmp @@countcalls570
@@countcalls571:

;-917 int listfunc() { int i;
 LEAVE
 ret
; ENDP

listfunc:  ; *** PROC ***

;-918   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   917 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-919   i=0;  while (i < FTop) { countcalls (i); i++; } 

 mov ax, 0
 mov [bp-2], ax
@@listfunc573:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@listfunc574
 push word [bp-2]
 call countcalls
 add  sp, 2
 inc  word[bp-2]

;-920   i=0;  while (i < FTop) { funclisting(i); i++; } }

 jmp @@listfunc573
@@listfunc574:
 mov ax, 0
 mov [bp-2], ax
@@listfunc575:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@listfunc576
 push word [bp-2]
 call funclisting
 add  sp, 2
 inc  word[bp-2]
 jmp @@listfunc575
@@listfunc576:

;-921 int funclisting(int i) {int j;  char c;
 LEAVE
 ret
; ENDP
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0

funclisting:  ; *** PROC ***

;-922   prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   921 NULL i = bp+4
;  201 var sign word   921 NULL j = bp-2
;  202 var sign byte   921 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-923   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je @@funclisting577
 push word [bp-2]
 call printint51
 add  sp, 2
 jmp @@funclisting578
@@funclisting577:
 push funclisting_1
 call prs
 add  sp, 2

;-924   j = FAdr[i];   printint51(j); prc(32);

@@funclisting578:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-925   c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-926   if(c=='V')prs("void " );    if(c=='B')prs("byte " );

 mov al, [bp-4]
 cmp al, 86
 jne @@funclisting579
 push funclisting_2
 call prs
 add  sp, 2
@@funclisting579:
 mov al, [bp-4]
 cmp al, 66
 jne @@funclisting580
 push funclisting_3
 call prs
 add  sp, 2

;-927   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );

@@funclisting580:
 mov al, [bp-4]
 cmp al, 87
 jne @@funclisting581
 push funclisting_4
 call prs
 add  sp, 2
@@funclisting581:
 mov al, [bp-4]
 cmp al, 68
 jne @@funclisting582
 push funclisting_5
 call prs
 add  sp, 2

;-928   prc(32); prc(32);

@@funclisting582:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-929   pt=adrF(FNameField, i); prs(pt);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-930 }


;-931 unsigned int MAXUI=65535;
 LEAVE
 ret
; ENDP
funclisting_0 db "\n;",0
funclisting_1 db " NULL",0
funclisting_2 db "void ",0
funclisting_3 db "byte ",0
funclisting_4 db "word ",0
funclisting_5 db "dwrd ",0
MAXUI dw 65535

;-932 int epilog() {unsigned int i; 


epilog:  ; *** PROC ***

;-933   strcpy(symbol, "LastFunctionByt");  storefunc();

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   932 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 call storefunc

;-934   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");

 push epilog_1
 call prs
 add  sp, 2

;-935   prs("\n \n;   # type sign width  adr used name   list of global variables\n");

 push epilog_2
 call prs
 add  sp, 2

;-936   i=1;

 mov ax, 1
 mov [bp-2], ax

;-937   while (i< GTop) { listvar(i); i++; }

@@epilog583:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@epilog584
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]

;-938   listfunc();   listcall();

 jmp @@epilog583
@@epilog584:
 call listfunc
 call listcall

;-939 


;-940   prs("\n;Input: "); prs(&namein);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-941   prs(", List: ");   prs(&namelst);

 push epilog_4
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-942   prs(",  Lines:"); printint51(lineno);

 push epilog_5
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-943   prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_6
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-944   prs(" max.:"); printint51(LSTART);

 push epilog_7
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-945   prs("\n;Functions      :"); printint51(FTop);

 push epilog_8
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-946   prs(" max.:"); printint51(FUNCMAX);

 push epilog_9
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-947   prs("\n;Calls          :"); printint51(CTop);

 push epilog_10
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-948   prs(" max.:"); printint51(CALLMAX);

 push epilog_11
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-949   prs(", NameField:"); printint51(CNameTop);

 push epilog_12
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-950   prs(" max.:"); printint51(65535);

 push epilog_13
 call prs
 add  sp, 2
 push -1
 call printint51
 add  sp, 2

;-951 //  prs(", segE:"); printint51(segE);


;-952   __asm{call LastFunctionByt}  _ i=ax;

call LastFunctionByt
mov [bp-2], ax

;-953   prs("\n;Code until     :"); printint51(i);

 push epilog_14
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-954   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");

 push epilog_15
 call prs
 add  sp, 2
 push word [ORGDATAORIG]
 call printint51
 add  sp, 2
 mov ax, [ORGDATAORIG]
 sub ax, [bp-2]
 mov [bp-2], ax
 push epilog_16
 call prs
 add  sp, 2

;-955   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  @@epilog585
 push epilog_17
 call prs
 add  sp, 2

;-956   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;

@@epilog585:
 push epilog_18
 call prs
 add  sp, 2
 push word [orgData]
 call prunsign1
 add  sp, 2
 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax

;-957   prs(", resting stacksize: ");printint51(i);

 push epilog_19
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-958   if (i <= 5000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 5000
 ja  @@epilog586
 push epilog_20
 call prs
 add  sp, 2

;-959   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);

@@epilog586:
 push epilog_21
 call prs
 add  sp, 2
 lea  ax, [coname]
 push ax
 call prs
 add  sp, 2
 push epilog_22
 call prs
 add  sp, 2
 push word [maxco]
 call printint51
 add  sp, 2

;-960   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");

 push epilog_23
 call prs
 add  sp, 2
 push 3000
 call printint51
 add  sp, 2
 mov ax, 3000
 mov [bp-2], ax
 mov ax, [bp-2]
 sub ax, [maxco]
 mov [bp-2], ax
 push epilog_24
 call prs
 add  sp, 2

;-961   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  @@epilog587
 push epilog_25
 call prs
 add  sp, 2

;-962   end1(0);}

@@epilog587:
 push 0
 call end1
 add  sp, 2

;-963 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}


;-964 int setblock(unsigned int i) {
 LEAVE
 ret
; ENDP
epilog_0 db "LastFunctionByt",0
epilog_1 db "\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret",0
epilog_2 db "\n \n;   # type sign width  adr used name   list of global variables\n",0
epilog_3 db "\n;Input: ",0
epilog_4 db ", List: ",0
epilog_5 db ",  Lines:",0
epilog_6 db "\n;Glob. variables:",0
epilog_7 db " max.:",0
epilog_8 db "\n;Functions      :",0
epilog_9 db " max.:",0
epilog_10 db "\n;Calls          :",0
epilog_11 db " max.:",0
epilog_12 db ", NameField:",0
epilog_13 db " max.:",0
epilog_14 db "\n;Code until     :",0
epilog_15 db " max.: ",0
epilog_16 db ", free:",0
epilog_17 db " *** Warning *** Code area too small",0
epilog_18 db "\n;Data (HeapEnd) :",0
epilog_19 db ", resting stacksize: ",0
epilog_20 db " *** Warning *** Stack too small",0
epilog_21 db "\n;Max. Const in '",0
epilog_22 db "' :",0
epilog_23 db " max.",0
epilog_24 db ", free:",0
epilog_25 db " *** Warning *** constant area too small",0

setblock:  ; *** PROC ***

;-965   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   964 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, cs
 mov  es, ax
 mov  ax, 18944
 call DosInt

;-966 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 LEAVE
 ret
; ENDP

allocmem:  ; *** PROC ***

;-967   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   966 NULL i = bp+4
;  201 var unsg word   966 NULL vAX = bp-2
;  202 var unsg word   966 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, 18432
 call DosInt
mov [bp-2], ax
mov [bp-4], bx

;-968   if(DOS_ERR) return vBX;   return vAX;

 mov ax, [DOS_ERR]
 or  al, al
 je @@allocmem588
 mov ax, [bp-4]
 jmp @@retn
@@allocmem588:
 mov ax, [bp-2]
 jmp @@retn

;-969 }


;-970 int copyF(char *dest, char *src, unsigned int sz) {

@@retn: LEAVE
 ret
; ENDP

copyF:  ; *** PROC ***

;-971   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di

;Function : copyF, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   970 NULL dest = bp+4
;  201 ptr sign byte   970 NULL src = bp+6
;  202 var unsg word   970 NULL sz = bp+8;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]
 mov  cx, [bp+8]

;-972   asm cld

 cld

;-973   asm rep movsb

 rep movsb

;-974   asm mov byte [es:di], 0

 mov byte [es:di], 0

;-975 }


;-976 int to_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

to_far:  ; *** PROC ***

;-977   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   976 NULL dest = bp+4
;  201 ptr sign byte   976 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-978   asm cld

 cld

;-979   do{

@@to_far589:

;-980   asm lodsb  ; inc si

 lodsb  ; inc si

;-981   asm stosb  ; inc di

 stosb  ; inc di

;-982   } while (al != 0);

 cmp  al, 0
 je  @@to_far590
 jmp @@to_far589
@@to_far590:

;-983 }


;-984 int from_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

from_far:  ; *** PROC ***

;-985   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   984 NULL dest = bp+4
;  201 ptr sign byte   984 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-986   do{

@@from_far591:

;-987   asm mov al, [es:si]

 mov al, [es:si]

;-988   asm inc si

 inc si

;-989   asm mov [di], al

 mov [di], al

;-990   asm inc di

 inc di

;-991   } while (al != 0);

 cmp  al, 0
 je  @@from_far592
 jmp @@from_far591
@@from_far592:

;-992 }
 LEAVE
 ret
; ENDP
 
; missing functions: 
; strlen
; strcpy
; strlen
; strcpy
; strcpy
; eqstr
; eqstr
; strlen
; strcpy
; strcpy
; eqstr
; strcpy
; mkneg
; strlen
; strcpy
; eqstr
; eqstr
; strcpy
; strcpy
; strcpy
; strcpy
; strcpy
; strcpy
; strcpy
; strcpy
; strlen
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; strlen
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; strcpy
; cputs
; cputs
; readRL
; strcpy
; instr2
; strcat1
; toupper
; strcpy
; strlen
; openR
; cputs
; cputs
; exitR
; creatR
; cputs
; cputs
; exitR
; eqstr
; cputs
; cputs
; pint
; openR
; cputs
; cputs
; exitR
; eqstr
; putch
; cputs
; openR
; eqstr
; eqstr
; strcpy
; strlen
; strcpy
; instr1
; digit
; letter
; strcpy
; letter
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; eqstr
; strcpy
; eqstr
; letter
; digit
; writetty
; writetty
; fputcR
; mkneg
; mkneg
; readR
; fcloseR
; fcloseR
; exitR
; eqstr
; strcpy
; DosInt
; DosInt
; Number of unresolved CALLs :  153
;use archive file: AR.C

;-993 // AR.C Archive

;Number of CALLs:    2 : writetty

writetty:  ; *** PROC ***
 mov  ah, 14
 mov  bx, 0
 int  16

;-994 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }

 ret
; ENDP
;Number of CALLs:    1 : putch

putch:  ; *** PROC ***
;Function : putch, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   994 NULL c = bp+4;
 ENTER  0,0 ; constant expression
cmp byte[bp+4], 10
 jne @@putch593
 mov  al, 13
 call writetty
@@putch593:
 mov  al, [bp+4]
 call writetty

;-995 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
; ENDP
;Number of CALLs:   11 : cputs

cputs:  ; *** PROC ***
;Function : cputs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   995 NULL s = bp+4
;  201 var sign byte   995 NULL c = bp-2;
 ENTER  2,0
@@cputs594:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@cputs595
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
 jmp @@cputs594
@@cputs595:

;-996 int mkneg(int n) { n; __asm {neg ax} }
 LEAVE
 ret
; ENDP
;Number of CALLs:    3 : mkneg

mkneg:  ; *** PROC ***
;Function : mkneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   996 NULL n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-997 int prunsign(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : pint

pint:  ; *** PROC ***
;Function : pint, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   997 NULL n = bp+4
;  201 var sign word   997 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@pint596
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-998   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }

@@pint596:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@pint597
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint
 add  sp, 2
@@pint597:
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov ax, dx
 mov [bp+4], ax
 mov ax, [bp+4]
 add ax, 48
 mov [bp+4], ax
 push word [bp+4]
 call putch
 add  sp, 2

;-999 int printint5(unsigned int j)  {
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : toupper

toupper:  ; *** PROC ***
;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   999 NULL s = bp+4;
 ENTER  0,0
@@toupper598:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@toupper599
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 97 ;unsigned : 1
 jl  @@toupper600
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 122
 jg  @@toupper601
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 sub ax, 32
 mov  bx, [bp+4]
 mov  [bx], al
@@toupper601:
@@toupper600:
 inc  word[bp+4]
 jmp @@toupper598
@@toupper599:

;-1000 int head1  (char *s) {while(letter(*s)) s++;     *s=0; }
 LEAVE
 ret
; ENDP
;Number of CALLs:    8 : strlen

strlen:  ; *** PROC ***
;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1000 NULL s = bp+4
;  201 var sign word  1000 NULL c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
@@strlen602:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  @@strlen603
 inc  word[bp+4]
 inc  word[bp-2]
 jmp @@strlen602
@@strlen603:
 mov ax, [bp-2]
 jmp @@retn

;-1001 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:   23 : strcpy

strcpy:  ; *** PROC ***
;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1001 NULL s = bp+4
;  201 ptr sign byte  1001 NULL t = bp+6;
 ENTER  0,0
@@strcpy604:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 mov  bx, [bp+4]
 mov  [bx], al
 inc  word[bp+4]
 inc  word[bp+6]
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  @@strcpy605
 jmp @@strcpy604
@@strcpy605:
 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-1002 int strncpy(char *s, char *t, int n) { if (_ n==0) return;
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : instr1

instr1:  ; *** PROC ***
;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1002 NULL s = bp+4
;  201 var sign byte  1002 NULL c = bp+6;
 ENTER  0,0
@@instr1606:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@instr1607
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne @@instr1608
 mov ax, 1
 jmp @@retn
@@instr1608:
 inc  word[bp+4]
 jmp @@instr1606
@@instr1607:
 mov ax, 0
 jmp @@retn

;-1003 int instr2(char *s, char c) { while(*s) { if (*s==c) return &s; s++;} return 0;}

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    1 : instr2

instr2:  ; *** PROC ***
;Function : instr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1003 NULL s = bp+4
;  201 var sign byte  1003 NULL c = bp+6;
 ENTER  0,0
@@instr2609:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@instr2610
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne @@instr2611
 mov ax, [bp+4]
 jmp @@retn
@@instr2611:
 inc  word[bp+4]
 jmp @@instr2609
@@instr2610:
 mov ax, 0
 jmp @@retn

;-1004 int digit(char c){ if(c<'0') return 0; if(c>'9') return 0; return 1; }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    2 : digit

digit:  ; *** PROC ***
;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1004 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge @@digit612
 mov ax, 0
 jmp @@retn
@@digit612:
 mov al, [bp+4]
 cmp al, 57
 jle @@digit613
 mov ax, 0
 jmp @@retn
@@digit613:
 mov ax, 1
 jmp @@retn

;-1005 int letter(char c) { if (digit(c)) return 1; if (c=='_') return 1;

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    3 : letter

letter:  ; *** PROC ***
;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1005 NULL c = bp+4;
 ENTER  0,0
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@letter614
 mov ax, 1
 jmp @@retn
@@letter614:
 mov al, [bp+4]
 cmp al, 95
 jne @@letter615
 mov ax, 1
 jmp @@retn

;-1006   if (c> 'z') return 0; if (c< '@') return 0;

@@letter615:
 mov al, [bp+4]
 cmp al, 122
 jle @@letter616
 mov ax, 0
 jmp @@retn
@@letter616:
 mov al, [bp+4]
 cmp al, 64
 jge @@letter617
 mov ax, 0
 jmp @@retn

;-1007   if (c> 'Z') { if (c< 'a') return 0; }  return 1; }

@@letter617:
 mov al, [bp+4]
 cmp al, 90
 jle @@letter618
 mov al, [bp+4]
 cmp al, 97
 jge @@letter619
 mov ax, 0
 jmp @@retn
@@letter619:
@@letter618:
 mov ax, 1
 jmp @@retn

;-1008 int eqstr(char *p, char *q) { while(*p) {

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:   80 : eqstr

eqstr:  ; *** PROC ***
;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1008 NULL p = bp+4
;  201 ptr sign byte  1008 NULL q = bp+6;
 ENTER  0,0
@@eqstr620:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eqstr621

;-1009     if (*p != *q) return 0; p++; q++; }

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  @@eqstr622
 mov ax, 0
 jmp @@retn
@@eqstr622:
 inc  word[bp+4]
 inc  word[bp+6]

;-1010     if(*q) return 0; return 1; }

 jmp @@eqstr620
@@eqstr621:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eqstr623
 mov ax, 0
 jmp @@retn
@@eqstr623:
 mov ax, 1
 jmp @@retn

;-1011 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    1 : strcat1

strcat1:  ; *** PROC ***
;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1011 NULL s = bp+4
;  201 ptr sign byte  1011 NULL t = bp+6;
 ENTER  0,0
@@strcat1624:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  @@strcat1625
 inc  word[bp+4]
 jmp @@strcat1624
@@strcat1625:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-1012 int basename(char *s) { char *p; p=0;
 LEAVE
 ret
; ENDP
;Number of CALLs:    2 : DosInt

DosInt:  ; *** PROC ***
 int  33
 jae short @@DosInt626
 inc  word[DOS_ERR]
@@DosInt626:

;-1013 int openR (char *s) { dx=s; ax=0x3D02;  DosInt(); }

 ret
; ENDP
;Number of CALLs:    3 : openR

openR:  ; *** PROC ***
;Function : openR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1013 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-1014 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : creatR

creatR:  ; *** PROC ***
;Function : creatR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1014 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-1015 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : readR

readR:  ; *** PROC ***
;Function : readR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1015 NULL s = bp+4
;  201 var sign word  1015 NULL fd = bp+6;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-1016 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : readRL

readRL:  ; *** PROC ***
;Function : readRL, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1016 NULL s = bp+4
;  201 var sign word  1016 NULL fd = bp+6
;  202 var sign word  1016 NULL len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-1017 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : fputcR

fputcR:  ; *** PROC ***
;Function : fputcR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1017 NULL n = bp+4
;  201 var sign word  1017 NULL fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]

;-1018   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-1019 int writeRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x4000; DosInt();}
 LEAVE
 ret
; ENDP
;Number of CALLs:    2 : fcloseR

fcloseR:  ; *** PROC ***
;Function : fcloseR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1019 NULL fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 int  33

;-1020 int exitR(char c) {ah=0x4C; al=c; inth 0x21; }
 LEAVE
 ret
; ENDP
;Number of CALLs:    4 : exitR

exitR:  ; *** PROC ***
;Function : exitR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1020 NULL c = bp+4;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 int  33

;-1021 int setdta(char *s) {dx=s; ah=0x1A; inth 0x21; }
 LEAVE
 ret
; ENDP
;End of archive file. 
 
; missing functions:  All FUNCTIONs in place
LastFunctionByt:db 0E8h, 0, 0
pop ax
ret
 
;   # type sign width  adr used name   list of global variables

;    1 arr sign byte     2    2 Version1[16]
;    2 def unsg byte     4    - LSTART=200
;    3 def unsg byte     5    - VARMAX=300
;    4 def unsg byte     6    - GNAMEMAX=4800
;    5 def unsg byte     7    - FUNCMAX=300
;    6 def unsg byte     8    - FNAMEMAX=4800
;    7 def unsg byte     9    - CALLMAX=2000
;    8 def unsg byte    10    - IDLENMAX=15
;    9 def unsg byte    12    - T_NAME=256
;   10 def unsg byte    13    - T_CONST=257
;   11 def unsg byte    14    - T_STRING=258
;   12 def unsg byte    15    - T_INCLUDE=510
;   13 def unsg byte    16    - T_DEFINE=511
;   14 def unsg byte    17    - T_RETURN=512
;   15 def unsg byte    18    - T_IF=513
;   16 def unsg byte    19    - T_ELSE=514
;   17 def unsg byte    20    - T_WHILE=515
;   18 def unsg byte    21    - T_DO=516
;   19 def unsg byte    22    - T_INT=517
;   20 def unsg byte    23    - T_ASM=518
;   21 def unsg byte    24    - T_ASMBLOCK=519
;   22 def unsg byte    25    - T_EMIT=520
;   23 def unsg byte    26    - T_GOTO=521
;   24 def unsg byte    27    - T_VOID=529
;   25 def unsg byte    28    - T_CHAR=530
;   26 def unsg byte    29    - T_SIGNED=531
;   27 def unsg byte    30    - T_UNSIGNED=532
;   28 def unsg byte    31    - T_LONG=533
;   29 def unsg byte    32    - T_SHORT=534
;   30 def unsg byte    34    - T_UINT32=545
;   31 def unsg byte    36    - T_INTH=600
;   32 def unsg byte    37    - T_IFCARRY=601
;   33 def unsg byte    38    - T_IFZERO=602
;   34 def unsg byte    39    - T_EQ=806
;   35 def unsg byte    40    - T_NE=807
;   36 def unsg byte    41    - T_GE=811
;   37 def unsg byte    42    - T_LE=824
;   38 def unsg byte    43    - T_PLUSPLUS=1219
;   39 def unsg byte    44    - T_MINUSMINUS=1225
;   40 def unsg byte    45    - T_PLUSASS=1230
;   41 def unsg byte    46    - T_MINUSASS=1231
;   42 def unsg byte    47    - T_MULASS=1232
;   43 def unsg byte    48    - T_DIVASS=1233
;   44 def unsg byte    49    - T_ANDASS=1234
;   45 def unsg byte    50    - T_ORASS=1235
;   46 def unsg byte    51    - T_LESSLESS=1240
;   47 def unsg byte    52    - T_GREATGREAT=1241
;   48 def unsg byte    53    - COMAX=3000
;   49 def unsg byte    54    - CMDLENMAX=67
;   50 var unsg word    55    3 ORGDATAORIG
;   51 var unsg word    55   10 orgData
;   52 arr sign byte    56    4 co[3000]
;   53 var sign word    56    4 maxco
;   54 var sign word    56    3 maxco1
;   55 arr sign byte    57    2 coname[67]
;   56 ptr sign byte    57    5 cloc
;   57 var sign word    58    7 fdin
;   58 var sign word    58    7 fdout
;   59 arr sign byte    58  111 symbol[128]
;   60 arr sign byte    59   12 fname[67]
;   61 arr sign byte    59   10 namein[67]
;   62 arr sign byte    60    7 namelst[67]
;   63 arr sign byte    60    5 archivename[67]
;   64 var sign word    61   49 token
;   65 var sign byte    61    2 globC
;   66 var sign word    61    3 spalte
;   67 var sign byte    62   28 thechar
;   68 var sign word    62    9 iscmp
;   69 var sign word    62    4 nconst
;   70 var sign word    63    3 nreturn
;   71 var sign word    63   16 nlabel
;   72 var sign word    63    3 callrecursive
;   73 var sign word    64   24 GTop
;   74 var sign word    64   20 LTop
;   75 var unsg word    65   45 lexval
;   76 var sign word    66    6 typei
;   77 var sign byte    66    8 istype
;   78 arr sign byte    66   11 GType[300]
;   79 var sign word    67    6 signi
;   80 var sign byte    67    6 issign
;   81 arr sign byte    67    5 GSign[300]
;   82 var sign word    68    9 widthi
;   83 var sign byte    68   21 iswidth
;   84 arr sign byte    68    5 GWidth[300]
;   85 arr sign word    69    4 GAdr[300]
;   86 arr sign word    69    6 GUsed[300]
;   87 var sign word    70   26 wi
;   88 arr sign word    70   11 GData[300]
;   89 arr sign byte    70    2 GNameField[4800]
;   90 var sign word    71   17 FTop
;   91 var sign word    71    9 CTop
;   92 arr sign byte    72    2 FType[300]
;   93 arr sign byte    72    5 CType[2000]
;   94 arr sign word    73    4 FAdr[300]
;   95 arr sign word    73    5 CAdr[2000]
;   96 arr sign word    74    4 FCalls[300]
;   97 arr sign byte    75    5 FNameField[4800]
;   98 arr sign byte    76    9 NameA[32]
;   99 arr sign byte    77    5 fgetsdest[128]
;  100 ptr unsg byte    77    8 CNameTop
;  101 ptr unsg byte    78   10 fgetsp
;  102 var unsg word    78    4 segE
;  103 var unsg word    79   12 lineno
;  104 var unsg word    79    2 linenoinclude
;  105 ptr unsg byte    80   19 pt
;  106 ptr unsg byte    80    8 p1
;  107 var sign word    81   10 DOS_ERR
;  108 var sign word    81    5 DOS_NoBytes
;  109 var sign byte    81    3 DOS_ByteRead
;  110 var sign word    83 NULL tt1
;  111 var sign word    83 NULL tt2
;  112 var sign dwrd    83    1 ex
;  113 arr sign byte   100    2 doglobName[15]
;  114 var sign word   248    5 mod1
;  115 var sign word   248   12 ireg1
;  116 var sign word   248    6 idx1
;  117 var sign word   248    1 ids1
;  118 var sign word   248    4 idw1
;  119 var sign word   248    2 idt1
;  120 var sign word   248 NULL val1
;  121 var sign word   249    2 mod2
;  122 var sign word   249    6 ireg2
;  123 var sign word   249    6 idx2
;  124 var sign word   249    1 ids2
;  125 var sign word   249    4 idw2
;  126 var sign word   249    2 idt2
;  127 var sign word   249    2 val2
;  128 arr sign byte   314    9 ops[5]
;  129 arr sign byte   356    3 printregstr[74]
;  130 var sign word   364    1 evalue
;  131 var sign word   364    1 exprtype
;  132 arr sign word   516    2 docalltype[10]
;  133 arr sign word   516    2 docallvalue[10]
;  134 arr sign byte   517    2 procname[17]
;  135 ptr sign byte   572    1 arglen
;  136 ptr sign byte   572    3 argv
;  137 var sign byte   616    4 wasfunction
;  138 arr sign byte   745    2 symboltemp[80]
;  139 var unsg word   931    1 MAXUI


;   # Calls Line Width  Name   list of functions

;    0    1   84   ttt
;    1    4   91   a
;    2   21   92   v
;    3    4   97   checknamelen
;    4    1  101   doglob
;    5   12  150   gettypes
;    6    9  159   adrofname
;    7    7  160   adrF
;    8    4  162   printName
;    9   12  166   searchname
;   10    3  170   checkName
;   11   10  175   typeName
;   12    3  185   name1
;   13    1  187   storecall
;   14    2  193   storefunc
;   15    2  197   addlocal
;   16    1  203   checkFunction
;   17    2  206   dofunc
;   18    1  241   isvariable
;   19    3  251   pexpr
;   20    1  258   constantexpr
;   21    3  268   exprstart
;   22    1  270   expr2
;   23    3  315   doreg1
;   24    6  334   checkreg
;   25    6  359   printreg
;   26    2  365   expr
;   27    4  414   compoundass
;   28    2  421   dovar1
;   29    8  442   rterm
;   30    1  455   isreg
;   31   15  473   doreg
;   32    1  479   doassign
;   33    1  497   domul
;   34    2  501   doidiv
;   35    1  514   domod
;   36    1  518   docall1
;   37 NULL  560   main
;   38    3  571   getfirstchar
;   39    1  573   getarg
;   40    2  592   parse
;   41    2  601   checkcalls
;   42    1  617   doar
;   43    1  644   getfunctionhead
;   44    1  651   doinclude
;   45    1  662   dodefine
;   46    8  678   stmt
;   47    1  702   doemit
;   48    3  706   cmpneg
;   49    9  719   prlabel
;   50    3  720   prjump
;   51    1  721   doif
;   52    1  726   doifcarry
;   53    1  729   doifzero
;   54    1  732   dodo
;   55    1  736   dowhile
;   56    4  739   isrelational
;   57   19  746   getlex
;   58    1  803   convertdefine
;   59    1  810   getdigit
;   60    1  819   getstring
;   61   31  822   next
;   62   84  823   istoken
;   63   38  824   expect
;   64    6  827   eprc
;   65    5  828   eprs
;   66   41  829   prc
;   67    3  834   prscomment
;   68    8  836   prnl
;   69  261  838   prs
;   70    2  843   eprnum
;   71   18  845   pint1
;   72   28  847   prunsign1
;   73   26  850   printint51
;   74    2  854   fgets1
;   75    1  858   printinputline
;   76    2  866   end1
;   77   50  867   error1
;   78    2  876   listproc
;   79    2  884   listvar
;   80    1  900   listcall
;   81    1  903   calllisting
;   82    1  909   countcalls
;   83    1  917   listfunc
;   84    1  921   funclisting
;   85    1  932   epilog
;   86    1  964   setblock
;   87    1  966   allocmem
;   88 NULL  970   copyF
;   89    1  976   to_far
;   90    4  984   from_far
;   91    4  993   writetty
;   92    3  994   putch
;   93   11  995   cputs
;   94    4  996   mkneg
;   95    2  997   pint
;   96    1  999   toupper
;   97    8 1000   strlen
;   98   24 1001   strcpy
;   99    1 1002   instr1
;  100    1 1003   instr2
;  101    3 1004   digit
;  102    3 1005   letter
;  103   80 1008   eqstr
;  104    1 1011   strcat1
;  105    7 1012   DosInt
;  106    3 1013   openR
;  107    1 1014   creatR
;  108    1 1015   readR
;  109    1 1016   readRL
;  110    1 1017   fputcR
;  111    2 1019   fcloseR
;  112    4 1020   exitR
;  113 NULL 1021   LastFunctionByt

;    #  addr name   list of CALLs

;    0     0 ttt
;    1     4 printName
;    2    14 prc
;    3    18 printName
;    4    28 prc
;    5    32 strlen
;    6    39 error1
;    7    46 error1
;    8    53 error1
;    9    60 checknamelen
;   10    73 checkName
;   11    83 error1
;   12    90 istoken
;   13    98 istoken
;   14   106 prs
;   15   110 prunsign1
;   16   120 prs
;   17   124 prs
;   18   128 prs
;   19   132 prs
;   20   136 prs
;   21   140 prunsign1
;   22   150 prs
;   23   154 expect
;   24   161 expect
;   25   168 error1
;   26   175 prs
;   27   179 prs
;   28   183 prs
;   29   187 strcpy
;   30   194 expect
;   31   201 istoken
;   32   209 prc
;   33   213 prscomment
;   34   224 prc
;   35   228 prs
;   36   232 strlen
;   37   239 istoken
;   38   247 prc
;   39   251 expect
;   40   258 prunsign1
;   41   268 istoken
;   42   276 expect
;   43   283 error1
;   44   290 prs
;   45   294 prs
;   46   298 prs
;   47   302 prs
;   48   306 prs
;   49   310 prs
;   50   314 istoken
;   51   322 prc
;   52   326 istoken
;   53   334 expect
;   54   341 prunsign1
;   55   351 prunsign1
;   56   361 adrofname
;   57   371 strcpy
;   58   378 strcpy
;   59   385 expect
;   60   392 adrF
;   61   397 adrofname
;   62   407 prs
;   63   411 prs
;   64   415 prc
;   65   419 pint1
;   66   425 prc
;   67   429 checkName
;   68   439 error1
;   69   446 adrofname
;   70   456 eqstr
;   71   462 adrofname
;   72   472 eqstr
;   73   478 istoken
;   74   486 istoken
;   75   494 istoken
;   76   502 istoken
;   77   510 istoken
;   78   518 istoken
;   79   526 istoken
;   80   534 istoken
;   81   542 istoken
;   82   550 istoken
;   83   558 name1
;   84   564 error1
;   85   571 getlex
;   86   578 error1
;   87   585 error1
;   88   592 strlen
;   89   599 to_far
;   90   606 error1
;   91   613 adrF
;   92   618 strcpy
;   93   625 error1
;   94   632 checkName
;   95   642 error1
;   96   649 adrF
;   97   654 strcpy
;   98   661 adrF
;   99   666 eqstr
;  100   672 checknamelen
;  101   685 strcpy
;  102   692 checkFunction
;  103   706 error1
;  104   713 storefunc
;  105   723 prs
;  106   727 prs
;  107   731 prs
;  108   735 expect
;  109   742 istoken
;  110   750 typeName
;  111   759 addlocal
;  112   768 istoken
;  113   776 expect
;  114   783 expect
;  115   790 isvariable
;  116   801 typeName
;  117   810 checknamelen
;  118   823 addlocal
;  119   832 istoken
;  120   840 expect
;  121   847 expect
;  122   854 istoken
;  123   862 expect
;  124   869 listproc
;  125   878 prs
;  126   882 mkneg
;  127   888 pint1
;  128   894 prs
;  129   898 istoken
;  130   906 stmt
;  131   911 prs
;  132   915 prs
;  133   919 prs
;  134   923 prs
;  135   927 prs
;  136   931 strlen
;  137   938 strcpy
;  138   945 expect
;  139   952 eqstr
;  140   958 constantexpr
;  141   971 checkreg
;  142   980 doreg1
;  143   987 exprstart
;  144   997 prs
;  145  1001 prs
;  146  1005 expect
;  147  1012 getlex
;  148  1019 typeName
;  149  1028 searchname
;  150  1039 gettypes
;  151  1048 isrelational
;  152  1061 error1
;  153  1068 expect
;  154  1075 prs
;  155  1079 prs
;  156  1083 gettypes
;  157  1092 prs
;  158  1096 prs
;  159  1100 v
;  160  1102 prs
;  161  1106 prunsign1
;  162  1116 cmpneg
;  163  1123 prs
;  164  1127 expect
;  165  1134 eqstr
;  166  1140 expr2
;  167  1146 expr
;  168  1151 getlex
;  169  1158 typeName
;  170  1167 error1
;  171  1174 checkreg
;  172  1183 doreg1
;  173  1190 searchname
;  174  1201 gettypes
;  175  1210 error1
;  176  1217 isrelational
;  177  1230 error1
;  178  1237 istoken
;  179  1245 error1
;  180  1252 istoken
;  181  1260 prs
;  182  1264 prs
;  183  1268 prs
;  184  1272 prs
;  185  1276 prs
;  186  1280 v
;  187  1282 prs
;  188  1286 prunsign1
;  189  1296 adrofname
;  190  1306 prs
;  191  1310 prs
;  192  1314 typeName
;  193  1323 checkreg
;  194  1332 prs
;  195  1336 printreg
;  196  1345 v
;  197  1347 prs
;  198  1351 printreg
;  199  1360 error1
;  200  1367 searchname
;  201  1378 gettypes
;  202  1387 error1
;  203  1394 prs
;  204  1398 printreg
;  205  1407 error1
;  206  1414 prs
;  207  1418 a
;  208  1420 prs
;  209  1424 prs
;  210  1428 prs
;  211  1432 v
;  212  1434 adrofname
;  213  1444 prs
;  214  1448 prs
;  215  1452 error1
;  216  1459 istoken
;  217  1467 strcpy
;  218  1474 istoken
;  219  1482 strcpy
;  220  1489 istoken
;  221  1497 strcpy
;  222  1504 istoken
;  223  1512 strcpy
;  224  1519 istoken
;  225  1527 strcpy
;  226  1534 istoken
;  227  1542 strcpy
;  228  1549 istoken
;  229  1557 strcpy
;  230  1564 getlex
;  231  1571 isrelational
;  232  1584 error1
;  233  1591 strcpy
;  234  1598 prnl
;  235  1603 prs
;  236  1607 prs
;  237  1611 printreg
;  238  1620 prs
;  239  1624 istoken
;  240  1632 prunsign1
;  241  1642 typeName
;  242  1651 checkreg
;  243  1660 printreg
;  244  1669 searchname
;  245  1680 a
;  246  1682 v
;  247  1684 cmpneg
;  248  1691 prs
;  249  1695 expect
;  250  1702 strlen
;  251  1709 eqstr
;  252  1715 eqstr
;  253  1721 eqstr
;  254  1727 eqstr
;  255  1733 eqstr
;  256  1739 eqstr
;  257  1745 eqstr
;  258  1751 eqstr
;  259  1757 eqstr
;  260  1763 eqstr
;  261  1769 eqstr
;  262  1775 eqstr
;  263  1781 eqstr
;  264  1787 eqstr
;  265  1793 eqstr
;  266  1799 eqstr
;  267  1805 eqstr
;  268  1811 eqstr
;  269  1817 eqstr
;  270  1823 eqstr
;  271  1829 eqstr
;  272  1835 eqstr
;  273  1841 strlen
;  274  1848 eqstr
;  275  1854 eqstr
;  276  1860 eqstr
;  277  1866 eqstr
;  278  1872 eqstr
;  279  1878 eqstr
;  280  1884 eqstr
;  281  1890 eqstr
;  282  1896 eqstr
;  283  1902 prc
;  284  1906 prc
;  285  1910 prc
;  286  1914 istoken
;  287  1922 prs
;  288  1926 prunsign1
;  289  1936 typeName
;  290  1945 checkreg
;  291  1954 doreg1
;  292  1961 docall1
;  293  1969 isreg
;  294  1975 searchname
;  295  1986 gettypes
;  296  1995 istoken
;  297  2003 istoken
;  298  2011 expect
;  299  2018 searchname
;  300  2029 expect
;  301  2036 expect
;  302  2043 gettypes
;  303  2052 error1
;  304  2059 istoken
;  305  2067 error1
;  306  2074 prs
;  307  2078 prs
;  308  2082 prs
;  309  2086 v
;  310  2088 istoken
;  311  2096 error1
;  312  2103 prs
;  313  2107 prs
;  314  2111 prs
;  315  2115 v
;  316  2117 istoken
;  317  2125 compoundass
;  318  2137 istoken
;  319  2145 compoundass
;  320  2157 istoken
;  321  2165 compoundass
;  322  2177 istoken
;  323  2185 compoundass
;  324  2197 istoken
;  325  2205 error1
;  326  2212 istoken
;  327  2220 error1
;  328  2227 istoken
;  329  2235 expr
;  330  2240 doassign
;  331  2249 dovar1
;  332  2256 istoken
;  333  2264 rterm
;  334  2270 istoken
;  335  2278 rterm
;  336  2284 istoken
;  337  2292 rterm
;  338  2298 istoken
;  339  2306 rterm
;  340  2312 istoken
;  341  2320 rterm
;  342  2326 istoken
;  343  2334 rterm
;  344  2340 istoken
;  345  2348 domul
;  346  2354 istoken
;  347  2362 doidiv
;  348  2369 istoken
;  349  2377 domod
;  350  2383 isrelational
;  351  2396 rterm
;  352  2402 cmpneg
;  353  2409 error1
;  354  2416 prnl
;  355  2421 prs
;  356  2425 prs
;  357  2429 gettypes
;  358  2438 prs
;  359  2442 prs
;  360  2446 v
;  361  2448 prs
;  362  2452 expect
;  363  2459 prunsign1
;  364  2469 gettypes
;  365  2478 prs
;  366  2482 v
;  367  2484 prnl
;  368  2489 prs
;  369  2493 prs
;  370  2497 prs
;  371  2501 prnl
;  372  2506 prs
;  373  2510 prs
;  374  2514 a
;  375  2516 prs
;  376  2520 v
;  377  2522 prs
;  378  2526 prs
;  379  2530 prs
;  380  2534 prs
;  381  2538 prs
;  382  2542 prc
;  383  2546 printName
;  384  2556 prs
;  385  2560 prnl
;  386  2565 prs
;  387  2569 prs
;  388  2573 prs
;  389  2577 prs
;  390  2581 v
;  391  2583 istoken
;  392  2591 prnl
;  393  2596 prs
;  394  2600 prs
;  395  2604 prs
;  396  2608 prs
;  397  2612 prunsign1
;  398  2622 typeName
;  399  2631 searchname
;  400  2642 istoken
;  401  2650 searchname
;  402  2661 expect
;  403  2668 expect
;  404  2675 gettypes
;  405  2684 error1
;  406  2691 eqstr
;  407  2697 dovar1
;  408  2704 eqstr
;  409  2710 doreg
;  410  2716 eqstr
;  411  2722 doreg
;  412  2728 eqstr
;  413  2734 doreg
;  414  2740 eqstr
;  415  2746 doreg
;  416  2752 eqstr
;  417  2758 doreg
;  418  2764 eqstr
;  419  2770 doreg
;  420  2776 eqstr
;  421  2782 doreg
;  422  2788 eqstr
;  423  2794 doreg
;  424  2800 eqstr
;  425  2806 doreg
;  426  2812 eqstr
;  427  2818 doreg
;  428  2824 eqstr
;  429  2830 doreg
;  430  2836 eqstr
;  431  2842 doreg
;  432  2848 eqstr
;  433  2854 doreg
;  434  2860 eqstr
;  435  2866 doreg
;  436  2872 eqstr
;  437  2878 doreg
;  438  2884 expect
;  439  2891 prs
;  440  2895 prs
;  441  2899 prs
;  442  2903 istoken
;  443  2911 prunsign1
;  444  2921 istoken
;  445  2929 searchname
;  446  2940 v
;  447  2942 error1
;  448  2949 gettypes
;  449  2958 prs
;  450  2962 v
;  451  2964 prs
;  452  2968 prs
;  453  2972 prs
;  454  2976 a
;  455  2978 prs
;  456  2982 prs
;  457  2986 prunsign1
;  458  2996 v
;  459  2998 prs
;  460  3002 prs
;  461  3006 printName
;  462  3016 prs
;  463  3020 prs
;  464  3024 prs
;  465  3028 prs
;  466  3032 v
;  467  3034 prs
;  468  3038 prs
;  469  3042 prs
;  470  3046 v
;  471  3048 prs
;  472  3052 prs
;  473  3056 prs
;  474  3060 v
;  475  3062 prs
;  476  3066 rterm
;  477  3072 istoken
;  478  3080 prs
;  479  3084 prunsign1
;  480  3094 prs
;  481  3098 error1
;  482  3105 istoken
;  483  3113 prs
;  484  3117 prunsign1
;  485  3127 prs
;  486  3131 prs
;  487  3135 typeName
;  488  3144 searchname
;  489  3155 error1
;  490  3162 gettypes
;  491  3171 error1
;  492  3178 error1
;  493  3185 prs
;  494  3189 v
;  495  3191 prs
;  496  3195 prs
;  497  3199 doidiv
;  498  3206 prs
;  499  3210 checknamelen
;  500  3223 strcpy
;  501  3230 storecall
;  502  3240 expect
;  503  3247 istoken
;  504  3255 error1
;  505  3262 istoken
;  506  3270 istoken
;  507  3278 eprs
;  508  3283 eprs
;  509  3288 eprc
;  510  3293 eprnum
;  511  3300 eprs
;  512  3305 eprc
;  513  3310 eprs
;  514  3315 eprc
;  515  3320 eprs
;  516  3325 istoken
;  517  3333 name1
;  518  3339 searchname
;  519  3350 istoken
;  520  3358 checkreg
;  521  3367 searchname
;  522  3378 error1
;  523  3385 istoken
;  524  3393 expect
;  525  3400 prs
;  526  3404 pint1
;  527  3410 prs
;  528  3414 prs
;  529  3418 prc
;  530  3422 pint1
;  531  3428 prs
;  532  3432 v
;  533  3434 prs
;  534  3438 gettypes
;  535  3447 prs
;  536  3451 v
;  537  3453 prs
;  538  3457 v
;  539  3459 prs
;  540  3463 prs
;  541  3467 printreg
;  542  3476 prs
;  543  3480 prs
;  544  3484 prs
;  545  3488 pint1
;  546  3494 getarg
;  547  3501 setblock
;  548  3510 error1
;  549  3517 allocmem
;  550  3526 error1
;  551  3533 getfirstchar
;  552  3546 parse
;  553  3552 checkcalls
;  554  3563 epilog
;  555  3570 fgets1
;  556  3577 cputs
;  557  3583 cputs
;  558  3589 readRL
;  559  3596 prnl
;  560  3601 strcpy
;  561  3608 instr2
;  562  3615 strcat1
;  563  3623 toupper
;  564  3631 strcpy
;  565  3638 strlen
;  566  3645 openR
;  567  3651 cputs
;  568  3657 cputs
;  569  3663 exitR
;  570  3669 creatR
;  571  3676 cputs
;  572  3682 cputs
;  573  3688 exitR
;  574  3694 prs
;  575  3698 prs
;  576  3702 prs
;  577  3706 pint1
;  578  3712 prs
;  579  3716 prs
;  580  3720 prs
;  581  3724 prs
;  582  3728 prs
;  583  3732 prs
;  584  3736 prs
;  585  3740 getlex
;  586  3747 istoken
;  587  3755 istoken
;  588  3763 dodefine
;  589  3772 istoken
;  590  3780 doinclude
;  591  3790 error1
;  592  3797 typeName
;  593  3806 dofunc
;  594  3813 doglob
;  595  3820 prs
;  596  3824 from_far
;  597  3833 adrF
;  598  3838 eqstr
;  599  3844 prs
;  600  3848 prs
;  601  3852 doar
;  602  3857 prs
;  603  3861 cputs
;  604  3867 cputs
;  605  3873 pint
;  606  3878 prs
;  607  3882 printint51
;  608  3893 openR
;  609  3899 cputs
;  610  3905 cputs
;  611  3911 exitR
;  612  3917 prs
;  613  3921 prs
;  614  3925 getfirstchar
;  615  3938 getfunctionhead
;  616  3954 from_far
;  617  3963 eqstr
;  618  3969 prs
;  619  3973 printint51
;  620  3984 prs
;  621  3988 prs
;  622  3992 dofunc
;  623  3999 prs
;  624  4003 checkcalls
;  625  4014 putch
;  626  4020 cputs
;  627  4026 error1
;  628  4033 getlex
;  629  4040 istoken
;  630  4048 getlex
;  631  4055 prs
;  632  4059 prs
;  633  4063 openR
;  634  4069 prs
;  635  4073 prs
;  636  4077 error1
;  637  4084 parse
;  638  4090 prs
;  639  4094 prs
;  640  4098 getfirstchar
;  641  4111 getlex
;  642  4118 eqstr
;  643  4124 getlex
;  644  4131 eqstr
;  645  4137 getlex
;  646  4144 prs
;  647  4148 strcpy
;  648  4155 prs
;  649  4159 error1
;  650  4166 getlex
;  651  4173 expect
;  652  4180 error1
;  653  4187 strlen
;  654  4194 error1
;  655  4201 adrofname
;  656  4211 strcpy
;  657  4218 expect
;  658  4225 istoken
;  659  4233 istoken
;  660  4241 stmt
;  661  4246 istoken
;  662  4254 doif
;  663  4259 istoken
;  664  4267 dodo
;  665  4272 istoken
;  666  4280 dowhile
;  667  4288 istoken
;  668  4296 prs
;  669  4300 name1
;  670  4306 prs
;  671  4310 expect
;  672  4317 prs
;  673  4321 next
;  674  4326 prc
;  675  4330 next
;  676  4335 getlex
;  677  4342 istoken
;  678  4350 prs
;  679  4354 next
;  680  4359 prc
;  681  4363 next
;  682  4368 getlex
;  683  4375 error1
;  684  4382 istoken
;  685  4390 prs
;  686  4394 expect
;  687  4401 prunsign1
;  688  4411 expect
;  689  4418 istoken
;  690  4426 doifcarry
;  691  4436 istoken
;  692  4444 doifzero
;  693  4453 istoken
;  694  4461 doemit
;  695  4468 istoken
;  696  4476 istoken
;  697  4484 exprstart
;  698  4494 prs
;  699  4498 expect
;  700  4505 prs
;  701  4509 prs
;  702  4513 prc
;  703  4517 expect
;  704  4524 expect
;  705  4531 exprstart
;  706  4541 expect
;  707  4548 prs
;  708  4552 getlex
;  709  4559 prunsign1
;  710  4569 getlex
;  711  4576 prc
;  712  4580 expect
;  713  4587 prs
;  714  4591 prs
;  715  4595 prs
;  716  4599 prs
;  717  4603 prs
;  718  4607 prunsign1
;  719  4617 prs
;  720  4621 prs
;  721  4625 prunsign1
;  722  4635 prs
;  723  4639 prs
;  724  4643 prs
;  725  4647 error1
;  726  4654 prs
;  727  4658 prs
;  728  4662 pint1
;  729  4668 prc
;  730  4672 prs
;  731  4676 prs
;  732  4680 pint1
;  733  4686 pexpr
;  734  4692 pint1
;  735  4698 stmt
;  736  4703 istoken
;  737  4711 prjump
;  738  4718 prlabel
;  739  4726 stmt
;  740  4731 prlabel
;  741  4739 prlabel
;  742  4747 prs
;  743  4751 prs
;  744  4755 pint1
;  745  4761 stmt
;  746  4766 prlabel
;  747  4774 prs
;  748  4778 prs
;  749  4782 pint1
;  750  4788 stmt
;  751  4793 prlabel
;  752  4801 prlabel
;  753  4809 stmt
;  754  4814 expect
;  755  4821 pexpr
;  756  4827 pint1
;  757  4833 prjump
;  758  4840 prlabel
;  759  4848 prlabel
;  760  4856 pexpr
;  761  4862 pint1
;  762  4868 stmt
;  763  4873 prjump
;  764  4880 prlabel
;  765  4888 getlex
;  766  4895 next
;  767  4900 next
;  768  4905 next
;  769  4910 next
;  770  4915 next
;  771  4920 next
;  772  4925 next
;  773  4930 next
;  774  4935 next
;  775  4940 next
;  776  4945 next
;  777  4950 next
;  778  4955 next
;  779  4960 next
;  780  4965 next
;  781  4970 instr1
;  782  4977 next
;  783  4982 getlex
;  784  4989 next
;  785  4994 next
;  786  4999 getlex
;  787  5006 getstring
;  788  5016 digit
;  789  5022 getdigit
;  790  5031 next
;  791  5036 next
;  792  5041 next
;  793  5046 letter
;  794  5053 strcpy
;  795  5060 letter
;  796  5067 next
;  797  5072 eqstr
;  798  5078 eqstr
;  799  5084 eqstr
;  800  5090 eqstr
;  801  5096 eqstr
;  802  5102 eqstr
;  803  5108 eqstr
;  804  5114 eqstr
;  805  5120 eqstr
;  806  5126 eqstr
;  807  5132 eqstr
;  808  5138 eqstr
;  809  5144 eqstr
;  810  5150 eqstr
;  811  5156 eqstr
;  812  5162 eqstr
;  813  5168 eqstr
;  814  5174 eqstr
;  815  5180 eqstr
;  816  5186 eqstr
;  817  5192 eqstr
;  818  5198 eqstr
;  819  5204 convertdefine
;  820  5218 strcpy
;  821  5225 error1
;  822  5232 adrofname
;  823  5242 eqstr
;  824  5248 next
;  825  5253 letter
;  826  5260 next
;  827  5265 digit
;  828  5271 next
;  829  5276 next
;  830  5281 next
;  831  5286 fgets1
;  832  5293 getlex
;  833  5300 istoken
;  834  5308 prs
;  835  5312 listproc
;  836  5321 prs
;  837  5325 pint1
;  838  5331 error1
;  839  5338 eprc
;  840  5343 writetty
;  841  5352 writetty
;  842  5361 fputcR
;  843  5368 prc
;  844  5372 prs
;  845  5376 prc
;  846  5380 eprc
;  847  5385 mkneg
;  848  5391 eprnum
;  849  5398 eprc
;  850  5403 prc
;  851  5407 mkneg
;  852  5413 pint1
;  853  5419 prc
;  854  5423 prunsign1
;  855  5433 prc
;  856  5437 prc
;  857  5441 prc
;  858  5445 prc
;  859  5449 prc
;  860  5453 prunsign1
;  861  5463 printinputline
;  862  5478 readR
;  863  5484 prs
;  864  5488 prunsign1
;  865  5498 prc
;  866  5502 prscomment
;  867  5513 fcloseR
;  868  5521 fcloseR
;  869  5529 exitR
;  870  5535 prnl
;  871  5540 prscomment
;  872  5551 prs
;  873  5555 prunsign1
;  874  5565 prs
;  875  5569 prs
;  876  5573 prs
;  877  5577 pint1
;  878  5583 prs
;  879  5587 prunsign1
;  880  5597 prs
;  881  5601 prc
;  882  5605 prs
;  883  5609 pint1
;  884  5615 prs
;  885  5619 prs
;  886  5623 end1
;  887  5628 prs
;  888  5632 prs
;  889  5636 prs
;  890  5640 prunsign1
;  891  5650 prs
;  892  5654 listvar
;  893  5662 prs
;  894  5666 printint51
;  895  5677 prc
;  896  5681 prs
;  897  5685 prs
;  898  5689 prs
;  899  5693 prs
;  900  5697 prs
;  901  5701 prs
;  902  5705 prs
;  903  5709 prs
;  904  5713 prs
;  905  5717 printint51
;  906  5728 printint51
;  907  5739 prs
;  908  5743 prs
;  909  5747 prc
;  910  5751 adrofname
;  911  5761 prs
;  912  5765 prc
;  913  5769 prunsign1
;  914  5779 prc
;  915  5783 prunsign1
;  916  5793 prc
;  917  5797 prs
;  918  5801 prc
;  919  5805 pint1
;  920  5811 prs
;  921  5815 calllisting
;  922  5827 prs
;  923  5831 printint51
;  924  5842 prc
;  925  5846 prs
;  926  5850 printint51
;  927  5861 prc
;  928  5865 from_far
;  929  5874 prs
;  930  5878 adrF
;  931  5883 from_far
;  932  5892 eqstr
;  933  5898 prs
;  934  5902 countcalls
;  935  5913 funclisting
;  936  5925 prs
;  937  5929 printint51
;  938  5940 printint51
;  939  5951 prs
;  940  5955 printint51
;  941  5966 prc
;  942  5970 prs
;  943  5974 prs
;  944  5978 prs
;  945  5982 prs
;  946  5986 prc
;  947  5990 prc
;  948  5994 adrF
;  949  5999 prs
;  950  6003 strcpy
;  951  6010 storefunc
;  952  6020 prs
;  953  6024 prs
;  954  6028 listvar
;  955  6036 listfunc
;  956  6045 listcall
;  957  6054 prs
;  958  6058 prs
;  959  6062 prs
;  960  6066 prs
;  961  6070 prs
;  962  6074 printint51
;  963  6085 prs
;  964  6089 printint51
;  965  6100 prs
;  966  6104 printint51
;  967  6115 prs
;  968  6119 printint51
;  969  6130 prs
;  970  6134 printint51
;  971  6145 prs
;  972  6149 printint51
;  973  6160 prs
;  974  6164 printint51
;  975  6175 prs
;  976  6179 printint51
;  977  6190 prs
;  978  6194 printint51
;  979  6205 prs
;  980  6209 printint51
;  981  6220 prs
;  982  6224 printint51
;  983  6235 prs
;  984  6239 printint51
;  985  6250 prs
;  986  6254 prs
;  987  6258 prunsign1
;  988  6268 prs
;  989  6272 printint51
;  990  6283 prs
;  991  6287 prs
;  992  6291 prs
;  993  6295 prs
;  994  6299 printint51
;  995  6310 prs
;  996  6314 printint51
;  997  6325 prs
;  998  6329 printint51
;  999  6340 prs
; 1000  6344 end1
; 1001  6349 DosInt
; 1002  6356 DosInt
; 1003  6363 writetty
; 1004  6372 writetty
; 1005  6381 putch
; 1006  6387 prc
; 1007  6391 mkneg
; 1008  6397 pint
; 1009  6402 putch
; 1010  6408 digit
; 1011  6414 strcpy
; 1012  6421 DosInt
; 1013  6428 DosInt
; 1014  6435 DosInt
; 1015  6442 DosInt
; 1016  6449 DosInt
;Input: A.C, List: A.S,  Lines: 1022
;Glob. variables:  139 max.:  200
;Functions      :  114 max.:  300
;Calls          : 1017 max.: 2000, NameField: 6456 max.:    65535
;Code until     :22953 max.: 30000, free: 7047
;Data (HeapEnd) :53548, resting stacksize: 11987
;Max. Const in 'epilog' :  947 max. 3000, free: 2053