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
if not exist ".\win" mkdir ".\win"

cl /EHsc pingPlugin.cpp /link /machine:x64 /dll /out:.\win\pingPlugin.dll

echo --------------------------------------------
echo      ">>>>>  BUILD c# part (WIN)  <<<<<"
echo --------------------------------------------
csc -define:WIN pingPluginManaged.cs -out:.\win\pingPluginManaged.exe

echo --------------------------------------------
echo      ">>>>>  BUILD complete (WIN)  <<<<<"
echo --------------------------------------------
