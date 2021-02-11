#!/bin/bash


### make sure that this script is executed from root
if [ $(whoami) != 'root' ]
then
    echo "
This script should be executed as root or with sudo:
    sudo $0
"
    exit 1
fi

source network.sh
source util.sh
source services.sh
route
sleep 3
echo "setup done now rebooting system"
sleep 3
reboot