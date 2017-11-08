A.COM A.C
if errorlevel 1 goto err
NASM.EXE -oA.COM -fbin -lA.LS -O1 -dPROC -dENDP A.S
REM AS A
:err
