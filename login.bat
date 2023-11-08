@echo off
rem =======================ip地址=======================
ver|find "5.">nul || goto win7
:WINXP
for /f "tokens=2 delims=:" %%i in ('ipconfig^|findstr "IP Address"') do set mip=%%i
goto next
:win7
for /f "tokens=2 delims=:" %%i in ('ipconfig^|findstr "IPv4"') do set mip=%%i
goto next
:next

set mip=%mip:~1%
echo %mip%

set url="http://10.9.1.3:801/eportal/?c=Portal&a=login&callback=dr1003&login_method=1&user_account=%%2C0%%2CstudentId&user_password=studentPassword&wlan_user_ip=%mip%&wlan_user_mac=000000000000"
set url=%url:studentId=_____%
set url=%url:studentPassword=_____%

rem echo %url%
curl %url%

rem pause