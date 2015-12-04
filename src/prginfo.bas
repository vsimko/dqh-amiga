PROCEDURE prginfo
  RASTPORT wrp%(1)
  GET 0,513,143,559,aaa$
  RASTPORT wrp%(0)
  CLEARW #1
  f.1
  PUT 80,74,aaa$
  ~Delay(40)
  effect(0)
  CLEARW #1
  aaa$=""
  pis(120,90,"PRESENTS",3)
  ~Delay(40)
  effect(0)
  CLEARW #1
  RASTPORT wrp%(1)
  GET 144,512,207,543,aaa$
  RASTPORT wrp%(0)
  PUT 120,74,aaa$
  ~Delay(40)
  effect(0)
  CLEARW #1
  CLR aaa$
RETURN

