A.COM A.C
if errorlevel 1 goto err
NASM.EXE -o A.COM -f bin -l A.LS -O1  A.S 
:err 