#!/bin/bash

DISPLAY=:0 xinput_calibrator -v --output-filename ~/99-calibration.conf
sudo mount -o remount,rw /
sudo cp ~/99-calibration.conf /usr/share/X11/xorg.conf.d/
sleep 5
sudo mount -o remount,ro /
