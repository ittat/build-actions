#!/bin/bash
set -e 

export SHELL=/bin/bash
sudo apt update
export LOCAL_NDK_BASE_URL='ftp://ftp.kaiostech.com/ndk/android-ndk'
#./mach bootstrap --application-choice 'GeckoView/Firefox for Android'