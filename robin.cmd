@echo off

IF [%1]==[] call:usage
IF "%1" == "install" call:install
IF "%1" == "reinstall" call:reinstall
IF "%1" == "sync" call:sync

:clean
goto:eof

:reinstall

FOR /D %%i IN (%~dp0\packages\*) DO rd /s /q "%%i"

goto:install

:install    
echo "%~dp0\tools\NuGet\nuget.exe"
call  "%~dp0\tools\NuGet\nuget.exe" install -excludeversion -outputdirectory packages
goto:eof

:sync
"%~dp0packages\MSBuild\tools\Windows\MSBuild.exe" /target:Sync
goto:eof
:usage
echo cmd:  robin [install,clean]
goto:eof
:eof
