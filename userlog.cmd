@echo off
rem You can pass as a parameter the action to track (usually LOGON, LOGOFF, POWERON, SHUTDOWN): if nothing is passed LOGON is recorded.
set MYLOGFILENAME=\\ns07\logs\%COMPUTERNAME%_userlog.csv
if not exist %MYLOGFILENAME% echo Computer Name;Action;Year;Month;Day;Hour;Minutes;Seconds;User Name>%MYLOGFILENAME%
set MYLOG=%COMPUTERNAME%
if "%1"=="" goto DefaultLogon
set MYLOG=%MYLOG%;%1
goto Continue
:DefaultLogon
set MYLOG=%MYLOG%;LOGON
:Continue
rem -- process date from http://stackoverflow.com/questions/1192476/format-date-and-time-in-a-windows-batch-script
set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
set year=%date:~-4%
set month=%date:~3,2%
if "%month:~0,1%" == " " set month=0%month:~1,1%
set day=%date:~0,2%
if "%day:~0,1%" == " " set day=0%day:~1,1%
set MYLOG=%MYLOG%;%year%;%month%;%day%;%hour%;%min%;%secs%;%USERNAME%
echo %MYLOG%>>%MYLOGFILENAME%