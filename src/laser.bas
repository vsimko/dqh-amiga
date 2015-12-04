> PROCEDURE addlaser(x&,y&,vx&,vy&,type|)
LOCAL l&
INC las.num&                !add new laser
IF las.num&>las.max& OR las.num&<0
las.num&=0
ENDIF
l&=las.ptr&(las.num&)
las.x&(l&)=x&
las.y&(l&)=y&
las.lx&(l&)=x&
las.ly&(l&)=y&
las.vx&(l&)=vx&
las.vy&(l&)=vy&
RETURN
> PROCEDURE dellaser(num&)
LOCAL i&,free&
free&=las.ptr&(num&)
FOR i&=num& TO las.max&-1     !scroll pointers
las.ptr&(i&)=las.ptr&(i&+1)
NEXT i&
las.ptr&(las.max&)=free&      !last pointer is now free
DEC las.num&                  !delete one laser
RETURN
> PROCEDURE explode(a&,b&)
LOCAL i&,m%
FOR i&=0 TO 20
LINE a&+RAND(7)-3,b&+RAND(7)-3,a&+RAND(17)-8,b&+RAND(17)-8
NEXT i&
' ' f.1
b&=INT(y&/16)*16
m%=miesto%+INT(a&/16)+INT(b&/16+1)*20
IF BYTE{m%}=2         !exploding wall
SUB m%,20
a&=INT(a&/16)*16
b&=INT(b&/16)*16-16
WHILE BYTE{m%}=2
SUB m%,20
SUB b&,16
WEND
ADD m%,20
ADD b&,16
WHILE BYTE{m%}=2
BYTE{m%}=0
ADD m%,20
ADD b&,16
destroy(a&,b&)
WEND
ELSE IF BYTE{m%}>14   !ghost
zly&=BYTE{m%}-15
ghostkill
ENDIF
RETURN
> PROCEDURE movelaser
LOCAL m%,i&,l&
FOR i&=0 TO las.num&
l&=las.ptr&(i&)
ADD las.x&(l&),las.vx&(l&) !move in specified vector
ADD las.y&(l&),las.vy&(l&)
'
m%=miesto%+INT((las.x&(l&))/16)+INT((las.y&(l&))/16+1)*20
PUT las.x&(l&),las.y&(l&),las.img$(l&)    !new position
' PUT las.lx&(l&),las.ly&(l&),las.img$(l&)  !old position
'
las.lx&(l&)=las.x&(l&) !save old position
las.ly&(l&)=las.y&(l&)
'
' ------- check if laser hit the screen border or an object
IF las.x&(l&)>320 OR las.x&(l&)<-16 OR las.y&(l&)>220 OR las.y&(l&)<-16 OR BYTE{m%}<>0 OR BYTE{m%+1}<>0
IF BYTE{m%}<>0
COLOR 0
PBOX las.x&(l&),las.y&(l&),las.x&(l&)+15,las.y&(l&)+8
explode(las.x&(l&),las.y&(l&))
ELSE IF BYTE{m%+1}<>0
COLOR 0
PBOX las.x&(l&),las.y&(l&),las.x&(l&)+15,las.y&(l&)+8
explode(las.x&(l&)+16,las.y&(l&))
ENDIF
dellaser(i&)
i&=las.num&+2 !exit
ENDIF
NEXT i&
exit_movelaser:
RETURN
> PROCEDURE firelaser
$P<
'
' -------- IMPORTANT
' speed of laser is 6 - there shold be 6 blank pixels
' on each side ofthe projectile
' -------- IMPORTANT
'
IF laser&<>0 AND las.num&<las.max&
PUT x&,y&,palko$(teraz&*7-7)
WHILE @joyf<>2 AND @joyy=1
ink$=INKEY$
~Delay(1)
tim
WEND
IF @joyf=2
DEC laser&
IF teraz&=1                 !fire to right side
FOR i&=23 TO 24
PUT x&,y&,palko$(i&)
tim
~Delay(3)
tim
NEXT i&
addlaser(x&+16,y&+10,6,0,0)
ELSE                        !fire to left side
FOR i&=25 TO 26
PUT x&,y&,palko$(i&)
tim
~Delay(3)
tim
NEXT i&
addlaser(x&-4,y&+10,-6,0,0)
ENDIF
ENDIF
' PUT x&,y&,palko$(teraz&*7-7)
inpbufclr
ENDIF
RETURN
'
