> PROCEDURE ghostkill
$P<
DEC dd&(zly&,3)
IF dd&(zly&,3)=0
vystrek(dd&(zly&,2),dd&(zly&,1)+10,7,6)
' PUT dd&(zly&,2),dd&(zly&,1),palko$(29)
' ~Delay(5)
COLOR 0
PBOX dd&(zly&,2),dd&(zly&,1),dd&(zly&,2)+15,dd&(zly&,1)+31
ADD body%,dd&(zly&,4)
dd&(zly&,5)=0
m%=miesto%+INT(dd&(zly&,2)/16+0.5)+INT(dd&(zly&,1)/16+1.3)*20
BYTE{m%}=0
ENDIF
RETURN
'
> PROCEDURE tim ! scheduler of ghosts and laser animations
$P>
movelaser
IF las.num&<0
~Delay(1)
ENDIF
cas&=-cas&
IF cas&=1
m%=miesto%+INT(x&/16)+INT(y&/16+1)*20
IF BYTE{m%}>14
pkill
ENDIF
m%=miesto%+INT(x&/16+1)+INT(y&/16+1)*20
IF BYTE{m%}>14
pkill
ENDIF
GOTO exit_tim
ENDIF
INC zpoh&
IF zpoh&>2
zpoh&=0
ENDIF
FOR zly&=0 TO 2
ON SGN(dd&(zly&,5))+2 GOSUB ghost.left,nothing,ghost.right
NEXT zly&
exit_tim:
RETURN
> PROCEDURE ghost.right
$P>
IF dd&(zly&,3)<>255
m%=miesto%+INT(dd&(zly&,2)/16+0.5)+INT(dd&(zly&,1)/16+1.3)*20
BYTE{m%}=0
BYTE{m%-20}=0
dd&(zly&,2)=dd&(zly&,2)+dd&(zly&,5)
IF dd&(zly&,2)<dd&(zly&,7) OR dd&(zly&,2)>dd&(zly&,6)
dd&(zly&,5)=-dd&(zly&,5)
PUT dd&(zly&,2),dd&(zly&,1),duch$(zpoh&+3+dd&(zly&,0)*6)
ELSE
PUT dd&(zly&,2),dd&(zly&,1),duch$(zpoh&+dd&(zly&,0)*6)
ENDIF
m%=miesto%+INT(dd&(zly&,2)/16+0.5)+INT(dd&(zly&,1)/16+1.3)*20
BYTE{m%}=zly&+15
ELSE
dd&(zly&,2)=dd&(zly&,2)+dd&(zly&,5)
IF dd&(zly&,2)<dd&(zly&,7) OR dd&(zly&,2)>dd&(zly&,6)
dd&(zly&,5)=-dd&(zly&,5)
PUT dd&(zly&,2),dd&(zly&,1),duch$(zpoh&+3+dd&(zly&,0)*6)
ELSE
PUT dd(zly,2),dd(zly,1),duch$(zpoh+dd(zly,0)*6)
ENDIF
ENDIF
RETURN
> PROCEDURE ghost.left
$P>
IF dd&(zly&,3)<>255
m%=miesto%+INT(dd&(zly&,2)/16+0.5)+INT(dd&(zly&,1)/16+1.3)*20
BYTE{m%}=0
BYTE{m%-20}=0
dd&(zly&,2)=dd&(zly&,2)+dd&(zly&,5)
IF dd&(zly&,2)<dd&(zly&,7) OR dd&(zly&,2)>dd&(zly&,6)
dd&(zly&,5)=-dd&(zly&,5)
PUT dd&(zly&,2),dd&(zly&,1),duch$(zpoh&+dd&(zly&,0)*6)
ELSE
PUT dd&(zly&,2),dd&(zly&,1),duch$(zpoh&+3+dd&(zly&,0)*6)
ENDIF
m%=miesto%+INT(dd&(zly&,2)/16+0.5)+INT(dd&(zly&,1)/16+1.3)*20
BYTE{m%}=zly&+15
ELSE
dd&(zly&,2)=dd&(zly&,2)+dd&(zly&,5)
IF dd&(zly&,2)<dd&(zly&,7) OR dd&(zly&,2)>dd&(zly&,6)
dd&(zly&,5)=-dd&(zly&,5)
PUT dd&(zly&,2),dd&(zly&,1),duch$(zpoh&+dd&(zly&,0)*6)
ELSE
PUT dd&(zly&,2),dd&(zly&,1),duch$(zpoh&+3+dd&(zly&,0)*6)
ENDIF
ENDIF
RETURN
