> PROCEDURE effect(n|) ! screen effects
$P<
LOCAL i&
SELECT n|
CASE 0 !zaciatocne vyrolovanie
FOR i&=72 TO 244
SCROLL 0,-5,72,0,i&,200
SCROLL 0,5,i&+8,0,i&+15,200
NEXT i&
CASE 1 !vymazanie okienka v start menu skrz
COLOR 0
FOR i&=66 TO 246 STEP 2
LINE i&,64,i&,160
LINE 311-i&,64,311-i&,160
NEXT i&
ENDSELECT
RETURN

