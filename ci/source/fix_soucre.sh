#!/bin/bash
set -e 
        
        ####fix 10.15 issue
        cd ${work}
        #/usr/bin/sed -i '' '14d'  system/sepolicy/tests/Android.bp
        #/usr/bin/sed -i '' '65i\'$'\n\"10\.15\"\,\n' build/soong/cc/config/x86_darwin_host.go
        
        ####
        sudo rm -rf .repo
