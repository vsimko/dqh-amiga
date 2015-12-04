> PROCEDURE laserold
$P<
LOCAL aa&,to&
IF laser&=0
GOTO exit_laser
ENDIF
PUT x&,y&,palko$(teraz&*7-7)
WHILE @joyf<>2 AND @joyy=1
ink$=INKEY$
~Delay(1)
tim
WEND
IF @joyf=2
DEC laser&
IF teraz&=1
FOR i&=23 TO 24
PUT x&,y&,palko$(i&)
~Delay(5)
tim
NEXT i&
b&=y&+10
' ***********
a&=x&+20
COLOR 6
PCIRCLE a&,b&,2
aa&=a&
FOR to&=INT(x& DIV 16)+1 TO 20
EXIT IF BYTE{miesto%+to&+INT(b&/16+1)*20}<>0
FOR i&=1 TO 2
ADD a&,8
COLOR 6
PCIRCLE a&,b&,2
COLOR 0
PCIRCLE aa&,b&,2
aa&=a&
NEXT i&
tim
NEXT to&
' ***********
'      FOR to&=INT(x&/16+1) TO 20
'       EXIT IF BYTE{miesto%+to&+INT(b&/16+1)*20}<>0
'       ADD a&,16
'      NEXT to&
'      a&=x&+20
'      COLOR 6
'      PCIRCLE a&,b&,2
'      aa&=a&
'      FOR a&=x&+20 TO to&*16 STEP 5
'      COLOR 6
'      PCIRCLE a&,b&,2
'      COLOR 0
'      PCIRCLE aa&,b&,2
'      aa&=a&
'    NEXT a&
COLOR 0
PCIRCLE aa&,b&,2
FOR i&=0 TO 20
LINE a&+RAND(7)-3,b&+RAND(7)-3,a&+RAND(17)-8,b&+RAND(17)-8
NEXT i&
' ' f.1
b&=INT(y&/16)*16
m%=miesto%+INT(a&/16)+INT(b&/16+1)*20
IF BYTE{m%}=2
SUB m%,20
a&=INT(a&/16)*16
b&=INT(b&/16)*16-16
WHILE BYTE{m%}=2
SUB m%,20
SUB b&,16
WEND
ADD m%,20
ADD b&,16
WHILE BYTE{m%}=2
BYTE{m%}=0
ADD m%,20
ADD b&,16
destroy(a&,b&)
WEND
ELSE IF BYTE{m%}>14
zly&=BYTE{m%}-15
ghostkill
ENDIF
ELSE
FOR i&=25 TO 26
PUT x&,y&,palko$(i&)
~Delay(5)
tim
NEXT i&
b&=y&+10
' ***********
a&=x&+20
COLOR 6
PCIRCLE a&,b&,2
aa&=a&
FOR to&=INT(x&/16+1) DOWNTO 0
EXIT IF BYTE{miesto%+to&+INT(b&/16+1)*20}<>0
FOR i&=1 TO 2
SUB a&,8
COLOR 6
PCIRCLE a&,b&,2
COLOR 0
PCIRCLE aa&,b&,2
aa&=a&
NEXT i&
tim
NEXT to&
' ***********
'      FOR to&=INT(x&/16+1) DOWNTO 0
'      EXIT IF BYTE{miesto%+to&+INT(b&/16+1)*20}<>0
'      SUB a&,16
'    NEXT to&
'      a&=x&-4
'      COLOR 6
'      PCIRCLE a&,b&,2
'      aa&=a&
'      FOR a&=x&+-4 TO (to&+1)*16 STEP -5
'      COLOR 6
'      PCIRCLE a&,b&,2
'      COLOR 0
'      PCIRCLE aa&,b&,2
'      aa&=a&
'    NEXT a&
COLOR 0
PCIRCLE aa&,b&,2
FOR i&=0 TO 20
LINE a&+RAND(7)-3,b&+RAND(7)-3,a&+RAND(17)-8,b&+RAND(17)-8
NEXT i&
' ' f.1
b&=INT(y&/16)*16
m%=miesto%+INT(a&/16)+INT(b&/16+1)*20
IF BYTE{m%}=2
SUB m%,20
a&=INT(a&/16)*16
b&=INT(b&/16)*16-16
WHILE BYTE{m%}=2
SUB m%,20
SUB b&,16
WEND
ADD m%,20
ADD b&,16
WHILE BYTE{m%}=2
BYTE{m%}=0
ADD m%,20
ADD b&,16
destroy(a&,b&)
WEND
ELSE IF BYTE{m%}>14
zly&=BYTE{m%}-15
ghostkill
ENDIF
ENDIF
ENDIF
PUT x&,y&,palko$(teraz&*7-7)
inpbufclr
exit_laser:
RETURN
