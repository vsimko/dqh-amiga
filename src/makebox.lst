> PROCEDURE makebox !make 2 boxes under Palko
$P<
m%=miesto%+INT(x&/16)+INT(y&/16-1)*20
IF x&<0
x&=0
ENDIF
IF box&<>0 AND BYTE{m%}=0 AND BYTE{m%+1}=0 AND y&>8
DEC box&
PUT x&,y&,palko$(15) !obrazok palka ako skace
FOR i&=0 TO 15
SCROLL 0,-1,x&,y&-15,x&+15,y&+31
NEXT i&
SUB y&,16
create(INT(x&/16)*16,INT(y&/16+2)*16,5)
create(INT(x&/16+1)*16,INT(y&/16+2)*16,5)
m%=miesto%+INT(x&/16)+INT(y&/16+2)*20
BYTE{m%}=1
BYTE{m%+1}=1
ENDIF
RETURN
