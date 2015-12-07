> PROCEDURE scrnext !connecton between screens
$P>
LOCAL num&,mem%,a$
cc&=c&
IF x&>300
IF sjvz&(2)=0
x&=300
GOTO exit
ELSE
COLOR 0
PBOX x&,y&,x&+15,y&+31
CLR x&
cast&=sjvz&(2)
GOTO scrnextp
ENDIF
ENDIF
IF x&<0
IF sjvz&(3)=0
CLR x&
GOTO exit_scrnext
ELSE
COLOR 0
PBOX x&,y&,x&+15,y&+31
x&=300
cast&=sjvz&(3)
GOTO scrnextp
ENDIF
ENDIF
IF y&>176
IF sjvz&(1)=0
y&=176
GOTO exit_scrnext
ELSE
COLOR 0
PBOX x&,y&,x&+15,y&+31
CLR y&
cast&=sjvz&(1)
GOTO scrnextp
ENDIF
ENDIF
IF y&<0
IF sjvz&(0)=0
CLR y&
GOTO exit_scrnext
ELSE
COLOR 0
PBOX x&,y&,x&+15,y&+31
y&=176
cast&=sjvz&(0)
GOTO scrnextp
ENDIF
ENDIF
scrnextp:
c&=cast&-1
IF cast&=11
newlevel
GOTO exit_scrnext
ENDIF
BMOVE miesto%,miesto%(cc&),260
FOR i&=0 TO 2
BMOVE bit%(0,i&),obrmem%(cc&,i&),8480
NEXT i&
CLR a$
FOR i&=0 TO 3
a$=a$+CHR$(sjvz&(i&))
NEXT i&
FOR i&=0 TO 2
a$=a$+CHR$(tele&(i&))
NEXT i&
FOR i&=0 TO 2
FOR ii&=0 TO 7
a$=a$+MKI$(dd&(i&,ii&))
NEXT ii&
NEXT i&
BMOVE VARPTR(a$),miesto%(cc&)+261,55
BMOVE miesto%(c&),miesto%,260
num&=BYTE{miesto%(c&)+260}
isy&=INT(num&/20)
isx&=num&-isy&*20
MUL isx&,16
MUL isy&,16
mem%=miesto%(c&)+261
CLR num&,a$
FOR i&=0 TO 3
sjvz&(i&)=BYTE{mem%+num&}
INC num&
NEXT i&
FOR i&=0 TO 2
tele&(i&)=BYTE{mem%+num&}
INC num&
NEXT i&
FOR i&=0 TO 2
FOR ii&=0 TO 7
dd&(i&,ii&)=WORD{mem%+num&}
ADD num&,2
NEXT ii&
NEXT i&
FOR i&=0 TO 2
BMOVE obrmem%(c&,i&),bit%(0,i&),8480
NEXT i&
CLR a$,num&
testxy
exit_scrnext:
RETURN
