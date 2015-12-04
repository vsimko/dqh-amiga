> PROCEDURE fall.right
$P>
LOCAL statu&
IF poh&=0
m%=miesto%+INT((x&+7)/16)+INT(y&/16+2)*20
statu&=BYTE{m%}
IF statu&>0
ON statu& GOSUB nothing,nothing,destabil,hpn,door,teleport,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
GOTO exit_fall.right
ENDIF
IF BYTE{m%-19}=0 AND BYTE{m%-39}=0
FOR i&=0 TO 3
ADD x&,2
PUT x&,y&,palko$(30)
tim
NEXT i&
ELSE
FOR i&=3 TO 0 STEP -1
SUB x&,2
PUT x&,y&,palko$(i&)
COLOR 0
PBOX x&+15,y&,x&+17,y&+31
tim
NEXT i&
GOTO exit_fall.right
ENDIF
ELSE IF poh&>0
PUT x&,y&,palko$(30)
CLR poh&
ENDIF
teraz&=1
DO
stx&=@joyx
ink$=INKEY$
ADD y&,g
g=MIN((g+0.2),4)
IF stx&=1
ADD x&,2
m%=miesto%+INT(x&/16+1)+INT(y&/16)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
m%=miesto%+INT(x&/16+1)+INT(y&/16+1)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
m%=miesto%+INT(x&/16+1)+INT(y&/16+2)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,nothing,nothing,nothing
ELSE
IF stx&<>0
SUB y&,4
poh&=1
fall.left
GOTO exit_fall.right
ENDIF
ENDIF
m%=miesto%+INT(x&/16)+INT(y&/16+2)*20
IF BYTE{m%}<>0
IF BYTE{m%}<7
CLR poh&
y&=INT(y&/16)*16
PUT x&,y&,palko$(0)
stx&=@joyx
GOTO exit_fall.right
ENDIF
IF BYTE{m%}<12
pick
ENDIF
IF BYTE{m%}>11
pkill
ENDIF
ENDIF
m%=miesto%+INT(x&/16+1)+INT(y&/16+2)*20
IF BYTE{m%}<>0
IF BYTE{m%}<7
CLR poh&
y&=INT(y&/16)*16
PUT x&,y&,palko$(0)
stx&=@joyx
GOTO exit_fall.right
ENDIF
IF BYTE{m%}<12
pick
ENDIF
IF BYTE{m%}>11
pkill
ENDIF
ENDIF
PUT x&,y&,palko$(30)
IF y&>176 OR x&>300
scrnext
ENDIF
tim
LOOP
exit_fall.right:
g=3
RETURN
> PROCEDURE fall.left
$P>
LOCAL statu&
IF poh&=0
m%=miesto%+INT((x&+9)/16)+INT(y&/16+2)*20
statu&=BYTE{m%}
IF statu&>0
ON statu& GOSUB nothing,nothing,destabil,hpn,door,teleport,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
GOTO exit_fall.left
ENDIF
IF BYTE{m%-21}=0 AND BYTE{m%-41}=0
FOR i&=0 TO 3
SUB x&,2
PUT x&,y&,palko$(31)
tim
NEXT i&
ELSE
FOR i&=10 TO 7 STEP -1
ADD x&,2
PUT x&,y&,palko$(i&)
COLOR 0
PBOX x&-2,y&,x&,y&+31
tim
NEXT i&
GOTO exit_fall.left
ENDIF
ELSE IF poh&>0
PUT x&,y&,palko$(31)
CLR poh&
ENDIF
teraz&=2
DO
stx&=@joyx
ink$=INKEY$
ADD y&,g
g=MIN((g+0.2),4)
IF stx&=-1
SUB x&,2
m%=miesto%+INT(x&/16)+INT(y&/16)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
m%=miesto%+INT(x&/16)+INT(y&/16+1)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
m%=miesto%+INT(x&/16)+INT(y&/16+2)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,nothing,nothing,nothing
ELSE
IF stx&<>0
SUB y&,4
poh&=1
fall.right
GOTO exit_fall.left
ENDIF
ENDIF
m%=miesto%+INT(x&/16)+INT(y&/16+2)*20
IF BYTE{m%}<>0
IF BYTE{m%}<7
CLR poh&
y&=INT(y&/16)*16
PUT x&,y&,palko$(7)
stx&=@joyx
GOTO exit_fall.left
ENDIF
IF BYTE{m%}<12
pick
ENDIF
IF BYTE{m%}>11
pkill
ENDIF
ENDIF
m%=miesto%+INT(x&/16+1)+INT(y&/16+2)*20
IF BYTE{m%}<>0
IF BYTE{m%}<7
CLR poh&
y&=INT(y&/16)*16
PUT x&,y&,palko$(7)
' stx&=@joyx
GOTO exit_fall.left
ENDIF
IF BYTE{m%}<12
pick
ENDIF
IF BYTE{m%}>11
pkill
ENDIF
ENDIF
PUT x&,y&,palko$(31)
IF y&>176 OR x&<0
scrnext
ENDIF
tim
LOOP
exit_fall.left:
g=3
RETURN
'
