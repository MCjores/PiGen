#!/bin/bash -e

install -v -o 1000 -g 1000 files/* "${ROOTFS_DIR}/usr/lib/install-once/packages/"

echo "while true; do /usr/lib/amplituda-falcon-boi/Amplituda.Falcon.BOI /FullScreen; sleep 1; done" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"