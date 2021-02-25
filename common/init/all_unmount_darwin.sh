#!/bin/bash
#set -e 
cd ~
        df -h
        while [ -d "${out_work}" ] ;do
              hdiutil detach "${out_work}" -force
        done
        while [ -d "${work}" ] ;do
              hdiutil detach "${work}" -force
        done
        #if [ -d "${out_work}" ]; then
        #hdiutil detach "${out_work}" -force; 
        #fi
        #if [ -d "${work}" ]; then 
        #hdiutil detach "${work}" -force; 
        #fi
        #rm ${sourceimage}.dmg.sparseimage*
        #rm ${outimage}.dmg.sparseimage*
        df -h
