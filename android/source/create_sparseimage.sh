#!/bin/bash
set -e 

cd ~ 
hdiutil create -type SPARSE -fs 'Case-sensitive Journaled HFS+' -size 80g ~/${sourceimage}.dmg
hdiutil create -type SPARSE -fs 'Case-sensitive Journaled HFS+' -size 80g ~/${outimage}.dmg
ls -al *.dmg.sparseimage*

hdiutil attach ~/${sourceimage}.dmg.sparseimage -mountpoint ${work}

df -h 
echo create sparseimage Done!
