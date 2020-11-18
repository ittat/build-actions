#!/bin/bash
set -e 
###################################        
# Add something necessarily  
# for example :
############## start ##############
cd ${work}

## I want to build phh's gsi ROM so add relevant local_manifests
git clone https://github.com/phhusson/treble_manifest .repo/local_manifests  -b android-10.0
repo sync -c -j18 --force-sync --no-tags --no-clone-bundle

## fix something before build it 
cd ${work}/device/phh/treble
bash generate.sh
cd ${work}/vendor/foss
bash update.sh
cd ${work}
rm -f vendor/gapps/interfaces/wifi_ext/Android.bp

##fix 10.15 issue
cd ${work}
#/usr/bin/sed -i '' '14d'  system/sepolicy/tests/Android.bp
/usr/bin/sed -i '' '65i\'$'\n\"10\.15\"\,\n' build/soong/cc/config/x86_darwin_host.go


################ end ##############
