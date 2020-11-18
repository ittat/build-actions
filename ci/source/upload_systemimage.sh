#!/bin/bash
set -e 
        cd  ${work}
        xz -c  B2G/out/target/product/${device_name}/system.img > ~/${systemimage}
        cd ~
        rclone copy system.img.xz itd:ci/${remotepath}
