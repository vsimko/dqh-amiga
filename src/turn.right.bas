> PROCEDURE turn.right
$P>
CLR obr&,poh&
teraz&=1
FOR i&=2 TO 0 STEP -1
PUT x&,y&,palko$(i&+14)
tim
NEXT i&
RETURN

