> PROCEDURE winner !ked uz nie su dalsie levely
$P<
f.0
CLEARW #1
file%=Open(@sadd("DEVIL:vyh.obr"),1005)
IF file%=0
gameerror
ENDIF
FOR i&=0 TO 2
long%=Read(file%,bit%(0,i&),8480)
NEXT i&
~Close(file%)
COLOR 0
BOX 0,0,319,211
f.4
~Delay(100)
FOR i&=30 TO -16 STEP -2
PUT 90,i&,vec$(11)
~Delay(1)
NEXT i&
~Delay(100)
hof
RETURN
