#!/bin/bash
set -e 
        df -h
        cd ${work}
        echo Download ...
        #https://source.android.google.cn/setup/start/build-numbers?hl=zh-cn#source-code-tags-and-builds
        repo init -u ${android_source} -b ${android_branch} --depth=1
        repo sync -j128 --force-sync --current-branch --no-tags --no-clone-bundle --optimized-fetch --prune
        df -h
        

