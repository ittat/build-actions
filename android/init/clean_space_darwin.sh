#!/bin/bash
set -e 
        ls -al -h /Applications 
        df -h
        sudo rm -r  /Applications/Xcode_10*
        #sudo rm -r  /Applications/Xcode_12*
        sudo rm -r  /Applications/Xcode_11.*.app
        #Firefox* Julia* Microsoft* R* Visual* 
        ls -al -h /Applications
        df -h
