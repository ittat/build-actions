#!/bin/bash
set -e 
        cd ${work}
        mkdir pre-api
        cd pre-api
        rclone copy itd:ci/${remotepath}/prebuilts.zip ./
        unzip ./prebuilts.zip
        APIDeamon_PreBuild="${work}/pre-api/home/runner/api-daemon/prebuilts"
        ls ${APIDeamon_PreBuild}
        
        ####
        TARGET_OUT=${out_path}/target/product/${device_name}/system
        path_api=${TARGET_OUT}/api-daemon
        if [ -d "${path_api}" ]; then
           sudo rm -r "${path_api}"
        fi
        
        path_b2g=${TARGET_OUT}/b2g
        if [ -d "${path_b2g}" ]; then
           sudo rm -r "${path_b2g}"
        fi
        
        mkdir -p ${path_api}
        mkdir -p ${path_b2g}/defaults
        
        cp -r  ${APIDeamon_PreBuild}/http_root  ${TARGET_OUT}/api-daemon
        cp ${APIDeamon_PreBuild}/${device_arch}/api-daemon ${TARGET_OUT}/bin
        chmod +x ${TARGET_OUT}/bin/api-daemon
