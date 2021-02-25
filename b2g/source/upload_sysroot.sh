#!/bin/bash
set -e 
        cd ${work}
        rclone copy b2g-sysroot.tar.zst itd:ci/${remotepath}
        sudo rm b2g-sysroot.tar.zst
        rclone copy api-sysroot.tar.zst itd:ci/${remotepath}
        sudo rm api-sysroot.tar.zst
