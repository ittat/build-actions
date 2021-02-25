#!/bin/bash
set -e 

        df -h
        ####
        export CCACHE_DIR=~/.ccache
        /usr/local/bin/ccache  -M 20G
        /usr/local/bin/ccache -s
        export USE_CCACHE=1
        cd ${work}/B2G
        export DISABLE_SOURCES_XML=true
        #export OUT_DIR_COMMON_BASE=${out_work}
        export PREFERRED_B2G=${work}/b2g-dummy.tar.bz2
        export USE_PREBUILT_B2G=1
        export SKIP_ABI_CHECKS=true
        gtimeout 245m ./build.sh -j16 systemimage
        #export SKIP_ABI_CHECKS=true
        #gtimeout 245m  ./build-gsi.sh ${build_device_tag} systemimage
        df -h
