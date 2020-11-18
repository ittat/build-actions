        df -h
        cd ~
        curl https://packages.preprod.kaiostech.com/ndk/v3/mozbuild.tar.bz2 -o mozbuild.tar.bz2
        tar -xvf mozbuild.tar.bz2
        sudo rm mozbuild.tar.bz2
        cd ~
        git clone https://github.com/kaiostech/gecko-b2g -b gonk 
        cd gecko-b2g
        git checkout -b 8adcdfd21c3dea054c31b2552c0c00e3517ebd7c 
        #git clone https://github.com/ittat/gecko-b2g-1 -b ittat-patch-2 --depth=1
        #mv gecko-b2g-1 gecko-b2g
        df -h
