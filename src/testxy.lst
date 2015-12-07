> PROCEDURE testxy !if not in wall
$P<
' test if palko didn't appear in the wall or if there's enough space for palko
LOCAL t%
CLR num&
t%=miesto%+INT(x&/16)+INT(y&/16)*20
IF BYTE{t%+1}<>0 OR BYTE{t%+21}<>0
num&=1
IF BYTE{t%-1}=0 OR BYTE{t%+19}=0
CLR num&
ENDIF
ENDIF
IF BYTE{t%-1}<>0 OR BYTE{t%+19}<>0
num&=1
IF BYTE{t%+1}=0 OR BYTE{t%+21}=0
CLR num&
ENDIF
ENDIF
IF BYTE{t%}<>0 OR BYTE{t%+20}<>0
num&=1
ENDIF
IF num&=1
y&=176
WHILE BYTE{t%}<>0 OR BYTE{t%+20}<>0 OR BYTE{t%+1}<>0 OR BYTE{t%+21}<>0 OR BYTE{t%+40}<>1
SUB y&,16
IF y&<0
y&=176
ADD x&,16
IF x&>320
CLR x&
ENDIF
ENDIF
t%=miesto%+INT(x&/16)+INT(y&/16)*20
WEND
ENDIF
RETURN

