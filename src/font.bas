> PROCEDURE font(rp%,font$,height%,flags%) !nacitanie font
$P<
LOCAL libname$,diskfontbase%,font%
libname$="diskfont.library"+CHR$(0)
diskfontbase%=OpenLibrary(VARPTR(libname$),0)
textattr%=AllocMem(100,65537)
font$=font$+".font"+CHR$(0)
{textattr%}=VARPTR(font$)
CARD{textattr%+4}=height%
BYTE{textattr%+6}=0
BYTE{textattr%+7}=flags%
font%=OpenDiskFont(textattr%)
~SetFont(rp%,font%)
~CloseLibrary(diskfontbase%)
~CloseFont(font%)
~FreeMem(textattr%,100)
RETURN
> PROCEDURE pis(x%,y%,text$,a%) !pise farebne x,y,text,farba
$P<
~SetAPen(wrp%(0),a%)
~Move(wrp%(0),x%,y%)
~Text(wrp%(0),VARPTR(text$),LEN(text$))
RETURN
> PROCEDURE pis2(x%,y%,text$,a%,b%) !pise kombinovane a,b
$P<
~SetDrMd(wrp%(0),0)
pis(x%,y%,text$,a%)
pis(x%+1,y%+1,text$,b%)
~SetDrMd(wrp%(0),1)
RETURN
