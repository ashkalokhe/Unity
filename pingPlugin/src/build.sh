#!/bin/bash
set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

banner() {
  msg="# $* #"
  edge=$(echo "$msg" | sed 's/./#/g')
  echo " "
  echo "$edge"
  echo "$msg"
  echo "$edge"
  echo " "
}
#--------- pingPlugin
rm -rf ./*.dylib
rm -rf ./*.a
rm -rf ./*.o
rm -rf ./mac/*
rm -rf ./mac/*.dylib
rm -rf ./mac/*.a
rm -rf ./*.exe
rm -rf ./*.dll

if [ ! -e ./mac/libpingPlugin.1.dylib ] ||
   [ "$(uname)" != "Darwin" ]
then

  banner "pingPlugin"

  if [ ! -e ./mac/libpingPlugin.1.dylib ] ||
  [ "$(uname)" != "Darwin" ]
  then

    make "-j${make_parallel}"

    if [ -e libpingPlugin.1.dylib ]
    then

        [ -d ./mac ] || mkdir -p ./mac
        mv libpingPlugin.1.dylib ./mac/libpingPlugin.1.dylib
        mv libpingPlugin.a ./mac/libpingPlugin.a
        mv pingPlugin.o ./mac/pingPlugin.o


    elif [ -e libpingPlugin.so ]
    then
        [ -d ./linux ] || mkdir -p ./linux
        mv libpingPlugin.so ./linux/libpingPlugin.so
    fi
  fi


fi

#--------------------------------------------
banner ">>>>>  BUILD c# part  <<<<<"
#--------------------------------------------
cscmd="csc -define:MAC pingPluginManaged.cs -out:./mac/pingPluginManaged.dll"
eval $cscmd

#--------------------------------------------
banner ">>>>>  BUILD COMPLETE  <<<<<"
#--------------------------------------------

#-------
exit 0    #success
#-------
