> PROCEDURE sword.right
FOR i&=17 TO 19
~Delay(1)
PUT x&,y&,palko$(i&)
tim
NEXT i&
m%=miesto%+INT(x&/16+1.4)+INT(y&/16+1.2)*20
zly&=BYTE{m%}-15
IF zly&>-1
ghostkill
ENDIF
PUT x&,y&,palko$(0)
RETURN

