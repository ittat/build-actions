#!/bin/bash
set -e 

cd ~
# git clone https://github.com/mozilla/gecko-dev -b master --depth=1
# cd ~/gecko-dev
# ./mach  --no-interactive bootstrap --application-choice 'GeckoView/Firefox for Android'
# cd ~


cd ~/mozbuild
curl https://github.com/b2g-gsi/build-actions/releases/download/ndk-macos/android-ndk-0-darwin-x86_64.tar.bz2 | tar -C ./ -xj

mkdir ~/old
curl https://packages.preprod.kaiostech.com/ndk/v7/mozbuild.tar.bz2 | tar -C ${HOME}/old -xj

https://github.com/b2g-gsi/build-actions/releases/download/ndk-macos/android-ndk-0-darwin-x86_64.tar.bz2
cp -r ~/old/.mozbuild/android-ndk-r21d/toolchains/llvm/prebuilt/linux-x86_64 ~/.mozbuild/android-ndk-r21d/toolchains/llvm/prebuilt

