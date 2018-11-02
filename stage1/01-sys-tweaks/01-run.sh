#!/bin/bash -e

echo "HOMEDEV  /home           btrfs   rw,user,auto,exec,subvol=@home 0       0" >> "${ROOTFS_DIR}/etc/fstab"
