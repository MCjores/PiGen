#!/bin/bash -e

install -o 1000 -g 1000 files/conkyrc "${ROOTFS_DIR}/home/pi/.conkyrc"
echo "conky &" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"
