> PROCEDURE win(x1,y1,x2,y2,fast&) ! make gadget window
$P<
LOCAL f&,sx,sy,stx,sty,i&
x1=x1
x2=x2
y1=y1
y2=y2
f&=fast&-1
sx=(x2-x1)/2+x1
sy=(y2-y1)/2+y1
stx=(sx-x1)/f&
sty=(sy-y1)/f&
x1=sx
x2=sx
y1=sy
y2=sy
FOR i&=1 TO f&
x1=x1-stx
x2=x2+stx
y1=y1-sty
y2=y2+sty
COLOR 6
BOX x1-2,y1-2,x2+2,y2+2
COLOR 7
BOX x1-1,y1-1,x2+2,y2+2
COLOR 6
BOX x1-1,y1-1,x2+1,y2+1
COLOR 7
BOX x1,y1,x2+1,y2+1
COLOR 1
PBOX x1,y1,x2,y2
NEXT i&
RETURN

