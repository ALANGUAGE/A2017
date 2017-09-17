rem -O1 minimal optimization: jcc long, immediate byte
rem -l listing file
rem -Z error file ,not in this version
rem -d pre-define a macro  
rem --prefix _  global var in C
NASM.EXE -oA.COM -fbin -O1 -dENDP -dPROC -lA.LS A.S 