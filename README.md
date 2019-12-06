# Unity
PingPlugin
a ping API via Unity native plugin with multi platform support

#Steps for macOS
1. cd pingPlugin/src/
2. ./build.sh
3. csc -define:MAC pingPlugin.cs
4. mono pingPlugin.exe "www.google.com"


#Steps for Windows
1. cd pingPlugin/src/
2. buildWindows.bat
3. csc -define:WIN pingPlugin.cs
4. mono pingPlugin.exe "www.google.com"


