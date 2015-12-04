> PROCEDURE pkill   !(status=) zabitie palka
$P>
num&=BYTE{m%}
SELECT num&
CASE 12
FOR i&=32 TO 35
PUT x&,y&,palko$(i&)
~Delay(3)
NEXT i&
~Delay(10)
FOR i&=35 TO 39
PUT x&,y&,palko$(i&)
~Delay(4)
NEXT i&
~Delay(50)
CASE 13
y&=INT(y&/16)*16
FOR i&=40 TO 43
~Delay(4)
PUT x&,y&,palko$(i&)
NEXT i&
FOR i&=0 TO 16
SCROLL 0,-1,x&,y&,x&+15,y&+31
~Delay(3)
NEXT i&
COLOR 0
PBOX x&,y&,x&+15,y&+31
CASE 14
COLOR 0
PBOX x&,y&,x&+15,y&+5
GET x&,y&+32,x&+15,y&+63,array$
PUT x&,y&,palko$(44)
FOR i&=44 TO 46
ADD y&,5
PUT x&,y&,palko$(i&)
~Delay(4)
NEXT i&
~Delay(50)
COLOR 0
PBOX x&,y&,x&+15,y&+31
PUT x&,y&+17,array$
CASE 15,16,17
FOR i&=0 TO 7
PUT x&,y&,palko$(15)
~Delay(5)
PUT x&,y&,palko$(29)
~Delay(5)
NEXT i&
~Delay(10)
COLOR 0
PBOX x&,y&,x&+15,y&+31
ENDSELECT
f.3
DEC life&
x&=isx&
y&=isy&
IF life&>0
testxy
PUT x&,y&,palko$(teraz&*7-7)
f.2
ENDIF
RETURN
