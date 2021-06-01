#!/bin/bash -e

dpkg -i --force-architecture files/amplituda-falconboi_1.2.1_linux-arm.deb

echo "while true; do ( cd /usr/lib/amplituda-falconboi/linux-arm &&  ./Amplituda.Falcon.BOI /FullScreen; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"