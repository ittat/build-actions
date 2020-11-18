#!/bin/bash
set -e 

        df -h
        ####
        cd ${work}
        mkdir pre-gecko
        cd pre-gecko
        rclone copy itd:ci/${remotepath}/${gecko_version} ./
        
        ####
        #if [ ${kernel} == "true" ]; then
        #        cd ${work}
        #        mkdir pre-kernel
        #        cd pre-kernel
        #        rclone copy itd:ci/${remotepath}/zImage-dtb ./  
        #        #export TARGET_PREBUILT_KERNEL=${work}/pre-kernel/zImage-dtb
        #fi
          
        ####  build
        export CCACHE_DIR=~/.ccache
        /usr/local/bin/ccache  -M 20G
        /usr/local/bin/ccache -s
        export USE_CCACHE=1
        cd ${work}/B2G
        export DISABLE_SOURCES_XML=true
        export USE_PREBUILT_B2G=1
        export OUT_DIR_COMMON_BASE=${out_work}
        export PREFERRED_B2G="${work}/pre-gecko/${gecko_version}"

        
        if [ "$device_name" == "onyx" ]; then
                cd ${work}/B2G/kernel/oneplus
                sudo rm -r onyx
                git clone https://github.com/OnePlus-onyx/kernel_oneplus_onyx -b ci --depth=1
                mv kernel_oneplus_onyx onyx
                
                cd ${work}/B2G
                ./build.sh -j16 dist DIST_DIR=dist_output
                #export TARGET_PREBUILT_KERNEL=${work}/pre-kernel/zImage-dtb
                #./build.sh -j16 bootimage
                ./build.sh -j16 systemimage
                #./build/tools/releasetools/ota_from_target_files dist_output/b2g_onyx-target_files-eng.runner.zip onyx_b2g_ota_update.zip
        else
                ./build.sh -j16 systemimage
                ./build.sh -j16 vndk-test-sepolicy
        fi
