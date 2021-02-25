#!/bin/bash
set -e 

cd ~
df -h
        while [ -d "${out_work}" ] ;do
              hdiutil detach "${out_work}" -force
        done
        while [ -d "${work}" ] ;do
              hdiutil detach "${work}" -force
        done
