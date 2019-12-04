@where msbuild 2> nul
@if %errorlevel% neq 0 (
 @echo.
 @echo Please execute this file from inside Visual Studio's Developer Command Prompt
 @echo.
 pause
 goto :eof
)
@echo off
setlocal enabledelayedexpansion

REM --------- pingPlugin

cl /c /EHsc pingPlugin.c
lib *.obj
mkdir .\..\assets\win
copy /y pingPlugin.lib .\..\assets\win\pingPlugin.lib

