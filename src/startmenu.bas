PROCEDURE startmenu
  f.0
  CLEARW #1
  file%=Open(@sadd("RAM:dev.obr"),1005)
  
  IF file%=0 !not exist
    gameerror
  ENDIF
  
  FOR i&=0 TO 2
    long% = Read(file%,bit%(0,i&),8480)
  NEXT i&
  
  ~Close(file%)
  IF NOT EXIST("DEVIL:text")
    gameerror
  ENDIF
  
  FOR i&=0 TO 2
    BMOVE bit%(0,i&),obrmem%(0,i&),8480
  NEXT i&
  
  f.4
  CLR level&,cast&,x&,y&,teraz&,body%,laser&,box&,stx&,key&,navrat&
  speed&=3
  cas&=1
  life&=6
  
  FOR i&=0 TO 300 !caka pri uvodnom obrazku
    ~Delay(1)
    ink$ = INKEY$
    EXIT IF @joyf<>0 !skonci pokial bol stlaceny joystick
  NEXT i&
  
  IF i&>300
    devilinfo
  ENDIF
  
menu_loop:
  effect(1)
  ' vnutorne rozmery cierneho okna: 66,64,246,160
  COLOR 1
  BOX 63,61,249,163
  COLOR 5
  BOX 64,62,248,162
  COLOR 6
  BOX 65,63,247,161
  x&=79
  pis2(x&,77," START  GAME.",1,7)
  pis2(x&,93,"   PRACTISE",1,7)
  pis2(x&,109,"   PASSWORD",1,7)
  pis2(x&,125,"   OPTIONS..",1,7)
  pis2(x&,141,"     INFO",1,7)
  pis2(x&,157," QUIT  GAME !",1,7)
  x&=70
  y&=64
  ' GET x&,y&,x&+15,y&+15,array$
  inpbufclr
  
  WHILE @joyf=0
    ink$=INKEY$
    stx&=@joyy
    
    IF stx&=-1 AND y&<>64
      FOR i&=0 TO 15
        PUT x&,y&,vec$(9)
        DEC y&
      NEXT i&
    ELSE IF stx&=1 AND y&<>144
      FOR i&=0 TO 15
        PUT x&,y&,vec$(9)
        INC y&
      NEXT i&
    ENDIF
    
    PUT x&,y&,vec$(9)
    ~Delay(4)
    PUT x&,y&,vec$(10)
    ~Delay(3)
  WEND
  
  FOR i&=0 TO 15
    SCROLL -1,0,x&,y&,x&+15,y&+15
  NEXT i&
  
  SELECT y&
    CASE 64 !startgame item selected
      GOTO exit_startmenu
      
    CASE 80 !practice item selected
      life&=25
      laser&=25
      navrat&=1
      GOTO exit_startmenu
      
    CASE 96 !password item selected
      inpbufclr
      effect(1)
      pis2(79,77,"TYPE PASSWORD",1,7)
      CLR a$
      
      FOR i&=0 TO 5
        CLR ink$
        waitforinput
        a$=a$+UPPER$(ink$)
        pis(112,110,a$,7)
      NEXT i&
      
      FOR i&=0 TO 15
        EXIT IF a$=code$(i&)
      NEXT i&
      
      IF i&=16
        i&=15
      ENDIF
      
      IF a$=code$(i&)
        level&=i&
        GOTO exit_startmenu
      ENDIF
      
      IF a$="TOTALT"
        life&=1000
        body%=10000
        laser&=1000
        box&=1000
      ELSE IF a$="XLASER"
        laser&=20
      ELSE IF a$="XBEDNA"
        box&=20
      ELSE IF a$="XKLUCE"
        key&=20
      ENDIF
      GOTO menu_loop
      
    CASE 112
      options
      
    CASE 128
      FOR i&=0 TO 2
        BMOVE bit%(0,i&),obrmem%(0,i&),8480
      NEXT i&
      devilinfo
      
    CASE 144
      f.1
      gameerror
      
  ENDSELECT
  
  GOTO menu_loop
  
exit_startmenu:
RETURN

PROCEDURE inpbufclr !clear input buffer
  WHILE @joyf<>0 OR ink$<>""
    ink$ = INKEY$
  WEND
RETURN
