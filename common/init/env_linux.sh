#!/bin/bash
set -e 
        df -h
        #####
        sudo apt install git make mercurial  yasm  libncurses5 libfuse-dev
        wget http://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.bz2
        tar xfj nasm-2.14.02.tar.bz2
        rm nasm-2.14.02.tar.bz2
        cd nasm-2.14.02/
        ./autogen.sh
        ./configure --prefix=/usr/local/ 
        make 
        sudo make install
        nasm -v
        cd ../
        rm -r nasm-2.14.02/
        
        ####
        cd ~
        git config --global user.name "ci"
        git config --global user.email "ci@github.com"

        #rclone
        cd ~
        mkdir -p ~/.config/rclone
        #your drive key
        echo "$RCLONE" > ~/.config/rclone/rclone.conf
        #brew install rclone
        brew install --build-from-source rclone
        echo [TEST] rclone
        rclone ls itd:
        echo [Done] rclone
