#!/bin/bash -e

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
hdmi_force_hotplug=1
hdmi_group=2
hdmi_mode=11
EOF
