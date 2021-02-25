#!/bin/bash
set -e 
        df -h
        rclone copy ~/${sourceimage}.dmg.sparseimage.zst itd:ci/${remotepath}
        sudo rm -rf ${sourceimage}.dmg.sparseimage.zst
        rclone copy ~/${outimage}.dmg.sparseimage itd:ci/${remotepath}
        sudo rm -rf ${outimage}.dmg.sparseimage
        df -h
