#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/etc/udev/rules.d"
install -m 644 files/99-hidraw.rules "${ROOTFS_DIR}/etc/udev/rules.d/99-hidraw.rules"
