#!/bin/bash
set -e 

        df -h
        ####
        export CCACHE_DIR=~/.ccache
        /usr/local/bin/ccache  -M 20G
        /usr/local/bin/ccache -s
        export USE_CCACHE=1
        cd ${work}
        export OUT_DIR_COMMON_BASE=${out_work}
        source build/envsetup.sh
        lunch aosp_x86_64-eng 
        #gtimeout 245m make update-api -j8
        gtimeout 245m make -j8
        df -h
