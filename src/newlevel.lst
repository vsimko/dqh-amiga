> PROCEDURE newlevel !novy level
$P>
LOCAL dy&,i&,ii&,pxd&
IF ink$<>CHR$(27)
f.3
ELSE
CLR ink$
ENDIF
DISPLAY OFF
INC level&
IF level&>toplevel&
CLR life&
f.0
DISPLAY ON
navrat&=2
GOTO exit
ENDIF
nam$="DEVIL:levels/level "+STR$(level&)
IF level&<>1 AND navrat&=1
CLR life&
f.0
DISPLAY ON
GOTO exit
ENDIF
file%=Open(@sadd(nam$),1005)
IF file%=0
gameerror
ENDIF
~Close(file%)
OPEN "i",#1,nam$
x&=(FN l1)*16
y&=(FN l1)*16
teraz&=FN l1
cast&=FN l1
c&=cast&-1
RASTPORT wrp%(1)
FOR i&=0 TO 5
typ&=@l1
IF typ&>7
dy&=64
SUB typ&,8
ELSE
dy&=32
ENDIF
FOR ii&=0 TO 5
pxd&=(typ&*96)+(ii&*16)
GET pxd&,dy&,pxd&+15,dy&+31,duch$(i&*6+ii&)
NEXT ii&
NEXT i&
RASTPORT wrp%(0)
CLEARW #1
FOR ii&=0 TO 9
num&=FN l2
FOR i&=1 TO num&
RASTPORT wrp%((FN l1)-2)
mx&=FN l2
my&=FN l2
GET mx&,my&,mx&+FN l1,my&+FN l1,array$
RASTPORT wrp%(0)
PUT FN l2,FN l2,array$,96
NEXT i&
FOR bit&=0 TO 2
BMOVE bit%(0,bit&),obrmem%(ii&,bit&),8480
NEXT bit&
CLEARW #1
NEXT ii&
FOR i&=0 TO 9
BMOVE @sadd(INPUT$(316,#1)),miesto%(i&),316
NEXT i&
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
RASTPORT wrp%(0)
CLR a$,num&
tim
PUT x&,y&,palko$(teraz&*7-7)
tim
CLOSE #1
DISPLAY ON
exit:
f.2
RETURN
