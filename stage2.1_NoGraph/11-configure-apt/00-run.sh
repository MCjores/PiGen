#!/bin/bash -e

install -m 644 files/amplituda.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"

on_chroot apt-key add - < files/Amplituda.pubkey.gpg
on_chroot << EOF
apt-get update
EOF