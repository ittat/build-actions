#!/bin/bash
set -e 
df -h
####
export CCACHE_DIR=~/.ccache
/usr/local/bin/ccache  -M 20G
/usr/local/bin/ccache -s
export USE_CCACHE=1
cd ${work}/B2G
export DISABLE_SOURCES_XML=true
export PREFERRED_B2G=${work}/b2g-dummy.tar.bz2
export USE_PREBUILT_B2G=1
export SKIP_ABI_CHECKS=true
export ANDROID_NDK="${HOME}/.mozbuild/android-ndk-r21d"
#gsi
gtimeout 245m  ./build-gsi.sh ${build_device_tag} systemimage
df -h
