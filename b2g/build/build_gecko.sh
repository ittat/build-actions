#!/bin/bash
set -e 

        df -h
        ##onyx patch
        root=`pwd`
        cd ~/gecko-b2g
        #git am ${root}/b2g/source/0001_onyx_gecko_patch.patch
        #git am ${root}/b2g/source/0002_onyx_gecko_patch2.patch
        
        export SHELL=/bin/bash
        sudo apt update
        export LOCAL_NDK_BASE_URL='ftp://ftp.kaiostech.com/ndk/android-ndk'
        ./mach bootstrap --no-interactive --application-choice 'GeckoView/Firefox for Android'
        df -h
        
        df -h
        ####
        cd ~
        #TODO
        git clone https://github.com/OnePlus-onyx/build-CI -b b2g
        chmod +x ~/build-CI/build-gsi-b2g.sh
        cp ~/build-CI/build-gsi-b2g.sh ~/gecko-b2g
        
        rclone copy  itd:ci/${remotepath}/b2g-sysroot.tar.zst ./
        tar -C "$HOME/.mozbuild" -I zstd -x -a -f b2g-sysroot.tar.zst
        
        mkdir ~/objdir-gsi-gecko
        tar -C "$HOME/objdir-gsi-gecko" -I zstd -x -a -f b2g-sysroot.tar.zst
        ls ~/objdir-gsi-gecko
        
        sudo rm b2g-sysroot.tar.zst
        
        cd ~/gecko-b2g
        export SHELL=/bin/bash
        export GONK_PATH=${HOME}/.mozbuild/b2g-sysroot
        
        if [ "$device_arch" == "aarch64-linux-android" ]; then
          export TARGET_ARCH=arm64
          export TARGET_ARCH_VARIANT=armv8-a
        else
          export TARGET_ARCH=arm
          export TARGET_ARCH_VARIANT=armv7-a-neon
        fi
        
        export GONK_PRODUCT_NAME=${device_name}
        export GECKO_OBJDIR=${HOME}/objdir-gsi-gecko
        export PLATFORM_VERSION=29
        export TARGET_CPU_VARIANT=generic
        export MOZ_DISABLE_LTO=1
        ./build-gsi-b2g.sh
        ./build-gsi-b2g.sh package
        df -h
        ls ${GECKO_OBJDIR}/dist
