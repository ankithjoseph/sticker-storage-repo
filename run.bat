@echo off
REM SET /P _inputname= Please enter an identifier: 

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

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

git add .
git commit -am "auto commit done %fullstamp%"
git push
pause