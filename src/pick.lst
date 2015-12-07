> PROCEDURE pick   !(status=<7,11>) zober predmet
$P<
num&=BYTE{m%}
my&=INT((m%-miesto%)/20)
mx&=(m%-miesto%)-my&*20
MUL mx&,16
MUL my&,16
COLOR 0
PBOX mx&,my&,mx&+15,my&+15
SELECT num&
CASE 7
INC life&
CASE 8
INC laser&
CASE 9
INC box&
CASE 10
INC key&
IF cast&=10 AND level&=topleve&
finalgot&=1
ENDIF
CASE 11
ADD body%,100
ENDSELECT
BYTE{m%}=0
RETURN

