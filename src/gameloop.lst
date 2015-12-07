PROCEDURE gameloop

start:
  startmenu

  f.1
  ink$ = CHR$(27) ' ESC character
  newlevel

  DO
    REPEAT

      ink$ = INKEY$
      stx& = @joyx
      sty& = @joyy

      IF life& <= 0
        f.0
        SELECT navrat&
        CASE 0
          hof
          GOTO start
        CASE 1
          GOTO start
        CASE 2
          winner
          GOTO start
        ENDSELECT
      ENDIF

      SELECT @joyf
      CASE 1
        ON teraz& GOSUB sword.right, sword.left
      CASE 2
        firelaser
      ENDSELECT

      ON sty& + 2 GOSUB jump, nothing, firelaser
      ON teraz& GOSUB fall.right, fall.left

      stx& = stx& * teraz& + 3

      ON stx& GOSUB go.left, turn.left, nothing, go.right, turn.right

      IF poh& = 0
        CLR obr&
        PUT x&, y&, palko$(7 * (teraz& - 1))
      ENDIF

      CLR poh&
      tim
    UNTIL ink$ <> ""

    IF ink$ = " "
      makebox
    ELSE IF ink$ = CHR$(27)
      CLR life&
      pkill
      GOTO start
    ELSE IF MID$(ink$, 2, 1) = CHR$(63)
      gamestatus
    ENDIF

  LOOP
RETURN
