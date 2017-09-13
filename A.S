
; F.COM CComp V0.6, Arglen: 4, Argv: A.C, Source: A.C, Output asm: A.S
org  256 ; NASM ON
jmp main

;-1 //  @@ret redefined 2011.04.25


;-2 char Version1[]="F.COM CComp V0.6";

Version1 db "F.COM CComp V0.6",0

;-3 #define BSS


;-4 #define ARCHIVE "AR.C"

;Use archive file: AR.C

;-5 char BSS=1;  char NASM=1;  char LIST=1;

BSS db 1
NASM db 1
LIST db 1

;-6 #define LSTART        200


;-7 #define VARMAX        300


;-8 #define GNAMEMAX     4800 // 16*VARMAX


;-9 #define FUNCMAX       300


;-10 #define FNAMEMAX     4800 // 16*FUNCMAX


;-11 #define CALLMAX      2000


;-12 #define IDLENMAX       15


;-13 #define _                 // Konstantvergleich


;-14 #define T_NAME        256


;-15 #define T_CONST       257 


;-16 #define T_STRING      258     


;-17 #define T_INCLUDE     510     


;-18 #define T_DEFINE      511  


;-19 #define T_RETURN      512


;-20 #define T_IF          513      


;-21 #define T_ELSE        514  


;-22 #define T_WHILE       515      


;-23 #define T_DO          516


;-24 #define T_INT         517     


;-25 #define T_ASM         518   


;-26 #define T_ASMBLOCK    519   


;-27 #define T_EMIT        520


;-28 #define T_GOTO        521    


;-29 #define T_VOID        529  


;-30 #define T_CHAR        530       


;-31 #define T_SIGNED      531


;-32 #define T_UNSIGNED    532


;-33 #define T_LONG        533


;-34 #define T_SHORT       534


;-35 //T_INT8 540   T_UINT8 541   T_INT16 542   T_UINT16 543   T_INT32 544


;-36 #define T_UINT32      545


;-37 //T_INT64 546   T_UINT64 547


;-38 #define T_INTH        600


;-39 #define T_IFCARRY     601


;-40 #define T_IFZERO      602


;-41 #define T_EQ          806


;-42 #define T_NE          807


;-43 #define T_GE          811


;-44 #define T_LE          824


;-45 #define T_PLUSPLUS   1219


;-46 #define T_MINUSMINUS 1225


;-47 #define T_PLUSASS    1230


;-48 #define T_MINUSASS   1231


;-49 #define T_MULASS     1232


;-50 #define T_DIVASS     1233


;-51 #define T_ANDASS     1234


;-52 #define T_ORASS      1235


;-53 #define T_LESSLESS   1240


;-54 #define T_GREATGREAT 1241


;-55 #define COMAX        3000


;-56 #define CMDLENMAX      67


;-57 unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;

ORGDATAORIG dw 30000
orgData dw 30000

;-58 char co[COMAX];    int maxco=0;      int maxco1=0;

section .bss
absolute 30000
co resb 3000
section .text
maxco dw 0
maxco1 dw 0

;-59 char coname[CMDLENMAX];              char *cloc=0;

section .bss
absolute 33000
coname resb 67
section .text
cloc dw 0

;-60 int fdin=0;        int fdout=0;      char symbol[128];

fdin dw 0
fdout dw 0
section .bss
absolute 33067
symbol resb 128
section .text

;-61 char fname[CMDLENMAX];               char namein[CMDLENMAX];

section .bss
absolute 33195
fname resb 67
section .text
section .bss
absolute 33262
namein resb 67
section .text

;-62 char namelst[CMDLENMAX];             char archivename[CMDLENMAX];

section .bss
absolute 33329
namelst resb 67
section .text
section .bss
absolute 33396
archivename resb 67
section .text

;-63 int token=0;       char globC=0;     int spalte=0;

token dw 0
globC db 0
spalte dw 0

;-64 char thechar=0;    int iscmp=0;      int nconst=0;

thechar db 0
iscmp dw 0
nconst dw 0

;-65 int nreturn=0;     int nlabel=0;     int callrecursive=0;

nreturn dw 0
nlabel dw 0
callrecursive dw 0

;-66 int GTop=1;        int LTop=150;

GTop dw 1
LTop dw 150

;-67 unsigned int lexval=0;

lexval dw 0

;-68 int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#

typei dw 0
istype db 0
section .bss
absolute 33463
GType resb 300
section .text

;-69 int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S

signi dw 0
issign db 0
section .bss
absolute 33763
GSign resb 300
section .text

;-70 int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4

widthi dw 0
iswidth db 0
section .bss
absolute 34063
GWidth resb 300
section .text

;-71              int GAdr[VARMAX]; int  GUsed [VARMAX];

section .bss
absolute 34363
GAdr resw 300
section .text
section .bss
absolute 34963
GUsed resw 300
section .text

;-72 int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];

wi dw 0
section .bss
absolute 35563
GData resw 300
section .text
section .bss
absolute 36163
GNameField resb 4800
section .text

;-73 int  FTop=0;                 int  CTop=0;

FTop dw 0
CTop dw 0

;-74 char FType [FUNCMAX];        char CType[CALLMAX];

section .bss
absolute 40963
FType resb 300
section .text
section .bss
absolute 41263
CType resb 2000
section .text

;-75 int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];

section .bss
absolute 43263
FAdr resw 300
section .text
section .bss
absolute 43863
CAdr resw 2000
section .text

;-76 int  FCalls[FUNCMAX];

section .bss
absolute 47863
FCalls resw 300
section .text

;-77 char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];

section .bss
absolute 48463
FNameField resb 4800
section .text

;-78 char NameA[]="12345678901234567890123456789012"; //must be in low memory

NameA db "12345678901234567890123456789012",0

;-79 char fgetsdest[128];         unsigned char *CNameTop=0;

section .bss
absolute 53263
fgetsdest resb 128
section .text
CNameTop dw 0

;-80 unsigned char *fgetsp=0;     unsigned int segE;

fgetsp dw 0
segE dw 0

;-81 unsigned int lineno=1;       unsigned int linenoinclude=1;

lineno dw 1
linenoinclude dw 1

;-82 unsigned char *pt=0;         unsigned char *p1=0;

pt dw 0
p1 dw 0

;-83 int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;

DOS_ERR dw 0
DOS_NoBytes dw 0
DOS_ByteRead db 0

;-84 


;-85 int tt1=7; int tt2; long ex;

tt1 dw 7
tt2 dw 0
ex dd 0

;-86 void ttt(long par1) {


ttt:  ; *** PROC ***

;-87   int i1; long in; int i9;


;-88   ttt(in, ex );

;Function : ttt, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign dwrd    86 NULL par1 = bp+4
;  201 var sign word    87 NULL i1 = bp-2
;  202 var sign dwrd    87 NULL in = bp-6
;  203 var sign word    87 NULL i9 = bp-8;
 ENTER  8,0
 mov al, byte [ex]
 mov ah, 0
 push ax
 mov al, byte [bp-6]
 mov ah, 0
 push ax
 call ttt
 add  sp, 4

;-89  si = &FTop;  si=FTop;

 mov  si, FTop
 mov  si, [FTop]

;-90  si= &FAdr;     si=FAdr;

 mov  si, FAdr
 mov  si, [FAdr]

;-91  &FTop;         FTop;

 mov ax, FTop
 mov ax, [FTop]

;-92   }


;-93 int a(unsigned int i) { if(NASM == 0) prs("offset "); printName(i);}//address
 LEAVE
 ret
; ENDP

a:  ; *** PROC ***
;Function : a, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word    93 NULL i = bp+4;
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

;-94 int v(unsigned int i) { if(NASM) { if (i < LSTART) prc('['); }
 LEAVE
 ret
; ENDP
a_0 db "offset ",0

v:  ; *** PROC ***
;Function : v, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word    94 NULL i = bp+4;
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

;-95   printName(i); if(NASM) { if (i < LSTART) prc(']'); }   }//value

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

;-96 int checknamelen() { int i;    i=strlen(symbol);
 LEAVE
 ret
; ENDP

checknamelen:  ; *** PROC ***
;Function : checknamelen, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word    96 NULL i = bp-2;
 ENTER  2,0
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax

;-97   if (i > IDLENMAX) error1("Item name is too long in characters)");

 mov ax, [bp-2]
 cmp ax, 15
 jle @@checknamelen6
 push checknamelen_0
 call error1
 add  sp, 2

;-98 }

@@checknamelen6:

;-99 char doglobName[IDLENMAX];
 LEAVE
 ret
; ENDP
checknamelen_0 db "Item name is too long in characters)",0
section .bss
absolute 53391
doglobName resb 15
section .text

;-100 int doglob() { int i; int j; int isstrarr; isstrarr=0;


doglob:  ; *** PROC ***
;Function : doglob, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   100 NULL i = bp-2
;  201 var sign word   100 NULL j = bp-4
;  202 var sign word   100 NULL isstrarr = bp-6;
 ENTER  6,0
 mov ax, 0
 mov [bp-6], ax

;-101   if (GTop >= LSTART) error1("Global table full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  @@doglob7
 push doglob_0
 call error1
 add  sp, 2

;-102   if (iswidth == 0) error1("no VOID as var type");

@@doglob7:
 mov al, [iswidth]
 cmp al, 0
 jne @@doglob8
 push doglob_1
 call error1
 add  sp, 2

;-103   checknamelen();

@@doglob8:
 call checknamelen

;-104   if (checkName() != 0) error1("Variable already defined");

 call checkName
 cmp al, 0
 je  @@doglob9
 push doglob_2
 call error1
 add  sp, 2

;-105   if (istoken('[')) { istype='&';

@@doglob9:
 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob10
 mov ax, 38
 mov byte [istype], al

;-106     if (istoken(T_CONST)) {

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob11

;-107       if (BSS) { if (NASM) {prs("\nsection .bss\nabsolute ");

 mov al, [BSS]
 or  al, al
 je @@doglob12
 mov al, [NASM]
 or  al, al
 je @@doglob13
 push doglob_3
 call prs
 add  sp, 2

;-108         prunsign1(orgData); }

 push word [orgData]
 call prunsign1
 add  sp, 2

;-109         else {prs("\nAData = $\norg "); prunsign1(orgData);} }

 jmp @@doglob14
@@doglob13:
 push doglob_4
 call prs
 add  sp, 2
 push word [orgData]
 call prunsign1
 add  sp, 2
@@doglob14:

;-110       prs("\n"); prs(symbol); 

@@doglob12:
 push doglob_5
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-111       if      (iswidth==1) {if (NASM) prs(" resb "); else prs(" db ");}

 mov al, [iswidth]
 cmp al, 1
 jne @@doglob15
 mov al, [NASM]
 or  al, al
 je @@doglob16
 push doglob_6
 call prs
 add  sp, 2
 jmp @@doglob17
@@doglob16:
 push doglob_7
 call prs
 add  sp, 2
@@doglob17:

;-112       else if (iswidth==2) {if (NASM) prs(" resw "); else prs(" dw ");}

 jmp @@doglob18
@@doglob15:
 mov al, [iswidth]
 cmp al, 2
 jne @@doglob19
 mov al, [NASM]
 or  al, al
 je @@doglob20
 push doglob_8
 call prs
 add  sp, 2
 jmp @@doglob21
@@doglob20:
 push doglob_9
 call prs
 add  sp, 2
@@doglob21:

;-113       else                 {if (NASM) prs(" resd "); else prs(" dd ");}

 jmp @@doglob22
@@doglob19:
 mov al, [NASM]
 or  al, al
 je @@doglob23
 push doglob_10
 call prs
 add  sp, 2
 jmp @@doglob24
@@doglob23:
 push doglob_11
 call prs
 add  sp, 2
@@doglob24:

;-114       prunsign1(lexval); if (NASM==0)prs(" dup (?)");

@@doglob22:
@@doglob18:
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@doglob25
 push doglob_12
 call prs
 add  sp, 2

;-115       if (BSS) {if(NASM) prs("\nsection .text");

@@doglob25:
 mov al, [BSS]
 or  al, al
 je @@doglob26
 mov al, [NASM]
 or  al, al
 je @@doglob27
 push doglob_13
 call prs
 add  sp, 2

;-116         else prs("\norg AData"); }

 jmp @@doglob28
@@doglob27:
 push doglob_14
 call prs
 add  sp, 2
@@doglob28:

;-117       orgData=orgData+lexval;

@@doglob26:
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-118       if (iswidth==2) orgData=orgData+lexval;

 mov al, [iswidth]
 cmp al, 2
 jne @@doglob29
 mov ax, [orgData]
 add ax, [lexval]
 mov word [orgData], ax

;-119       if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}

@@doglob29:
 mov al, [iswidth]
 cmp al, 4
 jne @@doglob30
 mov ax, [lexval]
 mov bx, 3
 mul bx
 mov [bp-2], ax
 mov ax, [orgData]
 add ax, [bp-2]
 mov word [orgData], ax

;-120       GData[GTop]=lexval; expect(']');

@@doglob30:
 mov ax, [lexval]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax
 push 93
 call expect
 add  sp, 2

;-121     }else { expect(']');

 jmp @@doglob31
@@doglob11:
 push 93
 call expect
 add  sp, 2

;-122       if (iswidth != 1) error1("Only ByteArray allowed");

 mov al, [iswidth]
 cmp al, 1
 je  @@doglob32
 push doglob_15
 call error1
 add  sp, 2

;-123       prs("\n"); prs(symbol); prs(" db "); 

@@doglob32:
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

;-124       isstrarr=1; strcpy(doglobName, symbol);

 mov ax, 1
 mov [bp-6], ax
 lea  ax, [symbol]
 push ax
 lea  ax, [doglobName]
 push ax
 call strcpy
 add  sp, 4

;-125       expect('='); 

 push 61
 call expect
 add  sp, 2

;-126       if (istoken(T_STRING)) { 

 push 258
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob33

;-127         prc(34); prscomment(symbol); prc(34); prs(",0"); 

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

;-128         i=strlen(symbol); GData[GTop]=i; }

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 mov bx, [GTop]
 shl bx, 1
 mov [GData+bx], ax

;-129       else if (istoken('{' )) { i=0;

 jmp @@doglob34
@@doglob33:
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob35
 mov ax, 0
 mov [bp-2], ax

;-130         do { if(i) prc(','); 

@@doglob36:
 mov ax, [bp-2]
 or  al, al
 je @@doglob37
 push 44
 call prc
 add  sp, 2

;-131           expect(T_CONST); prunsign1(lexval); i=1; }

@@doglob37:
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 1
 mov [bp-2], ax

;-132         while (istoken(',')); expect('}'); }  

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob38
 jmp @@doglob36
@@doglob38:
 push 125
 call expect
 add  sp, 2

;-133       else error1("String or number array expected");

 jmp @@doglob39
@@doglob35:
 push doglob_19
 call error1
 add  sp, 2

;-134       }; 

@@doglob39:
@@doglob34:
@@doglob31:

;-135   }else { //expect('=');

 jmp @@doglob40
@@doglob10:

;-136     prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");

 push doglob_20
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2
 mov al, [istype]
 cmp al, 42
 jne @@doglob41
 push doglob_21
 call prs
 add  sp, 2

;-137     else {

 jmp @@doglob42
@@doglob41:

;-138       if      (iswidth==1) prs(" db ");

 mov al, [iswidth]
 cmp al, 1
 jne @@doglob43
 push doglob_22
 call prs
 add  sp, 2

;-139       else if (iswidth==2) prs(" dw ");

 jmp @@doglob44
@@doglob43:
 mov al, [iswidth]
 cmp al, 2
 jne @@doglob45
 push doglob_23
 call prs
 add  sp, 2

;-140       else                 prs(" dd ");

 jmp @@doglob46
@@doglob45:
 push doglob_24
 call prs
 add  sp, 2

;-141     }

@@doglob46:
@@doglob44:

;-142     if(istoken('-')) prc('-');

@@doglob42:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob47
 push 45
 call prc
 add  sp, 2

;-143     if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }

@@doglob47:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@doglob48
 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-144     else prunsign1(0); }

 jmp @@doglob49
@@doglob48:
 push 0
 call prunsign1
 add  sp, 2
@@doglob49:

;-145   GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;

@@doglob40:
 mov al, [issign]
 mov bx, [GTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [GTop]
 mov [GType+bx], al

;-146   GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-147   pt=adrofname(GTop);

 push word [GTop]
 call adrofname
 add  sp, 2
 mov word [pt], ax

;-148   if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);

 mov ax, [bp-6]
 or  al, al
 je @@doglob50
 lea  ax, [doglobName]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4
 jmp @@doglob51
@@doglob50:
 lea  ax, [symbol]
 push ax
 push word [pt]
 call strcpy
 add  sp, 4

;-149   GTop++; expect(';'); }

@@doglob51:
 inc  word[GTop]
 push 59
 call expect
 add  sp, 2

;-150 


;-151 int gettypes(int i) {int j; char c;
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

;-152   c=GSign [i]; if (c=='S') signi =1;    else signi =0;

;Function : gettypes, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   151 NULL i = bp+4
;  201 var sign word   151 NULL j = bp-2
;  202 var sign byte   151 NULL c = bp-4;
 ENTER  4,0
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne @@gettypes52
 mov ax, 1
 mov word [signi], ax
 jmp @@gettypes53
@@gettypes52:
 mov ax, 0
 mov word [signi], ax

;-153   c=GWidth[i]; widthi=0;wi=0;

@@gettypes53:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [widthi], ax
 mov ax, 0
 mov word [wi], ax

;-154   if (c==1) {widthi=1;wi=1;}

 mov al, [bp-4]
 cmp al, 1
 jne @@gettypes54
 mov ax, 1
 mov word [widthi], ax
 mov ax, 1
 mov word [wi], ax

;-155   if (c==2) {widthi=2;wi=2;}

@@gettypes54:
 mov al, [bp-4]
 cmp al, 2
 jne @@gettypes55
 mov ax, 2
 mov word [widthi], ax
 mov ax, 2
 mov word [wi], ax

;-156   if (c==4) {widthi=4;wi=4;}

@@gettypes55:
 mov al, [bp-4]
 cmp al, 4
 jne @@gettypes56
 mov ax, 4
 mov word [widthi], ax
 mov ax, 4
 mov word [wi], ax

;-157   c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}

@@gettypes56:
 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov ax, 0
 mov word [typei], ax
 mov al, [bp-4]
 cmp al, 42
 jne @@gettypes57
 mov ax, 1
 mov word [typei], ax
 mov ax, 2
 mov word [wi], ax

;-158   if (c=='&')  typei=2;  

@@gettypes57:
 mov al, [bp-4]
 cmp al, 38
 jne @@gettypes58
 mov ax, 2
 mov word [typei], ax

;-159   return i; }  

@@gettypes58:
 mov ax, [bp+4]
 jmp @@retn

;-160 int adrofname(unsigned int i) { adrF(GNameField, i); }

@@retn: LEAVE
 ret
; ENDP

adrofname:  ; *** PROC ***
;Function : adrofname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   160 NULL i = bp+4;
 ENTER  0,0
 push word [bp+4]
 lea  ax, [GNameField]
 push ax
 call adrF
 add  sp, 4

;-161 int adrF(char *s, unsigned int i) { i << 4;
 LEAVE
 ret
; ENDP

adrF:  ; *** PROC ***
;Function : adrF, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   161 NULL s = bp+4
;  201 var unsg word   161 NULL i = bp+6;
 ENTER  0,0
 mov ax, [bp+6]
 shl ax, 4

;-162   __asm{ add ax, [bp+4]  ; offset s } }

 add ax, [bp+4]  ; offset s 

;-163 int printName(unsigned int i) {int j;
 LEAVE
 ret
; ENDP

printName:  ; *** PROC ***

;-164   if (i < LSTART) { i=adrofname(i); prs(i); }

;Function : printName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   163 NULL i = bp+4
;  201 var sign word   163 NULL j = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 200
 jge @@printName59
 push word [bp+4]
 call adrofname
 add  sp, 2
 mov [bp+4], ax
 push word [bp+4]
 call prs
 add  sp, 2

;-165   else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }

 jmp @@printName60
@@printName59:
 push printName_0
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jle @@printName61
 push 43
 call prc
 add  sp, 2
@@printName61:
 push word [bp-2]
 call pint1
 add  sp, 2
 push 93
 call prc
 add  sp, 2

;-166 }

@@printName60:

;-167 int searchname() { unsigned int i;
 LEAVE
 ret
; ENDP
printName_0 db "[bp",0

searchname:  ; *** PROC ***

;-168   i=checkName(); if (i == 0) error1("Variable unknown");

;Function : searchname, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   167 NULL i = bp-2;
 ENTER  2,0
 call checkName
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 0
 jne @@searchname62
 push searchname_0
 call error1
 add  sp, 2

;-169   GUsed[i]=GUsed[i] + 1; return i;

@@searchname62:
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GUsed + bx]
 add ax, 1
 mov bx, [bp-2]
 shl bx, 1
 mov [GUsed+bx], ax
 mov ax, [bp-2]
 jmp @@retn

;-170 }


;-171 int checkName() { unsigned int i; unsigned int j;

@@retn: LEAVE
 ret
; ENDP
searchname_0 db "Variable unknown",0

checkName:  ; *** PROC ***

;-172   i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

;Function : checkName, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   171 NULL i = bp-2
;  201 var unsg word   171 NULL j = bp-4;
 ENTER  4,0
 mov ax, 200
 mov [bp-2], ax
@@checkName63:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge @@checkName64
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
 je @@checkName65
 mov ax, [bp-2]
 jmp @@retn
@@checkName65:
 inc  word[bp-2]

;-173   i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}

 jmp @@checkName63
@@checkName64:
 mov ax, 1
 mov [bp-2], ax
@@checkName66:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@checkName67
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
 je @@checkName68
 mov ax, [bp-2]
 jmp @@retn
@@checkName68:
 inc  word[bp-2]

;-174   return 0;

 jmp @@checkName66
@@checkName67:
 mov ax, 0
 jmp @@retn

;-175 }    


;-176 int typeName() { int m; //0=V,1=*,2=&

@@retn: LEAVE
 ret
; ENDP

typeName:  ; *** PROC ***

;-177   issign='S';

;Function : typeName, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   176 NULL m = bp-2;
 ENTER  2,0
 mov ax, 83
 mov byte [issign], al

;-178   if(istoken(T_SIGNED))   issign='S';  if(istoken(T_UNSIGNED)) issign='U';

 push 531
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName69
 mov ax, 83
 mov byte [issign], al
@@typeName69:
 push 532
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName70
 mov ax, 85
 mov byte [issign], al

;-179   iswidth=2;                           if(istoken(T_VOID))     iswidth=0;

@@typeName70:
 mov ax, 2
 mov byte [iswidth], al
 push 529
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName71
 mov ax, 0
 mov byte [iswidth], al

;-180   if(istoken(T_CHAR))     iswidth=1;   if(istoken(T_INT))      iswidth=2;

@@typeName71:
 push 530
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName72
 mov ax, 1
 mov byte [iswidth], al
@@typeName72:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName73
 mov ax, 2
 mov byte [iswidth], al

;-181   if(istoken(T_SHORT))    iswidth=2;   if(istoken(T_LONG))     iswidth=4;

@@typeName73:
 push 534
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName74
 mov ax, 2
 mov byte [iswidth], al
@@typeName74:
 push 533
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName75
 mov ax, 4
 mov byte [iswidth], al

;-182   if(istoken(T_UINT32)) { iswidth=4; issign='U'; }

@@typeName75:
 push 545
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName76
 mov ax, 4
 mov byte [iswidth], al
 mov ax, 85
 mov byte [issign], al

;-183   istype='V'; m=0;

@@typeName76:
 mov ax, 86
 mov byte [istype], al
 mov ax, 0
 mov [bp-2], ax

;-184   if(istoken('*'))  { istype='*'; m=1; } if(istoken('&'))  {istype='&'; m=2;}

 push 42
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName77
 mov ax, 42
 mov byte [istype], al
 mov ax, 1
 mov [bp-2], ax
@@typeName77:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@typeName78
 mov ax, 38
 mov byte [istype], al
 mov ax, 2
 mov [bp-2], ax

;-185   name1(); return m; }

@@typeName78:
 call name1
 mov ax, [bp-2]
 jmp @@retn

;-186 int name1() {if (token!=T_NAME) error1("Name expected"); token=getlex(); }

@@retn: LEAVE
 ret
; ENDP

name1:  ; *** PROC ***
 mov ax, [token]
 cmp ax, 256
 je  @@name179
 push name1_0
 call error1
 add  sp, 2
@@name179:
 call getlex
 mov word [token], ax

;-187 


;-188 int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");

 ret
; ENDP
name1_0 db "Name expected",0

storecall:  ; *** PROC ***
;Function : storecall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   188 NULL i = bp-2;
 ENTER  2,0
 mov ax, [CTop]
 cmp ax, 2000 ;unsigned : 1
 jl  @@storecall80
 push storecall_0
 call error1
 add  sp, 2

;-189   if (CNameTop >= 65468) error1("Call name table fuill");

@@storecall80:
 mov ax, [CNameTop]
 cmp ax, 65468 ;unsigned : 0
 jb  @@storecall81
 push storecall_1
 call error1
 add  sp, 2

;-190     CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);

@@storecall81:
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

;-191     to_far(CNameTop, symbol);

 lea  ax, [symbol]
 push ax
 push word [CNameTop]
 call to_far
 add  sp, 4

;-192     CNameTop=CNameTop+i; CNameTop++; CTop++;

 mov ax, [CNameTop]
 add ax, [bp-2]
 mov word [CNameTop], ax
 inc  word[CNameTop]
 inc  word[CTop]

;-193 }


;-194 int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
 LEAVE
 ret
; ENDP
storecall_0 db "Call table full",0
storecall_1 db "Call name table fuill",0

storefunc:  ; *** PROC ***
 mov ax, [FTop]
 cmp ax, 300 ;unsigned : 1
 jl  @@storefunc82
 push storefunc_0
 call error1
 add  sp, 2

;-195     FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;

@@storefunc82:
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

;-196     pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;

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

;-197 }


;-198 int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");

 ret
; ENDP
storefunc_0 db "Function table full",0

addlocal:  ; *** PROC ***
 mov ax, [LTop]
 cmp ax, 300 ;unsigned : 1
 jl  @@addlocal83
 push addlocal_0
 call error1
 add  sp, 2

;-199   if (checkName() != 0) error1("Variable already defined");

@@addlocal83:
 call checkName
 cmp ax, 0
 je  @@addlocal84
 push addlocal_1
 call error1
 add  sp, 2

;-200   GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;

@@addlocal84:
 mov al, [issign]
 mov bx, [LTop]
 mov [GSign+bx], al
 mov al, [iswidth]
 mov bx, [LTop]
 mov [GWidth+bx], al
 mov al, [istype]
 mov bx, [LTop]
 mov [GType+bx], al

;-201   GAdr [LTop]=lineno-1; GUsed[LTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [LTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [LTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-202   pt=adrF(GNameField, LTop); strcpy(pt, symbol);

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

;-203 }


;-204 int checkFunction() { unsigned int i; unsigned int j; i=0;

 ret
; ENDP
addlocal_0 db "Local variable table full",0
addlocal_1 db "Variable already defined",0

checkFunction:  ; *** PROC ***
;Function : checkFunction, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   204 NULL i = bp-2
;  201 var unsg word   204 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-205   while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}

@@checkFunction85:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@checkFunction86
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
 je @@checkFunction87
 mov ax, [bp-2]
 jmp @@retn
@@checkFunction87:
 inc  word[bp-2]

;-206   return 0; }

 jmp @@checkFunction85
@@checkFunction86:
 mov ax, 0
 jmp @@retn

;-207 int dofunc() { int nloc; int i; int narg;  

@@retn: LEAVE
 ret
; ENDP

dofunc:  ; *** PROC ***

;-208   cloc=&co; 

;Function : dofunc, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   207 NULL nloc = bp-2
;  201 var sign word   207 NULL i = bp-4
;  202 var sign word   207 NULL narg = bp-6;
 ENTER  6,0
 mov ax, co
 mov word [cloc], ax

;-209   checknamelen();

 call checknamelen

;-210   strcpy(fname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [fname]
 push ax
 call strcpy
 add  sp, 4

;-211   if (checkFunction() ) error1("Function already defined");

 call checkFunction
 or  al, al
 je @@dofunc88
 push dofunc_0
 call error1
 add  sp, 2

;-212   storefunc();

@@dofunc88:
 call storefunc

;-213   prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");

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

;-214   expect('('); LTop=LSTART;  i=0;

 push 40
 call expect
 add  sp, 2
 mov ax, 200
 mov word [LTop], ax
 mov ax, 0
 mov [bp-4], ax

;-215   if (istoken(')')==0) { narg=2; 

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@dofunc89
 mov ax, 2
 mov [bp-6], ax

;-216     do { typeName();  addlocal(); narg+=2;

@@dofunc90:
 call typeName
 call addlocal
 add  word[bp-6], 2

;-217          GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }

 mov ax, [bp-6]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax
 mov al, [iswidth]
 cmp al, 4
 jne @@dofunc91
 add  word[bp-6], 2
@@dofunc91:
 inc  word[LTop]

;-218     while (istoken(','));  expect(')'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc92
 jmp @@dofunc90
@@dofunc92:
 push 41
 call expect
 add  sp, 2

;-219     


;-220   expect('{'); /*body*/

@@dofunc89:
 push 123
 call expect
 add  sp, 2

;-221   nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov word [nreturn], ax
 mov ax, 0
 mov word [nconst], ax
 mov ax, 0
 mov [bp-4], ax

;-222   while(isvariable()) {

@@dofunc93:
 call isvariable
 or  al, al
 je @@dofunc94

;-223     do {typeName();

@@dofunc95:
 call typeName

;-224         checknamelen();

 call checknamelen

;-225         addlocal(); nloc-=2;

 call addlocal
 sub  word[bp-2], 2

;-226         if (iswidth == 4) nloc-=2;

 mov al, [iswidth]
 cmp al, 4
 jne @@dofunc96
 sub  word[bp-2], 2

;-227         GData[LTop]=nloc;

@@dofunc96:
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-228         if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc97
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

;-229             nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }

 mov ax, [bp-2]
 sub ax, [lexval]
 mov [bp-2], ax
 add  word[bp-2], 2
 mov ax, [bp-2]
 mov bx, [LTop]
 shl bx, 1
 mov [GData+bx], ax

;-230         LTop++;

@@dofunc97:
 inc  word[LTop]

;-231       } while (istoken(',')); expect(';'); }

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@dofunc98
 jmp @@dofunc95
@@dofunc98:
 push 59
 call expect
 add  sp, 2

;-232   listproc(); 

 jmp @@dofunc93
@@dofunc94:
 call listproc

;-233   if (LTop>LSTART){prs(";\n ENTER  "); 

 mov ax, [LTop]
 cmp ax, 200
 jle @@dofunc99
 push dofunc_3
 call prs
 add  sp, 2

;-234     nloc=mkneg(nloc); pint1 (nloc); prs(",0"); }

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

;-235   while(istoken('}')==0)   stmt();

@@dofunc99:
@@dofunc100:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@dofunc101
 call stmt

;-236   if (nreturn) { prs("\n@@retn:");}

 jmp @@dofunc100
@@dofunc101:
 mov ax, [nreturn]
 or  al, al
 je @@dofunc102
 push dofunc_5
 call prs
 add  sp, 2

;-237   if (LTop > LSTART) prs(" LEAVE");

@@dofunc102:
 mov ax, [LTop]
 cmp ax, 200
 jle @@dofunc103
 push dofunc_6
 call prs
 add  sp, 2

;-238   prs("\n ret"); prs("\n; ENDP"); 

@@dofunc103:
 push dofunc_7
 call prs
 add  sp, 2
 push dofunc_8
 call prs
 add  sp, 2

;-239   *cloc=0; prs(co); maxco1=strlen(co);

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

;-240   if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }

 mov ax, [maxco1]
 cmp ax, [maxco]
 jle @@dofunc104
 mov ax, [maxco1]
 mov word [maxco], ax
 lea  ax, [fname]
 push ax
 lea  ax, [coname]
 push ax
 call strcpy
 add  sp, 4

;-241 }

@@dofunc104:

;-242 int isvariable() {
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

;-243   if(token==T_SIGNED) goto v1;   if(token==T_UNSIGNED) goto v1;

 mov ax, [token]
 cmp ax, 531
 jne @@isvariable105
 jmp @@v1
@@isvariable105:
 mov ax, [token]
 cmp ax, 532
 jne @@isvariable106
 jmp @@v1

;-244   if(token==T_CHAR)   goto v1;   if(token==T_INT)      goto v1;

@@isvariable106:
 mov ax, [token]
 cmp ax, 530
 jne @@isvariable107
 jmp @@v1
@@isvariable107:
 mov ax, [token]
 cmp ax, 517
 jne @@isvariable108
 jmp @@v1

;-245   if(token==T_SHORT)  goto v1;   if(token==T_LONG)     goto v1;

@@isvariable108:
 mov ax, [token]
 cmp ax, 534
 jne @@isvariable109
 jmp @@v1
@@isvariable109:
 mov ax, [token]
 cmp ax, 533
 jne @@isvariable110
 jmp @@v1

;-246   if(token==T_UINT32) goto v1;   return 0;  v1: return 1;

@@isvariable110:
 mov ax, [token]
 cmp ax, 545
 jne @@isvariable111
 jmp @@v1
@@isvariable111:
 mov ax, 0
 jmp @@retn
@@v1:
 mov ax, 1
 jmp @@retn

;-247 }


;-248                   


;-249 int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;

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

;-250 int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

mod2 dw 0
ireg2 dw 0
idx2 dw 0
ids2 dw 0
idw2 dw 0
idt2 dw 0
val2 dw 0

;-251 


;-252 int pexpr() {expect('('); iscmp=0; 


pexpr:  ; *** PROC ***
 push 40
 call expect
 add  sp, 2
 mov ax, 0
 mov word [iscmp], ax

;-253   if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}

 mov ax, [token]
 cmp ax, 256
 jne @@pexpr112
 push pexpr_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@pexpr113
 call constantexpr
 jmp @@retn

;-254     ireg1=checkreg();

@@pexpr113:
 call checkreg
 mov word [ireg1], ax

;-255     if (ireg1) { doreg1(1); return; }  }

 mov ax, [ireg1]
 or  al, al
 je @@pexpr114
 push 1
 call doreg1
 add  sp, 2
 jmp @@retn
@@pexpr114:

;-256   exprstart(); if (iscmp==0) prs("\n or  al, al\n je @@");  prs(fname);

@@pexpr112:
 call exprstart
 mov ax, [iscmp]
 cmp ax, 0
 jne @@pexpr115
 push pexpr_1
 call prs
 add  sp, 2
@@pexpr115:
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-257   expect(')'); }           /*error1("Vergleich fehlt");*/

 push 41
 call expect
 add  sp, 2

;-258 


;-259 int constantexpr() { int mode; int id1;int ids;

@@retn:
 ret
; ENDP
pexpr_0 db "_",0
pexpr_1 db "\n or  al, al\n je @@",0

constantexpr:  ; *** PROC ***

;-260   token=getlex();   mode=typeName();  

;Function : constantexpr, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   259 NULL mode = bp-2
;  201 var sign word   259 NULL id1 = bp-4
;  202 var sign word   259 NULL ids = bp-6;
 ENTER  6,0
 call getlex
 mov word [token], ax
 call typeName
 mov [bp-2], ax

;-261   id1=searchname(); gettypes(id1); ids=signi;

 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-6], ax

;-262   if (isrelational() ==0) error1("Relational expression expected");

 call isrelational
 cmp ax, 0
 jne @@constantexpr116
 push constantexpr_0
 call error1
 add  sp, 2

;-263   expect(T_CONST);  prs(" ; constant expression");

@@constantexpr116:
 push 257
 call expect
 add  sp, 2
 push constantexpr_1
 call prs
 add  sp, 2

;-264   prs("\ncmp "); 

 push constantexpr_2
 call prs
 add  sp, 2

;-265   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@constantexpr117
 push constantexpr_3
 call prs
 add  sp, 2
 jmp @@constantexpr118
@@constantexpr117:
 push constantexpr_4
 call prs
 add  sp, 2

;-266   if (NASM==0) prs(" ptr ");

@@constantexpr118:
 mov al, [NASM]
 cmp al, 0
 jne @@constantexpr119
 push constantexpr_5
 call prs
 add  sp, 2

;-267   v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);

@@constantexpr119:
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

;-268   expect(')');

 push 41
 call expect
 add  sp, 2

;-269 }  


;-270 int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }
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
 je @@exprstart120
 push 0
 call expr2
 add  sp, 2
 jmp @@exprstart121
@@exprstart120:
 push 0
 call expr
 add  sp, 2
@@exprstart121:

;-271 


;-272 int expr2(int kind) {  int i;

 ret
; ENDP
exprstart_0 db "_",0

expr2:  ; *** PROC ***

;-273   if(kind != 1) token=getlex();

;Function : expr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   272 NULL kind = bp+4
;  201 var sign word   272 NULL i = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 1
 je  @@expr2122
 call getlex
 mov word [token], ax

;-274   mod1=typeName();

@@expr2122:
 call typeName
 mov word [mod1], ax

;-275   if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");

 mov ax, [mod1]
 or  al, al
 je @@expr2123
 push expr2_0
 call error1
 add  sp, 2

;-276   ireg1=checkreg();

@@expr2123:
 call checkreg
 mov word [ireg1], ax

;-277   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je @@expr2124
 push 0
 call doreg1
 add  sp, 2
 jmp @@retn

;-278   if (ireg1 == 0) { idx1=searchname();

@@expr2124:
 mov ax, [ireg1]
 cmp ax, 0
 jne @@expr2125
 call searchname
 mov word [idx1], ax

;-279     gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;

 push word [idx1]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids1], ax
 mov ax, [wi]
 mov word [idw1], ax
 mov ax, [typei]
 mov word [idt1], ax

;-280     if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }

 mov ax, [idt1]
 or  al, al
 je @@expr2126
 push expr2_1
 call error1
 add  sp, 2
@@expr2126:

;-281   


;-282   if (isrelational()) { error1("Vergleich noch nicht implementiert");

@@expr2125:
 call isrelational
 or  al, al
 je @@expr2127
 push expr2_2
 call error1
 add  sp, 2

;-283   }


;-284   if (istoken('=') == 0) error1("Assign expected");

@@expr2127:
 push 61
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@expr2128
 push expr2_3
 call error1
 add  sp, 2

;-285   if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");

@@expr2128:
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr2129
 mov ax, [lexval]
 mov word [val2], ax
 push expr2_4
 call prs
 add  sp, 2

;-286     prs("\nmov ");

 push expr2_5
 call prs
 add  sp, 2

;-287     if (idw1 == 1) prs("byte ");

 mov ax, [idw1]
 cmp ax, 1
 jne @@expr2130
 push expr2_6
 call prs
 add  sp, 2

;-288     if (idw1 == 2) prs("word ");

@@expr2130:
 mov ax, [idw1]
 cmp ax, 2
 jne @@expr2131
 push expr2_7
 call prs
 add  sp, 2

;-289     if (idw1 == 4) prs("dword ");

@@expr2131:
 mov ax, [idw1]
 cmp ax, 4
 jne @@expr2132
 push expr2_8
 call prs
 add  sp, 2

;-290     if (NASM == 0) prs("ptr ");

@@expr2132:
 mov al, [NASM]
 cmp al, 0
 jne @@expr2133
 push expr2_9
 call prs
 add  sp, 2

;-291     v(idx1);

@@expr2133:
 push word [idx1]
 call v
 add  sp, 2

;-292     prs(", "); prunsign1(val2);

 push expr2_10
 call prs
 add  sp, 2
 push word [val2]
 call prunsign1
 add  sp, 2

;-293     if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }

 mov ax, [idx1]
 cmp ax, 200 ;unsigned : 1
 jl  @@expr2134
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
@@expr2134:
 jmp @@retn

;-294   


;-295   mod1=typeName(); ireg2=checkreg();

@@expr2129:
 call typeName
 mov word [mod1], ax
 call checkreg
 mov word [ireg2], ax

;-296   if (ireg2) { prs("\nmov ");

 mov ax, [ireg2]
 or  al, al
 je @@expr2135
 push expr2_12
 call prs
 add  sp, 2

;-297     if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}

 mov ax, [ireg1]
 or  al, al
 je @@expr2136
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp @@expr2137
@@expr2136:
 push word [idx1]
 call v
 add  sp, 2
@@expr2137:
 push expr2_13
 call prs
 add  sp, 2
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp @@retn

;-298   else {

 jmp @@expr2138
@@expr2135:

;-299     if (mod1 == 1) error1("Noch kein * im Text erlaubt");

 mov ax, [mod1]
 cmp ax, 1
 jne @@expr2139
 push expr2_14
 call error1
 add  sp, 2

;-300     


;-301     idx2=searchname();

@@expr2139:
 call searchname
 mov word [idx2], ax

;-302     gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;

 push word [idx2]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov word [ids2], ax
 mov ax, [wi]
 mov word [idw2], ax
 mov ax, [typei]
 mov word [idt2], ax

;-303     if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");

 mov ax, [idt2]
 cmp ax, 1
 jne @@expr2140
 push expr2_15
 call error1
 add  sp, 2

;-304     prs("\nmov ");

@@expr2140:
 push expr2_16
 call prs
 add  sp, 2

;-305     if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");

 mov ax, [ireg1]
 or  al, al
 je @@expr2141
 push word [ireg1]
 call printreg
 add  sp, 2
 jmp @@expr2142
@@expr2141:
 push expr2_17
 call error1
 add  sp, 2

;-306     prs(", ");

@@expr2142:
 push expr2_18
 call prs
 add  sp, 2

;-307     if (mod1 == 2) a(idx2);

 mov ax, [mod1]
 cmp ax, 2
 jne @@expr2143
 push word [idx2]
 call a
 add  sp, 2

;-308     else {

 jmp @@expr2144
@@expr2143:

;-309       if (idw2 == 1) prs("byte ");

 mov ax, [idw2]
 cmp ax, 1
 jne @@expr2145
 push expr2_19
 call prs
 add  sp, 2

;-310       if (idw2 == 2) prs("word ");

@@expr2145:
 mov ax, [idw2]
 cmp ax, 2
 jne @@expr2146
 push expr2_20
 call prs
 add  sp, 2

;-311       if (idw2 == 4) prs("dword ");

@@expr2146:
 mov ax, [idw2]
 cmp ax, 4
 jne @@expr2147
 push expr2_21
 call prs
 add  sp, 2

;-312       if (NASM == 0) prs("ptr ");

@@expr2147:
 mov al, [NASM]
 cmp al, 0
 jne @@expr2148
 push expr2_22
 call prs
 add  sp, 2

;-313       v(idx2);

@@expr2148:
 push word [idx2]
 call v
 add  sp, 2

;-314       if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }

 mov ax, [idx2]
 cmp ax, 200 ;unsigned : 1
 jl  @@expr2149
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
@@expr2149:

;-315     return;

@@expr2144:
 jmp @@retn

;-316   } error1("Internal error: only const or reg allowed");

@@expr2138:
 push expr2_24
 call error1
 add  sp, 2

;-317 }


;-318 char ops[5];

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

;-319 int doreg1(int iscmp1) { int i;


doreg1:  ; *** PROC ***

;-320   if (istoken('='))          strcpy(ops, "mov");

;Function : doreg1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   319 NULL iscmp1 = bp+4
;  201 var sign word   319 NULL i = bp-2;
 ENTER  2,0
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1150
 push doreg1_0
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-321   if (istoken(T_PLUSASS))    strcpy(ops, "add");

@@doreg1150:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1151
 push doreg1_1
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-322   if (istoken(T_MINUSASS))   strcpy(ops, "sub");

@@doreg1151:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1152
 push doreg1_2
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-323   if (istoken(T_ANDASS))     strcpy(ops, "and");

@@doreg1152:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1153
 push doreg1_3
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-324   if (istoken(T_ORASS))      strcpy(ops, "or" );

@@doreg1153:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1154
 push doreg1_4
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-325   if (istoken(T_LESSLESS))   strcpy(ops, "shl");

@@doreg1154:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1155
 push doreg1_5
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-326   if (istoken(T_GREATGREAT)) strcpy(ops, "shr");

@@doreg1155:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1156
 push doreg1_6
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-327   if (iscmp1 == 1) { token=getlex();

@@doreg1156:
 mov ax, [bp+4]
 cmp ax, 1
 jne @@doreg1157
 call getlex
 mov word [token], ax

;-328       if (isrelational() ==0) error1("Relational expected");

 call isrelational
 cmp ax, 0
 jne @@doreg1158
 push doreg1_7
 call error1
 add  sp, 2

;-329       strcpy(ops, "cmp"); }

@@doreg1158:
 push doreg1_8
 lea  ax, [ops]
 push ax
 call strcpy
 add  sp, 4

;-330   prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

@@doreg1157:
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

;-331 


;-332   if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg1159
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp @@reg1

;-333   mod2=typeName(); ireg2=checkreg();

@@doreg1159:
 call typeName
 mov word [mod2], ax
 call checkreg
 mov word [ireg2], ax

;-334   if (ireg2) {printreg(ireg2); goto reg1;}

 mov ax, [ireg2]
 or  al, al
 je @@doreg1160
 push word [ireg2]
 call printreg
 add  sp, 2
 jmp @@reg1

;-335   i=searchname();  if (mod2 == 2) a(i); else v(i);

@@doreg1160:
 call searchname
 mov [bp-2], ax
 mov ax, [mod2]
 cmp ax, 2
 jne @@doreg1161
 push word [bp-2]
 call a
 add  sp, 2
 jmp @@doreg1162
@@doreg1161:
 push word [bp-2]
 call v
 add  sp, 2

;-336   reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }

@@doreg1162:
@@reg1:
 mov ax, [bp+4]
 cmp ax, 1
 jne @@doreg1163
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

;-337 }

@@doreg1163:

;-338 int checkreg() { // >=17 = 16bit, >=47 = 32bit
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

;-339   if (strlen(symbol) <  2) return 0;

 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 2
 jge @@checkreg164
 mov ax, 0
 jmp @@retn

;-340   if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;

@@checkreg164:
 push checkreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg165
 mov ax, 1
 jmp @@retn
@@checkreg165:
 push checkreg_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg166
 mov ax, 3
 jmp @@retn

;-341   if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;

@@checkreg166:
 push checkreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg167
 mov ax, 5
 jmp @@retn
@@checkreg167:
 push checkreg_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg168
 mov ax, 7
 jmp @@retn

;-342   if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;

@@checkreg168:
 push checkreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg169
 mov ax, 9
 jmp @@retn
@@checkreg169:
 push checkreg_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg170
 mov ax, 11
 jmp @@retn

;-343   if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;

@@checkreg170:
 push checkreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg171
 mov ax, 13
 jmp @@retn
@@checkreg171:
 push checkreg_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg172
 mov ax, 15
 jmp @@retn

;-344   if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;

@@checkreg172:
 push checkreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg173
 mov ax, 17
 jmp @@retn
@@checkreg173:
 push checkreg_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg174
 mov ax, 19
 jmp @@retn

;-345   if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;

@@checkreg174:
 push checkreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg175
 mov ax, 21
 jmp @@retn
@@checkreg175:
 push checkreg_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg176
 mov ax, 23
 jmp @@retn

;-346   if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;

@@checkreg176:
 push checkreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg177
 mov ax, 25
 jmp @@retn
@@checkreg177:
 push checkreg_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg178
 mov ax, 27
 jmp @@retn

;-347   if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;

@@checkreg178:
 push checkreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg179
 mov ax, 29
 jmp @@retn
@@checkreg179:
 push checkreg_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg180
 mov ax, 31
 jmp @@retn

;-348   if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;

@@checkreg180:
 push checkreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg181
 mov ax, 33
 jmp @@retn
@@checkreg181:
 push checkreg_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg182
 mov ax, 35
 jmp @@retn

;-349   if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;

@@checkreg182:
 push checkreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg183
 mov ax, 37
 jmp @@retn
@@checkreg183:
 push checkreg_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg184
 mov ax, 39
 jmp @@retn

;-350   if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;

@@checkreg184:
 push checkreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg185
 mov ax, 41
 jmp @@retn
@@checkreg185:
 push checkreg_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg186
 mov ax, 43
 jmp @@retn

;-351   // (eqstr(symbol,"ip")) return 45;


;-352   if (strlen(symbol) >   3) return 0;

@@checkreg186:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 cmp ax, 3
 jle @@checkreg187
 mov ax, 0
 jmp @@retn

;-353   if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;

@@checkreg187:
 push checkreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg188
 mov ax, 47
 jmp @@retn
@@checkreg188:
 push checkreg_23
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg189
 mov ax, 50
 jmp @@retn

;-354   if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;

@@checkreg189:
 push checkreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg190
 mov ax, 53
 jmp @@retn
@@checkreg190:
 push checkreg_25
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg191
 mov ax, 56
 jmp @@retn

;-355   if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;

@@checkreg191:
 push checkreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg192
 mov ax, 59
 jmp @@retn
@@checkreg192:
 push checkreg_27
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg193
 mov ax, 62
 jmp @@retn

;-356   if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;

@@checkreg193:
 push checkreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg194
 mov ax, 65
 jmp @@retn
@@checkreg194:
 push checkreg_29
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg195
 mov ax, 68
 jmp @@retn

;-357   if (eqstr(symbol,"cr0")) return 71;

@@checkreg195:
 push checkreg_30
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkreg196
 mov ax, 71
 jmp @@retn

;-358   return 0;   }

@@checkreg196:
 mov ax, 0
 jmp @@retn

;-359 char printregstr[]

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

;-360 ="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";

printregstr db "*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0",0

;-361 //          1         2         3         4         5         6         7


;-362 // 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3


;-363 int printreg(int i) {  unsigned int k; unsigned char c;


printreg:  ; *** PROC ***

;-364   k = &printregstr + i; c=*k; prc(c); i++;

;Function : printreg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   363 NULL i = bp+4
;  201 var unsg word   363 NULL k = bp-2
;  202 var unsg byte   363 NULL c = bp-4;
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

;-365   k = &printregstr + i; c=*k; prc(c);

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

;-366   if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }

 mov ax, [bp+4]
 cmp ax, 47
 jle @@printreg197
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

;-367 }

@@printreg197:

;-368 int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
 LEAVE
 ret
; ENDP
evalue dw 0
exprtype dw 10

;-369 int expr(int isRight)


expr:  ; *** PROC ***

;-370 { int mode; int id1;     int ixarr; int ixconst;


;-371   int ids;  int isCONST; int i;     unsigned char *p;


;-372   if (istoken(T_CONST)) { evalue=lexval;

;Function : expr, Number of local variables: 9
;   # type sign width addr used name   list of local variables
;  200 var sign word   369 NULL isRight = bp+4
;  201 var sign word   370 NULL mode = bp-2
;  202 var sign word   370 NULL id1 = bp-4
;  203 var sign word   370 NULL ixarr = bp-6
;  204 var sign word   370 NULL ixconst = bp-8
;  205 var sign word   371 NULL ids = bp-10
;  206 var sign word   371 NULL isCONST = bp-12
;  207 var sign word   371 NULL i = bp-14
;  208 ptr unsg byte   371 NULL p = bp-16;
 ENTER  16,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr198
 mov ax, [lexval]
 mov word [evalue], ax

;-373     prs("\n mov ax, "); prunsign1(lexval); return 4; }

 push expr_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 mov ax, 4
 jmp @@retn

;-374   mode=typeName(); /*0=V,1=*,2=&*/

@@expr198:
 call typeName
 mov [bp-2], ax

;-375   ireg1=checkreg();

 call checkreg
 mov word [ireg1], ax

;-376   if (ireg1) { doreg1(0); return; }

 mov ax, [ireg1]
 or  al, al
 je @@expr199
 push 0
 call doreg1
 add  sp, 2
 jmp @@retn

;-377   if (token=='(')  {docall1(); goto e1; }

@@expr199:
 mov ax, [token]
 cmp ax, 40
 jne @@expr200
 call docall1
 jmp @@e1

;-378   if (isreg()) goto e1;

@@expr200:
 call isreg
 or  al, al
 je @@expr201
 jmp @@e1

;-379 


;-380   id1=searchname(); gettypes(id1); ids=signi;

@@expr201:
 call searchname
 mov [bp-4], ax
 push word [bp-4]
 call gettypes
 add  sp, 2
 mov ax, [signi]
 mov [bp-10], ax

;-381   ixarr=0;  ixconst=0;

 mov ax, 0
 mov [bp-6], ax
 mov ax, 0
 mov [bp-8], ax

;-382     if (istoken('[')) { if (istoken(T_CONST)) {

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@expr202
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@expr203

;-383       ixconst=1; ixarr=lexval; expect(']');  }

 mov ax, 1
 mov [bp-8], ax
 mov ax, [lexval]
 mov [bp-6], ax
 push 93
 call expect
 add  sp, 2

;-384     else {ixarr=searchname(); expect(T_NAME); expect(']');

 jmp @@expr204
@@expr203:
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-385     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-386     if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }

 mov ax, [widthi]
 cmp ax, 2
 je  @@expr205
 push expr_1
 call error1
 add  sp, 2
@@expr205:
@@expr204:

;-387   if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");

@@expr202:
 push 1219
 call istoken
 add  sp, 2
 or  al, al
 je @@expr206
 mov ax, [bp-2]
 or  al, al
 je @@expr207
 push expr_2
 call error1
 add  sp, 2

;-388      prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");

@@expr207:
 push expr_3
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@expr208
 push expr_4
 call prs
 add  sp, 2
 jmp @@expr209
@@expr208:
 push expr_5
 call prs
 add  sp, 2

;-389        if(NASM==0)prs(" ptr "); v(id1); goto e1;}

@@expr209:
 mov al, [NASM]
 cmp al, 0
 jne @@expr210
 push expr_6
 call prs
 add  sp, 2
@@expr210:
 push word [bp-4]
 call v
 add  sp, 2
 jmp @@e1

;-390   if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");

@@expr206:
 push 1225
 call istoken
 add  sp, 2
 or  al, al
 je @@expr211
 mov ax, [bp-2]
 or  al, al
 je @@expr212
 push expr_7
 call error1
 add  sp, 2

;-391      prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");

@@expr212:
 push expr_8
 call prs
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@expr213
 push expr_9
 call prs
 add  sp, 2
 jmp @@expr214
@@expr213:
 push expr_10
 call prs
 add  sp, 2

;-392        if(NASM==0)prs(" ptr "); v(id1); goto e1;}

@@expr214:
 mov al, [NASM]
 cmp al, 0
 jne @@expr215
 push expr_11
 call prs
 add  sp, 2
@@expr215:
 push word [bp-4]
 call v
 add  sp, 2
 jmp @@e1

;-393        


;-394   if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}

@@expr211:
 push 1230
 call istoken
 add  sp, 2
 or  al, al
 je @@expr216
 push word [bp-4]
 push word [bp-2]
 push expr_12
 call compoundass
 add  sp, 6
 jmp @@e1

;-395   if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}

@@expr216:
 push 1231
 call istoken
 add  sp, 2
 or  al, al
 je @@expr217
 push word [bp-4]
 push word [bp-2]
 push expr_13
 call compoundass
 add  sp, 6
 jmp @@e1

;-396   if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}

@@expr217:
 push 1234
 call istoken
 add  sp, 2
 or  al, al
 je @@expr218
 push word [bp-4]
 push word [bp-2]
 push expr_14
 call compoundass
 add  sp, 6
 jmp @@e1

;-397   if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    

@@expr218:
 push 1235
 call istoken
 add  sp, 2
 or  al, al
 je @@expr219
 push word [bp-4]
 push word [bp-2]
 push expr_15
 call compoundass
 add  sp, 6
 jmp @@e1

;-398   if (istoken(T_MULASS    )) {error1("not implemented");}

@@expr219:
 push 1232
 call istoken
 add  sp, 2
 or  al, al
 je @@expr220
 push expr_16
 call error1
 add  sp, 2

;-399   if (istoken(T_DIVASS    )) {error1("not implemented");}

@@expr220:
 push 1233
 call istoken
 add  sp, 2
 or  al, al
 je @@expr221
 push expr_17
 call error1
 add  sp, 2

;-400 


;-401   if (istoken('=')) { exprtype= expr(1); 

@@expr221:
 push 61
 call istoken
 add  sp, 2
 or  al, al
 je @@expr222
 push 1
 call expr
 add  sp, 2
 mov word [exprtype], ax

;-402   doassign(mode, id1, ixarr, ixconst); goto e1;  }

 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call doassign
 add  sp, 8
 jmp @@e1

;-403   dovar1(mode, "mov", ixarr, id1);

@@expr222:
 push word [bp-4]
 push word [bp-6]
 push expr_18
 push word [bp-2]
 call dovar1
 add  sp, 8

;-404   


;-405 e1:    if (istoken('+')) rterm("add");

@@e1:
 push 43
 call istoken
 add  sp, 2
 or  al, al
 je @@expr223
 push expr_19
 call rterm
 add  sp, 2

;-406   else if (istoken('-')) rterm("sub" );

 jmp @@expr224
@@expr223:
 push 45
 call istoken
 add  sp, 2
 or  al, al
 je @@expr225
 push expr_20
 call rterm
 add  sp, 2

;-407   else if (istoken('&')) rterm("and" );

 jmp @@expr226
@@expr225:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@expr227
 push expr_21
 call rterm
 add  sp, 2

;-408   else if (istoken('|')) rterm("or" );  

 jmp @@expr228
@@expr227:
 push 124
 call istoken
 add  sp, 2
 or  al, al
 je @@expr229
 push expr_22
 call rterm
 add  sp, 2

;-409   else if (istoken(T_LESSLESS)) rterm("shl");

 jmp @@expr230
@@expr229:
 push 1240
 call istoken
 add  sp, 2
 or  al, al
 je @@expr231
 push expr_23
 call rterm
 add  sp, 2

;-410   else if (istoken(T_GREATGREAT)) rterm("shr");  

 jmp @@expr232
@@expr231:
 push 1241
 call istoken
 add  sp, 2
 or  al, al
 je @@expr233
 push expr_24
 call rterm
 add  sp, 2

;-411   else if (istoken('*')) domul (ids);

 jmp @@expr234
@@expr233:
 push 42
 call istoken
 add  sp, 2
 or  al, al
 je @@expr235
 push word [bp-10]
 call domul
 add  sp, 2

;-412   else if (istoken('/')) doidiv(ids);

 jmp @@expr236
@@expr235:
 push 47
 call istoken
 add  sp, 2
 or  al, al
 je @@expr237
 push word [bp-10]
 call doidiv
 add  sp, 2

;-413   else if (istoken('%')) domod (ids);

 jmp @@expr238
@@expr237:
 push 37
 call istoken
 add  sp, 2
 or  al, al
 je @@expr239
 push word [bp-10]
 call domod
 add  sp, 2

;-414   if (isrelational()) { rterm("cmp"); cmpneg(ids);}

@@expr239:
@@expr238:
@@expr236:
@@expr234:
@@expr232:
@@expr230:
@@expr228:
@@expr226:
@@expr224:
 call isrelational
 or  al, al
 je @@expr240
 push expr_25
 call rterm
 add  sp, 2
 push word [bp-10]
 call cmpneg
 add  sp, 2

;-415   return 0;

@@expr240:
 mov ax, 0
 jmp @@retn

;-416 }


;-417 


;-418 int compoundass(char *op, int mode, int id1) {

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

;-419   if(mode) error1("only scalar Var allowed");

;Function : compoundass, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   418 NULL op = bp+4
;  201 var sign word   418 NULL mode = bp+6
;  202 var sign word   418 NULL id1 = bp+8;
 ENTER  0,0
 mov ax, [bp+6]
 or  al, al
 je @@compoundass241
 push compoundass_0
 call error1
 add  sp, 2

;-420   prnl(); prs(op); prs("  "); 

@@compoundass241:
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2
 push compoundass_1
 call prs
 add  sp, 2

;-421   gettypes(id1); if (wi==2) prs("word"); else prs("byte");

 push word [bp+8]
 call gettypes
 add  sp, 2
 mov ax, [wi]
 cmp ax, 2
 jne @@compoundass242
 push compoundass_2
 call prs
 add  sp, 2
 jmp @@compoundass243
@@compoundass242:
 push compoundass_3
 call prs
 add  sp, 2

;-422     if (NASM==0) prs(" ptr "); v(id1); prs(", ");

@@compoundass243:
 mov al, [NASM]
 cmp al, 0
 jne @@compoundass244
 push compoundass_4
 call prs
 add  sp, 2
@@compoundass244:
 push word [bp+8]
 call v
 add  sp, 2
 push compoundass_5
 call prs
 add  sp, 2

;-423   expect(T_CONST); prunsign1(lexval);

 push 257
 call expect
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-424 }


;-425 int dovar1(int mode, int op, int ixarr, int id1) { 
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

;-426   gettypes(id1);

;Function : dovar1, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   425 NULL mode = bp+4
;  201 var sign word   425 NULL op = bp+6
;  202 var sign word   425 NULL ixarr = bp+8
;  203 var sign word   425 NULL id1 = bp+10;
 ENTER  0,0
 push word [bp+10]
 call gettypes
 add  sp, 2

;-427   if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);

 mov ax, [bp+4]
 cmp ax, 1
 jne @@dovar1245
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

;-428     if(widthi == 1) prs(" al, [bx]\n mov ah, 0");

 mov ax, [widthi]
 cmp ax, 1
 jne @@dovar1246
 push dovar1_1
 call prs
 add  sp, 2

;-429     if(widthi == 2) prs(" ax, [bx]");

@@dovar1246:
 mov ax, [widthi]
 cmp ax, 2
 jne @@dovar1247
 push dovar1_2
 call prs
 add  sp, 2

;-430     return; }

@@dovar1247:
 jmp @@retn

;-431   if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }

@@dovar1245:
 mov ax, [bp+4]
 cmp ax, 2
 jne @@dovar1248
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

;-432   if (ixarr) {

@@dovar1248:
 mov ax, [bp+8]
 or  al, al
 je @@dovar1249

;-433     prs("\n mov bx, "); v(ixarr);

 push dovar1_4
 call prs
 add  sp, 2
 push word [bp+8]
 call v
 add  sp, 2

;-434     if (wi==2) prs("\n shl bx, 1");

 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1250
 push dovar1_5
 call prs
 add  sp, 2

;-435     prs("\n "); prs(op);

@@dovar1250:
 push dovar1_6
 call prs
 add  sp, 2
 push word [bp+6]
 call prs
 add  sp, 2

;-436     if (wi==2) prs(" ax, "); else prs(" al, ");

 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1251
 push dovar1_7
 call prs
 add  sp, 2
 jmp @@dovar1252
@@dovar1251:
 push dovar1_8
 call prs
 add  sp, 2

;-437 // v(id1); prs(" [bx]");


;-438     prc('['); printName(id1); prs(" + bx]"); 

@@dovar1252:
 push 91
 call prc
 add  sp, 2
 push word [bp+10]
 call printName
 add  sp, 2
 push dovar1_9
 call prs
 add  sp, 2

;-439     return; }

 jmp @@retn

;-440   prnl();prs(op);

@@dovar1249:
 call prnl
 push word [bp+6]
 call prs
 add  sp, 2

;-441   if(wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne @@dovar1253
 push dovar1_10
 call prs
 add  sp, 2

;-442   if(wi==2) prs(" ax, ");

@@dovar1253:
 mov ax, [wi]
 cmp ax, 2
 jne @@dovar1254
 push dovar1_11
 call prs
 add  sp, 2

;-443   if(wi==4) prs(" eax, ");

@@dovar1254:
 mov ax, [wi]
 cmp ax, 4
 jne @@dovar1255
 push dovar1_12
 call prs
 add  sp, 2

;-444   v(id1);

@@dovar1255:
 push word [bp+10]
 call v
 add  sp, 2

;-445 }


;-446 int rterm(char *op) {int mode; int opint; int ixarr; int id1;

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

;-447   if (istoken(T_CONST)) { prnl(); prs(op); 

;Function : rterm, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   446 NULL op = bp+4
;  201 var sign word   446 NULL mode = bp-2
;  202 var sign word   446 NULL opint = bp-4
;  203 var sign word   446 NULL ixarr = bp-6
;  204 var sign word   446 NULL id1 = bp-8;
 ENTER  8,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@rterm256
 call prnl
 push word [bp+4]
 call prs
 add  sp, 2

;-448     if (wi==1) prs(" al, ");

 mov ax, [wi]
 cmp ax, 1
 jne @@rterm257
 push rterm_0
 call prs
 add  sp, 2

;-449     if (wi==2) prs(" ax, ");

@@rterm257:
 mov ax, [wi]
 cmp ax, 2
 jne @@rterm258
 push rterm_1
 call prs
 add  sp, 2

;-450     if (wi==4) prs(" eax, ");

@@rterm258:
 mov ax, [wi]
 cmp ax, 4
 jne @@rterm259
 push rterm_2
 call prs
 add  sp, 2

;-451     prunsign1(lexval); return;}

@@rterm259:
 push word [lexval]
 call prunsign1
 add  sp, 2
 jmp @@retn

;-452   mode=typeName(); id1=searchname(); ixarr=0;

@@rterm256:
 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-8], ax
 mov ax, 0
 mov [bp-6], ax

;-453   if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  

 push 91
 call istoken
 add  sp, 2
 or  al, al
 je @@rterm260
 call searchname
 mov [bp-6], ax
 push 256
 call expect
 add  sp, 2
 push 93
 call expect
 add  sp, 2

;-454     gettypes(ixarr);

 push word [bp-6]
 call gettypes
 add  sp, 2

;-455     if (widthi != 2) error1("Arrayindex muss int sein"); }

 mov ax, [widthi]
 cmp ax, 2
 je  @@rterm261
 push rterm_3
 call error1
 add  sp, 2
@@rterm261:

;-456   if (eqstr(symbol,"_AX")) return;

@@rterm260:
 push rterm_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@rterm262
 jmp @@retn

;-457   opint=op; dovar1(mode, opint, ixarr, id1);

@@rterm262:
 mov ax, [bp+4]
 mov [bp-4], ax
 push word [bp-8]
 push word [bp-6]
 push word [bp-4]
 push word [bp-2]
 call dovar1
 add  sp, 8

;-458 }


;-459 int isreg() {

@@retn: LEAVE
 ret
; ENDP
rterm_0 db " al, ",0
rterm_1 db " ax, ",0
rterm_2 db " eax, ",0
rterm_3 db "Arrayindex muss int sein",0
rterm_4 db "_AX",0

isreg:  ; *** PROC ***

;-460   if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}

 push isreg_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg263
 push isreg_1
 call doreg
 add  sp, 2
 jmp @@r1

;-461   if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  

@@isreg263:
 push isreg_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg264
 push isreg_3
 call doreg
 add  sp, 2
 jmp @@r1

;-462   if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}

@@isreg264:
 push isreg_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg265
 push isreg_5
 call doreg
 add  sp, 2
 jmp @@r1

;-463   if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}

@@isreg265:
 push isreg_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg266
 push isreg_7
 call doreg
 add  sp, 2
 jmp @@r1

;-464   if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}

@@isreg266:
 push isreg_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg267
 push isreg_9
 call doreg
 add  sp, 2
 jmp @@r1

;-465   if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    

@@isreg267:
 push isreg_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg268
 push isreg_11
 call doreg
 add  sp, 2
 jmp @@r1

;-466   if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}

@@isreg268:
 push isreg_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg269
 push isreg_13
 call doreg
 add  sp, 2
 jmp @@r1

;-467   if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}

@@isreg269:
 push isreg_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg270
 push isreg_15
 call doreg
 add  sp, 2
 jmp @@r1

;-468   if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    

@@isreg270:
 push isreg_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg271
 push isreg_17
 call doreg
 add  sp, 2
 jmp @@r1

;-469   if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}

@@isreg271:
 push isreg_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg272
 push isreg_19
 call doreg
 add  sp, 2
 jmp @@r1

;-470   if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}

@@isreg272:
 push isreg_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg273
 push isreg_21
 call doreg
 add  sp, 2
 jmp @@r1

;-471   if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  

@@isreg273:
 push isreg_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg274
 push isreg_23
 call doreg
 add  sp, 2
 jmp @@r1

;-472   if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}

@@isreg274:
 push isreg_24
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg275
 push isreg_25
 call doreg
 add  sp, 2
 jmp @@r1

;-473   if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}

@@isreg275:
 push isreg_26
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg276
 push isreg_27
 call doreg
 add  sp, 2
 jmp @@r1

;-474   if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  

@@isreg276:
 push isreg_28
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@isreg277
 push isreg_29
 call doreg
 add  sp, 2
 jmp @@r1

;-475   return 0;   r1: return 1; 

@@isreg277:
 mov ax, 0
 jmp @@retn
@@r1:
 mov ax, 1
 jmp @@retn

;-476 }


;-477 int doreg(char *dr) { int i; expect('=');

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
;  200 ptr sign byte   477 NULL dr = bp+4
;  201 var sign word   477 NULL i = bp-2;
 ENTER  2,0
 push 61
 call expect
 add  sp, 2

;-478   prs("\n mov  "); prs(dr); prs(", ");

 push doreg_0
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2
 push doreg_1
 call prs
 add  sp, 2

;-479        if (istoken(T_CONST)) prunsign1(lexval);

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg278
 push word [lexval]
 call prunsign1
 add  sp, 2

;-480   else if (istoken(T_NAME )) { i=searchname(); v(i); }

 jmp @@doreg279
@@doreg278:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je @@doreg280
 call searchname
 mov [bp-2], ax
 push word [bp-2]
 call v
 add  sp, 2

;-481   else error1("only number or var allowed"); }

 jmp @@doreg281
@@doreg280:
 push doreg_2
 call error1
 add  sp, 2
@@doreg281:
@@doreg279:

;-482 


;-483 int doassign(int mode, int i, int ixarr, int ixconst) {
 LEAVE
 ret
; ENDP
doreg_0 db "\n mov  ",0
doreg_1 db ", ",0
doreg_2 db "only number or var allowed",0

doassign:  ; *** PROC ***

;-484   gettypes(i);

;Function : doassign, Number of local variables: 4
;   # type sign width addr used name   list of local variables
;  200 var sign word   483 NULL mode = bp+4
;  201 var sign word   483 NULL i = bp+6
;  202 var sign word   483 NULL ixarr = bp+8
;  203 var sign word   483 NULL ixconst = bp+10;
 ENTER  0,0
 push word [bp+6]
 call gettypes
 add  sp, 2

;-485   if (mode==1) {prs("\n mov  bx, ");v(i);                       /*NASM??*/

 mov ax, [bp+4]
 cmp ax, 1
 jne @@doassign282
 push doassign_0
 call prs
 add  sp, 2
 push word [bp+6]
 call v
 add  sp, 2

;-486     if (widthi == 2) prs("\n mov  [bx], ax");

 mov ax, [widthi]
 cmp ax, 2
 jne @@doassign283
 push doassign_1
 call prs
 add  sp, 2

;-487     else  prs("\n mov  [bx], al"); return;}

 jmp @@doassign284
@@doassign283:
 push doassign_2
 call prs
 add  sp, 2
@@doassign284:
 jmp @@retn

;-488   if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}

@@doassign282:
 mov ax, [bp+4]
 cmp ax, 2
 jne @@doassign285
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

;-489   if (ixarr) {  prs("\n mov bx, ");

@@doassign285:
 mov ax, [bp+8]
 or  al, al
 je @@doassign286
 push doassign_5
 call prs
 add  sp, 2

;-490     if(ixconst) prunsign1(ixarr); else v(ixarr);

 mov ax, [bp+10]
 or  al, al
 je @@doassign287
 push word [bp+8]
 call prunsign1
 add  sp, 2
 jmp @@doassign288
@@doassign287:
 push word [bp+8]
 call v
 add  sp, 2

;-491     if (wi==2) prs("\n shl bx, 1");

@@doassign288:
 mov ax, [wi]
 cmp ax, 2
 jne @@doassign289
 push doassign_6
 call prs
 add  sp, 2

;-492     prs("\n mov ["); printName(i);

@@doassign289:
 push doassign_7
 call prs
 add  sp, 2
 push word [bp+6]
 call printName
 add  sp, 2

;-493     if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }

 mov ax, [wi]
 cmp ax, 2
 jne @@doassign290
 push doassign_8
 call prs
 add  sp, 2
 jmp @@doassign291
@@doassign290:
 push doassign_9
 call prs
 add  sp, 2
@@doassign291:
 jmp @@retn

;-494   if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");

@@doassign286:
 mov ax, [wi]
 cmp ax, 1
 jne @@doassign292
 push doassign_10
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign293
 push doassign_11
 call prs
 add  sp, 2

;-495     if(NASM==0)prs("ptr ");} v(i); prs(", al"); return; }

 mov al, [NASM]
 cmp al, 0
 jne @@doassign294
 push doassign_12
 call prs
 add  sp, 2
@@doassign294:
@@doassign293:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_13
 call prs
 add  sp, 2
 jmp @@retn

;-496   if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");

@@doassign292:
 mov ax, [wi]
 cmp ax, 2
 jne @@doassign295
 push doassign_14
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign296
 push doassign_15
 call prs
 add  sp, 2

;-497     if(NASM==0)prs("ptr ");} v(i); prs(", ax"); return; }

 mov al, [NASM]
 cmp al, 0
 jne @@doassign297
 push doassign_16
 call prs
 add  sp, 2
@@doassign297:
@@doassign296:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_17
 call prs
 add  sp, 2
 jmp @@retn

;-498   if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");

@@doassign295:
 mov ax, [wi]
 cmp ax, 4
 jne @@doassign298
 push doassign_18
 call prs
 add  sp, 2
 mov ax, [bp+6]
 cmp ax, 200
 jge @@doassign299
 push doassign_19
 call prs
 add  sp, 2

;-499     if(NASM==0)prs("ptr ");} v(i); prs(", eax"); return; }

 mov al, [NASM]
 cmp al, 0
 jne @@doassign300
 push doassign_20
 call prs
 add  sp, 2
@@doassign300:
@@doassign299:
 push word [bp+6]
 call v
 add  sp, 2
 push doassign_21
 call prs
 add  sp, 2
 jmp @@retn

;-500 }

@@doassign298:

;-501 int domul(int ids) {

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

;-502   if (ids) rterm("imul"); else {

;Function : domul, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   501 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 or  al, al
 je @@domul301
 push domul_0
 call rterm
 add  sp, 2
 jmp @@domul302
@@domul301:

;-503   if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@domul303
 push domul_1
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2
 push domul_2
 call prs
 add  sp, 2

;-504   else error1("with MUL only const number as multiplicator allowed"); } }

 jmp @@domul304
@@domul303:
 push domul_3
 call error1
 add  sp, 2
@@domul304:
@@domul302:

;-505 int doidiv(int ids) { int mode; int id1;
 LEAVE
 ret
; ENDP
domul_0 db "imul",0
domul_1 db "\n mov bx, ",0
domul_2 db "\n mul bx",0
domul_3 db "with MUL only const number as multiplicator allowed",0

doidiv:  ; *** PROC ***

;-506   if (istoken(T_CONST)) {

;Function : doidiv, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   505 NULL ids = bp+4
;  201 var sign word   505 NULL mode = bp-2
;  202 var sign word   505 NULL id1 = bp-4;
 ENTER  4,0
 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@doidiv305

;-507     prs("\n mov bx, "); prunsign1(lexval);

 push doidiv_0
 call prs
 add  sp, 2
 push word [lexval]
 call prunsign1
 add  sp, 2

;-508     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je @@doidiv306
 push doidiv_1
 call prs
 add  sp, 2
 jmp @@doidiv307
@@doidiv306:
 push doidiv_2
 call prs
 add  sp, 2
@@doidiv307:

;-509   else {

 jmp @@doidiv308
@@doidiv305:

;-510     mode=typeName(); id1=searchname();

 call typeName
 mov [bp-2], ax
 call searchname
 mov [bp-4], ax

;-511     if (mode) error1("only const number or int as divisor allowed");

 mov ax, [bp-2]
 or  al, al
 je @@doidiv309
 push doidiv_3
 call error1
 add  sp, 2

;-512     gettypes(id1);

@@doidiv309:
 push word [bp-4]
 call gettypes
 add  sp, 2

;-513     if (typei) error1("only int as simple var divisor allowed");

 mov ax, [typei]
 or  al, al
 je @@doidiv310
 push doidiv_4
 call error1
 add  sp, 2

;-514     if (wi!=2) error1("only int, no byte as divisor allowed");

@@doidiv310:
 mov ax, [wi]
 cmp ax, 2
 je  @@doidiv311
 push doidiv_5
 call error1
 add  sp, 2

;-515     prs("\n mov bx, "); v(id1);

@@doidiv311:
 push doidiv_6
 call prs
 add  sp, 2
 push word [bp-4]
 call v
 add  sp, 2

;-516     if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }

 mov ax, [bp+4]
 or  al, al
 je @@doidiv312
 push doidiv_7
 call prs
 add  sp, 2
 jmp @@doidiv313
@@doidiv312:
 push doidiv_8
 call prs
 add  sp, 2
@@doidiv313:

;-517 }

@@doidiv308:

;-518 int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }
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
;  200 var sign word   518 NULL ids = bp+4;
 ENTER  0,0
 push word [bp+4]
 call doidiv
 add  sp, 2
 push domod_0
 call prs
 add  sp, 2

;-519 


;-520 int docalltype[10]; int docallvalue[10];
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

;-521 char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register

section .bss
absolute 53451
procname resb 17
section .text

;-522 int docall1() {int i; int narg; int t0; int n0;  int sz32;


docall1:  ; *** PROC ***

;-523   narg=0;  sz32=0;

;Function : docall1, Number of local variables: 5
;   # type sign width addr used name   list of local variables
;  200 var sign word   522 NULL i = bp-2
;  201 var sign word   522 NULL narg = bp-4
;  202 var sign word   522 NULL t0 = bp-6
;  203 var sign word   522 NULL n0 = bp-8
;  204 var sign word   522 NULL sz32 = bp-10;
 ENTER  10,0
 mov ax, 0
 mov [bp-4], ax
 mov ax, 0
 mov [bp-10], ax

;-524   checknamelen();

 call checknamelen

;-525   strcpy(&procname, symbol);

 lea  ax, [symbol]
 push ax
 lea  ax, [procname]
 push ax
 call strcpy
 add  sp, 4

;-526   storecall();

 call storecall

;-527   expect('(');

 push 40
 call expect
 add  sp, 2

;-528 	if (istoken(')') ==0 ) {

 push 41
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@docall1314

;-529 	  do { narg++;

@@docall1315:
 inc  word[bp-4]

;-530 	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;

 mov ax, [bp-4]
 cmp ax, 9
 jle @@docall1316
 push docall1_0
 call error1
 add  sp, 2
@@docall1316:
 mov ax, 0
 mov [bp-6], ax

;-531       if(istoken(T_CONST)) {t0=1; n0=lexval; }

 push 257
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1317
 mov ax, 1
 mov [bp-6], ax
 mov ax, [lexval]
 mov [bp-8], ax

;-532       if(istoken(T_STRING)){t0=2; n0=nconst;

@@docall1317:
 push 258
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1318
 mov ax, 2
 mov [bp-6], ax
 mov ax, [nconst]
 mov [bp-8], ax

;-533         eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");

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

;-534         eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }

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

;-535       if(istoken('&'))     {t0=3; name1(); n0=searchname();}

@@docall1318:
 push 38
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1319
 mov ax, 3
 mov [bp-6], ax
 call name1
 call searchname
 mov [bp-8], ax

;-536       if(istoken(T_NAME))  { n0=checkreg();

@@docall1319:
 push 256
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1320
 call checkreg
 mov [bp-8], ax

;-537         if (n0) t0=5;

 mov ax, [bp-8]
 or  al, al
 je @@docall1321
 mov ax, 5
 mov [bp-6], ax

;-538         else {t0=4; n0=searchname();

 jmp @@docall1322
@@docall1321:
 mov ax, 4
 mov [bp-6], ax
 call searchname
 mov [bp-8], ax

;-539           p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }

 mov ax, GType
 mov word [p1], ax
 mov ax, [p1]
 add ax, [bp-8]
 mov word [p1], ax
 mov bx, [p1]
 mov al, [bx]
 mov ah, 0
 cmp ax, 38
 jne @@docall1323
 mov ax, 3
 mov [bp-6], ax
@@docall1323:
@@docall1322:

;-540       if (t0==0) error1("parameter not recognized (no * allowed)");

@@docall1320:
 mov ax, [bp-6]
 cmp ax, 0
 jne @@docall1324
 push docall1_4
 call error1
 add  sp, 2

;-541       docalltype [narg] = t0;

@@docall1324:
 mov ax, [bp-6]
 mov bx, [bp-4]
 shl bx, 1
 mov [docalltype+bx], ax

;-542       docallvalue[narg] = n0;

 mov ax, [bp-8]
 mov bx, [bp-4]
 shl bx, 1
 mov [docallvalue+bx], ax

;-543     } while (istoken(','));

 push 44
 call istoken
 add  sp, 2
 or  al, al
 je @@docall1325
 jmp @@docall1315
@@docall1325:

;-544     


;-545   	expect(')');  i=narg;

 push 41
 call expect
 add  sp, 2
 mov ax, [bp-4]
 mov [bp-2], ax

;-546     do {

@@docall1326:

;-547       t0 = docalltype [i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docalltype + bx]
 mov [bp-6], ax

;-548       n0 = docallvalue[i];     

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [docallvalue + bx]
 mov [bp-8], ax

;-549       if(t0==1){ prs("\n push "); pint1(n0);}

 mov ax, [bp-6]
 cmp ax, 1
 jne @@docall1327
 push docall1_5
 call prs
 add  sp, 2
 push word [bp-8]
 call pint1
 add  sp, 2

;-550       if(t0==2){ prs("\n push "); if(NASM==0) prs("offset ");

@@docall1327:
 mov ax, [bp-6]
 cmp ax, 2
 jne @@docall1328
 push docall1_6
 call prs
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@docall1329
 push docall1_7
 call prs
 add  sp, 2

;-551         prs(fname);prc(95);pint1(n0);}

@@docall1329:
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

;-552       if(t0==3){ prs("\n lea  ax, "); if(NASM==0)prs("word ptr ");  v(n0);

@@docall1328:
 mov ax, [bp-6]
 cmp ax, 3
 jne @@docall1330
 push docall1_8
 call prs
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@docall1331
 push docall1_9
 call prs
 add  sp, 2
@@docall1331:
 push word [bp-8]
 call v
 add  sp, 2

;-553         prs("\n push ax");}

 push docall1_10
 call prs
 add  sp, 2

;-554       if(t0==4){ gettypes(n0); 

@@docall1330:
 mov ax, [bp-6]
 cmp ax, 4
 jne @@docall1332
 push word [bp-8]
 call gettypes
 add  sp, 2

;-555         if(wi==2) { prs("\n push word ");if(NASM==0)prs("ptr "); v(n0);}

 mov ax, [wi]
 cmp ax, 2
 jne @@docall1333
 push docall1_11
 call prs
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@docall1334
 push docall1_12
 call prs
 add  sp, 2
@@docall1334:
 push word [bp-8]
 call v
 add  sp, 2

;-556         else { prs("\n mov al, byte ");  if(NASM==0)prs("ptr "); v(n0);

 jmp @@docall1335
@@docall1333:
 push docall1_13
 call prs
 add  sp, 2
 mov al, [NASM]
 cmp al, 0
 jne @@docall1336
 push docall1_14
 call prs
 add  sp, 2
@@docall1336:
 push word [bp-8]
 call v
 add  sp, 2

;-557         prs("\n mov ah, 0\n push ax"); } }

 push docall1_15
 call prs
 add  sp, 2
@@docall1335:

;-558       if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }

@@docall1332:
 mov ax, [bp-6]
 cmp ax, 5
 jne @@docall1337
 push docall1_16
 call prs
 add  sp, 2
 push word [bp-8]
 call printreg
 add  sp, 2
 mov ax, [bp-8]
 cmp ax, 47 ;unsigned : 1
 jl  @@docall1338
 mov ax, [bp-10]
 add ax, 2
@@docall1338:

;-559    i--; } while (i > 0);  }

@@docall1337:
 dec  word[bp-2]
 mov ax, [bp-2]
 cmp ax, 0
 jle @@docall1339
 jmp @@docall1326
@@docall1339:

;-560 	 prs("\n call "); prs(&procname);

@@docall1314:
 push docall1_17
 call prs
 add  sp, 2
 lea  ax, [procname]
 push ax
 call prs
 add  sp, 2

;-561 	 if (narg>0) {prs("\n add  sp, ");

 mov ax, [bp-4]
 cmp ax, 0
 jle @@docall1340
 push docall1_18
 call prs
 add  sp, 2

;-562      narg=narg+narg; narg=narg+sz32; pint1(narg); } }

 mov ax, [bp-4]
 add ax, [bp-4]
 mov [bp-4], ax
 mov ax, [bp-4]
 add ax, [bp-10]
 mov [bp-4], ax
 push word [bp-4]
 call pint1
 add  sp, 2
@@docall1340:

;-563 /****************************************************************************/


;-564 int main() {
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

;-565   getarg();

 call getarg

;-566   setblock(4096);

 push 4096
 call setblock
 add  sp, 2

;-567   if (DOS_ERR) error1("SetBlock , AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je @@main341
 push main_0
 call error1
 add  sp, 2

;-568   segE=allocmem(4096);

@@main341:
 push 4096
 call allocmem
 add  sp, 2
 mov word [segE], ax

;-569   if (DOS_ERR)  error1("alloc memory, AX=");

 mov ax, [DOS_ERR]
 or  al, al
 je @@main342
 push main_1
 call error1
 add  sp, 2

;-570   CNameTop=0;

@@main342:
 mov ax, 0
 mov word [CNameTop], ax

;-571   getfirstchar();

 call getfirstchar

;-572   parse();

 call parse

;-573   callrecursive=0; checkcalls(); epilog();

 mov ax, 0
 mov word [callrecursive], ax
 call checkcalls
 call epilog

;-574 }


;-575 int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }

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

;-576 char *arglen=0x80; char *argv=0x82;

 ret
; ENDP
arglen dw 128
argv dw 130

;-577 int getarg() { int arglen1; int i; char *c;


getarg:  ; *** PROC ***

;-578   arglen1=*arglen;

;Function : getarg, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   577 NULL arglen1 = bp-2
;  201 var sign word   577 NULL i = bp-4
;  202 ptr sign byte   577 NULL c = bp-6;
 ENTER  6,0
 mov bx, [arglen]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], ax

;-579   if (arglen1) { i=arglen1+129; *i=0; }

 mov ax, [bp-2]
 or  al, al
 je @@getarg343
 mov ax, [bp-2]
 add ax, 129
 mov [bp-4], ax
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], ax

;-580   else { cputs(Version1); cputs(" Usage: F.COM [/N] in_file[.C] (/N=NASM): ");

 jmp @@getarg344
@@getarg343:
 lea  ax, [Version1]
 push ax
 call cputs
 add  sp, 2
 push getarg_0
 call cputs
 add  sp, 2

;-581     DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }

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

;-582   strcpy(namein, argv);

@@getarg344:
 push word [argv]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-583   if (instr2(namein, '.') == 0) strcat1(namein, ".C");

 push 46
 lea  ax, [namein]
 push ax
 call instr2
 add  sp, 4
 cmp ax, 0
 jne @@getarg345
 push getarg_1
 lea  ax, [namein]
 push ax
 call strcat1
 add  sp, 4

;-584   toupper(namein);

@@getarg345:
 lea  ax, [namein]
 push ax
 call toupper
 add  sp, 2

;-585   c=instr2(namein, '/');

 push 47
 lea  ax, [namein]
 push ax
 call instr2
 add  sp, 4
 mov [bp-6], ax

;-586   if (c != 0)  { c++; if (*c == 'N') {NASM=1; c+=2; strcpy(namein, c);  }

 mov ax, [bp-6]
 cmp ax, 0
 je  @@getarg346
 inc  word[bp-6]
 mov bx, [bp-6]
 mov al, [bx]
 mov ah, 0
 cmp ax, 78
 jne @@getarg347
 mov ax, 1
 mov byte [NASM], al
 add  word[bp-6], 2
 push word [bp-6]
 lea  ax, [namein]
 push ax
 call strcpy
 add  sp, 4

;-587     else {cputs("Parameter unknown "); exitR(3);  }  }

 jmp @@getarg348
@@getarg347:
 push getarg_2
 call cputs
 add  sp, 2
 push 3
 call exitR
 add  sp, 2
@@getarg348:

;-588   strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';

@@getarg346:
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

;-589  


;-590   fdin=openR (namein);

 lea  ax, [namein]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-591   if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }

 mov ax, [DOS_ERR]
 or  al, al
 je @@getarg349
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

;-592   fdout=creatR(namelst);

@@getarg349:
 lea  ax, [namelst]
 push ax
 call creatR
 add  sp, 2
 mov word [fdout], ax

;-593   if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}

 mov ax, [DOS_ERR]
 or  al, al
 je @@getarg350
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

;-594   prs("\n; ");prs(Version1);

@@getarg350:
 push getarg_5
 call prs
 add  sp, 2
 lea  ax, [Version1]
 push ax
 call prs
 add  sp, 2

;-595   prs(", Arglen: "); pint1(arglen1); if(arglen1){prs(", Argv: "); prs(argv);}

 push getarg_6
 call prs
 add  sp, 2
 push word [bp-2]
 call pint1
 add  sp, 2
 mov ax, [bp-2]
 or  al, al
 je @@getarg351
 push getarg_7
 call prs
 add  sp, 2
 push word [argv]
 call prs
 add  sp, 2

;-596   prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);

@@getarg351:
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

;-597   if (NASM) prs("\norg  256 ; NASM ON\njmp main"); else

 mov al, [NASM]
 or  al, al
 je @@getarg352
 push getarg_10
 call prs
 add  sp, 2

;-598   prs("\n.MODEL TINY,C\n.386P\n.CODE\nJUMPS\nLOCALS\nSTARTUPCODE\njmp main");

 jmp @@getarg353
@@getarg352:
 push getarg_11
 call prs
 add  sp, 2

;-599 }

@@getarg353:

;-600 int parse() { token=getlex(); do {
 LEAVE
 ret
; ENDP
getarg_0 db " Usage: F.COM [/N] in_file[.C] (/N=NASM): ",0
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
@@parse354:

;-601     if (token <= 0) return 1;

 mov ax, [token]
 cmp ax, 0
 jg  @@parse355
 mov ax, 1
 jmp @@retn

;-602     if (istoken('#')) {

@@parse355:
 push 35
 call istoken
 add  sp, 2
 or  al, al
 je @@parse356

;-603       if (istoken(T_DEFINE)) dodefine();

 push 511
 call istoken
 add  sp, 2
 or  al, al
 je @@parse357
 call dodefine

;-604       else if (istoken(T_INCLUDE)) doinclude();

 jmp @@parse358
@@parse357:
 push 510
 call istoken
 add  sp, 2
 or  al, al
 je @@parse359
 call doinclude

;-605       else error1("define or include expected");  }

 jmp @@parse360
@@parse359:
 push parse_0
 call error1
 add  sp, 2
@@parse360:
@@parse358:

;-606     else{ typeName();  if (token=='(') dofunc();  else doglob(); }

 jmp @@parse361
@@parse356:
 call typeName
 mov ax, [token]
 cmp ax, 40
 jne @@parse362
 call dofunc
 jmp @@parse363
@@parse362:
 call doglob
@@parse363:

;-607   } while(1);

@@parse361:
 mov ax, 1
 or  al, al
 je @@parse364
 jmp @@parse354
@@parse364:

;-608 }


;-609 int checkcalls() { int i; int j; int k;

@@retn:
 ret
; ENDP
parse_0 db "define or include expected",0

checkcalls:  ; *** PROC ***

;-610   prs("\n \n; missing functions: ");

;Function : checkcalls, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   609 NULL i = bp-2
;  201 var sign word   609 NULL j = bp-4
;  202 var sign word   609 NULL k = bp-6;
 ENTER  6,0
 push checkcalls_0
 call prs
 add  sp, 2

;-611   i=0;  k=0;

 mov ax, 0
 mov [bp-2], ax
 mov ax, 0
 mov [bp-6], ax

;-612   while (i < CTop) {

@@checkcalls365:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@checkcalls366

;-613     pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-614     from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-615     j=0;

 mov ax, 0
 mov [bp-4], ax

;-616     do { p1=adrF(FNameField, j);

@@checkcalls367:
 push word [bp-4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [p1], ax

;-617       if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }

 push word [p1]
 lea  ax, [NameA]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@checkcalls368
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 mov ax, [FTop]
 mov [bp-4], ax

;-618       j++; } while (j < FTop);

@@checkcalls368:
 inc  word[bp-4]
 mov ax, [bp-4]
 cmp ax, [FTop]
 jge @@checkcalls369
 jmp @@checkcalls367
@@checkcalls369:

;-619     if (j == FTop) { k++; prs("\n; "); prs(NameA); }

 mov ax, [bp-4]
 cmp ax, [FTop]
 jne @@checkcalls370
 inc  word[bp-6]
 push checkcalls_1
 call prs
 add  sp, 2
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-620     i++; }

@@checkcalls370:
 inc  word[bp-2]

;-621   if (k!=0) doar(k); else {prs(" All FUNCTIONs in place");

 jmp @@checkcalls365
@@checkcalls366:
 mov ax, [bp-6]
 cmp ax, 0
 je  @@checkcalls371
 push word [bp-6]
 call doar
 add  sp, 2
 jmp @@checkcalls372
@@checkcalls371:
 push checkcalls_2
 call prs
 add  sp, 2

;-622     cputs("  All CALLs OK! "); }

 push checkcalls_3
 call cputs
 add  sp, 2

;-623 }

@@checkcalls372:

;-624 char wasfunction;
 LEAVE
 ret
; ENDP
checkcalls_0 db "\n \n; missing functions: ",0
checkcalls_1 db "\n; ",0
checkcalls_2 db " All FUNCTIONs in place",0
checkcalls_3 db "  All CALLs OK! ",0
wasfunction db 0

;-625 int doar(int k) { int i; int fdtemp; int fdout1; int used; int found;


doar:  ; *** PROC ***

;-626   cputs("  Open CALLs :"); pint(k);

;Function : doar, Number of local variables: 6
;   # type sign width addr used name   list of local variables
;  200 var sign word   625 NULL k = bp+4
;  201 var sign word   625 NULL i = bp-2
;  202 var sign word   625 NULL fdtemp = bp-4
;  203 var sign word   625 NULL fdout1 = bp-6
;  204 var sign word   625 NULL used = bp-8
;  205 var sign word   625 NULL found = bp-10;
 ENTER  10,0
 push doar_0
 call cputs
 add  sp, 2
 push word [bp+4]
 call pint
 add  sp, 2

;-627   prs("\n; Number of unresolved CALLs :"); printint51(k);

 push doar_1
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-628   fdin=openR (archivename);

 lea  ax, [archivename]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-629   if(DOS_ERR){cputs("Archive file missing: "); cputs(archivename); exitR(3); }

 mov ax, [DOS_ERR]
 or  al, al
 je @@doar373
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

;-630   prs("\n;use archive file: "); prs(archivename);

@@doar373:
 push doar_3
 call prs
 add  sp, 2
 lea  ax, [archivename]
 push ax
 call prs
 add  sp, 2

;-631   fdtemp=fdout;

 mov ax, [fdout]
 mov [bp-4], ax

;-632   wasfunction=0;

 mov ax, 0
 mov byte [wasfunction], al

;-633   getfirstchar();

 call getfirstchar

;-634   do { fdout=0;do {found=getfunctionhead();}while (found==0); fdout=fdtemp;

@@doar374:
 mov ax, 0
 mov word [fdout], ax
@@doar375:
 call getfunctionhead
 mov [bp-10], ax
 mov ax, [bp-10]
 cmp ax, 0
 jne @@doar376
 jmp @@doar375
@@doar376:
 mov ax, [bp-4]
 mov word [fdout], ax

;-635        if (found > 0) {

 mov ax, [bp-10]
 cmp ax, 0
 jle @@doar377

;-636          used=0; i=0;

 mov ax, 0
 mov [bp-8], ax
 mov ax, 0
 mov [bp-2], ax

;-637          while (i < CTop) {

@@doar378:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@doar379

;-638            pt=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [pt], ax

;-639            from_far(NameA, pt);

 push word [pt]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-640            if (eqstr(symbol, NameA)) {

 lea  ax, [NameA]
 push ax
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@doar380

;-641              if (CType[i] == 0) {CType[i]=1; used++; } }  i++; }

 mov bx, [bp-2]
 mov al, [CType + bx]
 cmp al, 0
 jne @@doar381
 mov ax, 1
 mov bx, [bp-2]
 mov [CType+bx], al
 inc  word[bp-8]
@@doar381:
@@doar380:
 inc  word[bp-2]

;-642            if (used) {

 jmp @@doar378
@@doar379:
 mov ax, [bp-8]
 or  al, al
 je @@doar382

;-643               prs("\n;Number of CALLs:"); printint51(used);

 push doar_4
 call prs
 add  sp, 2
 push word [bp-8]
 call printint51
 add  sp, 2

;-644               prs(" : "); prs(symbol); dofunc(); wasfunction=1; }

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

;-645         }

@@doar382:

;-646      } while (token);

@@doar377:
 mov ax, [token]
 or  al, al
 je @@doar383
 jmp @@doar374
@@doar383:

;-647   prs("\n;End of archive file. ");

 push doar_6
 call prs
 add  sp, 2

;-648   callrecursive++; if (callrecursive < 5) checkcalls();

 inc  word[callrecursive]
 mov ax, [callrecursive]
 cmp ax, 5
 jge @@doar384
 call checkcalls

;-649     else {putch(10); cputs("***ERROR*** function(s) missing! ");

 jmp @@doar385
@@doar384:
 push 10
 call putch
 add  sp, 2
 push doar_7
 call cputs
 add  sp, 2

;-650     error1("At least 1 function is missing in archive file! "); }

 push doar_8
 call error1
 add  sp, 2

;-651 }

@@doar385:

;-652 int getfunctionhead() {
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

;-653   if (wasfunction) wasfunction=0; else token=getlex();

 mov al, [wasfunction]
 or  al, al
 je @@getfunctionhead386
 mov ax, 0
 mov byte [wasfunction], al
 jmp @@getfunctionhead387
@@getfunctionhead386:
 call getlex
 mov word [token], ax

;-654   if (token == 0) return 0xFFFF;

@@getfunctionhead387:
 mov ax, [token]
 cmp ax, 0
 jne @@getfunctionhead388
 mov ax, 65535
 jmp @@retn

;-655   if(istoken(T_INT))  { if (token != T_NAME) return 0;

@@getfunctionhead388:
 push 517
 call istoken
 add  sp, 2
 or  al, al
 je @@getfunctionhead389
 mov ax, [token]
 cmp ax, 256
 je  @@getfunctionhead390
 mov ax, 0
 jmp @@retn

;-656   token=getlex(); if (token == '(') return 1; }

@@getfunctionhead390:
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 40
 jne @@getfunctionhead391
 mov ax, 1
 jmp @@retn
@@getfunctionhead391:

;-657   return 0;

@@getfunctionhead389:
 mov ax, 0
 jmp @@retn

;-658 }


;-659 int doinclude() { int fdtemp;

@@retn:
 ret
; ENDP

doinclude:  ; *** PROC ***

;-660   if (token==T_STRING) {  fdtemp=fdin;

;Function : doinclude, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   659 NULL fdtemp = bp-2;
 ENTER  2,0
 mov ax, [token]
 cmp ax, 258
 jne @@doinclude392
 mov ax, [fdin]
 mov [bp-2], ax

;-661   prs("\n;Use include file: "); prs(symbol);

 push doinclude_0
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-662   fdin=openR(symbol);

 lea  ax, [symbol]
 push ax
 call openR
 add  sp, 2
 mov word [fdin], ax

;-663   if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);

 mov ax, [DOS_ERR]
 cmp ax, 0
 je  @@doinclude393
 push doinclude_1
 call prs
 add  sp, 2
 lea  ax, [symbol]
 push ax
 call prs
 add  sp, 2

;-664     error1(" Stop!!"); }

 push doinclude_2
 call error1
 add  sp, 2

;-665   linenoinclude=lineno; lineno=1;

@@doinclude393:
 mov ax, [lineno]
 mov word [linenoinclude], ax
 mov ax, 1
 mov word [lineno], ax

;-666   parse(); lineno=linenoinclude;

 call parse
 mov ax, [linenoinclude]
 mov word [lineno], ax

;-667   fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);

 mov ax, [bp-2]
 mov word [fdin], ax
 push doinclude_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-668   getfirstchar(); token=getlex(); }

 call getfirstchar
 call getlex
 mov word [token], ax

;-669 }

@@doinclude392:

;-670 int dodefine() { int i; int j; int fdtemp;
 LEAVE
 ret
; ENDP
doinclude_0 db "\n;Use include file: ",0
doinclude_1 db "Include file missing: ",0
doinclude_2 db " Stop!!",0
doinclude_3 db "\n;Back to main program: ",0

dodefine:  ; *** PROC ***

;-671   if (eqstr(symbol, "BSS"   )) {BSS =1; token=getlex(); return; }

;Function : dodefine, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   670 NULL i = bp-2
;  201 var sign word   670 NULL j = bp-4
;  202 var sign word   670 NULL fdtemp = bp-6;
 ENTER  6,0
 push dodefine_0
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine394
 mov ax, 1
 mov byte [BSS], al
 call getlex
 mov word [token], ax
 jmp @@retn

;-672   if (eqstr(symbol, "LIST"  )) {LIST=1; token=getlex(); return; }

@@dodefine394:
 push dodefine_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine395
 mov ax, 1
 mov byte [LIST], al
 call getlex
 mov word [token], ax
 jmp @@retn

;-673   if (eqstr(symbol, "NOLIST")) {LIST=0; token=getlex(); return; }

@@dodefine395:
 push dodefine_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine396
 mov ax, 0
 mov byte [LIST], al
 call getlex
 mov word [token], ax
 jmp @@retn

;-674   if (eqstr(symbol, "ORGDATA")) {token=getlex();

@@dodefine396:
 push dodefine_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine397
 call getlex
 mov word [token], ax

;-675     ORGDATAORIG=lexval; orgData=lexval; return; }

 mov ax, [lexval]
 mov word [ORGDATAORIG], ax
 mov ax, [lexval]
 mov word [orgData], ax
 jmp @@retn

;-676   if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {

@@dodefine397:
 push dodefine_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@dodefine398
 call getlex
 mov word [token], ax
 mov ax, [token]
 cmp ax, 258
 jne @@dodefine399

;-677     prs("\n;Use archive file: ");

 push dodefine_5
 call prs
 add  sp, 2

;-678     strcpy(archivename, symbol); prs(archivename);

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

;-679     } else error1("Name of archive file missing"); token=getlex(); return;}

 jmp @@dodefine400
@@dodefine399:
 push dodefine_6
 call error1
 add  sp, 2
@@dodefine400:
 call getlex
 mov word [token], ax
 jmp @@retn

;-680    expect(T_NAME);

@@dodefine398:
 push 256
 call expect
 add  sp, 2

;-681   if (token==T_CONST) { 

 mov ax, [token]
 cmp ax, 257
 jne @@dodefine401

;-682     if (GTop >= LSTART) error1("global table (define) full");

 mov ax, [GTop]
 cmp ax, 200 ;unsigned : 1
 jl  @@dodefine402
 push dodefine_7
 call error1
 add  sp, 2

;-683     i=strlen(symbol); if (i>15) error1("Define name longer 15 char");

@@dodefine402:
 lea  ax, [symbol]
 push ax
 call strlen
 add  sp, 2
 mov [bp-2], ax
 mov ax, [bp-2]
 cmp ax, 15
 jle @@dodefine403
 push dodefine_8
 call error1
 add  sp, 2

;-684     GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';

@@dodefine403:
 mov ax, 85
 mov bx, [GTop]
 mov [GSign+bx], al
 mov ax, 1
 mov bx, [GTop]
 mov [GWidth+bx], al
 mov ax, 35
 mov bx, [GTop]
 mov [GType+bx], al

;-685     GAdr [GTop]=lineno-1; GUsed [GTop]=0;

 mov ax, [lineno]
 sub ax, 1
 mov bx, [GTop]
 shl bx, 1
 mov [GAdr+bx], ax
 mov ax, 0
 mov bx, [GTop]
 shl bx, 1
 mov [GUsed+bx], ax

;-686     pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;

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

;-687     expect(T_CONST); GTop++;  } 

 push 257
 call expect
 add  sp, 2
 inc  word[GTop]

;-688 }

@@dodefine401:

;-689 int stmt() { int c; char cha;

@@retn: LEAVE
 ret
; ENDP
dodefine_0 db "BSS",0
dodefine_1 db "LIST",0
dodefine_2 db "NOLIST",0
dodefine_3 db "ORGDATA",0
dodefine_4 db "ARCHIVE",0
dodefine_5 db "\n;Use archive file: ",0
dodefine_6 db "Name of archive file missing",0
dodefine_7 db "global table (define) full",0
dodefine_8 db "Define name longer 15 char",0

stmt:  ; *** PROC ***

;-690        if(istoken('{'))     {while(istoken('}')==0) stmt();}

;Function : stmt, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   689 NULL c = bp-2
;  201 var sign byte   689 NULL cha = bp-4;
 ENTER  4,0
 push 123
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt404
@@stmt405:
 push 125
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@stmt406
 call stmt
 jmp @@stmt405
@@stmt406:

;-691   else if(istoken(T_IF))    doif();

 jmp @@stmt407
@@stmt404:
 push 513
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt408
 call doif

;-692   else if(istoken(T_DO))    dodo();

 jmp @@stmt409
@@stmt408:
 push 516
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt410
 call dodo

;-693   else if(istoken(T_WHILE)) dowhile();

 jmp @@stmt411
@@stmt410:
 push 515
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt412
 call dowhile

;-694   else if(istoken(T_GOTO))  {prs("\n jmp @@");name1();prs(symbol);expect(';');}

 jmp @@stmt413
@@stmt412:
 push 521
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt414
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

;-695   else if(token==T_ASM)     {prs("\n"); c=next();

 jmp @@stmt415
@@stmt414:
 mov ax, [token]
 cmp ax, 518
 jne @@stmt416
 push stmt_1
 call prs
 add  sp, 2
 call next
 mov [bp-2], ax

;-696     while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }

@@stmt417:
 mov ax, [bp-2]
 cmp ax, 10
 je  @@stmt418
 push word [bp-2]
 call prc
 add  sp, 2
 call next
 mov [bp-2], ax
 jmp @@stmt417
@@stmt418:
 call getlex
 mov word [token], ax

;-697   else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  

 jmp @@stmt419
@@stmt416:
 push 519
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt420
 mov ax, [token]
 cmp ax, 123
 jne @@stmt421
 push stmt_2
 call prs
 add  sp, 2
 call next
 mov [bp-4], al

;-698     while(cha!= '}') { prc(cha); cha=next(); }

@@stmt422:
 mov al, [bp-4]
 cmp al, 125
 je  @@stmt423
 mov al, byte [bp-4]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 call next
 mov [bp-4], al

;-699     token=getlex(); }

 jmp @@stmt422
@@stmt423:
 call getlex
 mov word [token], ax

;-700     else error1("Curly open expected"); }

 jmp @@stmt424
@@stmt421:
 push stmt_3
 call error1
 add  sp, 2
@@stmt424:

;-701   else if(istoken(T_INTH))  {prs("\n int  "); expect(T_CONST);

 jmp @@stmt425
@@stmt420:
 push 600
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt426
 push stmt_4
 call prs
 add  sp, 2
 push 257
 call expect
 add  sp, 2

;-702     prunsign1(lexval); expect(';');    }

 push word [lexval]
 call prunsign1
 add  sp, 2
 push 59
 call expect
 add  sp, 2

;-703   else if(istoken(T_IFCARRY))doifcarry();

 jmp @@stmt427
@@stmt426:
 push 601
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt428
 call doifcarry

;-704   else if(istoken(T_IFZERO))doifzero();

 jmp @@stmt429
@@stmt428:
 push 602
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt430
 call doifzero

;-705   else if(istoken(T_EMIT))   doemit();

 jmp @@stmt431
@@stmt430:
 push 520
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt432
 call doemit

;-706   else if(istoken(';'))      { }

 jmp @@stmt433
@@stmt432:
 push 59
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt434

;-707   else if(istoken(T_RETURN)) {if (token!=';') exprstart();

 jmp @@stmt435
@@stmt434:
 push 512
 call istoken
 add  sp, 2
 or  al, al
 je @@stmt436
 mov ax, [token]
 cmp ax, 59
 je  @@stmt437
 call exprstart

;-708     prs("\n jmp @@retn"); nreturn++; expect(';');}

@@stmt437:
 push stmt_5
 call prs
 add  sp, 2
 inc  word[nreturn]
 push 59
 call expect
 add  sp, 2

;-709   else if(thechar==':')      {prs("\n@@"); // Label

 jmp @@stmt438
@@stmt436:
 mov al, [thechar]
 cmp al, 58
 jne @@stmt439
 push stmt_6
 call prs
 add  sp, 2

;-710      prs(symbol); prc(':');  expect(T_NAME); expect(':'); }

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

;-711   else                       {exprstart(); expect(';'); } }

 jmp @@stmt440
@@stmt439:
 call exprstart
 push 59
 call expect
 add  sp, 2
@@stmt440:
@@stmt438:
@@stmt435:
@@stmt433:
@@stmt431:
@@stmt429:
@@stmt427:
@@stmt425:
@@stmt419:
@@stmt415:
@@stmt413:
@@stmt411:
@@stmt409:
@@stmt407:

;-712 


;-713 int doemit() {prs("\n db ");
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

;-714   L1: token=getlex(); prunsign1(lexval); token=getlex();

@@L1:
 call getlex
 mov word [token], ax
 push word [lexval]
 call prunsign1
 add  sp, 2
 call getlex
 mov word [token], ax

;-715     if (token== ',') {prc(','); goto L1;} expect(')'); }

 mov ax, [token]
 cmp ax, 44
 jne @@doemit441
 push 44
 call prc
 add  sp, 2
 jmp @@L1
@@doemit441:
 push 41
 call expect
 add  sp, 2

;-716 


;-717 int cmpneg(int ids) {

 ret
; ENDP
doemit_0 db "\n db ",0

cmpneg:  ; *** PROC ***

;-718        if(iscmp==T_EQ) prs("\n jne @@");         //ZF=0

;Function : cmpneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   717 NULL ids = bp+4;
 ENTER  0,0
 mov ax, [iscmp]
 cmp ax, 806
 jne @@cmpneg442
 push cmpneg_0
 call prs
 add  sp, 2

;-719   else if(iscmp==T_NE) prs("\n je  @@");         //ZF=1

 jmp @@cmpneg443
@@cmpneg442:
 mov ax, [iscmp]
 cmp ax, 807
 jne @@cmpneg444
 push cmpneg_1
 call prs
 add  sp, 2

;-720   else if(iscmp==T_LE) if (ids) prs("\n jg  @@");//ZF=0      SF =OF

 jmp @@cmpneg445
@@cmpneg444:
 mov ax, [iscmp]
 cmp ax, 824
 jne @@cmpneg446
 mov ax, [bp+4]
 or  al, al
 je @@cmpneg447
 push cmpneg_2
 call prs
 add  sp, 2

;-721                            else prs("\n ja  @@");//ZF=0 CF=0

 jmp @@cmpneg448
@@cmpneg447:
 push cmpneg_3
 call prs
 add  sp, 2

;-722   else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);

@@cmpneg448:
 jmp @@cmpneg449
@@cmpneg446:
 mov ax, [iscmp]
 cmp ax, 811
 jne @@cmpneg450
 mov ax, [bp+4]
 or  al, al
 je @@cmpneg451
 push cmpneg_4
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-723                                prs("\n jl  @@");}//          SF!=OF

 push cmpneg_5
 call prs
 add  sp, 2

;-724                            else{prs(" ;unsigned : "); prunsign1(ids);

 jmp @@cmpneg452
@@cmpneg451:
 push cmpneg_6
 call prs
 add  sp, 2
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-725                                prs("\n jb  @@");}//jb=jc=CF=1

 push cmpneg_7
 call prs
 add  sp, 2

;-726   else if(iscmp=='<' ) prs("\n jge @@");         //          SF =OF

@@cmpneg452:
 jmp @@cmpneg453
@@cmpneg450:
 mov ax, [iscmp]
 cmp ax, 60
 jne @@cmpneg454
 push cmpneg_8
 call prs
 add  sp, 2

;-727   else if(iscmp=='>' ) prs("\n jle @@");         //ZF=1 oder SF!=OF

 jmp @@cmpneg455
@@cmpneg454:
 mov ax, [iscmp]
 cmp ax, 62
 jne @@cmpneg456
 push cmpneg_9
 call prs
 add  sp, 2

;-728   else error1("Vergleich unbekannt in CMPNEG()");  }

 jmp @@cmpneg457
@@cmpneg456:
 push cmpneg_10
 call error1
 add  sp, 2
@@cmpneg457:
@@cmpneg455:
@@cmpneg453:
@@cmpneg449:
@@cmpneg445:
@@cmpneg443:

;-729 


;-730 int prlabel(int n) {prs("\n@@"); prs(fname); pint1(n); prc(':'); }
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
;  200 var sign word   730 NULL n = bp+4;
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

;-731 int prjump (int n) {prs("\n jmp @@"); prs(fname); pint1(n); }
 LEAVE
 ret
; ENDP
prlabel_0 db "\n@@",0

prjump:  ; *** PROC ***
;Function : prjump, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   731 NULL n = bp+4;
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

;-732 int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP
prjump_0 db "\n jmp @@",0

doif:  ; *** PROC ***
;Function : doif, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   732 NULL jdest = bp-2
;  201 var sign word   732 NULL tst = bp-4;
 ENTER  4,0
 call pexpr
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-733   pint1(jdest); stmt();

 push word [bp-2]
 call pint1
 add  sp, 2
 call stmt

;-734   if (istoken(T_ELSE)) { nlabel++; tst=nlabel;

 push 514
 call istoken
 add  sp, 2
 or  al, al
 je @@doif458
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-4], ax

;-735     prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }

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

;-736   else prlabel(jdest); }

 jmp @@doif459
@@doif458:
 push word [bp-2]
 call prlabel
 add  sp, 2
@@doif459:

;-737 int doifcarry() {int jdest;  nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

doifcarry:  ; *** PROC ***
;Function : doifcarry, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   737 NULL jdest = bp-2;
 ENTER  2,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-738   prs("\n jae short @@");/*jnc*/ prs(fname);  pint1(jdest);

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

;-739   stmt(); prlabel(jdest); }

 call stmt
 push word [bp-2]
 call prlabel
 add  sp, 2

;-740 int doifzero() {int jdest;  nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP
doifcarry_0 db "\n jae short @@",0

doifzero:  ; *** PROC ***
;Function : doifzero, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   740 NULL jdest = bp-2;
 ENTER  2,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-741   prs("\n jne short @@");        prs(fname);  pint1(jdest);

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

;-742   stmt(); prlabel(jdest); }

 call stmt
 push word [bp-2]
 call prlabel
 add  sp, 2

;-743 int dodo() {int jdest; int jtemp;
 LEAVE
 ret
; ENDP
doifzero_0 db "\n jne short @@",0

dodo:  ; *** PROC ***

;-744   nlabel++; jdest=nlabel; prlabel(jdest); stmt();

;Function : dodo, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   743 NULL jdest = bp-2
;  201 var sign word   743 NULL jtemp = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax
 push word [bp-2]
 call prlabel
 add  sp, 2
 call stmt

;-745   expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);

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

;-746   prjump(jdest); prlabel(jtemp); }

 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-747 int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
 LEAVE
 ret
; ENDP

dowhile:  ; *** PROC ***
;Function : dowhile, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   747 NULL jdest = bp-2
;  201 var sign word   747 NULL tst = bp-4;
 ENTER  4,0
 inc  word[nlabel]
 mov ax, [nlabel]
 mov [bp-2], ax

;-748   prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);

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

;-749   stmt(); prjump(jdest); prlabel(tst); }

 call stmt
 push word [bp-2]
 call prjump
 add  sp, 2
 push word [bp-4]
 call prlabel
 add  sp, 2

;-750 int isrelational() {
 LEAVE
 ret
; ENDP

isrelational:  ; *** PROC ***

;-751   if (token==T_EQ) goto w; if (token==T_NE) goto w;

 mov ax, [token]
 cmp ax, 806
 jne @@isrelational460
 jmp @@w
@@isrelational460:
 mov ax, [token]
 cmp ax, 807
 jne @@isrelational461
 jmp @@w

;-752   if (token==T_LE) goto w; if (token==T_GE) goto w;

@@isrelational461:
 mov ax, [token]
 cmp ax, 824
 jne @@isrelational462
 jmp @@w
@@isrelational462:
 mov ax, [token]
 cmp ax, 811
 jne @@isrelational463
 jmp @@w

;-753   if (token=='<' ) goto w; if (token=='>' ) goto w;

@@isrelational463:
 mov ax, [token]
 cmp ax, 60
 jne @@isrelational464
 jmp @@w
@@isrelational464:
 mov ax, [token]
 cmp ax, 62
 jne @@isrelational465
 jmp @@w

;-754   return 0;  w: iscmp=token; token=getlex(); return 1;}

@@isrelational465:
 mov ax, 0
 jmp @@retn
@@w:
 mov ax, [token]
 mov word [iscmp], ax
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp @@retn

;-755  


;-756 char symboltemp[80];    

@@retn:
 ret
; ENDP
section .bss
absolute 53468
symboltemp resb 80
section .text

;-757 int getlex() { char c; char *p; 


getlex:  ; *** PROC ***

;-758 g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;

;Function : getlex, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   757 NULL c = bp-2
;  201 ptr sign byte   757 NULL p = bp-4;
 ENTER  4,0
@@g1:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne @@getlex466
 mov ax, 0
 jmp @@retn
@@getlex466:
 mov al, [bp-2]
 cmp al, 32
 jg  @@getlex467
 jmp @@g1

;-759   if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}

@@getlex467:
 mov al, [bp-2]
 cmp al, 61
 jne @@getlex468
 mov al, [thechar]
 cmp al, 61
 jne @@getlex469
 call next
 mov ax, 806
 jmp @@retn
@@getlex469:

;-760   if (c=='!') {if(thechar=='=') {next(); return T_NE; }}

@@getlex468:
 mov al, [bp-2]
 cmp al, 33
 jne @@getlex470
 mov al, [thechar]
 cmp al, 61
 jne @@getlex471
 call next
 mov ax, 807
 jmp @@retn
@@getlex471:

;-761   if (c=='<') {if(thechar=='=') {next(); return T_LE; }}

@@getlex470:
 mov al, [bp-2]
 cmp al, 60
 jne @@getlex472
 mov al, [thechar]
 cmp al, 61
 jne @@getlex473
 call next
 mov ax, 824
 jmp @@retn
@@getlex473:

;-762   if (c=='>') {if(thechar=='=') {next(); return T_GE; }}

@@getlex472:
 mov al, [bp-2]
 cmp al, 62
 jne @@getlex474
 mov al, [thechar]
 cmp al, 61
 jne @@getlex475
 call next
 mov ax, 811
 jmp @@retn
@@getlex475:

;-763   if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}

@@getlex474:
 mov al, [bp-2]
 cmp al, 60
 jne @@getlex476
 mov al, [thechar]
 cmp al, 60
 jne @@getlex477
 call next
 mov ax, 1240
 jmp @@retn
@@getlex477:

;-764   if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}

@@getlex476:
 mov al, [bp-2]
 cmp al, 62
 jne @@getlex478
 mov al, [thechar]
 cmp al, 62
 jne @@getlex479
 call next
 mov ax, 1241
 jmp @@retn
@@getlex479:

;-765   if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}

@@getlex478:
 mov al, [bp-2]
 cmp al, 43
 jne @@getlex480
 mov al, [thechar]
 cmp al, 43
 jne @@getlex481
 call next
 mov ax, 1219
 jmp @@retn
@@getlex481:

;-766   if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}

@@getlex480:
 mov al, [bp-2]
 cmp al, 45
 jne @@getlex482
 mov al, [thechar]
 cmp al, 45
 jne @@getlex483
 call next
 mov ax, 1225
 jmp @@retn
@@getlex483:

;-767   if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}

@@getlex482:
 mov al, [bp-2]
 cmp al, 43
 jne @@getlex484
 mov al, [thechar]
 cmp al, 61
 jne @@getlex485
 call next
 mov ax, 1230
 jmp @@retn
@@getlex485:

;-768   if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}

@@getlex484:
 mov al, [bp-2]
 cmp al, 45
 jne @@getlex486
 mov al, [thechar]
 cmp al, 61
 jne @@getlex487
 call next
 mov ax, 1231
 jmp @@retn
@@getlex487:

;-769   if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}

@@getlex486:
 mov al, [bp-2]
 cmp al, 38
 jne @@getlex488
 mov al, [thechar]
 cmp al, 61
 jne @@getlex489
 call next
 mov ax, 1234
 jmp @@retn
@@getlex489:

;-770   if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    

@@getlex488:
 mov al, [bp-2]
 cmp al, 124
 jne @@getlex490
 mov al, [thechar]
 cmp al, 61
 jne @@getlex491
 call next
 mov ax, 1235
 jmp @@retn
@@getlex491:

;-771   if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}

@@getlex490:
 mov al, [bp-2]
 cmp al, 42
 jne @@getlex492
 mov al, [thechar]
 cmp al, 61
 jne @@getlex493
 call next
 mov ax, 1232
 jmp @@retn
@@getlex493:

;-772   if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        

@@getlex492:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex494
 mov al, [thechar]
 cmp al, 61
 jne @@getlex495
 call next
 mov ax, 1233
 jmp @@retn
@@getlex495:

;-773   if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;

@@getlex494:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 push getlex_0
 call instr1
 add  sp, 4
 or  al, al
 je @@getlex496
 mov al, [bp-2]
 jmp @@retn

;-774   if (c == '/') { if (thechar == '/') {

@@getlex496:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex497
 mov al, [thechar]
 cmp al, 47
 jne @@getlex498

;-775       do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }

@@getlex499:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 13
 je  @@getlex500
 jmp @@getlex499
@@getlex500:
 call getlex
 jmp @@retn
@@getlex498:

;-776   if (c == '/') { if (thechar == '*') {

@@getlex497:
 mov al, [bp-2]
 cmp al, 47
 jne @@getlex501
 mov al, [thechar]
 cmp al, 42
 jne @@getlex502

;-777       g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;

@@g2:
 call next
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 42
 je  @@getlex503
 jmp @@g2
@@getlex503:
 mov al, [thechar]
 cmp al, 47
 je  @@getlex504
 jmp @@g2

;-778       c=next(); return getlex(); } else  return '/'; }

@@getlex504:
 call next
 mov [bp-2], al
 call getlex
 jmp @@retn
 jmp @@getlex505
@@getlex502:
 mov ax, 47
 jmp @@retn
@@getlex505:

;-779   if (c == '"') {getstring(c); return T_STRING;}

@@getlex501:
 mov al, [bp-2]
 cmp al, 34
 jne @@getlex506
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getstring
 add  sp, 2
 mov ax, 258
 jmp @@retn

;-780   if (digit(c)) { getdigit(c); return T_CONST; }

@@getlex506:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@getlex507
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call getdigit
 add  sp, 2
 mov ax, 257
 jmp @@retn

;-781   if (c==39) { lexval=next();

@@getlex507:
 mov al, [bp-2]
 cmp al, 39
 jne @@getlex508
 call next
 mov word [lexval], ax

;-782     if (lexval==92) {lexval=next();

 mov ax, [lexval]
 cmp ax, 92
 jne @@getlex509
 call next
 mov word [lexval], ax

;-783       if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;

 mov ax, [lexval]
 cmp ax, 110
 jne @@getlex510
 mov ax, 10
 mov word [lexval], ax
@@getlex510:
 mov ax, [lexval]
 cmp ax, 116
 jne @@getlex511
 mov ax, 9
 mov word [lexval], ax

;-784       if (lexval=='0') lexval= 0; } next(); return T_CONST; }

@@getlex511:
 mov ax, [lexval]
 cmp ax, 48
 jne @@getlex512
 mov ax, 0
 mov word [lexval], ax
@@getlex512:
@@getlex509:
 call next
 mov ax, 257
 jmp @@retn

;-785   if (letter(c)) { 

@@getlex508:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getlex513

;-786     strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;

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

;-787     while(letter(thechar)) {c=next(); *p=c;  p++; } 

@@getlex514:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getlex515
 call next
 mov [bp-2], al
 mov al, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]

;-788       *p=0;

 jmp @@getlex514
@@getlex515:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-789     if (eqstr(symbol,"signed"  )) return T_SIGNED;

 push getlex_1
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex516
 mov ax, 531
 jmp @@retn

;-790     if (eqstr(symbol,"unsigned")) return T_UNSIGNED;

@@getlex516:
 push getlex_2
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex517
 mov ax, 532
 jmp @@retn

;-791     if (eqstr(symbol,"void"    )) return T_VOID;

@@getlex517:
 push getlex_3
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex518
 mov ax, 529
 jmp @@retn

;-792     if (eqstr(symbol,"int"     )) return T_INT;

@@getlex518:
 push getlex_4
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex519
 mov ax, 517
 jmp @@retn

;-793     if (eqstr(symbol,"short"   )) return T_SHORT;

@@getlex519:
 push getlex_5
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex520
 mov ax, 534
 jmp @@retn

;-794     if (eqstr(symbol,"long"    )) return T_LONG;

@@getlex520:
 push getlex_6
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex521
 mov ax, 533
 jmp @@retn

;-795     if (eqstr(symbol,"uint32"  )) return T_UINT32;

@@getlex521:
 push getlex_7
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex522
 mov ax, 545
 jmp @@retn

;-796     if (eqstr(symbol,"inth"    )) return T_INTH;

@@getlex522:
 push getlex_8
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex523
 mov ax, 600
 jmp @@retn

;-797     if (eqstr(symbol,"char"    )) return T_CHAR;

@@getlex523:
 push getlex_9
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex524
 mov ax, 530
 jmp @@retn

;-798     if (eqstr(symbol,"asm"     )) return T_ASM;

@@getlex524:
 push getlex_10
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex525
 mov ax, 518
 jmp @@retn

;-799     if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;

@@getlex525:
 push getlex_11
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex526
 mov ax, 519
 jmp @@retn

;-800     if (eqstr(symbol,"__emit__")) return T_EMIT;

@@getlex526:
 push getlex_12
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex527
 mov ax, 520
 jmp @@retn

;-801     if (eqstr(symbol,"return"  )) return T_RETURN;

@@getlex527:
 push getlex_13
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex528
 mov ax, 512
 jmp @@retn

;-802     if (eqstr(symbol,"if"      )) return T_IF;

@@getlex528:
 push getlex_14
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex529
 mov ax, 513
 jmp @@retn

;-803     if (eqstr(symbol,"ifcarry" )) return T_IFCARRY;

@@getlex529:
 push getlex_15
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex530
 mov ax, 601
 jmp @@retn

;-804     if (eqstr(symbol,"ifzero"  )) return T_IFZERO;

@@getlex530:
 push getlex_16
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex531
 mov ax, 602
 jmp @@retn

;-805     if (eqstr(symbol,"else"    )) return T_ELSE;

@@getlex531:
 push getlex_17
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex532
 mov ax, 514
 jmp @@retn

;-806     if (eqstr(symbol,"while"   )) return T_WHILE;

@@getlex532:
 push getlex_18
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex533
 mov ax, 515
 jmp @@retn

;-807     if (eqstr(symbol,"do"      )) return T_DO;

@@getlex533:
 push getlex_19
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex534
 mov ax, 516
 jmp @@retn

;-808     if (eqstr(symbol,"goto"    )) return T_GOTO;

@@getlex534:
 push getlex_20
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex535
 mov ax, 521
 jmp @@retn

;-809     if (eqstr(symbol,"define"  )) return T_DEFINE;   

@@getlex535:
 push getlex_21
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex536
 mov ax, 511
 jmp @@retn

;-810     if (eqstr(symbol,"include" )) return T_INCLUDE;   

@@getlex536:
 push getlex_22
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@getlex537
 mov ax, 510
 jmp @@retn

;-811     if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}

@@getlex537:
 call convertdefine
 or  al, al
 je @@getlex538
 lea  ax, [symboltemp]
 push ax
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 mov ax, 257
 jmp @@retn

;-812     return T_NAME; } error1("Input item not recognized"); }

@@getlex538:
 mov ax, 256
 jmp @@retn
@@getlex513:
 push getlex_23
 call error1
 add  sp, 2

;-813 


;-814 int convertdefine() { int i; int j;   i=0;

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
;  200 var sign word   814 NULL i = bp-2
;  201 var sign word   814 NULL j = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-2], ax

;-815   while (i < GTop) {

@@convertdefine539:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@convertdefine540

;-816    j=adrofname(i); 

 push word [bp-2]
 call adrofname
 add  sp, 2
 mov [bp-4], ax

;-817    if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];

 push word [bp-4]
 lea  ax, [symbol]
 push ax
 call eqstr
 add  sp, 4
 or  al, al
 je @@convertdefine541
 mov bx, [bp-2]
 mov al, [GType + bx]
 cmp al, 35
 jne @@convertdefine542
 mov bx, [bp-2]
 shl bx, 1
 mov ax, [GData + bx]
 mov word [lexval], ax

;-818    return T_CONST; } }

 mov ax, 257
 jmp @@retn
@@convertdefine542:

;-819    i++; } 

@@convertdefine541:
 inc  word[bp-2]

;-820    return 0; }

 jmp @@convertdefine539
@@convertdefine540:
 mov ax, 0
 jmp @@retn

;-821 int getdigit(char c) { int i;

@@retn: LEAVE
 ret
; ENDP

getdigit:  ; *** PROC ***

;-822     lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char

;Function : getdigit, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign byte   821 NULL c = bp+4
;  201 var sign word   821 NULL i = bp-2;
 ENTER  2,0
 mov ax, 0
 mov word [lexval], ax
 mov al, [bp+4]
 sub al, 48
 mov word [lexval], ax

;-823     if (thechar=='x') thechar='X'; if (thechar=='X') { next();

 mov al, [thechar]
 cmp al, 120
 jne @@getdigit543
 mov ax, 88
 mov byte [thechar], al
@@getdigit543:
 mov al, [thechar]
 cmp al, 88
 jne @@getdigit544
 call next

;-824       while(letter(thechar)) { c=next(); if(c>96) c=c-39;

@@getdigit545:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call letter
 add  sp, 2
 or  al, al
 je @@getdigit546
 call next
 mov [bp+4], al
 mov al, [bp+4]
 cmp al, 96
 jle @@getdigit547
 mov al, [bp+4]
 sub al, 39
 mov [bp+4], al

;-825 	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16

@@getdigit547:
 mov al, [bp+4]
 cmp al, 64
 jle @@getdigit548
 mov al, [bp+4]
 sub al, 7
 mov [bp+4], al
@@getdigit548:
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 shl ax, 4
 mov word [lexval], ax

;-826      i=0; i=c; lexval=lexval+i;}

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax

;-827     }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 

 jmp @@getdigit545
@@getdigit546:
 jmp @@getdigit549
@@getdigit544:
@@getdigit550:
 mov al, byte [thechar]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@getdigit551
 call next
 mov [bp+4], al
 mov al, [bp+4]
 sub al, 48
 mov [bp+4], al
 mov ax, [lexval]
 mov bx, 10
 mul bx
 mov word [lexval], ax

;-828      i=0; i=c; lexval=lexval+i; } } 

 mov ax, 0
 mov [bp-2], ax
 mov al, [bp+4]
 mov [bp-2], ax
 mov ax, [lexval]
 add ax, [bp-2]
 mov word [lexval], ax
 jmp @@getdigit550
@@getdigit551:

;-829 }

@@getdigit549:

;-830 int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
 LEAVE
 ret
; ENDP

getstring:  ; *** PROC ***
;Function : getstring, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   830 NULL delim = bp+4
;  201 var sign word   830 NULL c = bp-2
;  202 ptr sign byte   830 NULL p = bp-4;
 ENTER  4,0
 mov ax, symbol
 mov [bp-4], ax
 call next
 mov [bp-2], ax

;-831   while (c != delim) {*p=c; p++; c=next(); } *p=0; }

@@getstring552:
 mov ax, [bp-2]
 cmp ax, [bp+4]
 je  @@getstring553
 mov ax, [bp-2]
 mov  bx, [bp-4]
 mov  [bx], al
 inc  word[bp-4]
 call next
 mov [bp-2], ax
 jmp @@getstring552
@@getstring553:
 mov ax, 0
 mov  bx, [bp-4]
 mov  [bx], al

;-832 


;-833 int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
 LEAVE
 ret
; ENDP

next:  ; *** PROC ***
;Function : next, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   833 NULL r = bp-2;
 ENTER  2,0
 mov al, [thechar]
 mov [bp-2], al
 mov al, [bp-2]
 mov byte [globC], al
 call fgets1
 mov byte [thechar], al
 mov al, [bp-2]
 jmp @@retn

;-834 int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}

@@retn: LEAVE
 ret
; ENDP

istoken:  ; *** PROC ***
;Function : istoken, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   834 NULL t = bp+4;
 ENTER  0,0
 mov ax, [token]
 cmp ax, [bp+4]
 jne @@istoken554
 call getlex
 mov word [token], ax
 mov ax, 1
 jmp @@retn
@@istoken554:
 mov ax, 0
 jmp @@retn

;-835 int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();

@@retn: LEAVE
 ret
; ENDP

expect:  ; *** PROC ***
;Function : expect, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   835 NULL t = bp+4;
 ENTER  0,0
 push word [bp+4]
 call istoken
 add  sp, 2
 cmp ax, 0
 jne @@expect555
 mov ax, 0
 mov  bx, [cloc]
 mov  [bx], al
 lea  ax, [co]
 push ax
 call prs
 add  sp, 2
 call listproc

;-836   prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

 push expect_0
 call prs
 add  sp, 2
 push word [bp+4]
 call pint1
 add  sp, 2
 push expect_1
 call error1
 add  sp, 2
@@expect555:

;-837 


;-838 int eprc(char c)  {*cloc=c; cloc++; }
 LEAVE
 ret
; ENDP
expect_0 db "\nExpected ASCII(dez): ",0
expect_1 db " not found",0

eprc:  ; *** PROC ***
;Function : eprc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   838 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 mov  bx, [cloc]
 mov  [bx], al
 inc  word[cloc]

;-839 int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
 LEAVE
 ret
; ENDP

eprs:  ; *** PROC ***
;Function : eprs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   839 NULL s = bp+4
;  201 var sign byte   839 NULL c = bp-2;
 ENTER  2,0
@@eprs556:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eprs557
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
 jmp @@eprs556
@@eprs557:

;-840 int prc(unsigned char c) { if (LIST) { if (c==10) {_AX=13; writetty(); }
 LEAVE
 ret
; ENDP

prc:  ; *** PROC ***
;Function : prc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg byte   840 NULL c = bp+4;
 ENTER  0,0
 mov al, [LIST]
 or  al, al
 je @@prc558
 mov al, [bp+4]
 cmp al, 10
 jne @@prc559
 mov  ax, 13
 call writetty

;-841   _AL=c; writetty(); } fputcR(c, fdout); }

@@prc559:
 mov  al, [bp+4]
 call writetty
@@prc558:
 push word [fdout]
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call fputcR
 add  sp, 4

;-842 int prscomment(unsigned char *s) {unsigned char c;
 LEAVE
 ret
; ENDP

prscomment:  ; *** PROC ***

;-843   while(*s){c=*s;prc(c);s++;} }

;Function : prscomment, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   842 NULL s = bp+4
;  201 var unsg byte   842 NULL c = bp-2;
 ENTER  2,0
@@prscomment560:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@prscomment561
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
 jmp @@prscomment560
@@prscomment561:

;-844 int prnl() { prs("\n ");}
 LEAVE
 ret
; ENDP

prnl:  ; *** PROC ***
 push prnl_0
 call prs
 add  sp, 2

;-845 


;-846 int prs(unsigned char *s) {unsigned char c; int com; com=0;

 ret
; ENDP
prnl_0 db "\n ",0

prs:  ; *** PROC ***
;Function : prs, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr unsg byte   846 NULL s = bp+4
;  201 var unsg byte   846 NULL c = bp-2
;  202 var sign word   846 NULL com = bp-4;
 ENTER  4,0
 mov ax, 0
 mov [bp-4], ax

;-847   while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;

@@prs562:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@prs563
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 34
 jne @@prs564
 mov ax, [bp-4]
 or  al, al
 je @@prs565
 mov ax, 0
 mov [bp-4], ax
 jmp @@prs566
@@prs565:
 mov ax, 1
 mov [bp-4], ax

;-848     if (c==92) { if (com==0) { s++; c=*s;

@@prs566:
@@prs564:
 mov al, [bp-2]
 cmp al, 92
 jne @@prs567
 mov ax, [bp-4]
 cmp ax, 0
 jne @@prs568
 inc  word[bp+4]
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-849           if (c=='n') c=10; if (c=='t') c= 9;

 mov al, [bp-2]
 cmp al, 110
 jne @@prs569
 mov ax, 10
 mov [bp-2], al
@@prs569:
 mov al, [bp-2]
 cmp al, 116
 jne @@prs570
 mov ax, 9
 mov [bp-2], al

;-850     } } prc(c); s++;  } }

@@prs570:
@@prs568:
@@prs567:
 mov al, byte [bp-2]
 mov ah, 0
 push ax
 call prc
 add  sp, 2
 inc  word[bp+4]
 jmp @@prs562
@@prs563:

;-851 int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
 LEAVE
 ret
; ENDP

eprnum:  ; *** PROC ***
;Function : eprnum, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   851 NULL n = bp+4
;  201 var sign word   851 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@eprnum571
 push 45
 call eprc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-852   if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }

@@eprnum571:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@eprnum572
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call eprnum
 add  sp, 2
@@eprnum572:
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

;-853 int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
 LEAVE
 ret
; ENDP

pint1:  ; *** PROC ***
;Function : pint1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   853 NULL n = bp+4
;  201 var sign word   853 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@pint1573
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-854   if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n=n+'0'; prc(n); }

@@pint1573:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@pint1574
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint1
 add  sp, 2
@@pint1574:
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

;-855 int prunsign1(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP

prunsign1:  ; *** PROC ***

;-856   if ( _ n >= 10) {  e=n/10; /*DIV*/ prunsign1(e); }

;Function : prunsign1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var unsg word   855 NULL n = bp+4
;  201 var unsg word   855 NULL e = bp-2;
 ENTER  2,0 ; constant expression
cmp word[bp+4], 10 ;unsigned : 0
 jb  @@prunsign1575
 mov ax, [bp+4]
 mov bx, 10
 mov dx, 0
 div bx
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-857     n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }

@@prunsign1575:
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

;-858 int printint51(unsigned int j)  {
 LEAVE
 ret
; ENDP

printint51:  ; *** PROC ***

;-859   if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);

;Function : printint51, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   858 NULL j = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
 cmp ax, 10000
 jge @@printint51576
 push 32
 call prc
 add  sp, 2
@@printint51576:
 mov ax, [bp+4]
 cmp ax, 1000
 jge @@printint51577
 push 32
 call prc
 add  sp, 2
@@printint51577:
 mov ax, [bp+4]
 cmp ax, 100
 jge @@printint51578
 push 32
 call prc
 add  sp, 2

;-860    if (j<10) prc(32);  prunsign1(j); }

@@printint51578:
 mov ax, [bp+4]
 cmp ax, 10
 jge @@printint51579
 push 32
 call prc
 add  sp, 2
@@printint51579:
 push word [bp+4]
 call prunsign1
 add  sp, 2

;-861 


;-862 int fgets1() { char c; c=*fgetsp;
 LEAVE
 ret
; ENDP

fgets1:  ; *** PROC ***
;Function : fgets1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte   862 NULL c = bp-2;
 ENTER  2,0
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al

;-863   if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;

 mov al, [bp-2]
 cmp al, 0
 jne @@fgets1580
 call printinputline
 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne @@fgets1581
 mov ax, 0
 jmp @@retn

;-864     fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }

@@fgets1581:
 mov ax, fgetsdest
 mov word [fgetsp], ax
 mov bx, [fgetsp]
 mov al, [bx]
 mov ah, 0
 mov [bp-2], al
 mov ax, 0
 mov word [spalte], ax

;-865   fgetsp++; spalte++;  return c; }

@@fgets1580:
 inc  word[fgetsp]
 inc  word[spalte]
 mov al, [bp-2]
 jmp @@retn

;-866 int printinputline() { fgetsp=&fgetsdest;

@@retn: LEAVE
 ret
; ENDP

printinputline:  ; *** PROC ***
 mov ax, fgetsdest
 mov word [fgetsp], ax

;-867   do {DOS_NoBytes=readR(&DOS_ByteRead, fdin);

@@printinputline582:
 push word [fdin]
 lea  ax, [DOS_ByteRead]
 push ax
 call readR
 add  sp, 4
 mov word [DOS_NoBytes], ax

;-868   if (DOS_NoBytes == 0) return; 

 mov ax, [DOS_NoBytes]
 cmp ax, 0
 jne @@printinputline583
 jmp @@retn

;-869     *fgetsp=DOS_ByteRead; fgetsp++;} 

@@printinputline583:
 mov al, [DOS_ByteRead]
 mov  bx, [fgetsp]
 mov  [bx], al
 inc  word[fgetsp]

;-870   while (DOS_ByteRead != 10); *fgetsp=0;

 mov al, [DOS_ByteRead]
 cmp al, 10
 je  @@printinputline584
 jmp @@printinputline582
@@printinputline584:
 mov ax, 0
 mov  bx, [fgetsp]
 mov  [bx], al

;-871     if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;

 mov ax, [fdout]
 or  al, al
 je @@printinputline585
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

;-872       prscomment(&fgetsdest);}

 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-873 }

@@printinputline585:

;-874 int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }

@@retn:
 ret
; ENDP
printinputline_0 db "\n\n;-",0

end1:  ; *** PROC ***
;Function : end1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   874 NULL n = bp+4;
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

;-875 int error1(char *s) { LIST=1; //  *cloc=0; prs(co); listproc();
 LEAVE
 ret
; ENDP

error1:  ; *** PROC ***
;Function : error1, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   875 NULL s = bp+4;
 ENTER  0,0
 mov ax, 1
 mov byte [LIST], al

;-876   lineno--;

 dec  word[lineno]

;-877   prnl(); prscomment(&fgetsdest);

 call prnl
 lea  ax, [fgetsdest]
 push ax
 call prscomment
 add  sp, 2

;-878   prs(";Line: "); prunsign1(lineno);

 push error1_0
 call prs
 add  sp, 2
 push word [lineno]
 call prunsign1
 add  sp, 2

;-879   prs(" ************** ERROR: "); prs(s);

 push error1_1
 call prs
 add  sp, 2
 push word [bp+4]
 call prs
 add  sp, 2

;-880   prs("  in column: "); pint1(spalte);

 push error1_2
 call prs
 add  sp, 2
 push word [spalte]
 call pint1
 add  sp, 2

;-881   prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);

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

;-882   prs(", thechar: "); pint1(thechar); prs(", symbol: "); prs(symbol);

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

;-883   end1(1); }

 push 1
 call end1
 add  sp, 2

;-884 int listproc() {int i; 
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

;-885   if (LTop > LSTART) {

;Function : listproc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   884 NULL i = bp-2;
 ENTER  2,0
 mov ax, [LTop]
 cmp ax, 200
 jle @@listproc586

;-886   prs("\n;Function : "); prs(fname);

 push listproc_0
 call prs
 add  sp, 2
 lea  ax, [fname]
 push ax
 call prs
 add  sp, 2

;-887   prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);

 push listproc_1
 call prs
 add  sp, 2
 mov ax, [LTop]
 sub ax, 200
 mov [bp-2], ax
 push word [bp-2]
 call prunsign1
 add  sp, 2

;-888   prs("\n;   # type sign width addr used name   list of local variables");

 push listproc_2
 call prs
 add  sp, 2

;-889     i=LSTART; 

 mov ax, 200
 mov [bp-2], ax

;-890     while (i < LTop) { listvar(i); i++; } } 

@@listproc587:
 mov ax, [bp-2]
 cmp ax, [LTop]
 jge @@listproc588
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]
 jmp @@listproc587
@@listproc588:

;-891 }

@@listproc586:

;-892 int listvar(unsigned int i) {unsigned int j; char c;
 LEAVE
 ret
; ENDP
listproc_0 db "\n;Function : ",0
listproc_1 db ", Number of local variables: ",0
listproc_2 db "\n;   # type sign width addr used name   list of local variables",0

listvar:  ; *** PROC ***

;-893   prs("\n;"); printint51(i); prc(32);

;Function : listvar, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   892 NULL i = bp+4
;  201 var unsg word   892 NULL j = bp-2
;  202 var sign byte   892 NULL c = bp-4;
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

;-894   c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");

 mov bx, [bp+4]
 mov al, [GType + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 86
 jne @@listvar589
 push listvar_1
 call prs
 add  sp, 2
@@listvar589:
 mov al, [bp-4]
 cmp al, 42
 jne @@listvar590
 push listvar_2
 call prs
 add  sp, 2

;-895                if(c=='&')prs("arr ");   if(c=='#')prs("def ");

@@listvar590:
 mov al, [bp-4]
 cmp al, 38
 jne @@listvar591
 push listvar_3
 call prs
 add  sp, 2
@@listvar591:
 mov al, [bp-4]
 cmp al, 35
 jne @@listvar592
 push listvar_4
 call prs
 add  sp, 2

;-896   c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");

@@listvar592:
 mov bx, [bp+4]
 mov al, [GSign + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 83
 jne @@listvar593
 push listvar_5
 call prs
 add  sp, 2
@@listvar593:
 mov al, [bp-4]
 cmp al, 85
 jne @@listvar594
 push listvar_6
 call prs
 add  sp, 2

;-897   c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );

@@listvar594:
 mov bx, [bp+4]
 mov al, [GWidth + bx]
 mov [bp-4], al
 mov al, [bp-4]
 cmp al, 1
 jne @@listvar595
 push listvar_7
 call prs
 add  sp, 2
@@listvar595:
 mov al, [bp-4]
 cmp al, 2
 jne @@listvar596
 push listvar_8
 call prs
 add  sp, 2

;-898                if(c==  4)prs("dwrd " );

@@listvar596:
 mov al, [bp-4]
 cmp al, 4
 jne @@listvar597
 push listvar_9
 call prs
 add  sp, 2

;-899   j=GAdr[i]; printint51(j);

@@listvar597:
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GAdr + bx]
 mov [bp-2], ax
 push word [bp-2]
 call printint51
 add  sp, 2

;-900   j=GUsed[i]; if (j) printint51(j);

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GUsed + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je @@listvar598
 push word [bp-2]
 call printint51
 add  sp, 2

;-901   else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}

 jmp @@listvar599
@@listvar598:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne @@listvar600
 push listvar_10
 call prs
 add  sp, 2
 jmp @@listvar601
@@listvar600:
 push listvar_11
 call prs
 add  sp, 2
@@listvar601:

;-902   prc(32);  pt=adrofname(i); prs(pt);

@@listvar599:
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

;-903   if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }

 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 35
 jne @@listvar602
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

;-904   if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}

@@listvar602:
 mov bx, [bp+4]
 mov al, [GType + bx]
 cmp al, 38
 jne @@listvar603
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

;-905   if (i >= LSTART) { prs(" = bp"); j=GData[i];

@@listvar603:
 mov ax, [bp+4]
 cmp ax, 200 ;unsigned : 0
 jb  @@listvar604
 push listvar_12
 call prs
 add  sp, 2
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [GData + bx]
 mov [bp-2], ax

;-906     if (j > 0) prc('+'); pint1(j);  }

 mov ax, [bp-2]
 cmp ax, 0
 jle @@listvar605
 push 43
 call prc
 add  sp, 2
@@listvar605:
 push word [bp-2]
 call pint1
 add  sp, 2

;-907 }

@@listvar604:

;-908 int listcall() { int i;
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

;-909   prs("\n\n;    #  addr name   list of CALLs\n");

;Function : listcall, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   908 NULL i = bp-2;
 ENTER  2,0
 push listcall_0
 call prs
 add  sp, 2

;-910   i=0;  while (i< CTop) { calllisting(i); i++; } }

 mov ax, 0
 mov [bp-2], ax
@@listcall606:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@listcall607
 push word [bp-2]
 call calllisting
 add  sp, 2
 inc  word[bp-2]
 jmp @@listcall606
@@listcall607:

;-911 int calllisting(int i) {char c; int j;
 LEAVE
 ret
; ENDP
listcall_0 db "\n\n;    #  addr name   list of CALLs\n",0

calllisting:  ; *** PROC ***

;-912   prs("\n;"); printint51(i); prc(32);

;Function : calllisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   911 NULL i = bp+4
;  201 var sign byte   911 NULL c = bp-2
;  202 var sign word   911 NULL j = bp-4;
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

;-913   c=CType [i]; if(c==0)prs("unresolved ");

 mov bx, [bp+4]
 mov al, [CType + bx]
 mov [bp-2], al
 mov al, [bp-2]
 cmp al, 0
 jne @@calllisting608
 push calllisting_1
 call prs
 add  sp, 2

;-914   j=CAdr[i];            printint51(j); prc(32);

@@calllisting608:
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

;-915   from_far(NameA, j);   prs(NameA);

 push word [bp-4]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4
 lea  ax, [NameA]
 push ax
 call prs
 add  sp, 2

;-916 }


;-917 int countcalls(int f) { unsigned int i;
 LEAVE
 ret
; ENDP
calllisting_0 db "\n;",0
calllisting_1 db "unresolved ",0

countcalls:  ; *** PROC ***

;-918   pt=adrF(FNameField, f);

;Function : countcalls, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word   917 NULL f = bp+4
;  201 var unsg word   917 NULL i = bp-2;
 ENTER  2,0
 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax

;-919   i=0;  while (i < CTop) {

 mov ax, 0
 mov [bp-2], ax
@@countcalls609:
 mov ax, [bp-2]
 cmp ax, [CTop]
 jge @@countcalls610

;-920     p1=CAdr[i];

 mov bx, [bp-2]
 shl bx, 1
 mov ax, [CAdr + bx]
 mov word [p1], ax

;-921     from_far(NameA, p1);

 push word [p1]
 lea  ax, [NameA]
 push ax
 call from_far
 add  sp, 4

;-922     if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;

 lea  ax, [NameA]
 push ax
 push word [pt]
 call eqstr
 add  sp, 4
 or  al, al
 je @@countcalls611
 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 add ax, 1
 mov bx, [bp+4]
 shl bx, 1
 mov [FCalls+bx], ax

;-923     i++; }

@@countcalls611:
 inc  word[bp-2]

;-924 }

 jmp @@countcalls609
@@countcalls610:

;-925 int listfunc() { int i;
 LEAVE
 ret
; ENDP

listfunc:  ; *** PROC ***

;-926   prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");

;Function : listfunc, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word   925 NULL i = bp-2;
 ENTER  2,0
 push listfunc_0
 call prs
 add  sp, 2

;-927   i=0;  while (i < FTop) { countcalls (i); i++; } 

 mov ax, 0
 mov [bp-2], ax
@@listfunc612:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@listfunc613
 push word [bp-2]
 call countcalls
 add  sp, 2
 inc  word[bp-2]

;-928   i=0;  while (i < FTop) { funclisting(i); i++; } }

 jmp @@listfunc612
@@listfunc613:
 mov ax, 0
 mov [bp-2], ax
@@listfunc614:
 mov ax, [bp-2]
 cmp ax, [FTop]
 jge @@listfunc615
 push word [bp-2]
 call funclisting
 add  sp, 2
 inc  word[bp-2]
 jmp @@listfunc614
@@listfunc615:

;-929 int funclisting(int i) {int j;  char c;
 LEAVE
 ret
; ENDP
listfunc_0 db "\n\n\n;   # Calls Line Width  Name   list of functions\n",0

funclisting:  ; *** PROC ***

;-930   prs("\n;");    printint51(i);

;Function : funclisting, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var sign word   929 NULL i = bp+4
;  201 var sign word   929 NULL j = bp-2
;  202 var sign byte   929 NULL c = bp-4;
 ENTER  4,0
 push funclisting_0
 call prs
 add  sp, 2
 push word [bp+4]
 call printint51
 add  sp, 2

;-931   j = FCalls[i]; if (j) printint51(j); else prs(" NULL");

 mov bx, [bp+4]
 shl bx, 1
 mov ax, [FCalls + bx]
 mov [bp-2], ax
 mov ax, [bp-2]
 or  al, al
 je @@funclisting616
 push word [bp-2]
 call printint51
 add  sp, 2
 jmp @@funclisting617
@@funclisting616:
 push funclisting_1
 call prs
 add  sp, 2

;-932   j = FAdr[i];   printint51(j); prc(32);

@@funclisting617:
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

;-933   c=FType[i];

 mov bx, [bp+4]
 mov al, [FType + bx]
 mov [bp-4], al

;-934   if(c=='V')prs("void " );    if(c=='B')prs("byte " );

 mov al, [bp-4]
 cmp al, 86
 jne @@funclisting618
 push funclisting_2
 call prs
 add  sp, 2
@@funclisting618:
 mov al, [bp-4]
 cmp al, 66
 jne @@funclisting619
 push funclisting_3
 call prs
 add  sp, 2

;-935   if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );

@@funclisting619:
 mov al, [bp-4]
 cmp al, 87
 jne @@funclisting620
 push funclisting_4
 call prs
 add  sp, 2
@@funclisting620:
 mov al, [bp-4]
 cmp al, 68
 jne @@funclisting621
 push funclisting_5
 call prs
 add  sp, 2

;-936   prc(32); prc(32);

@@funclisting621:
 push 32
 call prc
 add  sp, 2
 push 32
 call prc
 add  sp, 2

;-937   pt=adrF(FNameField, i); prs(pt);

 push word [bp+4]
 lea  ax, [FNameField]
 push ax
 call adrF
 add  sp, 4
 mov word [pt], ax
 push word [pt]
 call prs
 add  sp, 2

;-938 }


;-939 unsigned int MAXUI=65535;
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

;-940 int epilog() {unsigned int i; 


epilog:  ; *** PROC ***

;-941   strcpy(symbol, "LastFunctionByt");  storefunc();

;Function : epilog, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   940 NULL i = bp-2;
 ENTER  2,0
 push epilog_0
 lea  ax, [symbol]
 push ax
 call strcpy
 add  sp, 4
 call storefunc

;-942   prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");

 push epilog_1
 call prs
 add  sp, 2

;-943   prs("\n \n;   # type sign width  adr used name   list of global variables\n");

 push epilog_2
 call prs
 add  sp, 2

;-944   i=1;

 mov ax, 1
 mov [bp-2], ax

;-945   while (i< GTop) { listvar(i); i++; }

@@epilog622:
 mov ax, [bp-2]
 cmp ax, [GTop]
 jge @@epilog623
 push word [bp-2]
 call listvar
 add  sp, 2
 inc  word[bp-2]

;-946   listfunc();   listcall();

 jmp @@epilog622
@@epilog623:
 call listfunc
 call listcall

;-947   LIST=1;

 mov ax, 1
 mov byte [LIST], al

;-948   prs("\n;Input: "); prs(&namein);

 push epilog_3
 call prs
 add  sp, 2
 lea  ax, [namein]
 push ax
 call prs
 add  sp, 2

;-949   prs(", List: ");   prs(&namelst);

 push epilog_4
 call prs
 add  sp, 2
 lea  ax, [namelst]
 push ax
 call prs
 add  sp, 2

;-950   prs(",  Lines:"); printint51(lineno);

 push epilog_5
 call prs
 add  sp, 2
 push word [lineno]
 call printint51
 add  sp, 2

;-951   prs("\n;Glob. variables:"); GTop--; printint51(GTop);

 push epilog_6
 call prs
 add  sp, 2
 dec  word[GTop]
 push word [GTop]
 call printint51
 add  sp, 2

;-952   prs(" max.:"); printint51(LSTART);

 push epilog_7
 call prs
 add  sp, 2
 push 200
 call printint51
 add  sp, 2

;-953   prs("\n;Functions      :"); printint51(FTop);

 push epilog_8
 call prs
 add  sp, 2
 push word [FTop]
 call printint51
 add  sp, 2

;-954   prs(" max.:"); printint51(FUNCMAX);

 push epilog_9
 call prs
 add  sp, 2
 push 300
 call printint51
 add  sp, 2

;-955   prs("\n;Calls          :"); printint51(CTop);

 push epilog_10
 call prs
 add  sp, 2
 push word [CTop]
 call printint51
 add  sp, 2

;-956   prs(" max.:"); printint51(CALLMAX);

 push epilog_11
 call prs
 add  sp, 2
 push 2000
 call printint51
 add  sp, 2

;-957   prs(", NameField:"); printint51(CNameTop);

 push epilog_12
 call prs
 add  sp, 2
 push word [CNameTop]
 call printint51
 add  sp, 2

;-958   prs(" max.:"); printint51(65535);

 push epilog_13
 call prs
 add  sp, 2
 push -1
 call printint51
 add  sp, 2

;-959 //  prs(", segE:"); printint51(segE);


;-960   __asm{call LastFunctionByt}  _ i=ax;

call LastFunctionByt
mov [bp-2], ax

;-961   prs("\n;Code until     :"); printint51(i);

 push epilog_14
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-962   prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");

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

;-963   printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  @@epilog624
 push epilog_17
 call prs
 add  sp, 2

;-964   prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;

@@epilog624:
 push epilog_18
 call prs
 add  sp, 2
 push word [orgData]
 call prunsign1
 add  sp, 2
 mov ax, [MAXUI]
 sub ax, [orgData]
 mov [bp-2], ax

;-965   prs(", resting stacksize: ");printint51(i);

 push epilog_19
 call prs
 add  sp, 2
 push word [bp-2]
 call printint51
 add  sp, 2

;-966   if (i <= 5000) prs(" *** Warning *** Stack too small");

 mov ax, [bp-2]
 cmp ax, 5000
 ja  @@epilog625
 push epilog_20
 call prs
 add  sp, 2

;-967   prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);

@@epilog625:
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

;-968   prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");

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

;-969   printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");

 push word [bp-2]
 call printint51
 add  sp, 2
 mov ax, [bp-2]
 cmp ax, 1000
 ja  @@epilog626
 push epilog_25
 call prs
 add  sp, 2

;-970   if(NASM==0)prs("\nEND");end1(0);}

@@epilog626:
 mov al, [NASM]
 cmp al, 0
 jne @@epilog627
 push epilog_26
 call prs
 add  sp, 2
@@epilog627:
 push 0
 call end1
 add  sp, 2

;-971 // while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}


;-972 int setblock(unsigned int i) {
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

;-973   DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }

;Function : setblock, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var unsg word   972 NULL i = bp+4;
 ENTER  0,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, cs
 mov  es, ax
 mov  ax, 18944
 call DosInt

;-974 int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
 LEAVE
 ret
; ENDP

allocmem:  ; *** PROC ***

;-975   DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;

;Function : allocmem, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 var unsg word   974 NULL i = bp+4
;  201 var unsg word   974 NULL vAX = bp-2
;  202 var unsg word   974 NULL vBX = bp-4;
 ENTER  4,0
 mov ax, 0
 mov word [DOS_ERR], ax
 mov  bx, [bp+4]
 mov  ax, 18432
 call DosInt
mov [bp-2], ax
mov [bp-4], bx

;-976   if(DOS_ERR) return vBX;   return vAX;

 mov ax, [DOS_ERR]
 or  al, al
 je @@allocmem628
 mov ax, [bp-4]
 jmp @@retn
@@allocmem628:
 mov ax, [bp-2]
 jmp @@retn

;-977 }


;-978 int copyF(char *dest, char *src, unsigned int sz) {

@@retn: LEAVE
 ret
; ENDP

copyF:  ; *** PROC ***

;-979   segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di

;Function : copyF, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   978 NULL dest = bp+4
;  201 ptr sign byte   978 NULL src = bp+6
;  202 var unsg word   978 NULL sz = bp+8;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]
 mov  cx, [bp+8]

;-980   asm cld

 cld

;-981   asm rep movsb

 rep movsb

;-982   asm mov byte [es:di], 0

 mov byte [es:di], 0

;-983 }


;-984 int to_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

to_far:  ; *** PROC ***

;-985   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : to_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   984 NULL dest = bp+4
;  201 ptr sign byte   984 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-986   asm cld

 cld

;-987   do{

@@to_far629:

;-988   asm lodsb  ; inc si

 lodsb  ; inc si

;-989   asm stosb  ; inc di

 stosb  ; inc di

;-990   } while (al != 0);

 cmp  al, 0
 je  @@to_far630
 jmp @@to_far629
@@to_far630:

;-991 }


;-992 int from_far(char *dest, char *src) {
 LEAVE
 ret
; ENDP

from_far:  ; *** PROC ***

;-993   segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di

;Function : from_far, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte   992 NULL dest = bp+4
;  201 ptr sign byte   992 NULL src = bp+6;
 ENTER  0,0
 mov ax, [segE]
 mov  es, ax
 mov  si, [bp+6]
 mov  di, [bp+4]

;-994   do{

@@from_far631:

;-995   asm mov al, [es:si]

 mov al, [es:si]

;-996   asm inc si

 inc si

;-997   asm mov [di], al

 mov [di], al

;-998   asm inc di

 inc di

;-999   } while (al != 0);

 cmp  al, 0
 je  @@from_far632
 jmp @@from_far631
@@from_far632:

;-1000 }
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
; eqstr
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
; Number of unresolved CALLs :  160
;use archive file: AR.C

;-1001 // AR.C Archive

;Number of CALLs:    2 : writetty

writetty:  ; *** PROC ***
 mov  ah, 14
 mov  bx, 0
 int  16

;-1002 int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }

 ret
; ENDP
;Number of CALLs:    1 : putch

putch:  ; *** PROC ***
;Function : putch, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1002 NULL c = bp+4;
 ENTER  0,0 ; constant expression
cmp byte[bp+4], 10
 jne @@putch633
 mov  al, 13
 call writetty
@@putch633:
 mov  al, [bp+4]
 call writetty

;-1003 int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
 LEAVE
 ret
; ENDP
;Number of CALLs:   12 : cputs

cputs:  ; *** PROC ***
;Function : cputs, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1003 NULL s = bp+4
;  201 var sign byte  1003 NULL c = bp-2;
 ENTER  2,0
@@cputs634:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@cputs635
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
 jmp @@cputs634
@@cputs635:

;-1004 int mkneg(int n) { n; __asm {neg ax} }
 LEAVE
 ret
; ENDP
;Number of CALLs:    3 : mkneg

mkneg:  ; *** PROC ***
;Function : mkneg, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1004 NULL n = bp+4;
 ENTER  0,0
 mov ax, [bp+4]
neg ax

;-1005 int prunsign(unsigned int n) { unsigned int e;
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : pint

pint:  ; *** PROC ***
;Function : pint, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 var sign word  1005 NULL n = bp+4
;  201 var sign word  1005 NULL e = bp-2;
 ENTER  2,0
 mov ax, [bp+4]
 cmp ax, 0
 jge @@pint636
 push 45
 call prc
 add  sp, 2
 push word [bp+4]
 call mkneg
 add  sp, 2
 mov [bp+4], ax

;-1006   if (n >= 10) {e=n/10;  pint(e);}  n=n%10; n=n+'0'; putch(n); }

@@pint636:
 mov ax, [bp+4]
 cmp ax, 10 ;unsigned : 1
 jl  @@pint637
 mov ax, [bp+4]
 mov bx, 10
 cwd
 idiv bx
 mov [bp-2], ax
 push word [bp-2]
 call pint
 add  sp, 2
@@pint637:
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

;-1007 int printint5(unsigned int j)  {
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : toupper

toupper:  ; *** PROC ***
;Function : toupper, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1007 NULL s = bp+4;
 ENTER  0,0
@@toupper638:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@toupper639
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 97 ;unsigned : 1
 jl  @@toupper640
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 122
 jg  @@toupper641
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 sub ax, 32
 mov  bx, [bp+4]
 mov  [bx], al
@@toupper641:
@@toupper640:
 inc  word[bp+4]
 jmp @@toupper638
@@toupper639:

;-1008 int head1  (char *s) {while(letter(*s)) s++;     *s=0; }
 LEAVE
 ret
; ENDP
;Number of CALLs:    8 : strlen

strlen:  ; *** PROC ***
;Function : strlen, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1008 NULL s = bp+4
;  201 var sign word  1008 NULL c = bp-2;
 ENTER  2,0
 mov ax, 0
 mov [bp-2], ax
@@strlen642:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  @@strlen643
 inc  word[bp+4]
 inc  word[bp-2]
 jmp @@strlen642
@@strlen643:
 mov ax, [bp-2]
 jmp @@retn

;-1009 int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:   24 : strcpy

strcpy:  ; *** PROC ***
;Function : strcpy, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1009 NULL s = bp+4
;  201 ptr sign byte  1009 NULL t = bp+6;
 ENTER  0,0
@@strcpy644:
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
 je  @@strcpy645
 jmp @@strcpy644
@@strcpy645:
 mov ax, 0
 mov  bx, [bp+4]
 mov  [bx], al

;-1010 int strncpy(char *s, char *t, int n) { if (_ n==0) return;
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : instr1

instr1:  ; *** PROC ***
;Function : instr1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1010 NULL s = bp+4
;  201 var sign byte  1010 NULL c = bp+6;
 ENTER  0,0
@@instr1646:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@instr1647
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne @@instr1648
 mov ax, 1
 jmp @@retn
@@instr1648:
 inc  word[bp+4]
 jmp @@instr1646
@@instr1647:
 mov ax, 0
 jmp @@retn

;-1011 int instr2(char *s, char c) { while(*s) { if (*s==c) return &s; s++;} return 0;}

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    2 : instr2

instr2:  ; *** PROC ***
;Function : instr2, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1011 NULL s = bp+4
;  201 var sign byte  1011 NULL c = bp+6;
 ENTER  0,0
@@instr2649:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@instr2650
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp al, [bp+6]
 jne @@instr2651
 mov ax, [bp+4]
 jmp @@retn
@@instr2651:
 inc  word[bp+4]
 jmp @@instr2649
@@instr2650:
 mov ax, 0
 jmp @@retn

;-1012 int digit(char c){ if(c<'0') return 0; if(c>'9') return 0; return 1; }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    2 : digit

digit:  ; *** PROC ***
;Function : digit, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1012 NULL c = bp+4;
 ENTER  0,0
 mov al, [bp+4]
 cmp al, 48
 jge @@digit652
 mov ax, 0
 jmp @@retn
@@digit652:
 mov al, [bp+4]
 cmp al, 57
 jle @@digit653
 mov ax, 0
 jmp @@retn
@@digit653:
 mov ax, 1
 jmp @@retn

;-1013 int letter(char c) { if (digit(c)) return 1; if (c=='_') return 1;

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    3 : letter

letter:  ; *** PROC ***
;Function : letter, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1013 NULL c = bp+4;
 ENTER  0,0
 mov al, byte [bp+4]
 mov ah, 0
 push ax
 call digit
 add  sp, 2
 or  al, al
 je @@letter654
 mov ax, 1
 jmp @@retn
@@letter654:
 mov al, [bp+4]
 cmp al, 95
 jne @@letter655
 mov ax, 1
 jmp @@retn

;-1014   if (c> 'z') return 0; if (c< '@') return 0;

@@letter655:
 mov al, [bp+4]
 cmp al, 122
 jle @@letter656
 mov ax, 0
 jmp @@retn
@@letter656:
 mov al, [bp+4]
 cmp al, 64
 jge @@letter657
 mov ax, 0
 jmp @@retn

;-1015   if (c> 'Z') { if (c< 'a') return 0; }  return 1; }

@@letter657:
 mov al, [bp+4]
 cmp al, 90
 jle @@letter658
 mov al, [bp+4]
 cmp al, 97
 jge @@letter659
 mov ax, 0
 jmp @@retn
@@letter659:
@@letter658:
 mov ax, 1
 jmp @@retn

;-1016 int eqstr(char *p, char *q) { while(*p) {

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:   83 : eqstr

eqstr:  ; *** PROC ***
;Function : eqstr, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1016 NULL p = bp+4
;  201 ptr sign byte  1016 NULL q = bp+6;
 ENTER  0,0
@@eqstr660:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eqstr661

;-1017     if (*p != *q) return 0; p++; q++; }

 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 mov bx, [bp+6]
 cmp al, [bx]
 mov ah, 0
 je  @@eqstr662
 mov ax, 0
 jmp @@retn
@@eqstr662:
 inc  word[bp+4]
 inc  word[bp+6]

;-1018     if(*q) return 0; return 1; }

 jmp @@eqstr660
@@eqstr661:
 mov bx, [bp+6]
 mov al, [bx]
 mov ah, 0
 or  al, al
 je @@eqstr663
 mov ax, 0
 jmp @@retn
@@eqstr663:
 mov ax, 1
 jmp @@retn

;-1019 int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }

@@retn: LEAVE
 ret
; ENDP
;Number of CALLs:    1 : strcat1

strcat1:  ; *** PROC ***
;Function : strcat1, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1019 NULL s = bp+4
;  201 ptr sign byte  1019 NULL t = bp+6;
 ENTER  0,0
@@strcat1664:
 mov bx, [bp+4]
 mov al, [bx]
 mov ah, 0
 cmp ax, 0
 je  @@strcat1665
 inc  word[bp+4]
 jmp @@strcat1664
@@strcat1665:
 push word [bp+6]
 push word [bp+4]
 call strcpy
 add  sp, 4

;-1020 int basename(char *s) { char *p; p=0;
 LEAVE
 ret
; ENDP
;Number of CALLs:    2 : DosInt

DosInt:  ; *** PROC ***
 int  33
 jae short @@DosInt666
 inc  word[DOS_ERR]
@@DosInt666:

;-1021 int openR (char *s) { dx=s; ax=0x3D02;  DosInt(); }

 ret
; ENDP
;Number of CALLs:    3 : openR

openR:  ; *** PROC ***
;Function : openR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1021 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  ax, 15618
 call DosInt

;-1022 int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : creatR

creatR:  ; *** PROC ***
;Function : creatR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1022 NULL s = bp+4;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 0
 mov  ax, 15360
 call DosInt

;-1023 int readR (char *s, int fd) {dx=s; cx=1; bx=fd; ax=0x3F00; DosInt(); }
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : readR

readR:  ; *** PROC ***
;Function : readR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1023 NULL s = bp+4
;  201 var sign word  1023 NULL fd = bp+6;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-1024 int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : readRL

readRL:  ; *** PROC ***
;Function : readRL, Number of local variables: 3
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1024 NULL s = bp+4
;  201 var sign word  1024 NULL fd = bp+6
;  202 var sign word  1024 NULL len = bp+8;
 ENTER  0,0
 mov  dx, [bp+4]
 mov  cx, [bp+8]
 mov  bx, [bp+6]
 mov  ax, 16128
 call DosInt

;-1025 int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
 LEAVE
 ret
; ENDP
;Number of CALLs:    1 : fputcR

fputcR:  ; *** PROC ***
;Function : fputcR, Number of local variables: 2
;   # type sign width addr used name   list of local variables
;  200 ptr sign byte  1025 NULL n = bp+4
;  201 var sign word  1025 NULL fd = bp+6;
 ENTER  0,0
lea dx, [bp+4]

;-1026   cx=1; bx=fd; ax=0x4000; DosInt(); }

 mov  cx, 1
 mov  bx, [bp+6]
 mov  ax, 16384
 call DosInt

;-1027 int writeRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x4000; DosInt();}
 LEAVE
 ret
; ENDP
;Number of CALLs:    2 : fcloseR

fcloseR:  ; *** PROC ***
;Function : fcloseR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign word  1027 NULL fd = bp+4;
 ENTER  0,0
 mov  bx, [bp+4]
 mov  ax, 15872
 int  33

;-1028 int exitR(char c) {ah=0x4C; al=c; inth 0x21; }
 LEAVE
 ret
; ENDP
;Number of CALLs:    5 : exitR

exitR:  ; *** PROC ***
;Function : exitR, Number of local variables: 1
;   # type sign width addr used name   list of local variables
;  200 var sign byte  1028 NULL c = bp+4;
 ENTER  0,0
 mov  ah, 76
 mov  al, [bp+4]
 int  33

;-1029 int setdta(char *s) {dx=s; ah=0x1A; inth 0x21; }
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
;    2 var sign byte     5    3 BSS
;    3 var sign byte     5   25 NASM
;    4 var sign byte     5    5 LIST
;    5 def unsg byte     6    - LSTART=200
;    6 def unsg byte     7    - VARMAX=300
;    7 def unsg byte     8    - GNAMEMAX=4800
;    8 def unsg byte     9    - FUNCMAX=300
;    9 def unsg byte    10    - FNAMEMAX=4800
;   10 def unsg byte    11    - CALLMAX=2000
;   11 def unsg byte    12    - IDLENMAX=15
;   12 def unsg byte    14    - T_NAME=256
;   13 def unsg byte    15    - T_CONST=257
;   14 def unsg byte    16    - T_STRING=258
;   15 def unsg byte    17    - T_INCLUDE=510
;   16 def unsg byte    18    - T_DEFINE=511
;   17 def unsg byte    19    - T_RETURN=512
;   18 def unsg byte    20    - T_IF=513
;   19 def unsg byte    21    - T_ELSE=514
;   20 def unsg byte    22    - T_WHILE=515
;   21 def unsg byte    23    - T_DO=516
;   22 def unsg byte    24    - T_INT=517
;   23 def unsg byte    25    - T_ASM=518
;   24 def unsg byte    26    - T_ASMBLOCK=519
;   25 def unsg byte    27    - T_EMIT=520
;   26 def unsg byte    28    - T_GOTO=521
;   27 def unsg byte    29    - T_VOID=529
;   28 def unsg byte    30    - T_CHAR=530
;   29 def unsg byte    31    - T_SIGNED=531
;   30 def unsg byte    32    - T_UNSIGNED=532
;   31 def unsg byte    33    - T_LONG=533
;   32 def unsg byte    34    - T_SHORT=534
;   33 def unsg byte    36    - T_UINT32=545
;   34 def unsg byte    38    - T_INTH=600
;   35 def unsg byte    39    - T_IFCARRY=601
;   36 def unsg byte    40    - T_IFZERO=602
;   37 def unsg byte    41    - T_EQ=806
;   38 def unsg byte    42    - T_NE=807
;   39 def unsg byte    43    - T_GE=811
;   40 def unsg byte    44    - T_LE=824
;   41 def unsg byte    45    - T_PLUSPLUS=1219
;   42 def unsg byte    46    - T_MINUSMINUS=1225
;   43 def unsg byte    47    - T_PLUSASS=1230
;   44 def unsg byte    48    - T_MINUSASS=1231
;   45 def unsg byte    49    - T_MULASS=1232
;   46 def unsg byte    50    - T_DIVASS=1233
;   47 def unsg byte    51    - T_ANDASS=1234
;   48 def unsg byte    52    - T_ORASS=1235
;   49 def unsg byte    53    - T_LESSLESS=1240
;   50 def unsg byte    54    - T_GREATGREAT=1241
;   51 def unsg byte    55    - COMAX=3000
;   52 def unsg byte    56    - CMDLENMAX=67
;   53 var unsg word    57    3 ORGDATAORIG
;   54 var unsg word    57   11 orgData
;   55 arr sign byte    58    4 co[3000]
;   56 var sign word    58    4 maxco
;   57 var sign word    58    3 maxco1
;   58 arr sign byte    59    2 coname[67]
;   59 ptr sign byte    59    5 cloc
;   60 var sign word    60    7 fdin
;   61 var sign word    60    7 fdout
;   62 arr sign byte    60  114 symbol[128]
;   63 arr sign byte    61   12 fname[67]
;   64 arr sign byte    61   12 namein[67]
;   65 arr sign byte    62    7 namelst[67]
;   66 arr sign byte    62    5 archivename[67]
;   67 var sign word    63   52 token
;   68 var sign byte    63    2 globC
;   69 var sign word    63    3 spalte
;   70 var sign byte    64   28 thechar
;   71 var sign word    64    9 iscmp
;   72 var sign word    64    4 nconst
;   73 var sign word    65    3 nreturn
;   74 var sign word    65   16 nlabel
;   75 var sign word    65    3 callrecursive
;   76 var sign word    66   24 GTop
;   77 var sign word    66   20 LTop
;   78 var unsg word    67   45 lexval
;   79 var sign word    68    6 typei
;   80 var sign byte    68    8 istype
;   81 arr sign byte    68   11 GType[300]
;   82 var sign word    69    6 signi
;   83 var sign byte    69    6 issign
;   84 arr sign byte    69    5 GSign[300]
;   85 var sign word    70    9 widthi
;   86 var sign byte    70   20 iswidth
;   87 arr sign byte    70    5 GWidth[300]
;   88 arr sign word    71    4 GAdr[300]
;   89 arr sign word    71    6 GUsed[300]
;   90 var sign word    72   26 wi
;   91 arr sign word    72   11 GData[300]
;   92 arr sign byte    72    2 GNameField[4800]
;   93 var sign word    73   17 FTop
;   94 var sign word    73    9 CTop
;   95 arr sign byte    74    2 FType[300]
;   96 arr sign byte    74    5 CType[2000]
;   97 arr sign word    75    4 FAdr[300]
;   98 arr sign word    75    5 CAdr[2000]
;   99 arr sign word    76    4 FCalls[300]
;  100 arr sign byte    77    5 FNameField[4800]
;  101 arr sign byte    78    9 NameA[32]
;  102 arr sign byte    79    5 fgetsdest[128]
;  103 ptr unsg byte    79    8 CNameTop
;  104 ptr unsg byte    80   10 fgetsp
;  105 var unsg word    80    4 segE
;  106 var unsg word    81   12 lineno
;  107 var unsg word    81    2 linenoinclude
;  108 ptr unsg byte    82   19 pt
;  109 ptr unsg byte    82    8 p1
;  110 var sign word    83   10 DOS_ERR
;  111 var sign word    83    5 DOS_NoBytes
;  112 var sign byte    83    3 DOS_ByteRead
;  113 var sign word    85 NULL tt1
;  114 var sign word    85 NULL tt2
;  115 var sign dwrd    85    1 ex
;  116 arr sign byte    99    2 doglobName[15]
;  117 var sign word   249    5 mod1
;  118 var sign word   249   12 ireg1
;  119 var sign word   249    6 idx1
;  120 var sign word   249    1 ids1
;  121 var sign word   249    4 idw1
;  122 var sign word   249    2 idt1
;  123 var sign word   249 NULL val1
;  124 var sign word   250    2 mod2
;  125 var sign word   250    6 ireg2
;  126 var sign word   250    6 idx2
;  127 var sign word   250    1 ids2
;  128 var sign word   250    4 idw2
;  129 var sign word   250    2 idt2
;  130 var sign word   250    2 val2
;  131 arr sign byte   318    9 ops[5]
;  132 arr sign byte   360    3 printregstr[74]
;  133 var sign word   368    1 evalue
;  134 var sign word   368    1 exprtype
;  135 arr sign word   520    2 docalltype[10]
;  136 arr sign word   520    2 docallvalue[10]
;  137 arr sign byte   521    2 procname[17]
;  138 ptr sign byte   576    1 arglen
;  139 ptr sign byte   576    3 argv
;  140 var sign byte   624    4 wasfunction
;  141 arr sign byte   756    2 symboltemp[80]
;  142 var unsg word   939    1 MAXUI


;   # Calls Line Width  Name   list of functions

;    0    1   86   ttt
;    1    4   93   a
;    2   21   94   v
;    3    4   96   checknamelen
;    4    1  100   doglob
;    5   12  151   gettypes
;    6    9  160   adrofname
;    7    7  161   adrF
;    8    4  163   printName
;    9   12  167   searchname
;   10    3  171   checkName
;   11   10  176   typeName
;   12    3  186   name1
;   13    1  188   storecall
;   14    2  194   storefunc
;   15    2  198   addlocal
;   16    1  204   checkFunction
;   17    2  207   dofunc
;   18    1  242   isvariable
;   19    3  252   pexpr
;   20    1  259   constantexpr
;   21    3  270   exprstart
;   22    1  272   expr2
;   23    3  319   doreg1
;   24    6  338   checkreg
;   25    6  363   printreg
;   26    2  369   expr
;   27    4  418   compoundass
;   28    2  425   dovar1
;   29    8  446   rterm
;   30    1  459   isreg
;   31   15  477   doreg
;   32    1  483   doassign
;   33    1  501   domul
;   34    2  505   doidiv
;   35    1  518   domod
;   36    1  522   docall1
;   37 NULL  564   main
;   38    3  575   getfirstchar
;   39    1  577   getarg
;   40    2  600   parse
;   41    2  609   checkcalls
;   42    1  625   doar
;   43    1  652   getfunctionhead
;   44    1  659   doinclude
;   45    1  670   dodefine
;   46    8  689   stmt
;   47    1  713   doemit
;   48    3  717   cmpneg
;   49    9  730   prlabel
;   50    3  731   prjump
;   51    1  732   doif
;   52    1  737   doifcarry
;   53    1  740   doifzero
;   54    1  743   dodo
;   55    1  747   dowhile
;   56    4  750   isrelational
;   57   22  757   getlex
;   58    1  814   convertdefine
;   59    1  821   getdigit
;   60    1  830   getstring
;   61   31  833   next
;   62   84  834   istoken
;   63   38  835   expect
;   64    6  838   eprc
;   65    5  839   eprs
;   66   41  840   prc
;   67    3  842   prscomment
;   68    8  844   prnl
;   69  283  846   prs
;   70    2  851   eprnum
;   71   18  853   pint1
;   72   29  855   prunsign1
;   73   26  858   printint51
;   74    2  862   fgets1
;   75    1  866   printinputline
;   76    2  874   end1
;   77   50  875   error1
;   78    2  884   listproc
;   79    2  892   listvar
;   80    1  908   listcall
;   81    1  911   calllisting
;   82    1  917   countcalls
;   83    1  925   listfunc
;   84    1  929   funclisting
;   85    1  940   epilog
;   86    1  972   setblock
;   87    1  974   allocmem
;   88 NULL  978   copyF
;   89    1  984   to_far
;   90    4  992   from_far
;   91    4 1001   writetty
;   92    3 1002   putch
;   93   12 1003   cputs
;   94    4 1004   mkneg
;   95    2 1005   pint
;   96    1 1007   toupper
;   97    8 1008   strlen
;   98   25 1009   strcpy
;   99    1 1010   instr1
;  100    2 1011   instr2
;  101    3 1012   digit
;  102    3 1013   letter
;  103   83 1016   eqstr
;  104    1 1019   strcat1
;  105    7 1020   DosInt
;  106    3 1021   openR
;  107    1 1022   creatR
;  108    1 1023   readR
;  109    1 1024   readRL
;  110    1 1025   fputcR
;  111    2 1027   fcloseR
;  112    5 1028   exitR
;  113 NULL 1029   LastFunctionByt

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
;  672  4264 eqstr
;  673  4270 getlex
;  674  4277 eqstr
;  675  4283 getlex
;  676  4290 eqstr
;  677  4296 getlex
;  678  4303 prs
;  679  4307 strcpy
;  680  4314 prs
;  681  4318 error1
;  682  4325 getlex
;  683  4332 expect
;  684  4339 error1
;  685  4346 strlen
;  686  4353 error1
;  687  4360 adrofname
;  688  4370 strcpy
;  689  4377 expect
;  690  4384 istoken
;  691  4392 istoken
;  692  4400 stmt
;  693  4405 istoken
;  694  4413 doif
;  695  4418 istoken
;  696  4426 dodo
;  697  4431 istoken
;  698  4439 dowhile
;  699  4447 istoken
;  700  4455 prs
;  701  4459 name1
;  702  4465 prs
;  703  4469 expect
;  704  4476 prs
;  705  4480 next
;  706  4485 prc
;  707  4489 next
;  708  4494 getlex
;  709  4501 istoken
;  710  4509 prs
;  711  4513 next
;  712  4518 prc
;  713  4522 next
;  714  4527 getlex
;  715  4534 error1
;  716  4541 istoken
;  717  4549 prs
;  718  4553 expect
;  719  4560 prunsign1
;  720  4570 expect
;  721  4577 istoken
;  722  4585 doifcarry
;  723  4595 istoken
;  724  4603 doifzero
;  725  4612 istoken
;  726  4620 doemit
;  727  4627 istoken
;  728  4635 istoken
;  729  4643 exprstart
;  730  4653 prs
;  731  4657 expect
;  732  4664 prs
;  733  4668 prs
;  734  4672 prc
;  735  4676 expect
;  736  4683 expect
;  737  4690 exprstart
;  738  4700 expect
;  739  4707 prs
;  740  4711 getlex
;  741  4718 prunsign1
;  742  4728 getlex
;  743  4735 prc
;  744  4739 expect
;  745  4746 prs
;  746  4750 prs
;  747  4754 prs
;  748  4758 prs
;  749  4762 prs
;  750  4766 prunsign1
;  751  4776 prs
;  752  4780 prs
;  753  4784 prunsign1
;  754  4794 prs
;  755  4798 prs
;  756  4802 prs
;  757  4806 error1
;  758  4813 prs
;  759  4817 prs
;  760  4821 pint1
;  761  4827 prc
;  762  4831 prs
;  763  4835 prs
;  764  4839 pint1
;  765  4845 pexpr
;  766  4851 pint1
;  767  4857 stmt
;  768  4862 istoken
;  769  4870 prjump
;  770  4877 prlabel
;  771  4885 stmt
;  772  4890 prlabel
;  773  4898 prlabel
;  774  4906 prs
;  775  4910 prs
;  776  4914 pint1
;  777  4920 stmt
;  778  4925 prlabel
;  779  4933 prs
;  780  4937 prs
;  781  4941 pint1
;  782  4947 stmt
;  783  4952 prlabel
;  784  4960 prlabel
;  785  4968 stmt
;  786  4973 expect
;  787  4980 pexpr
;  788  4986 pint1
;  789  4992 prjump
;  790  4999 prlabel
;  791  5007 prlabel
;  792  5015 pexpr
;  793  5021 pint1
;  794  5027 stmt
;  795  5032 prjump
;  796  5039 prlabel
;  797  5047 getlex
;  798  5054 next
;  799  5059 next
;  800  5064 next
;  801  5069 next
;  802  5074 next
;  803  5079 next
;  804  5084 next
;  805  5089 next
;  806  5094 next
;  807  5099 next
;  808  5104 next
;  809  5109 next
;  810  5114 next
;  811  5119 next
;  812  5124 next
;  813  5129 instr1
;  814  5136 next
;  815  5141 getlex
;  816  5148 next
;  817  5153 next
;  818  5158 getlex
;  819  5165 getstring
;  820  5175 digit
;  821  5181 getdigit
;  822  5190 next
;  823  5195 next
;  824  5200 next
;  825  5205 letter
;  826  5212 strcpy
;  827  5219 letter
;  828  5226 next
;  829  5231 eqstr
;  830  5237 eqstr
;  831  5243 eqstr
;  832  5249 eqstr
;  833  5255 eqstr
;  834  5261 eqstr
;  835  5267 eqstr
;  836  5273 eqstr
;  837  5279 eqstr
;  838  5285 eqstr
;  839  5291 eqstr
;  840  5297 eqstr
;  841  5303 eqstr
;  842  5309 eqstr
;  843  5315 eqstr
;  844  5321 eqstr
;  845  5327 eqstr
;  846  5333 eqstr
;  847  5339 eqstr
;  848  5345 eqstr
;  849  5351 eqstr
;  850  5357 eqstr
;  851  5363 convertdefine
;  852  5377 strcpy
;  853  5384 error1
;  854  5391 adrofname
;  855  5401 eqstr
;  856  5407 next
;  857  5412 letter
;  858  5419 next
;  859  5424 digit
;  860  5430 next
;  861  5435 next
;  862  5440 next
;  863  5445 fgets1
;  864  5452 getlex
;  865  5459 istoken
;  866  5467 prs
;  867  5471 listproc
;  868  5480 prs
;  869  5484 pint1
;  870  5490 error1
;  871  5497 eprc
;  872  5502 writetty
;  873  5511 writetty
;  874  5520 fputcR
;  875  5527 prc
;  876  5531 prs
;  877  5535 prc
;  878  5539 eprc
;  879  5544 mkneg
;  880  5550 eprnum
;  881  5557 eprc
;  882  5562 prc
;  883  5566 mkneg
;  884  5572 pint1
;  885  5578 prc
;  886  5582 prunsign1
;  887  5592 prc
;  888  5596 prc
;  889  5600 prc
;  890  5604 prc
;  891  5608 prc
;  892  5612 prunsign1
;  893  5622 printinputline
;  894  5637 readR
;  895  5643 prs
;  896  5647 prunsign1
;  897  5657 prc
;  898  5661 prscomment
;  899  5672 fcloseR
;  900  5680 fcloseR
;  901  5688 exitR
;  902  5694 prnl
;  903  5699 prscomment
;  904  5710 prs
;  905  5714 prunsign1
;  906  5724 prs
;  907  5728 prs
;  908  5732 prs
;  909  5736 pint1
;  910  5742 prs
;  911  5746 prunsign1
;  912  5756 prs
;  913  5760 prc
;  914  5764 prs
;  915  5768 pint1
;  916  5774 prs
;  917  5778 prs
;  918  5782 end1
;  919  5787 prs
;  920  5791 prs
;  921  5795 prs
;  922  5799 prunsign1
;  923  5809 prs
;  924  5813 listvar
;  925  5821 prs
;  926  5825 printint51
;  927  5836 prc
;  928  5840 prs
;  929  5844 prs
;  930  5848 prs
;  931  5852 prs
;  932  5856 prs
;  933  5860 prs
;  934  5864 prs
;  935  5868 prs
;  936  5872 prs
;  937  5876 printint51
;  938  5887 printint51
;  939  5898 prs
;  940  5902 prs
;  941  5906 prc
;  942  5910 adrofname
;  943  5920 prs
;  944  5924 prc
;  945  5928 prunsign1
;  946  5938 prc
;  947  5942 prunsign1
;  948  5952 prc
;  949  5956 prs
;  950  5960 prc
;  951  5964 pint1
;  952  5970 prs
;  953  5974 calllisting
;  954  5986 prs
;  955  5990 printint51
;  956  6001 prc
;  957  6005 prs
;  958  6009 printint51
;  959  6020 prc
;  960  6024 from_far
;  961  6033 prs
;  962  6037 adrF
;  963  6042 from_far
;  964  6051 eqstr
;  965  6057 prs
;  966  6061 countcalls
;  967  6072 funclisting
;  968  6084 prs
;  969  6088 printint51
;  970  6099 printint51
;  971  6110 prs
;  972  6114 printint51
;  973  6125 prc
;  974  6129 prs
;  975  6133 prs
;  976  6137 prs
;  977  6141 prs
;  978  6145 prc
;  979  6149 prc
;  980  6153 adrF
;  981  6158 prs
;  982  6162 strcpy
;  983  6169 storefunc
;  984  6179 prs
;  985  6183 prs
;  986  6187 listvar
;  987  6195 listfunc
;  988  6204 listcall
;  989  6213 prs
;  990  6217 prs
;  991  6221 prs
;  992  6225 prs
;  993  6229 prs
;  994  6233 printint51
;  995  6244 prs
;  996  6248 printint51
;  997  6259 prs
;  998  6263 printint51
;  999  6274 prs
; 1000  6278 printint51
; 1001  6289 prs
; 1002  6293 printint51
; 1003  6304 prs
; 1004  6308 printint51
; 1005  6319 prs
; 1006  6323 printint51
; 1007  6334 prs
; 1008  6338 printint51
; 1009  6349 prs
; 1010  6353 printint51
; 1011  6364 prs
; 1012  6368 printint51
; 1013  6379 prs
; 1014  6383 printint51
; 1015  6394 prs
; 1016  6398 printint51
; 1017  6409 prs
; 1018  6413 prs
; 1019  6417 prunsign1
; 1020  6427 prs
; 1021  6431 printint51
; 1022  6442 prs
; 1023  6446 prs
; 1024  6450 prs
; 1025  6454 prs
; 1026  6458 printint51
; 1027  6469 prs
; 1028  6473 printint51
; 1029  6484 prs
; 1030  6488 printint51
; 1031  6499 prs
; 1032  6503 prs
; 1033  6507 end1
; 1034  6512 DosInt
; 1035  6519 DosInt
; 1036  6526 writetty
; 1037  6535 writetty
; 1038  6544 putch
; 1039  6550 prc
; 1040  6554 mkneg
; 1041  6560 pint
; 1042  6565 putch
; 1043  6571 digit
; 1044  6577 strcpy
; 1045  6584 DosInt
; 1046  6591 DosInt
; 1047  6598 DosInt
; 1048  6605 DosInt
; 1049  6612 DosInt
;Input: A.C, List: A.S,  Lines: 1030
;Glob. variables:  142 max.:  200
;Functions      :  114 max.:  300
;Calls          : 1050 max.: 2000, NameField: 6619 max.:    65535
;Code until     :23898 max.: 30000, free: 6102
;Data (HeapEnd) :53548, resting stacksize: 11987
;Max. Const in 'epilog' :  971 max. 3000, free: 2029