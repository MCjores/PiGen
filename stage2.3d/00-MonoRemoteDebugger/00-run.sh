#!/bin/bash -e

on_chroot << EOF
systemctl enable ssh
EOF

wget https://github.com/techl/MonoRemoteDebugger/releases/download/v1.3.0/MonoRemoteDebugger.Server.zip
unzip -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/MonoRemoteDebugger.Server/" MonoRemoteDebugger.Server.zip
chown 1000:1000 "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/MonoRemoteDebugger.Server/" -Rv
cat << EOF >> "${ROOTFS_DIR}/usr/bin/mono-remote-debugger"
#!/bin/sh

exec /usr/bin/mono /home/${FIRST_USER_NAME}/MonoRemoteDebugger.Server/MonoRemoteDebugger.Server.exe "$@"
EOF

chmod +x "${ROOTFS_DIR}/usr/bin/mono-remote-debugger"

echo "mono-remote-debugger &" >> "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/openbox/autostart"