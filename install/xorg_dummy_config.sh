#!/bin/bash

echo "[xorg_dummy_config.sh] Copying Xorg configuration to /etc/X11/xorg.conf"
sudo cp ./confs/xorg.conf /etc/X11/xorg.conf
echo "[xorg_dummy_config.sh] Setting permissions on /etc/X11/xorg.conf"
sudo chmod 644 /etc/X11/xorg.conf
