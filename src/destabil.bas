> PROCEDURE destabil  !(status=3) zavazovacie policka
$P<
IF obr&<>0
SCROLL 0,2,x&-3,y&,x&+18,y&+47
SCROLL 0,-2,x&-3,y&,x&+18,y&+47
tim
ELSE
FOR i&=0 TO 3
tim
SCROLL 0,1,x&,y&,x&+15,y&+47
NEXT i&
FOR i&=0 TO 3
tim
SCROLL 0,-1,x&,y&,x&+15,y&+47
NEXT i&
PUT x&,y&,palko$(teraz&*7-7)
ENDIF
RETURN
