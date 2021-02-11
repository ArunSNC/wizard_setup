#!/bin/bash

apt-get install git python3-dev gcc

echo "Enter username : "
read name
useradd -m $name
echo "Enter password for $name : "
passwd $name

sed -i "34s/.*/--autologin wizard_user/" /lib/systemd/system/serial-getty@.service
sed -i "s:wizard_user:$name" /lib/systemd/system/serial-getty@.service

sed -i '11i11 Restart=always' /etc/systemd/system/multi-user.target.wants/wpa_supplicant.service