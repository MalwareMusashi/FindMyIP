@echo off
setlocal enabledelayedexpansion

echo ==============================
echo Device Network Info
echo ==============================
echo Hostname : %COMPUTERNAME%
echo ==============================

set count=0
set "cname="
set "cip="
set "cmac="

for /f "usebackq delims=" %%a in (`ipconfig /all`) do (
  set "line=%%a"

  :: New adapter block detected
  echo !line! | findstr /r "^[A-Za-z]" >nul 2>&1
  if !errorlevel!==0 (
    if defined cip if defined cmac (
      set /a count+=1
      set "NAME[!count!]=!cname!"
      set "IP[!count!]=!cip!"
      set "MAC[!count!]=!cmac!"
    )
    set "cname=!line!"
    set "cip="
    set "cmac="
  )

  :: Grab IPv4
  echo !line! | findstr /C:"IPv4 Address" >nul 2>&1
  if !errorlevel!==0 (
    for /f "tokens=2 delims=:" %%b in ("!line!") do set "cip=%%b"
    set "cip=!cip:~1!"
    set "cip=!cip:(Preferred)=!"
    set "cip=!cip: =!"
  )

  :: Grab MAC
  echo !line! | findstr /C:"Physical Address" >nul 2>&1
  if !errorlevel!==0 (
    for /f "tokens=2 delims=:" %%b in ("!line!") do set "cmac=%%b"
    set "cmac=!cmac:~1!"
  )
)

:: Catch last adapter
if defined cip if defined cmac (
  set /a count+=1
  set "NAME[!count!]=!cname!"
  set "IP[!count!]=!cip!"
  set "MAC[!count!]=!cmac!"
)

:: Print results
for /l %%i in (1,1,%count%) do (
  echo !NAME[%%i]!
  echo ------------------------------
  echo IPv4 Address : !IP[%%i]!
  echo MAC Address  : !MAC[%%i]!
  echo ==============================
)

pause
endlocal
