#!/bin/bash -e

on_chroot << EOF
plymouth-set-default-theme -R spinner
EOF
