#!/bin/bash -e

dd if=/dev/zero of="${ROOTFS_DIR}/usr/share/amplituda/bigfile.tmp"  bs=512M  count=1

