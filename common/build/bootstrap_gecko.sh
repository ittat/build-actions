#!/bin/bash
set -e 

cd ~/gecko-b2g
export SHELL=/bin/bash
sudo apt update
# export LOCAL_NDK_BASE_URL='ftp://ftp.kaiostech.com/ndk/android-ndk'
# ./mach bootstrap --application-choice 'GeckoView/Firefox for Android'
wget -q https://hg.mozilla.org/mozilla-central/raw-file/default/python/mozboot/bin/bootstrap.py -O bootstrap.py 
python3 bootstrap.py --no-interactive --application-choice=mobile_android



