#!/bin/bash
set -e 

cd ~
git clone https://github.com/mozilla/gecko-dev -b master --depth=1
cd ~/gecko-dev
./mach bootstrap --application-choice 'GeckoView/Firefox for Android'
cd ~
curl https://packages.preprod.kaiostech.com/ndk/v7/mozbuild.tar.bz2 | tar -C ${HOME}/ -xj
