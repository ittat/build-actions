#!/bin/bash
set -e 
        cd ~ 
        zstd  --fast=7 ${sourceimage}.dmg.sparseimage
        rm ${sourceimage}.dmg.sparseimage
        ls -al ${sourceimage}.dmg.sparseimage*
