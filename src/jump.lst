> PROCEDURE jump !how to jump - right or left teraz&=1 or 2
$P>
ON teraz& GOSUB jump.right,jump.left
RETURN
> PROCEDURE jump.right
$P>
teraz&=1
PUT x&,y&,palko$(27)
g=4
WHILE poh&<20 AND @joyy=-1
stx&=@joyx
' ink$=INKEY$
SUB y&,g
SUB g,0.1
INC poh&
IF stx&=1
ADD x&,2
ELSE
IF stx&<>0
jump.left
GOTO exit_s.p
ENDIF
ENDIF
m%=miesto%+INT(x&/16+1)+INT(y&/16+1)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
m%=miesto%+INT(x&/16+1)+INT(y&/16+2)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,nothing,nothing,nothing
m%=miesto%+INT(x&/16)+INT((y&-3)/16)*20
IF BYTE{m%}>0
IF BYTE{m%}>11
pkill
ENDIF
IF BYTE{m%}>6 AND BYTE{m%}<12
pick
ENDIF
IF BYTE{m%}<7
fall.right
GOTO exit_s.p
ENDIF
ENDIF
INC m%
IF BYTE{m%}>0
IF BYTE{m%}>11
pkill
ENDIF
IF BYTE{m%}>6 AND BYTE{m%}<12
pick
ENDIF
IF BYTE{m%}<7
fall.right
GOTO exit_s.p
ENDIF
ENDIF
PUT x&,y&,palko$(27)
IF y&<0 OR x&>300
scrnext
ENDIF
tim
WEND
fall.right
exit_s.p:
RETURN
> PROCEDURE jump.left
$P>
teraz&=2
PUT x&,y&,palko$(28)
g=4
WHILE poh&<20 AND @joyy=-1
stx&=@joyx
' ink$=INKEY$
SUB y&,g
SUB g,0.1
INC poh&
IF stx&=-1
SUB x&,2
ELSE
IF stx&<>0
jump.right
GOTO exit_s.l
ENDIF
ENDIF
m%=miesto%+INT(x&/16)+INT(y&/16+1)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
m%=miesto%+INT(x&/16)+INT(y&/16+2)*20
ON BYTE{m%} GOSUB jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,jump.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,nothing,nothing,nothing
m%=miesto%+INT(x&/16)+INT((y&-3)/16)*20
IF BYTE{m%}>0
IF BYTE{m%}>11
pkill
ENDIF
IF BYTE{m%}>6 AND BYTE{m%}<12
pick
ENDIF
IF BYTE{m%}<7
fall.left
GOTO exit_s.l
ENDIF
ENDIF
INC m%
IF BYTE{m%}>0
IF BYTE{m%}>11
pkill
ENDIF
IF BYTE{m%}>6 AND BYTE{m%}<12
pick
ENDIF
IF BYTE{m%}<7
fall.left
GOTO exit_s.l
ENDIF
ENDIF
PUT x&,y&,palko$(28)
IF y&<0 OR x&<0
scrnext
ENDIF
tim
WEND
fall.left
exit_s.l:
RETURN
