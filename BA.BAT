A.COM A.C
if errorlevel 1 goto err
NASM.EXE -oANASM.COM -fbin -lANASM.LST -O1 -dPROC -dENDP A.S
AS A
:err