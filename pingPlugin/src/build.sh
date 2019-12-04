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
rm -rf ./../assets/mac/*
rm -rf ./../assets/mac/*.dylib
rm -rf ./../assets/mac/*.a

if [ ! -e ./../assets/mac/libpingPlugin.1.dylib ] ||
   [ "$(uname)" != "Darwin" ]
then

  banner "pingPlugin"

  if [ ! -e ./../assets/mac/libpingPlugin.1.dylib ] ||
  [ "$(uname)" != "Darwin" ]
  then

    make "-j${make_parallel}"

    if [ -e libpingPlugin.1.dylib ]
    then

        [ -d ./../assets/mac ] || mkdir -p ./../assets/mac
        cp libpingPlugin.1.dylib ../assets/mac/libpingPlugin.1.dylib

    elif [ -e libpingPlugin.1.so ]
    then
        [ -d ./../assets/linux ] || mkdir -p ./../assets/linux
        cp libpingPlugin.1.so ./../assets/linux/libpingPlugin.1.so
    fi
  fi


fi

#--------------------------------------------
banner ">>>>>  BUILD COMPLETE  <<<<<"
#--------------------------------------------

#-------
exit 0    #success
#-------
