PROCEDURE devilinfo !textik kto,co,ako
  $P<
  
  f.0
  inpbufclr
  CLR a$,num&,m%,stx&
  OPEN "i",#1,"DEVIL:text"
  INPUT #1,num&
  DIM a$(num&),aaa&(num&)
  
  FOR i& = 0 TO num&
    INPUT #1,aaa&(i&),a$(i&)
  NEXT i&
  
  CLOSE #1
  CLEARW #1
  COLOR 1
  f.2
  
  ink$ = INKEY$
  WHILE stx& = 0 AND ink$ = ""
    ink$ = INKEY$
    CLR stx&
    pis(0,208,a$(m%),aaa&(m%))
    INC m%
    
    IF m%>num&
      FOR i&=150 TO 0 STEP -1
        SETCOLOR 1,i&/10,i&/10,i&/10
      NEXT i&
      
      CLR m%
      CLEARW #1
      
      FOR i&=0 TO 9
        pis(0,(i&+1)*16,STR$(i&+1),6)
        pis(32,(i&+1)*16,mm$(i&),6)
        pis(220,(i&+1)*16,STR$(sco%(i&)),6)
      NEXT i&
      
      CLR stx&
      
      FOR i&=0 TO 4000
        ~Delay(2)
        ADD stx&,ABS(STRIG(3))
        IF stx&>0
          i&=4000
        ENDIF
      NEXT i&
      CLEARW #1
      
      FOR i& = 0 TO 150
        SETCOLOR 1,i&/10,i&/10,i&/10
      NEXT i&
      
    ENDIF
    
    del% = LEN(a$(ABS(m%-1))) * 0.18
    FOR i& = 0 TO 15
      SCROLL 0,-1,0,0,320,256
      ~Delay(del%)
      ADD stx&,ABS(STRIG(3))
    NEXT i&
  WEND
  
  f.3
  ERASE a$(),aaa&()
  
  FOR i& = 0 TO 2
    BMOVE obrmem%(0,i&),bit%(0,i&),8480
  NEXT i&
  
  f.4
RETURN
