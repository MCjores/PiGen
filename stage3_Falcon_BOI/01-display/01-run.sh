#!/bin/bash -e

install -m 644 files/99-calibration.conf "${ROOTFS_DIR}/usr/share/X11/xorg.conf.d/99-calibration.conf"

cat << EOF >> "${ROOTFS_DIR}/boot/config.txt"
hdmi_group=2
hdmi_mode=1
hdmi_mode=87
hdmi_cvt=1024 600 60 6 0 0 0
dtoverlay=ads7846,cs=1,penirq=25,penirq_pull=2,speed=50000,keep_vref_on=0,swapxy=0,pmax=255,xohms=150,xmin=200,xmax=3900,ymin=200,ymax=3900
hdmi_drive=1
hdmi_force_hotplug=1
EOF
