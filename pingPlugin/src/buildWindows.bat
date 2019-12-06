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
mkdir .\..\assets\win

cl /EHsc pingPlugin.cpp /link /dll /out:.\..\assets\win\pingPlugin.dll
