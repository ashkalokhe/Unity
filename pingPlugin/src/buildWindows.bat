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
if not exist ".\..\Assets\Plugins\win" mkdir ".\..\Assets\Plugins\win"

cl /DWIN32 /EHsc pingPlugin.cpp /link /machine:x64 /dll /out:.\..\Assets\Plugins\win\pingPlugin.dll

echo --------------------------------------------
echo      ">>>>>  BUILD c# part (WIN)  <<<<<"
echo --------------------------------------------
csc -define:WIN pingPluginManaged.cs -out:.\..\Assets\Plugins\win\pingPluginManaged.dll
mv pingPlugin.obj .\..\Assets\Plugins\win\pingPlugin.obj
copy .\..\Assets\Plugins\win\pingPluginManaged.dll .\..\Assets\Plugins\win\pingPluginManaged.exe

echo --------------------------------------------
echo      ">>>>>  BUILD complete (WIN)  <<<<<"
echo --------------------------------------------
