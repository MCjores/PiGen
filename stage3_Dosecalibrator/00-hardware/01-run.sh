#!/bin/bash -e

install -v -o 1000 -g 1000 files/* "${ROOTFS_DIR}/tmp/"

on_chroot << EOF
dpkg -i /tmp/ql800pdrv-2.1.4-0.armhf.deb
lpadmin -p QL-800 -E -v usb://Brother/QL-800
lpoptions -p QL-800 -o PageSize=62x29
service cups stop
EOF
