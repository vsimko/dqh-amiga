> PROCEDURE teleport  !(status=)
$P<
LOCAL dd%
cc&=c&
PUT x&,y&,palko$(15)
~Delay(3)
FOR i&=47 TO 49
PUT x&,y&,palko$(i&)
~Delay(3)
tim
NEXT i&
COLOR 0
PBOX x&,y&,x&+15,y&+31
c&=tele&(0)
cast&=c&+1
x&=tele&(1)*16
y&=tele&(2)*16
IF cast&=11
newlevel
ENDIF
IF cc&<>c&
f.3
ENDIF
BMOVE miesto%,miesto%(cc&),260
FOR i&=0 TO 2
BMOVE bit%(0,i&),obrmem%(cc&,i&),8480
NEXT i&
CLR a$
FOR i&=0 TO 3
a$=a$+CHR$(sjvz&(i&))
NEXT i&
FOR i&=0 TO 2
a$=a$+CHR$(tele&(i&))
NEXT i&
FOR i&=0 TO 2
FOR ii&=0 TO 7
a$=a$+MKI$(dd&(i&,ii&))
NEXT ii&
NEXT i&
BMOVE @sadd(a$),(miesto%(cc&)+261),55
BMOVE miesto%(c&),miesto%,260
num&=BYTE{miesto%(c&)+260}
isy&=INT(num&/20)
isx&=num&-isy&*20
MUL isx&,16
MUL isy&,16
mem%=miesto%(c&)+261
CLR num&,a$
FOR i&=0 TO 3
sjvz&(i&)=BYTE{mem%+num&}
INC num&
NEXT i&
FOR i&=0 TO 2
tele&(i&)=BYTE{mem%+num&}
INC num&
NEXT i&
FOR i&=0 TO 2
FOR ii&=0 TO 7
dd&(i&,ii&)=WORD{mem%+num&}
ADD num&,2
NEXT ii&
NEXT i&
FOR i&=0 TO 2
BMOVE obrmem%(c&,i&),bit%(0,i&),8480
NEXT i&
CLR num&,a$
IF cc&<>c&
f.2
ENDIF
testxy
FOR i&=49 TO 47 STEP -1
PUT x&,y&,palko$(i&)
~Delay(5)
tim
NEXT i&
PUT x&,y&,palko$(15)
~Delay(5)
PUT x&,y&,palko$(teraz&*7-7)
RETURN
