
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
        #ssh
        mkdir -p ~/.ssh
        echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
        chmod 600 ~/.ssh/id_rsa
        #rclone
        mkdir -p ~/.config/rclone
        git clone git@github.com:ittat/tmp.git
        cd tmp
        mv ./rclone.conf ~/.config/rclone
        #sudo apt install rclone
        brew install rclone
        #rclone -v
        rclone ls itd:test
        # yarn
        #sudo apt-get install yarnpkg
        yarn
        #sudo ln -snf /usr/bin/yarnpkg /usr/bin/yarn
