#!/bin/bash
set -e 

        cd ~
        ####
        rustup target add aarch64-linux-android armv7-linux-androideabi
        cd ~
        curl https://packages.preprod.kaiostech.com/ndk/v3/mozbuild.tar.bz2 | tar -C ${HOME}/ -xj
        rclone copy  itd:ci/${remotepath}/api-sysroot.tar.zst ./
        mkdir ~/.mozbuild/api-sysroot
        tar -C "$HOME/.mozbuild/api-sysroot" -I zstd -x -a -f api-sysroot.tar.zst
        #sudo rm api-sysroot.tar.zst
        #sudo rm mozbuild.tar.bz2
        ls ~/.mozbuild/api-sysroot
        
        cd ~
        git clone https://github.com/kaiostech/api-daemon --depth=1
        ls -al
        
        ####
        export TARGET_ARCH=${device_arch}
        export BUILD_WITH_NDK_DIR=~/.mozbuild/android-ndk-r20b-canary
        export GONK_DIR=~/.mozbuild/api-sysroot
        export GONK_PRODUCT=${device_name}
        cd ~/api-daemon
        ./update-prebuilts.sh
