#!/bin/bash
set -e 

cd ~
curl https://packages.preprod.kaiostech.com/ndk/v7/mozbuild.tar.bz2 | tar -C ${HOME}/ -xj
