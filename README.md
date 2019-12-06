# Unity
PingPlugin
a ping API via Unity native plugin with multi platform support

Note: Step 3 is only for local testing. 
Platform appropiate pluginManaged.dll needs to be added to UnityHub Project under Assets\Plugins along with native plugin

#Steps for macOS
1. cd pingPlugin/src/
2. ./build.sh
3. mono ./Assets/Plugins/mac/pingPluginManaged.dll "www.google.com"


#Steps for Windows
1. cd pingPlugin/src/
2. buildWindows.bat
3. mono ..\Assets\Plugins\win\pingPluginManaged.dll "www.google.com"
    or,
   ..\Assets\Plugins\win\pingPluginManaged.exe "www.google.com"


#Steps for executing UnityProject-PingMac
1. I have all compiled win/mac dlls added to the respective projects.
2. PingMac is a UnityProject which can directly open in Unity and execute with added mac compiled libpingPlugin.1.dylib, pingPluginManaged.dll
3. PingWin is a UnityProject which can directly open in Unity and execute with added win compiled pingPlugin.dll, pingPluginManaged.dll
