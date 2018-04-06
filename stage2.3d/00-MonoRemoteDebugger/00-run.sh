#!/bin/sh

wget https://github.com/techl/MonoRemoteDebugger/releases/download/v1.3.0/MonoRemoteDebugger.Server.zip
unzip -d "${ROOTFS_DIR}/usr/lib/MonoRemoteDebugger.Server/" MonoRemoteDebugger.Server.zip
chown 1000:1000 "${ROOTFS_DIR}/usr/lib/MonoRemoteDebugger.Server/" -Rv
install -m 755 files/mono-remote-debugger "${ROOTFS_DIR}/usr/bin/"

echo "mono-remote-debugger &" >> "${ROOTFS_DIR}/home/pi/.config/openbox/autostart"