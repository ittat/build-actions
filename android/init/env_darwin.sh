#!/bin/bash
set -e 
        df -h
        ####
        more /System/Library/CoreServices/SystemVersion.plist
        ls /Applications/Xcode_*
        #sudo xcode-select --switch /Applications/Xcode_11.app/Contents/Developer
        sudo xcode-select --switch /Applications/Xcode_12.app/Contents/Developer
        echo [Set] Xcode_12
        
        ####install
        brew install expect  gnu-sed ccache coreutils zstd gcc perl cpanm unzip binutils repo xmlstarlet
        
        sudo ln -s /usr/local/bin/gsed  /usr/local/bin/sed
        #sudo ln -s /usr/local/bin/gstat /usr/local/bin/stat
        
        ####git
        git config --global user.name "ci"
        git config --global user.email "ci@github.com"
        
        #####zstd
        brew install zstd  
        
        #####rclone
        cd ~
        mkdir -p ~/.config/rclone
        #your drive key
        echo "$RCLONE" > ~/.config/rclone/rclone.conf
        brew install rclone
        echo [TEST] rclone
        rclone ls itd:
        echo [Done] rclone
        
