FUNCTION joyx
  $F%

  IF ink$=""            !without keyboard
    SELECT STICK(2)
      CASE 8,9,10       !direction upleft left downleft
        RETURN 1
      CASE 4,5,6        !direction upright right downright
        RETURN -1
    ENDSELECT
  ELSE                  !with keyboard
    SELECT ink$
      CASE "7","4","1"
        RETURN -1
      CASE "9","6","3"
        RETURN 1
    ENDSELECT
  ENDIF

  RETURN 0              !nothing happened
ENDFUNC

FUNCTION joyy
  $F%

  IF ink$=""            !without keyboard
    SELECT STICK(2)
      CASE 1,5,9        !jump "upleft" "up" "upright"
        RETURN -1
      CASE 2,6,10       !jump "downleft" "down" "downright"
        RETURN 1
    ENDSELECT
  ELSE                  !using keyboard
    SELECT ink$
      CASE "7","8","9"
        RETURN -1
      CASE "1","2","3"
        RETURN 1
    ENDSELECT
  ENDIF

  RETURN 0              !nothing happened
ENDFUNC

FUNCTION joyf
  $F%
  IF ink$=""            !without keyboard
    IF STRIG(3)
      IF @joyy=1        !joy down+fire=laser
        RETURN 2
      ELSE
        RETURN 1
      ENDIF
    ENDIF
  ELSE IF ink$="0"      !kbd "0"
    RETURN 1
  ELSE IF ink$="."      !kbd "."
    RETURN 2
  ENDIF

  RETURN 0              !nothing happened
ENDFUNC

