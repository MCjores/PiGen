#!/bin/sh
if [ -d "/usr/lib/install-once/packages" ]; then
    plymouth message --text="Установка программ..."
    cd /usr/lib/install-once/packages
    dpkg -i *.deb
    systemctl disable install-once
fi