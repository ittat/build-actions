#!/bin/bash
set -e 

###build/soong 
./common/source/patch-b2g-aosp.sh

####patcher         
if [ -d "${work}/B2G/patcher" ]; then
  echo apply patch
  cd ${work}/B2G
  ./patcher/patcher.sh
fi

####fix 10.15 issue
cd ${work}/B2G
/usr/bin/sed -i '' '14d'  system/sepolicy/tests/Android.bp
/usr/bin/sed -i '' '65i\'$'\n\"10\.15\"\,\n' build/soong/cc/config/x86_darwin_host.go

###
cd ${work}
# Create a dummy b2g archive
mkdir b2g
tar cvjf b2g-dummy.tar.bz2 b2g
rm -rf b2g

####api-daemon
cd ${work}/B2G/gonk-misc
if [ -d "${work}/B2G/gonk-misc/api-daemon" ];then
  echo api-daemon patch
  sudo rm -r ${work}/B2G/gonk-misc/api-daemon
fi
git clone https://github.com/ittat/api-daemon -b without-api-daemon

####
cd ${work}/B2G
sudo rm -rf .repo
