;PLA Compiler A.COM V1.2, Input: TEST.C, Output: TEST.S
org  256 
jmp main
;-1 int main() {


main: PROC
;-2 unsigned int j;

;-3 int k;

;-4 

;-5 }

;Function : main, Number local Var: 2
; # type sign width local variables
;1 var unsg word j = bp-2
;2 var sign word k = bp-4;
 ENTER  4,0
;-6 

 LEAVE
 ret
ENDP