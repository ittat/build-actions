#!/bin/bash
set -e 

df -h
####
cd ~

rclone copy  itd:ci/${remotepath}/b2g-sysroot.tar.zst ./
tar -C "$HOME/.mozbuild" -I zstd -x -a -f b2g-sysroot.tar.zst

mkdir ~/objdir-gecko

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
export GECKO_OBJDIR=${HOME}/objdir-gecko
export PLATFORM_VERSION=29
export TARGET_CPU_VARIANT=generic
export MOZ_DISABLE_LTO=1
./build-gecko-srcipt.sh
./build-gecko-srcipt.sh package
df -h
ls ${GECKO_OBJDIR}