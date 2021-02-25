#!/bin/bash
set -e 

        df -h
        ####
        cd ${work}
        mkdir pre-gecko
        cd pre-gecko
        rclone copy itd:ci/${remotepath}/${gecko_version} ./
          
        ####  build
        export CCACHE_DIR=~/.ccache
        /usr/local/bin/ccache  -M 20G
        /usr/local/bin/ccache -s
        export USE_CCACHE=1
        cd ${work}/B2G
        export DISABLE_SOURCES_XML=true
        export USE_PREBUILT_B2G=1
        #export OUT_DIR_COMMON_BASE=${out_work}
        export PREFERRED_B2G="${work}/pre-gecko/${gecko_version}"
        
        export SKIP_ABI_CHECKS=true
        
        gtimeout 245m  ./build.sh -j16 systemimage
