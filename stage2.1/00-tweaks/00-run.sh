#!/bin/bash -e

rm -f "${ROOTFS_DIR}/etc/systemd/system/dhcpcd.service.d/wait.conf"
echo "disable_splash=1" >> "${ROOTFS_DIR}/boot/config.txt"
sed -i -z "s/\n/ splash plymouth.ignore-serial-consoles logo.nologo vt.global_cursor_default=0 vt.cur_default=1\n/" "${ROOTFS_DIR}/boot/cmdline.txt"
