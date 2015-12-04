> PROCEDURE options !not included yet
$P<
win(0,0,320,208,15)
f.1
WHILE STRIG(3)=TRUE
WEND
WHILE STRIG(3)=FALSE
WEND
f.3
FOR i&=0 TO 2
BMOVE obrmem%(0,i&),bit%(0,i&),8480
NEXT i&
f.4
RETURN

