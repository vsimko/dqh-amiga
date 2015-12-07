PROCEDURE getswgfx !read gfx data about win,scr
  $P<

  FOR i& = 0 TO 1
    srp%(i&) = scr%(i&) + 84
    wrp%(i&) = {win%(i&) + 50}
  NEXT i&

  FOR i& = 0 TO 2
    bit%(0,i&) = {{scr%(0) + 88} + 8 + i& * 4}
    bit%(1,i&) = {{scr%(1) + 88} + 8 + i& * 4}
  NEXT i&

RETURN

