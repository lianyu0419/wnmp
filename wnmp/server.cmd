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

REM Windows 下无效
set PHP_FCGI_CHILDREN=5
REM 每个进程处理的最大请求数，或设置为 Windows 环境变量
set PHP_FCGI_MAX_REQUESTS=1000
::pause

echo Starting PHP FastCGI...
:: php 版本5.3
RunHiddenConsole .\php5.3-x86\php-cgi.exe -b 127.0.0.1:9999 -c .\php5.3-x86\php.ini
:: php 版本5.4
::RunHiddenConsole .\php-5.4.19-Win32-VC9-x86\php-cgi.exe -b 127.0.0.1:9999 -c .\php-5.4.19-Win32-VC9-x86\php.ini

echo PHP FastCGI ok


echo Starting nginx...
RunHiddenConsole .\nginx-1.4.2\nginx.exe -p nginx-1.4.2 -c conf/nginx.conf
echo nginx ok

::pause
::echo Starting haproxy...
::E:/wnmp/haproxy/haproxy.exe -f E:/wnmp/haproxy/haproxy.cfg -D
::echo ok

echo.
sleep 3000
::pause
