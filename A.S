
; A.COM CComp V0.9, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
org  256 ; NASM ON
jmp main

;-1 //  @@ret redefined 2011.04.25 23.644 bytes, Full  Working 2017.09.13


;-2 char Version1[]="A.COM CComp V0.9";

Version1 db "A.COM CComp V0.9",0

;-3 #define ARCHIVE "AR.C"

;Use archive file: AR.C

;-4   char NASM=1;  

NASM db 1

;-5 #define LSTART        200


;-6 #define VARMAX        300


;-7 #define GNAMEMAX     4800 // 16*VARMAX


;-8 #define FUNCMAX       300


;-9 #define FNAMEMAX     4800 // 16*FUNCMAX


;-10 #define CALLMAX      2000


;-11 #define IDLENMAX       15


;-12 #define _                 // Konstantvergleich


;-13 #define T_NAME        256


;-14 #define T_CONST       257 


;-15 #define T_STRING      258     


;-16 #define T_INCLUDE     510     


;-17 #define T_DEFINE      511  


;-18 #define T_RETURN      512


;-19 #define T_IF          513      


;-20 #define T_ELSE        514  


;-21 #define T_WHILE       515      


;-22 #define T_DO          516


;-23 #define T_INT         517     


;-24 #define T_ASM         518   


;-25 #define T_ASMBLOCK    519   


;-26 #define T_EMIT        520


;-27 #define T_GOTO        521    


;-28 #define T_VOID        529  


;-29 #define T_CHAR        530       


;-30 #define T_SIGNED      531


;-31 #define T_UNSIGNED    532


;-32 #define T_LONG        533


;-33 #define T_SHORT       534


;-34 //T_INT8 540   T_UINT8 541   T_INT16 542   T_UINT16 543   T_INT32 544


;-35 #define T_UINT32      545


;-36 //T_INT64 546   T_UINT64 547


;-37 #define T_INTH        600


;-38 #define T_IFCARRY     601


;-39 #define T_IFZERO      602


;-40 #define T_EQ          806


;-41 #define T_NE          807


;-42 #define T_GE          811


;-43 #define T_LE          824


;-44 #define T_PLUSPLUS   1219


;-45 #define T_MINUSMINUS 1225


;-46 #define T_PLUSASS    1230


;-47 #define T_MINUSASS   1231


;-48 #define T_MULASS     1232


;-49 #define T_DIVASS     1233


;-50 #define T_ANDASS     1234


;-51 #define T_ORASS      1235


;-52 #define T_LESSLESS   1240


;-53 #define T_GREATGREAT 1241


;-54 #define COMAX        3000


;-55 #define CMDLENMAX      67


;-56 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;

ORGDATAORIG dw 30000
orgData dw 30000

;-57 char co[COMAX];    int maxco=0;      int maxco1=0;

section .bss
absolute 30000
co resb 3000
section .text
maxco dw 0
maxco1 dw 0

;-58 char coname[CMDLENMAX];              char *cloc=0;

section .bss
absolute 33000
coname resb 67
section .text
cloc dw 0

;-59 int fdin=0;        int fdout=0;      char symbol[128];

fdin dw 0
fdout dw 0
section .bss
absolute 33067
symbol resb 128
section .text

;-60 char fname[CMDLENMAX];               char namein[CMDLENMAX];

section .bss
absolute 33195
fname resb 67
section .text
section .bss
absolute 33262
namein resb 67
section .text

;-61 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];

section .bss
absolute 33329
namelst resb 67
section .text
section .bss
absolute 33396
archivename resb 67
section .text

;-62 int token=0;       char globC=0;     int spalte=0;

token dw 0
globC db 0
spalte dw 0

;-63 char thechar=0;    int iscmp=0;      int nconst=0;

thechar db 0
iscmp dw 0
nconst dw 0

;-64 int nreturn=0;     int nlabel=0;     int callrecursive=0;

nreturn dw 0
nlabel dw 0
callrecursive dw 0

;-65 int GTop=1;        int LTop=150;

GTop dw 1
LTop dw 150

;-66 unsigned int lexval=0;

lexval dw 0

;-67 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#

typei dw 0
istype db 0
section .bss
absolute 33463
GType resb 300
section .text

;-68 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S

signi dw 0
issign db 0
section .bss
absolute 33763
GSign resb 300
section .text

;-69 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4

widthi dw 0
iswidth db 0
section .bss
absolute 34063
GWidth resb 300
section .text

;-70              int GAdr[VARMAX]; int  GUsed [VARMAX];

section .bss
absolute 34363
GAdr resw 300
section .text
section .bss
absolute 34963
GUsed resw 300
section .text

;-71 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];

wi dw 0
section .bss
absolute 35563
GData resw 300
section .text
section .bss
absolute 36163
GNameField resb 4800
section .text

;-72 int  FTop=0;                 int  CTop=0;

FTop dw 0
CTop dw 0

;-73 char FType [FUNCMAX];        char CType[CALLMAX];

section .bss
absolute 40963
FType resb 300
section .text
section .bss
absolute 41263
CType resb 2000
section .text

;-74 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];

section .bss
absolute 43263
FAdr resw 300
section .text
section .bss
absolute 43863
CAdr resw 2000
section .text

;-75 int  FCalls[FUNCMAX];

section .bss
absolute 47863
FCalls resw 300
section .text

;-76 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];

section .bss
absolute 48463
FNameField resb 4800
section .text

;-77 char NameA[]="12345678901234567890123456789012"; //must be in low memory

NameA db "12345678901234567890123456789012",0

;-78 char fgetsdest[128];         unsigned char *CNameTop=0;

section .bss
absolute 53263
fgetsdest resb 128
section .text
CNameTop dw 0

;-79 unsigned char *fgetsp=0;     unsigned int segE;

fgetsp dw 0
segE dw 0

;-80 unsigned int lineno=1;       unsigned int linenoinclude=1;

lineno dw 1
linenoinclude dw 1

;-81 unsigned char *pt=0;         unsigned char *p1=0;

pt dw 0
p1 dw 0

;-82 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;

DOS_ERR dw 0
DOS_NoBytes dw 0
DOS_ByteRead db 0

;-83 


;-84 int tt1=7; int tt2; long ex;

tt1 dw 7
tt2 dw 0
ex dd 0

;-85 void ttt(long par1) {


ttt:  ; *** PROC ***

;-86   int i1; long in; int i9;


;-87   ttt(in, ex );

;Function : ttt, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign dwrd    85 NULL par1 = bp+4
;  201 var sign word    86 NULL i1 = bp-2
;  202 var sign dwrd    86 NULL in = bp-6
;  203 var sign word    86 NULL i9 = bp-8;
 ENTER  8,0
 mov al, byte [ex]
 mov ah, 0
 push ax
 mov al, byte [bp-6]
 mov ah, 0
 push ax
 call ttt
 add  sp, 4

;-88  si = &FTop;  si=FTop;

 mov  si, FTop
 mov  si, [FTop]

;-89  si= &FAdr;     si=FAdr;

 mov  si, FAdr
 mov  si, [FAdr]

;-90  &FTop;         FTop;

 mov ax, FTop
 mov ax, [FTop]

;-91   }


;-92 int a(unsigned int i) { if(NASM == 0) prs("offset "); printName(i);}//address
 LEAVE
 ret
; ENDP

a:  ; *** PROC ***
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word    92 NULL i = bp+4;
 ENTER  0,0
 mov al, [NASM]
 cmp al, 0
 jne @@a1
 push a_0
 call prs
 add  sp, 2
@@a1:
 push word [bp+4]
 call printName
 add  sp, 2

;-93 int v(unsigned int i) { if(NASM) { if (i < LSTART) prc('['); }
 LEAVE
 ret
; ENDP
a_0 db "offset ",0

v:  ; *** PROC ***
;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word    93 NULL i = bp+4;
 ENTER  0,0
 mov al, [NASM]
 or  al, al
 je @@v2
 mov ax, [bp+4]
 cmp ax, 200
 jge @@v3
 push 91
 call prc
 add  sp, 2
@@v3:

;-94   printName(i); if(NASM) { if (i < LSTART) prc(']'); }   }//value

@@v2:
 push word [bp+4]
 call printName
 add  sp, 2
 mov al, [NASM]
 or  al, al
 je @@v4
 mov ax, [bp+4]
 cmp ax, 200
 jge @@v5
 push 93
 call prc
 add  sp, 2
@@v5:
@@v4:

;-95 int checknamelen() { int i;    i=strlen(symbol);
 LEAVE
 ret
; ENDP

checknamelen:  ; *** PROC ***
;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word    95 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-96   if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle @@checknamelen6
 push checknamelen_0
 call error1
 add  sp, 2

;-97 }

@@checknamelen6:

;-98 char doglobName[IDLENMAX];
 LEAVE
 ret
; ENDP
checknamelen_0 db "Item name is too long in characters)",0
section .bss
absolute 53391
doglobName resb 15
section .text

;-99 int doglob() { int i; int j; int isstrarr; isstrarr=0;


doglob:  ; *** PROC ***
;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word    99 NULL i = bp-2
;  201 var sign word    99 NULL j = bp-4
;  202 var sign word    99 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-100   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  @@doglob7
 push doglob_0
 call error1
 add  sp, 2

;-101   if (iswidth == 0) error1("no VOID as var type");

@@doglob7:
 mov al, [iswidth]
 cmp al, 0
 jne @@doglob8
 push doglob_1
 call error1
 add  sp, 2

;-102   checknamelen();

@@doglob8:
 call checknamelen

;-103   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  @@doglob9
 push doglob_2
 call error1
 add  sp, 2

;-104   if (istoken('[')) { istype='&';

@@doglob9:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob10
 mov ax, 38
 mov byte [istype], al

;-105     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob11

;-106       if (NASM) {prs("\nsection .bss\nabsolute ");

 mov al, [NASM]
 or  al, al
 je @@doglob12
 push doglob_3
 call prs
 add  sp, 2

;-107         prunsign1(orgData); }

 push word [orgData]
 call prunsign1
 add  sp, 2

;-108         else {prs("\nAData = $\norg "); prunsign1(orgData);} 

 jmp @@doglob13
@@doglob12:
 push doglob_4
 call prs
 add  sp, 2
 push word [orgData]
 call prunsign1
 add  sp, 2

;-109       prs("\n"); prs(symbol); 

@@doglob13:
 push doglob_5
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-110       if      (iswidth==1) {if (NASM) prs(" resb "); else prs(" db ");}

 mov al, [iswidth]
 cmp al, 1
 jne @@doglob14
 mov al, [NASM]
 or  al, al
 je @@doglob15
 push doglob_6
 call prs
 add  sp, 2
 jmp @@doglob16
@@doglob15:
 push doglob_7
 call prs
 add  sp, 2
@@doglob16:

;-111       else if (iswidth==2) {if (NASM) prs(" resw "); else prs(" dw ");}

 jmp @@doglob17
@@doglob14:
 mov al, [iswidth]
 cmp al, 2
 jne @@doglob18
 mov al, [NASM]
 or  al, al
 je @@doglob19
 push doglob_8
 call prs
 add  sp, 2
 jmp @@doglob20
@@doglob19:
 push doglob_9
 call prs
 add  sp, 2
@@doglob20:

;-112       else                 {if (NASM) prs(" resd "); else prs(" dd ");}

 jmp @@doglob21
@@doglob18:
 mov al, [NASM]
 or  al, al
 je @@doglob22
 push doglob_10
 call prs
 add  sp, 2
 jmp @@doglob23
@@doglob22:
 push doglob_11
 call prs
 add  sp, 2
@@doglob23:

;-113       prunsign1(lexval); if (NASM==0)prs(" dup (?)");

@@doglob21:
@@doglob17:
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@doglob24
 push doglob_12
 call prs
 add  sp, 2

;-114       if(NASM) prs("\nsection .text");

@@doglob24:
 mov al, [NASM]
 or  al, al
 je @@doglob25
 push doglob_13
 call prs
 add  sp, 2

;-115         else prs("\norg AData"); 

 jmp @@doglob26
@@doglob25:
 push doglob_14
 call prs
 add  sp, 2

;-116       orgData=orgData+lexval;

@@doglob26:
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-117       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne @@doglob27
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-118       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

@@doglob27:
 mov al, [iswidth]
 cmp al, 4
 jne @@doglob28
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-119       GData[GTop]=lexval; expect(']');

@@doglob28:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-120     }else { expect(']');

 jmp @@doglob29
@@doglob11:
 push 93
 call expect
 add  sp, 2

;-121       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  @@doglob30
 push doglob_15
 call error1
 add  sp, 2

;-122       prs("\n"); prs(symbol); prs(" db "); 

@@doglob30:
 push doglob_16
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 push doglob_17
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
 je @@doglob31

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
 push doglob_18
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

 jmp @@doglob32
@@doglob31:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob33
 mov ax, 0
 mov [bp-2], ax

;-129         do { if(i) prc(','); 

@@doglob34:
 mov ax, [bp-2]
 or  al, al
 je @@doglob35
 push 44
 call prc
 add  sp, 2

;-130           expect(T_CONST); prunsign1(lexval); i=1; }

@@doglob35:
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
 je @@doglob36
 jmp @@doglob34
@@doglob36:
 push 125
 call expect
 add  sp, 2

;-132       else error1("String or number array expected");

 jmp @@doglob37
@@doglob33:
 push doglob_19
 call error1
 add  sp, 2

;-133       }; 

@@doglob37:
@@doglob32:
@@doglob29:

;-134   }else { //expect('=');

 jmp @@doglob38
@@doglob10:

;-135     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_20
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne @@doglob39
 push doglob_21
 call prs
 add  sp, 2

;-136     else {

 jmp @@doglob40
@@doglob39:

;-137       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne @@doglob41
 push doglob_22
 call prs
 add  sp, 2

;-138       else if (iswidth==2) prs(" dw ");

 jmp @@doglob42
@@doglob41:
 mov al, [iswidth]
 cmp al, 2
 jne @@doglob43
 push doglob_23
 call prs
 add  sp, 2

;-139       else                 prs(" dd ");

 jmp @@doglob44
@@doglob43:
 push doglob_24
 call prs
 add  sp, 2

;-140     }

@@doglob44:
@@doglob42:

;-141     if(istoken('-')) prc('-');

@@doglob40:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob45
 push 45
 call prc
 add  sp, 2

;-142     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

@@doglob45:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob46
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-143     else prunsign1(0); }

 jmp @@doglob47
@@doglob46:
 push 0
 call prunsign1
 add  sp, 2
@@doglob47:

;-144   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

@@doglob38:
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
 je @@doglob48
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp @@doglob49
@@doglob48:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-148   GTop++; expect(';'); }

@@doglob49:
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
doglob_4 db "\nAData = $\norg ",0
doglob_5 db "\n",0
doglob_6 db " resb ",0
doglob_7 db " db ",0
doglob_8 db " resw ",0
doglob_9 db " dw ",0
doglob_10 db " resd ",0
doglob_11 db " dd ",0
doglob_12 db " dup (?)",0
doglob_13 db "\nsection .text",0
doglob_14 db "\norg AData",0
doglob_15 db "Only ByteArray allowed",0
doglob_16 db "\n",0
doglob_17 db " db ",0
doglob_18 db ",0",0
doglob_19 db "String or number array expected",0
doglob_20 db "\n",0
doglob_21 db " dw ",0
doglob_22 db " db ",0
doglob_23 db " dw ",0
doglob_24 db " dd ",0

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
 jne @@gettypes50
 mov ax, 1
 mov word [signi], ax
 jmp @@gettypes51
@@gettypes50:
 mov ax, 0
 mov word [signi], ax

;-152   c=GWidth[i]; widthi=0;wi=0;

@@gettypes51:
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
 jne @@gettypes52
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-154   if (c==2) {widthi=2;wi=2;}

@@gettypes52:
 mov al, [bp-4]
 cmp al, 2
 jne @@gettypes53
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-155   if (c==4) {widthi=4;wi=4;}

@@gettypes53:
 mov al, [bp-4]
 cmp al, 4
 jne @@gettypes54
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-156   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

@@gettypes54:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne @@gettypes55
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-157   if (c=='&')  typei=2;  

@@gettypes55:
 mov al, [bp-4]
 cmp al, 38
 jne @@gettypes56
 mov ax, 2
 mov word [typei], ax

;-158   return i; }  

@@gettypes56:
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
 jge @@printName57
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-164   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp @@printName58
@@printName57:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle @@printName59
 push 43
 call prc
 add  sp, 2
@@printName59:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-165 }

@@printName58:

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
 jne @@searchname60
 push searchname_0
 call error1
 add  sp, 2

;-168   GUsed[i]=GUsed[i] + 1; return i;

@@searchname60:
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
@@checkName61:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge @@checkName62
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
 je @@checkName63
 mov ax, [bp-2]
 jmp @@retn
@@checkName63:
 inc  word[bp-2]

;-172   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp @@checkName61
@@checkName62:
 mov ax, 1
 mov [bp-2], ax
@@checkName64:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@checkName65
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
 je @@checkName66
 mov ax, [bp-2]
 jmp @@retn
@@checkName66:
 inc  word[bp-2]

;-173   return 0;

 jmp @@checkName64
@@checkName65:
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
 je @@typeName67
 mov ax, 83
 mov byte [issign], al
@@typeName67:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName68
 mov ax, 85
 mov byte [issign], al

;-178   iswidth=2;                           if(istoken(T_VOID))     iswidth=0;

@@typeName68:
 mov ax, 2
 mov byte [iswidth], al
 push 529
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName69
 mov ax, 0
 mov byte [iswidth], al

;-179   if(istoken(T_CHAR))     iswidth=1;   if(istoken(T_INT))      iswidth=2;

@@typeName69:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName70
 mov ax, 1
 mov byte [iswidth], al
@@typeName70:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName71
 mov ax, 2
 mov byte [iswidth], al

;-180   if(istoken(T_SHORT))    iswidth=2;   if(istoken(T_LONG))     iswidth=4;

@@typeName71:
 push 534
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName72
 mov ax, 2
 mov byte [iswidth], al
@@typeName72:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName73
 mov ax, 4
 mov byte [iswidth], al

;-181   if(istoken(T_UINT32)) { iswidth=4; issign='U'; }

@@typeName73:
 push 545
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName74
 mov ax, 4
 mov byte [iswidth], al
 mov ax, 85
 mov byte [issign], al

;-182   istype='V'; m=0;

@@typeName74:
 mov ax, 86
 mov byte [istype], al
 mov ax, 0
 mov [bp-2], ax

;-183   if(istoken('*'))  { istype='*'; m=1; } if(istoken('&'))  {istype='&'; m=2;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName75
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
@@typeName75:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName76
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-184   name1(); return m; }

@@typeName76:
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
 je  @@name177
 push name1_0
 call error1
 add  sp, 2
@@name177:
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
 jl  @@storecall78
 push storecall_0
 call error1
 add  sp, 2

;-188   if (CNameTop >= 65468) error1("Call name table fuill");

@@storecall78:
 mov ax, [CNameTop]
 cmp ax, 65468 ;unsigned : 0
 jb  @@storecall79
 push storecall_1
 call error1
 add  sp, 2

;-189     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

@@storecall79:
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
 jl  @@storefunc80
 push storefunc_0
 call error1
 add  sp, 2

;-194     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

@@storefunc80:
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
 jl  @@addlocal81
 push addlocal_0
 call error1
 add  sp, 2

;-198   if (checkName() != 0) error1("Variable already defined");

@@addlocal81:
 call checkName
 cmp ax, 0
 je  @@addlocal82
 push addlocal_1
 call error1
 add  sp, 2

;-199   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

@@addlocal82:
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

@@checkFunction83:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@checkFunction84
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
 je @@checkFunction85
 mov ax, [bp-2]
 jmp @@retn
@@checkFunction85:
 inc  word[bp-2]

;-205   return 0; }

 jmp @@checkFunction83
@@checkFunction84:
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
 je @@dofunc86
 push dofunc_0
 call error1
 add  sp, 2

;-211   storefunc();

@@dofunc86:
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
 jne @@dofunc87
 mov ax, 2
 mov [bp-6], ax

;-215     do { typeName();  addlocal(); narg+=2;

@@dofunc88:
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
 jne @@dofunc89
 add  word[bp-6], 2
@@dofunc89:
 inc  word[LTop]

;-217     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc90
 jmp @@dofunc88
@@dofunc90:
 push 41
 call expect
 add  sp, 2

;-218     


;-219   expect('{'); /*body*/

@@dofunc87:
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

@@dofunc91:
 call isvariable
 or  al, al
 je @@dofunc92

;-222     do {typeName();

@@dofunc93:
 call typeName

;-223         checknamelen();

 call checknamelen

;-224         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-225         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne @@dofunc94
 sub  word[bp-2], 2

;-226         GData[LTop]=nloc;

@@dofunc94:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-227         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc95
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

@@dofunc95:
 inc  word[LTop]

;-230       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc96
 jmp @@dofunc93
@@dofunc96:
 push 59
 call expect
 add  sp, 2

;-231   listproc(); 

 jmp @@dofunc91
@@dofunc92:
 call listproc

;-232   if (LTop>LSTART){prs(";\n ENTER  "); 

 mov ax, [LTop]
 cmp ax, 200
 jle @@dofunc97
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

@@dofunc97:
@@dofunc98:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@dofunc99
 call stmt

;-235   if (nreturn) { prs("\n@@retn:");}

 jmp @@dofunc98
@@dofunc99:
 mov ax, [nreturn]
 or  al, al
 je @@dofunc100
 push dofunc_5
 call prs
 add  sp, 2

;-236   if (LTop > LSTART) prs(" LEAVE");

@@dofunc100:
 mov ax, [LTop]
 cmp ax, 200
 jle @@dofunc101
 push dofunc_6
 call prs
 add  sp, 2

;-237   prs("\n ret"); prs("\n; ENDP"); 

@@dofunc101:
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
 jle @@dofunc102
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-240 }

@@dofunc102:

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
 jne @@isvariable103
 jmp @@v1
@@isvariable103:
 mov ax, [token]
 cmp ax, 532
 jne @@isvariable104
 jmp @@v1

;-243   if(token==T_CHAR)   goto v1;   if(token==T_INT)      goto v1;

@@isvariable104:
 mov ax, [token]
 cmp ax, 530
 jne @@isvariable105
 jmp @@v1
@@isvariable105:
 mov ax, [token]
 cmp ax, 517
 jne @@isvariable106
 jmp @@v1

;-244   if(token==T_SHORT)  goto v1;   if(token==T_LONG)     goto v1;

@@isvariable106:
 mov ax, [token]
 cmp ax, 534
 jne @@isvariable107
 jmp @@v1
@@isvariable107:
 mov ax, [token]
 cmp ax, 533
 jne @@isvariable108
 jmp @@v1

;-245   if(token==T_UINT32) goto v1;   return 0;  v1: return 1;

@@isvariable108:
 mov ax, [token]
 cmp ax, 545
 jne @@isvariable109
 jmp @@v1
@@isvariable109:
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
 jne @@pexpr110
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@pexpr111
 call constantexpr
 jmp @@retn

;-253     ireg1=checkreg();

@@pexpr111:
 call checkreg
 mov word [ireg1], ax

;-254     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je @@pexpr112
 push 1
 call doreg1
 add  sp, 2
 jmp @@retn
@@pexpr112:

;-255   exprstart(); if (iscmp==0) prs("\n or  al, al\n je @@");  prs(fname);

@@pexpr110:
 call exprstart
 mov ax, [iscmp]
 cmp ax, 0
 jne @@pexpr113
 push pexpr_1
 call prs
 add  sp, 2
@@pexpr113:
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
 jne @@constantexpr114
 push constantexpr_0
 call error1
 add  sp, 2

;-262   expect(T_CONST);  prs(" ; constant expression");

@@constantexpr114:
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
 jne @@constantexpr115
 push constantexpr_3
 call prs
 add  sp, 2
 jmp @@constantexpr116
@@constantexpr115:
 push constantexpr_4
 call prs
 add  sp, 2

;-265   if (NASM==0) prs(" ptr ");

@@constantexpr116:
 mov al, [NASM]
 cmp al, 0
 jne @@constantexpr117
 push constantexpr_5
 call prs
 add  sp, 2

;-266   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

@@constantexpr117:
 push word [bp-4]
 call v
 add  sp, 2
 push constantexpr_6
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

;-267   expect(')');

 push 41
 call expect
 add  sp, 2

;-268 }  


;-269 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
 LEAVE
 ret
; ENDP
constantexpr_0 db "Relational expression expected",0
constantexpr_1 db " ; constant expression",0
constantexpr_2 db "\ncmp ",0
constantexpr_3 db "word",0
constantexpr_4 db "byte",0
constantexpr_5 db " ptr ",0
constantexpr_6 db ", ",0

exprstart:  ; *** PROC ***
 push exprstart_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@exprstart118
 push 0
 call expr2
 add  sp, 2
 jmp @@exprstart119
@@exprstart118:
 push 0
 call expr
 add  sp, 2
@@exprstart119:

;-270 


;-271 int expr2(int kind) {  int i;

 ret
; ENDP
exprstart_0 db "_",0

expr2:  ; *** PROC ***

;-272   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   271 NULL kind = bp+4
;  201 var sign word   271 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  @@expr2120
 call getlex
 mov word [token], ax

;-273   mod1=typeName();

@@expr2120:
 call typeName
 mov word [mod1], ax

;-274   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je @@expr2121
 push expr2_0
 call error1
 add  sp, 2

;-275   ireg1=checkreg();

@@expr2121:
 call checkreg
 mov word [ireg1], ax

;-276   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je @@expr2122
 push 0
 call doreg1
 add  sp, 2
 jmp @@retn

;-277   if (ireg1 == 0) { idx1=searchname();

@@expr2122:
 mov ax, [ireg1]
 cmp ax, 0
 jne @@expr2123
 call searchname
 mov word [idx1], ax

;-278     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-279     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je @@expr2124
 push expr2_1
 call error1
 add  sp, 2
@@expr2124:

;-280   


;-281   if (isrelational()) { error1("Vergleich noch nicht implementiert");

@@expr2123:
 call isrelational
 or  al, al
 je @@expr2125
 push expr2_2
 call error1
 add  sp, 2

;-282   }


;-283   if (istoken('=') == 0) error1("Assign expected");

@@expr2125:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@expr2126
 push expr2_3
 call error1
 add  sp, 2

;-284   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

@@expr2126:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr2127
 mov ax, [lexval]
 mov word [val2], ax
 push expr2_4
 call prs
 add  sp, 2

;-285     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-286     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne @@expr2128
 push expr2_6
 call prs
 add  sp, 2

;-287     if (idw1 == 2) prs("word ");

@@expr2128:
 mov ax, [idw1]
 cmp ax, 2
 jne @@expr2129
 push expr2_7
 call prs
 add  sp, 2

;-288     if (idw1 == 4) prs("dword ");

@@expr2129:
 mov ax, [idw1]
 cmp ax, 4
 jne @@expr2130
 push expr2_8
 call prs
 add  sp, 2

;-289     if (NASM == 0) prs("ptr ");

@@expr2130:
 mov al, [NASM]
 cmp al, 0
 jne @@expr2131
 push expr2_9
 call prs
 add  sp, 2

;-290     v(idx1);

@@expr2131:
 push word [idx1]
 call v
 add  sp, 2

;-291     prs(", "); prunsign1(val2);

 push expr2_10
 call prs
 add  sp, 2
 push word [val2]
 call prunsign1
 add  sp, 2

;-292     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

 mov ax, [idx1]
 cmp ax, 200 ;unsigned : 1
 jl  @@expr2132
 push word [idx1]
 call adrofname
 add  sp, 2
 mov [bp-2], ax
 push expr2_11
 call prs
 add  sp, 2
 push word [bp-2]
 call prs
 add  sp, 2
@@expr2132:
 jmp @@retn

;-293   


;-294   mod1=typeName(); ireg2=checkreg();

@@expr2127:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-295   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je @@expr2133
 push expr2_12
 call prs
 add  sp, 2

;-296     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}

 mov ax, [ireg1]
 or  al, al
 je @@expr2134
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp @@expr2135
@@expr2134:
 push word [idx1]
 call v
 add  sp, 2
@@expr2135:
 push expr2_13
 call prs
 add  sp, 2
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp @@retn

;-297   else {

 jmp @@expr2136
@@expr2133:

;-298     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne @@expr2137
 push expr2_14
 call error1
 add  sp, 2

;-299     


;-300     idx2=searchname();

@@expr2137:
 call searchname
 mov word [idx2], ax

;-301     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-302     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne @@expr2138
 push expr2_15
 call error1
 add  sp, 2

;-303     prs("\nmov ");

@@expr2138:
 push expr2_16
 call prs
 add  sp, 2

;-304     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");

 mov ax, [ireg1]
 or  al, al
 je @@expr2139
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp @@expr2140
@@expr2139:
 push expr2_17
 call error1
 add  sp, 2

;-305     prs(", ");

@@expr2140:
 push expr2_18
 call prs
 add  sp, 2

;-306     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne @@expr2141
 push word [idx2]
 call a
 add  sp, 2

;-307     else {

 jmp @@expr2142
@@expr2141:

;-308       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne @@expr2143
 push expr2_19
 call prs
 add  sp, 2

;-309       if (idw2 == 2) prs("word ");

@@expr2143:
 mov ax, [idw2]
 cmp ax, 2
 jne @@expr2144
 push expr2_20
 call prs
 add  sp, 2

;-310       if (idw2 == 4) prs("dword ");

@@expr2144:
 mov ax, [idw2]
 cmp ax, 4
 jne @@expr2145
 push expr2_21
 call prs
 add  sp, 2

;-311       if (NASM == 0) prs("ptr ");

@@expr2145:
 mov al, [NASM]
 cmp al, 0
 jne @@expr2146
 push expr2_22
 call prs
 add  sp, 2

;-312       v(idx2);

@@expr2146:
 push word [idx2]
 call v
 add  sp, 2

;-313       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

 mov ax, [idx2]
 cmp ax, 200 ;unsigned : 1
 jl  @@expr2147
 push word [idx2]
 call adrofname
 add  sp, 2
 mov [bp-2], ax
 push expr2_23
 call prs
 add  sp, 2
 push word [bp-2]
 call prs
 add  sp, 2
@@expr2147:

;-314     return;

@@expr2142:
 jmp @@retn

;-315   } error1("Internal error: only const or reg allowed");

@@expr2136:
 push expr2_24
 call error1
 add  sp, 2

;-316 }


;-317 char ops[5];

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
expr2_9 db "ptr ",0
expr2_10 db ", ",0
expr2_11 db "; ",0
expr2_12 db "\nmov ",0
expr2_13 db ", ",0
expr2_14 db "Noch kein * im Text erlaubt",0
expr2_15 db "Noch kein Array rechts erlaubt",0
expr2_16 db "\nmov ",0
expr2_17 db "Mem to Mem not allowed by x86-CPU",0
expr2_18 db ", ",0
expr2_19 db "byte ",0
expr2_20 db "word ",0
expr2_21 db "dword ",0
expr2_22 db "ptr ",0
expr2_23 db "; ",0
expr2_24 db "Internal error: only const or reg allowed",0
section .bss
absolute 53406
ops resb 5
section .text

;-318 int doreg1(int iscmp1) { int i;


doreg1:  ; *** PROC ***

;-319   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   318 NULL iscmp1 = bp+4
;  201 var sign word   318 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1148
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-320   if (istoken(T_PLUSASS))    strcpy(ops, "add");

@@doreg1148:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1149
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-321   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

@@doreg1149:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1150
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-322   if (istoken(T_ANDASS))     strcpy(ops, "and");

@@doreg1150:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1151
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-323   if (istoken(T_ORASS))      strcpy(ops, "or" );

@@doreg1151:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1152
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-324   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

@@doreg1152:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1153
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-325   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

@@doreg1153:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1154
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-326   if (iscmp1 == 1) { token=getlex();

@@doreg1154:
 mov ax, [bp+4]
 cmp ax, 1
 jne @@doreg1155
 call getlex
 mov word [token], ax

;-327       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne @@doreg1156
 push doreg1_7
 call error1
 add  sp, 2

;-328       strcpy(ops, "cmp"); }

@@doreg1156:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-329   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

@@doreg1155:
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

;-330 


;-331   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1157
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp @@reg1

;-332   mod2=typeName(); ireg2=checkreg();

@@doreg1157:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-333   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je @@doreg1158
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp @@reg1

;-334   i=searchname();  if (mod2 == 2) a(i); else v(i);

@@doreg1158:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne @@doreg1159
 push word [bp-2]
 call a
 add  sp, 2
 jmp @@doreg1160
@@doreg1159:
 push word [bp-2]
 call v
 add  sp, 2

;-335   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

@@doreg1160:
@@reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne @@doreg1161
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

;-336 }

@@doreg1161:

;-337 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

;-338   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge @@checkreg162
 mov ax, 0
 jmp @@retn

;-339   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

@@checkreg162:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg163
 mov ax, 1
 jmp @@retn
@@checkreg163:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg164
 mov ax, 3
 jmp @@retn

;-340   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

@@checkreg164:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg165
 mov ax, 5
 jmp @@retn
@@checkreg165:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg166
 mov ax, 7
 jmp @@retn

;-341   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

@@checkreg166:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg167
 mov ax, 9
 jmp @@retn
@@checkreg167:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg168
 mov ax, 11
 jmp @@retn

;-342   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

@@checkreg168:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg169
 mov ax, 13
 jmp @@retn
@@checkreg169:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg170
 mov ax, 15
 jmp @@retn

;-343   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

@@checkreg170:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg171
 mov ax, 17
 jmp @@retn
@@checkreg171:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg172
 mov ax, 19
 jmp @@retn

;-344   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

@@checkreg172:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg173
 mov ax, 21
 jmp @@retn
@@checkreg173:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg174
 mov ax, 23
 jmp @@retn

;-345   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

@@checkreg174:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg175
 mov ax, 25
 jmp @@retn
@@checkreg175:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg176
 mov ax, 27
 jmp @@retn

;-346   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

@@checkreg176:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg177
 mov ax, 29
 jmp @@retn
@@checkreg177:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg178
 mov ax, 31
 jmp @@retn

;-347   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

@@checkreg178:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg179
 mov ax, 33
 jmp @@retn
@@checkreg179:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg180
 mov ax, 35
 jmp @@retn

;-348   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

@@checkreg180:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg181
 mov ax, 37
 jmp @@retn
@@checkreg181:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg182
 mov ax, 39
 jmp @@retn

;-349   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

@@checkreg182:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg183
 mov ax, 41
 jmp @@retn
@@checkreg183:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg184
 mov ax, 43
 jmp @@retn

;-350   // (eqstr(symbol,"ip")) return 45;


;-351   if (strlen(symbol) >   3) return 0;

@@checkreg184:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle @@checkreg185
 mov ax, 0
 jmp @@retn

;-352   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

@@checkreg185:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg186
 mov ax, 47
 jmp @@retn
@@checkreg186:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg187
 mov ax, 50
 jmp @@retn

;-353   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

@@checkreg187:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg188
 mov ax, 53
 jmp @@retn
@@checkreg188:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg189
 mov ax, 56
 jmp @@retn

;-354   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

@@checkreg189:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg190
 mov ax, 59
 jmp @@retn
@@checkreg190:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg191
 mov ax, 62
 jmp @@retn

;-355   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

@@checkreg191:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg192
 mov ax, 65
 jmp @@retn
@@checkreg192:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg193
 mov ax, 68
 jmp @@retn

;-356   if (eqstr(symbol,"cr0")) return 71;

@@checkreg193:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg194
 mov ax, 71
 jmp @@retn

;-357   return 0;   }

@@checkreg194:
 mov ax, 0
 jmp @@retn

;-358 char printregstr[]

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

;-359 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-360 //          1         2         3         4         5         6         7


;-361 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-362 int printreg(int i) {  unsigned int k; unsigned char c;


printreg:  ; *** PROC ***

;-363   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   362 NULL i = bp+4
;  201 var unsg word   362 NULL k = bp-2
;  202 var unsg byte   362 NULL c = bp-4;
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

;-364   k = &printregstr + i; c=*k; prc(c);

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

;-365   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle @@printreg195
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

;-366 }

@@printreg195:

;-367 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
; ENDP
evalue dw 0
exprtype dw 10

;-368 int expr(int isRight)


expr:  ; *** PROC ***

;-369 { int mode; int id1;     int ixarr; int ixconst;


;-370   int ids;  int isCONST; int i;     unsigned char *p;


;-371   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   368 NULL isRight = bp+4
;  201 var sign word   369 NULL mode = bp-2
;  202 var sign word   369 NULL id1 = bp-4
;  203 var sign word   369 NULL ixarr = bp-6
;  204 var sign word   369 NULL ixconst = bp-8
;  205 var sign word   370 NULL ids = bp-10
;  206 var sign word   370 NULL isCONST = bp-12
;  207 var sign word   370 NULL i = bp-14
;  208 ptr unsg byte   370 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr196
 mov ax, [lexval]
 mov word [evalue], ax

;-372     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp @@retn

;-373   mode=typeName(); /*0=V,1=*,2=&*/

@@expr196:
 call typeName
 mov [bp-2], ax

;-374   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-375   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je @@expr197
 push 0
 call doreg1
 add  sp, 2
 jmp @@retn

;-376   if (token=='(')  {docall1(); goto e1; }

@@expr197:
 mov ax, [token]
 cmp ax, 40
 jne @@expr198
 call docall1
 jmp @@e1

;-377   if (isreg()) goto e1;

@@expr198:
 call isreg
 or  al, al
 je @@expr199
 jmp @@e1

;-378 


;-379   id1=searchname(); gettypes(id1); ids=signi;

@@expr199:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-380   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-381     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@expr200
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr201

;-382       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-383     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp @@expr202
@@expr201:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-384     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-385     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  @@expr203
 push expr_1
 call error1
 add  sp, 2
@@expr203:
@@expr202:

;-386   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

@@expr200:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je @@expr204
 mov ax, [bp-2]
 or  al, al
 je @@expr205
 push expr_2
 call error1
 add  sp, 2

;-387      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

@@expr205:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@expr206
 push expr_4
 call prs
 add  sp, 2
 jmp @@expr207
@@expr206:
 push expr_5
 call prs
 add  sp, 2

;-388        if(NASM==0)prs(" ptr "); v(id1); goto e1;}

@@expr207:
 mov al, [NASM]
 cmp al, 0
 jne @@expr208
 push expr_6
 call prs
 add  sp, 2
@@expr208:
 push word [bp-4]
 call v
 add  sp, 2
 jmp @@e1

;-389   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

@@expr204:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je @@expr209
 mov ax, [bp-2]
 or  al, al
 je @@expr210
 push expr_7
 call error1
 add  sp, 2

;-390      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

@@expr210:
 push expr_8
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@expr211
 push expr_9
 call prs
 add  sp, 2
 jmp @@expr212
@@expr211:
 push expr_10
 call prs
 add  sp, 2

;-391        if(NASM==0)prs(" ptr "); v(id1); goto e1;}

@@expr212:
 mov al, [NASM]
 cmp al, 0
 jne @@expr213
 push expr_11
 call prs
 add  sp, 2
@@expr213:
 push word [bp-4]
 call v
 add  sp, 2
 jmp @@e1

;-392        


;-393   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

@@expr209:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je @@expr214
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp @@e1

;-394   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

@@expr214:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je @@expr215
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp @@e1

;-395   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

@@expr215:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je @@expr216
 push word [bp-4]
 push word [bp-2]
 push expr_14
 call compoundass
 add  sp, 6
 jmp @@e1

;-396   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    

@@expr216:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je @@expr217
 push word [bp-4]
 push word [bp-2]
 push expr_15
 call compoundass
 add  sp, 6
 jmp @@e1

;-397   if (istoken(T_MULASS    )) {error1("not implemented");}

@@expr217:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je @@expr218
 push expr_16
 call error1
 add  sp, 2

;-398   if (istoken(T_DIVASS    )) {error1("not implemented");}

@@expr218:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je @@expr219
 push expr_17
 call error1
 add  sp, 2

;-399 


;-400   if (istoken('=')) { exprtype= expr(1); 

@@expr219:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@expr220
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-401   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp @@e1

;-402   dovar1(mode, "mov", ixarr, id1);

@@expr220:
 push word [bp-4]
 push word [bp-6]
 push expr_18
 push word [bp-2]
 call dovar1
 add  sp, 8

;-403   


;-404 e1:    if (istoken('+')) rterm("add");

@@e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je @@expr221
 push expr_19
 call rterm
 add  sp, 2

;-405   else if (istoken('-')) rterm("sub" );

 jmp @@expr222
@@expr221:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je @@expr223
 push expr_20
 call rterm
 add  sp, 2

;-406   else if (istoken('&')) rterm("and" );

 jmp @@expr224
@@expr223:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@expr225
 push expr_21
 call rterm
 add  sp, 2

;-407   else if (istoken('|')) rterm("or" );  

 jmp @@expr226
@@expr225:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je @@expr227
 push expr_22
 call rterm
 add  sp, 2

;-408   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp @@expr228
@@expr227:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je @@expr229
 push expr_23
 call rterm
 add  sp, 2

;-409   else if (istoken(T_GREATGREAT)) rterm("shr");  

 jmp @@expr230
@@expr229:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je @@expr231
 push expr_24
 call rterm
 add  sp, 2

;-410   else if (istoken('*')) domul (ids);

 jmp @@expr232
@@expr231:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je @@expr233
 push word [bp-10]
 call domul
 add  sp, 2

;-411   else if (istoken('/')) doidiv(ids);

 jmp @@expr234
@@expr233:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je @@expr235
 push word [bp-10]
 call doidiv
 add  sp, 2

;-412   else if (istoken('%')) domod (ids);

 jmp @@expr236
@@expr235:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je @@expr237
 push word [bp-10]
 call domod
 add  sp, 2

;-413   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

@@expr237:
@@expr236:
@@expr234:
@@expr232:
@@expr230:
@@expr228:
@@expr226:
@@expr224:
@@expr222:
 call isrelational
 or  al, al
 je @@expr238
 push expr_25
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-414   return 0;

@@expr238:
 mov ax, 0
 jmp @@retn

;-415 }


;-416 


;-417 int compoundass(char *op, int mode, int id1) {

@@retn: LEAVE
 ret
; ENDP
expr_0 db "\n mov ax, ",0
expr_1 db "Arrayindex muss Zahl oder int sein",0
expr_2 db "Nur var erlaubt",0
expr_3 db "\n inc  ",0
expr_4 db "word",0
expr_5 db "byte",0
expr_6 db " ptr ",0
expr_7 db "Nur var erlaubt",0
expr_8 db "\n dec  ",0
expr_9 db "word",0
expr_10 db "byte",0
expr_11 db " ptr ",0
expr_12 db "add",0
expr_13 db "sub",0
expr_14 db "and",0
expr_15 db "or",0
expr_16 db "not implemented",0
expr_17 db "not implemented",0
expr_18 db "mov",0
expr_19 db "add",0
expr_20 db "sub",0
expr_21 db "and",0
expr_22 db "or",0
expr_23 db "shl",0
expr_24 db "shr",0
expr_25 db "cmp",0

compoundass:  ; *** PROC ***

;-418   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   417 NULL op = bp+4
;  201 var sign word   417 NULL mode = bp+6
;  202 var sign word   417 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je @@compoundass239
 push compoundass_0
 call error1
 add  sp, 2

;-419   prnl(); prs(op); prs("  "); 

@@compoundass239:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-420   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@compoundass240
 push compoundass_2
 call prs
 add  sp, 2
 jmp @@compoundass241
@@compoundass240:
 push compoundass_3
 call prs
 add  sp, 2

;-421     if (NASM==0) prs(" ptr "); v(id1); prs(", ");

@@compoundass241:
 mov al, [NASM]
 cmp al, 0
 jne @@compoundass242
 push compoundass_4
 call prs
 add  sp, 2
@@compoundass242:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_5
 call prs
 add  sp, 2

;-422   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-423 }


;-424 int dovar1(int mode, int op, int ixarr, int id1) { 
 LEAVE
 ret
; ENDP
compoundass_0 db "only scalar Var allowed",0
compoundass_1 db "  ",0
compoundass_2 db "word",0
compoundass_3 db "byte",0
compoundass_4 db " ptr ",0
compoundass_5 db ", ",0

dovar1:  ; *** PROC ***

;-425   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   424 NULL mode = bp+4
;  201 var sign word   424 NULL op = bp+6
;  202 var sign word   424 NULL ixarr = bp+8
;  203 var sign word   424 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-426   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne @@dovar1243
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

;-427     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne @@dovar1244
 push dovar1_1
 call prs
 add  sp, 2

;-428     if(widthi == 2) prs(" ax, [bx]");

@@dovar1244:
 mov ax, [widthi]
 cmp ax, 2
 jne @@dovar1245
 push dovar1_2
 call prs
 add  sp, 2

;-429     return; }

@@dovar1245:
 jmp @@retn

;-430   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

@@dovar1243:
 mov ax, [bp+4]
 cmp ax, 2
 jne @@dovar1246
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

;-431   if (ixarr) {

@@dovar1246:
 mov ax, [bp+8]
 or  al, al
 je @@dovar1247

;-432     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-433     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1248
 push dovar1_5
 call prs
 add  sp, 2

;-434     prs("\n "); prs(op);

@@dovar1248:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-435     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1249
 push dovar1_7
 call prs
 add  sp, 2
 jmp @@dovar1250
@@dovar1249:
 push dovar1_8
 call prs
 add  sp, 2

;-436 // v(id1); prs(" [bx]");


;-437     prc('['); printName(id1); prs(" + bx]"); 

@@dovar1250:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-438     return; }

 jmp @@retn

;-439   prnl();prs(op);

@@dovar1247:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-440   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne @@dovar1251
 push dovar1_10
 call prs
 add  sp, 2

;-441   if(wi==2) prs(" ax, ");

@@dovar1251:
 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1252
 push dovar1_11
 call prs
 add  sp, 2

;-442   if(wi==4) prs(" eax, ");

@@dovar1252:
 mov ax, [wi]
 cmp ax, 4
 jne @@dovar1253
 push dovar1_12
 call prs
 add  sp, 2

;-443   v(id1);

@@dovar1253:
 push word [bp+10]
 call v
 add  sp, 2

;-444 }


;-445 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-446   if (istoken(T_CONST)) { prnl(); prs(op); 

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   445 NULL op = bp+4
;  201 var sign word   445 NULL mode = bp-2
;  202 var sign word   445 NULL opint = bp-4
;  203 var sign word   445 NULL ixarr = bp-6
;  204 var sign word   445 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@rterm254
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-447     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne @@rterm255
 push rterm_0
 call prs
 add  sp, 2

;-448     if (wi==2) prs(" ax, ");

@@rterm255:
 mov ax, [wi]
 cmp ax, 2
 jne @@rterm256
 push rterm_1
 call prs
 add  sp, 2

;-449     if (wi==4) prs(" eax, ");

@@rterm256:
 mov ax, [wi]
 cmp ax, 4
 jne @@rterm257
 push rterm_2
 call prs
 add  sp, 2

;-450     prunsign1(lexval); return;}

@@rterm257:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp @@retn

;-451   mode=typeName(); id1=searchname(); ixarr=0;

@@rterm254:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-452   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@rterm258
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-453     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-454     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  @@rterm259
 push rterm_3
 call error1
 add  sp, 2
@@rterm259:

;-455   if (eqstr(symbol,"_AX")) return;

@@rterm258:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@rterm260
 jmp @@retn

;-456   opint=op; dovar1(mode, opint, ixarr, id1);

@@rterm260:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-457 }


;-458 int isreg() {

@@retn: LEAVE
 ret
; ENDP
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0

isreg:  ; *** PROC ***

;-459   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg261
 push isreg_1
 call doreg
 add  sp, 2
 jmp @@r1

;-460   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  

@@isreg261:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg262
 push isreg_3
 call doreg
 add  sp, 2
 jmp @@r1

;-461   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

@@isreg262:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg263
 push isreg_5
 call doreg
 add  sp, 2
 jmp @@r1

;-462   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

@@isreg263:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg264
 push isreg_7
 call doreg
 add  sp, 2
 jmp @@r1

;-463   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

@@isreg264:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg265
 push isreg_9
 call doreg
 add  sp, 2
 jmp @@r1

;-464   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    

@@isreg265:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg266
 push isreg_11
 call doreg
 add  sp, 2
 jmp @@r1

;-465   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

@@isreg266:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg267
 push isreg_13
 call doreg
 add  sp, 2
 jmp @@r1

;-466   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

@@isreg267:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg268
 push isreg_15
 call doreg
 add  sp, 2
 jmp @@r1

;-467   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    

@@isreg268:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg269
 push isreg_17
 call doreg
 add  sp, 2
 jmp @@r1

;-468   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

@@isreg269:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg270
 push isreg_19
 call doreg
 add  sp, 2
 jmp @@r1

;-469   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

@@isreg270:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg271
 push isreg_21
 call doreg
 add  sp, 2
 jmp @@r1

;-470   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  

@@isreg271:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg272
 push isreg_23
 call doreg
 add  sp, 2
 jmp @@r1

;-471   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

@@isreg272:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg273
 push isreg_25
 call doreg
 add  sp, 2
 jmp @@r1

;-472   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

@@isreg273:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg274
 push isreg_27
 call doreg
 add  sp, 2
 jmp @@r1

;-473   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  

@@isreg274:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg275
 push isreg_29
 call doreg
 add  sp, 2
 jmp @@r1

;-474   return 0;   r1: return 1; 

@@isreg275:
 mov ax, 0
 jmp @@retn
@@r1:
 mov ax, 1
 jmp @@retn

;-475 }


;-476 int doreg(char *dr) { int i; expect('=');

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
;  200 ptr sign byte   476 NULL dr = bp+4
;  201 var sign word   476 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-477   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-478        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg276
 push word [lexval]
 call prunsign1
 add  sp, 2

;-479   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp @@doreg277
@@doreg276:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg278
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-480   else error1("only number or var allowed"); }

 jmp @@doreg279
@@doreg278:
 push doreg_2
 call error1
 add  sp, 2
@@doreg279:
@@doreg277:

;-481 


;-482 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
; ENDP
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0

doassign:  ; *** PROC ***

;-483   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   482 NULL mode = bp+4
;  201 var sign word   482 NULL i = bp+6
;  202 var sign word   482 NULL ixarr = bp+8
;  203 var sign word   482 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-484   if (mode==1) {prs("\n mov  bx, ");v(i);                       /*NASM??*/

 mov ax, [bp+4]
 cmp ax, 1
 jne @@doassign280
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-485     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne @@doassign281
 push doassign_1
 call prs
 add  sp, 2

;-486     else  prs("\n mov  [bx], al"); return;}

 jmp @@doassign282
@@doassign281:
 push doassign_2
 call prs
 add  sp, 2
@@doassign282:
 jmp @@retn

;-487   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

@@doassign280:
 mov ax, [bp+4]
 cmp ax, 2
 jne @@doassign283
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

;-488   if (ixarr) {  prs("\n mov bx, ");

@@doassign283:
 mov ax, [bp+8]
 or  al, al
 je @@doassign284
 push doassign_5
 call prs
 add  sp, 2

;-489     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je @@doassign285
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp @@doassign286
@@doassign285:
 push word [bp+8]
 call v
 add  sp, 2

;-490     if (wi==2) prs("\n shl bx, 1");

@@doassign286:
 mov ax, [wi]
 cmp ax, 2
 jne @@doassign287
 push doassign_6
 call prs
 add  sp, 2

;-491     prs("\n mov ["); printName(i);

@@doassign287:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-492     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne @@doassign288
 push doassign_8
 call prs
 add  sp, 2
 jmp @@doassign289
@@doassign288:
 push doassign_9
 call prs
 add  sp, 2
@@doassign289:
 jmp @@retn

;-493   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

@@doassign284:
 mov ax, [wi]
 cmp ax, 1
 jne @@doassign290
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign291
 push doassign_11
 call prs
 add  sp, 2

;-494     if(NASM==0)prs("ptr ");} v(i); prs(", al"); return; }

 mov al, [NASM]
 cmp al, 0
 jne @@doassign292
 push doassign_12
 call prs
 add  sp, 2
@@doassign292:
@@doassign291:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_13
 call prs
 add  sp, 2
 jmp @@retn

;-495   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

@@doassign290:
 mov ax, [wi]
 cmp ax, 2
 jne @@doassign293
 push doassign_14
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign294
 push doassign_15
 call prs
 add  sp, 2

;-496     if(NASM==0)prs("ptr ");} v(i); prs(", ax"); return; }

 mov al, [NASM]
 cmp al, 0
 jne @@doassign295
 push doassign_16
 call prs
 add  sp, 2
@@doassign295:
@@doassign294:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_17
 call prs
 add  sp, 2
 jmp @@retn

;-497   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

@@doassign293:
 mov ax, [wi]
 cmp ax, 4
 jne @@doassign296
 push doassign_18
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign297
 push doassign_19
 call prs
 add  sp, 2

;-498     if(NASM==0)prs("ptr ");} v(i); prs(", eax"); return; }

 mov al, [NASM]
 cmp al, 0
 jne @@doassign298
 push doassign_20
 call prs
 add  sp, 2
@@doassign298:
@@doassign297:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_21
 call prs
 add  sp, 2
 jmp @@retn

;-499 }

@@doassign296:

;-500 int domul(int ids) {

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
doassign_12 db "ptr ",0
doassign_13 db ", al",0
doassign_14 db "\n mov ",0
doassign_15 db "word ",0
doassign_16 db "ptr ",0
doassign_17 db ", ax",0
doassign_18 db "\n mov ",0
doassign_19 db "dword ",0
doassign_20 db "ptr ",0
doassign_21 db ", eax",0

domul:  ; *** PROC ***

;-501   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   500 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je @@domul299
 push domul_0
 call rterm
 add  sp, 2
 jmp @@domul300
@@domul299:

;-502   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@domul301
 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-503   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp @@domul302
@@domul301:
 push domul_3
 call error1
 add  sp, 2
@@domul302:
@@domul300:

;-504 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
; ENDP
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0

doidiv:  ; *** PROC ***

;-505   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   504 NULL ids = bp+4
;  201 var sign word   504 NULL mode = bp-2
;  202 var sign word   504 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doidiv303

;-506     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-507     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je @@doidiv304
 push doidiv_1
 call prs
 add  sp, 2
 jmp @@doidiv305
@@doidiv304:
 push doidiv_2
 call prs
 add  sp, 2
@@doidiv305:

;-508   else {

 jmp @@doidiv306
@@doidiv303:

;-509     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-510     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je @@doidiv307
 push doidiv_3
 call error1
 add  sp, 2

;-511     gettypes(id1);

@@doidiv307:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-512     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je @@doidiv308
 push doidiv_4
 call error1
 add  sp, 2

;-513     if (wi!=2) error1("only int, no byte as divisor allowed");

@@doidiv308:
 mov ax, [wi]
 cmp ax, 2
 je  @@doidiv309
 push doidiv_5
 call error1
 add  sp, 2

;-514     prs("\n mov bx, "); v(id1);

@@doidiv309:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-515     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je @@doidiv310
 push doidiv_7
 call prs
 add  sp, 2
 jmp @@doidiv311
@@doidiv310:
 push doidiv_8
 call prs
 add  sp, 2
@@doidiv311:

;-516 }

@@doidiv306:

;-517 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
;  200 var sign word   517 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-518 


;-519 int docalltype[10]; int docallvalue[10];
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

;-520 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 53451
procname resb 17
section .text

;-521 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1:  ; *** PROC ***

;-522   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   521 NULL i = bp-2
;  201 var sign word   521 NULL narg = bp-4
;  202 var sign word   521 NULL t0 = bp-6
;  203 var sign word   521 NULL n0 = bp-8
;  204 var sign word   521 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-523   checknamelen();

 call checknamelen

;-524   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-525   storecall();

 call storecall

;-526   expect('(');

 push 40
 call expect
 add  sp, 2

;-527 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@docall1312

;-528 	  do { narg++;

@@docall1313:
 inc  word[bp-4]

;-529 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle @@docall1314
 push docall1_0
 call error1
 add  sp, 2
@@docall1314:
 mov ax, 0
 mov [bp-6], ax

;-530       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1315
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-531       if(istoken(T_STRING)){t0=2; n0=nconst;

@@docall1315:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1316
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-532         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-533         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-534       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

@@docall1316:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1317
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-535       if(istoken(T_NAME))  { n0=checkreg();

@@docall1317:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1318
 call checkreg
 mov [bp-8], ax

;-536         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je @@docall1319
 mov ax, 5
 mov [bp-6], ax

;-537         else {t0=4; n0=searchname();

 jmp @@docall1320
@@docall1319:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-538           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne @@docall1321
 mov ax, 3
 mov [bp-6], ax
@@docall1321:
@@docall1320:

;-539       if (t0==0) error1("parameter not recognized (no * allowed)");

@@docall1318:
 mov ax, [bp-6]
 cmp ax, 0
 jne @@docall1322
 push docall1_4
 call error1
 add  sp, 2

;-540       docalltype [narg] = t0;

@@docall1322:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-541       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-542     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1323
 jmp @@docall1313
@@docall1323:

;-543     


;-544   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-545     do {

@@docall1324:

;-546       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-547       n0 = docallvalue[i];     

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-548       if(t0==1){ prs("\n push "); pint1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne @@docall1325
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-549       if(t0==2){ prs("\n push "); if(NASM==0) prs("offset ");

@@docall1325:
 mov ax, [bp-6]
 cmp ax, 2
 jne @@docall1326
 push docall1_6
 call prs
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@docall1327
 push docall1_7
 call prs
 add  sp, 2

;-550         prs(fname);prc(95);pint1(n0);}

@@docall1327:
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

;-551       if(t0==3){ prs("\n lea  ax, "); if(NASM==0)prs("word ptr ");  v(n0);

@@docall1326:
 mov ax, [bp-6]
 cmp ax, 3
 jne @@docall1328
 push docall1_8
 call prs
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@docall1329
 push docall1_9
 call prs
 add  sp, 2
@@docall1329:
 push word [bp-8]
 call v
 add  sp, 2

;-552         prs("\n push ax");}

 push docall1_10
 call prs
 add  sp, 2

;-553       if(t0==4){ gettypes(n0); 

@@docall1328:
 mov ax, [bp-6]
 cmp ax, 4
 jne @@docall1330
 push word [bp-8]
 call gettypes
 add  sp, 2

;-554         if(wi==2) { prs("\n push word ");if(NASM==0)prs("ptr "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne @@docall1331
 push docall1_11
 call prs
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@docall1332
 push docall1_12
 call prs
 add  sp, 2
@@docall1332:
 push word [bp-8]
 call v
 add  sp, 2

;-555         else { prs("\n mov al, byte ");  if(NASM==0)prs("ptr "); v(n0);

 jmp @@docall1333
@@docall1331:
 push docall1_13
 call prs
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@docall1334
 push docall1_14
 call prs
 add  sp, 2
@@docall1334:
 push word [bp-8]
 call v
 add  sp, 2

;-556         prs("\n mov ah, 0\n push ax"); } }

 push docall1_15
 call prs
 add  sp, 2
@@docall1333:

;-557       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

@@docall1330:
 mov ax, [bp-6]
 cmp ax, 5
 jne @@docall1335
 push docall1_16
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  @@docall1336
 mov ax, [bp-10]
 add ax, 2
@@docall1336:

;-558    i--; } while (i > 0);  }

@@docall1335:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle @@docall1337
 jmp @@docall1324
@@docall1337:

;-559 	 prs("\n call "); prs(&procname);

@@docall1312:
 push docall1_17
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-560 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle @@docall1338
 push docall1_18
 call prs
 add  sp, 2

;-561      narg=narg+narg; narg=narg+sz32; pint1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2
@@docall1338:

;-562 /****************************************************************************/


;-563 int main() {
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
docall1_7 db "offset ",0
docall1_8 db "\n lea  ax, ",0
docall1_9 db "word ptr ",0
docall1_10 db "\n push ax",0
docall1_11 db "\n push word ",0
docall1_12 db "ptr ",0
docall1_13 db "\n mov al, byte ",0
docall1_14 db "ptr ",0
docall1_15 db "\n mov ah, 0\n push ax",0
docall1_16 db "\n push ",0
docall1_17 db "\n call ",0
docall1_18 db "\n add  sp, ",0

main:  ; *** PROC ***

;-564   getarg();

 call getarg

;-565   setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-566   if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je @@main339
 push main_0
 call error1
 add  sp, 2

;-567   segE=allocmem(4096);

@@main339:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-568   if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je @@main340
 push main_1
 call error1
 add  sp, 2

;-569   CNameTop=0;

@@main340:
 mov ax, 0
 mov word [CNameTop], ax

;-570   getfirstchar();

 call getfirstchar

;-571   parse();

 call parse

;-572   callrecursive=0; checkcalls(); epilog();

 mov ax, 0
 mov word [callrecursive], ax
 call checkcalls
 call epilog

;-573 }


;-574 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }

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

;-575 char *arglen=0x80; char *argv=0x82;

 ret
; ENDP
arglen dw 128
argv dw 130

;-576 int getarg() { int arglen1; int i; char *c;


getarg:  ; *** PROC ***

;-577   arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   576 NULL arglen1 = bp-2
;  201 var sign word   576 NULL i = bp-4
;  202 ptr sign byte   576 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-578   if (arglen1) { i=arglen1+129; *i=0; }

 mov ax, [bp-2]
 or  al, al
 je @@getarg341
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-579   else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");

 jmp @@getarg342
@@getarg341:
 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
 push getarg_0
 call cputs
 add  sp, 2

;-580     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }

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

;-581   strcpy(namein, argv);

@@getarg342:
 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-582   if (instr2(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr2
 add  sp, 4
 cmp ax, 0
 jne @@getarg343
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-583   toupper(namein);

@@getarg343:
 lea  ax, [namein]
 push ax
 call toupper
 add  sp, 2

;-584   c=instr2(namein, '/');

 push 47
 lea  ax, [namein]
 push ax
 call instr2
 add  sp, 4
 mov [bp-6], ax

;-585   if (c != 0)  { c++; if (*c == 'N') {NASM=1; c+=2; strcpy(namein, c);  }

 mov ax, [bp-6]
 cmp ax, 0
 je  @@getarg344
 inc  word[bp-6]
 mov bx, [bp-6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 78
 jne @@getarg345
 mov ax, 1
 mov byte [NASM], al
 add  word[bp-6], 2
 push word [bp-6]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-586     else {cputs("Parameter unknown "); exitR(3);  }  }

 jmp @@getarg346
@@getarg345:
 push getarg_2
 call cputs
 add  sp, 2
 push 3
 call exitR
 add  sp, 2
@@getarg346:

;-587   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';

@@getarg344:
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

;-588  


;-589   fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-590   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }

 mov ax, [DOS_ERR]
 or  al, al
 je @@getarg347
 push getarg_3
 call cputs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call cputs
 add  sp, 2
 push 1
 call exitR
 add  sp, 2

;-591   fdout=creatR(namelst);

@@getarg347:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-592   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}

 mov ax, [DOS_ERR]
 or  al, al
 je @@getarg348
 push getarg_4
 call cputs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call cputs
 add  sp, 2
 push 2
 call exitR
 add  sp, 2

;-593   prs("\n; ");prs(Version1);

@@getarg348:
 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-594   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}

 push getarg_6
 call prs
 add  sp, 2
 push word [bp-2]
 call pint1
 add  sp, 2
 mov ax, [bp-2]
 or  al, al
 je @@getarg349
 push getarg_7
 call prs
 add  sp, 2
 push word [argv]
 call prs
 add  sp, 2

;-595   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);

@@getarg349:
 push getarg_8
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2
 push getarg_9
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-596   if (NASM) prs("\norg  256 ; NASM ON\njmp main"); else

 mov al, [NASM]
 or  al, al
 je @@getarg350
 push getarg_10
 call prs
 add  sp, 2

;-597   prs("\n.MODEL TINY,C\n.386P\n.CODE\nJUMPS\nLOCALS\nSTARTUPCODE\njmp main");

 jmp @@getarg351
@@getarg350:
 push getarg_11
 call prs
 add  sp, 2

;-598 }

@@getarg351:

;-599 int parse() { token=getlex(); do {
 LEAVE
 ret
; ENDP
getarg_0 db " Usage: A.COM in_file[.C]: ",0
getarg_1 db ".C",0
getarg_2 db "Parameter unknown ",0
getarg_3 db "Source file missing (.C): ",0
getarg_4 db "list file not creatable: ",0
getarg_5 db "\n; ",0
getarg_6 db ", Arglen: ",0
getarg_7 db ", Argv: ",0
getarg_8 db ", Source: ",0
getarg_9 db ", Output asm: ",0
getarg_10 db "\norg  256 ; NASM ON\njmp main",0
getarg_11 db "\n.MODEL TINY,C\n.386P\n.CODE\nJUMPS\nLOCALS\nSTARTUPCODE\njmp main",0

parse:  ; *** PROC ***
 call getlex
 mov word [token], ax
@@parse352:

;-600     if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  @@parse353
 mov ax, 1
 jmp @@retn

;-601     if (istoken('#')) {

@@parse353:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je @@parse354

;-602       if (istoken(T_DEFINE)) dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je @@parse355
 call dodefine

;-603       else if (istoken(T_INCLUDE)) doinclude();

 jmp @@parse356
@@parse355:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je @@parse357
 call doinclude

;-604       else error1("define or include expected");  }

 jmp @@parse358
@@parse357:
 push parse_0
 call error1
 add  sp, 2
@@parse358:
@@parse356:

;-605     else{ typeName();  if (token=='(') dofunc();  else doglob(); }

 jmp @@parse359
@@parse354:
 call typeName
 mov ax, [token]
 cmp ax, 40
 jne @@parse360
 call dofunc
 jmp @@parse361
@@parse360:
 call doglob
@@parse361:

;-606   } while(1);

@@parse359:
 mov ax, 1
 or  al, al
 je @@parse362
 jmp @@parse352
@@parse362:

;-607 }


;-608 int checkcalls() { int i; int j; int k;

@@retn:
 ret
; ENDP
parse_0 db "define or include expected",0

checkcalls:  ; *** PROC ***

;-609   prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   608 NULL i = bp-2
;  201 var sign word   608 NULL j = bp-4
;  202 var sign word   608 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-610   i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-611   while (i < CTop) {

@@checkcalls363:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@checkcalls364

;-612     pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-613     from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-614     j=0;

 mov ax, 0
 mov [bp-4], ax

;-615     do { p1=adrF(FNameField, j);

@@checkcalls365:
 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-616       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkcalls366
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 mov ax, [FTop]
 mov [bp-4], ax

;-617       j++; } while (j < FTop);

@@checkcalls366:
 inc  word[bp-4]
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge @@checkcalls367
 jmp @@checkcalls365
@@checkcalls367:

;-618     if (j == FTop) { k++; prs("\n; "); prs(NameA); }

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne @@checkcalls368
 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-619     i++; }

@@checkcalls368:
 inc  word[bp-2]

;-620   if (k!=0) doar(k); else {prs(" All FUNCTIONs in place");

 jmp @@checkcalls363
@@checkcalls364:
 mov ax, [bp-6]
 cmp ax, 0
 je  @@checkcalls369
 push word [bp-6]
 call doar
 add  sp, 2
 jmp @@checkcalls370
@@checkcalls369:
 push checkcalls_2
 call prs
 add  sp, 2

;-621     cputs("  All CALLs OK! "); }

 push checkcalls_3
 call cputs
 add  sp, 2

;-622 }

@@checkcalls370:

;-623 char wasfunction;
 LEAVE
 ret
; ENDP
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db " All FUNCTIONs in place",0
checkcalls_3 db "  All CALLs OK! ",0
wasfunction db 0

;-624 int doar(int k) { int i; int fdtemp; int fdout1; int used; int found;


doar:  ; *** PROC ***

;-625   cputs("  Open CALLs :"); pint(k);

;Function : doar, Number of local variables: 6
;   # type sign width addr used name   list of local variables
;  200 var sign word   624 NULL k = bp+4
;  201 var sign word   624 NULL i = bp-2
;  202 var sign word   624 NULL fdtemp = bp-4
;  203 var sign word   624 NULL fdout1 = bp-6
;  204 var sign word   624 NULL used = bp-8
;  205 var sign word   624 NULL found = bp-10;
 ENTER  10,0
 push doar_0
 call cputs
 add  sp, 2
 push word [bp+4]
 call pint
 add  sp, 2

;-626   prs("\n; Number of unresolved CALLs :"); printint51(k);

 push doar_1
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-627   fdin=openR (archivename);

 lea  ax, [archivename]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-628   if(DOS_ERR){cputs("Archive file missing: "); cputs(archivename); exitR(3); }

 mov ax, [DOS_ERR]
 or  al, al
 je @@doar371
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

;-629   prs("\n;use archive file: "); prs(archivename);

@@doar371:
 push doar_3
 call prs
 add  sp, 2
 lea  ax, [archivename]
 push ax
 call prs
 add  sp, 2

;-630   fdtemp=fdout;

 mov ax, [fdout]
 mov [bp-4], ax

;-631   wasfunction=0;

 mov ax, 0
 mov byte [wasfunction], al

;-632   getfirstchar();

 call getfirstchar

;-633   do { fdout=0;do {found=getfunctionhead();}while (found==0); fdout=fdtemp;

@@doar372:
 mov ax, 0
 mov word [fdout], ax
@@doar373:
 call getfunctionhead
 mov [bp-10], ax
 mov ax, [bp-10]
 cmp ax, 0
 jne @@doar374
 jmp @@doar373
@@doar374:
 mov ax, [bp-4]
 mov word [fdout], ax

;-634        if (found > 0) {

 mov ax, [bp-10]
 cmp ax, 0
 jle @@doar375

;-635          used=0; i=0;

 mov ax, 0
 mov [bp-8], ax
 mov ax, 0
 mov [bp-2], ax

;-636          while (i < CTop) {

@@doar376:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@doar377

;-637            pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-638            from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-639            if (eqstr(symbol, NameA)) {

 lea  ax, [NameA]
 push ax
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@doar378

;-640              if (CType[i] == 0) {CType[i]=1; used++; } }  i++; }

 mov bx, [bp-2]
 mov al, [CType + bx]
 cmp al, 0
 jne @@doar379
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 inc  word[bp-8]
@@doar379:
@@doar378:
 inc  word[bp-2]

;-641            if (used) {

 jmp @@doar376
@@doar377:
 mov ax, [bp-8]
 or  al, al
 je @@doar380

;-642               prs("\n;Number of CALLs:"); printint51(used);

 push doar_4
 call prs
 add  sp, 2
 push word [bp-8]
 call printint51
 add  sp, 2

;-643               prs(" : "); prs(symbol); dofunc(); wasfunction=1; }

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

;-644         }

@@doar380:

;-645      } while (token);

@@doar375:
 mov ax, [token]
 or  al, al
 je @@doar381
 jmp @@doar372
@@doar381:

;-646   prs("\n;End of archive file. ");

 push doar_6
 call prs
 add  sp, 2

;-647   callrecursive++; if (callrecursive < 5) checkcalls();

 inc  word[callrecursive]
 mov ax, [callrecursive]
 cmp ax, 5
 jge @@doar382
 call checkcalls

;-648     else {putch(10); cputs("***ERROR*** function(s) missing! ");

 jmp @@doar383
@@doar382:
 push 10
 call putch
 add  sp, 2
 push doar_7
 call cputs
 add  sp, 2

;-649     error1("At least 1 function is missing in archive file! "); }

 push doar_8
 call error1
 add  sp, 2

;-650 }

@@doar383:

;-651 int getfunctionhead() {
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

;-652   if (wasfunction) wasfunction=0; else token=getlex();

 mov al, [wasfunction]
 or  al, al
 je @@getfunctionhead384
 mov ax, 0
 mov byte [wasfunction], al
 jmp @@getfunctionhead385
@@getfunctionhead384:
 call getlex
 mov word [token], ax

;-653   if (token == 0) return 0xFFFF;

@@getfunctionhead385:
 mov ax, [token]
 cmp ax, 0
 jne @@getfunctionhead386
 mov ax, 65535
 jmp @@retn

;-654   if(istoken(T_INT))  { if (token != T_NAME) return 0;

@@getfunctionhead386:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je @@getfunctionhead387
 mov ax, [token]
 cmp ax, 256
 je  @@getfunctionhead388
 mov ax, 0
 jmp @@retn

;-655   token=getlex(); if (token == '(') return 1; }

@@getfunctionhead388:
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 40
 jne @@getfunctionhead389
 mov ax, 1
 jmp @@retn
@@getfunctionhead389:

;-656   return 0;

@@getfunctionhead387:
 mov ax, 0
 jmp @@retn

;-657 }


;-658 int doinclude() { int fdtemp;

@@retn:
 ret
; ENDP

doinclude:  ; *** PROC ***

;-659   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   658 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne @@doinclude390
 mov ax, [fdin]
 mov [bp-2], ax

;-660   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-661   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-662   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

 mov ax, [DOS_ERR]
 cmp ax, 0
 je  @@doinclude391
 push doinclude_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-663     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-664   linenoinclude=lineno; lineno=1;

@@doinclude391:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-665   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-666   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-667   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-668 }

@@doinclude390:

;-669 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
; ENDP
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0

dodefine:  ; *** PROC ***

;-670   if (eqstr(symbol, "ORGDATA")) {token=getlex();

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   669 NULL i = bp-2
;  201 var sign word   669 NULL j = bp-4
;  202 var sign word   669 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine392
 call getlex
 mov word [token], ax

;-671     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp @@retn

;-672   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

@@dodefine392:
 push dodefine_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine393
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 258
 jne @@dodefine394

;-673     prs("\n;Use archive file: ");

 push dodefine_2
 call prs
 add  sp, 2

;-674     strcpy(archivename, symbol); prs(archivename);

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

;-675     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp @@dodefine395
@@dodefine394:
 push dodefine_3
 call error1
 add  sp, 2
@@dodefine395:
 call getlex
 mov word [token], ax
 jmp @@retn

;-676    expect(T_NAME);

@@dodefine393:
 push 256
 call expect
 add  sp, 2

;-677   if (token==T_CONST) { 

 mov ax, [token]
 cmp ax, 257
 jne @@dodefine396

;-678     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  @@dodefine397
 push dodefine_4
 call error1
 add  sp, 2

;-679     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

@@dodefine397:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 15
 jle @@dodefine398
 push dodefine_5
 call error1
 add  sp, 2

;-680     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

@@dodefine398:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-681     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-682     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

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

;-683     expect(T_CONST); GTop++;  } 

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-684 }

@@dodefine396:

;-685 int stmt() { int c; char cha;

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

;-686        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   685 NULL c = bp-2
;  201 var sign byte   685 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt399
@@stmt400:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@stmt401
 call stmt
 jmp @@stmt400
@@stmt401:

;-687   else if(istoken(T_IF))    doif();

 jmp @@stmt402
@@stmt399:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt403
 call doif

;-688   else if(istoken(T_DO))    dodo();

 jmp @@stmt404
@@stmt403:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt405
 call dodo

;-689   else if(istoken(T_WHILE)) dowhile();

 jmp @@stmt406
@@stmt405:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt407
 call dowhile

;-690   else if(istoken(T_GOTO))  {prs("\n jmp @@");name1();prs(symbol);expect(';');}

 jmp @@stmt408
@@stmt407:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt409
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

;-691   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp @@stmt410
@@stmt409:
 mov ax, [token]
 cmp ax, 518
 jne @@stmt411
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-692     while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

@@stmt412:
 mov ax, [bp-2]
 cmp ax, 10
 je  @@stmt413
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp @@stmt412
@@stmt413:
 call getlex
 mov word [token], ax

;-693   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  

 jmp @@stmt414
@@stmt411:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt415
 mov ax, [token]
 cmp ax, 123
 jne @@stmt416
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-694     while(cha!= '}') { prc(cha); cha=next(); }

@@stmt417:
 mov al, [bp-4]
 cmp al, 125
 je  @@stmt418
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-695     token=getlex(); }

 jmp @@stmt417
@@stmt418:
 call getlex
 mov word [token], ax

;-696     else error1("Curly open expected"); }

 jmp @@stmt419
@@stmt416:
 push stmt_3
 call error1
 add  sp, 2
@@stmt419:

;-697   else if(istoken(T_INTH))  {prs("\n int  "); expect(T_CONST);

 jmp @@stmt420
@@stmt415:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt421
 push stmt_4
 call prs
 add  sp, 2
 push 257
 call expect
 add  sp, 2

;-698     prunsign1(lexval); expect(';');    }

 push word [lexval]
 call prunsign1
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-699   else if(istoken(T_IFCARRY))doifcarry();

 jmp @@stmt422
@@stmt421:
 push 601
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt423
 call doifcarry

;-700   else if(istoken(T_IFZERO))doifzero();

 jmp @@stmt424
@@stmt423:
 push 602
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt425
 call doifzero

;-701   else if(istoken(T_EMIT))   doemit();

 jmp @@stmt426
@@stmt425:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt427
 call doemit

;-702   else if(istoken(';'))      { }

 jmp @@stmt428
@@stmt427:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt429

;-703   else if(istoken(T_RETURN)) {if (token!=';') exprstart();

 jmp @@stmt430
@@stmt429:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt431
 mov ax, [token]
 cmp ax, 59
 je  @@stmt432
 call exprstart

;-704     prs("\n jmp @@retn"); nreturn++; expect(';');}

@@stmt432:
 push stmt_5
 call prs
 add  sp, 2
 inc  word[nreturn]
 push 59
 call expect
 add  sp, 2

;-705   else if(thechar==':')      {prs("\n@@"); // Label

 jmp @@stmt433
@@stmt431:
 mov al, [thechar]
 cmp al, 58
 jne @@stmt434
 push stmt_6
 call prs
 add  sp, 2

;-706      prs(symbol); prc(':');  expect(T_NAME); expect(':'); }

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

;-707   else                       {exprstart(); expect(';'); } }

 jmp @@stmt435
@@stmt434:
 call exprstart
 push 59
 call expect
 add  sp, 2
@@stmt435:
@@stmt433:
@@stmt430:
@@stmt428:
@@stmt426:
@@stmt424:
@@stmt422:
@@stmt420:
@@stmt414:
@@stmt410:
@@stmt408:
@@stmt406:
@@stmt404:
@@stmt402:

;-708 


;-709 int doemit() {prs("\n db ");
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

;-710   L1: token=getlex(); prunsign1(lexval); token=getlex();

@@L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-711     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne @@doemit436
 push 44
 call prc
 add  sp, 2
 jmp @@L1
@@doemit436:
 push 41
 call expect
 add  sp, 2

;-712 


;-713 int cmpneg(int ids) {

 ret
; ENDP
doemit_0 db "\n db ",0

cmpneg:  ; *** PROC ***

;-714        if(iscmp==T_EQ) prs("\n jne @@");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   713 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne @@cmpneg437
 push cmpneg_0
 call prs
 add  sp, 2

;-715   else if(iscmp==T_NE) prs("\n je  @@");         //ZF=1

 jmp @@cmpneg438
@@cmpneg437:
 mov ax, [iscmp]
 cmp ax, 807
 jne @@cmpneg439
 push cmpneg_1
 call prs
 add  sp, 2

;-716   else if(iscmp==T_LE) if (ids) prs("\n jg  @@");//ZF=0      SF =OF

 jmp @@cmpneg440
@@cmpneg439:
 mov ax, [iscmp]
 cmp ax, 824
 jne @@cmpneg441
 mov ax, [bp+4]
 or  al, al
 je @@cmpneg442
 push cmpneg_2
 call prs
 add  sp, 2

;-717                            else prs("\n ja  @@");//ZF=0 CF=0

 jmp @@cmpneg443
@@cmpneg442:
 push cmpneg_3
 call prs
 add  sp, 2

;-718   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

@@cmpneg443:
 jmp @@cmpneg444
@@cmpneg441:
 mov ax, [iscmp]
 cmp ax, 811
 jne @@cmpneg445
 mov ax, [bp+4]
 or  al, al
 je @@cmpneg446
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-719                                prs("\n jl  @@");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-720                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp @@cmpneg447
@@cmpneg446:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-721                                prs("\n jb  @@");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-722   else if(iscmp=='<' ) prs("\n jge @@");         //          SF =OF

@@cmpneg447:
 jmp @@cmpneg448
@@cmpneg445:
 mov ax, [iscmp]
 cmp ax, 60
 jne @@cmpneg449
 push cmpneg_8
 call prs
 add  sp, 2

;-723   else if(iscmp=='>' ) prs("\n jle @@");         //ZF=1 oder SF!=OF

 jmp @@cmpneg450
@@cmpneg449:
 mov ax, [iscmp]
 cmp ax, 62
 jne @@cmpneg451
 push cmpneg_9
 call prs
 add  sp, 2

;-724   else error1("Vergleich unbekannt in CMPNEG()");  }

 jmp @@cmpneg452
@@cmpneg451:
 push cmpneg_10
 call error1
 add  sp, 2
@@cmpneg452:
@@cmpneg450:
@@cmpneg448:
@@cmpneg444:
@@cmpneg440:
@@cmpneg438:

;-725 


;-726 int prlabel(int n) {prs("\n@@"); prs(fname); pint1(n); prc(':'); }
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
;  200 var sign word   726 NULL n = bp+4;
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

;-727 int prjump (int n) {prs("\n jmp @@"); prs(fname); pint1(n); }
 LEAVE
 ret
; ENDP
prlabel_0 db "\n@@",0

prjump:  ; *** PROC ***
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   727 NULL n = bp+4;
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

;-728 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP
prjump_0 db "\n jmp @@",0

doif:  ; *** PROC ***
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   728 NULL jdest = bp-2
;  201 var sign word   728 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-729   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-730   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je @@doif453
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-731     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-732   else prlabel(jdest); }

 jmp @@doif454
@@doif453:
 push word [bp-2]
 call prlabel
 add  sp, 2
@@doif454:

;-733 int doifcarry() {int jdest;  nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

doifcarry:  ; *** PROC ***
;Function : doifcarry, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   733 NULL jdest = bp-2;
 ENTER  2,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-734   prs("\n jae short @@");/*jnc*/ prs(fname);  pint1(jdest);

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

;-735   stmt(); prlabel(jdest); }

 call stmt
 push word [bp-2]
 call prlabel
 add  sp, 2

;-736 int doifzero() {int jdest;  nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP
doifcarry_0 db "\n jae short @@",0

doifzero:  ; *** PROC ***
;Function : doifzero, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   736 NULL jdest = bp-2;
 ENTER  2,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-737   prs("\n jne short @@");        prs(fname);  pint1(jdest);

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

;-738   stmt(); prlabel(jdest); }

 call stmt
 push word [bp-2]
 call prlabel
 add  sp, 2

;-739 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
; ENDP
doifzero_0 db "\n jne short @@",0

dodo:  ; *** PROC ***

;-740   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   739 NULL jdest = bp-2
;  201 var sign word   739 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-741   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-742   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-743 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

dowhile:  ; *** PROC ***
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   743 NULL jdest = bp-2
;  201 var sign word   743 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-744   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-745   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-746 int isrelational() {
 LEAVE
 ret
; ENDP

isrelational:  ; *** PROC ***

;-747   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne @@isrelational455
 jmp @@w
@@isrelational455:
 mov ax, [token]
 cmp ax, 807
 jne @@isrelational456
 jmp @@w

;-748   if (token==T_LE) goto w; if (token==T_GE) goto w;

@@isrelational456:
 mov ax, [token]
 cmp ax, 824
 jne @@isrelational457
 jmp @@w
@@isrelational457:
 mov ax, [token]
 cmp ax, 811
 jne @@isrelational458
 jmp @@w

;-749   if (token=='<' ) goto w; if (token=='>' ) goto w;

@@isrelational458:
 mov ax, [token]
 cmp ax, 60
 jne @@isrelational459
 jmp @@w
@@isrelational459:
 mov ax, [token]
 cmp ax, 62
 jne @@isrelational460
 jmp @@w

;-750   return 0;  w: iscmp=token; token=getlex(); return 1;}

@@isrelational460:
 mov ax, 0
 jmp @@retn
@@w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp @@retn

;-751  


;-752 char symboltemp[80];    

@@retn:
 ret
; ENDP
section .bss
absolute 53468
symboltemp resb 80
section .text

;-753 int getlex() { char c; char *p; 


getlex:  ; *** PROC ***

;-754 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   753 NULL c = bp-2
;  201 ptr sign byte   753 NULL p = bp-4;
 ENTER  4,0
@@g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne @@getlex461
 mov ax, 0
 jmp @@retn
@@getlex461:
 mov al, [bp-2]
 cmp al, 32
 jg  @@getlex462
 jmp @@g1

;-755   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

@@getlex462:
 mov al, [bp-2]
 cmp al, 61
 jne @@getlex463
 mov al, [thechar]
 cmp al, 61
 jne @@getlex464
 call next
 mov ax, 806
 jmp @@retn
@@getlex464:

;-756   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

@@getlex463:
 mov al, [bp-2]
 cmp al, 33
 jne @@getlex465
 mov al, [thechar]
 cmp al, 61
 jne @@getlex466
 call next
 mov ax, 807
 jmp @@retn
@@getlex466:

;-757   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

@@getlex465:
 mov al, [bp-2]
 cmp al, 60
 jne @@getlex467
 mov al, [thechar]
 cmp al, 61
 jne @@getlex468
 call next
 mov ax, 824
 jmp @@retn
@@getlex468:

;-758   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

@@getlex467:
 mov al, [bp-2]
 cmp al, 62
 jne @@getlex469
 mov al, [thechar]
 cmp al, 61
 jne @@getlex470
 call next
 mov ax, 811
 jmp @@retn
@@getlex470:

;-759   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

@@getlex469:
 mov al, [bp-2]
 cmp al, 60
 jne @@getlex471
 mov al, [thechar]
 cmp al, 60
 jne @@getlex472
 call next
 mov ax, 1240
 jmp @@retn
@@getlex472:

;-760   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

@@getlex471:
 mov al, [bp-2]
 cmp al, 62
 jne @@getlex473
 mov al, [thechar]
 cmp al, 62
 jne @@getlex474
 call next
 mov ax, 1241
 jmp @@retn
@@getlex474:

;-761   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

@@getlex473:
 mov al, [bp-2]
 cmp al, 43
 jne @@getlex475
 mov al, [thechar]
 cmp al, 43
 jne @@getlex476
 call next
 mov ax, 1219
 jmp @@retn
@@getlex476:

;-762   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

@@getlex475:
 mov al, [bp-2]
 cmp al, 45
 jne @@getlex477
 mov al, [thechar]
 cmp al, 45
 jne @@getlex478
 call next
 mov ax, 1225
 jmp @@retn
@@getlex478:

;-763   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

@@getlex477:
 mov al, [bp-2]
 cmp al, 43
 jne @@getlex479
 mov al, [thechar]
 cmp al, 61
 jne @@getlex480
 call next
 mov ax, 1230
 jmp @@retn
@@getlex480:

;-764   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

@@getlex479:
 mov al, [bp-2]
 cmp al, 45
 jne @@getlex481
 mov al, [thechar]
 cmp al, 61
 jne @@getlex482
 call next
 mov ax, 1231
 jmp @@retn
@@getlex482:

;-765   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

@@getlex481:
 mov al, [bp-2]
 cmp al, 38
 jne @@getlex483
 mov al, [thechar]
 cmp al, 61
 jne @@getlex484
 call next
 mov ax, 1234
 jmp @@retn
@@getlex484:

;-766   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    

@@getlex483:
 mov al, [bp-2]
 cmp al, 124
 jne @@getlex485
 mov al, [thechar]
 cmp al, 61
 jne @@getlex486
 call next
 mov ax, 1235
 jmp @@retn
@@getlex486:

;-767   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

@@getlex485:
 mov al, [bp-2]
 cmp al, 42
 jne @@getlex487
 mov al, [thechar]
 cmp al, 61
 jne @@getlex488
 call next
 mov ax, 1232
 jmp @@retn
@@getlex488:

;-768   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        

@@getlex487:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex489
 mov al, [thechar]
 cmp al, 61
 jne @@getlex490
 call next
 mov ax, 1233
 jmp @@retn
@@getlex490:

;-769   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

@@getlex489:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je @@getlex491
 mov al, [bp-2]
 jmp @@retn

;-770   if (c == '/') { if (thechar == '/') {

@@getlex491:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex492
 mov al, [thechar]
 cmp al, 47
 jne @@getlex493

;-771       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }

@@getlex494:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 13
 je  @@getlex495
 jmp @@getlex494
@@getlex495:
 call getlex
 jmp @@retn
@@getlex493:

;-772   if (c == '/') { if (thechar == '*') {

@@getlex492:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex496
 mov al, [thechar]
 cmp al, 42
 jne @@getlex497

;-773       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

@@g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  @@getlex498
 jmp @@g2
@@getlex498:
 mov al, [thechar]
 cmp al, 47
 je  @@getlex499
 jmp @@g2

;-774       c=next(); return getlex(); } else  return '/'; }

@@getlex499:
 call next
 mov [bp-2], al
 call getlex
 jmp @@retn
 jmp @@getlex500
@@getlex497:
 mov ax, 47
 jmp @@retn
@@getlex500:

;-775   if (c == '"') {getstring(c); return T_STRING;}

@@getlex496:
 mov al, [bp-2]
 cmp al, 34
 jne @@getlex501
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp @@retn

;-776   if (digit(c)) { getdigit(c); return T_CONST; }

@@getlex501:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@getlex502
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp @@retn

;-777   if (c==39) { lexval=next();

@@getlex502:
 mov al, [bp-2]
 cmp al, 39
 jne @@getlex503
 call next
 mov word [lexval], ax

;-778     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne @@getlex504
 call next
 mov word [lexval], ax

;-779       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne @@getlex505
 mov ax, 10
 mov word [lexval], ax
@@getlex505:
 mov ax, [lexval]
 cmp ax, 116
 jne @@getlex506
 mov ax, 9
 mov word [lexval], ax

;-780       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

@@getlex506:
 mov ax, [lexval]
 cmp ax, 48
 jne @@getlex507
 mov ax, 0
 mov word [lexval], ax
@@getlex507:
@@getlex504:
 call next
 mov ax, 257
 jmp @@retn

;-781   if (letter(c)) { 

@@getlex503:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getlex508

;-782     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-783     while(letter(thechar)) {c=next(); *p=c;  p++; } 

@@getlex509:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getlex510
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-784       *p=0;

 jmp @@getlex509
@@getlex510:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-785     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex511
 mov ax, 531
 jmp @@retn

;-786     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

@@getlex511:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex512
 mov ax, 532
 jmp @@retn

;-787     if (eqstr(symbol,"void"    )) return T_VOID;

@@getlex512:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex513
 mov ax, 529
 jmp @@retn

;-788     if (eqstr(symbol,"int"     )) return T_INT;

@@getlex513:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex514
 mov ax, 517
 jmp @@retn

;-789     if (eqstr(symbol,"short"   )) return T_SHORT;

@@getlex514:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex515
 mov ax, 534
 jmp @@retn

;-790     if (eqstr(symbol,"long"    )) return T_LONG;

@@getlex515:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex516
 mov ax, 533
 jmp @@retn

;-791     if (eqstr(symbol,"uint32"  )) return T_UINT32;

@@getlex516:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex517
 mov ax, 545
 jmp @@retn

;-792     if (eqstr(symbol,"inth"    )) return T_INTH;

@@getlex517:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex518
 mov ax, 600
 jmp @@retn

;-793     if (eqstr(symbol,"char"    )) return T_CHAR;

@@getlex518:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex519
 mov ax, 530
 jmp @@retn

;-794     if (eqstr(symbol,"asm"     )) return T_ASM;

@@getlex519:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex520
 mov ax, 518
 jmp @@retn

;-795     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

@@getlex520:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex521
 mov ax, 519
 jmp @@retn

;-796     if (eqstr(symbol,"__emit__")) return T_EMIT;

@@getlex521:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex522
 mov ax, 520
 jmp @@retn

;-797     if (eqstr(symbol,"return"  )) return T_RETURN;

@@getlex522:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex523
 mov ax, 512
 jmp @@retn

;-798     if (eqstr(symbol,"if"      )) return T_IF;

@@getlex523:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex524
 mov ax, 513
 jmp @@retn

;-799     if (eqstr(symbol,"ifcarry" )) return T_IFCARRY;

@@getlex524:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex525
 mov ax, 601
 jmp @@retn

;-800     if (eqstr(symbol,"ifzero"  )) return T_IFZERO;

@@getlex525:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex526
 mov ax, 602
 jmp @@retn

;-801     if (eqstr(symbol,"else"    )) return T_ELSE;

@@getlex526:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex527
 mov ax, 514
 jmp @@retn

;-802     if (eqstr(symbol,"while"   )) return T_WHILE;

@@getlex527:
 push getlex_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex528
 mov ax, 515
 jmp @@retn

;-803     if (eqstr(symbol,"do"      )) return T_DO;

@@getlex528:
 push getlex_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex529
 mov ax, 516
 jmp @@retn

;-804     if (eqstr(symbol,"goto"    )) return T_GOTO;

@@getlex529:
 push getlex_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex530
 mov ax, 521
 jmp @@retn

;-805     if (eqstr(symbol,"define"  )) return T_DEFINE;   

@@getlex530:
 push getlex_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex531
 mov ax, 511
 jmp @@retn

;-806     if (eqstr(symbol,"include" )) return T_INCLUDE;   

@@getlex531:
 push getlex_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex532
 mov ax, 510
 jmp @@retn

;-807     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

@@getlex532:
 call convertdefine
 or  al, al
 je @@getlex533
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp @@retn

;-808     return T_NAME; } error1("Input item not recognized"); }

@@getlex533:
 mov ax, 256
 jmp @@retn
@@getlex508:
 push getlex_23
 call error1
 add  sp, 2

;-809 


;-810 int convertdefine() { int i; int j;   i=0;

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
;  200 var sign word   810 NULL i = bp-2
;  201 var sign word   810 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-811   while (i < GTop) {

@@convertdefine534:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@convertdefine535

;-812    j=adrofname(i); 

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-813    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@convertdefine536
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne @@convertdefine537
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-814    return T_CONST; } }

 mov ax, 257
 jmp @@retn
@@convertdefine537:

;-815    i++; } 

@@convertdefine536:
 inc  word[bp-2]

;-816    return 0; }

 jmp @@convertdefine534
@@convertdefine535:
 mov ax, 0
 jmp @@retn

;-817 int getdigit(char c) { int i;

@@retn: LEAVE
 ret
; ENDP

getdigit:  ; *** PROC ***

;-818     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   817 NULL c = bp+4
;  201 var sign word   817 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-819     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne @@getdigit538
 mov ax, 88
 mov byte [thechar], al
@@getdigit538:
 mov al, [thechar]
 cmp al, 88
 jne @@getdigit539
 call next

;-820       while(letter(thechar)) { c=next(); if(c>96) c=c-39;

@@getdigit540:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getdigit541
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle @@getdigit542
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-821 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

@@getdigit542:
 mov al, [bp+4]
 cmp al, 64
 jle @@getdigit543
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
@@getdigit543:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-822      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-823     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 

 jmp @@getdigit540
@@getdigit541:
 jmp @@getdigit544
@@getdigit539:
@@getdigit545:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@getdigit546
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-824      i=0; i=c; lexval=lexval+i; } } 

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp @@getdigit545
@@getdigit546:

;-825 }

@@getdigit544:

;-826 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
; ENDP

getstring:  ; *** PROC ***
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   826 NULL delim = bp+4
;  201 var sign word   826 NULL c = bp-2
;  202 ptr sign byte   826 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-827   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

@@getstring547:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  @@getstring548
 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]
 call next
 mov [bp-2], ax
 jmp @@getstring547
@@getstring548:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-828 


;-829 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
 LEAVE
 ret
; ENDP

next:  ; *** PROC ***
;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   829 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
 mov al, [bp-2]
 mov byte [globC], al
 call fgets1
 mov byte [thechar], al
 mov al, [bp-2]
 jmp @@retn

;-830 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}

@@retn: LEAVE
 ret
; ENDP

istoken:  ; *** PROC ***
;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   830 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne @@istoken549
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp @@retn
@@istoken549:
 mov ax, 0
 jmp @@retn

;-831 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();

@@retn: LEAVE
 ret
; ENDP

expect:  ; *** PROC ***
;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   831 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@expect550
 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 call listproc

;-832   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

 push expect_0
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push expect_1
 call error1
 add  sp, 2
@@expect550:

;-833 


;-834 int eprc(char c)  {*cloc=c; cloc++; }
 LEAVE
 ret
; ENDP
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0

eprc:  ; *** PROC ***
;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   834 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
 inc  word[cloc]

;-835 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
 LEAVE
 ret
; ENDP

eprs:  ; *** PROC ***
;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   835 NULL s = bp+4
;  201 var sign byte   835 NULL c = bp-2;
 ENTER  2,0
@@eprs551:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eprs552
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
 jmp @@eprs551
@@eprs552:

;-836 int prc(unsigned char c) { 
 LEAVE
 ret
; ENDP

prc:  ; *** PROC ***

;-837   if (c==10) {_AX=13; writetty(); }

;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   836 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 10
 jne @@prc553
 mov  ax, 13
 call writetty

;-838   _AL=c; writetty(); 

@@prc553:
 mov  al, [bp+4]
 call writetty

;-839   fputcR(c, fdout); 

 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-840   }


;-841 int prscomment(unsigned char *s) {unsigned char c;
 LEAVE
 ret
; ENDP

prscomment:  ; *** PROC ***

;-842   while(*s){c=*s;prc(c);s++;} }

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   841 NULL s = bp+4
;  201 var unsg byte   841 NULL c = bp-2;
 ENTER  2,0
@@prscomment554:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@prscomment555
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
 jmp @@prscomment554
@@prscomment555:

;-843 int prnl() { prs("\n ");}
 LEAVE
 ret
; ENDP

prnl:  ; *** PROC ***
 push prnl_0
 call prs
 add  sp, 2

;-844 


;-845 int prs(unsigned char *s) {unsigned char c; int com; com=0;

 ret
; ENDP
prnl_0 db "\n ",0

prs:  ; *** PROC ***
;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   845 NULL s = bp+4
;  201 var unsg byte   845 NULL c = bp-2
;  202 var sign word   845 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-846   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;

@@prs556:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@prs557
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 34
 jne @@prs558
 mov ax, [bp-4]
 or  al, al
 je @@prs559
 mov ax, 0
 mov [bp-4], ax
 jmp @@prs560
@@prs559:
 mov ax, 1
 mov [bp-4], ax

;-847     if (c==92) { if (com==0) { s++; c=*s;

@@prs560:
@@prs558:
 mov al, [bp-2]
 cmp al, 92
 jne @@prs561
 mov ax, [bp-4]
 cmp ax, 0
 jne @@prs562
 inc  word[bp+4]
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-848           if (c=='n') c=10; if (c=='t') c= 9;

 mov al, [bp-2]
 cmp al, 110
 jne @@prs563
 mov ax, 10
 mov [bp-2], al
@@prs563:
 mov al, [bp-2]
 cmp al, 116
 jne @@prs564
 mov ax, 9
 mov [bp-2], al

;-849     } } prc(c); s++;  } }

@@prs564:
@@prs562:
@@prs561:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp @@prs556
@@prs557:

;-850 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
 LEAVE
 ret
; ENDP

eprnum:  ; *** PROC ***
;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   850 NULL n = bp+4
;  201 var sign word   850 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@eprnum565
 push 45
 call eprc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-851   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }

@@eprnum565:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@eprnum566
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call eprnum
 add  sp, 2
@@eprnum566:
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

;-852 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint1:  ; *** PROC ***
;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   852 NULL n = bp+4
;  201 var sign word   852 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@pint1567
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-853   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }

@@pint1567:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@pint1568
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
@@pint1568:
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

;-854 int prunsign1(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP

prunsign1:  ; *** PROC ***

;-855   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   854 NULL n = bp+4
;  201 var unsg word   854 NULL e = bp-2;
 ENTER  2,0 ; constant expression
cmp word[bp+4], 10 ;unsigned : 0
 jb  @@prunsign1569
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-856     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }

@@prunsign1569:
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

;-857 int printint51(unsigned int j)  {
 LEAVE
 ret
; ENDP

printint51:  ; *** PROC ***

;-858   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   857 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge @@printint51570
 push 32
 call prc
 add  sp, 2
@@printint51570:
 mov ax, [bp+4]
 cmp ax, 1000
 jge @@printint51571
 push 32
 call prc
 add  sp, 2
@@printint51571:
 mov ax, [bp+4]
 cmp ax, 100
 jge @@printint51572
 push 32
 call prc
 add  sp, 2

;-859    if (j<10) prc(32);  prunsign1(j); }

@@printint51572:
 mov ax, [bp+4]
 cmp ax, 10
 jge @@printint51573
 push 32
 call prc
 add  sp, 2
@@printint51573:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-860 


;-861 int fgets1() { char c; c=*fgetsp;
 LEAVE
 ret
; ENDP

fgets1:  ; *** PROC ***
;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   861 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-862   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne @@fgets1574
 call printinputline
 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne @@fgets1575
 mov ax, 0
 jmp @@retn

;-863     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }

@@fgets1575:
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov ax, 0
 mov word [spalte], ax

;-864   fgetsp++; spalte++;  return c; }

@@fgets1574:
 inc  word[fgetsp]
 inc  word[spalte]
 mov al, [bp-2]
 jmp @@retn

;-865 int printinputline() { fgetsp=&fgetsdest;

@@retn: LEAVE
 ret
; ENDP

printinputline:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-866   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);

@@printinputline576:
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readR
 add  sp, 4
 mov word [DOS_NoBytes], ax

;-867   if (DOS_NoBytes == 0) return; 

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne @@printinputline577
 jmp @@retn

;-868     *fgetsp=DOS_ByteRead; fgetsp++;} 

@@printinputline577:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
 inc  word[fgetsp]

;-869   while (DOS_ByteRead != 10); *fgetsp=0;

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  @@printinputline578
 jmp @@printinputline576
@@printinputline578:
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-870     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;

 mov ax, [fdout]
 or  al, al
 je @@printinputline579
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

;-871       prscomment(&fgetsdest);}

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-872 }

@@printinputline579:

;-873 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }

@@retn:
 ret
; ENDP
printinputline_0 db "\n\n;-",0

end1:  ; *** PROC ***
;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   873 NULL n = bp+4;
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

;-874 int error1(char *s) { 
 LEAVE
 ret
; ENDP

error1:  ; *** PROC ***

;-875   lineno--;

;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   874 NULL s = bp+4;
 ENTER  0,0
 dec  word[lineno]

;-876   prnl(); prscomment(&fgetsdest);

 call prnl
 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-877   prs(";Line: "); prunsign1(lineno);

 push error1_0
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-878   prs(" ************** ERROR: "); prs(s);

 push error1_1
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2

;-879   prs("  in column: "); pint1(spalte);

 push error1_2
 call prs
 add  sp, 2
 push word [spalte]
 call pint1
 add  sp, 2

;-880   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);

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

;-881   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);

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

;-882   end1(1); }

 push 1
 call end1
 add  sp, 2

;-883 int listproc() {int i; 
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

;-884   if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   883 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle @@listproc580

;-885   prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-886   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);

 push listproc_1
 call prs
 add  sp, 2
 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-887   prs("\n;   # type sign width addr used name   list of local variables");

 push listproc_2
 call prs
 add  sp, 2

;-888     i=LSTART; 

 mov ax, 200
 mov [bp-2], ax

;-889     while (i < LTop) { listvar(i); i++; } } 

@@listproc581:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge @@listproc582
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]
 jmp @@listproc581
@@listproc582:

;-890 }

@@listproc580:

;-891 int listvar(unsigned int i) {unsigned int j; char c;
 LEAVE
 ret
; ENDP
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name   list of local variables",0

listvar:  ; *** PROC ***

;-892   prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   891 NULL i = bp+4
;  201 var unsg word   891 NULL j = bp-2
;  202 var sign byte   891 NULL c = bp-4;
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

;-893   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne @@listvar583
 push listvar_1
 call prs
 add  sp, 2
@@listvar583:
 mov al, [bp-4]
 cmp al, 42
 jne @@listvar584
 push listvar_2
 call prs
 add  sp, 2

;-894                if(c=='&')prs("arr ");   if(c=='#')prs("def ");

@@listvar584:
 mov al, [bp-4]
 cmp al, 38
 jne @@listvar585
 push listvar_3
 call prs
 add  sp, 2
@@listvar585:
 mov al, [bp-4]
 cmp al, 35
 jne @@listvar586
 push listvar_4
 call prs
 add  sp, 2

;-895   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

@@listvar586:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne @@listvar587
 push listvar_5
 call prs
 add  sp, 2
@@listvar587:
 mov al, [bp-4]
 cmp al, 85
 jne @@listvar588
 push listvar_6
 call prs
 add  sp, 2

;-896   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

@@listvar588:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne @@listvar589
 push listvar_7
 call prs
 add  sp, 2
@@listvar589:
 mov al, [bp-4]
 cmp al, 2
 jne @@listvar590
 push listvar_8
 call prs
 add  sp, 2

;-897                if(c==  4)prs("dwrd " );

@@listvar590:
 mov al, [bp-4]
 cmp al, 4
 jne @@listvar591
 push listvar_9
 call prs
 add  sp, 2

;-898   j=GAdr[i]; printint51(j);

@@listvar591:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-899   j=GUsed[i]; if (j) printint51(j);

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je @@listvar592
 push word [bp-2]
 call printint51
 add  sp, 2

;-900   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}

 jmp @@listvar593
@@listvar592:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne @@listvar594
 push listvar_10
 call prs
 add  sp, 2
 jmp @@listvar595
@@listvar594:
 push listvar_11
 call prs
 add  sp, 2
@@listvar595:

;-901   prc(32);  pt=adrofname(i); prs(pt);

@@listvar593:
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

;-902   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne @@listvar596
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

;-903   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}

@@listvar596:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne @@listvar597
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

;-904   if (i >= LSTART) { prs(" = bp"); j=GData[i];

@@listvar597:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  @@listvar598
 push listvar_12
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-905     if (j > 0) prc('+'); pint1(j);  }

 mov ax, [bp-2]
 cmp ax, 0
 jle @@listvar599
 push 43
 call prc
 add  sp, 2
@@listvar599:
 push word [bp-2]
 call pint1
 add  sp, 2

;-906 }

@@listvar598:

;-907 int listcall() { int i;
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

;-908   prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   907 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-909   i=0;  while (i< CTop) { calllisting(i); i++; } }

 mov ax, 0
 mov [bp-2], ax
@@listcall600:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@listcall601
 push word [bp-2]
 call calllisting
 add  sp, 2
 inc  word[bp-2]
 jmp @@listcall600
@@listcall601:

;-910 int calllisting(int i) {char c; int j;
 LEAVE
 ret
; ENDP
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0

calllisting:  ; *** PROC ***

;-911   prs("\n;"); printint51(i); prc(32);

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   910 NULL i = bp+4
;  201 var sign byte   910 NULL c = bp-2
;  202 var sign word   910 NULL j = bp-4;
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

;-912   c=CType [i]; if(c==0)prs("unresolved ");

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne @@calllisting602
 push calllisting_1
 call prs
 add  sp, 2

;-913   j=CAdr[i];            printint51(j); prc(32);

@@calllisting602:
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

;-914   from_far(NameA, j);   prs(NameA);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-915 }


;-916 int countcalls(int f) { unsigned int i;
 LEAVE
 ret
; ENDP
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0

countcalls:  ; *** PROC ***

;-917   pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   916 NULL f = bp+4
;  201 var unsg word   916 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-918   i=0;  while (i < CTop) {

 mov ax, 0
 mov [bp-2], ax
@@countcalls603:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@countcalls604

;-919     p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-920     from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-921     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je @@countcalls605
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-922     i++; }

@@countcalls605:
 inc  word[bp-2]

;-923 }

 jmp @@countcalls603
@@countcalls604:

;-924 int listfunc() { int i;
 LEAVE
 ret
; ENDP

listfunc:  ; *** PROC ***

;-925   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   924 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-926   i=0;  while (i < FTop) { countcalls (i); i++; } 

 mov ax, 0
 mov [bp-2], ax
@@listfunc606:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@listfunc607
 push word [bp-2]
 call countcalls
 add  sp, 2
 inc  word[bp-2]

;-927   i=0;  while (i < FTop) { funclisting(i); i++; } }

 jmp @@listfunc606
@@listfunc607:
 mov ax, 0
 mov [bp-2], ax
@@listfunc608:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@listfunc609
 push word [bp-2]
 call funclisting
 add  sp, 2
 inc  word[bp-2]
 jmp @@listfunc608
@@listfunc609:

;-928 int funclisting(int i) {int j;  char c;
 LEAVE
 ret
; ENDP
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0

funclisting:  ; *** PROC ***

;-929   prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   928 NULL i = bp+4
;  201 var sign word   928 NULL j = bp-2
;  202 var sign byte   928 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-930   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je @@funclisting610
 push word [bp-2]
 call printint51
 add  sp, 2
 jmp @@funclisting611
@@funclisting610:
 push funclisting_1
 call prs
 add  sp, 2

;-931   j = FAdr[i];   printint51(j); prc(32);

@@funclisting611:
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

;-932   c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-933   if(c=='V')prs("void " );    if(c=='B')prs("byte " );

 mov al, [bp-4]
 cmp al, 86
 jne @@funclisting612
 push funclisting_2
 call prs
 add  sp, 2
@@funclisting612:
 mov al, [bp-4]
 cmp al, 66
 jne @@funclisting613
 push funclisting_3
 call prs
 add  sp, 2

;-934   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );

@@funclisting613:
 mov al, [bp-4]
 cmp al, 87
 jne @@funclisting614
 push funclisting_4
 call prs
 add  sp, 2
@@funclisting614:
 mov al, [bp-4]
 cmp al, 68
 jne @@funclisting615
 push funclisting_5
 call prs
 add  sp, 2

;-935   prc(32); prc(32);

@@funclisting615:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-936   pt=adrF(FNameField, i); prs(pt);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-937 }


;-938 unsigned int MAXUI=65535;
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

;-939 int epilog() {unsigned int i; 


epilog:  ; *** PROC ***

;-940   strcpy(symbol, "LastFunctionByt");  storefunc();

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   939 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 call storefunc

;-941   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");

 push epilog_1
 call prs
 add  sp, 2

;-942   prs("\n \n;   # type sign width  adr used name   list of global variables\n");

 push epilog_2
 call prs
 add  sp, 2

;-943   i=1;

 mov ax, 1
 mov [bp-2], ax

;-944   while (i< GTop) { listvar(i); i++; }

@@epilog616:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@epilog617
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]

;-945   listfunc();   listcall();

 jmp @@epilog616
@@epilog617:
 call listfunc
 call listcall

;-946 


;-947   prs("\n;Input: "); prs(&namein);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-948   prs(", List: ");   prs(&namelst);

 push epilog_4
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-949   prs(",  Lines:"); printint51(lineno);

 push epilog_5
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-950   prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_6
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-951   prs(" max.:"); printint51(LSTART);

 push epilog_7
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-952   prs("\n;Functions      :"); printint51(FTop);

 push epilog_8
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-953   prs(" max.:"); printint51(FUNCMAX);

 push epilog_9
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-954   prs("\n;Calls          :"); printint51(CTop);

 push epilog_10
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-955   prs(" max.:"); printint51(CALLMAX);

 push epilog_11
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-956   prs(", NameField:"); printint51(CNameTop);

 push epilog_12
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-957   prs(" max.:"); printint51(65535);

 push epilog_13
 call prs
 add  sp, 2
 push -1
 call printint51
 add  sp, 2

;-958 //  prs(", segE:"); printint51(segE);


;-959   __asm{call LastFunctionByt}  _ i=ax;

call LastFunctionByt
mov [bp-2], ax

;-960   prs("\n;Code until     :"); printint51(i);

 push epilog_14
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-961   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");

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

;-962   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  @@epilog618
 push epilog_17
 call prs
 add  sp, 2

;-963   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;

@@epilog618:
 push epilog_18
 call prs
 add  sp, 2
 push word [orgData]
 call prunsign1
 add  sp, 2
 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax

;-964   prs(", resting stacksize: ");printint51(i);

 push epilog_19
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-965   if (i <= 5000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 5000
 ja  @@epilog619
 push epilog_20
 call prs
 add  sp, 2

;-966   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);

@@epilog619:
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

;-967   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");

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

;-968   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  @@epilog620
 push epilog_25
 call prs
 add  sp, 2

;-969   if(NASM==0)prs("\nEND");end1(0);}

@@epilog620:
 mov al, [NASM]
 cmp al, 0
 jne @@epilog621
 push epilog_26
 call prs
 add  sp, 2
@@epilog621:
 push 0
 call end1
 add  sp, 2

;-970 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}


;-971 int setblock(unsigned int i) {
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
epilog_26 db "\nEND",0

setblock:  ; *** PROC ***

;-972   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   971 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, cs
 mov  es, ax
 mov  ax, 18944
 call DosInt

;-973 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 LEAVE
 ret
; ENDP

allocmem:  ; *** PROC ***

;-974   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   973 NULL i = bp+4
;  201 var unsg word   973 NULL vAX = bp-2
;  202 var unsg word   973 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, 18432
 call DosInt
mov [bp-2], ax
mov [bp-4], bx

;-975   if(DOS_ERR) return vBX;   return vAX;

 mov ax, [DOS_ERR]
 or  al, al
 je @@allocmem622
 mov ax, [bp-4]
 jmp @@retn
@@allocmem622:
 mov ax, [bp-2]
 jmp @@retn

;-976 }


;-977 int copyF(char *dest, char *src, unsigned int sz) {

@@retn: LEAVE
 ret
; ENDP

copyF:  ; *** PROC ***

;-978   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di

;Function : copyF, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   977 NULL dest = bp+4
;  201 ptr sign byte   977 NULL src = bp+6
;  202 var unsg word   977 NULL sz = bp+8;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]
 mov  cx, [bp+8]

;-979   asm cld

 cld

;-980   asm rep movsb

 rep movsb

;-981   asm mov byte [es:di], 0

 mov byte [es:di], 0

;-982 }


;-983 int to_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

to_far:  ; *** PROC ***

;-984   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   983 NULL dest = bp+4
;  201 ptr sign byte   983 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-985   asm cld

 cld

;-986   do{

@@to_far623:

;-987   asm lodsb  ; inc si

 lodsb  ; inc si

;-988   asm stosb  ; inc di

 stosb  ; inc di

;-989   } while (al != 0);

 cmp  al, 0
 je  @@to_far624
 jmp @@to_far623
@@to_far624:

;-990 }


;-991 int from_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

from_far:  ; *** PROC ***

;-992   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   991 NULL dest = bp+4
;  201 ptr sign byte   991 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-993   do{

@@from_far625:

;-994   asm mov al, [es:si]

 mov al, [es:si]

;-995   asm inc si

 inc si

;-996   asm mov [di], al

 mov [di], al

;-997   asm inc di

 inc di

;-998   } while (al != 0);

 cmp  al, 0
 je  @@from_far626
 jmp @@from_far625
@@from_far626:

;-999 }
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
; instr2
; strcpy
; cputs
; exitR
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
; Number of unresolved CALLs :  157
;use archive file: AR.C

;-1000 // AR.C Archive

;Number of CALLs:    2 : writetty

writetty:  ; *** PROC ***
 mov  ah, 14
 mov  bx, 0
 int  16

;-1001 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }

 ret
; ENDP
;Number of CALLs:    1 : putch

putch:  ; *** PROC ***
;Function : putch, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1001 NULL c = bp+4;
 ENTER  0,0 ; constant expression
cmp byte[bp+4], 10
 jne @@putch627
 mov  al, 13
 call writetty
@@putch627:
 mov  al, [bp+4]
 call writetty

;-1002 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
; ENDP
;Number of CALLs:   12 : cputs

cputs:  ; *** PROC ***
;Function : cputs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1002 NULL s = bp+4
;  201 var sign byte  1002 NULL c = bp-2;
 ENTER  2,0
@@cputs628:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@cputs629
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
 jmp @@cputs628
@@cputs629:

;-1003 int mkneg(int n) { n; __asm {neg ax} }
 LEAVE
 ret
; ENDP
;Number of CALLs:    3 : mkneg

mkneg:  ; *** PROC ***
;Function : mkneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1003 NULL n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-1004 int prunsign(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : pint

pint:  ; *** PROC ***
;Function : pint, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word  1004 NULL n = bp+4
;  201 var sign word  1004 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@pint630
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-1005   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }

@@pint630:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@pint631
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint
 add  sp, 2
@@pint631:
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

;-1006 int printint5(unsigned int j)  {
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : toupper

toupper:  ; *** PROC ***
;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1006 NULL s = bp+4;
 ENTER  0,0
@@toupper632:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@toupper633
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 97 ;unsigned : 1
 jl  @@toupper634
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 122
 jg  @@toupper635
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 sub ax, 32
 mov  bx, [bp+4]
 mov  [bx], al
@@toupper635:
@@toupper634:
 inc  word[bp+4]
 jmp @@toupper632
@@toupper633:

;-1007 int head1  (char *s) {while(letter(*s)) s++;     *s=0; }
 LEAVE
 ret
; ENDP
;Number of CALLs:    8 : strlen

strlen:  ; *** PROC ***
;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1007 NULL s = bp+4
;  201 var sign word  1007 NULL c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
@@strlen636:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  @@strlen637
 inc  word[bp+4]
 inc  word[bp-2]
 jmp @@strlen636
@@strlen637:
 mov ax, [bp-2]
 jmp @@retn

;-1008 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:   24 : strcpy

strcpy:  ; *** PROC ***
;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1008 NULL s = bp+4
;  201 ptr sign byte  1008 NULL t = bp+6;
 ENTER  0,0
@@strcpy638:
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
 je  @@strcpy639
 jmp @@strcpy638
@@strcpy639:
 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-1009 int strncpy(char *s, char *t, int n) { if (_ n==0) return;
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : instr1

instr1:  ; *** PROC ***
;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1009 NULL s = bp+4
;  201 var sign byte  1009 NULL c = bp+6;
 ENTER  0,0
@@instr1640:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@instr1641
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne @@instr1642
 mov ax, 1
 jmp @@retn
@@instr1642:
 inc  word[bp+4]
 jmp @@instr1640
@@instr1641:
 mov ax, 0
 jmp @@retn

;-1010 int instr2(char *s, char c) { while(*s) { if (*s==c) return &s; s++;} return 0;}

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    2 : instr2

instr2:  ; *** PROC ***
;Function : instr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1010 NULL s = bp+4
;  201 var sign byte  1010 NULL c = bp+6;
 ENTER  0,0
@@instr2643:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@instr2644
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne @@instr2645
 mov ax, [bp+4]
 jmp @@retn
@@instr2645:
 inc  word[bp+4]
 jmp @@instr2643
@@instr2644:
 mov ax, 0
 jmp @@retn

;-1011 int digit(char c){ if(c<'0') return 0; if(c>'9') return 0; return 1; }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    2 : digit

digit:  ; *** PROC ***
;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1011 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge @@digit646
 mov ax, 0
 jmp @@retn
@@digit646:
 mov al, [bp+4]
 cmp al, 57
 jle @@digit647
 mov ax, 0
 jmp @@retn
@@digit647:
 mov ax, 1
 jmp @@retn

;-1012 int letter(char c) { if (digit(c)) return 1; if (c=='_') return 1;

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    3 : letter

letter:  ; *** PROC ***
;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1012 NULL c = bp+4;
 ENTER  0,0
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@letter648
 mov ax, 1
 jmp @@retn
@@letter648:
 mov al, [bp+4]
 cmp al, 95
 jne @@letter649
 mov ax, 1
 jmp @@retn

;-1013   if (c> 'z') return 0; if (c< '@') return 0;

@@letter649:
 mov al, [bp+4]
 cmp al, 122
 jle @@letter650
 mov ax, 0
 jmp @@retn
@@letter650:
 mov al, [bp+4]
 cmp al, 64
 jge @@letter651
 mov ax, 0
 jmp @@retn

;-1014   if (c> 'Z') { if (c< 'a') return 0; }  return 1; }

@@letter651:
 mov al, [bp+4]
 cmp al, 90
 jle @@letter652
 mov al, [bp+4]
 cmp al, 97
 jge @@letter653
 mov ax, 0
 jmp @@retn
@@letter653:
@@letter652:
 mov ax, 1
 jmp @@retn

;-1015 int eqstr(char *p, char *q) { while(*p) {

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:   80 : eqstr

eqstr:  ; *** PROC ***
;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1015 NULL p = bp+4
;  201 ptr sign byte  1015 NULL q = bp+6;
 ENTER  0,0
@@eqstr654:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eqstr655

;-1016     if (*p != *q) return 0; p++; q++; }

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  @@eqstr656
 mov ax, 0
 jmp @@retn
@@eqstr656:
 inc  word[bp+4]
 inc  word[bp+6]

;-1017     if(*q) return 0; return 1; }

 jmp @@eqstr654
@@eqstr655:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eqstr657
 mov ax, 0
 jmp @@retn
@@eqstr657:
 mov ax, 1
 jmp @@retn

;-1018 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    1 : strcat1

strcat1:  ; *** PROC ***
;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1018 NULL s = bp+4
;  201 ptr sign byte  1018 NULL t = bp+6;
 ENTER  0,0
@@strcat1658:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  @@strcat1659
 inc  word[bp+4]
 jmp @@strcat1658
@@strcat1659:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-1019 int basename(char *s) { char *p; p=0;
 LEAVE
 ret
; ENDP
;Number of CALLs:    2 : DosInt

DosInt:  ; *** PROC ***
 int  33
 jae short @@DosInt660
 inc  word[DOS_ERR]
@@DosInt660:

;-1020 int openR (char *s) { dx=s; ax=0x3D02;  DosInt(); }

 ret
; ENDP
;Number of CALLs:    3 : openR

openR:  ; *** PROC ***
;Function : openR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1020 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-1021 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : creatR

creatR:  ; *** PROC ***
;Function : creatR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1021 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-1022 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : readR

readR:  ; *** PROC ***
;Function : readR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1022 NULL s = bp+4
;  201 var sign word  1022 NULL fd = bp+6;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-1023 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : readRL

readRL:  ; *** PROC ***
;Function : readRL, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1023 NULL s = bp+4
;  201 var sign word  1023 NULL fd = bp+6
;  202 var sign word  1023 NULL len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-1024 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : fputcR

fputcR:  ; *** PROC ***
;Function : fputcR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1024 NULL n = bp+4
;  201 var sign word  1024 NULL fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]

;-1025   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-1026 int writeRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x4000; DosInt();}
 LEAVE
 ret
; ENDP
;Number of CALLs:    2 : fcloseR

fcloseR:  ; *** PROC ***
;Function : fcloseR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1026 NULL fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 int  33

;-1027 int exitR(char c) {ah=0x4C; al=c; inth 0x21; }
 LEAVE
 ret
; ENDP
;Number of CALLs:    5 : exitR

exitR:  ; *** PROC ***
;Function : exitR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1027 NULL c = bp+4;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 int  33

;-1028 int setdta(char *s) {dx=s; ah=0x1A; inth 0x21; }
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
;    2 var sign byte     4   25 NASM
;    3 def unsg byte     5    - LSTART=200
;    4 def unsg byte     6    - VARMAX=300
;    5 def unsg byte     7    - GNAMEMAX=4800
;    6 def unsg byte     8    - FUNCMAX=300
;    7 def unsg byte     9    - FNAMEMAX=4800
;    8 def unsg byte    10    - CALLMAX=2000
;    9 def unsg byte    11    - IDLENMAX=15
;   10 def unsg byte    13    - T_NAME=256
;   11 def unsg byte    14    - T_CONST=257
;   12 def unsg byte    15    - T_STRING=258
;   13 def unsg byte    16    - T_INCLUDE=510
;   14 def unsg byte    17    - T_DEFINE=511
;   15 def unsg byte    18    - T_RETURN=512
;   16 def unsg byte    19    - T_IF=513
;   17 def unsg byte    20    - T_ELSE=514
;   18 def unsg byte    21    - T_WHILE=515
;   19 def unsg byte    22    - T_DO=516
;   20 def unsg byte    23    - T_INT=517
;   21 def unsg byte    24    - T_ASM=518
;   22 def unsg byte    25    - T_ASMBLOCK=519
;   23 def unsg byte    26    - T_EMIT=520
;   24 def unsg byte    27    - T_GOTO=521
;   25 def unsg byte    28    - T_VOID=529
;   26 def unsg byte    29    - T_CHAR=530
;   27 def unsg byte    30    - T_SIGNED=531
;   28 def unsg byte    31    - T_UNSIGNED=532
;   29 def unsg byte    32    - T_LONG=533
;   30 def unsg byte    33    - T_SHORT=534
;   31 def unsg byte    35    - T_UINT32=545
;   32 def unsg byte    37    - T_INTH=600
;   33 def unsg byte    38    - T_IFCARRY=601
;   34 def unsg byte    39    - T_IFZERO=602
;   35 def unsg byte    40    - T_EQ=806
;   36 def unsg byte    41    - T_NE=807
;   37 def unsg byte    42    - T_GE=811
;   38 def unsg byte    43    - T_LE=824
;   39 def unsg byte    44    - T_PLUSPLUS=1219
;   40 def unsg byte    45    - T_MINUSMINUS=1225
;   41 def unsg byte    46    - T_PLUSASS=1230
;   42 def unsg byte    47    - T_MINUSASS=1231
;   43 def unsg byte    48    - T_MULASS=1232
;   44 def unsg byte    49    - T_DIVASS=1233
;   45 def unsg byte    50    - T_ANDASS=1234
;   46 def unsg byte    51    - T_ORASS=1235
;   47 def unsg byte    52    - T_LESSLESS=1240
;   48 def unsg byte    53    - T_GREATGREAT=1241
;   49 def unsg byte    54    - COMAX=3000
;   50 def unsg byte    55    - CMDLENMAX=67
;   51 var unsg word    56    3 ORGDATAORIG
;   52 var unsg word    56   11 orgData
;   53 arr sign byte    57    4 co[3000]
;   54 var sign word    57    4 maxco
;   55 var sign word    57    3 maxco1
;   56 arr sign byte    58    2 coname[67]
;   57 ptr sign byte    58    5 cloc
;   58 var sign word    59    7 fdin
;   59 var sign word    59    7 fdout
;   60 arr sign byte    59  111 symbol[128]
;   61 arr sign byte    60   12 fname[67]
;   62 arr sign byte    60   12 namein[67]
;   63 arr sign byte    61    7 namelst[67]
;   64 arr sign byte    61    5 archivename[67]
;   65 var sign word    62   49 token
;   66 var sign byte    62    2 globC
;   67 var sign word    62    3 spalte
;   68 var sign byte    63   28 thechar
;   69 var sign word    63    9 iscmp
;   70 var sign word    63    4 nconst
;   71 var sign word    64    3 nreturn
;   72 var sign word    64   16 nlabel
;   73 var sign word    64    3 callrecursive
;   74 var sign word    65   24 GTop
;   75 var sign word    65   20 LTop
;   76 var unsg word    66   45 lexval
;   77 var sign word    67    6 typei
;   78 var sign byte    67    8 istype
;   79 arr sign byte    67   11 GType[300]
;   80 var sign word    68    6 signi
;   81 var sign byte    68    6 issign
;   82 arr sign byte    68    5 GSign[300]
;   83 var sign word    69    9 widthi
;   84 var sign byte    69   20 iswidth
;   85 arr sign byte    69    5 GWidth[300]
;   86 arr sign word    70    4 GAdr[300]
;   87 arr sign word    70    6 GUsed[300]
;   88 var sign word    71   26 wi
;   89 arr sign word    71   11 GData[300]
;   90 arr sign byte    71    2 GNameField[4800]
;   91 var sign word    72   17 FTop
;   92 var sign word    72    9 CTop
;   93 arr sign byte    73    2 FType[300]
;   94 arr sign byte    73    5 CType[2000]
;   95 arr sign word    74    4 FAdr[300]
;   96 arr sign word    74    5 CAdr[2000]
;   97 arr sign word    75    4 FCalls[300]
;   98 arr sign byte    76    5 FNameField[4800]
;   99 arr sign byte    77    9 NameA[32]
;  100 arr sign byte    78    5 fgetsdest[128]
;  101 ptr unsg byte    78    8 CNameTop
;  102 ptr unsg byte    79   10 fgetsp
;  103 var unsg word    79    4 segE
;  104 var unsg word    80   12 lineno
;  105 var unsg word    80    2 linenoinclude
;  106 ptr unsg byte    81   19 pt
;  107 ptr unsg byte    81    8 p1
;  108 var sign word    82   10 DOS_ERR
;  109 var sign word    82    5 DOS_NoBytes
;  110 var sign byte    82    3 DOS_ByteRead
;  111 var sign word    84 NULL tt1
;  112 var sign word    84 NULL tt2
;  113 var sign dwrd    84    1 ex
;  114 arr sign byte    98    2 doglobName[15]
;  115 var sign word   248    5 mod1
;  116 var sign word   248   12 ireg1
;  117 var sign word   248    6 idx1
;  118 var sign word   248    1 ids1
;  119 var sign word   248    4 idw1
;  120 var sign word   248    2 idt1
;  121 var sign word   248 NULL val1
;  122 var sign word   249    2 mod2
;  123 var sign word   249    6 ireg2
;  124 var sign word   249    6 idx2
;  125 var sign word   249    1 ids2
;  126 var sign word   249    4 idw2
;  127 var sign word   249    2 idt2
;  128 var sign word   249    2 val2
;  129 arr sign byte   317    9 ops[5]
;  130 arr sign byte   359    3 printregstr[74]
;  131 var sign word   367    1 evalue
;  132 var sign word   367    1 exprtype
;  133 arr sign word   519    2 docalltype[10]
;  134 arr sign word   519    2 docallvalue[10]
;  135 arr sign byte   520    2 procname[17]
;  136 ptr sign byte   575    1 arglen
;  137 ptr sign byte   575    3 argv
;  138 var sign byte   623    4 wasfunction
;  139 arr sign byte   752    2 symboltemp[80]
;  140 var unsg word   938    1 MAXUI


;   # Calls Line Width  Name   list of functions

;    0    1   85   ttt
;    1    4   92   a
;    2   21   93   v
;    3    4   95   checknamelen
;    4    1   99   doglob
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
;   21    3  269   exprstart
;   22    1  271   expr2
;   23    3  318   doreg1
;   24    6  337   checkreg
;   25    6  362   printreg
;   26    2  368   expr
;   27    4  417   compoundass
;   28    2  424   dovar1
;   29    8  445   rterm
;   30    1  458   isreg
;   31   15  476   doreg
;   32    1  482   doassign
;   33    1  500   domul
;   34    2  504   doidiv
;   35    1  517   domod
;   36    1  521   docall1
;   37 NULL  563   main
;   38    3  574   getfirstchar
;   39    1  576   getarg
;   40    2  599   parse
;   41    2  608   checkcalls
;   42    1  624   doar
;   43    1  651   getfunctionhead
;   44    1  658   doinclude
;   45    1  669   dodefine
;   46    8  685   stmt
;   47    1  709   doemit
;   48    3  713   cmpneg
;   49    9  726   prlabel
;   50    3  727   prjump
;   51    1  728   doif
;   52    1  733   doifcarry
;   53    1  736   doifzero
;   54    1  739   dodo
;   55    1  743   dowhile
;   56    4  746   isrelational
;   57   19  753   getlex
;   58    1  810   convertdefine
;   59    1  817   getdigit
;   60    1  826   getstring
;   61   31  829   next
;   62   84  830   istoken
;   63   38  831   expect
;   64    6  834   eprc
;   65    5  835   eprs
;   66   41  836   prc
;   67    3  841   prscomment
;   68    8  843   prnl
;   69  283  845   prs
;   70    2  850   eprnum
;   71   18  852   pint1
;   72   29  854   prunsign1
;   73   26  857   printint51
;   74    2  861   fgets1
;   75    1  865   printinputline
;   76    2  873   end1
;   77   50  874   error1
;   78    2  883   listproc
;   79    2  891   listvar
;   80    1  907   listcall
;   81    1  910   calllisting
;   82    1  916   countcalls
;   83    1  924   listfunc
;   84    1  928   funclisting
;   85    1  939   epilog
;   86    1  971   setblock
;   87    1  973   allocmem
;   88 NULL  977   copyF
;   89    1  983   to_far
;   90    4  991   from_far
;   91    4 1000   writetty
;   92    3 1001   putch
;   93   12 1002   cputs
;   94    4 1003   mkneg
;   95    2 1004   pint
;   96    1 1006   toupper
;   97    8 1007   strlen
;   98   25 1008   strcpy
;   99    1 1009   instr1
;  100    2 1010   instr2
;  101    3 1011   digit
;  102    3 1012   letter
;  103   80 1015   eqstr
;  104    1 1018   strcat1
;  105    7 1019   DosInt
;  106    3 1020   openR
;  107    1 1021   creatR
;  108    1 1022   readR
;  109    1 1023   readRL
;  110    1 1024   fputcR
;  111    2 1026   fcloseR
;  112    5 1027   exitR
;  113 NULL 1028   LastFunctionByt

;    #  addr name   list of CALLs

;    0     0 ttt
;    1     4 prs
;    2     8 printName
;    3    18 prc
;    4    22 printName
;    5    32 prc
;    6    36 strlen
;    7    43 error1
;    8    50 error1
;    9    57 error1
;   10    64 checknamelen
;   11    77 checkName
;   12    87 error1
;   13    94 istoken
;   14   102 istoken
;   15   110 prs
;   16   114 prunsign1
;   17   124 prs
;   18   128 prunsign1
;   19   138 prs
;   20   142 prs
;   21   146 prs
;   22   150 prs
;   23   154 prs
;   24   158 prs
;   25   162 prs
;   26   166 prs
;   27   170 prunsign1
;   28   180 prs
;   29   184 prs
;   30   188 prs
;   31   192 expect
;   32   199 expect
;   33   206 error1
;   34   213 prs
;   35   217 prs
;   36   221 prs
;   37   225 strcpy
;   38   232 expect
;   39   239 istoken
;   40   247 prc
;   41   251 prscomment
;   42   262 prc
;   43   266 prs
;   44   270 strlen
;   45   277 istoken
;   46   285 prc
;   47   289 expect
;   48   296 prunsign1
;   49   306 istoken
;   50   314 expect
;   51   321 error1
;   52   328 prs
;   53   332 prs
;   54   336 prs
;   55   340 prs
;   56   344 prs
;   57   348 prs
;   58   352 istoken
;   59   360 prc
;   60   364 istoken
;   61   372 expect
;   62   379 prunsign1
;   63   389 prunsign1
;   64   399 adrofname
;   65   409 strcpy
;   66   416 strcpy
;   67   423 expect
;   68   430 adrF
;   69   435 adrofname
;   70   445 prs
;   71   449 prs
;   72   453 prc
;   73   457 pint1
;   74   463 prc
;   75   467 checkName
;   76   477 error1
;   77   484 adrofname
;   78   494 eqstr
;   79   500 adrofname
;   80   510 eqstr
;   81   516 istoken
;   82   524 istoken
;   83   532 istoken
;   84   540 istoken
;   85   548 istoken
;   86   556 istoken
;   87   564 istoken
;   88   572 istoken
;   89   580 istoken
;   90   588 istoken
;   91   596 name1
;   92   602 error1
;   93   609 getlex
;   94   616 error1
;   95   623 error1
;   96   630 strlen
;   97   637 to_far
;   98   644 error1
;   99   651 adrF
;  100   656 strcpy
;  101   663 error1
;  102   670 checkName
;  103   680 error1
;  104   687 adrF
;  105   692 strcpy
;  106   699 adrF
;  107   704 eqstr
;  108   710 checknamelen
;  109   723 strcpy
;  110   730 checkFunction
;  111   744 error1
;  112   751 storefunc
;  113   761 prs
;  114   765 prs
;  115   769 prs
;  116   773 expect
;  117   780 istoken
;  118   788 typeName
;  119   797 addlocal
;  120   806 istoken
;  121   814 expect
;  122   821 expect
;  123   828 isvariable
;  124   839 typeName
;  125   848 checknamelen
;  126   861 addlocal
;  127   870 istoken
;  128   878 expect
;  129   885 expect
;  130   892 istoken
;  131   900 expect
;  132   907 listproc
;  133   916 prs
;  134   920 mkneg
;  135   926 pint1
;  136   932 prs
;  137   936 istoken
;  138   944 stmt
;  139   949 prs
;  140   953 prs
;  141   957 prs
;  142   961 prs
;  143   965 prs
;  144   969 strlen
;  145   976 strcpy
;  146   983 expect
;  147   990 eqstr
;  148   996 constantexpr
;  149  1009 checkreg
;  150  1018 doreg1
;  151  1025 exprstart
;  152  1035 prs
;  153  1039 prs
;  154  1043 expect
;  155  1050 getlex
;  156  1057 typeName
;  157  1066 searchname
;  158  1077 gettypes
;  159  1086 isrelational
;  160  1099 error1
;  161  1106 expect
;  162  1113 prs
;  163  1117 prs
;  164  1121 gettypes
;  165  1130 prs
;  166  1134 prs
;  167  1138 prs
;  168  1142 v
;  169  1144 prs
;  170  1148 prunsign1
;  171  1158 cmpneg
;  172  1165 prs
;  173  1169 expect
;  174  1176 eqstr
;  175  1182 expr2
;  176  1188 expr
;  177  1193 getlex
;  178  1200 typeName
;  179  1209 error1
;  180  1216 checkreg
;  181  1225 doreg1
;  182  1232 searchname
;  183  1243 gettypes
;  184  1252 error1
;  185  1259 isrelational
;  186  1272 error1
;  187  1279 istoken
;  188  1287 error1
;  189  1294 istoken
;  190  1302 prs
;  191  1306 prs
;  192  1310 prs
;  193  1314 prs
;  194  1318 prs
;  195  1322 prs
;  196  1326 v
;  197  1328 prs
;  198  1332 prunsign1
;  199  1342 adrofname
;  200  1352 prs
;  201  1356 prs
;  202  1360 typeName
;  203  1369 checkreg
;  204  1378 prs
;  205  1382 printreg
;  206  1391 v
;  207  1393 prs
;  208  1397 printreg
;  209  1406 error1
;  210  1413 searchname
;  211  1424 gettypes
;  212  1433 error1
;  213  1440 prs
;  214  1444 printreg
;  215  1453 error1
;  216  1460 prs
;  217  1464 a
;  218  1466 prs
;  219  1470 prs
;  220  1474 prs
;  221  1478 prs
;  222  1482 v
;  223  1484 adrofname
;  224  1494 prs
;  225  1498 prs
;  226  1502 error1
;  227  1509 istoken
;  228  1517 strcpy
;  229  1524 istoken
;  230  1532 strcpy
;  231  1539 istoken
;  232  1547 strcpy
;  233  1554 istoken
;  234  1562 strcpy
;  235  1569 istoken
;  236  1577 strcpy
;  237  1584 istoken
;  238  1592 strcpy
;  239  1599 istoken
;  240  1607 strcpy
;  241  1614 getlex
;  242  1621 isrelational
;  243  1634 error1
;  244  1641 strcpy
;  245  1648 prnl
;  246  1653 prs
;  247  1657 prs
;  248  1661 printreg
;  249  1670 prs
;  250  1674 istoken
;  251  1682 prunsign1
;  252  1692 typeName
;  253  1701 checkreg
;  254  1710 printreg
;  255  1719 searchname
;  256  1730 a
;  257  1732 v
;  258  1734 cmpneg
;  259  1741 prs
;  260  1745 expect
;  261  1752 strlen
;  262  1759 eqstr
;  263  1765 eqstr
;  264  1771 eqstr
;  265  1777 eqstr
;  266  1783 eqstr
;  267  1789 eqstr
;  268  1795 eqstr
;  269  1801 eqstr
;  270  1807 eqstr
;  271  1813 eqstr
;  272  1819 eqstr
;  273  1825 eqstr
;  274  1831 eqstr
;  275  1837 eqstr
;  276  1843 eqstr
;  277  1849 eqstr
;  278  1855 eqstr
;  279  1861 eqstr
;  280  1867 eqstr
;  281  1873 eqstr
;  282  1879 eqstr
;  283  1885 eqstr
;  284  1891 strlen
;  285  1898 eqstr
;  286  1904 eqstr
;  287  1910 eqstr
;  288  1916 eqstr
;  289  1922 eqstr
;  290  1928 eqstr
;  291  1934 eqstr
;  292  1940 eqstr
;  293  1946 eqstr
;  294  1952 prc
;  295  1956 prc
;  296  1960 prc
;  297  1964 istoken
;  298  1972 prs
;  299  1976 prunsign1
;  300  1986 typeName
;  301  1995 checkreg
;  302  2004 doreg1
;  303  2011 docall1
;  304  2019 isreg
;  305  2025 searchname
;  306  2036 gettypes
;  307  2045 istoken
;  308  2053 istoken
;  309  2061 expect
;  310  2068 searchname
;  311  2079 expect
;  312  2086 expect
;  313  2093 gettypes
;  314  2102 error1
;  315  2109 istoken
;  316  2117 error1
;  317  2124 prs
;  318  2128 prs
;  319  2132 prs
;  320  2136 prs
;  321  2140 v
;  322  2142 istoken
;  323  2150 error1
;  324  2157 prs
;  325  2161 prs
;  326  2165 prs
;  327  2169 prs
;  328  2173 v
;  329  2175 istoken
;  330  2183 compoundass
;  331  2195 istoken
;  332  2203 compoundass
;  333  2215 istoken
;  334  2223 compoundass
;  335  2235 istoken
;  336  2243 compoundass
;  337  2255 istoken
;  338  2263 error1
;  339  2270 istoken
;  340  2278 error1
;  341  2285 istoken
;  342  2293 expr
;  343  2298 doassign
;  344  2307 dovar1
;  345  2314 istoken
;  346  2322 rterm
;  347  2328 istoken
;  348  2336 rterm
;  349  2342 istoken
;  350  2350 rterm
;  351  2356 istoken
;  352  2364 rterm
;  353  2370 istoken
;  354  2378 rterm
;  355  2384 istoken
;  356  2392 rterm
;  357  2398 istoken
;  358  2406 domul
;  359  2412 istoken
;  360  2420 doidiv
;  361  2427 istoken
;  362  2435 domod
;  363  2441 isrelational
;  364  2454 rterm
;  365  2460 cmpneg
;  366  2467 error1
;  367  2474 prnl
;  368  2479 prs
;  369  2483 prs
;  370  2487 gettypes
;  371  2496 prs
;  372  2500 prs
;  373  2504 prs
;  374  2508 v
;  375  2510 prs
;  376  2514 expect
;  377  2521 prunsign1
;  378  2531 gettypes
;  379  2540 prs
;  380  2544 v
;  381  2546 prnl
;  382  2551 prs
;  383  2555 prs
;  384  2559 prs
;  385  2563 prnl
;  386  2568 prs
;  387  2572 prs
;  388  2576 a
;  389  2578 prs
;  390  2582 v
;  391  2584 prs
;  392  2588 prs
;  393  2592 prs
;  394  2596 prs
;  395  2600 prs
;  396  2604 prc
;  397  2608 printName
;  398  2618 prs
;  399  2622 prnl
;  400  2627 prs
;  401  2631 prs
;  402  2635 prs
;  403  2639 prs
;  404  2643 v
;  405  2645 istoken
;  406  2653 prnl
;  407  2658 prs
;  408  2662 prs
;  409  2666 prs
;  410  2670 prs
;  411  2674 prunsign1
;  412  2684 typeName
;  413  2693 searchname
;  414  2704 istoken
;  415  2712 searchname
;  416  2723 expect
;  417  2730 expect
;  418  2737 gettypes
;  419  2746 error1
;  420  2753 eqstr
;  421  2759 dovar1
;  422  2766 eqstr
;  423  2772 doreg
;  424  2778 eqstr
;  425  2784 doreg
;  426  2790 eqstr
;  427  2796 doreg
;  428  2802 eqstr
;  429  2808 doreg
;  430  2814 eqstr
;  431  2820 doreg
;  432  2826 eqstr
;  433  2832 doreg
;  434  2838 eqstr
;  435  2844 doreg
;  436  2850 eqstr
;  437  2856 doreg
;  438  2862 eqstr
;  439  2868 doreg
;  440  2874 eqstr
;  441  2880 doreg
;  442  2886 eqstr
;  443  2892 doreg
;  444  2898 eqstr
;  445  2904 doreg
;  446  2910 eqstr
;  447  2916 doreg
;  448  2922 eqstr
;  449  2928 doreg
;  450  2934 eqstr
;  451  2940 doreg
;  452  2946 expect
;  453  2953 prs
;  454  2957 prs
;  455  2961 prs
;  456  2965 istoken
;  457  2973 prunsign1
;  458  2983 istoken
;  459  2991 searchname
;  460  3002 v
;  461  3004 error1
;  462  3011 gettypes
;  463  3020 prs
;  464  3024 v
;  465  3026 prs
;  466  3030 prs
;  467  3034 prs
;  468  3038 a
;  469  3040 prs
;  470  3044 prs
;  471  3048 prunsign1
;  472  3058 v
;  473  3060 prs
;  474  3064 prs
;  475  3068 printName
;  476  3078 prs
;  477  3082 prs
;  478  3086 prs
;  479  3090 prs
;  480  3094 prs
;  481  3098 v
;  482  3100 prs
;  483  3104 prs
;  484  3108 prs
;  485  3112 prs
;  486  3116 v
;  487  3118 prs
;  488  3122 prs
;  489  3126 prs
;  490  3130 prs
;  491  3134 v
;  492  3136 prs
;  493  3140 rterm
;  494  3146 istoken
;  495  3154 prs
;  496  3158 prunsign1
;  497  3168 prs
;  498  3172 error1
;  499  3179 istoken
;  500  3187 prs
;  501  3191 prunsign1
;  502  3201 prs
;  503  3205 prs
;  504  3209 typeName
;  505  3218 searchname
;  506  3229 error1
;  507  3236 gettypes
;  508  3245 error1
;  509  3252 error1
;  510  3259 prs
;  511  3263 v
;  512  3265 prs
;  513  3269 prs
;  514  3273 doidiv
;  515  3280 prs
;  516  3284 checknamelen
;  517  3297 strcpy
;  518  3304 storecall
;  519  3314 expect
;  520  3321 istoken
;  521  3329 error1
;  522  3336 istoken
;  523  3344 istoken
;  524  3352 eprs
;  525  3357 eprs
;  526  3362 eprc
;  527  3367 eprnum
;  528  3374 eprs
;  529  3379 eprc
;  530  3384 eprs
;  531  3389 eprc
;  532  3394 eprs
;  533  3399 istoken
;  534  3407 name1
;  535  3413 searchname
;  536  3424 istoken
;  537  3432 checkreg
;  538  3441 searchname
;  539  3452 error1
;  540  3459 istoken
;  541  3467 expect
;  542  3474 prs
;  543  3478 pint1
;  544  3484 prs
;  545  3488 prs
;  546  3492 prs
;  547  3496 prc
;  548  3500 pint1
;  549  3506 prs
;  550  3510 prs
;  551  3514 v
;  552  3516 prs
;  553  3520 gettypes
;  554  3529 prs
;  555  3533 prs
;  556  3537 v
;  557  3539 prs
;  558  3543 prs
;  559  3547 v
;  560  3549 prs
;  561  3553 prs
;  562  3557 printreg
;  563  3566 prs
;  564  3570 prs
;  565  3574 prs
;  566  3578 pint1
;  567  3584 getarg
;  568  3591 setblock
;  569  3600 error1
;  570  3607 allocmem
;  571  3616 error1
;  572  3623 getfirstchar
;  573  3636 parse
;  574  3642 checkcalls
;  575  3653 epilog
;  576  3660 fgets1
;  577  3667 cputs
;  578  3673 cputs
;  579  3679 readRL
;  580  3686 prnl
;  581  3691 strcpy
;  582  3698 instr2
;  583  3705 strcat1
;  584  3713 toupper
;  585  3721 instr2
;  586  3728 strcpy
;  587  3735 cputs
;  588  3741 exitR
;  589  3747 strcpy
;  590  3754 strlen
;  591  3761 openR
;  592  3767 cputs
;  593  3773 cputs
;  594  3779 exitR
;  595  3785 creatR
;  596  3792 cputs
;  597  3798 cputs
;  598  3804 exitR
;  599  3810 prs
;  600  3814 prs
;  601  3818 prs
;  602  3822 pint1
;  603  3828 prs
;  604  3832 prs
;  605  3836 prs
;  606  3840 prs
;  607  3844 prs
;  608  3848 prs
;  609  3852 prs
;  610  3856 prs
;  611  3860 getlex
;  612  3867 istoken
;  613  3875 istoken
;  614  3883 dodefine
;  615  3892 istoken
;  616  3900 doinclude
;  617  3910 error1
;  618  3917 typeName
;  619  3926 dofunc
;  620  3933 doglob
;  621  3940 prs
;  622  3944 from_far
;  623  3953 adrF
;  624  3958 eqstr
;  625  3964 prs
;  626  3968 prs
;  627  3972 doar
;  628  3977 prs
;  629  3981 cputs
;  630  3987 cputs
;  631  3993 pint
;  632  3998 prs
;  633  4002 printint51
;  634  4013 openR
;  635  4019 cputs
;  636  4025 cputs
;  637  4031 exitR
;  638  4037 prs
;  639  4041 prs
;  640  4045 getfirstchar
;  641  4058 getfunctionhead
;  642  4074 from_far
;  643  4083 eqstr
;  644  4089 prs
;  645  4093 printint51
;  646  4104 prs
;  647  4108 prs
;  648  4112 dofunc
;  649  4119 prs
;  650  4123 checkcalls
;  651  4134 putch
;  652  4140 cputs
;  653  4146 error1
;  654  4153 getlex
;  655  4160 istoken
;  656  4168 getlex
;  657  4175 prs
;  658  4179 prs
;  659  4183 openR
;  660  4189 prs
;  661  4193 prs
;  662  4197 error1
;  663  4204 parse
;  664  4210 prs
;  665  4214 prs
;  666  4218 getfirstchar
;  667  4231 getlex
;  668  4238 eqstr
;  669  4244 getlex
;  670  4251 eqstr
;  671  4257 getlex
;  672  4264 prs
;  673  4268 strcpy
;  674  4275 prs
;  675  4279 error1
;  676  4286 getlex
;  677  4293 expect
;  678  4300 error1
;  679  4307 strlen
;  680  4314 error1
;  681  4321 adrofname
;  682  4331 strcpy
;  683  4338 expect
;  684  4345 istoken
;  685  4353 istoken
;  686  4361 stmt
;  687  4366 istoken
;  688  4374 doif
;  689  4379 istoken
;  690  4387 dodo
;  691  4392 istoken
;  692  4400 dowhile
;  693  4408 istoken
;  694  4416 prs
;  695  4420 name1
;  696  4426 prs
;  697  4430 expect
;  698  4437 prs
;  699  4441 next
;  700  4446 prc
;  701  4450 next
;  702  4455 getlex
;  703  4462 istoken
;  704  4470 prs
;  705  4474 next
;  706  4479 prc
;  707  4483 next
;  708  4488 getlex
;  709  4495 error1
;  710  4502 istoken
;  711  4510 prs
;  712  4514 expect
;  713  4521 prunsign1
;  714  4531 expect
;  715  4538 istoken
;  716  4546 doifcarry
;  717  4556 istoken
;  718  4564 doifzero
;  719  4573 istoken
;  720  4581 doemit
;  721  4588 istoken
;  722  4596 istoken
;  723  4604 exprstart
;  724  4614 prs
;  725  4618 expect
;  726  4625 prs
;  727  4629 prs
;  728  4633 prc
;  729  4637 expect
;  730  4644 expect
;  731  4651 exprstart
;  732  4661 expect
;  733  4668 prs
;  734  4672 getlex
;  735  4679 prunsign1
;  736  4689 getlex
;  737  4696 prc
;  738  4700 expect
;  739  4707 prs
;  740  4711 prs
;  741  4715 prs
;  742  4719 prs
;  743  4723 prs
;  744  4727 prunsign1
;  745  4737 prs
;  746  4741 prs
;  747  4745 prunsign1
;  748  4755 prs
;  749  4759 prs
;  750  4763 prs
;  751  4767 error1
;  752  4774 prs
;  753  4778 prs
;  754  4782 pint1
;  755  4788 prc
;  756  4792 prs
;  757  4796 prs
;  758  4800 pint1
;  759  4806 pexpr
;  760  4812 pint1
;  761  4818 stmt
;  762  4823 istoken
;  763  4831 prjump
;  764  4838 prlabel
;  765  4846 stmt
;  766  4851 prlabel
;  767  4859 prlabel
;  768  4867 prs
;  769  4871 prs
;  770  4875 pint1
;  771  4881 stmt
;  772  4886 prlabel
;  773  4894 prs
;  774  4898 prs
;  775  4902 pint1
;  776  4908 stmt
;  777  4913 prlabel
;  778  4921 prlabel
;  779  4929 stmt
;  780  4934 expect
;  781  4941 pexpr
;  782  4947 pint1
;  783  4953 prjump
;  784  4960 prlabel
;  785  4968 prlabel
;  786  4976 pexpr
;  787  4982 pint1
;  788  4988 stmt
;  789  4993 prjump
;  790  5000 prlabel
;  791  5008 getlex
;  792  5015 next
;  793  5020 next
;  794  5025 next
;  795  5030 next
;  796  5035 next
;  797  5040 next
;  798  5045 next
;  799  5050 next
;  800  5055 next
;  801  5060 next
;  802  5065 next
;  803  5070 next
;  804  5075 next
;  805  5080 next
;  806  5085 next
;  807  5090 instr1
;  808  5097 next
;  809  5102 getlex
;  810  5109 next
;  811  5114 next
;  812  5119 getlex
;  813  5126 getstring
;  814  5136 digit
;  815  5142 getdigit
;  816  5151 next
;  817  5156 next
;  818  5161 next
;  819  5166 letter
;  820  5173 strcpy
;  821  5180 letter
;  822  5187 next
;  823  5192 eqstr
;  824  5198 eqstr
;  825  5204 eqstr
;  826  5210 eqstr
;  827  5216 eqstr
;  828  5222 eqstr
;  829  5228 eqstr
;  830  5234 eqstr
;  831  5240 eqstr
;  832  5246 eqstr
;  833  5252 eqstr
;  834  5258 eqstr
;  835  5264 eqstr
;  836  5270 eqstr
;  837  5276 eqstr
;  838  5282 eqstr
;  839  5288 eqstr
;  840  5294 eqstr
;  841  5300 eqstr
;  842  5306 eqstr
;  843  5312 eqstr
;  844  5318 eqstr
;  845  5324 convertdefine
;  846  5338 strcpy
;  847  5345 error1
;  848  5352 adrofname
;  849  5362 eqstr
;  850  5368 next
;  851  5373 letter
;  852  5380 next
;  853  5385 digit
;  854  5391 next
;  855  5396 next
;  856  5401 next
;  857  5406 fgets1
;  858  5413 getlex
;  859  5420 istoken
;  860  5428 prs
;  861  5432 listproc
;  862  5441 prs
;  863  5445 pint1
;  864  5451 error1
;  865  5458 eprc
;  866  5463 writetty
;  867  5472 writetty
;  868  5481 fputcR
;  869  5488 prc
;  870  5492 prs
;  871  5496 prc
;  872  5500 eprc
;  873  5505 mkneg
;  874  5511 eprnum
;  875  5518 eprc
;  876  5523 prc
;  877  5527 mkneg
;  878  5533 pint1
;  879  5539 prc
;  880  5543 prunsign1
;  881  5553 prc
;  882  5557 prc
;  883  5561 prc
;  884  5565 prc
;  885  5569 prc
;  886  5573 prunsign1
;  887  5583 printinputline
;  888  5598 readR
;  889  5604 prs
;  890  5608 prunsign1
;  891  5618 prc
;  892  5622 prscomment
;  893  5633 fcloseR
;  894  5641 fcloseR
;  895  5649 exitR
;  896  5655 prnl
;  897  5660 prscomment
;  898  5671 prs
;  899  5675 prunsign1
;  900  5685 prs
;  901  5689 prs
;  902  5693 prs
;  903  5697 pint1
;  904  5703 prs
;  905  5707 prunsign1
;  906  5717 prs
;  907  5721 prc
;  908  5725 prs
;  909  5729 pint1
;  910  5735 prs
;  911  5739 prs
;  912  5743 end1
;  913  5748 prs
;  914  5752 prs
;  915  5756 prs
;  916  5760 prunsign1
;  917  5770 prs
;  918  5774 listvar
;  919  5782 prs
;  920  5786 printint51
;  921  5797 prc
;  922  5801 prs
;  923  5805 prs
;  924  5809 prs
;  925  5813 prs
;  926  5817 prs
;  927  5821 prs
;  928  5825 prs
;  929  5829 prs
;  930  5833 prs
;  931  5837 printint51
;  932  5848 printint51
;  933  5859 prs
;  934  5863 prs
;  935  5867 prc
;  936  5871 adrofname
;  937  5881 prs
;  938  5885 prc
;  939  5889 prunsign1
;  940  5899 prc
;  941  5903 prunsign1
;  942  5913 prc
;  943  5917 prs
;  944  5921 prc
;  945  5925 pint1
;  946  5931 prs
;  947  5935 calllisting
;  948  5947 prs
;  949  5951 printint51
;  950  5962 prc
;  951  5966 prs
;  952  5970 printint51
;  953  5981 prc
;  954  5985 from_far
;  955  5994 prs
;  956  5998 adrF
;  957  6003 from_far
;  958  6012 eqstr
;  959  6018 prs
;  960  6022 countcalls
;  961  6033 funclisting
;  962  6045 prs
;  963  6049 printint51
;  964  6060 printint51
;  965  6071 prs
;  966  6075 printint51
;  967  6086 prc
;  968  6090 prs
;  969  6094 prs
;  970  6098 prs
;  971  6102 prs
;  972  6106 prc
;  973  6110 prc
;  974  6114 adrF
;  975  6119 prs
;  976  6123 strcpy
;  977  6130 storefunc
;  978  6140 prs
;  979  6144 prs
;  980  6148 listvar
;  981  6156 listfunc
;  982  6165 listcall
;  983  6174 prs
;  984  6178 prs
;  985  6182 prs
;  986  6186 prs
;  987  6190 prs
;  988  6194 printint51
;  989  6205 prs
;  990  6209 printint51
;  991  6220 prs
;  992  6224 printint51
;  993  6235 prs
;  994  6239 printint51
;  995  6250 prs
;  996  6254 printint51
;  997  6265 prs
;  998  6269 printint51
;  999  6280 prs
; 1000  6284 printint51
; 1001  6295 prs
; 1002  6299 printint51
; 1003  6310 prs
; 1004  6314 printint51
; 1005  6325 prs
; 1006  6329 printint51
; 1007  6340 prs
; 1008  6344 printint51
; 1009  6355 prs
; 1010  6359 printint51
; 1011  6370 prs
; 1012  6374 prs
; 1013  6378 prunsign1
; 1014  6388 prs
; 1015  6392 printint51
; 1016  6403 prs
; 1017  6407 prs
; 1018  6411 prs
; 1019  6415 prs
; 1020  6419 printint51
; 1021  6430 prs
; 1022  6434 printint51
; 1023  6445 prs
; 1024  6449 printint51
; 1025  6460 prs
; 1026  6464 prs
; 1027  6468 end1
; 1028  6473 DosInt
; 1029  6480 DosInt
; 1030  6487 writetty
; 1031  6496 writetty
; 1032  6505 putch
; 1033  6511 prc
; 1034  6515 mkneg
; 1035  6521 pint
; 1036  6526 putch
; 1037  6532 digit
; 1038  6538 strcpy
; 1039  6545 DosInt
; 1040  6552 DosInt
; 1041  6559 DosInt
; 1042  6566 DosInt
; 1043  6573 DosInt
;Input: A.C, List: A.S,  Lines: 1029
;Glob. variables:  140 max.:  200
;Functions      :  114 max.:  300
;Calls          : 1044 max.: 2000, NameField: 6580 max.:    65535
;Code until     :23721 max.: 30000, free: 6279
;Data (HeapEnd) :53548, resting stacksize: 11987
;Max. Const in 'epilog' :  971 max. 3000, free: 2029