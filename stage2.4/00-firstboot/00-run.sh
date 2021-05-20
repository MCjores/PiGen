#!/bin/bash -e

install -m 755          files/firstboot "${ROOTFS_DIR}/usr/sbin/"
install -m 644          files/firstboot.service "${ROOTFS_DIR}/etc/systemd/system/"

mkdir -p "${ROOTFS_DIR}/var/lib/amplituda"
touch "${ROOTFS_DIR}/var/lib/amplituda/firstboot"

on_chroot << EOF
service enable firstboot
EOF