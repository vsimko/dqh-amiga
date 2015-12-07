> PROCEDURE go.right
$P>
ADD x&,3
poh&=-1
INC obr&
IF obr&>6
obr&=1
ENDIF
IF x&>300
scrnext
ENDIF
m%=miesto%+INT(x&/16+1)+INT(y&/16)*20
ON BYTE{m%} GOSUB go.wall,go.wall,go.wall,go.wall,go.wall,go.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
m%=miesto%+INT(x&/16+1)+INT(y&/16+1)*20
ON BYTE{m%} GOSUB go.wall,go.wall,go.wall,go.wall,go.wall,go.wall,pick,pick,pick,pick,pick,pkill,pkill,pkill,pkill,pkill,pkill
PUT x&,y&,palko$(obr&)
RETURN

