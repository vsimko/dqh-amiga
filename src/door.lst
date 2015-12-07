> PROCEDURE door  !(status=)
$P<
IF key&>0
BYTE{m%}=1
DEC key&
IF BYTE{m%-21}=1
BYTE{m%-21}=0
BYTE{m%-22}=0
BYTE{m%-41}=0
BYTE{m%-42}=0
BYTE{m%-61}=0
BYTE{m%-62}=0
a&=(INT(x&/16)-2)*16
b&=(INT(y&/16)-1)*16
FOR i&=0 TO 47
SCROLL 0,-1,a&,b&,a&+31,b&+47
NEXT i&
ELSE IF BYTE{m%-19}=1
BYTE{m%-19}=0
BYTE{m%-18}=0
BYTE{m%-39}=0
BYTE{m%-38}=0
BYTE{m%-59}=0
BYTE{m%-58}=0
a&=(INT(x&/16)+2)*16
b&=(INT(y&/16)-1)*16
FOR i&=0 TO 47
SCROLL 0,-1,a&,b&,a&+31,b&+47
NEXT i&
ENDIF
ENDIF
RETURN

