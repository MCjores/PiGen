#!/bin/bash -e

install -d "${ROOTFS_DIR}/usr/lib/install-once/packages"
install -m 755 files/install_once.sh "${ROOTFS_DIR}/usr/lib/install-once/"
install -m 644 files/install-once.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot << EOF
apt-get clean
apt-get install -y --download-only $(cat files/packages)
cp /var/cache/apt/archives/*.deb /usr/lib/install-once/packages/

systemctl enable install-once
EOF
