        cd ~ 
        hdiutil create -type SPARSE -fs 'Case-sensitive Journaled HFS+' -size 50g ~/${outimage}.dmg
        ls -al ${outimage}.dmg.sparseimage*
