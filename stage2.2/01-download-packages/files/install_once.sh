#!/bin/sh
if [ -d "/usr/lib/install-once/packages" ]; then
    cd /usr/lib/install-once/packages
    dpkg -i *.deb
    systemctl disable install-once
fi