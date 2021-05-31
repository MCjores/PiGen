#!/bin/bash -e

install -v -o 1000 -g 1000 files/* "${ROOTFS_DIR}/usr/lib/install-once/packages/"

dpkg -i files/amplituda-falconboi_1.2.0_linux-arm.deb

echo "while true; do /usr/lib/amplituda-falcon-boi/Amplituda.Falcon.BOI /FullScreen; sleep 1; done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"