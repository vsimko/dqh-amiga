PROCEDURE f.0 ! black screen
  $P<
  LOCAL i&
  FOR i&=0 TO 7
    SETCOLOR i&,0
  NEXT i&
RETURN

PROCEDURE f.1 ! normal colors
  $P<
  SETCOLOR 0,0          !black
  SETCOLOR 1,&HFFF      !white
  SETCOLOR 2,&H80       !green
  SETCOLOR 3,&HB00      !red
  SETCOLOR 4,&HF88      !pink
  SETCOLOR 5,&HFF       !blue
  SETCOLOR 6,&HFB0      !yellow
  SETCOLOR 7,&H530      !brown
RETURN

PROCEDURE f.2 ! slide from black to normal
  $P<
  LOCAL z
  FOR z=30 TO 1 STEP -0.5
    SETCOLOR 1,11/(z*2),11/(z*2),11/(z*2)
    SETCOLOR 2,0,8/z,0
    SETCOLOR 3,11/z,0,0
    SETCOLOR 4,15/z,8/z,8/z
    SETCOLOR 5,0,15/z,15/z
    SETCOLOR 6,15/z,11/z,0
    SETCOLOR 7,5/z,3/z,0
  NEXT z
  f.1
RETURN

PROCEDURE f.3 ! slide from normal to black
  $P<
  LOCAL n
  FOR n=1 TO 5 STEP 0.2
    SETCOLOR 1,11/(n*2),11/(n*2),11/(n*2)
    SETCOLOR 2,0,8/n,0
    SETCOLOR 3,11/n,0,0
    SETCOLOR 4,15/n,8/n,8/n
    SETCOLOR 5,0,15/n,15/n
    SETCOLOR 6,15/n,11/n,0
    SETCOLOR 7,5/n,3/n,0
  NEXT n
  f.0
RETURN

PROCEDURE f.4 ! palette for devil's queer house picture
  $P<
  SETCOLOR 1,10,10,10
  SETCOLOR 2,3,2,1
  SETCOLOR 3,6,6,5
  SETCOLOR 4,6,5,4
  SETCOLOR 5,6,6,6
  SETCOLOR 6,2,1,0
  SETCOLOR 7,15,0,0
RETURN

