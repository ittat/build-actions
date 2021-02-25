#!/bin/bash
set -e 
        df -h
        cd ~
        rclone copy itd:ci/${remotepath}/${sourceimage}.dmg.sparseimage.zst ./
        zstd --decompress  ${sourceimage}.dmg.sparseimage.zst
        sudo rm -r ./${sourceimage}.dmg.sparseimage.zst
        rclone copy itd:ci/${remotepath}/${outimage}.dmg.sparseimage ./
        
        #####mount
        hdiutil attach /Users/runner/${sourceimage}.dmg.sparseimage -mountpoint ${work}
        
        source_path=${work}
        if [ -d "${work}/B2G" ];then
          source_path=${work}/B2G
        fi
        
        if [ -d "${source_path}/out" ];then
          sudo rm -r ${source_path}/out
        fi
        hdiutil attach /Users/runner/${outimage}.dmg.sparseimage -mountpoint  ${out_work}
        ##TODO
      #  mv ${out_work}/B2G/* ${out_work}
        sudo ln -s  ${out_work} ${source_path}/out 
        ls -al ${out_work}
        df -h
