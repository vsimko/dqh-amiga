PROCEDURE gameerror !handler for prg errors
  $P<
 
  BYTE{20307}=0 !pointer on
  ~Permit()
  ~OpenWorkBench()

  IF miesto%>1
    ~FreeMem(miesto%-20,300)
  ENDIF

  CLOSEW #1
  CLOSEW #2
  CLOSES 1
  CLOSES 2

  FOR i&=0 TO 9
    FOR ii&=0 TO 2
      IF obrmem%(i&,ii&)>0
        ~FreeMem(obrmem%(i&,ii&),8480)
      ENDIF
    NEXT ii&

    IF miesto%(i&)>1
    ~FreeMem(miesto%(i&),316)
    ENDIF
  NEXT i&

  EDIT !open editor

RETURN

