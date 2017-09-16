//  .ret redefined 2011.04.25 23.644 bytes, Full  Working 2017.09.13
char Version1[]="A.COM V0.9";
#define LSTART        200
#define VARMAX        300
#define GNAMEMAX     4800 // 16*VARMAX
#define FUNCMAX       300
#define FNAMEMAX     4800 // 16*FUNCMAX
#define CALLMAX      2000
#define IDLENMAX       15
#define _                 // Konstantvergleich
#define T_NAME        256
#define T_CONST       257 
#define T_STRING      258     
#define T_INCLUDE     510     
#define T_DEFINE      511  
#define T_RETURN      512
#define T_IF          513      
#define T_ELSE        514  
#define T_WHILE       515      
#define T_DO          516
#define T_INT         517     
#define T_ASM         518   
#define T_ASMBLOCK    519   
#define T_EMIT        520
#define T_GOTO        521    
#define T_VOID        529  
#define T_CHAR        530       
#define T_SIGNED      531
#define T_UNSIGNED    532
#define T_LONG        533
#define T_EQ          806
#define T_NE          807
#define T_GE          811
#define T_LE          824
#define T_PLUSPLUS   1219
#define T_MINUSMINUS 1225
#define T_PLUSASS    1230
#define T_MINUSASS   1231
#define T_MULASS     1232
#define T_DIVASS     1233
#define T_ANDASS     1234
#define T_ORASS      1235
#define T_LESSLESS   1240
#define T_GREATGREAT 1241
#define COMAX        3000
#define CMDLENMAX      67
unsigned int ORGDATAORIG=30000;      unsigned int orgData=30000;
char co[COMAX];    int maxco=0;      int maxco1=0;
char coname[CMDLENMAX];              char *cloc=0;
int fdin=0;        int fdout=0;      char symbol[128];
char fname[CMDLENMAX];               char namein[CMDLENMAX];
char namelst[CMDLENMAX];             char archivename[CMDLENMAX];
int token=0;       char globC=0;     int spalte=0;
char thechar=0;    int iscmp=0;      int nconst=0;
int nreturn=0;     int nlabel=0;    
int GTop=1;        int LTop=150;
unsigned int lexval=0;
int typei;       char istype;  char GType [VARMAX]; // 0=V, 1=*, 2=&,#
int signi;       char issign;  char GSign [VARMAX]; // 0=U, 1=S
int widthi;      char iswidth; char GWidth[VARMAX]; // 0, 1, 2, 4
             int GAdr[VARMAX]; int  GUsed [VARMAX];
int wi=0;   int GData[VARMAX];  char GNameField[GNAMEMAX];
int  FTop=0;                 int  CTop=0;
char FType [FUNCMAX];        char CType[CALLMAX];
int  FAdr  [FUNCMAX];        int  CAdr [CALLMAX];
int  FCalls[FUNCMAX];
char FNameField[FNAMEMAX];   //char CNameField[CNAMEMAX];
char NameA[]="12345678901234567890123456789012"; //must be in low memory
char fgetsdest[128];         unsigned char *CNameTop=0;
unsigned char *fgetsp=0;     unsigned int segE;
unsigned int lineno=1;       unsigned int linenoinclude=1;
unsigned char *pt=0;         unsigned char *p1=0;
int DOS_ERR=0; int DOS_NoBytes=0; char DOS_ByteRead=0;

int writetty()     { ah=0x0E; bx=0; __emit__(0xCD,0x10); } 
int putch(char c)  {if (_ c==10) {al=13; writetty();} al=c; writetty(); }
int cputs(char *s) {char c;  while(*s) { c=*s; putch(c); s++; } }
int mkneg(int n)   { n; __asm {neg ax} }

int DosInt() { 
    __emit__(0xCD,0x21);//inth 0x21; 
    __emit__(0x73, 04); //ifcarry DOS_ERR++;
    DOS_ERR++;
}
int openR (char *s) { dx=s;       ax=0x3D02; DosInt(); }
int creatR(char *s) { dx=s; cx=0; ax=0x3C00; DosInt(); }
int fcloseR(int fd) {bx=fd;       ax=0x3E00; DosInt(); }
int exitR  (char c) {ah=0x4C; al=c;          DosInt(); }
int readRL(char *s, int fd, int len){dx=s; cx=len; bx=fd; ax=0x3F00; DosInt();}
int fputcR(char *n, int fd) { __asm{lea dx, [bp+4]}; /* = *n */
  cx=1; bx=fd; ax=0x4000; DosInt(); }

int strlen(char *s) { int c; c=0; while (*s!=0) {s++; c++;} return c; }
int strcpy(char *s, char *t) {do { *s=*t; s++; t++; } while (*t!=0); *s=0; }
int eqstr(char *p, char *q) { while(*p) {
    if (*p != *q) return 0; p++; q++; }
    if(*q) return 0; return 1; }
int instr1(char *s, char c) { while(*s) {if (*s==c) return 1; s++;}return 0;}
int strcat1(char *s, char *t) { while (*s != 0) s++; strcpy(s, t);  }
int toupper(char *s) {while(*s) {if (*s >= 'a') if (*s <= 'z') *s=*s-32; s++;}}

int digit(char c){ 
    if(c<'0') return 0; 
    if(c>'9') return 0; 
    return 1; 
}
int letter(char c) { 
    if (c=='_') return 1;
    if (c=='.') return 1;
    if (c=='?') return 1;
    if (c=='$') return 1;
    if (c> 'z') return 0; 
    if (c< '@') return 0;// at included
    if (c> 'Z') { if (c< 'a') return 0; }  
    return 1; 
}    
int alnum(char c) {
  if (digit (c)) return 1;
  if (letter(c)) return 1;
  return 0;
}       
int a(unsigned int i) {  printName(i);}//address
int v(unsigned int i) {//value 
    if (i < LSTART) prc('['); 
    printName(i);
    if (i < LSTART) prc(']');   
}
int checknamelen() { int i;    i=strlen(symbol);
  if (i > IDLENMAX) error1("Item name is too long in characters)");
}
char doglobName[IDLENMAX];
int doglob() { int i; int j; int isstrarr; isstrarr=0;
  if (GTop >= LSTART) error1("Global table full");
  if (iswidth == 0) error1("no VOID as var type");
  checknamelen();
  if (checkName() != 0) error1("Variable already defined");
  if (istoken('[')) { istype='&';
    if (istoken(T_CONST)) {
      prs("\nsection .bss\nabsolute ");
      prunsign1(orgData);
      prs("\n"); prs(symbol); 
      if (iswidth==1) prs(" resb "); 
      if (iswidth==2) prs(" resw ");
      if (iswidth==4) prs(" resd ");
      prunsign1(lexval); 
      prs("\nsection .text");
      orgData=orgData+lexval;
      if (iswidth==2) orgData=orgData+lexval;
      if (iswidth==4) {i= lexval * 3; orgData=orgData + i;}
      GData[GTop]=lexval; expect(']');
    }else { expect(']');
      if (iswidth != 1) error1("Only ByteArray allowed");
      prs("\n"); prs(symbol); prs(" db "); 
      isstrarr=1; strcpy(doglobName, symbol);
      expect('='); 
      if (istoken(T_STRING)) { 
        prc(34); prscomment(symbol); prc(34); prs(",0"); 
        i=strlen(symbol); GData[GTop]=i; }
      else if (istoken('{' )) { i=0;
        do { if(i) prc(','); 
          expect(T_CONST); prunsign1(lexval); i=1; }
        while (istoken(',')); expect('}'); }  
      else error1("String or number array expected");
      }; 
  }else { //expect('=');
    prs("\n"); prs(symbol); if (istype=='*') prs(" dw ");
    else {
      if      (iswidth==1) prs(" db ");
      else if (iswidth==2) prs(" dw ");
      else                 prs(" dd ");
    }
    if(istoken('-')) prc('-');
    if (istoken('=')) {expect(T_CONST); prunsign1(lexval); }
    else prunsign1(0); }
  GSign[GTop]=issign; GWidth[GTop]=iswidth; GType[GTop]=istype;
  GAdr [GTop]=lineno-1; GUsed [GTop]=0;
  pt=adrofname(GTop);
  if (isstrarr) strcpy(pt, doglobName); else strcpy(pt, symbol);
  GTop++; expect(';'); }

int gettypes(int i) {int j; char c;
  c=GSign [i]; if (c=='S') signi =1;    else signi =0;
  c=GWidth[i]; widthi=0;wi=0;
  if (c==1) {widthi=1;wi=1;}
  if (c==2) {widthi=2;wi=2;}
  if (c==4) {widthi=4;wi=4;}
  c=GType [i]; typei=0; if (c=='*') {typei=1;wi=2;}
  if (c=='&')  typei=2;  
  return i; }  
int adrofname(unsigned int i) { adrF(GNameField, i); }
int adrF(char *s, unsigned int i) { i << 4;//*16; IDLENMAX=15!
  __asm{ add ax, [bp+4]  ; offset s } }
int printName(unsigned int i) {int j;
  if (i < LSTART) { i=adrofname(i); prs(i); }
  else { prs("[bp"); j = GData[i]; if (j>0) prc('+'); pint1(j); prc(']'); }
}
int searchname() { unsigned int i;
  i=checkName(); if (i == 0) error1("Variable unknown");
  GUsed[i]=GUsed[i] + 1; return i;
}
int checkName() { unsigned int i; unsigned int j;
  i=LSTART;while(i<LTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  i=1;     while(i<GTop) {j=adrofname(i);if(eqstr(symbol,j))return i; i++;}
  return 0;
}    
int typeName() { int m; //0=V,1=*,2=&
    issign='S';
    if(istoken(T_SIGNED))   issign='S';  
    if(istoken(T_UNSIGNED)) issign='U';
    iswidth=2;                           
    if(istoken(T_VOID))     iswidth=0;
    if(istoken(T_CHAR))     iswidth=1;   
    if(istoken(T_INT))      iswidth=2;
    if(istoken(T_LONG))     iswidth=4;
    istype='V'; 
    m=0;
    if(istoken('*'))  {istype='*'; m=1;} 
    if(istoken('&'))  {istype='&'; m=2;}
    name1(); 
    return m; 
}
int name1() {
    if (token!=T_NAME) error1("Name expected"); 
    token=getlex(); 
}

int storecall() { int i; if (CTop >= CALLMAX) error1("Call table full");
  if (CNameTop >= 65468) error1("Call name table fuill");
    CType[CTop]=0;  CAdr [CTop]=CNameTop; i=strlen(symbol);
    to_far(CNameTop, symbol);
    CNameTop=CNameTop+i; CNameTop++; CTop++;
}
int storefunc() { if (FTop >= FUNCMAX) error1("Function table full");
    FAdr[FTop]=lineno - 1;  FCalls[FTop]=0;   FType[FTop]=iswidth;
    pt=adrF(FNameField, FTop); strcpy(pt, symbol); FTop++;
}
int addlocal() { if(LTop >= VARMAX) error1("Local variable table full");
  if (checkName() != 0) error1("Variable already defined");
  GSign[LTop]=issign; GWidth[LTop]=iswidth; GType[LTop]=istype;
  GAdr [LTop]=lineno-1; GUsed[LTop]=0;
  pt=adrF(GNameField, LTop); strcpy(pt, symbol);
}
int checkFunction() { unsigned int i; unsigned int j; i=0;
  while (i < FTop) { j=adrF(FNameField, i); if(eqstr(symbol, j))return i; i++;}
  return 0; }
int dofunc() { int nloc; int i; int narg;  
  cloc=&co; 
  checknamelen();
  strcpy(fname, symbol);
  if (checkFunction() ) error1("Function already defined");
  storefunc();
  prs("\n\n"); prs(symbol); prs(":  ; *** PROC ***");
  expect('('); LTop=LSTART;  i=0;
  if (istoken(')')==0) { narg=2; 
    do { typeName();  addlocal(); narg+=2;
         GData[LTop]=narg; if (iswidth == 4) narg+=2; LTop++; }
    while (istoken(','));  expect(')'); }
    
  expect('{'); /*body*/
  nloc=0; nreturn=0; nconst=0; i=0; /*nlabel=0; */
  while(isvariable()) {
    do {typeName();
        checknamelen();
        addlocal(); nloc-=2;
        if (iswidth == 4) nloc-=2;
        GData[LTop]=nloc;
        if (istoken('[')){istype='&';GType[LTop]='&';expect(T_CONST);expect(']');
            nloc=nloc-lexval; nloc+=2; GData[LTop]=nloc; }
        LTop++;
      } while (istoken(',')); expect(';'); }
  listproc(); 
  if (LTop>LSTART){prs(";\n ENTER  "); 
    nloc=mkneg(nloc); prunsign1 (nloc); prs(",0"); }
  while(istoken('}')==0)   stmt();
  if (nreturn) { 
        prs("\n .retn");
        prs(fname);
        prc(':');
        }
  if (LTop > LSTART) prs(" LEAVE");
  prs("\n ret"); 
  *cloc=0; prs(co); 
  maxco1=strlen(co);
  if (maxco1 > maxco) {maxco=maxco1; strcpy(coname, fname); }
  prs("\n; ENDP"); 
}
int isvariable() {
    if(token==T_SIGNED)   goto v1;   
    if(token==T_UNSIGNED) goto v1;
    if(token==T_CHAR)     goto v1;   
    if(token==T_INT)      goto v1;
    if(token==T_LONG)     goto v1;
    return 0;  
v1: return 1;
}
                  
int mod1; int ireg1; int idx1; int ids1; int idw1; int idt1; int val1;
int mod2; int ireg2; int idx2; int ids2; int idw2; int idt2; int val2;

int pexpr() {expect('('); iscmp=0; 
  if (token==T_NAME) {if (eqstr(symbol, "_")) {constantexpr(); return;}
    ireg1=checkreg();
    if (ireg1) { doreg1(1); return; }  }
  exprstart(); if (iscmp==0) prs("\n or  al, al\n je .");  prs(fname);
  expect(')'); }           /*error1("Vergleich fehlt");*/

int constantexpr() { int mode; int id1;int ids;
  token=getlex();   mode=typeName();  
  id1=searchname(); gettypes(id1); ids=signi;
  if (isrelational() ==0) error1("Relational expression expected");
  expect(T_CONST);  prs(" ; constant expression");
  prs("\ncmp "); 
  gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  v(id1); prs(", "); prunsign1(lexval); cmpneg(ids);   prs(fname);
  expect(')');
}  
int exprstart() { if (eqstr(symbol, "_")) expr2(0); else expr(0); }

int expr2(int kind) {  int i;
  if(kind != 1) token=getlex();
  mod1=typeName();
  if (mod1) error1("Noch kein & und * im Text (Linke Hand) erlaubt");
  ireg1=checkreg();
  if (ireg1) { doreg1(0); return; }
  if (ireg1 == 0) { idx1=searchname();
    gettypes(idx1); ids1=signi; idw1=wi; idt1=typei;
    if (idt1)  error1("Noch kein Array oder Pointer links erlaubt");  }
  
  if (isrelational()) { error1("Vergleich noch nicht implementiert");
  }
  if (istoken('=') == 0) error1("Assign expected");
  if (istoken(T_CONST) ) { val2=lexval; prs(" ; constant expression");
    prs("\nmov ");
    if (idw1 == 1) prs("byte ");
    if (idw1 == 2) prs("word ");
    if (idw1 == 4) prs("dword ");
    v(idx1);
    prs(", "); prunsign1(val2);
    if (idx1 >= LSTART) { i=adrofname(idx1);  prs("; "); prs(i); } return; }
  
  mod1=typeName(); ireg2=checkreg();
  if (ireg2) { prs("\nmov ");
    if (ireg1) printreg(ireg1); else v(idx1); prs(", "); printreg(ireg2);return;}
  else {
    if (mod1 == 1) error1("Noch kein * im Text erlaubt");
    
    idx2=searchname();
    gettypes(idx2); ids2=signi; idw2=wi; idt2=typei;
    if (idt2 == 1)  error1("Noch kein Array rechts erlaubt");
    prs("\nmov ");
    if (ireg1) printreg(ireg1); else error1("Mem to Mem not allowed by x86-CPU");
    prs(", ");
    if (mod1 == 2) a(idx2);
    else {
      if (idw2 == 1) prs("byte ");
      if (idw2 == 2) prs("word ");
      if (idw2 == 4) prs("dword ");
      v(idx2);
      if (idx2 >= LSTART) { i=adrofname(idx2);  prs("; "); prs(i); }  }
    return;
  } error1("Internal error: only const or reg allowed");
}
char ops[5];
int doreg1(int iscmp1) { int i;
  if (istoken('='))          strcpy(ops, "mov");
  if (istoken(T_PLUSASS))    strcpy(ops, "add");
  if (istoken(T_MINUSASS))   strcpy(ops, "sub");
  if (istoken(T_ANDASS))     strcpy(ops, "and");
  if (istoken(T_ORASS))      strcpy(ops, "or" );
  if (istoken(T_LESSLESS))   strcpy(ops, "shl");
  if (istoken(T_GREATGREAT)) strcpy(ops, "shr");
  if (iscmp1 == 1) { token=getlex();
      if (isrelational() ==0) error1("Relational expected");
      strcpy(ops, "cmp"); }
  prnl(); prs(ops); prs("  "); printreg(ireg1); prs(", ");

  if (istoken(T_CONST)) {prunsign1(lexval); goto reg1;}
  mod2=typeName(); ireg2=checkreg();
  if (ireg2) {printreg(ireg2); goto reg1;}
  i=searchname();  if (mod2 == 2) a(i); else v(i);
  reg1: if (iscmp1 == 1) {cmpneg(0); prs(fname); expect(')'); }
}
int checkreg() { // >=17 = 16bit, >=47 = 32bit
  if (strlen(symbol) <  2) return 0;
  if (eqstr(symbol,"al")) return 1;   if (eqstr(symbol,"cl")) return 3;
  if (eqstr(symbol,"dl")) return 5;   if (eqstr(symbol,"bl")) return 7;
  if (eqstr(symbol,"ah")) return 9;   if (eqstr(symbol,"ch")) return 11;
  if (eqstr(symbol,"dh")) return 13;  if (eqstr(symbol,"bh")) return 15;
  if (eqstr(symbol,"ax")) return 17;  if (eqstr(symbol,"cx")) return 19;
  if (eqstr(symbol,"dx")) return 21;  if (eqstr(symbol,"bx")) return 23;
  if (eqstr(symbol,"sp")) return 25;  if (eqstr(symbol,"bp")) return 27;
  if (eqstr(symbol,"si")) return 29;  if (eqstr(symbol,"di")) return 31;
  if (eqstr(symbol,"es")) return 33;  if (eqstr(symbol,"cs")) return 35;
  if (eqstr(symbol,"ss")) return 37;  if (eqstr(symbol,"ds")) return 39;
  if (eqstr(symbol,"fs")) return 41;  if (eqstr(symbol,"gs")) return 43;
  // (eqstr(symbol,"ip")) return 45;
  if (strlen(symbol) >   3) return 0;
  if (eqstr(symbol,"eax")) return 47; if (eqstr(symbol,"ecx")) return 50;
  if (eqstr(symbol,"edx")) return 53; if (eqstr(symbol,"ebx")) return 56;
  if (eqstr(symbol,"esp")) return 59; if (eqstr(symbol,"ebp")) return 62;
  if (eqstr(symbol,"esi")) return 65; if (eqstr(symbol,"edi")) return 68;
  if (eqstr(symbol,"cr0")) return 71;
  return 0;   }
char printregstr[]
="*alcldlblahchdhbhaxcxdxbxspbpsidiescsssdsfsgsipeaxecxedxebxespebpesiedicr0";
//          1         2         3         4         5         6         7
// 1 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3 5 7 901 3
int printreg(int i) {  unsigned int k; unsigned char c;
  k = &printregstr + i; c=*k; prc(c); i++;
  k = &printregstr + i; c=*k; prc(c);
  if (i > 47) { i++; k = &printregstr + i; c=*k; prc(c); }
}
int evalue=0; int exprtype=10;// 0=V, 4=const left, 3=const right
int expr(int isRight)
{ int mode; int id1;     int ixarr; int ixconst;
  int ids;  int isCONST; int i;     unsigned char *p;
  if (istoken(T_CONST)) { evalue=lexval;
    prs("\n mov ax, "); prunsign1(lexval); return 4; }
  mode=typeName(); /*0=V,1=*,2=&*/
  ireg1=checkreg();
  if (ireg1) { doreg1(0); return; }
  if (token=='(')  {docall1(); goto e1; }
  if (isreg()) goto e1;

  id1=searchname(); gettypes(id1); ids=signi;
  ixarr=0;  ixconst=0;
    if (istoken('[')) { if (istoken(T_CONST)) {
      ixconst=1; ixarr=lexval; expect(']');  }
    else {ixarr=searchname(); expect(T_NAME); expect(']');
    gettypes(ixarr);
    if (widthi != 2) error1("Arrayindex muss Zahl oder int sein"); } }
  if (istoken(T_PLUSPLUS  )) {if(mode)error1("Nur var erlaubt");
     prs("\n inc  "); if (wi==2) prs("word"); else prs("byte");
     v(id1); goto e1;}
  if (istoken(T_MINUSMINUS)) {if(mode)error1("Nur var erlaubt");
     prs("\n dec  "); if (wi==2) prs("word"); else prs("byte");
     v(id1); goto e1;}
       
  if (istoken(T_PLUSASS   )) {compoundass("add", mode, id1); goto e1;}
  if (istoken(T_MINUSASS  )) {compoundass("sub", mode, id1); goto e1;}
  if (istoken(T_ANDASS    )) {compoundass("and", mode, id1); goto e1;}
  if (istoken(T_ORASS     )) {compoundass("or" , mode, id1); goto e1;}    
  if (istoken(T_MULASS    )) {error1("not implemented");}
  if (istoken(T_DIVASS    )) {error1("not implemented");}

  if (istoken('=')) { exprtype= expr(1); 
  doassign(mode, id1, ixarr, ixconst); goto e1;  }
  dovar1(mode, "mov", ixarr, id1);
  
e1:    if (istoken('+')) rterm("add");
  else if (istoken('-')) rterm("sub" );
  else if (istoken('&')) rterm("and" );
  else if (istoken('|')) rterm("or" );  
  else if (istoken(T_LESSLESS)) rterm("shl");
  else if (istoken(T_GREATGREAT)) rterm("shr");  
  else if (istoken('*')) domul (ids);
  else if (istoken('/')) doidiv(ids);
  else if (istoken('%')) domod (ids);
  if (isrelational()) { rterm("cmp"); cmpneg(ids);}
  return 0;
}

int compoundass(char *op, int mode, int id1) {
  if(mode) error1("only scalar Var allowed");
  prnl(); prs(op); prs("  "); 
  gettypes(id1); if (wi==2) prs("word"); else prs("byte");
  v(id1); prs(", ");
  expect(T_CONST); prunsign1(lexval);
}
int dovar1(int mode, int op, int ixarr, int id1) { 
  gettypes(id1);
  if (mode==1) {prs("\n mov bx, "); v(id1); prnl(); prs(op);
    if(widthi == 1) prs(" al, [bx]\n mov ah, 0");
    if(widthi == 2) prs(" ax, [bx]");
    return; }
  if (mode==2){prnl();prs(op);prs(" ax, "); a(id1); return; }
  if (ixarr) {
    prs("\n mov bx, "); v(ixarr);
    if (wi==2) prs("\n shl bx, 1");
    prs("\n "); prs(op);
    if (wi==2) prs(" ax, "); else prs(" al, ");
// v(id1); prs(" [bx]");
    prc('['); printName(id1); prs(" + bx]"); 
    return; }
  prnl();prs(op);
  if(wi==1) prs(" al, ");
  if(wi==2) prs(" ax, ");
  if(wi==4) prs(" eax, ");
  v(id1);
}
int rterm(char *op) {int mode; int opint; int ixarr; int id1;
  if (istoken(T_CONST)) { prnl(); prs(op); 
    if (wi==1) prs(" al, ");
    if (wi==2) prs(" ax, ");
    if (wi==4) prs(" eax, ");
    prunsign1(lexval); return;}
  mode=typeName(); id1=searchname(); ixarr=0;
  if (istoken('[')) { ixarr=searchname(); expect(T_NAME); expect(']');  
    gettypes(ixarr);
    if (widthi != 2) error1("Arrayindex muss int sein"); }
  if (eqstr(symbol,"_AX")) return;
  opint=op; dovar1(mode, opint, ixarr, id1);
}
int isreg() {
  if (eqstr(symbol,"_AH")) {doreg("ah"); goto r1;}
  if (eqstr(symbol,"_AL")) {doreg("al"); goto r1;}  
  if (eqstr(symbol,"_AX")) {doreg("ax"); goto r1;}
  if (eqstr(symbol,"_BH")) {doreg("bh"); goto r1;}
  if (eqstr(symbol,"_BL")) {doreg("bl"); goto r1;}
  if (eqstr(symbol,"_BX")) {doreg("bx"); goto r1;}    
  if (eqstr(symbol,"_CH")) {doreg("ch"); goto r1;}
  if (eqstr(symbol,"_CL")) {doreg("cl"); goto r1;}
  if (eqstr(symbol,"_CX")) {doreg("cx"); goto r1;}    
  if (eqstr(symbol,"_DH")) {doreg("dh"); goto r1;}
  if (eqstr(symbol,"_DL")) {doreg("dl"); goto r1;}
  if (eqstr(symbol,"_DX")) {doreg("dx"); goto r1;}  
  if (eqstr(symbol,"_SI")) {doreg("si"); goto r1;}
  if (eqstr(symbol,"_DI")) {doreg("di"); goto r1;}
  if (eqstr(symbol,"_FLAGS")) {doreg("flags"); goto r1;}  
  return 0;   r1: return 1; 
}
int doreg(char *dr) { int i; expect('=');
  prs("\n mov  "); prs(dr); prs(", ");
       if (istoken(T_CONST)) prunsign1(lexval);
  else if (istoken(T_NAME )) { i=searchname(); v(i); }
  else error1("only number or var allowed"); }

int doassign(int mode, int i, int ixarr, int ixconst) {
  gettypes(i);
  if (mode==1) {prs("\n mov  bx, ");v(i);                  
    if (widthi == 2) prs("\n mov  [bx], ax");
    else  prs("\n mov  [bx], al"); return;}
  if (mode==2) {prs("\n mov  ");a(i); prs(", ax"); return;}
  if (ixarr) {  prs("\n mov bx, ");
    if(ixconst) prunsign1(ixarr); else v(ixarr);
    if (wi==2) prs("\n shl bx, 1");
    prs("\n mov ["); printName(i);
    if (wi==2) prs("+bx], ax"); else prs("+bx], al"); return; }
  if (wi==1){prs("\n mov ");if(i<LSTART) {prs("byte ");
    } v(i); prs(", al"); return; }
  if (wi==2){prs("\n mov ");if(i<LSTART) {prs("word ");
    } v(i); prs(", ax"); return; }
  if (wi==4){prs("\n mov ");if(i<LSTART) {prs("dword ");
    } v(i); prs(", eax"); return; }
}
int domul(int ids) {
  if (ids) rterm("imul"); else {
  if (istoken(T_CONST)) {prs("\n mov bx, "); prunsign1(lexval); prs("\n mul bx"); }
  else error1("with MUL only const number as multiplicator allowed"); } }
int doidiv(int ids) { int mode; int id1;
  if (istoken(T_CONST)) {
    prs("\n mov bx, "); prunsign1(lexval);
    if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
  else {
    mode=typeName(); id1=searchname();
    if (mode) error1("only const number or int as divisor allowed");
    gettypes(id1);
    if (typei) error1("only int as simple var divisor allowed");
    if (wi!=2) error1("only int, no byte as divisor allowed");
    prs("\n mov bx, "); v(id1);
    if (ids) prs("\n cwd\n idiv bx"); else prs("\n mov dx, 0\n div bx"); }
}
int domod(int ids) { doidiv(ids); prs("\n mov ax, dx"); }

int docalltype[10]; int docallvalue[10];
char procname[17]; // 1=CONST, 2=String, 3=&, 4=Name 5=register
int docall1() {int i; int narg; int t0; int n0;  int sz32;
  narg=0;  sz32=0;
  checknamelen();
  strcpy(&procname, symbol);
  storecall();
  expect('(');
	if (istoken(')') ==0 ) {
	  do { narg++;
	    if (narg >9 ) error1("Max. 9 parameters");  t0=0;
      if(istoken(T_CONST)) {t0=1; n0=lexval; }
      if(istoken(T_STRING)){t0=2; n0=nconst;
        eprs("\n"); eprs(fname); eprc(95);eprnum(nconst);eprs(" db ");
        eprc(34);eprs(symbol);eprc(34);eprs(",0"); nconst++; }
      if(istoken('&'))     {t0=3; name1(); n0=searchname();}
      if(istoken(T_NAME))  { n0=checkreg();
        if (n0) t0=5;
        else {t0=4; n0=searchname();
          p1=&GType; p1=p1+n0; if (*p1=='&') t0=3; }  }
      if (t0==0) error1("parameter not recognized (no * allowed)");
      docalltype [narg] = t0;
      docallvalue[narg] = n0;
    } while (istoken(','));
    
  	expect(')');  i=narg;
    do {
      t0 = docalltype [i];
      n0 = docallvalue[i];     
      if(t0==1){ prs("\n push "); prunsign1(n0);}
      if(t0==2){ prs("\n push "); 
        prs(fname);prc(95);prunsign1(n0);}
      if(t0==3){ prs("\n lea  ax, ");   v(n0);
        prs("\n push ax");}
      if(t0==4){ gettypes(n0); 
        if(wi==2) { prs("\n push word "); v(n0);}
        else { prs("\n mov al, byte ");   v(n0);
        prs("\n mov ah, 0\n push ax"); } }
      if(t0==5){ prs("\n push "); printreg(n0); if (n0 >= 47) sz32+2;  }
   i--; } while (i > 0);  }
	 prs("\n call "); prs(&procname);
	 if (narg>0) {prs("\n add  sp, ");
     narg=narg+narg; narg=narg+sz32; prunsign1(narg); } }
/****************************************************************************/
int main() {
  getarg();
  setblock(4096);
  if (DOS_ERR) error1("SetBlock , AX=");
  segE=allocmem(4096);
  if (DOS_ERR)  error1("alloc memory, AX=");
  CNameTop=0;
  getfirstchar();
  parse();
  checkcalls(); epilog();
}
int getfirstchar() { fgetsp=&fgetsdest; *fgetsp=0; thechar=fgets1(); }
char *arglen=0x80; char *argv=0x82;
int getarg() { int arglen1; int i; char *c;
  arglen1=*arglen;
  if (arglen1) { i=arglen1+129; *i=0; }
  else { cputs(Version1); cputs(" Usage: A.COM in_file[.C]: ");
    DOS_NoBytes=readRL(argv, 0, CMDLENMAX); c=DOS_NoBytes+128; *c=0; prnl(); }
  strcpy(namein, argv);
  if (instr1(namein, '.') == 0) strcat1(namein, ".C");
  toupper(namein);
  strcpy(namelst, namein); i=strlen(namelst); i--; c=&namelst+i; *c='S';
 
  fdin=openR (namein);
  if(DOS_ERR){cputs("Source file missing (.C): "); cputs(namein); exitR(1); }
  fdout=creatR(namelst);
  if(DOS_ERR){cputs("list file not creatable: ");cputs(namelst);exitR(2);}
  prs("\n; ");prs(Version1);
  prs(", Source: "); prs(namein);  prs(", Output asm: "); prs(namelst);
  prs("\norg  256 \njmp main"); 
}
int parse() { token=getlex(); do {
    if (token <= 0) return 1;
    if (istoken('#')) {
      if (istoken(T_DEFINE)) dodefine();
      else if (istoken(T_INCLUDE)) doinclude();
      else error1("define or include expected");  }
    else{ typeName();  if (token=='(') dofunc();  else doglob(); }
  } while(1);
}
int checkcalls() { int i; int j; int k;
  prs("\n \n; missing functions: ");
  i=0;  k=0;
  while (i < CTop) {
    pt=CAdr[i];
    from_far(NameA, pt);
    j=0;
    do { p1=adrF(FNameField, j);
      if (eqstr(NameA, p1)){ CType[i]=1; j=FTop; }
      j++; } while (j < FTop);
    if (j == FTop) { k++; prs("\n; "); prs(NameA); }
    i++; }
  prs("\n; Number of unresolved CALLs :"); printint51(k);
  if (k!=0) error1("At least 1 function is missing! "); 
    else prs(" All FUNCTIONs in place");
}

int doinclude() { int fdtemp;
  if (token==T_STRING) {  fdtemp=fdin;
  prs("\n;Use include file: "); prs(symbol);
  fdin=openR(symbol);
  if (DOS_ERR !=0) {prs("Include file missing: "); prs(symbol);
    error1(" Stop!!"); }
  linenoinclude=lineno; lineno=1;
  parse(); lineno=linenoinclude;
  fdin=fdtemp; prs("\n;Back to main program: "); prs(namein);
  getfirstchar(); token=getlex(); }
}
int dodefine() { int i; int j; int fdtemp;
  if (eqstr(symbol, "ORGDATA")) {token=getlex();
    ORGDATAORIG=lexval; orgData=lexval; return; }
  if (eqstr(symbol, "ARCHIVE")){token=getlex();  if (token==T_STRING) {
    prs("\n;Use archive file: ");
    strcpy(archivename, symbol); prs(archivename);
    } else error1("Name of archive file missing"); token=getlex(); return;}
   expect(T_NAME);
  if (token==T_CONST) { 
    if (GTop >= LSTART) error1("global table (define) full");
    i=strlen(symbol); if (i>15) error1("Define name longer 15 char");
    GSign [GTop]='U'; GWidth[GTop]=1; GType [GTop]='#';
    GAdr [GTop]=lineno-1; GUsed [GTop]=0;
    pt=adrofname(GTop); strcpy(pt, symbol); GData[GTop]=lexval;
    expect(T_CONST); GTop++;  } 
}
int stmt() { int c; char cha;
       if(istoken('{'))     {while(istoken('}')==0) stmt();}
  else if(istoken(T_IF))    doif();
  else if(istoken(T_DO))    dodo();
  else if(istoken(T_WHILE)) dowhile();
  else if(istoken(T_GOTO))  {prs("\n jmp .");name1();prs(symbol);expect(';');}
  else if(token==T_ASM)     {prs("\n"); c=next();
        while(c != '\n') { prc(c);	c=next(); }; token=getlex(); }
  else if(istoken(T_ASMBLOCK)) { if (token== '{' )  { prs("\n"); cha=next();  
        while(cha!= '}') { prc(cha); cha=next(); }
        token=getlex(); }
        else error1("Curly open expected"); 
        }
  else if(istoken(T_EMIT))   doemit();
  else if(istoken(';'))      { }
  else if(istoken(T_RETURN)) {
        if (token!=';') exprstart();
        prs("\n jmp .retn"); 
        prs(fname);
        nreturn++; 
        expect(';');
        }
  else if(thechar==':')      {
        prs("\n."); // Label
        prs(symbol); prc(':');  
        expect(T_NAME); 
        expect(':'); 
        }
  else  {exprstart(); expect(';'); } 
}

int doemit() {prs("\n db ");
  L1: token=getlex(); prunsign1(lexval); token=getlex();
    if (token== ',') {prc(','); goto L1;} expect(')'); }

int cmpneg(int ids) {
       if(iscmp==T_EQ) prs("\n jne .");         //ZF=0
  else if(iscmp==T_NE) prs("\n je  .");         //ZF=1
  else if(iscmp==T_LE) if (ids) prs("\n jg  .");//ZF=0      SF =OF
                           else prs("\n ja  .");//ZF=0 CF=0
  else if(iscmp==T_GE) if (ids){prs(" ;unsigned : "); prunsign1(ids);
                               prs("\n jl  .");}//          SF!=OF
                           else{prs(" ;unsigned : "); prunsign1(ids);
                               prs("\n jb  .");}//jb=jc=CF=1
  else if(iscmp=='<' ) prs("\n jge .");         //          SF =OF
  else if(iscmp=='>' ) prs("\n jle .");         //ZF=1 oder SF!=OF
  else error1("internal error compare unknown in CMPNEG()");  }

int prlabel(int n) {prs("\n."); prs(fname); prunsign1(n); prc(':'); }
int prjump (int n) {prs("\n jmp ."); prs(fname); prunsign1(n); }
int doif() {int jdest; int tst; pexpr(); nlabel++; jdest=nlabel;
  pint1(jdest); stmt();
  if (istoken(T_ELSE)) { nlabel++; tst=nlabel;
    prjump(tst); prlabel(jdest); stmt(); prlabel(tst); }
  else prlabel(jdest); }

int dodo() {int jdest; int jtemp;
  nlabel++; jdest=nlabel; prlabel(jdest); stmt();
  expect(T_WHILE); pexpr(); nlabel++; jtemp=nlabel; pint1(jtemp);
  prjump(jdest); prlabel(jtemp); }
int dowhile() {int jdest; int tst; nlabel++; jdest=nlabel;
  prlabel(jdest); pexpr(); nlabel++; tst=nlabel; pint1(tst);
  stmt(); prjump(jdest); prlabel(tst); }
int isrelational() {
  if (token==T_EQ) goto w; if (token==T_NE) goto w;
  if (token==T_LE) goto w; if (token==T_GE) goto w;
  if (token=='<' ) goto w; if (token=='>' ) goto w;
  return 0;  w: iscmp=token; token=getlex(); return 1;}
 
char symboltemp[80];    
int getlex() { char c; char *p; 
g1: c=next(); if (c == 0) return 0; if (c <= ' ') goto g1;
  if (c=='=') {if(thechar=='=') {next(); return T_EQ; }}
  if (c=='!') {if(thechar=='=') {next(); return T_NE; }}
  if (c=='<') {if(thechar=='=') {next(); return T_LE; }}
  if (c=='>') {if(thechar=='=') {next(); return T_GE; }}
  if (c=='<') {if(thechar=='<') {next(); return T_LESSLESS;  }}
  if (c=='>') {if(thechar=='>') {next(); return T_GREATGREAT;}}
  if (c=='+') {if(thechar=='+') {next(); return T_PLUSPLUS;  }}
  if (c=='-') {if(thechar=='-') {next(); return T_MINUSMINUS;}}
  if (c=='+') {if(thechar=='=') {next(); return T_PLUSASS;   }}
  if (c=='-') {if(thechar=='=') {next(); return T_MINUSASS;  }}
  if (c=='&') {if(thechar=='=') {next(); return T_ANDASS;    }}
  if (c=='|') {if(thechar=='=') {next(); return T_ORASS;     }}    
  if (c=='*') {if(thechar=='=') {next(); return T_MULASS;    }}
  if (c=='/') {if(thechar=='=') {next(); return T_DIVASS;    }}        
  if (instr1("()[]{},;*:%-><=+!&|#?", c)) return c ;
  if (c == '/') { if (thechar == '/') {
      do c=next(); while(c != 13); /* c=next(); */ return getlex(); } }
  if (c == '/') { if (thechar == '*') {
      g2: c=next(); if (c != '*') goto g2; if (thechar != '/') goto g2;
      c=next(); return getlex(); } else  return '/'; }
  if (c == '"') {getstring(c); return T_STRING;}
  if (digit(c)) { getdigit(c); return T_CONST; }
  if (c==39) { lexval=next();
    if (lexval==92) {lexval=next();
      if (lexval=='n') lexval=10; if (lexval=='t') lexval= 9;
      if (lexval=='0') lexval= 0; } next(); return T_CONST; }
  if (alnum(c)) { 
    strcpy(symboltemp, symbol); p=&symbol;  *p=c;  p++;
    while(alnum(thechar)) {c=next(); *p=c;  p++; } 
      *p=0;
    if (eqstr(symbol,"signed"  )) return T_SIGNED;
    if (eqstr(symbol,"unsigned")) return T_UNSIGNED;
    if (eqstr(symbol,"void"    )) return T_VOID;
    if (eqstr(symbol,"int"     )) return T_INT;
    if (eqstr(symbol,"long"    )) return T_LONG;
    if (eqstr(symbol,"char"    )) return T_CHAR;
    if (eqstr(symbol,"asm"     )) return T_ASM;
    if (eqstr(symbol,"__asm"   )) return T_ASMBLOCK;
    if (eqstr(symbol,"__emit__")) return T_EMIT;
    if (eqstr(symbol,"return"  )) return T_RETURN;
    if (eqstr(symbol,"if"      )) return T_IF;
    if (eqstr(symbol,"else"    )) return T_ELSE;
    if (eqstr(symbol,"while"   )) return T_WHILE;
    if (eqstr(symbol,"do"      )) return T_DO;
    if (eqstr(symbol,"goto"    )) return T_GOTO;
    if (eqstr(symbol,"define"  )) return T_DEFINE;   
    if (eqstr(symbol,"include" )) return T_INCLUDE;   
    if (convertdefine() ) {strcpy(symbol, symboltemp); return T_CONST;}
    return T_NAME; } error1("Input item not recognized"); }

int convertdefine() { int i; int j;   i=0;
  while (i < GTop) {
   j=adrofname(i); 
   if (eqstr(symbol,j)) { if (GType[i]=='#') { lexval=GData[i];
   return T_CONST; } }
   i++; } 
   return 0; }
int getdigit(char c) { int i;
    lexval=0; lexval=c-'0'; // lexval=int hi=0, c=char
    if (thechar=='x') thechar='X'; if (thechar=='X') { next();
      while(alnum(thechar)) { c=next(); if(c>96) c=c-39;
	if (c>64) c=c-7; c=c-48; lexval=lexval << 4; // * 16
     i=0; i=c; lexval=lexval+i;}
    }else { while(digit(thechar)) { c=next(); c=c-48; lexval=lexval*10; 
     i=0; i=c; lexval=lexval+i; } } 
}
int getstring(int delim) {int c; char *p;  p=&symbol; c=next();
  while (c != delim) {*p=c; p++; c=next(); } *p=0; }

int next() {char r; r = thechar; globC=r; thechar = fgets1(); return r; }
int istoken(int t) {if (token == t) { token=getlex(); return 1; } return 0;}
int expect(int t) {if (istoken(t)==0) { *cloc=0; prs(co); listproc();
  prs("\nExpected ASCII(dez): "); pint1(t); error1(" not found"); } }

int eprc(char c)  {*cloc=c; cloc++; }
int eprs(char *s) {char c;  while(*s) { c=*s; eprc(c); s++; } }
int prc(unsigned char c) { 
  if (c==10) {_AX=13; writetty(); }
  _AL=c; writetty(); 
  fputcR(c, fdout); 
  }
int prscomment(unsigned char *s) {unsigned char c;
  while(*s){c=*s;prc(c);s++;} }
int prnl() { prs("\n ");}

int prs(unsigned char *s) {unsigned char c; int com; com=0;
  while(*s) { c=*s; if (c==34) if (com) com=0; else com=1;
    if (c==92) { if (com==0) { s++; c=*s;
          if (c=='n') c=10; if (c=='t') c= 9;
    } } prc(c); s++;  } }
int eprnum(int n){int e; if(n<0) { eprc('-'); n=mkneg(n); }
  if (n >= 10) {e=n/10; eprnum(e);}  n=n%10; n=n+'0'; eprc(n); }
int pint1 (int n){int e; if(n<0) {  prc('-');  n=mkneg(n); }
  if (n >= 10) {e=n/10;  pint1(e);}  n=n%10; n += '0'; prc(n); }  
int prunsign1(unsigned int n) { unsigned int e;
  if ( _ n >= 10) {  e=n/10; prunsign1(e); }
    n = n % 10; /*unsigned mod*/   n += '0'; prc(n); }  
int printint51(unsigned int j)  {
  if (j<10000) prc(32); if (j<1000) prc(32);  if (j<100) prc(32);
   if (j<10) prc(32);  prunsign1(j); }

int fgets1() { char c; c=*fgetsp;
  if (c==0) { printinputline(); if (DOS_NoBytes == 0) return 0;
    fgetsp=&fgetsdest; c=*fgetsp; spalte=0; }
  fgetsp++; spalte++;  return c; }
int printinputline() { fgetsp=&fgetsdest;
  do {DOS_NoBytes=readRL(&DOS_ByteRead, fdin, 1);
  if (DOS_NoBytes == 0) return; 
    *fgetsp=DOS_ByteRead; fgetsp++;} 
  while (DOS_ByteRead != 10); *fgetsp=0;
    if (fdout) { prs("\n\n;-"); prunsign1(lineno); prc(' '); lineno++;
      prscomment(&fgetsdest);}
}
int end1(int n) {fcloseR(fdin); fcloseR(fdout); exitR(n); }
int error1(char *s) { 
  lineno--;
  prnl(); prscomment(&fgetsdest);
  prs(";Line: "); prunsign1(lineno);
  prs(" ************** ERROR: "); prs(s);
  prs("  in column: "); prunsign1(spalte);
  prs("\nToken: "); prunsign1(token); prs(", globC: "); prc(globC);
  prs(", thechar: "); prunsign1(thechar); prs(", symbol: "); prs(symbol);
  end1(1); }
int listproc() {int i; 
  if (LTop > LSTART) {
  prs("\n;Function : "); prs(fname);
  prs(", Number of local variables: "); i=LTop - LSTART; prunsign1(i);
  prs("\n;   # type sign width addr used name   list of local variables");
    i=LSTART; 
    while (i < LTop) { listvar(i); i++; } } 
}
int listvar(unsigned int i) {unsigned int j; char c;
  prs("\n;"); printint51(i); prc(32);
  c=GType [i]; if(c=='V')prs("var ");   if(c=='*')prs("ptr ");
               if(c=='&')prs("arr ");   if(c=='#')prs("def ");
  c=GSign [i]; if(c=='S')prs("sign ");  if(c=='U')prs("unsg ");
  c=GWidth[i]; if(c==  1)prs("byte " ); if(c==  2)prs("word " );
               if(c==  4)prs("dwrd " );
  j=GAdr[i]; printint51(j);
  j=GUsed[i]; if (j) printint51(j);
  else {if(GType[i]=='#') prs("    -"); else prs(" NULL");}
  prc(32);  pt=adrofname(i); prs(pt);
  if(GType[i]=='#') { prc('='); j=GData[i]; prunsign1(j); }
  if(GType[i]=='&') { prc('['); j=GData[i]; prunsign1(j); prc(']');}
  if (i >= LSTART) { prs(" = bp"); j=GData[i];
    if (j > 0) prc('+'); pint1(j);  }
}
int listcall() { int i;
  prs("\n\n;    #  addr name   list of CALLs\n");
  i=0;  while (i< CTop) { calllisting(i); i++; } }
int calllisting(int i) {char c; int j;
  prs("\n;"); printint51(i); prc(32);
  c=CType [i]; if(c==0)prs("unresolved ");
  j=CAdr[i];            printint51(j); prc(32);
  from_far(NameA, j);   prs(NameA);
}
int countcalls(int f) { unsigned int i;
  pt=adrF(FNameField, f);
  i=0;  while (i < CTop) {
    p1=CAdr[i];
    from_far(NameA, p1);
    if (eqstr(pt,NameA))  FCalls[f] = FCalls[f] + 1;
    i++; }
}
int listfunc() { int i;
  prs("\n\n\n;   # Calls Line Width  Name   list of functions\n");
  i=0;  while (i < FTop) { countcalls (i); i++; } 
  i=0;  while (i < FTop) { funclisting(i); i++; } }
int funclisting(int i) {int j;  char c;
  prs("\n;");    printint51(i);
  j = FCalls[i]; if (j) printint51(j); else prs(" NULL");
  j = FAdr[i];   printint51(j); prc(32);
  c=FType[i];
  if(c=='V')prs("void " );    if(c=='B')prs("byte " );
  if(c=='W')prs("word " );    if(c=='D')prs("dwrd " );
  prc(32); prc(32);
  pt=adrF(FNameField, i); prs(pt);
}
unsigned int MAXUI=65535;
int epilog() {unsigned int i; 
  strcpy(symbol, "LastFunctionByt");  storefunc();
  prs("\nLastFunctionByt:db 0E8h, 0, 0\npop ax\nret");
  prs("\n \n;   # type sign width  adr used name   list of global variables\n");
  i=1;
  while (i< GTop) { listvar(i); i++; }
  listfunc();   listcall();

  prs("\n;Input: "); prs(&namein);
  prs(", List: ");   prs(&namelst);
  prs(",  Lines:"); printint51(lineno);
  prs("\n;Glob. variables:"); GTop--; printint51(GTop);
  prs(" max.:"); printint51(LSTART);
  prs("\n;Functions      :"); printint51(FTop);
  prs(" max.:"); printint51(FUNCMAX);
  prs("\n;Calls          :"); printint51(CTop);
  prs(" max.:"); printint51(CALLMAX);
  prs(", NameField:"); printint51(CNameTop);
  prs(" max.:"); printint51(65535);
//  prs(", segE:"); printint51(segE);
  __asm{call LastFunctionByt}  _ i=ax;
  prs("\n;Code until     :"); printint51(i);
  prs(" max.: "); printint51(ORGDATAORIG); i=ORGDATAORIG-i; prs(", free:");
  printint51(i); if (i <= 1000)prs(" *** Warning *** Code area too small");
  prs("\n;Data (HeapEnd) :"); prunsign1(orgData); i=MAXUI-orgData;
  prs(", resting stacksize: ");printint51(i);
  if (i <= 5000) prs(" *** Warning *** Stack too small");
  prs("\n;Max. Const in '"); prs(coname); prs("' :"); printint51(maxco);
  prs(" max."); printint51(COMAX); i=COMAX; i=i-maxco; prs(", free:");
  printint51(i);if (i <= 1000)prs(" *** Warning *** constant area too small");
  end1(0);}
// while(expr) stmt; do stmt while(expr); FOR: i=0; while(i<10){stmt; i++;}
int setblock(unsigned int i) {
  DOS_ERR=0; _BX=i; _ ax=cs; _ es=ax; _AX=0x4A00; DosInt(); }
int allocmem(unsigned int i) { unsigned int vAX; unsigned int vBX;
  DOS_ERR=0; _BX=i;  _AX=0x4800; DosInt(); _ vAX=ax; _ vBX=bx;
  if(DOS_ERR) return vBX;   return vAX;
}
int copyF(char *dest, char *src, unsigned int sz) {
  segE;  _ es=ax;  _ si=src;  _ di=dest; _ cx=sz;  // ds:si   es:di
  asm cld
  asm rep movsb
  asm mov byte [es:di], 0
}
int to_far(char *dest, char *src) {
  segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
  asm cld
  do{
  asm lodsb  ; inc si
  asm stosb  ; inc di
  } while (al != 0);
}
int from_far(char *dest, char *src) {
  segE;  _ es=ax;  _ si=src;  _ di=dest;  // ds:si   es:di
  do{
  asm mov al, [es:si]
  asm inc si
  asm mov [di], al
  asm inc di
  } while (al != 0);
}
