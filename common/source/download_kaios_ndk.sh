#!/bin/bash
set -e 

cd ~
curl https://packages.preprod.kaiostech.com/ndk/v4/mozbuild.tar.bz2 | tar -C ${HOME}/ -xj
