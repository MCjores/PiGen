#!/bin/bash -e

install -d "${ROOTFS_DIR}/mnt/backup"
install -m 644 files/btrbk.conf "${ROOTFS_DIR}/etc/btrbk/"

echo "HOMEDEV  /mnt/btrfs               btrfs   rw,user,auto          0       0" >> "${ROOTFS_DIR}/etc/fstab"
echo "LABEL=AMPL_BACKUP  /mnt/backup    btrfs   rw,user,auto,nofail   0       0" >> "${ROOTFS_DIR}/etc/fstab"

on_chroot << EOF
systemctl enable btrbk.timer
EOF
