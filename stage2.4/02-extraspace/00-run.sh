#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/usr/share/amplituda"
dd if=/dev/zero of="${ROOTFS_DIR}/usr/share/amplituda/bigfile.tmp"  bs=512M  count=1

