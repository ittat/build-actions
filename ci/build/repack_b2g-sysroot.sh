
        cd ~
        git clone https://github.com/OnePlus-onyx/build-CI -b b2g-tmp
        chmod +x ~/build-CI/create-b2g-sysroot.sh
        df -h
        cd ${work}/B2G
        cp ~/build-CI/create-b2g-sysroot.sh ./
        pip3 install zstandard
        pip install zstandard
        if [ "$device_arch" == "aarch64-linux-android" ]; then
          export TARGET_ARCH=arm64
          export TARGET_ARCH_VARIANT=armv8-a
        else
          export TARGET_ARCH=arm
          export TARGET_ARCH_VARIANT=armv7-a-neon
        fi

        export GONK_PRODUCT_NAME=${device_name}
        
        if [ "$device_name" == "onyx" ]; then
          export TARGET_CPU_VARIANT=krait
        else
          export TARGET_CPU_VARIANT=generic
        fi
        
        #gecko/taskcluster/scripts/misc/create-b2g-sysroot.sh
        ./create-b2g-sysroot.sh
        ls -al
        sudo rm -rf ./b2g-sysroot
        ls -al
        mv b2g-sysroot.tar.zst ${work}
        df -h
