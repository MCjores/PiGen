#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
lcd_rotate=2
hdmi_force_hotplug=1
EOF