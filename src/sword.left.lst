> PROCEDURE sword.left
FOR i&=20 TO 22
~Delay(1)
PUT x&,y&,palko$(i&)
tim
NEXT i&
m%=miesto%+INT(x&/16-0.4)+INT(y&/16+1.2)*20
zly&=BYTE{m%}-15
IF zly&>-1
ghostkill
ENDIF
PUT x&,y&,palko$(7)
RETURN

