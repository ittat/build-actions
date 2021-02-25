#!/bin/bash
set -e 
        cd  ${work}
        xz -c  B2G/out/target/product/${device_name}/system.img > ~/${systemimage}
        xz -c  B2G/out/target/product/${device_name}/boot.img > ~/boot.img.xz
        cd ~
        rclone copy system.img.xz itd:ci/${remotepath}
        rclone copy boot.img.xz itd:ci/${remotepath}
