PROCEDURE hof !umiestnenie v hi-scores
$P<
WHILE INKEY$<>""
WEND
f.0
CLEARW #1
IF body%>sco%(9)
f.2
pis(50,16,"ENTER YOUR NAME",6)
CLR a$,ink$
WHILE ink$<>CHR$(13)
ink$=INKEY$
IF ink$<>CHR$(13) AND ink$<>CHR$(8) AND ink$<>"" AND LEN(a$)<16
a$=a$+ink$
pis(48,40,a$,6)
ELSE IF ink$=CHR$(8) AND ink$<>"" AND LEN(a$)>0
a$=LEFT$(a$,LEN(a$)-1)
pis(48,40,a$+STRING$(5,32),6)
ENDIF
WEND
a$=LEFT$(a$+STRING$(18,32),18)
FOR i&=0 TO 9
EXIT IF sco%(i&)<=body%
NEXT i&
FOR ii&=9 TO i&+1 STEP -1
sco%(ii&)=sco%(ii&-1)
mm$(ii&)=mm$(ii&-1)
NEXT ii&
mm$(i&)=a$
sco%(i&)=body%
CLEARW #1
WHILE INKEY$<>"" OR MOUSEK<>0 OR @joyf<>0
WEND
FOR i&=0 TO 9
pis(0,(i&+1)*16,STR$(i&+1),6)
pis(32,(i&+1)*16,mm$(i&),6)
pis(220,(i&+1)*16,STR$(sco%(i&)),6)
NEXT i&
i&=150
ii&=-1
pis(0,192,"press fire to continue or",3)
pis(0,208,"left mousebotton to save hiscores",3)
ink$=""
WHILE @joyf=0 AND ink$=""
ink$=INKEY$
IF MOUSEK<>0
OPEN "o",#1,"HiScores"
FOR i&=0 TO 9
WRITE #1,sco%(i&),mm$(i&)
NEXT i&
CLOSE #1
WHILE MOUSEK<>0
WEND
~ScreenToFront(scr%(0))
ENDIF
ADD i&,ii&
IF i&=150 OR i&=0
ii&=-ii&
ADD i&,ii&
ENDIF
SETCOLOR 6,15,i&/10,0
~Delay(1)
WEND
ENDIF
RETURN
