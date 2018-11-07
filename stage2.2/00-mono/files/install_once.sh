#!/bin/sh
if [ -d "/usr/lib/install-once/packages" ]; then
    plymouth message --text="Подготовка системы к первому использованию..."
    mount -o remount,rw /
    cd /usr/lib/install-once/packages
    dpkg -i *.deb
    systemctl disable install-once
    reboot
fi