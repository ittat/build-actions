
        df -h
        ####
        more /System/Library/CoreServices/SystemVersion.plist
        ls /Applications/Xcode_*
        #sudo xcode-select --switch /Applications/Xcode_11.app/Contents/Developer
        sudo xcode-select --switch /Applications/Xcode_12.app/Contents/Developer
        
        ####install
        brew install expect  gnu-sed ccache coreutils zstd gcc perl cpanm unzip binutils
        
        sudo ln -s /usr/local/bin/gsed  /usr/local/bin/sed
        #sudo ln -s /usr/local/bin/gstat /usr/local/bin/stat
        
        ####git
        git config --global user.name "ci"
        git config --global user.email "ci@github.com"
        
        #####zstd
        brew install zstd  
        
        #####rclone
        mkdir -p ~/.config/rclone
        git clone git@github.com:ittat/tmp.git
        cd tmp
        mv ./rclone.conf ~/.config/rclone
        brew install rclone
        rclone ls itd:test
