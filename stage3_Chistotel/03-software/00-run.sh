#!/bin/bash -e

install -v -o 1000 -g 1000 files/* "${ROOTFS_DIR}/usr/lib/install-once/packages/"

echo "celandine &" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
