@echo off
TITLE Painkiller Master Server Hotfix (Openspy.net)
COLOR F0
ECHO.


:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges to run script...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:LOOP
SET Choice=
SET /P Choice="Do you want to modify HOSTS file ? (Y/N)"

IF NOT '%Choice%'=='' SET Choice=%Choice:~0,1%

ECHO.
IF /I '%Choice%'=='Y' GOTO ACCEPTED
IF /I '%Choice%'=='N' GOTO REJECTED
ECHO Please type Y (for Yes) or N (for No) to proceed!
ECHO.
GOTO Loop


:REJECTED
ECHO Your HOSTS file was left unchanged>>%systemroot%\Temp\hostFileUpdate.log
ECHO Painkiller Master Server Hotfix was NOT applied.
ECHO Go to PKZone.org or #Painkiller on Quakenet IRC.
ECHO Finished.
GOTO END


:ACCEPTED
setlocal enabledelayedexpansion
::Create your list of host domains
set LIST=(painkiller.master.gamespy.com painkiller.available.gamespy.com painkiller.ms0.gamespy.com painkiller.ms1.gamespy.com painkiller.ms2.gamespy.com painkiller.ms3.gamespy.com painkiller.ms4.gamespy.com painkiller.ms5.gamespy.com painkiller.ms6.gamespy.com painkiller.ms7.gamespy.com painkiller.ms8.gamespy.com painkiller.ms9.gamespy.com painkiller.ms10.gamespy.com painkiller.ms11.gamespy.com painkiller.ms12.gamespy.com painkiller.ms13.gamespy.com painkiller.ms14.gamespy.com painkiller.ms15.gamespy.com)
::Set the ip of the domains you set in the list above
set painkiller.master.gamespy.com=157.245.212.59
set painkiller.available.gamespy.com=157.245.212.59
set painkiller.ms0.gamespy.com=157.245.212.59
set painkiller.ms1.gamespy.com=157.245.212.59
set painkiller.ms2.gamespy.com=157.245.212.59
set painkiller.ms3.gamespy.com=157.245.212.59
set painkiller.ms4.gamespy.com=157.245.212.59
set painkiller.ms5.gamespy.com=157.245.212.59
set painkiller.ms6.gamespy.com=157.245.212.59
set painkiller.ms7.gamespy.com=157.245.212.59
set painkiller.ms8.gamespy.com=157.245.212.59
set painkiller.ms9.gamespy.com=157.245.212.59
set painkiller.ms10.gamespy.com=157.245.212.59
set painkiller.ms11.gamespy.com=157.245.212.59
set painkiller.ms12.gamespy.com=157.245.212.59
set painkiller.ms13.gamespy.com=157.245.212.59
set painkiller.ms14.gamespy.com=157.245.212.59
set painkiller.ms15.gamespy.com=157.245.212.59
:: deletes the parentheses from LIST
set _list=%LIST:~1,-1%
::ECHO %WINDIR%\System32\drivers\etc\hosts > tmp.txt
for  %%G in (%_list%) do (
    set  _name=%%G
    set  _value=!%%G!
    SET NEWLINE=^& echo.
    ECHO Carrying out requested modifications to your HOSTS file
    ::strip out this specific line and store in tmp file
    type %WINDIR%\System32\drivers\etc\hosts | findstr /v !_name! > tmp.txt
    ::re-add the line to it
    ECHO %NEWLINE%^!_value! !_name!>>tmp.txt
    ::overwrite host file
    copy /b/v/y tmp.txt %WINDIR%\System32\drivers\etc\hosts
    del tmp.txt
)
ipconfig /flushdns
ECHO.
ECHO.
ECHO Finished, you may close this window now.
ECHO Your Painkiller Master Server Hotfix (QTracker) was applied.
ECHO You should be able to use the in-game server browser.
ECHO Special thanks to QTracker.com for hosting master server!
ECHO Visit PKZone.org or #Painkiller on Quakenet IRC
GOTO END

:END
ECHO.
ping -n 11 192.0.2.2 > nul
EXIT