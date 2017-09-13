rem -o output file 
rem -O1 minimal optimization: jcc long, immediate byte
rem -t TASM compability mode
rem -l listing file
rem -Z error file ,not in this version
rem -d pre-define a macro  
rem --prefix _  global var in C
NASM.EXE -o A.COM -f bin -O1 -t -l A.LS A.S 