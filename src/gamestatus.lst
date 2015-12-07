> PROCEDURE gamestatus !ak stlacim HELP pocas hry
$P<
f.3
FOR i&=0 TO 2
BMOVE bit%(0,i&),obrmem%(c&,i&),8480
NEXT i&
CLEARW #1
COLOR 7
BOX 0,0,319,211
COLOR 3
BOX 1,1,318,210
COLOR 6
BOX 2,2,317,209
f.2
COLOR 3
FOR i&=0 TO 20
LINE 220-i&*5,220-i&*5,320,220-i&*5
LINE 220+i&*5,60+i&*5,220+i&*5,220
NEXT i&
'
pis2(70,18,"-GAME STATUS.-",1,5)
pis2(4,47,"your score - "+STR$(body%),6,3)
pis(4,63,"<ivoty:",3)
pis(4,95,"laser:",3)
pis(4,127,"fixa[n= hmota:",3)
pis(4,159,"k;^[e:",3)
pis2(222,180,code$(level&-1),7,6)
'
FOR i&=0 TO MIN(life&-1,25)
PUT i&*8+4,64,vec$(0)
NEXT i&
FOR i&=0 TO MIN(laser&-1,25)
PUT i&*8+4,96,vec$(1)
NEXT i&
FOR i&=0 TO MIN(box&-1,25)
PUT i&*8+4,128,vec$(2)
NEXT i&
FOR i&=0 TO MIN(key&-1,25)
PUT i&*8+4,160,vec$(3)
NEXT i&
WHILE STRIG(3)=FALSE AND INKEY$=""
WEND
WHILE INKEY$<>""
WEND
CLR ink$
f.3
FOR i&=0 TO 2
BMOVE obrmem%(c&,i&),bit%(0,i&),8480
NEXT i&
f.2
RETURN
