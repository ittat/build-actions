#!/bin/bash
set -e 
        df -h
        echo ————————————————————————————————————
        sudo rm -rf "/usr/local/share/boost"
        sudo rm -rf "$AGENT_TOOLSDIRECTORY"
        sudo apt remove -y 'php.*'
        sudo apt-get remove -y '^ghc-8.*'
        sudo apt-get remove -y '^dotnet-.*'
        sudo apt-get autoremove -y
        sudo apt-get clean
        sudo rm -rf /etc/mysql 
        echo "Removing large directories"
        # deleting 15GB
        rm -rf /usr/share/dotnet/
        df -h
