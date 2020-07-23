#!/bin/bash -e

install -m 755 files/resize_home_once "${ROOTFS_DIR}/etc/init.d/"
install -m 755 files/home_resize.sh   "${ROOTFS_DIR}/usr/lib/"

on_chroot << EOF
systemctl disable resize2fs_once
systemctl enable resize_home_once
EOF

echo "HOMEDEV  /home           btrfs   rw,user,auto,exec,subvol=@home 0       0" >> "${ROOTFS_DIR}/etc/fstab"
sed -i 's;/usr/lib/raspi-config/init_resize.sh;/usr/lib/home_resize.sh;' "${ROOTFS_DIR}/boot/cmdline.txt"