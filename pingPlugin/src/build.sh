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

if [ ! -e ./mac/libpingPlugin.dylib ] ||
   [ "$(uname)" != "Darwin" ]
then

  banner "pingPlugin"

  if [ ! -e ./mac/libpingPlugin.dylib ] ||
  [ "$(uname)" != "Darwin" ]
  then

    make "-j${make_parallel}"

    if [ -e libpingPlugin.dylib ]
    then

        [ -d ./mac ] || mkdir -p ./mac
        mv libpingPlugin.dylib ./mac/libpingPlugin.dylib

    elif [ -e libpingPlugin.so ]
    then
        [ -d ./linux ] || mkdir -p ./linux
        mv libpingPlugin.so ./linux/libpingPlugin.so
    fi
  fi


fi

#--------------------------------------------
banner ">>>>>  BUILD COMPLETE  <<<<<"
#--------------------------------------------

#-------
exit 0    #success
#-------
