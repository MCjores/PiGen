#!/bin/bash -e

install -m 755          files/touchscreen "${ROOTFS_DIR}/home/pi/"

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
hdmi_force_hotplug=1
hdmi_group=2
hdmi_mode=11
EOF
