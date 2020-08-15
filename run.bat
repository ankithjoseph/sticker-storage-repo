@echo off
REM SET /P _inputname= Please enter an identifier:

set /P loopcount=Please enter an identifier:
:loop
    IF EXIST C:\Users\Ankith\github\sticker-storage-repo\sticker_packs\%loopcount%\%loopcount%.zip (
     del C:\Users\Ankith\github\sticker-storage-repo\sticker_packs\%loopcount%\%loopcount%.zip
     )


    set FILETOZIP=C:\Users\Ankith\github\sticker-storage-repo\sticker_packs\%loopcount%

    set TEMPDIR=C:\Users\Ankith\github\sticker-storage-repo\sticker_packs\temp
    mkdir %TEMPDIR%
    xcopy /s %FILETOZIP% %TEMPDIR%


    CScript  zip.vbs  %TEMPDIR%  C:\Users\Ankith\github\sticker-storage-repo\sticker_packs\%loopcount%\%loopcount%.zip

    @RD /S /Q %TEMPDIR%
set /a loopcount=loopcount-1
if %loopcount%==0 goto exitloop
goto loop
:exitloop

pause