#!/bin/bash
set -e 
        df -h
        cd ~
        rclone copy ./${outimage}.dmg.sparseimage itd:ci/${remotepath}
        sudo rm  -rf ./${outimage}.dmg.sparseimage
        df -h
