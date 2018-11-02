#!/bin/bash -e

echo "HOMEDEV  /home           ext4    defaults,noatime  0       3" >> "${ROOTFS_DIR}/etc/fstab"
