#!/bin/bash -e

install -v -o 1000 -g 1000 files/* "${ROOTFS_DIR}/usr/lib/install-once/packages/"

echo "amplituda-lrb02a &" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
