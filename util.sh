#!/bin/bash

apt-get install git python3-dev gcc -y

echo "Enter username : "
read name
useradd -m $name
echo "Enter password for $name : "
passwd $name

sed -i "34i ExecStart=-/sbin/agetty --autologin $name --keep-baud 115200,38400,9600 %I $TERM:" /lib/systemd/system/serial-getty@.service
# sed -i "s:wizard_user:$name" /lib/systemd/system/serial-getty@.service
# sed -i "s:TERM:$TERM" /lib/systemd/system/serial-getty@.service
sed "35d" /lib/systemd/system/serial-getty@.service

sed -i '11i Restart=always' /etc/systemd/system/multi-user.target.wants/wpa_supplicant.service