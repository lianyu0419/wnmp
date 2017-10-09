@echo off

echo.
echo start
echo.

echo Stopping nginx...
taskkill /F /IM nginx.exe > nul
echo ok

echo Stopping PHP FastCGI...
taskkill /F /IM php-cgi.exe > nul
echo ok

::echo Stopping haproxy...
::TSKILL haproxy
::echo ok

::exit

echo.
echo.
echo.

