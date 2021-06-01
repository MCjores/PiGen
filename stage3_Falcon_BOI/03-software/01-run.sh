#!/bin/bash -e

dpkg -i --force-architecture files/amplituda-falconboi_1.2.0_linux-arm.deb

echo "while true; do ( cd /usr/lib/amplituda-falcon-boi &&  ./Amplituda.Falcon.BOI /FullScreen; sleep 1; ) done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"