#!/bin/bash -e

on_chroot << EOF
apt-get clean
apt-get install -y --download-only $(cat files/packages)
mkdir -p /usr/lib/install-once/packages && cp /var/cache/apt/archives/*.deb /usr/lib/install-once/packages/

systemctl enable install-once
EOF
