@echo off
setlocal enabledelayedexpansion

:: Display header
echo -------------------------
echo Device Network Info
echo -------------------------

:: Get hostname
echo Hostname     : %COMPUTERNAME%

:: Get first IPv4 address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /C:"IPv4 Address"') do (
  set "IP=%%a"
  goto :foundip
)
:foundip
set "IP=!IP:~1!"

:: Get first MAC address
for /f "tokens=2 delims=:" %%a in ('getmac /v /fo list ^| findstr /C:"Physical Address"') do (
  set "MAC=%%a"
  goto :foundmac
)
:foundmac
set "MAC=!MAC:~1!"

:: Show results
if defined IP (echo IPv4 Address : %IP%) else (echo IPv4 Address : Not Found)
if defined MAC (echo MAC Address  : %MAC%) else (echo MAC Address  : Not Found)

echo -------------------------
pause
endlocal
