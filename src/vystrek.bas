> PROCEDURE vystrek(x&,y&,dlz&,dots&) !rozpad ducha na castice
LOCAL i&,ii&,g&
g&=1
DIM vxy(1,dots&,1),rych(1,dots&)
'  GRAPHMODE 3
FOR i&=0 TO dots&
FOR ii&=0 TO 1
vxy(0,i&,ii&)=x&+RAND(16)
vxy(1,i&,ii&)=y&
NEXT ii&
rych(1,i&)=-((RAND(30)+20)/10)
rych(0,i&)=((RAND(30)+20-10)/10)*((teraz&=2)-(teraz&=1))
' PLOT vxy(0,i&,0),vxy(1,i&,0)
NEXT i&
'
FOR ii&=0 TO dlz&
FOR i&=0 TO dots& !rozpad castic
ADD rych(1,i&),g&
ADD vxy(0,i&,0),rych(0,i&)
ADD vxy(1,i&,0),rych(1,i&)
COLOR 6
PLOT vxy(0,i&,0),vxy(1,i&,0)
COLOR 0
PLOT vxy(0,i&,1),vxy(1,i&,1)
vxy(0,i&,1)=vxy(0,i&,0)
vxy(1,i&,1)=vxy(1,i&,0)
NEXT i&
NEXT ii&
FOR i&=0 TO dots&
COLOR 0
PLOT vxy(0,i&,1),vxy(1,i&,1)
NEXT i&
'
' GRAPHMODE 1
ERASE vxy(),rych()
RETURN

