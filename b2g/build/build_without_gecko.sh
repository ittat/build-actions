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
        gtimeout 245m ./build.sh -j16
        df -h
