PROCEDURE initgame

  LOCAL i&
  ON ERROR GOSUB gameerror !if there is an error
  ON BREAK GOSUB gameerror !ctrl+shift+alt pressed

  toplevel&=7 !kolko je maximalne levelov
  las.max&=3
  las.num&=-1

  DIM las.ptr&(las.max&)         !pointer to used projectiles

  FOR i&=0 TO las.max&
    las.ptr&(i&)=i&
  NEXT i&

  DIM las.img$(las.max&)        !background of laser
  DIM las.x&(las.max&)          !x position
  DIM las.y&(las.max&)          !y position
  DIM las.lx&(las.max&)         !last x position
  DIM las.ly&(las.max&)         !last y position
  DIM las.vx&(las.max&)         !x vector
  DIM las.vy&(las.max&)         !y vector

  DIM bit%(1,2)                 !picture
  DIM obrmem%(9,2)              !screens
  DIM palko$(49)                !animation of palko
  DIM duch$(35)                 !animation of ghost
  DIM miesto%(9)                !
  DIM dd&(2,7)
  DIM sjvz&(3)                  !
  DIM tele&(2)
  DIM vec$(11)                  !pictures of items
  DIM mm$(9)
  DIM sco%(9)
  DIM code$(15)                 !passwords
  '
  DIM scr%(1),win%(1) !adresy screenov a okien
  DIM srp%(1),wrp%(1) !rast porty
  '
  ' 0 = visible bitmap
  ' 1 = the huge invisible bitmap with patterns
  '
  DEFFN l1=ASC(INPUT$(1,#1))       !nacita 1b
  DEFFN l2=WORD(CVI(INPUT$(2,#1))) !nacita 2b

  ' vytvorenie prostredia
  SETWPEN 0,0
  SETSPEN 0,0
  OPENS 2,0,0,816,564,3,0      ! invisible bitmap with patterns
  OPENW #2,0,0,816,564,0,-3472
  f.1
  OPENS 1,0,0,320,212,3,0      ! visible bitmap
  OPENW #1,0,0,320,212,0,67648
  CLEARW #1
  f.1
  scr%(0)=SCREEN(1)
  scr%(1)=SCREEN(2)
  win%(0)=WINDOW(1)
  win%(1)=WINDOW(2)

  GOSUB getswgfx

  font(wrp%(0),"moj",16,0)
  ~ActivateWindow(win%(0))
  DISPLAY OFF

  ' nahrava uvodny obrazok do ram:
  IF NOT EXIST("ram:dev.obr")
    ~Execute(@sadd("copy >NIL: DEVIL:dev.obr to ram:dev.obr"),0,0)
  ENDIF

  f.0
  CLEARW #1
  BYTE{20307}=64
  ~Forbid()
  FOR i&=0 TO 9
    FOR ii&=0 TO 2
      obrmem%(i&,ii&)=AllocMem(8480,65536)
      EXIT IF obrmem%(i&,ii&)<=0
    NEXT ii&
    EXIT IF obrmem%(i&,ii&-1)<=0
  NEXT i&

  IF i&<=2
    gameerror
  ENDIF

  miesto%=AllocMem(300,65536)
  ADD miesto%,20

  IF miesto%<=20
    gameerror
  ENDIF

  FOR i&=0 TO 9
    READ sco%(i&),mm$(i&)
    miesto%(i&)=AllocMem(316,65536)
    EXIT IF miesto%(i&)<=0
  NEXT i&

  IF i&<=9
    gameerror
  ENDIF

  FOR i&=0 TO 15
    READ code$(i&)
  NEXT i&

  IF EXIST("DEVIL:HiScores")
    OPEN "i",#1,"DEVIL:HiScores"
    FOR i&=0 TO 9
      INPUT #1,sco%(i&),mm$(i&)
    NEXT i&
    CLOSE #1
  ENDIF

  FOR i&=0 TO 9
    mm$(i&)=mm$(i&)+STRING$(18,32)
    mm$(i&)=LEFT$(mm$(i&),18)
  NEXT i&

  file%=Open(@sadd("DEVIL:Obrazok"),1005)

  IF file%=0 !not exist
    gameerror
  ENDIF

  FOR i&=0 TO 2
    long%=Read(file%,bit%(1,i&),57528)
  NEXT i&

  ~Close(file%)
  DISPLAY ON
  FRONTS 1
  RASTPORT wrp%(1)
  SCROLL -4,-2,0,0,815,563
  prginfo
  RASTPORT wrp%(1)

  ' =====================================
  ' -------- caching palko patterns
  FOR i&=0 TO 49
    GET i&*16,0,i&*16+15,31,palko$(i&)
  NEXT i&
  ' -------- caching item patterns
  FOR i&=0 TO 11
    GET i&*16,384,i&*16+15,399,vec$(i&)
  NEXT i&
  ' -------- caching laser pattern
  FOR i&=0 TO las.max&
    GET 64,249,79,250,las.img$(i&)
    ' GET 0,384,15,390,las.img$(i&)
  NEXT i&
  ' =====================================

  RASTPORT wrp%(0)
  ~Permit()
  ~CloseWorkBench()
RETURN

