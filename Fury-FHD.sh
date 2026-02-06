#!/bin/bash

# clear terminal screen
#######################################
clear > /dev/null 2>&1

# Check and install wget
#######################################
package="wget"
if ! opkg list-installed | grep -q "^$package"; then
    if [ -f /etc/apt/apt.conf ]; then
        apt-get update >/dev/null 2>&1
        apt install $package -y >/dev/null 2>&1
    else
        opkg update > /dev/null 2>&1
        opkg install $package >/dev/null 2>&1
    fi
fi

# Check server url connectivity and install Skin Fury-FHD
#######################################
if wget -q --method=HEAD https://github.com/islam-2412/IPKS; then
    wget -q --no-check-certificate https://raw.githubusercontent.com/islam-2412/IPKS/refs/heads/main/fury/installer.sh -O - | /bin/sh
else
    echo "> Check your internet connection and try again ..."
fi
